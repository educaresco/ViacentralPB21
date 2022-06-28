$PBExportHeader$w_csvwiresimport.srw
forward
global type w_csvwiresimport from pfc_w_sheet
end type
type cb_3 from commandbutton within w_csvwiresimport
end type
type cb_2 from commandbutton within w_csvwiresimport
end type
type dw_1 from datawindow within w_csvwiresimport
end type
type sle_1 from singlelineedit within w_csvwiresimport
end type
type st_1 from statictext within w_csvwiresimport
end type
type cb_1 from commandbutton within w_csvwiresimport
end type
type gb_1 from groupbox within w_csvwiresimport
end type
end forward

global type w_csvwiresimport from pfc_w_sheet
integer width = 5769
integer height = 1860
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
sle_1 sle_1
st_1 st_1
cb_1 cb_1
gb_1 gb_1
end type
global w_csvwiresimport w_csvwiresimport

on w_csvwiresimport.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_1=create cb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.gb_1
end on

on w_csvwiresimport.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event close;call super::close;delete 
from dba.tmp_import_wire
where dba_user = :gs_iduser;
end event

type cb_3 from commandbutton within w_csvwiresimport
integer x = 2528
integer y = 84
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Verify"
end type

event clicked;string docpath, docname[], s, ls_payer, ls_control, ls_account, s_name_cuenta_banco


integer i, li_cnt, li_rtn, li_filenum, li_total_rows

double ld_rate_allowance, ld_exchange_rate, ld_amount, ld_cons_trans_diaria
datetime ld_date_inicio, ld_date_final
date ld_date
 


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


if dw_1.rowcount() > 0 then 
	
	li_total_rows = dw_1.rowcount()
		for i  = 1 to li_total_rows
			
			ld_date = date(dw_1.getitemstring(i,"bank_date"))
			ls_payer = dw_1.getitemstring(i,'ref_payer')
			ld_exchange_rate = double(dw_1.getitemstring(i,'exchange_rate'))
			ls_account = dw_1.getitemstring(i,'account')
			ld_amount = double(dw_1.getitemstring(i,'amount'))
			ls_control = ''
			
			
Select A.cons_trans_diaria
into :ld_cons_trans_diaria
from dba.TRANSACCION_DIARIA_BANCO_PAYEE A, dba.TRANSACCION_DIARIA_PAYEE B
where A.CONS_TRANS_DIARIA = B.CONS_TRANS_DIARIA
and id_cuenta_banco = :ls_account
and debit_trans_diaria = :ld_amount
and reconciliationdate= :ld_date;


IF SQLCA.SQLCODE <> 100 THEN
	ls_control = 'D'
	
ELSE			
			
			
SELECT NAME_CUENTA_BANCO
INTO :s_name_cuenta_banco
FROM DBA.CUENTA_BANCO
WHERE ID_CUENTA_BANCO = :ls_account;

IF SQLCA.SQLCODE = 100 THEN
	dw_1.setitem(i,'control_acc','A')
	ls_control = 'E'
	
END IF
END IF	

if not isnull(ld_date_inicio) and not isnull(ld_date_final) then

	if (ld_date <= date(ld_date_inicio)) or (ld_date >= date(ld_date_final)) then	
		
		//messagebox("Error","The date you are using ("+string(ld_date,"mm/dd/yyyy")+") was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
		dw_1.setitem(i,'control_date','A')
		
		IF ls_control <> 'D' THEN
			ls_control = 'E'
		END IF
		
	ELSE
		
		dw_1.setitem(i,'control_date','')
		
	end if
	
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
	
	if ld_ave_rate <> 0  and ld_exchange_rate <> 0 then
	
		// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
		if abs(((ld_exchange_rate - ld_ave_rate) / ld_exchange_rate)) > ld_rate_allowance then
			Messagebox("Invalid Amount","Please enter a valid exchange rate (±"+String(ld_rate_allowance * 100)+"%)",StopSign!)
			dw_1.setitem(i,'control_rate','A')
			
			IF ls_control <> 'D' THEN
			ls_control = 'E'
			END IF
			
		end if
	
	end if

end if

end if
if ls_control = 'D' then
	dw_1.setitem(i,'message','DUPLICATE')
	dw_1.setitem(i,'selection','N')
ELSE
	IF ls_control = 'E' then
		dw_1.setitem(i,'message','ERROR')
		dw_1.setitem(i,'selection','N')
	else
		dw_1.setitem(i,'message','GOOD')
		dw_1.setitem(i,'selection','Y')
	end if
	end if
	


next
end if

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



end event

type cb_2 from commandbutton within w_csvwiresimport
integer x = 3067
integer y = 84
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;integer li_total_rows, i
string ls_payer, ls_account, s_payer_name, ls_notes, ls_dest_bank,ls_bank, ls_currency
double ld_exchange_rate, ld_amount, ld_cons, ld_balance
date ld_date


if dw_1.rowcount() > 0 then
	
	li_total_rows = dw_1.rowcount()
	
	for i = 1 to li_total_rows
		
		IF dw_1.getitemstring(i,'selection') = 'Y' then
		
		ld_date = date(dw_1.getitemstring(i,"bank_date"))
			ls_payer = dw_1.getitemstring(i,'ref_payer')
			ld_exchange_rate = double(dw_1.getitemstring(i,'exchange_rate'))
			ls_account = dw_1.getitemstring(i,'account')
			ld_amount = double(dw_1.getitemstring(i,'amount'))
			ls_notes = dw_1.getitemstring(i,'notes')
			ls_currency = dw_1.getitemstring(i,'id_currency')
			
			
			SELECT NAME_MAIN_BRANCH
			INTO :s_payer_name
			FROM DBA.GROUP_BRANCH
			WHERE ID_MAIN_BRANCH = :ls_payer;
			
			SELECT ID_BANCO
			INTO :ls_bank
			FROM dba.CUENTA_BANCO
			WHERE ID_CUENTA_BANCO = :ls_account;
			
	SELECT bnkId 
	INTO :ls_dest_bank
	FROM dba.WIREBANK 
	WHERE id_main_branch =:ls_payer
	ORDER BY 1;
	
	IF ISNULL(ld_exchange_rate) THEN 	ld_exchange_rate = 1
			
			
ld_balance = fn_balance_escalable(ls_payer,String(Today(),'mm-dd-yyyy'))
ld_balance = round(ld_balance,2) + round(ld_amount,2)

//If Messagebox("Confirmation","Are you sure that you want to save a Wire for $"+string(ld_amount,"######,##0.00")+" for "+s_payer_name+"?",Question!,YesNo!) = 1 Then
//
	SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
	  INTO :ld_cons  
	  FROM dba.transaccion_diaria_payee;
//	
	INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
	VALUES(:ld_cons, :ls_payer, getdate(), getdate(), 'DP', :ls_notes, :ld_amount, 0, :ld_balance, null, null, null, getdate(), :gs_cashier, null, :ls_dest_bank, null);
	
	If SQLCA.SQLCode <> 0 then
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
		Return	
	End if
	
	INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE, ID_CURRENCY)
	VALUES(:ld_cons, :ls_bank, :ls_account, null, :ld_date, getdate(),:ld_exchange_rate,:ls_currency);
	
	If SQLCA.SQLCode <> 0 then
		DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons;
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
		Return	
	End if

//END IF
end if
next
end if

delete 
from dba.tmp_import_wire
where dba_user = :gs_iduser;
end event

type dw_1 from datawindow within w_csvwiresimport
integer x = 41
integer y = 276
integer width = 5655
integer height = 1344
integer taborder = 30
string title = "none"
string dataobject = "dw_wire_import"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_csvwiresimport
integer x = 471
integer y = 92
integer width = 1778
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_csvwiresimport
integer x = 105
integer y = 100
integer width = 361
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "File to Import:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_csvwiresimport
integer x = 2263
integer y = 84
integer width = 105
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;string docpath, docname[], s, ls_payer, ls_account, s_name_cuenta_banco, ls_control,ls_notes_original, ls_notes, ls_currency

integer i, li_cnt, li_rtn, li_filenum, li_total_rows

double ld_rate_allowance, ld_exchange_rate, ld_amount, ld_cons_trans_diaria
datetime ld_date_inicio, ld_date_final
date ld_date
 

li_rtn = GetFileOpenName("Select File", &
docpath, docname[], "DOC", &
   + "Text Files (*.CSV),*.CSV," &
   + "Doc Files (*.DOC),*.DOC," &
   + "All Files (*.*), *.*")
	
dw_1.settransobject(sqlca)
if li_rtn  <> 0  then
	
dw_1.importfile(docpath,2)
sle_1.text = docname[1]

for i = 1 to dw_1.rowcount()

dw_1.setitem(i,'dba_user',gs_iduser)
	
next

dw_1.update()

dw_1.retrieve()

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


if dw_1.rowcount() > 0 then 
	
	
	
	
//	DataWindowChild dwc
//
//dwc.SetTransObject( SQLCA )
//dwc.Retrieve()
	
	li_total_rows = dw_1.rowcount()
		for i  = 1 to li_total_rows
			
			ld_date = date(dw_1.getitemstring(i,"bank_date"))
			ls_payer = dw_1.getitemstring(i,'ref_payer')
			ld_exchange_rate = double(dw_1.getitemstring(i,'exchange_rate'))
			ls_account = dw_1.getitemstring(i,'account')
			ld_amount = double(dw_1.getitemstring(i,'amount'))
			ls_notes_original = dw_1.getitemstring(i,'notes')
			ls_currency = dw_1.getitemstring(i,'id_currency')
			ls_control = ''
			if isnull(ls_notes_original) then ls_notes_original =  ' '
			
			if isnull(ld_exchange_rate)  then ld_exchange_rate = 0
				
			
			
			
			ls_notes = 'TRANS: '  + string(ld_date) + ' @ ' + string(ld_exchange_rate)  +' ' + ls_notes_original
			
			ls_notes = left(ls_notes,50)
			
			dw_1.setitem(i,'notes',ls_notes)
			
			ls_currency = ''
			
			select distinct top(1) id_currency
			into :ls_currency
			from dba.transaccion_diaria_banco_payee , dba.transaccion_diaria_payee
			where dba.transaccion_diaria_banco_payee.cons_trans_diaria = dba.transaccion_diaria_payee.cons_trans_diaria and
			id_group_trans_diaria = :ls_payer and
			isnull(id_currency, '') <> '';
			
			if ld_exchange_rate = 0 and (isnull(ls_currency) or ls_currency = '') then ls_currency = 'D'
			
			dw_1.setitem(i,'id_currency',ls_currency)
			
			
Select A.cons_trans_diaria
into :ld_cons_trans_diaria
from dba.TRANSACCION_DIARIA_BANCO_PAYEE A, dba.TRANSACCION_DIARIA_PAYEE B
where A.CONS_TRANS_DIARIA = B.CONS_TRANS_DIARIA
and id_cuenta_banco = :ls_account
and debit_trans_diaria = :ld_amount
and reconciliationdate= :ld_date;

IF SQLCA.SQLCODE <> 100 THEN
	ls_control = 'D'
	
ELSE			
			
			
SELECT NAME_CUENTA_BANCO
INTO :s_name_cuenta_banco
FROM DBA.CUENTA_BANCO
WHERE ID_CUENTA_BANCO = :ls_account;

IF SQLCA.SQLCODE = 100 THEN
	dw_1.setitem(i,'control_acc','A')
	ls_control = 'E'
	
END IF
END IF	

if not isnull(ld_date_inicio) and not isnull(ld_date_final) then

	if (ld_date < date(ld_date_inicio)) or (ld_date > date(ld_date_final)) then	
		
		//messagebox("Error","The date you are using ("+string(ld_date,"mm/dd/yyyy")+") was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
		dw_1.setitem(i,'control_date','A')
		
		IF ls_control <> 'D' THEN
			ls_control = 'E'
		END IF
		
	ELSE
		
		dw_1.setitem(i,'control_date','')
		
	end if
	
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
	
	if ld_ave_rate <> 0  and ld_exchange_rate <> 0 then
	
		// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
		if abs(((ld_exchange_rate - ld_ave_rate) / ld_exchange_rate)) > ld_rate_allowance then
			Messagebox("Invalid Amount","Please enter a valid exchange rate, "+String(ld_exchange_rate)+" is out of the range (±"+String(ld_rate_allowance * 100)+"%)",StopSign!)
			dw_1.setitem(i,'control_rate','A')
			
			IF ls_control <> 'D' THEN
			ls_control = 'E'
			END IF
			
			if (ls_payer = '' or isnull(ls_payer) ) and ls_control <> 'D' then ls_control = 'E'
			
		end if
	
	end if

end if

end if
if ls_control = 'D' then
	dw_1.setitem(i,'message','DUPLICATE')
	dw_1.setitem(i,'selection','N')
ELSE
	IF ls_control = 'E' then
		dw_1.setitem(i,'message','ERROR')
		dw_1.setitem(i,'selection','N')
	else
		dw_1.setitem(i,'message','GOOD')
		dw_1.setitem(i,'selection','Y')
	end if
	end if
	


next
end if
end if

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



end event

type gb_1 from groupbox within w_csvwiresimport
integer x = 41
integer y = 8
integer width = 3643
integer height = 232
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "File"
end type

