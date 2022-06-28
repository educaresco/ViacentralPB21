$PBExportHeader$w_type_pay_group.srw
forward
global type w_type_pay_group from wb_single_tb
end type
end forward

global type w_type_pay_group from wb_single_tb
int Width=2789
boolean TitleBar=true
string Title="Type Pay Group"
end type
global w_type_pay_group w_type_pay_group

on w_type_pay_group.create
call super::create
end on

on w_type_pay_group.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_type_pay_group
int Width=2743
boolean BringToTop=true
string DataObject="dw_type_pay_group"
end type

