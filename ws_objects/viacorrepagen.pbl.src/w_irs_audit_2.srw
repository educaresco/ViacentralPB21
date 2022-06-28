$PBExportHeader$w_irs_audit_2.srw
forward
global type w_irs_audit_2 from wb_report_fechas
end type
type em_idbranch from editmask within w_irs_audit_2
end type
type st_ from statictext within w_irs_audit_2
end type
type st_amt from statictext within w_irs_audit_2
end type
type em_amt from editmask within w_irs_audit_2
end type
end forward

global type w_irs_audit_2 from wb_report_fechas
boolean TitleBar=true
string Title="Sales Report Summary"
long BackColor=80269524
boolean MaxBox=false
em_idbranch em_idbranch
st_ st_
st_amt st_amt
em_amt em_amt
end type
global w_irs_audit_2 w_irs_audit_2

on w_irs_audit_2.create
int iCurrent
call super::create
this.em_idbranch=create em_idbranch
this.st_=create st_
this.st_amt=create st_amt
this.em_amt=create em_amt
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_idbranch
this.Control[iCurrent+2]=this.st_
this.Control[iCurrent+3]=this.st_amt
this.Control[iCurrent+4]=this.em_amt
end on

on w_irs_audit_2.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_idbranch)
destroy(this.st_)
destroy(this.st_amt)
destroy(this.em_amt)
end on

type dw_1 from wb_report_fechas`dw_1 within w_irs_audit_2
int Y=144
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_irs_audit_2"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_irs_audit_2
int X=471
int Y=36
int Width=357
int Height=76
boolean BringToTop=true
Alignment Alignment=Left!
end type

type st_1 from wb_report_fechas`st_1 within w_irs_audit_2
int X=101
int Y=36
int Height=76
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_irs_audit_2
int X=869
int Y=36
int Height=76
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_irs_audit_2
int X=1243
int Y=36
int Width=357
int Height=76
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Left!
end type

event em_fecha2::modified;return
end event

type em_idbranch from editmask within w_irs_audit_2
int X=2025
int Y=36
int Width=297
int Height=76
int TabOrder=20
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

type st_ from statictext within w_irs_audit_2
int X=1637
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

type st_amt from statictext within w_irs_audit_2
int X=2414
int Y=36
int Width=462
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Amount >= than :"
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

type em_amt from editmask within w_irs_audit_2
int X=2880
int Y=36
int Width=251
int Height=76
int TabOrder=20
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Text="500.00"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;Date		ld_fecha1, ld_fecha2
String  ls_idbranch
Double ld_amt

Setpointer(Hourglass!)

ls_idbranch = trim(em_idbranch.text)
ld_amt = double(em_amt.text)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)

dw_1.Retrieve(date(em_fecha1.text),date(em_fecha2.text),ls_idbranch,ld_amt)

dw_1.setfocus()
Setpointer(Arrow!)
end event

