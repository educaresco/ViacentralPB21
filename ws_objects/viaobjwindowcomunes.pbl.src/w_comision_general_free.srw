$PBExportHeader$w_comision_general_free.srw
forward
global type w_comision_general_free from wb_single_tb
end type
end forward

global type w_comision_general_free from wb_single_tb
integer width = 2857
integer height = 2088
end type
global w_comision_general_free w_comision_general_free

on w_comision_general_free.create
call super::create
end on

on w_comision_general_free.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision_general_free
integer width = 2802
integer height = 1892
string dataobject = "dw_comision_general_free"
end type

