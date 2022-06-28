$PBExportHeader$w_rep_sales_daily.srw
forward
global type w_rep_sales_daily from w2_master_report_dates
end type
end forward

global type w_rep_sales_daily from w2_master_report_dates
integer x = 214
integer y = 221
end type
global w_rep_sales_daily w_rep_sales_daily

on w_rep_sales_daily.create
call super::create
end on

on w_rep_sales_daily.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_sales_daily
integer x = 87
integer width = 133
string text = "Date:"
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_sales_daily
boolean visible = false
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_sales_daily
integer x = 736
end type

event cb_query::clicked;Datetime		ld_fecha1

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date2.text),time('00:00:00'))

//DECLARE spGenRepSalesDaily PROCEDURE FOR dba.spGenRepSalesDaily
//@pd_date = :ld_fecha1; 
//
//Execute spGenRepSalesDaily;

//if SQLCA.sqlcode = 0 then
	dw_1.retrieve(ld_fecha1)
	dw_1.setfocus()
//else
//	Messagebox("Error","Error generating Data ["+SqlCa.SQLErrText+"]",StopSign!)	
//end if

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_sales_daily
boolean visible = false
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_sales_daily
boolean visible = false
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_sales_daily
integer x = 558
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_sales_daily
integer x = 233
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_sales_daily
string title = "Daily Sales"
string dataobject = "dw_rep_sales_daily2"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_sales_daily
integer width = 1175
string text = ""
end type

