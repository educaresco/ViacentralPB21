$PBExportHeader$w_change_rate.srw
forward
global type w_change_rate from Window
end type
type em_1 from editmask within w_change_rate
end type
type cb_close from commandbutton within w_change_rate
end type
type cb_select from commandbutton within w_change_rate
end type
end forward

global type w_change_rate from Window
int X=1134
int Y=904
int Width=933
int Height=352
boolean TitleBar=true
string Title="Change Rate"
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
em_1 em_1
cb_close cb_close
cb_select cb_select
end type
global w_change_rate w_change_rate

type variables
string is_mod_currency, is_branch, is_country, is_branch_pay


Double	id_amount, id_receiver
end variables

on w_change_rate.create
this.em_1=create em_1
this.cb_close=create cb_close
this.cb_select=create cb_select
this.Control[]={this.em_1,&
this.cb_close,&
this.cb_select}
end on

on w_change_rate.destroy
destroy(this.em_1)
destroy(this.cb_close)
destroy(this.cb_select)
end on

type em_1 from editmask within w_change_rate
int X=224
int Y=12
int Width=443
int Height=100
int TabOrder=10
TextCase TextCase=Upper!
Alignment Alignment=Center!
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

type cb_close from commandbutton within w_change_rate
int X=475
int Y=156
int Width=402
int Height=80
int TabOrder=30
string Text="&Close"
boolean Cancel=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Closewithreturn(w_change_rate,0)
end event

type cb_select from commandbutton within w_change_rate
int X=37
int Y=156
int Width=402
int Height=80
int TabOrder=20
string Text="&Change Rate"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_rate

ld_rate = Double(em_1.text)

if ld_rate <= 0 then
	closewithreturn(w_change_rate,0)
else
	closewithreturn(w_change_rate,ld_rate)
end if

end event

