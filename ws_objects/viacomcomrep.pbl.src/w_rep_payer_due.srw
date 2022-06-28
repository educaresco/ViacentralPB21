$PBExportHeader$w_rep_payer_due.srw
forward
global type w_rep_payer_due from w2_master_report_dates_country
end type
end forward

global type w_rep_payer_due from w2_master_report_dates_country
integer width = 3237
integer height = 1928
end type
global w_rep_payer_due w_rep_payer_due

on w_rep_payer_due.create
call super::create
end on

on w_rep_payer_due.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates_country`st_4 within w_rep_payer_due
end type

type st_3 from w2_master_report_dates_country`st_3 within w_rep_payer_due
end type

type cb_query from w2_master_report_dates_country`cb_query within w_rep_payer_due
end type

type pb_date1 from w2_master_report_dates_country`pb_date1 within w_rep_payer_due
end type

type em_date1 from w2_master_report_dates_country`em_date1 within w_rep_payer_due
end type

type pb_date2 from w2_master_report_dates_country`pb_date2 within w_rep_payer_due
end type

type em_date2 from w2_master_report_dates_country`em_date2 within w_rep_payer_due
end type

type dw_1 from w2_master_report_dates_country`dw_1 within w_rep_payer_due
string dataobject = "dw_rep_payer_due"
end type

type gb_1 from w2_master_report_dates_country`gb_1 within w_rep_payer_due
end type

type lst_countries from w2_master_report_dates_country`lst_countries within w_rep_payer_due
end type

type st_1 from w2_master_report_dates_country`st_1 within w_rep_payer_due
end type

