$PBExportHeader$w_ing_branch_licencia.srw
forward
global type w_ing_branch_licencia from wb_single_tb
end type
end forward

global type w_ing_branch_licencia from wb_single_tb
int Width=3209
int Height=1764
end type
global w_ing_branch_licencia w_ing_branch_licencia

on w_ing_branch_licencia.create
call super::create
end on

on w_ing_branch_licencia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_ing_branch_licencia
int Width=3163
int Height=1560
string DataObject="dw_branch_licensia"
end type

