$PBExportHeader$w_rep_salesrep_commission.srw
$PBExportComments$Ventana single tabular
forward
global type w_rep_salesrep_commission from wb_report_datetime
end type
end forward

global type w_rep_salesrep_commission from wb_report_datetime
end type
global w_rep_salesrep_commission w_rep_salesrep_commission

on w_rep_salesrep_commission.create
call super::create
end on

on w_rep_salesrep_commission.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_datetime`dw_1 within w_rep_salesrep_commission
string dataobject = "dw_rep_salesrep_commission"
end type

type em_fecha1 from wb_report_datetime`em_fecha1 within w_rep_salesrep_commission
end type

type st_1 from wb_report_datetime`st_1 within w_rep_salesrep_commission
end type

type st_2 from wb_report_datetime`st_2 within w_rep_salesrep_commission
end type

type em_fecha2 from wb_report_datetime`em_fecha2 within w_rep_salesrep_commission
end type

type cb_query from wb_report_datetime`cb_query within w_rep_salesrep_commission
end type

