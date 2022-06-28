$PBExportHeader$w_branch_hardware.srw
forward
global type w_branch_hardware from wb_single_tb
end type
end forward

global type w_branch_hardware from wb_single_tb
int Width=3365
boolean TitleBar=true
string Title="Branch Hardware"
end type
global w_branch_hardware w_branch_hardware

on w_branch_hardware.create
call super::create
end on

on w_branch_hardware.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_branch_hardware
int Width=3310
int Height=1336
boolean BringToTop=true
string DataObject="dw_branch_hardware"
end type

