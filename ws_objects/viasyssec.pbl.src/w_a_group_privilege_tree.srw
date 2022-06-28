$PBExportHeader$w_a_group_privilege_tree.srw
forward
global type w_a_group_privilege_tree from w_master
end type
type lb_files from listbox within w_a_group_privilege_tree
end type
type lb_descartados from listbox within w_a_group_privilege_tree
end type
type dw_descriptions from datawindow within w_a_group_privilege_tree
end type
type dw_listbox from datawindow within w_a_group_privilege_tree
end type
type dw_data from datawindow within w_a_group_privilege_tree
end type
type st_1 from statictext within w_a_group_privilege_tree
end type
type lb_groups from dropdownlistbox within w_a_group_privilege_tree
end type
type st_2 from statictext within w_a_group_privilege_tree
end type
end forward

global type w_a_group_privilege_tree from w_master
integer width = 2990
integer height = 2284
string title = "Group Privileges - Tree"
boolean maxbox = false
boolean resizable = false
long backcolor = 80269524
lb_files lb_files
lb_descartados lb_descartados
dw_descriptions dw_descriptions
dw_listbox dw_listbox
dw_data dw_data
st_1 st_1
lb_groups lb_groups
st_2 st_2
end type
global w_a_group_privilege_tree w_a_group_privilege_tree

on w_a_group_privilege_tree.create
int iCurrent
call super::create
this.lb_files=create lb_files
this.lb_descartados=create lb_descartados
this.dw_descriptions=create dw_descriptions
this.dw_listbox=create dw_listbox
this.dw_data=create dw_data
this.st_1=create st_1
this.lb_groups=create lb_groups
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_files
this.Control[iCurrent+2]=this.lb_descartados
this.Control[iCurrent+3]=this.dw_descriptions
this.Control[iCurrent+4]=this.dw_listbox
this.Control[iCurrent+5]=this.dw_data
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.lb_groups
this.Control[iCurrent+8]=this.st_2
end on

on w_a_group_privilege_tree.destroy
call super::destroy
destroy(this.lb_files)
destroy(this.lb_descartados)
destroy(this.dw_descriptions)
destroy(this.dw_listbox)
destroy(this.dw_data)
destroy(this.st_1)
destroy(this.lb_groups)
destroy(this.st_2)
end on

event open;call super::open;this.x=100
this.y=100

integer i
string ls_idgroup
// Loading ListBox
dw_listbox.DataObject = 'dddw_a_group'
dw_listbox.SetTransObject(SQLCA)
dw_listbox.retrieve()
lb_groups.reset()
for i = 1 to dw_listbox.rowcount()
	lb_groups.additem(fn_completar_cadena(dw_listbox.Object.data[i,2],"D"," ",100)+"*"+dw_listbox.Object.data[i,1])
next
lb_groups.selectitem(1)

ls_idgroup = trim(fn_token(lb_groups.text,"*",2))

dw_data.retrieve(ls_idgroup)
end event

type lb_files from listbox within w_a_group_privilege_tree
boolean visible = false
integer x = 2437
integer y = 1580
integer width = 503
integer height = 364
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type lb_descartados from listbox within w_a_group_privilege_tree
boolean visible = false
integer x = 1998
integer y = 152
integer width = 914
integer height = 292
integer taborder = 40
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 276856960
long backcolor = 12632256
boolean vscrollbar = true
boolean sorted = false
end type

type dw_descriptions from datawindow within w_a_group_privilege_tree
boolean visible = false
integer x = 2702
integer y = 1664
integer width = 494
integer height = 360
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string dataobject = "dddw_a_ads_circulationdescriptions"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_listbox from datawindow within w_a_group_privilege_tree
boolean visible = false
integer x = 2990
integer y = 180
integer width = 864
integer height = 360
integer taborder = 10
boolean bringtotop = true
boolean enabled = false
string dataobject = "dddw_a_group"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
THIS.RETRIEVE()
end event

type dw_data from datawindow within w_a_group_privilege_tree
integer x = 23
integer y = 140
integer width = 2917
integer height = 2020
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_a_group_privilege_tree"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;if dw_data.GetClickedRow () = 0 then
	dw_data.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, false)
end if



if row > 0 then

	string ls_menutitle, ls_idgroup
	long ll_count
	string ls_idmenutitle
	string ls_papa
	integer i, li_pos, li_mylevel
	string ls_subid
	
	setpointer(HourGlass!)
	
	ls_menutitle = dw_data.getitemstring(row,"sec_menutitles_menutitle")
	ls_idgroup = trim(fn_token(lb_groups.text,"*",2))
	
	//messagebox(ls_menutitle,ls_idgroup)
	
	ll_count = 0
	
	select count(*)
	into :ll_count
	from dba.sec_group_privileges
	where dba.sec_group_privileges.idgroup = :ls_idgroup
	and upper(dba.sec_group_privileges.menutitle) = upper(:ls_menutitle);
	
	if ll_count > 0 then
	
		// Borra el permiso	
		DELETE FROM dba.sec_group_privileges
		WHERE idgroup = :ls_idgroup
		AND menutitle = :ls_menutitle;
		
		if SQLCA.SQLCode <> 0 then		
			messagebox("Error","Error saving information, please contact support. ~n[group_privileges-" + string(SQLCA.SQLCode)+"-"+SQLCA.SQLErrText+"]", StopSign!)
			return
		end if		
	
	else
	
		// Si no es un separador inserta el permiso group-privilege
		if ls_menutitle <> '-' then		
			INSERT INTO dba.sec_group_privileges  
					( idgroup,   
					  menutitle )  
			VALUES ( :ls_idgroup,   
					  :ls_menutitle );
					  
//			if SQLCA.SQLCode <> 0 then		
//				messagebox("Error","Error saving information, please contact support. ~n[group_privileges-" + string(SQLCA.SQLCode)+"-"+SQLCA.SQLErrText+"]", StopSign!)
//				return
//			end if			  
	
			// ------------------------------------------------------------
			// ------------------------------------------------------------
			// Inserta los permisos de los padres de la opcion
			
			// Select the id of the selected menu title
			select dba.sec_menutitles.idmenutitle
			into :ls_idmenutitle
			from dba.sec_menutitles
			where dba.sec_menutitles.menutitle = :ls_menutitle;
			
			li_mylevel = dw_data.getitemnumber(row,"sec_menutitles_levelmenutitle")
		
			li_pos = 0
			for i = 1 to (li_mylevel - 1)
		
				// Los ids son de la forma    '  1.  3.  4. 10.'		
				li_pos = pos(ls_idmenutitle,'.',li_pos+1)
				ls_subid = mid(ls_idmenutitle, 1 ,li_pos)
		
				setnull(ls_papa)
				
				// obtiene el nombre del padre ( solo si el padre no ha sido autorizado )
				select dba.sec_menutitles.menutitle
				into :ls_papa
				from dba.sec_menutitles, sec_group_privileges
				where dba.sec_menutitles.menutitle = dba.sec_group_privileges.menutitle
				and dba.sec_group_privileges.idgroup = :ls_idgroup
				and dba.sec_menutitles.idmenutitle = :ls_subid
				and dba.sec_menutitles.levelmenutitle < :li_mylevel;
				
				if isnull(ls_papa) then
					
					select dba.sec_menutitles.menutitle
					into :ls_papa
					from dba.sec_menutitles
					where dba.sec_menutitles.idmenutitle = :ls_subid;			
					
					// Inserta el permiso para el padre
					INSERT INTO dba.sec_group_privileges  
							( idgroup,   
							  menutitle )  
					VALUES ( :ls_idgroup,   
							  :ls_papa );
//					if SQLCA.SQLCode <> 0 then		
//						messagebox("Error","Error saving information, please contact support. ~n[group_privileges-" + string(SQLCA.SQLCode)+"-"+SQLCA.SQLErrText+"]", StopSign!)
//						return
//					end if				
				end if
						
			next
			
			// ------------------------------------------------------------
			// ------------------------------------------------------------
	
			end if
		
	end if
	
	commit;
		
	//dw_data.retrieve(ls_idgroup)
	//scrolltorow(row)
	
	// ---------------------------------------------
	// Fake Refresh - Cambia la columna A_GRANTED 
	// para no hacer scroll
	for i = 1 to dw_data.rowcount()
		
		ll_count = 0
		ls_menutitle = dw_data.getitemstring(i,"sec_menutitles_menutitle")
		
		select count(*)
		into :ll_count
		from dba.sec_group_privileges
		where dba.sec_group_privileges.idgroup = :ls_idgroup
		and upper(dba.sec_group_privileges.menutitle) = upper(:ls_menutitle);
		
		if SQLCA.SQLCode <> 0 then	
			messagebox('',SQLCA.SQLErrText)
		end if
		
		if ll_count > 0 then	
			dw_data.setitem(i,"a_granted",'Y')
		else
			dw_data.setitem(i,"a_granted",'N')	
		end if	
		
	next
	// ---------------------------------------------
	
	setpointer(Arrow!)

end if
end event

event buttonclicked;//string ls_menutitle, ls_idgroup
//long ll_count
//
//commit;
//
//setpointer(HourGlass!)
//
//ls_menutitle = dw_data.getitemstring(dw_data.getrow(),"menutitles_menutitle")
//ls_idgroup = trim(fn_token(lb_groups.text,"*",2))
//
////messagebox(ls_menutitle,ls_idgroup)
//
//ll_count = 0
//
//select count(*)
//into :ll_count
//from group_privileges
//where idgroup = :ls_idgroup
//and upper(menutitle) = upper(:ls_menutitle);
//
//if ll_count > 0 then
//
//	//messagebox("deleting","here")	
//	DELETE FROM group_privileges
//	WHERE idgroup = :ls_idgroup
//   AND menutitle = :ls_menutitle;
//	if SQLCA.SQLCode <> 0 then		
//		messagebox("Error","Error saving information, please contact support. ~n[group_privileges-" + string(SQLCA.SQLCode)+"-"+SQLCA.SQLErrText+"]", StopSign!)
//		return
//	end if		
//
//
//else
//
//	//messagebox("inserting","here")
//	INSERT INTO group_privileges  
//			( idgroup,   
//			  menutitle )  
//	VALUES ( :ls_idgroup,   
//			  :ls_menutitle );
//	if SQLCA.SQLCode <> 0 then		
//		messagebox("Error","Error saving information, please contact support. ~n[group_privileges-" + string(SQLCA.SQLCode)+"-"+SQLCA.SQLErrText+"]", StopSign!)
//		return
//	end if			  
//		
//end if
//
//commit;
//
//dw_data.retrieve(ls_idgroup)
//
//setpointer(Arrow!)
end event

event rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, false)
SetRow(currentrow)
end event

type st_1 from statictext within w_a_group_privilege_tree
integer x = 366
integer y = 28
integer width = 293
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "User Group:"
boolean focusrectangle = false
end type

type lb_groups from dropdownlistbox within w_a_group_privilege_tree
integer x = 690
integer y = 32
integer width = 1335
integer height = 620
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_idgroup

ls_idgroup = trim(fn_token(lb_groups.text,"*",2))

dw_data.retrieve(ls_idgroup)
end event

type st_2 from statictext within w_a_group_privilege_tree
integer x = 2066
integer y = 44
integer width = 242
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
boolean enabled = false
string text = "Enabled"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

