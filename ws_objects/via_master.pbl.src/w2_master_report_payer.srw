$PBExportHeader$w2_master_report_payer.srw
forward
global type w2_master_report_payer from w_sheet
end type
type st_1 from statictext within w2_master_report_payer
end type
type sle_payer from singlelineedit within w2_master_report_payer
end type
type cb_query from commandbutton within w2_master_report_payer
end type
type dw_1 from u_dw within w2_master_report_payer
end type
type gb_1 from groupbox within w2_master_report_payer
end type
type lst_payers from my_ddlb within w2_master_report_payer
end type
end forward

global type w2_master_report_payer from w_sheet
boolean visible = false
integer width = 3218
integer height = 1912
string menuname = "mb_report"
st_1 st_1
sle_payer sle_payer
cb_query cb_query
dw_1 dw_1
gb_1 gb_1
lst_payers lst_payers
end type
global w2_master_report_payer w2_master_report_payer

on w2_master_report_payer.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.st_1=create st_1
this.sle_payer=create sle_payer
this.cb_query=create cb_query
this.dw_1=create dw_1
this.gb_1=create gb_1
this.lst_payers=create lst_payers
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_payer
this.Control[iCurrent+3]=this.cb_query
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.lst_payers
end on

on w2_master_report_payer.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.sle_payer)
destroy(this.cb_query)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.lst_payers)
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
this.of_SetResize(true)
this.inv_resize.of_SetMinSize(1884, 873)
this.inv_resize.of_SetOrigSize(1200, 1000)
this.inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)
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

type st_1 from statictext within w2_master_report_payer
integer x = 526
integer y = 80
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Payer:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_payer from singlelineedit within w2_master_report_payer
integer x = 809
integer y = 64
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_payers.setselectedid( sle_payer.text )

// Chequea que este en la lista
IF sle_payer.text <> lst_payers.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF

end event

type cb_query from commandbutton within w2_master_report_payer
integer x = 2240
integer y = 60
integer width = 366
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
boolean default = true
end type

event clicked;String		ls_payer_id

Setpointer(Hourglass!)

ls_payer_id = lst_payers.getdataid()
dw_1.retrieve(ls_payer_id)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type dw_1 from u_dw within w2_master_report_payer
integer x = 18
integer y = 196
integer width = 3118
integer height = 1504
integer taborder = 0
boolean bringtotop = true
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;
// 04/23/2018: connects to readonly DB
SetTransObject(SQLCArpt)

//SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)

end event

type gb_1 from groupbox within w2_master_report_payer
integer x = 18
integer width = 3104
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Payer"
end type

type lst_payers from my_ddlb within w2_master_report_payer
integer x = 1157
integer y = 64
integer width = 1010
integer height = 1504
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;sle_payer.text = lst_payers.getdataid()
end event

event constructor;call super::constructor;lst_payers.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type IN ('P','A') order by name_main_branch;")
end event

