$PBExportHeader$w_frmwrk_informes.srw
forward
global type w_frmwrk_informes from window
end type
type uo_menu from uo_frmwrk_menu_botones_reportes within w_frmwrk_informes
end type
type dw_reporte from uo_frmwrk_datawindow within w_frmwrk_informes
end type
type dw_parametros from uo_frmwrk_datawindow_parametros within w_frmwrk_informes
end type
type gb_menu from groupbox within w_frmwrk_informes
end type
type gb_reporte from groupbox within w_frmwrk_informes
end type
end forward

shared variables

end variables

global type w_frmwrk_informes from window
integer x = 14
integer y = 8
integer width = 4658
integer height = 2536
boolean titlebar = true
string title = "Informe"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
event ue_seleccionar_impresora ( )
event ue_imprimir ( )
event ue_salir ( )
event ue_recuperar ( )
event ue_primera ( )
event ue_siguiente ( )
event ue_anterior ( )
event ue_seleccionar_tamano_visualizacion_dw ( )
event ue_ordenar ( )
event ue_exportar ( )
event ue_filtrar ( )
event ue_ultima ( )
event ue_ayuda ( )
event ue_barra_herramientas ( )
event ue_dato_anterior ( datawindow pdw_datawindow )
event ue_tipo_grafica ( )
event ue_opcion1 ( )
event ue_opcion2 ( )
event ue_opcion3 ( )
event ue_opcion4 ( )
event ue_opcion5 ( )
event ue_opcion6 ( )
event ue_opcion7 ( )
event ue_opcion8 ( )
event ue_opcion9 ( )
event ue_opcion10 ( )
event ue_parametros ( )
event ue_seleccionar_parametro ( )
event ue_postopen ( )
event ue_postrecuperar ( )
event ue_postseleccionar_parametro ( )
event ue_teclas ( )
uo_menu uo_menu
dw_reporte dw_reporte
dw_parametros dw_parametros
gb_menu gb_menu
gb_reporte gb_reporte
end type
global w_frmwrk_informes w_frmwrk_informes

type variables
BOOLEAN				ib_seleccionar_parametro, ib_continuar_recuperacion
DATE					id_dato_anterior
DATETIME				idt_dato_anterior
DECIMAL{2}			idc_dato_anterior
INTEGER				ii_fila_parametro, ii_filas_informe, ii_tamano_visualizacion_dw
STRING				is_titulo, &
						is_dw_reporte, &
						is_dsparametro_a_asignar, &
						is_tipo_parametro_a_asignar, &
						is_descripcion_parametro_seleccionado, &
						is_columna, &
						is_tipo, &
						is_dato_anterior,&
						is_formato_fecha
Long					il_reporte_Y_inicial, il_reporte_HEIGHT_inicial, il_reporte_X_inicial, il_reporte_WIDTH_inicial
						
STRU_FRMWRK_PARAMETROS_REPORTES				istr_parametros_reportes
STRU_FRMWRK_PARAMETROS							istr_parametros_seleccion, istr_nula
UO_FRMWRK_SELECCION_TAMANO_VISUALIZACION	iuo_seleccion_tamano_visualizacion_dw
WINDOW												iw_ventana

n_cst_configuracion_regional	in_cst_configuracion_regional
n_cst_filterattrib				inv_filterattrib
pfc_n_cst_resize					inv_resize


end variables

forward prototypes
public subroutine wf_leer_dato_anterior (datawindow pdw_datawindow)
public subroutine wf_titulos_reporte ()
public subroutine wf_inicializar_parametros ()
end prototypes

event ue_seleccionar_impresora;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

PrintSetup()

end event

event ue_imprimir();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

SetPointer(HourGlass!)

stru_frmwrk_parametros	lstr_parametros

lstr_parametros.DataWindow[1]	= dw_reporte
lstr_parametros.String[1]		= is_titulo

//OpenwithParm(w_setup_impresion, lstr_parametros)
OpenwithParm(w_impresion, lstr_parametros)
end event

event ue_salir;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

Close(This)
end event

event ue_recuperar();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, ya que este evento tiene instrucciones que son especificas
// para cada informe que se requiera generar en las ventanas que sean 
// heredadas de esta, estas instrucciones deben ser adicionadas en este
// mismo evento de la ventana heredada sin sobreescribir el evento en el padre.
//
// Si para un reporte se requiere la opción de filtrar, ordenar se debe activar
// la opción respectiva en el menú despues de que la recuperación del reporte 
// sea exitosa 
//
//	Se recomienda hacer funciones para recuperar los datos por cada DataWindows
// de parámetros diferente con el nombre de esta DataWindows
//
//************************************************************************************
//	Ejemplo de la codificación de este evento en una ventana heredada de esta 
//************************************************************************************
// Recupera los datos de cada uno de los parámetros del informe para recuperar los datos
// del reporte
//
//STRU_FRMWRK_PARAMETROS	lstr_parametros
//STRING							ls_parametro_1
//
//CHOOSE CASE is_dw_reporte	
//										
//	CASE 'd_informe_1'
//		lstr_parametros.String[1]  = istr_parametros_reportes.s_parametro[1]
//		ls_parametro_1 = dw_parametros.uf_obtener_valor_parametro(lstr_parametros)
//		
//		ib_continuar_recuperacion = dw_parametros.uf_validar_parametros(lstr_parametros)
//		IF ib_continuar_recuperacion THEN			
//			ii_filas_informe = dw_reporte.Retrieve(ls_parametro_1)																	
//		END IF		
//
//	CASE 'd_informe_......'
//
//
//	CASE 'd_informe_n'
//
//END CHOOSE	

SetPointer(HourGlass!)

This.SetRedraw(False)
dw_reporte.Reset()
dw_parametros.AcceptText()

ib_continuar_recuperacion = True
This.SetRedraw(True)

This.PostEvent("ue_postrecuperar")
end event

event ue_primera();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

dw_reporte.ScrollToRow(0)
end event

event ue_siguiente;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

dw_reporte.ScrollNextPage() 
end event

event ue_anterior;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

dw_reporte.ScrollPriorPage() 
end event

event ue_seleccionar_tamano_visualizacion_dw();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, ya que este evento tiene instrucciones que son especificas
// de acuerdo a los menús que se tiene definidos en cada aplicación para
// asignarlos a las ventanas heredadas de esta, estas instrucciones deben
// ser adicionadas en este mismo evento de la ventana heredada sin 
// sobreescribir el evento en el padre.
//
//************************************************************************************
//	Ejemplo de la codificación de este evento en una ventana heredada de esta 
//************************************************************************************
// Define en la ventana heredada las opciones del menú que servirán para hacer visible 
// o invisible la lista de parámetros de la ventana
//
//	IF	iuo_seleccion_tamano_visualizacion_dw.Visible THEN
//		imn_menu_informes.m_opciones.m_zoomaumentar.Text = 'Ocultar Parámetros de Tamaño de Visualización del Reporte'		
//		imn_menu_informes.m_opciones.m_zoomaumentar.MicroHelp = 'Oculta la ventana de parámetros de tamaño de visualización del reporte'		
//		imn_menu_informes.m_opciones.m_zoomaumentar.ToolbarItemText = 'Ocultar Parámetros de Tamaño de Visualización del Reporte'		
//	ELSE
//		imn_menu_informes.m_opciones.m_zoomaumentar.Text = 'Ver Parámetros de Tamaño de Visualización del Reporte'		
//		imn_menu_informes.m_opciones.m_zoomaumentar.MicroHelp = 'Hace visible la ventana de parámetros de tamaño de visualización del reporte'	
//		imn_menu_informes.m_opciones.m_zoomaumentar.ToolbarItemText = 'Ver Parámetros de Tamaño de Visualización del Reporte'		
//	END IF

//This.SetRedraw(False)
//iuo_seleccion_tamano_visualizacion_dw.X = 0
//IF	iuo_seleccion_tamano_visualizacion_dw.Visible THEN
//	iuo_seleccion_tamano_visualizacion_dw.Visible = False
//	dw_reporte.Y = 12
//	dw_reporte.Height = This.Height - 120
//ELSE
//	ii_tamano_visualizacion_dw = Integer(dw_reporte.Describe("datawindow.print.preview.zoom"))
//	iuo_seleccion_tamano_visualizacion_dw.is_tamano = String(ii_tamano_visualizacion_dw)
//	iuo_seleccion_tamano_visualizacion_dw.hsb_tamano_vista_previa.Position = ii_tamano_visualizacion_dw
//	iuo_seleccion_tamano_visualizacion_dw.Visible = True
//	dw_reporte.Y = dw_parametros.Y + iuo_seleccion_tamano_visualizacion_dw.Height + 10
//	dw_reporte.Height = dw_reporte.Height - (iuo_seleccion_tamano_visualizacion_dw.Y + iuo_seleccion_tamano_visualizacion_dw.Height)
//END IF	
//This.SetRedraw(True)
//
//// Asigna el foco al objeto de asignación de tamaño de visualización del reporte
//iuo_seleccion_tamano_visualizacion_dw.SetFocus()
//

n_cst_zoomattrib	lnv_zoomattrib

lnv_zoomattrib.idw_obj= dw_reporte

Openwithparm(pfc_w_zoom, lnv_zoomattrib)
end event

event ue_ordenar();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

//dw_reporte.SetRedraw(False)
//dw_reporte.SetSort(is_orden)
//dw_reporte.Sort()
//dw_reporte.GroupCalc()
//dw_reporte.SetFocus()
//dw_reporte.SetRedraw(True)


/*
DRT==>2008-Ago-13
Lee cada uno de las columnas del reporte y añade al sort aquellas que tienen el tag registrado

Este sort aun no tiene contemplado el manejo de agrupaciones, asi que cuando se realice esto, eliminar
por favor este mensaje, no vaya a ser que le hagamos perder el trabajito a otro con algo ya hecho.
*/
String ls_num_columna, ls_nombre_columna
Integer	li_cantidad_columnas , li_i, li_j

DataWindowChild ldwch_child
n_cst_sortattrib		lnv_sortattrib
n_cst_returnattrib 	lnv_return 

li_i=1
li_j=1

IF dw_reporte.GetChild('dw_detalle',ldwch_child) = 1 THEN
	ls_nombre_columna= ldwch_child.Describe("#1.Name")
	
	do until ls_nombre_columna='!'
		IF ldwch_child.Describe(ls_nombre_columna+".Tag")<>'?' THEN
			lnv_sortattrib.is_sortcolumns[li_j]		= ls_nombre_columna
			lnv_sortattrib.is_colnamedisplay[li_j]	= ldwch_child.Describe(ls_nombre_columna+".Tag")
			lnv_sortattrib.ib_usedisplay[li_j]		= False
			li_j++
		END IF
		li_i++
	
		ls_num_columna		= String(li_i)
		ls_nombre_columna	= ldwch_child.Describe("#"+ls_num_columna+".Name")
	loop
	//pfc_w_sortdragdrop
	Openwithparm(pfc_w_sortmulti, lnv_sortattrib)
	lnv_return = Message.PowerObjectParm
	
	ldwch_child.SetSort(lnv_return.is_rs)
	ldwch_child.Sort()
	ldwch_child.GroupCalc()
	

ELSE
	ls_nombre_columna= dw_reporte.Describe("#1.Name")
	
	do until ls_nombre_columna='!'
		IF dw_reporte.Describe(ls_nombre_columna+".Tag")<>'?' THEN
			lnv_sortattrib.is_sortcolumns[li_j]		= ls_nombre_columna
			lnv_sortattrib.is_colnamedisplay[li_j]	= dw_reporte.Describe(ls_nombre_columna+".Tag")
			lnv_sortattrib.ib_usedisplay[li_j]		= False
			li_j++
		END IF
		li_i++
	
		ls_num_columna		= String(li_i)
		ls_nombre_columna	= dw_reporte.Describe("#"+ls_num_columna+".Name")
	loop
	//pfc_w_sortdragdrop
	Openwithparm(pfc_w_sortmulti, lnv_sortattrib)
	lnv_return = Message.PowerObjectParm
	
	dw_reporte.SetSort(lnv_return.is_rs)
	dw_reporte.Sort()
	dw_reporte.GroupCalc()


END IF


end event

event ue_exportar();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

//SaveAs()



//DRT==>2008-ago-27
/* MÉTODO #1
IF IsValid(uo_exportar_datawindow) THEN
	CloseUserObject(uo_exportar_datawindow)
ELSE
	OpenUserObject ( uo_exportar_datawindow, 1934, 332 )
	uo_exportar_datawindow.BringTotop=true
	uo_exportar_datawindow.of_set_dw(dw_reporte)
END IF
*/

//Método #2
OpenwithParm(w_exportar_dw, dw_reporte)
end event

event ue_filtrar();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

//dw_reporte.SetRedraw(False)
//dw_reporte.SetFilter(is_filtro)
//dw_reporte.Filter()
//dw_reporte.GroupCalc()
//dw_reporte.SetFocus()
//dw_reporte.SetRedraw(True)

/*
DRT==>2008-Ago-13
Lee cada uno de las columnas del reporte y añade al sort aquellas que tienen el tag registrado

Este sort aun no tiene contemplado el manejo de agrupaciones, asi que cuando se realice esto, eliminar
por favor este mensaje, no vaya a ser que le hagamos perder el trabajito a otro con algo ya hecho.

TAG: en la propiedad TAG de cada campo en el reporte se debe colocar el nombre de aquellas columnas
que aparecerán en la ventana de filtro y ordenar. Aquellas que no tengan nada no se visualizarán.
*/

String ls_num_columna, ls_nombre_columna
Integer	li_cantidad_columnas , li_i, li_j

DataWindowChild 		ldwch_child
n_cst_returnattrib 	lnv_return 



li_i=1
li_j=1

IF Upper(dw_reporte.Describe("DataWindow.Nested")) = 'YES' THEN
	/*Este script está diseñado para reportes de tipo composite que tienen un nested report llamado dw_detalle*/
	IF dw_reporte.GetChild('dw_detalle',ldwch_child) = 1 THEN
		ls_nombre_columna= ldwch_child.Describe("#1.Name")

		//LLena los vectores con las columnas que fueron definidas para ser usadas en los servicios de filtro y ordenar
		do until ls_nombre_columna='!'
			IF ldwch_child.Describe(ls_nombre_columna+".Tag")<>'?' THEN
				inv_filterattrib.is_columns[li_j]			= ls_nombre_columna
				inv_filterattrib.is_colnamedisplay[li_j]	= ldwch_child.Describe(ls_nombre_columna+".Tag")
				inv_filterattrib.is_dbnames[li_j]			= ldwch_child.Describe(ls_nombre_columna+".dbName")
				li_j++
			END IF
			li_i++
		
			ls_num_columna		= String(li_i)
			ls_nombre_columna	= ldwch_child.Describe("#"+ls_num_columna+".Name")
		loop
		inv_filterattrib.idw_dw = Create u_dw
		inv_filterattrib.idw_dw.dataobject= dw_reporte.Describe("dw_detalle.DataObject")
		inv_filterattrib.idw_dw.of_settransobject( SQLCA)
	
		Openwithparm(pfc_w_filtersimple, inv_filterattrib)
		//Openwithparm(pfc_w_filterextended, inv_filterattrib)
		
		lnv_return 						= Message.PowerObjectParm
		inv_filterattrib.is_filter	= lnv_return.is_rs
		ldwch_child.SetFilter(lnv_return.is_rs)
		ldwch_child.Filter()
	END IF
	
ELSE //Reportes no Composite
	ls_nombre_columna= dw_reporte.Describe("#1.Name")
	//LLena los vectores con las columnas que fueron definidas para ser usadas en los servicios de filtro y ordenar
	do until ls_nombre_columna='!'
		IF dw_reporte.Describe(ls_nombre_columna+".Tag")<>'?' THEN
			inv_filterattrib.is_columns[li_j]			= ls_nombre_columna
			inv_filterattrib.is_colnamedisplay[li_j]	= dw_reporte.Describe(ls_nombre_columna+".Tag")
			inv_filterattrib.is_dbnames[li_j]			= dw_reporte.Describe(ls_nombre_columna+".dbName")
			li_j++
		END IF
		li_i++
	
		ls_num_columna		= String(li_i)
		ls_nombre_columna	= dw_reporte.Describe("#"+ls_num_columna+".Name")
	loop
	
	inv_filterattrib.idw_dw = Create u_dw
	inv_filterattrib.idw_dw.dataobject= dw_reporte.DataObject
	inv_filterattrib.idw_dw.of_settransobject( SQLCA)

	Openwithparm(pfc_w_filtersimple, inv_filterattrib)
	//Openwithparm(pfc_w_filterextended, inv_filterattrib)
	
	lnv_return 						= Message.PowerObjectParm
	inv_filterattrib.is_filter	= lnv_return.is_rs
	dw_reporte.SetFilter(lnv_return.is_rs)
	dw_reporte.Filter()

END IF
end event

event ue_ultima();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

dw_reporte.ScrollToRow(99999999)
dw_reporte.SetFocus()
end event

event ue_dato_anterior;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//
// Este evento se invoca en el evento de ItemChanged de la datawindow, cuando
// el dato digitado no es valido este retorna el dato anterior que tenia el 
// campo y el foco queda en el campo.
// Nota: antes de realizar el proceso de validación del dato pero dentro del 
// evento de ItemChanged se debe invocar la funcion wf_leer_dato_anterior
//************************************************************************

pdw_datawindow.SetColumn(is_columna)
pdw_datawindow.SetFocus()

CHOOSE CASE Upper(is_tipo)

	CASE 'DATE'
		pdw_datawindow.SetItem(1,is_columna,id_dato_anterior)

	CASE 'DATETIME'
		pdw_datawindow.SetItem(1,is_columna,idt_dato_anterior)

	CASE 'STRING', 'CHAR'
		pdw_datawindow.SetItem(1,is_columna,is_dato_anterior)

	CASE 'DECIMAL', 'DOUBLE', 'LONG', 'INTEGER', 'NUMBER'
		pdw_datawindow.SetItem(1,is_columna,idc_dato_anterior)

END CHOOSE

pdw_datawindow.SetFocus()
end event

event ue_tipo_grafica;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************
end event

event ue_opcion1();//Script personalizado para picture button ue_opcion1
end event

event ue_opcion2();//Script personalizado para picture button ue_opcion2
end event

event ue_opcion3();//Script personalizado para picture button ue_opcion3
end event

event ue_opcion4();//Script personalizado para picture button ue_opcion4
end event

event ue_parametros();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, ya que este evento tiene instrucciones que son especificas
// de acuerdo a los menús que se tiene definidos en cada aplicación para
// asignarlos a las ventanas heredadas de esta, estas instrucciones deben
// ser adicionadas en este mismo evento de la ventana heredada sin 
// sobreescribir el evento en el padre.
//
//************************************************************************************
//	Ejemplo de la codificación de este evento en una ventana heredada de esta 
//************************************************************************************
// Define en la ventana heredada las opciones del menú que servirán para hacer visible 
// o invisible la lista de parámetros de la ventana
//
//	IF	dw_parametros.Visible THEN
//		imn_menu_informes.m_opciones.m_zoomaumentar.Enabled = False
//		imn_menu_informes.m_opciones.m_parametros.Text = 'Ocultar Parámetros'		
//		imn_menu_informes.m_opciones.m_parametros.MicroHelp = 'Oculta la ventana de parámetros'	
//		imn_menu_informes.m_opciones.m_parametros.ToolbarItemText = 'Ocultar Parámetros'
//	ELSE
//		imn_menu_informes.m_opciones.m_zoomaumentar.Enabled = True
//		imn_menu_informes.m_opciones.m_parametros.Text = 'Ver Parámetros'		
//		imn_menu_informes.m_opciones.m_parametros.MicroHelp = 'Hace visible la ventana de parámetros'	
//		imn_menu_informes.m_opciones.m_parametros.ToolbarItemText = 'Ver Parámetros'
//	END IF

This.SetRedraw(False)
//dw_reporte.X = 0
//dw_reporte.Width = 3506
IF	dw_parametros.Visible THEN
	dw_parametros.Visible = False
	//dw_reporte.Y = 12
	//dw_reporte.Height = This.Height - 120

	dw_reporte.Y 		= il_reporte_Y_inicial
	dw_reporte.Height = il_reporte_HEIGHT_inicial
	dw_reporte.x		= il_reporte_X_inicial
	dw_reporte.WIDTH	= il_reporte_WIDTH_inicial

ELSE
	iuo_seleccion_tamano_visualizacion_dw.Visible = False
	dw_parametros.Visible = True
	/*dw_reporte.Y = dw_parametros.Y + dw_parametros.Height + 10
	//dw_reporte.Height = dw_reporte.Height - (dw_parametros.Y + dw_parametros.Height)
	dw_reporte.Height = dw_reporte.Height - (dw_parametros.Height)*/
	dw_reporte.Y = dw_parametros.Y + dw_parametros.Height 
	dw_reporte.Height = dw_reporte.Height - dw_parametros.Height
	
END IF	
This.SetRedraw(True)

// Asigna el foco en la ventana de parámetros
dw_parametros.SetFocus()
end event

event ue_seleccionar_parametro();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, ya que este evento tiene instrucciones que son especificas
// para cada parámetro que se requiera seleccionar en las ventanas que sean 
// heredadas de esta, estas instrucciones deben ser adicionadas en este
// mismo evento de la ventana heredada sin sobreescribir el evento en el padre.
//
//************************************************************************************
//	Ejemplo de la codificación de este evento en una ventana heredada de esta 
//************************************************************************************
// Asigna los valores a la estructura y despliga la ventana de selección 
//
// istr_parametros_seleccion.Boolean[1] Indica si se debe resaltar la fila que cumpla con los parámetros
// 									de la búsqueda
// istr_parametros_seleccion.Integer[1] Indica el número de parámetros de la selección 1 o 2
// istr_parametros_seleccion.String[1] Contiene el titulo que se asignará a la ventana de selección
// istr_parametros_seleccion.String[2] Contiene el nombre de la datawindow que se asignará al 
// 									DataObject de la datawindow de selección
// istr_parametros_seleccion.String[3] (Opcional) Contiene el dato del código actual que contiene la columna
//										a la cual se quiere asignar el resultado de la busqueda
// NOTA: ESTE ES OPCIONAL SOLO SE ENVIA CUANDO EL PARAMETRO lstr_parametros.Integer[1]
//			EL CUAL INDICA EL NUEMRO DE PARÁMETROS DE LA SELECCIÓN
// istr_parametros_seleccion.String[4] (Opcional) Contiene el dato de la descripción actual que contiene la columna 
//										a la cual se quiere asignar el resultado de la busqueda
// istr_parametros_seleccion.String[5] (Opcional) Contiene la sintaxis que se debe usar en caso de que se desee 
//										activar la opción para que sea posible filtrar que solo sean 
//										visibles los registros activos
// istr_parametros_seleccion.String[6] (Opcional) Contiene el codigo del dato que es prerequisito de este
//
//CHOOSE CASE is_dsparametro_seleccionado
//
//	CASE 'nombre parametro 1'
// 	istr_parametros_seleccion.Boolean[1] = True
// 	istr_parametros_seleccion.Integer[1] = 1
// 	istr_parametros_seleccion.String[1] = "el Producto"
// 	istr_parametros_seleccion.String[2] = "d_productos"
// 	istr_parametros_seleccion.String[3] = ""
// 	istr_parametros_seleccion.String[4] = "Jabón"		
// 	istr_parametros_seleccion.String[5] = "fecha_inactivacion > '1970/01/01'"
// 	istr_parametros_seleccion.String[6] = 359 // Codigo del Pedido (prerequisito) 
//															al que pertenece el producto
//
//	CASE 'nombre parametro 2'
// 	istr_parametros_seleccion.Boolean[1] = True
// 	istr_parametros_seleccion.Integer[1] = 2
// 	istr_parametros_seleccion.String[1] = "la Ciudad"
// 	istr_parametros_seleccion.String[2] = "d_ciudades"
// 	istr_parametros_seleccion.String[3] = "011"
// 	istr_parametros_seleccion.String[4] = "Medellín"
// 	istr_parametros_seleccion.String[5] = "'snactivo = 'S'"		
// 	istr_parametros_seleccion.String[5] = ""		
//
//	CASE 'nombre parametro ............'
//
//	CASE 'nombre parametro n '
//								
//END CHOOSE

ib_seleccionar_parametro 					= False
ii_fila_parametro 							= dw_parametros.GetRow()
is_dsparametro_a_asignar 					= Upper(dw_parametros.GetItemString(ii_fila_parametro,'nombre_parametro'))
is_tipo_parametro_a_asignar 				= Upper(dw_parametros.GetItemString(ii_fila_parametro,'tipo_parametro'))
is_descripcion_parametro_seleccionado	= Upper(dw_parametros.GetItemString(ii_fila_parametro,'descripcion_parametro'))
istr_parametros_seleccion 					= istr_nula

This.PostEvent("ue_postseleccionar_parametro")
end event

event ue_postopen;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, ya que este evento tiene instrucciones que son especificas
// para cada informe que se requiera presentar en las ventanas que sean 
// heredadas de esta, estas instrucciones deben ser adicionadas en este
// mismo evento de la ventana heredada sin sobreescribir el evento en el padre.
//
//************************************************************************************
//	Ejemplo de la codificación de este evento en una ventana heredada de esta 
//************************************************************************************
// Inicializa los parámetros asignandoles un valor por defecto a cada uno de los parámetros
// de cada uno de los informes en el evento de la ventana heredada
//
//	lstr_parametros.String[1] = 'fecha inicial'
//	lstr_parametros.Date[1] = Date(1997,003,04)
//	dw_parametros.uf_asignar_valor_parametro (lstr_parametros)
//
//	lstr_parametros.String[1] = 'fecha final'
//	lstr_parametros.Date[1] = Today()
//	dw_parametros.uf_asignar_valor_parametro (lstr_parametros)

// Desactiva las opciones de impresión del menú principal,  
// como no se tiene un menú principal estandar definido en
// el framework, se deja comentado y se debe poner el script 
// en este mismo evento en la ventana heredada
//
// m_imprimir.Enabled = False		
// m_configurarimpresora.Enabled = False

// Desactiva las opciones de impresión del menú de informes,  
// como no se tiene un menú de informes estandar definido en
// el framework, se deja comentado y se debe poner el script 
// en este mismo evento en la ventana heredada
//
// m_opcionesdeimpresin.Enabled = False
// m_zoomaumentar.Enabled = False				
// m_imprimir.Enabled = False
// m_configurarimpresora.Enabled = False	

// Construye la lista de parámetros de acuerdo al reporte
This.SetRedraw(False)
dw_parametros.uf_parametros(istr_parametros_reportes)
dw_parametros.Visible = False
This.SetRedraw(True)
// Dispara el evento para hacer visibles los parámetros y redimensionar los objetos
This.PostEvent("ue_parametros")
end event

event ue_postrecuperar();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

DATE ld_fecha

SetPointer(HourGlass!)

This.SetRedraw(False)

IF ii_filas_informe > 0 THEN
	ld_fecha = f_frmwrk_fecha_actual(False,"")

	IF IsNull(ld_fecha) THEN
		ld_fecha = Today() 
	END IF
	
	This.SetRedraw(False)
	IF dw_parametros.Visible THEN
		This.TriggerEvent("ue_parametros")		
	END IF
	dw_reporte.Modify("fecha_actual.text = '" + String(DateTime(ld_fecha,Now()),is_formato_fecha+' hh:mm') + "'")
	wf_titulos_reporte()
	dw_reporte.GroupCalc()
ELSE
	IF ib_continuar_recuperacion = True THEN
		MessageBox("Información","No existen datos para generar el informe con los parámetros seleccionados, por favor ingrese unos parámetros diferentes e intente de nuevo.",Information!)
	END IF	
END IF

This.SetRedraw(True)

SetPointer(Arrow!)
end event

event ue_postseleccionar_parametro();//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************

STRU_FRMWRK_PARAMETROS	lstr_dato_seleccionado

IF UpperBound(istr_parametros_seleccion.Integer) > 0 THEN
	IF istr_parametros_seleccion.Integer[1] > 0 THEN
		OpenWithParm(gw_ventana_seleccion,istr_parametros_seleccion)
		lstr_dato_seleccionado = Message.PowerObjectParm
		
		IF lstr_dato_seleccionado.b_nulo = False THEN
			// Asigna el dato retornado por la ventana de selección
			IF Not IsNull(lstr_dato_seleccionado.String[2]) AND Len(lstr_dato_seleccionado.String[2]) > 0 THEN
				dw_parametros.Object.descripcion_parametro[ii_fila_parametro] = lstr_dato_seleccionado.String[2]
			END IF
			
			IF istr_parametros_seleccion.Integer[1] = 1 THEN	
				CHOOSE CASE is_tipo_parametro_a_asignar
				
					CASE 'DA' // Fecha
						dw_parametros.Object.parametro_fecha[ii_fila_parametro] = lstr_dato_seleccionado.Date[1]
						
					CASE 'DC' // Decimal
						dw_parametros.Object.parametro_decimal[ii_fila_parametro] = lstr_dato_seleccionado.Decimal[1]
						
					CASE 'DT' // Fecha Hora
						dw_parametros.Object.parametro_fecha_hora[ii_fila_parametro] = lstr_dato_seleccionado.DateTime[1]
																		
					CASE 'NM' // Número Entero
						dw_parametros.Object.parametro_numero[ii_fila_parametro] = lstr_dato_seleccionado.Long[1]
						
					CASE 'ST' // String
						dw_parametros.Object.parametro_string[ii_fila_parametro] = lstr_dato_seleccionado.String[1]
						
					CASE 'TM' // Hora
						dw_parametros.Object.parametro_hora[ii_fila_parametro] = lstr_dato_seleccionado.Time[1]
						
				END CHOOSE	
			END IF	
		END IF
	END IF	
END IF	
end event

event ue_teclas();//DRT==>2008/Ago/15 Ejecuta los servicios del menú de botones

IF Keydown(Keyshift!) and Keydown(KeyR!) THEN
	uo_menu.pb_recuperar.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyO!) THEN
	uo_menu.pb_ordenar.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyF!) THEN
	uo_menu.pb_filtrar.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyP!) THEN
	uo_menu.pb_ir_a_primero.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyA!) THEN
	uo_menu.pb_ir_a_anterior.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyS!) THEN
	uo_menu.pb_ir_a_siguiente.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyU!) THEN
	uo_menu.pb_ir_a_ultimo.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyE!) THEN
	uo_menu.pb_exportar.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyI!) THEN
	uo_menu.pb_imprimir.event clicked( )	
ELSEIF Keydown(Keyshift!) and Keydown(KeyM!) THEN
	uo_menu.pb_parametros.event clicked( )
ELSEIF Keydown(Keyshift!) and Keydown(KeyZ!) THEN
	uo_menu.pb_zoom.event clicked( )
END IF
end event

public subroutine wf_leer_dato_anterior (datawindow pdw_datawindow);//	Esta función es general para todas las ventanas que hereden de esta
// ventana. No se debe sobreescribir
//************************************************************************

Long l_pos

is_columna = pdw_datawindow.GetColumnName()
is_tipo = pdw_datawindow.Describe(is_columna+".ColType")

l_pos = Pos(is_tipo,'(')

IF l_pos > 0 THEN
	is_tipo = Left(is_tipo,l_pos - 1) 
END IF

CHOOSE CASE Upper(is_tipo)
	
	CASE 'DATE'
		id_dato_anterior = pdw_datawindow.GetItemDate(1,is_columna)

	CASE 'DATETIME'
		idt_dato_anterior = pdw_datawindow.GetItemDateTime(1,is_columna)

	CASE 'STRING', 'CHAR'
		is_dato_anterior = pdw_datawindow.GetItemString(1,is_columna)

	CASE 'DECIMAL', 'DOUBLE', 'LONG', 'INTEGER', 'NUMBER'
		idc_dato_anterior = pdw_datawindow.GetItemDecimal(1,is_columna)

END CHOOSE
end subroutine

public subroutine wf_titulos_reporte ();//	Esta función es general para todas las ventanas que hereden de esta
// ventana. No se debe sobreescribir
//
//	David Felipe Arango F. 2004/06/15
//
//	Esta función, se usa para asignar la descripción(valor de visualizacion)
// de los parámetros de la lista a la datawindow de reporte.
//
//	No recibe ningún parámetro
//
//	No retorna ningún parámetro
//
//************************************************************************

STRU_FRMWRK_PARAMETROS	lsrt_parametros
INTEGER						li_fila, li_encontrado
STRING						ls_nro_etiqueta, ls_nro_parametro, ls_nombre_parametro, &
								ls_descripcion_parametro, ls_valor_parametro 
			
FOR li_fila = 1 TO dw_parametros.RowCount()	
	ls_nro_etiqueta = 'st_etiqueta' + String(li_fila)
	ls_nro_parametro = 'st_parametro' + String(li_fila)
	ls_nombre_parametro = dw_parametros.GetItemString(li_fila,'nombre_parametro')
	lsrt_parametros.String[1] = ls_nombre_parametro
	ls_valor_parametro = Trim(dw_parametros.uf_obtener_valor_parametro(lsrt_parametros))
	IF IsNull(ls_valor_parametro) THEN
		ls_valor_parametro = ''
	END IF		
	ls_descripcion_parametro = Trim(dw_parametros.uf_obtener_descripcion_parametro(lsrt_parametros))
	IF IsNull(ls_descripcion_parametro) THEN
		ls_descripcion_parametro = ''
	ELSE
		li_encontrado = Pos(Upper(ls_descripcion_parametro),'TODAS ')
		IF li_encontrado > 0 THEN
//			ls_descripcion_parametro = Mid(ls_descripcion_parametro,li_encontrado,5)
		ELSE
			li_encontrado = Pos(Upper(ls_descripcion_parametro),'TODOS ')			
			IF li_encontrado > 0 THEN
//				ls_descripcion_parametro = Mid(ls_descripcion_parametro,li_encontrado,5)
			END IF
		END IF	
	END IF	
	IF ls_valor_parametro <> ls_descripcion_parametro THEN
		ls_valor_parametro = ls_descripcion_parametro + ' (' + ls_valor_parametro + ')'
	END IF
	dw_reporte.Modify(ls_nro_etiqueta + ".Text = '" + ls_nombre_parametro  + ": '")
	dw_reporte.Modify(ls_nro_parametro + ".Text = '" + ls_valor_parametro + "'")	
NEXT



end subroutine

public subroutine wf_inicializar_parametros ();UO_FRMWRK_DATASTORE		luo_ds_temporal
STRU_FRMWRK_PARAMETROS	lstr_parametros
DATE							lda_valor
DATETIME						ldt_valor
DECIMAL						ldc_valor
INTEGER						li_parametro, li_parametros, li_temporal
LONG							ll_valor
STRING						ls_valor, ls_descripcion, ls_parametro
TIME							ltm_valor	

li_parametros = dw_parametros.RowCount()

IF li_parametros > 0 THEN
	luo_ds_temporal = CREATE UO_FRMWRK_DATASTORE
	IF IsValid(luo_ds_temporal) THEN
		luo_ds_temporal.DataObject = 'd_frmwrk_parametros'
		luo_ds_temporal.SetTransObject(sqlca)

		FOR li_parametro = 1 TO li_parametros
			ls_valor = dw_parametros.Object.valor_x_defecto[li_parametro]
			ls_parametro = Upper(dw_parametros.Object.nombre_parametro[li_parametro])
			li_temporal = luo_ds_temporal.Find("Upper(nombre_parametro) = '" + ls_parametro + "'",1,luo_ds_temporal.RowCount())
			ls_descripcion = luo_ds_temporal.Object.descripcion_parametro[li_temporal]
			
			CHOOSE CASE Upper(dw_parametros.Object.tipo_parametro[li_parametro])
			
				CASE 'DA' // Fecha
					IF IsNull(ls_valor) OR ls_valor = 'NULO' THEN
						SetNull(lda_valor)		
					ELSE
						lda_valor = Date(ls_valor)
					END IF
					dw_parametros.SetItem(li_parametro,'parametro_fecha',lda_valor)
					
				CASE 'DC' // Decimal
					IF IsNull(ls_valor) OR ls_valor = 'NULO' THEN
						SetNull(ldc_valor)		
					ELSE
						ldc_valor = Dec(ls_valor)
					END IF
					dw_parametros.SetItem(li_parametro,'parametro_decimal',ldc_valor)
					
				CASE 'DT' // Fecha Hora
					IF IsNull(ls_valor) OR ls_valor = 'NULO' THEN
						SetNull(ldt_valor)		
					ELSE
						ldt_valor = DateTime(ls_valor)
					END IF
					dw_parametros.SetItem(li_parametro,'parametro_fecha_hora',ldt_valor)
					
				CASE 'ST', 'LS' // String, Lista (puede ser SQL, DW o LV)	
					IF IsNull(ls_valor) OR ls_valor = 'NULO' THEN
						SetNull(ls_valor)		
					END IF
					dw_parametros.SetItem(li_parametro,'parametro_string',ls_valor)
					
				CASE 'NM' // Número
					IF IsNull(ls_valor) OR ls_valor = 'NULO' THEN
						SetNull(ll_valor)		
					ELSE
						ll_valor = Long(ls_valor)
					END IF
					dw_parametros.SetItem(li_parametro,'parametro_numero',ll_valor)
									
				CASE 'TM' // Hora
					IF IsNull(ls_valor) OR ls_valor = 'NULO' THEN
						SetNull(ltm_valor)		
					ELSE
						ltm_valor = Time(ls_valor)
					END IF
					dw_parametros.SetItem(li_parametro,'parametro_hora',ltm_valor)
					
			END CHOOSE			
			dw_parametros.Object.descripcion_parametro[li_parametro] = ls_descripcion
		NEXT	
	END IF	
	Destroy luo_ds_temporal
END IF
end subroutine

event open;//	Este evento es general para todas las ventanas que hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, ya que este evento tiene instrucciones que son especificas
// para cada informe que se requiera presentar en las ventanas que sean 
// heredadas de esta, estas instrucciones deben ser adicionadas en este
// mismo evento de la ventana heredada sin sobreescribir el evento en el padre.
//
//************************************************************************************
//	Ejemplo de la codificación de este evento en una ventana heredada de esta 
//************************************************************************************
// Define en la ventana heredada los parámetros que tendra cada uno de los informes
//
//	imn_menu_informes = CREATE m_menu_informes
//	This.ChangeMenu(imn_menu_informes)
//
//	CHOOSE CASE is_dw_reporte	
//										
//		CASE 'd_informe_1'
//			istr_parametros_reportes.s_parametro[1]  = 'Producto'
//
//		CASE 'd_informe_......'
//			istr_parametros_reportes.s_parametro[1]  = 'Cliente'
//			istr_parametros_reportes.s_parametro[2]  = 'Facturas'
//
//		CASE 'd_informe_n'
//
//	END CHOOSE	



STRU_FRMWRK_PARAMETROS	lstr_parametros, lstr_parametros_tamano_visualizacion

SetPointer(HourGlass!)

/*DRT==>2008-ago-26 Registra los objetos de la ventana para poder realizar el redimensionamiento**********/
inv_resize= CREATE pfc_n_cst_resize 
//this.of_SetResize(TRUE)
IF IsValid(inv_resize) THEN
   inv_resize.of_SetOrigSize(this.WorkSpaceWidth(),this.WorkSpaceHeight()) 
   inv_resize.of_Register(dw_reporte, "Scale")
   inv_resize.of_Register(gb_menu, "Scale")
   inv_resize.of_Register(dw_parametros, "Scale")
   inv_resize.of_Register(uo_menu, "Scale")		
   inv_resize.of_Register(gb_reporte, "Scale")			
END IF
/*********************************************************************************************************/


il_reporte_Y_inicial=		dw_reporte.Y
il_reporte_HEIGHT_inicial= dw_reporte.HEIGHT
il_reporte_X_inicial		 = dw_reporte.x
il_reporte_WIDTH_inicial = dw_reporte.WIDTH


iw_ventana 						= This
dw_parametros.iw_dwventana = This
dw_reporte.iw_dwventana 	= This
ii_tamano_visualizacion_dw = 100

This.SetRedraw(False)
This.SetMicroHelp("Recibiendo parámetros del informe.")

// Pone invisible la lista de parámetros
dw_parametros.Visible = False

// Recupera los parametros enviados
lstr_parametros= Message.PowerObjectParm
is_dw_reporte 	= Lower(Trim(lstr_parametros.String[1]))
is_titulo		= lstr_parametros.String[2]

This.Title 		= gs_nombre_aplicacion + ' - ' + This.Title + ' - ' + is_titulo

// Asigna el tamaño al espacio de trabajo de la ventana
//This.Height = This.WorkSpaceHeight() + 80

// Asigna la datawindow del reporte
dw_reporte.DataObject = is_dw_reporte
dw_reporte.SetTransObject(sqlca)

// Asigno los titulos del reporte
dw_reporte.Modify("compania.Text = '" + gs_nombre_empresa + "'")
dw_reporte.Modify("nombre_informe.Text = '" + is_titulo + "'")
dw_reporte.Modify("linea1.Text = '" + gs_nombre_aplicacion + "'")
dw_reporte.Modify("linea2.Text = '" + '' + "'")
dw_reporte.Modify("usuario.text = '" + gs_usuario + "'")
dw_reporte.Modify("piepagina1.Text = '" + is_dw_reporte + "'")
dw_reporte.Modify("piepagina2.Text = '" + gs_servidor + "'")

// Crea el objeto que cambia el tamaño de visualización al reporte de acuerdo al valor asignado
IF Not IsValid(iuo_seleccion_tamano_visualizacion_dw) THEN
	iuo_seleccion_tamano_visualizacion_dw = CREATE UO_FRMWRK_SELECCION_TAMANO_VISUALIZACION
	IF IsValid(iuo_seleccion_tamano_visualizacion_dw) THEN
		lstr_parametros_tamano_visualizacion.Window[1] 		= This
		lstr_parametros_tamano_visualizacion.Datawindow[1] = dw_reporte
		lstr_parametros_tamano_visualizacion.Integer[1] 	= ii_tamano_visualizacion_dw
		This.OpenUserObjectWithParm(iuo_seleccion_tamano_visualizacion_dw,lstr_parametros_tamano_visualizacion,0,4)
		iuo_seleccion_tamano_visualizacion_dw.Visible 		= False
	END IF
END IF

// Cambia el tamaño de visualización al reporte de acuerdo al valor asignado
dw_reporte.Modify("datawindow.print.preview.zoom = " + String(ii_tamano_visualizacion_dw))

// Activa la presentacion preliminar
dw_reporte.Modify("datawindow.print.preview = yes")

// Hace visible la datawindow del reporte
dw_reporte.Visible = True
This.SetRedraw(True)

This.PostEvent("ue_postopen")


//DRT
uo_menu.idw_ventana_padre= THIS

//DRTConfiguración regional para el formato de fecha
in_cst_configuracion_regional = CREATE n_cst_configuracion_regional
is_formato_fecha= in_cst_configuracion_regional.of_get_formato_fecha_corta( )
end event

event close;//	Este evento es general para todas las ventanas que2 hereden de esta
// ventana. El evento debe ser declarado en las ventanas heredadas como
//	<extended>, si se hace necesario realizar algun proceso adicional en
// el evento de la ventana que fue heredada, en caso de que sea necesario
// reescribir el evento en el padre se debe de pegar este código en el 
// evento de la ventana heredada
//************************************************************************


DESTROY iuo_seleccion_tamano_visualizacion_dw
DESTROY This.MenuId
GarbageCollect()
end event

on w_frmwrk_informes.create
this.uo_menu=create uo_menu
this.dw_reporte=create dw_reporte
this.dw_parametros=create dw_parametros
this.gb_menu=create gb_menu
this.gb_reporte=create gb_reporte
this.Control[]={this.uo_menu,&
this.dw_reporte,&
this.dw_parametros,&
this.gb_menu,&
this.gb_reporte}
end on

on w_frmwrk_informes.destroy
destroy(this.uo_menu)
destroy(this.dw_reporte)
destroy(this.dw_parametros)
destroy(this.gb_menu)
destroy(this.gb_reporte)
end on

event resize;//DRT==>2008-ago-26
inv_resize.event pfc_resize( sizetype, newwidth, newheight)
end event

type uo_menu from uo_frmwrk_menu_botones_reportes within w_frmwrk_informes
integer x = 14
integer y = 32
integer width = 4553
integer taborder = 40
end type

on uo_menu.destroy
call uo_frmwrk_menu_botones_reportes::destroy
end on

type dw_reporte from uo_frmwrk_datawindow within w_frmwrk_informes
boolean visible = false
integer x = 27
integer y = 328
integer width = 4530
integer height = 2044
integer taborder = 50
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event ue_tecla_presionada;call super::ue_tecla_presionada;// Este evento esta sobreescrito para evitar que el codigo que tiene este script 
// en este evento del padre genere errores
end event

event retrieveend;//IF rowcount > 0 THEN
	// Activa las opciones de impresión del menú principal,  
	// de acuerdo a los permisos del usuario de la aplicación
	// como no se tiene un menú principal estandar definido en
	// el framework, se deja comentado y se debe poner el script 
	// en este mismo evento en la ventana heredada
	// f_frmwrk_opciones_grupo(Parent)	
//END IF
end event

event retrievestart;// Desactiva las opciones de impresión del menú principal,  
// como no se tiene un menú principal estandar definido en
// el framework, se deja comentado y se debe poner el script 
// en este mismo evento en la ventana heredada
//
// m_imprimir.Enabled = False		
// m_configurarimpresora.Enabled = False

// Desactiva las opciones de impresión del menú de informes,  
// como no se tiene un menú de informes estandar definido en
// el framework, se deja comentado y se debe poner el script 
// en este mismo evento en la ventana heredada
//
// m_opcionesdeimpresin.Enabled = False
// m_zoomaumentar.Enabled = False				
// m_imprimir.Enabled = False
// m_configurarimpresora.Enabled = False	
end event

event getfocus;call super::getfocus;This.iw_dwventana = iw_ventana
end event

type dw_parametros from uo_frmwrk_datawindow_parametros within w_frmwrk_informes
boolean visible = false
integer x = 23
integer y = 332
integer width = 4544
integer taborder = 10
boolean bringtotop = true
boolean vscrollbar = true
end type

event doubleclicked;call super::doubleclicked;IF Upper(This.GetItemString(row,'ventana_seleccion')) = 'S' THEN
	Parent.PostEvent("ue_seleccionar_parametro")
END IF	
end event

event ue_tecla_presionada;call super::ue_tecla_presionada;// Este evento esta sobreescrito para evitar que el codigo que tiene este script 
// en este evento del padre genere errores



end event

event getfocus;call super::getfocus;This.iw_dwventana = iw_ventana
end event

type gb_menu from groupbox within w_frmwrk_informes
integer x = 5
integer width = 4585
integer height = 308
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

type gb_reporte from groupbox within w_frmwrk_informes
integer x = 5
integer y = 288
integer width = 4585
integer height = 2112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

