$PBExportHeader$w_pago_agente_by_closing_ref.srw
forward
global type w_pago_agente_by_closing_ref from wb_response
end type
type dw_1 from datawindow within w_pago_agente_by_closing_ref
end type
type cb_1 from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_save from commandbutton within w_pago_agente_by_closing_ref
end type
type em_date from editmask within w_pago_agente_by_closing_ref
end type
type st_1 from statictext within w_pago_agente_by_closing_ref
end type
type cb_2 from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_3 from commandbutton within w_pago_agente_by_closing_ref
end type
type dw_3 from datawindow within w_pago_agente_by_closing_ref
end type
type st_2 from statictext within w_pago_agente_by_closing_ref
end type
type st_3 from statictext within w_pago_agente_by_closing_ref
end type
type cb_datos from commandbutton within w_pago_agente_by_closing_ref
end type
type em_group from editmask within w_pago_agente_by_closing_ref
end type
type st_4 from statictext within w_pago_agente_by_closing_ref
end type
type cb_procesar from commandbutton within w_pago_agente_by_closing_ref
end type
type em_ajuste_credit from editmask within w_pago_agente_by_closing_ref
end type
type st_5 from statictext within w_pago_agente_by_closing_ref
end type
type st_branch from statictext within w_pago_agente_by_closing_ref
end type
type em_agent from editmask within w_pago_agente_by_closing_ref
end type
type dw_cross_payee_final from datawindow within w_pago_agente_by_closing_ref
end type
type st_6 from statictext within w_pago_agente_by_closing_ref
end type
type em_wire from singlelineedit within w_pago_agente_by_closing_ref
end type
type cb_new from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_7 from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_8 from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_44 from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_84 from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_444 from commandbutton within w_pago_agente_by_closing_ref
end type
type em_ajuste_debit from editmask within w_pago_agente_by_closing_ref
end type
type sle_desc_ac from singlelineedit within w_pago_agente_by_closing_ref
end type
type st_44 from statictext within w_pago_agente_by_closing_ref
end type
type em_from from editmask within w_pago_agente_by_closing_ref
end type
type em_to from editmask within w_pago_agente_by_closing_ref
end type
type cb_datos1 from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_detectar from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_4 from commandbutton within w_pago_agente_by_closing_ref
end type
type st_4433 from statictext within w_pago_agente_by_closing_ref
end type
type dw_2 from datawindow within w_pago_agente_by_closing_ref
end type
type cb_5 from commandbutton within w_pago_agente_by_closing_ref
end type
type sle_selectedfax from singlelineedit within w_pago_agente_by_closing_ref
end type
type cb_faxviewer from commandbutton within w_pago_agente_by_closing_ref
end type
type sle_completefaxpath from singlelineedit within w_pago_agente_by_closing_ref
end type
type em_sd from editmask within w_pago_agente_by_closing_ref
end type
type st_7 from statictext within w_pago_agente_by_closing_ref
end type
type em_total from editmask within w_pago_agente_by_closing_ref
end type
type st_8 from statictext within w_pago_agente_by_closing_ref
end type
type em_balance_match from editmask within w_pago_agente_by_closing_ref
end type
type cb_deposits from commandbutton within w_pago_agente_by_closing_ref
end type
type cb_invoices from commandbutton within w_pago_agente_by_closing_ref
end type
type dw_choise from datawindow within w_pago_agente_by_closing_ref
end type
type dw_deposits from datawindow within w_pago_agente_by_closing_ref
end type
end forward

global type w_pago_agente_by_closing_ref from wb_response
boolean visible = false
integer x = 293
integer y = 212
integer width = 2907
integer height = 1972
string title = "Pay Payees"
boolean controlmenu = false
long backcolor = 80269524
dw_1 dw_1
cb_1 cb_1
cb_save cb_save
em_date em_date
st_1 st_1
cb_2 cb_2
cb_3 cb_3
dw_3 dw_3
st_2 st_2
st_3 st_3
cb_datos cb_datos
em_group em_group
st_4 st_4
cb_procesar cb_procesar
em_ajuste_credit em_ajuste_credit
st_5 st_5
st_branch st_branch
em_agent em_agent
dw_cross_payee_final dw_cross_payee_final
st_6 st_6
em_wire em_wire
cb_new cb_new
cb_7 cb_7
cb_8 cb_8
cb_44 cb_44
cb_84 cb_84
cb_444 cb_444
em_ajuste_debit em_ajuste_debit
sle_desc_ac sle_desc_ac
st_44 st_44
em_from em_from
em_to em_to
cb_datos1 cb_datos1
cb_detectar cb_detectar
cb_4 cb_4
st_4433 st_4433
dw_2 dw_2
cb_5 cb_5
sle_selectedfax sle_selectedfax
cb_faxviewer cb_faxviewer
sle_completefaxpath sle_completefaxpath
em_sd em_sd
st_7 st_7
em_total em_total
st_8 st_8
em_balance_match em_balance_match
cb_deposits cb_deposits
cb_invoices cb_invoices
dw_choise dw_choise
dw_deposits dw_deposits
end type
global w_pago_agente_by_closing_ref w_pago_agente_by_closing_ref

type variables
long	il_row = 0
String	is_group =""
Boolean   ib_actualizado = False
end variables

forward prototypes
public subroutine fn_get_fax_deposits (string as_return_fax_deposit)
public subroutine fn_save ()
end prototypes

public subroutine fn_get_fax_deposits (string as_return_fax_deposit);//+++++++++++++++++++++++++++++++++++++++++++
// Abre el Fax Viewer y trae los parametros

String ls_return

ls_return = as_return_fax_deposit

if ls_return = "-none-" then
	sle_selectedfax.text = "[No Fax Selected]"
	cb_faxviewer.enabled = false
else
	sle_selectedfax.text = fn_token(ls_return,"*",1)
	sle_completefaxpath.text = "u:\accounting\"+sle_selectedfax.text
	cb_faxviewer.enabled = true
end if

String ls_branch
Double ld_amount

ls_branch = trim(fn_token(ls_return,"*",2))
ld_amount = double(trim(fn_token(ls_return,"*",3)))

em_agent.text = ls_branch
em_agent.triggerevent(LoseFocus!)
	
dw_2.setitem(dw_2.getrow(),"credit",ld_amount)
//+++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++
string	ls_depositcode,	&
			ls_idbranch, 		&
			ls_idgroup, 		&
			ls_idbanco, 		&
			ls_idcuenta

  SELECT min(dba.DEPOSIT_CODES.DEPOSIT_CODE)  
    INTO :ls_depositcode
    FROM dba.DEPOSIT_CODES  
   WHERE dba.DEPOSIT_CODES.ID_BRANCH = :ls_branch   ;

if isnull(ls_depositcode) or len(trim(ls_depositcode)) < 1 then ls_depositcode = 'none'

if ls_depositcode <> 'none' then

	// --------------------------------------------
	// Remueve filtro Cuentas
	DataWindowChild	ldw_dw
	dw_1.GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("")
	ldw_dw.Filter()
	// --------------------------------------------	

	SELECT dba.BRANCH.ID_BRANCH,   
			dba.BRANCH.ID_MAIN_BRANCH,   
			dba.DEPOSIT_CODES.ID_BANCO,   
			dba.DEPOSIT_CODES.ID_CUENTA_BANCO  
	 INTO :ls_idbranch,   
			:ls_idgroup,   
			:ls_idbanco,   
			:ls_idcuenta  
	 FROM dba.BRANCH,   
			dba.DEPOSIT_CODES  
	WHERE ( dba.DEPOSIT_CODES.ID_BRANCH = dba.BRANCH.ID_BRANCH ) and  
			( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) )   ;
	
	dw_1.setitem(dw_1.getrow(),"id_banco",ls_idbanco)
	dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_idcuenta)
	dw_1.setitem(dw_1.getrow(),"deposit_code",ls_depositcode)
	em_agent.text = ls_idbranch
	em_group.text = ls_idgroup	
	
	dw_2.setitem(1,"id_group",ls_idgroup)
	dw_3.Retrieve(relativedate(today(),-30),ls_idgroup)
ELSEIF ls_depositcode = 'none' or ls_depositcode = '' or isnull(ls_depositcode) THEN
		
		select ID_MAIN_BRANCH
		into   :ls_idgroup
		from   dba.BRANCH
		where  id_branch = :ls_branch;
		
		dw_3.Retrieve(relativedate(today(),-30),ls_idgroup)
end if
end subroutine

public subroutine fn_save ();Double	ld_cons, ld_deposito, 	&
			ld_balance = 0, 			&
			ld_disponible = 0, 		&
			ld_deposito1, 				&
			ld_referencia = 0, 		&
			ld_delivery = 0, 			&
			ld_telex = 0, 				&
			ld_ajuste = 0 ,         &
			ld_link_reference = 0,	&
			ld_cons1 = 0,				&
			ld_comision_payee = 0,	&
			ld_gran_total = 0,		&
			ld_other = 0
	
date		ld_hoy,ld_date1
Datetime	ld_date
long		ll_dias

String	ls_desc_ac, ls_comment

ls_desc_ac = ''
ls_desc_ac = sle_desc_ac.text
dw_2.accepttext()
ld_hoy  = Today()
ld_date = dw_2.getitemdatetime(dw_2.getrow(),"date")

double	ld_wire, ld_depositado, ld_credito, ld_debito

dw_1.accepttext()
dw_2.accepttext()

ld_wire			= 0
ld_depositado	= 0
ld_credito		= 0
ld_debito		= 0

ld_wire        =  Double(em_wire.text) 
ld_depositado  =  dw_2.getitemnumber(dw_2.getrow(),"credit")
ld_debito      =  Double(em_ajuste_debit.text)
ld_credito     =  Double(em_ajuste_credit.text)

ld_wire        = Round(ld_wire,2)
ld_debito      = Round(ld_debito,2)
ld_credito     = Round(ld_credito,2)
ld_depositado  = Round(ld_depositado,2)

commit ;
		
if Double(em_ajuste_credit.text) <> 0 and  Double(em_ajuste_debit.text) <> 0 then
	messagebox('Error','Error, you cannot use credit and debit at the same time',StopSign!)
	return
end if		
		
if Double(em_ajuste_credit.text) < 0 or  Double(em_ajuste_debit.text) < 0 then
	messagebox('Error','Credit and Debit should be 0 or more',StopSign!)
	return
end if		
	
string	ls_account, ls_group, ls_banco,ls_status
Long		ll_i = 1, I = 0 , ll_cons = 0

cb_procesar.TriggerEvent(Clicked!)

ld_balance    = 0
ls_banco      = dw_1.getitemstring(dw_1.getrow(),"id_banco")
ls_account 	  = dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")
ls_group      = dw_2.getitemstring(dw_2.getrow(),"id_group")
ld_deposito   = dw_2.getitemnumber(dw_2.getrow(),"credit")
ld_deposito1  = dw_2.getitemnumber(dw_2.getrow(),"credit")
ld_date       = dw_2.getitemdatetime(dw_2.getrow(),"date")

if ld_deposito <= 0 then
	Messagebox("Error","Amount cannot be less than 0",StopSign!)
	return
end if


// --------------------------------------------
// Evita que graben transacciones sin banco.
long ll_cont1

SELECT count(*) 
  INTO :ll_cont1
  FROM dba.CUENTA_BANCO
 WHERE id_banco = :ls_banco
   AND id_cuenta_banco = :ls_account;
 
If ll_cont1 <> 1 then	
	Messagebox("Error","Favor Verifique la Cuenta. ["+trim(ls_banco)+"-"+trim(ls_account)+"]",StopSign!)
	return
end if
// --------------------------------------------


SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
INTO :ld_cons  
FROM dba.transaccion_diaria_payee  ;

if isnull(ld_cons) then ld_cons = 1			

SELECT dba.group_branch.credit_group  
INTO :ld_disponible  
FROM dba.group_branch  
WHERE dba.group_branch.id_main_branch = :ls_group ;

if ISNULL(ld_disponible) then ld_disponible = 0

ld_deposito = ld_deposito + ld_disponible

if isnull(ls_account) or ls_account = '' then
	Messagebox("Error","You have to select an account",StopSign!)
	return
end if

//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
// Verificar si la fecha no esta bloqueada
datetime		ld_date_inicio, ld_date_final			
				
  SELECT dba.ACC_PARAMETERS.DATE_BLOCKER,   
         dba.ACC_PARAMETERS.DATE_BLOCKER_POST  
    INTO :ld_date_inicio,   
         :ld_date_final  
    FROM dba.ACC_PARAMETERS  ;

if ( ld_date_inicio <= dw_1.getitemdatetime(dw_1.getrow(),"reconciliationdate") ) and ( ld_date_final >= dw_1.getitemdatetime(dw_1.getrow(),"reconciliationdate") ) then
	
else
	messagebox("Error","The date you are using was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
	Return
end if
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
		
string	ls_tipo_pago = "", ls_branch

Double	ld_vlr_total_pagar = 0,	&
			ld_receiver,		 		&
			ld_amount = 0, 			&
			ld_comision = 0, 			&
			ld_pagado = 0,				&
			ld_pendiente = 0, 		&
			ld_cambio = 0,				&
			ld_total = 0,				&
			ld_fee_rate = 0,			&
			ld_cons_master = 0
	
FOR ll_i = 1 TO il_row
	
	IF dw_choise.IsSelected(ll_i) THEN
		ls_status 	  = ''
		ls_branch	  = dw_choise.getitemstring(ll_i,"id_branch")
		ld_receiver   = dw_choise.getitemnumber(ll_i,"id_receiver")
		ld_amount     = dw_choise.getitemnumber(ll_i,"net_amount_receiver")
		ld_delivery   = dw_choise.getitemnumber(ll_i,"total_modo_pago_comp")
		ld_comision   = dw_choise.getitemnumber(ll_i,"exchange_company")
		ld_telex 	  = dw_choise.getitemnumber(ll_i,"telex_company")
		ld_other      = dw_choise.getitemnumber(ll_i,"receiver_handling_receiver")
		ld_fee_rate   = dw_choise.getitemnumber(ll_i,"fee_rate")
		ls_status     = dw_choise.getitemstring(ll_i,"status")
		if ls_status = '' or isnull(ls_status) then 
			ls_status = 'U'
		end if
		
		if ls_status = 'U' then

			ld_total      = ld_amount + ld_comision + ld_delivery + ld_telex + ld_other + ld_fee_rate
			
			INSERT INTO dba.relacion_pago_agente  
			( cons_trans_diaria,id_main_branch,id_branch,id_receiver,vlr_total,vlr_pagado )  
			VALUES ( :ld_cons,:ls_group,:ls_branch,:ld_receiver,:ld_total,:ld_total )  ;

			UPDATE dba.receiver  
			SET dba.receiver.status_pago_agent = 'P'  
			WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
					( dba.receiver.id_receiver = :ld_receiver )   ;

		else
			ld_total = 0
		end if
			
		ld_deposito = ld_deposito - ld_total	
	END IF
	
NEXT
	
UPDATE dba.group_branch  
SET  dba.group_branch.credit_group = :ld_deposito  
WHERE dba.group_branch.id_main_branch = :ls_group;

ld_link_reference = 0	
			
ld_link_reference = dw_2.getitemnumber(dw_2.getrow(),"link_reference")	

if Isnull(ld_link_reference) or ld_link_reference = 0 then
	ld_link_reference = ld_cons
end if

ls_comment = dw_2.getitemstring(1,"desc_trans_diaria1")	

if Isnull(ls_comment) or len(ls_comment) = 0 then
	dw_2.setitem(1,"description", "DIRECT DEPOSIT FAX")
end if

dw_2.setitem(1,"id_cashier",gs_cashier)
dw_1.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"balance",ld_balance)
dw_2.accepttext()

IF dw_2.update()=1 THEN
	IF dw_1.update()=1 THEN
		dw_1.enabled = False
		dw_2.enabled = False
		COMMIT ;
		ib_actualizado = True
		COMMIT ;
	
		SELECT Count(*)  
		INTO :ll_cons  
		FROM dba.transaccion_diaria_payee  
		WHERE dba.transaccion_diaria_payee.cons_trans_diaria = :ld_cons   ;
		
		if ll_cons <> 1 then
			Messagebox('Error','Transaction was not saved',StopSign!)
		else
			Messagebox('Process Complete','Transaction was saved successful',Information!)

			// :::::::::::::::::::::::::::::::::::::
			//	 Actualiza el balance_match del grupo
			
			double ld_balance_match
			em_sd.GetData(ld_balance_match)
			
			if isnull(ld_balance_match) then ld_balance_match = 0
			UPDATE dba.GROUP_BRANCH
			SET BALANCE_MATCH = :ld_balance_match
			WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :is_group;
			
			if sqlca.sqlcode <> 0 then
				Messagebox('Error Updating','The Balance was not updated~n'+SQLCA.SQLErrText,Exclamation!)
			end if
			
			// :::::::::::::::::::::::::::::::::::::			
			
			// ---------------------------------------------------->			
			// Moviendo el Fax a la carpeta de procesados
			if sle_selectedfax.text <> "[No Fax Selected]" then
				String ls_faxpath, ls_faxname, ls_newfaxname, ls_bankid
				
				SELECT dba.CUENTA_BANCO.ID_BANCO  
				INTO :ls_bankid  
				FROM dba.CUENTA_BANCO  
				WHERE dba.CUENTA_BANCO.ID_CUENTA_BANCO = :ls_account   ;
		
				if isnull(ls_bankid) then ls_bankid = "xxxxx"
				if isnull(ls_account) then ls_account = "xxxxx"				
				
				ls_faxpath = "u:\accounting\"
				ls_faxname = sle_selectedfax.text
				if FileExists(ls_faxpath+ls_faxname) then			
					ls_newfaxname = "0_" + trim(em_agent.text) + "_" + trim(ls_bankid) + "_" + trim(ls_account) + "_" + string(round(ld_deposito,0)) + "_"+string(ld_cons)+".tif"
					fn_filemove(ls_faxpath+ls_faxname,ls_faxpath+"processed\"+ls_newfaxname)	
					sle_selectedfax.text = ls_newfaxname
					sle_completefaxpath.text = "u:\accounting\processed\"+sle_selectedfax.text
				end if
			end if	
			// ---------------------------------------------------->
			
		end if
		
		//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		// Relacion de los Invoices que el agente pago (para agentes que son agentes y pagadores)

		ld_gran_total = 0
	
		FOR i = 1 TO dw_cross_payee_final.rowcount()
			ld_total = 0
			ld_comision_payee = 0
				
			IF dw_cross_payee_final.IsSelected(i) THEN
				ld_amount     		  = dw_cross_payee_final.getitemnumber(i,"net_amount_receiver")
				ld_comision_payee   = dw_cross_payee_final.getitemnumber(i,"commission_payee")
				ld_total            = ld_amount + ld_comision_payee 
				ld_gran_total       = ld_gran_total + ld_total
			END IF
		NEXT
	
		IF ld_gran_total <> 0 THEN
	
			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       	INTO :ld_cons1  
       	FROM dba.transaccion_diaria_payee  ;
			
			INSERT INTO dba.transaccion_diaria_payee
			( cons_trans_diaria,   
			id_group_trans_diaria,   
			date_trans_diaria,   
			hour_trans_diaria,   
			id_concepto_contable,   
			des_trans_diaria,   
			debit_trans_diaria,   
			credit_trans_diaria,   
			balance_trans_diaria,   
			descripcion_suspense,   
			link_reference )  
			VALUES ( :ld_cons1,   
			:ls_group,   
			:ld_date,   
			GETDATE(),   
			'DP',   
			'INVOICES PAGADOS POR EL AGENTE AL CLIENTE',   
			:ld_gran_total,   
			0,   
			0,   
			'',   
			:ld_link_reference);
			
			COMMIT ;			
						
			SELECT Count(*)  
			INTO :ll_cons   
			FROM dba.transaccion_diaria_payee  
			WHERE cons_trans_diaria = :ld_cons1;

			if ll_cons <> 1 then
				Messagebox('Error','Transaction was not saved',StopSign!)
			else
				Messagebox('Process Complete','Transaction was saved successful',Information!)												
			end if
		
			FOR i = 1 TO dw_cross_payee_final.rowcount()
				ld_gran_total = 0
				ld_total = 0
				ld_comision_payee = 0
		
				IF dw_cross_payee_final.IsSelected(i) THEN
			
					ls_branch	        = dw_cross_payee_final.getitemstring(i,"id_branch")
					ld_receiver         = dw_cross_payee_final.getitemnumber(i,"id_receiver")
					ld_amount     		  = dw_cross_payee_final.getitemnumber(i,"net_amount_receiver")
					ld_comision_payee   = dw_cross_payee_final.getitemnumber(i,"commission_payee")
					ld_total            = ld_amount + ld_comision_payee 
					ld_gran_total       = ld_gran_total + ld_total
			
					INSERT INTO dba.relacion_pago_confirmacion  
					( cons_trans_diaria,id_main_branch,id_branch,id_receiver,vlr_total,vlr_pagado )  
					VALUES ( :ld_cons1,:ls_group,:ls_branch,:ld_receiver,:ld_total,:ld_total )  ;
	
					commit ;
	
					UPDATE dba.receiver  
					SET dba.receiver.status_pago_payee = 'P'  
					WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
							( dba.receiver.id_receiver = :ld_receiver )   ;
		
				END IF
			NEXT
		
			commit ;

		END IF

		ld_total = 0
		ld_gran_total = 0
		//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++		
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++		
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Esto era lo que generaba la segunda transaccion de Ajuste cuando lo depositado era diferente
//// al valor de los invoices incluidos en el match

//// Ahora solo se usa una transaccion por el valor real del deposito.		
		
//		ld_ajuste = 0
//		
//		if Double(em_ajuste_debit.text) > 0 then
//			
//			ld_ajuste = Double(em_ajuste_debit.text)
//	
//			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
//       	INTO :ld_cons1  
//       	FROM dba.transaccion_diaria_payee  ;
//			
//			INSERT INTO dba.transaccion_diaria_payee
//			( cons_trans_diaria,   
//			id_group_trans_diaria,   
//			date_trans_diaria,   
//			hour_trans_diaria,   
//			id_concepto_contable,   
//			des_trans_diaria,   
//			debit_trans_diaria,   
//			credit_trans_diaria,   
//			balance_trans_diaria,   
//			descripcion_suspense,   
//			link_reference )  
//			VALUES ( :ld_cons1,   
//			:ls_group,   
//			:ld_date,   
//			GETDATE(),   
//			'AC',   
//			:ls_desc_ac,   
//			:ld_ajuste,   
//			0,   
//			0,   
//			'',   
//			:ld_link_reference )  ;
//
//			commit ;
//			
//			INSERT INTO dba.transaccion_diaria_banco_payee  
//			( dba.transaccion_diaria_banco_payee.cons_trans_diaria,   
//			dba.transaccion_diaria_banco_payee.id_banco,   
//			dba.transaccion_diaria_banco_payee.id_cuenta_banco )  
//			VALUES ( :ld_cons1,   
//			:ls_banco,   
//			:ls_account );
//			
//			if sqlca.sqlcode <> 0 then
//				Messagebox('','SQL Error')
//			end if
//			
//			commit ;
//			
//			
//		end if
//		
//		if Double(em_ajuste_credit.text) > 0 then
//			
//			ld_ajuste = Double(em_ajuste_credit.text)
//			
//			ld_ajuste = abs(ld_ajuste)
//			
//			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
//       	INTO :ld_cons1  
//       	FROM dba.transaccion_diaria_payee  ;
//			
//			INSERT INTO dba.transaccion_diaria_payee  
//			( cons_trans_diaria,   
//			id_group_trans_diaria,   
//			date_trans_diaria,   
//			hour_trans_diaria,   
//			id_concepto_contable,   
//			des_trans_diaria,   
//			debit_trans_diaria,   
//			credit_trans_diaria,   
//			balance_trans_diaria,   
//			descripcion_suspense,   
//			link_reference )  
//			VALUES ( :ld_cons1,   
//			:ls_group,   
//			:ld_date,   
//			GETDATE(),   
//			'AC',   
//			:ls_desc_ac,   
//			0,   
//			:ld_ajuste,   
//			0,   
//			'',   
//			:ld_link_reference )  ;
//			
//			commit ;
//						
//			INSERT INTO dba.transaccion_diaria_banco_payee  
//			( dba.transaccion_diaria_banco_payee.cons_trans_diaria,   
//			dba.transaccion_diaria_banco_payee.id_banco,   
//			dba.transaccion_diaria_banco_payee.id_cuenta_banco )  
//			VALUES ( :ld_cons1,   
//			:ls_banco,   
//			:ls_account )  ;
//			
//			if sqlca.sqlcode <> 0 then
//				Messagebox('','SQL Error')
//			end if
//			
//			commit ;
//			
//		end if

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

		commit ;
	ELSE
		Rollback ;
		Return
	END IF
ELSE
	Rollback ;
	Return
END IF		
end subroutine

on w_pago_agente_by_closing_ref.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_save=create cb_save
this.em_date=create em_date
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.dw_3=create dw_3
this.st_2=create st_2
this.st_3=create st_3
this.cb_datos=create cb_datos
this.em_group=create em_group
this.st_4=create st_4
this.cb_procesar=create cb_procesar
this.em_ajuste_credit=create em_ajuste_credit
this.st_5=create st_5
this.st_branch=create st_branch
this.em_agent=create em_agent
this.dw_cross_payee_final=create dw_cross_payee_final
this.st_6=create st_6
this.em_wire=create em_wire
this.cb_new=create cb_new
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_44=create cb_44
this.cb_84=create cb_84
this.cb_444=create cb_444
this.em_ajuste_debit=create em_ajuste_debit
this.sle_desc_ac=create sle_desc_ac
this.st_44=create st_44
this.em_from=create em_from
this.em_to=create em_to
this.cb_datos1=create cb_datos1
this.cb_detectar=create cb_detectar
this.cb_4=create cb_4
this.st_4433=create st_4433
this.dw_2=create dw_2
this.cb_5=create cb_5
this.sle_selectedfax=create sle_selectedfax
this.cb_faxviewer=create cb_faxviewer
this.sle_completefaxpath=create sle_completefaxpath
this.em_sd=create em_sd
this.st_7=create st_7
this.em_total=create em_total
this.st_8=create st_8
this.em_balance_match=create em_balance_match
this.cb_deposits=create cb_deposits
this.cb_invoices=create cb_invoices
this.dw_choise=create dw_choise
this.dw_deposits=create dw_deposits
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_save
this.Control[iCurrent+4]=this.em_date
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.cb_datos
this.Control[iCurrent+12]=this.em_group
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.cb_procesar
this.Control[iCurrent+15]=this.em_ajuste_credit
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.st_branch
this.Control[iCurrent+18]=this.em_agent
this.Control[iCurrent+19]=this.dw_cross_payee_final
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.em_wire
this.Control[iCurrent+22]=this.cb_new
this.Control[iCurrent+23]=this.cb_7
this.Control[iCurrent+24]=this.cb_8
this.Control[iCurrent+25]=this.cb_44
this.Control[iCurrent+26]=this.cb_84
this.Control[iCurrent+27]=this.cb_444
this.Control[iCurrent+28]=this.em_ajuste_debit
this.Control[iCurrent+29]=this.sle_desc_ac
this.Control[iCurrent+30]=this.st_44
this.Control[iCurrent+31]=this.em_from
this.Control[iCurrent+32]=this.em_to
this.Control[iCurrent+33]=this.cb_datos1
this.Control[iCurrent+34]=this.cb_detectar
this.Control[iCurrent+35]=this.cb_4
this.Control[iCurrent+36]=this.st_4433
this.Control[iCurrent+37]=this.dw_2
this.Control[iCurrent+38]=this.cb_5
this.Control[iCurrent+39]=this.sle_selectedfax
this.Control[iCurrent+40]=this.cb_faxviewer
this.Control[iCurrent+41]=this.sle_completefaxpath
this.Control[iCurrent+42]=this.em_sd
this.Control[iCurrent+43]=this.st_7
this.Control[iCurrent+44]=this.em_total
this.Control[iCurrent+45]=this.st_8
this.Control[iCurrent+46]=this.em_balance_match
this.Control[iCurrent+47]=this.cb_deposits
this.Control[iCurrent+48]=this.cb_invoices
this.Control[iCurrent+49]=this.dw_choise
this.Control[iCurrent+50]=this.dw_deposits
end on

on w_pago_agente_by_closing_ref.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_save)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cb_datos)
destroy(this.em_group)
destroy(this.st_4)
destroy(this.cb_procesar)
destroy(this.em_ajuste_credit)
destroy(this.st_5)
destroy(this.st_branch)
destroy(this.em_agent)
destroy(this.dw_cross_payee_final)
destroy(this.st_6)
destroy(this.em_wire)
destroy(this.cb_new)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_44)
destroy(this.cb_84)
destroy(this.cb_444)
destroy(this.em_ajuste_debit)
destroy(this.sle_desc_ac)
destroy(this.st_44)
destroy(this.em_from)
destroy(this.em_to)
destroy(this.cb_datos1)
destroy(this.cb_detectar)
destroy(this.cb_4)
destroy(this.st_4433)
destroy(this.dw_2)
destroy(this.cb_5)
destroy(this.sle_selectedfax)
destroy(this.cb_faxviewer)
destroy(this.sle_completefaxpath)
destroy(this.em_sd)
destroy(this.st_7)
destroy(this.em_total)
destroy(this.st_8)
destroy(this.em_balance_match)
destroy(this.cb_deposits)
destroy(this.cb_invoices)
destroy(this.dw_choise)
destroy(this.dw_deposits)
end on

event open;call super::open;string ls_fax_deposit

X=1
Y=1
Show()


dw_choise.settransobject(sqlca)
ib_actualizado = False
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_choise.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_1.setitem(1,"cons",1)
dw_2.setitem(1,"cons",1)


//si llega parametro la ventana fue abierta desde acc credit, recibe la agencia y el valor del deposito
ls_fax_deposit = message.stringparm
IF len(ls_fax_deposit) > 0 THEN
	fn_get_fax_deposits(ls_fax_deposit)
	fn_save()
	close(this)
END IF



end event

event pfc_close;call super::pfc_close;dw_1.reset()
dw_2.reset()
dw_3.reset()


end event

event close;call super::close;dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_choise.reset()


end event

type dw_1 from datawindow within w_pago_agente_by_closing_ref
integer x = 14
integer y = 152
integer width = 1893
integer height = 164
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_selet_cuenta_pago_corresponsal"
boolean border = false
boolean livescroll = true
end type

event itemchanged;DataWindowChild	ldw_dw

IF dwo.Name = 'id_banco' THEN
	GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("id_banco = '"+GetText()+"'")
	ldw_dw.Filter()

	dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",'')
END IF

if dwo.name = "deposit_code" then
	long ll_cont
	string ls_depositcode, ls_idbank, ls_idcuenta

	ls_depositcode = data

	select count(*) 
	into :ll_cont
	from dba.deposit_codes
	where deposit_code = :ls_depositcode;
	
	if ll_cont = 1 then
		select id_banco, id_cuenta_banco		
		into :ls_idbank, :ls_idcuenta
		from dba.deposit_codes
		where deposit_code = :ls_depositcode;		

		dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_idcuenta)
		dw_1.setitem(dw_1.getrow(),"id_banco",ls_idbank)		

	end if
	
end if
end event

type cb_1 from commandbutton within w_pago_agente_by_closing_ref
integer x = 2519
integer y = 1124
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Continue"
end type

event clicked;Double	ld_cons
string	ls_banco, ls_cuenta_banco


if Messagebox('Warning','This operation will delete any unsaved data, do you really want to continue?',question!,YesNo!)  <> 1 then
	return
end if

COMMIT ;
sle_desc_ac.text = ''
em_balance_match.text = string(0)
em_sd.text = string(0)
em_total.text = string(0)
em_ajuste_credit.text = string(0)
em_ajuste_debit.text = string(0)
em_wire.text = string(0)
ls_banco 			= dw_1.getitemstring(1,'id_banco')
ls_cuenta_banco   = dw_1.getitemstring(1,'id_cuenta_banco')
em_from.text = ''
em_to.text = ''
dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_choise.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_choise.reset()
dw_cross_payee_final.reset()
ib_actualizado = False
dw_1.setitem(1,"cons",ld_cons)
dw_1.setitem(1,"id_banco",ls_banco)
dw_1.setitem(1,"id_cuenta_banco",ls_cuenta_banco)
dw_2.setitem(1,"cons",ld_cons)
dw_choise.settransobject(sqlca)
ib_actualizado = False
sle_selectedfax.text = "[No Fax Selected]"
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)









end event

type cb_save from commandbutton within w_pago_agente_by_closing_ref
integer x = 2519
integer y = 1204
integer width = 329
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;fn_save()
end event

type em_date from editmask within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 32
integer y = 1636
integer width = 343
integer height = 96
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type st_1 from statictext within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 37
integer y = 1580
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Date Since"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 393
integer y = 1640
integer width = 357
integer height = 96
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Info. Wire"
end type

event clicked;IF IsNull(dw_2.Object.id_group[dw_2.GetRow()]) OR dw_2.Object.id_group[dw_2.GetRow()]='' THEN
	MessageBox('Atention','You have to choose a group and then press Info. Savings.')
	Return
END IF

dw_3.Retrieve(Date(em_date.text),dw_2.Object.id_group[dw_2.GetRow()])
end event

type cb_3 from commandbutton within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 750
integer y = 1640
integer width = 357
integer height = 96
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Print"
end type

event clicked;PRINTSETUP()
dw_3.PRINT()
end event

type dw_3 from datawindow within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 23
integer y = 680
integer width = 2702
integer height = 912
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_rep_wire_transfer"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_pago_agente_by_closing_ref
integer x = 1266
integer y = 40
integer width = 183
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "From :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_pago_agente_by_closing_ref
integer x = 1765
integer y = 40
integer width = 105
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "To :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_datos from commandbutton within w_pago_agente_by_closing_ref
integer x = 2226
integer y = 40
integer width = 242
integer height = 64
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Query"
end type

event clicked;is_group = em_group.text

Double 	ld_from, ld_to, ld_receiver
datetime	ld_busqueda, ld_fecha_menor
date		ld_fecha1, ld_fecha2, ld_hoy
long		i
string	ls_GRUPO, ls_branch, ls_status

ls_GRUPO = is_group
ls_branch = em_agent.TEXT 
ld_hoy = today()
ld_from = Double(em_from.text)
ld_TO   = Double(em_to.text)

SELECT dba.RECEIVER.DATE_RECEIVER  
INTO :ld_fecha_menor  
FROM dba.RECEIVER  
WHERE ( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
		( dba.RECEIVER.ID_RECEIVER = :ld_from );

ld_hoy = date(ld_fecha_menor)
//ld_hoy = RELATIVEDATE(today(),-5)

SELECT dba.RELACION_INVOICES_PAYEE.DATE_RELACION_DIARIA  
INTO :ld_busqueda  
FROM dba.RELACION_INVOICES_PAYEE,   
	dba.RECEIVER  
WHERE ( dba.RECEIVER.ID_BRANCH = dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE ) and  
	( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = dba.RECEIVER.ID_RECEIVER ) and  
	( ( dba.RECEIVER.ID_RECEIVER = :ld_from ) AND  
	( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
	( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE = 'TD' ) )   ;

ld_fecha1 = date(ld_busqueda)

SELECT dba.RELACION_INVOICES_PAYEE.DATE_RELACION_DIARIA  
INTO :ld_busqueda  
FROM dba.RELACION_INVOICES_PAYEE,   
	dba.RECEIVER  
WHERE ( dba.RECEIVER.ID_BRANCH = dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE ) and  
	( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = dba.RECEIVER.ID_RECEIVER ) and  
	( ( dba.RECEIVER.ID_RECEIVER = :ld_to ) AND  
	( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
	( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE = 'TD' ) );

ld_fecha2 = date(ld_busqueda)

//il_row = dw_choise.retrieve(ld_fecha1,ld_fecha2,ls_GRUPO,ld_from,ld_to,ld_hoy)
il_row = dw_choise.retrieve(ld_fecha1,ld_fecha2,ls_GRUPO,ld_from,ld_to,ld_hoy)

dw_cross_payee_final.retrieve(em_agent.text)

FOR i=1 TO il_row
	ld_receiver = dw_choise.getitemnumber(i,"id_receiver")
	if ld_receiver >= ld_from and ld_receiver <= ld_to then
		ls_status = dw_choise.getitemstring(i,"status")
		if ls_status = 'U' then
			dw_choise.SelectRow(i, TRUE)
		end if
	end if
NEXT

cb_detectar.triggerevent(Clicked!)
cb_procesar.triggerevent(Clicked!)
	

end event

type em_group from editmask within w_pago_agente_by_closing_ref
integer x = 1015
integer y = 40
integer width = 256
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!"
boolean autoskip = true
end type

type st_4 from statictext within w_pago_agente_by_closing_ref
integer x = 823
integer y = 40
integer width = 192
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Group  :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_procesar from commandbutton within w_pago_agente_by_closing_ref
integer x = 2519
integer y = 1044
integer width = 329
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Process"
end type

event clicked;Double	ld_total = 0,				&
			ld_amount = 0,				&
			ld_telex = 0,				&
			ld_comision = 0,			&
			ld_delivery = 0,			&
			ld_transferencia = 0,	&
			ld_other = 0,				&
			ld_fee_rate = 0, ld_from, ld_to, ld_receiver	
string	ls_status = 'U', ls_texto, ls_texto_large	
Long		ll_i = 1
Double   ld_deposit, ld_ajustment, ld_balance_match
Double	ld_gran_total = 0, ld_comision_payee
long		i


ld_from = 0
ld_to = 0
il_row  = dw_choise.rowcount() 

dw_2.accepttext()

if il_row = 0 then Return

FOR ll_i = 1 TO il_row
		
	IF dw_choise.IsSelected(ll_i) THEN
		
		ls_status = ''
		ls_status     = dw_choise.getitemstring(ll_i,"status")
		ld_amount     = dw_choise.getitemnumber(ll_i,"net_amount_receiver")
		ld_delivery   = dw_choise.getitemnumber(ll_i,"total_modo_pago_comp")
		ld_comision   = dw_choise.getitemnumber(ll_i,"exchange_company")
		ld_telex 	  = dw_choise.getitemnumber(ll_i,"telex_company")
		ld_other      = dw_choise.getitemnumber(ll_i,"receiver_handling_receiver")
		ld_fee_rate   = dw_choise.getitemnumber(ll_i,"fee_rate")
		if ls_status = '' or isnull(ls_status) then 
			ls_status = 'U'
		end if
		
		if ls_status = 'U' then
			ld_receiver = dw_choise.getitemnumber(ll_i,"id_receiver")
			if ld_from = 0 and (ld_receiver > 0) then 
				ld_from = ld_receiver
			else
				if (ld_receiver < ld_from ) and (ld_receiver > 0) then ld_from = ld_receiver
			end if
			
			if ld_to = 0 then 
				ld_to = ld_receiver
			else
				if (ld_receiver > ld_to) and (ld_receiver > 0) then ld_to = ld_receiver
			end if
			ld_total      = ld_amount + ld_comision + ld_delivery + ld_telex + ld_other + ld_fee_rate
		else
			ld_total = 0
		end if
		
		ld_transferencia = ld_transferencia + ld_total
	END IF
	
NEXT

ls_texto = "DEPOSIT (Inv. "+TRIM(STRING(ld_from))+"-"+TRIM(string(ld_to))
ls_texto = ls_texto +" For "+string(ld_transferencia,"$#,##0.00")

dw_2.setitem(dw_2.getrow(),"id_group",is_group)
ld_deposit = dw_2.getitemnumber(dw_2.getrow(),"credit")
if isnull(ld_deposit) then ld_deposit = 0

dw_2.setitem(dw_2.getrow(),"total_amount",ld_transferencia)

SELECT dba.GROUP_BRANCH.BALANCE_MATCH  
INTO :ld_balance_match  
FROM dba.GROUP_BRANCH  
WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :is_group;

if isnull(ld_balance_match) then ld_balance_match = 0

em_balance_match.text = string(ld_balance_match)

em_total.text = string(ld_transferencia)
ld_ajustment = ld_deposit - ld_transferencia
ld_ajustment = Round(ld_ajustment,2)

ls_texto_large = ls_texto

if ld_ajustment > 0 then
	ls_texto_large = ls_texto_large+" Plus "+string(ld_ajustment,"$#,##0.00") + " Surplus"
	ls_texto = ls_texto+"+"+string(ld_ajustment,"$#,##0.00")
elseif ld_ajustment < 0 then
	ls_texto_large = ls_texto_large+" Less "+string(ld_ajustment,"$#,##0.00") + " Deficit"
	ls_texto = ls_texto+"-"+string(abs(ld_ajustment),"$#,##0.00")	
end if
ls_texto_large = ls_texto_large +")"
ls_texto = ls_texto +")"

ld_ajustment = ld_ajustment + ld_balance_match
em_sd.text = string(ld_ajustment)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Description: la descripcion corta
if len(ls_texto) > 50 then 
	ls_texto = mid(ls_texto,1,50)
end if
dw_2.setitem(dw_2.getrow(),"description",ls_texto)
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Description1: La descripcion Larga
if len(ls_texto_large) > 100 then 
	ls_texto_large=mid(ls_texto_large,1,100)
end if
dw_2.setitem(dw_2.getrow(),"desc_trans_diaria1",ls_texto_large)
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

ld_gran_total = 0

FOR i = 1 TO dw_cross_payee_final.rowcount()
	ld_total = 0
	ld_comision_payee = 0
		
	IF dw_cross_payee_final.IsSelected(i) THEN
		ld_amount     		  = dw_cross_payee_final.getitemnumber(i,"net_amount_receiver")
		ld_comision_payee   = dw_cross_payee_final.getitemnumber(i,"commission_payee")
		ld_total            = ld_amount + ld_comision_payee 
		ld_gran_total       = ld_gran_total + ld_total
	END IF
NEXT

em_wire.text = string(ld_gran_total)
end event

type em_ajuste_credit from editmask within w_pago_agente_by_closing_ref
integer x = 3968
integer y = 1004
integer width = 306
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
string mask = "#####,###.00"
end type

type st_5 from statictext within w_pago_agente_by_closing_ref
integer x = 3968
integer y = 932
integer width = 306
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Credit"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_branch from statictext within w_pago_agente_by_closing_ref
integer x = 311
integer y = 40
integer width = 178
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Agent  :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_agent from editmask within w_pago_agente_by_closing_ref
integer x = 489
integer y = 40
integer width = 315
integer height = 64
integer taborder = 10
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
boolean autoskip = true
end type

event losefocus;String	ls_branch, ls_grupo, ls_depositcode, ls_idbanco, ls_idcuenta


ls_branch = em_agent.text


  SELECT dba.branch.id_main_branch  
    INTO :ls_grupo  
    FROM dba.branch  
   WHERE dba.branch.id_branch = :ls_branch   ;
	
	em_group.text = ls_grupo

	dw_deposits.Retrieve(relativedate(today(),-30),ls_grupo)
	
	if isnull(ls_grupo) or len(trim(ls_grupo)) < 1 then 
		st_branch.TextColor = RGB(255,0,0)
	else
		st_branch.TextColor = RGB(0,0,0)
	end if




/***********csarmiento: same behavio as the lookup button *********************/
/**requested by Joel Silva , Wednesday, May 28, 2014 12:09 PM
I would like to request a change in Viacentral that would help reduce mistakes being made by the accounting staff when deposits are made. 
The printscreen is where deposits are made by accounting.  The Bank is a dropdown which currently the agent can select any bank
and leaves room for error.  I would like to have this automatically populate from the information that is currently housed in the Group Branch-Financial Profile

**/


select fin_depdepositcode
	into :ls_depositcode
 from dba.group_branch  (nolock)
 where id_main_branch = :ls_grupo ;

if ls_depositcode <> 'none' and ls_depositcode <> '' then
	
	dw_1.settaborder(2,0) //El Banco
	dw_1.settaborder(3,0) //La cuenta
	dw_1.settaborder(4,0) //The deposit code
	dw_1.settaborder(5,10) //Reconciliation Date

	// --------------------------------------------
	// Remueve filtro Cuentas
	DataWindowChild	ldw_dw
	dw_1.GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("")
	ldw_dw.Filter()
	// --------------------------------------------	
	
	//---------------------------------------------
	//Remueve filttro Deposit Codes
	DataWindowChild	ldw_dw1
	dw_1.GetChild('deposit_code',ldw_dw)
	ldw_dw1.SetTransObject(SQLCA)
	ldw_dw1.SetFilter("")
	ldw_dw1.Filter()
	// --------------------------------------------	
	
	
	SELECT 	dba.DEPOSIT_CODES.ID_BANCO,   
			dba.DEPOSIT_CODES.ID_CUENTA_BANCO  
	 INTO :ls_idbanco,   
			:ls_idcuenta  
	 FROM dba.BRANCH  (nolock),   
			dba.DEPOSIT_CODES   (nolock)
	WHERE ( dba.DEPOSIT_CODES.ID_BRANCH = dba.BRANCH.ID_BRANCH ) and  
			( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) )   ;
	
	
	dw_1.setitem(dw_1.getrow(),"id_banco",ls_idbanco)
	dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_idcuenta)
	dw_1.setitem(dw_1.getrow(),"deposit_code",ls_depositcode)


end if


/*****************************************************************/
end event

type dw_cross_payee_final from datawindow within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 3273
integer y = 624
integer width = 1230
integer height = 1488
integer taborder = 130
boolean bringtotop = true
string dataobject = "dw_cross_payee_final_new"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;dw_cross_payee_final.settransobject(sqlca)
end event

event clicked;

integer CurRow
boolean result

result = this.IsSelected(Row)

IF result THEN
	this.SelectRow(Row, FALSE)
ELSE
	this.SelectRow(Row, TRUE)
END IF



end event

type st_6 from statictext within w_pago_agente_by_closing_ref
integer x = 4608
integer y = 932
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Wire "
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type em_wire from singlelineedit within w_pago_agente_by_closing_ref
integer x = 4608
integer y = 1004
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
boolean displayonly = true
end type

type cb_new from commandbutton within w_pago_agente_by_closing_ref
integer x = 2519
integer y = 1284
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New"
end type

event clicked;dw_deposits.visible = false
dw_choise.visible = true

dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_choise.reset()
dw_cross_payee_final.reset()
sle_desc_ac.text = ''
em_balance_match.text = string(0)
em_sd.text = string(0)
em_total.text = string(0)
em_ajuste_credit.text = string(0)
em_ajuste_debit.text = string(0)
em_wire.text = string(0)

em_from.text = ''
em_to.text = ''

em_agent.text = ''
em_group.text = ''

ib_actualizado = False

dw_choise.settransobject(sqlca)

ib_actualizado = False
sle_selectedfax.text = "[No Fax Selected]"

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)

dw_1.reset()
dw_2.reset()
dw_choise.reset()
dw_cross_payee_final.reset()

dw_1.enabled = True
dw_2.enabled = True
dw_choise.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)




end event

type cb_7 from commandbutton within w_pago_agente_by_closing_ref
integer x = 2523
integer y = 40
integer width = 329
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;Close(parent)
end event

type cb_8 from commandbutton within w_pago_agente_by_closing_ref
integer x = 2519
integer y = 788
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select all"
end type

event clicked;dw_deposits.visible = false
dw_choise.visible = true

long	i, ll_row 
 
ll_row = dw_choise.rowcount() 

FOR i=1 TO ll_row 
	dw_choise.SelectRow(i, TRUE)
NEXT


end event

type cb_44 from commandbutton within w_pago_agente_by_closing_ref
integer x = 2519
integer y = 868
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Unselect all"
end type

event clicked;dw_deposits.visible = false
dw_choise.visible = true

long	i, ll_row 

ll_row = dw_choise.rowcount() 

FOR i=1 TO ll_row 
	dw_choise.SelectRow(i, False)
NEXT


end event

type cb_84 from commandbutton within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 4219
integer y = 424
integer width = 270
integer height = 88
integer taborder = 140
boolean bringtotop = true
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select All"
end type

event clicked;long	i, ll_row 

ll_row = dw_cross_payee_final.rowcount() 

FOR i=1 TO ll_row 
	dw_cross_payee_final.SelectRow(i, TRUE)
NEXT


end event

type cb_444 from commandbutton within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 4219
integer y = 520
integer width = 270
integer height = 88
integer taborder = 150
boolean bringtotop = true
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "UnSelect All"
end type

event clicked;long	i, ll_row 

ll_row = dw_cross_payee_final.rowcount() 

FOR i=1 TO ll_row 
	dw_cross_payee_final.SelectRow(i, False)
NEXT


end event

type em_ajuste_debit from editmask within w_pago_agente_by_closing_ref
integer x = 4283
integer y = 1004
integer width = 315
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
string mask = "#####,###.00"
end type

type sle_desc_ac from singlelineedit within w_pago_agente_by_closing_ref
integer x = 3982
integer y = 1312
integer width = 901
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
end type

type st_44 from statictext within w_pago_agente_by_closing_ref
integer x = 4000
integer y = 1240
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Desc AC :"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type em_from from editmask within w_pago_agente_by_closing_ref
integer x = 1449
integer y = 40
integer width = 325
integer height = 64
integer taborder = 30
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
string mask = "##########"
end type

type em_to from editmask within w_pago_agente_by_closing_ref
integer x = 1870
integer y = 40
integer width = 325
integer height = 64
integer taborder = 40
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
string mask = "##########"
end type

event losefocus;cb_datos.triggerevent(clicked!)
end event

type cb_datos1 from commandbutton within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 1934
integer y = 12
integer width = 265
integer height = 60
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Datos"
end type

event clicked;is_group = em_group.text


Double 	ld_from, ld_to, ld_receiver
datetime	ld_busqueda
date		ld_fecha1, ld_fecha2, ld_hoy
long		i
string	ls_GRUPO, ls_branch

ls_GRUPO = is_group
ls_branch = em_agent.TEXT 
ld_hoy = today()

ld_hoy = today()

ld_from = Double(em_from.text)
ld_TO   = Double(em_to.text)

  SELECT dba.RELACION_INVOICES_PAYEE.DATE_RELACION_DIARIA  
    INTO :ld_busqueda  
    FROM dba.RELACION_INVOICES_PAYEE,   
         dba.RECEIVER  
   WHERE ( dba.RECEIVER.ID_BRANCH = dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE ) and  
         ( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = dba.RECEIVER.ID_RECEIVER ) and  
         ( ( dba.RECEIVER.ID_RECEIVER = :ld_from ) AND  
         ( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
         ( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE = 'TD' ) )   ;

ld_fecha1 = date(ld_busqueda)

  SELECT dba.RELACION_INVOICES_PAYEE.DATE_RELACION_DIARIA  
    INTO :ld_busqueda  
    FROM dba.RELACION_INVOICES_PAYEE,   
         dba.RECEIVER  
   WHERE ( dba.RECEIVER.ID_BRANCH = dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE ) and  
         ( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = dba.RECEIVER.ID_RECEIVER ) and  
         ( ( dba.RECEIVER.ID_RECEIVER = :ld_to ) AND  
         ( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
         ( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE = 'TD' ) )   ;

ld_fecha2 = date(ld_busqueda)

il_row = dw_choise.retrieve(ld_fecha1,ld_fecha2,ls_GRUPO,ld_from,ld_to,ld_hoy)

dw_cross_payee_final.retrieve(em_agent.text)

  
FOR i=1 TO il_row
	ld_receiver = dw_choise.getitemnumber(i,"id_receiver") 
	if ld_receiver >= ld_from and ld_receiver <= ld_to then
		dw_choise.SelectRow(i, TRUE)
	end if
NEXT
cb_procesar.triggerevent(Clicked!)
	

end event

type cb_detectar from commandbutton within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 1934
integer y = 92
integer width = 265
integer height = 60
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detector"
end type

event clicked;long	I,J,ll_rows
Double	ld_receiver, ld_receiverJ


ll_rows = dw_choise.rowcount()

FOR I = 1 TO ll_rows
	ld_receiver = dw_choise.getitemnumber(I,"id_receiver")

	FOR J = I+1 TO ll_rows
		ld_receiverJ = dw_choise.getitemnumber(J,"id_receiver")
	
		if ld_receiver = ld_receiverJ then
			dw_choise.DELETEROW(J)
			ll_rows = ll_rows - 1
		end if
	
	NEXT

	



NEXT

end event

type cb_4 from commandbutton within w_pago_agente_by_closing_ref
integer x = 32
integer y = 40
integer width = 242
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Look up"
end type

event clicked;String ls_depositcode, ls_idbranch, ls_idgroup, ls_idbanco, ls_idcuenta  

Openwithparm(w_deposit_lookup,"")
ls_depositcode = message.stringparm				

if ls_depositcode <> 'none' then

	SELECT dba.BRANCH.ID_BRANCH,   
			dba.BRANCH.ID_MAIN_BRANCH,   
			dba.DEPOSIT_CODES.ID_BANCO,   
			dba.DEPOSIT_CODES.ID_CUENTA_BANCO  
	 INTO :ls_idbranch,   
			:ls_idgroup,   
			:ls_idbanco,   
			:ls_idcuenta  
	 FROM dba.BRANCH,   
			dba.DEPOSIT_CODES  
	WHERE ( dba.DEPOSIT_CODES.ID_BRANCH = dba.BRANCH.ID_BRANCH ) and  
			( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) )   ;
	
	
	dw_1.setitem(dw_1.getrow(),"id_banco",ls_idbanco)
	dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_idcuenta)
	dw_1.setitem(dw_1.getrow(),"deposit_code",ls_depositcode)
	em_agent.text = ls_idbranch
	em_group.text = ls_idgroup
	
	dw_2.setitem(1,"id_group",ls_idgroup)
	
end if

end event

type st_4433 from statictext within w_pago_agente_by_closing_ref
integer x = 4283
integer y = 932
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Debit"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_pago_agente_by_closing_ref
integer x = 18
integer y = 344
integer width = 1915
integer height = 300
string dataobject = "dw_consignacion_group_agent_seleccionado"
boolean border = false
boolean livescroll = true
end type

event itemchanged;datetime ld_dateblocker
date ld_current

//if dwo.name = "date" then
//
//	select date_blocker
//	into :ld_dateblocker
//	from dba.acc_parameters;
//	if SQLCA.SQLCode <> 0 then
//		Messagebox("Error","Error checking Account Parameters, Block Date will not be checked!~n[Error: "+SQLCA.SQLErrText+"]",Stopsign!)
//		return 0
//	end if
//	
//	if not isnull(ld_dateblocker) then
//		
//		ld_current = date(left(data,10))		
//		if ld_current <= date(ld_dateblocker) then
//		
//		messagebox("Error","The date you are using was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
//		return 2
//		//0  (Default) Accept the data value
//		//1  Reject the data value and don't allow focus to change
//		//2  Reject the data value but allow the focus to change
//		end if
//	
//	end if
//end if


if dwo.name = "credit" then
	cb_procesar.TriggerEvent(Clicked!)
end if
end event

type cb_5 from commandbutton within w_pago_agente_by_closing_ref
integer x = 2094
integer y = 160
integer width = 699
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select Fax"
end type

event clicked;Openwithparm(w_faxcomponent_deposits,"Accounting")

fn_get_fax_deposits(message.stringparm)
end event

type sle_selectedfax from singlelineedit within w_pago_agente_by_closing_ref
integer x = 2094
integer y = 236
integer width = 594
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "[No Fax Selected]"
boolean autohscroll = false
boolean displayonly = true
end type

type cb_faxviewer from commandbutton within w_pago_agente_by_closing_ref
integer x = 2674
integer y = 236
integer width = 119
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "..."
end type

event clicked;if sle_selectedfax.text <> "[No Fax Selected]" then
	//OpenWithParm(w_faxviewer_view,sle_completefaxpath.text)
	OpenWithParm(w_faxcomponent_singlefaxviewer,sle_completefaxpath.text)
end if
end event

type sle_completefaxpath from singlelineedit within w_pago_agente_by_closing_ref
boolean visible = false
integer x = 3456
integer y = 188
integer width = 507
integer height = 68
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type em_sd from editmask within w_pago_agente_by_closing_ref
integer x = 2427
integer y = 560
integer width = 311
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
alignment alignment = right!
boolean displayonly = true
string mask = "[currency(7)]"
end type

type st_7 from statictext within w_pago_agente_by_closing_ref
integer x = 2089
integer y = 560
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Rem. Unapp. :"
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type em_total from editmask within w_pago_agente_by_closing_ref
integer x = 2427
integer y = 424
integer width = 311
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
alignment alignment = right!
boolean displayonly = true
string mask = "[currency(7)]"
end type

type st_8 from statictext within w_pago_agente_by_closing_ref
integer x = 2089
integer y = 356
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Prev. Unapp. :"
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type em_balance_match from editmask within w_pago_agente_by_closing_ref
integer x = 2427
integer y = 356
integer width = 311
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
alignment alignment = right!
boolean displayonly = true
string mask = "[currency(7)]"
end type

type cb_deposits from commandbutton within w_pago_agente_by_closing_ref
integer x = 27
integer y = 688
integer width = 421
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Deposits"
end type

event clicked;dw_deposits.visible = true
dw_choise.visible = false
end event

type cb_invoices from commandbutton within w_pago_agente_by_closing_ref
integer x = 448
integer y = 688
integer width = 421
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Invoices"
end type

event clicked;dw_deposits.visible = false
dw_choise.visible = true
end event

type dw_choise from datawindow within w_pago_agente_by_closing_ref
integer x = 27
integer y = 792
integer width = 2464
integer height = 1052
string dataobject = "dw_pago_agente_by_closing_ref"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;integer CurRow
boolean result

result = this.IsSelected(Row)

IF Row > 0 then
	
	IF result THEN
		this.SelectRow(Row, FALSE)
	ELSE
		this.SelectRow(Row, TRUE)
	END IF

	cb_procesar.TriggerEvent(Clicked!)
end if

end event

type dw_deposits from datawindow within w_pago_agente_by_closing_ref
integer x = 27
integer y = 792
integer width = 2464
integer height = 1052
string dataobject = "dw_rep_depositos_agencia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransOBject(SQLCA)
end event

