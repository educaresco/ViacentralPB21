$PBExportHeader$w_irs_audit_1.srw
forward
global type w_irs_audit_1 from wb_report_fechas
end type
type em_idbranch from editmask within w_irs_audit_1
end type
type st_ from statictext within w_irs_audit_1
end type
end forward

global type w_irs_audit_1 from wb_report_fechas
boolean TitleBar=true
string Title="Sales Report Summary"
long BackColor=80269524
boolean MaxBox=false
em_idbranch em_idbranch
st_ st_
end type
global w_irs_audit_1 w_irs_audit_1

on w_irs_audit_1.create
int iCurrent
call super::create
this.em_idbranch=create em_idbranch
this.st_=create st_
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_idbranch
this.Control[iCurrent+2]=this.st_
end on

on w_irs_audit_1.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_idbranch)
destroy(this.st_)
end on

type dw_1 from wb_report_fechas`dw_1 within w_irs_audit_1
int Y=144
boolean BringToTop=true
string DataObject="dw_irs_audit_1"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_irs_audit_1
int X=635
int Y=36
int Width=357
int Height=76
boolean BringToTop=true
Alignment Alignment=Left!
end type

type st_1 from wb_report_fechas`st_1 within w_irs_audit_1
int X=265
int Y=36
int Height=76
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_irs_audit_1
int X=1179
int Y=36
int Height=76
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_irs_audit_1
int X=1554
int Y=36
int Width=357
int Height=76
boolean BringToTop=true
Alignment Alignment=Left!
end type

event em_fecha2::modified;return
end event

type em_idbranch from editmask within w_irs_audit_1
int X=2473
int Y=36
int Width=297
int Height=76
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="!!!!!!!!!!"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;Date		ld_fecha1, ld_fecha2
String ls_idbranch

Setpointer(Hourglass!)

ls_idbranch = trim(em_idbranch.text)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)

dw_1.Retrieve(date(em_fecha1.text),date(em_fecha2.text),ls_idbranch)

dw_1.setfocus()
Setpointer(Arrow!)
end event

type st_ from statictext within w_irs_audit_1
int X=2085
int Y=36
int Width=366
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Id Branch :"
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

