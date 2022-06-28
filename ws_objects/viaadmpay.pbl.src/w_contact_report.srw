$PBExportHeader$w_contact_report.srw
forward
global type w_contact_report from w2_master_report_dates_payer
end type
end forward

global type w_contact_report from w2_master_report_dates_payer
integer width = 4261
integer height = 2028
end type
global w_contact_report w_contact_report

on w_contact_report.create
call super::create
end on

on w_contact_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates_payer`st_4 within w_contact_report
boolean visible = false
end type

type st_3 from w2_master_report_dates_payer`st_3 within w_contact_report
boolean visible = false
end type

type cb_query from w2_master_report_dates_payer`cb_query within w_contact_report
integer x = 1458
integer y = 64
end type

event cb_query::clicked;String		ls_payer_id

Setpointer(Hourglass!)

ls_payer_id = lst_payers.getdataid()
dw_1.retrieve(ls_payer_id)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates_payer`pb_date1 within w_contact_report
boolean visible = false
end type

type em_date1 from w2_master_report_dates_payer`em_date1 within w_contact_report
boolean visible = false
end type

type pb_date2 from w2_master_report_dates_payer`pb_date2 within w_contact_report
boolean visible = false
end type

type em_date2 from w2_master_report_dates_payer`em_date2 within w_contact_report
boolean visible = false
end type

type dw_1 from w2_master_report_dates_payer`dw_1 within w_contact_report
integer x = 0
integer y = 192
integer width = 4206
string dataobject = "dw_contact_report"
end type

type gb_1 from w2_master_report_dates_payer`gb_1 within w_contact_report
integer x = 0
integer width = 1902
integer height = 192
end type

type lst_payers from w2_master_report_dates_payer`lst_payers within w_contact_report
integer x = 247
end type

type st_1 from w2_master_report_dates_payer`st_1 within w_contact_report
integer x = 78
end type

type sle_payer from w2_master_report_dates_payer`sle_payer within w_contact_report
integer x = 1230
integer width = 210
end type

