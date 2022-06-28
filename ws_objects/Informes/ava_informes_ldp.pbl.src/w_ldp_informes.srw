$PBExportHeader$w_ldp_informes.srw
forward
global type w_ldp_informes from w_informes_viacentral
end type
end forward

global type w_ldp_informes from w_informes_viacentral
end type
global w_ldp_informes w_ldp_informes

type variables
BOOLEAN ib_fechas,ib_dias,ib_fechafinal
end variables

forward prototypes
public function boolean wf_validar_dias (date fechainicial, date fechafinal)
public function boolean wf_validar_fechas (date fechainicial, date fechafinal)
public function boolean wf_validar_fecha_final (date fechafinal)
end prototypes

public function boolean wf_validar_dias (date fechainicial, date fechafinal);integer li_dias

li_dias = DaysAfter(fechainicial,fechafinal)

IF li_dias <=  60 THEN
	RETURN TRUE
ELSE
	RETURN FALSE
END IF
end function

public function boolean wf_validar_fechas (date fechainicial, date fechafinal);//Se valida que la fecha inicial sea menor a la fecha final

IF (fechainicial > fechafinal ) THEN
	RETURN FALSE
ELSE 
	RETURN TRUE
END IF
end function

public function boolean wf_validar_fecha_final (date fechafinal);//Se valida que la fecha final no sea mayor a la actual
String ls_fechaactual
ls_fechaactual = String(Today(),"dd/mm/yyyy")

IF (fechafinal > DATE(ls_fechaactual)) THEN
	RETURN FALSE
ELSE
	RETURN TRUE
END IF

end function

on w_ldp_informes.create
int iCurrent
call super::create
end on

on w_ldp_informes.destroy
call super::destroy
end on

event open;call super::open;CHOOSE CASE is_dw_reporte	
									
	CASE 'dcs_informe_crosstab'
		istr_parametros_reportes.s_parametro[1]  = 'Código Agencia'
		istr_parametros_reportes.s_parametro[2]  = 'Agencia'
		istr_parametros_reportes.s_parametro[3]  = 'Fecha Inicial'		
		istr_parametros_reportes.s_parametro[4]  = 'Fecha Final'

		
		//Opciones especiales que posee el reporte
		uo_menu.pb_opcion1.Visible=True
		uo_menu.pb_opcion1.powertiptext='Modificar Limite de crédito'
		uo_menu.pb_opcion1.picturename= "imagenes\btn-tres.gif"

END CHOOSE	

x=0
y=0
end event

event ue_postopen;call super::ue_postopen;STRU_FRMWRK_PARAMETROS lstr_parametros

CHOOSE CASE is_dw_reporte	
									
	CASE 'dcs_informe_crosstab'
		lstr_parametros.String[1] = 'fecha inicial'
		lstr_parametros.Date[1] = Today()
		dw_parametros.uf_asignar_valor_parametro (lstr_parametros)
		
		lstr_parametros.String[1] = 'fecha final'
		lstr_parametros.Date[1] = Today()
		dw_parametros.uf_asignar_valor_parametro (lstr_parametros)

END CHOOSE	


end event

event ue_recuperar;call super::ue_recuperar;STRU_FRMWRK_PARAMETROS	lstr_parametros
STRING	ls_banco, ls_cuenta, ls_fecha_inicial, ls_fecha_fin, ls_Agencia,ls_drop
INT li_dias


ii_filas_informe = 0


ls_drop = " DROP TABLE ##temporal "
EXECUTE IMMEDIATE :ls_drop USING sqlca;


CHOOSE CASE is_dw_reporte	
										
	CASE 'dcs_informe_crosstab'
		
		lstr_parametros.String[1]	= istr_parametros_reportes.s_parametro[1]
		ls_Agencia						= dw_parametros.uf_obtener_valor_parametro(lstr_parametros)		
		is_texto_parametros			= lstr_parametros.String[1] + ": "+ ls_Agencia+", "
		
		ib_continuar_recuperacion = false 
		lstr_parametros.String[1]	= istr_parametros_reportes.s_parametro[3]		
		ls_fecha_inicial = dw_parametros.uf_obtener_valor_parametro(lstr_parametros)
		is_texto_parametros= is_texto_parametros + lstr_parametros.String[1] + ": "+ ls_fecha_inicial+", "
		lstr_parametros.String[1]	= istr_parametros_reportes.s_parametro[4]		
		ls_fecha_fin = dw_parametros.uf_obtener_valor_parametro(lstr_parametros)
		is_texto_parametros= is_texto_parametros + lstr_parametros.String[1] + ": "+ ls_fecha_fin+","

	
		//Se valia que los dias de la fechas sean menores a 60
		ib_dias = wf_validar_dias(date(ls_fecha_inicial),date(ls_fecha_fin))
		//Se valida que la fecha inicila sea menor a la fecha final
		ib_fechas = wf_validar_fechas(date(ls_fecha_inicial),date(ls_fecha_fin))
		//Se valida que la fecha final no sea mayor a la actual
		ib_fechafinal = wf_validar_fecha_final(date(ls_fecha_fin))
		
		IF NOT (ib_fechafinal)THEN
			messagebox("Adventencia","La fecha final debe ser menor o igual a la fecha actual")					
		END IF
		
		IF NOT(ib_fechas) THEN
			messagebox("Adventencia","La fecha inicial debe ser menor o igual a la fecha final")			
			RETURN
		END IF
		
		IF NOT(ib_dias) THEN
			messagebox("Adventencia","El número de dias permitido para el reporte debe ser menor o igual a 60")			
			dw_reporte.reset()
			RETURN
		END IF
			
		IF (ib_fechas AND ib_dias)THEN
			IF (ls_agencia="--")THEN
				 ls_agencia ="%"	
			END IF
			ii_filas_informe = dw_reporte.Retrieve(UPPER(ls_agencia),date(ls_fecha_inicial),date(ls_fecha_fin))
		END IF
		
END CHOOSE	
end event

event ue_postrecuperar;call super::ue_postrecuperar;DataWindowChild ldwch_encabezado

in_cst_valores_globales.of_variables_reportes( )

IF dw_reporte.GetChild ("dw_encabezado", ldwch_encabezado ) =1 THEN
	dw_reporte.Object.DataWindow.Header.Height= Long(dw_header.object.DataWindow.Detail.Height)
	
	ldwch_encabezado.setitem( 1, "logo", in_cst_valores_globales.is_LOGO  )
	ldwch_encabezado.setitem( 1, "direccion", in_cst_valores_globales.is_DIRECCION_VIAMERICAS )
	ldwch_encabezado.setitem( 1, "datos1", in_cst_valores_globales.is_DATOS1_REPORTE)
	ldwch_encabezado.setitem( 1, "titulo", is_titulo)
	ldwch_encabezado.setitem( 1, "parametros", is_texto_parametros)
	ldwch_encabezado.setitem( 1, "datos2", in_cst_valores_globales.is_DATOS2_REPORTE)
	ldwch_encabezado.setitem( 1, "datos3", in_cst_valores_globales.is_DATOS3_REPORTE)
	ldwch_encabezado.setitem( 1, "datos4", in_cst_valores_globales.is_DATOS4_REPORTE)
	ldwch_encabezado.setitem( 1, "datos5", in_cst_valores_globales.is_DATOS5_REPORTE)

END IF



//Si no cumple alguna de las validaciones se limpia el dw del reporte
IF NOT(ib_fechas) OR NOT(ib_dias) OR NOT(ib_fechafinal) THEN
	dw_reporte.reset()
END IF




end event

event ue_exportar;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************



//Método #2
gb_exportarlimitecredito = TRUE
OpenwithParm(w_exportar_dw,dw_reporte)
//Al cerrar la ventana se coloca nuevamente la variable global en FALSE
gb_exportarlimitecredito = FALSE
end event

event ue_opcion1;call super::ue_opcion1;//Permite abrir una nueva ventan que contendra la agencia y el limite de crédito sugerido
IF (dw_reporte.rowcount()>0) THEN
	open(w_cambiar_limitecredito)
ELSE
	messagebox("Advertencia","El reporte debe tener registros")
END IF
end event

type uo_menu from w_informes_viacentral`uo_menu within w_ldp_informes
end type

type dw_reporte from w_informes_viacentral`dw_reporte within w_ldp_informes
end type

type dw_parametros from w_informes_viacentral`dw_parametros within w_ldp_informes
integer height = 388
string dataobject = "d_frmwrk_parametros_ldc"
end type

type gb_menu from w_informes_viacentral`gb_menu within w_ldp_informes
end type

type gb_reporte from w_informes_viacentral`gb_reporte within w_ldp_informes
end type

type dw_header from w_informes_viacentral`dw_header within w_ldp_informes
end type

