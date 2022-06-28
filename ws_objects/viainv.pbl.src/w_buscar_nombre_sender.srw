$PBExportHeader$w_buscar_nombre_sender.srw
forward
global type w_buscar_nombre_sender from wb_response
end type
type st_2 from statictext within w_buscar_nombre_sender
end type
type em_phone from editmask within w_buscar_nombre_sender
end type
type rb_2 from radiobutton within w_buscar_nombre_sender
end type
type cb_2 from commandbutton within w_buscar_nombre_sender
end type
type dw_1 from datawindow within w_buscar_nombre_sender
end type
type sle_nombre from singlelineedit within w_buscar_nombre_sender
end type
type st_label from statictext within w_buscar_nombre_sender
end type
type cb_1 from commandbutton within w_buscar_nombre_sender
end type
type cb_cerrar from commandbutton within w_buscar_nombre_sender
end type
type rb_tel_sender from radiobutton within w_buscar_nombre_sender
end type
type rb_sender from radiobutton within w_buscar_nombre_sender
end type
type gb_1 from groupbox within w_buscar_nombre_sender
end type
end forward

global type w_buscar_nombre_sender from wb_response
integer x = 626
integer y = 540
integer width = 2926
integer height = 1732
string title = "Consulta por el Nombre del Sender"
st_2 st_2
em_phone em_phone
rb_2 rb_2
cb_2 cb_2
dw_1 dw_1
sle_nombre sle_nombre
st_label st_label
cb_1 cb_1
cb_cerrar cb_cerrar
rb_tel_sender rb_tel_sender
rb_sender rb_sender
gb_1 gb_1
end type
global w_buscar_nombre_sender w_buscar_nombre_sender

on w_buscar_nombre_sender.create
int iCurrent
call super::create
this.st_2=create st_2
this.em_phone=create em_phone
this.rb_2=create rb_2
this.cb_2=create cb_2
this.dw_1=create dw_1
this.sle_nombre=create sle_nombre
this.st_label=create st_label
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.rb_tel_sender=create rb_tel_sender
this.rb_sender=create rb_sender
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.em_phone
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.sle_nombre
this.Control[iCurrent+7]=this.st_label
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_cerrar
this.Control[iCurrent+10]=this.rb_tel_sender
this.Control[iCurrent+11]=this.rb_sender
this.Control[iCurrent+12]=this.gb_1
end on

on w_buscar_nombre_sender.destroy
call super::destroy
destroy(this.st_2)
destroy(this.em_phone)
destroy(this.rb_2)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.sle_nombre)
destroy(this.st_label)
destroy(this.cb_1)
destroy(this.cb_cerrar)
destroy(this.rb_tel_sender)
destroy(this.rb_sender)
destroy(this.gb_1)
end on

event open;call super::open;
rb_tel_sender.Checked = true
rb_tel_sender.triggerevent(clicked!)

////dw_1.settransobject(SQLCA)
//dw_1.settransobject(SQLCArpt)
//
//rb_tel_sender.Checked = TRUE
//
//sle_nombre.setfocus()
end event

type st_2 from statictext within w_buscar_nombre_sender
integer x = 55
integer y = 1540
integer width = 1957
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 255
long backcolor = 67108864
string text = "Esta consulta puede no mostrar los remitentes/beneficiarios recientes (ultimos 10 min)"
boolean focusrectangle = false
end type

type em_phone from editmask within w_buscar_nombre_sender
integer x = 622
integer y = 256
integer width = 475
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "(###) ###-####"
end type

type rb_2 from radiobutton within w_buscar_nombre_sender
integer x = 933
integer y = 136
integer width = 1010
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Por Nombre del Beneficiario"
end type

event clicked;

st_label.text = "Nombre Beneficiario:"
em_phone.visible = false
sle_nombre.visible = true

dw_1.dataobject='dw_consulta_nombre_receiver'	
dw_1.settransobject(SQLCArpt)

sle_nombre.setfocus()
end event

type cb_2 from commandbutton within w_buscar_nombre_sender
integer x = 1495
integer y = 256
integer width = 343
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Buscar"
end type

event clicked;string	ls_nombre 
double ld_phone


if rb_sender.checked = TRUE then

	// Sender Name
	If sle_nombre.text = "" then return
	ls_nombre = "%"+sle_nombre.text+"%"
	dw_1.retrieve('N',ls_nombre,0)


elseif rb_tel_sender.checked = TRUE then
	
	// Sender Phone
	em_phone.getdata(ld_phone)
	if ld_phone = 0 or isnull(ld_phone) then  return
	dw_1.retrieve('T',"",ld_phone)


else
	// Receiver Name
	
	If sle_nombre.text = "" then return
	ls_nombre = "%"+sle_nombre.text+"%"
	dw_1.retrieve(ls_nombre)
	
end if

end event

type dw_1 from datawindow within w_buscar_nombre_sender
integer x = 41
integer y = 424
integer width = 2821
integer height = 1068
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_busca_nombre_sender"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
end if

end event

event doubleclicked;cb_1.triggerevent(clicked!)
end event

type sle_nombre from singlelineedit within w_buscar_nombre_sender
integer x = 622
integer y = 256
integer width = 850
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_label from statictext within w_buscar_nombre_sender
integer x = 82
integer y = 260
integer width = 521
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Nombre del Remitente:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_buscar_nombre_sender
integer x = 2043
integer y = 1524
integer width = 393
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Seleccionar"
boolean default = true
end type

event clicked;long		ll_row
double	ld_receiver

ll_row = dw_1.GetSelectedRow(0)
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if


gs_branch_consulta =  dw_1.getitemstring(ll_row,"receiver_id_branch")
ld_receiver = dw_1.getitemnumber(ll_row,"receiver_id_receiver")

closewithreturn(w_buscar_nombre_sender,ld_receiver)
end event

type cb_cerrar from commandbutton within w_buscar_nombre_sender
integer x = 2469
integer y = 1524
integer width = 393
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cerrar"
boolean cancel = true
end type

event clicked;closewithreturn(w_buscar_nombre_sender,-5)
end event

type rb_tel_sender from radiobutton within w_buscar_nombre_sender
integer x = 82
integer y = 44
integer width = 1554
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Por Telefono Remitente (BUSQUEDA MAS RAPIDA)"
boolean checked = true
end type

event clicked;

st_label.text = "Telefono Remitente:"
em_phone.visible = true
sle_nombre.visible = false

dw_1.dataobject='dw_busca_nombre_sender'	
dw_1.settransobject(SQLCArpt)


em_phone.setfocus()
end event

type rb_sender from radiobutton within w_buscar_nombre_sender
integer x = 82
integer y = 136
integer width = 809
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Por Nombre Remitente"
end type

event clicked;

st_label.text = "Nombre Remitente:"
em_phone.visible = false
sle_nombre.visible = true

dw_1.dataobject='dw_busca_nombre_sender'	
dw_1.settransobject(SQLCArpt)

sle_nombre.setfocus()
end event

type gb_1 from groupbox within w_buscar_nombre_sender
integer x = 41
integer width = 2816
integer height = 388
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

