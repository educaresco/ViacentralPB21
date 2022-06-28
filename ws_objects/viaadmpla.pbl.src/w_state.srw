$PBExportHeader$w_state.srw
forward
global type w_state from wb_single_tb
end type
end forward

global type w_state from wb_single_tb
int Width=2286
int Height=1684
boolean TitleBar=true
string Title="States"
end type
global w_state w_state

on w_state.create
call super::create
end on

on w_state.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_state
int Width=2231
int Height=1472
boolean BringToTop=true
string DataObject="dw_state"
end type

