$PBExportHeader$w_cashier_release.srw
forward
global type w_cashier_release from wb_single_tb
end type
end forward

global type w_cashier_release from wb_single_tb
int Width=3090
int Height=2332
end type
global w_cashier_release w_cashier_release

on w_cashier_release.create
call super::create
end on

on w_cashier_release.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_cashier_release
int Width=3013
int Height=2120
boolean BringToTop=true
string DataObject="dw_cashier_release"
end type

