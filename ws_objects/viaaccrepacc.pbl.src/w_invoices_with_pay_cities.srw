$PBExportHeader$w_invoices_with_pay_cities.srw
forward
global type w_invoices_with_pay_cities from wb_report_fechas
end type
type em_1 from editmask within w_invoices_with_pay_cities
end type
type st_33 from statictext within w_invoices_with_pay_cities
end type
end forward

global type w_invoices_with_pay_cities from wb_report_fechas
int Width=3479
int Height=1872
boolean TitleBar=true
string Title="Paid Invoices by Cities"
long BackColor=80269524
em_1 em_1
st_33 st_33
end type
global w_invoices_with_pay_cities w_invoices_with_pay_cities

on w_invoices_with_pay_cities.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_33=create st_33
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_33
end on

on w_invoices_with_pay_cities.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_1)
destroy(this.st_33)
end on

type dw_1 from wb_report_fechas`dw_1 within w_invoices_with_pay_cities
int Y=116
int Width=3438
int Height=1580
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_invoices_pagados_cities"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_invoices_with_pay_cities
int X=905
int Y=8
int Width=407
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_invoices_with_pay_cities
int X=539
int Y=16
int Height=68
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_invoices_with_pay_cities
int X=2222
int Y=20
int Width=233
int Height=68
boolean BringToTop=true
string Text="Payee :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_invoices_with_pay_cities
int X=1742
int Y=8
int Width=430
boolean BringToTop=true
end type

event em_fecha2::modified;return
end event

type em_1 from editmask within w_invoices_with_pay_cities
int X=2459
int Y=8
int Width=279
int Height=100
int TabOrder=30
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

event losefocus;dw_1.retrieve(Date(em_fecha1.text),RelativeDate(Date(em_fecha2.text),1),em_1.text)
end event

type st_33 from statictext within w_invoices_with_pay_cities
int X=1413
int Y=20
int Width=325
int Height=72
boolean Enabled=false
boolean BringToTop=true
string Text="Date End :"
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

