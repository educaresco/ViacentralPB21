$PBExportHeader$n_cst_exportar_dw.sru
forward
global type n_cst_exportar_dw from nonvisualobject
end type
end forward

global type n_cst_exportar_dw from nonvisualobject
end type
global n_cst_exportar_dw n_cst_exportar_dw

type variables
Private:
	String is_Collate
	DataWindow	idw_datawindow
	
	Integer ii_maximo_tamano_dato, ii_total_datos
	
	
Boolean 	ib_GUARDAR_DISCO, ib_ENVIAR_CORREO, ib_COL_VISIBLES 
string 	is_TIPO_ARCHIVO 
end variables

forward prototypes
public function string of_procesar_datos (stru_frmwrk_parametros astr_parametros, boolean ib_solo_columnas_visibles)
public subroutine of_inicializar_parametros (stru_frmwrk_parametros astru_parametros)
public subroutine of_exportar_datos (ref datawindow adw_reporte)
public function stru_frmwrk_parametros of_procesar_encabezado_pie (stru_frmwrk_parametros astr_parametros)
public function stru_frmwrk_parametros of_descripcion_sintaxis (stru_frmwrk_parametros astr_parametros)
public function string of_buscar_propiedad_sintaxis (string as_cadena, string as_buscar, string as_buscar_fin)
public function stru_frmwrk_parametros of_borrar_encabezado_adicionales (stru_frmwrk_parametros astr_parametros)
public function stru_frmwrk_parametros of_modificar_sintaxis (stru_frmwrk_parametros astr_parametros)
public function boolean of_guardar_como (stru_frmwrk_parametros astr_parametros)
public function string of_generar_codigo_html (stru_frmwrk_parametros astr_parametros)
public subroutine of_exportar_datos_crosstab (ref datawindow adw_reporte)
public function boolean of_guardar_como_crosstab (stru_frmwrk_parametros astr_parametros)
end prototypes

public function string of_procesar_datos (stru_frmwrk_parametros astr_parametros, boolean ib_solo_columnas_visibles);//************************************************************************
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

INTEGER		li_fila, li_filas, li_columna, li_columnas, li_visible, li_datos
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
				IF ib_solo_columnas_visibles THEN
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

public subroutine of_inicializar_parametros (stru_frmwrk_parametros astru_parametros);
ib_GUARDAR_DISCO		= astru_parametros.boolean[1]
ib_ENVIAR_CORREO		= astru_parametros.boolean[2]
ib_COL_VISIBLES		= astru_parametros.boolean[3]
is_TIPO_ARCHIVO 		= astru_parametros.string[1]
end subroutine

public subroutine of_exportar_datos (ref datawindow adw_reporte);String 	ls_sintaxis , ls_messagebox, ls_registro[], ls_control
Integer  li_impresion , li_control, li_fila 
Boolean 	lb_con_nested_reports
Long 		ll_posicion , ll_registros_escritos 

stru_frmwrk_parametros lstr_datos, lstr_vacia

li_impresion=1
idw_datawindow= adw_reporte

// Extrae la sintaxis de la datawindow principal
ls_sintaxis = adw_reporte.Describe("DataWindow.Syntax")

// Valida que la cadena que contiene la sintaxis de la datawindow principal no este vacia
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
	IF Upper(adw_reporte.Describe("DataWindow.Nested")) = 'YES' THEN
		//DRT==>2008-may-15 Se procesan los datos contenidos en el datawindow principal
		lstr_datos.DataWindow[1]= adw_reporte
		ls_registro[li_control] = This.of_procesar_datos(lstr_datos, ib_col_visibles)

		/*DRT==>2008-may-14 Para que la función GetChild pueda leer nested reports de un composite se modifica la
		propiedad Processing. Algunos reportes pueden aun no reconocer el Getchild con esto y se generará error, sin embargo funciona
		con la mayoría*/
		adw_reporte.Object.DataWindow.Processing=5
		
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
						IF adw_reporte.GetChild(ls_control,lstr_datos.DataWindowChild[1]) = 1 THEN
							// Se procesan los datos contenidos en el datawindow relacionado (nested)								
							ls_registro[li_control] = this.of_procesar_datos(lstr_datos, ib_col_visibles)
							
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
		lstr_datos.Datawindow[1] = adw_reporte				
		ls_registro[2] = this.of_procesar_datos(lstr_datos, ib_col_visibles)
		
		/*DRT==>2008-may-14
		Clipboard ( ls_registro[2] )
		ln_rep_rte.of_rte()*/
	END IF		
END IF

IF li_impresion <> 0 THEN
	li_impresion = 1
	lstr_datos = lstr_vacia

	IF Long(adw_reporte.Object.DataWindow.Header.Height) > 0 AND &
		Long(adw_reporte.Object.DataWindow.Summary.Height) > 0 THEN
					
		lstr_datos.Datawindow[1] = adw_reporte
		lstr_datos = of_procesar_encabezado_pie(lstr_datos)
		
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
			lstr_datos = of_borrar_encabezado_adicionales(lstr_datos)
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
					lstr_datos.String[1] = is_tipo_archivo
					of_guardar_como(lstr_datos)
				END IF	
			END IF
			Destroy lstr_datos.DataStore[1]
		END IF
	END IF
END IF
end subroutine

public function stru_frmwrk_parametros of_procesar_encabezado_pie (stru_frmwrk_parametros astr_parametros);//************************************************************************
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
lstr_sintaxis = of_descripcion_sintaxis(astr_parametros)

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
											ls_etiqueta = of_buscar_propiedad_sintaxis(ls_cadena,'(text="','"')
											IF Len(Trim(ls_etiqueta)) = 0 THEN
												ls_etiqueta = of_buscar_propiedad_sintaxis(ls_cadena,' text="','"')									
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

public function stru_frmwrk_parametros of_descripcion_sintaxis (stru_frmwrk_parametros astr_parametros);//************************************************************************
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

public function string of_buscar_propiedad_sintaxis (string as_cadena, string as_buscar, string as_buscar_fin);//************************************************************************
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

public function stru_frmwrk_parametros of_borrar_encabezado_adicionales (stru_frmwrk_parametros astr_parametros);//************************************************************************
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
	astr_parametros = of_modificar_sintaxis(astr_parametros)			
	IF astr_parametros.b_nulo THEN
		li_columna = ii_total_datos
	END IF	
LOOP
				
Return astr_parametros

end function

public function stru_frmwrk_parametros of_modificar_sintaxis (stru_frmwrk_parametros astr_parametros);//************************************************************************
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

public function boolean of_guardar_como (stru_frmwrk_parametros astr_parametros);/*************************************************************************************************
	AvanSoft S.A. 2005/03/22 

	Esta función, se usa para grabar los datos a exportar en una ruta y tipo
 de archivo seleccionado por el usuario.

	Recibe como parámetro la estructura astr_parametros de tipo 
 stru_b_parametros la cual contiene los siguientes datos:

 astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
 astr_parametros.DataWindowChild[1]
 Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
 de objeto donde se encuentran almacenados los datos.
 Contiene la datawindow, datastore o datawindowchild donde
 donde se encuentran almacenados los datos que se deben
 gurdar como.

	Retorna: si durante el proceso de extracción de los datos de la datawindow hubo errores (False) 
 o se extrajeron los datos sin problemas (True)

Modificado: DRT==>2008-ago-27
**************************************************************************************************/

SAVEASTYPE					ls_tipo_archivo_exportar
stru_frmwrk_parametros	lstr_parametros, lstr_vacia
INTEGER						li_grabar, li_sobreescribir, li_guardar_como
STRING						ls_codigo_html, ls_archivo, ls_ruta, ls_filtro

//Si el archivo a exportar se envia por correo entonces se guarda con el formato instanciado en is_TIPO_ARCHIVO
IF ib_ENVIAR_CORREO = True THEN
	ls_archivo= 'adjunto.'+ is_TIPO_ARCHIVO
	ls_filtro= ' (*.'+is_TIPO_ARCHIVO +'),*.'+is_TIPO_ARCHIVO 
	li_grabar = GetFileSaveName("Exportar",ls_ruta,ls_archivo,is_TIPO_ARCHIVO,ls_filtro)
ELSE
	ls_filtro = 'Texto (*.txt),*.txt,Excel-Calc (*.xls),*.xls,CSV (*.csv),*.csv,WMF (*.wmf),*.wmf,HTML (*.html),*.html,PDF (*.pdf),*.pdf'	
	li_grabar = GetFileSaveName("Exportar",ls_ruta,ls_archivo,'',ls_filtro)
	is_TIPO_ARCHIVO= Right(ls_archivo,3)
END IF



//Valida que el archivo exista y si se va a sobreesceribir
CHOOSE CASE li_grabar
	CASE -1
		MessageBox("Error",'Ocurrió un error al seleccionar el nombre y la ruta para guardar el archivo.~r~n~r~nProceso Cancelado',StopSign!)
		Return false
	CASE 0
		Return False
	CASE 1
		IF FileExists(ls_ruta) THEN
			li_sobreescribir= MessageBox('Decisión','El archivo ' + ls_ruta + ' ya existe, ¿Desea sobreescribirlo?',Question!,YesNoCancel!,2)
		END IF 
END CHOOSE

CHOOSE CASE is_TIPO_ARCHIVO
	CASE 'txt'
		ls_tipo_archivo_exportar= Text!
	CASE 'xls' 
		ls_tipo_archivo_exportar  = Excel!
	CASE 'csv'
		ls_tipo_archivo_exportar  = CSV!
	CASE 'wmf'
		ls_tipo_archivo_exportar  = WMF!
	CASE 'html'
		//ls_tipo_archivo_exportar  = HTMLTable!			
		ls_tipo_archivo_exportar  = Text!

		ls_codigo_html = of_generar_codigo_html(astr_parametros)		
		IF Not IsNull(ls_codigo_html) THEN
			astr_parametros 					= lstr_vacia
			astr_parametros.String[1] 		= '1'
			astr_parametros.Integer[1] 	= Len(ls_codigo_html)
			astr_parametros.String[2] 		= ' el objeto de exportación de datos'			
			astr_parametros.DataStore[1] 	= f_crear_datastore(astr_parametros)

			IF IsValid(astr_parametros.DataStore[1]) THEN
				astr_parametros.DataStore[1].InsertRow(0)
				astr_parametros.DataStore[1].SetItem(1,1,ls_codigo_html)				
			ELSE
				Return False
			END IF	
		END IF
	CASE 'pdf'
		ls_tipo_archivo_exportar = PDF!
END CHOOSE	


// Graba el archivo del tipo seleccionado en el disco		
IF UpperBound(astr_parametros.DataWindow) = 1 THEN
	li_guardar_como = astr_parametros.DataWindow[1].SaveAs(ls_ruta,ls_tipo_archivo_exportar,False)
END IF	

/*IF UpperBound(astr_parametros.DataStore) = 1 THEN
	li_guardar_como = astr_parametros.DataStore[1].SaveAs(ls_ruta,ls_tipo_archivo_exportar exportar,False)
END IF*/
IF UpperBound(astr_parametros.DataStore) = 1 THEN
	IF Upper(idw_datawindow.Describe("DataWindow.Nested")) = 'YES' THEN
		IF is_TIPO_ARCHIVO= 'pdf' THEN
			astr_parametros.DataStore[1].Object.DataWindow.Export.PDF.Method       = 1
			astr_parametros.DataStore[1].Object.DataWindow.Export.PDF.XSLFOP.Print = 0
		END IF
		li_guardar_como = astr_parametros.DataStore[1].SaveAs(ls_ruta,ls_tipo_archivo_exportar,False)	
	ELSE
		idw_datawindow.Object.DataWindow.Export.PDF.Method       = 1
		idw_datawindow.Object.DataWindow.Export.PDF.XSLFOP.Print = 0
		li_guardar_como = idw_datawindow.SaveAs(ls_ruta,ls_tipo_archivo_exportar,False)
	END IF
END IF
	
IF li_guardar_como = -1 THEN
	MessageBox("Error",'Ocurrió un error al grabar el archivo en la ruta seleccionada.~r~n~r~nProceso Cancelado',StopSign!)
	Return False
ELSE
	IF ib_ENVIAR_CORREO = True THEN
		lstr_parametros.String[1] = ls_ruta
		lstr_parametros.String[2] = ls_archivo
		lstr_parametros.String[3] = '@'//correo
		lstr_parametros.String[4] = 'Ver archivo adjunto'//Asunto 			'Reporte ' + Lower(is_titulo)
		lstr_parametros.String[5] = 'Ver archivo adjunto'//Cuerpo del correo///'Adjunto encontrará el reporte ' + Lower(is_titulo) + ' generado'
		lstr_parametros.b_nulo= False
		//OpenWithParm(w_enviar_correo,lstr_parametros)											
		OpenWithParm(w_correo,lstr_parametros)

	ELSE			
		MessageBox("Información",'El archivo ' + ls_archivo + ' fue grabado con exito en la ruta ' + ls_ruta + '.~r~n~r~nProceso Finalizado')
	END IF	
	
	Return True
END IF
end function

public function string of_generar_codigo_html (stru_frmwrk_parametros astr_parametros);stru_frmwrk_parametros	lstr_sintaxis
LONG					ll_crosstab
STRING				ls_sintaxis, ls_estilo, ls_data, ls_codigo_html

/*Extrae de la estructura enviada como parámetro la sintaxis del objeto (DataWindow, DataStore o DataWindowChild) que
contiene los datos a exportar*/
astr_parametros.String[1] = "DataWindow.Syntax" 
lstr_sintaxis = of_descripcion_sintaxis(astr_parametros)

// Valida si fue posible extraer la sintaxis del objeto (DataWindow, DataStore o DataWindowChild)
IF Not lstr_sintaxis.b_nulo THEN
	// Verifica si el tipo de objeto es crosstab
	ll_crosstab = Pos(lstr_sintaxis.String[1],"crosstab(",1)
		
	// Valida que la sintaxis del objeto (DataWindow, DataStore o DataWindowChild)
	// no este vacia y que no sea tipo crosstab para aplicar al objeto las modificacioes en la sintaxis
	IF Trim(ls_sintaxis) <> "" AND ll_crosstab = 0 THEN
		ls_sintaxis = "DataWindow.HTMLTable.GenerateCSS=~"no~" " + &
						"DataWindow.HTMLTable.NoWrap=~"no~" " + &
						"DataWindow.HTMLTable.Border=" + String(1) + " " + &
						"DataWindow.HTMLTable.Width=" + String(0) + " " + &
						"DataWindow.HTMLTable.CellPadding=" + String(0) + " " + &
						"DataWindow.HTMLTable.CellSpacing=" + String(0) + "" 
		
		astr_parametros.String[1] = ls_sintaxis	
		astr_parametros = of_modificar_sintaxis(astr_parametros)
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

public subroutine of_exportar_datos_crosstab (ref datawindow adw_reporte);String 	ls_sintaxis , ls_messagebox, ls_registro[], ls_control
Integer  li_impresion , li_control, li_fila 
Boolean 	lb_con_nested_reports
Long 		ll_posicion , ll_registros_escritos 

stru_frmwrk_parametros lstr_datos, lstr_vacia

li_impresion=1
idw_datawindow= adw_reporte
lstr_datos.DataWindow[1]= adw_reporte

of_guardar_como_crosstab(lstr_datos)

end subroutine

public function boolean of_guardar_como_crosstab (stru_frmwrk_parametros astr_parametros);/*************************************************************************************************
	AvanSoft S.A. 2005/03/22 

	Esta función, se usa para grabar los datos a exportar en una ruta y tipo
 de archivo seleccionado por el usuario.

	Recibe como parámetro la estructura astr_parametros de tipo 
 stru_b_parametros la cual contiene los siguientes datos:

 astr_parametros.DataWindow[1], astr_parametros.DataStore[1] o
 astr_parametros.DataWindowChild[1]
 Tipo: DataWindow, DataStore o DataWindowChild segun el tipo
 de objeto donde se encuentran almacenados los datos.
 Contiene la datawindow, datastore o datawindowchild donde
 donde se encuentran almacenados los datos que se deben
 gurdar como.

	Retorna: si durante el proceso de extracción de los datos de la datawindow hubo errores (False) 
 o se extrajeron los datos sin problemas (True)

Modificado: DRT==>2008-ago-27
**************************************************************************************************/

SAVEASTYPE					ls_tipo_archivo_exportar
stru_frmwrk_parametros	lstr_parametros, lstr_vacia
INTEGER						li_grabar, li_sobreescribir, li_guardar_como
STRING						ls_codigo_html, ls_archivo, ls_ruta, ls_filtro

//Si el archivo a exportar se envia por correo entonces se guarda con el formato instanciado en is_TIPO_ARCHIVO
IF ib_ENVIAR_CORREO = True THEN
	ls_archivo= 'adjunto.'+ is_TIPO_ARCHIVO
	ls_filtro= ' (*.'+is_TIPO_ARCHIVO +'),*.'+is_TIPO_ARCHIVO 
	li_grabar = GetFileSaveName("Exportar",ls_ruta,ls_archivo,is_TIPO_ARCHIVO,ls_filtro)
ELSE
	ls_filtro = 'Texto (*.txt),*.txt,Excel-Calc (*.xls),*.xls,CSV (*.csv),*.csv,WMF (*.wmf),*.wmf,HTML (*.html),*.html,PDF (*.pdf),*.pdf'	
	li_grabar = GetFileSaveName("Exportar",ls_ruta,ls_archivo,'',ls_filtro)
	is_TIPO_ARCHIVO= Right(ls_archivo,3)
END IF



//Valida que el archivo exista y si se va a sobreesceribir
CHOOSE CASE li_grabar
	CASE -1
		MessageBox("Error",'Ocurrió un error al seleccionar el nombre y la ruta para guardar el archivo.~r~n~r~nProceso Cancelado',StopSign!)
		Return false
	CASE 0
		Return False
	CASE 1
		IF FileExists(ls_ruta) THEN
			li_sobreescribir= MessageBox('Decisión','El archivo ' + ls_ruta + ' ya existe, ¿Desea sobreescribirlo?',Question!,YesNoCancel!,2)
		END IF 
END CHOOSE

CHOOSE CASE is_TIPO_ARCHIVO
	CASE 'txt'
		ls_tipo_archivo_exportar= Text!
	CASE 'xls' 
		ls_tipo_archivo_exportar  = HTMLTable!
	CASE 'csv'
		ls_tipo_archivo_exportar  = CSV!
	CASE 'wmf'
		ls_tipo_archivo_exportar  = WMF!
	CASE 'html'
		ls_tipo_archivo_exportar  = Text!

		ls_codigo_html = of_generar_codigo_html(astr_parametros)		
		IF Not IsNull(ls_codigo_html) THEN
			astr_parametros 					= lstr_vacia
			astr_parametros.String[1] 		= '1'
			astr_parametros.Integer[1] 	= Len(ls_codigo_html)
			astr_parametros.String[2] 		= ' el objeto de exportación de datos'			
			astr_parametros.DataStore[1] 	= f_crear_datastore(astr_parametros)

			IF IsValid(astr_parametros.DataStore[1]) THEN
				astr_parametros.DataStore[1].InsertRow(0)
				astr_parametros.DataStore[1].SetItem(1,1,ls_codigo_html)				
			ELSE
				Return False
			END IF	
		END IF
	CASE 'pdf'
		ls_tipo_archivo_exportar = PDF!
END CHOOSE	

IF is_TIPO_ARCHIVO ='pdf' THEN
		idw_datawindow.Object.DataWindow.Export.PDF.Method       = 1
		idw_datawindow.Object.DataWindow.Export.PDF.XSLFOP.Print = 0
		li_guardar_como = idw_datawindow.SaveAs(ls_ruta,ls_tipo_archivo_exportar,False)
ELSE
	// Graba el archivo del tipo seleccionado en el disco		
	IF UpperBound(astr_parametros.DataWindow) = 1 THEN
		li_guardar_como = astr_parametros.DataWindow[1].SaveAs(ls_ruta,ls_tipo_archivo_exportar,False)
	END IF	
END IF

	
IF li_guardar_como = -1 THEN
	MessageBox("Error",'Ocurrió un error al grabar el archivo en la ruta seleccionada.~r~n~r~nProceso Cancelado',StopSign!)
	Return False
ELSE
	IF ib_ENVIAR_CORREO = True THEN
		lstr_parametros.String[1] = ls_ruta
		lstr_parametros.String[2] = ls_archivo
		lstr_parametros.String[3] = '@'//correo
		lstr_parametros.String[4] = 'Ver archivo adjunto'//Asunto 			'Reporte ' + Lower(is_titulo)
		lstr_parametros.String[5] = 'Ver archivo adjunto'//Cuerpo del correo///'Adjunto encontrará el reporte ' + Lower(is_titulo) + ' generado'
		lstr_parametros.b_nulo= False
		//OpenWithParm(w_enviar_correo,lstr_parametros)											
		OpenWithParm(w_correo,lstr_parametros)

	ELSE			
		MessageBox("Información",'El archivo ' + ls_archivo + ' fue grabado con exito en la ruta ' + ls_ruta + '.~r~n~r~nProceso Finalizado')
	END IF	
	
	Return True
END IF
end function

on n_cst_exportar_dw.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_exportar_dw.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

