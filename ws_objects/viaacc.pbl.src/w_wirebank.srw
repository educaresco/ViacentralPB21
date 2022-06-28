$PBExportHeader$w_wirebank.srw
forward
global type w_wirebank from wb_single_tb
end type
end forward

global type w_wirebank from wb_single_tb
integer width = 3049
integer height = 2260
string title = "Wire Bank"
end type
global w_wirebank w_wirebank

on w_wirebank.create
call super::create
end on

on w_wirebank.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_wirebank
integer width = 3003
integer height = 2064
string dataobject = "dw_wirebank"
end type

