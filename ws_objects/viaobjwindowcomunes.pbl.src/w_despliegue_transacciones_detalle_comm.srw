$PBExportHeader$w_despliegue_transacciones_detalle_comm.srw
forward
global type w_despliegue_transacciones_detalle_comm from window
end type
type cb_4 from commandbutton within w_despliegue_transacciones_detalle_comm
end type
type st_1 from statictext within w_despliegue_transacciones_detalle_comm
end type
type rb_by_agente from radiobutton within w_despliegue_transacciones_detalle_comm
end type
type rb_agente from radiobutton within w_despliegue_transacciones_detalle_comm
end type
type cb_print from commandbutton within w_despliegue_transacciones_detalle_comm
end type
type cb_1 from commandbutton within w_despliegue_transacciones_detalle_comm
end type
type dw_1 from u_dw within w_despliegue_transacciones_detalle_comm
end type
type gb_1 from groupbox within w_despliegue_transacciones_detalle_comm
end type
end forward

global type w_despliegue_transacciones_detalle_comm from window
integer x = 37
integer y = 4
integer width = 3515
integer height = 2328
boolean titlebar = true
string title = "AGENT ACCOUNT"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_4 cb_4
st_1 st_1
rb_by_agente rb_by_agente
rb_agente rb_agente
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_despliegue_transacciones_detalle_comm w_despliegue_transacciones_detalle_comm

type variables
Double  	id_reference
end variables

event open;
dw_1.settransobject(sqlca)
id_reference = DOUBLE(Message.DoubleParm)

st_1.text = STRING(id_reference)

dw_1.retrieve(id_reference) 

end event

on w_despliegue_transacciones_detalle_comm.create
this.cb_4=create cb_4
this.st_1=create st_1
this.rb_by_agente=create rb_by_agente
this.rb_agente=create rb_agente
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.st_1,&
this.rb_by_agente,&
this.rb_agente,&
this.cb_print,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_despliegue_transacciones_detalle_comm.destroy
destroy(this.cb_4)
destroy(this.st_1)
destroy(this.rb_by_agente)
destroy(this.rb_agente)
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_4 from commandbutton within w_despliegue_transacciones_detalle_comm
integer x = 1129
integer y = 2088
integer width = 306
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Export"
boolean cancel = true
end type

event clicked;dw_1.saveas()
end event

type st_1 from statictext within w_despliegue_transacciones_detalle_comm
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

type rb_by_agente from radiobutton within w_despliegue_transacciones_detalle_comm
integer x = 379
integer y = 2088
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

type rb_agente from radiobutton within w_despliegue_transacciones_detalle_comm
integer x = 110
integer y = 2088
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

type cb_print from commandbutton within w_despliegue_transacciones_detalle_comm
integer x = 809
integer y = 2088
integer width = 306
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Print"
boolean cancel = true
end type

event clicked;Printsetup()
dw_1.print()
end event

type cb_1 from commandbutton within w_despliegue_transacciones_detalle_comm
integer x = 1449
integer y = 2088
integer width = 306
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(PARENT)
end event

type dw_1 from u_dw within w_despliegue_transacciones_detalle_comm
integer width = 3502
integer height = 2032
integer taborder = 10
string dataobject = "dw_despliegue_transacciones_agentecomm"
boolean hscrollbar = true
end type

event clicked;return 0
end event

type gb_1 from groupbox within w_despliegue_transacciones_detalle_comm
integer x = 64
integer y = 2036
integer width = 690
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

