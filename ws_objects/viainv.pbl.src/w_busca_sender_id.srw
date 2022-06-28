$PBExportHeader$w_busca_sender_id.srw
forward
global type w_busca_sender_id from wb_response
end type
type em_1 from editmask within w_busca_sender_id
end type
type st_1 from statictext within w_busca_sender_id
end type
type cb_1 from commandbutton within w_busca_sender_id
end type
type cb_close from commandbutton within w_busca_sender_id
end type
end forward

global type w_busca_sender_id from wb_response
int X=1042
int Y=820
int Width=1015
int Height=424
boolean TitleBar=true
string Title="Sender ID"
em_1 em_1
st_1 st_1
cb_1 cb_1
cb_close cb_close
end type
global w_busca_sender_id w_busca_sender_id

on w_busca_sender_id.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_close
end on

on w_busca_sender_id.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_close)
end on

type em_1 from editmask within w_busca_sender_id
int X=370
int Y=48
int Width=485
int Height=100
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="##########"
boolean Spin=true
string MinMax="1~~999999"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_busca_sender_id
int X=69
int Y=68
int Width=279
int Height=68
boolean Enabled=false
boolean BringToTop=true
string Text="Sender ID :"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_busca_sender_id
int X=105
int Y=212
int Width=274
int Height=96
int TabOrder=20
boolean BringToTop=true
string Text="&Accept"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;double	ld_sender


ld_sender = double(em_1.text)

closewithreturn(w_busca_sender_id,ld_sender)
end event

type cb_close from commandbutton within w_busca_sender_id
int X=567
int Y=212
int Width=274
int Height=96
int TabOrder=30
boolean BringToTop=true
string Text="&Close"
boolean Cancel=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(w_busca_sender_id)
end event

