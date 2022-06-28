$PBExportHeader$w_blacklist.srw
forward
global type w_blacklist from wb_single_tb
end type
end forward

global type w_blacklist from wb_single_tb
integer width = 3689
integer height = 1752
string title = "Blacklist"
end type
global w_blacklist w_blacklist

on w_blacklist.create
call super::create
end on

on w_blacklist.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_blacklist
integer width = 3607
integer height = 1544
string dataobject = "dw_blacklist"
end type

