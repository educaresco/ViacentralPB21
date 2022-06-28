$PBExportHeader$w_informes_viacentral.srw
forward
global type w_informes_viacentral from w_frmwrk_informes
end type
type dw_header from datawindow within w_informes_viacentral
end type
end forward

global type w_informes_viacentral from w_frmwrk_informes
integer x = 0
integer y = 0
integer width = 4695
integer height = 2640
dw_header dw_header
end type
global w_informes_viacentral w_informes_viacentral

type variables
String	is_texto_parametros, is_encabezado_datos2, is_encabezado_datos3, is_encabezado_datos4,&
			is_encabezado_datos5
			
			
n_cst_valores_globales in_cst_valores_globales
end variables

on w_informes_viacentral.create
int iCurrent
call super::create
this.dw_header=create dw_header
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_header
end on

on w_informes_viacentral.destroy
call super::destroy
destroy(this.dw_header)
end on

event open;call super::open;

CHOOSE CASE is_dw_reporte	
									
	CASE 'dcs_conciliados'
		istr_parametros_reportes.s_parametro[1]  = 'Banco'
		istr_parametros_reportes.s_parametro[2]  = 'Fecha Inicial'		
		istr_parametros_reportes.s_parametro[3]  = 'Fecha Final'
		istr_parametros_reportes.s_parametro[4]  = 'Cuenta'

	CASE 'dgd_plano_banco_definitivo'

	CASE 'dcs_fax_rates'
		istr_parametros_reportes.s_parametro[1]  = 'Código Agencia'
		istr_parametros_reportes.s_parametro[2]  = 'Agencia'
		
		//Opciones especiales que posee el reporte
		uo_menu.pb_opcion1.Visible=True
		uo_menu.pb_opcion2.Visible=True
		uo_menu.pb_opcion1.powertiptext='Send Fax to selected Branch'
		uo_menu.pb_opcion2.powertiptext='Send Fax to ALL Red Phone Branches'
		uo_menu.pb_opcion1.picturename= "imagenes\btn-fax.gif"
		uo_menu.pb_opcion2.picturename= "imagenes\btn-faxRojo.gif"

	CASE 'd_informe_......'
END CHOOSE	

x=0
y=0
end event

event ue_recuperar;call super::ue_recuperar;STRU_FRMWRK_PARAMETROS	lstr_parametros
STRING	ls_banco, ls_cuenta, ls_fecha_inicial, ls_fecha_fin, ls_Agencia


CHOOSE CASE is_dw_reporte	
										
	CASE 'dcs_conciliados'
	
		lstr_parametros.String[1]  = istr_parametros_reportes.s_parametro[1]
		ls_banco = dw_parametros.uf_obtener_valor_parametro(lstr_parametros)		
		is_texto_parametros= lstr_parametros.String[1] + ": "+ ls_banco+", "
		
		lstr_parametros.String[1]  = istr_parametros_reportes.s_parametro[2]
		ls_fecha_inicial = dw_parametros.uf_obtener_valor_parametro(lstr_parametros)
		is_texto_parametros= is_texto_parametros + lstr_parametros.String[1] + ": "+ ls_fecha_inicial+", "
			
		lstr_parametros.String[1]  = istr_parametros_reportes.s_parametro[3]
		ls_fecha_fin = dw_parametros.uf_obtener_valor_parametro(lstr_parametros)
		is_texto_parametros= is_texto_parametros + lstr_parametros.String[1] + ": "+ ls_fecha_fin+","
		
		lstr_parametros.String[1]  = istr_parametros_reportes.s_parametro[4]
		ls_cuenta = dw_parametros.uf_obtener_valor_parametro(lstr_parametros)
		is_texto_parametros= is_texto_parametros + lstr_parametros.String[1] + ": "+ ls_cuenta+" "
		
		
		ib_continuar_recuperacion = dw_parametros.uf_validar_parametros(lstr_parametros)
		
		IF ib_continuar_recuperacion THEN			
			ii_filas_informe = dw_reporte.Retrieve(ls_banco, ls_cuenta, DateTime(Date(ls_fecha_inicial),Time('00:00:00')), &
								DateTime(Date(ls_fecha_fin),Time('23:59:59')))
		END IF		

	CASE 'd_informe_......'


	CASE 'dgd_plano_banco_definitivo'
		dw_reporte.Retrieve()
		ib_continuar_recuperacion=False
		
	CASE 'dcs_fax_rates'
		lstr_parametros.String[1]	= istr_parametros_reportes.s_parametro[1]
		ls_Agencia						= dw_parametros.uf_obtener_valor_parametro(lstr_parametros)		
		is_texto_parametros			= lstr_parametros.String[1] + ": "+ ls_Agencia+", "
		
		ib_continuar_recuperacion = false //dw_parametros.uf_validar_parametros(lstr_parametros)
		
		//IF ib_continuar_recuperacion THEN			
			ii_filas_informe = dw_reporte.Retrieve(ls_agencia)
		//END IF		
END CHOOSE	
end event

event ue_postopen;call super::ue_postopen;//************************************************************************************
//	Ejemplo de la codificación de este evento en una ventana heredada de esta 
//************************************************************************************
// Inicializa los parámetros asignandoles un valor por defecto a cada uno de los parámetros
// de cada uno de los informes en el evento de la ventana heredada
//

// m_imprimir.Enabled = False		
// m_configurarimpresora.Enabled = False
// m_opcionesdeimpresin.Enabled = False
// m_zoomaumentar.Enabled = False				
// m_imprimir.Enabled = False
// m_configurarimpresora.Enabled = False	 

STRU_FRMWRK_PARAMETROS lstr_parametros

CHOOSE CASE is_dw_reporte	
									
	CASE 'dcs_conciliados'
		lstr_parametros.String[1] = 'fecha inicial'
		lstr_parametros.Date[1] = Today()
		dw_parametros.uf_asignar_valor_parametro (lstr_parametros)
		
		lstr_parametros.String[1] = 'fecha final'
		lstr_parametros.Date[1] = Today()
		dw_parametros.uf_asignar_valor_parametro (lstr_parametros)


	CASE 'd_informe_......'
END CHOOSE	



end event

event ue_postrecuperar;call super::ue_postrecuperar;//DRT==>2008-ago-8

DataWindowChild ldwch_encabezado

in_cst_valores_globales.of_variables_reportes( )

IF dw_reporte.GetChild ("dw_encabezado", ldwch_encabezado ) =1 THEN
	dw_reporte.Object.DataWindow.Header.Height= Long(dw_header.object.DataWindow.Detail.Height)
	
	ldwch_encabezado.setitem( 1, "logo", in_cst_valores_globales.is_LOGO  )
	ldwch_encabezado.setitem( 1, "direccion", in_cst_valores_globales.is_REPORT_ADDRESS_LINE )
	ldwch_encabezado.setitem( 1, "datos1", in_cst_valores_globales.is_REPORT_DATA_LINE1)
	ldwch_encabezado.setitem( 1, "titulo", is_titulo)
	ldwch_encabezado.setitem( 1, "parametros", is_texto_parametros)
	ldwch_encabezado.setitem( 1, "datos2", in_cst_valores_globales.is_REPORT_DATA_LINE2)
	ldwch_encabezado.setitem( 1, "datos3", in_cst_valores_globales.is_REPORT_DATA_LINE3)
	ldwch_encabezado.setitem( 1, "datos4", in_cst_valores_globales.is_REPORT_DATA_LINE4)
	ldwch_encabezado.setitem( 1, "datos5", in_cst_valores_globales.is_REPORT_DATA_LINE5)

END IF
end event

event ue_opcion1;call super::ue_opcion1;/*
DRT==>2008-oct
Opción que permite imprimir el reporte actual con referencia de fax para una sola agencia(la actual del reporte).
*/

STRU_FRMWRK_PARAMETROS	lstr_parametros
n_cst_fax_branches ln_cst_fax_branches
String ls_agencia

CHOOSE CASE is_dw_reporte	
	CASE 'dcs_fax_rates'
		ln_cst_fax_branches= CREATE n_cst_fax_branches		

		lstr_parametros.String[1]	= istr_parametros_reportes.s_parametro[1]
		ls_agencia= dw_parametros.uf_obtener_valor_parametro(lstr_parametros)
		
		ln_cst_fax_branches.of_set_titulo_reporte(is_titulo)
		ln_cst_fax_branches.of_send_fax_selected_branch( ls_agencia, dw_reporte ,dw_header)
END CHOOSE	
end event

event ue_opcion2;call super::ue_opcion2;/*
DRT==>2008-oct
Opción que permite imprimir varios reporte-fax dependiendo de las agencias que cumplan con los requisitos.
*/

n_cst_fax_branches ln_cst_fax_branches


CHOOSE CASE is_dw_reporte	
	CASE 'dcs_fax_rates'
		ln_cst_fax_branches= CREATE n_cst_fax_branches
		ln_cst_fax_branches.of_set_titulo_reporte(is_titulo)
		ln_cst_fax_branches.of_send_fax_all_red_phone_branches( dw_reporte, dw_header)
END CHOOSE
end event

type uo_menu from w_frmwrk_informes`uo_menu within w_informes_viacentral
end type

type dw_reporte from w_frmwrk_informes`dw_reporte within w_informes_viacentral
integer x = 18
integer width = 4498
end type

event dw_reporte::clicked;IF row > 0 THEN
	il_fila_anterior = row
	il_fila = row	
END IF
end event

type dw_parametros from w_frmwrk_informes`dw_parametros within w_informes_viacentral
integer x = 27
integer y = 336
integer width = 4416
end type

event dw_parametros::itemchanged;call super::itemchanged;STRU_FRMWRK_PARAMETROS lstr_parametros
String ls_id_banco, ls_values
Long		ll_pos_slash


CHOOSE CASE THIS.GetItemString(ROW, "nombre_parametro")
	CASE 'Banco'
	lstr_parametros.String[1]  = istr_parametros_reportes.s_parametro[1]
	ls_id_banco = dw_parametros.uf_obtener_valor_parametro(lstr_parametros)

	lstr_parametros.String[1] = 'Cuenta'
	lstr_parametros.String[2] = "SELECT RTRIM(dba.CUENTA_BANCO.NAME_CUENTA_BANCO) + ' - '+dba.CUENTA_BANCO.ID_CUENTA_BANCO descripcion, "+&
											"      dba.CUENTA_BANCO.ID_CUENTA_BANCO codigo"+&
											" FROM dba.CUENTA_BANCO   "+&
											" WHERE dba.CUENTA_BANCO.ID_BANCO ='"+ls_id_banco +"'"+&
											" UNION "+&
											" SELECT 'TODOS' descripcion, 'TODOS' codigo"+&
											" ORDER BY 1;" 
	uf_reconstruir_lista(lstr_parametros)
	
	CASE "Agencia"
		This.SetItem(1,'parametro_string',data)
		This.SetItem(1,'descripcion_parametro',data)
		
	CASE "Código Agencia"
		uf_asignar_lista(2)
		ls_values= this.Describe("parametro_lista.Values")
		IF Match ( ls_values, data ) then

			ls_values= MID(ls_values, 1, Pos(ls_values, data) + (Len(data)-1) ) 
			
			ll_pos_slash = LastPos ( ls_values, "/" )
			
			IF ll_pos_slash >0 THEN
				//ls_values= Mid(ls_values,ll_pos_slash+1, Pos(ls_values, data)-2 )
				ls_values= Mid(ls_values,ll_pos_slash+1, len(ls_values) - ll_pos_slash -  Len(data) -1 )
			ELSE
				ls_values= Mid(ls_values,1, len(ls_values) - ll_pos_slash -  Len(data) -1 )
			END IF
		ELSE
			MessageBox("Error","La agencia digitada no existe o se encuentra cerrada.",StopSign!)
			Return 1
		END IF
		
		This.SetItem(2,'parametro_lista',ls_values)
		This.SetItem(2,'display_lista',ls_values)
		This.SetItem(2,'descripcion_parametro',ls_values)
		This.SetItem(row,'descripcion_parametro',data)
END CHOOSE
//http://video.aol.com/video-detail/live-in-bogota-the-doors-en-vivo-bogota-colombia/1597534640
end event

event dw_parametros::itemerror;call super::itemerror;Return 1
end event

type gb_menu from w_frmwrk_informes`gb_menu within w_informes_viacentral
end type

type gb_reporte from w_frmwrk_informes`gb_reporte within w_informes_viacentral
integer x = 27
integer y = 292
end type

type dw_header from datawindow within w_informes_viacentral
boolean visible = false
integer x = 3022
integer y = 44
integer width = 1243
integer height = 192
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dff_encabezado_reportes"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(0)
end event

