$PBExportHeader$w_payee_report_detallado.srw
forward
global type w_payee_report_detallado from wb_report_fechas
end type
end forward

global type w_payee_report_detallado from wb_report_fechas
int Width=3703
int Height=2220
boolean TitleBar=true
string Title="Payee Report"
end type
global w_payee_report_detallado w_payee_report_detallado

on w_payee_report_detallado.create
call super::create
end on

on w_payee_report_detallado.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_payee_report_detallado
int Y=144
int Width=3653
int Height=1900
boolean BringToTop=true
string DataObject="dw_payee_report_detallado"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_payee_report_detallado
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_payee_report_detallado
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_payee_report_detallado
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_payee_report_detallado
boolean BringToTop=true
end type

event em_fecha2::modified;dw_1.SetTransObject(SQLCA)
dw_1.Retrieve(date(em_fecha1.text),RelativeDate(Date(em_fecha2.text),1))

end event

