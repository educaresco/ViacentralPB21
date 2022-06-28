$PBExportHeader$w_agente_branch.srw
forward
global type w_agente_branch from wb_single_tb
end type
end forward

global type w_agente_branch from wb_single_tb
integer x = 214
integer y = 221
integer width = 2761
integer height = 2212
string title = "Sales Representatives Agencies"
end type
global w_agente_branch w_agente_branch

on w_agente_branch.create
call super::create
end on

on w_agente_branch.destroy
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

type dw_1 from wb_single_tb`dw_1 within w_agente_branch
integer width = 2688
integer height = 2008
string dataobject = "dw_agente_branch"
end type

