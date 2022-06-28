$PBExportHeader$w_despliegue_transacciones_detalle.srw
forward
global type w_despliegue_transacciones_detalle from window
end type
type cb_4 from commandbutton within w_despliegue_transacciones_detalle
end type
type rb_by_agente from radiobutton within w_despliegue_transacciones_detalle
end type
type rb_corresponsal from radiobutton within w_despliegue_transacciones_detalle
end type
type rb_agente from radiobutton within w_despliegue_transacciones_detalle
end type
type cb_print from commandbutton within w_despliegue_transacciones_detalle
end type
type cb_1 from commandbutton within w_despliegue_transacciones_detalle
end type
type dw_1 from u_dw within w_despliegue_transacciones_detalle
end type
type gb_1 from groupbox within w_despliegue_transacciones_detalle
end type
end forward

global type w_despliegue_transacciones_detalle from window
boolean visible = false
integer x = 23
integer y = 12
integer width = 3616
integer height = 2384
boolean titlebar = true
string title = "Selecting Name"
boolean controlmenu = true
windowtype windowtype = response!
windowstate windowstate = maximized!
long backcolor = 80269524
cb_4 cb_4
rb_by_agente rb_by_agente
rb_corresponsal rb_corresponsal
rb_agente rb_agente
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_despliegue_transacciones_detalle w_despliegue_transacciones_detalle

type variables
Double  	id_reference
end variables

event open;X=1
Y=1
Show()

dw_1.settransobject(sqlca)
id_reference = Message.DoubleParm	

//dw_1.retrieve(id_reference) 

end event

on w_despliegue_transacciones_detalle.create
this.cb_4=create cb_4
this.rb_by_agente=create rb_by_agente
this.rb_corresponsal=create rb_corresponsal
this.rb_agente=create rb_agente
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.rb_by_agente,&
this.rb_corresponsal,&
this.rb_agente,&
this.cb_print,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_despliegue_transacciones_detalle.destroy
destroy(this.cb_4)
destroy(this.rb_by_agente)
destroy(this.rb_corresponsal)
destroy(this.rb_agente)
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_4 from commandbutton within w_despliegue_transacciones_detalle
integer x = 1673
integer y = 2184
integer width = 306
integer height = 72
integer taborder = 20
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

type rb_by_agente from radiobutton within w_despliegue_transacciones_detalle
integer x = 718
integer y = 2196
integer width = 343
integer height = 52
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

type rb_corresponsal from radiobutton within w_despliegue_transacciones_detalle
integer x = 160
integer y = 2196
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payee"
end type

event clicked;dw_1.dataobject='dw_despliegue_transsacciones_especifico'	

dw_1.settransobject(SQLCA)

dw_1.retrieve(id_reference) 



end event

type rb_agente from radiobutton within w_despliegue_transacciones_detalle
integer x = 448
integer y = 2196
integer width = 247
integer height = 52
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

type cb_print from commandbutton within w_despliegue_transacciones_detalle
integer x = 1353
integer y = 2184
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

type cb_1 from commandbutton within w_despliegue_transacciones_detalle
integer x = 1993
integer y = 2184
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

event clicked;Close(w_despliegue_transacciones_detalle)
end event

type dw_1 from u_dw within w_despliegue_transacciones_detalle
integer width = 3598
integer height = 2124
integer taborder = 10
string dataobject = "dw_despliegue_transsacciones_especifico"
boolean hscrollbar = true
end type

event clicked;return 0
end event

type gb_1 from groupbox within w_despliegue_transacciones_detalle
integer x = 64
integer y = 2136
integer width = 1074
integer height = 136
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

