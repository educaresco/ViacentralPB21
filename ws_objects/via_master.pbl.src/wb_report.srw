$PBExportHeader$wb_report.srw
$PBExportComments$Ventana report
forward
global type wb_report from w_sheet
end type
type dw_1 from u_dw within wb_report
end type
end forward

global type wb_report from w_sheet
boolean visible = false
integer width = 2665
integer height = 1696
string menuname = "mb_report"
dw_1 dw_1
end type
global wb_report wb_report

on wb_report.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on wb_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
end on

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

event open;call super::open;
X=1
Y=1
Show()

end event

event pfc_print;
If Messagebox("Question","Do you want to print Now ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()




dw_1.print()



return 0
end event

type dw_1 from u_dw within wb_report
integer width = 2610
integer height = 1504
integer taborder = 10
boolean bringtotop = true
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;
// 04/23/2018: connects to readonly DB
SetTransObject(SQLCArpt)

//SetTransObject(SQLCA)
this.retrieve()
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

