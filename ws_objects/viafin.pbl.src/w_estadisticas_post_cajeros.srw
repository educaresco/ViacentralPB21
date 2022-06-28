$PBExportHeader$w_estadisticas_post_cajeros.srw
forward
global type w_estadisticas_post_cajeros from wb_report_datetime
end type
end forward

global type w_estadisticas_post_cajeros from wb_report_datetime
end type
global w_estadisticas_post_cajeros w_estadisticas_post_cajeros

on w_estadisticas_post_cajeros.create
call super::create
end on

on w_estadisticas_post_cajeros.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_datetime`dw_1 within w_estadisticas_post_cajeros
boolean BringToTop=true
string DataObject="dw_estadisticas_post_cajeros"
end type

type em_fecha1 from wb_report_datetime`em_fecha1 within w_estadisticas_post_cajeros
boolean BringToTop=true
end type

type st_1 from wb_report_datetime`st_1 within w_estadisticas_post_cajeros
boolean BringToTop=true
end type

type st_2 from wb_report_datetime`st_2 within w_estadisticas_post_cajeros
boolean BringToTop=true
end type

type em_fecha2 from wb_report_datetime`em_fecha2 within w_estadisticas_post_cajeros
boolean BringToTop=true
end type

