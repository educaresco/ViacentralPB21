$PBExportHeader$w_rep_contable_fechas_rate.srw
forward
global type w_rep_contable_fechas_rate from wb_report_fechas
end type
end forward

global type w_rep_contable_fechas_rate from wb_report_fechas
end type
global w_rep_contable_fechas_rate w_rep_contable_fechas_rate

on w_rep_contable_fechas_rate.create
call super::create
end on

on w_rep_contable_fechas_rate.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_contable_fechas_rate
boolean BringToTop=true
string DataObject="dw_rep_contable_costos_rate"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_contable_fechas_rate
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_contable_fechas_rate
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_contable_fechas_rate
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_contable_fechas_rate
boolean BringToTop=true
end type

