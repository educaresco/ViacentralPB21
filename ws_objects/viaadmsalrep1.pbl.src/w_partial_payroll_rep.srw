$PBExportHeader$w_partial_payroll_rep.srw
forward
global type w_partial_payroll_rep from w2_master_report_dates
end type
end forward

global type w_partial_payroll_rep from w2_master_report_dates
end type
global w_partial_payroll_rep w_partial_payroll_rep

event open;call super::open;
em_date1.text = string(month(today()))+ '/01/' + string(year(today()) )

em_date2.text = string(date(today()))
end event

on w_partial_payroll_rep.create
call super::create
end on

on w_partial_payroll_rep.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates`st_4 within w_partial_payroll_rep
end type

type st_3 from w2_master_report_dates`st_3 within w_partial_payroll_rep
end type

type cb_query from w2_master_report_dates`cb_query within w_partial_payroll_rep
end type

event cb_query::clicked;call super::clicked;dw_1.retrieve()
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_partial_payroll_rep
end type

type em_date1 from w2_master_report_dates`em_date1 within w_partial_payroll_rep
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_partial_payroll_rep
end type

type em_date2 from w2_master_report_dates`em_date2 within w_partial_payroll_rep
end type

type dw_1 from w2_master_report_dates`dw_1 within w_partial_payroll_rep
string dataobject = "dw_partialpayroll_report"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_partial_payroll_rep
end type

