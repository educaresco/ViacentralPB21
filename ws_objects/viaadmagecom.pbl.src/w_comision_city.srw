$PBExportHeader$w_comision_city.srw
forward
global type w_comision_city from wb_single_tb
end type
end forward

global type w_comision_city from wb_single_tb
integer width = 3310
integer height = 2120
string title = "Commission Mode Pay"
end type
global w_comision_city w_comision_city

on w_comision_city.create
call super::create
end on

on w_comision_city.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision_city
integer width = 3255
integer height = 1928
string dataobject = "dw_comision_city"
end type

