$PBExportHeader$w_consulta_reclamo.srw
forward
global type w_consulta_reclamo from wb_response
end type
type dw_1 from datawindow within w_consulta_reclamo
end type
type cb_1 from commandbutton within w_consulta_reclamo
end type
type cb_2 from commandbutton within w_consulta_reclamo
end type
type cb_3 from commandbutton within w_consulta_reclamo
end type
end forward

global type w_consulta_reclamo from wb_response
integer x = 425
integer y = 884
integer width = 2199
integer height = 1600
string title = "Messages/Complaints"
dw_1 dw_1
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
end type
global w_consulta_reclamo w_consulta_reclamo

type variables
Double	ld_sender
end variables

on w_consulta_reclamo.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_3
end on

on w_consulta_reclamo.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
end on

event open;call super::open;dw_1.settransobject(sqlca)

Commit ;

ld_sender = message.doubleparm

dw_1.retrieve(ld_sender,gs_branch_insta_cons,gl_receiver_cons)
end event

type dw_1 from datawindow within w_consulta_reclamo
integer width = 2139
integer height = 1384
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_consulta_reclamos"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_consulta_reclamo
integer x = 1024
integer y = 1404
integer width = 361
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&New"
end type

event clicked;long 	ll_row
 
ll_row = dw_1.insertrow(0)


dw_1.SETITEM(ll_row,"id_cashier",gs_cashier)
dw_1.SETITEM(ll_row,"id_sender",ld_sender)
dw_1.SETITEM(ll_row,"id_branch",gs_branch_insta_cons)
dw_1.SETITEM(ll_row,"id_receiver",gl_receiver_cons)

dw_1.Accepttext()
dw_1.scrolltorow(ll_row)
dw_1.setfocus()
dw_1.setcolumn(7)
end event

type cb_2 from commandbutton within w_consulta_reclamo
integer x = 1403
integer y = 1404
integer width = 361
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Save"
end type

event clicked;dw_1.update()
Commit;
end event

type cb_3 from commandbutton within w_consulta_reclamo
integer x = 1778
integer y = 1404
integer width = 361
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
boolean cancel = true
end type

event clicked;Commit;
Close(Parent)
end event

