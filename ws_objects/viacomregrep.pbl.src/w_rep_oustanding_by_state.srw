$PBExportHeader$w_rep_oustanding_by_state.srw
forward
global type w_rep_oustanding_by_state from w2_master_report_dates
end type
end forward

global type w_rep_oustanding_by_state from w2_master_report_dates
end type
global w_rep_oustanding_by_state w_rep_oustanding_by_state

on w_rep_oustanding_by_state.create
call super::create
end on

on w_rep_oustanding_by_state.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_oustanding_by_state
boolean visible = false
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_oustanding_by_state
integer width = 539
string text = "Outstanding Orders as:"
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_oustanding_by_state
integer x = 1463
integer y = 64
end type

event cb_query::clicked;Datetime		ld_date

Setpointer(Hourglass!)

ld_date = Datetime(Date(em_date1.text),time('00:00:00'))

dw_1.retrieve(ld_date)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_oustanding_by_state
integer x = 951
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_oustanding_by_state
integer x = 626
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_oustanding_by_state
boolean visible = false
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_oustanding_by_state
boolean visible = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_oustanding_by_state
integer width = 3127
string dataobject = "dw_rep_oustanding_by_state"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_oustanding_by_state
integer x = 0
integer width = 1938
integer height = 192
end type

