$PBExportHeader$w_cuenta_banco.srw
forward
global type w_cuenta_banco from wb_single_tb
end type
end forward

global type w_cuenta_banco from wb_single_tb
integer width = 3826
integer height = 1556
string title = "Account"
end type
global w_cuenta_banco w_cuenta_banco

on w_cuenta_banco.create
call super::create
end on

on w_cuenta_banco.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_cuenta_banco
integer width = 3753
string dataobject = "dw_cuenta_banco"
end type

