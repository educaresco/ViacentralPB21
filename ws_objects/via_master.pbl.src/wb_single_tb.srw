$PBExportHeader$wb_single_tb.srw
$PBExportComments$Ventana single tabular
forward
global type wb_single_tb from w_sheet
end type
type dw_1 from u_dw within wb_single_tb
end type
end forward

global type wb_single_tb from w_sheet
boolean visible = false
integer x = 214
integer y = 221
integer width = 2478
integer height = 1532
string menuname = "mb_single_tb"
long backcolor = 80269524
event ue_sql pbm_custom60
dw_1 dw_1
end type
global wb_single_tb wb_single_tb

type variables

end variables

event ue_sql;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
// clicked
//
//	Arguments:
//	None
//
//	Returns:
//	integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	This script turns the SQL Spy Utility on.
// Note that the SQL Spy window cannot be opened unless the Debug
// service has been started.
////////////////////////////////////////////////////////////////////////////////

integer li_return

// If debug is not on, turn it on.
if IsNull(gnv_app.inv_debug) or not IsValid(gnv_app.inv_debug) then
	li_return = gnv_app.of_SetDebug(true)
end if

if li_return < 0 then return -1

if IsNull(gnv_app.inv_debug.inv_sqlspy) or not &
	IsValid(gnv_app.inv_debug.inv_sqlspy) then
	// Start the SQLSpy Service.
	li_return = gnv_app.inv_debug.of_SetSQLSpy(true)
	if li_return < 0 then return -1
end if

// Open the SQLSpy Window.
li_return = gnv_app.inv_debug.inv_sqlspy.of_OpenSQLSpy(true)

return li_return	
	
end event

on wb_single_tb.create
int iCurrent
call super::create
if this.MenuName = "mb_single_tb" then this.MenuID = create mb_single_tb
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on wb_single_tb.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
end on

event open;call super::open;
X=1
Y=1
Show()


dw_1.SetRowFocusIndicator(Hand!)
dw_1.inv_filter.of_SetStyle(dw_1.inv_filter.EXTENDED)
of_SetResize(true)

inv_resize.of_register(dw_1, this.inv_resize.FIXEDRIGHTBOTTOM)


end event

event pfc_saveas;dw_1.saveas()
end event

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
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

event pfc_print;
If Messagebox("Question","Do you want to print Now ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()




dw_1.print()



return 0
end event

event pfc_save;call super::pfc_save;Commit ;
return 1 ;
end event

event resize;call super::resize;dw_1.height = this.height - dw_1.y - 150
dw_1.width = this.width - dw_1.x - 80
end event

type dw_1 from u_dw within wb_single_tb
integer width = 2414
integer height = 1344
integer taborder = 10
boolean bringtotop = true
boolean hscrollbar = true
end type

event constructor;SetTransObject(SQLCA)
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

//DON (04/02/2015) - To suppress Retrieve.  ***********************
IF gb_prevent_rate_retrieve	THEN
	gb_prevent_rate_retrieve	=	FALSE
ELSE
	this.retrieve()
END IF
//******************************************************

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

