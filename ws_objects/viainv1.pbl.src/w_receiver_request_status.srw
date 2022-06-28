$PBExportHeader$w_receiver_request_status.srw
forward
global type w_receiver_request_status from wb_report
end type
type cb_query from commandbutton within w_receiver_request_status
end type
type em_date1 from editmask within w_receiver_request_status
end type
type rb_ip from radiobutton within w_receiver_request_status
end type
type rb_co from radiobutton within w_receiver_request_status
end type
type st_2 from statictext within w_receiver_request_status
end type
type em_date2 from editmask within w_receiver_request_status
end type
type sle_branch from singlelineedit within w_receiver_request_status
end type
type cbx_date from checkbox within w_receiver_request_status
end type
type cbx_branch from checkbox within w_receiver_request_status
end type
type cbx_payer from checkbox within w_receiver_request_status
end type
type lst_payers from my_ddlb within w_receiver_request_status
end type
type st_1 from statictext within w_receiver_request_status
end type
type lst_segmentation from my_ddlb within w_receiver_request_status
end type
type gb_1 from groupbox within w_receiver_request_status
end type
type gb_2 from groupbox within w_receiver_request_status
end type
end forward

global type w_receiver_request_status from wb_report
integer width = 4357
integer height = 1960
string title = "Modification/Cancelation Requests"
long backcolor = 80269524
cb_query cb_query
em_date1 em_date1
rb_ip rb_ip
rb_co rb_co
st_2 st_2
em_date2 em_date2
sle_branch sle_branch
cbx_date cbx_date
cbx_branch cbx_branch
cbx_payer cbx_payer
lst_payers lst_payers
st_1 st_1
lst_segmentation lst_segmentation
gb_1 gb_1
gb_2 gb_2
end type
global w_receiver_request_status w_receiver_request_status

type variables
integer ii_MaxRangeDaysRstatus
end variables

forward prototypes
public function integer fn_validate_dates ()
end prototypes

public function integer fn_validate_dates ();date ld_fecha_inicio, ld_fecha_fin
integer li_datediff

ld_fecha_inicio = date(em_date1.text)
ld_fecha_fin = date(em_date2.text)

li_datediff = DaysAfter(ld_fecha_inicio, ld_fecha_fin)

IF li_datediff > ii_MaxRangeDaysRStatus THEN
	messagebox("Error", "Days between Range Dates cannot be greater than " + string(ii_MaxRangeDaysRStatus) + " days")
	return -1
END IF 

return 1
end function

on w_receiver_request_status.create
int iCurrent
call super::create
this.cb_query=create cb_query
this.em_date1=create em_date1
this.rb_ip=create rb_ip
this.rb_co=create rb_co
this.st_2=create st_2
this.em_date2=create em_date2
this.sle_branch=create sle_branch
this.cbx_date=create cbx_date
this.cbx_branch=create cbx_branch
this.cbx_payer=create cbx_payer
this.lst_payers=create lst_payers
this.st_1=create st_1
this.lst_segmentation=create lst_segmentation
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_query
this.Control[iCurrent+2]=this.em_date1
this.Control[iCurrent+3]=this.rb_ip
this.Control[iCurrent+4]=this.rb_co
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.em_date2
this.Control[iCurrent+7]=this.sle_branch
this.Control[iCurrent+8]=this.cbx_date
this.Control[iCurrent+9]=this.cbx_branch
this.Control[iCurrent+10]=this.cbx_payer
this.Control[iCurrent+11]=this.lst_payers
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.lst_segmentation
this.Control[iCurrent+14]=this.gb_1
this.Control[iCurrent+15]=this.gb_2
end on

on w_receiver_request_status.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_query)
destroy(this.em_date1)
destroy(this.rb_ip)
destroy(this.rb_co)
destroy(this.st_2)
destroy(this.em_date2)
destroy(this.sle_branch)
destroy(this.cbx_date)
destroy(this.cbx_branch)
destroy(this.cbx_payer)
destroy(this.lst_payers)
destroy(this.st_1)
destroy(this.lst_segmentation)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;em_date1.text = string(today())
em_date2.text = string(today())
lst_payers.addquery("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE GROUP_TYPE IN ('P') AND FLAG_GRUPO = 'A' ORDER BY name_main_branch;")
cb_query.triggerevent(Clicked!)

SELECT numericvalue
INTO :ii_MaxRangeDaysRStatus
FROM dba.PARAMETERS
WHERE idparameter = "MaxRangeDaysRStatus";
end event

type dw_1 from wb_report`dw_1 within w_receiver_request_status
integer x = 14
integer y = 252
integer width = 3941
integer height = 1516
integer taborder = 0
string dataobject = "dw_receiver_request_status"
end type

event dw_1::constructor;SetTransObject(SQLCArpt)
//this.retrieve()
//of_setfilter(true)
//of_setsort(true)
//of_SetResize(true)
//of_setprintpreview(true)
//of_SetFind(true)
//inv_resize.of_SetOrigSize(1592, 537)
end event

event dw_1::clicked;call super::clicked;long ll_row
ll_row = dw_1.GetClickedRow()
dw_1.SelectRow(0,FALSE)
if ll_row > 0 then
	 dw_1.Scrolltorow(ll_row)
	 dw_1.SelectRow(ll_row,TRUE)
end if
end event

event dw_1::resize;this.width = parent.width - (3785 - 3712 - 10)
this.height = parent.height - (1964 - 1564 - 60)
end event

event dw_1::sqlpreview;call super::sqlpreview;String ls_filter

ls_filter = ""

if rb_ip.checked then
	ls_filter += " AND id_response IS NULL "
else
	ls_filter += " AND id_response IS NOT NULL "
end if

if cbx_date.checked then
	ls_filter += " AND received_time >= '"+String(date(em_date1.text),"yyyy-mm-dd")+" 00:00:00'"
	ls_filter += " AND received_time <= '"+String(date(em_date2.text),"yyyy-mm-dd")+" 23:59:59'"
end if

if cbx_branch.checked then
	ls_filter += " AND dba.receiver_request.id_branch = '"+trim(sle_branch.text)+"'"
end if

if cbx_payer.checked then
	ls_filter += " AND dba.sfGetReceiverPayerId(dba.receiver.id_branch,dba.receiver.id_receiver)  = '"+trim(lst_payers.getdataid())+"'"
end if

IF trim(lst_segmentation.getdataid()) <> '%' THEN
	ls_filter += " AND S.ID_SEGMENTATION = '"+trim(lst_segmentation.getdataid())+"'"
END IF

ls_filter += "  ORDER BY SEGMENTATION_ORDER, dba.RECEIVER_REQUEST.RECEIVED_TIME"
  
//Messagebox("",ls_filter)
STRING s_total


s_total = sqlsyntax+ls_filter

dw_1.setsqlpreview(sqlsyntax+ls_filter)
end event

event dw_1::buttonclicked;call super::buttonclicked;String	ls_id_branch, ls_id_type_req
Double	ld_id_receiver

ls_id_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
ld_id_receiver = dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
ls_id_type_req = dw_1.getitemstring(dw_1.getrow(),"id_type_req")

OpenWithParm(w_receiver_request_details,ls_id_branch+'*'+string(ld_id_receiver)+"*"+ls_id_type_req)

end event

type cb_query from commandbutton within w_receiver_request_status
string tag = "Query"
integer x = 3858
integer y = 52
integer width = 421
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query/Refresh"
boolean default = true
end type

event clicked;IF cbx_date.checked THEN
	IF cbx_date.checked AND fn_validate_dates() = -1 THEN Return
END IF

IF dw_1.retrieve() = 0 THEN
	messagebox('Atention','No data was found.')
	Return
END IF
//dw_1.setsort('received_time asc')

end event

type em_date1 from editmask within w_receiver_request_status
integer x = 1568
integer y = 124
integer width = 302
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
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event modified;fn_validate_dates()
end event

type rb_ip from radiobutton within w_receiver_request_status
integer x = 50
integer y = 80
integer width = 338
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "In Process"
boolean checked = true
end type

event clicked;cbx_date.checked = false
cbx_date.enabled = true

em_date1.enabled = cbx_date.checked
em_date2.enabled = cbx_date.checked
end event

type rb_co from radiobutton within w_receiver_request_status
integer x = 50
integer y = 152
integer width = 325
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Completed"
end type

event clicked;cbx_date.checked = true
cbx_date.enabled = false

em_date1.enabled = cbx_date.checked
em_date2.enabled = cbx_date.checked

end event

type st_2 from statictext within w_receiver_request_status
integer x = 1874
integer y = 128
integer width = 101
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "and"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_date2 from editmask within w_receiver_request_status
integer x = 1979
integer y = 124
integer width = 302
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event modified;fn_validate_dates()
end event

type sle_branch from singlelineedit within w_receiver_request_status
integer x = 2537
integer y = 124
integer width = 288
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type cbx_date from checkbox within w_receiver_request_status
integer x = 1559
integer y = 52
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date Between:"
end type

event clicked;em_date1.enabled = this.checked
em_date2.enabled = this.checked
end event

type cbx_branch from checkbox within w_receiver_request_status
integer x = 2537
integer y = 52
integer width = 256
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Branch:"
end type

event clicked;sle_branch.enabled = this.checked
end event

type cbx_payer from checkbox within w_receiver_request_status
integer x = 558
integer y = 52
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer:"
end type

event clicked;lst_payers.enabled = this.checked
end event

type lst_payers from my_ddlb within w_receiver_request_status
integer x = 558
integer y = 124
integer width = 814
integer height = 1076
integer taborder = 10
boolean bringtotop = true
boolean enabled = false
end type

type st_1 from statictext within w_receiver_request_status
integer x = 3058
integer y = 52
integer width = 343
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Segmentation:"
boolean focusrectangle = false
end type

type lst_segmentation from my_ddlb within w_receiver_request_status
integer x = 3063
integer y = 124
integer width = 722
integer height = 452
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
end type

event constructor;call super::constructor;this.addquery("SELECT RTRIM(S.SEGMENTATION_NAME) + ' ONLY', S.ID_SEGMENTATION	FROM dba.AGENCY_SEGMENTATION S UNION ALL SELECT 'ALL AGENCIES', '%' ORDER BY S.ID_SEGMENTATION;")
end event

type gb_1 from groupbox within w_receiver_request_status
integer x = 485
integer width = 3337
integer height = 224
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

type gb_2 from groupbox within w_receiver_request_status
integer x = 14
integer width = 462
integer height = 232
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Request Type"
end type

