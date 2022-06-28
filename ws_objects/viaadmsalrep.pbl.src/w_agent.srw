$PBExportHeader$w_agent.srw
forward
global type w_agent from wb_single_tb
end type
end forward

global type w_agent from wb_single_tb
integer x = 214
integer y = 221
integer width = 5083
integer height = 2456
string title = "Sales Representatives"
end type
global w_agent w_agent

on w_agent.create
call super::create
end on

on w_agent.destroy
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

type dw_1 from wb_single_tb`dw_1 within w_agent
integer width = 5006
integer height = 2248
string dataobject = "dw_agent"
end type

event dw_1::pfc_postinsertrow;call super::pfc_postinsertrow;///********* Automatic Insert new idagent **********///
// THsi proccess generate the next idagent automatically ///
//********************************************//

integer d_new_agent
string s_new_idagent
d_new_Agent = 0

SELECT MAX(CAST(ID_AGENT as int))
INTO :d_new_agent
FROM DBA.AGENT;


s_new_idagent = string(d_new_Agent + 1)

this.scrolltorow(this.getrow() - 1 )
this.setitem(this.getrow(),"id_agent",s_new_idagent)
end event

event dw_1::pfc_preupdate;call super::pfc_preupdate;string ls_fname, ls_mname, ls_lname, ls_slname, ls_complete_name

double row, ld_rowcount

ld_rowcount = dw_1.rowcount()

for row = 1 to ld_rowcount
	
	if isnull(dw_1.getitemstring(row,'name_agent')) or dw_1.getitemstring(row,'name_agent') = '' then

ls_fname = this.getitemstring(row,'sales_rep_fname')
ls_mname = this.getitemstring(row,'sales_rep_mname')
ls_lname = this.getitemstring(row,'sales_rep_lname')
ls_slname = this.getitemstring(row,'sales_rep_slname')

if isnull(ls_fname) or ls_fname = '' then
	messagebox('ALERT','The First name is empty please fix',stopsign!)
	return -1
end if

if isnull(ls_lname) or ls_lname = '' then
	messagebox('ALERT','The Last name is empty please fix',stopsign!)
	return -1
end if

if isnull(ls_slname) then ls_slname = ''



ls_complete_name = ls_fname 

if not(ls_mname = '' or isnull(ls_mname)) then
	
	ls_complete_name = ls_complete_name + ' ' + ls_mname + ' '
	
else
	
	ls_complete_name = ls_complete_name + ' ' 
	
end if

ls_complete_name = ls_complete_name + ls_lname + ' ' + ls_slname


ls_complete_name = trim(ls_complete_name)


	if isnull(this.getitemstring(row, 'name_agent')) or this.getitemstring(row, 'name_agent') = '' then
		
		this.setitem(row, 'name_agent', ls_complete_name)

	end if

end if

if isnull(dw_1.getitemstring(row,'id_company')) then
	this.setitem(row, 'id_company', 'VIA')
END IF	

next

return 1
end event

event dw_1::clicked;call super::clicked;IF dwo.name = "b_calendar" THEN

       IF IsValid(iuo_calendar) THEN

               this.SetColumn("date_begin_agent")

               this.event pfc_ddcalendar()

       END IF

  END IF
end event

event dw_1::constructor;call super::constructor;This.of_SetDropDownCalendar(TRUE)
This.iuo_calendar.of_SetInitialValue(FALSE)
This.iuo_calendar.of_SetAlwaysRedraw(FALSE)
This.iuo_calendar.of_SetCloseOnClick(TRUE)
This.iuo_calendar.of_SetCloseOnDClick(TRUE)
This.iuo_calendar.of_Register("date_begin_agent",iuo_calendar.NONE)
end event

