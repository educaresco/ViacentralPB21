$PBExportHeader$w_cubrimiento.srw
forward
global type w_cubrimiento from wb_single_tb
end type
end forward

global type w_cubrimiento from wb_single_tb
int Width=3726
int Height=2244
boolean TitleBar=true
string Title="Branch's Coverage"
end type
global w_cubrimiento w_cubrimiento

on w_cubrimiento.create
call super::create
end on

on w_cubrimiento.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_cubrimiento
int Width=3662
int Height=2060
boolean BringToTop=true
string DataObject="dw_cubrimiento_branch"
end type

