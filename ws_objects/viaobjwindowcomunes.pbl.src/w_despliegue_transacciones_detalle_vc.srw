$PBExportHeader$w_despliegue_transacciones_detalle_vc.srw
forward
global type w_despliegue_transacciones_detalle_vc from window
end type
type cb_4 from commandbutton within w_despliegue_transacciones_detalle_vc
end type
type cb_print from commandbutton within w_despliegue_transacciones_detalle_vc
end type
type cb_1 from commandbutton within w_despliegue_transacciones_detalle_vc
end type
type dw_1 from u_dw within w_despliegue_transacciones_detalle_vc
end type
end forward

global type w_despliegue_transacciones_detalle_vc from window
integer x = 37
integer y = 4
integer width = 2377
integer height = 1736
boolean titlebar = true
string title = "ViaCheck Transactions"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
boolean center = true
cb_4 cb_4
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
end type
global w_despliegue_transacciones_detalle_vc w_despliegue_transacciones_detalle_vc

type variables
Double  	id_reference
end variables

event open;
dw_1.settransobject(sqlca)
id_reference = Message.DoubleParm	
dw_1.retrieve(id_reference) 

end event

on w_despliegue_transacciones_detalle_vc.create
this.cb_4=create cb_4
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.cb_print,&
this.cb_1,&
this.dw_1}
end on

on w_despliegue_transacciones_detalle_vc.destroy
destroy(this.cb_4)
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_4 from commandbutton within w_despliegue_transacciones_detalle_vc
integer x = 933
integer y = 1544
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

type cb_print from commandbutton within w_despliegue_transacciones_detalle_vc
integer x = 613
integer y = 1544
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

type cb_1 from commandbutton within w_despliegue_transacciones_detalle_vc
integer x = 1253
integer y = 1544
integer width = 306
integer height = 72
integer taborder = 40
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

type dw_1 from u_dw within w_despliegue_transacciones_detalle_vc
integer width = 2341
integer height = 1496
integer taborder = 10
string dataobject = "dw_despliegue_transacciones_detalle_vc"
boolean hscrollbar = true
end type

event clicked;return 0
end event

