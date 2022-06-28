$PBExportHeader$wb_report_agencia.srw
forward
global type wb_report_agencia from w_sheet
end type
type sle_name from singlelineedit within wb_report_agencia
end type
type sle_branch from singlelineedit within wb_report_agencia
end type
type dw_1 from u_dw within wb_report_agencia
end type
type st_1 from statictext within wb_report_agencia
end type
type cb_query from commandbutton within wb_report_agencia
end type
end forward

global type wb_report_agencia from w_sheet
boolean visible = false
integer width = 3218
integer height = 1912
string menuname = "mb_report"
sle_name sle_name
sle_branch sle_branch
dw_1 dw_1
st_1 st_1
cb_query cb_query
end type
global wb_report_agencia wb_report_agencia

on wb_report_agencia.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.sle_name=create sle_name
this.sle_branch=create sle_branch
this.dw_1=create dw_1
this.st_1=create st_1
this.cb_query=create cb_query
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_name
this.Control[iCurrent+2]=this.sle_branch
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_query
end on

on wb_report_agencia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_name)
destroy(this.sle_branch)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.cb_query)
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

event open;call super::open;X=1
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

event resize;call super::resize;dw_1.height = this.height - dw_1.y - 150
dw_1.width = this.width - dw_1.x - 80
end event

type sle_name from singlelineedit within wb_report_agencia
integer x = 571
integer y = 44
integer width = 1435
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_branch from singlelineedit within wb_report_agencia
integer x = 247
integer y = 44
integer width = 320
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
textcase textcase = upper!
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event modified;select rtrim(name_branch)
into :sle_name.text
from dba.branch
where id_branch = :this.text;
end event

type dw_1 from u_dw within wb_report_agencia
integer x = 18
integer y = 156
integer width = 3136
integer height = 1556
integer taborder = 0
boolean bringtotop = true
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;
// 04/23/2018: connects to readonly DB
SetTransObject(SQLCArpt)

//SetTransObject(SQLCA)
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type st_1 from statictext within wb_report_agencia
integer x = 27
integer y = 56
integer width = 192
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_query from commandbutton within wb_report_agencia
integer x = 2784
integer y = 44
integer width = 370
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
boolean default = true
end type

event clicked;String		ls_branch

Setpointer(Hourglass!)

ls_branch = trim(sle_branch.text)

dw_1.retrieve(ls_branch)
dw_1.setfocus()

Setpointer(Arrow!)
end event

