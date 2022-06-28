$PBExportHeader$w_invoices_without_pay.srw
forward
global type w_invoices_without_pay from wb_report_fechas
end type
type em_1 from editmask within w_invoices_without_pay
end type
type st_44 from statictext within w_invoices_without_pay
end type
end forward

global type w_invoices_without_pay from wb_report_fechas
int Width=3515
int Height=1904
boolean TitleBar=true
string Title="Unpaid Invoices"
long BackColor=80269524
em_1 em_1
st_44 st_44
end type
global w_invoices_without_pay w_invoices_without_pay

on w_invoices_without_pay.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_44=create st_44
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_44
end on

on w_invoices_without_pay.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_1)
destroy(this.st_44)
end on

type dw_1 from wb_report_fechas`dw_1 within w_invoices_without_pay
int Y=116
int Width=3438
int Height=1580
int TabOrder=0
boolean BringToTop=true
string DataObject="dw_invoices_no_pagados_payee"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_invoices_without_pay
int X=809
int Y=8
int Width=462
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_invoices_without_pay
int X=439
int Y=28
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_invoices_without_pay
int X=1664
int Y=20
int Width=238
int Height=72
boolean BringToTop=true
string Text="Payee :"
long TextColor=0
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_invoices_without_pay
int X=1184
int Y=20
int Width=357
int Height=72
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Left!
end type

event em_fecha2::modified;return
end event

type em_1 from editmask within w_invoices_without_pay
int X=1911
int Y=20
int Width=325
int Height=72
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="!!!!"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;dw_1.retrieve(Date(em_fecha2.text),em_1.text)
end event

type st_44 from statictext within w_invoices_without_pay
int X=805
int Y=20
int Width=366
int Height=72
boolean Enabled=false
boolean BringToTop=true
string Text="Cutoff Day :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

