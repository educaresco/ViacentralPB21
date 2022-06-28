$PBExportHeader$w2_dynamic_report_agency.srw
forward
global type w2_dynamic_report_agency from w2_master_report_agency
end type
end forward

global type w2_dynamic_report_agency from w2_master_report_agency
end type
global w2_dynamic_report_agency w2_dynamic_report_agency

on w2_dynamic_report_agency.create
call super::create
end on

on w2_dynamic_report_agency.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;string s_parm, s_parm_all

s_parm_all = ''

s_parm = Message.StringParm

dw_1.dataobject = fn_token(s_parm,'/',1)
this.title = fn_token(s_parm,'/',2)
s_parm_all = fn_token(s_parm,'/',3)

dw_1.SetTransObject(sqlcarpt)

if upper(s_parm_all) = "ALL" then
	
	lst_agencies.insertitem('ALL',1 )
	lst_agencies.text = 'ALL'
	
else
	
	lst_agencies.insertitem('[PLEASE SELECT]',1 )
	lst_agencies.text = '[PLEASE SELECT]'
		
end if

end event

type st_1 from w2_master_report_agency`st_1 within w2_dynamic_report_agency
integer x = 393
end type

type sle_idbranch from w2_master_report_agency`sle_idbranch within w2_dynamic_report_agency
integer x = 677
end type

type cb_query from w2_master_report_agency`cb_query within w2_dynamic_report_agency
integer x = 2409
end type

type dw_1 from w2_master_report_agency`dw_1 within w2_dynamic_report_agency
end type

type gb_1 from w2_master_report_agency`gb_1 within w2_dynamic_report_agency
end type

type lst_agencies from w2_master_report_agency`lst_agencies within w2_dynamic_report_agency
integer x = 1029
integer width = 1367
end type

