$PBExportHeader$w_rep_nc_quarter_year.srw
forward
global type w_rep_nc_quarter_year from w_sheet
end type
type cb_generate_file from commandbutton within w_rep_nc_quarter_year
end type
type lst_states from my_ddlb within w_rep_nc_quarter_year
end type
type em_year from editmask within w_rep_nc_quarter_year
end type
type st_year from statictext within w_rep_nc_quarter_year
end type
type ddlb_quarter from my_ddlb within w_rep_nc_quarter_year
end type
type st_quarter from statictext within w_rep_nc_quarter_year
end type
type st_state from statictext within w_rep_nc_quarter_year
end type
type cb_1 from commandbutton within w_rep_nc_quarter_year
end type
type st_4 from statictext within w_rep_nc_quarter_year
end type
type st_3 from statictext within w_rep_nc_quarter_year
end type
type cb_query from commandbutton within w_rep_nc_quarter_year
end type
type pb_date1 from picturebutton within w_rep_nc_quarter_year
end type
type em_date1 from pfc_u_em within w_rep_nc_quarter_year
end type
type pb_date2 from picturebutton within w_rep_nc_quarter_year
end type
type em_date2 from pfc_u_em within w_rep_nc_quarter_year
end type
type dw_1 from u_dw within w_rep_nc_quarter_year
end type
type gb_1 from groupbox within w_rep_nc_quarter_year
end type
type gb_2 from groupbox within w_rep_nc_quarter_year
end type
end forward

global type w_rep_nc_quarter_year from w_sheet
boolean visible = false
integer x = 214
integer y = 221
integer width = 3739
integer height = 1992
string menuname = "mb_report"
cb_generate_file cb_generate_file
lst_states lst_states
em_year em_year
st_year st_year
ddlb_quarter ddlb_quarter
st_quarter st_quarter
st_state st_state
cb_1 cb_1
st_4 st_4
st_3 st_3
cb_query cb_query
pb_date1 pb_date1
em_date1 em_date1
pb_date2 pb_date2
em_date2 em_date2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_rep_nc_quarter_year w_rep_nc_quarter_year

type variables
string is_filepath
datetime idt_date_to
end variables

forward prototypes
public subroutine wf_generatefile ()
end prototypes

public subroutine wf_generatefile ();double ld_row_total, row, ld_pos_character
string ls_monthyear, ls_branch, ls_activity, ls_orders, ls_volume, ls_month, ls_year, ls_file_line
long ll_csvfile


if fileexists(is_filepath) then
	if Messagebox("Existing File!","The selected File Name already Exists!, Do you want to to replace it?",StopSign!, yesno!)	= 2 then
		return
	end if
end if

ld_row_total = dw_1.rowcount()
ll_csvfile = FileOpen(is_filepath, LineMode!, Write!, LockWrite!, Replace!)

for row = 1 to ld_row_total
	
	ls_monthyear = dw_1.getitemstring(row,'monthyear')
	
	ls_branch = dw_1.getitemstring(row,'branch')
	
	ls_activity = dw_1.getitemstring(row,'activity')
	
	ls_orders = dw_1.getitemstring(row,'orders')
	
	ls_volume =dw_1.getitemstring(row,'volume' )
	
	
	ld_pos_character = pos(ls_monthyear,'/' )
	
	ls_month = mid(ls_monthyear,1,ld_pos_character - 1 )
	
	ls_year = mid(ls_monthyear,ld_pos_character + 1, 4 )
	
	ls_monthyear = ls_month + ls_year
	
	
	
	ls_file_line = '"'+ls_monthyear+'",'+'"'+ls_branch+'",'+'"'+ls_activity+'",'+'"'+ls_orders+'",'+'"'+ls_volume+'"'
	
	Filewrite(ll_csvfile,ls_file_line)		
	
next
	
	
FileClose(ll_csvfile)

messagebox('Alert','File Created',exclamation!)

end subroutine

on w_rep_nc_quarter_year.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.cb_generate_file=create cb_generate_file
this.lst_states=create lst_states
this.em_year=create em_year
this.st_year=create st_year
this.ddlb_quarter=create ddlb_quarter
this.st_quarter=create st_quarter
this.st_state=create st_state
this.cb_1=create cb_1
this.st_4=create st_4
this.st_3=create st_3
this.cb_query=create cb_query
this.pb_date1=create pb_date1
this.em_date1=create em_date1
this.pb_date2=create pb_date2
this.em_date2=create em_date2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_generate_file
this.Control[iCurrent+2]=this.lst_states
this.Control[iCurrent+3]=this.em_year
this.Control[iCurrent+4]=this.st_year
this.Control[iCurrent+5]=this.ddlb_quarter
this.Control[iCurrent+6]=this.st_quarter
this.Control[iCurrent+7]=this.st_state
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.cb_query
this.Control[iCurrent+12]=this.pb_date1
this.Control[iCurrent+13]=this.em_date1
this.Control[iCurrent+14]=this.pb_date2
this.Control[iCurrent+15]=this.em_date2
this.Control[iCurrent+16]=this.dw_1
this.Control[iCurrent+17]=this.gb_1
this.Control[iCurrent+18]=this.gb_2
end on

on w_rep_nc_quarter_year.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_generate_file)
destroy(this.lst_states)
destroy(this.em_year)
destroy(this.st_year)
destroy(this.ddlb_quarter)
destroy(this.st_quarter)
destroy(this.st_state)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_query)
destroy(this.pb_date1)
destroy(this.em_date1)
destroy(this.pb_date2)
destroy(this.em_date2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
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

event open;call super::open;em_year.text = string(year(today()))

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

type cb_generate_file from commandbutton within w_rep_nc_quarter_year
integer x = 3163
integer y = 88
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Generate File"
end type

event clicked;string ls_path, ls_file, ls_quarter_end, ls_filename
int li_rc
double ld_pos

is_filepath = ""

// ls_path = "" // aqui se puede poner el path default para abrir el dialogo

ls_quarter_end = string(idt_date_to, "YYYYMM")


li_rc = getfolder("Select folder",ls_path)
//li_rc = GetFilesaveName ( "Select File",  ls_path,ls_file,"CSV",  "Comma Separated Files (*.csv),*.csv" , "", 32770)


ls_file = '\'+ ls_quarter_end+ ' NCCOBFinantialData'+'.CSV'


IF li_rc = 1 Then
   is_filepath = ls_path
End If



//is_filepath = is_filepath + ls_file



if is_filepath = "" then	
	Messagebox("No File Selected","Operation Canceled",StopSign!)
else
	
	is_filepath = is_filepath + ls_file
	if Messagebox("Confirmation","Do you want to generate the file "+is_filepath+" with the selected customers?",Question!,YesNo!) <> 1 then
		Messagebox("Operation Canceled","Operation Canceled by the user",Exclamation!)
		return
	end if
	
	wf_generatefile()
	
end if
end event

type lst_states from my_ddlb within w_rep_nc_quarter_year
integer x = 1481
integer y = 88
integer width = 1070
integer height = 948
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
string text = "ALL"
end type

event constructor;call super::constructor;lst_states.addquery("SELECT DISTINCT S.NAME_STATE, S.ID_STATE FROM DBA.BRANCH B, DBA.STATE S WHERE S.ID_STATE = B.ID_STATE AND B.ID_TYPE_BRANCH IN ('A','R') AND S.ID_COUNTRY = 'USA' ORDER BY NAME_STATE;")

lst_states.insertitem('ALL',1 )

lst_states.text = 'ALL'
end event

type em_year from editmask within w_rep_nc_quarter_year
integer x = 242
integer y = 88
integer width = 247
integer height = 80
integer taborder = 20
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

type st_year from statictext within w_rep_nc_quarter_year
integer x = 73
integer y = 100
integer width = 155
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Year:"
boolean focusrectangle = false
end type

type ddlb_quarter from my_ddlb within w_rep_nc_quarter_year
integer x = 809
integer y = 88
integer width = 389
integer height = 316
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
string text = "1"
string item[] = {"1","2","3","4"}
end type

type st_quarter from statictext within w_rep_nc_quarter_year
integer x = 562
integer y = 100
integer width = 229
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Quarter:"
boolean focusrectangle = false
end type

type st_state from statictext within w_rep_nc_quarter_year
integer x = 1262
integer y = 100
integer width = 206
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "State:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_rep_nc_quarter_year
integer x = 2693
integer y = 88
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
boolean default = true
end type

event clicked;Datetime		ld_fecha1
String ls_filter, ls_states
double d_year, d_quarter

IF ddlb_quarter.text = '1' THEN
	
		idt_date_to = datetime('03-31-'+em_year.text+ ' 23:59:59')
	
ELSEIF  ddlb_quarter.text = '2' THEN
	
		idt_date_to = datetime('06-30-'+em_year.text+ ' 23:59:59')
	
ELSEIF  ddlb_quarter.text = '3' THEN
	
		idt_date_to = datetime('09-30-'+em_year.text+ ' 23:59:59')
	
ELSEIF  ddlb_quarter.text = '4' THEN
	
		idt_date_to = datetime('12-31-'+em_year.text+ ' 23:59:59')
	
END IF

d_year  = double(em_year.text)
d_quarter = double(ddlb_quarter.text)


Setpointer(Hourglass!)


if lst_states.getdataid() <> 'ALL' then
	ls_states = lst_states.getdataid()
	dw_1.dataobject = 'dw_nc_quarter_report'
	dw_1.settransobject(sqlca)
	dw_1.Retrieve(d_year, d_quarter, ls_states)
else
	dw_1.dataobject = 'dw_nc_quarter_report_by_state'
	dw_1.settransobject(sqlca)
	dw_1.Retrieve(d_year, d_quarter)
end if		







dw_1.setfocus()

Setpointer(Arrow!)

if dw_1.rowcount() > 0 then
	
	cb_generate_file.enabled = true
	
end if
end event

type st_4 from statictext within w_rep_nc_quarter_year
boolean visible = false
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

type st_3 from statictext within w_rep_nc_quarter_year
boolean visible = false
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

type cb_query from commandbutton within w_rep_nc_quarter_year
boolean visible = false
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

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from picturebutton within w_rep_nc_quarter_year
boolean visible = false
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

type em_date1 from pfc_u_em within w_rep_nc_quarter_year
boolean visible = false
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

type pb_date2 from picturebutton within w_rep_nc_quarter_year
boolean visible = false
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

type em_date2 from pfc_u_em within w_rep_nc_quarter_year
boolean visible = false
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

type dw_1 from u_dw within w_rep_nc_quarter_year
integer x = 18
integer y = 252
integer width = 3634
integer height = 1504
integer taborder = 0
boolean bringtotop = true
string dataobject = "dw_nc_quarter_report"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)

end event

type gb_1 from groupbox within w_rep_nc_quarter_year
boolean visible = false
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

type gb_2 from groupbox within w_rep_nc_quarter_year
integer x = 14
integer width = 3634
integer height = 240
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

