$PBExportHeader$w_motivo_anulacion.srw
forward
global type w_motivo_anulacion from wb_single_tb
end type
end forward

global type w_motivo_anulacion from wb_single_tb
int Width=1536
int Height=1516
boolean TitleBar=true
string Title="Motivo Anulacion"
end type
global w_motivo_anulacion w_motivo_anulacion

on w_motivo_anulacion.create
call super::create
end on

on w_motivo_anulacion.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_motivo_anulacion
int Width=1463
int Height=1312
string DataObject="dw_motivo_anulacion"
end type

