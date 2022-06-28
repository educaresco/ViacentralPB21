$PBExportHeader$w_agent_goals.srw
forward
global type w_agent_goals from wb_single_tb
end type
end forward

global type w_agent_goals from wb_single_tb
integer width = 5394
integer height = 2456
string title = "Sales Representatives Goals"
end type
global w_agent_goals w_agent_goals

on w_agent_goals.create
call super::create
end on

on w_agent_goals.destroy
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

type dw_1 from wb_single_tb`dw_1 within w_agent_goals
integer width = 5330
integer height = 2248
string dataobject = "dw_agent_goals"
end type

event dw_1::pfc_postinsertrow;call super::pfc_postinsertrow;///********* Automatic Insert new idagent **********///
// THsi proccess generate the next idagent automatically ///
//********************************************//

integer d_new_year
string s_new_idagent
d_new_year = 0

d_new_year = year(today())

this.scrolltorow(this.getrow() - 1 )
this.setitem(this.getrow(),"goal_year",d_new_year)
end event

