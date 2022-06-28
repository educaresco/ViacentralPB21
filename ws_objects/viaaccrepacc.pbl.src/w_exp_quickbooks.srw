$PBExportHeader$w_exp_quickbooks.srw
forward
global type w_exp_quickbooks from w_master
end type
type cb_generate_new from commandbutton within w_exp_quickbooks
end type
type cb_1 from commandbutton within w_exp_quickbooks
end type
type st_3 from statictext within w_exp_quickbooks
end type
type em_date2 from editmask within w_exp_quickbooks
end type
type em_date1 from editmask within w_exp_quickbooks
end type
type sle_1 from singlelineedit within w_exp_quickbooks
end type
type st_2 from statictext within w_exp_quickbooks
end type
type st_1 from statictext within w_exp_quickbooks
end type
type gb_1 from groupbox within w_exp_quickbooks
end type
end forward

global type w_exp_quickbooks from w_master
integer width = 1125
integer height = 980
cb_generate_new cb_generate_new
cb_1 cb_1
st_3 st_3
em_date2 em_date2
em_date1 em_date1
sle_1 sle_1
st_2 st_2
st_1 st_1
gb_1 gb_1
end type
global w_exp_quickbooks w_exp_quickbooks

on w_exp_quickbooks.create
int iCurrent
call super::create
this.cb_generate_new=create cb_generate_new
this.cb_1=create cb_1
this.st_3=create st_3
this.em_date2=create em_date2
this.em_date1=create em_date1
this.sle_1=create sle_1
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_generate_new
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date2
this.Control[iCurrent+5]=this.em_date1
this.Control[iCurrent+6]=this.sle_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.gb_1
end on

on w_exp_quickbooks.destroy
call super::destroy
destroy(this.cb_generate_new)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.em_date2)
destroy(this.em_date1)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;call super::open;
Integer li_Month, li_Year

li_Month = Month(today())
li_Year = Year(today())

li_Month = li_Month -1

if li_Month = 0 then 
	li_Month = 12
	li_Year = li_Year - 1
end if

em_date1.text = +string(li_Month) + '/01/' + String(li_Year)

em_date2.text = string(RelativeDate(date(string(month(today()))+'/01/'+string(year(today()))),-1))



end event

type cb_generate_new from commandbutton within w_exp_quickbooks
integer x = 247
integer y = 612
integer width = 608
integer height = 100
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Generate (New)"
end type

event clicked;

// ******************************************************************************************************************
// ******************************************************************************************************************
// ******************************************************************************************************************

//////////  La version original que tiene el detalle por agencia / Antes de hacer el consolidado (09/11/2008)


SetPointer(HourGlass!)

String 	ls_line, ls_type_group, ls_conflicts
String 	ls_id_branch, ls_payer, ls_bank
Double 	ld_total, ld_viafees, ld_customerfees, ld_payerfees, ld_total_and_fees, ld_agency_fees, ld_tax_amount
DateTime	ld_date1, ld_date2, ld_date_from,  ld_date_to
Date		ld_date, ld_dateto
String 	ls_FileName, ls_FileName_VFS, ls_label, ls_cia
Long		ll_FileNum, ll_FileNum_VFS, ll_FileNum_VIA, ld_conflicts



SetNull(ls_conflicts)

// EBERNAL: 12/10/2013
// INEFICIENTE
//SELECT TOP 1 rtrim(B1.ID_BRANCH) + ' y ' + rtrim(B2.ID_BRANCH) 
//INTO :ls_conflicts
//FROM DBA.BRANCH B1, DBA.BRANCH B2  
//WHERE B1.ID_MAIN_BRANCH = B2.ID_MAIN_BRANCH
//AND B1.ID_COMPANY <> B2.ID_COMPANY;


// EBERNAL 12/10/2013 
// Obtains the GROUP_BRANCHs that have agencies in more than one company.
SELECT TOP 1 ID_MAIN_BRANCH, 
COUNT(DISTINCT ID_COMPANY)
into :ls_conflicts,
:ld_conflicts
FROM DBA.BRANCH B1 WITH (NOLOCK)
GROUP BY ID_MAIN_BRANCH
HAVING COUNT(DISTINCT ID_COMPANY) > 1;

if not isnull(ls_conflicts) then	
	Messagebox("Error","El grupo "+ls_conflicts+" tienen agencias de companias diferentes; debe corregirlo antes de exportar la integracion.",StopSign!)
	return	
end if


ld_date = date(em_date1.text)
ld_dateto = date(em_date2.text)
// Se cambio la hora por 23:59:59
//ld_dateto = date(relativedate(date(em_date2.text),1))

ld_date_from = DateTime(ld_date,time('00:00:00'))
ld_date_to = DateTime(ld_dateto,time('23:59:59'))

ls_FileName = "C:\Temp\VIACENTRAL_VIAExport_Summary_"+String(ld_date,"mmddyyyy")+"_TO_"+String(date(em_date2.text),"mmddyyyy")+".iif"
ll_FileNum_VIA = FileOpen(ls_FileName,LineMode!,Write!,LockReadWrite!,Replace!)

ls_FileName_VFS = "C:\Temp\VIACENTRAL_VFS_Export_Summary_"+String(ld_date,"mmddyyyy")+"_TO_"+String(date(em_date2.text),"mmddyyyy")+".iif"
ll_FileNum_VFS = FileOpen(ls_FileName_VFS,LineMode!,Write!,LockReadWrite!,Replace!)


//	DO WHILE ld_date < ld_dateto
//	
//		ld_date1 = DateTime(ld_date,time('00:00:00'))
//		ld_date2 = DateTime(ld_date,time('23:59:59'))
	
	ld_date1 = ld_date_from
	ld_date2 = ld_date_to
	
	ls_label = string(ld_date1,"YYYY-MM")
	ls_id_branch = 'AGENTS-'+ls_label
		
	DECLARE cur_data CURSOR FOR
	SELECT id_company,
	dba.sfGetMainBranchNameWithCode(id_main_branch_sent),
	SUM(dba.RECEIVER.NET_AMOUNT_RECEIVER) TOTAL,
	SUM(dba.receiver.exchange_company + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.handling_receiver + dba.receiver.fee_rate ) AS VIAFEES,
	SUM(dba.RECEIVER.TELEX_RECEIVER + dba.RECEIVER.EXCHANGE_RECEIVER + TOTAL_MODO_PAGO + dba.receiver.handling_receiver ) AS CUSTOMERFEES,
	SUM(dba.RECEIVER.COMMISSION_PAYEE) PAYERFEES
	FROM dba.BRANCH WITH (NOLOCK),   
	dba.RECEIVER WITH (NOLOCK)
	WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.ID_BRANCH )
	AND ( dba.RECEIVER.date_receiver >= :ld_date1 )
	AND ( dba.RECEIVER.date_receiver <= :ld_date2 )
	group by id_company, dba.sfGetMainBranchNameWithCode(id_main_branch_sent);
	
	FileWrite(ll_FileNum,"!TRNS	TRNSID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	TOPRINT	NAMEISTAXABLE	ADDR1	ADDR3	TERMS	SHIPVIA	SHIPDATE")
	FileWrite(ll_FileNum,"!SPL	SPLID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	QNTY	PRICE	INVITEM	TAXABLE	OTHER2	YEARTODATE	WAGEBASE")

	FileWrite(ll_FileNum_VFS,"!TRNS	TRNSID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	TOPRINT	NAMEISTAXABLE	ADDR1	ADDR3	TERMS	SHIPVIA	SHIPDATE")
	FileWrite(ll_FileNum_VFS,"!SPL	SPLID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	QNTY	PRICE	INVITEM	TAXABLE	OTHER2	YEARTODATE	WAGEBASE")
		
	OPEN cur_data;
	FETCH cur_data INTO :ls_cia, :ls_payer, :ld_total, :ld_viafees, :ld_customerfees, :ld_payerfees;
	DO WHILE SQLCA.SQLCODE = 0
	
		ls_line = ''
		
		ld_total = round(ld_total,2)
		ld_customerfees = round(ld_customerfees,2)
		
		ld_total_and_fees = ld_total + ld_customerfees
		ld_agency_fees = ld_customerfees - ld_viafees
	
		if ls_cia = 'VFSC' then
			ll_FileNum = ll_FileNum_VFS
		else
			ll_FileNum = ll_FileNum_VIA
		end if
	
		FileWrite(ll_FileNum,"!ENDTRNS																	")	
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_total_and_fees,"#####0.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Transfer Fees	"+trim(ls_id_branch)+"		"+string(ld_customerfees * -1,"#####0.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_payer)+"	"+trim(ls_label)+"		"+string(ld_total * -1,"#####0.00")+"										")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_agency_fees * -1,"#####0.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - US Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_agency_fees,"#####0.00")+"										")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_payer)+"	"+trim(ls_label)+"		"+string(ld_payerfees * -1,"#####0.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - Payout Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_payerfees,"#####0.00")+"		"+ls_payer+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")

	
		FETCH cur_data INTO :ls_cia, :ls_payer, :ld_total, :ld_viafees, :ld_customerfees, :ld_payerfees;
	LOOP
	CLOSE cur_data;
	
	
	
	// Las transacciones generales
		
	
	String	ls_group, ls_concepto, LS_ACCNT, ls_name, LS_MEMO, ls_dummy
	Double	ld_debit, ld_credit, ld_amount
	
	ls_name = string(ld_date1,"YYYY-MM")
	
	DECLARE cur_data2 CURSOR FOR
	SELECT 
	dba.sfGetGroupCompany(id_group_trans_diaria),
	CASE group_type WHEN 'P' THEN dba.sfGetMainBranchNameWithCode(id_group_trans_diaria)	ELSE 'AR-Customers ViaReps' END ,
	ltrim(dba.BANCO.NAME_BANCO),   
	dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
	isnull(QB_ACCOUNT,'UNKNOWN TN TYPE'),
	sum(dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA),   
	sum(dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA)
	FROM dba.TRANSACCION_DIARIA_BANCO_PAYEE WITH (NOLOCK),   
	dba.TRANSACCION_DIARIA_PAYEE WITH (NOLOCK),   
	dba.BANCO WITH (NOLOCK), 
	dba.concepto_contable WITH (NOLOCK), 
	dba.group_branch WITH (NOLOCK)
	WHERE dba.TRANSACCION_DIARIA_BANCO_PAYEE.CONS_TRANS_DIARIA = dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA
	AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.ID_BANCO = dba.BANCO.ID_BANCO
	AND dba.concepto_contable.id_concepto_contable = dba.TRANSACCION_DIARIA_PAYEE.id_concepto_contable
	AND dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA
	AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE >= :ld_date1 
	AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE <= :ld_date2 
	group by dba.sfGetGroupCompany(id_group_trans_diaria), CASE group_type WHEN 'P' THEN dba.sfGetMainBranchNameWithCode(id_group_trans_diaria)	ELSE 'AR-Customers ViaReps' END,
	ltrim(dba.BANCO.NAME_BANCO),   
	dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
	isnull(QB_ACCOUNT,'UNKNOWN TN TYPE');
		  
	OPEN cur_data2;
	FETCH cur_data2 INTO :ls_cia, :ls_payer, :ls_bank, :ls_concepto, :LS_MEMO, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ld_amount = ld_debit - ld_credit
		
		LS_ACCNT = ls_payer
			
		if ls_bank = 'VIAMERICAS WRITE OFF AMOUNTS' or ls_bank = 'MTSA CLEARING' then
			ls_dummy = LS_MEMO
			LS_MEMO = ls_bank
			ls_bank = ls_dummy
		end if
		
		
		if ls_cia = 'VFSC' then
			ll_FileNum = ll_FileNum_VFS
		else
			ll_FileNum = ll_FileNum_VIA
		end if				
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_id_branch)+"		"+string(ld_amount,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		
		FETCH cur_data2 INTO :ls_cia, :ls_payer, :ls_bank, :ls_concepto, :LS_MEMO, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data2;


	ld_debit = 0 
	ld_credit = 0 	

	// Las comisiones que cobramos por los cheques

	DECLARE cur_data3 CURSOR FOR
	SELECT 'CHK PROCES. COMMISION',
	dba.sfGetGroupCompany(id_group_trans_diaria),
	dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
	sum(dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA),   
	sum(dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA)  
	FROM dba.TRANSACCION_DIARIA_PAYEE WITH (NOLOCK) 
	WHERE ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= :ld_date1 )
	AND ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= :ld_date2 )
	AND ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE = 'CCC' )
	GROUP BY dba.sfGetGroupCompany(id_group_trans_diaria), dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE;

	OPEN cur_data3;
	FETCH cur_data3 INTO :ls_bank, :ls_cia, :ls_concepto, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ls_name = string(ld_date1,"YYYY-MM")
		
		ld_amount = ld_debit - ld_credit
		
		LS_ACCNT = 'AR-Customers ViaReps'
			
		if ls_concepto = 'CCC' then
			LS_MEMO = "CHK PROCES. COMMISION"
		else
			LS_MEMO = "UNKNOWN TN TYPE (#1)"
		end if
		
		if ls_cia = 'VFSC' then
			ll_FileNum = ll_FileNum_VFS
		else
			ll_FileNum = ll_FileNum_VIA
		end if
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_id_branch)+"		"+string(ld_amount,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Check Processing:"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		
		FETCH cur_data3 INTO :ls_bank, :ls_cia,  :ls_concepto, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data3;


	ld_debit = 0 
	ld_credit = 0 	


	// Los cheques que enviamos de comisiones

	DECLARE cur_data4 CURSOR FOR
	SELECT	'CASH - SETTLEMENT ASSETS:US Bank Commissions',
	dba.sfGetGroupCompany(id_group_trans_diaria),
	ID_CONCEPTO_CONTABLE,   
	sum(DEBIT_TRANS_DIARIA),   
	sum(CREDIT_TRANS_DIARIA)  
	FROM dba.TRANSACCION_DIARIA_PAYEE_COMM WITH (NOLOCK)
	WHERE ( DATE_CHK_PRINTED >= :ld_date1 )
	AND ( DATE_CHK_PRINTED <= :ld_date2 )
	AND ( ID_CONCEPTO_CONTABLE = 'DAC' )
	GROUP BY dba.sfGetGroupCompany(id_group_trans_diaria), ID_CONCEPTO_CONTABLE;
		  
	OPEN cur_data4;
	FETCH cur_data4 INTO :ls_bank, :ls_cia, :ls_concepto, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ls_name = string(ld_date1,"YYYY-MM")
		
		ld_amount = ld_debit - ld_credit
		
		LS_ACCNT = 'AR-Customers ViaReps'
		
		if ls_concepto = 'DAC' then
			LS_MEMO = "AGENCY COMMISSIONS PAID BY CHECK"
		else
			LS_MEMO = "UNKNOWN TN TYPE (#2)"
		end if
		
		
		if ls_cia = 'VFSC' then
			ll_FileNum = ll_FileNum_VFS
		else
			ll_FileNum = ll_FileNum_VIA
		end if
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_id_branch)+"		"+string(ld_amount,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")

		
		FETCH cur_data4 INTO :ls_bank, :ls_cia, :ls_concepto, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data4;

//	ld_date = RELATIVEDATE(ld_date,1)
//LOOP


// State Tax OKLAHOMA!

SELECT isnull(cast(sum(STATE_TAX)as numeric(7,2)),0)
INTO :ld_tax_amount
FROM DBA.RECEIVER WITH (NOLOCK), 
DBA.BRANCH WITH (NOLOCK)
WHERE DBA.RECEIVER.ID_BRANCH = DBA.BRANCH.ID_BRANCH 
AND DATE_RECEIVER BETWEEN :ld_date_from AND :ld_date_to
AND ID_STATE = 'OK'
AND ID_FLAG_RECEIVER IN ('P','T');

LS_ACCNT = 'OK TAX PAYABLE'
LS_BANK = 'ACCOUNT RECEIVABLE'
LS_MEMO = 'STATE TAX'


ll_FileNum = ll_FileNum_VFS

FileWrite(ll_FileNum,"!ENDTRNS																	")
FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_id_branch)+"		"+string(ld_tax_amount * -1,"#####0.00")+"		"+LS_MEMO+"								")
FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_tax_amount,"#####0.00")+"		"+LS_MEMO+"								")
FileWrite(ll_FileNum,"ENDTRNS																	")
	

FileClose(ll_FileNum_VIA)
FileClose(ll_FileNum_VFS)



Messagebox("Proceso Completo","Exportacion terminada con exito, el archivo se encuentra en el disco C:\Temp\")


SetPointer(Arrow!)



end event

type cb_1 from commandbutton within w_exp_quickbooks
integer x = 247
integer y = 496
integer width = 608
integer height = 100
integer taborder = 11
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Generate"
end type

event clicked;

// ******************************************************************************************************************
// ******************************************************************************************************************
// ******************************************************************************************************************

//////////  La version original que tiene el detalle por agencia / Antes de hacer el consolidado (09/11/2008)


SetPointer(HourGlass!)

String 	ls_line, ls_type_group, ls_conflicts
String 	ls_id_branch, ls_payer, ls_bank
Double 	ld_total, ld_viafees, ld_customerfees, ld_payerfees, ld_total_and_fees, ld_agency_fees, ld_tax_amount
DateTime	ld_date1, ld_date2, ld_date_from,  ld_date_to
Date		ld_date, ld_dateto
String 	ls_FileName, ls_FileName_VFS, ls_label, ls_cia
Long		ll_FileNum, ll_FileNum_VFS, ll_FileNum_VIA, ld_conflicts



SetNull(ls_conflicts)

// EBERNAL: 12/10/2013 --> csarmiento copied from the otehr button
// INEFICIENTE
//SELECT TOP 1 rtrim(B1.ID_BRANCH) + ' y ' + rtrim(B2.ID_BRANCH) 
//INTO :ls_conflicts
//FROM DBA.BRANCH B1, DBA.BRANCH B2  
//WHERE B1.ID_MAIN_BRANCH = B2.ID_MAIN_BRANCH
//AND B1.ID_COMPANY <> B2.ID_COMPANY;
//

// EBERNAL 12/10/2013 
// Obtains the GROUP_BRANCHs that have agencies in more than one company.
SELECT TOP 1 ID_MAIN_BRANCH, 
COUNT(DISTINCT ID_COMPANY)
into :ls_conflicts,
:ld_conflicts
FROM DBA.BRANCH B1 WITH (NOLOCK)
GROUP BY ID_MAIN_BRANCH
HAVING COUNT(DISTINCT ID_COMPANY) > 1;


//
//if not isnull(ls_conflicts) then	
//	Messagebox("Error","Las Agencias "+ls_conflicts+" tienen balance unificado y se encuentran catalogadas en compañias diferentes, es necesario ponerlas en la misma compañia antes de realizar la integración",StopSign!)
//	return	
//end if
//
//

if not isnull(ls_conflicts) then	
	Messagebox("Error","El grupo "+ls_conflicts+" tienen agencias de companias diferentes; debe corregirlo antes de exportar la integracion.",StopSign!)
	return	
end if


ld_date = date(em_date1.text)
ld_dateto = date(em_date2.text)
// Se cambio la hora por 23:59:59
//ld_dateto = date(relativedate(date(em_date2.text),1))

ld_date_from = DateTime(ld_date,time('00:00:00'))
ld_date_to = DateTime(ld_dateto,time('23:59:59'))

ls_FileName = "C:\Temp\VIACENTRAL_VIAExport_Summary_"+String(ld_date,"mmddyyyy")+"_TO_"+String(date(em_date2.text),"mmddyyyy")+".iif"
ll_FileNum_VIA = FileOpen(ls_FileName,LineMode!,Write!,LockReadWrite!,Replace!)

ls_FileName_VFS = "C:\Temp\VIACENTRAL_VFS_Export_Summary_"+String(ld_date,"mmddyyyy")+"_TO_"+String(date(em_date2.text),"mmddyyyy")+".iif"
ll_FileNum_VFS = FileOpen(ls_FileName_VFS,LineMode!,Write!,LockReadWrite!,Replace!)


//	DO WHILE ld_date < ld_dateto
//	
//		ld_date1 = DateTime(ld_date,time('00:00:00'))
//		ld_date2 = DateTime(ld_date,time('23:59:59'))
	
	ld_date1 = ld_date_from
	ld_date2 = ld_date_to
	
	ls_label = string(ld_date1,"YYYY-MM")
	ls_id_branch = 'AGENTS-'+ls_label
		
	DECLARE cur_data CURSOR FOR
	SELECT id_company,
	dba.sfGetMainBranchNameWithCode(id_main_branch_sent),
	SUM(dba.RECEIVER.NET_AMOUNT_RECEIVER) TOTAL,
	SUM(dba.receiver.exchange_company + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.handling_receiver + dba.receiver.fee_rate ) AS VIAFEES,
	SUM(dba.RECEIVER.TELEX_RECEIVER + dba.RECEIVER.EXCHANGE_RECEIVER + TOTAL_MODO_PAGO + dba.receiver.handling_receiver ) AS CUSTOMERFEES,
	SUM(dba.RECEIVER.COMMISSION_PAYEE) PAYERFEES
	FROM dba.BRANCH  WITH (NOLOCK),   
	dba.RECEIVER    WITH (NOLOCK)
	WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.ID_BRANCH )
	AND ( dba.RECEIVER.date_receiver >= :ld_date1 )
	AND ( dba.RECEIVER.date_receiver <= :ld_date2 )
	group by id_company, dba.sfGetMainBranchNameWithCode(id_main_branch_sent);
	
	FileWrite(ll_FileNum,"!TRNS	TRNSID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	TOPRINT	NAMEISTAXABLE	ADDR1	ADDR3	TERMS	SHIPVIA	SHIPDATE")
	FileWrite(ll_FileNum,"!SPL	SPLID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	QNTY	PRICE	INVITEM	TAXABLE	OTHER2	YEARTODATE	WAGEBASE")

	FileWrite(ll_FileNum_VFS,"!TRNS	TRNSID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	TOPRINT	NAMEISTAXABLE	ADDR1	ADDR3	TERMS	SHIPVIA	SHIPDATE")
	FileWrite(ll_FileNum_VFS,"!SPL	SPLID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	QNTY	PRICE	INVITEM	TAXABLE	OTHER2	YEARTODATE	WAGEBASE")
		
	OPEN cur_data;
	FETCH cur_data INTO :ls_cia, :ls_payer, :ld_total, :ld_viafees, :ld_customerfees, :ld_payerfees;
	DO WHILE SQLCA.SQLCODE = 0
	
		ls_line = ''
		
		ld_total = round(ld_total,2)
		ld_customerfees = round(ld_customerfees,2)
		
		ld_total_and_fees = ld_total + ld_customerfees
		ld_agency_fees = ld_customerfees - ld_viafees
	
		if ls_cia = 'VFSC' then
			ll_FileNum = ll_FileNum_VFS
		else
			ll_FileNum = ll_FileNum_VIA
		end if
	
		FileWrite(ll_FileNum,"!ENDTRNS																	")	
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_total_and_fees,"#####0.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Transfer Fees	"+trim(ls_id_branch)+"		"+string(ld_customerfees * -1,"#####0.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_payer)+"	"+trim(ls_label)+"		"+string(ld_total * -1,"#####0.00")+"										")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_agency_fees * -1,"#####0.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - US Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_agency_fees,"#####0.00")+"										")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_payer)+"	"+trim(ls_label)+"		"+string(ld_payerfees * -1,"#####0.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - Payout Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_payerfees,"#####0.00")+"		"+ls_payer+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")

	
		FETCH cur_data INTO :ls_cia, :ls_payer, :ld_total, :ld_viafees, :ld_customerfees, :ld_payerfees;
	LOOP
	CLOSE cur_data;
	
	
	
	// Las transacciones generales
		
	
	String	ls_group, ls_concepto, LS_ACCNT, ls_name, LS_MEMO, ls_dummy
	Double	ld_debit, ld_credit, ld_amount
	
	ls_name = string(ld_date1,"YYYY-MM")
	
	DECLARE cur_data2 CURSOR FOR
	SELECT 
	dba.sfGetGroupCompany(id_group_trans_diaria),
	CASE group_type WHEN 'P' THEN dba.sfGetMainBranchNameWithCode(id_group_trans_diaria)	ELSE 'AR-Customers ViaReps' END ,
	ltrim(dba.BANCO.NAME_BANCO),   
	dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
	isnull(QB_ACCOUNT,'UNKNOWN TN TYPE'),
	sum(dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA),   
	sum(dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA)
	FROM dba.TRANSACCION_DIARIA_BANCO_PAYEE  WITH (NOLOCK),   
	dba.TRANSACCION_DIARIA_PAYEE  WITH (NOLOCK),   
	dba.BANCO  WITH (NOLOCK), 
	dba.concepto_contable  WITH (NOLOCK), 
	dba.group_branch  WITH (NOLOCK)
	WHERE dba.TRANSACCION_DIARIA_BANCO_PAYEE.CONS_TRANS_DIARIA = dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA
	AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.ID_BANCO = dba.BANCO.ID_BANCO
	AND dba.concepto_contable.id_concepto_contable = dba.TRANSACCION_DIARIA_PAYEE.id_concepto_contable
	AND dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA
	AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE >= :ld_date1 
	AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE <= :ld_date2 
	group by dba.sfGetGroupCompany(id_group_trans_diaria), CASE group_type WHEN 'P' THEN dba.sfGetMainBranchNameWithCode(id_group_trans_diaria)	ELSE 'AR-Customers ViaReps' END,
	ltrim(dba.BANCO.NAME_BANCO),   
	dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
	isnull(QB_ACCOUNT,'UNKNOWN TN TYPE');
		  
	OPEN cur_data2;
	FETCH cur_data2 INTO :ls_cia, :ls_payer, :ls_bank, :ls_concepto, :LS_MEMO, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ld_amount = ld_debit - ld_credit
		
		LS_ACCNT = ls_payer
			
		if ls_bank = 'VIAMERICAS WRITE OFF AMOUNTS' or ls_bank = 'MTSA CLEARING' then
			ls_dummy = LS_MEMO
			LS_MEMO = ls_bank
			ls_bank = ls_dummy
		end if
		
		
		if ls_cia = 'VFSC' then
			ll_FileNum = ll_FileNum_VFS
		else
			ll_FileNum = ll_FileNum_VIA
		end if				
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_id_branch)+"		"+string(ld_amount,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		
		FETCH cur_data2 INTO :ls_cia, :ls_payer, :ls_bank, :ls_concepto, :LS_MEMO, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data2;


	ld_debit = 0 
	ld_credit = 0 	

	// Las comisiones que cobramos por los cheques

	DECLARE cur_data3 CURSOR FOR
	SELECT 'CHK PROCES. COMMISION',
	dba.sfGetGroupCompany(id_group_trans_diaria),
	dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
	sum(dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA),   
	sum(dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA)  
	FROM dba.TRANSACCION_DIARIA_PAYEE   WITH (NOLOCK)
	WHERE ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= :ld_date1 )
	AND ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= :ld_date2 )
	AND ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE = 'CCC' )
	GROUP BY dba.sfGetGroupCompany(id_group_trans_diaria), dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE;

	OPEN cur_data3;
	FETCH cur_data3 INTO :ls_bank, :ls_cia, :ls_concepto, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ls_name = string(ld_date1,"YYYY-MM")
		
		ld_amount = ld_debit - ld_credit
		
		LS_ACCNT = 'AR-Customers ViaReps'
			
		if ls_concepto = 'CCC' then
			LS_MEMO = "CHK PROCES. COMMISION"
		else
			LS_MEMO = "UNKNOWN TN TYPE (#1)"
		end if
		
		if ls_cia = 'VFSC' then
			ll_FileNum = ll_FileNum_VFS
		else
			ll_FileNum = ll_FileNum_VIA
		end if
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_id_branch)+"		"+string(ld_amount,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Check Processing:"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		
		FETCH cur_data3 INTO :ls_bank, :ls_cia,  :ls_concepto, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data3;


	ld_debit = 0 
	ld_credit = 0 	


	// Los cheques que enviamos de comisiones

	DECLARE cur_data4 CURSOR FOR
	SELECT	'CASH - SETTLEMENT ASSETS:US Bank Commissions',
	dba.sfGetGroupCompany(id_group_trans_diaria),
	ID_CONCEPTO_CONTABLE,   
	sum(DEBIT_TRANS_DIARIA),   
	sum(CREDIT_TRANS_DIARIA)  
	FROM dba.TRANSACCION_DIARIA_PAYEE_COMM  WITH (NOLOCK)
	WHERE ( DATE_CHK_PRINTED >= :ld_date1 )
	AND ( DATE_CHK_PRINTED <= :ld_date2 )
	AND ( ID_CONCEPTO_CONTABLE = 'DAC' )
	GROUP BY dba.sfGetGroupCompany(id_group_trans_diaria), ID_CONCEPTO_CONTABLE;
		  
	OPEN cur_data4;
	FETCH cur_data4 INTO :ls_bank, :ls_cia, :ls_concepto, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ls_name = string(ld_date1,"YYYY-MM")
		
		ld_amount = ld_debit - ld_credit
		
		LS_ACCNT = 'AR-Customers ViaReps'
		
		if ls_concepto = 'DAC' then
			LS_MEMO = "AGENCY COMMISSIONS PAID BY CHECK"
		else
			LS_MEMO = "UNKNOWN TN TYPE (#2)"
		end if
		
		
		if ls_cia = 'VFSC' then
			ll_FileNum = ll_FileNum_VFS
		else
			ll_FileNum = ll_FileNum_VIA
		end if
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_id_branch)+"		"+string(ld_amount,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"#####0.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")

		
		FETCH cur_data4 INTO :ls_bank, :ls_cia, :ls_concepto, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data4;

//	ld_date = RELATIVEDATE(ld_date,1)
//LOOP


// State Tax OKLAHOMA!

SELECT isnull(cast(sum(STATE_TAX)as numeric(7,2)),0)
INTO :ld_tax_amount
FROM DBA.RECEIVER  WITH (NOLOCK), DBA.BRANCH  WITH (NOLOCK)
WHERE DBA.RECEIVER.ID_BRANCH = DBA.BRANCH.ID_BRANCH 
AND DATE_RECEIVER BETWEEN :ld_date_from AND :ld_date_to
AND ID_STATE = 'OK'
AND ID_FLAG_RECEIVER IN ('P','T');

LS_ACCNT = 'OK TAX PAYABLE'
LS_BANK = 'ACCOUNT RECEIVABLE'
LS_MEMO = 'STATE TAX'


ll_FileNum = ll_FileNum_VFS

FileWrite(ll_FileNum,"!ENDTRNS																	")
FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_id_branch)+"		"+string(ld_tax_amount * -1,"#####0.00")+"		"+LS_MEMO+"								")
FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_tax_amount,"#####0.00")+"		"+LS_MEMO+"								")
FileWrite(ll_FileNum,"ENDTRNS																	")
	

FileClose(ll_FileNum_VIA)
FileClose(ll_FileNum_VFS)



Messagebox("Proceso Completo","Exportacion terminada con exito, el archivo se encuentra en el disco C:\Temp\")


SetPointer(Arrow!)



end event

type st_3 from statictext within w_exp_quickbooks
integer x = 261
integer y = 264
integer width = 242
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "To:"
boolean focusrectangle = false
end type

type em_date2 from editmask within w_exp_quickbooks
integer x = 512
integer y = 252
integer width = 343
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

type em_date1 from editmask within w_exp_quickbooks
integer x = 512
integer y = 152
integer width = 343
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

type sle_1 from singlelineedit within w_exp_quickbooks
integer x = 512
integer y = 352
integer width = 343
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "C:\TEMP\"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_exp_quickbooks
integer x = 261
integer y = 364
integer width = 229
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "File Path:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_exp_quickbooks
integer x = 261
integer y = 164
integer width = 242
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "From:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_exp_quickbooks
integer x = 46
integer y = 24
integer width = 978
integer height = 752
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

