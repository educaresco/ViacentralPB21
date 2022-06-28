$PBExportHeader$w_agent_relations.srw
forward
global type w_agent_relations from wb_single_tb
end type
end forward

global type w_agent_relations from wb_single_tb
integer x = 214
integer y = 221
integer width = 2501
integer height = 2456
string title = "Sales Representatives"
end type
global w_agent_relations w_agent_relations

on w_agent_relations.create
call super::create
end on

on w_agent_relations.destroy
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

type dw_1 from wb_single_tb`dw_1 within w_agent_relations
integer width = 5006
integer height = 2248
string dataobject = "dw_agent_relations"
end type

event dw_1::pfc_preupdate;call super::pfc_preupdate;string ls_fname, ls_mname, ls_lname, ls_slname, ls_complete_name

double row, ld_rowcount

ld_rowcount = dw_1.rowcount()

for row = 1 to ld_rowcount
	
	if isnull(dw_1.getitemstring(row,'created_date')) or dw_1.getitemstring(row,'created_date') = '' then

		dw_1.setitem(row,'created_date', datetime(today(), now()))

	end if

next

return 1
end event

