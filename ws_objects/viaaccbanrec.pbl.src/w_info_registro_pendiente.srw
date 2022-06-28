$PBExportHeader$w_info_registro_pendiente.srw
forward
global type w_info_registro_pendiente from w_popup
end type
type st_informacion from statictext within w_info_registro_pendiente
end type
end forward

global type w_info_registro_pendiente from w_popup
integer x = 800
integer y = 1300
integer width = 965
integer height = 268
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
long backcolor = 15793151
st_informacion st_informacion
end type
global w_info_registro_pendiente w_info_registro_pendiente

on w_info_registro_pendiente.create
int iCurrent
call super::create
this.st_informacion=create st_informacion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_informacion
end on

on w_info_registro_pendiente.destroy
call super::destroy
destroy(this.st_informacion)
end on

event open;call super::open;st_informacion.Text= message.Stringparm
end event

type st_informacion from statictext within w_info_registro_pendiente
integer x = 18
integer y = 8
integer width = 864
integer height = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "N/A"
boolean focusrectangle = false
end type

event clicked;close(parent)

//
end event

