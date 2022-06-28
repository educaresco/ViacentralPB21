$PBExportHeader$w_rep_sales_agencies.srw
forward
global type w_rep_sales_agencies from w2_master_report_dates_agency
end type
type cbx_all from checkbox within w_rep_sales_agencies
end type
end forward

global type w_rep_sales_agencies from w2_master_report_dates_agency
integer x = 214
integer y = 221
integer width = 3223
integer height = 1920
cbx_all cbx_all
end type
global w_rep_sales_agencies w_rep_sales_agencies

on w_rep_sales_agencies.create
int iCurrent
call super::create
this.cbx_all=create cbx_all
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_all
end on

on w_rep_sales_agencies.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_all)
end on

type st_4 from w2_master_report_dates_agency`st_4 within w_rep_sales_agencies
end type

type st_3 from w2_master_report_dates_agency`st_3 within w_rep_sales_agencies
end type

type cb_query from w2_master_report_dates_agency`cb_query within w_rep_sales_agencies
end type

event cb_query::clicked;

Datetime		ld_fecha1, ld_fecha2
String		ls_branch_id, ls_filter

if cbx_all.checked then
	ls_filter = '-ALL-' 
else
	ls_filter = '----' 
end if

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_branch_id = lst_agencies.getdataid()
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_branch_id,ls_filter)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates_agency`pb_date1 within w_rep_sales_agencies
end type

type em_date1 from w2_master_report_dates_agency`em_date1 within w_rep_sales_agencies
end type

type pb_date2 from w2_master_report_dates_agency`pb_date2 within w_rep_sales_agencies
end type

type em_date2 from w2_master_report_dates_agency`em_date2 within w_rep_sales_agencies
end type

type dw_1 from w2_master_report_dates_agency`dw_1 within w_rep_sales_agencies
integer y = 240
integer height = 1460
string dataobject = "dw_rep_sales_agencies"
end type

type gb_1 from w2_master_report_dates_agency`gb_1 within w_rep_sales_agencies
integer height = 232
end type

type lst_agencies from w2_master_report_dates_agency`lst_agencies within w_rep_sales_agencies
end type

event lst_agencies::constructor;this.addqueryall("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O' order by name_branch;")
end event

type st_1 from w2_master_report_dates_agency`st_1 within w_rep_sales_agencies
end type

type sle_idbranch from w2_master_report_dates_agency`sle_idbranch within w_rep_sales_agencies
end type

type cbx_all from checkbox within w_rep_sales_agencies
integer x = 1422
integer y = 152
integer width = 937
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Include Closed Agencies"
end type

