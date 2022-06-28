$PBExportHeader$w_rep_acc_aging.srw
forward
global type w_rep_acc_aging from wb_report_fechas
end type
type cb_query from commandbutton within w_rep_acc_aging
end type
type gb_1 from groupbox within w_rep_acc_aging
end type
end forward

global type w_rep_acc_aging from wb_report_fechas
integer width = 3758
integer height = 1976
string title = "Account Aging Report"
cb_query cb_query
gb_1 gb_1
end type
global w_rep_acc_aging w_rep_acc_aging

on w_rep_acc_aging.create
int iCurrent
call super::create
this.cb_query=create cb_query
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_query
this.Control[iCurrent+2]=this.gb_1
end on

on w_rep_acc_aging.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_query)
destroy(this.gb_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_acc_aging
integer y = 172
integer width = 3675
integer height = 1592
integer taborder = 0
string dataobject = "dw_rep_aging_export"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_acc_aging
boolean visible = false
integer x = 233
integer y = 48
integer width = 398
integer height = 72
integer taborder = 30
end type

type st_1 from wb_report_fechas`st_1 within w_rep_acc_aging
boolean visible = false
integer x = 69
integer y = 52
integer width = 155
string text = "From :"
end type

type st_2 from wb_report_fechas`st_2 within w_rep_acc_aging
integer x = 123
integer y = 56
integer width = 142
string facename = "Tahoma"
string text = "Date :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_acc_aging
integer x = 288
integer y = 52
integer width = 398
integer height = 72
integer taborder = 10
string facename = "Tahoma"
end type

event em_fecha2::modified;return
end event

type cb_query from commandbutton within w_rep_acc_aging
integer x = 727
integer y = 52
integer width = 293
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
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

type gb_1 from groupbox within w_rep_acc_aging
integer x = 5
integer width = 1271
integer height = 152
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

