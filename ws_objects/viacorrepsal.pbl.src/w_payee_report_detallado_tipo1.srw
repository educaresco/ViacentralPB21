$PBExportHeader$w_payee_report_detallado_tipo1.srw
forward
global type w_payee_report_detallado_tipo1 from wb_report_fechas
end type
type em_1 from editmask within w_payee_report_detallado_tipo1
end type
type st_5 from statictext within w_payee_report_detallado_tipo1
end type
end forward

global type w_payee_report_detallado_tipo1 from wb_report_fechas
int Width=3607
boolean TitleBar=true
string Title="Payee Report"
em_1 em_1
st_5 st_5
end type
global w_payee_report_detallado_tipo1 w_payee_report_detallado_tipo1

on w_payee_report_detallado_tipo1.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_5=create st_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_5
end on

on w_payee_report_detallado_tipo1.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_1)
destroy(this.st_5)
end on

type dw_1 from wb_report_fechas`dw_1 within w_payee_report_detallado_tipo1
int Y=144
int Width=3538
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_payee_report_detallado_tipo1"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_payee_report_detallado_tipo1
int X=453
int Y=20
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_payee_report_detallado_tipo1
int X=87
int Y=20
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_payee_report_detallado_tipo1
int X=1001
int Y=20
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_payee_report_detallado_tipo1
int X=1367
int Y=20
boolean BringToTop=true
end type

event em_fecha2::modified;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = Date(em_fecha2.text)

//dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

type em_1 from editmask within w_payee_report_detallado_tipo1
int X=2135
int Y=20
int Width=306
int Height=100
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="!!!!"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;dw_1.SetTransObject(SQLCA)


dw_1.Retrieve(date(em_fecha1.text),RelativeDate(Date(em_fecha2.text),1),em_1.text)

dw_1.setfocus()


Setpointer(Arrow!)



end event

type st_5 from statictext within w_payee_report_detallado_tipo1
int X=1879
int Y=28
int Width=247
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Group :"
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

