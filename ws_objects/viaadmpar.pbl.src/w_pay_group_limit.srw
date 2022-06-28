$PBExportHeader$w_pay_group_limit.srw
forward
global type w_pay_group_limit from wb_single_tb
end type
end forward

global type w_pay_group_limit from wb_single_tb
int Width=2336
int Height=1760
boolean TitleBar=true
string Title="Group Pay Limit"
end type
global w_pay_group_limit w_pay_group_limit

on w_pay_group_limit.create
call super::create
end on

on w_pay_group_limit.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_pay_group_limit
int Y=4
int Width=2249
int Height=1540
boolean BringToTop=true
string DataObject="dw_pay_group_limit"
end type

