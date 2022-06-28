$PBExportHeader$w_ralacion_cashier_group.srw
forward
global type w_ralacion_cashier_group from wb_single_tb
end type
end forward

global type w_ralacion_cashier_group from wb_single_tb
int Width=2907
int Height=1852
end type
global w_ralacion_cashier_group w_ralacion_cashier_group

on w_ralacion_cashier_group.create
call super::create
end on

on w_ralacion_cashier_group.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_ralacion_cashier_group
int Width=2871
int Height=1672
boolean BringToTop=true
string DataObject="dw_ralacion_cashier_group"
end type

