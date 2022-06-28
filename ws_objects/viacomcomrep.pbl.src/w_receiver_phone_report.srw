$PBExportHeader$w_receiver_phone_report.srw
forward
global type w_receiver_phone_report from wb_report_fechas
end type
type st_3 from statictext within w_receiver_phone_report
end type
type em_amount from editmask within w_receiver_phone_report
end type
end forward

global type w_receiver_phone_report from wb_report_fechas
int Width=3397
boolean TitleBar=true
string Title="Receiver's Phone Report"
st_3 st_3
em_amount em_amount
end type
global w_receiver_phone_report w_receiver_phone_report

on w_receiver_phone_report.create
int iCurrent
call super::create
this.st_3=create st_3
this.em_amount=create em_amount
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.em_amount
end on

on w_receiver_phone_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_3)
destroy(this.em_amount)
end on

type dw_1 from wb_report_fechas`dw_1 within w_receiver_phone_report
int Y=144
int Width=3351
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_rep_receiver_phone_report"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_receiver_phone_report
int X=590
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_receiver_phone_report
int X=224
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_receiver_phone_report
int X=1138
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_receiver_phone_report
int X=1504
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type st_3 from statictext within w_receiver_phone_report
int X=1970
int Y=40
int Width=366
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Amount :"
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

type em_amount from editmask within w_receiver_phone_report
int X=2359
int Y=32
int Width=347
int Height=100
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Date		ld_fecha1, ld_fecha2


ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)

Setpointer(Hourglass!)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,Double(em_amount.text))
dw_1.setfocus()

Setpointer(Arrow!)
end event

