$PBExportHeader$w_bank_transfer.srw
forward
global type w_bank_transfer from w_sheet
end type
type dw_1 from datawindow within w_bank_transfer
end type
type mle_notes_from from multilineedit within w_bank_transfer
end type
type st_6 from statictext within w_bank_transfer
end type
type cb_1 from commandbutton within w_bank_transfer
end type
type em_amount from editmask within w_bank_transfer
end type
type st_5 from statictext within w_bank_transfer
end type
type mle_notes from multilineedit within w_bank_transfer
end type
type st_4 from statictext within w_bank_transfer
end type
type pb_1 from picturebutton within w_bank_transfer
end type
type em_date_to from pfc_u_em within w_bank_transfer
end type
type st_3 from statictext within w_bank_transfer
end type
type lst_account_to from my_ddlb within w_bank_transfer
end type
type lst_bank_to from my_ddlb within w_bank_transfer
end type
type st_1 from statictext within w_bank_transfer
end type
type lst_account from my_ddlb within w_bank_transfer
end type
type lst_bank from my_ddlb within w_bank_transfer
end type
type st_2 from statictext within w_bank_transfer
end type
type pb_date from picturebutton within w_bank_transfer
end type
type em_date from pfc_u_em within w_bank_transfer
end type
type st_7 from statictext within w_bank_transfer
end type
type gb_1 from groupbox within w_bank_transfer
end type
type gb_2 from groupbox within w_bank_transfer
end type
type gb_3 from groupbox within w_bank_transfer
end type
end forward

global type w_bank_transfer from w_sheet
integer width = 2510
integer height = 2256
string title = "Bank Transfer"
dw_1 dw_1
mle_notes_from mle_notes_from
st_6 st_6
cb_1 cb_1
em_amount em_amount
st_5 st_5
mle_notes mle_notes
st_4 st_4
pb_1 pb_1
em_date_to em_date_to
st_3 st_3
lst_account_to lst_account_to
lst_bank_to lst_bank_to
st_1 st_1
lst_account lst_account
lst_bank lst_bank
st_2 st_2
pb_date pb_date
em_date em_date
st_7 st_7
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_bank_transfer w_bank_transfer

event open;call super::open;lst_bank.addqueryad("SELECT NAME_BANCO, ID_BANCO FROM dba.BANCO WHERE DEP_BANCO = 'Y' ORDER BY 1")
lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+lst_bank.getdataid()+"' ORDER BY 1")

lst_bank_to.addqueryad("SELECT NAME_BANCO, ID_BANCO FROM dba.BANCO WHERE DEP_BANCO = 'Y' ORDER BY 1")
lst_account_to.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+lst_bank.getdataid()+"' ORDER BY 1")

dw_1.settransobject(sqlca)

dw_1.retrieve()
end event

on w_bank_transfer.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.mle_notes_from=create mle_notes_from
this.st_6=create st_6
this.cb_1=create cb_1
this.em_amount=create em_amount
this.st_5=create st_5
this.mle_notes=create mle_notes
this.st_4=create st_4
this.pb_1=create pb_1
this.em_date_to=create em_date_to
this.st_3=create st_3
this.lst_account_to=create lst_account_to
this.lst_bank_to=create lst_bank_to
this.st_1=create st_1
this.lst_account=create lst_account
this.lst_bank=create lst_bank
this.st_2=create st_2
this.pb_date=create pb_date
this.em_date=create em_date
this.st_7=create st_7
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.mle_notes_from
this.Control[iCurrent+3]=this.st_6
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.em_amount
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.mle_notes
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.em_date_to
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.lst_account_to
this.Control[iCurrent+13]=this.lst_bank_to
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.lst_account
this.Control[iCurrent+16]=this.lst_bank
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.pb_date
this.Control[iCurrent+19]=this.em_date
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.gb_1
this.Control[iCurrent+22]=this.gb_2
this.Control[iCurrent+23]=this.gb_3
end on

on w_bank_transfer.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.mle_notes_from)
destroy(this.st_6)
destroy(this.cb_1)
destroy(this.em_amount)
destroy(this.st_5)
destroy(this.mle_notes)
destroy(this.st_4)
destroy(this.pb_1)
destroy(this.em_date_to)
destroy(this.st_3)
destroy(this.lst_account_to)
destroy(this.lst_bank_to)
destroy(this.st_1)
destroy(this.lst_account)
destroy(this.lst_bank)
destroy(this.st_2)
destroy(this.pb_date)
destroy(this.em_date)
destroy(this.st_7)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type dw_1 from datawindow within w_bank_transfer
integer x = 14
integer y = 1568
integer width = 2414
integer height = 568
integer taborder = 140
string title = "none"
string dataobject = "dw_bank_transfer_last_transactions"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_notes_from from multilineedit within w_bank_transfer
integer x = 517
integer y = 592
integer width = 1746
integer height = 160
integer taborder = 130
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

type st_6 from statictext within w_bank_transfer
integer x = 82
integer y = 588
integer width = 443
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transaction Notes:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_bank_transfer
integer x = 1001
integer y = 1408
integer width = 343
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Transfer"
end type

event clicked;//9985 id_group_branch
//Reconciliation date fecha usuario
//Bank transfer from
//IWT
////
string ls_bank_from, ls_account_from, ls_bank_to, ls_account_to, s_business_day, ls_trans_diaria_desc_from, ls_trans_diaria_desc_to

datetime ld_date, ld_date_inicio, ld_date_final
date ld_date_from, ld_date_to
double ld_cons1, ld_cons2, ld_amount


ls_bank_from = lst_bank.getdataid()
	
	if isnull(ls_bank_from) or ls_bank_from = '--' or ls_bank_from = '' then
		Messagebox("Missing Data","Please select a bank",StopSign!)
		setfocus(lst_bank)
		return
	end if
	
ls_account_from = lst_account.getdataid()
	
	if isnull(ls_account_from) or ls_account_from = '--' or ls_account_from = '' then
		Messagebox("Missing Data","Please select a bank account",StopSign!)
		setfocus(lst_account)
		return
	end if	
	
ls_bank_to = lst_bank_to.getdataid()

	if isnull(ls_bank_to) or ls_bank_to = '--' or ls_bank_to = '' then
		Messagebox("Missing Data","Please select a bank",StopSign!)
		setfocus(lst_bank_to)
		return
	end if
	
ls_account_to = lst_account_to.getdataid()
	
	if isnull(ls_account_to) or ls_account_to = '--' or ls_account_to = '' then
		Messagebox("Missing Data","Please select a bank account",StopSign!)
		setfocus(lst_account_to)
		return
	end if	
	
	
	ld_date_from = date(em_date.text)
	
	ld_date_to  = date(em_date_to.text)
	
	
	ld_amount = double(em_amount.text)
	
	if ld_amount <= 0 then
		
		messagebox("Inavlid amount", "The Amount need to be greater thamn 0", StopSign!)
		return
		setfocus(em_amount)
		
	end if

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// validate Dates      DATE FROM
	//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	
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
	
		if (ld_date_from <= date(ld_date_inicio)) or (ld_date_from >= date(ld_date_final)) then	
			messagebox("Error","The date you are using ("+string(ld_date_from,"mm/dd/yyyy")+") was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
			return
		end if
	
	end if	
	
	

		SELECT dba.sfGetIsBusinessDay(:ld_date_from)
		INTO :s_business_day
		FROM DBA.DUAL;


	IF s_business_day = 'N' THEN
		messagebox("Error","The date you are using is not a business day, please check for the next avalilable business day",StopSign!)
		Return
	END IF
	
	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// validate Dates      DATE TO
	//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	
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
	
		if (ld_date_to <= date(ld_date_inicio)) or (ld_date_to >= date(ld_date_final)) then	
			messagebox("Error","The date you are using ("+string(ld_date_to,"mm/dd/yyyy")+") was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
			return
		end if
	
	end if	
	
	

		SELECT dba.sfGetIsBusinessDay(:ld_date_to)
		INTO :s_business_day
		FROM DBA.DUAL;


	IF s_business_day = 'N' THEN
		messagebox("Error","The date you are using is not a business day, please check for the next avalilable business day",StopSign!)
		Return
	END IF
	
	If Messagebox("Confirmation","Are you sure that you want to save a Transfer"+" for $"+string(ld_amount,"######,##0.00")+" from "+ls_bank_from+ ' to ' + ls_bank_to +"?",Question!,YesNo!) = 1 Then
	
		SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
		INTO :ld_cons1  
		FROM dba.transaccion_diaria_payee;
		
		ls_trans_diaria_desc_from = 'BANK TRANSFER TO '+ ls_bank_to
		
		ls_trans_diaria_desc_to = 'BANK TRANSFER FROM '+ ls_bank_from
	  
	  
		INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
		VALUES(:ld_cons1, '9985', getdate(), getdate(), 'IWT', :ls_trans_diaria_desc_from, :ld_amount, 0, 0, null, null, :mle_notes_from.text, getdate(), :gs_cashier, null, null, null);

	If SQLCA.SQLCode <> 0 then
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
		Return	
	End if
	
	
	INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE)
		VALUES(:ld_cons1, :ls_bank_from, :ls_account_from, null, :ld_date_from, getdate(),null);
		
		
	If SQLCA.SQLCode <> 0 then
			DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons1;
			Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
			Return
	End if
		
		
	setnull(ld_cons2)
	
	SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
	  INTO :ld_cons2  
	  FROM dba.transaccion_diaria_payee;
	  
	  
	  INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
	VALUES(:ld_cons2, '9985', getdate(), getdate(), 'IWT', :ls_trans_diaria_desc_to, 0, :ld_amount, 0, null, null, :mle_notes.text, getdate(), :gs_cashier, null, null, null);
	
	
	If SQLCA.SQLCode <> 0 then
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
		Return	
	End if
		
	INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE)
	VALUES(:ld_cons2, :ls_bank_to, :ls_account_to, null, :ld_date_to, getdate(),null);  

	
	If SQLCA.SQLCode <> 0 then
			DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons2;
			Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
			Return
	End if
	
	// 08/29/2012: Link the two transactions.
	UPDATE dba.transaccion_diaria_payee SET link_reference = :ld_cons2 WHERE cons_trans_diaria = :ld_cons1;
	UPDATE dba.transaccion_diaria_payee SET link_reference = :ld_cons1 WHERE cons_trans_diaria = :ld_cons2;	

	
	messagebox('Confirmation', 'The Transfer was successful', exclamation!)
	
	
	end if
	
	

end event

type em_amount from editmask within w_bank_transfer
integer x = 1093
integer y = 104
integer width = 398
integer height = 84
integer taborder = 10
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

type st_5 from statictext within w_bank_transfer
integer x = 832
integer y = 120
integer width = 242
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Amount :"
alignment alignment = right!
boolean focusrectangle = false
end type

type mle_notes from multilineedit within w_bank_transfer
integer x = 517
integer y = 1176
integer width = 1746
integer height = 160
integer taborder = 120
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

type st_4 from statictext within w_bank_transfer
integer x = 82
integer y = 1172
integer width = 443
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transaction Notes:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_bank_transfer
integer x = 850
integer y = 1044
integer width = 101
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date_to.Event pfc_DDCalendar( )
end event

type em_date_to from pfc_u_em within w_bank_transfer
integer x = 521
integer y = 1048
integer width = 320
integer height = 84
integer taborder = 100
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

type st_3 from statictext within w_bank_transfer
integer x = 101
integer y = 1060
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

type lst_account_to from my_ddlb within w_bank_transfer
integer x = 1509
integer y = 908
integer width = 750
integer height = 788
integer taborder = 90
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type lst_bank_to from my_ddlb within w_bank_transfer
integer x = 521
integer y = 908
integer width = 978
integer height = 788
integer taborder = 70
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;long 		ll_cont
String	ls_bank_to

ls_bank_to = lst_bank_to.getdataid()

SELECT count(*) 
  INTO :ll_cont
  FROM dba.CUENTA_BANCO
 WHERE ID_BANCO = :ls_bank_to;
 
if ll_cont>0 then
	lst_account_to.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+ls_bank_to+"' ORDER BY 1")
else
	lst_account_to.addquery("SELECT 'PLEASE SELECT A BANK', '--'")
end if
end event

type st_1 from statictext within w_bank_transfer
integer x = 101
integer y = 920
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

type lst_account from my_ddlb within w_bank_transfer
integer x = 1509
integer y = 316
integer width = 750
integer height = 788
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type lst_bank from my_ddlb within w_bank_transfer
integer x = 521
integer y = 316
integer width = 978
integer height = 788
integer taborder = 30
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

type st_2 from statictext within w_bank_transfer
integer x = 101
integer y = 328
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

type pb_date from picturebutton within w_bank_transfer
integer x = 850
integer y = 456
integer width = 101
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date.Event pfc_DDCalendar( )
end event

type em_date from pfc_u_em within w_bank_transfer
integer x = 521
integer y = 460
integer width = 320
integer height = 84
integer taborder = 40
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

type st_7 from statictext within w_bank_transfer
integer x = 101
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
string text = "Bank Date :"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_bank_transfer
integer x = 41
integer y = 216
integer width = 2327
integer height = 576
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "From"
end type

type gb_2 from groupbox within w_bank_transfer
integer x = 41
integer y = 808
integer width = 2327
integer height = 572
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "To"
end type

type gb_3 from groupbox within w_bank_transfer
integer x = 9
integer y = 20
integer width = 2400
integer height = 1512
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bank Transfer"
end type

