$PBExportHeader$w_rep_acc_payerreconciliation.srw
forward
global type w_rep_acc_payerreconciliation from w2_master_report_dates_payer
end type
type rb_trans from radiobutton within w_rep_acc_payerreconciliation
end type
type rb_conf from radiobutton within w_rep_acc_payerreconciliation
end type
end forward

global type w_rep_acc_payerreconciliation from w2_master_report_dates_payer
integer width = 3922
integer height = 1936
string title = "Account Payer Reconciliation"
rb_trans rb_trans
rb_conf rb_conf
end type
global w_rep_acc_payerreconciliation w_rep_acc_payerreconciliation

on w_rep_acc_payerreconciliation.create
int iCurrent
call super::create
this.rb_trans=create rb_trans
this.rb_conf=create rb_conf
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_trans
this.Control[iCurrent+2]=this.rb_conf
end on

on w_rep_acc_payerreconciliation.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_trans)
destroy(this.rb_conf)
end on

type st_4 from w2_master_report_dates_payer`st_4 within w_rep_acc_payerreconciliation
integer x = 672
end type

type st_3 from w2_master_report_dates_payer`st_3 within w_rep_acc_payerreconciliation
end type

type cb_query from w2_master_report_dates_payer`cb_query within w_rep_acc_payerreconciliation
integer x = 3415
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_payer_id, ls_concepto

if rb_trans.checked then 
	ls_concepto = 'TP'
else
	ls_concepto = 'CPC'
end if

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
ls_payer_id = lst_payers.getdataid()
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_payer_id,ls_concepto)

dw_1.setfocus()

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates_payer`pb_date1 within w_rep_acc_payerreconciliation
end type

type em_date1 from w2_master_report_dates_payer`em_date1 within w_rep_acc_payerreconciliation
end type

type pb_date2 from w2_master_report_dates_payer`pb_date2 within w_rep_acc_payerreconciliation
integer x = 1106
end type

type em_date2 from w2_master_report_dates_payer`em_date2 within w_rep_acc_payerreconciliation
integer x = 782
end type

type dw_1 from w2_master_report_dates_payer`dw_1 within w_rep_acc_payerreconciliation
integer width = 3813
string dataobject = "dw_rep_acc_payerreconciliation"
end type

type gb_1 from w2_master_report_dates_payer`gb_1 within w_rep_acc_payerreconciliation
integer width = 3808
end type

type lst_payers from w2_master_report_dates_payer`lst_payers within w_rep_acc_payerreconciliation
integer width = 1097
integer height = 1388
end type

type st_1 from w2_master_report_dates_payer`st_1 within w_rep_acc_payerreconciliation
integer x = 1248
end type

type sle_payer from w2_master_report_dates_payer`sle_payer within w_rep_acc_payerreconciliation
end type

type rb_trans from radiobutton within w_rep_acc_payerreconciliation
integer x = 2825
integer y = 80
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Trans."
boolean checked = true
end type

type rb_conf from radiobutton within w_rep_acc_payerreconciliation
integer x = 3090
integer y = 80
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Conf."
end type

