$PBExportHeader$w_rep_paymentpoints.srw
forward
global type w_rep_paymentpoints from w2_master_report_dates
end type
end forward

global type w_rep_paymentpoints from w2_master_report_dates
integer x = 214
integer y = 221
end type
global w_rep_paymentpoints w_rep_paymentpoints

on w_rep_paymentpoints.create
call super::create
end on

on w_rep_paymentpoints.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_paymentpoints
boolean visible = false
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_paymentpoints
integer x = 96
string text = "Date:"
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_paymentpoints
integer x = 814
end type

event cb_query::clicked;Datetime		ld_fecha1

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
dw_1.retrieve(ld_fecha1)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_paymentpoints
integer x = 594
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_paymentpoints
integer x = 270
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_paymentpoints
boolean visible = false
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_paymentpoints
boolean visible = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_paymentpoints
string dataobject = "dw_rep_paymentpoints"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_paymentpoints
integer x = 37
integer width = 1280
integer height = 192
string text = ""
end type

