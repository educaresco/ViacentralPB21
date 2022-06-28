$PBExportHeader$w_ingreso_branch.srw
forward
global type w_ingreso_branch from w_sheet
end type
type cb_duplicate from commandbutton within w_ingreso_branch
end type
type cb_schedule from commandbutton within w_ingreso_branch
end type
type cb_update_pop_limit from commandbutton within w_ingreso_branch
end type
type cb_delete_pop_limit from commandbutton within w_ingreso_branch
end type
type cb_insert_pop_limit from commandbutton within w_ingreso_branch
end type
type dw_4 from datawindow within w_ingreso_branch
end type
type sle_id_branch_relation from singlelineedit within w_ingreso_branch
end type
type cbx_related_to_branch from checkbox within w_ingreso_branch
end type
type ddlb_old_branch from my_ddlb within w_ingreso_branch
end type
type cbx_owner_change from checkbox within w_ingreso_branch
end type
type shl_address from statichyperlink within w_ingreso_branch
end type
type lnk_map from statichyperlink within w_ingreso_branch
end type
type em_1 from editmask within w_ingreso_branch
end type
type st_1 from statictext within w_ingreso_branch
end type
type cb_2 from commandbutton within w_ingreso_branch
end type
type cb_delete from commandbutton within w_ingreso_branch
end type
type cb_save from commandbutton within w_ingreso_branch
end type
type cb_insert_modo_pago from commandbutton within w_ingreso_branch
end type
type cb_delete_modo_pago from commandbutton within w_ingreso_branch
end type
type cb_update_modo_pago from commandbutton within w_ingreso_branch
end type
type dw_2 from datawindow within w_ingreso_branch
end type
type gb_1 from groupbox within w_ingreso_branch
end type
type gb_2 from groupbox within w_ingreso_branch
end type
type cb_3 from commandbutton within w_ingreso_branch
end type
type cb_insert_branch from commandbutton within w_ingreso_branch
end type
type cb_delete_branch from commandbutton within w_ingreso_branch
end type
type cb_update_branch from commandbutton within w_ingreso_branch
end type
type dw_1 from datawindow within w_ingreso_branch
end type
type lst_related_branch from my_ddlb within w_ingreso_branch
end type
type sle_idbranch_new_owner from singlelineedit within w_ingreso_branch
end type
type gb_4 from groupbox within w_ingreso_branch
end type
type dw_3 from datawindow within w_ingreso_branch
end type
type gb_3 from groupbox within w_ingreso_branch
end type
type tab_dup from tab within w_ingreso_branch
end type
type tp from userobject within tab_dup
end type
type cb_dup from commandbutton within tp
end type
type cb_dupcan from commandbutton within tp
end type
type sle_dup_namebranch from singlelineedit within tp
end type
type sle_dup_idbranch from singlelineedit within tp
end type
type st_3 from statictext within tp
end type
type st_2 from statictext within tp
end type
type tp from userobject within tab_dup
cb_dup cb_dup
cb_dupcan cb_dupcan
sle_dup_namebranch sle_dup_namebranch
sle_dup_idbranch sle_dup_idbranch
st_3 st_3
st_2 st_2
end type
type tab_dup from tab within w_ingreso_branch
tp tp
end type
end forward

global type w_ingreso_branch from w_sheet
boolean visible = false
integer x = 214
integer y = 221
integer width = 3552
integer height = 2212
string title = "Search / New Branch"
boolean resizable = false
long backcolor = 80269524
cb_duplicate cb_duplicate
cb_schedule cb_schedule
cb_update_pop_limit cb_update_pop_limit
cb_delete_pop_limit cb_delete_pop_limit
cb_insert_pop_limit cb_insert_pop_limit
dw_4 dw_4
sle_id_branch_relation sle_id_branch_relation
cbx_related_to_branch cbx_related_to_branch
ddlb_old_branch ddlb_old_branch
cbx_owner_change cbx_owner_change
shl_address shl_address
lnk_map lnk_map
em_1 em_1
st_1 st_1
cb_2 cb_2
cb_delete cb_delete
cb_save cb_save
cb_insert_modo_pago cb_insert_modo_pago
cb_delete_modo_pago cb_delete_modo_pago
cb_update_modo_pago cb_update_modo_pago
dw_2 dw_2
gb_1 gb_1
gb_2 gb_2
cb_3 cb_3
cb_insert_branch cb_insert_branch
cb_delete_branch cb_delete_branch
cb_update_branch cb_update_branch
dw_1 dw_1
lst_related_branch lst_related_branch
sle_idbranch_new_owner sle_idbranch_new_owner
gb_4 gb_4
dw_3 dw_3
gb_3 gb_3
tab_dup tab_dup
end type
global w_ingreso_branch w_ingreso_branch

type variables
boolean lb_status_branch_new_owner, lb_status_branch_relation

STRING is_brach_selected

// string validation class
n_my_string obj_string_tools
end variables

forward prototypes
public subroutine fn_updateaddresslink ()
end prototypes

public subroutine fn_updateaddresslink ();	
	
	string ls_state, ls_address,ls_country, ls_city, ls_name_city, ls_latitud, ls_longitud, ls_precision, ls_name, ls_powered, ls_zip
	int li_geo

	dw_1.accepttext()
	
	ls_city = dw_1.getitemstring(dw_1.getrow(),"id_city")
	ls_state = dw_1.getitemstring(dw_1.getrow(),"id_state")
	ls_zip = string(dw_1.getitemnumber(dw_1.getrow(),"zip_branch"))
	ls_country = dw_1.getitemstring(dw_1.getrow(),"id_country")
	ls_address = dw_1.getitemstring(dw_1.getrow(),"address_branch")
		
	
	SELECT latitud, longitud, geo_precision, name_branch, ISNULL(GEO_GOOGLE,0)
	  INTO :ls_latitud, :ls_longitud, :ls_precision, :ls_name, :li_geo
	  FROM dba.branch
	 WHERE id_branch = rtrim(:is_brach_selected);
	 
	 
	SELECT rtrim(name_city)
	  INTO :ls_name_city
	  FROM dba.city 
	  where id_city = :ls_city;
	  

//<A HREF="<a href="http://www.mapquest.com/maps/map.adp?address=1730+Blake+St&city=Denver&state=CO&zipcode=80202&country=US&cid=lfmaplink"">http://www.mapquest.com/maps/map.adp?address=1730+Blake+St&city=Denver&state=CO&zipcode=80202&country=US&cid=lfmaplink"</a>>Map This Location</A>

					
					
//	if not isnull(ls_latitud) and not isnull(ls_longitud) and li_geo = 1 then
//	
//		lnk_map.visible = true
//
//		if trim(ls_country) = 'USA' then
//									
//			lnk_map.url = 'http://www.viamericas.com/map.asp?lat='+trim(ls_latitud)+'&lon='+trim(ls_longitud)+'&msg='+fn_replace(trim(ls_name),'(','<BR>(')+'&msg2='+ls_precision
//			ls_powered = 'By Google'					
//			
//		else
//			lnk_map.url = "http://www.mapquest.com/maps/map.adp?latlongtype=decimal&latitude="+trim(ls_latitud)+"&longitude="+trim(ls_longitud)+"&zoom=3&size=big"
//			ls_powered = 'By Mapquest'
//		end if
//
//		lnk_map.text = 'Open Map ' +ls_powered
//	end if	
	
	//-------------------------------------------
	// Reemplace el de location por el de address
	lnk_map.visible = false	
	shl_address.visible = false

	if trim(ls_country) = 'USA' then
	
		shl_address.url = "http://www.mapquest.com/maps/map.adp?address="+fn_replace(ls_address," ","+")+"&city="+fn_replace(ls_name_city," ","+")+"&state="+trim(ls_state)+"&zipcode="+ls_zip+"&country=US&cid=lfmaplink"			
		shl_address.visible = true
	
	end if
end subroutine

on w_ingreso_branch.create
int iCurrent
call super::create
this.cb_duplicate=create cb_duplicate
this.cb_schedule=create cb_schedule
this.cb_update_pop_limit=create cb_update_pop_limit
this.cb_delete_pop_limit=create cb_delete_pop_limit
this.cb_insert_pop_limit=create cb_insert_pop_limit
this.dw_4=create dw_4
this.sle_id_branch_relation=create sle_id_branch_relation
this.cbx_related_to_branch=create cbx_related_to_branch
this.ddlb_old_branch=create ddlb_old_branch
this.cbx_owner_change=create cbx_owner_change
this.shl_address=create shl_address
this.lnk_map=create lnk_map
this.em_1=create em_1
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_delete=create cb_delete
this.cb_save=create cb_save
this.cb_insert_modo_pago=create cb_insert_modo_pago
this.cb_delete_modo_pago=create cb_delete_modo_pago
this.cb_update_modo_pago=create cb_update_modo_pago
this.dw_2=create dw_2
this.gb_1=create gb_1
this.gb_2=create gb_2
this.cb_3=create cb_3
this.cb_insert_branch=create cb_insert_branch
this.cb_delete_branch=create cb_delete_branch
this.cb_update_branch=create cb_update_branch
this.dw_1=create dw_1
this.lst_related_branch=create lst_related_branch
this.sle_idbranch_new_owner=create sle_idbranch_new_owner
this.gb_4=create gb_4
this.dw_3=create dw_3
this.gb_3=create gb_3
this.tab_dup=create tab_dup
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_duplicate
this.Control[iCurrent+2]=this.cb_schedule
this.Control[iCurrent+3]=this.cb_update_pop_limit
this.Control[iCurrent+4]=this.cb_delete_pop_limit
this.Control[iCurrent+5]=this.cb_insert_pop_limit
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.sle_id_branch_relation
this.Control[iCurrent+8]=this.cbx_related_to_branch
this.Control[iCurrent+9]=this.ddlb_old_branch
this.Control[iCurrent+10]=this.cbx_owner_change
this.Control[iCurrent+11]=this.shl_address
this.Control[iCurrent+12]=this.lnk_map
this.Control[iCurrent+13]=this.em_1
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_delete
this.Control[iCurrent+17]=this.cb_save
this.Control[iCurrent+18]=this.cb_insert_modo_pago
this.Control[iCurrent+19]=this.cb_delete_modo_pago
this.Control[iCurrent+20]=this.cb_update_modo_pago
this.Control[iCurrent+21]=this.dw_2
this.Control[iCurrent+22]=this.gb_1
this.Control[iCurrent+23]=this.gb_2
this.Control[iCurrent+24]=this.cb_3
this.Control[iCurrent+25]=this.cb_insert_branch
this.Control[iCurrent+26]=this.cb_delete_branch
this.Control[iCurrent+27]=this.cb_update_branch
this.Control[iCurrent+28]=this.dw_1
this.Control[iCurrent+29]=this.lst_related_branch
this.Control[iCurrent+30]=this.sle_idbranch_new_owner
this.Control[iCurrent+31]=this.gb_4
this.Control[iCurrent+32]=this.dw_3
this.Control[iCurrent+33]=this.gb_3
this.Control[iCurrent+34]=this.tab_dup
end on

on w_ingreso_branch.destroy
call super::destroy
destroy(this.cb_duplicate)
destroy(this.cb_schedule)
destroy(this.cb_update_pop_limit)
destroy(this.cb_delete_pop_limit)
destroy(this.cb_insert_pop_limit)
destroy(this.dw_4)
destroy(this.sle_id_branch_relation)
destroy(this.cbx_related_to_branch)
destroy(this.ddlb_old_branch)
destroy(this.cbx_owner_change)
destroy(this.shl_address)
destroy(this.lnk_map)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_delete)
destroy(this.cb_save)
destroy(this.cb_insert_modo_pago)
destroy(this.cb_delete_modo_pago)
destroy(this.cb_update_modo_pago)
destroy(this.dw_2)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.cb_3)
destroy(this.cb_insert_branch)
destroy(this.cb_delete_branch)
destroy(this.cb_update_branch)
destroy(this.dw_1)
destroy(this.lst_related_branch)
destroy(this.sle_idbranch_new_owner)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.gb_3)
destroy(this.tab_dup)
end on

event open;LONG l_check_user_role

X=1
Y=1
Show()

tab_dup.visible = false

commit ;

string ls_parm

ls_parm = Message.StringParm	

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_1.insertrow(0)

l_check_user_role = fn_check_user_role('TSL')	
dw_1.Setitem(1,"yncheckuserrole",l_check_user_role)

if ls_parm <> "" then
	em_1.text = ls_parm
	em_1.triggerevent(modified!)	
end if



end event

event activate;//
end event

type cb_duplicate from commandbutton within w_ingreso_branch
integer x = 2875
integer y = 1192
integer width = 590
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Duplicate Agency"
end type

event clicked;string	ls_branch, ls_name_branch

if dw_1.rowcount() = 0 then
	return
end if

IF dw_1.update() = 1 THEN
	commit;
ELSE
	Messagebox("Warning","Verificate dates in Branch")
	rollback;
	return
END IF

ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
ls_name_branch = dw_1.getitemstring(dw_1.getrow(),"name_branch")

tab_dup.visible = true

tab_dup.tp.sle_dup_idbranch.text = 'A0'
tab_dup.tp.sle_dup_namebranch.text = left(ls_name_branch,Pos(ls_name_branch,"(")-1)

SetFocus(tab_dup.tp.sle_dup_idbranch)





end event

type cb_schedule from commandbutton within w_ingreso_branch
integer x = 1938
integer y = 832
integer width = 279
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Schedule"
end type

event clicked;Open(w_businesshours_select)
end event

type cb_update_pop_limit from commandbutton within w_ingreso_branch
integer x = 3296
integer y = 1512
integer width = 192
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;dw_4.accepttext()

IF dw_4.update() = 1 THEN
	
	COMMIT ;

ELSE

	Messagebox("Warning","Verificate dates in Mode Pay")
	ROLLBACK ;

END IF
end event

type cb_delete_pop_limit from commandbutton within w_ingreso_branch
integer x = 3109
integer y = 1512
integer width = 192
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;dw_4.deleterow(0)
end event

type cb_insert_pop_limit from commandbutton within w_ingreso_branch
integer x = 2921
integer y = 1512
integer width = 192
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New"
end type

event clicked;string	ls_branch


if dw_1.rowcount() = 0 then
	return
end if

if dw_4.rowcount() >= 3 then
	return
end if

IF dw_1.update() = 1 THEN
	
	COMMIT ;

ELSE
	Messagebox("Warning","Verificate dates in Branch")
	ROLLBACK ;
	return
END IF


ls_branch  = dw_1.getitemstring(dw_1.getrow(),"id_branch")

dw_4.insertrow(1)
dw_4.scrolltorow(1)
dw_4.setitem(1,"id_branch",ls_branch)


end event

type dw_4 from datawindow within w_ingreso_branch
integer x = 2670
integer y = 1588
integer width = 823
integer height = 504
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_ingreso_pop_limit"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type sle_id_branch_relation from singlelineedit within w_ingreso_branch
integer x = 690
integer y = 1276
integer width = 256
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;lst_related_branch.setselectedid( sle_id_branch_relation.text )

// Chequea que este en la lista
//IF sle_idbranch_new_owner.text <> ddlb_old_branch.getdataid() THEN
//	this.TextColor	= RGB(255,0,0)
//ELSE	
//	this.TextColor	= RGB(0,0,0)
//END IF
end event

type cbx_related_to_branch from checkbox within w_ingreso_branch
integer x = 101
integer y = 1284
integer width = 544
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Related to Branch:"
end type

event clicked;IF cbx_related_to_branch.checked = TRUE THEN
	
	lst_related_branch.enabled = true
	sle_id_branch_relation.enabled = true
	
	
	
else
	
	lst_related_branch.enabled = false
	sle_id_branch_relation.enabled = false
	
end if
end event

type ddlb_old_branch from my_ddlb within w_ingreso_branch
integer x = 955
integer y = 1172
integer width = 1335
integer height = 788
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
end type

event constructor;call super::constructor;this.addquery("SELECT  NAME_BRANCH, ID_BRANCH FROM DBA.BRANCH WHERE  ID_TYPE_BRANCH IN ('A', 'R')  ORDER BY  NAME_BRANCH;" )
end event

event modified;call super::modified;sle_idbranch_new_owner.text = ddlb_old_branch.getdataid()
end event

type cbx_owner_change from checkbox within w_ingreso_branch
integer x = 101
integer y = 1184
integer width = 581
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Changed Owner from:"
end type

event clicked;IF cbx_owner_change.checked = TRUE  THEN
	
	ddlb_old_branch.enabled = true
	sle_idbranch_new_owner.enabled = true
	
else
			
		ddlb_old_branch.enabled = false
		sle_idbranch_new_owner.enabled = false
	
end if
end event

type shl_address from statichyperlink within w_ingreso_branch
integer x = 1509
integer y = 516
integer width = 709
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long backcolor = 67108864
string text = "Find Address In MapQuest"
alignment alignment = right!
boolean focusrectangle = false
string url = "https://www.viamericas.net"
end type

type lnk_map from statichyperlink within w_ingreso_branch
boolean visible = false
integer x = 475
integer y = 1092
integer width = 1253
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long backcolor = 67108864
string text = "Open Map (Precision: City)"
boolean focusrectangle = false
string url = "https://www.viamericas.net"
end type

type em_1 from editmask within w_ingreso_branch
integer x = 471
integer y = 32
integer width = 366
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event losefocus;//
//String	ls_city, ls_state, ls_country, ls_address, ls_zip, ls_name_city, ls_id_branch, ls_id_branch_sec, ls_id_branch_old
//LONG l_check_user_role
//DataWindowChild ldw_cdw
//
//lnk_map.visible = false
//
//if em_1.text = "" then return
//
//
//if dw_1.retrieve(em_1.text) <> 0 then
//	
//	
//	l_check_user_role = fn_check_user_role('TSL')
//	
//	 dw_1.Setitem(1,"yncheckuserrole",l_check_user_role)
//	
//	ls_country = dw_1.getitemstring(1,"id_country")
//	ls_state = dw_1.getitemstring(1,"id_state")
//	ls_city = dw_1.getitemstring(1,"id_city")
//	ls_address = trim(dw_1.getitemstring(1,"address_branch"))
//	ls_zip = trim(String(dw_1.getitemnumber(1,"zip_branch")))
//	
//	if len(ls_zip) = 4 then ls_zip = '0'+ls_zip
//	
//	dw_1.GetChild('id_state',ldw_cdw)
//	ldw_cdw.SetTransObject(SQLCA)
//	ldw_cdw.SetFilter('')
//	ldw_cdw.Filter()
//	ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
//	ldw_cdw.Filter()
////	dw_1.setitem(1,"id_country",ls_country)
////	dw_1.setitem(1,"id_state",ls_state)
//	
//	dw_1.GetChild('id_city',ldw_cdw)
//	ldw_cdw.SetTransObject(SQLCA)
//	ldw_cdw.SetFilter('')
//	ldw_cdw.Filter()
//	ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
//	ldw_cdw.Filter()
////	dw_1.setitem(1,"id_city",ls_city)
//		
//	dw_2.retrieve(em_1.text)
//	dw_3.retrieve(em_1.text)
//	dw_4.retrieve(em_1.text)	
//	
//	fn_updateaddresslink()
//
//
//else
//	dw_1.reset()
//	dw_2.reset()
//	dw_3.reset()	
//	dw_4.reset()	
//end if
//
//ls_id_branch = dw_1.getitemstring(dw_1.getrow(),'id_branch')
//
//SELECT ID_BRANCH_SEC
//INTO :ls_id_branch_sec
//FROM DBA.BRANCH_RELATIONS
//WHERE ID_BRANCH_MAIN = :ls_id_branch;
//
//
//if isnull(ls_id_branch_sec) or ls_id_branch_sec ='' then
//	SELECT ID_BRANCH_MAIN
//	INTO :ls_id_branch_sec
//	FROM DBA.BRANCH_RELATIONS
//	WHERE ID_BRANCH_SEC = :ls_id_branch;
//	
//	lst_related_branch.setselectedid( ls_id_branch_sec )
//	sle_id_branch_relation.text = ls_id_branch_sec
//	
//	IF isnull(ls_id_branch_sec) or ls_id_branch_sec ='' THEN
//		cbx_related_to_branch.checked = false
//		cbx_related_to_branch.triggerevent(Clicked!)
//	else
//		cbx_related_to_branch.checked = true
//		cbx_related_to_branch.triggerevent(Clicked!)
//	END IF
//else
//	lst_related_branch.setselectedid( ls_id_branch_sec )
//	sle_id_branch_relation.text = ls_id_branch_sec
//	cbx_related_to_branch.checked = true
//	cbx_related_to_branch.triggerevent(Clicked!)
//end if
//
//setnull(ls_id_branch_old)
//
//SELECT ID_BRANCH_OLD
//INTO :ls_id_branch_old
//FROM DBA.BRANCH_OWNER_CHANGE
//WHERE ID_BRANCH_SEC = :ls_id_branch;
//
//ddlb_old_branch.setselectedid( ls_id_branch_old )
//sle_idbranch_new_owner.text = ls_id_branch_old
//
//if isnull(ls_id_branch_old) or ls_id_branch_old ='' then
//	
//	 
//	cbx_owner_change.triggerevent(Clicked!)
//else
//	cbx_owner_change.checked = true
//	cbx_owner_change.triggerevent(Clicked!)
//end if
//
//lb_status_branch_new_owner = cbx_owner_change.checked
//
//lb_status_branch_relation =cbx_related_to_branch.checked
//	
end event

event modified;
String	ls_city, ls_state, ls_country, ls_address, ls_zip, ls_name_city, ls_id_branch, ls_id_branch_sec, ls_id_branch_old
LONG l_check_user_role
DataWindowChild ldw_cdw

lnk_map.visible = false

if em_1.text = "" then return

is_brach_selected = em_1.text

if dw_1.retrieve(em_1.text) <> 0 then
	
	
	
	l_check_user_role = fn_check_user_role('TSL')
	
	 dw_1.Setitem(1,"yncheckuserrole",l_check_user_role)
	
	ls_country = dw_1.getitemstring(1,"id_country")
	ls_state = dw_1.getitemstring(1,"id_state")
	ls_city = dw_1.getitemstring(1,"id_city")
	ls_address = trim(dw_1.getitemstring(1,"address_branch"))
	ls_zip = trim(String(dw_1.getitemnumber(1,"zip_branch")))
	
	if len(ls_zip) = 4 then ls_zip = '0'+ls_zip
	
	dw_1.GetChild('id_state',ldw_cdw)
	ldw_cdw.SetTransObject(SQLCA)
	ldw_cdw.Retrieve(ls_country)
//	ldw_cdw.SetFilter('')
//	ldw_cdw.Filter()
//	ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
//	ldw_cdw.Filter()
//	dw_1.setitem(1,"id_country",ls_country)
//	dw_1.setitem(1,"id_state",ls_state)
	
	dw_1.GetChild('id_city',ldw_cdw)
	ldw_cdw.SetTransObject(SQLCA)
	ldw_cdw.Retrieve(ls_country, ls_state)
//	ldw_cdw.SetFilter('')
//	ldw_cdw.Filter()
//	ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
//	ldw_cdw.Filter()
//	dw_1.setitem(1,"id_city",ls_city)
		
	dw_2.retrieve(em_1.text)
	dw_3.retrieve(em_1.text)
	dw_4.retrieve(em_1.text)	
	
	fn_updateaddresslink()


else
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()	
	dw_4.reset()	
end if

ls_id_branch = dw_1.getitemstring(dw_1.getrow(),'id_branch')

SELECT ID_BRANCH_SEC
INTO :ls_id_branch_sec
FROM DBA.BRANCH_RELATIONS
WHERE ID_BRANCH_MAIN = :ls_id_branch;


if isnull(ls_id_branch_sec) or ls_id_branch_sec ='' then
	SELECT ID_BRANCH_MAIN
	INTO :ls_id_branch_sec
	FROM DBA.BRANCH_RELATIONS
	WHERE ID_BRANCH_SEC = :ls_id_branch;
	
	lst_related_branch.setselectedid( ls_id_branch_sec )
	sle_id_branch_relation.text = ls_id_branch_sec
	
	IF isnull(ls_id_branch_sec) or ls_id_branch_sec ='' THEN
		cbx_related_to_branch.checked = false
		cbx_related_to_branch.triggerevent(Clicked!)
	else
		cbx_related_to_branch.checked = true
		cbx_related_to_branch.triggerevent(Clicked!)
	END IF
else
	lst_related_branch.setselectedid( ls_id_branch_sec )
	sle_id_branch_relation.text = ls_id_branch_sec
	cbx_related_to_branch.checked = true
	cbx_related_to_branch.triggerevent(Clicked!)
end if

setnull(ls_id_branch_old)

SELECT ID_BRANCH_OLD
INTO :ls_id_branch_old
FROM DBA.BRANCH_OWNER_CHANGE
WHERE ID_BRANCH_SEC = :ls_id_branch;

ddlb_old_branch.setselectedid( ls_id_branch_old )
sle_idbranch_new_owner.text = ls_id_branch_old

if isnull(ls_id_branch_old) or ls_id_branch_old ='' then
	
	 
	cbx_owner_change.triggerevent(Clicked!)
else
	cbx_owner_change.checked = true
	cbx_owner_change.triggerevent(Clicked!)
end if

lb_status_branch_new_owner = cbx_owner_change.checked

lb_status_branch_relation =cbx_related_to_branch.checked
	
end event

type st_1 from statictext within w_ingreso_branch
integer x = 101
integer y = 36
integer width = 347
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Agent Code  :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_ingreso_branch
integer x = 1179
integer y = 1500
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New"
end type

event clicked;string	ls_branch, ls_country, ls_state, ls_city

if dw_1.rowcount() = 0 then
	return
end if




IF dw_1.update() = 1 THEN
	
	COMMIT ;

ELSE
	Messagebox("Warning","Verificate dates in Branch")
	ROLLBACK ;
	return
END IF


ls_branch  = dw_1.getitemstring(dw_1.getrow(),"id_branch")
ls_country = dw_1.getitemstring(dw_1.getrow(),"id_country")
ls_state   = dw_1.getitemstring(dw_1.getrow(),"id_state")
ls_city    = dw_1.getitemstring(dw_1.getrow(),"id_city")


dw_2.insertrow(1)
dw_2.scrolltorow(1)
dw_2.setitem(1,"id_branch",ls_branch)

dw_2.setitem(1,"id_country",ls_country)
dw_2.setitem(1,"id_state",ls_state)
dw_2.setitem(1,"id_city",ls_city)
end event

type cb_delete from commandbutton within w_ingreso_branch
integer x = 1367
integer y = 1500
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;dw_2.deleterow(0)
end event

type cb_save from commandbutton within w_ingreso_branch
integer x = 1554
integer y = 1500
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;dw_2.accepttext()



IF dw_2.update() = 1 THEN
	
	COMMIT ;

ELSE
	Messagebox("Warning","Verificate dates in Coverage")
	ROLLBACK ;

END IF

end event

type cb_insert_modo_pago from commandbutton within w_ingreso_branch
integer x = 2039
integer y = 1496
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New"
end type

event clicked;string	ls_branch


if dw_1.rowcount() = 0 then
	return
end if

if dw_3.rowcount() >= 3 then
	return
end if

IF dw_1.update() = 1 THEN
	
	COMMIT ;

ELSE
	Messagebox("Warning","Verificate dates in Branch")
	ROLLBACK ;
	return
END IF


ls_branch  = dw_1.getitemstring(dw_1.getrow(),"id_branch")

dw_3.insertrow(1)
dw_3.scrolltorow(1)
dw_3.setitem(1,"id_branch",ls_branch)


end event

type cb_delete_modo_pago from commandbutton within w_ingreso_branch
integer x = 2226
integer y = 1496
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;dw_3.deleterow(0)
end event

type cb_update_modo_pago from commandbutton within w_ingreso_branch
integer x = 2414
integer y = 1496
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;dw_3.accepttext()



IF dw_3.update() = 1 THEN
	
	COMMIT ;

ELSE
	Messagebox("Warning","Verificate dates in Mode Pay")
	ROLLBACK ;

END IF
end event

type dw_2 from datawindow within w_ingreso_branch
integer x = 46
integer y = 1580
integer width = 1723
integer height = 504
integer taborder = 70
string dataobject = "dw_ingreso_cubrimiento_branch"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;String 				ls_cod_cou, ls_cod_sta, ls_id_state, ls_id_city, ls_id_country
DataWindowChild	ldw_dw

IF dwo.name = "id_country" THEN
	GetChild("id_state",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	SetItem(GetRow(),"id_state","")
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetText()+"'")
	ldw_dw.Filter()


	SetItem(GetRow(),"id_city","")
	GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()

	IF GetItemString(GetRow(),"id_state") = '' OR IsNull(GetItemString(GetRow(),"id_state")) THEN
		ldw_dw.SetFilter("id_country = '"+GetText()+"'")
		ldw_dw.Filter()
	ELSE
		ldw_dw.SetFilter("id_country = '"+GetText()+"' and id_state = '"+GetItemString(GetRow(),"id_state")+"'")
		ldw_dw.Filter()
	END IF
END IF

IF dwo.name = "id_state" THEN
	SetItem(GetRow(),"id_city","")
	GetChild("id_city",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetItemString(GetRow(),"id_country")+"' and id_state = '"+GetText()+"'")
	ldw_dw.Filter()
END IF

IF dwo.Name = "id_city" THEN

	ls_id_city = GetText()
	ls_id_country = GetItemString(GetRow(),"id_country")

  SELECT dba.city.id_state
    INTO :ls_id_state
    FROM dba.city
   WHERE dba.city.id_city = :ls_id_city  AND
	      dba.id_country = :ls_id_country ;


END IF

end event

type gb_1 from groupbox within w_ingreso_branch
integer x = 37
integer y = 1428
integer width = 1742
integer height = 676
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Coverage "
end type

type gb_2 from groupbox within w_ingreso_branch
integer x = 2656
integer y = 1440
integer width = 855
integer height = 676
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Payment Limit"
end type

type cb_3 from commandbutton within w_ingreso_branch
integer x = 850
integer y = 32
integer width = 293
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Find"
end type

event clicked;string 	ls_branch


Open(w_seleccionar_branch)

ls_branch = message.stringparm

em_1.text = ls_branch

tab_dup.visible = false

em_1.setfocus()
end event

type cb_insert_branch from commandbutton within w_ingreso_branch
integer x = 2647
integer y = 40
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New"
end type

event clicked;long l_check_user_role

dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_4.reset()	
dw_1.insertrow(1)

l_check_user_role = fn_check_user_role('TSL')	
dw_1.Setitem(1,"yncheckuserrole",l_check_user_role)

em_1.text = ""
end event

type cb_delete_branch from commandbutton within w_ingreso_branch
integer x = 2839
integer y = 40
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;if dw_1.rowcount() = 0 then
	return
end if




dw_1.deleterow(0)
end event

type cb_update_branch from commandbutton within w_ingreso_branch
integer x = 3031
integer y = 40
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;STRING ls_id_branch_main, ls_id_branch_sec, ls_id_branch_exist, ls_old_branch, ls_old_branch_exist, ls_id_branch_sec_exist
STRING ls_address_main, ls_address_sec

BOOLEAN lb_actuliz_cenpos_age = false

if dw_1.rowcount() = 0 then
	return
end if



dw_1.accepttext()

IF dw_1.GetItemStatus ( 1 , 'is_cenpos_avaible',  Primary!) = DataModified! THEN
	lb_actuliz_cenpos_age = true
END IF


dw_1.update()

ls_id_branch_sec =lst_related_branch.getdataid()
ls_id_branch_main = dw_1.getitemstring(dw_1.getrow(),'id_branch')

SETNULL(ls_id_branch_exist)

if cbx_related_to_branch.checked =true then

	SELECT ID_BRANCH_MAIN, ID_BRANCH_SEC
	INTO :ls_id_branch_exist, :ls_id_branch_sec_exist
	FROM DBA.BRANCH_RELATIONS
	WHERE ID_BRANCH_MAIN = :ls_id_branch_main OR ID_BRANCH_SEC = :ls_id_branch_main ;

	IF ISNULL(ls_id_branch_exist) THEN
		
		SELECT ADDRESS_BRANCH
		INTO :ls_address_main
		FROM DBA.BRANCH
		WHERE ID_BRANCH = :ls_id_branch_main;
		
		SELECT ADDRESS_BRANCH
		INTO :ls_address_sec
		FROM DBA.BRANCH
		WHERE ID_BRANCH = :ls_id_branch_sec;
		
		IF ls_address_main = ls_address_sec THEN
	
			INSERT INTO DBA.BRANCH_RELATIONS
			VALUES(:ls_id_branch_main, :ls_id_branch_sec);
		
		ELSE
			
			messagebox('ALERT','The Address do not match please check',stopsign!)
			return
			
		END IF
		
		if SQLCA.SQLCODE < 0 then
			messagebox('ALERT','The Id_branch already exsit in another relation', stopsign!)
		else
			lb_status_branch_relation = TRUE
		end if
	
	ELSE
			if ls_id_branch_exist = ls_id_branch_main and ls_id_branch_sec_exist <> ls_id_branch_sec then
				IF MESSAGEBOX('ALERT','Are you sure that you want to change the Relation?',stopsign!,yesno!) = 1 then
					
					SELECT ADDRESS_BRANCH
					INTO :ls_address_main
					FROM DBA.BRANCH
					WHERE ID_BRANCH = :ls_id_branch_main;
		
					SELECT ADDRESS_BRANCH
					INTO :ls_address_sec
					FROM DBA.BRANCH
					WHERE ID_BRANCH = :ls_id_branch_sec;
					
					IF ls_address_main = ls_address_sec THEN
	
					UPDATE DBA.BRANCH_RELATIONS
					SET ID_BRANCH_MAIN = :ls_id_branch_main,
		 		 		  ID_BRANCH_SEC = :ls_id_branch_sec
					WHERE ID_BRANCH_MAIN = :ls_id_branch_main;
					
					ELSE
			
			messagebox('ALERT','The Address do not match please check',stopsign!)
			return
			
		END IF
				end if
			IF ls_id_branch_sec_exist = ls_id_branch_sec AND ls_id_branch_exist <> ls_id_branch_main THEN
				IF MESSAGEBOX('ALERT','Are you sure that you want to change the Relation?',stopsign!,yesno!) = 1 then
					
					SELECT ADDRESS_BRANCH
					INTO :ls_address_main
					FROM DBA.BRANCH
					WHERE ID_BRANCH = :ls_id_branch_main;
		
					SELECT ADDRESS_BRANCH
					INTO :ls_address_sec
					FROM DBA.BRANCH
					WHERE ID_BRANCH = :ls_id_branch_sec;
					
					IF ls_address_main = ls_address_sec THEN
					
						UPDATE DBA.BRANCH_RELATIONS
						SET ID_BRANCH_MAIN = :ls_id_branch_sec,
		 		 		  ID_BRANCH_SEC = :ls_id_branch_main
						WHERE ID_BRANCH_SEC = :ls_id_branch_sec;
					
					ELSE
			
						messagebox('ALERT','The Address do not match please check',stopsign!)
						return
			
					END IF
				END IF
			end if
				
			
			end if	
		END IF
ELSE
		IF  cbx_related_to_branch.checked = FALSE  AND lb_status_branch_relation = TRUE THEN
			IF MESSAGEBOX('ALERT','Are you sure that you want to Delete the Current Relation?',stopsign!,yesno!) = 1 then
			
				DELETE 
				FROM DBA.BRANCH_RELATIONS
				WHERE ID_BRANCH_MAIN = :ls_id_branch_main OR ID_BRANCH_SEC = :ls_id_branch_main;
			
				lb_status_branch_relation = FALSE
			
			END IF 
		end if

END IF

if cbx_owner_change.checked = true then
	
	ls_old_branch = ddlb_old_branch.getdataid()
	
	SELECT ID_BRANCH_OLD
	INTO :ls_old_branch_exist
	FROM DBA.BRANCH_OWNER_CHANGE
	WHERE ID_BRANCH_SEC = :ls_id_branch_main  ;
	
		IF ISNULL(ls_old_branch_exist) or ls_old_branch_exist = ''  THEN
	
			INSERT INTO DBA.BRANCH_OWNER_CHANGE
			VALUES(:ls_old_branch, :ls_id_branch_main);
			
			if SQLCA.SQLCODE < 0 then
			messagebox('ALERT','The Id_branch already exsit in another relation', stopsign!)
		else
			lb_status_branch_new_owner = TRUE
		end if
			
			
	
		ELSE
	
	
			if ls_old_branch_exist <> ls_old_branch then
				IF MESSAGEBOX('ALERT','Are you sure that you want to change the Relation?',stopsign!,yesno!) = 1 then
	
					UPDATE DBA.BRANCH_OWNER_CHANGE
					SET ID_BRANCH_OLD = :ls_old_branch
		  			WHERE ID_BRANCH_SEC = :ls_id_branch_main;
					  
				 end if
			end if
		END IF
		
ELSE
	IF  cbx_owner_change.checked = FALSE  AND lb_status_branch_new_owner = TRUE THEN
		IF MESSAGEBOX('ALERT','Are you sure that you want to Delete the Current Relation?',stopsign!,yesno!) = 1 then
			
			DELETE 
			FROM DBA.BRANCH_OWNER_CHANGE
			WHERE ID_BRANCH_OLD = :ls_id_branch_main OR ID_BRANCH_SEC = :ls_id_branch_main;
			
			lb_status_branch_new_owner = FALSE
			
		END IF 	
	END IF

end if


IF dw_1.update() = 1 THEN
	
	COMMIT ;
	
	IF lb_actuliz_cenpos_age THEN
		
		
		String 	ls_output, ls_outputfolder,  ls_agencyfolderm, s_id_branch, ls_agencyfolder
		Integer 	li_FileNum
		
		s_id_branch = dw_1.GetItemString(1,'id_branch' )

		
		SELECT ISNULL(DIR_OUTPUT,'R:\OUTPUT\')
		  INTO :ls_outputfolder
		  FROM dba.PARAMETROS; 
			  
		// ******************
		// Validate U: Drive!
		fn_map_output()
		
		if not fileexists('R:\Output') then
			Messagebox("Error!","La unidad necesaria no esta mapeada, favor intente nuevamente o contacte a Tecnologia si el problema se repite!",StopSign!)
			return
		end if
		
		ls_agencyfolder = ''
		if fileexists(ls_outputfolder+trim(s_id_branch)) then ls_agencyfolder = trim(s_id_branch) + '\'
		
		ls_output = ls_outputfolder + ls_agencyfolder + "UPG"+FILL('0',10 - LEN(trim(s_id_branch)))+trim(s_id_branch)+".sql"
		li_FileNum = FileOpen(ls_output, LineMode!, Write!, LockWrite!,Append!)
		
		FileWrite(li_filenum,"SET option on_error = CONTINUE;")	
		
		FileWrite(li_filenum,"DELETE FROM POS_Terminal_CFG where PropertyName = 'Cenpos_Available';" )		
		IF dw_1.GetItemString(1,'is_cenpos_avaible' ) = 'S' THEN
			FileWrite(li_filenum,"INSERT INTO DBA.POS_Terminal_CFG (PropertyName, PropertyValue) VALUES ('Cenpos_Available', '1' );")	
		ELSE
			FileWrite(li_filenum,"INSERT INTO DBA.POS_Terminal_CFG (PropertyName, PropertyValue) VALUES ('Cenpos_Available', '0' );")	
		END IF
		
				
	
			
		
		FileWrite(li_filenum,"COMMIT;")	
		FileClose(li_FileNum)
				
		
		
	END IF
	
	

ELSE
	Messagebox("Warning","Verificate dates in Branch")
	ROLLBACK ;

END IF
end event

type dw_1 from datawindow within w_ingreso_branch
integer x = 5
integer y = 140
integer width = 3511
integer height = 956
string dataobject = "dw_ingreso_branch"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String 				ls_cod_cou, ls_cod_sta, ls_id_state, ls_id_city, ls_id_country, ls_reason, ls_id_type_branch
DataWindowChild	ldw_dw





//if dwo.name = "alt_fax_route" Then
//
//SELECT count(*)
//INTO :ll_cont
//FROM dba.SEC_USER_GROUP
//WHERE ID_GROUP = 'OCF' 
//AND ID_USER = :gs_cashier;
//
//	// si n es soporte
//	return 2
//
//end if
//


if dwo.name = "id_flag_branch" Then

	ls_id_type_branch = GetItemString(GetRow(),"id_type_branch")

	if data = 'I' and (ls_id_type_branch = 'R' or ls_id_type_branch = 'A') then
		// <><><><><><><><><><><><><><>
		// Obtains the inactivation Reason!
		ls_reason = ''
		Open(w_inactivation_reason)
		ls_reason = Message.StringParm
		//Messagebox("Error!",ls_reason,StopSign!)
		// <><><><><><><><><><><><><><>

		if isnumber(ls_reason)then
			dw_1.setItem(dw_1.GetRow(),"last_inactivation_type",double(ls_reason))
		end if

	end if
		
end if
	 
	 


// :::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Si la marcan CERRADA, automaticamente se pone INACTIVA!
If dwo.name = "id_status_branch" Then
	If (data = 'C') Then
		dw_1.setItem(dw_1.GetRow(),"id_flag_branch","I")
	End If
	If (data = 'O') and dw_1.GetItemString(dw_1.GetRow(),"id_status_branch") = 'C' Then
		dw_1.setItem(dw_1.GetRow(),"id_flag_branch","A")
	End If		
End If
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::

IF dwo.name = "id_country" THEN
	GetChild("id_state",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	SetItem(GetRow(),"id_state","")
	ldw_dw.Retrieve(GetText())
//	ldw_dw.SetFilter("id_country = '"+GetText()+"'")
//	ldw_dw.Filter()


	SetItem(GetRow(),"id_city","")
	GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()

	IF GetItemString(GetRow(),"id_state") = '' OR IsNull(GetItemString(GetRow(),"id_state")) THEN
		ldw_dw.SetFilter("id_country = '"+GetText()+"'")
		ldw_dw.Filter()
	ELSE
		ldw_dw.SetFilter("id_country = '"+GetText()+"' and id_state = '"+GetItemString(GetRow(),"id_state")+"'")
		ldw_dw.Filter()
	END IF
	
	fn_updateaddresslink()
END IF

IF dwo.name = "id_state" THEN
	SetItem(GetRow(),"id_city","")
	GetChild("id_city",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve(GetItemString(GetRow(),"id_country"), GetText())
//	ldw_dw.SetFilter("id_country = '"+GetItemString(GetRow(),"id_country")+"' and id_state = '"+GetText()+"'")
//	ldw_dw.Filter()
	
	fn_updateaddresslink()
END IF

IF dwo.Name = "id_city" THEN

	ls_id_city = GetText()
	ls_id_country = GetItemString(GetRow(),"id_country")

     SELECT dba.city.id_state
	 INTO :ls_id_state
	 FROM dba.city
	WHERE dba.city.id_city = :ls_id_city  AND
			dba.city.id_country = :ls_id_country ;
	
	fn_updateaddresslink()
END IF

IF dwo.Name = "address_branch" THEN
	if data <> obj_string_tools.of_removenonprint(data) or pos(data,"'") > 0 then
			
			if fn_getlang() = 'EN' then
				Messagebox("Invalid Data","The value ["+data+"] contains an invalid character please correct the value.  ~nThe invalid character won't be saved.",Exclamation!)
			else
				Messagebox("Dato Inválido","El valor ["+data+"] contiene un caracter inválido, por favor remuévalo. ~nEl caracter inválido no será grabado.",Exclamation!)
			end if	
			return 1	
	end if
END IF

IF dwo.Name = "name_branch" THEN
	if data <> obj_string_tools.of_removenonprint(data) or pos(data,"'") > 0 then
			
			if fn_getlang() = 'EN' then
				Messagebox("Invalid Data","The value ["+data+"] contains an invalid character please correct the value.  ~nThe invalid character won't be saved.",Exclamation!)
			else
				Messagebox("Dato Inválido","El valor ["+data+"] contiene un caracter inválido, por favor remuévalo. ~nEl caracter inválido no será grabado.",Exclamation!)
			end if	
			return 1	
	end if
END IF
end event

type lst_related_branch from my_ddlb within w_ingreso_branch
integer x = 955
integer y = 1276
integer width = 1335
integer height = 788
integer taborder = 60
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
end type

event constructor;call super::constructor;this.addquery("SELECT  NAME_BRANCH, ID_BRANCH FROM DBA.BRANCH WHERE ID_TYPE_BRANCH IN ('A', 'R') ORDER BY  NAME_BRANCH;" )
end event

event modified;call super::modified;sle_id_branch_relation.text = lst_related_branch.getdataid()
end event

type sle_idbranch_new_owner from singlelineedit within w_ingreso_branch
integer x = 690
integer y = 1172
integer width = 256
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;ddlb_old_branch.setselectedid( sle_idbranch_new_owner.text )

// Chequea que este en la lista
//IF sle_idbranch_new_owner.text <> ddlb_old_branch.getdataid() THEN
//	this.TextColor	= RGB(255,0,0)
//ELSE	
//	this.TextColor	= RGB(0,0,0)
//END IF
end event

type gb_4 from groupbox within w_ingreso_branch
integer x = 37
integer y = 1128
integer width = 3470
integer height = 288
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_3 from datawindow within w_ingreso_branch
integer x = 1797
integer y = 1572
integer width = 823
integer height = 504
integer taborder = 80
string dataobject = "dw_ingreso_modo_pago_branch"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type gb_3 from groupbox within w_ingreso_branch
integer x = 1787
integer y = 1424
integer width = 850
integer height = 676
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Mode Pay"
end type

type tab_dup from tab within w_ingreso_branch
integer x = 1033
integer y = 1096
integer width = 2062
integer height = 432
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean focusonbuttondown = true
boolean showtext = false
boolean showpicture = false
integer selectedtab = 1
tp tp
end type

on tab_dup.create
this.tp=create tp
this.Control[]={this.tp}
end on

on tab_dup.destroy
destroy(this.tp)
end on

type tp from userobject within tab_dup
integer x = 18
integer y = 48
integer width = 2025
integer height = 368
long backcolor = 80269524
string text = "none"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_dup cb_dup
cb_dupcan cb_dupcan
sle_dup_namebranch sle_dup_namebranch
sle_dup_idbranch sle_dup_idbranch
st_3 st_3
st_2 st_2
end type

on tp.create
this.cb_dup=create cb_dup
this.cb_dupcan=create cb_dupcan
this.sle_dup_namebranch=create sle_dup_namebranch
this.sle_dup_idbranch=create sle_dup_idbranch
this.st_3=create st_3
this.st_2=create st_2
this.Control[]={this.cb_dup,&
this.cb_dupcan,&
this.sle_dup_namebranch,&
this.sle_dup_idbranch,&
this.st_3,&
this.st_2}
end on

on tp.destroy
destroy(this.cb_dup)
destroy(this.cb_dupcan)
destroy(this.sle_dup_namebranch)
destroy(this.sle_dup_idbranch)
destroy(this.st_3)
destroy(this.st_2)
end on

type cb_dup from commandbutton within tp
integer x = 1527
integer y = 240
integer width = 416
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Duplicate"
end type

event clicked;
String ls_id_branch, ls_name_branch, ls_original_id_branch

ls_id_branch = trim(tab_dup.tp.sle_dup_idbranch.text)
ls_name_branch = trim(tab_dup.tp.sle_dup_namebranch.text)

ls_original_id_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")

If messagebox("Confirmation","Do you want to copy information on Agency "+trim(ls_original_id_branch)+" to a new agency with ID "+ls_id_branch+"?",Question!,yesno!) = 1 then

	
	insert into dba.BRANCH
	(ID_BRANCH
	,ID_COMPANY
	,NAME_BRANCH
	,ADDRESS_BRANCH
	,ID_CITY
	,ID_STATE
	,ID_COUNTRY
	,ID_MAIN_BRANCH
	,id_flag_branch
	,ID_TYPE_BRANCH
	,PHONE1_BRANCH
	,PHONE2_BRANCH
	,FAX_BRANCH
	,MODEM_BRANCH
	,DATE_CRE_BRANCH
	,ZIP_BRANCH
	,CURRENCY_PAY_BRANCH
	,PREPARE_PIN
	,FORMA_PAGO_BRANCH
	,PAYOR_CODE
	,ID_STATUS_BRANCH
	,LAST_STATUS_COMMENT
	,BUSINESS_HOURS
	,USE_ALTERNATIVE
	,ALTERNATIVE_ID_BRANCH
	,LATITUD
	,LONGITUD
	,GEO_PRECISION
	,LOCATION_NOTES
	,PAYER_CAPTION
	,ZIP4CODE_BRANCH
	,SYNC_COMPASS
	,GEO_GOOGLE
	,SYNC_ASSETS
	,LAST_INACTIVATION_TYPE
	,PRODUCT_TYPE
	,ID_LOCATION
	,ID_CHAIN
	,DATE_OPEN
	,DATE_CLOSE
	,INSTALLATION_TYPE
	,IS_BANK
	,ID_FLAG_BRANCH_TEMP
	,TIMELIMITPRINTPIN
	,ALT_FAX_ROUTE
	,ID_GROUP_NETWORK)
	SELECT :ls_id_branch
	,ID_COMPANY
	,:ls_name_branch
	,ADDRESS_BRANCH
	,ID_CITY
	,ID_STATE
	,ID_COUNTRY
	,ID_MAIN_BRANCH
	,id_flag_branch
	,ID_TYPE_BRANCH
	,PHONE1_BRANCH
	,PHONE2_BRANCH
	,FAX_BRANCH
	,MODEM_BRANCH
	,getdate()
	,ZIP_BRANCH
	,CURRENCY_PAY_BRANCH
	,PREPARE_PIN
	,FORMA_PAGO_BRANCH
	,PAYOR_CODE
	,ID_STATUS_BRANCH
	,null
	,BUSINESS_HOURS
	,USE_ALTERNATIVE
	,ALTERNATIVE_ID_BRANCH
	,LATITUD
	,LONGITUD
	,GEO_PRECISION
	,LOCATION_NOTES
	,PAYER_CAPTION
	,ZIP4CODE_BRANCH
	,SYNC_COMPASS
	,GEO_GOOGLE
	,SYNC_ASSETS
	,LAST_INACTIVATION_TYPE
	,PRODUCT_TYPE
	,ID_LOCATION
	,ID_CHAIN
	,getdate()
	,null
	,INSTALLATION_TYPE
	,IS_BANK
	,ID_FLAG_BRANCH_TEMP
	,TIMELIMITPRINTPIN
	,ALT_FAX_ROUTE
	,ID_GROUP_NETWORK
	FROM dba.BRANCH
	WHERE id_branch = :ls_original_id_branch;
	
	if SQLCA.SQLCODE <> 0 then
	
		Messagebox("Error","An error ocurred creating the copy ("+SQLCA.SQLErrText+")",StopSign!)
		
	else
		
		INSERT INTO dba.BRANCH_RELATIONS
		(ID_BRANCH_MAIN
		,ID_BRANCH_SEC)
		VALUES
		(:ls_original_id_branch
		,:ls_id_branch);
		
		if SQLCA.SQLCODE <> 0 then
			Messagebox("Please review","The copy was created but an error occurred while linking the agencies, please review the link.  ("+SQLCA.SQLErrText+")",Exclamation!)
		else
			Messagebox("Completed","Agency Copy completed sucessfully.")
		end if
		
	end if

else

	Messagebox("Canceled","Copy cancelled",Exclamation!)

end if







end event

type cb_dupcan from commandbutton within tp
integer x = 1093
integer y = 240
integer width = 416
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
end type

event clicked;
tab_dup.tp.sle_dup_idbranch.text = ''
tab_dup.tp.sle_dup_namebranch.text = ""

tab_dup.visible = false

end event

type sle_dup_namebranch from singlelineedit within tp
integer x = 553
integer y = 132
integer width = 1390
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

type sle_dup_idbranch from singlelineedit within tp
integer x = 553
integer y = 44
integer width = 302
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tp
integer x = 55
integer y = 52
integer width = 448
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "New Branch ID:"
boolean focusrectangle = false
end type

type st_2 from statictext within tp
integer x = 55
integer y = 140
integer width = 489
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "New Branch Name:"
boolean focusrectangle = false
end type

