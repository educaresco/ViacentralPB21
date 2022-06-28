$PBExportHeader$w_rep_control_transmition_one.srw
forward
global type w_rep_control_transmition_one from wb_report_fechas
end type
type gb_1 from groupbox within w_rep_control_transmition_one
end type
type rb_1 from radiobutton within w_rep_control_transmition_one
end type
type rb_2 from radiobutton within w_rep_control_transmition_one
end type
type st_2454 from statictext within w_rep_control_transmition_one
end type
type sle_1 from singlelineedit within w_rep_control_transmition_one
end type
end forward

global type w_rep_control_transmition_one from wb_report_fechas
int Width=3072
int Height=1960
gb_1 gb_1
rb_1 rb_1
rb_2 rb_2
st_2454 st_2454
sle_1 sle_1
end type
global w_rep_control_transmition_one w_rep_control_transmition_one

on w_rep_control_transmition_one.create
int iCurrent
call super::create
this.gb_1=create gb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_2454=create st_2454
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_1
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.st_2454
this.Control[iCurrent+5]=this.sle_1
end on

on w_rep_control_transmition_one.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.gb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_2454)
destroy(this.sle_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_control_transmition_one
int Y=208
int Width=2999
int TabOrder=60
boolean BringToTop=true
string DataObject="dw_rep_control_transmition_allf1"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_control_transmition_one
int X=1102
int TabOrder=40
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_control_transmition_one
int X=736
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_control_transmition_one
int Width=320
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_control_transmition_one
int X=1819
int TabOrder=50
boolean BringToTop=true
end type

event em_fecha2::modified;//Date		ld_fecha1, ld_fecha2
//
//Setpointer(Hourglass!)
//
//ld_fecha1 = Date(em_fecha1.text)
//
//ld_fecha2 = Date(em_fecha2.text)
//
//dw_1.retrieve(ld_Fecha1,ld_Fecha2)
//dw_1.setfocus()
//
//
//Setpointer(Hourglass!)
//
//
//Setpointer(Arrow!)
end event

type gb_1 from groupbox within w_rep_control_transmition_one
int X=32
int Y=8
int Width=690
int Height=188
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_1 from radiobutton within w_rep_control_transmition_one
int X=133
int Y=44
int Width=475
int Height=76
int TabOrder=20
boolean BringToTop=true
string Text="Invoice Date"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
boolean RightToLeft=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.dataobject = 'dw_rep_control_transmition_allf1'

dw_1.settransobject(sqlca)
end event

type rb_2 from radiobutton within w_rep_control_transmition_one
int X=133
int Y=104
int Width=485
int Height=76
int TabOrder=30
boolean BringToTop=true
string Text="Trasmittion Date"
BorderStyle BorderStyle=StyleLowered!
boolean RightToLeft=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.dataobject = 'dw_rep_control_transmition_allftx1'

dw_1.settransobject(sqlca)
end event

type st_2454 from statictext within w_rep_control_transmition_one
int X=2199
int Y=36
int Width=247
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Payee :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_1 from singlelineedit within w_rep_control_transmition_one
int X=2450
int Y=28
int Width=343
int Height=100
int TabOrder=60
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,sle_1.text)
dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

