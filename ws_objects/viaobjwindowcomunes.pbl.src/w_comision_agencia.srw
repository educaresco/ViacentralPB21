$PBExportHeader$w_comision_agencia.srw
forward
global type w_comision_agencia from wb_single_tb
end type
end forward

global type w_comision_agencia from wb_single_tb
integer width = 3881
integer height = 1556
string title = "Agency~'s Commission"
end type
global w_comision_agencia w_comision_agencia

on w_comision_agencia.create
call super::create
end on

on w_comision_agencia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event ue_sql;Messagebox("Invalid","Invalid Operation")

return -1
end event

type dw_1 from wb_single_tb`dw_1 within w_comision_agencia
integer width = 3822
integer height = 1368
string dataobject = "dw_comision_agencia"
end type

event dw_1::pfc_addrow;Messagebox("Invalid","Invalid Operation")

return -1
end event

event dw_1::pfc_deleterow;Messagebox("Invalid","Invalid Operation")

return -1
end event

event dw_1::constructor;SetTransObject(SQLCA)
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Event:
//////	constructor
//////
//////	Description:
//////	Start the resize service and register the controls.
////// Tab page three will be created on demand.  If the user resizes
////// the window before the tab page is created then the resize event
////// must be triggered.
//////
//////////////////////////////////////////////////////////////////////////////////
//////	
//////	Revision History
//////
//////	Version
//////	6.0   Initial version
//////
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//////	Any distribution of the PowerBuilder Foundation Classes (PFC)
//////	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////
//////////////////////////////////////////////////////////////////////////////////
////
////// Start the Resize Service.
//
datawindow	ddlb_filetypes

gs_branch_insta = fn_branch_instalacion()

this.retrieve(gs_branch_insta)
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)
//
////Set the MinSize of the main object.
inv_resize.of_SetMinSize(1185, 509)
//
////Set the behavior of each object.
//inv_resize.of_Register(ddlb_filetypes, inv_resize.SCALERIGHTBOTTOM)
//inv_resize.of_Register(sle_text, inv_resize.SCALERIGHT)
//
//ddlb_filetypes.SelectItem(2)
//
////Trigger the resize event to be sure that the tab is sized appropriately.
event resize(1, this.width, this.height)
//






end event

event dw_1::pfc_insertrow;Messagebox("Invalid","Invalid Operation")

return -1
end event

