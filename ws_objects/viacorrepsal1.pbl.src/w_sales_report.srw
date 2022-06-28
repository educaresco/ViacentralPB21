$PBExportHeader$w_sales_report.srw
forward
global type w_sales_report from wb_report_fechas
end type
end forward

global type w_sales_report from wb_report_fechas
boolean TitleBar=true
string Title="Sales Report Summary"
long BackColor=80269524
boolean MaxBox=false
end type
global w_sales_report w_sales_report

on w_sales_report.create
call super::create
end on

on w_sales_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_sales_report
int Y=144
boolean BringToTop=true
string DataObject="dw_sales_report"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_sales_report
int Height=76
boolean BringToTop=true
Alignment Alignment=Left!
end type

type st_1 from wb_report_fechas`st_1 within w_sales_report
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_sales_report
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_sales_report
int Height=76
boolean BringToTop=true
Alignment Alignment=Left!
end type

