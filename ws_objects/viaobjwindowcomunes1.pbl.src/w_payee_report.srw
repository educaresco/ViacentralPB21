$PBExportHeader$w_payee_report.srw
forward
global type w_payee_report from wb_report_fechas
end type
end forward

global type w_payee_report from wb_report_fechas
int Width=3657
boolean TitleBar=true
string Title="Payee Report"
end type
global w_payee_report w_payee_report

on w_payee_report.create
call super::create
end on

on w_payee_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_payee_report
int Y=144
int Width=3570
boolean BringToTop=true
string DataObject="dw_payee_report"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_payee_report
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_payee_report
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_payee_report
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_payee_report
boolean BringToTop=true
end type

