$PBExportHeader$w_billcollector_export.srw
forward
global type w_billcollector_export from w2_master_report_dates
end type
end forward

global type w_billcollector_export from w2_master_report_dates
integer x = 214
integer y = 221
integer width = 3209
integer height = 1880
end type
global w_billcollector_export w_billcollector_export

on w_billcollector_export.create
call super::create
end on

on w_billcollector_export.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates`st_4 within w_billcollector_export
boolean visible = false
end type

type st_3 from w2_master_report_dates`st_3 within w_billcollector_export
boolean visible = false
end type

type cb_query from w2_master_report_dates`cb_query within w_billcollector_export
integer x = 18
integer y = 32
end type

event cb_query::clicked;call super::clicked;
Setpointer(Hourglass!)

dw_1.retrieve()
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_billcollector_export
boolean visible = false
end type

type em_date1 from w2_master_report_dates`em_date1 within w_billcollector_export
boolean visible = false
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_billcollector_export
boolean visible = false
end type

type em_date2 from w2_master_report_dates`em_date2 within w_billcollector_export
boolean visible = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_billcollector_export
integer y = 148
string dataobject = "dw_billcollector_export"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_billcollector_export
boolean visible = false
end type

