$PBExportHeader$w_sales_report_detallado.srw
forward
global type w_sales_report_detallado from wb_report_fechas
end type
end forward

global type w_sales_report_detallado from wb_report_fechas
int Width=3762
int Height=2296
end type
global w_sales_report_detallado w_sales_report_detallado

on w_sales_report_detallado.create
call super::create
end on

on w_sales_report_detallado.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_sales_report_detallado
int Y=120
int Width=3689
int Height=1964
boolean BringToTop=true
string DataObject="dw_sales_report_datallado"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_sales_report_detallado
int X=955
int Y=24
int Height=72
boolean BringToTop=true
Alignment Alignment=Left!
end type

type st_1 from wb_report_fechas`st_1 within w_sales_report_detallado
int Y=24
int Height=72
boolean BringToTop=true
long TextColor=0
end type

type st_2 from wb_report_fechas`st_2 within w_sales_report_detallado
int X=1403
int Y=24
int Height=72
boolean BringToTop=true
long TextColor=0
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_sales_report_detallado
int X=1774
int Y=24
int Height=72
boolean BringToTop=true
Alignment Alignment=Left!
end type

event em_fecha2::modified;RETURN
end event

event em_fecha2::losefocus;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)
dw_1.Retrieve(date(em_fecha1.text),RelativeDate(Date(em_fecha2.text),1))

dw_1.setfocus()


Setpointer(Arrow!)


end event

