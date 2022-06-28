$PBExportHeader$w_cashier.srw
forward
global type w_cashier from wb_single_tb
end type
end forward

global type w_cashier from wb_single_tb
integer width = 5408
integer height = 1856
string title = "Cashiers"
end type
global w_cashier w_cashier

on w_cashier.create
call super::create
end on

on w_cashier.destroy
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

type dw_1 from wb_single_tb`dw_1 within w_cashier
integer width = 5339
integer height = 1660
string dataobject = "dw_cashier"
end type

event dw_1::clicked;call super::clicked;string ls_cashier_id

if dwo.name = "b_bde" THEN
	ls_cashier_id = getitemstring(row, "id_cashier")
	
	OpenWithParm(w_agents_by_collector, ls_cashier_id)
END IF
end event

