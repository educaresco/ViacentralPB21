$PBExportHeader$w_invoces_by_dates_by_amount.srw
forward
global type w_invoces_by_dates_by_amount from w2_master_report_dates_amt
end type
end forward

global type w_invoces_by_dates_by_amount from w2_master_report_dates_amt
end type
global w_invoces_by_dates_by_amount w_invoces_by_dates_by_amount

on w_invoces_by_dates_by_amount.create
call super::create
end on

on w_invoces_by_dates_by_amount.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates_amt`st_4 within w_invoces_by_dates_by_amount
end type

type st_3 from w2_master_report_dates_amt`st_3 within w_invoces_by_dates_by_amount
end type

type cb_query from w2_master_report_dates_amt`cb_query within w_invoces_by_dates_by_amount
integer x = 2213
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
Double 		ld_amount

Setpointer(Hourglass!)

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Connection
n_tr SQLCA_RPT
SQLCA_RPT = Create n_tr
SQLCA_RPT.DBMS = "SNC SQL Native Client(OLE DB)"
SQLCA_RPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
SQLCA_RPT.ServerName = gs_servername_rpt
if SQLCA_RPT.of_connect() <> 0 then
	Messagebox("Error","Error trying connection to Reporting Database"+char(13)+char(10)+SQLCA_RPT.SQLErrText,StopSign!)
	return
end if
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

dw_1.SetTransObject(SQLCA_RPT)


ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ld_amount = Double(em_value.text)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,ld_amount)
dw_1.setfocus()


// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates_amt`pb_date1 within w_invoces_by_dates_by_amount
end type

type em_date1 from w2_master_report_dates_amt`em_date1 within w_invoces_by_dates_by_amount
end type

type pb_date2 from w2_master_report_dates_amt`pb_date2 within w_invoces_by_dates_by_amount
end type

type em_date2 from w2_master_report_dates_amt`em_date2 within w_invoces_by_dates_by_amount
end type

type dw_1 from w2_master_report_dates_amt`dw_1 within w_invoces_by_dates_by_amount
string dataobject = "dw_invoces_by_dates_by_amount"
end type

type gb_1 from w2_master_report_dates_amt`gb_1 within w_invoces_by_dates_by_amount
end type

type em_value from w2_master_report_dates_amt`em_value within w_invoces_by_dates_by_amount
integer x = 1833
integer width = 329
string text = "3000.00"
end type

type st_1 from w2_master_report_dates_amt`st_1 within w_invoces_by_dates_by_amount
integer width = 494
string text = "Amount Greater than:"
end type

