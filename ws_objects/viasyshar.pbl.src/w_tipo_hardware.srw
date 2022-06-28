$PBExportHeader$w_tipo_hardware.srw
forward
global type w_tipo_hardware from wb_single_tb
end type
end forward

global type w_tipo_hardware from wb_single_tb
int Width=1742
int Height=1544
boolean TitleBar=true
string Title="Type Hardware"
end type
global w_tipo_hardware w_tipo_hardware

on w_tipo_hardware.create
call super::create
end on

on w_tipo_hardware.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_tipo_hardware
int Width=1682
boolean BringToTop=true
string DataObject="dw_tipo_hardware"
end type

