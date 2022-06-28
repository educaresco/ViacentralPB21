$PBExportHeader$w_modo_pago_branch.srw
forward
global type w_modo_pago_branch from wb_single_tb
end type
end forward

global type w_modo_pago_branch from wb_single_tb
int Width=2793
int Height=2252
boolean TitleBar=true
string Title="Payment Mode Branch"
end type
global w_modo_pago_branch w_modo_pago_branch

on w_modo_pago_branch.create
call super::create
end on

on w_modo_pago_branch.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_modo_pago_branch
int Width=2734
int Height=2064
boolean BringToTop=true
string DataObject="dw_modo_pago_branch"
end type

