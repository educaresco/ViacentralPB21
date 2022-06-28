$PBExportHeader$w_exclusion_limit.srw
forward
global type w_exclusion_limit from wb_single_tb
end type
end forward

global type w_exclusion_limit from wb_single_tb
int Width=3150
boolean TitleBar=true
string Title="Exclusion Limit"
end type
global w_exclusion_limit w_exclusion_limit

on w_exclusion_limit.create
call super::create
end on

on w_exclusion_limit.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_exclusion_limit
int Width=3095
boolean BringToTop=true
string DataObject="dw_exclusion_limit"
end type

