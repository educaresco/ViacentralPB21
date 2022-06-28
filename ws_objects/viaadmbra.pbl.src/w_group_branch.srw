$PBExportHeader$w_group_branch.srw
forward
global type w_group_branch from wb_single_tb
end type
type rb_ag from radiobutton within w_group_branch
end type
type rb_pa from radiobutton within w_group_branch
end type
type gb_1 from groupbox within w_group_branch
end type
end forward

global type w_group_branch from wb_single_tb
integer width = 3822
integer height = 2068
string title = "Group Branch"
rb_ag rb_ag
rb_pa rb_pa
gb_1 gb_1
end type
global w_group_branch w_group_branch

on w_group_branch.create
int iCurrent
call super::create
this.rb_ag=create rb_ag
this.rb_pa=create rb_pa
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_ag
this.Control[iCurrent+2]=this.rb_pa
this.Control[iCurrent+3]=this.gb_1
end on

on w_group_branch.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_ag)
destroy(this.rb_pa)
destroy(this.gb_1)
end on

event open;call super::open;fn_updategrouptypes()

if rb_ag.checked then
	dw_1.retrieve('R')
else
	dw_1.retrieve('P')
end if
end event

type dw_1 from wb_single_tb`dw_1 within w_group_branch
integer x = 9
integer y = 132
integer width = 3762
integer height = 1740
string title = "Group Branch"
string dataobject = "dw_group_branch_pa"
end type

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

///////this.retrieve()
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

type rb_ag from radiobutton within w_group_branch
integer x = 375
integer y = 44
integer width = 347
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agencies"
end type

event clicked;if rb_ag.checked then
	dw_1.DataObject = 'dw_group_branch_ag'
else
	dw_1.DataObject = 'dw_group_branch_pa'
end if
dw_1.SetTransObject(SQLCA)
dw_1.retrieve()
end event

type rb_pa from radiobutton within w_group_branch
integer x = 69
integer y = 44
integer width = 261
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payers"
boolean checked = true
end type

event clicked;if rb_ag.checked then
	dw_1.DataObject = 'dw_group_branch_ag'
else
	dw_1.DataObject = 'dw_group_branch_pa'
end if
dw_1.SetTransObject(SQLCA)
dw_1.retrieve()
end event

type gb_1 from groupbox within w_group_branch
integer x = 9
integer width = 750
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

