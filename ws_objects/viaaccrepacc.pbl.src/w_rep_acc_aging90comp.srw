$PBExportHeader$w_rep_acc_aging90comp.srw
forward
global type w_rep_acc_aging90comp from wb_report_fechas
end type
type cb_query from commandbutton within w_rep_acc_aging90comp
end type
end forward

global type w_rep_acc_aging90comp from wb_report_fechas
string title = "Account Aging Report"
cb_query cb_query
end type
global w_rep_acc_aging90comp w_rep_acc_aging90comp

on w_rep_acc_aging90comp.create
int iCurrent
call super::create
this.cb_query=create cb_query
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_query
end on

on w_rep_acc_aging90comp.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_query)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_acc_aging90comp
integer taborder = 0
string dataobject = "dw_rep_aging_export90comp"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_acc_aging90comp
boolean visible = false
integer x = 233
integer y = 48
integer width = 398
integer height = 72
integer taborder = 30
end type

type st_1 from wb_report_fechas`st_1 within w_rep_acc_aging90comp
boolean visible = false
integer x = 69
integer y = 52
integer width = 155
string text = "From :"
end type

type st_2 from wb_report_fechas`st_2 within w_rep_acc_aging90comp
integer x = 142
integer y = 44
integer width = 352
string text = "Date (End of) :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_acc_aging90comp
integer x = 517
integer y = 40
integer width = 398
integer height = 72
integer taborder = 10
end type

event em_fecha2::modified;return
end event

type cb_query from commandbutton within w_rep_acc_aging90comp
integer x = 955
integer y = 40
integer width = 293
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Query"
boolean default = true
end type

event clicked;Datetime	ld_fecha2

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

ld_fecha2 = Datetime(date(em_fecha2.text),time('00:00:00'))
dw_1.Retrieve(ld_fecha2)
dw_1.setfocus()

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Setpointer(Arrow!)
end event

