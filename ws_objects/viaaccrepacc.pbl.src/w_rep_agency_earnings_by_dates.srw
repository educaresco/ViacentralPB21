$PBExportHeader$w_rep_agency_earnings_by_dates.srw
forward
global type w_rep_agency_earnings_by_dates from w2_master_report_dates_agency
end type
end forward

global type w_rep_agency_earnings_by_dates from w2_master_report_dates_agency
string title = "Agency Earnings Report"
end type
global w_rep_agency_earnings_by_dates w_rep_agency_earnings_by_dates

on w_rep_agency_earnings_by_dates.create
call super::create
end on

on w_rep_agency_earnings_by_dates.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;
string ls_prev_year

ls_prev_year = string( double(string(today(),"yyyy")) - 1)

em_date1.text = String('01/01/'+ls_prev_year)
em_date2.text = String('12/31/'+ls_prev_year)

end event

type st_4 from w2_master_report_dates_agency`st_4 within w_rep_agency_earnings_by_dates
end type

type st_3 from w2_master_report_dates_agency`st_3 within w_rep_agency_earnings_by_dates
end type

type cb_query from w2_master_report_dates_agency`cb_query within w_rep_agency_earnings_by_dates
end type

type pb_date1 from w2_master_report_dates_agency`pb_date1 within w_rep_agency_earnings_by_dates
end type

type em_date1 from w2_master_report_dates_agency`em_date1 within w_rep_agency_earnings_by_dates
end type

type pb_date2 from w2_master_report_dates_agency`pb_date2 within w_rep_agency_earnings_by_dates
end type

type em_date2 from w2_master_report_dates_agency`em_date2 within w_rep_agency_earnings_by_dates
end type

type dw_1 from w2_master_report_dates_agency`dw_1 within w_rep_agency_earnings_by_dates
string dataobject = "dw_rep_agency_earnings_by_dates"
end type

type gb_1 from w2_master_report_dates_agency`gb_1 within w_rep_agency_earnings_by_dates
end type

type lst_agencies from w2_master_report_dates_agency`lst_agencies within w_rep_agency_earnings_by_dates
end type

event lst_agencies::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R')  and id_status_branch = 'O' order by name_branch;")
end event

type st_1 from w2_master_report_dates_agency`st_1 within w_rep_agency_earnings_by_dates
end type

type sle_idbranch from w2_master_report_dates_agency`sle_idbranch within w_rep_agency_earnings_by_dates
end type

