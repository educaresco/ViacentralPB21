$PBExportHeader$w_estadisticas_post_cajeros_resumido.srw
forward
global type w_estadisticas_post_cajeros_resumido from wb_report_datetime
end type
end forward

global type w_estadisticas_post_cajeros_resumido from wb_report_datetime
end type
global w_estadisticas_post_cajeros_resumido w_estadisticas_post_cajeros_resumido

on w_estadisticas_post_cajeros_resumido.create
call super::create
end on

on w_estadisticas_post_cajeros_resumido.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_datetime`dw_1 within w_estadisticas_post_cajeros_resumido
string DataObject="dw_estadisticas_post_cajeros_resumido"
end type

