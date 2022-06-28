$PBExportHeader$w_rep_balance.srw
forward
global type w_rep_balance from wb_report_fechas
end type
type cb_1 from commandbutton within w_rep_balance
end type
type sle_grupo from singlelineedit within w_rep_balance
end type
type st_grupo from statictext within w_rep_balance
end type
end forward

global type w_rep_balance from wb_report_fechas
integer width = 3305
integer height = 1900
string title = "Balance"
cb_1 cb_1
sle_grupo sle_grupo
st_grupo st_grupo
end type
global w_rep_balance w_rep_balance

on w_rep_balance.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_grupo=create sle_grupo
this.st_grupo=create st_grupo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_grupo
this.Control[iCurrent+3]=this.st_grupo
end on

on w_rep_balance.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.sle_grupo)
destroy(this.st_grupo)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_balance
integer y = 140
integer width = 3237
integer height = 1556
integer taborder = 0
string dataobject = "dw_rep_balance"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_balance
integer x = 238
integer y = 36
integer height = 76
end type

type st_1 from wb_report_fechas`st_1 within w_rep_balance
integer x = 59
integer width = 169
string text = "From :"
end type

type st_2 from wb_report_fechas`st_2 within w_rep_balance
integer x = 677
integer width = 101
string text = "To :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_balance
integer x = 786
integer y = 36
integer height = 76
end type

event em_fecha2::modified;return 0
end event

type cb_1 from commandbutton within w_rep_balance
integer x = 1797
integer y = 36
integer width = 242
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Query"
boolean default = true
end type

event clicked;string 	ls_group


Open(w_seleccionar_grupo)

ls_group = message.stringparm

sle_grupo.text = ls_group

sle_grupo.setfocus()
end event

type sle_grupo from singlelineedit within w_rep_balance
integer x = 1522
integer y = 36
integer width = 247
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event losefocus;Date		ld_fecha1, ld_fecha2

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



ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)
dw_1.retrieve(ld_Fecha1,ld_Fecha2,'%'+sle_grupo.text+'%')
dw_1.setfocus()


// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Setpointer(Arrow!)
end event

type st_grupo from statictext within w_rep_balance
integer x = 1303
integer y = 40
integer width = 210
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Group :"
alignment alignment = right!
boolean focusrectangle = false
end type

