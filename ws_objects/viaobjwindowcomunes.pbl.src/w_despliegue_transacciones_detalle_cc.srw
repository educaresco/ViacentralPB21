$PBExportHeader$w_despliegue_transacciones_detalle_cc.srw
forward
global type w_despliegue_transacciones_detalle_cc from window
end type
type cb_4 from commandbutton within w_despliegue_transacciones_detalle_cc
end type
type rb_by_agente from radiobutton within w_despliegue_transacciones_detalle_cc
end type
type rb_agente from radiobutton within w_despliegue_transacciones_detalle_cc
end type
type cb_print from commandbutton within w_despliegue_transacciones_detalle_cc
end type
type cb_1 from commandbutton within w_despliegue_transacciones_detalle_cc
end type
type dw_1 from u_dw within w_despliegue_transacciones_detalle_cc
end type
type gb_1 from groupbox within w_despliegue_transacciones_detalle_cc
end type
end forward

global type w_despliegue_transacciones_detalle_cc from window
integer x = 37
integer y = 4
integer width = 3634
integer height = 2328
boolean titlebar = true
string title = "AGENT ACCOUNT"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_4 cb_4
rb_by_agente rb_by_agente
rb_agente rb_agente
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_despliegue_transacciones_detalle_cc w_despliegue_transacciones_detalle_cc

type variables
Double  	id_reference
end variables

event open;
dw_1.settransobject(sqlca)
id_reference = Message.DoubleParm	

dw_1.retrieve(id_reference) 

end event

on w_despliegue_transacciones_detalle_cc.create
this.cb_4=create cb_4
this.rb_by_agente=create rb_by_agente
this.rb_agente=create rb_agente
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.rb_by_agente,&
this.rb_agente,&
this.cb_print,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_despliegue_transacciones_detalle_cc.destroy
destroy(this.cb_4)
destroy(this.rb_by_agente)
destroy(this.rb_agente)
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_4 from commandbutton within w_despliegue_transacciones_detalle_cc
integer x = 1129
integer y = 2080
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

type rb_by_agente from radiobutton within w_despliegue_transacciones_detalle_cc
integer x = 379
integer y = 2080
integer width = 343
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "By Agent"
end type

event clicked;dw_1.dataobject='dw_despliegue_invoices_pagados_agente_me'	
dw_1.settransobject(SQLCA)
dw_1.retrieve(id_reference) 





end event

type rb_agente from radiobutton within w_despliegue_transacciones_detalle_cc
integer x = 110
integer y = 2080
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agent"
end type

event clicked;dw_1.dataobject='dw_despliegue_transsacciones_esp_agente'	

dw_1.settransobject(SQLCA)


dw_1.retrieve(id_reference) 





end event

type cb_print from commandbutton within w_despliegue_transacciones_detalle_cc
integer x = 809
integer y = 2080
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

type cb_1 from commandbutton within w_despliegue_transacciones_detalle_cc
integer x = 1449
integer y = 2080
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

type dw_1 from u_dw within w_despliegue_transacciones_detalle_cc
integer width = 3634
integer height = 2032
integer taborder = 10
string dataobject = "dw_despliegue_transsacciones_esp_agentec"
boolean hscrollbar = true
end type

event clicked;return 0
end event

type gb_1 from groupbox within w_despliegue_transacciones_detalle_cc
integer x = 64
integer y = 2028
integer width = 690
integer height = 140
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Report"
end type

