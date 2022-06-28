$PBExportHeader$w_please_wait.srw
forward
global type w_please_wait from window
end type
type st_english from statictext within w_please_wait
end type
type st_spanish from statictext within w_please_wait
end type
end forward

global type w_please_wait from window
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
st_english st_english
st_spanish st_spanish
end type
global w_please_wait w_please_wait

on w_please_wait.create
this.st_english=create st_english
this.st_spanish=create st_spanish
this.Control[]={this.st_english,&
this.st_spanish}
end on

on w_please_wait.destroy
destroy(this.st_english)
destroy(this.st_spanish)
end on

type st_english from statictext within w_please_wait
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
string text = "Loading payment points, please wait..."
boolean focusrectangle = false
end type

type st_spanish from statictext within w_please_wait
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
string text = "Cargando puntos de pago, por favor esperar..."
boolean focusrectangle = false
end type

