$PBExportHeader$w_please_wait_rojo.srw
forward
global type w_please_wait_rojo from window
end type
type st_english_rojo from statictext within w_please_wait_rojo
end type
type st_spanish_rojo from statictext within w_please_wait_rojo
end type
end forward

global type w_please_wait_rojo from window
integer x = 800
integer y = 800
integer width = 1499
integer height = 468
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
st_english_rojo st_english_rojo
st_spanish_rojo st_spanish_rojo
end type
global w_please_wait_rojo w_please_wait_rojo

type variables
String		is_origin
end variables

on w_please_wait_rojo.create
this.st_english_rojo=create st_english_rojo
this.st_spanish_rojo=create st_spanish_rojo
this.Control[]={this.st_english_rojo,&
this.st_spanish_rojo}
end on

on w_please_wait_rojo.destroy
destroy(this.st_english_rojo)
destroy(this.st_spanish_rojo)
end on

type st_english_rojo from statictext within w_please_wait_rojo
integer x = 165
integer y = 156
integer width = 1079
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please wait...retrieving data!"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_spanish_rojo from statictext within w_please_wait_rojo
integer x = 165
integer y = 68
integer width = 1079
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por favor esperar...datos de recuperación!"
alignment alignment = center!
boolean focusrectangle = false
end type

