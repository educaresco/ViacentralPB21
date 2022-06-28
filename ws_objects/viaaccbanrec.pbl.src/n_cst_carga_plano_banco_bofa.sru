$PBExportHeader$n_cst_carga_plano_banco_bofa.sru
forward
global type n_cst_carga_plano_banco_bofa from nonvisualobject
end type
end forward

global type n_cst_carga_plano_banco_bofa from nonvisualobject
end type
global n_cst_carga_plano_banco_bofa n_cst_carga_plano_banco_bofa

type variables
Public:
// - Common return value constants:
constant integer 		SUCCESS = 1
constant integer 		FAILURE = -1
constant integer 		NO_ACTION = 0
String	is_formato_fecha_corta
end variables

forward prototypes
public function integer of_validar_fecha_transaccion (datawindow adw_archivo_plano)
public function integer of_cargar_plano_base_datos (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco)
public function integer of_insertar_archivo_plano (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco)
public function date of_set_date_transaction (string as_date)
end prototypes

public function integer of_validar_fecha_transaccion (datawindow adw_archivo_plano);DateTime ldt_fecha_hoy
Date		ldt_date_transaction
String	ls_fecha_transaccion, ls_fecha_temporal, ls_find
LONG ll_find

SELECT GETDATE()
INTO	:ldt_fecha_hoy
FROM	dba.ACC_PARAMETERS;

IF SQLca.SQLcode = -1 THEN
    MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación...')
    RETURN FAILURE
END IF

// se le da el mismo formato de fecha que el archivo importado
ls_fecha_transaccion= String(ldt_fecha_hoy, 'yyyy-MM-dd')

ls_find = 'date_transaction = "'+ls_fecha_transaccion+'"'

ll_find = adw_archivo_plano.Find (ls_find, 1, adw_archivo_plano.Rowcount())

IF ll_find > 0 THEN
	MessageBox("Error","Uno o más registros existen con fecha igual a "+ String(Date(ldt_fecha_hoy)), StopSign!)
	Return Failure
END IF 

Return success
end function

public function integer of_cargar_plano_base_datos (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco);//Validar que el archivo plano no contenga una fecha de transacción igual a la de hoy
IF of_validar_fecha_transaccion(adw_archivo_plano)= SUCCESS THEN
	IF of_insertar_archivo_plano(adw_archivo_plano, as_id_banco, as_id_cuenta_banco)= SUCCESS THEN
		RETURN SUCCESS
	ELSE
		RETURN FAILURE
	END IF
ELSE
	RETURN FAILURE
END IF
end function

public function integer of_insertar_archivo_plano (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco);BOOLEAN lb_validacion = FALSE
DATE ldt_date_transaction
DECIMAL ldec_amount
INTEGER li_existe, li_reconciliados, li_respuesta
LONG ll_find, ll_filas, ll_i, ll_pos
STRING ls_find, ls_date_transaction, ls_account, ls_bai_code, ls_descripcion
STRING ls_amount, ls_customer_reference, ls_bank_reference, ls_text, ls_deposit_code
STRING ls_dec, ls_entero, ls_id_branch

// se valida que la cuenta seleccionada sea la Nro. 4426614115
IF as_id_cuenta_banco <> '4426614115' THEN
	MessageBox ('Atención!', 'Sólo es posible procesar la información de la cuenta Nro. 4426614115... Favor revisar la cuenta seleccionada.')
	RETURN FAILURE
END IF

// se validan que existan registros correspondientes a la cuenta seleccionada
ll_filas = adw_archivo_plano.RowCount( )

ls_find = 'account = "'+as_id_cuenta_banco+'"'

ll_find = adw_archivo_plano.Find (ls_find, 1, ll_filas)

IF ll_find <= 0 THEN
	MessageBox ('Atención!', 'El archivo seleccionado, no contiene información correspondiente a la cuenta seleccionada.')
	Return FAILURE
END IF

FOR ll_i = 1 TO ll_filas
	// se captura la información relevante del archivo
	ls_date_transaction = adw_archivo_plano.GetItemString (ll_i, 'date_transaction')
	ls_account = adw_archivo_plano.GetItemString (ll_i, 'account')
	ls_bai_code = adw_archivo_plano.GetItemString (ll_i, 'bai_code')
	ls_descripcion = adw_archivo_plano.GetItemString (ll_i, 'descripcion')
	ls_amount = adw_archivo_plano.GetItemString (ll_i, 'amount')
	ls_customer_reference = adw_archivo_plano.GetItemString (ll_i, 'customer_reference')
	ls_bank_reference = adw_archivo_plano.GetItemString (ll_i, 'bank_reference')
	ls_text = adw_archivo_plano.GetItemString (ll_i, 'text')
	
	// se valida que no se trate de un registro del encabezado
	IF Upper (Trim (ls_account)) = 'ACCOUNT' THEN CONTINUE
	
	// se realiza tratamiento a los datos
	
	// se consulta la fecha de acuerdo al formato
	ldt_date_transaction = of_set_date_transaction (ls_date_transaction)
	
	// se valida si la fecha es válida
	IF String (ldt_date_transaction, 'dd/MM/yyyy') = '01/01/1900' THEN
		MessageBox ('Atención!', 'La fecha de transacción no ha sido interpretada correctamente por la aplicación...')
		RETURN failure
	END IF
	
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
			ldec_amount = Dec (ls_entero) - (Dec (ls_dec) / 100)
		ELSE
			ldec_amount = Dec (ls_entero) + (Dec (ls_dec) / 100)
		END IF
	ELSE
		ldec_amount = Dec (ls_amount)
	END IF
	
	// se validan los límites de campos
	ls_customer_reference = MID (ls_customer_reference, 1, 20)
	ls_bank_reference = MID (ls_bank_reference, 1, 20)
	
	// se homologa el código de transacción '856' con el '301'
	IF ls_bai_code = '856' THEN ls_bai_code = '301'
	
	// la cuenta '4426615729' se homologa con la '4426614115' y se procesa
	// siempre y cuado el valor no coincida con un registro de la cuenta '4426614115'
	IF ls_account = '4426615729' THEN
		ls_find = 'date_transaction = "'+ls_date_transaction+'" AND account = "4426614115" AND amount = "'+ls_amount+'"'
		
		ll_find = adw_archivo_plano.Find (ls_find, 1, ll_filas)
		
		IF ll_find > 0 THEN // ya existe un registro por el mismo valor
			CONTINUE
		ELSE
			ls_account = '4426614115'
		END IF
	END IF
	
	// se verifica si ya se cargó un archivo plano con registros de la misma fecha
	IF NOT lb_validacion THEN
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
		AND		BANCO.DATE_TRANSACTION	= :ldt_date_transaction;
			
		IF SQLCA.SQLCODE=-1 THEN
			MessageBox("Error BD", SQLCA.SQLERRTEXT, StopSign! )
			Return failure
		END IF
	
		IF li_reconciliados > 0 THEN // existen registros y se encuentran cociliados
			MessageBox("Información","Ya se encuentran registros cargados y reconciliados en la base de datos para la fecha " &
											+ string(ldt_date_transaction, "mm/dd/yyyy"),information!)
			RETURN failure
		ELSE
			IF li_existe > 0 THEN // existen registros pero no se encuentran reconciliados
				li_respuesta = MessageBox("Información","Ya se encuentran registros cargados en la base de datos para la fecha " &
											+ string(ldt_date_transaction, "mm/dd/yyyy")+".~r¿Desea borrarlos y volver a realizar la carga?",Question!, YesNo!, 2)
				IF li_respuesta = 1 THEN
					TRY	
						DELETE	dba.BANK_STATEMENT
						WHERE		ID_CUENTA_BANCO	= :as_id_cuenta_banco
						AND		ID_BANCO				= :as_id_banco
						AND		DATE_TRANSACTION	= :ldt_date_transaction;					
					THROW CREATE c_sqlexception
					CATCH (c_sqlexception sql2)
						IF NOT sql2.exception() THEN
							sql2.of_set_condicion('Cuenta banco: '+as_id_cuenta_banco +&
														 '~rBanco: '+as_id_banco +&
														 '~rFecha transacción: '+String(ldt_date_transaction,"mm/dd/yyyy"))
							MessageBox("Error BD", sql2.getmessage(), StopSign! )
							RollBack;
							Return failure
						END IF
					END TRY		
				ELSE
					RETURN failure 
				END IF // fin li_respuesta = 1
				
			END IF //fin li_existe > 0
			
		END IF // fin li_reconciliados > 0
		
	END IF // fin de lb_validacion
		
	// se extrae del campo texto la CUR FR, la cual corresponde con el DEPOSIT_CODES
	ll_pos = Pos (ls_text, "FR")
	
	IF ll_pos = 0 THEN // no existe referencia
		ls_text = ''
		ls_deposit_code = '0'
		ls_id_branch = '0'
	ELSE
		ls_text = Mid (ls_text, (ll_pos + 3), 10)
		
		// para efectos de reconciliación se tomará como DEPOSIT_CODES el ID_BRANCH
		SELECT dba.DEPOSIT_CODES.ID_BRANCH  
		 INTO :ls_id_branch  
		 FROM dba.DEPOSIT_CODES  
		WHERE dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_text   ;
	
		IF SQLca.SQLcode = -1 THEN
			 MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación...')
			 RETURN failure
		ElSEIF SQLca.SQLcode = 100 THEN // No existe
			ls_id_branch = '0'
			ls_deposit_code = '0'
		END IF

			ls_deposit_code = ls_text		
	END IF
	
	// finalmente se inserta la información	
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
           FLAG_RECONCILIATION,   
           CONS_TRANS_DIARIA )  
  VALUES ( :ls_bai_code,   
           :ldt_date_transaction,   
           :ls_descripcion,   
           :ls_descripcion,   
           :ldec_amount,   
           :ls_deposit_code,   
           :ls_id_branch,   
           :ls_customer_reference,   
           :ls_bank_reference,   
           :as_id_banco,   
           :as_id_cuenta_banco,   
           'N',   
           NULL )  ;

	IF SQLca.SQLcode = -1 THEN
		 MESSAGEBOX('Advertencia!', 'Error de base de datos... Favor reiniciar la aplicación...')
		 RETURN failure
	END IF
	
	// se actualiza la variable de lb_validacion para no seguir validando
	// la existencia de registros
	lb_validacion = TRUE
	
NEXT

// se confirman los cambios al final
COMMIT;

RETURN SUCCESS
end function

public function date of_set_date_transaction (string as_date);// función que se utiliza para realizar conversión de formato fecha
DATE ldt_date_transaction
LONG ll_year, ll_month, ll_day, ll_month_actual
STRING ls_formato_fecha, ls_separador_fecha
STRING ls_aux1, ls_aux2, ls_aux3

// se consulta el mes actual
ll_month_actual = Month (ToDay ())

// Se valida el tipo de separador de fecha
IF Pos (as_date, '/') > 0 THEN
	ls_separador_fecha = '/'
Else
	ls_separador_fecha = '-'
END IF

// Se valida el formato de fecha para identificar como se capturan los datos
ls_aux1 = fn_token(as_date, ls_separador_fecha, 1)
ls_aux2 = fn_token(as_date, ls_separador_fecha, 2)
ls_aux3 = fn_token(as_date, ls_separador_fecha, 3)

// Se identifica el año
CHOOSE CASE 4
	CASE Len (ls_aux1) 
		ll_year = Long (ls_aux1)
		
		// se valida cual corresponde al mes y al día
		If Long (ls_aux2) > 12 Then
			ll_month = Long (ls_aux3)
			ll_day = Long (ls_aux2)
		ElseIF Long (ls_aux3) > 12 Then
			ll_month = Long (ls_aux2)
			ll_day = Long (ls_aux3)
		Else // se define el mes con el del sistema
			IF Long (ls_aux2) = ll_month_actual Then
				ll_month = Long (ls_aux2)
				ll_day = Long (ls_aux3)
			Else
				ll_month = Long (ls_aux3)
				ll_day = Long (ls_aux2)
			End if
		End if
		
	CASE Len (ls_aux2)
		ll_year = Long (ls_aux2)
		
		// se valida cual corresponde al mes y al día
		If Long (ls_aux1) > 12 Then
			ll_month = Long (ls_aux3)
			ll_day = Long (ls_aux1)
		ElseIF Long (ls_aux3) > 12 Then
			ll_month = Long (ls_aux1)
			ll_day = Long (ls_aux3)
		Else // se define el mes con el del sistema
			IF Long (ls_aux1) = ll_month_actual Then
				ll_month = Long (ls_aux1)
				ll_day = Long (ls_aux3)
			Else
				ll_month = Long (ls_aux3)
				ll_day = Long (ls_aux1)
			End if
		End if
		
	CASE ELSE
		ll_year = Long (ls_aux3)
		
		// se valida cual corresponde al mes y al día
		If Long (ls_aux1) > 12 Then
			ll_month = Long (ls_aux2)
			ll_day = Long (ls_aux1)
		ElseIF Long (ls_aux2) > 12 Then
			ll_month = Long (ls_aux1)
			ll_day = Long (ls_aux2)
		Else // se define el mes con el del sistema
			IF Long (ls_aux1) = ll_month_actual Then
				ll_month = Long (ls_aux1)
				ll_day = Long (ls_aux2)
			Else
				ll_month = Long (ls_aux2)
				ll_day = Long (ls_aux1)
			End if
		End if
		
END CHOOSE

ldt_date_transaction = Date (ll_year, ll_month, ll_day)

RETURN ldt_date_transaction
end function

on n_cst_carga_plano_banco_bofa.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_carga_plano_banco_bofa.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;n_cst_configuracion_regional ln_cst_configuracion_regional

ln_cst_configuracion_regional	= CREATE n_cst_configuracion_regional

is_formato_fecha_corta= ln_cst_configuracion_regional.of_get_formato_fecha_corta( )
end event

