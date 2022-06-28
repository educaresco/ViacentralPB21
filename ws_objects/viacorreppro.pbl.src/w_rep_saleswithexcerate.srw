$PBExportHeader$w_rep_saleswithexcerate.srw
forward
global type w_rep_saleswithexcerate from w2_master_report_dates_agency
end type
type cbx_filter from checkbox within w_rep_saleswithexcerate
end type
end forward

global type w_rep_saleswithexcerate from w2_master_report_dates_agency
integer x = 214
integer y = 221
integer width = 3529
integer height = 1936
cbx_filter cbx_filter
end type
global w_rep_saleswithexcerate w_rep_saleswithexcerate

on w_rep_saleswithexcerate.create
int iCurrent
call super::create
this.cbx_filter=create cbx_filter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_filter
end on

on w_rep_saleswithexcerate.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_filter)
end on

type st_4 from w2_master_report_dates_agency`st_4 within w_rep_saleswithexcerate
end type

type st_3 from w2_master_report_dates_agency`st_3 within w_rep_saleswithexcerate
end type

type cb_query from w2_master_report_dates_agency`cb_query within w_rep_saleswithexcerate
integer x = 3013
integer taborder = 60
end type

event cb_query::clicked;call super::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_branch_id

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
if cbx_filter.checked then
	ls_branch_id = lst_agencies.getdataid()
else
	ls_branch_id = '*ALL*'
end if

dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_branch_id)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates_agency`pb_date1 within w_rep_saleswithexcerate
end type

type em_date1 from w2_master_report_dates_agency`em_date1 within w_rep_saleswithexcerate
end type

type pb_date2 from w2_master_report_dates_agency`pb_date2 within w_rep_saleswithexcerate
end type

type em_date2 from w2_master_report_dates_agency`em_date2 within w_rep_saleswithexcerate
end type

type dw_1 from w2_master_report_dates_agency`dw_1 within w_rep_saleswithexcerate
integer width = 3397
string dataobject = "dw_rep_saleswithexcerate"
end type

type gb_1 from w2_master_report_dates_agency`gb_1 within w_rep_saleswithexcerate
integer width = 3392
end type

type lst_agencies from w2_master_report_dates_agency`lst_agencies within w_rep_saleswithexcerate
integer x = 1979
integer taborder = 50
boolean enabled = false
end type

type st_1 from w2_master_report_dates_agency`st_1 within w_rep_saleswithexcerate
integer x = 1495
end type

type sle_idbranch from w2_master_report_dates_agency`sle_idbranch within w_rep_saleswithexcerate
integer x = 1710
integer taborder = 40
boolean enabled = false
end type

type cbx_filter from checkbox within w_rep_saleswithexcerate
integer x = 1253
integer y = 76
integer width = 238
integer height = 64
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Filter:"
end type

event clicked;sle_idbranch.enabled = this.checked
lst_agencies.enabled = this.checked
end event

