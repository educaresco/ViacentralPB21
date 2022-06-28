$PBExportHeader$w_rep_comision_grupo_fechas_todos.srw
forward
global type w_rep_comision_grupo_fechas_todos from wb_report_fechas
end type
end forward

global type w_rep_comision_grupo_fechas_todos from wb_report_fechas
int Width=3415
boolean TitleBar=true
string Title="Comisiones de Corresponsales"
end type
global w_rep_comision_grupo_fechas_todos w_rep_comision_grupo_fechas_todos

on w_rep_comision_grupo_fechas_todos.create
call super::create
end on

on w_rep_comision_grupo_fechas_todos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_comision_grupo_fechas_todos
int Width=3355
boolean BringToTop=true
string DataObject="dw_comision_grupo_fechas_todos"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_comision_grupo_fechas_todos
int X=1019
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_comision_grupo_fechas_todos
int X=654
int Height=100
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_comision_grupo_fechas_todos
int X=1568
int Height=100
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_comision_grupo_fechas_todos
int X=1934
boolean BringToTop=true
end type

