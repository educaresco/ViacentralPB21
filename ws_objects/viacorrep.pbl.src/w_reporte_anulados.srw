$PBExportHeader$w_reporte_anulados.srw
forward
global type w_reporte_anulados from wb_report_fechas
end type
end forward

global type w_reporte_anulados from wb_report_fechas
end type
global w_reporte_anulados w_reporte_anulados

on w_reporte_anulados.create
call super::create
end on

on w_reporte_anulados.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_reporte_anulados
boolean BringToTop=true
string DataObject="dw_reporte_anulados"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_reporte_anulados
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_reporte_anulados
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_reporte_anulados
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_reporte_anulados
boolean BringToTop=true
end type

