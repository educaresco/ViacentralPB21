$PBExportHeader$w_balance_transfer.srw
forward
global type w_balance_transfer from w_sheet
end type
type cbx_1 from checkbox within w_balance_transfer
end type
type em_actual_balance from editmask within w_balance_transfer
end type
type lst_agencies_credit from my_ddlb within w_balance_transfer
end type
type lst_agencies from my_ddlb within w_balance_transfer
end type
type sle_1 from singlelineedit within w_balance_transfer
end type
type gb_5 from groupbox within w_balance_transfer
end type
type mle_notes from multilineedit within w_balance_transfer
end type
type sle_details from singlelineedit within w_balance_transfer
end type
type st_3 from statictext within w_balance_transfer
end type
type st_2 from statictext within w_balance_transfer
end type
type em_amount from editmask within w_balance_transfer
end type
type st_4 from statictext within w_balance_transfer
end type
type em_branch_to from editmask within w_balance_transfer
end type
type st_1 from statictext within w_balance_transfer
end type
type em_branch_from from editmask within w_balance_transfer
end type
type st_label1 from statictext within w_balance_transfer
end type
type gb_2 from groupbox within w_balance_transfer
end type
type gb_3 from groupbox within w_balance_transfer
end type
type gb_4 from groupbox within w_balance_transfer
end type
type gb_1 from groupbox within w_balance_transfer
end type
type cb_transfer from commandbutton within w_balance_transfer
end type
end forward

global type w_balance_transfer from w_sheet
integer width = 3849
integer height = 1180
string title = "Balance Transfer"
cbx_1 cbx_1
em_actual_balance em_actual_balance
lst_agencies_credit lst_agencies_credit
lst_agencies lst_agencies
sle_1 sle_1
gb_5 gb_5
mle_notes mle_notes
sle_details sle_details
st_3 st_3
st_2 st_2
em_amount em_amount
st_4 st_4
em_branch_to em_branch_to
st_1 st_1
em_branch_from em_branch_from
st_label1 st_label1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_1 gb_1
cb_transfer cb_transfer
end type
global w_balance_transfer w_balance_transfer

on w_balance_transfer.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.em_actual_balance=create em_actual_balance
this.lst_agencies_credit=create lst_agencies_credit
this.lst_agencies=create lst_agencies
this.sle_1=create sle_1
this.gb_5=create gb_5
this.mle_notes=create mle_notes
this.sle_details=create sle_details
this.st_3=create st_3
this.st_2=create st_2
this.em_amount=create em_amount
this.st_4=create st_4
this.em_branch_to=create em_branch_to
this.st_1=create st_1
this.em_branch_from=create em_branch_from
this.st_label1=create st_label1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_1=create gb_1
this.cb_transfer=create cb_transfer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.em_actual_balance
this.Control[iCurrent+3]=this.lst_agencies_credit
this.Control[iCurrent+4]=this.lst_agencies
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.gb_5
this.Control[iCurrent+7]=this.mle_notes
this.Control[iCurrent+8]=this.sle_details
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.em_amount
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.em_branch_to
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.em_branch_from
this.Control[iCurrent+16]=this.st_label1
this.Control[iCurrent+17]=this.gb_2
this.Control[iCurrent+18]=this.gb_3
this.Control[iCurrent+19]=this.gb_4
this.Control[iCurrent+20]=this.gb_1
this.Control[iCurrent+21]=this.cb_transfer
end on

on w_balance_transfer.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.em_actual_balance)
destroy(this.lst_agencies_credit)
destroy(this.lst_agencies)
destroy(this.sle_1)
destroy(this.gb_5)
destroy(this.mle_notes)
destroy(this.sle_details)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_amount)
destroy(this.st_4)
destroy(this.em_branch_to)
destroy(this.st_1)
destroy(this.em_branch_from)
destroy(this.st_label1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_1)
destroy(this.cb_transfer)
end on

type cbx_1 from checkbox within w_balance_transfer
integer x = 1915
integer y = 392
integer width = 434
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Actual Balance"
end type

event clicked;if this.checked = true then
	
	em_amount.text = em_actual_balance.text
	
else
	
	em_amount.text = '0'
	
end if
end event

type em_actual_balance from editmask within w_balance_transfer
integer x = 2363
integer y = 380
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
boolean enabled = false
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
end type

type lst_agencies_credit from my_ddlb within w_balance_transfer
integer x = 2661
integer y = 168
integer width = 1010
integer height = 1504
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O' order by name_branch;")


end event

event modified;call super::modified;em_branch_to.text = lst_agencies.getdataid()
end event

type lst_agencies from my_ddlb within w_balance_transfer
integer x = 782
integer y = 168
integer width = 1010
integer height = 1504
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O' order by name_branch;")


end event

event modified;call super::modified;em_branch_from.text = lst_agencies.getdataid()
end event

type sle_1 from singlelineedit within w_balance_transfer
integer x = 1870
integer y = 172
integer width = 114
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = ">>"
boolean border = false
end type

type gb_5 from groupbox within w_balance_transfer
integer x = 105
integer y = 836
integer width = 3630
integer height = 188
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type mle_notes from multilineedit within w_balance_transfer
integer x = 567
integer y = 528
integer width = 3168
integer height = 164
integer taborder = 40
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

type sle_details from singlelineedit within w_balance_transfer
integer x = 567
integer y = 720
integer width = 3168
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_balance_transfer
integer x = 123
integer y = 720
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
string text = "Transaction Details:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_balance_transfer
integer x = 123
integer y = 524
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

type em_amount from editmask within w_balance_transfer
integer x = 1275
integer y = 380
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

type st_4 from statictext within w_balance_transfer
integer x = 1015
integer y = 396
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

type em_branch_to from editmask within w_balance_transfer
integer x = 2304
integer y = 168
integer width = 347
integer height = 84
integer taborder = 20
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

event modified;string ls_branch

lst_agencies_credit.setselectedid( em_branch_to.text )


ls_branch = em_branch_to.text



sle_details.text =  ' TRANS BCLE A ' + ls_branch + ' | | ' + sle_details.text
end event

type st_1 from statictext within w_balance_transfer
integer x = 2011
integer y = 184
integer width = 279
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

type em_branch_from from editmask within w_balance_transfer
integer x = 416
integer y = 168
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

event modified;string ls_branch, ls_id_main_branch
double d_balance_previo

lst_agencies.setselectedid( em_branch_from.text )

ls_branch = em_branch_from.text



sle_details.text = 'TRANS BCLE FROM' + ls_branch


SELECT ID_MAIN_BRANCH
INTO :ls_id_main_branch
FROM DBA.BRANCH
WHERE ID_BRANCH = :ls_branch ;


SELECT DBA.sfCalBalancePrevio(:ls_id_main_branch, getdate())
INTO :d_balance_previo
FROM DBA.DUAL;


em_actual_balance.TEXT = string(d_balance_previo)








end event

type st_label1 from statictext within w_balance_transfer
integer x = 114
integer y = 184
integer width = 283
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

type gb_2 from groupbox within w_balance_transfer
integer x = 1979
integer y = 92
integer width = 1751
integer height = 208
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Credit"
end type

type gb_3 from groupbox within w_balance_transfer
integer x = 105
integer y = 92
integer width = 1751
integer height = 208
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Debit"
end type

type gb_4 from groupbox within w_balance_transfer
integer x = 105
integer y = 316
integer width = 3625
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transfer Detail"
end type

type gb_1 from groupbox within w_balance_transfer
integer x = 46
integer y = 24
integer width = 3735
integer height = 1028
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Balance Transfer"
end type

type cb_transfer from commandbutton within w_balance_transfer
integer x = 1760
integer y = 892
integer width = 293
integer height = 92
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Transfer"
end type

event clicked;string  ls_branch_from, ls_branch_to, ls_branch_verification, ls_id_status_branch, ls_transaction, ls_id_main_branch, ls_details_debit, ls_details_credit
double ld_amount, ld_cons

ls_branch_from = em_branch_from.text
ls_branch_to = em_branch_to.text


SELECT id_branch
INTO :ls_branch_verification
FROM dba.branch  
WHERE id_branch = :ls_branch_from
AND id_type_branch in ('A','R');

IF SQLCA.SQLCODE = 100 THEN
	
	MESSAGEBOX('Error', 'Please Select a Valid ID_Branch for Debit', stopsign!)
	setfocus(em_branch_from)
	
END IF

SELECT id_branch
INTO :ls_branch_verification
FROM dba.branch  
WHERE id_branch = :ls_branch_to
AND id_type_branch in ('A','R');

IF SQLCA.SQLCODE = 100 THEN
	
	MESSAGEBOX('Error', 'Please Select a Valid ID_Branch for Credit', stopsign!)
	setfocus(em_branch_from)
	
END IF


SELECT id_status_branch
INTO :ls_id_status_branch
FROM dba.branch  
WHERE id_branch = :ls_branch_from;


if ls_id_status_branch <> 'O' then
	If Messagebox("Confirmation","This Agency is close, Are you Sure that you want to make the transaction for "+ls_branch_from +' ?',Question!,YesNo!) <> 1 Then
		return
	end if		
end if

setnull(ls_id_status_branch)

SELECT id_status_branch
INTO :ls_id_status_branch
FROM dba.branch  
WHERE id_branch = :ls_branch_to;


if ls_id_status_branch <> 'O' then
	If Messagebox("Confirmation","This Agency is close, Are you Sure that you want to make the transaction for this Agency "+ls_branch_to +' ?',Question!,YesNo!) <> 1 Then
		return
	end if		
end if

ls_transaction = 'ABT'

ld_amount = double(em_amount.text)

if isnull(ld_amount) or ld_amount < 0 then
	Messagebox("Invalid Credit Amount","Please enter a valid credit amount",StopSign!)
	setfocus(em_amount)
	return
end if


if messagebox('Alert','Are you sure you want to make this transfer?',Question!,YesNo!) <> 1 then
	return
end if
////*************************************************************************************************************************************************************/////
////          DEBIT FROM AGENT           
////
////*************************************************************************************************************************************************************/////


SELECT id_main_branch
INTO :ls_id_main_branch
FROM dba.branch  
WHERE id_branch = :ls_branch_from;

SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
INTO :ld_cons  
FROM dba.transaccion_diaria_payee;

ls_details_debit =  'TRANS BCLE TO ' + ls_branch_to


INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
VALUES(:ld_cons, :ls_id_main_branch, getdate(), getdate(), :ls_transaction, :ls_details_debit, 0, :ld_amount, 0, null, null,  :mle_notes.text, getdate(), :gs_cashier, null, null, null);

If SQLCA.SQLCode <> 0 then
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
		Return	
End if

INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE)
VALUES(:ld_cons, 'MTSA', 'MTSA', null, getdate(), getdate(),null);
		
If SQLCA.SQLCode <> 0 then
	DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons;
	Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
	Return
End if


/////

////*************************************************************************************************************************************************************/////
////          CREDIT TO AGENT           
////
////*************************************************************************************************************************************************************/////

setnull(ls_id_main_branch)

SELECT id_main_branch
INTO :ls_id_main_branch
FROM dba.branch  
WHERE id_branch = :ls_branch_to;

setnull(ld_cons)

SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
INTO :ld_cons  
FROM dba.transaccion_diaria_payee;

ls_details_credit =  'TRANS BCLE FROM ' + ls_branch_from


INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
VALUES(:ld_cons, :ls_id_main_branch, getdate(), getdate(), :ls_transaction, :ls_details_credit, :ld_amount,0, 0, null, null, :mle_notes.text, getdate(), :gs_cashier, null, null, null);

If SQLCA.SQLCode <> 0 then
Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
Return	
End if

INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE)
VALUES(:ld_cons, 'MTSA', 'MTSA', null, getdate(), getdate(),null);

If SQLCA.SQLCode <> 0 then
	DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons;
	Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
	Return
End if

messagebox('Confirmation', 'The Transfer was successful', exclamation!)

/////





end event

