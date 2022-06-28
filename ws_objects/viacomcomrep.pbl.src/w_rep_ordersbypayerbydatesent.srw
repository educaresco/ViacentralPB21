$PBExportHeader$w_rep_ordersbypayerbydatesent.srw
forward
global type w_rep_ordersbypayerbydatesent from w2_master_report_dates_payer
end type
end forward

global type w_rep_ordersbypayerbydatesent from w2_master_report_dates_payer
integer x = 214
integer y = 221
end type
global w_rep_ordersbypayerbydatesent w_rep_ordersbypayerbydatesent

on w_rep_ordersbypayerbydatesent.create
call super::create
end on

on w_rep_ordersbypayerbydatesent.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates_payer`st_4 within w_rep_ordersbypayerbydatesent
end type

type st_3 from w2_master_report_dates_payer`st_3 within w_rep_ordersbypayerbydatesent
end type

type cb_query from w2_master_report_dates_payer`cb_query within w_rep_ordersbypayerbydatesent
end type

type pb_date1 from w2_master_report_dates_payer`pb_date1 within w_rep_ordersbypayerbydatesent
end type

type em_date1 from w2_master_report_dates_payer`em_date1 within w_rep_ordersbypayerbydatesent
end type

type pb_date2 from w2_master_report_dates_payer`pb_date2 within w_rep_ordersbypayerbydatesent
end type

type em_date2 from w2_master_report_dates_payer`em_date2 within w_rep_ordersbypayerbydatesent
end type

type dw_1 from w2_master_report_dates_payer`dw_1 within w_rep_ordersbypayerbydatesent
string dataobject = "dw_rep_ordersbypayerbydatesent"
end type

type gb_1 from w2_master_report_dates_payer`gb_1 within w_rep_ordersbypayerbydatesent
end type

type lst_payers from w2_master_report_dates_payer`lst_payers within w_rep_ordersbypayerbydatesent
end type

type st_1 from w2_master_report_dates_payer`st_1 within w_rep_ordersbypayerbydatesent
end type

type sle_payer from w2_master_report_dates_payer`sle_payer within w_rep_ordersbypayerbydatesent
end type

