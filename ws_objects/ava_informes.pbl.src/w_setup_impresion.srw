$PBExportHeader$w_setup_impresion.srw
$PBExportComments$Este objeto pertenece a la librería Utigeneral02, se realizó modificación en el evento cliked del boton cb_ok porque es necesario que retorne el resultado del proceso de impresión.
forward
global type w_setup_impresion from window
end type
type ddlb_exportar from dropdownpicturelistbox within w_setup_impresion
end type
type cbx_email from checkbox within w_setup_impresion
end type
type st_solo_visibles from statictext within w_setup_impresion
end type
type cbx_solo_visibles from checkbox within w_setup_impresion
end type
type rb_actual from radiobutton within w_setup_impresion
end type
type cbx_exportar from checkbox within w_setup_impresion
end type
type cbx_ordenar_copias from checkbox within w_setup_impresion
end type
type cb_ayuda from commandbutton within w_setup_impresion
end type
type st_impresora from statictext within w_setup_impresion
end type
type cb_configurar from commandbutton within w_setup_impresion
end type
type cb_cancelar from commandbutton within w_setup_impresion
end type
type sle_rango_paginas from singlelineedit within w_setup_impresion
end type
type rb_rango_paginas from radiobutton within w_setup_impresion
end type
type rb_todas from radiobutton within w_setup_impresion
end type
type em_copias from editmask within w_setup_impresion
end type
type st_copias from statictext within w_setup_impresion
end type
type st_1 from statictext within w_setup_impresion
end type
type cb_ok from commandbutton within w_setup_impresion
end type
type gb_rango_paginas from groupbox within w_setup_impresion
end type
type st_instruccion from statictext within w_setup_impresion
end type
type gb_impresion from groupbox within w_setup_impresion
end type
type gb_exportar from groupbox within w_setup_impresion
end type
type ddlb_rango from dropdownlistbox within w_setup_impresion
end type
type st_imprimir from statictext within w_setup_impresion
end type
end forward

global type w_setup_impresion from window
integer x = 864
integer y = 652
integer width = 2107
integer height = 1108
boolean titlebar = true
string title = "Impresión / Exportar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
ddlb_exportar ddlb_exportar
cbx_email cbx_email
st_solo_visibles st_solo_visibles
cbx_solo_visibles cbx_solo_visibles
rb_actual rb_actual
cbx_exportar cbx_exportar
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
gb_exportar gb_exportar
ddlb_rango ddlb_rango
st_imprimir st_imprimir
end type
global w_setup_impresion w_setup_impresion

type variables
DATAWINDOW	idw_reporte
INTEGER		ii_total_datos, ii_maximo_tamano_dato
STRING		is_paginas_impresion, is_titulo, is_email, &
				is_item_exportar = 'Guardar en disco'


end variables

forward prototypes
private subroutine wf_rango_paginas (radiobutton as_tipo_impresion_seleccionada)
public function string wf_buscar_propiedad_sintaxis (string as_cadena, string as_buscar, string as_buscar_fin)
public function boolean wf_guardar_como (stru_frmwrk_parametros astr_parametros)
public function stru_frmwrk_parametros wf_borrar_encabezados_adicionales (stru_frmwrk_parametros astr_parametros)
public function stru_frmwrk_parametros wf_descripcion_sintaxis (stru_frmwrk_parametros astr_parametros)
public function string wf_generar_codigo_html (stru_frmwrk_parametros astr_parametros)
public function stru_frmwrk_parametros wf_modificar_sintaxis (stru_frmwrk_parametros astr_parametros)
public function string wf_procesar_datos_a_exportar (stru_frmwrk_parametros astr_parametros)
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

public function boolean wf_guardar_como (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	AvanSoft S.A. 2005/03/22

//	Esta función, se usa para graba los datos a exportar en una ruta y tipo
// de archivo seleccionado por el usuario.

//	Recibe como parámetro la estructura astr_parametros de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
// astr_parametros.DataWindowChild[1]
// Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
// de objeto donde se encuentran almacenados los datos.
// Contiene la datawindow, datastore o datawindowchild donde
// donde se encuentran almacenados los datos que se deben
// gurdar como.

//	Retorna la variable lb_continuar de tipo boleano que indica si durante el
// proceso de extracción de los datos de la datawindow hubo errores (False) 
// o se extrajeron los datos sin problemas (True)			
//************************************************************************

SAVEASTYPE			lst_tipo_archivo_exportar
stru_frmwrk_parametros	lstr_parametros, lstr_vacia
BOOLEAN				lb_continuar
INTEGER				li_grabar, li_sobreescribir, li_guardar_como
STRING				ls_ruta, ls_archivo, ls_tipo_archivo, ls_filtro, ls_item_seleccionado, &
						ls_codigo_html

lb_continuar = True
li_sobreescribir = 4

IF cbx_email.Checked = True THEN
	li_sobreescribir = 1	
	ls_archivo = is_titulo + ' (adjunto)'
	ls_tipo_archivo = Trim(astr_parametros.String[1])
	
	CHOOSE CASE Upper(ls_tipo_archivo)
			
		CASE 'ARCHIVO TEXTO.'
			ls_archivo += '.txt'
			
		CASE 'ARCHIVO EXCEL.'
			ls_archivo += '.xls' 
			
		CASE 'ARCHIVO CSV.'
			ls_archivo += '.csv'
			
		CASE 'ARCHIVO WMF.'
			ls_archivo += '.wmf'
			
		CASE 'ARCHIVO HTML.'
			ls_archivo += '.html'
			
		CASE 'ARCHIVO PDF.'
			ls_archivo += '.pdf'	
			
	END CHOOSE
	ls_ruta = 'C:\' + ls_archivo
ELSE	
	// Define la extensión por defecto y los tipos de archivo del filtro
	// para la ventana de selección de destino y nombre del archivo
	ls_ruta = 'C:\' + Lower(is_titulo)
	ls_filtro = 'Archivo Texto (*.txt),*.txt,Archivo Excel (*.xls),*.xls,Archivo csv (*.csv),*.csv,Archivo wmf (*.wmf),*.wmf,Archivo html (*.html),*.html,Archivo pdf (*.pdf),*.pdf'
	ls_tipo_archivo = 'txt'
	
	DO
		// Abre la ventana para guardar archivos y selecciona el nombre y la ruta, sugiriendo
		// un nombre por defecto 
		li_grabar = GetFileSaveName("Seleccione el archivo y la ruta destino del archivo a exportar",ls_ruta,ls_archivo,ls_tipo_archivo,ls_filtro)
		
		//Valida que el archivo exista y si se va a sobreesceribir
		CHOOSE CASE li_grabar
	
			CASE -1
				MessageBox("Error",'Ocurrió un error al seleccionar el nombre y la ruta para guardar el archivo.~r~n~r~nProceso Cancelado',StopSign!)
			CASE 0
				MessageBox("Información",'El usuario seleccionó el botón Cancelar.~r~n~r~nProceso Cancelado')
			
			CASE 1
				li_sobreescribir = 1
				// Verifica si el archivo ya existe, si existe despliega un mensaje de desición 
				// al usuario para que determine la acción a ejecutar
				IF FileExists(ls_ruta) THEN
					// Revisar
					li_sobreescribir = MessageBox('Decisión','El archivo ' + ls_ruta + ' ya existe, ¿Desea sobreescribirlo ?',Question!,YesNoCancel!,2)
					// Si el archivo ya existe y usuario no desea sobreescribirlo ni cancelar el proceso de exportación														
				END IF 
				
		END CHOOSE
		
	LOOP WHILE li_sobreescribir = 2
END IF

// Guarda los datos del reporte en el archivo destino
IF li_sobreescribir < 3 THEN

	// Define el tipo de archivo seleccionado
	CHOOSE CASE Upper(Right(ls_archivo,4))
	
		CASE '.TXT'
			lst_tipo_archivo_exportar = Text!
	
		CASE '.XLS' 
			lst_tipo_archivo_exportar = Excel!
		
		CASE '.CSV'
			lst_tipo_archivo_exportar = CSV!
			
		CASE '.WMF'
			lst_tipo_archivo_exportar = WMF!
		
		CASE 'HTML'
//			lst_tipo_archivo_exportar = HTMLTable!			
			lst_tipo_archivo_exportar = Text!

			ls_codigo_html = wf_generar_codigo_html(astr_parametros)		
			IF Not IsNull(ls_codigo_html) THEN
				astr_parametros = lstr_vacia
				astr_parametros.String[1] = '1'
				astr_parametros.Integer[1] = Len(ls_codigo_html)
				astr_parametros.String[2] = ' el objeto de exportación de datos'			
				astr_parametros.DataStore[1] = f_crear_datastore(astr_parametros)
	
				IF IsValid(astr_parametros.DataStore[1]) THEN
					astr_parametros.DataStore[1].InsertRow(0)
					astr_parametros.DataStore[1].SetItem(1,1,ls_codigo_html)				
				ELSE
					lb_continuar = False
				END IF	
			END IF
			
		CASE '.PDF'
			lst_tipo_archivo_exportar = PDF!
			
	END CHOOSE	
	
	IF lb_continuar THEN
		// Graba el archivo del tipo seleccionado en el disco		
		IF UpperBound(astr_parametros.DataWindow) = 1 THEN
			li_guardar_como = astr_parametros.DataWindow[1].SaveAs(ls_ruta,lst_tipo_archivo_exportar,False)
		END IF	
		
		/*IF UpperBound(astr_parametros.DataStore) = 1 THEN
			li_guardar_como = astr_parametros.DataStore[1].SaveAs(ls_ruta,lst_tipo_archivo_exportar,False)
		END IF*/
		IF UpperBound(astr_parametros.DataStore) = 1 THEN
			IF Upper(idw_reporte.Describe("DataWindow.Nested")) = 'YES' THEN
				IF Upper(Right(ls_archivo,4))= '.PDF' THEN
					astr_parametros.DataStore[1].Object.DataWindow.Export.PDF.Method       = 1
					astr_parametros.DataStore[1].Object.DataWindow.Export.PDF.XSLFOP.Print = 0
				END IF
				li_guardar_como = astr_parametros.DataStore[1].SaveAs(ls_ruta,lst_tipo_archivo_exportar,False)	
			ELSE
				idw_reporte.Object.DataWindow.Export.PDF.Method       = 1
				idw_reporte.Object.DataWindow.Export.PDF.XSLFOP.Print = 0
				li_guardar_como = idw_reporte.SaveAs(ls_ruta,lst_tipo_archivo_exportar,False)
			END IF
			
		END IF
			
		IF li_guardar_como = -1 THEN
			MessageBox("Error",'Ocurrió un error al grabar el archivo en la ruta seleccionada.~r~n~r~nProceso Cancelado',StopSign!)
			lb_continuar = False			
		ELSE
			IF cbx_email.Checked = True THEN
				lstr_parametros.String[1] = ls_ruta
				lstr_parametros.String[2] = ls_archivo
				lstr_parametros.String[3] = is_email
				lstr_parametros.String[4] = 'Reporte ' + Lower(is_titulo)
				lstr_parametros.String[5] = 'Adjunto encontrará el reporte ' + Lower(is_titulo) + ' generado'
				OpenWithParm(w_enviar_correo,lstr_parametros)											
//				FileDelete(ls_ruta)				
			ELSE			
				MessageBox("Información",'El archivo ' + ls_archivo + ' fue grabado con exito en la ruta ' + ls_ruta + '.~r~n~r~nProceso Finalizado')
			END IF	
		END IF
	END IF
END IF

Return lb_continuar
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

public function string wf_procesar_datos_a_exportar (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	AvanSoft S.A. 2005/03/23

//	Esta función, se usa para extraer del datawindow los datos de todas las
// columnas que este contiene o solo los datos de la columnas
// visibles.

//	Recibe como parámetro la estructura astr_parametros de tipo 
// stru_b_parametros la cual contiene los siguientes datos:

// astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
// astr_parametros.DataWindowChild[1]
// Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
// de objeto donde se encuentran almacenados los datos.
// Contiene la datawindow, datastore o datawindowchild donde
// donde se encuentran almacenados los datos que se deben
// extraer para exportarlos uniificandolos segun el caso.

//	Retorna la variable lb_continuar de tipo boleano que indica si durante el
// proceso de extracción de los datos de la datawindow hubo errores (False) 
// o se extrajeron los datos sin problemas (True)			
//************************************************************************

INTEGER		li_fila, li_filas, li_columna, li_columnas, li_visible, &
				li_datos
LONG			ll_posicion_inicial, ll_posicion_final 
STRING		ls_columna,  ls_columnas, ls_dato, ls_datos, ls_registro, &
				ls_separador, ls_separador_anterior

// Extrae el número de filas a procesar
IF UpperBound(astr_parametros.DataWindow) = 1 THEN
	li_filas = astr_parametros.DataWindow[1].RowCount()
END IF	

IF UpperBound(astr_parametros.DataStore) = 1 THEN
	li_filas = astr_parametros.DataStore[1].RowCount()
END IF	

IF UpperBound(astr_parametros.DataWindowChild) = 1 THEN
	li_filas = astr_parametros.DataWindowChild[1].RowCount()
END IF	
	
IF li_filas > 0 THEN
	// Recupera el número total de columnas (visibles e invisibles) de la datawindow									
	IF UpperBound(astr_parametros.DataWindow) = 1 THEN
		li_columnas = Integer(astr_parametros.DataWindow[1].Describe("DataWindow.Column.Count"))
	END IF	
	
	IF UpperBound(astr_parametros.DataStore) = 1 THEN
		li_columnas = Integer(astr_parametros.DataStore[1].Describe("DataWindow.Column.Count"))
	END IF	
	
	IF UpperBound(astr_parametros.DataWindowChild) = 1 THEN
		li_columnas = Integer(astr_parametros.DataWindowChild[1].Describe("DataWindow.Column.Count"))
	END IF	
	
	// Recupera el conjunto de datos completo de la datawindow	
	IF UpperBound(astr_parametros.DataWindow) = 1 THEN
		ls_datos = astr_parametros.DataWindow[1].Describe("DataWindow.Data")	
	END IF	
	
	IF UpperBound(astr_parametros.DataStore) = 1 THEN
		ls_datos = astr_parametros.DataStore[1].Describe("DataWindow.Data")	
	END IF	
	
	IF UpperBound(astr_parametros.DataWindowChild) = 1 THEN
		ls_datos = astr_parametros.DataWindowChild[1].Describe("DataWindow.Data")
	END IF	
	
	// Valida que existan datos en la datawindow	
	IF Len(Trim(ls_datos)) > 0 THEN
		ll_posicion_inicial = 1
		// Recorre la datawindow del conjunto de datos a exportar
		// registro a registro para el conjunto de datos a exportar									
		DO WHILE li_fila < li_filas
			li_fila++			
			// Recorre el registro de la datawindow del conjunto de datos a exportar
			// columna a columna para armar la cadena en el orden especificado en
			// la configuración
			li_columna = 0
			DO WHILE li_columna < li_columnas
				li_columna++
				// Extre el nombre de la columna
				IF UpperBound(astr_parametros.DataWindow) = 1 THEN
					ls_columna = Upper(astr_parametros.DataWindow[1].Describe("#" + String(li_columna) + ".Name"))
				END IF	
				
				IF UpperBound(astr_parametros.DataStore) = 1 THEN
					ls_columna = Upper(astr_parametros.DataStore[1].Describe("#" + String(li_columna) + ".Name"))
				END IF	
				
				IF UpperBound(astr_parametros.DataWindowChild) = 1 THEN
					ls_columna = Upper(astr_parametros.DataWindowChild[1].Describe("#" + String(li_columna) + ".Name"))
				END IF			
						
				li_visible = 1
				// Verifica si solo se procesan las columnas visibles de la datawindow
				IF cbx_solo_visibles.Checked THEN
					IF UpperBound(astr_parametros.DataWindow) = 1 THEN
						li_visible = Integer(astr_parametros.DataWindow[1].Describe(ls_columna + ".Visible"))
					END IF	
					
					IF UpperBound(astr_parametros.DataStore) = 1 THEN
						li_visible = Integer(astr_parametros.DataStore[1].Describe(ls_columna + ".Visible"))
					END IF	
					
					IF UpperBound(astr_parametros.DataWindowChild) = 1 THEN
						li_visible = Integer(astr_parametros.DataWindowChild[1].Describe(ls_columna + ".Visible"))
					END IF								
				END IF
				// Define los separadores de los datos de acuerdo a la columna y fila
				// que se esta procesando
				ls_separador = '~t'
				IF li_columna = li_columnas THEN						
					ls_separador = '~r~n'						
					IF li_fila = li_filas THEN
						ls_separador = ''
					END IF
				END IF
				// Busca el separador en la cadena para encontrar la posicion final
				// del dato que se va a extraer
				ll_posicion_final = Pos(ls_datos,ls_separador,ll_posicion_inicial)
				// Si no se tiene un separador asignado es porque es la última columna
				// de la última fila, se asigna a la posición final el tamaño de la cadena + 1
				IF ls_separador = '' THEN
					ll_posicion_final = Len(ls_datos) + 1
				END IF					
				
				// Si la columnas evaluada es visible 
				IF li_visible = 1 THEN
					// Extrae el nombre de las columna para el encabezado					
					IF li_fila = 1 THEN
						IF li_datos > 0 THEN	
							// Si ya se han procesado datos asigna el separador a la cadena que
							// contiene los nombres de las columnas
							ls_columnas = ls_columnas + ls_separador_anterior				
						END IF
						// Si ya se han procesado datos asigna el nombre de la columna a la 
						// cadena que contiene los nombres de las columnas
						ls_columnas = ls_columnas + ls_columna
					END IF
					
					// Si el nombre de la columna leido es de mayor tamaño que el mayor tamaño
					// almacenado en la variable actualiza el valor
					IF Len(ls_columna) > ii_maximo_tamano_dato THEN
						ii_maximo_tamano_dato = Len(ls_columna)
					END IF
					
					// Extrae el dato de la cadena de acuerdo con la posición del separador
					ls_dato = Mid(ls_datos,ll_posicion_inicial,ll_posicion_final - ll_posicion_inicial)
					
					// Si el dato leido es de mayor tamaño que el mayor tamaño
					// almacenado en la variable actualiza el valor
					IF Len(ls_dato) > ii_maximo_tamano_dato THEN
						ii_maximo_tamano_dato = Len(ls_dato)
					END IF
					
					IF li_datos > 0 THEN	
						// Si ya se han procesado datos asigna el separador a la cadena que
						// contiene los datos
						ls_registro = ls_registro + ls_separador_anterior
					END IF
					// Si ya se han procesado datos asigna el nombre de la columna a la 
					// cadena que contiene los nombres de las columnas					
					ls_registro = ls_registro + ls_dato
					// Incrementa el contador de columnas a exportar	
					li_datos++
				END IF			
				// Asigna el separador actual al separador anterior
				ls_separador_anterior = ls_separador
				// Asigna a la posicion inicial la posicion final + 1
				ll_posicion_inicial = ll_posicion_final + 1				
			LOOP
			// Si la cantidad de datos leidos es mayor que la mayor cantidad
			// almacenada en la variable actualiza el valor			
			IF li_datos > ii_total_datos THEN
				ii_total_datos = li_datos
			END IF
			
			li_datos = 0
			// Asigna el separador de fin de línea
			ls_registro = ls_registro + ls_separador_anterior				
			// Incrementa la posicion inicial en 1 ya que el separador de fin de línea
			// tiene 2 caracteres (uno mas que el separador de datos)
			ll_posicion_inicial++ 
		LOOP
		
		ls_registro = Trim(ls_registro)
		ls_columnas = Trim(ls_columnas)
		IF Len(ls_registro) > 0 THEN
			IF Len(ls_columnas) > 0 THEN
				ls_registro = ls_columnas + '~r~n' + ls_registro
			END IF
			ls_registro = ls_registro + '~r~n'
		ELSE
			
		END IF
	END IF
END IF

Return ls_registro

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

end event

on w_setup_impresion.create
this.ddlb_exportar=create ddlb_exportar
this.cbx_email=create cbx_email
this.st_solo_visibles=create st_solo_visibles
this.cbx_solo_visibles=create cbx_solo_visibles
this.rb_actual=create rb_actual
this.cbx_exportar=create cbx_exportar
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
this.gb_exportar=create gb_exportar
this.ddlb_rango=create ddlb_rango
this.st_imprimir=create st_imprimir
this.Control[]={this.ddlb_exportar,&
this.cbx_email,&
this.st_solo_visibles,&
this.cbx_solo_visibles,&
this.rb_actual,&
this.cbx_exportar,&
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
this.gb_exportar,&
this.ddlb_rango,&
this.st_imprimir}
end on

on w_setup_impresion.destroy
destroy(this.ddlb_exportar)
destroy(this.cbx_email)
destroy(this.st_solo_visibles)
destroy(this.cbx_solo_visibles)
destroy(this.rb_actual)
destroy(this.cbx_exportar)
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
destroy(this.gb_exportar)
destroy(this.ddlb_rango)
destroy(this.st_imprimir)
end on

type ddlb_exportar from dropdownpicturelistbox within w_setup_impresion
string tag = "ddplb_1"
integer x = 1463
integer y = 864
integer width = 594
integer height = 264
integer taborder = 120
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
string picturename[] = {"Custom070!","Custom043!","Custom098!","Picture1!","Custom042!","Application!","Save!"}
long picturemaskcolor = 536870912
end type

type cbx_email from checkbox within w_setup_impresion
integer x = 1472
integer y = 664
integer width = 549
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Enviar por E-mail"
end type

event clicked;ddlb_exportar.Reset()

IF cbx_email.Checked = True THEN
	st_impresora.Text = 'Enviar por correo electrónico'
	ddlb_exportar.InsertItem('Archivo Texto',1,1)
	ddlb_exportar.InsertItem('Archivo Excel',2,2)
	ddlb_exportar.InsertItem('Archivo CSV',3,3)
	ddlb_exportar.InsertItem('Archivo WMF',4,4)
	ddlb_exportar.InsertItem('Archivo HTML',5,5)
	ddlb_exportar.InsertItem('Archivo PDF',6,6)		
	ddlb_exportar.SelectItem(5)
	ddlb_exportar.Height = 450
ELSE
	st_impresora.Text = is_item_exportar
	ddlb_exportar.InsertItem(is_item_exportar,7,1)
	ddlb_exportar.SelectItem(1)
END IF	

end event

type st_solo_visibles from statictext within w_setup_impresion
integer x = 1577
integer y = 804
integer width = 215
integer height = 56
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "visibles"
boolean focusrectangle = false
boolean disabledlook = true
end type

type cbx_solo_visibles from checkbox within w_setup_impresion
integer x = 1472
integer y = 736
integer width = 549
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Solo las columnas"
end type

type rb_actual from radiobutton within w_setup_impresion
integer x = 96
integer y = 540
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

type cbx_exportar from checkbox within w_setup_impresion
integer x = 1495
integer y = 592
integer width = 494
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generar archivo"
end type

event clicked;//Solo habilita la opción de los archivos cuando la opción exportar archivo está en check ON
BOOLEAN	lb_estado, lb_estado2
STRING	ls_item_seleccionado

cbx_email.Checked = False
ddlb_exportar.Reset()

IF cbx_exportar.Checked THEN
	st_1.Text = 'Archivo:'
	ddlb_exportar.InsertItem(is_item_exportar,7,1)
	ddlb_exportar.SelectItem(1)	
	ddlb_exportar.DirSelect(ls_item_seleccionado)
	st_impresora.Text = ls_item_seleccionado
	lb_estado = True	
	lb_estado2 = False
ELSE
	st_1.Text = 'Impresora:'
	st_impresora.Text = gs_impresora
	lb_estado = False	
	lb_estado2 = True
END IF	
ddlb_exportar.Enabled = lb_estado
st_copias.DisabledLook = lb_estado
st_imprimir.DisabledLook = lb_estado
st_instruccion.Enabled = lb_estado2
st_solo_visibles.DisabledLook = lb_estado2
cbx_solo_visibles.Enabled = lb_estado
cbx_email.Enabled = lb_estado
cbx_ordenar_copias.Enabled = lb_estado2
cb_configurar.Enabled = lb_estado2
ddlb_rango.Enabled = lb_estado2
gb_exportar.Enabled = lb_estado
gb_impresion.Enabled = lb_estado2
gb_rango_paginas.Enabled = lb_estado2
rb_actual.Enabled = lb_estado2
rb_rango_paginas.Enabled = lb_estado2
rb_todas.Enabled = lb_estado2
sle_rango_paginas.Enabled = lb_estado2
em_copias.Enabled = lb_estado2
end event

type cbx_ordenar_copias from checkbox within w_setup_impresion
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

type cb_ayuda from commandbutton within w_setup_impresion
event clicked pbm_bnclicked
boolean visible = false
integer x = 1522
integer y = 472
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

type st_impresora from statictext within w_setup_impresion
integer x = 375
integer y = 36
integer width = 1696
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

type cb_configurar from commandbutton within w_setup_impresion
integer x = 1522
integer y = 360
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

type cb_cancelar from commandbutton within w_setup_impresion
integer x = 1522
integer y = 248
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

type sle_rango_paginas from singlelineedit within w_setup_impresion
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

type rb_rango_paginas from radiobutton within w_setup_impresion
integer x = 96
integer y = 612
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

type rb_todas from radiobutton within w_setup_impresion
integer x = 96
integer y = 460
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

type em_copias from editmask within w_setup_impresion
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

type st_copias from statictext within w_setup_impresion
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

type st_1 from statictext within w_setup_impresion
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

type cb_ok from commandbutton within w_setup_impresion
integer x = 1522
integer y = 136
integer width = 485
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
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
						ls_columna, ls_datos, ls_dato, ls_item_seleccionado
STRING				ls_registro[], ls_messagebox

SetPointer(Hourglass!)

SetNull(ls_messagebox)
lb_cerrar = True
li_impresion = 1

// Evalua si se selecciono la opción de exportar, enviar por
// correo electronico o imprimir
IF Not cbx_exportar.Checked THEN
	// Si se selecciono la opción de imprimir
	cb_ok.Enabled 			= False
	cb_cancelar.Enabled 	= False
	cb_configurar.Enabled= False
	cb_ayuda.Enabled 		= False

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
ELSE		
	// Valida que se halla seleccionado alguno de los tipos de exportación
	ddlb_exportar.DirSelect(ls_item_seleccionado)
	
	IF ls_item_seleccionado = '' THEN
		li_impresion = 0
		lb_cerrar = False		
		ls_messagebox = 'No se seleccionó el tipo de archivo a exportar.~r~n~r~nProceso Cancelado'
	ELSE
		// Extrae la sintaxis de la datawindow principal
		ls_sintaxis = idw_reporte.Describe("DataWindow.Syntax")

		// Valida que la cadena que contiene la sintaxis de la
		// datawindow principal no este vacia
		IF Len(Trim(ls_sintaxis)) = 0 THEN
			// Si la cadena que contiene la sintaxis de la datawindow esta vacia		
			li_impresion = 0
			ls_messagebox = 'La sintaxis del objeto donde se almacenan los datos para exportar esta vacia.~r~n~r~nProceso Cancelado'
		ELSE
			IF Pos(ls_sintaxis,'header(',1) = 0 OR Pos(ls_sintaxis,'detail(',1) = 0 OR &
				Pos(ls_sintaxis,'summary(',1) = 0 OR Pos(ls_sintaxis,'footer(',1) = 0 THEN
				li_impresion = 0
				ls_messagebox = 'El informe tiene características que no permiten su exportación.~r~n~r~nProceso Cancelado'
			END IF	
		END IF
		/*DRT n_rep_rte ln_rep_rte
		ln_rep_rte= CREATE  n_rep_rte*/
		IF li_impresion = 1 THEN
			li_control++

			// Valida si la datawindow principal tiene otros datawindows relacionados (nested)
			IF Upper(idw_reporte.Describe("DataWindow.Nested")) = 'YES' THEN
				//DRT==>2008-may-15 Se procesan los datos contenidos en el datawindow principal
				lstr_datos.DataWindow[1]= idw_reporte
				ls_registro[li_control] = wf_procesar_datos_a_exportar(lstr_datos)

				/*DRT==>2008-may-14 Para que la función GetChild pueda leer nested reports de un composite se modifica la
				propiedad Processing. Algunos reportes pueden aun no reconocer el Getchild con esto y se generará error, sin embargo funciona
				con la mayoría*/
				idw_reporte.Object.DataWindow.Processing=5
				
				lb_con_nested_reports= TRUE
				// Valida el tipo de la datawindow principal (SQL o External)
				IF Pos(ls_sintaxis,'data(') > 0 THEN				
					// Si la datawindow es external (no tiene instrucciones que
					// la relacionen directamente con la DB) cancela el proceso
					li_impresion = 0
					ls_messagebox = 'No es posible exportar los datos almacenados en los objetos relacionados cuando el objeto padre es de tipo External.~r~n~r~nProceso Cancelado'
				ELSE					
					// Si la datawindow datawindow principal tiene relacion con la DB (SQL)
					// busca los datawindows relacionados (nested) a la datawindow principal
					DO WHILE	li_impresion = 1					
						// Busca en la sintaxis de la datawindow principal la propiedad 'report('
						// que define las propiedades del datawindow relacionado (nested)  
						ll_posicion = Pos(ls_sintaxis,'report(',ll_posicion + 1)
			
						IF ll_posicion > 0 THEN
							li_control++
							// Si encontro la propiedad 'report' en la sintaxis de la datawindow
							// principal busca en esta la propiedad 'name' para obtener el
							// nombre del control que contiene la datawindow relacionada (nested)		
							ll_posicion = Pos(ls_sintaxis,'name=',ll_posicion)	
							// Si encontro la propiedad 'report' en la sintaxis de la datawindow
							// principal busca en esta la propiedad 'dataobject=' para obtener el
							// nombre de la datawindow relacionada (nested)		
		
							IF ll_posicion > 0 THEN
								// Si encontro la propiedad 'name' en la sintaxis de la datawindow 
								// principal extrae el nombre del control que contiene la datawindow
								// asociada (nested) y lo asigna a una variable
								ll_posicion = ll_posicion + 5
								ls_control = Mid(ls_sintaxis,ll_posicion,Pos(ls_sintaxis,' ',ll_posicion) - ll_posicion)
			
								// Extrae de la datawindow principal el datawindow relacionado
								// y lo asigna a una variable
								IF idw_reporte.GetChild(ls_control,lstr_datos.DataWindowChild[1]) = 1 THEN
									// Se procesan los datos contenidos en el datawindow relacionado (nested)								
									ls_registro[li_control] = wf_procesar_datos_a_exportar(lstr_datos)
									
									/*DRT==>2008-may-14
									Clipboard ( ls_registro[li_control] )
									ln_rep_rte.of_rte()*/
 
								ELSE
									li_impresion = 0
									ls_messagebox = 'No fue posible extraer la datawindow relacionada a la datawindow principal.~r~n~r~nProceso Cancelado'
								END IF	
							ELSE
								li_impresion = 0
								ls_messagebox = 'El control ' + String(li_control - 1) + ' que contiene la datawindow asociada al reporte no tiene un nombre asignado, por favor asigne un nombre e intente de nuevo~r~n~r~nProceso Cancelado'
							END IF		
						ELSE
							li_impresion = 2
							IF li_control - 1 = 0 THEN
								li_impresion = 0
								ls_messagebox = 'No fue posible encontrar las características de la datawindow relacionada a la datawindow principal.~r~n~r~nProceso Cancelado'
							END IF	
						END IF	
					LOOP
					//ln_rep_rte.of_cerrar_w_rte()
					/*DRTDestroy ln_rep_rte;*/
				END IF	
			ELSE
				// Si el datawindow no tiene datawindows relacionados (nested)	
				// y la sintaxis no esta vacia procesa los datos
				lstr_datos.Datawindow[1] = idw_reporte				
				ls_registro[2] = wf_procesar_datos_a_exportar(lstr_datos)
				
				/*DRT==>2008-may-14
				Clipboard ( ls_registro[2] )
				ln_rep_rte.of_rte()*/
			END IF		
		END IF
		
		IF li_impresion <> 0 THEN
			li_impresion = 1
			lstr_datos = lstr_vacia

			IF Long(idw_reporte.Object.DataWindow.Header.Height) > 0 AND &
				Long(idw_reporte.Object.DataWindow.Summary.Height) > 0 THEN
							
				lstr_datos.Datawindow[1] = idw_reporte
				lstr_datos = wf_procesar_encabezado_pie(lstr_datos)
				
				IF Not lstr_datos.b_nulo THEN
					ls_registro[1] = lstr_datos.String[1]
					ls_registro[UpperBound(ls_registro) + 1] = lstr_datos.String[2]								
				ELSE /*DRT==>2008-MAY-14 Debido a que la mayoría de los reportes ingresan por el sino (esto es porque 
					la función de arriba wf_procesar_encabezado_pie genera errores), se decide comentar
					y continuar con el resto de la funcionalidad del script. Aún sin esto el proceso se comporta bien*/
					
					/*li_impresion = 0
					ls_messagebox = 'El procesamiento de los encabezados falló.~r~n~r~nProceso Cancelado'
					*/
				END IF
			ELSE
				/*DRT==>2008-MAY-14
				li_impresion = 0
				ls_messagebox = 'El informe tiene características que no permiten su exportación.~r~n~r~nProceso Cancelado'
				*/	
			END IF
			
			IF li_impresion = 1 THEN
				// Genera una DataStore con el número de columnas y la longitud máxima
				// necesaria para hacer el proceso de guardar como
				lstr_datos = lstr_vacia
				lstr_datos.String[1] = String(ii_total_datos)
				lstr_datos.Integer[1] = ii_maximo_tamano_dato
				lstr_datos.String[2] = ' el objeto de exportación de datos'			
				lstr_datos.DataStore[1] = f_crear_datastore(lstr_datos)
	
				IF	IsValid(lstr_datos.DataStore[1]) THEN				
					lstr_datos = wf_borrar_encabezados_adicionales(lstr_datos)
					IF Not lstr_datos.b_nulo THEN					
						DO WHILE li_fila < UpperBound(ls_registro)
							li_fila++
							
							/*DRT==>2008-MAY-14 Debido a que el vector trae vacios en algunas posiciones, con esta validación
							se evita el problema y el DataStore se carga con los datos que si existen*/
							IF IsNull(ls_registro[li_fila]) OR ls_registro[li_fila]=''THEN
								CONTINUE
							END IF
							
							ll_registros_escritos = lstr_datos.DataStore[1].ImportString(ls_registro[li_fila])
							// Si la escritura de los datos a exportar en la datastore falló
							// cancelo el proceso de exportación
							IF ll_registros_escritos <= 0 THEN
								li_fila = UpperBound(ls_registro)
								li_impresion = 0
							END IF	
						LOOP
					END IF	
					
					// Si no hubio errores en la escritura de los datos a exportar en
					// la datastore continuo con el proceso de exportacón
					IF li_impresion = 1 THEN
						// Valida que no se presentaron errores en el proceso anterior
						IF Not lstr_datos.b_nulo THEN 
							// Ejecuta la función wf_guardar_como para exportar los datos
							// y enviarlos por correo electrónico o guardarlos en disco
							lstr_datos.String[1] = ls_item_seleccionado
							wf_guardar_como(lstr_datos)
						END IF	
					END IF
					Destroy lstr_datos.DataStore[1]
				END IF
			END IF
		END IF
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

type gb_rango_paginas from groupbox within w_setup_impresion
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

type st_instruccion from statictext within w_setup_impresion
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

type gb_impresion from groupbox within w_setup_impresion
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

type gb_exportar from groupbox within w_setup_impresion
integer x = 1445
integer y = 596
integer width = 640
integer height = 396
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "                                    "
end type

type ddlb_rango from dropdownlistbox within w_setup_impresion
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

type st_imprimir from statictext within w_setup_impresion
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

