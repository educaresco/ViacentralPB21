$PBExportHeader$w_impresion.srw
$PBExportComments$Este objeto pertenece a la librería Utigeneral02, se realizó modificación en el evento cliked del boton cb_ok porque es necesario que retorne el resultado del proceso de impresión.
forward
global type w_impresion from window
end type
type uo_exportar from uo_exportar_datawindow within w_impresion
end type
type rb_actual from radiobutton within w_impresion
end type
type cbx_ordenar_copias from checkbox within w_impresion
end type
type cb_ayuda from commandbutton within w_impresion
end type
type st_impresora from statictext within w_impresion
end type
type cb_configurar from commandbutton within w_impresion
end type
type cb_cancelar from commandbutton within w_impresion
end type
type sle_rango_paginas from singlelineedit within w_impresion
end type
type rb_rango_paginas from radiobutton within w_impresion
end type
type rb_todas from radiobutton within w_impresion
end type
type em_copias from editmask within w_impresion
end type
type st_copias from statictext within w_impresion
end type
type st_1 from statictext within w_impresion
end type
type cb_ok from commandbutton within w_impresion
end type
type gb_rango_paginas from groupbox within w_impresion
end type
type st_instruccion from statictext within w_impresion
end type
type gb_impresion from groupbox within w_impresion
end type
type ddlb_rango from dropdownlistbox within w_impresion
end type
type st_imprimir from statictext within w_impresion
end type
end forward

global type w_impresion from window
integer x = 864
integer y = 652
integer width = 2386
integer height = 1096
boolean titlebar = true
string title = "Impresión / Exportar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "V:\PSL\GRAFICOS\sofsin.ico"
uo_exportar uo_exportar
rb_actual rb_actual
cbx_ordenar_copias cbx_ordenar_copias
cb_ayuda cb_ayuda
st_impresora st_impresora
cb_configurar cb_configurar
cb_cancelar cb_cancelar
sle_rango_paginas sle_rango_paginas
rb_rango_paginas rb_rango_paginas
rb_todas rb_todas
em_copias em_copias
st_copias st_copias
st_1 st_1
cb_ok cb_ok
gb_rango_paginas gb_rango_paginas
st_instruccion st_instruccion
gb_impresion gb_impresion
ddlb_rango ddlb_rango
st_imprimir st_imprimir
end type
global w_impresion w_impresion

type variables
DATAWINDOW	idw_reporte
INTEGER		ii_total_datos, ii_maximo_tamano_dato
STRING		is_paginas_impresion, is_titulo, is_email, &
				is_item_exportar = 'Guardar en disco'


end variables

forward prototypes
private subroutine wf_rango_paginas (radiobutton as_tipo_impresion_seleccionada)
public function string wf_buscar_propiedad_sintaxis (string as_cadena, string as_buscar, string as_buscar_fin)
public function stru_frmwrk_parametros wf_borrar_encabezados_adicionales (stru_frmwrk_parametros astr_parametros)
public function stru_frmwrk_parametros wf_descripcion_sintaxis (stru_frmwrk_parametros astr_parametros)
public function string wf_generar_codigo_html (stru_frmwrk_parametros astr_parametros)
public function stru_frmwrk_parametros wf_modificar_sintaxis (stru_frmwrk_parametros astr_parametros)
public function stru_frmwrk_parametros wf_procesar_encabezado_pie (stru_frmwrk_parametros astr_parametros)
end prototypes

private subroutine wf_rango_paginas (radiobutton as_tipo_impresion_seleccionada);//************************************************************************
//	AvanSoft S.A. 2005/03/21

//	Esta función, se usa configurar los controles de la ventana de acuerdo
// con las condiciones de impresión seleccionadas por el usuario.

//	Recibe el parámetro as_tipo_impresion_seleccionada de tipo radio button
// el cual indica cuales condiciones de impresión fueron seleccionadas por
// el usuario.

//	No retorna ningún parámetro.
//************************************************************************

CHOOSE CASE as_tipo_impresion_seleccionada

	CASE rb_todas
		sle_rango_paginas.Text = ''
		sle_rango_paginas.Enabled = False
		sle_rango_paginas.BackColor = RGB(192,192,192)
		sle_rango_paginas.BorderStyle = StyleBox!
		is_paginas_impresion = 'a'
	
	CASE rb_actual
		sle_rango_paginas.Text = ''
		sle_rango_paginas.Enabled = False
		sle_rango_paginas.BackColor = RGB(192,192,192)
		sle_rango_paginas.BorderStyle = StyleBox!
		is_paginas_impresion = 'c'
	
	CASE rb_rango_paginas
		sle_rango_paginas.Enabled = TRUE
		sle_rango_paginas.BackColor = RGB(255,255,255)
		sle_rango_paginas.BorderStyle = StyleLowered!
		sle_rango_paginas.SetFocus()
		is_paginas_impresion = 'p'

END CHOOSE

end subroutine

public function string wf_buscar_propiedad_sintaxis (string as_cadena, string as_buscar, string as_buscar_fin);//************************************************************************
//	AvanSoft S.A. 2005/03/23

//	Esta función, se usa para buscar una propiedad especifica dentro de la 
// sintaxis de la DataWindow, DataStore o DatWindowChild.

//	Recibe los siguientes parámetros:
//
// as_cadena 
// Tipo: String
// Contiene la cadena de texto de la sintaxis de la DataWindow, DataStore
// o DatWindowChilden en la cual se va a buscar la propiedad especifica.
//
// as_buscar 
// Tipo: String
// Contiene la cadena de texto o el caracter con que inicia la propiedad que
// se va a buscar dentro dentro de la sintaxis de la DataWindow, DataStore o
// DatWindowChild.
//
// as_buscar_fin 
// Tipo: String
// Contiene la cadena de texto o el caracter con que finaliza la propiedad
// que se va a buscar dentro dentro de la sintaxis de la DataWindow, DataStore
// o DatWindowChild.
//
//	Retorna la variable ls_resultado de tipo String con el valor de la
// propiedad buscada si la busqueda fue existosa, si la busqueda falló
// Retorna la variable con un valor nulo.
//************************************************************************

LONG					ll_posicion_inicial, ll_posicion_final, ll_tamano_buscar
STRING				ls_resultado

ll_tamano_buscar = Len(as_buscar)
ll_posicion_inicial = Pos(as_cadena,as_buscar,1)

IF ll_posicion_inicial > 0 THEN
	ll_posicion_inicial = ll_posicion_inicial + ll_tamano_buscar	

	IF Not IsNull(as_buscar_fin) THEN
		ll_posicion_final = Pos(as_cadena,as_buscar_fin,ll_posicion_inicial)
		ls_resultado = Trim(Mid(as_cadena,ll_posicion_inicial,ll_posicion_final - ll_posicion_inicial))
	ELSE
		MessageBox("Error",'No se envio la cadena que indica el fin de la propiedad buscada en la sintaxis.~r~n~r~nProceso Cancelado')
		SetNull(ls_resultado)
	END IF
END IF
	
Return ls_resultado
end function

public function stru_frmwrk_parametros wf_borrar_encabezados_adicionales (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	AvanSoft S.A. 2005/03/23

//	Esta función, se usa para borrar de la datastore usada para exportar
// las etiquetas de los nonbre de las columnas que quedan como resultado de
// la generación dinamica de la datastore

//	Recibe como parámetro la estructura astr_parametros de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
// astr_parametros.DataWindowChild[1]
// Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
// de objeto donde se encuentran almacenados los datos.
// Contiene la datawindow, datastore o datawindowchild donde
// donde se encuentran almacenados los datos que se deben
// extraer para exportarlos uniificandolos segun el caso.

//	Retorna la estructura astr_parametros de tipo stru_b_parametros 
// la cual tiene el indicador astr_parametros.b_nulo el cual indica si
// durante el proceso de borrado de los encabezados de la datastore hubo
// errores (True) o se borraron las etiquetas sin problemas (False)			
//************************************************************************

INTEGER				li_columna	
STRING				ls_sintaxis

li_columna = 0
DO WHILE li_columna < ii_total_datos 			
	li_columna++
	astr_parametros.String[1] = "Destroy COLUMNA" + String(li_columna) + "_T"
	astr_parametros = wf_modificar_sintaxis(astr_parametros)			
	IF astr_parametros.b_nulo THEN
		li_columna = ii_total_datos
	END IF	
LOOP
				
Return astr_parametros

end function

public function stru_frmwrk_parametros wf_descripcion_sintaxis (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	AvanSoft S.A. 2005/03/28

//	Esta función, se usa para obtener la sintaxis o el valor de una propiedad
// especifica de una DataWindow, DataStore o DataWindowChild en ejecución.

//	Recibe como parámetro la estructura astr_parametros de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
// astr_parametros.DataWindowChild[1]
// Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
// de objeto al cual se quiere obtener la sintaxis o el valor de una de sus
// propiedades dinamicamente en ejecución.

//	Retorna la estructura lstr_retorno de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// lstr_retorno.DataWindow[1], lstr_retorno.DataStore[1] o
// lstr_retorno.DataWindowChild[1]
// Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
// de objeto del cual se obtuvo la sintaxis o el valor de una de sus
// propiedades dinamicamente en ejecución.

// lstr_retorno.String[1]
// Tipo: String
// Contiene una cadena de texto la cual contiene la sintaxis o el valor de
// la propiedad del objeto si el proceso fue exitoso, esta vacia o contiene
// una interrogación (lstr_retorno.String[1] = '' lstr_retorno.String[1] = '?')
// si la obtención o el valor de la propiedad del objeto falló.

// lstr_retorno.b_nulo
// Tipo: Boolean
// la cual tiene el indicador lstr_retorno.b_nulo el cual indica si
// durante el proceso de obtención de la sintaxis o el valor de la propiedad
// del objeto hubo errores (True) o se obtuvo la sintaxis o el valor de la 
// propiedad del objeto sin problemas (False)			
//************************************************************************

STRU_frmwrk_PARAMETROS	lstr_retorno

IF UpperBound(astr_parametros.DataWindow) = 1 THEN
	lstr_retorno.String[1] = astr_parametros.DataWindow[1].Describe(astr_parametros.String[1])
END IF	
		
IF UpperBound(astr_parametros.DataStore) = 1 THEN
	lstr_retorno.String[1] = astr_parametros.DataStore[1].Describe(astr_parametros.String[1])
END IF	
		
IF UpperBound(astr_parametros.DataWindowChild) = 1 THEN
	lstr_retorno.String[1] = astr_parametros.DataWindowChild[1].Describe(astr_parametros.String[1])
END IF	

lstr_retorno.b_nulo = False
IF Len(Trim(lstr_retorno.String[1])) = 0  OR Trim(lstr_retorno.String[1]) = '?' THEN
	MessageBox("Error",'Ocurrió un error (' + lstr_retorno.String[1] + ') al tratar de obtener la sintaxis del objeto.~r~n~r~nProceso Cancelado',StopSign!)
	lstr_retorno.b_nulo = True
END IF

Return lstr_retorno
end function

public function string wf_generar_codigo_html (stru_frmwrk_parametros astr_parametros);stru_frmwrk_parametros	lstr_sintaxis
LONG					ll_crosstab
STRING				ls_sintaxis, ls_estilo, ls_data, ls_codigo_html

// Extrae de la estructura enviada como parámetro la sintaxis
// del objeto (DataWindow, DataStore o DataWindowChild) que
// contiene los datos a exportar
astr_parametros.String[1] = "DataWindow.Syntax" 
lstr_sintaxis = wf_descripcion_sintaxis(astr_parametros)

// Valida si fue posible extraer la sintaxis del objeto 
// (DataWindow, DataStore o DataWindowChild)
IF Not lstr_sintaxis.b_nulo THEN
	// Verifica si el tipo de objeto es crosstab
	ll_crosstab = Pos(lstr_sintaxis.String[1],"crosstab(",1)
		
	// Valida que la sintaxis del objeto (DataWindow, DataStore o DataWindowChild)
	// no este vacia y que no sea tipo crosstab para aplicar al objeto las
	// modificacioes en la sintaxis
	IF Trim(ls_sintaxis) <> "" AND ll_crosstab = 0 THEN
		ls_sintaxis = "DataWindow.HTMLTable.GenerateCSS=~"no~" " + &
						"DataWindow.HTMLTable.NoWrap=~"no~" " + &
						"DataWindow.HTMLTable.Border=" + String(1) + " " + &
						"DataWindow.HTMLTable.Width=" + String(0) + " " + &
						"DataWindow.HTMLTable.CellPadding=" + String(0) + " " + &
						"DataWindow.HTMLTable.CellSpacing=" + String(0) + "" 
		
		astr_parametros.String[1] = ls_sintaxis	
		astr_parametros = wf_modificar_sintaxis(astr_parametros)
	END IF
	
	IF Not astr_parametros.b_nulo THEN
		// Extrae del objeto (DataWindow, DataStore o DataWindowChild) la sintaxis del
		// estilo y los datos para el HTML
		IF UpperBound(astr_parametros.DataWindow) = 1 THEN
			ls_estilo = astr_parametros.DataWindow[1].Describe("DataWindow.HTMLTable.StyleSheet")
			ls_data = astr_parametros.DataWindow[1].Describe("DataWindow.Data.HTMLTable")
		END IF	
		
		IF UpperBound(astr_parametros.DataStore) = 1 THEN
			ls_estilo = astr_parametros.DataStore[1].Describe("DataWindow.HTMLTable.StyleSheet")
			ls_data = astr_parametros.DataStore[1].Describe("DataWindow.Data.HTMLTable")
		END IF	
		
		IF UpperBound(astr_parametros.DataWindowChild) = 1 THEN
			ls_estilo = astr_parametros.DataWindowChild[1].Describe("DataWindow.HTMLTable.StyleSheet")
			ls_data = astr_parametros.DataWindowChild[1].Describe("DataWindow.Data.HTMLTable")	
		END IF	
		
		IF IsNull(ls_estilo) OR Len(Trim(ls_estilo)) = 0 THEN
			astr_parametros.b_nulo = True
		END IF	
		
		IF IsNull(ls_estilo) OR Len(Trim(ls_estilo)) = 0 THEN
			astr_parametros.b_nulo = True			
		END IF	
				
		IF Not astr_parametros.b_nulo THEN
			// Genera la sintaxis del HTML con el encabezado, los estilos
			// y el conjunto de datos del cuerpo del HTML
			ls_codigo_html = "<HTML>" + "<BODY>" + ls_estilo + "~r~n" + ls_data
		
//		// Busca en el cuerpo del HTML la posición de inicio de los encabezados de las columnas
//		// del repositorio que fue creado dinamicamente para generar el archivo a exportar
//		ll_posicion = Pos(ls_html,'<table>~r~n<tr><th')
//		IF ll_posicion > 0 THEN	
//			// Elimina del cuerpo del HTML los encabezados de las columnas del repositorio que fue creado
//			// dinamicamente para generar el archivo a exportar
//			ls_html = Replace(ls_html,ll_posicion + 7,Pos(ls_html,'~r~n<tr><td>',ll_posicion) - ll_posicion,'')
//		END IF	
		END IF
	END IF
	
	IF IsNull(ls_codigo_html) OR Len(Trim(ls_codigo_html)) = 0 THEN
	// Revisar
	//	lnv_parametros	= Create n_parametros
	//	lnv_parametros.nf_asignar_objetosimple("codigo", "DOC0001")
	//	lnv_parametros.nf_asignar_objetosimple("Parametros",&
	//	"&Objeto= la generacion de la tabla HTML&|")
	//	OpenWithParm(w_mensaje, lnv_parametros)
	//	Destroy lnv_parametros
	//lb_retorno = False
		SetNull(ls_codigo_html)
	END IF
	
	// Verifica que el código html generado tenga información en el detalle
	// (el tamaño debe ser mínimo 2 Kb)
	//IF Len(is_codigohtm) < 1000 THEN
	// Revisar
	//	lnv_parametros	= Create n_parametros
	//	lnv_parametros.nf_asignar_objetosimple("codigo", "PSL1000")
	//	lnv_parametros.nf_asignar_objetosimple("Parametros",&
	//	"&Objeto= Este reporte no puede ser exportado por esta opción&|")
	//	OpenWithParm(w_mensaje, lnv_parametros)
	//	Destroy lnv_parametros
	//	lb_retorno = False
	//END IF					
END IF

Return ls_codigo_html

end function

public function stru_frmwrk_parametros wf_modificar_sintaxis (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	AvanSoft S.A. 2005/03/28

//	Esta función, se usa para modificar dinamicamente la sintaxis de una
// DataWindow, DataStore o DataWindowChild en ejecución.

//	Recibe como parámetro la estructura astr_parametros de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
// astr_parametros.DataWindowChild[1]
// Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
// de objeto al cual se le va a modificar la sintaxis dinamicamente en
// ejecución.

// astr_parametros.String[1]
// Tipo: String
// Contiene una cadena de texto con la sintaxis que se va a modificar
// en el objeto DataWindow, DataStore o DataWindowChild.

//	Retorna la estructura lstr_retorno de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
// astr_parametros.DataWindowChild[1]
// Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
// de objeto al cual se le modificó la sintaxis dinamicamente en
// ejecución.

// astr_parametros.String[1]
// Tipo: String
// Contiene una cadena de texto la cual esta vacia (ls_resultado = '')
// si la modificación de la sintaxis del objeto fue exitosa o contiene
// el mensaje de error si la modificación de la sintaxis falló.

//	lstr_retorno.b_nulo = Indica si la operación fue exitosa (b_nulo = False) 
//								 o fallo (b_nulo = True) 
//************************************************************************

STRU_frmwrk_PARAMETROS	lstr_retorno

IF UpperBound(astr_parametros.DataWindow) = 1 THEN
	lstr_retorno.String[1] = astr_parametros.DataWindow[1].Modify(astr_parametros.String[1])
	lstr_retorno.DataWindow[1] = astr_parametros.DataWindow[1]
END IF	
		
IF UpperBound(astr_parametros.DataStore) = 1 THEN
	lstr_retorno.String[1] = astr_parametros.DataStore[1].Modify(astr_parametros.String[1])
	lstr_retorno.DataStore[1] = astr_parametros.DataStore[1]	
END IF	
		
IF UpperBound(astr_parametros.DataWindowChild) = 1 THEN
	lstr_retorno.String[1] = astr_parametros.DataWindowChild[1].Modify(astr_parametros.String[1])
	lstr_retorno.DataWindowChild[1] = astr_parametros.DataWindowChild[1]
END IF	

lstr_retorno.b_nulo = False
IF Len(Trim(lstr_retorno.String[1])) > 0 THEN
	MessageBox("Error", 'Ocurrió un error (' + lstr_retorno.String[1] + ') al tratar de modificar la sintaxis del objeto.~r~n~r~nProceso Cancelado',StopSign!)
	lstr_retorno.b_nulo = True	
END IF

Return lstr_retorno
end function

public function stru_frmwrk_parametros wf_procesar_encabezado_pie (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	AvanSoft S.A. 2005/03/28

//	Esta función, se usa para extraer del objeto a exportar los datos 
// contenidos en las etiquetas y campos conputados del encabezado y pie
// del objeto.

//	Recibe como parámetro la estructura astr_parametros de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
// astr_parametros.DataWindowChild[1]
// Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
// de objeto del cual se vana extraer las etiquetas del encabezado
// y pie.

//	Retorna la estructura astr_parametros de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// astr_parametros.String[1]
// Tipo: String
// Contiene una cadena de texto en la cual estan contenidas todas las 
// etiquetas del encabezado del objeto. 

// astr_parametros.String[2]
// Tipo: String
// Contiene una cadena de texto en la cual estan contenidas todas las 
// etiquetas del pie del objeto. 

//	lstr_retorno.b_nulo = Indica si la operación fue exitosa (b_nulo = False) 
//								 o fallo (b_nulo = True) 
//************************************************************************

STRU_frmwrk_PARAMETROS	lstr_sintaxis
INTEGER				li_etiqueta, li_etiquetas, li_numero, li_banda_etiqueta, li_nueva_linea
LONG					ll_tamano_sintaxis, ll_posicion_inicial_sx, ll_posicion_final_sx, &
						ll_posicion_etiqueta, ll_tamano_etiqueta, ll_tamano, ll_tamano_max
STRING				ls_banda_etiqueta, ls_tipo_etiqueta, ls_cadena, ls_etiqueta, ls_datos
STRING				ls_etiquetas[], ls_valores[], ls_vacia[]

astr_parametros.String[1] = "DataWindow.Syntax" 
lstr_sintaxis = wf_descripcion_sintaxis(astr_parametros)

// Valida si el objeto (DataWindow, DataStore o DataWindowChild)
IF Not lstr_sintaxis.b_nulo THEN
	ls_etiquetas[1] = 'compania'
	ls_etiquetas[2] = 't_2'
	ls_etiquetas[3] = 'compute_1'
	ls_etiquetas[4] = 'linea3'
	ls_etiquetas[5] = 'nombre'
	ls_etiquetas[6] = 't_4'
	ls_etiquetas[7] = 'compute_2'
	ls_etiquetas[8] = 'linea1'
	ls_etiquetas[9] = 't_6'
	ls_etiquetas[10] = 'compute_3'
	ls_etiquetas[11] = 'linea4'
	ls_etiquetas[12] = 'linea2'
	ls_etiquetas[13] = 't_8'
	ls_etiquetas[14] = 'usuario'
	li_etiqueta = UpperBound(ls_etiquetas)
	li_numero = 0
	DO WHILE li_numero < 21
		li_numero++
		li_etiqueta++
		ls_etiquetas[li_etiqueta] = 'st_etiqueta' + String(li_numero)
		li_etiqueta++
		ls_etiquetas[li_etiqueta] = 'st_parametro' + String(li_numero)
	LOOP
	
	ll_tamano_sintaxis = Len(lstr_sintaxis.String[1])	
	li_banda_etiqueta = 0
	DO WHILE li_banda_etiqueta < 2
		li_banda_etiqueta++
		ls_banda_etiqueta = "band=header"
		IF li_banda_etiqueta = 2 THEN		
			ls_etiquetas = ls_vacia
			ls_etiquetas[1] = 't_23'
			ls_banda_etiqueta = "band=summary"
		END IF
		
		li_etiquetas = UpperBound(ls_etiquetas)
		ll_posicion_inicial_sx = 0
		ll_posicion_final_sx = 0
		li_etiqueta = 0		
		DO WHILE li_etiqueta < li_etiquetas
			li_etiqueta++		
			ls_tipo_etiqueta = "text("
			IF li_etiqueta = 3 OR &
				li_etiqueta = 7 OR &
				li_etiqueta = 10 THEN		
				ls_tipo_etiqueta = "compute("			
			END IF	
			ll_posicion_inicial_sx = 0
			ll_posicion_final_sx = 0
			
			DO WHILE ll_posicion_final_sx < ll_tamano_sintaxis		
				ll_posicion_inicial_sx = Pos(lstr_sintaxis.String[1],ls_tipo_etiqueta,ll_posicion_inicial_sx + 1)
				IF ll_posicion_inicial_sx > 0 THEN
					ll_posicion_final_sx = Pos(lstr_sintaxis.String[1],")",ll_posicion_inicial_sx)
					IF ll_posicion_final_sx > 0 THEN
						ls_cadena = Trim(Mid(lstr_sintaxis.String[1],ll_posicion_inicial_sx,(ll_posicion_final_sx + 1) - ll_posicion_inicial_sx))
						IF Len(ls_cadena) > Len(ls_tipo_etiqueta) + 1 THEN					
							ll_posicion_etiqueta = Pos(ls_cadena,ls_banda_etiqueta,1)
							IF ll_posicion_etiqueta > 0 THEN							
								ll_posicion_etiqueta = Pos(ls_cadena,'name=' + ls_etiquetas[li_etiqueta] + ' ',1)
								IF ll_posicion_etiqueta > 0 THEN
									CHOOSE CASE ls_tipo_etiqueta
										
										CASE "text("
											ls_etiqueta = wf_buscar_propiedad_sintaxis(ls_cadena,'(text="','"')
											IF Len(Trim(ls_etiqueta)) = 0 THEN
												ls_etiqueta = wf_buscar_propiedad_sintaxis(ls_cadena,' text="','"')									
											END IF
										
										CASE "compute("
											IF li_etiqueta = 3 THEN
												ls_etiqueta = astr_parametros.DataWindow[1].GetItemString(1,ls_etiquetas[li_etiqueta])
											END IF	
											
											IF li_etiqueta = 7 THEN
												ls_etiqueta = String(astr_parametros.DataWindow[1].GetItemDateTime(1,ls_etiquetas[li_etiqueta]))	
											END IF
											
											IF li_etiqueta = 10 THEN
												ls_etiqueta = String(astr_parametros.DataWindow[1].GetItemTime(1,ls_etiquetas[li_etiqueta]))
											END IF	
																																															
											IF IsNull(ls_etiqueta) THEN
												ls_etiqueta = ''
											END IF	
											
									END CHOOSE
									
									IF li_etiqueta > 14 THEN
										ll_tamano = Len(Trim(ls_etiqueta))
										IF ll_tamano = 0 THEN
											ll_tamano = 9
											ls_etiqueta = 'Todos(as)'
										END IF										
										IF ll_tamano_max < ll_tamano THEN
											ll_tamano_max = ll_tamano
										END IF
									END IF
									
									ls_valores[li_etiqueta] = ls_etiqueta 																																																			
																	
									// Si el dato leido es de mayor tamaño que el mayor tamaño
									// almacenado en la variable actualiza el valor
									ll_tamano_etiqueta = Len(Trim(ls_etiqueta))
									IF ll_tamano_etiqueta > ii_maximo_tamano_dato THEN
										ii_maximo_tamano_dato = ll_tamano_etiqueta
									END IF								
									ll_posicion_final_sx = ll_tamano_sintaxis									
								END IF							
							END IF
							IF ll_posicion_final_sx < ll_tamano_sintaxis THEN
								ll_posicion_final_sx++
							END IF
							ll_posicion_inicial_sx = ll_posicion_final_sx							
						ELSE
							// sintaxis de text vacia
							ll_posicion_final_sx = ll_tamano_sintaxis + 100				
						END IF					
					ELSE
						// no se cerro la sintaxis del text
						ll_posicion_final_sx = ll_tamano_sintaxis + 100
					END IF
				ELSE
					// no se encontraron etiquetas
					ll_posicion_final_sx = ll_tamano_sintaxis + 100
				END IF			
			LOOP		
			IF ll_posicion_final_sx = (ll_tamano_sintaxis + 100) THEN
				astr_parametros.b_nulo = True
				li_etiqueta = li_etiquetas + 100
				li_banda_etiqueta = 3
			END IF
		LOOP

		IF ll_posicion_final_sx <= ll_tamano_sintaxis THEN
			IF 7 > ii_total_datos THEN
				ii_total_datos = 7
			END IF

			CHOOSE CASE li_banda_etiqueta
					
				CASE 1													 
					li_etiqueta = 15
//					DO WHILE li_etiqueta < 56
//						li_etiqueta++
//						ll_tamano = Len(ls_valores[li_etiqueta])						
//						IF ll_tamano < ll_tamano_max THEN
//							ls_valores[li_etiqueta] = ls_valores[li_etiqueta] + Space(ll_tamano_max - ll_tamano)
//						END IF	
//					LOOP 
//
					astr_parametros.String[1] = '~r~n'
					IF Len(Trim(ls_valores[1] + ls_valores[2] + ls_valores[3])) > 0 THEN
						astr_parametros.String[1] = astr_parametros.String[1] + &
						'~t~t~t' + ls_valores[1] + '~t~t~t' + ls_valores[2] + ':~t'+ ls_valores[3] + '~r~n'
					END IF	
					IF Len(Trim(ls_valores[4] + ls_valores[5] + ls_valores[6] + ls_valores[7])) > 0 THEN						
						astr_parametros.String[1] = astr_parametros.String[1] + &
						'~t' + ls_valores[4] + '~t~t' + ls_valores[5] + '~t~t~t' + ls_valores[6] + ':~t'+ ls_valores[7] + '~r~n'
					END IF	
					IF Len(Trim(ls_valores[8] + ls_valores[9] + ls_valores[10])) > 0 THEN						
						astr_parametros.String[1] = astr_parametros.String[1] + &
						'~t~t~t' + ls_valores[8] + '~t~t~t' + ls_valores[9] + ':~t' + ls_valores[10] + '~r~n'
					END IF	

					IF Len(Trim(ls_valores[12] + ls_valores[13] + ls_valores[14])) > 0 THEN						
						astr_parametros.String[1] = astr_parametros.String[1] + &						
						'~t~t~t' + ls_valores[12] + '~t~t~t' + ls_valores[13] + ':~t'+ ls_valores[14] + '~r~n~r~n' 
					END IF	
					
					IF Len(Trim(ls_valores[11])) > 0 THEN						
						li_nueva_linea = Pos(ls_valores[11],Char(13) + Char(10))
						astr_parametros.String[1] = astr_parametros.String[1] + &						
						Mid(ls_valores[11],1,li_nueva_linea - 2) + '~r~n' + Mid(ls_valores[11],li_nueva_linea + 1) + '~r~n~r~n'
					END IF	
					
					li_etiqueta = 0
					DO WHILE li_etiqueta < 36
						li_etiqueta++						
						IF Len(Trim(ls_valores[14 + li_etiqueta] + ls_valores[15 + li_etiqueta] + &
										ls_valores[16 + li_etiqueta] + ls_valores[17 + li_etiqueta] + &
										ls_valores[18 + li_etiqueta] + ls_valores[19 + li_etiqueta])) > 0 THEN						
							astr_parametros.String[1] = astr_parametros.String[1] + &
							ls_valores[14 + li_etiqueta] + '~t' + ls_valores[15 + li_etiqueta] + &
							'~t~t' + &
							ls_valores[16 + li_etiqueta] + '~t' + ls_valores[17 + li_etiqueta] + & 
							'~t~t' + &
							ls_valores[18 + li_etiqueta] + '~t' + ls_valores[19 + li_etiqueta] + & 							
							+ '~r~n'
						END IF
						li_etiqueta = li_etiqueta + 5
					LOOP
					
					astr_parametros.String[1] = astr_parametros.String[1] + '~r~n~r~n'
								 								 											 
				CASE 2
					astr_parametros.String[2] = '~r~n~r~n~t~t~t' + ls_valores[1]
					
			END CHOOSE
			ls_valores = ls_vacia
		END IF		
	LOOP	
ELSE
	// sintaxis no valida	
END IF	

Return astr_parametros

end function

event open;// Recibe el datastore con el reporte y los parametros a imprimir
stru_frmwrk_parametros	lstr_parametros

This.X = 800
This.Y = 650

lstr_parametros = Message.PowerObjectParm

idw_reporte = lstr_parametros.DataWindow[1]
is_titulo 	= lstr_parametros.String[1]

// Verifica que existan impresoras
gs_impresora = idw_reporte.Describe('Datawindow.Printer')

IF gs_impresora = '?' THEN
	gs_impresora = 'No existen impresoras definidas'
	cb_ok.Enabled = False
	cb_configurar.Enabled = False
END IF

st_impresora.Text = gs_impresora

uo_exportar.of_set_dw(idw_reporte)
uo_exportar.of_set_parent(this)
end event

on w_impresion.create
this.uo_exportar=create uo_exportar
this.rb_actual=create rb_actual
this.cbx_ordenar_copias=create cbx_ordenar_copias
this.cb_ayuda=create cb_ayuda
this.st_impresora=create st_impresora
this.cb_configurar=create cb_configurar
this.cb_cancelar=create cb_cancelar
this.sle_rango_paginas=create sle_rango_paginas
this.rb_rango_paginas=create rb_rango_paginas
this.rb_todas=create rb_todas
this.em_copias=create em_copias
this.st_copias=create st_copias
this.st_1=create st_1
this.cb_ok=create cb_ok
this.gb_rango_paginas=create gb_rango_paginas
this.st_instruccion=create st_instruccion
this.gb_impresion=create gb_impresion
this.ddlb_rango=create ddlb_rango
this.st_imprimir=create st_imprimir
this.Control[]={this.uo_exportar,&
this.rb_actual,&
this.cbx_ordenar_copias,&
this.cb_ayuda,&
this.st_impresora,&
this.cb_configurar,&
this.cb_cancelar,&
this.sle_rango_paginas,&
this.rb_rango_paginas,&
this.rb_todas,&
this.em_copias,&
this.st_copias,&
this.st_1,&
this.cb_ok,&
this.gb_rango_paginas,&
this.st_instruccion,&
this.gb_impresion,&
this.ddlb_rango,&
this.st_imprimir}
end on

on w_impresion.destroy
destroy(this.uo_exportar)
destroy(this.rb_actual)
destroy(this.cbx_ordenar_copias)
destroy(this.cb_ayuda)
destroy(this.st_impresora)
destroy(this.cb_configurar)
destroy(this.cb_cancelar)
destroy(this.sle_rango_paginas)
destroy(this.rb_rango_paginas)
destroy(this.rb_todas)
destroy(this.em_copias)
destroy(this.st_copias)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.gb_rango_paginas)
destroy(this.st_instruccion)
destroy(this.gb_impresion)
destroy(this.ddlb_rango)
destroy(this.st_imprimir)
end on

type uo_exportar from uo_exportar_datawindow within w_impresion
integer x = 1417
integer y = 500
integer taborder = 90
end type

on uo_exportar.destroy
call uo_exportar_datawindow::destroy
end on

type rb_actual from radiobutton within w_impresion
integer x = 96
integer y = 528
integer width = 443
integer height = 68
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Página Actual"
end type

event clicked;wf_rango_paginas(This)
end event

type cbx_ordenar_copias from checkbox within w_impresion
integer x = 850
integer y = 204
integer width = 507
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Intercalar copias"
end type

type cb_ayuda from commandbutton within w_impresion
event clicked pbm_bnclicked
boolean visible = false
integer x = 1632
integer y = 404
integer width = 485
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&yuda"
end type

type st_impresora from statictext within w_impresion
integer x = 370
integer y = 36
integer width = 1961
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_configurar from commandbutton within w_impresion
integer x = 1632
integer y = 312
integer width = 485
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Con&figurar..."
end type

event clicked;// Abren ventana de selección de impresion y setup de la impresora

PrintSetup()

gs_impresora = idw_reporte.Describe('Datawindow.Printer')

IF st_impresora.Text <> gs_impresora THEN
	st_impresora.Text = gs_impresora
END IF
end event

type cb_cancelar from commandbutton within w_impresion
integer x = 1632
integer y = 220
integer width = 485
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cance&lar"
boolean cancel = true
end type

event clicked;Close (Parent)
end event

type sle_rango_paginas from singlelineedit within w_impresion
integer x = 498
integer y = 608
integer width = 846
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event getfocus;rb_rango_paginas.Checked = True
end event

type rb_rango_paginas from radiobutton within w_impresion
integer x = 96
integer y = 600
integer width = 347
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Pá&ginas"
end type

event clicked;wf_rango_paginas(This)
end event

type rb_todas from radiobutton within w_impresion
integer x = 96
integer y = 448
integer width = 242
integer height = 68
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas"
boolean checked = true
end type

event clicked;wf_rango_paginas(This)
end event

type em_copias from editmask within w_impresion
integer x = 366
integer y = 188
integer width = 192
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
string displaydata = ""
double increment = 1
string minmax = "1~~999"
end type

type st_copias from statictext within w_impresion
integer x = 123
integer y = 200
integer width = 178
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "&Copias"
boolean focusrectangle = false
end type

type st_1 from statictext within w_impresion
integer x = 59
integer y = 36
integer width = 311
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Impresora :"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_impresion
integer x = 1632
integer y = 124
integer width = 485
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;//************************************************************************
//	AvanSoft S.A. 2005/03/21

//	Esta evento se usa para hacer la impresión, exportación o envio por
// correo electronico del reporte
//************************************************************************

STRU_FRMWRK_PARAMETROS	lstr_datos, lstr_vacia
BOOLEAN				lb_cerrar, lb_con_nested_reports
INTEGER				li_control, li_fila, li_filas, li_columna, &
						li_columnas, li_visible, li_impresion
LONG					ll_registros_escritos, ll_posicion
STRING				ls_sintaxis, ls_modificacion, ls_control, ls_columnas, &
						ls_columna, ls_datos, ls_dato, ls_item_seleccionado, ls_registro[], ls_messagebox



SetPointer(Hourglass!)

SetNull(ls_messagebox)
lb_cerrar = True
li_impresion = 1

// Evalua si se selecciono la opción de exportar, enviar por
// correo electronico o imprimir
//IF Not cbx_exportar.Checked THEN
	// Si se selecciono la opción de imprimir
//	cb_ok.Enabled 			= False
//	cb_cancelar.Enabled 	= False
//	cb_configurar.Enabled= False
//	cb_ayuda.Enabled 		= False

	// Asigna si se van a intercalar las copias al imprimir
	IF cbx_ordenar_copias.Checked THEN
		ls_sintaxis = "Datawindow.Print.Collate=Yes"
	ELSE
		ls_sintaxis = "Datawindow.Print.Collate=No"
	END IF
	ls_modificacion = idw_reporte.Modify(ls_sintaxis)
	
	IF Len(Trim(ls_modificacion)) = 0 THEN
		// Asigna el número de copias a imprimir
		ls_sintaxis = "Datawindow.Print.Copies='" + em_copias.text + "'"
		ls_modificacion = idw_reporte.Modify(ls_sintaxis)
	END IF
	
	IF Len(Trim(ls_modificacion)) = 0 THEN
		// Asigna el rango de paginas seleccionado para la impresión
		IF rb_rango_paginas.checked THEN
			ls_sintaxis = "Datawindow.Print.Page.Range='" + sle_rango_paginas.text + "'"
		ELSE
			ls_sintaxis = "Datawindow.Print.Page.Range=''"
		END IF
		ls_modificacion = idw_reporte.Modify(ls_sintaxis)
	END IF
	
	IF Len(Trim(ls_modificacion)) = 0 THEN
		// Asigna la escala de la impresión		
		ls_sintaxis = "Datawindow.Print.Scale='" + idw_reporte.Describe("Datawindow.Print.Preview.Zoom") + "'"
		idw_reporte.Modify(ls_sintaxis)
	END IF
	
	// Prompt de cancelación
	//dsv_reporte.Modify("Datawindow.Print.Prompt=Yes")
	IF Len(Trim(ls_modificacion)) = 0 THEN
		ls_sintaxis = ls_sintaxis + " Datawindow.Print.Filename = ''"
		ls_modificacion = idw_reporte.Modify(ls_sintaxis)
	END IF
	
	IF Len(Trim(ls_modificacion)) = 0	 THEN
		// Imprime el reporte
		li_impresion = idw_reporte.Print()
		IF li_impresion <> 1 THEN
			li_impresion = 0
			ls_messagebox = 'La impresión falló.~r~n~r~nProceso Cancelado'
		END IF
	END IF	
	

IF Len(Trim(ls_modificacion)) > 0 THEN
	li_impresion = 0
	ls_messagebox = 'Ocurrió un error (' + ls_modificacion + ') al tratar de modificar la sintaxis del objeto que contiene los datos.~r~n~r~nProceso Cancelado'
END IF	

IF NOT IsNull(ls_messagebox) THEN
	MessageBox("Impresión",ls_messagebox )
END IF

// Verifica el estado de la variable de control de cierre si es 
// verdadera (True) cierra la ventana de impresión y retorna un
// valor que indicando si la impresión fue exitosa
IF lb_cerrar THEN
	CloseWithReturn(w_setup_impresion,li_impresion)
END IF
end event

type gb_rango_paginas from groupbox within w_impresion
integer x = 64
integer y = 392
integer width = 1326
integer height = 572
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango de Páginas"
end type

type st_instruccion from statictext within w_impresion
integer x = 96
integer y = 716
integer width = 1257
integer height = 208
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Ingrese  los  números de  las páginas a imprimir separados por coma o los rangos de las páginas a imprimir separados por guión. Por ejemplo: 2,5,8-10"
boolean focusrectangle = false
end type

type gb_impresion from groupbox within w_impresion
integer x = 32
integer y = 112
integer width = 1390
integer height = 880
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impresión"
end type

type ddlb_rango from dropdownlistbox within w_impresion
integer x = 366
integer y = 288
integer width = 992
integer height = 288
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "All Pages In Range"
boolean sorted = false
string item[] = {"Todas las páginas","Sólo las páginas pares","Sólo las páginas impares"}
borderstyle borderstyle = stylelowered!
end type

type st_imprimir from statictext within w_impresion
integer x = 123
integer y = 304
integer width = 210
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Imprimir:"
boolean focusrectangle = false
end type

