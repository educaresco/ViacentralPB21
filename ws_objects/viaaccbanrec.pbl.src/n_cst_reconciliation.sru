$PBExportHeader$n_cst_reconciliation.sru
forward
global type n_cst_reconciliation from nonvisualobject
end type
end forward

global type n_cst_reconciliation from nonvisualobject
end type
global n_cst_reconciliation n_cst_reconciliation

type variables
Private:
	String 	is_id_banco, is_id_cuenta_banco, is_des_trans_corta, is_des_trans_larga, is_formato_fecha_corta
	Decimal	idec_id_code_transaction, idec_total_amount_sys, idec_total_amount_banco
	Long		il_cons_trans_diaria  
end variables

forward prototypes
public subroutine of_set_id_banco (string as_id_banco)
public subroutine of_set_id_cuenta_banco (string as_id_cuenta_banco)
public subroutine of_set_id_code_transaction (decimal adec_id_code_transaction)
public subroutine of_set_cons_trans_diaria (long al_cons_trans_diaria)
public subroutine of_set_des_trans_corta (string as_des_trans_corta)
public subroutine of_set_des_trans_larga (string as_des_trans_larga)
public function integer of_update_conciliados (datetime adtm_date_transaction, string as_deposit_code, decimal adec_total_amount, string as_tipo_reconciliacion)
public subroutine of_set_total_amount_sys (decimal adec_total_amount_sys)
public subroutine of_set_total_amount_banco (decimal adec_total_amount_banco)
public function boolean of_insert_transaccion_diaria_banco_payee (datetime adtm_reconciliationdate, decimal adec_total_amount, string as_deposit_code)
public function integer of_update_flag ()
public function boolean of_mover_fecha_reconciliacion (datetime adtm_transaction_date)
public function integer of_con_historia_pagos (string as_id_banco, string as_cuenta_banco, datetime adtm_transaction_date, decimal adec_total_amount, string as_deposit_code)
public function boolean of_validar_ach (datetime adtm_reconciliation_ini, datetime adtm_reconciliation_fin, decimal adec_amount_archivo, datawindow adw_sistema, datawindow adw_banco)
public function integer n_cst_reconciliation (datawindow adw_sysdata, datawindow adw_sistema, datawindow adw_banco, hprogressbar ahpb_progreso)
public function integer of_depurar_transaccion (datawindow adw_sistema, datawindow adw_banco, long al_fila_sistema)
public function boolean of_sin_sistema_multiregistro (datawindow adw_banco, datawindow adw_sistema)
public function boolean of_sin_sistema (datawindow adw_banco, datawindow adw_sistema, integer ai_fila_banco)
end prototypes

public subroutine of_set_id_banco (string as_id_banco);is_id_banco= as_id_banco
end subroutine

public subroutine of_set_id_cuenta_banco (string as_id_cuenta_banco);is_id_cuenta_banco= as_id_cuenta_banco
end subroutine

public subroutine of_set_id_code_transaction (decimal adec_id_code_transaction);idec_id_code_transaction= adec_id_code_transaction
end subroutine

public subroutine of_set_cons_trans_diaria (long al_cons_trans_diaria);il_cons_trans_diaria= al_cons_trans_diaria
end subroutine

public subroutine of_set_des_trans_corta (string as_des_trans_corta);is_des_trans_corta= as_des_trans_corta
end subroutine

public subroutine of_set_des_trans_larga (string as_des_trans_larga);is_des_trans_larga= as_des_trans_larga
end subroutine

public function integer of_update_conciliados (datetime adtm_date_transaction, string as_deposit_code, decimal adec_total_amount, string as_tipo_reconciliacion);IF IsNull(as_deposit_code) THEN as_deposit_code='0'

IF as_tipo_reconciliacion="B" THEN //Coinciden Nit y fecha
	/*Como el registro del banco es el que prima, se debe crear un registro inverso(negativo) para el del sistema; esto pues,
	en caso de que se haya seleccionado un registro para banco y uno para sistema. Se supone que el valor del banco es diferente
	al del sistema, entonces se ingresa un nuevo registro en el sistema igual al del banco
	Ej:				
					BANCO																	SISTEMA
	DEPOSITO			COD.DEPOSITO		FECHA					DEPOSITO			COD.DEPOSITO		FECHA
	100				654				05/05/2008				99					654				05/05/2008
	
	Luego debería quedar la base de datos de esta manera:
																		99					654				05/05/2008
																		-99				654				05/05/2008
	100				654				05/05/2008				100				654				05/05/2008
	*/
	
	//Ingresa registro negativo
	IF NOT of_insert_transaccion_diaria_banco_payee(adtm_date_transaction, idec_total_amount_sys * -1 , as_deposit_code) THEN 
		RollBack;
		RETURN -1
	END IF
	//Ingresa registro del banco
	IF NOT of_insert_transaccion_diaria_banco_payee(adtm_date_transaction, adec_total_amount, as_deposit_code) THEN 
		RollBack;
		RETURN -1
	END IF
	
END IF

	//Se actualiza el registro conciliado del banco para que no vuelva a ser procesado.
  UPDATE dba.BANK_STATEMENT  
     SET FLAG_RECONCILIATION 	= 'S',
	  		CONS_TRANS_DIARIA		= :il_cons_trans_diaria
   WHERE ( dba.BANK_STATEMENT.TOTAL_AMOUNT 				= :adec_total_amount ) AND
			( IsNull(dba.BANK_STATEMENT.DEPOSIT_CODE,0) 	= :as_deposit_code OR
			  IsNull(dba.BANK_STATEMENT.DEPOSIT_CODE,0) 	= '0'+ :as_deposit_code ) AND  
			( dba.BANK_STATEMENT.ID_CODE_TRANSACTION 		= :idec_id_code_transaction ) AND  
         ( dba.BANK_STATEMENT.DATE_TRANSACTION 			= :adtm_date_transaction ) AND           
         ( dba.BANK_STATEMENT.ID_CUENTA_BANCO 			= :is_id_cuenta_banco ) AND  
			( dba.BANK_STATEMENT.ID_BANCO 					= :is_id_banco )   ;

			
CHOOSE CASE SQLCA.SQLCode
	CASE 0
		//El siguiente update solo aplica para registros que no sean coIncidentes por CÓDIGO DEPOSITO-Fecha y Sin sistema
		IF as_tipo_reconciliacion<>"B" AND as_tipo_reconciliacion<>"SS" THEN
			UPDATE dba.transaccion_diaria_payee
			SET	FLAG_RECONCILIATION = 'S'
			WHERE CONS_TRANS_DIARIA = :il_cons_trans_diaria;
			
			CHOOSE CASE SQLCA.SQLCode
				CASE 0
					Return 1
				CASE 100
					MessageBox("Error", "No se encontró el registro para conciliar: "&
									+"Código Transacción diaria: "+String(il_cons_trans_diaria),StopSign!)
					RollBack;
					Return 0
				CASE -1
					MessageBox("Error", SQLCA.SqlErrText, StopSign!)
					RollBack;
					Return -1
			END CHOOSE
		ELSE
			RETURN 1
		END IF
	CASE 100
		MessageBox("Error", "No se encontró el registro para conciliar: "&
						+"Código Transacción: "+String(idec_id_code_transaction)&
						+"~rFecha: "+String(adtm_date_transaction)&
						+"~rCódigo Depósito: "+as_deposit_code &
						+"~rValor depósito: "+String(adec_total_amount), StopSign!)
		RollBack;
		Return 0
	CASE -1
		MessageBox("Error", SQLCA.SqlErrText, StopSign!)
		RollBack;
		Return -1
END CHOOSE
end function

public subroutine of_set_total_amount_sys (decimal adec_total_amount_sys);idec_total_amount_sys= adec_total_amount_sys
end subroutine

public subroutine of_set_total_amount_banco (decimal adec_total_amount_banco);idec_total_amount_banco= adec_total_amount_banco
end subroutine

public function boolean of_insert_transaccion_diaria_banco_payee (datetime adtm_reconciliationdate, decimal adec_total_amount, string as_deposit_code);Long		ll_cons_trans_diaria
String 	ls_idbranch,  ls_idgroup, ls_concepto_contable, ls_transaccion_corta
DateTime	ldtm_reconciliationdate
Decimal 	ldec_debito, ldec_credito
STRING ls_mensaje

IF IsNull(as_deposit_code) THEN as_deposit_code='0'

IF adec_total_amount<0 THEN
	ls_transaccion_corta= "REVERSIÓN TRANSACCIÓN "+ String(il_cons_trans_diaria)
ELSE
	ls_transaccion_corta= is_des_trans_corta
END IF
	
/*******Busca el máximo consecutivo de transacción diaria*********************************************************/
SELECT	MAX(CONS_TRANS_DIARIA) + 1
INTO		:ll_cons_trans_diaria
FROM		dba.TRANSACCION_DIARIA_PAYEE;

IF SQLca.SQLcode = -1 THEN
    MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación...')
	ROLLBACK;
    RETURN FALSE
END IF

il_cons_trans_diaria= ll_cons_trans_diaria
/*******************************************************************************************************************/

/*Busca el grupo para el código de deposito*************************************************************************/
SELECT dba.BRANCH.ID_BRANCH,   
		dba.BRANCH.ID_MAIN_BRANCH
 INTO :ls_idbranch,   
		:ls_idgroup 
 FROM dba.BRANCH,   
		dba.DEPOSIT_CODES  
WHERE dba.DEPOSIT_CODES.ID_BRANCH 		= dba.BRANCH.ID_BRANCH  and  
		/*dba.DEPOSIT_CODES.ID_BANCO			= :is_id_banco AND   			//Puede que no sea necesaria esta línea
		dba.DEPOSIT_CODES.ID_CUENTA_BANCO= :is_id_cuenta_banco AND	//Puede que no sea necesaria esta línea
		*/(IsNull(dba.DEPOSIT_CODES.DEPOSIT_CODE,'0') 	= '0'+:as_deposit_code OR
		IsNull(dba.DEPOSIT_CODES.DEPOSIT_CODE,'0') 	= :as_deposit_code);

IF SQLca.SQLcode = -1 THEN
    MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación.')
	ROLLBACK;
    RETURN FALSE	 
ElSEIF SQLca.SQLcode = 100 THEN // No existe
	ls_mensaje = "Banco: "+is_id_banco+"~rCuenta banco: "+is_id_cuenta_banco+"~rCódigo depósito: "+as_deposit_code
	MESSAGEBOX('Advertencia!', 'No es posible identificar el código depósito asignado al grupo... '+ls_mensaje)
	ROLLBACK;
    RETURN FALSE
END IF
/*******************************************************************************************************************/

// validación para determinar si existe un registro por el mismo valor en los últimos 30 días
LONG ll_count
DATETIME ldtm_fecha_ini, ldtm_fecha_fin

ldtm_fecha_ini = DateTime (RelativeDate (Date (adtm_reconciliationdate), -30))
ldtm_fecha_fin = DateTime (today(), Time ('23:59:59'))

// Se valida por un periodo de 30 días que no halla un registro para el mismo grupo
  SELECT Count (*)  
    INTO :ll_count  
    FROM dba.TRANSACCION_DIARIA_PAYEE  
   WHERE ( dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA = :ls_idgroup ) AND  
         ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'CPC' ) AND  
         ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'PB' ) AND  
         ( dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA = :adec_total_amount ) AND  
         ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA between :ldtm_fecha_ini AND :ldtm_fecha_fin )   ;

IF SQLca.SQLcode = -1 THEN
    MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación...')
	ROLLBACK;
    RETURN FALSE
END IF

IF ll_count > 0 THEN
	// se notifica al usuario permitiendo cancelar la operación
	IF MessageBox ("Atención!", "Existe un registro por el mismo valor en los últimos 30 días... Favor verificar... Desea continuar con la operación?", Question!, OKCancel!, 2) = 2 THEN
		ROLLBACK;
		RETURN FALSE
	END IF
END IF

/*******************************************************************************************************************/


/*Busca el código de concepto contable para la transacción**********************************************************/
SELECT 	dba.CONCEPTO_CONTABLE.ID_CONCEPTO_CONTABLE
INTO		:ls_concepto_contable
FROM 		dba.CONCEPTO_CONTABLE,
			dba.BANK_TRANSACTIONS
WHERE 	dba.CONCEPTO_CONTABLE.ID_CONCEPTO_CONTABLE= dba.BANK_TRANSACTIONS.ID_CONCEPTO_CONTABLE AND
			dba.BANK_TRANSACTIONS.ID_CODE_TRANSACTION	= :idec_id_code_transaction AND
			dba.BANK_TRANSACTIONS.ID_BANCO 				= :is_id_banco ;
			
IF SQLca.SQLcode = -1 THEN
    MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación.')
	ROLLBACK;
    RETURN FALSE	 
ElSEIF SQLca.SQLcode = 100 THEN // No existe
	ls_mensaje = "Banco: "+is_id_banco+"~rCódigo transaction: "+String(idec_id_code_transaction)
	MESSAGEBOX('Advertencia!', 'No es posible identificar el código depósito asignado al grupo... '+ls_mensaje)
	ROLLBACK;
    RETURN FALSE
END IF

CHOOSE CASE idec_id_code_transaction
	CASE 301
		ldec_debito	= 0
		ldec_credito= adec_total_amount
	CASE ELSE
		ldec_debito	= 0
		ldec_credito= 0
END CHOOSE


/*******************************************************************************************************************/


/*Ingresa un registro en TRANSACCION_DIARIA_PAYEE*******************************************************************/
  INSERT INTO dba.TRANSACCION_DIARIA_PAYEE  
         ( CONS_TRANS_DIARIA,   
           ID_GROUP_TRANS_DIARIA,   
           DATE_TRANS_DIARIA,   
           HOUR_TRANS_DIARIA,   
           ID_CONCEPTO_CONTABLE,   
           DES_TRANS_DIARIA,   
           DEBIT_TRANS_DIARIA,   
           CREDIT_TRANS_DIARIA,   
           BALANCE_TRANS_DIARIA,   
           DESCRIPCION_SUSPENSE,   
           LINK_REFERENCE,   
           DESC_TRANS_DIARIA1,   
           DATE_SYSTEM,   
           ID_CASHIER,   
           TOTAL_AMOUNT,   
           BNKID,   
           NUM_WIRETRANSFER,   
           WIRE_AMT_REFERENCED,   
           FLAG_RECONCILIATION )  
  VALUES ( :ll_cons_trans_diaria,   
           :ls_idgroup,   
           getdate(),   
           getdate(),   
           :ls_concepto_contable,   
           :ls_transaccion_corta,   
           :ldec_debito,   
           :ldec_credito,   
           0,   
           NULL,   
           NULL,   
           :is_des_trans_larga,   
            getdate(),   
           :gs_cashier,   
           NULL,   
           NULL,   
           NULL,   
           NULL,   
           'S' )  ;
			  
IF SQLca.SQLcode = -1 THEN
    MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación...')
	ROLLBACK;
    RETURN FALSE
END IF

/*Ingresa un registro en TRANSACCION_DIARIA_BANCO_PAYEE************************************************************/
	INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE
				  (CONS_TRANS_DIARIA,
				  ID_BANCO,
				  ID_CUENTA_BANCO,
				  DEPOSIT_CODE,
				  RECONCILIATIONDATE,
				  DATE_TRANS_DIARIA,
				  EXCHANGE_RATE,
				  ISUSEDFORSTOCK)
		  VALUES
				  (:ll_cons_trans_diaria,
				  :is_id_banco,
				  :is_id_cuenta_banco,
				  :as_deposit_code,
				  :adtm_reconciliationdate,
				  getdate(),
				  null,
				  null);	

IF SQLca.SQLcode = -1 THEN
    MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación...')
	ROLLBACK;
    RETURN FALSE
END IF

Return True
end function

public function integer of_update_flag ();UPDATE dba.transaccion_diaria_payee
SET	FLAG_RECONCILIATION = 'S'
WHERE CONS_TRANS_DIARIA = :il_cons_trans_diaria;

CHOOSE CASE SQLCA.SQLCode
	CASE 0
		Return 1
	CASE 100
		MessageBox("Error", "No se encontró el registro para conciliar: "&
						+"Código Transacción diaria: "+String(il_cons_trans_diaria),StopSign!)
		RollBack;
		Return 0
	CASE -1
		MessageBox("Error", SQLCA.SqlErrText, StopSign!)
		RollBack;
		Return -1
END CHOOSE
end function

public function boolean of_mover_fecha_reconciliacion (datetime adtm_transaction_date);DateTime 	ldtm_fecha_transaccion//ldt_nueva_fecha
String 		ls_fecha

// Para el procesamiento masivo de múltiples registros no es
// conveniente mostrar la ventana de fecha próxima por cada registro
//ls_fecha = String(adtm_transaction_date, is_formato_fecha_corta)
//Openwithparm(w_sel_fecha_reconciliacion, ls_fecha)
//ls_fecha= Message.StringParm

SELECT	dba.sfGetNextBusinessDay(:adtm_transaction_date)
INTO		:ldtm_fecha_transaccion
FROM		dba.DUAL;

// Validación SQl simple
IF SQLca.SQLcode = -1 THEN
    MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación...')
    RETURN FALSE
END IF

// el procesamiento de ls_fecha es con un formato 'mm/dd/yyyy'
ls_fecha = String(ldtm_fecha_transaccion, 'mm/dd/yyyy')

IF ls_fecha='' or IsNull(ls_fecha) THEN
	Return False
ELSE
	TRY
		//ldt_nueva_fecha= DateTime(Date(ls_fecha))
	
		UPDATE 	dba.transaccion_diaria_banco_payee
		SET 		reconciliationdate= CONVERT(Datetime,:ls_fecha,101)
		WHERE		cons_trans_diaria= :il_cons_trans_diaria;
		
	THROW CREATE c_sqlexception
	CATCH (c_sqlexception sql)
		IF NOT sql.exception() THEN
			MessageBox("Error BD", sql.getmessage(), StopSign! )
			RollBack;
			Return FALSE
		END IF
	CATCH (Exception ex)
		ex.classname()
		MessageBox(ex.classname(), ex.getMessage(),StopSign!)
		RETURN FALSE
	END TRY	
	
END IF


RETURN TRUE
end function

public function integer of_con_historia_pagos (string as_id_banco, string as_cuenta_banco, datetime adtm_transaction_date, decimal adec_total_amount, string as_deposit_code);Integer li_record_found

DECLARE lcur_historia_pagos CURSOR FOR

 SELECT 	1
    FROM dba.TRANSACCION_DIARIA_PAYEE				DIARIA,   
         dba.TRANSACCION_DIARIA_BANCO_PAYEE 		BANCO,
			dba.BANK_TRANSACTIONS						BT
   WHERE ( DIARIA.CONS_TRANS_DIARIA 		= BANCO.CONS_TRANS_DIARIA ) and  
			( DIARIA.ID_CONCEPTO_CONTABLE 	= BT.ID_CONCEPTO_CONTABLE) AND
			( BANCO.DEPOSIT_CODE					= '0'+ :as_deposit_code OR 
			  BANCO.DEPOSIT_CODE					= :as_deposit_code  	) AND
			( BANCO.ID_BANCO 						= :as_id_banco ) AND  
         ( BANCO.ID_CUENTA_BANCO 			= :as_cuenta_banco ) AND  
         ( BANCO.RECONCILIATIONDATE 		< :adtm_transaction_date ) AND
			( BT.ID_BANCO							= BANCO.ID_BANCO ) AND
			( BT.id_code_transaction			= :idec_id_code_transaction )	/*AND
		  	( DIARIA.FLAG_RECONCILIATION	<> 'N' ) 	*/;
		  
OPEN lcur_historia_pagos;	
FETCH	lcur_historia_pagos INTO :li_record_found;


CHOOSE CASE SQLCA.SQLCode
	CASE 0
		//Se encontró un registro entonces indica que alguna vez se hizo un pago para este banco en esa cuenta
		Close lcur_historia_pagos;	
		Return 1
	CASE 100
		//No se halló nada, entonces se aplicará otro metódo de reconciliación.
		Close lcur_historia_pagos;	
		Return 0
	CASE -1
		MessageBox("Error",SQLCA.SQLErrText)
		Close lcur_historia_pagos;	
		Return -1
END CHOOSE
end function

public function boolean of_validar_ach (datetime adtm_reconciliation_ini, datetime adtm_reconciliation_fin, decimal adec_amount_archivo, datawindow adw_sistema, datawindow adw_banco);Decimal{2} ldec_amount, ldec_amount_banco
DateTime		ldtm_fecha
Integer		li_fila_find
long			ll_batch_id
String		ls_id_main_branch, ls_deposit_code


TRY
	SELECT  	Round(Sum(BDB.AMOUNT),2,1)
	INTO		:ldec_amount
	  FROM	dba.ACH_BATCH_DETAIL_BRANCH	BDB,
				dba.ACH_BATCH	 					B
	WHERE		BDB.FLAG_RECONCILIATION = 'N' AND
				BDB.BATCH_ID 				= B.BATCH_ID AND
				B.PREPARATION_DATE 		<= dba.sfGetPrevBusinessDay(:adtm_reconciliation_fin) AND
				B.PREPARATION_DATE 		>= dba.sfGetPrevBusinessDay(:adtm_reconciliation_ini) AND
				B.ID_CUENTA_BANCO 		= :is_id_cuenta_banco AND
				B.id_banco 					= :is_id_banco;


THROW CREATE c_sqlexception
CATCH (c_sqlexception sql)
	sql.of_set_condicion("No se encontró la cantidad total de ACH para la siguiente condición:~r"&
								+"Fecha de preparación: "+String(Date(adtm_reconciliation_fin), "MM/DD/YYYY")+"~r"&
								+"Banco: "+is_id_cuenta_banco+"~r"&
								+"Cuenta Banco: "+is_id_cuenta_banco)
	IF NOT sql.exception() THEN
		MessageBox("Error BD", sql.getmessage(), StopSign! )
		RollBack;
		Return FALSE
	END IF
CATCH (Exception ex)
	ex.classname()
	MessageBox(ex.classname(), ex.getMessage(),StopSign!)
	RETURN FALSE
END TRY

IF IsNull(ldec_amount) THEN
	MessageBox("Información","No existe en el sistema un registro similar al del banco.")
	Return False
END IF

li_fila_find= adw_banco.Find("Truncate(total_amount,2)= Truncate(Dec('" +String(ldec_amount)+"'),2)", 1, adw_banco.RowCount())
If li_fila_find=0 THEN
	li_fila_find= adw_banco.Find("Truncate(total_amount,2) = Truncate(Dec('" +String(ldec_amount + 0.01 )+"'),2)", 1, adw_banco.RowCount())
END IF
IF li_fila_find=0 THEN
	li_fila_find= adw_banco.Find("Truncate(total_amount,2) = Truncate(Dec('" +String(ldec_amount - 0.01 )+"'),2)", 1, adw_banco.RowCount())
END IF
If li_fila_find>0 THEN

	ldec_amount_banco= adw_banco.GetItemNumber(li_fila_find, "total_amount")
	
		adw_sistema.InsertRow(0)
		adw_sistema.SetItem(1, "reconciliationdate",adtm_reconciliation_ini )
		adw_sistema.SetItem(1, "deposit_code","")
		adw_sistema.SetItem(1, "des_trans_diaria","TRANSACCIÓN ACH")
		adw_sistema.SetItem(1, "total_amount", ldec_amount)				
		adw_sistema.SetItem(1, "flag_sugerencia","")								
		adw_sistema.SetItem(1, "flag_reconciliation","S")
		adw_sistema.SetItem(1, "c_num_registro", 1)
		
		adw_banco.SetItem(li_fila_find, "flag_reconciliation","S")
		adw_banco.SetItem(li_fila_find, "flag_sugerencia","")
		adw_banco.SetItem(li_fila_find, "c_num_registro", 1)
		
		adw_banco.SetSort("c_num_registro desc")
		adw_banco.Sort()
		
		
		DECLARE lcur_ach CURSOR FOR
			SELECT  	BDB.batch_id,
						BDB.id_main_branch
			  FROM	dba.ACH_BATCH_DETAIL_BRANCH	BDB,
						dba.ACH_BATCH	 					B
			WHERE		BDB.FLAG_RECONCILIATION = 'N' AND
						BDB.BATCH_ID 				= B.BATCH_ID AND
						B.PREPARATION_DATE 		<= dba.sfGetPrevBusinessDay(:adtm_reconciliation_fin) AND
						B.PREPARATION_DATE 		>= dba.sfGetPrevBusinessDay(:adtm_reconciliation_ini) AND
						B.ID_CUENTA_BANCO 		= :is_id_cuenta_banco AND
						B.id_banco 					= :is_id_banco;
						
		OPEN lcur_ach;
		FETCH lcur_ach into :ll_batch_id, :ls_id_main_branch;
		
		DO WHILE SQLCA.SQLCode=0
			TRY
				UPDATE 	dba.ACH_BATCH_DETAIL_BRANCH
				SET		FLAG_RECONCILIATION= 'S'
				WHERE		batch_id			= :ll_batch_id AND
							id_main_branch	= :ls_id_main_branch;
						
		
				THROW CREATE c_sqlexception
				CATCH (c_sqlexception sql1)
					sql.of_set_condicion("No se encontró el registro ACH para reconciliar:~r"&
												+"Batch Id: "+String(ll_batch_id)+"~r"&
												+"Main Branch: "+ls_id_main_branch)
					IF NOT sql1.exception() THEN
						MessageBox("Error BD", sql1.getmessage(), StopSign! )
						RollBack;
						CLOSE lcur_ach;
						Return FALSE
					END IF
				CATCH (Exception ex1)
					ex1.classname()
					MessageBox(ex1.classname(), ex1.getMessage(),StopSign!)
					CLOSE lcur_ach;
					RETURN FALSE
			END TRY
			
			FETCH lcur_ach into :ll_batch_id, :ls_id_main_branch;
		LOOP
		
		ldtm_fecha		= adw_banco.GetItemDateTime(li_fila_find, "date_transaction")
		ls_deposit_code= adw_banco.GetItemString(li_fila_find, "deposit_code")

		CLOSE lcur_ach;
		//Envía como parámetro SS para que no se meta en el IF de la función
		IF THIS.of_update_conciliados( ldtm_fecha, ls_deposit_code, ldec_amount_banco, "SS")<>1 THEN
			RETURN FALSE
		END IF
ELSE
	MessageBox("Error", "El valor ACH del archivo del Banco es diferente al existente en el sistema:~r"&
					+"Banco  : "+String(adec_amount_archivo, "#,##0.00")+"~r"&
					+"Sistema: "+String(ldec_amount, "#,##0.00") ,StopSign!)
	Return False
END IF
	

RETURN TRUE
end function

public function integer n_cst_reconciliation (datawindow adw_sysdata, datawindow adw_sistema, datawindow adw_banco, hprogressbar ahpb_progreso);//'S'Conciliados
//'H'Con historia de pagos
//'G'sin historia de pagos
//'B', Coinciden en NIT y Fecha

Integer 		li_i, li_fila_find, li_con_historia, li_fila_insert, li_total_filas_banco, li_total_filas_sistema, li_steps
DateTime 	ldtm_transaction_date
String		ls_deposit_code, ls_nulo, ls_id_branch, ls_des_trans_diaria
Decimal{2}	ldec_total_amount
Decimal{1}	ldec_steps
Long			ll_num_registro_banco, ll_regs_borrar_banco[], ll_regs_borrar_sis[], ll_cons_trans_diaria
STRING ls_deposit_agencia
STRING ls_find
STRING ls_id_banco, ls_additional1

SetPointer(HourGlass!)

Setnull(ls_nulo)

w_reconcilicacion_bancaria.st_mensaje.Text='Procesando conciliados y con/sin historia de pagos.'

// se implementa la visualización del progreso en el objeto ahpb_progreso
IF adw_banco.RowCount()> 0 THEN
	ahpb_progreso.Position=0
	IF adw_banco.RowCount()<=100 THEN
		ldec_steps= 100 / adw_banco.RowCount()
		ahpb_progreso.setstep= ldec_steps
	ELSE
		ldec_steps= Round(adw_banco.RowCount()/100,0)
		ahpb_progreso.setstep= 1
	END IF
END IF


//se lee cada registro que llega del banco y busca su similar en el sistema para poder emparejarlos
FOR li_i=1 TO  adw_banco.RowCount()
	// se inicializa la visualización del objeto que muestra el progreso
	IF Mod(li_i,ldec_steps)=0 THEN
		ahpb_progreso.StepIt ( )
	END IF
	
	// se cargan las variables con la información del banco
	ldtm_transaction_date= adw_banco.GetItemDateTime(li_i, "date_transaction")
	ls_deposit_code		= adw_banco.GetItemString(li_i, "deposit_code")
	ldec_total_amount		= adw_banco.GetItemDecimal(li_i, "total_amount")
	
	// se marca el registro de banco con un consecutivo
	adw_banco.SetItem(li_i, "c_num_registro" ,li_i)
	
	//Puede ocurrir que el archivo del banco el código de depósito venga en cero y en la base de datos en nulo, así que con las
	//siguientes validaciones se subsana esto.
	If ls_deposit_code='0' OR IsNull(ls_deposit_code) THEN
		
		li_fila_find= adw_sysdata.Find("Date(reconciliationdate)=Date('"+String(ldtm_transaction_date, is_formato_fecha_corta)+ "') AND "+&
												"IsNull(deposit_code) AND " +&
												"Truncate(total_amount,2)=Truncate(Dec('" +String(ldec_total_amount)+"'),2) AND "+&
												"c_num_registro=0", 1, adw_sysdata.RowCount())
		IF li_fila_find=0 then
			li_fila_find= adw_sysdata.Find("Date(reconciliationdate)=Date('"+String(ldtm_transaction_date, is_formato_fecha_corta)+ "') AND "+&
													"deposit_code='0' AND " +&
													"Truncate(total_amount,2)=Truncate(Dec('" +String(ldec_total_amount)+"'),2) AND "+&
													"c_num_registro=0", 1, adw_sysdata.RowCount())
		END IF
	ELSE // se valida la correspondencia de registros (fecha, valor, código agencia)
		ls_id_banco = adw_banco.GetItemString (li_i, 'id_banco')
		
		// en el caso del banco Of. America se debe consultar con ADDITIONAL1
		// el cual contiene el código de la agencia
		IF Trim (ls_id_banco) = 'B OF A' THEN
			ls_additional1 = adw_banco.GetItemString (li_i, 'additional1')
			
			// para validar la agencia se toma los 4 últimos dígitos del 
			// código depósito (banco) y código agencia (sistema)
			ls_deposit_agencia = MID (TRIM(ls_additional1), LEN(TRIM(ls_additional1)) - 3)
		ELSE
			// para validar la agencia se toma los 4 últimos dígitos del 
			// código depósito (banco) y código agencia (sistema)
			ls_deposit_agencia = MID (TRIM(ls_deposit_code), LEN(TRIM(ls_deposit_code)) - 3)
		END IF
		
		ls_find = "Date(reconciliationdate)=Date('"+String(ldtm_transaction_date, is_formato_fecha_corta)+ "') AND "+&
												"Mid(TRIM(id_branch), LEN(TRIM(id_branch)) - 3)='"+ ls_deposit_agencia + "' AND Truncate(total_amount,2)=Truncate(Dec('" +String(ldec_total_amount)+"'),2) AND "+&
												"c_num_registro=0"
		
		li_fila_find= adw_sysdata.Find (ls_find, 1, adw_sysdata.RowCount())
												
	END IF

	//Si encuentra un registro coincidente entonces lo marca con el mismo número de fila de donde se encuentra el 
	//original(del banco) en el datawindow (adw_banco)
	CHOOSE CASE li_fila_find
		CASE IS > 0
			adw_sysdata.SetItem(li_fila_find, "c_num_registro" ,li_i)
			adw_sysdata.SetItem(li_fila_find, "flag_reconciliation" ,"S")//'S'Conciliados
			adw_banco.SetItem(li_i, "flag_reconciliation" ,"S")
			
			il_cons_trans_diaria= adw_sysdata.GetItemNumber(li_fila_find, "cons_trans_diaria")
			
			IF of_update_conciliados( ldtm_transaction_date, ls_deposit_code, ldec_total_amount, "S")<>1 THEN
				Return -1
			END IF
			
		CASE -1
			MessageBox("Error", "General error",StopSign!)
			return -1
		CASE -5
			MessageBox("Error", "Bad argument",StopSign!)
			return -1
		CASE 0 
			/*Cuando no existe un registro del banco para conciliar con el sistema, existen otras validaciones que se tienen
			a continuación*/
			
			/*******(A) Con historia de pagos**************************/
			IF ls_deposit_code='0'  OR IsNull(ls_deposit_code) THEN //Indica que el archivo del banco vino sin código de deposito
				li_fila_find= adw_sysdata.Find("Date(reconciliationdate)=Date('"+String(ldtm_transaction_date, is_formato_fecha_corta)+ "') AND "+&
								"Truncate(total_amount,2)=Truncate(Dec('" +String(ldec_total_amount)+"'),2) AND "+&
								"c_num_registro=0", 1, adw_sysdata.RowCount())
				IF li_fila_find>0 THEN
					
					ls_deposit_code= adw_sysdata.GetItemString(li_fila_find, "deposit_code")
					
					li_con_historia= of_con_historia_pagos(is_id_banco, is_id_cuenta_banco, ldtm_transaction_date,ldec_total_amount , ls_deposit_code)
					CHOOSE CASE li_con_historia
						CASE 0
							adw_sysdata.SetItem(li_fila_find, "c_num_registro" ,li_i)
							adw_sysdata.SetItem(li_fila_find, "flag_sugerencia" ,"G")//'G'sin historia de pagos
							adw_banco.SetItem(li_i, "flag_sugerencia" ,"G")
							
							adw_banco.SetItem(li_i, "flag_reconciliation" ,"G")
							adw_sysdata.SetItem(li_fila_find, "flag_reconciliation" ,"G")
						CASE 1
							adw_sysdata.SetItem(li_fila_find, "c_num_registro" ,li_i)
							adw_sysdata.SetItem(li_fila_find, "flag_sugerencia" ,"H")//'H'Con historia de pagos
							adw_banco.SetItem(li_i, "flag_sugerencia" ,"H")
							
							
							adw_banco.SetItem(li_i, "flag_reconciliation" ,"H")
							adw_sysdata.SetItem(li_fila_find, "flag_reconciliation" ,"H")
						CASE -1
							return -1
					END CHOOSE
					Continue
				ELSE
					li_fila_insert= adw_sysdata.InsertRow(0)
					adw_sysdata.SetItem(li_fila_insert, "c_num_registro" ,li_i)
					adw_sysdata.SetItem(li_fila_insert, "flag_reconciliation" ,"?")
				END IF
			ELSE
				/*********Existe en el banco pero no en el sistema*********************************************************/
				li_fila_insert= adw_sysdata.InsertRow(0)
				adw_sysdata.SetItem(li_fila_insert, "c_num_registro" ,li_i)
				adw_sysdata.SetItem(li_fila_insert, "flag_reconciliation" ,"?")
			END IF
	END CHOOSE
NEXT


adw_sysdata.SetFilter("c_num_registro <> 0")
adw_sysdata.Filter()

IF adw_sysdata.RowCount()> 0 THEN
	adw_sysdata.RowsMove ( 1, adw_sysdata.RowCount(), Primary!, adw_sistema, 1  , Primary! )
	adw_sistema.SetSort("c_num_registro asc")
	adw_sistema.Sort()
END IF 

adw_sysdata.SetFilter("c_num_registro = 0")
adw_sysdata.Filter()


/***************INSERT DE LOS REGISTROS QUE QUEDARON EN EL SISTEMA Y NO ESTÁN EN EL BANCO**************************/
li_total_filas_banco		= adw_banco.RowCount()
li_total_filas_sistema	= adw_sysdata.RowCount()

ahpb_progreso.Position=0

IF adw_sysdata.RowCount()>0 THEN
	IF adw_sysdata.RowCount()<=100 THEN
		ldec_steps= 100 / adw_sysdata.RowCount()
		ahpb_progreso.setstep= ldec_steps
	ELSE
		ldec_steps= Round(adw_sysdata.RowCount()/100,0)
		ahpb_progreso.setstep= 1
	END IF
END IF


w_reconcilicacion_bancaria.st_mensaje.Text='Procesando registros del sistema que no están en el banco.'
adw_sysdata.SetSort("total_amount asc")
adw_sysdata.Sort()
FOR li_i=1 TO  li_total_filas_sistema	
	IF Mod(li_i,ldec_steps)=0 THEN
		ahpb_progreso.StepIt ( )
	END IF

	li_fila_insert= adw_banco.InsertRow(0)
	li_total_filas_banco++
	adw_banco.SetItem(li_fila_insert, "c_num_registro" ,li_total_filas_banco)
	adw_banco.SetItem(li_fila_insert, "flag_reconciliation" ,"?")
	adw_sysdata.SetItem(li_i, "c_num_registro" ,li_total_filas_banco)
NEXT

IF adw_sysdata.RowCount()> 0 THEN
	adw_sysdata.RowsMove ( 1, adw_sysdata.RowCount(), Primary!, adw_sistema, 1  , Primary! )
	adw_sistema.SetSort("c_num_registro asc")
	adw_sistema.Sort()
END IF 
ahpb_progreso.Position=0
/******************************************************************************************************************/


/******CON LOS REGISTROS RESTANTES, SE HARÁ MATCH ENTRE AQUELLOS DEL BANCO QUE TENGAN FECHA Y VALORES IGUALES EN 
LOS DEL SISTEMA, PERO QUE NO SE REPITAN MAS DE UNA VEZ*************************************************************/
li_total_filas_banco	= adw_banco.RowCount()

ahpb_progreso.Position=0
IF li_total_filas_banco>0 THEN
	IF li_total_filas_banco<=100 THEN
		ldec_steps= 100 / li_total_filas_banco
		ahpb_progreso.setstep= ldec_steps
	ELSE
		ldec_steps= Round(li_total_filas_banco/100,0)
		ahpb_progreso.setstep= 1
	END IF
END IF
w_reconcilicacion_bancaria.st_mensaje.Text='Procesando coincidentes solamente en valor y fecha.'


FOR li_i=1 TO li_total_filas_banco
	IF Mod(li_i,ldec_steps)=0 THEN
		ahpb_progreso.StepIt ( )
	END IF
	IF adw_banco.GetItemString(li_i,"flag_reconciliation")<>'N' THEN CONTINUE
	
	ldtm_transaction_date= adw_banco.GetItemDateTime(li_i, "date_transaction")
	ldec_total_amount		= adw_banco.GetItemDecimal(li_i, "total_amount")
	ll_num_registro_banco= adw_banco.GetItemDecimal(li_i, "c_num_registro")
	ls_deposit_code		= adw_banco.GetItemString(li_i, "deposit_code")
	
	//Busca la existencia de un solo registro que aplique para las variables anteriores.Si encuentra mas de un registro
	//no lo puede marcar como: Coincide con Valor y fecha.
	li_fila_find= adw_sistema.Find("Date(reconciliationdate)=Date('"+String(ldtm_transaction_date, is_formato_fecha_corta)+ "') AND "+&
										"Truncate(total_amount,2)=Truncate(Dec('" +String(ldec_total_amount)+"'),2) AND flag_reconciliation='N'", 1, adw_sistema.RowCount())

	//Si encuentra un registro vuelve a buscar para saber si lo descarta o lo marca
	IF li_fila_find >0  THEN
		IF adw_sistema.Find("Date(reconciliationdate)=Date('"+String(ldtm_transaction_date, is_formato_fecha_corta)+ "') AND "+&
							"Truncate(total_amount,2)=Truncate(Dec('" +String(ldec_total_amount)+"'),2) AND flag_reconciliation='N'" &
							, li_fila_find + 1, adw_sistema.RowCount())>0 AND &
			li_fila_find +1 <= adw_sistema.RowCount() THEN
			CONTINUE
		ELSE
			ldtm_transaction_date= adw_sistema.GetItemDateTime(li_fila_find, "reconciliationdate")
			ldec_total_amount		= adw_sistema.GetItemDecimal(li_fila_find, "total_amount")
			ls_deposit_code		= adw_sistema.GetItemString(li_fila_find, "deposit_code")
			ls_id_branch			= adw_sistema.GetItemString(li_fila_find, "id_branch")
			ll_cons_trans_diaria	= adw_sistema.GetItemNumber(li_fila_find, "cons_trans_diaria")
			ls_des_trans_diaria	= adw_sistema.GetItemString(li_fila_find, "des_trans_diaria")

	
			adw_sistema.SetItem(li_i, "reconciliationdate" ,ldtm_transaction_date)
			adw_sistema.SetItem(li_i, "total_amount" ,ldec_total_amount)
			adw_sistema.SetItem(li_i, "c_num_registro" ,ll_num_registro_banco)
			adw_sistema.SetItem(li_i, "deposit_code" ,ls_deposit_code)
			adw_sistema.SetItem(li_i, "des_trans_diaria" ,ls_des_trans_diaria)
			adw_sistema.SetItem(li_i, "id_branch" ,ls_id_branch)
			adw_sistema.SetItem(li_i, "cons_trans_diaria" ,ll_cons_trans_diaria)
			adw_sistema.SetItem(li_i, "flag_reconciliation" ,"V")//'V'Coinciden solo Valor y fehca			
			adw_banco.SetItem(li_i, "flag_reconciliation" ,"V")//'V'Coinciden solo Valor y fehca
			adw_sistema.SetItem(li_i, "flag_sugerencia" ,"V")//'V'Coinciden solo Valor y fehca			

			adw_sistema.SetItem(li_fila_find, "flag_reconciliation" ,"%")//'V'Coinciden solo Valor y fehca			
			adw_banco.SetItem(li_fila_find, "flag_reconciliation" ,"%")//'V'Coinciden solo Valor y fehca			
			
		END IF
	END IF
NEXT

//Borrado de registros
adw_banco.SetFilter("flag_reconciliation='%' ")
adw_banco.Filter()
DO while adw_banco.RowCount()>0
	adw_banco.DeleteRow(1)
LOOP

adw_sistema.SetFilter("flag_reconciliation='%' ")
adw_sistema.Filter()
DO while adw_sistema.RowCount()>0
	adw_sistema.DeleteRow(1)
LOOP

adw_banco.SetFilter("")
adw_banco.Filter()
adw_banco.SetSort("c_sort_color asc, c_num_registro asc")
adw_banco.Sort()

adw_sistema.SetFilter("")
adw_sistema.Filter()
adw_sistema.SetSort("c_sort_color asc,c_num_registro asc")
adw_sistema.Sort()


ahpb_progreso.Position=0
/******************************************************************************************************************/
//** Para los registros del Sistema sin identificar correspondencia
/***********************VERIFICA LOS QUE TIENEN FECHA DIFERENTE*************************************************/
w_reconcilicacion_bancaria.st_mensaje.Text='Procesando los que tienen fecha diferente.'

li_fila_find= adw_sistema.Find("flag_reconciliation='N'",1, adw_sistema.RowCount())

IF li_fila_find >0 THEN
	FOR li_i=li_fila_find TO adw_sistema.RowCount()
		
		IF DaysAfter ( Date(adw_sistema.GetItemDateTime(li_i, "date_trans_diaria")) , Date(adw_sistema.GetItemDateTime(li_i, "reconciliationdate"))  )>0 THEN
			adw_sistema.SetItem(li_i, "flag_reconciliation", 'F')//Indica que la fecha se movió un día
		END IF
	NEXT
END IF

// confirmo lo procesado hasta el momento
Commit;

/***************************************************************************************************************/
LONG ll_find_mas_menos
DECIMAL ldec_valor
DATETIME ldt_fecha
STRING ls_agencia
//***************************************
// Procedimiento para depurar automáticamente valores (+-), los cuales coinciden (valor, fecha, agencia)
// los registro negativos quedan por defecto en estado ("flag_reconciliation='N')
li_fila_find = adw_sistema.Find("flag_reconciliation='N'",1, adw_sistema.RowCount())

IF li_fila_find > 0 THEN
	w_reconcilicacion_bancaria.st_mensaje.Text='Procesando valores negativos.'
	FOR li_i = li_fila_find TO adw_sistema.RowCount()
		// se procesan a partir de un registro negativo
		IF adw_sistema.GetItemDecimal(li_i, "total_amount") < 0 THEN
			// se selecciona el registro negativo
			adw_sistema.SelectRow (li_i, TRUE)
			
			// capturo valores de referencia (valor, fecha, agencia)
			ldec_valor = adw_sistema.GetItemDecimal (li_i, "total_amount")
			ldt_fecha = adw_sistema.GetItemDateTime (li_i, "reconciliationdate")
			ls_agencia = adw_sistema.GetItemString (li_i, "id_branch")
			
			// se cambia el signo del valor
			ldec_valor = ldec_valor * (-1)
			
			// se busca un registro positivo que corresponda con el valor, fecha y agencia
			ls_find = "Date ( reconciliationdate ) =  Date ('"+String(ldt_fecha, is_formato_fecha_corta)+"') AND  Truncate(total_amount,2) = Truncate(Dec('" +String(ldec_valor)+"'),2) AND  id_branch = '"+ls_agencia+"'"
			
			// la busqueda se realiza a partir del siguiente registro que se está evaluando
			ll_find_mas_menos = adw_sistema.Find (ls_find, (li_i + 1), adw_sistema.RowCount())
			
			// si no se encuentra correspondencia de valores, se evalúa el siguiente registro
			IF ll_find_mas_menos <= 0 THEN
				// Se deseleccionan todos los registro del datawindow
				adw_sistema.SelectRow (0, FALSE)
				CONTINUE
			ELSE // se selecciona el registro coincidente con el valor positivo
				adw_sistema.SelectRow (ll_find_mas_menos, TRUE)
			END IF
			
			IF of_depurar_transaccion(adw_sistema, adw_banco, li_i) =1 THEN
				Commit;
				// se decrementa el contador ya que el registro fue borrado con éxito
				li_i = li_i - 1
			ELSE
				RollBack;
			END IF
			
			// Se deseleccionan todos los registro del datawindow
			adw_sistema.SelectRow (0, FALSE)
			
		END IF
	NEXT
END IF
//***************************************

Return 1
end function

public function integer of_depurar_transaccion (datawindow adw_sistema, datawindow adw_banco, long al_fila_sistema);Long ll_fila
Decimal{2} ldec_total_amount_sys2, ldec_total_amount_sys

SetPointer(HourGlass!)

//Busca un segundo registro seleccionado para poder depurarlo
ll_fila= adw_sistema.GetSelectedRow ( al_fila_sistema)

If ll_fila>0 THEN
	ldec_total_amount_sys2	= adw_sistema.GetItemDecimal(ll_fila, "total_amount")
	ldec_total_amount_sys	= adw_sistema.GetItemDecimal(al_fila_sistema, "total_amount")
	IF ldec_total_amount_sys2 + ldec_total_amount_sys <> 0 THEN
		MessageBox("Error", "No fue posible depurar estas transacciones debido a que debe existir un valor igual tanto positivo como negativo.",StopSign!)
		Return -1
	ELSE
		//Actualiza el flag del primer registro seleccionado
		il_cons_trans_diaria= adw_sistema.GetItemNumber(al_fila_sistema, "cons_trans_diaria") 
		IF of_update_flag()<>1 THEN Return -1
		
		//Actualiza el flag del segundo registro seleccionado
		il_cons_trans_diaria= adw_sistema.GetItemNumber(ll_fila, "cons_trans_diaria") 
		IF of_update_flag()<>1 THEN Return -1
		
		//Desaparece las transacciones de la vista
		adw_sistema.DeleteRow(al_fila_sistema)
		adw_sistema.DeleteRow(ll_fila - 1)
		
		adw_banco.DeleteRow(al_fila_sistema)
		adw_banco.DeleteRow(ll_fila - 1)
	END IF
ELSE
	MessageBox("Error","Debe seleccionar dos transacciones para realizar la depuración.",StopSign!)
	Return -1
END IF

RETURN 1
end function

public function boolean of_sin_sistema_multiregistro (datawindow adw_banco, datawindow adw_sistema);DateTime		ldtm_transaction_date
Decimal{2}	ldec_total_amount_banco
String		ls_deposit_code, ls_flag_banco, ls_id_branch
Long			ll_filas_sistema, ll_find, ll_existe

SetPointer(HourGlass!)
ll_filas_sistema= adw_sistema.RowCount()

ll_find= adw_sistema.Find("flag_reconciliation='?'", 1 , ll_filas_sistema)

DO WHILE ll_find >0 
	ldtm_transaction_date	= adw_banco.GetItemDateTime(ll_find, "date_transaction")
	ldec_total_amount_banco	= adw_banco.GetItemDecimal(ll_find, "total_amount")
	//is_des_trans_corta		= adw_banco.GetItemString(ll_find, "des_trans_corta")	
	//is_des_trans_larga		= adw_banco.GetItemString(ll_find, "des_trans_larga")	
	is_des_trans_corta		= 'DEPOSIT '+String(adw_banco.GetItemDateTime(ll_find, "date_transaction"),'mm/dd/yyyy')+' (RB)'
	is_des_trans_larga 		= 'DEPOSIT '+String(adw_banco.GetItemDateTime(ll_find, "date_transaction"),'mm/dd/yyyy')+' (RB)'
	ls_flag_banco				= adw_banco.GetItemString(ll_find, "flag_reconciliation")	
	ls_deposit_code			= adw_banco.GetItemString(ll_find, "deposit_code")
	
	IF IsNull(ls_deposit_code) THEN ls_deposit_code='0'
	
		SELECT TOP 1 ID_BRANCH
		 INTO :ls_id_branch
		 FROM dba.DEPOSIT_CODES  
		WHERE /*dba.DEPOSIT_CODES.ID_BANCO							= :is_id_banco AND   			//Puede que no sea necesaria esta línea
				dba.DEPOSIT_CODES.ID_CUENTA_BANCO				= :is_id_cuenta_banco AND	//Puede que no sea necesaria esta línea
				*/(IsNull(dba.DEPOSIT_CODES.DEPOSIT_CODE,'0')= '0'+:ls_deposit_code OR
				IsNull(dba.DEPOSIT_CODES.DEPOSIT_CODE,'0') 	= :ls_deposit_code);	
	
	IF SQLCA.SQLCode=100 AND ll_find + 1 <= ll_filas_sistema THEN 
			ll_find= adw_sistema.Find("flag_reconciliation='?'", ll_find + 1 , ll_filas_sistema)
		CONTINUE
	END IF
	
	/*IF ls_deposit_code='0' OR ll_existe=0  AND ll_find + 1 <= ll_filas_sistema THEN 
		ll_find= adw_sistema.Find("flag_reconciliation='?'", ll_find + 1 , ll_filas_sistema)
		CONTINUE
	ELSE
		SELECT TOP 1 ID_BRANCH
		 INTO :ls_id_branch
		 FROM dba.DEPOSIT_CODES  
		WHERE dba.DEPOSIT_CODES.ID_BANCO							= :is_id_banco AND   			//Puede que no sea necesaria esta línea
				dba.DEPOSIT_CODES.ID_CUENTA_BANCO				= :is_id_cuenta_banco AND	//Puede que no sea necesaria esta línea
				(IsNull(dba.DEPOSIT_CODES.DEPOSIT_CODE,'0') 	= '0'+:ls_deposit_code OR
				IsNull(dba.DEPOSIT_CODES.DEPOSIT_CODE,'0') 	= :ls_deposit_code);	
	END IF*/
	
	IF ls_flag_banco='N' AND NOT IsNull(ldtm_transaction_date) AND NOT IsNull(ls_deposit_code) AND &
		NOT IsNull(ldec_total_amount_banco) THEN
		IF of_insert_transaccion_diaria_banco_payee(ldtm_transaction_date,ldec_total_amount_banco, ls_deposit_code ) THEN
		
			//Si no existe un registro en el panel del sistema debe colocar el registro para que el usuario lo pueda observar
			adw_sistema.SetItem(ll_find, "reconciliationdate", ldtm_transaction_date)
			adw_sistema.SetItem(ll_find, "deposit_code", ls_deposit_code)				
			adw_sistema.SetItem(ll_find, "des_trans_diaria", is_des_trans_corta)								
			adw_sistema.SetItem(ll_find, "total_amount", ldec_total_amount_banco)
			adw_sistema.SetItem(ll_find, "id_branch", ls_id_branch)

			IF of_update_conciliados( ldtm_transaction_date,ls_deposit_code,ldec_total_amount_banco,"SS"  )>0 THEN
				adw_banco.SetItem(ll_find, "flag_reconciliation","S")
				adw_sistema.SetItem(ll_find, "flag_reconciliation","S")
			ELSE
				RETURN FALSE
			END IF
		ELSE
			RETURN FALSE
		END IF
	END IF
	
	/* SE DEBE HABILITAR ESTE SCRIPT PARA QUE FUNCIONE MIULTIREGISTRO*/
	IF ll_find + 1 > ll_filas_sistema THEN
		EXIT
	ELSE
		ll_find= adw_sistema.Find("flag_reconciliation='?'", ll_find + 1 , ll_filas_sistema)
	END IF
	
	/* SE DEBE DESHABILITAR ESTE EXIT PARA QUE FUNCIONE MIULTIREGISTRO
	EXIT*/
LOOP

RETURN TRUE
end function

public function boolean of_sin_sistema (datawindow adw_banco, datawindow adw_sistema, integer ai_fila_banco);DateTime		ldtm_transaction_date
Decimal{2}	ldec_total_amount_banco
String		ls_deposit_code, ls_flag_banco, ls_id_branch, ls_id_banco
Long			ll_existe

SetPointer(HourGlass!)

ldtm_transaction_date	= adw_banco.GetItemDateTime(ai_fila_banco, "date_transaction")
ldec_total_amount_banco	= adw_banco.GetItemDecimal(ai_fila_banco, "total_amount")
is_des_trans_corta		= 'DEPOSIT '+String(adw_banco.GetItemDateTime(ai_fila_banco, "date_transaction"),'mm/dd/yyyy')+' (RB)'
is_des_trans_larga 		= 'DEPOSIT '+String(adw_banco.GetItemDateTime(ai_fila_banco, "date_transaction"),'mm/dd/yyyy')+' (RB)'
ls_flag_banco				= adw_banco.GetItemString(ai_fila_banco, "flag_reconciliation")	
ls_deposit_code			= adw_banco.GetItemString(ai_fila_banco, "deposit_code")
ls_id_banco = adw_banco.GetItemString (ai_fila_banco, "id_banco")

IF IsNull(ls_deposit_code) THEN ls_deposit_code='0'

// para el banco de Of. America 'B OF A' el id_branch es el campo ADDITIONAL1
IF TRIM (ls_id_banco) = 'B OF A' THEN
	ls_id_branch = adw_banco.GetItemString (ai_fila_banco, "additional1")
	
	IF TRIM (ls_deposit_code) = '0'  THEN
		MessageBox("Error","No se halló el id_branch para el código de depósito "+ls_deposit_code,StopSign!)
		RETURN FALSE
	END IF
ELSE // otro banco

	SELECT TOP 1 ID_BRANCH
	 INTO :ls_id_branch
	 FROM dba.DEPOSIT_CODES  
	WHERE (IsNull(dba.DEPOSIT_CODES.DEPOSIT_CODE,'0')= '0'+:ls_deposit_code OR
			IsNull(dba.DEPOSIT_CODES.DEPOSIT_CODE,'0') 	= :ls_deposit_code);	
	
	IF SQLCA.SQLCode=100  THEN 
		MessageBox("Error","No se halló el id_branch para el código de depósito "+ls_deposit_code,StopSign!)
		RETURN FALSE
	END IF
END IF
IF ls_flag_banco='N' AND NOT IsNull(ldtm_transaction_date) AND NOT IsNull(ls_deposit_code) AND &
	NOT IsNull(ldec_total_amount_banco) THEN
	IF of_insert_transaccion_diaria_banco_payee(ldtm_transaction_date,ldec_total_amount_banco, ls_deposit_code ) THEN
	
		//Si no existe un registro en el panel del sistema debe colocar el registro para que el usuario lo pueda observar
		adw_sistema.SetItem(ai_fila_banco, "reconciliationdate", ldtm_transaction_date)
		adw_sistema.SetItem(ai_fila_banco, "deposit_code", ls_deposit_code)				
		adw_sistema.SetItem(ai_fila_banco, "des_trans_diaria", is_des_trans_corta)								
		adw_sistema.SetItem(ai_fila_banco, "total_amount", ldec_total_amount_banco)
		adw_sistema.SetItem(ai_fila_banco, "id_branch", ls_id_branch)

		IF of_update_conciliados( ldtm_transaction_date,ls_deposit_code,ldec_total_amount_banco,"SS"  )>0 THEN
			adw_banco.SetItem(ai_fila_banco, "flag_reconciliation","S")
			adw_sistema.SetItem(ai_fila_banco, "flag_reconciliation","S")
		ELSE
			RETURN FALSE
		END IF
	ELSE
		RETURN FALSE
	END IF
END IF

RETURN TRUE
end function

on n_cst_reconciliation.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_reconciliation.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;n_cst_configuracion_regional ln_cst_configuracion_regional

ln_cst_configuracion_regional= CREATE n_cst_configuracion_regional

is_formato_fecha_corta= ln_cst_configuracion_regional.of_get_formato_fecha_corta( )
end event

