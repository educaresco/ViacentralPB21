$PBExportHeader$w_rep_contable_fechas_agrupado.srw
forward
global type w_rep_contable_fechas_agrupado from wb_report_fechas
end type
end forward

global type w_rep_contable_fechas_agrupado from wb_report_fechas
int Width=3557
int Height=2148
end type
global w_rep_contable_fechas_agrupado w_rep_contable_fechas_agrupado

on w_rep_contable_fechas_agrupado.create
call super::create
end on

on w_rep_contable_fechas_agrupado.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_contable_fechas_agrupado
int Y=120
int Width=3497
int Height=1800
boolean BringToTop=true
string DataObject="dw_rep_contable_costos_agrupado"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_contable_fechas_agrupado
int Y=12
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_contable_fechas_agrupado
int Y=12
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_contable_fechas_agrupado
int X=1618
int Y=12
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_contable_fechas_agrupado
int X=1984
int Y=12
boolean BringToTop=true
end type

