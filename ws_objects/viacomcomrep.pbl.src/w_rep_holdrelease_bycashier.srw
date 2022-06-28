﻿$PBExportHeader$w_rep_holdrelease_bycashier.srw
forward
global type w_rep_holdrelease_bycashier from w2_master_report_dates
end type
end forward

global type w_rep_holdrelease_bycashier from w2_master_report_dates
integer x = 214
integer y = 221
end type
global w_rep_holdrelease_bycashier w_rep_holdrelease_bycashier

on w_rep_holdrelease_bycashier.create
call super::create
end on

on w_rep_holdrelease_bycashier.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_holdrelease_bycashier
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_holdrelease_bycashier
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_holdrelease_bycashier
end type

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_holdrelease_bycashier
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_holdrelease_bycashier
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_holdrelease_bycashier
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_holdrelease_bycashier
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_holdrelease_bycashier
string dataobject = "dw_rep_holdrelease_bycashier"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_holdrelease_bycashier
end type

