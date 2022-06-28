$PBExportHeader$w_acc_generalentry.srw
forward
global type w_acc_generalentry from w_master
end type
type st_reconciled_to from statictext within w_acc_generalentry
end type
type lst_currency from my_ddlb within w_acc_generalentry
end type
type st_1 from statictext within w_acc_generalentry
end type
type em_date from pfc_u_em within w_acc_generalentry
end type
type pb_date from picturebutton within w_acc_generalentry
end type
type rb_payer from radiobutton within w_acc_generalentry
end type
type rb_agent from radiobutton within w_acc_generalentry
end type
type sle_details from singlelineedit within w_acc_generalentry
end type
type st_8 from statictext within w_acc_generalentry
end type
type st_name from statictext within w_acc_generalentry
end type
type em_branch from editmask within w_acc_generalentry
end type
type st_3 from statictext within w_acc_generalentry
end type
type lst_transaction from my_ddlb within w_acc_generalentry
end type
type cbx_cross from checkbox within w_acc_generalentry
end type
type st_4 from statictext within w_acc_generalentry
end type
type em_debit from editmask within w_acc_generalentry
end type
type cb_save from commandbutton within w_acc_generalentry
end type
type cb_clear from commandbutton within w_acc_generalentry
end type
type st_7 from statictext within w_acc_generalentry
end type
type st_6 from statictext within w_acc_generalentry
end type
type sle_note from singlelineedit within w_acc_generalentry
end type
type st_5 from statictext within w_acc_generalentry
end type
type em_credit from editmask within w_acc_generalentry
end type
type st_2 from statictext within w_acc_generalentry
end type
type st_label1 from statictext within w_acc_generalentry
end type
type lst_account from my_ddlb within w_acc_generalentry
end type
type lst_bank from my_ddlb within w_acc_generalentry
end type
type gb_2 from groupbox within w_acc_generalentry
end type
type gb_1 from groupbox within w_acc_generalentry
end type
end forward

global type w_acc_generalentry from w_master
integer width = 2661
integer height = 1248
string title = "General Entry"
boolean maxbox = false
boolean resizable = false
st_reconciled_to st_reconciled_to
lst_currency lst_currency
st_1 st_1
em_date em_date
pb_date pb_date
rb_payer rb_payer
rb_agent rb_agent
sle_details sle_details
st_8 st_8
st_name st_name
em_branch em_branch
st_3 st_3
lst_transaction lst_transaction
cbx_cross cbx_cross
st_4 st_4
em_debit em_debit
cb_save cb_save
cb_clear cb_clear
st_7 st_7
st_6 st_6
sle_note sle_note
st_5 st_5
em_credit em_credit
st_2 st_2
st_label1 st_label1
lst_account lst_account
lst_bank lst_bank
gb_2 gb_2
gb_1 gb_1
end type
global w_acc_generalentry w_acc_generalentry

forward prototypes
public subroutine fn_update_reconciled_to ()
end prototypes

public subroutine fn_update_reconciled_to ();String ls_bank, ls_account
Datetime ld_reconciled_to

ls_bank = lst_bank.getdataid()
ls_account = lst_account.getdataid()

setnull(ld_reconciled_to)

SELECT RECONCILED_TO 
INTO :ld_reconciled_to
FROM dba.CUENTA_BANCO
WHERE  ID_BANCO = :ls_bank
AND ID_CUENTA_BANCO = :ls_account;

if not isnull(ld_reconciled_to) then st_reconciled_to.text = "Reconciled to: " + String(ld_reconciled_to,'mm/dd/yyyy')
end subroutine

on w_acc_generalentry.create
int iCurrent
call super::create
this.st_reconciled_to=create st_reconciled_to
this.lst_currency=create lst_currency
this.st_1=create st_1
this.em_date=create em_date
this.pb_date=create pb_date
this.rb_payer=create rb_payer
this.rb_agent=create rb_agent
this.sle_details=create sle_details
this.st_8=create st_8
this.st_name=create st_name
this.em_branch=create em_branch
this.st_3=create st_3
this.lst_transaction=create lst_transaction
this.cbx_cross=create cbx_cross
this.st_4=create st_4
this.em_debit=create em_debit
this.cb_save=create cb_save
this.cb_clear=create cb_clear
this.st_7=create st_7
this.st_6=create st_6
this.sle_note=create sle_note
this.st_5=create st_5
this.em_credit=create em_credit
this.st_2=create st_2
this.st_label1=create st_label1
this.lst_account=create lst_account
this.lst_bank=create lst_bank
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_reconciled_to
this.Control[iCurrent+2]=this.lst_currency
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_date
this.Control[iCurrent+5]=this.pb_date
this.Control[iCurrent+6]=this.rb_payer
this.Control[iCurrent+7]=this.rb_agent
this.Control[iCurrent+8]=this.sle_details
this.Control[iCurrent+9]=this.st_8
this.Control[iCurrent+10]=this.st_name
this.Control[iCurrent+11]=this.em_branch
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.lst_transaction
this.Control[iCurrent+14]=this.cbx_cross
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.em_debit
this.Control[iCurrent+17]=this.cb_save
this.Control[iCurrent+18]=this.cb_clear
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.sle_note
this.Control[iCurrent+22]=this.st_5
this.Control[iCurrent+23]=this.em_credit
this.Control[iCurrent+24]=this.st_2
this.Control[iCurrent+25]=this.st_label1
this.Control[iCurrent+26]=this.lst_account
this.Control[iCurrent+27]=this.lst_bank
this.Control[iCurrent+28]=this.gb_2
this.Control[iCurrent+29]=this.gb_1
end on

on w_acc_generalentry.destroy
call super::destroy
destroy(this.st_reconciled_to)
destroy(this.lst_currency)
destroy(this.st_1)
destroy(this.em_date)
destroy(this.pb_date)
destroy(this.rb_payer)
destroy(this.rb_agent)
destroy(this.sle_details)
destroy(this.st_8)
destroy(this.st_name)
destroy(this.em_branch)
destroy(this.st_3)
destroy(this.lst_transaction)
destroy(this.cbx_cross)
destroy(this.st_4)
destroy(this.em_debit)
destroy(this.cb_save)
destroy(this.cb_clear)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.sle_note)
destroy(this.st_5)
destroy(this.em_credit)
destroy(this.st_2)
destroy(this.st_label1)
destroy(this.lst_account)
destroy(this.lst_bank)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;call super::open;
em_date.text = string(today(),"mm/dd/yyyy")
lst_bank.addqueryad("SELECT NAME_BANCO, ID_BANCO FROM dba.BANCO WHERE DEP_BANCO = 'Y' ORDER BY 1")
lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+lst_bank.getdataid()+"' ORDER BY 1")
lst_transaction.addqueryad("SELECT RTRIM(NAME_CONCEPTO_CONTABLE), RTRIM(ID_CONCEPTO_CONTABLE) FROM dba.CONCEPTO_CONTABLE WHERE ISNULL(ALLOW_GENERAL_ENTRY,'N') = 'Y' ORDER BY 1")
lst_currency.addqueryad("SELECT RTRIM(NAME_CURRENCY), RTRIM(ID_CURRENY) FROM dba.CURRENCY  ORDER BY 1")

em_date.enabled = cbx_cross.checked
pb_date.enabled = cbx_cross.checked
lst_bank.enabled = cbx_cross.checked
lst_account.enabled = cbx_cross.checked

end event

type st_reconciled_to from statictext within w_acc_generalentry
integer x = 1518
integer y = 748
integer width = 750
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type lst_currency from my_ddlb within w_acc_generalentry
integer x = 1888
integer y = 228
integer width = 695
integer height = 788
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
end type

type st_1 from statictext within w_acc_generalentry
integer x = 1605
integer y = 244
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Currency :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date from pfc_u_em within w_acc_generalentry
integer x = 530
integer y = 748
integer width = 320
integer height = 84
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type pb_date from picturebutton within w_acc_generalentry
integer x = 850
integer y = 744
integer width = 101
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date.Event pfc_DDCalendar( )
end event

type rb_payer from radiobutton within w_acc_generalentry
integer x = 946
integer y = 64
integer width = 530
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "By Id Group"
end type

event clicked;if this.checked then st_label1.text = 'Group Id :'
end event

type rb_agent from radiobutton within w_acc_generalentry
integer x = 530
integer y = 64
integer width = 411
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "By Id Branch"
boolean checked = true
end type

event clicked;if this.checked then st_label1.text = 'Branch Id :'
end event

type sle_details from singlelineedit within w_acc_generalentry
integer x = 530
integer y = 516
integer width = 1737
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_acc_generalentry
integer x = 50
integer y = 532
integer width = 457
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transaction Details :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_name from statictext within w_acc_generalentry
integer x = 891
integer y = 144
integer width = 1376
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
boolean focusrectangle = false
end type

type em_branch from editmask within w_acc_generalentry
integer x = 530
integer y = 132
integer width = 347
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!####"
end type

event modified;string ls_branch, ls_name

ls_branch = em_branch.text

if rb_agent.checked then

	SELECT name_branch
	  INTO :ls_name  
	  FROM dba.branch  
	 WHERE id_branch = :ls_branch;

else
	
	SELECT name_main_branch
	  INTO :ls_name  
	  FROM dba.group_branch  
	 WHERE id_main_branch = :ls_branch;
	
end if


if isnull(ls_name) then ls_name = ''

st_name.text = ls_name
end event

type st_3 from statictext within w_acc_generalentry
integer x = 87
integer y = 244
integer width = 421
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transaction Type :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_transaction from my_ddlb within w_acc_generalentry
integer x = 530
integer y = 228
integer width = 1042
integer height = 788
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;string	ls_transactionid, ls_tipo_concepto_contable

ls_transactionid = lst_transaction.getdataid()

SELECT isnull(TIPO_CONCEPTO_CONTABLE,'B')
  INTO :ls_tipo_concepto_contable
  FROM dba.CONCEPTO_CONTABLE
 WHERE ID_CONCEPTO_CONTABLE = :ls_transactionid;

if ls_tipo_concepto_contable = 'C' then
	em_credit.enabled = true
	em_debit.enabled = false
	em_debit.text = '0.00'
elseif ls_tipo_concepto_contable = 'D' then
	em_debit.enabled = true
	em_credit.enabled = false
	em_credit.text = '0.00'
else
	em_debit.enabled = true
	em_credit.enabled = true
end if

if ls_transactionid = 'PCM' then
	
	lst_currency.enabled = true
	
else
	
	lst_currency.enabled = false
	
end if


end event

type cbx_cross from checkbox within w_acc_generalentry
integer x = 105
integer y = 656
integer width = 649
integer height = 64
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cross with Bank Account"
boolean checked = true
end type

event clicked;em_date.enabled = this.checked
pb_date.enabled = this.checked
lst_bank.enabled = this.checked
lst_account.enabled = this.checked
end event

type st_4 from statictext within w_acc_generalentry
integer x = 951
integer y = 340
integer width = 210
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Debit :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_debit from editmask within w_acc_generalentry
integer x = 1175
integer y = 324
integer width = 398
integer height = 84
integer taborder = 40
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

type cb_save from commandbutton within w_acc_generalentry
integer x = 1893
integer y = 992
integer width = 425
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save Transaction"
end type

event clicked;
string 	ls_branch, ls_id_main_branch, ls_transaction, ls_bank, ls_account, ls_entrydesc, s_business_day, ls_new_date, ls_currency, s_id_payer_commission_mode
long 		ll_cont
double	ld_credit, ld_debit, ld_cons, ld_balance, ld_exchange_rate
date 		ld_date
datetime ld_date_inicio, ld_date_final


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Getting and validating the info

ls_branch = em_branch.text

if rb_agent.checked then

	SELECT count(*)
	  INTO :ll_cont
	  FROM dba.branch  
	 WHERE id_branch = :ls_branch
		AND id_type_branch in ('A','R');
	
else
	
	SELECT count(*)
	  INTO :ll_cont
	  FROM dba.group_branch  
	 WHERE id_main_branch = :ls_branch;
	
end if
	
if ll_cont <> 1 then
	Messagebox("Missing Data","Please select a valid branch/payer",StopSign!)
	setfocus(em_branch)
	return
end if

String ls_id_status_branch

SELECT id_status_branch
  INTO :ls_id_status_branch
  FROM dba.branch  
 WHERE id_branch = :ls_branch;

if ls_id_status_branch <> 'O' then
	If Messagebox("Confirmation","Esta agencia esta cerrada, seguro que quiere ingresar la transaccion para "+st_name.text+"?",Question!,YesNo!) <> 1 Then
		return
	end if		
end if

ls_transaction = lst_transaction.getdataid()

if isnull(ls_transaction) or ls_transaction = '--' or ls_transaction = '' then
	Messagebox("Missing Data","Please select a transaction type",StopSign!)
	setfocus(lst_transaction)
	return
end if

ld_credit = double(em_credit.text)

if isnull(ld_credit) or ld_credit < 0 then
	Messagebox("Invalid Credit Amount","Please enter a valid credit amount",StopSign!)
	setfocus(em_credit)
	return
end if

ld_debit = double(em_debit.text)

if isnull(ld_debit) or ld_debit < 0 then
	Messagebox("Invalid Debit Amount","Please enter a valid debit amount",StopSign!)
	setfocus(em_debit)
	return
end if

if ld_debit <> 0 and ld_credit <> 0 then
	Messagebox("Invalid Credit-Debit Amount","Please enter only credit or debit amount",StopSign!)
	setfocus(em_credit)
	return
end if

setnull(s_id_payer_commission_mode )

if ls_transaction = 'PCM' then
	
	SELECT ID_PAYER_COMMISSION_MODE
	INTO :s_id_payer_commission_mode
	FROM DBA.GROUP_BRANCH
	WHERE ID_MAIN_BRANCH = :ls_id_main_branch;
	
	
			
	end if
if cbx_cross.checked then
	
	ld_date = date(em_date.text)
	
	IF Abs(DaysAfter(today(),ld_date)) > 90 Then
		Messagebox("Invalid Date","Please check the date",StopSign!)
		setfocus(em_date)
		return
	end if			

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// Account parameters validation
	
	SELECT min(dba.ACC_PARAMETERS.DATE_BLOCKER),   
			 min(dba.ACC_PARAMETERS.DATE_BLOCKER_POST)
	  INTO :ld_date_inicio,   
		    :ld_date_final  
	  FROM dba.ACC_PARAMETERS  ;
	
	if SQLCA.SQLCode <> 0 then
		Messagebox("Error","Error checking Account Parameters, Block Date will not be checked!~n[Error: "+SQLCA.SQLErrText+"]",Stopsign!)
		return
	end if
	
	if not isnull(ld_date_inicio) and not isnull(ld_date_final) then
	
		if (ld_date <= date(ld_date_inicio)) or (ld_date >= date(ld_date_final)) then	
			messagebox("Error","The date you are using ("+string(ld_date,"mm/dd/yyyy")+") was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
			return
		end if
	
	end if	
	
	

		SELECT dba.sfGetIsBusinessDay(:ld_date)
		INTO :s_business_day
		FROM DBA.DUAL;


	IF s_business_day = 'N' THEN
		messagebox("Error","The date you are using is not a business day, please check for the next avalilable business day",StopSign!)
		Return
	END IF
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
	
end if


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


If Messagebox("Confirmation","Are you sure that you want to save a "+trim(lst_transaction.getdatavalue())+" for $"+string(ld_debit + ld_credit,"######,##0.00")+" for "+st_name.text+"?",Question!,YesNo!) = 1 Then

	if rb_agent.checked then	
		SELECT id_main_branch
		  INTO :ls_id_main_branch
		  FROM dba.branch  
		 WHERE id_branch = :ls_branch;
	else		
		ls_id_main_branch = ls_branch		
	end if

	SELECT GENERAL_ENTRY_DESC
	  INTO :ls_entrydesc
	  FROM dba.CONCEPTO_CONTABLE
	 WHERE ID_CONCEPTO_CONTABLE = :ls_transaction;
	 
	sle_note.text = trim(ls_entrydesc)+' '+sle_note.text

	SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
	  INTO :ld_cons  
	  FROM dba.transaccion_diaria_payee;

	ld_balance = fn_balance_escalable(ls_id_main_branch,String(Today(),'mm-dd-yyyy'))
	
	if s_id_payer_commission_mode <> 'BD' then
		ld_balance = round(ld_balance,2) + (round(ld_debit,2) - round(ld_credit,2))
	end if	

	
	INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
	VALUES(:ld_cons, :ls_id_main_branch, getdate(), getdate(), :ls_transaction, :sle_note.text, :ld_debit, :ld_credit, :ld_balance, null, null, :sle_details.text, getdate(), :gs_cashier, null, null, null);
	
	If SQLCA.SQLCode <> 0 then
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
		Return	
	End if

	if cbx_cross.checked then	
		
		INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE)
		VALUES(:ld_cons, :ls_bank, :ls_account, null, :ld_date, getdate(),null);
		
		If SQLCA.SQLCode <> 0 then
			DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons;
			Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
			Return
		End if
	
	end if	

	cb_clear.triggerevent(Clicked!)
	
	MessageBox("Data Saved","The transaction has been saved successfully",Information!)
	
	setfocus(em_branch)
	
else
	Messagebox("Canceled","The transaction was not saved",Exclamation!)
end if


end event

type cb_clear from commandbutton within w_acc_generalentry
integer x = 1458
integer y = 992
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

event clicked;em_date.text = string(today(),"mm/dd/yyyy")
lst_bank.addqueryad("SELECT NAME_BANCO, ID_BANCO FROM dba.BANCO WHERE DEP_BANCO = 'Y' ORDER BY 1")
lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+lst_bank.getdataid()+"' ORDER BY 1")
lst_transaction.addqueryad("SELECT RTRIM(NAME_CONCEPTO_CONTABLE), RTRIM(ID_CONCEPTO_CONTABLE) FROM dba.CONCEPTO_CONTABLE WHERE ISNULL(ALLOW_GENERAL_ENTRY,'N') = 'Y' ORDER BY 1")

em_branch.text = ''
em_credit.text = '0.00'
em_debit.text = '0.00'
sle_note.text = ''
sle_details.text = ''
st_reconciled_to.text = ''

cbx_cross.checked = false
cbx_cross.triggerevent(Clicked!)

setfocus(em_branch)
end event

type st_7 from statictext within w_acc_generalentry
integer x = 110
integer y = 760
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

type st_6 from statictext within w_acc_generalentry
integer x = 69
integer y = 436
integer width = 439
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transaction Notes :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_note from singlelineedit within w_acc_generalentry
integer x = 530
integer y = 420
integer width = 1737
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 29
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_acc_generalentry
integer x = 110
integer y = 340
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
string text = "Credit :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_credit from editmask within w_acc_generalentry
integer x = 530
integer y = 324
integer width = 398
integer height = 84
integer taborder = 30
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

type st_2 from statictext within w_acc_generalentry
integer x = 110
integer y = 848
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

type st_label1 from statictext within w_acc_generalentry
integer x = 110
integer y = 148
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
string text = "Branch Id :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_account from my_ddlb within w_acc_generalentry
integer x = 1518
integer y = 840
integer width = 750
integer height = 788
integer taborder = 90
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
end type

event selectionchanged;call super::selectionchanged;
//fn_update_reconciled_to()
end event

type lst_bank from my_ddlb within w_acc_generalentry
integer x = 530
integer y = 840
integer width = 978
integer height = 788
integer taborder = 80
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
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
	
	fn_update_reconciled_to()
else
	lst_account.addquery("SELECT 'PLEASE SELECT A BANK', '--'")
end if
end event

type gb_2 from groupbox within w_acc_generalentry
integer x = 59
integer y = 656
integer width = 2263
integer height = 304
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_acc_generalentry
integer x = 23
integer y = 8
integer width = 2601
integer height = 1128
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "General Entry"
end type

