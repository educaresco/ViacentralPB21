$PBExportHeader$w_acc_wire.srw
forward
global type w_acc_wire from w_master
end type
type st_8 from statictext within w_acc_wire
end type
type em_foreing_amt from editmask within w_acc_wire
end type
type st_4 from statictext within w_acc_wire
end type
type em_exchange_rate from editmask within w_acc_wire
end type
type dw_1 from datawindow within w_acc_wire
end type
type cb_save from commandbutton within w_acc_wire
end type
type cb_clear from commandbutton within w_acc_wire
end type
type st_7 from statictext within w_acc_wire
end type
type em_date from editmask within w_acc_wire
end type
type st_6 from statictext within w_acc_wire
end type
type sle_note from singlelineedit within w_acc_wire
end type
type st_5 from statictext within w_acc_wire
end type
type em_amount from editmask within w_acc_wire
end type
type st_3 from statictext within w_acc_wire
end type
type st_2 from statictext within w_acc_wire
end type
type st_1 from statictext within w_acc_wire
end type
type lst_dest_bank from my_ddlb within w_acc_wire
end type
type lst_payers from my_ddlb within w_acc_wire
end type
type lst_account from my_ddlb within w_acc_wire
end type
type lst_bank from my_ddlb within w_acc_wire
end type
type gb_1 from groupbox within w_acc_wire
end type
end forward

global type w_acc_wire from w_master
integer width = 2446
integer height = 1928
string title = "Wire Transfer"
boolean maxbox = false
boolean resizable = false
st_8 st_8
em_foreing_amt em_foreing_amt
st_4 st_4
em_exchange_rate em_exchange_rate
dw_1 dw_1
cb_save cb_save
cb_clear cb_clear
st_7 st_7
em_date em_date
st_6 st_6
sle_note sle_note
st_5 st_5
em_amount em_amount
st_3 st_3
st_2 st_2
st_1 st_1
lst_dest_bank lst_dest_bank
lst_payers lst_payers
lst_account lst_account
lst_bank lst_bank
gb_1 gb_1
end type
global w_acc_wire w_acc_wire

on w_acc_wire.create
int iCurrent
call super::create
this.st_8=create st_8
this.em_foreing_amt=create em_foreing_amt
this.st_4=create st_4
this.em_exchange_rate=create em_exchange_rate
this.dw_1=create dw_1
this.cb_save=create cb_save
this.cb_clear=create cb_clear
this.st_7=create st_7
this.em_date=create em_date
this.st_6=create st_6
this.sle_note=create sle_note
this.st_5=create st_5
this.em_amount=create em_amount
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.lst_dest_bank=create lst_dest_bank
this.lst_payers=create lst_payers
this.lst_account=create lst_account
this.lst_bank=create lst_bank
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_8
this.Control[iCurrent+2]=this.em_foreing_amt
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.em_exchange_rate
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.cb_save
this.Control[iCurrent+7]=this.cb_clear
this.Control[iCurrent+8]=this.st_7
this.Control[iCurrent+9]=this.em_date
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.sle_note
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.em_amount
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.lst_dest_bank
this.Control[iCurrent+18]=this.lst_payers
this.Control[iCurrent+19]=this.lst_account
this.Control[iCurrent+20]=this.lst_bank
this.Control[iCurrent+21]=this.gb_1
end on

on w_acc_wire.destroy
call super::destroy
destroy(this.st_8)
destroy(this.em_foreing_amt)
destroy(this.st_4)
destroy(this.em_exchange_rate)
destroy(this.dw_1)
destroy(this.cb_save)
destroy(this.cb_clear)
destroy(this.st_7)
destroy(this.em_date)
destroy(this.st_6)
destroy(this.sle_note)
destroy(this.st_5)
destroy(this.em_amount)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.lst_dest_bank)
destroy(this.lst_payers)
destroy(this.lst_account)
destroy(this.lst_bank)
destroy(this.gb_1)
end on

event open;call super::open;em_date.text = string(today(),"mm/dd/yyyy")
lst_bank.addqueryad("SELECT NAME_BANCO, ID_BANCO FROM dba.BANCO WHERE DEP_BANCO = 'Y' ORDER BY 1")
lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+lst_bank.getdataid()+"' ORDER BY 1")
lst_payers.addqueryad("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE GROUP_TYPE IN ('P') AND FLAG_GRUPO = 'A' ORDER BY name_main_branch;")
dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
end event

type st_8 from statictext within w_acc_wire
integer x = 1435
integer y = 468
integer width = 325
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Foreing Amt. :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_foreing_amt from editmask within w_acc_wire
integer x = 1774
integer y = 452
integer width = 512
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###########.00"
end type

event modified;em_amount.text = string(double(em_foreing_amt.text) / double(em_exchange_rate.text))
end event

type st_4 from statictext within w_acc_wire
integer x = 850
integer y = 468
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Exc.Rat. :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_exchange_rate from editmask within w_acc_wire
integer x = 1106
integer y = 452
integer width = 311
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "1"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###########.0000"
end type

event modified;em_foreing_amt.text = string(double(em_amount.text) * double(em_exchange_rate.text))

if sle_note.text = '' then
	sle_note.text = 'TRANS. '+string(date(em_date.text),"mm/dd/yyyy")
end if

if double(em_exchange_rate.text) <> 0 and double(em_exchange_rate.text) <> 1 then
	if pos(sle_note.text,'@') = 0  then
		sle_note.text = sle_note.text + ' @ '+em_exchange_rate.text
	else
		sle_note.text = mid(sle_note.text,1,pos(sle_note.text,'@')-2) + ' @ '+em_exchange_rate.text
	end if
end if
end event

type dw_1 from datawindow within w_acc_wire
integer x = 37
integer y = 812
integer width = 2336
integer height = 980
integer taborder = 100
string dataobject = "dw_acc_wire_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_save from commandbutton within w_acc_wire
integer x = 1874
integer y = 652
integer width = 416
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save Wire"
end type

event clicked;

Double 	ld_cons, ld_amount, ld_balance, ld_exchange_rate
String	ls_payer, ls_bank, ls_account, ls_dest_bank
Date		ld_date
datetime ld_date_inicio, ld_date_final
Double   ld_rate_allowance

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Getting and validating the info

ld_date = date(em_date.text)

//IF Abs(DaysAfter(today(),ld_date)) > 300 Then
//	Messagebox("Invalid Date","Please check the date",StopSign!)
//	setfocus(em_date)
//	return
//end if


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Account parameters validation

SELECT min(dba.ACC_PARAMETERS.DATE_BLOCKER),   
		 min(dba.ACC_PARAMETERS.DATE_BLOCKER_POST),
		 min(RATE_ALLOWANCE)
  INTO :ld_date_inicio,   
		 :ld_date_final,
		 :ld_rate_allowance
  FROM dba.ACC_PARAMETERS  ;

if SQLCA.SQLCode <> 0 then
	Messagebox("Error","Error checking Account Parameters, Block Date will not be checked!~n[Error: "+SQLCA.SQLErrText+"]",Stopsign!)
	return
end if

if not isnull(ld_date_inicio) and not isnull(ld_date_final) then

	if (ld_date <= date(ld_date_inicio)) or (ld_date >= date(ld_date_final)) then	
		messagebox("Error","The date you are using ("+string(ld_date,"mm/dd/yyyy")+") was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
		setfocus(em_date)
		return
	end if

end if

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



ls_bank = lst_bank.getdataid()

if isnull(ls_bank) or ls_bank = '--' or ls_bank = '' then
	Messagebox("Missing Data","Please select a bank",StopSign!)
	setfocus(lst_bank)
	return
end if

ls_account = lst_account.getdataid()

if isnull(ls_account) or ls_account = '--' or ls_account = '' then
	Messagebox("Missing Data","Please select a bank account",StopSign!)
	setfocus(lst_account)
	return
end if

ls_payer = lst_payers.getdataid()

if isnull(ls_payer) or ls_payer = '--' or ls_payer = '' then
	Messagebox("Missing Data","Please select a payer",StopSign!)
	setfocus(lst_payers)
	return
end if


ls_dest_bank = lst_dest_bank.getdataid()

if isnull(ls_dest_bank) or ls_dest_bank = '--' or ls_dest_bank = '' then
	Messagebox("Missing Data","Please select the payer's account",StopSign!)
	setfocus(lst_dest_bank)
	return
end if

ld_amount = double(em_amount.text)

if isnull(ld_amount) or ld_amount < 0 then
	Messagebox("Invalid Amount","Please enter a valid amount",StopSign!)
	setfocus(em_amount)
	return
end if

ld_exchange_rate = double(em_exchange_rate.text)

if isnull(ld_exchange_rate) or ld_exchange_rate < 0 then
	Messagebox("Invalid Amount","Please enter a valid exchange rate",StopSign!)
	setfocus(em_exchange_rate)
	return
end if


// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Chequea que el exchange rate sea +- ld_rate_allowance% de la tasa promedio de los ultimos 30 dias!
// Si no hay wires en los ultimos 30 dias no chequea!

if ld_exchange_rate <> 1 then
	
	double ld_ave_rate
	
	SELECT AVG(EXCHANGE_RATE)
			 INTO :ld_ave_rate
	  FROM DBA.TRANSACCION_DIARIA_BANCO_PAYEE B,
			 DBA.TRANSACCION_DIARIA_PAYEE T
	 WHERE T.CONS_TRANS_DIARIA = B.CONS_TRANS_DIARIA
		AND T.DATE_TRANS_DIARIA > (GETDATE() - 30)
		AND ID_GROUP_TRANS_DIARIA = :ls_payer
		AND ID_CONCEPTO_CONTABLE = 'DP'
		AND ISNULL(EXCHANGE_RATE,0) > 1;
	
	if isnull(ld_ave_rate) then ld_ave_rate = 0
	
	//ls_payer T144 es Citi, no se valida porque tiene tasas de varios paises! 
	if ld_ave_rate <> 0  and ld_exchange_rate <> 0 and ls_payer <> 'T144' then
	
		// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
		if abs(((ld_exchange_rate - ld_ave_rate) / ld_exchange_rate)) > ld_rate_allowance then
			Messagebox("Invalid Amount","Please enter a valid exchange rate (±"+String(ld_rate_allowance * 100)+"%)",StopSign!)
			setfocus(em_exchange_rate)
			return
		end if
	
	end if

end if
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


ld_balance = fn_balance_escalable(ls_payer,String(Today(),'mm-dd-yyyy'))
ld_balance = round(ld_balance,2) + round(ld_amount,2)


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

If Messagebox("Confirmation","Are you sure that you want to save a Wire for $"+string(ld_amount,"######,##0.00")+" for "+lst_payers.getdatavalue()+"?",Question!,YesNo!) = 1 Then

	SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
	  INTO :ld_cons  
	  FROM dba.transaccion_diaria_payee;
	
	INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
	VALUES(:ld_cons, :ls_payer, getdate(), getdate(), 'DP', :sle_note.text, :ld_amount, 0, :ld_balance, null, null, null, getdate(), :gs_cashier, null, :ls_dest_bank, null);
	
	If SQLCA.SQLCode <> 0 then
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
		Return	
	End if
	
	INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE)
	VALUES(:ld_cons, :ls_bank, :ls_account, null, :ld_date, getdate(),:ld_exchange_rate);
	
	If SQLCA.SQLCode <> 0 then
		DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons;
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
		Return	
	End if
	
	lst_bank.addqueryad("SELECT NAME_BANCO, ID_BANCO FROM dba.BANCO WHERE DEP_BANCO = 'Y' ORDER BY 1")
	lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+lst_bank.getdataid()+"' ORDER BY 1")
	lst_payers.addqueryad("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE GROUP_TYPE IN ('P') AND FLAG_GRUPO = 'A' ORDER BY name_main_branch;")
	em_amount.text = '0.00'
	em_exchange_rate.text = '1.00'
	em_foreing_amt.text = '0.00'
	sle_note.text = ''
	
	dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
	
	MessageBox("Data Saved","The wire has been saved successfully",Information!)
	
	setfocus(lst_bank)
else
	Messagebox("Canceled","The wire was not saved",Exclamation!)
end if
end event

type cb_clear from commandbutton within w_acc_wire
integer x = 1440
integer y = 652
integer width = 416
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear"
end type

event clicked;
lst_bank.addqueryad("SELECT NAME_BANCO, ID_BANCO FROM dba.BANCO WHERE DEP_BANCO = 'Y' ORDER BY 1")
lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+lst_bank.getdataid()+"' ORDER BY 1")
lst_payers.addqueryad("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE GROUP_TYPE IN ('P') AND FLAG_GRUPO = 'A' ORDER BY name_main_branch;")
dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
em_amount.text = '0.00'
em_exchange_rate.text = '1.00'
em_foreing_amt.text = '0.00'
//sle_note.text = ''
sle_note.text = 'TRANS. '+string(date(em_date.text),"mm/dd/yyyy")
setfocus(lst_bank)

end event

type st_7 from statictext within w_acc_wire
integer x = 87
integer y = 100
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bank Date :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date from editmask within w_acc_wire
integer x = 503
integer y = 88
integer width = 302
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

event losefocus;dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))

if sle_note.text = '' then
	sle_note.text = 'TRANS. '+string(date(em_date.text),"mm/dd/yyyy")
end if
end event

event modified;if sle_note.text <> '' then
	sle_note.text = 'TRANS. '+string(date(em_date.text),"mm/dd/yyyy")
end if

if double(em_exchange_rate.text) <> 0 and double(em_exchange_rate.text) <> 1 then
	if pos(sle_note.text,'@') = 0  then
		sle_note.text = sle_note.text + ' @ '+em_exchange_rate.text
	end if
end if
end event

type st_6 from statictext within w_acc_wire
integer x = 87
integer y = 564
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Wire Notes :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_note from singlelineedit within w_acc_wire
integer x = 503
integer y = 548
integer width = 1783
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_acc_wire
integer x = 87
integer y = 468
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Wire Amount :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_amount from editmask within w_acc_wire
integer x = 503
integer y = 452
integer width = 347
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###########.00"
end type

event modified;em_foreing_amt.text = string(double(em_amount.text) * double(em_exchange_rate.text))
end event

type st_3 from statictext within w_acc_wire
integer x = 87
integer y = 372
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer Acc. :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_acc_wire
integer x = 87
integer y = 184
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Viamericas Acc. :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_acc_wire
integer x = 87
integer y = 276
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_dest_bank from my_ddlb within w_acc_wire
integer x = 503
integer y = 360
integer width = 1042
integer height = 788
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type lst_payers from my_ddlb within w_acc_wire
integer x = 503
integer y = 268
integer width = 1042
integer height = 788
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;long 		ll_cont
String	ls_payer

ls_payer = lst_payers.getdataid()

SELECT count(*) 
  INTO :ll_cont
  FROM dba.WIREBANK
 WHERE ID_MAIN_BRANCH = :ls_payer;
 
if ll_cont>0 then
	lst_dest_bank.addquery("SELECT rtrim(bnkName) + ' ('+rtrim(bnkAccount)+')', bnkId FROM dba.WIREBANK WHERE id_main_branch = '"+ls_payer+"' ORDER BY 1")
else
	lst_dest_bank.addquery("SELECT 'PLEASE SELECT A PAYER WITH A DEST ACC.', '--'")
end if
end event

type lst_account from my_ddlb within w_acc_wire
integer x = 1545
integer y = 176
integer width = 750
integer height = 788
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type lst_bank from my_ddlb within w_acc_wire
integer x = 503
integer y = 176
integer width = 1042
integer height = 788
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;long 		ll_cont
String	ls_bank

ls_bank = lst_bank.getdataid()

SELECT count(*) 
  INTO :ll_cont
  FROM dba.CUENTA_BANCO
 WHERE ID_BANCO = :ls_bank;
 
if ll_cont>0 then
	lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+ls_bank+"' ORDER BY 1")
else
	lst_account.addquery("SELECT 'PLEASE SELECT A BANK', '--'")
end if
end event

type gb_1 from groupbox within w_acc_wire
integer x = 37
integer y = 20
integer width = 2336
integer height = 764
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

