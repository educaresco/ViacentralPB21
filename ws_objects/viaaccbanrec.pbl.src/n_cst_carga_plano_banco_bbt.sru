$PBExportHeader$n_cst_carga_plano_banco_bbt.sru
forward
global type n_cst_carga_plano_banco_bbt from nonvisualobject
end type
end forward

global type n_cst_carga_plano_banco_bbt from nonvisualobject
end type
global n_cst_carga_plano_banco_bbt n_cst_carga_plano_banco_bbt

type variables
Public:
// - Common return value constants:
constant integer 		SUCCESS = 1
constant integer 		FAILURE = -1
constant integer 		NO_ACTION = 0
String	is_formato_fecha_corta
end variables

forward prototypes
public function integer of_total_creditos_debitos (datawindow adw_archivo_plano)
public function integer of_validar_fecha_transaccion (datawindow adw_archivo_plano)
public function integer of_cargar_plano_base_datos (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco)
public function integer of_insertar_archivo_plano (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco)
public function date of_set_date_transaction (string as_date)
end prototypes

public function integer of_total_creditos_debitos (datawindow adw_archivo_plano);Decimal {2} ldec_total_credits, ldec_total_debits, ldec_filtro_creditos,ldec_filtro_debitos


/*El total de Creditos debe de reconcialiar con la línea 9 (Mov con código 101 al 399) El total de debitos debe de 
reconciliar con la línea 10 (Mov con código 401 al 699)*/

/**********CREDITS*********/
adw_archivo_plano.SetFilter("Long(transaction_code)=100")
adw_archivo_plano.Filter()

IF adw_archivo_plano.RowCount()>0 THEN
	ldec_total_credits= Dec(adw_archivo_plano.GetItemString(1, "value"))
	adw_archivo_plano.SetFilter("")
	adw_archivo_plano.Filter()
	
	adw_archivo_plano.SetFilter("Long( transaction_code)>=101 and  Long(transaction_code) <=399")
	adw_archivo_plano.Filter()

	
	ldec_filtro_creditos=adw_archivo_plano.GetItemDecimal(adw_archivo_plano.RowCount(),"c_total_value")
	//adw_archivo_plano.SetPosition ( 'c_total_value', "detail" , true )
	//ldec_filtro_creditos=adw_archivo_plano.GetItemDecimal(adw_archivo_plano.RowCount(),"c_total_value")
	
	IF ldec_total_credits<>ldec_filtro_creditos THEN
		MessageBox("Error", "El total de créditos no reconcilia con los valores encontrados entre los códigos de transacción 101 y 399.~r "&
						+ String(ldec_total_credits,"#,##0.00") +" - "+String(ldec_filtro_creditos, "#,##0.00") )
		return FAILURE
	END IF
	
ELSE
	MessageBox("Error","Sin transacción 100-Total Credits en el archivo. El proceso será suspendido.",Stopsign!)
	return FAILURE
END IF


/**********DEBITS*********/
adw_archivo_plano.SetFilter("")
adw_archivo_plano.Filter()
adw_archivo_plano.SetFilter("Long(transaction_code)=400")
adw_archivo_plano.Filter()

IF adw_archivo_plano.RowCount()>0 THEN
	ldec_total_debits	= Dec(adw_archivo_plano.GetItemString(1, "value"))
	adw_archivo_plano.SetFilter("")
	adw_archivo_plano.Filter()
	
	adw_archivo_plano.SetFilter("Long( transaction_code)>=401 and  Long(transaction_code) <=699")
	adw_archivo_plano.Filter()
	
	ldec_filtro_debitos= adw_archivo_plano.GetItemDecimal(adw_archivo_plano.RowCount(),"c_total_value")
	
	IF ldec_total_debits<>ldec_filtro_debitos THEN
		MessageBox("Error", "El total de debitos no reconcilia con los valores encontrados entre los códigos de transacción 401 y 699.~r "&
						+ String(ldec_total_debits, "#,##0.00") +" - "+String(ldec_filtro_debitos, "#,##0.00") )
		return FAILURE
	END IF
	
ELSE
	MessageBox("Error","Sin transacción 400-Total Debits en el archivo. El proceso será suspendido.",Stopsign!)
	return FAILURE
END IF

adw_archivo_plano.SetFilter("")
adw_archivo_plano.Filter()
/***********************/

Return SUCCESS


end function

public function integer of_validar_fecha_transaccion (datawindow adw_archivo_plano);DATEtIME ldt_fecha_hoy

SELECT GETDATE()
INTO	:ldt_fecha_hoy
FROM	dba.ACC_PARAMETERS;


adw_archivo_plano.SetFilter("columna_A not in ('H','T') AND Date( date_transaction )  >= Date('"+String(Date(ldt_fecha_hoy))+"')")
adw_archivo_plano.Filter()

IF adw_archivo_plano.RowCount()>0 THEN
	MessageBox("Error","Uno o más registros existen con fecha igual o superior a"+ String(Date(ldt_fecha_hoy)), StopSign!)
	Return Failure
END IF 


adw_archivo_plano.SetFilter("")
adw_archivo_plano.Filter()
Return success
end function

public function integer of_cargar_plano_base_datos (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco);//Validar el total de créditos y débitos con las columnas correspondientes
IF of_total_creditos_debitos(adw_archivo_plano)= SUCCESS THEN
	//Validar que el archivo plano no contenga una fecha de transacción igual a la de hoy
	IF of_validar_fecha_transaccion(adw_archivo_plano)= SUCCESS THEN
		IF of_insertar_archivo_plano(adw_archivo_plano, as_id_banco, as_id_cuenta_banco)= SUCCESS THEN
			RETURN SUCCESS
		ELSE
			RETURN FAILURE
		END IF
	ELSE
		RETURN FAILURE
	END IF

ELSE
	RETURN FAILURE
END IF
end function

public function integer of_insertar_archivo_plano (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco);LongLong  	lll_ID_CODE_TRANSACTION 
Date			ldt_DATE_TRANSACTION
String 		ls_DES_TRANS_CORTA, ls_DES_TRANS_LARGA, ls_DEPOSIT_CODE, ls_ADDITIONAL1, ls_ADDITIONAL2, ls_ADDITIONAL3,&
				ls_ID_BANCO, ls_ID_CUENTA_BANCO, ls_FLAG_RECONCILIATION, ls_fecha_transaccion
Decimal{2} 	ldec_TOTAL_AMOUNT
Integer		li_i, li_existe, li_reconciliados, li_respuesta
Boolean		lb_ya_cargados
STRING ls_amount
LONG ll_pos
STRING ls_dec, ls_entero

adw_archivo_plano.SetFilter("columna_A not in ('H','T')")
adw_archivo_plano.Filter()

FOR li_i=1 TO adw_archivo_plano.RowCount()
	lll_ID_CODE_TRANSACTION	= LongLong(adw_archivo_plano.GetItemString(li_i, "TRANSACTION_CODE" ))
	ls_DES_TRANS_CORTA		= adw_archivo_plano.GetItemString(li_i, "short_description" )
	ls_DES_TRANS_LARGA		= adw_archivo_plano.GetItemString(li_i, "long_description" )
	ls_amount = adw_archivo_plano.GetItemString(li_i, "value" )
	ls_DEPOSIT_CODE			= adw_archivo_plano.GetItemString(li_i, "DEPOSITE_CODE" )
	ls_ADDITIONAL1				= adw_archivo_plano.GetItemString(li_i, "ADDITIONAL1" )
	ls_ADDITIONAL2				= adw_archivo_plano.GetItemString(li_i, "ADDITIONAL2" )
	ls_ADDITIONAL3				= adw_archivo_plano.GetItemString(li_i, "ADDITIONAL3" )
	ls_fecha_transaccion = adw_archivo_plano.GetItemString(li_i, "DATE_TRANSACTION" )

	// se carga la fecha evaluando el tipo de formato
	ldt_DATE_TRANSACTION = of_set_date_transaction (ls_fecha_transaccion)
	
	// se convierte a decimal el valor del depósito y se evalúa teniendo encuento el separador decimal (.)
	ll_pos = Pos (ls_amount, ".")
	IF ll_pos > 0 THEN
		// se evalúa la parte decimal ya que en ocasiones viene con un sólo dígito
		ls_dec = Mid (ls_amount, (ll_pos + 1), 2)
		// si no tiene dígitos pero si un punto separador se coloca cero
		IF Len (ls_dec) = 0 THEN ls_dec = '0'
		
		// si tiene un dígito se completa con 2 decimales
		IF Len (ls_dec) = 1 THEN ls_dec += '0'
		
		// se evalúa la parte entera ya que un número negativo debe restar la parte decimal
		ls_entero = Mid (ls_amount, 1, (ll_pos - 1))
		
		IF Dec (ls_entero) < 0 THEN
			ldec_TOTAL_AMOUNT = Dec (ls_entero) - (Dec (ls_dec) / 100)
		ELSE
			ldec_TOTAL_AMOUNT = Dec (ls_entero) + (Dec (ls_dec) / 100)
		END IF
	ELSE
		ldec_TOTAL_AMOUNT = Dec (ls_amount)
	END IF

	//Verifica que si ya se cargó un archivo plano con registros de la misma fecha
	IF lb_ya_cargados=FALSE THEN
		
		SELECT 	top(1) 1,
					ISNULL((	SELECT	TOP 1 1
								FROM		dba.BANK_STATEMENT B
								WHERE		B.FLAG_RECONCILIATION	= 'S'	
								AND		B.ID_CUENTA_BANCO			= BANCO.ID_CUENTA_BANCO
								AND		B.ID_BANCO					= BANCO.ID_BANCO
								AND		B.DATE_TRANSACTION		= BANCO.DATE_TRANSACTION),0) EXISTE_RB
		INTO		:li_existe, :li_reconciliados						
		FROM		dba.BANK_STATEMENT BANCO
		WHERE		BANCO.ID_CUENTA_BANCO	= :as_id_cuenta_banco
		AND		BANCO.ID_BANCO				= :as_id_banco
		AND		BANCO.DATE_TRANSACTION	= :ldt_DATE_TRANSACTION;
			
		IF SQLCA.SQLCODE=-1 THEN
			MessageBox("Error BD", SQLCA.SQLERRTEXT, StopSign! )
			Return failure
		END IF
		
		IF li_existe>0 AND li_reconciliados>0 THEN
			lb_ya_cargados= True
			MessageBox("Información","Ya se encuentran registros cargados y reconciliados en la base de datos para la fecha " &
											+ string(ldt_DATE_TRANSACTION, is_formato_fecha_corta),information!)
			RETURN failure
		ELSE
			IF li_existe>0 AND li_reconciliados=0 THEN
				li_respuesta = MessageBox("Información","Ya se encuentran registros cargados en la base de datos para la fecha " &
											+ string(ldt_DATE_TRANSACTION, is_formato_fecha_corta)+".~r¿Desea borrarlos y volver a realizar la carga?",Question!, YesNo!, 2)
				IF li_respuesta = 1 THEN
					TRY	
						DELETE	dba.BANK_STATEMENT
						WHERE		ID_CUENTA_BANCO	= :as_id_cuenta_banco
						AND		ID_BANCO				= :as_id_banco
						AND		DATE_TRANSACTION	= :ldt_DATE_TRANSACTION;					
					THROW CREATE c_sqlexception
					CATCH (c_sqlexception sql2)
						IF NOT sql2.exception() THEN
							MessageBox("Error BD", sql2.getmessage(), StopSign! )
							RollBack;
							adw_archivo_plano.SetFilter("")
							adw_archivo_plano.Filter()
							Return failure
						END IF
					END TRY		
				ELSE
					lb_ya_cargados= True
					RETURN failure
				END IF							
			END IF
		END IF
	END IF
	
	
	TRY
	  INSERT INTO dba.BANK_STATEMENT  
				( ID_CODE_TRANSACTION,   
				  DATE_TRANSACTION,   
				  DES_TRANS_CORTA,   
				  DES_TRANS_LARGA,   
				  TOTAL_AMOUNT,   
				  DEPOSIT_CODE,   
				  ADDITIONAL1,   
				  ADDITIONAL2,   
				  ADDITIONAL3,   
				  ID_BANCO,   
				  ID_CUENTA_BANCO,   
				  FLAG_RECONCILIATION )  
	  VALUES ( :lll_ID_CODE_TRANSACTION,   
				  :ldt_DATE_TRANSACTION,   
				  :ls_DES_TRANS_CORTA,   
				  :ls_DES_TRANS_LARGA,   
				  :ldec_TOTAL_AMOUNT,   
				  :ls_DEPOSIT_CODE,   
				  :ls_ADDITIONAL1,   
				  :ls_ADDITIONAL2,   
				  :ls_ADDITIONAL3,   
				  :as_id_banco,   
				  :as_id_cuenta_banco,   
				  'N' )  ;
				  
	THROW CREATE c_sqlexception
		CATCH (c_sqlexception sql1)
			IF NOT sql1.exception() THEN
				MessageBox("Error BD", sql1.getmessage(), StopSign! )
				RollBack;
				adw_archivo_plano.SetFilter("")
				adw_archivo_plano.Filter()
				Return failure
			END IF
		END TRY	

		lb_ya_cargados= True
NEXT

adw_archivo_plano.SetFilter("")
adw_archivo_plano.Filter()

RETURN SUCCESS
end function

public function date of_set_date_transaction (string as_date);// función que se utiliza para realizar conversión de formato fecha
DATE ldt_DATE_TRANSACTION

CHOOSE CASE is_formato_fecha_corta
	CASE 'dd/MM/yyyy'
		ldt_DATE_TRANSACTION		= Date(as_date)
	CASE "M/d/yyyy"
		IF  Pos(as_date, '-')>0 THEN
			//Indica que el formato viene con guiones: '4-Feb-08'
			ldt_DATE_TRANSACTION= Date( Mid(as_date, Pos(as_date, '-')+1, 4 ) +&
										 Mid(as_date, 1, Pos(as_date, '-') ) +&
										 Mid(as_date, Pos(as_date, '-')+5) )
		ELSE //Indica que el formato no viene con guiones '4Feb08'
			IF Len(as_date)=6 THEN //Formato '4Feb08'
				ldt_DATE_TRANSACTION= Date( Mid(as_date, 2,3) +&
													Mid(as_date, 1, 1 ) +&
												 Mid(as_date, 5) )
			ELSE //Formato '14Feb08'
				ldt_DATE_TRANSACTION= Date( Mid(as_date, 3,3) +'-'+&
													Mid(as_date, 1,2) +'-'+&
													 Mid(as_date, 6))
			END IF
		END IF
END CHOOSE

RETURN ldt_DATE_TRANSACTION
end function

on n_cst_carga_plano_banco_bbt.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_carga_plano_banco_bbt.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;n_cst_configuracion_regional ln_cst_configuracion_regional

ln_cst_configuracion_regional	= CREATE n_cst_configuracion_regional

is_formato_fecha_corta= ln_cst_configuracion_regional.of_get_formato_fecha_corta( )
end event

