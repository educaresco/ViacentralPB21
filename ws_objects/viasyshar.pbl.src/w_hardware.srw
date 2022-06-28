$PBExportHeader$w_hardware.srw
forward
global type w_hardware from wb_single_tb
end type
end forward

global type w_hardware from wb_single_tb
int Width=2240
int Height=1528
boolean TitleBar=true
string Title="Hardware"
end type
global w_hardware w_hardware

on w_hardware.create
call super::create
end on

on w_hardware.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_hardware
int Width=2176
int Height=1324
boolean BringToTop=true
string DataObject="dw_hardware"
end type

