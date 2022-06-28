$PBExportHeader$w_rep_control_transmition_allf.srw
forward
global type w_rep_control_transmition_allf from wb_report_fechas
end type
type gb_1 from groupbox within w_rep_control_transmition_allf
end type
type rb_1 from radiobutton within w_rep_control_transmition_allf
end type
type rb_2 from radiobutton within w_rep_control_transmition_allf
end type
end forward

global type w_rep_control_transmition_allf from wb_report_fechas
int Width=2917
int Height=1960
gb_1 gb_1
rb_1 rb_1
rb_2 rb_2
end type
global w_rep_control_transmition_allf w_rep_control_transmition_allf

on w_rep_control_transmition_allf.create
int iCurrent
call super::create
this.gb_1=create gb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_1
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
end on

on w_rep_control_transmition_allf.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.gb_1)
destroy(this.rb_1)
destroy(this.rb_2)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_control_transmition_allf
int Y=208
int Width=2853
int TabOrder=60
boolean BringToTop=true
string DataObject="dw_rep_control_transmition_allf"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_control_transmition_allf
int X=1513
int TabOrder=40
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_control_transmition_allf
int X=1147
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_control_transmition_allf
int X=2062
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_control_transmition_allf
int X=2427
int TabOrder=50
boolean BringToTop=true
end type

type gb_1 from groupbox within w_rep_control_transmition_allf
int X=251
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

type rb_1 from radiobutton within w_rep_control_transmition_allf
int X=352
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

event clicked;dw_1.dataobject = 'dw_rep_control_transmition_allf'

dw_1.settransobject(sqlca)
end event

type rb_2 from radiobutton within w_rep_control_transmition_allf
int X=352
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

event clicked;dw_1.dataobject = 'dw_rep_control_transmition_allftx'

dw_1.settransobject(sqlca)
end event

