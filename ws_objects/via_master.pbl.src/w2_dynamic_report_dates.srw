$PBExportHeader$w2_dynamic_report_dates.srw
forward
global type w2_dynamic_report_dates from w_sheet
end type
type st_4 from statictext within w2_dynamic_report_dates
end type
type st_3 from statictext within w2_dynamic_report_dates
end type
type cb_query from commandbutton within w2_dynamic_report_dates
end type
type pb_date1 from picturebutton within w2_dynamic_report_dates
end type
type em_date1 from pfc_u_em within w2_dynamic_report_dates
end type
type pb_date2 from picturebutton within w2_dynamic_report_dates
end type
type em_date2 from pfc_u_em within w2_dynamic_report_dates
end type
type dw_1 from u_dw within w2_dynamic_report_dates
end type
type gb_1 from groupbox within w2_dynamic_report_dates
end type
end forward

global type w2_dynamic_report_dates from w_sheet
boolean visible = false
integer width = 3218
integer height = 1912
string menuname = "mb_report"
st_4 st_4
st_3 st_3
cb_query cb_query
pb_date1 pb_date1
em_date1 em_date1
pb_date2 pb_date2
em_date2 em_date2
dw_1 dw_1
gb_1 gb_1
end type
global w2_dynamic_report_dates w2_dynamic_report_dates

on w2_dynamic_report_dates.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.st_4=create st_4
this.st_3=create st_3
this.cb_query=create cb_query
this.pb_date1=create pb_date1
this.em_date1=create em_date1
this.pb_date2=create pb_date2
this.em_date2=create em_date2
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.cb_query
this.Control[iCurrent+4]=this.pb_date1
this.Control[iCurrent+5]=this.em_date1
this.Control[iCurrent+6]=this.pb_date2
this.Control[iCurrent+7]=this.em_date2
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.gb_1
end on

on w2_dynamic_report_dates.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_query)
destroy(this.pb_date1)
destroy(this.em_date1)
destroy(this.pb_date2)
destroy(this.em_date2)
destroy(this.dw_1)
destroy(this.gb_1)
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

event open;call super::open;//**************DINAMIC PRINT WINDOW******************
//- Recibe parametros de dw y nombre de ventana dinamicamente, 
//  para ser usado con reportes que usen como filtros date y agency
//**************************************************

string s_parm

s_parm = Message.StringParm
dw_1.dataobject = fn_token(s_parm,'/',1)
this.title = fn_token(s_parm,'/',2)

X=1
Y=1
Show()

em_date1.text = String(Today())
em_date2.text = String(Today())


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

type st_4 from statictext within w2_dynamic_report_dates
integer x = 713
integer y = 80
integer width = 101
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w2_dynamic_report_dates
integer x = 59
integer y = 80
integer width = 165
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_query from commandbutton within w2_dynamic_report_dates
integer x = 1326
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

event clicked;Datetime		ld_fecha1, ld_fecha2
date ld_fecha_ofac, ld_fecha_ofac2
Setpointer(Hourglass!)

dw_1.settransobject( sqlcarpt)

if dw_1.dataobject = 'dw_rep_interface_detail' then
	ld_fecha_ofac = Date(em_date1.text)
	ld_fecha_ofac2 = RelativeDate(Date(em_date2.text),1)
	
	dw_1.retrieve(ld_fecha_ofac,ld_fecha_ofac2)
	dw_1.setfocus()
else

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()


end if


Setpointer(Arrow!)




end event

type pb_date1 from picturebutton within w2_dynamic_report_dates
integer x = 558
integer y = 60
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date1.Event pfc_DDCalendar( )
end event

type em_date1 from pfc_u_em within w2_dynamic_report_dates
integer x = 233
integer y = 64
integer width = 320
integer height = 84
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type pb_date2 from picturebutton within w2_dynamic_report_dates
integer x = 1147
integer y = 60
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date2.Event pfc_DDCalendar( )
end event

type em_date2 from pfc_u_em within w2_dynamic_report_dates
integer x = 823
integer y = 64
integer width = 320
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type dw_1 from u_dw within w2_dynamic_report_dates
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

type gb_1 from groupbox within w2_dynamic_report_dates
integer x = 18
integer width = 1737
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Range"
end type

