$PBExportHeader$w_reconcilicacion_bancaria.srw
forward
global type w_reconcilicacion_bancaria from pfc_w_sheet
end type
type pb_ordenar from picturebutton within w_reconcilicacion_bancaria
end type
type st_13 from statictext within w_reconcilicacion_bancaria
end type
type st_12 from statictext within w_reconcilicacion_bancaria
end type
type pb_depurar_transacciones from picturebutton within w_reconcilicacion_bancaria
end type
type st_11 from statictext within w_reconcilicacion_bancaria
end type
type st_1 from statictext within w_reconcilicacion_bancaria
end type
type st_mensaje from statictext within w_reconcilicacion_bancaria
end type
type p_2 from picture within w_reconcilicacion_bancaria
end type
type pb_mover_reconciliationdate from picturebutton within w_reconcilicacion_bancaria
end type
type pb_sin_sistema from picturebutton within w_reconcilicacion_bancaria
end type
type hpb_progreso from hprogressbar within w_reconcilicacion_bancaria
end type
type ddlb_transaccion from my_ddlb within w_reconcilicacion_bancaria
end type
type st_10 from statictext within w_reconcilicacion_bancaria
end type
type dw_sysdata from datawindow within w_reconcilicacion_bancaria
end type
type ddlb_cuenta from my_ddlb within w_reconcilicacion_bancaria
end type
type pb_filtro_conciliados from picturebutton within w_reconcilicacion_bancaria
end type
type pb_codeposito_fecha from picturebutton within w_reconcilicacion_bancaria
end type
type pb_sin_historia_pagos from picturebutton within w_reconcilicacion_bancaria
end type
type pb_con_historia_pagos from picturebutton within w_reconcilicacion_bancaria
end type
type cb_query from commandbutton within w_reconcilicacion_bancaria
end type
type st_9 from statictext within w_reconcilicacion_bancaria
end type
type st_8 from statictext within w_reconcilicacion_bancaria
end type
type st_7 from statictext within w_reconcilicacion_bancaria
end type
type st_6 from statictext within w_reconcilicacion_bancaria
end type
type lst_banks from my_ddlb within w_reconcilicacion_bancaria
end type
type st_5 from statictext within w_reconcilicacion_bancaria
end type
type st_2 from statictext within w_reconcilicacion_bancaria
end type
type st_3 from statictext within w_reconcilicacion_bancaria
end type
type em_date1 from pfc_u_em within w_reconcilicacion_bancaria
end type
type pb_date1 from picturebutton within w_reconcilicacion_bancaria
end type
type st_4 from statictext within w_reconcilicacion_bancaria
end type
type em_date2 from pfc_u_em within w_reconcilicacion_bancaria
end type
type pb_date2 from picturebutton within w_reconcilicacion_bancaria
end type
type dw_sistema from datawindow within w_reconcilicacion_bancaria
end type
type dw_banco from datawindow within w_reconcilicacion_bancaria
end type
type gb_1 from groupbox within w_reconcilicacion_bancaria
end type
type r_1 from rectangle within w_reconcilicacion_bancaria
end type
type r_2 from rectangle within w_reconcilicacion_bancaria
end type
type r_3 from rectangle within w_reconcilicacion_bancaria
end type
type r_4 from rectangle within w_reconcilicacion_bancaria
end type
type r_5 from rectangle within w_reconcilicacion_bancaria
end type
type r_fecha_postergada from rectangle within w_reconcilicacion_bancaria
end type
end forward

global type w_reconcilicacion_bancaria from pfc_w_sheet
integer x = 0
integer y = 0
integer width = 4658
integer height = 2536
string title = "Reconciliación Bancaria"
long backcolor = 67108864
string icon = "AppIcon!"
pb_ordenar pb_ordenar
st_13 st_13
st_12 st_12
pb_depurar_transacciones pb_depurar_transacciones
st_11 st_11
st_1 st_1
st_mensaje st_mensaje
p_2 p_2
pb_mover_reconciliationdate pb_mover_reconciliationdate
pb_sin_sistema pb_sin_sistema
hpb_progreso hpb_progreso
ddlb_transaccion ddlb_transaccion
st_10 st_10
dw_sysdata dw_sysdata
ddlb_cuenta ddlb_cuenta
pb_filtro_conciliados pb_filtro_conciliados
pb_codeposito_fecha pb_codeposito_fecha
pb_sin_historia_pagos pb_sin_historia_pagos
pb_con_historia_pagos pb_con_historia_pagos
cb_query cb_query
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
lst_banks lst_banks
st_5 st_5
st_2 st_2
st_3 st_3
em_date1 em_date1
pb_date1 pb_date1
st_4 st_4
em_date2 em_date2
pb_date2 pb_date2
dw_sistema dw_sistema
dw_banco dw_banco
gb_1 gb_1
r_1 r_1
r_2 r_2
r_3 r_3
r_4 r_4
r_5 r_5
r_fecha_postergada r_fecha_postergada
end type
global w_reconcilicacion_bancaria w_reconcilicacion_bancaria

type variables
Boolean ib_filtrados

n_cst_reconciliation in_cst_reconciliation

integer ii_x, ii_y, ii_x2, ii_y2

String is_formato_fecha_corta
end variables

forward prototypes
public subroutine fnhideoptions ()
public subroutine of_botones (decimal adec_transaccion)
protected subroutine of_reconciliar (string as_tipo_reconciliacion)
public subroutine of_teclas ()
end prototypes

public subroutine fnhideoptions ();
end subroutine

public subroutine of_botones (decimal adec_transaccion);CHOOSE CASE adec_transaccion
	CASE 166 //ACH
		pb_con_historia_pagos.visible= False
		//pb_sin_historia_pagos.visible= False
		pb_codeposito_fecha.visible= False
		pb_sin_sistema.visible= False
		pb_mover_reconciliationdate.visible= False
		pb_filtro_conciliados.visible= False		
		pb_depurar_transacciones.visible= False		
	CASE ELSE
		pb_con_historia_pagos.visible= True
		//pb_sin_historia_pagos.visible= True
		pb_codeposito_fecha.visible= True
		pb_sin_sistema.visible= True
		pb_mover_reconciliationdate.visible= True
		pb_filtro_conciliados.visible= True		
		pb_depurar_transacciones.visible= True
END CHOOSE 
end subroutine

protected subroutine of_reconciliar (string as_tipo_reconciliacion);Integer		li_fila_banco, li_fila_sistema
String		ls_mensaje, ls_deposit_code, ls_des_trans_corta, ls_des_trans_larga, ls_nulo
DateTime		ldtm_transaction_date, ldt_nulo
Decimal{2}	ldec_total_amount_banco, ldec_total_amount_sys, ldec_nulo//, ldec_valor_sistema
Long			ll_cons_trans_diaria
LONG ll_i
//Date			ld_fecha_banco, ld_fecha_sistema


SetNull(ls_nulo)
SetNull(ldec_nulo)
SetNull(ldt_nulo)

li_fila_banco	= dw_banco.GetSelectedRow(0)
li_fila_sistema= dw_sistema.GetSelectedRow(0)

CHOOSE CASE as_tipo_reconciliacion
	CASE "H"
		//ls_mensaje= "Con historia de pagos"
		ls_mensaje= "Con valor y fecha"
	/*CASE "G"
		ls_mensaje= "Sin historia de pagos"*/
	CASE "B"
		ls_mensaje= "Coinciden en Código depósito y fecha"
	CASE  "SS"
		ls_mensaje= "Depósito sin registro en el sistema"
	CASE "MF"
		ls_mensaje= "Mover fecha de reconciliación"
	CASE "+-"
		ls_mensaje= "Depurar transacción"
END CHOOSE


IF MessageBox("Advertencia","¿Se encuentra seguro de reconciliar estos registros como: -"+ls_mensaje+"-?",Question!, yesNo!)=1 THEN
	IF li_fila_banco>0 AND li_fila_sistema>0 THEN
		ldtm_transaction_date	= dw_banco.GetItemDateTime(li_fila_banco, "date_transaction")
		ls_deposit_code			= dw_banco.GetItemString(li_fila_banco, "deposit_code")
		ldec_total_amount_banco	= dw_banco.GetItemDecimal(li_fila_banco, "total_amount")
		ldec_total_amount_sys	= dw_sistema.GetItemDecimal(li_fila_sistema, "total_amount")
		ll_cons_trans_diaria		= dw_sistema.GetItemNumber(li_fila_sistema, "cons_trans_diaria")
		ls_des_trans_corta		= dw_banco.GetItemString(li_fila_banco, "des_trans_corta")
		ls_des_trans_larga		= dw_banco.GetItemString(li_fila_banco, "des_trans_larga")
		

		CHOOSE CASE as_tipo_reconciliacion
			CASE "H"
				//Si el registro del banco con historia de pagos corresponde en fecha y valor debe permitir continuar con el proceso
				IF dw_sistema.Find("Date(reconciliationdate)=Date('"+String(ldtm_transaction_date, is_formato_fecha_corta)+ "') AND "+&
								"Truncate(total_amount,2)=Truncate(Dec('" +String(ldec_total_amount_banco)+"'),2)", li_fila_sistema, li_fila_sistema)<=0 THEN
					MessageBox("Error","El registro del banco no es equivalente en fecha y valor al seleccionado en el sistema."&
									+"Por ende no puede conciliarse como: Con historia de pagos.", StopSign!)
					Return
				END IF
				
				/*ld_fecha_banco = Date(String(ldtm_transaction_date, "dd-mm-yyyy"))
				ld_fecha_sistema = Date(dw_sistema.Object.reconciliationdate[li_fila_sistema])
				ldec_valor_sistema = Truncate(dw_sistema.Object.total_amount[li_fila_sistema],2)
				
				IF ld_fecha_banco <> ld_fecha_sistema THEN
					MessageBox("Error","El registro del banco no es equivalente en fecha y valor al seleccionado en el sistema."&
									+"Por ende no puede conciliarse como: Con historia de pagos.", StopSign!)		
					Return
				ELSE
					IF ldec_total_amount_banco <> ldec_valor_sistema THEN
						MessageBox("Error","El registro del banco no es equivalente en fecha y valor al seleccionado en el sistema."&
										+"Por ende no puede conciliarse como: Con historia de pagos.", StopSign!)		
						Return
					END IF
				END IF*/
			/*CASE "G"
				//Si el registro del banco con historia de pagos corresponde en fecha y valor debe permitir continuar con el proceso
				IF dw_sistema.Find("Date(reconciliationdate)=Date("+String(ldtm_transaction_date, "yyyy-mm-dd")+ ") AND "+&
								"Truncate(total_amount,2)=Dec(" +String(ldec_total_amount_banco)+")", li_fila_sistema, li_fila_sistema)<=0 THEN
					MessageBox("Error","El registro del banco no es equivalente en fecha y valor al seleccionado en el sistema."&
									+"Por ende no puede conciliarse como: Sin historia de pagos.", StopSign!)
					Return
				END IF*/
			CASE "B"
				IF dw_sistema.Find("Date(reconciliationdate)=Date('"+String(ldtm_transaction_date, is_formato_fecha_corta)+ "') AND "+&
								"deposit_code='"+ ls_deposit_code + "'", li_fila_sistema, li_fila_sistema)<=0 THEN
					MessageBox("Error","El registro del banco no es equivalente en fecha y código de deposito al seleccionado en el sistema."&
									+"Por ende no puede conciliarse como: Coinciden en Código depósito y fecha.", StopSign!)
					Return
				END IF
		
			CASE ELSE 
				Return
				
		END CHOOSE

		in_cst_reconciliation.of_set_des_trans_corta( ls_des_trans_corta)
		in_cst_reconciliation.of_set_des_trans_larga( ls_des_trans_larga)
		in_cst_reconciliation.of_set_cons_trans_diaria(ll_cons_trans_diaria)
		in_cst_reconciliation.of_set_total_amount_sys( ldec_total_amount_sys)
		in_cst_reconciliation.of_set_total_amount_banco( ldec_total_amount_banco)
		
		IF in_cst_reconciliation.of_update_conciliados( ldtm_transaction_date, ls_deposit_code, ldec_total_amount_banco,as_tipo_reconciliacion)<>1 THEN
			Return 
		ELSE 
			IF as_tipo_reconciliacion='H' /*or as_tipo_reconciliacion='G'*/ THEN
				dw_banco.SetItem(li_fila_banco, "flag_reconciliation","S")
				dw_sistema.SetItem(li_fila_sistema, "flag_reconciliation","S")
				
				IF li_fila_banco <> li_fila_sistema THEN
					dw_sistema.Object.reconciliationdate[li_fila_banco] 	= dw_sistema.Object.reconciliationdate[li_fila_sistema]
					dw_sistema.Object.deposit_code[li_fila_banco] 			= dw_sistema.Object.deposit_code[li_fila_sistema]
					dw_sistema.Object.des_trans_diaria[li_fila_banco] 		= dw_sistema.Object.des_trans_diaria[li_fila_sistema]
					dw_sistema.Object.total_amount[li_fila_banco] 			= dw_sistema.Object.total_amount[li_fila_sistema]
					dw_sistema.Object.id_branch[li_fila_banco] 				= dw_sistema.Object.id_branch[li_fila_sistema]
					dw_sistema.Object.flag_reconciliation[li_fila_banco] 	= dw_sistema.Object.flag_reconciliation[li_fila_sistema]
					dw_sistema.Object.cons_trans_diaria[li_fila_banco] 	= dw_sistema.Object.cons_trans_diaria[li_fila_sistema]
					dw_sistema.DeleteRow(li_fila_sistema)
					dw_banco.DeleteRow(li_fila_sistema)
				END IF
			ELSE
				dw_banco.SetItem(li_fila_banco, "flag_reconciliation",as_tipo_reconciliacion)
				dw_sistema.SetItem(li_fila_sistema, "flag_reconciliation",as_tipo_reconciliacion)
			END IF
			

			in_cst_reconciliation.of_set_cons_trans_diaria(ll_cons_trans_diaria)
			
			IF in_cst_reconciliation.of_update_flag()<>1 THEN
				Return
			END IF
			commit;

			//Para que no vuelvan a seleccionar dos registros ya conciliados
			/*IF as_tipo_reconciliacion<>'H' THEN
				dw_banco.SetItem(li_fila_banco, "flag_sugerencia","S")
				dw_sistema.SetItem(li_fila_sistema, "flag_sugerencia","S")
				
				IF IsNull(dw_sistema.GetItemNumber(li_fila_sistema, "c_num_registro")) THEN
					dw_sistema.SetItem(li_fila_sistema, "c_num_registro", li_fila_banco)
				END IF
				
				IF IsNull(dw_sistema.GetItemNumber(li_fila_banco, "c_num_registro")) THEN
					dw_sistema.SetItem(li_fila_banco, "c_num_registro", li_fila_sistema)
				END IF
				
				dw_sistema.SetItem(li_fila_sistema, "total_amount", ldec_total_amount_banco)
				
				dw_sistema.SetSort("c_num_registro asc")
				dw_sistema.Sort()
				dw_banco.SetSort("c_num_registro asc")
				dw_banco.Sort()
			END IF*/
		END IF
	ELSEIF li_fila_banco > 0 AND li_fila_sistema=0 AND as_tipo_reconciliacion='SS' THEN //SIN SISTEMA
		IF in_cst_reconciliation.of_sin_sistema( dw_banco, dw_sistema, li_fila_banco) THEN
			/*PARA EJECUTAR EL PROCESO DE SIN SISTEMA AUTOMATICO PARA TODOS LOS REGISTROS, SE DEBE HABILITAR
			EL REGISTRO DE ABAJO Y COMENTAR EL DE ARRIBA*/
		//IF in_cst_reconciliation.of_sin_sistema_multiregistro( dw_banco, dw_sistema) THEN
			COMMIT;
		ELSE
			RollBack;
		END IF
	ELSEIF li_fila_banco = 0 AND li_fila_sistema>0 AND as_tipo_reconciliacion='MF' THEN
		// se habilita un procedimiento de actualización masiva, para permitir
		// la selección de varias filas
		FOR ll_i = 1 TO dw_sistema.RowCount()
			// sólo se procesan los registro seleccionados
			IF dw_sistema.IsSelected (ll_i) THEN
				// se remplaza el apuntador (li_fila_sistema) por (ll_i) 
				ll_cons_trans_diaria	= dw_sistema.GetItemNumber(ll_i, "cons_trans_diaria")
				ldtm_transaction_date= dw_sistema.GetItemDateTime(ll_i, "reconciliationdate")
				
				in_cst_reconciliation.of_set_cons_trans_diaria( ll_cons_trans_diaria)
				
		
				IF in_cst_reconciliation.of_mover_fecha_reconciliacion(ldtm_transaction_date) THEN
					dw_sistema.DeleteRow(ll_i)
					
					IF dw_banco.GetItemString(ll_i, "flag_reconciliation")= "?" THEN
						dw_banco.DeleteRow(ll_i)
					ELSE
						dw_banco.SetItem(ll_i, "date_transaction", ldt_nulo)
						dw_banco.SetItem(ll_i, "deposit_code", ls_nulo)				
						dw_banco.SetItem(ll_i, "des_trans_corta", ls_nulo)								
						dw_banco.SetItem(ll_i, "total_amount", ldec_nulo)
					END IF
					
					// como se borra el registro del datawindows, se decrementa el contador
					ll_i = ll_i - 1
					
					commit;
				END IF
				
			END IF // fin de la validación de registro seleccionado
		NEXT
		
	ELSEIF li_fila_banco = 0 AND li_fila_sistema>0 AND as_tipo_reconciliacion='+-' THEN
		IF in_cst_reconciliation.of_depurar_transaccion(dw_sistema,dw_banco,li_fila_sistema ) =1 THEN
			Commit;
		ELSE
			RollBack;
		END IF
	ELSE
		MessageBox("Error","Debe seleccionar un registro por banco y/o sistema para reconciliar",Stopsign!)
		Return
	END IF
ELSE

END IF



dw_banco.SelectRow(0, False)
dw_sistema.SelectRow(0, False)
end subroutine

public subroutine of_teclas ();IF KeyDown(KeyH!) AND KeyDown(KeyShift!) THEN
	pb_con_historia_pagos.event clicked( )
ELSEIF KeyDown(KeyC!) AND KeyDown(KeyShift!) THEN
	pb_codeposito_fecha.event clicked( )
ELSEIF KeyDown(KeyS!) AND KeyDown(KeyShift!) THEN
	pb_sin_sistema.event clicked( )
ELSEIF KeyDown(KeyR!) AND KeyDown(KeyShift!) THEN
	pb_mover_reconciliationdate.event clicked( )
ELSEIF KeyDown(KeyD!) AND KeyDown(KeyShift!) THEN
	pb_depurar_transacciones.event clicked( )	
ELSEIF KeyDown(KeyF!) AND KeyDown(KeyShift!) THEN
	pb_filtro_conciliados.event clicked( )		
ELSEIF KeyDown(KeyO!) AND KeyDown(KeyShift!) THEN
	pb_ordenar.event clicked( )		
END IF


end subroutine

on w_reconcilicacion_bancaria.create
int iCurrent
call super::create
this.pb_ordenar=create pb_ordenar
this.st_13=create st_13
this.st_12=create st_12
this.pb_depurar_transacciones=create pb_depurar_transacciones
this.st_11=create st_11
this.st_1=create st_1
this.st_mensaje=create st_mensaje
this.p_2=create p_2
this.pb_mover_reconciliationdate=create pb_mover_reconciliationdate
this.pb_sin_sistema=create pb_sin_sistema
this.hpb_progreso=create hpb_progreso
this.ddlb_transaccion=create ddlb_transaccion
this.st_10=create st_10
this.dw_sysdata=create dw_sysdata
this.ddlb_cuenta=create ddlb_cuenta
this.pb_filtro_conciliados=create pb_filtro_conciliados
this.pb_codeposito_fecha=create pb_codeposito_fecha
this.pb_sin_historia_pagos=create pb_sin_historia_pagos
this.pb_con_historia_pagos=create pb_con_historia_pagos
this.cb_query=create cb_query
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.lst_banks=create lst_banks
this.st_5=create st_5
this.st_2=create st_2
this.st_3=create st_3
this.em_date1=create em_date1
this.pb_date1=create pb_date1
this.st_4=create st_4
this.em_date2=create em_date2
this.pb_date2=create pb_date2
this.dw_sistema=create dw_sistema
this.dw_banco=create dw_banco
this.gb_1=create gb_1
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.r_4=create r_4
this.r_5=create r_5
this.r_fecha_postergada=create r_fecha_postergada
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_ordenar
this.Control[iCurrent+2]=this.st_13
this.Control[iCurrent+3]=this.st_12
this.Control[iCurrent+4]=this.pb_depurar_transacciones
this.Control[iCurrent+5]=this.st_11
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_mensaje
this.Control[iCurrent+8]=this.p_2
this.Control[iCurrent+9]=this.pb_mover_reconciliationdate
this.Control[iCurrent+10]=this.pb_sin_sistema
this.Control[iCurrent+11]=this.hpb_progreso
this.Control[iCurrent+12]=this.ddlb_transaccion
this.Control[iCurrent+13]=this.st_10
this.Control[iCurrent+14]=this.dw_sysdata
this.Control[iCurrent+15]=this.ddlb_cuenta
this.Control[iCurrent+16]=this.pb_filtro_conciliados
this.Control[iCurrent+17]=this.pb_codeposito_fecha
this.Control[iCurrent+18]=this.pb_sin_historia_pagos
this.Control[iCurrent+19]=this.pb_con_historia_pagos
this.Control[iCurrent+20]=this.cb_query
this.Control[iCurrent+21]=this.st_9
this.Control[iCurrent+22]=this.st_8
this.Control[iCurrent+23]=this.st_7
this.Control[iCurrent+24]=this.st_6
this.Control[iCurrent+25]=this.lst_banks
this.Control[iCurrent+26]=this.st_5
this.Control[iCurrent+27]=this.st_2
this.Control[iCurrent+28]=this.st_3
this.Control[iCurrent+29]=this.em_date1
this.Control[iCurrent+30]=this.pb_date1
this.Control[iCurrent+31]=this.st_4
this.Control[iCurrent+32]=this.em_date2
this.Control[iCurrent+33]=this.pb_date2
this.Control[iCurrent+34]=this.dw_sistema
this.Control[iCurrent+35]=this.dw_banco
this.Control[iCurrent+36]=this.gb_1
this.Control[iCurrent+37]=this.r_1
this.Control[iCurrent+38]=this.r_2
this.Control[iCurrent+39]=this.r_3
this.Control[iCurrent+40]=this.r_4
this.Control[iCurrent+41]=this.r_5
this.Control[iCurrent+42]=this.r_fecha_postergada
end on

on w_reconcilicacion_bancaria.destroy
call super::destroy
destroy(this.pb_ordenar)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.pb_depurar_transacciones)
destroy(this.st_11)
destroy(this.st_1)
destroy(this.st_mensaje)
destroy(this.p_2)
destroy(this.pb_mover_reconciliationdate)
destroy(this.pb_sin_sistema)
destroy(this.hpb_progreso)
destroy(this.ddlb_transaccion)
destroy(this.st_10)
destroy(this.dw_sysdata)
destroy(this.ddlb_cuenta)
destroy(this.pb_filtro_conciliados)
destroy(this.pb_codeposito_fecha)
destroy(this.pb_sin_historia_pagos)
destroy(this.pb_con_historia_pagos)
destroy(this.cb_query)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.lst_banks)
destroy(this.st_5)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date1)
destroy(this.pb_date1)
destroy(this.st_4)
destroy(this.em_date2)
destroy(this.pb_date2)
destroy(this.dw_sistema)
destroy(this.dw_banco)
destroy(this.gb_1)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
destroy(this.r_4)
destroy(this.r_5)
destroy(this.r_fecha_postergada)
end on

event open;call super::open;n_cst_configuracion_regional ln_cst_configuracion_regional

lst_banks.addquery(  "SELECT name_BANCO, "+&
   "      id_BANCO "+&
   " FROM dba.banco   "+&
	" ORDER BY 1;")
dw_banco.SetTransObject(Sqlca)
dw_sistema.SetTransObject(Sqlca)
dw_sysdata.SetTransObject(Sqlca)

x=1
Y=1

in_cst_reconciliation			= CREATE n_cst_reconciliation
ln_cst_configuracion_regional	= CREATE n_cst_configuracion_regional

is_formato_fecha_corta= ln_cst_configuracion_regional.of_get_formato_fecha_corta( )

//Dais is kompliziert
end event

type pb_ordenar from picturebutton within w_reconcilicacion_bancaria
integer x = 1728
integer y = 308
integer width = 283
integer height = 184
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "C:\ViamericasMT\imagenes\btn-ordenar.gif"
string powertiptext = "Ordenar por estado (Shift + O)"
end type

event clicked;dw_banco.SetSort("c_sort_color asc, c_num_registro asc")
dw_banco.Sort()

dw_sistema.SetSort("c_sort_color asc, c_num_registro asc")
dw_sistema.Sort()


end event

type st_13 from statictext within w_reconcilicacion_bancaria
integer x = 3360
integer y = 2308
integer width = 544
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 23620556
string text = "Días anteriores"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_12 from statictext within w_reconcilicacion_bancaria
integer x = 2784
integer y = 2308
integer width = 544
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 25540278
string text = "Coinciden valor y fecha"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_depurar_transacciones from picturebutton within w_reconcilicacion_bancaria
integer x = 1161
integer y = 308
integer width = 283
integer height = 184
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ViamericasMT\imagenes\btn-refrescar.gif"
string powertiptext = "Depurar transacciones (Shift + D)"
end type

event clicked;of_reconciliar("+-")
end event

type st_11 from statictext within w_reconcilicacion_bancaria
integer x = 2299
integer y = 180
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "mm/dd/aaaa"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_reconcilicacion_bancaria
integer x = 782
integer y = 184
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "mm/dd/aaaa"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_mensaje from statictext within w_reconcilicacion_bancaria
integer x = 2656
integer y = 424
integer width = 1934
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "..."
alignment alignment = right!
boolean focusrectangle = false
end type

type p_2 from picture within w_reconcilicacion_bancaria
integer x = 3383
integer y = 188
integer width = 64
integer height = 56
boolean originalsize = true
string picturename = "C:\ViamericasMT\imagenes\buscar.gif"
boolean focusrectangle = false
end type

event clicked;cb_query.event clicked( )
end event

type pb_mover_reconciliationdate from picturebutton within w_reconcilicacion_bancaria
integer x = 878
integer y = 308
integer width = 283
integer height = 184
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "C:\ViamericasMT\imagenes\btnMoverFecha.gif"
string powertiptext = "Mover Fecha de reconciliación (Shift + R)"
end type

event clicked;of_reconciliar("MF")
end event

type pb_sin_sistema from picturebutton within w_reconcilicacion_bancaria
integer x = 594
integer y = 308
integer width = 283
integer height = 184
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "C:\ViamericasMT\imagenes\btnSistemaOff.gif"
string powertiptext = "Sin sistema (Shift + S)"
end type

event clicked;of_reconciliar("SS")
end event

type hpb_progreso from hprogressbar within w_reconcilicacion_bancaria
integer x = 27
integer y = 504
integer width = 4571
integer height = 52
unsignedinteger maxposition = 100
integer setstep = 1
boolean smoothscroll = true
end type

event clicked;///
end event

type ddlb_transaccion from my_ddlb within w_reconcilicacion_bancaria
integer x = 3346
integer y = 56
integer width = 1189
integer height = 808
integer taborder = 30
boolean bringtotop = true
end type

event selectionchanged;call super::selectionchanged;of_botones(Dec(ddlb_transaccion.getdataid( )))
end event

type st_10 from statictext within w_reconcilicacion_bancaria
integer x = 3035
integer y = 68
integer width = 306
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Transacción:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_sysdata from datawindow within w_reconcilicacion_bancaria
boolean visible = false
integer x = 526
integer y = 1576
integer width = 2295
integer height = 632
boolean titlebar = true
string title = "none"
string dataobject = "d_datos_sistema"
boolean vscrollbar = true
boolean livescroll = true
end type

type ddlb_cuenta from my_ddlb within w_reconcilicacion_bancaria
integer x = 1847
integer y = 52
integer width = 1189
integer height = 808
integer taborder = 20
boolean bringtotop = true
end type

type pb_filtro_conciliados from picturebutton within w_reconcilicacion_bancaria
integer x = 1445
integer y = 308
integer width = 283
integer height = 184
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "C:\ViamericasMT\imagenes\btn-cinco-on.gif"
string powertiptext = "Filtrar Conciliados (Shift + F)"
end type

event clicked;IF ib_filtrados= False  THEN
	dw_banco.SetFilter("flag_reconciliation<>'S'")
	dw_banco.Filter()
	
	dw_sistema.SetFilter("flag_reconciliation<>'S'")
	dw_sistema.Filter()
	ib_filtrados= True
	PictureName = "imagenes\btn-cinco-off.gif"
ELSE
	dw_banco.SetFilter("")
	dw_banco.Filter()
	
	dw_sistema.SetFilter("")
	dw_sistema.Filter()
	ib_filtrados= FALSE
	PictureName = "imagenes\btn-cinco-on.gif"
END IF

//dw_banco.SetSort("c_num_registro asc")
//dw_banco.Sort()
//
//dw_sistema.SetSort("c_num_registro asc")
//dw_sistema.Sort()

dw_banco.SetSort("c_sort_color asc, c_num_registro asc")
dw_banco.Sort()

dw_sistema.SetSort("c_sort_color asc, c_num_registro asc")
dw_sistema.Sort()
end event

type pb_codeposito_fecha from picturebutton within w_reconcilicacion_bancaria
integer x = 311
integer y = 308
integer width = 283
integer height = 184
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "C:\ViamericasMT\imagenes\btn-cuatro.gif"
string powertiptext = "Coinciden Código Depósito y Fecha (Shift + C)"
end type

event clicked;of_reconciliar("B")
end event

type pb_sin_historia_pagos from picturebutton within w_reconcilicacion_bancaria
boolean visible = false
integer x = 2313
integer y = 304
integer width = 283
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "C:\ViamericasMT\imagenes\btn-tres.gif"
string powertiptext = "Sin Historia de pagos"
end type

event clicked;of_reconciliar("G")
end event

type pb_con_historia_pagos from picturebutton within w_reconcilicacion_bancaria
integer x = 27
integer y = 308
integer width = 283
integer height = 184
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "C:\ViamericasMT\imagenes\btn-dos.gif"
string powertiptext = "Con valor y fecha (Shift + H)"
end type

event clicked;of_reconciliar("H")
end event

type cb_query from commandbutton within w_reconcilicacion_bancaria
integer x = 3063
integer y = 172
integer width = 425
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
end type

event clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_id_banco, ls_id_cuenta_banco, ls_fechaini, ls_fechafin
Long			ll_id_code_transaction
Dec			ldec_id_code_transaction, ldec_amount_ACH


Setpointer(Hourglass!)

dw_banco.Reset() // información recuperada de archivo banco (bank_statement)
dw_sysdata.Reset() // información recuperada de los movimientos del sistema
dw_sistema.Reset() // información producto de la reconciliación

// se cargan los valores ingresados
ls_id_banco					= lst_banks.getdataid( )
ls_id_cuenta_banco		= ddlb_cuenta.getdataid( )
ldec_id_code_transaction= Dec(ddlb_transaccion.getdataid( ))

// se realiza validación del formato de fecha para asignar en variables
CHOOSE CASE is_formato_fecha_corta
		CASE 'dd/MM/yyyy', 'dd/MM/yy', 'd/MM/yyyy', 'd/M/yy', 'dd-MM-yy'
			ls_fechaini					= Mid(em_date1.text, 4,3)+Mid(em_date1.text, 1,3)+Mid(em_date1.text, 7)
			ls_fechafin					= Mid(em_date2.text, 4,3)+Mid(em_date2.text, 1,3)+Mid(em_date2.text, 7)
			
		CASE "M/d/yyyy", 'MM/dd/yyyy', 'M/d/yy'
			ls_fechaini					= Mid(em_date1.text, 1,3)+Mid(em_date1.text, 4,3)+Mid(em_date1.text, 7)
			ls_fechafin					= Mid(em_date2.text, 1,3)+Mid(em_date2.text, 4,3)+Mid(em_date2.text, 7)
	END CHOOSE

// se realiza seteo de las fecha_hora al inicio y final del día correspondiente
ld_fecha1 					= Datetime(Date(ls_fechaini),time('00:00:00'))
ld_fecha2 					= Datetime(Date(ls_fechafin),time('23:59:59'))

// se carga las variables de instancia del objeto que realiza el
// proceso de reconciliación
in_cst_reconciliation.of_set_id_banco( ls_id_banco)
in_cst_reconciliation.of_set_id_cuenta_banco( ls_id_cuenta_banco)
in_cst_reconciliation.of_set_id_code_transaction(ldec_id_code_transaction)

// se realiza el procedimiento de acuero al código de la transacción
CHOOSE CASE ldec_id_code_transaction
	CASE 166 //ACH
		IF dw_banco.Retrieve(ls_id_banco, ls_id_cuenta_banco, ld_Fecha1,ld_Fecha2, ldec_id_code_transaction)>0 THEN
			ldec_amount_ACH= dw_banco.GetItemDecimal(1,"total_amount")
			IF NOT in_cst_reconciliation.of_validar_ach(ld_fecha1, ld_fecha2 , ldec_amount_ACH, dw_sistema, dw_banco) THEN
				Return
			END IF
			COMMIT;
		END IF	

	CASE 301 // Depósitos bancarios
		// se recupera los registros del banco y movimientos del sistema
		dw_banco.Retrieve(ls_id_banco, ls_id_cuenta_banco, ld_Fecha1,ld_Fecha2, ldec_id_code_transaction)
		dw_sysdata.Retrieve(ls_id_banco, ls_id_cuenta_banco, ld_Fecha1,ld_Fecha2, ldec_id_code_transaction)
		
		// Se ordena la información a procesar
		IF Trim (ls_id_banco) = 'B OF A' THEN // Banco Of. America
			// Para el banco Of. America se le debe dar prioridad al campo ADDICIONAL1, el
			// cual contiene la información de la agencia ID_BRANCH
			dw_banco.SetSort("date_transaction asc, additional1 desc, total_amount asc")
		ELSE
			// se realiza un ordenamiento, dando prioridad a los registros de banco con información
			// en el campo DEPSIT_CODE, con el fin de rastrearla con los movimientos del sistema
			dw_banco.SetSort("date_transaction asc, deposit_code desc, total_amount asc")
		END IF
		dw_banco.Sort()
		dw_banco.SetFocus()
		
		//Realiza la reconciliación automática de registros y deja organizados algunos para que sean apareados manualmente
		//por los usuarios
		in_cst_reconciliation.n_cst_reconciliation( dw_sysdata, dw_sistema, dw_banco, hpb_progreso)
		
		w_reconcilicacion_bancaria.st_mensaje.Text='Reconciliación finalizada'
		
END CHOOSE
end event

type st_9 from statictext within w_reconcilicacion_bancaria
integer x = 2194
integer y = 2304
integer width = 558
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 23256799
string text = "Coinciden código depósito y fecha"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_reconcilicacion_bancaria
integer x = 1669
integer y = 2320
integer width = 471
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 32239777
string text = "Sin historia de pagos"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_reconcilicacion_bancaria
integer x = 1074
integer y = 2320
integer width = 489
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 27690517
string text = "Con historia de pagos"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_reconcilicacion_bancaria
integer x = 558
integer y = 2320
integer width = 343
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 22663829
string text = "Conciliados"
alignment alignment = center!
boolean focusrectangle = false
end type

type lst_banks from my_ddlb within w_reconcilicacion_bancaria
integer x = 343
integer y = 56
integer width = 1189
integer height = 808
integer taborder = 10
boolean bringtotop = true
end type

event selectionchanged;call super::selectionchanged;String ls_id_banco

ls_id_banco = lst_banks.getdataid()

ddlb_cuenta.addquery(  "SELECT RTRIM(dba.CUENTA_BANCO.NAME_CUENTA_BANCO) + ' - '+dba.CUENTA_BANCO.ID_CUENTA_BANCO, "+&
								"      dba.CUENTA_BANCO.ID_CUENTA_BANCO "+&
								" FROM dba.CUENTA_BANCO   "+&
								" WHERE dba.CUENTA_BANCO.ID_BANCO ='"+ls_id_banco +"'"+&
								" ORDER BY 1;")
	
ddlb_transaccion.addquery(	"SELECT dba.CONCEPTO_CONTABLE.NAME_CONCEPTO_CONTABLE, "+&
									 "     dba.BANK_TRANSACTIONS.ID_CODE_TRANSACTION "+&
									"FROM dba.BANK_TRANSACTIONS, "+&
									"	 dba.CONCEPTO_CONTABLE "+&
									"WHERE dba.BANK_TRANSACTIONS.ID_BANCO ='"+ls_id_banco +"' AND "+&
									"	 dba.CONCEPTO_CONTABLE.ID_CONCEPTO_CONTABLE = dba.BANK_TRANSACTIONS.ID_CONCEPTO_CONTABLE;")
									
				
of_botones(Dec(ddlb_transaccion.getdataid( )))

end event

type st_5 from statictext within w_reconcilicacion_bancaria
integer x = 1627
integer y = 68
integer width = 302
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Cuenta:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_reconcilicacion_bancaria
integer x = 41
integer y = 76
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Banco:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_reconcilicacion_bancaria
integer x = 41
integer y = 184
integer width = 297
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Fecha Inicial:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date1 from pfc_u_em within w_reconcilicacion_bancaria
integer x = 343
integer y = 172
integer width = 320
integer height = 84
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

event modified;call super::modified;em_date2.Text= em_date1.Text
end event

event pfc_ddcalendar;//Ancestro extendido
iuo_calendar.of_setdateformat( "mm/dd/yyyy")

If IsValid(iuo_calendar) Then
	Return iuo_calendar.Event pfc_dropdown()
End If

Return 0

end event

type pb_date1 from picturebutton within w_reconcilicacion_bancaria
integer x = 672
integer y = 172
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\ViamericasMT\imagenes\calendar.gif"
alignment htextalign = right!
end type

event clicked;em_date1.Event pfc_DDCalendar( )
end event

type st_4 from statictext within w_reconcilicacion_bancaria
integer x = 1563
integer y = 184
integer width = 274
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Fecha Final:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date2 from pfc_u_em within w_reconcilicacion_bancaria
integer x = 1847
integer y = 172
integer width = 320
integer height = 84
integer taborder = 60
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

event pfc_ddcalendar;//Ancestro extendido
iuo_calendar.of_setdateformat( "mm/dd/yyyy")

If IsValid(iuo_calendar) Then
	Return iuo_calendar.Event pfc_dropdown()
End If

Return 0

end event

type pb_date2 from picturebutton within w_reconcilicacion_bancaria
integer x = 2181
integer y = 172
integer width = 101
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\ViamericasMT\imagenes\calendar.gif"
alignment htextalign = right!
end type

event clicked;em_date2.Event pfc_DDCalendar( )
end event

type dw_sistema from datawindow within w_reconcilicacion_bancaria
event ue_move pbm_move
event ue_teclas pbm_dwnkey
event ue_mousemove pbm_dwnmousemove
integer x = 2107
integer y = 568
integer width = 2510
integer height = 1720
integer taborder = 160
boolean titlebar = true
string title = "Información Vía Central"
string dataobject = "d_datos_sistema"
boolean vscrollbar = true
boolean livescroll = true
end type

event ue_move;IF ((This.x <> ii_x2) OR (This.y <> ii_y2)) THEN
	This.x = ii_x2
	This.y = ii_y2
END IF
end event

event ue_teclas;of_teclas()
end event

event scrollvertical;dw_banco.Object.datawindow.verticalscrollposition = scrollpos
end event

event clicked;String ls_flag, ls_flag_sugerencia, ls_deposit_code		
DateTime	ldtm_transaction_date
Decimal{2} ldec_total_amount_banco

IF row>0 THEN
	ls_flag= GetItemString(row, "flag_reconciliation")
	ls_flag_sugerencia= GetItemString(row, "flag_sugerencia")
	CHOOSE CASE ls_flag
		CASE 'H', 'G', 'B', 'N', "V", "F"
			ldtm_transaction_date	= dw_banco.GetItemDateTime(row, "date_transaction")
			ls_deposit_code			= dw_banco.GetItemString(row, "deposit_code")
			ldec_total_amount_banco = dw_banco.GetItemDecimal(row, "total_amount")

			IF ls_flag='N' AND IsNull(ldtm_transaction_date) AND IsNull(ls_deposit_code) AND &
				IsNull(ldec_total_amount_banco) THEN			
				IF ls_flag_sugerencia <>'S' THEN
					IF IsSelected(Row) THEN
						This.SelectRow(ROW, False)
					ELSE
						This.SelectRow(row, True)
					END IF	
				END IF
			ELSE
				IF ls_flag_sugerencia <>'S' THEN
					IF IsSelected(Row) THEN
						This.SelectRow(ROW, False)
					ELSE
						IF ls_flag='F' THEN
							This.SelectRow(row, True)
						ELSE
							This.SelectRow(0, False)
							This.SelectRow(row, True)
						END IF
					END IF	
				END IF
			END IF
			
			
	END CHOOSE
END IF


end event

event constructor;ii_x2 = x
ii_y2 = y

end event

event doubleclicked;String ls_informacion
IF Isvalid(w_info_registro_pendiente) then close(w_info_registro_pendiente)

If Row>0 AND GetItemString(row, "flag_reconciliation")='F' THEN
	ls_informacion= "Fecha Transacción: " + String(GetItemDatetime(row, "date_trans_diaria"),"mm/dd/yyyy") +&
						 "~rCajero: "+ GetItemString(row, "add_cashier")
	OpenwithParm(w_info_registro_pendiente,ls_informacion )
//	w_info_registro_pendiente.X= w_reconcilicacion_bancaria.X
//	w_info_registro_pendiente.Y= w_reconcilicacion_bancaria.Y
	
//	MessageBox(string(w_reconcilicacion_bancaria.x), w_reconcilicacion_bancaria(y))
	
END IF
end event

type dw_banco from datawindow within w_reconcilicacion_bancaria
event ue_move pbm_move
event ue_teclas pbm_dwnkey
integer x = 5
integer y = 568
integer width = 2098
integer height = 1720
integer taborder = 150
boolean titlebar = true
string title = "Información Banco"
string dataobject = "d_datos_banco"
boolean vscrollbar = true
boolean livescroll = true
end type

event ue_move;IF ((This.x <> ii_x) OR (This.y <> ii_y)) THEN
	This.x = ii_x
	This.y = ii_y
END IF

end event

event ue_teclas;of_teclas()
end event

event scrollvertical;dw_sistema.Object.datawindow.verticalscrollposition = scrollpos
end event

event clicked;String ls_flag, ls_flag_sugerencia

IF row>0 THEN
	ls_flag= GetItemString(row, "flag_reconciliation")
	ls_flag_sugerencia= GetItemString(row, "flag_sugerencia")
	CHOOSE CASE ls_flag
		CASE 'H', 'G', 'B', 'N', "V","F"
			IF ls_flag_sugerencia <>'S' THEN
				IF IsSelected(Row) THEN
					This.SelectRow(ROW, False)
				ELSE
					This.SelectRow(0, False)
					This.SelectRow(row, True)
				END IF
			END IF
	END CHOOSE
END IF
end event

event constructor;ii_x = x
ii_y = y
end event

type gb_1 from groupbox within w_reconcilicacion_bancaria
integer x = 5
integer width = 4576
integer height = 296
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type r_1 from rectangle within w_reconcilicacion_bancaria
integer linethickness = 4
long fillcolor = 22663829
integer x = 453
integer y = 2300
integer width = 581
integer height = 120
end type

type r_2 from rectangle within w_reconcilicacion_bancaria
integer linethickness = 4
long fillcolor = 27690517
integer x = 1029
integer y = 2300
integer width = 581
integer height = 120
end type

type r_3 from rectangle within w_reconcilicacion_bancaria
integer linethickness = 4
long fillcolor = 32239777
integer x = 1605
integer y = 2300
integer width = 581
integer height = 120
end type

type r_4 from rectangle within w_reconcilicacion_bancaria
integer linethickness = 4
long fillcolor = 23256799
integer x = 2181
integer y = 2300
integer width = 581
integer height = 120
end type

type r_5 from rectangle within w_reconcilicacion_bancaria
integer linethickness = 4
long fillcolor = 25540278
integer x = 2757
integer y = 2300
integer width = 581
integer height = 120
end type

type r_fecha_postergada from rectangle within w_reconcilicacion_bancaria
integer linethickness = 4
long fillcolor = 23620556
integer x = 3333
integer y = 2300
integer width = 581
integer height = 120
end type

