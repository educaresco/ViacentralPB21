$PBExportHeader$w_payroll_report.srw
forward
global type w_payroll_report from w2_master_report_dates
end type
end forward

global type w_payroll_report from w2_master_report_dates
integer width = 3378
string title = "Payroll Report"
end type
global w_payroll_report w_payroll_report

type variables
datetime idt_first_day_of_the_month, idt_last_day_of_the_month
end variables

on w_payroll_report.create
call super::create
end on

on w_payroll_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;string s_id_Agent
date ld_today

ld_today = today()

select (dateadd(dd,-(day(dateadd(mm,1,:ld_today))-1),dateadd(mm,-1,:ld_today))) as firts_day,
		DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0)) as last_day
into :idt_first_day_of_the_month, 
	  :idt_last_day_of_the_month	  
from dba.dual;
//where id_agent = '35';


em_date1.text = string(date(idt_first_day_of_the_month))
em_date2.text = string(date(idt_last_day_of_the_month))



end event

type st_4 from w2_master_report_dates`st_4 within w_payroll_report
integer x = 763
integer width = 91
end type

type st_3 from w2_master_report_dates`st_3 within w_payroll_report
integer x = 50
end type

type cb_query from w2_master_report_dates`cb_query within w_payroll_report
integer x = 1426
integer y = 56
integer taborder = 50
end type

event cb_query::clicked;// payroll report
dw_1.retrieve()

dw_1.SetRedraw(true )



Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_payroll_report
boolean visible = false
integer x = 549
end type

type em_date1 from w2_master_report_dates`em_date1 within w_payroll_report
integer x = 224
boolean enabled = false
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_payroll_report
boolean visible = false
integer x = 1189
end type

type em_date2 from w2_master_report_dates`em_date2 within w_payroll_report
integer x = 859
boolean enabled = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_payroll_report
integer x = 37
integer width = 3273
string dataobject = "dw_payroll_report"
end type

event dw_1::sqlpreview;call super::sqlpreview;string s
S = ''
end event

type gb_1 from w2_master_report_dates`gb_1 within w_payroll_report
integer x = 5
integer width = 3310
end type

