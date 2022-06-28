$PBExportHeader$w_sec_group.srw
forward
global type w_sec_group from wb_single_tb
end type
end forward

global type w_sec_group from wb_single_tb
int Width=2290
int Height=1540
end type
global w_sec_group w_sec_group

on w_sec_group.create
call super::create
end on

on w_sec_group.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_sec_group
int Width=2226
string DataObject="dw_sec_group"
end type

