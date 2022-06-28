$PBExportHeader$w_acc_interestcalculation.srw
forward
global type w_acc_interestcalculation from w2_master_report_dates_agency
end type
end forward

global type w_acc_interestcalculation from w2_master_report_dates_agency
integer width = 3223
integer height = 1920
string title = "Interest Calculation"
end type
global w_acc_interestcalculation w_acc_interestcalculation

on w_acc_interestcalculation.create
call super::create
end on

on w_acc_interestcalculation.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates_agency`st_4 within w_acc_interestcalculation
end type

type st_3 from w2_master_report_dates_agency`st_3 within w_acc_interestcalculation
end type

type cb_query from w2_master_report_dates_agency`cb_query within w_acc_interestcalculation
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_branch_id

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_branch_id = lst_agencies.getdataid()

if ld_fecha2 > datetime(today(),time("00:00:00")) then
	Messagebox("Error","This report cannot be generated for present and future dates!",StopSign!)
	return
end if

dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_branch_id)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates_agency`pb_date1 within w_acc_interestcalculation
end type

type em_date1 from w2_master_report_dates_agency`em_date1 within w_acc_interestcalculation
end type

type pb_date2 from w2_master_report_dates_agency`pb_date2 within w_acc_interestcalculation
end type

type em_date2 from w2_master_report_dates_agency`em_date2 within w_acc_interestcalculation
end type

type dw_1 from w2_master_report_dates_agency`dw_1 within w_acc_interestcalculation
integer y = 204
integer height = 1496
string dataobject = "dw_acc_interestcalculation"
end type

type gb_1 from w2_master_report_dates_agency`gb_1 within w_acc_interestcalculation
end type

type lst_agencies from w2_master_report_dates_agency`lst_agencies within w_acc_interestcalculation
end type

type st_1 from w2_master_report_dates_agency`st_1 within w_acc_interestcalculation
end type

type sle_idbranch from w2_master_report_dates_agency`sle_idbranch within w_acc_interestcalculation
end type

