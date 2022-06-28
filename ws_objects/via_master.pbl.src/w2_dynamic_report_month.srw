$PBExportHeader$w2_dynamic_report_month.srw
forward
global type w2_dynamic_report_month from w_sheet
end type
type cb_1 from commandbutton within w2_dynamic_report_month
end type
type lst_manager from my_ddlb within w2_dynamic_report_month
end type
type st_3 from statictext within w2_dynamic_report_month
end type
type lst_month from my_ddlb within w2_dynamic_report_month
end type
type sle_idbranch from singlelineedit within w2_dynamic_report_month
end type
type st_1 from statictext within w2_dynamic_report_month
end type
type em_year from editmask within w2_dynamic_report_month
end type
type st_2 from statictext within w2_dynamic_report_month
end type
type dw_1 from u_dw within w2_dynamic_report_month
end type
type gb_1 from groupbox within w2_dynamic_report_month
end type
end forward

global type w2_dynamic_report_month from w_sheet
integer width = 3506
integer height = 1560
string menuname = "mb_report"
cb_1 cb_1
lst_manager lst_manager
st_3 st_3
lst_month lst_month
sle_idbranch sle_idbranch
st_1 st_1
em_year em_year
st_2 st_2
dw_1 dw_1
gb_1 gb_1
end type
global w2_dynamic_report_month w2_dynamic_report_month

event open;call super::open;X=1
Y=1
Show()


string s_parm

//s_parm = Message.StringParm
//dw_1.dataobject = fn_token(s_parm,'/',1)
//this.title = fn_token(s_parm,'/',2)

em_year.text = string(year(today()))

dw_1.dataobject = 'dw_commission_paid_to_agent_detail_history'

dw_1.SetTransObject(SQLCArpt)

end event

on w2_dynamic_report_month.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.cb_1=create cb_1
this.lst_manager=create lst_manager
this.st_3=create st_3
this.lst_month=create lst_month
this.sle_idbranch=create sle_idbranch
this.st_1=create st_1
this.em_year=create em_year
this.st_2=create st_2
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.lst_manager
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.lst_month
this.Control[iCurrent+5]=this.sle_idbranch
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_year
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.gb_1
end on

on w2_dynamic_report_month.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.lst_manager)
destroy(this.st_3)
destroy(this.lst_month)
destroy(this.sle_idbranch)
destroy(this.st_1)
destroy(this.em_year)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event resize;call super::resize;dw_1.height = this.height - dw_1.y - 150
dw_1.width = this.width - dw_1.x - 80
end event

event pfc_print;call super::pfc_print;
If Messagebox("Question","Do you want to print Now ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()

dw_1.print()

return 0
end event

event pfc_saveas;call super::pfc_saveas;dw_1.saveas()
end event

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
this.of_SetResize(true)
this.inv_resize.of_SetMinSize(1884, 873)
this.inv_resize.of_SetOrigSize(1200, 1000)
this.inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)
end event

type cb_1 from commandbutton within w2_dynamic_report_month
integer x = 3035
integer y = 60
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;double ld_month, ld_year 
string id_agent

ld_month =double( lst_month.getdataid())

id_agent  = lst_manager.getdataid()

ld_year = double(em_year.text)


dw_1.settransobject(sqlcarpt)

dw_1.retrieve(id_agent,ld_month,ld_year)


end event

type lst_manager from my_ddlb within w2_dynamic_report_month
integer x = 1952
integer y = 68
integer width = 1010
integer height = 652
integer taborder = 50
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("SELECT dba.AGENT.NAME_AGENT,   dba.AGENT.ID_AGENT   FROM dba.AGENT   WHERE dba.AGENT.STATUS_AGENT = 'A'    ;")
end event

event modified;call super::modified;sle_idbranch.text = lst_manager.getdataid()
end event

type st_3 from statictext within w2_dynamic_report_month
integer x = 1326
integer y = 84
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sales Rep."
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_month from my_ddlb within w2_dynamic_report_month
integer x = 855
integer y = 64
integer width = 462
integer height = 652
integer taborder = 50
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select  monthofyear,  monthnum from dba.timeseries group by monthofyear, monthnum order by monthnum  ;")
end event

event modified;call super::modified;sle_idbranch.text = lst_manager.getdataid()
end event

type sle_idbranch from singlelineedit within w2_dynamic_report_month
integer x = 1682
integer y = 68
integer width = 265
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_manager.setselectedid( sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_manager.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF
end event

type st_1 from statictext within w2_dynamic_report_month
integer x = 562
integer y = 76
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Month:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_year from editmask within w2_dynamic_report_month
integer x = 306
integer y = 68
integer width = 247
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
string displaydata = "~t/"
double increment = 1
string minmax = "1999~~2020"
end type

type st_2 from statictext within w2_dynamic_report_month
integer x = 64
integer y = 76
integer width = 238
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Year:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_1 from u_dw within w2_dynamic_report_month
integer x = 50
integer y = 280
integer width = 3383
integer height = 1060
integer taborder = 10
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;
// 04/23/2018: connects to readonly DB
SetTransObject(SQLCArpt)

//SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)

end event

type gb_1 from groupbox within w2_dynamic_report_month
integer x = 46
integer width = 3392
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

