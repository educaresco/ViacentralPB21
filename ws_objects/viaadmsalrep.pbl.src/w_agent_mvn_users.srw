$PBExportHeader$w_agent_mvn_users.srw
forward
global type w_agent_mvn_users from w_sheet
end type
type st_assigned from statictext within w_agent_mvn_users
end type
type st_2 from statictext within w_agent_mvn_users
end type
type dw_assigned from datawindow within w_agent_mvn_users
end type
type cb_2 from commandbutton within w_agent_mvn_users
end type
type cb_assign from commandbutton within w_agent_mvn_users
end type
type dw_unassigned from datawindow within w_agent_mvn_users
end type
type st_1 from statictext within w_agent_mvn_users
end type
type ddlb_sr from my_ddlb within w_agent_mvn_users
end type
type gb_1 from groupbox within w_agent_mvn_users
end type
end forward

global type w_agent_mvn_users from w_sheet
integer x = 214
integer y = 221
integer width = 3424
integer height = 1768
boolean resizable = false
st_assigned st_assigned
st_2 st_2
dw_assigned dw_assigned
cb_2 cb_2
cb_assign cb_assign
dw_unassigned dw_unassigned
st_1 st_1
ddlb_sr ddlb_sr
gb_1 gb_1
end type
global w_agent_mvn_users w_agent_mvn_users

on w_agent_mvn_users.create
int iCurrent
call super::create
this.st_assigned=create st_assigned
this.st_2=create st_2
this.dw_assigned=create dw_assigned
this.cb_2=create cb_2
this.cb_assign=create cb_assign
this.dw_unassigned=create dw_unassigned
this.st_1=create st_1
this.ddlb_sr=create ddlb_sr
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_assigned
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.dw_assigned
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_assign
this.Control[iCurrent+6]=this.dw_unassigned
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.ddlb_sr
this.Control[iCurrent+9]=this.gb_1
end on

on w_agent_mvn_users.destroy
call super::destroy
destroy(this.st_assigned)
destroy(this.st_2)
destroy(this.dw_assigned)
destroy(this.cb_2)
destroy(this.cb_assign)
destroy(this.dw_unassigned)
destroy(this.st_1)
destroy(this.ddlb_sr)
destroy(this.gb_1)
end on

type st_assigned from statictext within w_agent_mvn_users
integer x = 1947
integer y = 260
integer width = 1106
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Assigned"
boolean focusrectangle = false
end type

type st_2 from statictext within w_agent_mvn_users
integer x = 41
integer y = 260
integer width = 517
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Unassigned"
boolean focusrectangle = false
end type

type dw_assigned from datawindow within w_agent_mvn_users
integer x = 1947
integer y = 324
integer width = 1394
integer height = 1308
integer taborder = 20
string dataobject = "dw_agent_mvn_users_assigned"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;boolean result

result = not this.IsSelected(Row)

if Row > 0 then this.SelectRow(Row, result)

integer li_i

// Remove selection on the other side
for li_i = 1 to dw_unassigned.rowcount()
	dw_unassigned.SelectRow(li_i, false)
next
end event

type cb_2 from commandbutton within w_agent_mvn_users
integer x = 1463
integer y = 960
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<< Unassign"
end type

event clicked;integer 	i
Double	ld_id_agent
String 	ls_id_user

if ddlb_sr.getdataid() = '--' then
	Messagebox("Error!",'You must Select a Sales Representative',StopSign!)
	return
end if

ls_id_user = ddlb_sr.getdataid()

for i = 1 to dw_assigned.rowcount()
	if dw_assigned.IsSelected(i) then
		
		ld_id_agent = double(dw_assigned.Object.Data[i,2])

 	  DELETE FROM dba.MVN_USERS_AUTAGENTS
         WHERE LOGIN = :ls_id_user
           AND ID_AGENT = :ld_id_agent;
		
		If SQLCA.SQLCode <> 0 then
			Messagebox("Error!",'Error Saving Data ['+SQLCA.SQLErrText+']',StopSign!)
			return			
		end if		
				
	end if
next

dw_assigned.retrieve(ls_id_user)
dw_unassigned.retrieve(ls_id_user)
end event

type cb_assign from commandbutton within w_agent_mvn_users
integer x = 1463
integer y = 856
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Assign >>"
end type

event clicked;integer 	i
Double	ld_id_agent
String 	ls_id_user

if ddlb_sr.getdataid() = '--' then
	Messagebox("Error!",'You must Select a Sales Representative',StopSign!)
	return
end if

ls_id_user = ddlb_sr.getdataid()

for i = 1 to dw_unassigned.rowcount()
	if dw_unassigned.IsSelected(i) then
		
		ld_id_agent = double(dw_unassigned.Object.Data[i,2])

		  INSERT INTO dba.MVN_USERS_AUTAGENTS
               (LOGIN,   
               ID_AGENT)  
        VALUES (:ls_id_user,   
               :ld_id_agent);
		
		If SQLCA.SQLCode <> 0 then
			Messagebox("Error!",'Error Saving Data ['+SQLCA.SQLErrText+']',StopSign!)
			return			
		end if		
				
	end if
next

dw_assigned.retrieve(ls_id_user)
dw_unassigned.retrieve(ls_id_user)

end event

type dw_unassigned from datawindow within w_agent_mvn_users
integer x = 37
integer y = 324
integer width = 1394
integer height = 1308
integer taborder = 20
string dataobject = "dw_agent_mvn_users_unassigned"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;boolean result

result = not this.IsSelected(Row)

if Row > 0 then this.SelectRow(Row, result)

integer li_i

// Remove selection on the other side
for li_i = 1 to dw_assigned.rowcount()
	dw_assigned.SelectRow(li_i, false)
next
end event

type st_1 from statictext within w_agent_mvn_users
integer x = 471
integer y = 120
integer width = 517
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "User:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_sr from my_ddlb within w_agent_mvn_users
integer x = 1010
integer y = 108
integer width = 1394
integer height = 1352
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addqueryad("SELECT LOGIN, LOGIN FROM dba.MVN_USERS WHERE STATUS = 'A' AND TYPEUSER = 'SR';")
end event

event selectionchanged;call super::selectionchanged;
if ddlb_sr.getdataid() = '--' then
	dw_assigned.reset()
	dw_unassigned.reset()
	st_assigned.text = 'Assigned'
else
	dw_assigned.retrieve(ddlb_sr.getdataid())
	dw_unassigned.retrieve(ddlb_sr.getdataid())
	st_assigned.text = 'Assigned to '+ddlb_sr.getdatavalue()
end if
end event

type gb_1 from groupbox within w_agent_mvn_users
integer x = 37
integer y = 28
integer width = 3301
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

