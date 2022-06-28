$PBExportHeader$w_sql_publishbalance.srw
forward
global type w_sql_publishbalance from w2_master_report_agency
end type
end forward

global type w_sql_publishbalance from w2_master_report_agency
integer width = 1911
integer height = 744
end type
global w_sql_publishbalance w_sql_publishbalance

on w_sql_publishbalance.create
call super::create
end on

on w_sql_publishbalance.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_1 from w2_master_report_agency`st_1 within w_sql_publishbalance
integer x = 82
integer y = 136
end type

type sle_idbranch from w2_master_report_agency`sle_idbranch within w_sql_publishbalance
integer x = 366
integer y = 120
end type

type cb_query from w2_master_report_agency`cb_query within w_sql_publishbalance
integer x = 375
integer y = 256
integer width = 1344
integer height = 180
string text = "&Republicar Balance"
end type

event cb_query::clicked;String		ls_branch_id

Setpointer(Hourglass!)

ls_branch_id = lst_agencies.getdataid()
fn_exptransactions_branch(ls_branch_id)

messagebox("Notification","Process Completed")

Setpointer(Arrow!)

end event

type dw_1 from w2_master_report_agency`dw_1 within w_sql_publishbalance
boolean visible = false
end type

type gb_1 from w2_master_report_agency`gb_1 within w_sql_publishbalance
integer width = 1829
integer height = 528
end type

type lst_agencies from w2_master_report_agency`lst_agencies within w_sql_publishbalance
integer x = 713
integer y = 120
end type

