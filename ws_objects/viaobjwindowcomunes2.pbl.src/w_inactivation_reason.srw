$PBExportHeader$w_inactivation_reason.srw
forward
global type w_inactivation_reason from window
end type
type st_1 from statictext within w_inactivation_reason
end type
type lst_reason from my_ddlb within w_inactivation_reason
end type
type st_4_2 from statictext within w_inactivation_reason
end type
type st_4_1 from statictext within w_inactivation_reason
end type
type st_3_2 from statictext within w_inactivation_reason
end type
type st_3_1 from statictext within w_inactivation_reason
end type
type st_2_2 from statictext within w_inactivation_reason
end type
type st_1_2 from statictext within w_inactivation_reason
end type
type cb_ok from commandbutton within w_inactivation_reason
end type
type st_2_1 from statictext within w_inactivation_reason
end type
type st_1_1 from statictext within w_inactivation_reason
end type
type gb_1 from groupbox within w_inactivation_reason
end type
end forward

global type w_inactivation_reason from window
integer width = 2167
integer height = 476
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
lst_reason lst_reason
st_4_2 st_4_2
st_4_1 st_4_1
st_3_2 st_3_2
st_3_1 st_3_1
st_2_2 st_2_2
st_1_2 st_1_2
cb_ok cb_ok
st_2_1 st_2_1
st_1_1 st_1_1
gb_1 gb_1
end type
global w_inactivation_reason w_inactivation_reason

on w_inactivation_reason.create
this.st_1=create st_1
this.lst_reason=create lst_reason
this.st_4_2=create st_4_2
this.st_4_1=create st_4_1
this.st_3_2=create st_3_2
this.st_3_1=create st_3_1
this.st_2_2=create st_2_2
this.st_1_2=create st_1_2
this.cb_ok=create cb_ok
this.st_2_1=create st_2_1
this.st_1_1=create st_1_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.lst_reason,&
this.st_4_2,&
this.st_4_1,&
this.st_3_2,&
this.st_3_1,&
this.st_2_2,&
this.st_1_2,&
this.cb_ok,&
this.st_2_1,&
this.st_1_1,&
this.gb_1}
end on

on w_inactivation_reason.destroy
destroy(this.st_1)
destroy(this.lst_reason)
destroy(this.st_4_2)
destroy(this.st_4_1)
destroy(this.st_3_2)
destroy(this.st_3_1)
destroy(this.st_2_2)
destroy(this.st_1_2)
destroy(this.cb_ok)
destroy(this.st_2_1)
destroy(this.st_1_1)
destroy(this.gb_1)
end on

event open;//w_branch_inactivation
end event

type st_1 from statictext within w_inactivation_reason
integer x = 59
integer y = 100
integer width = 489
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inactivation Reason:"
alignment alignment = center!
boolean focusrectangle = false
end type

type lst_reason from my_ddlb within w_inactivation_reason
integer x = 562
integer y = 92
integer width = 1518
integer height = 1504
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;lst_reason.addquery("select DESC_INACTIVATION_TYPE, ID_INACTIVATION_TYPE from dba.INACTIVATION_TYPES WHERE status = 'A'  order by DESC_INACTIVATION_TYPE;")
end event

type st_4_2 from statictext within w_inactivation_reason
boolean visible = false
integer x = 73
integer y = 368
integer width = 1673
integer height = 196
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por favor contacte el Servicio al Cliente de Viamericas para obtener la información correspondiente 1-800-401-7626"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4_1 from statictext within w_inactivation_reason
boolean visible = false
integer x = 59
integer y = 52
integer width = 1710
integer height = 300
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "El  valor de esta orden supera el monto máximo permitido de envío a través de su agencia. Esta orden debe ser realizada directamente por la Central de Viamericas mediante el procedimiento de Servicios Especiales."
boolean focusrectangle = false
end type

type st_3_2 from statictext within w_inactivation_reason
boolean visible = false
integer x = 73
integer y = 360
integer width = 1673
integer height = 196
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Favor enviar por fax al Dept. de Cumplimiento Legal una (1) copia de la identificación del remitente. FAX:1-800-490-8147"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3_1 from statictext within w_inactivation_reason
boolean visible = false
integer x = 73
integer y = 96
integer width = 1673
integer height = 220
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "De acuerdo a las órdenes que el remitente ha realizado los últimos 30 días, es necesario obtener una (1) copia de la identificación del remitente."
boolean focusrectangle = false
end type

type st_2_2 from statictext within w_inactivation_reason
boolean visible = false
integer x = 73
integer y = 368
integer width = 1673
integer height = 180
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Favor enviar por fax al Dept. de Cumplimiento Legal copia de dos (2) identificaciones del remitente y la forma ~"Conozca a su Cliente~"."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1_2 from statictext within w_inactivation_reason
boolean visible = false
integer x = 73
integer y = 360
integer width = 1673
integer height = 196
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Favor enviar por fax al Dept. de Cumplimiento Legal una (1) copia de la identificación del remitente. FAX: 1-800-490-8147"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_inactivation_reason
integer x = 1344
integer y = 268
integer width = 773
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
boolean default = true
end type

event clicked;CloseWithReturn(Parent, lst_reason.getdataid())
end event

type st_2_1 from statictext within w_inactivation_reason
boolean visible = false
integer x = 73
integer y = 64
integer width = 1673
integer height = 272
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "De acuerdo a las ordenes que el remitente ha realizado en un día, es necesario obtener copia dos (2) identificaciones del remitente y completar el formulario ~"Conozca a su Cliente~". "
boolean focusrectangle = false
end type

type st_1_1 from statictext within w_inactivation_reason
boolean visible = false
integer x = 73
integer y = 96
integer width = 1673
integer height = 220
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "De acuerdo a las órdenes que el remitente ha realizado en un día, es necesario obtener una (1) copia de la identificación del remitente."
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_inactivation_reason
integer x = 32
integer y = 4
integer width = 2085
integer height = 236
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

