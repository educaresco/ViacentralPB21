$PBExportHeader$w_comision_grupo.srw
forward
global type w_comision_grupo from wb_single_tb
end type
end forward

global type w_comision_grupo from wb_single_tb
integer x = 214
integer y = 221
integer width = 3904
integer height = 1564
string title = "Payer~'s Commission"
end type
global w_comision_grupo w_comision_grupo

on w_comision_grupo.create
call super::create
end on

on w_comision_grupo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision_grupo
integer width = 3845
integer height = 1356
string dataobject = "dw_comision_grupo"
end type

