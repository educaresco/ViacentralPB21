$PBExportHeader$w_rep_comision_grupo_fechas.srw
forward
global type w_rep_comision_grupo_fechas from wb_report_fechas
end type
end forward

global type w_rep_comision_grupo_fechas from wb_report_fechas
int Width=3415
boolean TitleBar=true
string Title="Comisiones de Corresponsales"
end type
global w_rep_comision_grupo_fechas w_rep_comision_grupo_fechas

on w_rep_comision_grupo_fechas.create
call super::create
end on

on w_rep_comision_grupo_fechas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_comision_grupo_fechas
int Y=152
int Width=3355
int Height=1580
boolean BringToTop=true
string DataObject="dw_comision_grupo_fechas"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_comision_grupo_fechas
int X=1042
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_comision_grupo_fechas
int X=677
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_comision_grupo_fechas
int X=1591
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_comision_grupo_fechas
int X=1961
boolean BringToTop=true
end type

