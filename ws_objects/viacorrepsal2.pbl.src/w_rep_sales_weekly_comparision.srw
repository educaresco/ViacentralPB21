$PBExportHeader$w_rep_sales_weekly_comparision.srw
forward
global type w_rep_sales_weekly_comparision from w2_master_report_dates
end type
end forward

global type w_rep_sales_weekly_comparision from w2_master_report_dates
integer x = 214
integer y = 221
end type
global w_rep_sales_weekly_comparision w_rep_sales_weekly_comparision

on w_rep_sales_weekly_comparision.create
call super::create
end on

on w_rep_sales_weekly_comparision.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_sales_weekly_comparision
integer x = 87
integer width = 133
string text = "Date:"
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_sales_weekly_comparision
boolean visible = false
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_sales_weekly_comparision
integer x = 736
end type

event cb_query::clicked;Date	ld_fecha1

Setpointer(Hourglass!)

ld_fecha1 = Date(em_date2.text)

dw_1.retrieve(ld_fecha1)

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_sales_weekly_comparision
boolean visible = false
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_sales_weekly_comparision
boolean visible = false
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_sales_weekly_comparision
integer x = 558
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_sales_weekly_comparision
integer x = 233
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_sales_weekly_comparision
string title = "Weekly Comparision"
string dataobject = "dw_rep_sales_weekly_comparision"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_sales_weekly_comparision
integer width = 1175
string text = ""
end type

