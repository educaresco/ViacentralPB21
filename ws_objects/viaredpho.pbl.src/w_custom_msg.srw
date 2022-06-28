$PBExportHeader$w_custom_msg.srw
forward
global type w_custom_msg from window
end type
type st_4_2 from statictext within w_custom_msg
end type
type st_4_1 from statictext within w_custom_msg
end type
type st_3_2 from statictext within w_custom_msg
end type
type st_3_1 from statictext within w_custom_msg
end type
type st_2_2 from statictext within w_custom_msg
end type
type st_1_2 from statictext within w_custom_msg
end type
type cb_ok from commandbutton within w_custom_msg
end type
type st_2_1 from statictext within w_custom_msg
end type
type st_1_1 from statictext within w_custom_msg
end type
type st_1 from statictext within w_custom_msg
end type
type st_2 from statictext within w_custom_msg
end type
type gb_1 from groupbox within w_custom_msg
end type
type p_pic1 from picture within w_custom_msg
end type
type p_pic2 from picture within w_custom_msg
end type
end forward

global type w_custom_msg from window
integer width = 2167
integer height = 720
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_4_2 st_4_2
st_4_1 st_4_1
st_3_2 st_3_2
st_3_1 st_3_1
st_2_2 st_2_2
st_1_2 st_1_2
cb_ok cb_ok
st_2_1 st_2_1
st_1_1 st_1_1
st_1 st_1
st_2 st_2
gb_1 gb_1
p_pic1 p_pic1
p_pic2 p_pic2
end type
global w_custom_msg w_custom_msg

on w_custom_msg.create
this.st_4_2=create st_4_2
this.st_4_1=create st_4_1
this.st_3_2=create st_3_2
this.st_3_1=create st_3_1
this.st_2_2=create st_2_2
this.st_1_2=create st_1_2
this.cb_ok=create cb_ok
this.st_2_1=create st_2_1
this.st_1_1=create st_1_1
this.st_1=create st_1
this.st_2=create st_2
this.gb_1=create gb_1
this.p_pic1=create p_pic1
this.p_pic2=create p_pic2
this.Control[]={this.st_4_2,&
this.st_4_1,&
this.st_3_2,&
this.st_3_1,&
this.st_2_2,&
this.st_1_2,&
this.cb_ok,&
this.st_2_1,&
this.st_1_1,&
this.st_1,&
this.st_2,&
this.gb_1,&
this.p_pic1,&
this.p_pic2}
end on

on w_custom_msg.destroy
destroy(this.st_4_2)
destroy(this.st_4_1)
destroy(this.st_3_2)
destroy(this.st_3_1)
destroy(this.st_2_2)
destroy(this.st_1_2)
destroy(this.cb_ok)
destroy(this.st_2_1)
destroy(this.st_1_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.gb_1)
destroy(this.p_pic1)
destroy(this.p_pic2)
end on

event open;//integer li_msg
//
//li_msg = integer(message.stringparm)
//
//st_1_1.visible = false
//st_1_2.visible = false
//st_2_1.visible = false
//st_2_2.visible = false
//st_3_1.visible = false
//st_3_2.visible = false
//st_4_1.visible = false
//st_4_2.visible = false		
//st_5_1.visible = false
//st_5_2.visible = false	
//p_pic1.visible = true
//p_pic2.visible = false
//
//this.title = "Warning - [Msg " + string(li_msg) + "]"
//
//choose case li_msg 
//	case 1
//		st_1_1.visible = true
//		st_1_2.visible = true
//	case 2
//		st_2_1.visible = true
//		st_2_2.visible = true
//	case 3
//		st_3_1.visible = true
//		st_3_2.visible = true
//	case 4
//		st_4_1.visible = true
//		st_4_2.visible = true	
//		p_pic2.visible = true
//		this.title = "Stop - [Msg " + string(li_msg) + "]"		
//	case 5
//		st_5_1.visible = true
//		st_5_2.visible = true		
//		p_pic2.visible = true
//		this.title = "Stop - [Msg " + string(li_msg) + "]"				
//end choose


integer li_msg

li_msg = integer(message.stringparm)

//st_1_1.visible = false
//st_1_2.visible = false
//st_2_1.visible = false
//st_2_2.visible = false
//st_3_1.visible = false
//st_3_2.visible = false
//st_4_1.visible = false
//st_4_2.visible = false		
//st_5_1.visible = false
//st_5_2.visible = false	
//st_6_1.visible = false
//st_6_2.visible = false	

p_pic1.visible = true
p_pic2.visible = false

this.title = "Warning - [Msg " + string(li_msg) + "]"

//if fn_getlang() = 'EN' then 

//	choose case li_msg 
//		case 1
//			st_1.text = "Based on the transactions made by the sender in one day, we need to obtain a copy of the identification of the sender."
//			st_2.text = "Please send via fax to the Compliance Department a copy of the identification of the sender. FAX: 1-800-490-8147"                              
//		case 2
//		  st_1.text = "Based on the transactions made by the sender in one day, we need to obtain a copy of two (2) identifications from the sender and the ~"Know your Customer~" Form. "
//		  st_2.text = "Please send via fax to the Compliance Department a copy of the two (2) identifications from the sender and the ~"Know Your Customer~" form. FAX: 1-800-490-8147."
//		case 3
//			st_1.text = "Based on the transactions made by the sender in the last 30 days, we need to obtain a copy of the identification of the sender."
//			st_2.text = "Please send via fax to the Compliance Department a copy of the identification of the sender. FAX:1-800-490-8147"                               
//		case 4
//			st_1.text = "The amount of this transaction is over the maximum amount permitted to be conducted from your agency. This transaction must be conducted directly by Viamericas' Call Center via Special Services' procedure."
//			st_2.text = "Please contact Viamericas' Call Center to obtain more information at 1-800-401-7626"                            
//			p_pic2.visible = true
//			this.title = "Stop - [Msg " + string(li_msg) + "]"		
//		case 5
//			st_1.text = "The overall amount of transactions sent by this sender in the last 30 days is over the maximum amount permitted to be conducted from your agency. This transaction must be conducted directly by Viamericas' Call Center via Special Services' procedure. "
//			st_2.text = "Please contact Viamericas' Call Center to obtain more information at 1-800-401-7626"                            
//			p_pic2.visible = true
//			this.title = "Stop - [Msg " + string(li_msg) + "]"				
//		case 6
//			st_1.text = "The overall amount of transactions sent to this beneficiary in the last 30 days is over the maximum amount permitted to be conducted from your agency. This transaction must be conducted directly by Viamericas' Call Center via Special Services' procedure."
//			st_2.text = "Please contact Viamericas' Call Center to obtain more information at 1-800-401-7626"
//			p_pic2.visible = true
//			this.title = "Stop - [Msg " + string(li_msg) + "]"				
//		case 7
//			st_1.text = "Based on the transactions that the beneficiary has received in the last 30 days, we need to obtain a copy of two (2) identifications from the sender and the ~"Know your Customer~" form. "
//			st_2.text = "Please send via fax to the Compliance Department a copy of the two (2) identifications from the sender and the ~"Know Your Customer~" form. FAX: 1-800-490-8147."
//		case 8
//			st_1.text = "Based on the transactions that the beneficiary has received in one day, we need to obtain a copy of two (2) identifications from the sender and the ~"Know your Customer~" Form. "
//			st_2.text = "Please send via fax to the Compliance Department a copy of the two (2) identifications from the sender and the ~"Know Your Customer~" form. FAX: 1-800-490-8147."
//		case 9
//			st_1.text = "Based on the transactions made by the sender in the last 30 days, we need to obtain a copy of two (2) identifications from the sender and the ~"Know your Customer~" form. "
//			st_2.text = "Please send via fax to the Compliance Department a copy of the two (2) identifications from the sender and the ~"Know Your Customer~" form. FAX: 1-800-490-8147."
//		case 10
//			st_1.text = "Based on the transactions that the beneficiary has received in the last 30 days, we need to obtain a copy of the identification of the sender."
//			st_2.text = "Please send via fax to the Compliance Department a copy of the identification of the sender. FAX:1-800-490-8147"                               		
//				
//	end choose

//else
//	
	choose case li_msg 
		case 1
			st_1.text = "De acuerdo a las órdenes que el remitente ha realizado en un día, es necesario obtener una (1) copia de la identificación del remitente."
			st_2.text = "Favor enviar por fax al Dept. de Cumplimiento Legal una (1) copia de la identificación del remitente. FAX: 1-800-490-8147"		
		case 2
			st_1.text = "De acuerdo a las órdenes que el remitente ha realizado en un día, es necesario obtener copia de dos (2) identificaciones del remitente y completar el formulario ~"Conozca a su Cliente~". "
			st_2.text = "Favor enviar por fax al Dept. de Cumplimiento Legal copia de dos (2) identificaciones del remitente y la forma ~"Conozca a su Cliente~"."
		case 3
			st_1.text = "De acuerdo a las órdenes que el remitente ha realizado los últimos 30 días, es necesario obtener una (1) copia de la identificación del remitente."
			st_2.text = "Favor enviar por fax al Dept. de Cumplimiento Legal una (1) copia de la identificación del remitente. FAX:1-800-490-8147"		
		case 4
			st_1.text = "El valor de esta orden supera el monto máximo permitido de envío a través de su agencia. Esta orden debe ser realizada directamente por la Central de Viamericas mediante el procedimiento de Servicios Especiales."
			st_2.text = "Por favor contacte el Servicio al Cliente de Viamericas para obtener la información correspondiente 1-800-401-7626"		
			p_pic2.visible = true
			this.title = "Stop - [Msg " + string(li_msg) + "]"		
		case 5
			st_1.text = "El monto acumulado enviado por el remitente en los últimos 30 días supera el monto máximo permitido de envío a través de su agencia. Esta orden debe ser realizada directamente por la Central de Viamericas mediante el procedimiento de Servicios Especiales"
			st_2.text = "Por favor contacte el Servicio al Cliente de Viamericas para obtener la información correspondiente 1-800-401-7626"		
			p_pic2.visible = true
			this.title = "Stop - [Msg " + string(li_msg) + "]"				
		case 6
			st_1.text = "El monto acumulado recibido por el beneficiario en los últimos 30 días supera el monto máximo permitido de envío a través de su agencia. Esta orden debe ser realizada directamente por la Central de Viamericas mediante un Servicio Especial"
			st_2.text = "Por favor contacte el Servicio al Cliente de Viamericas para obtener la información correspondiente 1-800-401-7626"
			p_pic2.visible = true
			this.title = "Stop - [Msg " + string(li_msg) + "]"				
		case 7
			st_1.text = "De acuerdo a las órdenes que el beneficiario ha recibido en los últimos 30 días, es necesario obtener copia de dos (2) identificaciones del remitente y completar el formulario ~"Conozca a su Cliente~". "
			st_2.text = "Favor enviar por fax al Dept. de Cumplimiento Legal copia de dos (2) identificaciones del remitente y la forma ~"Conozca a su Cliente~"."		
		case 8
			st_1.text = "De acuerdo a las órdenes que el beneficiario ha recibido en un día, es necesario obtener copia de dos (2) identificaciones del remitente y completar el formulario ~"Conozca a su Cliente~". "
			st_2.text = "Favor enviar por fax al Dept. de Cumplimiento Legal copia de dos (2) identificaciones del remitente y la forma ~"Conozca a su Cliente~"."
		case 9
			st_1.text = "De acuerdo a las órdenes que el remitente ha realizado los últimos 30 días, es necesario obtener copia de dos (2) identificaciones del remitente y completar el formulario ~"Conozca a su Cliente~". "
			st_2.text = "Favor enviar por fax al Dept. de Cumplimiento Legal copia de dos (2) identificaciones del remitente y la forma ~"Conozca a su Cliente~"."
		case 10
			st_1.text = "De acuerdo a las órdenes que el beneficiario ha recibido en los últimos 30 días, es necesario obtener una (1) copia de la identificación del remitente."
			st_2.text = "Favor enviar por fax al Dept. de Cumplimiento Legal una (1) copia de la identificación del remitente. FAX:1-800-490-8147"		

		case 11
			st_1.text = "De acuerdo a las leyes del estado donde esta la agencia, es necesario obtener copia de dos (2) identificaciones del remitente y completar el formulario ~"Conozca a su Cliente~". "
			st_2.text = "Favor enviar por fax al Dept. de Cumplimiento Legal copia de dos (2) identificaciones del remitente y la forma ~"Conozca a su Cliente~"."		
				
	end choose
//
//end if
end event

type st_4_2 from statictext within w_custom_msg
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

type st_4_1 from statictext within w_custom_msg
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

type st_3_2 from statictext within w_custom_msg
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

type st_3_1 from statictext within w_custom_msg
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

type st_2_2 from statictext within w_custom_msg
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

type st_1_2 from statictext within w_custom_msg
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

type cb_ok from commandbutton within w_custom_msg
integer x = 1824
integer y = 364
integer width = 302
integer height = 236
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
boolean default = true
end type

event clicked;Close(parent)
end event

type st_2_1 from statictext within w_custom_msg
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

type st_1_1 from statictext within w_custom_msg
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

type st_1 from statictext within w_custom_msg
integer x = 59
integer y = 60
integer width = 1696
integer height = 264
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "El monto acumulado enviado por el remitente en los últimos 30 días supera el monto máximo permitido de envío a través de su agencia. Esta orden debe ser realizada directamente por la Central de Viamericas mediante el procedimiento de Servicios Especiales"
boolean focusrectangle = false
end type

type st_2 from statictext within w_custom_msg
integer x = 59
integer y = 352
integer width = 1696
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

type gb_1 from groupbox within w_custom_msg
integer x = 27
integer width = 1765
integer height = 600
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type p_pic1 from picture within w_custom_msg
integer x = 1829
integer y = 32
integer width = 293
integer height = 256
boolean originalsize = true
string picturename = "C:\ViamericasMT\Graphics\msg1.bmp"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
boolean map3dcolors = true
end type

type p_pic2 from picture within w_custom_msg
integer x = 1829
integer y = 32
integer width = 293
integer height = 256
boolean originalsize = true
string picturename = "C:\ViamericasMT\Graphics\msg2.bmp"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
boolean map3dcolors = true
end type

