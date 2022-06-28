$PBExportHeader$w_business_owner_list.srw
forward
global type w_business_owner_list from w_sheet
end type
type st_1 from statictext within w_business_owner_list
end type
type em_ssn from editmask within w_business_owner_list
end type
type lst_owners from my_ddlb within w_business_owner_list
end type
type st_state from statictext within w_business_owner_list
end type
type cb_1 from commandbutton within w_business_owner_list
end type
type st_4 from statictext within w_business_owner_list
end type
type st_3 from statictext within w_business_owner_list
end type
type cb_query from commandbutton within w_business_owner_list
end type
type pb_date1 from picturebutton within w_business_owner_list
end type
type em_date1 from pfc_u_em within w_business_owner_list
end type
type pb_date2 from picturebutton within w_business_owner_list
end type
type em_date2 from pfc_u_em within w_business_owner_list
end type
type dw_1 from u_dw within w_business_owner_list
end type
type gb_1 from groupbox within w_business_owner_list
end type
type gb_2 from groupbox within w_business_owner_list
end type
end forward

global type w_business_owner_list from w_sheet
boolean visible = false
integer x = 214
integer y = 221
integer width = 2629
integer height = 1968
string menuname = "mb_report"
st_1 st_1
em_ssn em_ssn
lst_owners lst_owners
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
global w_business_owner_list w_business_owner_list

on w_business_owner_list.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.st_1=create st_1
this.em_ssn=create em_ssn
this.lst_owners=create lst_owners
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
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_ssn
this.Control[iCurrent+3]=this.lst_owners
this.Control[iCurrent+4]=this.st_state
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.cb_query
this.Control[iCurrent+9]=this.pb_date1
this.Control[iCurrent+10]=this.em_date1
this.Control[iCurrent+11]=this.pb_date2
this.Control[iCurrent+12]=this.em_date2
this.Control[iCurrent+13]=this.dw_1
this.Control[iCurrent+14]=this.gb_1
this.Control[iCurrent+15]=this.gb_2
end on

on w_business_owner_list.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.em_ssn)
destroy(this.lst_owners)
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
end event

type st_1 from statictext within w_business_owner_list
integer x = 1472
integer y = 100
integer width = 142
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "SSN:"
boolean focusrectangle = false
end type

type em_ssn from editmask within w_business_owner_list
integer x = 1632
integer y = 88
integer width = 366
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###-##-####"
boolean usecodetable = true
end type

event modified;lst_owners.setselectedid( mid(em_ssn.text,1,3 )+ mid(em_ssn.text,5,2 )+ mid(em_ssn.text,8,4 ) )

// Chequea que este en la lista
IF mid(em_ssn.text,1,3 )+ mid(em_ssn.text,5,2 )+ mid(em_ssn.text,8,4 ) <> lst_owners.getdataid() THEN
	messagebox('Alert','This SSN does not exist, Please Check',stopsign!)
	this.TextColor	= RGB(255,0,0)
	dw_1.reset()
	return
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF
end event

type lst_owners from my_ddlb within w_business_owner_list
integer x = 315
integer y = 88
integer width = 1070
integer height = 948
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
string text = "ALL"
end type

event constructor;call super::constructor;lst_owners.addquery("SELECT distinct   replace(owner_fname+ isnull(' '+owner_mname+' ','')+' '+owner_lname+' '+isnull(owner_slname,''),'  ',' ') as name, OWNER_SSN FROM dba.BRANCH_OWNER_INFORMATION group by OWNER_FNAME,OWNER_MNAME,OWNER_LNAME ,OWNER_SLNAME ,OWNER_SSN;")

lst_owners.insertitem('ALL',1 )

lst_owners.text = 'ALL'
end event

event modified;call super::modified;em_ssn.text ='000-00-'+ right(lst_owners.getdataid(),4)
end event

type st_state from statictext within w_business_owner_list
integer x = 91
integer y = 100
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Owner:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_business_owner_list
integer x = 2098
integer y = 84
integer width = 402
integer height = 92
integer taborder = 60
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
String ls_filter, ls_owners
double d_year, d_quarter,d_ssn

d_ssn = double(mid(em_ssn.text,1,3 )+ mid(em_ssn.text,5,2 )+ mid(em_ssn.text,8,4 ))



Setpointer(Hourglass!)


if  lst_owners.text <> 'ALL' then
	ls_owners = lst_owners.getdataid()
	dw_1.settransobject(sqlca)
	dw_1.Retrieve()
	dw_1.setfilter("owner_ssn =" + ls_owners)
	dw_1.filter()
	
else
	
	dw_1.setfilter("")
	dw_1.settransobject(sqlca)
	dw_1.Retrieve()
	
end if		







dw_1.setfocus()

Setpointer(Arrow!)
end event

type st_4 from statictext within w_business_owner_list
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

type st_3 from statictext within w_business_owner_list
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

type cb_query from commandbutton within w_business_owner_list
boolean visible = false
integer x = 1326
integer y = 60
integer width = 366
integer height = 92
integer taborder = 70
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

type pb_date1 from picturebutton within w_business_owner_list
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

type em_date1 from pfc_u_em within w_business_owner_list
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

type pb_date2 from picturebutton within w_business_owner_list
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

type em_date2 from pfc_u_em within w_business_owner_list
boolean visible = false
integer x = 823
integer y = 64
integer width = 320
integer height = 84
integer taborder = 40
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

type dw_1 from u_dw within w_business_owner_list
integer x = 18
integer y = 252
integer width = 2533
integer height = 1480
integer taborder = 0
boolean bringtotop = true
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)

end event

type gb_1 from groupbox within w_business_owner_list
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

type gb_2 from groupbox within w_business_owner_list
integer x = 18
integer width = 2528
integer height = 248
integer taborder = 20
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

