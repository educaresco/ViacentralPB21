$PBExportHeader$w_trans_group_branch.srw
forward
global type w_trans_group_branch from wb_single_tb
end type
end forward

global type w_trans_group_branch from wb_single_tb
boolean TitleBar=true
string Title="Trans like Agent"
long BackColor=80269524
end type
global w_trans_group_branch w_trans_group_branch

on w_trans_group_branch.create
call super::create
end on

on w_trans_group_branch.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_trans_group_branch
string DataObject="dw_trans_group_branch"
end type

