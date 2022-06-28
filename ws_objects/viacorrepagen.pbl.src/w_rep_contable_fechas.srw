$PBExportHeader$w_rep_contable_fechas.srw
forward
global type w_rep_contable_fechas from wb_report_fechas
end type
end forward

global type w_rep_contable_fechas from wb_report_fechas
int X=146
int Y=348
int Width=2994
int Height=1940
long BackColor=82042848
end type
global w_rep_contable_fechas w_rep_contable_fechas

on w_rep_contable_fechas.create
call super::create
end on

on w_rep_contable_fechas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_contable_fechas
int Y=148
int Width=2930
int Height=1556
boolean BringToTop=true
string DataObject="dw_rep_contable_costos"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_contable_fechas
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_contable_fechas
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_contable_fechas
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_contable_fechas
boolean BringToTop=true
end type

