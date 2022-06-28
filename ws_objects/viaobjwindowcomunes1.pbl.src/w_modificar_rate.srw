$PBExportHeader$w_modificar_rate.srw
forward
global type w_modificar_rate from wb_response
end type
type st_1 from statictext within w_modificar_rate
end type
type em_1 from editmask within w_modificar_rate
end type
type cb_1 from commandbutton within w_modificar_rate
end type
type cb_cancel from commandbutton within w_modificar_rate
end type
type st_3 from statictext within w_modificar_rate
end type
type em_anterior from editmask within w_modificar_rate
end type
end forward

global type w_modificar_rate from wb_response
int X=1097
int Y=728
int Width=878
int Height=508
boolean TitleBar=true
string Title="Change Rate"
long BackColor=80269524
boolean ControlMenu=false
st_1 st_1
em_1 em_1
cb_1 cb_1
cb_cancel cb_cancel
st_3 st_3
em_anterior em_anterior
end type
global w_modificar_rate w_modificar_rate

on w_modificar_rate.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.cb_1=create cb_1
this.cb_cancel=create cb_cancel
this.st_3=create st_3
this.em_anterior=create em_anterior
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.em_anterior
end on

on w_modificar_rate.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cb_1)
destroy(this.cb_cancel)
destroy(this.st_3)
destroy(this.em_anterior)
end on

event open;call super::open;em_anterior.text = string(message.doubleparm)
end event

type st_1 from statictext within w_modificar_rate
int X=87
int Y=176
int Width=311
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="New Rate :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-7
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_1 from editmask within w_modificar_rate
int X=425
int Y=160
int Width=361
int Height=100
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
int TextSize=-7
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_modificar_rate
int X=27
int Y=292
int Width=398
int Height=80
int TabOrder=20
boolean BringToTop=true
string Text="Apply"
boolean Default=true
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Closewithreturn(w_modificar_rate,Double(em_1.text))
end event

type cb_cancel from commandbutton within w_modificar_rate
int X=434
int Y=292
int Width=398
int Height=80
int TabOrder=30
boolean BringToTop=true
string Text="Cancel"
boolean Cancel=true
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Closewithreturn(w_modificar_rate,0)
end event

type st_3 from statictext within w_modificar_rate
int X=87
int Y=68
int Width=311
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Actual Rate :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-7
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_anterior from editmask within w_modificar_rate
int X=425
int Y=52
int Width=361
int Height=100
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
long BackColor=12632256
int TextSize=-7
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

