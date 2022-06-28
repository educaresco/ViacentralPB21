$PBExportHeader$w_cashier_agente.srw
forward
global type w_cashier_agente from wb_single_tb
end type
end forward

global type w_cashier_agente from wb_single_tb
int Width=2615
int Height=1552
boolean TitleBar=true
string Title="Cashiers"
end type
global w_cashier_agente w_cashier_agente

on w_cashier_agente.create
call super::create
end on

on w_cashier_agente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Initialize the Window Resize Service.
//
//////////////////////////////////////////////////////////////////////////////

//Initialize the Window Resize Functionality
of_SetResize(true)
inv_resize.of_SetMinSize(1884, 873)
inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)
end event

event ue_sql;Messagebox("Invalid","Invalid Operation")

return -1
end event

type dw_1 from wb_single_tb`dw_1 within w_cashier_agente
int Width=2569
boolean BringToTop=true
string DataObject="dw_cashier_agencia"
end type

event dw_1::pfc_addrow;Messagebox("Invalid","Invalid Operation")

return -1
end event

event dw_1::pfc_deleterow;Messagebox("Invalid","Invalid Operation")

return -1
end event

event dw_1::pfc_insertrow;Messagebox("Invalid","Invalid Operation")

return -1
end event

