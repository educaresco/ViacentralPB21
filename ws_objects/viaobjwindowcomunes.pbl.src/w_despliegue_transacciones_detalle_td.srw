$PBExportHeader$w_despliegue_transacciones_detalle_td.srw
forward
global type w_despliegue_transacciones_detalle_td from window
end type
type cb_4 from commandbutton within w_despliegue_transacciones_detalle_td
end type
type st_1 from statictext within w_despliegue_transacciones_detalle_td
end type
type cb_print from commandbutton within w_despliegue_transacciones_detalle_td
end type
type cb_1 from commandbutton within w_despliegue_transacciones_detalle_td
end type
type dw_1 from u_dw within w_despliegue_transacciones_detalle_td
end type
end forward

global type w_despliegue_transacciones_detalle_td from window
integer x = 37
integer y = 4
integer width = 3707
integer height = 2336
boolean titlebar = true
string title = "AGENT ACCOUNT"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_4 cb_4
st_1 st_1
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
end type
global w_despliegue_transacciones_detalle_td w_despliegue_transacciones_detalle_td

type variables
Double  	id_reference
end variables

event open;


id_reference = DOUBLE(Message.DoubleParm)

st_1.text = STRING(id_reference)

dw_1.retrieve(id_reference) 

end event

on w_despliegue_transacciones_detalle_td.create
this.cb_4=create cb_4
this.st_1=create st_1
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.st_1,&
this.cb_print,&
this.cb_1,&
this.dw_1}
end on

on w_despliegue_transacciones_detalle_td.destroy
destroy(this.cb_4)
destroy(this.st_1)
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_4 from commandbutton within w_despliegue_transacciones_detalle_td
integer x = 352
integer y = 2152
integer width = 306
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Export"
boolean cancel = true
end type

event clicked;dw_1.saveas()
end event

type st_1 from statictext within w_despliegue_transacciones_detalle_td
boolean visible = false
integer x = 2807
integer y = 2084
integer width = 343
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
boolean enabled = false
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_despliegue_transacciones_detalle_td
integer x = 27
integer y = 2152
integer width = 306
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Print"
boolean cancel = true
end type

event clicked;Printsetup()
dw_1.print()
end event

type cb_1 from commandbutton within w_despliegue_transacciones_detalle_td
integer x = 677
integer y = 2152
integer width = 306
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(PARENT)
end event

type dw_1 from u_dw within w_despliegue_transacciones_detalle_td
integer width = 3671
integer height = 2120
integer taborder = 10
string dataobject = "dw_despliegue_transsacciones_esp_agente"
boolean hscrollbar = true
end type

event clicked;return 0
end event

event constructor;call super::constructor;dw_1.settransobject(sqlca)
end event

