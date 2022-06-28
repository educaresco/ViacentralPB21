$PBExportHeader$w2_rep_invoices_by_state.srw
forward
global type w2_rep_invoices_by_state from w2_master_report_dates_state
end type
end forward

global type w2_rep_invoices_by_state from w2_master_report_dates_state
end type
global w2_rep_invoices_by_state w2_rep_invoices_by_state

on w2_rep_invoices_by_state.create
call super::create
end on

on w2_rep_invoices_by_state.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates_state`st_4 within w2_rep_invoices_by_state
end type

type st_3 from w2_master_report_dates_state`st_3 within w2_rep_invoices_by_state
end type

type cb_query from w2_master_report_dates_state`cb_query within w2_rep_invoices_by_state
end type

type pb_date1 from w2_master_report_dates_state`pb_date1 within w2_rep_invoices_by_state
end type

type em_date1 from w2_master_report_dates_state`em_date1 within w2_rep_invoices_by_state
end type

type pb_date2 from w2_master_report_dates_state`pb_date2 within w2_rep_invoices_by_state
end type

type em_date2 from w2_master_report_dates_state`em_date2 within w2_rep_invoices_by_state
end type

type dw_1 from w2_master_report_dates_state`dw_1 within w2_rep_invoices_by_state
string dataobject = "dw2_rep_invoices_by_state"
end type

type gb_1 from w2_master_report_dates_state`gb_1 within w2_rep_invoices_by_state
end type

type lst_states from w2_master_report_dates_state`lst_states within w2_rep_invoices_by_state
end type

event lst_states::constructor;//[CLONDONO][2013-07-24]  Modified the ancestor's original query so that now it also includes the available companies in the list
lst_states.addquery("SELECT DISTINCT S.NAME_STATE, S.ID_STATE FROM DBA.BRANCH B, DBA.STATE S WHERE S.ID_STATE = B.ID_STATE AND B.ID_TYPE_BRANCH IN ('A','R') AND S.ID_COUNTRY = 'USA' UNION SELECT '- '+NAME_COMPANY, ID_COMPANY FROM DBA.COMPANY ORDER BY 1;")
//[CLONDONO][2013-07-24]  END
end event

type st_1 from w2_master_report_dates_state`st_1 within w2_rep_invoices_by_state
end type

