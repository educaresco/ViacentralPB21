$PBExportHeader$w_report_setup_gloria.srw
forward
global type w_report_setup_gloria from w_response
end type
type sle_1 from singlelineedit within w_report_setup_gloria
end type
type st_101 from statictext within w_report_setup_gloria
end type
type cb_print from commandbutton within w_report_setup_gloria
end type
type cb_cancel from commandbutton within w_report_setup_gloria
end type
type dw_1 from datawindow within w_report_setup_gloria
end type
end forward

global type w_report_setup_gloria from w_response
int X=590
int Y=864
int Width=1664
int Height=404
boolean TitleBar=true
string Title="Report Setup"
boolean ControlMenu=false
sle_1 sle_1
st_101 st_101
cb_print cb_print
cb_cancel cb_cancel
dw_1 dw_1
end type
global w_report_setup_gloria w_report_setup_gloria

on w_report_setup_gloria.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_101=create st_101
this.cb_print=create cb_print
this.cb_cancel=create cb_cancel
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_101
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.dw_1
end on

on w_report_setup_gloria.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.st_101)
destroy(this.cb_print)
destroy(this.cb_cancel)
destroy(this.dw_1)
end on

type sle_1 from singlelineedit within w_report_setup_gloria
int X=366
int Y=20
int Width=1248
int Height=92
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_101 from statictext within w_report_setup_gloria
int X=32
int Y=36
int Width=320
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Report Name :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_print from commandbutton within w_report_setup_gloria
int X=914
int Y=168
int Width=343
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="Print"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//Message.StringParm=sle_1.text

CloseWithReturn(Parent,sle_1.text)
end event

type cb_cancel from commandbutton within w_report_setup_gloria
int X=1271
int Y=168
int Width=343
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

event clicked;CloseWithReturn(Parent,'-1')
end event

type dw_1 from datawindow within w_report_setup_gloria
int X=389
int Y=172
int Width=494
int Height=360
int TabOrder=40
boolean Visible=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

