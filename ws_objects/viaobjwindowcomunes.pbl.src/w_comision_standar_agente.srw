$PBExportHeader$w_comision_standar_agente.srw
forward
global type w_comision_standar_agente from wb_single_tb
end type
end forward

global type w_comision_standar_agente from wb_single_tb
int Width=3314
int Height=1556
boolean TitleBar=true
string Title="Standar Commission"
end type
global w_comision_standar_agente w_comision_standar_agente

on w_comision_standar_agente.create
call super::create
end on

on w_comision_standar_agente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event ue_sql;Messagebox("Invalid","Invalid Operation")

return -1
end event

type dw_1 from wb_single_tb`dw_1 within w_comision_standar_agente
int Width=3237
boolean BringToTop=true
string DataObject="dw_comision_standar_agencia"
end type

event dw_1::pfc_deleterow;Messagebox("Invalid","Invalid Operation")

return -1
end event

event dw_1::pfc_addrow;Messagebox("Invalid","Invalid Operation")

return -1
end event

event dw_1::pfc_insertrow;Messagebox("Invalid","Invalid Operation")

return -1
end event

