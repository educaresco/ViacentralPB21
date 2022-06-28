$PBExportHeader$w_collector.srw
forward
global type w_collector from wb_single_tb
end type
end forward

global type w_collector from wb_single_tb
integer width = 2162
integer height = 1856
string title = "A/R Rep Cashiers"
end type
global w_collector w_collector

on w_collector.create
call super::create
end on

on w_collector.destroy
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

type dw_1 from wb_single_tb`dw_1 within w_collector
integer width = 2089
integer height = 1660
string dataobject = "dw_collector"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;string ls_cashier_id
integer li_is_collector, li_viasafe

AcceptText()

if dwo.name = "b_bde" THEN
	ls_cashier_id = getitemstring(row, "id_cashier")
	
	this.Update()
	commit;
	
	OpenWithParm(w_agents_by_collector, ls_cashier_id)
END IF

	

end event

