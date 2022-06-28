$PBExportHeader$w_comision_group_city.srw
forward
global type w_comision_group_city from wb_single_tb
end type
end forward

global type w_comision_group_city from wb_single_tb
integer width = 3794
integer height = 1584
string title = "Commission Mode Pay"
end type
global w_comision_group_city w_comision_group_city

on w_comision_group_city.create
call super::create
end on

on w_comision_group_city.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision_group_city
integer width = 3735
integer height = 1388
string dataobject = "dw_comision_group_city"
end type

