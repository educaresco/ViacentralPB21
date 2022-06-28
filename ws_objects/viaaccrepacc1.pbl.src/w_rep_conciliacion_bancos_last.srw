$PBExportHeader$w_rep_conciliacion_bancos_last.srw
forward
global type w_rep_conciliacion_bancos_last from wb_report_fechas
end type
type cb_query from commandbutton within w_rep_conciliacion_bancos_last
end type
type st_3 from statictext within w_rep_conciliacion_bancos_last
end type
type rb_1 from radiobutton within w_rep_conciliacion_bancos_last
end type
type rb_2 from radiobutton within w_rep_conciliacion_bancos_last
end type
type rb_none from radiobutton within w_rep_conciliacion_bancos_last
end type
type gb_4 from groupbox within w_rep_conciliacion_bancos_last
end type
type gb_3 from groupbox within w_rep_conciliacion_bancos_last
end type
type gb_2 from groupbox within w_rep_conciliacion_bancos_last
end type
type gb_1 from groupbox within w_rep_conciliacion_bancos_last
end type
type sle_transaction_info from singlelineedit within w_rep_conciliacion_bancos_last
end type
type em_date from u_em within w_rep_conciliacion_bancos_last
end type
type st_4 from statictext within w_rep_conciliacion_bancos_last
end type
type cb_move from commandbutton within w_rep_conciliacion_bancos_last
end type
type cbx_dep from checkbox within w_rep_conciliacion_bancos_last
end type
type cbx_wir from checkbox within w_rep_conciliacion_bancos_last
end type
type cbx_ach from checkbox within w_rep_conciliacion_bancos_last
end type
type cbx_aju from checkbox within w_rep_conciliacion_bancos_last
end type
type lb_bank from dropdownlistbox within w_rep_conciliacion_bancos_last
end type
type cbx_cc from checkbox within w_rep_conciliacion_bancos_last
end type
type em_date1 from pfc_u_em within w_rep_conciliacion_bancos_last
end type
type pb_date1 from picturebutton within w_rep_conciliacion_bancos_last
end type
type em_date2 from pfc_u_em within w_rep_conciliacion_bancos_last
end type
type pb_date2 from picturebutton within w_rep_conciliacion_bancos_last
end type
type cb_date from picturebutton within w_rep_conciliacion_bancos_last
end type
type cbx_special from checkbox within w_rep_conciliacion_bancos_last
end type
type rb_3 from radiobutton within w_rep_conciliacion_bancos_last
end type
type rb_4 from radiobutton within w_rep_conciliacion_bancos_last
end type
type gb_5 from groupbox within w_rep_conciliacion_bancos_last
end type
end forward

global type w_rep_conciliacion_bancos_last from wb_report_fechas
integer x = 214
integer y = 221
integer width = 3941
integer height = 2352
string title = "Transaction by Bank Name"
long backcolor = 80269524
cb_query cb_query
st_3 st_3
rb_1 rb_1
rb_2 rb_2
rb_none rb_none
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
sle_transaction_info sle_transaction_info
em_date em_date
st_4 st_4
cb_move cb_move
cbx_dep cbx_dep
cbx_wir cbx_wir
cbx_ach cbx_ach
cbx_aju cbx_aju
lb_bank lb_bank
cbx_cc cbx_cc
em_date1 em_date1
pb_date1 pb_date1
em_date2 em_date2
pb_date2 pb_date2
cb_date cb_date
cbx_special cbx_special
rb_3 rb_3
rb_4 rb_4
gb_5 gb_5
end type
global w_rep_conciliacion_bancos_last w_rep_conciliacion_bancos_last

type variables
Datastore	ids_maingroup, ids_account
double id_cons_trans
datetime idt_reconciliationdate
end variables

on w_rep_conciliacion_bancos_last.create
int iCurrent
call super::create
this.cb_query=create cb_query
this.st_3=create st_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_none=create rb_none
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.sle_transaction_info=create sle_transaction_info
this.em_date=create em_date
this.st_4=create st_4
this.cb_move=create cb_move
this.cbx_dep=create cbx_dep
this.cbx_wir=create cbx_wir
this.cbx_ach=create cbx_ach
this.cbx_aju=create cbx_aju
this.lb_bank=create lb_bank
this.cbx_cc=create cbx_cc
this.em_date1=create em_date1
this.pb_date1=create pb_date1
this.em_date2=create em_date2
this.pb_date2=create pb_date2
this.cb_date=create cb_date
this.cbx_special=create cbx_special
this.rb_3=create rb_3
this.rb_4=create rb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_query
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_none
this.Control[iCurrent+6]=this.gb_4
this.Control[iCurrent+7]=this.gb_3
this.Control[iCurrent+8]=this.gb_2
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.sle_transaction_info
this.Control[iCurrent+11]=this.em_date
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.cb_move
this.Control[iCurrent+14]=this.cbx_dep
this.Control[iCurrent+15]=this.cbx_wir
this.Control[iCurrent+16]=this.cbx_ach
this.Control[iCurrent+17]=this.cbx_aju
this.Control[iCurrent+18]=this.lb_bank
this.Control[iCurrent+19]=this.cbx_cc
this.Control[iCurrent+20]=this.em_date1
this.Control[iCurrent+21]=this.pb_date1
this.Control[iCurrent+22]=this.em_date2
this.Control[iCurrent+23]=this.pb_date2
this.Control[iCurrent+24]=this.cb_date
this.Control[iCurrent+25]=this.cbx_special
this.Control[iCurrent+26]=this.rb_3
this.Control[iCurrent+27]=this.rb_4
this.Control[iCurrent+28]=this.gb_5
end on

on w_rep_conciliacion_bancos_last.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_query)
destroy(this.st_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_none)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.sle_transaction_info)
destroy(this.em_date)
destroy(this.st_4)
destroy(this.cb_move)
destroy(this.cbx_dep)
destroy(this.cbx_wir)
destroy(this.cbx_ach)
destroy(this.cbx_aju)
destroy(this.lb_bank)
destroy(this.cbx_cc)
destroy(this.em_date1)
destroy(this.pb_date1)
destroy(this.em_date2)
destroy(this.pb_date2)
destroy(this.cb_date)
destroy(this.cbx_special)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.gb_5)
end on

event open;call super::open;Integer	 li_cont

em_date1.text = String(Today())
em_date2.text = String(Today())

ids_maingroup = CREATE datastore

ids_maingroup.dataobject = 'dddw_cuentabanco'
ids_maingroup.SetTransObject(SQLCA)
ids_maingroup.Retrieve()

FOR li_cont=1 TO ids_maingroup.RowCount()
	lb_bank.AddItem(ids_maingroup.Object.banco_name_banco[li_cont] + " [" + ids_maingroup.Object.cuenta_banco_id_cuenta_banco[li_cont]+"]                                                                     *"+ids_maingroup.Object.banco_name_banco[li_cont]+"*"+ids_maingroup.Object.cuenta_banco_id_cuenta_banco[li_cont])
NEXT

lb_bank.AddItem("ALL                                                                     *ALL*ALL")

id_cons_trans = -1
sle_transaction_info.text = "[None Selected]"
em_date.text = em_fecha2.text
cb_move.enabled = false


end event

type dw_1 from wb_report_fechas`dw_1 within w_rep_conciliacion_bancos_last
integer x = 5
integer y = 344
integer width = 3817
integer height = 1756
integer taborder = 0
string dataobject = "dw_rep_conciliacion_bancos_last"
end type

event dw_1::clicked;call super::clicked;long ll_row
double ld_amount
ll_row = dw_1.getClickedRow()
dw_1.SelectRow(0,FALSE)
if ll_row > 0 then
	dw_1.scrolltorow(ll_row)
	dw_1.SelectRow(ll_row,TRUE)
	
	id_cons_trans = dw_1.getitemnumber(ll_row,"transaccion_diaria_payee_cons_trans_diar")
	ld_amount = dw_1.getitemnumber(ll_row,"transaccion_diaria_payee_credit_trans_di") - dw_1.getitemnumber(ll_row,"transaccion_diaria_payee_debit_trans_dia")
	idt_reconciliationdate = dw_1.getitemdatetime(ll_row,'transaccion_diaria_banco_payee_reconcili')
	sle_transaction_info.text = string(dw_1.getitemnumber(ll_row,"transaccion_diaria_payee_cons_trans_diar")) + "   " + string(dw_1.getitemdatetime(ll_row,"transaccion_diaria_banco_payee_reconcili"),"mm/dd/yyyy") + "   " + String(ld_amount,"$#,##0.00;$(#,##0.00)")
	cb_move.enabled = true
else
	id_cons_trans = -1
	sle_transaction_info.text = "[None Selected]"
	cb_move.enabled = false
end if
end event

event dw_1::sqlpreview;call super::sqlpreview;STRING S_REVIEW

S_REVIEW = ''
end event

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_conciliacion_bancos_last
boolean visible = false
integer x = 265
integer y = 64
integer width = 361
integer height = 72
string facename = "Arial"
end type

type st_1 from wb_report_fechas`st_1 within w_rep_conciliacion_bancos_last
integer x = 23
integer y = 64
integer width = 233
integer height = 72
string facename = "Arial"
string text = "From :"
end type

type st_2 from wb_report_fechas`st_2 within w_rep_conciliacion_bancos_last
integer x = 709
integer y = 64
integer width = 137
integer height = 72
string facename = "Arial"
string text = "To :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_conciliacion_bancos_last
boolean visible = false
integer x = 795
integer y = 64
integer width = 361
integer height = 72
string facename = "Arial"
end type

event em_fecha2::modified;em_date.text = this.text
return 0
end event

type cb_query from commandbutton within w_rep_conciliacion_bancos_last
integer x = 2459
integer y = 28
integer width = 320
integer height = 276
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Query"
boolean default = true
end type

event clicked;Datetime		ld_fecha1, ld_fecha2
Int		li_index
String 	ls_id_maingroup, ls_id_account,newsort, ls_conceptos

ls_conceptos = '*'

if cbx_special.checked then

	if not cbx_dep.checked and not cbx_wir.checked and not cbx_ach.checked and not cbx_aju.checked and not cbx_cc.checked then
		MessageBox("Error","You must select at least one type (Deposits, ACH or Wires)",stopsign!)
		return
	end if
	
	if cbx_dep.checked then ls_conceptos = ls_conceptos + "DA*"
	if cbx_ach.checked then ls_conceptos = ls_conceptos + "ACH*"
	if cbx_wir.checked then ls_conceptos = ls_conceptos + "DP*"
	if cbx_aju.checked then ls_conceptos = ls_conceptos + "AC*"
	if cbx_cc.checked then ls_conceptos = ls_conceptos + "CCC*CCD*CCK*CCL*CCM*CCR*CCW*CCY*"
end if

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))

ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

IF rb_1.Checked = TRUE THEN
		newsort = "transaccion_diaria_payee_credit_trans_di A"
END IF 

IF rb_2.Checked = TRUE THEN
		newsort = "transaccion_diaria_payee_credit_trans_di D"
END IF

IF rb_3.Checked = TRUE THEN
		newsort = "transaccion_diaria_payee_debit_trans_dia A"
END IF 

IF rb_4.Checked = TRUE THEN
		newsort = "transaccion_diaria_payee_debit_trans_dia D"
END IF 

IF rb_none.Checked = TRUE THEN
		newsort = ""
END IF 

IF NOT IsDate(em_date1.text) OR IsNull(em_date1.text) THEN
	MessageBox("Error","You must enter a valid date.",stopsign!)
	return
END IF

IF NOT IsDate(em_date2.text) OR IsNull(em_date2.text) THEN
	MessageBox("Error","You must enter a valid date.",stopsign!)
	return
END IF

//IF cbx_1.checked THEN
//	IF IsNull(ddlb_maingroup.text) OR Trim(ddlb_maingroup.text) = '' THEN
//		MessageBox("Warning","You must choose a main group",stopsign!)
//	END IF
//END IF

//li_index = lb_bank.FindItem(lb_bank.text,0)

//IF li_index<=0 AND lb_bank.text<>'ALL' THEN
//	MessageBox("Atention","You have to choose a bank.",StopSign!)
//	Return
//END IF

//IF lb_bank.text='ALL' THEN
//	ls_id_maingroup='%'
//ELSE
//	ls_id_maingroup = ids_maingroup.Object.name_banco[li_index]
//END IF

//li_index = lb_account.FindItem(lb_account.text,0)
//
//IF li_index<=0 AND lb_account.text<>'ALL' THEN
//	MessageBox("Atention","You have to choose an account.",StopSign!)
//	Return
//END IF
//
//IF lb_account.text='ALL' THEN
//	ls_id_account='%'
//ELSE
//	ls_id_account = ids_account.Object.id_cuenta_banco[li_index]
//END IF

//MESSAGEBOX('',ls_id_account)

ls_id_account = fn_token(lb_bank.text,"*",3)
ls_id_maingroup = fn_token(lb_bank.text,"*",2)

//messagebox(ls_id_account,ls_id_maingroup)

IF ls_id_account='ALL' THEN
	ls_id_account='%'
END IF

IF ls_id_maingroup='ALL' THEN
	ls_id_maingroup='%'
END IF

//messagebox(ls_id_account,ls_id_maingroup)

dw_1.setSort(newsort)
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_id_maingroup,ls_id_account,ls_conceptos)
dw_1.Sort()
dw_1.setfocus()
end event

type st_3 from statictext within w_rep_conciliacion_bancos_last
integer x = 23
integer y = 168
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Account :"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_rep_conciliacion_bancos_last
integer x = 1422
integer y = 124
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asc"
end type

type rb_2 from radiobutton within w_rep_conciliacion_bancos_last
integer x = 1422
integer y = 184
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desc"
end type

type rb_none from radiobutton within w_rep_conciliacion_bancos_last
integer x = 1422
integer y = 244
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "None"
boolean checked = true
end type

type gb_4 from groupbox within w_rep_conciliacion_bancos_last
integer x = 9
integer width = 1362
integer height = 316
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_rep_conciliacion_bancos_last
integer x = 1403
integer y = 64
integer width = 512
integer height = 244
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Credit         Debit"
end type

type gb_2 from groupbox within w_rep_conciliacion_bancos_last
integer x = 2793
integer width = 1029
integer height = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Move Transaction"
end type

type gb_1 from groupbox within w_rep_conciliacion_bancos_last
integer x = 1938
integer width = 503
integer height = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Include"
end type

type sle_transaction_info from singlelineedit within w_rep_conciliacion_bancos_last
integer x = 2834
integer y = 80
integer width = 951
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean autohscroll = false
boolean displayonly = true
end type

type em_date from u_em within w_rep_conciliacion_bancos_last
integer x = 3049
integer y = 164
integer width = 320
integer height = 84
integer taborder = 0
boolean bringtotop = true
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type st_4 from statictext within w_rep_conciliacion_bancos_last
integer x = 2834
integer y = 172
integer width = 210
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Move to :"
boolean focusrectangle = false
end type

type cb_move from commandbutton within w_rep_conciliacion_bancos_last
integer x = 3483
integer y = 164
integer width = 302
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Move"
end type

event clicked;datetime ld_newdate, ld_date_inicio, ld_date_final
date ld_current, ld_reconciliationdate
string s_business_day

ld_newdate = datetime(date(em_date.text),time('00:00:00'))

SELECT min(dba.ACC_PARAMETERS.DATE_BLOCKER),   
		 min(dba.ACC_PARAMETERS.DATE_BLOCKER_POST)
INTO :ld_date_inicio,   
	  :ld_date_final  
FROM dba.ACC_PARAMETERS  ;

if SQLCA.SQLCode <> 0 then
	Messagebox("Error","Error checking Account Parameters, Block Date will not be checked!~n[Error: "+SQLCA.SQLErrText+"]",Stopsign!)
	return 0
end if
ld_current = date(ld_newdate)
if not isnull(ld_date_inicio) and not isnull(ld_date_final) then

ld_reconciliationdate = date(idt_reconciliationdate)
	
	if (ld_current <= date(ld_date_inicio)) or (ld_current >= date(ld_date_final)) or (ld_reconciliationdate <= date(ld_date_inicio)) or (ld_reconciliationdate >= date(ld_date_final)) then	
		messagebox("Error","The date you are using ("+string(ld_newdate,"mm/dd/yyyy")+") was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
		return
	end if

end if

	SELECT dba.sfGetIsBusinessDay(:ld_current)
	INTO :s_business_day
	FROM DBA.DUAL;


	IF s_business_day = 'N' THEN
		messagebox("Error","The date you are using is not a business day, please check for the next avalilable business day",StopSign!)
		Return
	END IF

If Messagebox("Move Bank Transaction","This operation will affect the bank movements, do you want to continue?",Question!,YesNo!) = 1 Then
	If Messagebox("Move Bank Transaction","Are you sure that you want to move the transaction ["+sle_transaction_info.text+"] to "+em_date.text+"?",Question!,YesNo!) = 1 Then

		UPDATE dba.TRANSACCION_DIARIA_BANCO_PAYEE  
		SET RECONCILIATIONDATE = :ld_newdate  
		WHERE dba.TRANSACCION_DIARIA_BANCO_PAYEE.CONS_TRANS_DIARIA = :id_cons_trans   ;

		If SQLCA.SQLCode <> 0 then
			Messagebox("Error","The record was not updated.~nError:"+SQLCA.SQLErrText,StopSign!)
			return
		end if

		cb_query.TriggerEvent(Clicked!)

	end if	
end if
end event

type cbx_dep from checkbox within w_rep_conciliacion_bancos_last
integer x = 1979
integer y = 72
integer width = 197
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Dep."
boolean checked = true
end type

type cbx_wir from checkbox within w_rep_conciliacion_bancos_last
integer x = 2190
integer y = 72
integer width = 219
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Wire"
end type

type cbx_ach from checkbox within w_rep_conciliacion_bancos_last
integer x = 1979
integer y = 132
integer width = 197
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "ACH"
boolean checked = true
end type

type cbx_aju from checkbox within w_rep_conciliacion_bancos_last
integer x = 2190
integer y = 132
integer width = 219
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Ajust"
end type

type lb_bank from dropdownlistbox within w_rep_conciliacion_bancos_last
integer x = 265
integer y = 160
integer width = 1083
integer height = 772
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cbx_cc from checkbox within w_rep_conciliacion_bancos_last
integer x = 1979
integer y = 192
integer width = 197
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "CC"
boolean checked = true
end type

type em_date1 from pfc_u_em within w_rep_conciliacion_bancos_last
integer x = 265
integer y = 56
integer width = 320
integer height = 84
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type pb_date1 from picturebutton within w_rep_conciliacion_bancos_last
integer x = 590
integer y = 52
integer width = 101
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date1.Event pfc_DDCalendar( )
end event

type em_date2 from pfc_u_em within w_rep_conciliacion_bancos_last
integer x = 855
integer y = 56
integer width = 320
integer height = 84
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type pb_date2 from picturebutton within w_rep_conciliacion_bancos_last
integer x = 1179
integer y = 52
integer width = 101
integer height = 88
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date2.Event pfc_DDCalendar( )
end event

type cb_date from picturebutton within w_rep_conciliacion_bancos_last
integer x = 3369
integer y = 160
integer width = 101
integer height = 88
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date.Event pfc_DDCalendar()
end event

type cbx_special from checkbox within w_rep_conciliacion_bancos_last
integer x = 1979
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Only Types:"
end type

event clicked;cbx_dep.enabled = this.checked
cbx_ach.enabled = this.checked
cbx_wir.enabled = this.checked
cbx_aju.enabled = this.checked
cbx_cc.enabled = this.checked
end event

type rb_3 from radiobutton within w_rep_conciliacion_bancos_last
integer x = 1691
integer y = 124
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asc"
end type

type rb_4 from radiobutton within w_rep_conciliacion_bancos_last
integer x = 1691
integer y = 184
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desc"
end type

type gb_5 from groupbox within w_rep_conciliacion_bancos_last
integer x = 1385
integer width = 544
integer height = 320
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Order"
end type

