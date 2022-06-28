$PBExportHeader$w2_dynamic_report_onedate.srw
forward
global type w2_dynamic_report_onedate from w_sheet
end type
type cbx_fileucc from checkbox within w2_dynamic_report_onedate
end type
type cbx_preucc from checkbox within w2_dynamic_report_onedate
end type
type st_3 from statictext within w2_dynamic_report_onedate
end type
type cb_query from commandbutton within w2_dynamic_report_onedate
end type
type pb_date1 from picturebutton within w2_dynamic_report_onedate
end type
type em_date1 from pfc_u_em within w2_dynamic_report_onedate
end type
type dw_1 from u_dw within w2_dynamic_report_onedate
end type
type gb_ucc from groupbox within w2_dynamic_report_onedate
end type
type gb_1 from groupbox within w2_dynamic_report_onedate
end type
end forward

global type w2_dynamic_report_onedate from w_sheet
boolean visible = false
integer width = 3218
integer height = 2008
string menuname = "mb_report"
cbx_fileucc cbx_fileucc
cbx_preucc cbx_preucc
st_3 st_3
cb_query cb_query
pb_date1 pb_date1
em_date1 em_date1
dw_1 dw_1
gb_ucc gb_ucc
gb_1 gb_1
end type
global w2_dynamic_report_onedate w2_dynamic_report_onedate

type variables
n_tr		SQLCADEV
end variables

on w2_dynamic_report_onedate.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.cbx_fileucc=create cbx_fileucc
this.cbx_preucc=create cbx_preucc
this.st_3=create st_3
this.cb_query=create cb_query
this.pb_date1=create pb_date1
this.em_date1=create em_date1
this.dw_1=create dw_1
this.gb_ucc=create gb_ucc
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_fileucc
this.Control[iCurrent+2]=this.cbx_preucc
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.cb_query
this.Control[iCurrent+5]=this.pb_date1
this.Control[iCurrent+6]=this.em_date1
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.gb_ucc
this.Control[iCurrent+9]=this.gb_1
end on

on w2_dynamic_report_onedate.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_fileucc)
destroy(this.cbx_preucc)
destroy(this.st_3)
destroy(this.cb_query)
destroy(this.pb_date1)
destroy(this.em_date1)
destroy(this.dw_1)
destroy(this.gb_ucc)
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

event open;call super::open;X=1
Y=1
Show()

//st_1.visible = false

string s_parm

s_parm = Message.StringParm
dw_1.dataobject = fn_token(s_parm,'/',1)
this.title = fn_token(s_parm,'/',2)

em_date1.text = String(Today())
//em_date2.text = String(Today())

if dw_1.dataobject = 'dw_ucc_report' then
	
	gb_ucc.visible = true
	
	cbx_preucc. visible = true
	cbx_preucc.checked = true
	
	cbx_fileucc.visible = true
	cbx_fileucc.checked = true
	
	
end if

//if dw_1.dataobject = 'dw_oustanding_orders_payment_date' or dw_1.dataobject =  'dw_rep_aging_365' then
//	st_1.visible = true
//end if
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

type cbx_fileucc from checkbox within w2_dynamic_report_onedate
boolean visible = false
integer x = 841
integer y = 172
integer width = 293
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "File UCC"
end type

type cbx_preucc from checkbox within w2_dynamic_report_onedate
boolean visible = false
integer x = 841
integer y = 88
integer width = 457
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Pre-Existing UCC"
end type

type st_3 from statictext within w2_dynamic_report_onedate
integer x = 59
integer y = 120
integer width = 165
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Date:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_query from commandbutton within w2_dynamic_report_onedate
integer x = 1486
integer y = 96
integer width = 366
integer height = 96
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
string s_filter

	
//if dw_1.dataobject = 'dw_oustanding_orders_payment_date' or dw_1.dataobject =  'dw_rep_aging_365' then
//			
//	// :::::::::::::::::::::::::::::::::::::::::
//	// LOGIN DB CONNECTION
//	SQLCADEV 				= Create n_tr
//	SQLCADEV.DBMS 		= "SNC SQL Native Client(OLE DB)"
//	SQLCADEV.DBParm = "Database='EnvioRep',TrimSpaces=1"
//	SQLCADEV.LogPass 	= 'Xr3nrg101dbT.0p'
//	SQLCADEV.ServerName = '192.168.11.120\VIASQLDEV'
//	SQLCADEV.LogId 		= 'sa'
//	SQLCADEV.AutoCommit = True
//	// :::::::::::::::::::::::::::::::::::::::::		
//		
//	
//	if SQLCADEV.of_connect() <> 0 then
//		MessageBox("Cannot Connect", "Cannot Connect to ViaChecks Database~n~r" + SQLCADEV.sqlerrtext,stopsign!)
//		return	
//	end if
//	
//	
//	dw_1.SetTransObject(SQLCADEV)
//	dw_1.of_setfilter(true)
//	dw_1.of_setsort(true)
//	dw_1.of_setprintpreview(true)
//	dw_1.of_SetFind(true)
//
//	
//else

	dw_1.settransobject(sqlcarpt)

//end if

Setpointer(Hourglass!)

if dw_1.dataobject = 'dw_ucc_report' then
	if cbx_preucc.checked = true AND cbx_fileucc.checked = false then
		s_filter ="preexisting_ucc = '" + 'Y' + " '" 
	else
		if cbx_preucc.checked = false AND cbx_fileucc.checked = true then
			s_filter = "file_ucc = '" + 'Y' + " '" 
		end if	
	end if
end if


ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))


dw_1.retrieve(ld_Fecha1)
dw_1.setfocus()
dw_1.setfilter( s_filter )
dw_1.filter()
Setpointer(Arrow!)
end event

type pb_date1 from picturebutton within w2_dynamic_report_onedate
integer x = 558
integer y = 100
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

type em_date1 from pfc_u_em within w2_dynamic_report_onedate
integer x = 233
integer y = 104
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

type dw_1 from u_dw within w2_dynamic_report_onedate
integer x = 18
integer y = 288
integer width = 3118
integer height = 1508
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

type gb_ucc from groupbox within w2_dynamic_report_onedate
boolean visible = false
integer x = 768
integer y = 28
integer width = 571
integer height = 228
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "UCC"
end type

type gb_1 from groupbox within w2_dynamic_report_onedate
integer x = 18
integer width = 3113
integer height = 268
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Date"
end type

