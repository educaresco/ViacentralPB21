$PBExportHeader$w_cambiar_rate_agente.srw
forward
global type w_cambiar_rate_agente from wb_response
end type
type st_1 from statictext within w_cambiar_rate_agente
end type
type em_1 from editmask within w_cambiar_rate_agente
end type
type cb_1 from commandbutton within w_cambiar_rate_agente
end type
type cb_cancel from commandbutton within w_cambiar_rate_agente
end type
end forward

global type w_cambiar_rate_agente from wb_response
int X=1097
int Y=728
int Width=878
int Height=432
boolean TitleBar=true
string Title="Change Rate"
long BackColor=80269524
boolean ControlMenu=false
st_1 st_1
em_1 em_1
cb_1 cb_1
cb_cancel cb_cancel
end type
global w_cambiar_rate_agente w_cambiar_rate_agente

on w_cambiar_rate_agente.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.cb_1=create cb_1
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_cancel
end on

on w_cambiar_rate_agente.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cb_1)
destroy(this.cb_cancel)
end on

type st_1 from statictext within w_cambiar_rate_agente
int X=32
int Y=80
int Width=283
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="New Rate :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_1 from editmask within w_cambiar_rate_agente
int X=334
int Y=64
int Width=457
int Height=100
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_cambiar_rate_agente
int X=32
int Y=196
int Width=398
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="Apply"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Closewithreturn(w_cambiar_rate_agente,Double(em_1.text))
end event

type cb_cancel from commandbutton within w_cambiar_rate_agente
int X=439
int Y=196
int Width=398
int Height=108
int TabOrder=30
boolean BringToTop=true
string Text="Cancel"
boolean Cancel=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Closewithreturn(w_cambiar_rate_agente,0)
end event

