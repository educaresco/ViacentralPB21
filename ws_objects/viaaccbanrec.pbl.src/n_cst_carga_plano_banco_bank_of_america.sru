$PBExportHeader$n_cst_carga_plano_banco_bank_of_america.sru
forward
global type n_cst_carga_plano_banco_bank_of_america from nonvisualobject
end type
end forward

global type n_cst_carga_plano_banco_bank_of_america from nonvisualobject
end type
global n_cst_carga_plano_banco_bank_of_america n_cst_carga_plano_banco_bank_of_america

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

public function integer of_validar_fecha_transaccion (datawindow adw_archivo_plano);DATEtIME ldt_fecha_hoy
Date		ldt_DATE_TRANSACTION
String	ls_fecha_transaccion, ls_fecha_temporal

SELECT GETDATE()
INTO	:ldt_fecha_hoy
FROM	dba.ACC_PARAMETERS;


CHOOSE CASE is_formato_fecha_corta
		CASE 'dd/MM/yyyy' 
			ls_fecha_temporal= String(ldt_fecha_hoy)
			//A pesar de que el formato en la configuración regional es dd/mm/yyyy, el archivo llega como
			//mm/dd/yyyy, entonces se debe rearmar el string
			ls_fecha_transaccion= fn_token(ls_fecha_temporal,'/',2) + "/" + fn_token(ls_fecha_temporal,'/',1) +"/" + fn_token(ls_fecha_temporal,'/',3)
			
		CASE "M/d/yyyy"
			ls_fecha_transaccion= String(ldt_fecha_hoy)
	END CHOOSE

adw_archivo_plano.SetFilter("Date( date_transaction )  >= Date('"+String(ls_fecha_transaccion)+"')")
adw_archivo_plano.Filter()

IF adw_archivo_plano.RowCount()>0 THEN
	MessageBox("Error","Uno o más registros existen con fecha igual o superior a "+ String(Date(ldt_fecha_hoy)), StopSign!)
	Return Failure
END IF 


adw_archivo_plano.SetFilter("")
adw_archivo_plano.Filter()
Return success
end function

public function integer of_cargar_plano_base_datos (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco);//Validar que el archivo plano no contenga una fecha de transacción igual a la de hoy
//IF of_validar_fecha_transaccion(adw_archivo_plano)= SUCCESS THEN
	IF of_insertar_archivo_plano(adw_archivo_plano, as_id_banco, as_id_cuenta_banco)= SUCCESS THEN
		RETURN SUCCESS
	ELSE
		RETURN FAILURE
	END IF
//ELSE
//	RETURN FAILURE
//END IF
end function

public function integer of_insertar_archivo_plano (datawindow adw_archivo_plano, string as_id_banco, string as_id_cuenta_banco);LongLong  	lll_ID_CODE_TRANSACTION 
Date			ldt_DATE_TRANSACTION, ldt_fechas[], ldt_fechas_NO_Carga[]
String 		ls_DES_TRANS_CORTA, ls_DES_TRANS_LARGA, ls_DEPOSIT_CODE, ls_ADDITIONAL1, ls_ADDITIONAL2, ls_ADDITIONAL3,&
				ls_ID_BANCO, ls_ID_CUENTA_BANCO, ls_FLAG_RECONCILIATION, ls_fecha_transaccion, ls_cuenta_banco
Decimal{2} 	ldec_TOTAL_AMOUNT
Integer		li_i, li_existe, li_reconciliados, li_respuesta, li_j
Boolean		lb_ya_cargados, ls_read_next_record, lb_fecha_encabezado


//Toma el número de cuenta
//li_i= adw_archivo_plano.Find("c_match_account=1",1, adw_archivo_plano.RowCount())
//
//IF li_i>0 THEN
//	ls_cuenta_banco= adw_archivo_plano.GetItemString( li_i , "transaction_number")
//	ls_cuenta_banco= Trim(Mid (ls_cuenta_banco, Pos(ls_cuenta_banco, ": ")+1 ))
//	
//	IF ls_cuenta_banco<>as_id_cuenta_banco THEN
//		MessageBox("Error","La cuenta seleccionada no es equivalente a la definida en el archivo.~r"+&
//						"Cuenta Seleccionada: "+ as_id_cuenta_banco+&
//						"~rCuenta Archivo: "+ls_cuenta_banco)
//		Return FAILURE
//	END IF
//END IF
//
//
//adw_archivo_plano.SetFilter("DATE_TRANSACTION <>'Date' ")
//adw_archivo_plano.Filter()

Long 		ll_numero_cuenta
String	ls_registro, ls_record_type_code

FOR li_i=1 TO adw_archivo_plano.RowCount()
	//Toma el registro que será analizado
	ls_registro				= adw_archivo_plano.GetItemString(li_i, "registro" )
	ls_cuenta_banco		= Mid(ls_registro, 1,12) 
	ls_record_type_code	= Mid(ls_registro, 13,1)
	
	IF li_i=1 THEN
		//Valida número de cuenta
		IF ls_cuenta_banco<>as_id_cuenta_banco THEN
			MessageBox("Error","La cuenta seleccionada no es equivalente a la definida en el archivo.~r"+&
							"Cuenta Seleccionada: "+ as_id_cuenta_banco+&
							"~rCuenta Archivo: "+ls_cuenta_banco)
			Return FAILURE
		END IF
		
		//Valida si es encabezado para tomar la fecha
		IF ls_record_type_code='H' THEN
			ls_fecha_transaccion= Mid(ls_registro, 38,8)
			lb_fecha_encabezado= True
			CONTINUE
		END IF
		
	ELSEIF ls_record_type_code='C' /*AND lb_fecha_encabezado=FALSE*/ THEN
		ls_fecha_transaccion= Mid(ls_registro, 36,8)
	END IF
	
	// se carga la fecha evaluando el tipo de formato
	ldt_DATE_TRANSACTION = of_set_date_transaction (ls_fecha_transaccion)
	
	
	ldec_TOTAL_AMOUNT			= Dec(Mid(ls_registro, 24,10) +'.'+ Mid(ls_registro, 34,2))
	//lll_ID_CODE_TRANSACTION	= 301
	ls_DES_TRANS_CORTA		= Mid(ls_registro, 52,45) //Additional Data
	
	IF Pos(ls_DES_TRANS_CORTA, "DEPOSIT")>0 THEN
		lll_ID_CODE_TRANSACTION	= 301
		//ldec_TOTAL_AMOUNT			= Dec(adw_archivo_plano.GetItemstring(li_i, "amount_credit" ))
	ELSE
		lll_ID_CODE_TRANSACTION	= 0
		//ldec_TOTAL_AMOUNT			= Dec(adw_archivo_plano.GetItemstring(li_i, "amount_debit" ))
	END IF
	
	SetNull(ls_DEPOSIT_CODE)
	SetNull(ls_DES_TRANS_LARGA)
	SetNull(ls_ADDITIONAL1)
	SetNull(ls_ADDITIONAL2)
	SetNull(ls_ADDITIONAL3)	
	
	
	//Fechas encontradas en el vector, indican que el usuario decidió no volver a cargarlas (borrar los registros
	//con igual fecha en base de datos) y se continua con el siguiente registro del ciclo FOR
	FOR li_j=1 TO UpperBound(ldt_fechas_NO_Carga)
		IF ldt_fechas_NO_Carga[li_j]= ldt_DATE_TRANSACTION THEN
			ls_read_next_record= True
			EXIT
		ELSE
			ls_read_next_record= False
		END IF
	NEXT
	
	IF ls_read_next_record THEN CONTINUE
	
	
	//Como en el archivo vienen varias fechas, se llena este para que no se haga la validación de si ya existen
	//en la base de datos, y asi evitar lecturas a la misma
	FOR li_j=1 TO UpperBound(ldt_fechas)
		IF ldt_fechas[li_j]= ldt_DATE_TRANSACTION THEN
			lb_ya_cargados=TRUE
			EXIT
		ELSE
			lb_ya_cargados=FALSE
		END IF
	NEXT
	
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
			ldt_fechas[UpperBound(ldt_fechas)+1]= ldt_DATE_TRANSACTION //DRT
			
			MessageBox("Información","Ya se encuentran registros cargados y reconciliados en la base de datos para la fecha " &
											+ string(ldt_DATE_TRANSACTION, "mm/dd/yyyy"),information!)
			RETURN failure
		ELSE
			IF li_existe>0 AND li_reconciliados=0 THEN
				li_respuesta = MessageBox("Información","Ya se encuentran registros cargados en la base de datos para la fecha " &
											+ string(ldt_DATE_TRANSACTION, "mm/dd/yyyy")+".~r¿Desea borrarlos y volver a realizar la carga?",Question!, YesNo!, 2)
				IF li_respuesta = 1 THEN
					TRY	
						DELETE	dba.BANK_STATEMENT
						WHERE		ID_CUENTA_BANCO	= :as_id_cuenta_banco
						AND		ID_BANCO				= :as_id_banco
						AND		DATE_TRANSACTION	= :ldt_DATE_TRANSACTION;					
					THROW CREATE c_sqlexception
					CATCH (c_sqlexception sql2)
						IF NOT sql2.exception() THEN
							sql2.of_set_condicion('Cuenta banco: '+as_id_cuenta_banco +&
														 '~rBanco: '+as_id_banco +&
														 '~rFecha transacción: '+String(ldt_DATE_TRANSACTION,"mm/dd/yyyy"))
							MessageBox("Error BD", sql2.getmessage(), StopSign! )
							RollBack;
							Return failure
						END IF
					END TRY		
				ELSE
					//RETURN failure 
					ldt_fechas_NO_Carga[UpperBound(ldt_fechas_NO_Carga)+1]= ldt_DATE_TRANSACTION //DRT
					CONTINUE
				END IF							
			END IF
			ldt_fechas[UpperBound(ldt_fechas)+1]= ldt_DATE_TRANSACTION //DRT
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
				  'N' ) ;
				  
	THROW CREATE c_sqlexception
		CATCH (c_sqlexception sql1)
			IF NOT sql1.exception() THEN
				MessageBox("Error BD", sql1.getmessage(), StopSign! )
				RollBack;
				Return failure
			END IF
		END TRY

NEXT

RETURN SUCCESS
end function

public function date of_set_date_transaction (string as_date);// función que se utiliza para realizar conversión de formato fecha
DATE ldt_DATE_TRANSACTION

// se asume por el momento que el archivo llegara con formato MMDDYYYY, sino podría aplicarse el script below
ldt_DATE_TRANSACTION= Date(  Mid(as_date,5,4)+'/'+Mid(as_date,1,2)+'/'+Mid(as_date,3,2)  )

/*CHOOSE CASE is_formato_fecha_corta
	CASE 'dd/MM/yyyy'
		//A pesar de que el formato en la configuración regional es dd/mm/yyyy, el archivo llega como
		//mm/dd/yyyy, entonces se debe rearmar el string
		ldt_DATE_TRANSACTION= Date(fn_token(as_date,'/',2) +"/" +fn_token(as_date,'/',1) +"/"+fn_token(as_date,'/',3))
		
	CASE "M/d/yyyy"
		ldt_DATE_TRANSACTION		= Date(as_date)
END CHOOSE*/

RETURN ldt_DATE_TRANSACTION
end function

on n_cst_carga_plano_banco_bank_of_america.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_carga_plano_banco_bank_of_america.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;n_cst_configuracion_regional ln_cst_configuracion_regional

ln_cst_configuracion_regional	= CREATE n_cst_configuracion_regional

is_formato_fecha_corta= ln_cst_configuracion_regional.of_get_formato_fecha_corta( )
end event

