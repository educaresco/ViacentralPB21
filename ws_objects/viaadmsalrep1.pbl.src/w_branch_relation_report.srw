$PBExportHeader$w_branch_relation_report.srw
forward
global type w_branch_relation_report from w2_master_report_agency
end type
end forward

global type w_branch_relation_report from w2_master_report_agency
integer x = 214
integer y = 221
end type
global w_branch_relation_report w_branch_relation_report

event open;call super::open;

lst_agencies.insertitem('ALL',1 )
lst_agencies.text = 'ALL'
end event

on w_branch_relation_report.create
call super::create
end on

on w_branch_relation_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_1 from w2_master_report_agency`st_1 within w_branch_relation_report
end type

type sle_idbranch from w2_master_report_agency`sle_idbranch within w_branch_relation_report
end type

type cb_query from w2_master_report_agency`cb_query within w_branch_relation_report
end type

event cb_query::clicked;String		ls_branch_id, ls_filter

Setpointer(Hourglass!)

ls_branch_id = lst_agencies.getdataid()

 if ls_branch_id <> '' then
	ls_filter = " branch_relations_id_branch_main  = '" + ls_branch_id + " '" +" or " + " branch_relations_id_branch_sec   = '" + ls_branch_id + " '"
else
ls_filter = ls_branch_id
end if
dw_1.retrieve(ls_branch_id)
dw_1.setfocus()

dw_1.setfilter( ls_filter )
dw_1.filter()
dw_1.SetRedraw(true )

Setpointer(Arrow!)
end event

type dw_1 from w2_master_report_agency`dw_1 within w_branch_relation_report
string dataobject = "dw_branch_relation_report"
end type

type gb_1 from w2_master_report_agency`gb_1 within w_branch_relation_report
end type

type lst_agencies from w2_master_report_agency`lst_agencies within w_branch_relation_report
end type

