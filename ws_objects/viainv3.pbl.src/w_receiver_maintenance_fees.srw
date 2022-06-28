$PBExportHeader$w_receiver_maintenance_fees.srw
forward
global type w_receiver_maintenance_fees from window
end type
type cb_ok from commandbutton within w_receiver_maintenance_fees
end type
type dw_1 from datawindow within w_receiver_maintenance_fees
end type
end forward

global type w_receiver_maintenance_fees from window
integer width = 2162
integer height = 1328
boolean titlebar = true
string title = "Maintenance Fees"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_ok cb_ok
dw_1 dw_1
end type
global w_receiver_maintenance_fees w_receiver_maintenance_fees

on w_receiver_maintenance_fees.create
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.Control[]={this.cb_ok,&
this.dw_1}
end on

on w_receiver_maintenance_fees.destroy
destroy(this.cb_ok)
destroy(this.dw_1)
end on

event open;string ls_id_branch
double ld_id_receiver
long 	 ll_count

ls_id_branch = fn_token(Message.StringParm,'*',1)
ld_id_receiver = double(fn_token(Message.StringParm,'*',2))

SELECT count(*)
  INTO :ll_count
  FROM dba.receiver
 WHERE id_branch = :ls_id_branch
   AND id_receiver = :ld_id_receiver;	

if ll_count < 1 then
	close(this)
	return
end if

dw_1.retrieve(ls_id_branch,ld_id_receiver)

end event

type cb_ok from commandbutton within w_receiver_maintenance_fees
integer x = 1774
integer y = 1144
integer width = 343
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_receiver_maintenance_fees
integer x = 9
integer y = 8
integer width = 2107
integer height = 1124
integer taborder = 10
string title = "Maintenance Fees"
string dataobject = "dw_receiver_maintenance_fees"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

