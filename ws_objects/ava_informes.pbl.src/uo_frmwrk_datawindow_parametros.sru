$PBExportHeader$uo_frmwrk_datawindow_parametros.sru
forward
global type uo_frmwrk_datawindow_parametros from uo_frmwrk_datawindow
end type
end forward

global type uo_frmwrk_datawindow_parametros from uo_frmwrk_datawindow
integer width = 4123
integer height = 260
string dataobject = "d_frmwrk_parametros"
borderstyle borderstyle = stylelowered!
event ue_post_clicked ( )
event ue_asignar_dato_anterior ( )
end type
global uo_frmwrk_datawindow_parametros uo_frmwrk_datawindow_parametros

type variables
UO_FRMWRK_DATASTORE		iuo_ds_lista
DATE				ida_valor_anterior
DATETIME			idt_valor_anterior
DECIMAL				idc_valor_anterior
INTEGER			ii_fila_enter, ii_fila_anterior, ii_fila_dato_anterior
LONG				inm_valor_anterior
STRING				is_tipo_fila_anterior, ist_valor_anterior, &
					ils_valor_anterior, ils_display_anterior, is_filtro, is_formato_fecha
TIME				itm_valor_anterior
UO_FRMWRK_CALENDARIO	 iuo_calendario


end variables

forward prototypes
public subroutine uf_asignar_lista (integer al_parametro_seleccionado)
public function stru_frmwrk_parametros_reportes uf_extraer_parametros_sql (string as_sql)
public function boolean uf_parametros (stru_frmwrk_parametros_reportes astr_parametros)
public function boolean uf_eliminar_parametros (stru_frmwrk_parametros_reportes astr_parametros)
public function integer uf_ordenar_parametros ()
public function integer uf_filtrar_parametros ()
public subroutine uf_redimensionar_parametros ()
public function boolean uf_reconfigurar_parametros (stru_frmwrk_parametros_reportes astr_parametros)
public subroutine uf_asignar_foco (integer ai_fila_actual)
public function string uf_obtener_valor_parametro (stru_frmwrk_parametros astr_parametro)
public function string uf_reemplazar_parametros_sql (string as_sql)
public function integer uf_asignar_valor_parametro (stru_frmwrk_parametros astr_parametros)
public function string uf_construir_lista (stru_frmwrk_parametros astr_parametros)
public function integer uf_asignar_descripcion_parametro (stru_frmwrk_parametros astr_parametros)
public function string uf_obtener_tipo_parametro (stru_frmwrk_parametros astr_parametro)
public subroutine uf_reconstruir_lista (stru_frmwrk_parametros astr_parametros)
public function string uf_obtener_descripcion_parametro (stru_frmwrk_parametros astr_parametro)
public function boolean uf_validar_parametros (stru_frmwrk_parametros astr_parametros)
public function integer uf_asignar_descripcion_parametro_bck0703 (stru_frmwrk_parametros astr_parametros)
end prototypes

event ue_post_clicked();//************************************************************************
//	David Felipe Arango F. 2005/01/04

//	Este evento NO SE DEBE SOBRESCRBIR, se usa para asignar el foco a la 
// lista cuando el parámetro seleccionado despliega el calendario o para
// ocultar el calendario cuando se encontraba el foco en un parámetro que
// despliega el calendario y se hace click en un parámetro diferente.
// Actualiza las variables de instacia que almacenan la fila actual y el tipo
// y le tipo del parámetro almacenado en esta.


//	Recibe como parámetro el número de la fila actual seleccionada as_fila_actual
// de tipo integer

//	No retorna ningún valor
//************************************************************************

IF ii_fila_enter > 0 THEN
	uf_asignar_foco(ii_fila_enter)
END IF
end event

event ue_asignar_dato_anterior();//************************************************************************
//	David Felipe Arango F. 2005/01/19
//
//	Este evento NO SE DEBE SOBRESCRIBIR en las nuevas herencias que se hagan, 
// se usa para reasignar a la columna los valores anteriores de la columna
// modificada que estan almacenados en variables de instancia.
//
//************************************************************************

CHOOSE CASE Upper(This.GetItemString(ii_fila_dato_anterior,'tipo_parametro'))

	CASE 'DA' // Fecha
		This.SetItem(ii_fila_dato_anterior,'parametro_fecha',ida_valor_anterior)		 		

	CASE 'DC' // Decimal
		This.SetItem(ii_fila_dato_anterior,'parametro_decimal',idc_valor_anterior)
		
	CASE 'DT' // Fecha Hora
		This.SetItem(ii_fila_dato_anterior,'parametro_fecha_hora',idt_valor_anterior)
			
	CASE 'LS' // Lista (puede ser SQL, DW o LV)	
		This.SetItem(ii_fila_dato_anterior,'display_lista',ils_display_anterior)		
		This.SetItem(ii_fila_dato_anterior,'parametro_lista',ils_valor_anterior)		 
			
	CASE 'NM' // Número
		This.SetItem(ii_fila_dato_anterior,'parametro_numero',inm_valor_anterior)
		
	CASE 'ST' // String
		This.SetItem(ii_fila_dato_anterior,'parametro_string',ist_valor_anterior)
		
	CASE 'TM' // Hora
		This.SetItem(ii_fila_dato_anterior,'parametro_hora',itm_valor_anterior)
		
END CHOOSE


end event

public subroutine uf_asignar_lista (integer al_parametro_seleccionado);//************************************************************************
//	David Felipe Arango F. 2004/09/21

//	Esta función, se usa para asignar los datos a las listas de parámetros
// que tenga la ventana de acuerdo a los parametros enviados.

//	Recibe como parámetro el número de la fila seleccionada al_parametro_seleccionado
// de tipo integer

//	No retorna ningún valor
//************************************************************************

STRU_FRMWRK_PARAMETROS	lstr_calendario
INTEGER						li_fila_lista, li_col_x, li_col_y, li_col_alto, &
								li_col_ancho, li_numero_encabezados
STRING						ls_parametro, ls_tipo_parametro, ls_lista, &
								ls_alto_encabezados, ls_error
WINDOW						lw_ventana

// Recupera el tipo de parámetro
ls_tipo_parametro = This.GetItemString(al_parametro_seleccionado,'tipo_parametro')

// Recupera el nombre del parámetro	
ls_parametro = This.GetItemString(al_parametro_seleccionado,'nombre_parametro')

CHOOSE CASE ls_tipo_parametro

	// Si el tipo de parámetro es lista (LS)
	CASE 'LS'

		IF Not IsNull(ls_parametro) AND Len(ls_parametro) > 0 THEN	
			// Busca el parámetro en la datastore de instancia que almacena los parámetros de
			// tipo lista y los datos de cada una de las listas	
			li_fila_lista = iuo_ds_lista.Find("Upper(codigo) = '" + Upper(ls_parametro) + "'",1,iuo_ds_lista.RowCount())
			
			IF li_fila_lista > 0 THEN
				ls_lista = iuo_ds_lista.GetItemString(li_fila_lista,'descripcion')
				
				
				ls_error= This.Modify('parametro_lista.Values="' + ls_lista + '"' ) //Ojo siempre trabajar con '"' no con "'"
				if ls_error<>"" THEN
					MessageBox("Error", ls_error,Stopsign!)
				END IF
			ELSE
				MessageBox("Información","No se encontro el parámetro " + ls_parametro + " para asignar los datos de la lista.",Information!)			
			END IF
		END IF

	// Si el tipo de parámetro es fecha (DA) o fecha hora (DT)
	CASE 'DA', 'DT'		
		li_col_y = This.Y
		CHOOSE CASE ls_tipo_parametro

			CASE 'DA'
				lstr_calendario.String[1] = 'parametro_fecha'
				
			CASE 'DT'	
				lstr_calendario.String[1] = 'parametro_fecha_hora'

		END CHOOSE
		li_col_x = Integer(This.Describe(lstr_calendario.String[1] + ".X"))
		//li_col_ancho = Integer(This.Describe(lstr_calendario.String[1] + ".Width"))
		li_col_alto = Integer(This.Describe(lstr_calendario.String[1] + ".Height"))
		
		// Despliega el calendario
		lw_ventana = Parent	
		
		IF Not IsValid(iuo_calendario) THEN
			//Abre una instancia del objeto calendario
			lstr_calendario.Datawindow[1] = This
			lstr_calendario.Integer[1] = al_parametro_seleccionado			
			lw_ventana.OpenUserObjectWithParm(iuo_calendario,lstr_calendario)
		END IF
		
		// Extrae el alto de todas las bandas de encabezado y 
		//	almacena la sumatoria en la posición Y
		li_numero_encabezados  = 0
		ls_alto_encabezados = This.Describe("Datawindow.Header.Height")

		DO WHILE ls_alto_encabezados <> "!"
			li_col_y = li_col_y + Integer(ls_alto_encabezados)
			li_numero_encabezados ++
			ls_alto_encabezados = Describe("Datawindow.Header." + String(li_numero_encabezados) + ".Height")
		LOOP

		// Calcula la posición Y del calendario basado en la fila del parámetro
////		iuo_calendario.Width = li_col_ancho
		li_col_y = li_col_y + (Integer(This.Describe("DataWindow.Detail.Height")) * (al_parametro_seleccionado - 1))
				
		li_col_x = li_col_x + 20
		li_col_y = li_col_y + 16

		// Muestra el calendario por encima del campo si este extiende por debajo de la 
		// margen de la ventana	
////		IF (li_col_y + iuo_calendario.Height) > This.Height THEN
////			li_col_y = This.Height - iuo_calendario.Height
////		END IF

		// Mueve el calendario a la izquierda si este se pasa de la margen derecha de la ventana
		IF (li_col_x + iuo_calendario.Width) > This.Width THEN
			li_col_x = This.Width - iuo_calendario.Width - 24
		END IF
		
		// Fija la fecha inicial
		iuo_calendario.uof_asignar_fecha(Date(This.GetText()))		
		iuo_calendario.X = li_col_x
		iuo_calendario.Y = li_col_y
	
		// Muestra el calendario y le asigna el foco
		iuo_calendario.Show()	
		iuo_calendario.SetFocus()
		iuo_calendario.BringToTop = True
		
END CHOOSE	
end subroutine

public function stru_frmwrk_parametros_reportes uf_extraer_parametros_sql (string as_sql);//************************************************************************
//	David Felipe Arango F. 2005/01/17

//	Esta función, se usa para extraer los parámetros de una instrucción sql

// Recibe como parámetro el string as_sql el cual contiene la instruccion sql
// de la cual se quieren extraer los parámetros 
// Ej as_sql = SELECT TIPO_IDENTIFICACION, 
//							 NUMERO_IDENTIFICACION,	
//							 NOMBRE 
//					FROM INDIVIDUOS
//					WHERE NOMBRE
//					AND CIUDAD DE ORIGEN = :ACIUDAD DE ORIGEN.ST.V:: 
//					AND TIPO_IDENTIFICACION = :ATIPO DE DOCUMENTO.LS.LV=CEDULA	C/PASAPORTE P/.F:: 
//
//	Convención de la cadena para representar un argumento
//
// EJ con el argumento ':ATIPO DE DOCUMENTO.LS.LV=CEDULA	C/PASAPORTE P/.F::'
// de la instrucción SQL del ejemplo anterior
//
//	:A = Indicador de inicio de la cadena que contiene el argumento
//	TIPO DE DOCUMENTO = Nombre que tendrá el parametro en la ventana
// 						  cuando se construya
// . = Caracter de separación
// LS = Tipo del argumento (en este caso lista)
// . = Caracter de separación
// LV=CEDULA	C/PASAPORTE P/ = Lista de valores de la lista
//	. = Caracter de separación
//	F = Indicador para determinar si el parámetro tiene una lista de
//		 selección asociada
//	:: = Indicador de fin de la cadena que contiene el argumento


//	- El caracter de separación de cada parametro es el punto ('.')
// - El caracter que indica el inicio de la cadena que define el parametro es dos puntos (':')
// - El caracter que indica el fin de la cadena que define el parametro es dos puntos seguidos ('::')
//
//	Retorna la estructura lstr_parametros de tipo stru_frmwrk_parametros_reportes
// la cual tiene los siguientes datos:
//
// s_parametro[] 
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio del corte'
// Tipo: String
// Sensitivo: No
// Requerido: Si
// Se usa para enviar el nombre del parámetro que se quiere activar 
// (asignación simple), puede enviarse tambien en este la descripción
// del parametro que se quiere que aparezca en la lista (asignación compuesta)
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros

// s_tipo_parametro[]
// Ej asignación número: 'NM'
// Ej asignación lista: 'LS'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si existe dos parametros con el mismo nombre y diferente tipo.
// Se usa para enviar el tipo del parámetro que se quiere activar.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros.

// s_lista_valores[]
// Ej asignación: 'DW=d_lista_empleados'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si el tipo de parámetro es lista (LS) y se quiere asignar
// una lista de datos diferente a la que tiene el parámetro por defecto.
// Se usa para enviar el tipo de la lista de datos que se quiere activar 
// debe enviarse tambien en este la lista de datos que se quiere que aparezca
// asignada en la lista, la asignación siempre debe ser compuesta.

// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros si se quiere llamar una lista por defecto.

// s_valor_x_defecto[]
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio del corte'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar, en el
// caso de las lista este debe corresponder a algunos de los valores de la
// lista.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// s_micro_ayuda[]
// Ej asignación: 'haga click en la fecha para desplegar el calendario'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar en la
// micro ayuda.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// b_ventana_seleccion[]
// Ej asignación: True (pone visible el icono de zoom) 
//	False (pone invisible el icono de zoom), esta propiedad se valida en el
// evento ue_activar_ventana_seleccion para la activación de las listas
// Tipo: Boolean
// Sensitivo: No
// Requerido: No
// Se usa para activar el icono de zoom y permitir que se ejecute el evento
// ue_activar_ventana_seleccion que activa las ventanas de selección de datos, esta activación
// programarse en el evento ue_activar_ventana_seleccion.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros, pero si debe programarse la activación de
// la ventana de selección en ue_activar_ventana_selección.
//************************************************************************

stru_frmwrk_parametros_reportes	lstr_parametros
INTEGER							li_parametro, li_posicion, li_posicion_aux, &
									li_tamano_sql, li_posicion_separador, &
									li_posicion_separador_ant

as_sql = Upper(Trim(as_sql))
li_tamano_sql = Len(as_sql)

IF Not IsNull(as_sql) AND li_tamano_sql > 0 THEN
	// Evalua la instruccion SQL para determinar si tiene 
	// parámetros adicionales y crearlos dinamicamente en
	// la datawindow de parámetros
	li_posicion = 0
	DO WHILE li_posicion < li_tamano_sql
		li_parametro++
		// Busco el caracter dos puntos(':') que antecede
		// a un parametro en la instrucción SQL
		li_posicion_aux = Pos(as_sql,':A',li_posicion + 1)			
		// Si encontro un parametro lo adiciona al vector
		// de parametros
		IF li_posicion_aux > li_posicion	THEN		
			li_posicion = li_posicion_aux				
			li_posicion_separador = 0				
			// Busca el primer caracter de separación				
			li_posicion_separador = Pos(as_sql,'.',li_posicion + 2) 
			// Extrae la descripción del parámetro
			lstr_parametros.s_parametro[li_parametro] = Mid(as_sql,li_posicion + 2,li_posicion_separador - li_posicion - 2)				
			li_posicion_separador_ant = li_posicion_separador
			// Busca el siguiente caracter de separación
			li_posicion_separador = Pos(as_sql,'.',li_posicion_separador_ant + 1) 				
			// Extrae el tipo del parámetro
			lstr_parametros.s_tipo_parametro[li_parametro] = Mid(as_sql,li_posicion_separador_ant + 1,li_posicion_separador - li_posicion_separador_ant - 1)
			li_posicion_separador_ant = li_posicion_separador				
			// Si el tipo de parametro es una lista busco el parametro lista de valores	
			IF lstr_parametros.s_tipo_parametro[li_parametro] = 'LS' THEN
				// Busca el siguiente caracter de separación
				li_posicion_separador = Pos(as_sql,'.',li_posicion_separador_ant + 1) 									
				// Extrae la lista de valores asignada al parámetro de tipo lista
				lstr_parametros.s_lista_valores[li_parametro] = Mid(as_sql,li_posicion_separador_ant + 1,li_posicion_separador - li_posicion_separador_ant - 1)
			END IF	
			// Extrae el indicador de si el parámetro tiene lista de selección relacionada
			CHOOSE CASE Mid(as_sql,li_posicion_separador + 1,1)
			
				CASE 'V'
					lstr_parametros.b_ventana_seleccion[li_parametro] = True					
			
				CASE 'F'
					lstr_parametros.b_ventana_seleccion[li_parametro] = False					

			END CHOOSE
		ELSE
			li_posicion = li_tamano_sql
		END IF	
	LOOP
												
END IF

Return lstr_parametros
end function

public function boolean uf_parametros (stru_frmwrk_parametros_reportes astr_parametros);//************************************************************************
//	David Felipe Arango F. 2004/09/21
//
//	Esta función, se usa para construir los parámetros que tendrá la ventana
// de acuerdo a los parametros enviados.
//
//	Recibe como parámetro la estructura astr_parametros de tipo stru_frmwrk_parametros_reportes
// la cual tiene los siguientes datos:
//
// s_parametro[] 
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio de ......'
// Tipo: String
// Sensitivo: No
// Requerido: Si
// Se usa para enviar el nombre del parámetro que se quiere activar 
// (asignación simple), puede enviarse tambien en este la descripción
// del parametro que se quiere que aparezca en la lista (asignación compuesta)
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros

// s_tipo_parametro[]
// Ej asignación número: 'NM'
// Ej asignación lista: 'LS'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si existe dos parametros con el mismo nombre y diferente tipo.
// Se usa para enviar el tipo del parámetro que se quiere activar.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros.

// s_lista_valores[]
// Ej asignación: 'DW=d_lista_empleados'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si el tipo de parámetro es lista (LS) y se quiere asignar
// una lista de datos diferente a la que tiene el parámetro por defecto.
// Se usa para enviar el tipo de la lista de datos que se quiere activar 
// debe enviarse tambien en este la lista de datos que se quiere que aparezca
// asignada en la lista, la asignación siempre debe ser compuesta.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros si se quiere llamar una lista por defecto.

// s_valor_x_defecto[]
// Ej asignación: '%'
// Tipo: String
// Sensitivo: Si
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar, en el
// caso de las lista este debe corresponder a alguno de los valores de la
// lista.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// s_descripcion_x_defecto[]
// Ej asignación: 'TODOS LOS COLORES'
// Tipo: String
// Sensitivo: No
// Requerido: No (Solo si se envia el valor por defecto)
// Se usa para enviar la descripción que se quiere asignar y que corresponde
// al valor por defecto, en el caso de las lista esta debe corresponder a la
// descripción de la lista que corresponde al valor por defecto.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros. (Solo si esta matricualdo el dato valor_x_defecto)

// s_micro_ayuda[]
// Ej asignación: 'haga click en la fecha para desplegar el calendario'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar en la
// micro ayuda.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// b_ventana_seleccion[]
// Ej asignación: True (pone visible el icono de zoom) 
//	False (pone invisible el icono de zoom), esta propiedad se valida en el
// evento ue_activar_ventana_seleccion para la activación de las listas
// Tipo: Boolean
// Sensitivo: No
// Requerido: No
// Se usa para activar el icono de zoom y permitir que se ejecute el evento
// ue_activar_ventana_seleccion que activa las ventanas de selección de datos, esta activación
// programarse en el evento ue_activar_ventana_seleccion.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros, pero si debe programarse la activación de
// la ventana de selección en ue_activar_ventana_selección.

// s_mascara[]
// Ej asignación: ####
// Solo permite digitar cuatro (4) números en una casilla de tipo texto 
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para activar asignar una mascara específica al parámetro

//	Retorna la variable lb_continuar de tipo boleano que indica si durante el
// proceso de creación de la lista de parámetros hubo errores (False) o se
// creo la lista sin problemas (True)			
//************************************************************************

STRU_FRMWRK_PARAMETROS	lstr_parametros, lstr_datastore
BOOLEAN						lb_continuar
DATE							lda_null
DATETIME						ldt_null
DECIMAL						ldc_null
INTEGER						li_filas, li_fila, li_fila_aux, li_parametro, li_parametros, &
								li_posicion, li_posicion_aux, li_fila_lista, li_orden, li_fila_foco
LONG							lnm_null
STRING						ls_filtro_aux, ls_parametro, ls_descripcion_parametro, ls_tipo_lista, &
								ls_datos, ls_tipo_parametro, ls_ventana_seleccion, ls_micro_ayuda, &
								ls_valor_x_defecto, ls_descripcion_x_defecto, ls_buscar, ls_lista, &
								ls_codigo, ls_mascara, lst_null
TIME							ltm_null

li_orden = 0
lb_continuar = True

// Extrae el número de parámetros activados en la lista
li_filas = This.RowCount()

// Define en que fila de la datawindow debe quedar el foco
li_fila_foco = 1

IF Len(Trim(is_filtro)) > 0 THEN
	li_fila_foco = li_filas + 1
	li_orden = li_filas
END IF	
	
// Verifica si se enviaron parámetros
li_parametros = UpperBound(astr_parametros.s_parametro)	
IF li_parametros > 0 THEN
	ls_filtro_aux = is_filtro
	is_filtro = ''
	// Elimina el filtro de la lista
	IF uf_filtrar_parametros() = 1 THEN
		is_filtro = ls_filtro_aux
		// Extrae el número de parámetros totales de la lista
		li_filas = This.RowCount()
		// Recorre la estructura de parámetros para establecer la configuración
		// de cada uno de los parámetros enviada por el usuario
		DO WHILE li_parametro < li_parametros
			li_parametro++
		
			SetNull(ls_parametro)
			SetNull(ls_descripcion_parametro)
			SetNull(ls_tipo_parametro)
			SetNull(ls_tipo_lista)
			SetNull(ls_datos) 
			SetNull(ls_valor_x_defecto)
			SetNull(ls_descripcion_x_defecto)
			SetNull(ls_ventana_seleccion)
			SetNull(ls_micro_ayuda)
			SetNull(ls_buscar)
			
			// Extrae el nombre del parámetro
			ls_parametro = Trim(astr_parametros.s_parametro[li_parametro])
			IF Not IsNull(ls_parametro) AND Len(ls_parametro) > 0 THEN										
				// Busca si la cadena es compuesta (nombre parámetro=descripción parámetro)
				// o simple (nombre parámetro) (Ej: Fecha de inicio=fecha de inicio del proceso de corte)	
				li_posicion = Pos(ls_parametro,"=")	
	
				// Si se encontro el signo igual (=) indica qua la cadena es compuesta y
				// la descompone en los dos valores (nombre parámetro=descripción parámetro)
				IF li_posicion > 0 THEN
					ls_descripcion_parametro = Trim(Mid(ls_parametro,li_posicion + 1))
					ls_parametro = Trim(Mid(ls_parametro,1,li_posicion - 1))
				END IF
								
				// Extrae el tipo del parámetro enviado
				IF UpperBound(astr_parametros.s_tipo_parametro) >= li_parametro THEN
					ls_tipo_parametro = Trim(astr_parametros.s_tipo_parametro[li_parametro])
				END IF
				
				IF Not IsNull(ls_tipo_parametro) AND Len(ls_tipo_parametro) > 0 THEN		
					// Si se envio el tipo de parametro crea la instrucción  
					// para buscar por parámetro y tipo que el parámetro exista
					ls_buscar = "(Upper(nombre_parametro) = '" + Upper(ls_parametro) + "' AND Upper(tipo_parametro) = '" + Upper(ls_tipo_parametro) + "')"					
				ELSE
					// Si se envio solo el nombre del parametro crea la instrucción  
					// para buscar que el parámetro exista
					ls_buscar = "(Upper(nombre_parametro) = '" + Upper(ls_parametro) + "')"					
				END IF
								
				// Realiza la busqueda del parametro
				li_fila = This.Find(ls_buscar,1,li_filas)
				
				// Si lo encontro y la fila encontrada no es la última fila de la lista
				// se hace una nueva búsqueda para verificar que no exista el mismo parámetro
				// varias veces en la lista
				IF li_fila > 0 THEN
					li_fila_aux = 0					
					IF li_fila < li_filas THEN						
						li_fila_aux = This.Find(ls_buscar,li_fila + 1,li_filas)
					END IF
				ELSE	
					// Si no existe el parametro en la datawindow lo inserto temporalmente y
					// le asigna el nombre enviado
					li_fila = This.InsertRow(0)
					This.SetItem(li_fila,'nombre_parametro',ls_parametro)
					This.AcceptText()
					
					IF li_orden = 0 THEN
						li_orden = li_fila - 1
					END IF											
				END IF	
				
				IF lb_continuar THEN
					// Si solo existe una vez el parámetro procesa los demás datos enviados				
					IF li_fila_aux = 0 THEN
						li_orden++
						// Adiciona la condicion OR si el filtro tiene más de un parámetro
						IF Len(Trim(is_filtro)) > 0 THEN
							is_filtro = is_filtro + ' OR ' 
						END IF
						// Adiciona a la condición de filtro la condición de busqueda del 
						// parámetro actual
						is_filtro = is_filtro + ls_buscar				
			
						// Si fue enviado el parámetro de descripción lo asigna a la datawindow
						IF Not IsNull(ls_descripcion_parametro) AND Len(ls_descripcion_parametro) > 0 THEN		
							This.SetItem(li_fila,'descripcion_parametro',ls_descripcion_parametro)															
						END IF
			
						// Si fue enviado el parámetro de tipo de parámetro lo asigna a la datawindow
						IF Not IsNull(ls_tipo_parametro) AND Len(ls_tipo_parametro) > 0 THEN		
							This.SetItem(li_fila,'tipo_parametro',ls_tipo_parametro)												
						END IF
						
						// Recupera el tipo del parámetro
						ls_tipo_parametro = Upper(Trim(This.GetItemString(li_fila,'tipo_parametro')))									
						
						// Si el tipo de parámetro es lista (LS) extrae el tipo de lista	
						IF ls_tipo_parametro = 'LS' THEN	
							IF UpperBound(astr_parametros.s_lista_valores) >= li_parametro THEN
								ls_tipo_lista = Trim(astr_parametros.s_lista_valores[li_parametro])				
								This.SetItem(li_fila,'lista_valores',ls_tipo_lista)								
							ELSE
								ls_tipo_lista = Trim(This.GetItemString(li_fila,'lista_valores'))
								This.SetItem(li_fila,'parametro_lista','')								
							END IF
													
							// Válida que el tipo de lista no sea nulo
							IF Not IsNull(ls_tipo_lista) AND Len(ls_tipo_lista) > 0 THEN
								// Verifica que wl tipo de parámetro enviado sea una lista
								IF ls_tipo_parametro = 'LS' THEN						
									li_posicion = 0
		
									// Busca si la cadena es compuesta (tipo lista=datos lista)
									// o simple (tipo lista) la lista de datos debe coincidir
									// con el tipo de lista, solo es necesario enviar la lista de datos
									// cuando son diferentes a los que tiene asignados la lista por defecto
									// (Ej SQL: 'SQL=SELECT CDTIPO CODIGO, DESCRIPCION NOMBRE FROM T2_TIPOS_FRUTA')
									// (Ej ListBox: 'LB=Si S/No N')
									// (Ej Datawindow: 'Datawindow: 'DW=d_tipos_fruta')    
									li_posicion = Pos(ls_tipo_lista,"=")	
							
									// Valida que la cadena sea compuesta y la descompone en
									// los dos valores (datos y tipo lista)
									IF li_posicion > 0 THEN
										ls_datos = Upper(Trim(Mid(ls_tipo_lista,li_posicion + 1)))
										ls_tipo_lista = Trim(Mid(ls_tipo_lista,1,li_posicion - 1))
	
										// Se verifica si ya se creo la datastore de instancia que se usa
										// para el almacenamiento de las listas, si no se ha creado se crea
//										IF Not IsValid(ids_lista) THEN 
//											lstr_datastore.String[1] = 'dw_b_hija_nula'
//											lstr_datastore.String[2] = ' la lista de parámetros de tipo lista.'
											//ids_lista = f_crear_datastore(lstr_datastore)
										IF Not IsValid(iuo_ds_lista) THEN
											iuo_ds_lista = CREATE UO_FRMWRK_DATASTORE
											IF IsValid(iuo_ds_lista) THEN
												iuo_ds_lista.DataObject = 'd_frmwrk_parametro_lista'
												iuo_ds_lista.SetTransObject(sqlca)
											ELSE	
												li_parametro = li_parametros + 1
												lb_continuar = False																																						
											END IF	
										END IF
										
										// Si el tipo de lista es SQL o el tipo de lista es Datawindow (DW)
										// se almacenan los datos correspondientes a la lista en formato
										// en la datastore de instancia creada anteriormente
										IF ls_tipo_lista = 'SQL' OR ls_tipo_lista = 'DW' THEN
											// Ejecuta la función para crear la lista, la cual retorna los datos en
											// una cadena de texto con los datos que debe contener la lista 
											// en formato 'dato visualización TAB codigo almacenamiento/'
											// Ej: 'AZUL	1/ROJO	2/'										
											lstr_parametros.String[1] = ls_parametro 
											lstr_parametros.String[2] = ls_datos 
											ls_datos = uf_construir_lista(lstr_parametros)	
											
											// Si no es nula la cadena retornada por la función 
											// asigna a la datastore de instancia el nombre del parametro
											// al cual corresponde la lista ya la cadena de datos
											IF Not IsNull(ls_datos) AND Len(ls_datos) > 0 THEN
												li_fila_lista = iuo_ds_lista.InsertRow(0)
												iuo_ds_lista.SetItem(li_fila_lista,'codigo',ls_parametro)
												iuo_ds_lista.SetItem(li_fila_lista,'descripcion',ls_datos)
											ELSE
												MessageBox("Información","El parámetro " + ls_parametro + " con tipo " + ls_tipo_parametro + " no está definido en la lista.",Information!)
												li_parametro = li_parametros + 1
												lb_continuar = False																																						
											END IF										
										ELSE
											// Si el tipo de lista es lista de valores (LV) asigna 
											// directamente a la datastore de instancia el nombre del
											// parámetro al cual corresponde la lista y la cadena de 
											// datos ya que esta viene con el formato correcto
											IF Not IsNull(ls_datos) AND Len(ls_datos) > 0 THEN
												li_fila_lista = iuo_ds_lista.InsertRow(0)
												iuo_ds_lista.SetItem(li_fila_lista,'codigo',ls_parametro)
												iuo_ds_lista.SetItem(li_fila_lista,'descripcion',ls_datos)
											ELSE
												li_parametro = li_parametros + 1
												lb_continuar = False																		
											END IF	
										END IF
									
										// Si hubo error destruye la datastore de instancia
										IF Not lb_continuar THEN
											Destroy iuo_ds_lista	
										END IF	
									ELSE
										MessageBox("Información","El parámetro " + ls_parametro + " con tipo " + ls_tipo_parametro + " no tiene definida la lista de datos a asignar.",Information!)										
										li_parametro = li_parametros + 1
										lb_continuar = False																																						
									END IF	
								ELSE
									MessageBox("Información","El parámetro " + ls_parametro + " no es de tipo lista, no es posible asignarle la lista de valores.",Information!)										
									li_parametro = li_parametros + 1
									lb_continuar = False																		
								END IF
							ELSE
								MessageBox("Información","El parámetro " + ls_parametro + " con tipo " + ls_tipo_parametro + " no tiene definido el tipo y la lista de datos a asignar.",Information!)										
								li_parametro = li_parametros + 1
								lb_continuar = False																																						
							END IF
						END IF
						
						// Si no hay errores valida que los otros parámetros fueron enviados 
						IF lb_continuar THEN
							// Valida si fue enviado el parámetro con el valor por defecto							
							IF UpperBound(astr_parametros.s_valor_x_defecto) >= li_parametro THEN
								ls_valor_x_defecto = astr_parametros.s_valor_x_defecto[li_parametro]
							ELSE
								ls_valor_x_defecto = Trim(This.GetItemString(li_fila,'valor_x_defecto'))								
							END IF
							
							// Si fue enviado el parámetro con valor por defecto verifica el tipo
							// del parámetro y lo asigna a la columna del tipo correspondiente
							IF Not IsNull(ls_valor_x_defecto) AND &
								Len(ls_valor_x_defecto) > 0 AND &
								ls_valor_x_defecto <> 'NULO' THEN
								// Valida si fue enviado el parámetro con la descripción por defecto							
								IF UpperBound(astr_parametros.s_descripcion_x_defecto) >= li_parametro THEN
									ls_descripcion_x_defecto = astr_parametros.s_descripcion_x_defecto[li_parametro]
								ELSE
									ls_descripcion_x_defecto = Trim(This.GetItemString(li_fila,'descripcion_x_defecto'))								
								END IF

								// Si fue enviado el parámetro con la descripción por defecto lo asigna a la columna descripción_x_defecto
								IF Not IsNull(ls_descripcion_x_defecto) AND Len(ls_descripcion_x_defecto) > 0 THEN
									// Si la columna descripcion_parametro no tiene un valor asignado, le asigna el valor de la columna descripcion_x_defecto
									IF IsNull(ls_descripcion_parametro) OR Len(Trim(ls_descripcion_parametro)) = 0 THEN		
										This.SetItem(li_fila,'descripcion_parametro',ls_descripcion_x_defecto)															
									END IF
	
									CHOOSE CASE ls_tipo_parametro
		
										CASE 'DA' // Fecha
											IF ls_valor_x_defecto = 'NULO' THEN
												SetNull(lda_null)
												This.SetItem(li_fila,'parametro_fecha',lda_null)										
											ELSE
												This.SetItem(li_fila,'parametro_fecha',Date(ls_valor_x_defecto))
											END IF
											
										CASE 'DC' // Decimal
											IF ls_valor_x_defecto = 'NULO' THEN
												SetNull(ldc_null)
												This.SetItem(li_fila,'parametro_decimal',ldc_null)	
											ELSE
												This.SetItem(li_fila,'parametro_decimal',Dec(ls_valor_x_defecto))
											END IF
											
										CASE 'DT' // Fecha Hora
											IF ls_valor_x_defecto = 'NULO' THEN
												SetNull(ldt_null)
												This.SetItem(li_fila,'parametro_fecha_hora',ldt_null)
											ELSE
												This.SetItem(li_fila,'parametro_fecha_hora',DateTime(ls_valor_x_defecto))
											END IF
											
										CASE 'LS' // Lista (puede ser SQL, DW o LV)	
											// Busca en la datastore de instancia la lista que corresponde
											// al parámetro
											ls_valor_x_defecto = Upper(ls_valor_x_defecto)
											li_fila_lista = iuo_ds_lista.Find("Upper(codigo) = '" + Upper(ls_parametro) + "'",1,iuo_ds_lista.RowCount())
											// Recupera los datos de la lista que corresponde al parámetro 	
											ls_lista = iuo_ds_lista.GetItemString(li_fila_lista,'descripcion')
											// Busca el dato correspondiente al codigo que se debe asignar por defecto
											li_posicion = Pos(ls_lista,ls_valor_x_defecto)
											li_posicion_aux = Pos(ls_lista,'/',li_posicion + 1)
											li_posicion = Pos(ls_lista,'~t',li_posicion + 1) + 1
											ls_codigo = Mid(ls_lista,li_posicion,li_posicion_aux - li_posicion)										
											This.SetRedraw(False)
											// Asigna la lista de datos a la columna de tipo lista
											This.Modify("parametro_lista.Values='" + ls_lista + "'")
											This.SetRedraw(True)	
											// Asigna los datos del codigo y la descripción por defecto a la columnas
											// correspondientes
											This.SetItem(li_fila,'lista_valores',ls_lista)																			
											This.SetItem(li_fila,'display_lista',Upper(ls_descripcion_x_defecto))																			
											This.SetItem(li_fila,'parametro_lista',Upper(ls_codigo))
																					
										CASE 'NM' // Número Entero
											IF ls_valor_x_defecto = 'NULO' THEN
												SetNull(lnm_null)
												This.SetItem(li_fila,'parametro_numero',lnm_null)
											ELSE
												This.SetItem(li_fila,'parametro_numero',Long(ls_valor_x_defecto))
											END IF
											
										CASE 'ST' // String
											IF ls_valor_x_defecto = 'NULO' THEN
												SetNull(lst_null)
												This.SetItem(li_fila,'parametro_string',lst_null)
											ELSE										
												This.SetItem(li_fila,'parametro_string',Upper(ls_valor_x_defecto))
											END IF	
											
										CASE 'TM' // Hora
											IF ls_valor_x_defecto = 'NULO' THEN
												SetNull(ltm_null)
												This.SetItem(li_fila,'parametro_hora',ltm_null)
											ELSE																				
												This.SetItem(li_fila,'parametro_hora',Time(ls_valor_x_defecto))
											END IF											
											
									END CHOOSE								
								ELSE
									MessageBox("Información","El parámetro " + ls_parametro + " con tipo " + ls_tipo_parametro + " tiene definido un valor por defecto pero no tiene definida una descripción por defecto.",Information!)										
									li_parametro = li_parametros + 1
									lb_continuar = False																																						
								END IF
							END IF	
						END IF
						
						// Si no hay errores valida los otros parámetros enviados 
						IF lb_continuar THEN	
							// Valida si fue enviado el parámetro para activación de ventana de 
							// selección
							ls_ventana_seleccion = 'N'
							IF UpperBound(astr_parametros.b_ventana_seleccion) >= li_parametro THEN								
								IF astr_parametros.b_ventana_seleccion[li_parametro] THEN
									ls_ventana_seleccion = 'S'									
								END IF
							ELSE
								ls_ventana_seleccion = Trim(This.GetItemString(li_fila,'ventana_seleccion'))								
							END IF							
							// Si fue enviado el parámetro para activación de ventana de selección
							// lo asigna a la columna del tipo correspondiente							
							IF Not IsNull(ls_ventana_seleccion) AND Len(ls_ventana_seleccion) > 0 THEN
								This.SetItem(li_fila,'ventana_seleccion',ls_ventana_seleccion)
							END IF								
	
							// Valida si fue enviado el parámetro con el texto de la micro ayuda
							IF UpperBound(astr_parametros.s_micro_ayuda) >= li_parametro THEN
								ls_micro_ayuda = astr_parametros.s_micro_ayuda[li_parametro]
							END IF
							// Si fue enviado el parámetro con el texto de la micro ayuda lo asigna
							// a la columna del tipo correspondiente														
							IF Not IsNull(ls_micro_ayuda) AND Len(ls_micro_ayuda) > 0 THEN
								This.SetItem(li_fila,'micro_ayuda',ls_micro_ayuda)
							END IF
														
							// Valida si fue enviado el parámetro con la mascara que se asigna al campo
							IF UpperBound(astr_parametros.s_mascara) >= li_parametro THEN
								ls_mascara = astr_parametros.s_mascara[li_parametro]
							END IF
							// Si fue enviado el parámetro con la mascara lo asigna
							// a la columna del tipo correspondiente														
							IF Not IsNull(ls_mascara) AND Len(ls_mascara) > 0 THEN
								This.SetItem(li_fila,'mascara',ls_mascara)
							END IF								
							
							This.SetItem(li_fila,'orden',li_orden)
						END IF
					ELSE	
						IF li_fila_aux > 0 THEN
							// Si encontro más de una vez el parámetro con las mismas caracteristicas 
							// (nombre y/ tipo) despliega un mensaje reportando la inconsistencia
							MessageBox("Información","El parámetro " + ls_parametro + " existe más de una vez en la lista.",Information!)																	
							li_parametro = li_parametros + 1
							lb_continuar = False																	
						ELSE
							IF li_fila = 0 THEN
								MessageBox("Información","El parámetro " + ls_parametro + " con tipo " + ls_tipo_parametro + " no esta definido en la lista.",Information!)										
								li_parametro = li_parametros + 1
								lb_continuar = False																		
							END IF
						END IF	
					END IF		
				END IF
			ELSE
				// Si el parámetro es nulo despliega un mensaje
				// reportando el error
				MessageBox("Información","El nombre del parámetro enviado en la estructura en la posición " + String(li_parametro) + " es nulo.",Information!)										
				li_parametro = li_parametros + 1
				lb_continuar = False																			
			END IF
		LOOP
		
		// Si no hubo errores 
		IF lb_continuar THEN
			lb_continuar = False
			// Asigno el nuevo filtro a la datawindow de parámetros			
			IF This.uf_filtrar_parametros() = 1 THEN
				// Ordena la datawindow de parámetros de acuerdo al orden con
				// que fueron enviados los parámetros
				IF This.uf_ordenar_parametros() = 1 THEN
					lb_continuar = True
					This.uf_redimensionar_parametros()
					// Hace visible la ventana con los parámetros
					This.Visible = True
			
					IF UpperBound(astr_parametros.s_parametro) > 1 THEN
						li_fila = li_fila_foco
						DO WHILE li_fila < This.RowCount()
							ls_valor_x_defecto = This.GetItemString(li_fila,'valor_x_defecto')
							IF Not IsNull(ls_valor_x_defecto) AND &
								Len(Trim(ls_valor_x_defecto)) > 0 THEN
								li_fila_foco++
							END IF
							li_fila++
						LOOP
					END IF
					This.SetRow(li_fila_foco)					
				END IF
			ELSE
				// Si la aplicación del filtro a la lista de parámetros no es exitosa
				// despliega un mensaje reportando el error
				MessageBox("Información","No fue posible aplicar el filtro a la lista de parámetros.",Information!)														
				li_parametro = li_parametros + 1
				lb_continuar = False																					
			END IF
		END IF	
	ELSE
		// Si la aplicación del filtro a la lista de parámetros no es exitosa
		// despliega un mensaje reportando el error
		MessageBox("Información","No fue posible aplicar el filtro a la lista de parámetros.",Information!)														
		lb_continuar = False																					
	END IF
END IF

Return lb_continuar
end function

public function boolean uf_eliminar_parametros (stru_frmwrk_parametros_reportes astr_parametros);//************************************************************************
//	David Felipe Arango F. 2005/01/21
//
//	Esta función, se usa para eliminar parámetros de la ventana de acuerdo a
// los parametros enviados.
//
// NOTA:
//	Si se borran los parámetros no podran desplegarse nuevamente ejecutando 
// la función uf_parametros enviando solo el nombre del parámetro, para 
// desplegar los parametros borrados deben ser creados dinamicamente 
// enviando todas la caracteristicas del parámetro y ejecutando la función
// uf_parametros()
//
//	Recibe como parámetro la estructura astr_parametros de tipo stru_frmwrk_parametros_reportes
// la cual tiene los siguientes datos:
//
// s_parametro[] 
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio del corte'
// Tipo: String
// Sensitivo: No
// Requerido: Si
// Se usa para enviar el nombre del parámetro que se quiere activar 
// (asignación simple), puede enviarse tambien en este la descripción
// del parametro que se quiere que aparezca en la lista (asignación compuesta)
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros

// s_tipo_parametro[]
// Ej asignación número: 'NM'
// Ej asignación lista: 'LS'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si existe dos parametros con el mismo nombre y diferente tipo.
// Se usa para enviar el tipo del parámetro que se quiere activar.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros.

// s_lista_valores[]
// Ej asignación: 'DW=d_lista_empleados'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si el tipo de parámetro es lista (LS) y se quiere asignar
// una lista de datos diferente a la que tiene el parámetro por defecto.
// Se usa para enviar el tipo de la lista de datos que se quiere activar 
// debe enviarse tambien en este la lista de datos que se quiere que aparezca
// asignada en la lista, la asignación siempre debe ser compuesta.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros si se quiere llamar una lista por defecto.

// s_valor_x_defecto[]
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio del corte'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar, en el
// caso de las lista este debe corresponder a algunos de los valores de la
// lista.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// s_micro_ayuda[]
// Ej asignación: 'haga click en la fecha para desplegar el calendario'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar en la
// micro ayuda.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// b_ventana_seleccion[]
// Ej asignación: True (pone visible el icono de zoom) 
//	False (pone invisible el icono de zoom), esta propiedad se valida en el
// evento ue_activar_ventana_seleccion para la activación de las listas
// Tipo: Boolean
// Sensitivo: No
// Requerido: No
// Se usa para activar el icono de zoom y permitir que se ejecute el evento
// ue_activar_ventana_seleccion que activa las ventanas de selección de datos, esta activación
// programarse en el evento ue_activar_ventana_seleccion.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros, pero si debe programarse la activación de
// la ventana de selección en ue_activar_ventana_selección.

//	Retorna la variable lb_continuar de tipo boleano que indica si durante el
// proceso de creación de la lista de parámetros hubo errores (False) o se
// creo la lista sin problemas (True)			
//************************************************************************

BOOLEAN						lb_continuar
INTEGER						li_fila, li_filas, li_fila_foco, li_parametro, li_parametros, &
								li_posicion, li_borrado, li_resultado
STRING						ls_parametro, ls_tipo_parametro, ls_buscar, ls_buscar_filtro

lb_continuar = True

// Verifica si la lista tiene parámetros matriculados
li_filas = This.RowCount()

// Define en que fila de la datawindow debe quedar el foco
li_fila_foco = This.GetRow()

IF li_filas > 0 THEN	
	// Verifica si se enviaron parámetros
	li_parametros = UpperBound(astr_parametros.s_parametro)	
	IF li_parametros > 0 THEN
		
		// Recorre la estructura de parámetros para establecer la configuración
		// de cada uno de los parámetros enviada por el usuario
		DO WHILE li_parametro < li_parametros
			li_parametro++
		
			SetNull(ls_parametro)
			
			// Extrae el nombre del parámetro
			ls_parametro = Trim(astr_parametros.s_parametro[li_parametro])
			IF Not IsNull(ls_parametro) AND Len(ls_parametro) > 0 THEN										
				IF Upper(ls_parametro) = 'TEMA' OR &
					Upper(ls_parametro) = 'PROCESO' OR &
					Upper(ls_parametro) = 'TIPO DE PROCESO' THEN
					
					li_parametro = li_parametros
					// Si el parámetro que se desea borrar es uno de los
					// parámetros constantes de la aplciación
					// despliego un mensaje reportando el error
					MessageBox("Información","Los parámetros TEMA, PROCESO y TIPO DE PROCESO son reservados de la aplicación y no pueden ser usados como parámetros dinámicos definidos por el usuario.",Information!)																			
					li_parametro = li_parametros + 1
					lb_continuar = False											
				ELSE	
					// Busca si la cadena es compuesta (nombre parámetro=descripción parámetro)
					// o simple (nombre parámetro) (Ej: Fecha de inicio=fecha de inicio del proceso de corte)	
					li_posicion = Pos(ls_parametro,"=")	
		
					// Si se encontro el signo igual (=) indica qua la cadena es compuesta y
					// extrae de esta el nombre parámetro
					IF li_posicion > 0 THEN
						ls_parametro = Trim(Mid(ls_parametro,1,li_posicion - 1))
					END IF
									
					// Extrae el tipo del parámetro enviado
					IF UpperBound(astr_parametros.s_tipo_parametro) >= li_parametro THEN
						ls_tipo_parametro = Trim(astr_parametros.s_tipo_parametro[li_parametro])				
					END IF
					
					IF Not IsNull(ls_tipo_parametro) AND Len(ls_tipo_parametro) > 0 THEN		
						// Si se envio el tipo de parametro crea la instrucción  
						// para buscar por parámetro y tipo que el parámetro exista
						ls_buscar = "(Upper(nombre_parametro) = '" + Upper(ls_parametro) + "' AND Upper(tipo_parametro) = '" + Upper(ls_tipo_parametro) + "')"					
					ELSE
						// Si se envio solo el nombre del parametro crea la instrucción  
						// para buscar que el parámetro exista
						ls_buscar = "(Upper(nombre_parametro) = '" + Upper(ls_parametro) + "')"					
					END IF
					
					lb_continuar = True
					li_borrado = 0
					DO WHILE li_borrado < 3
						li_borrado++
						CHOOSE CASE li_borrado
							
							CASE 1
								// Realiza la busqueda del parámetro en la 
								// datawindow de parámetros
								li_fila = This.Find(ls_buscar,1,li_filas)
								// Valida que el parámetro exista en la datawindow de
								// parámetros							
								li_resultado = 10
								IF li_fila > 0 THEN
									// Si lo encontro borra el parámetro de la datawindow				
									li_resultado = This.DeleteRow(li_fila)					
								END IF
								
							CASE 2
								IF ls_tipo_parametro = 'LS' THEN
									// Si el parámetro es de tipo lista realiza la busqueda
									// de este en la datastore que almacena las listas de parámetros						
									li_fila = iuo_ds_lista.Find("Upper(codigo) = '" + Upper(ls_parametro) + "'",1,li_filas)
									li_resultado = -1
									IF li_fila > 0 THEN
										// Si lo encontro borra el parámetro de la datastore				
										li_resultado = iuo_ds_lista.DeleteRow(li_fila)
									END IF
								END IF
								
							CASE 3
								li_resultado = -1
								IF Len(Trim(is_filtro)) > 0 THEN
									ls_buscar_filtro = ' OR ' + ls_buscar
									li_posicion = Pos(is_filtro,ls_buscar_filtro) 								
									IF li_posicion = 0 THEN
										ls_buscar_filtro = ls_buscar
										li_posicion = Pos(is_filtro,ls_buscar_filtro) 								
									END IF	
									IF li_posicion > 0 THEN
										is_filtro = Replace(is_filtro,li_posicion,Len(ls_buscar_filtro),'')									
										li_resultado = Len(is_filtro)
										
										IF This.RowCount() = 0 THEN
											li_resultado = 1
										END IF	
									END IF								
								END IF
								
						END CHOOSE		
											
						IF li_resultado = 10 THEN						
							li_borrado = 4					
						END IF
						IF li_resultado <= 0 THEN	
							li_borrado = 4
							lb_continuar = False	
						END IF						
					LOOP
														
					IF Not lb_continuar THEN
						// Si hubo errores durante el proceso de borrado del
						// parámetro despliega un mensaje reportando el error
						MessageBox("Información","El borrado del parámetro " + ls_parametro + " no fue realizado exitosamente.",Information!)																			
						li_parametro = li_parametros + 1
						lb_continuar = False																	
					END IF
				END IF
			ELSE
				// Si el parámetro es nulo despliega un mensaje
				// reportando el error
				MessageBox("Información","El nombre del parámetro enviado en la estructura en la posición " + String(li_parametro) + " es nulo.",Information!)																			
				li_parametro = li_parametros + 1
				lb_continuar = False																			
			END IF
		LOOP
		
		// Si no hubo errores 
		IF lb_continuar THEN				
			IF li_borrado = 3 THEN
				lb_continuar = False
				// Asigno el nuevo filtro a la datawindow de parámetros			
				IF This.uf_filtrar_parametros() = 1 THEN
					// Ordena la datawindow de parámetros de acuerdo al orden con
					// que fueron enviados los parámetros
					IF This.uf_ordenar_parametros() = 1 THEN
						lb_continuar = True
						This.uf_redimensionar_parametros()
						// Hace visible la ventana con los parámetros
						This.Visible = True				
						This.SetRow(li_fila_foco)					
					END IF
				END IF
			END IF
		END IF	
	END IF
ELSE
	MessageBox("Información","No hay parámetros definidos en la lista.",Information!)																			
END IF	

Return lb_continuar
end function

public function integer uf_ordenar_parametros ();//************************************************************************
//	David Felipe Arango F. 2005/01/21

//	Esta función, se usa para ordenar los registros de la datawindow de
// parámetros de acuerdo al orden con que fueron enviados.

//	No recibe ningún parámetro

//	Retorna un Integer con el resultado de la asignación del valor.(-1 error
// 1 exito)
//************************************************************************

INTEGER						li_orden

// Limpia el orden de la datawindow de parametros y asigna un nuevo orden
li_orden = This.SetSort("")
IF li_orden = 1 THEN
	li_orden = This.Sort()			
END IF

IF li_orden = 1 THEN
	li_orden = This.SetSort("orden A")
END IF

IF li_orden = 1 THEN
	li_orden = This.Sort()	
END IF

IF li_orden = 1 THEN
	This.AcceptText()
ELSE
	// Si se presento error en la asignación del orden a
	// la datawindow de parámetros
	MessageBox("Información","Ocurrió un error al asignar el orden a la datawindow de parámetros.~r~n~r~nProceso Cancelado",Information!)																				
END IF

Return li_orden
end function

public function integer uf_filtrar_parametros ();//************************************************************************
//	David Felipe Arango F. 2005/01/21

//	Esta función, se usa para asignar un nuevo filtro a la datawindow de 
// parámetros.

//	No recibe ningún parámetro

//	Retorna un Integer con el resultado de la asignación del valor.(-1 error
// 1 exito)
//************************************************************************

INTEGER						li_filtro

// Limpia el filtro de la datawindow de parametros y asigna un nuevo filtro
li_filtro = This.SetFilter("")
IF li_filtro = 1 THEN
	li_filtro = This.Filter()			
END IF

IF li_filtro = 1 THEN
	li_filtro = This.SetFilter(is_filtro)
END IF

IF li_filtro = 1 THEN
	li_filtro = This.Filter()		
END IF	

IF li_filtro = 1 THEN
	This.AcceptText()
ELSE
	// Si se presento error en la asignación del filtro a
	// la datawindow de parámetros
	MessageBox("Información","Ocurrió un error al asignar el filtro a la datawindow de parámetros.~r~n~r~nProceso Cancelado",Information!)																					
END IF

Return li_filtro
end function

public subroutine uf_redimensionar_parametros ();//************************************************************************
//	David Felipe Arango F. 2005/01/21

//	Esta función, se usa para redimensionar la datawindow de parámetros 
// según el número de parámetros que se esten visualizando.

//	No recibe ningún parámetro

//	No retorna ningún valor
//************************************************************************

INTEGER	li_filas

// Configura las dimensiones de la ventana con los parámetros
//This.Width = 3497
li_filas = This.RowCount()
IF li_filas > 10 THEN	
	// Si tiene mas de diez (10) filas activa la barra de 
	// scroll vertical y limita el tamaño de la ventana
	// para que solo muestre diez filas
	This.VScrollBar = True
	li_filas = 10
END IF
This.Height = Long(This.Object.DataWindow.Header.Height) + ((Long(This.Object.DataWindow.Detail.Height) + 9) * li_filas)
end subroutine

public function boolean uf_reconfigurar_parametros (stru_frmwrk_parametros_reportes astr_parametros);//************************************************************************
//	David Felipe Arango F. 2004/09/21
//
//	Esta función, se usa para reconfigurar (definir nuevos parametros en
// la lista y eliminar otros parámetros que se habian definidio) la lista
// de parámetros que tiene la ventana de acuerdo a los parametros enviados.
//
//	Recibe como parámetro la estructura astr_parametros de tipo stru_frmwrk_parametros_reportes
// la cual tiene los siguientes datos:
//
// s_parametro[] 
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio del corte'
// Tipo: String
// Sensitivo: No
// Requerido: Si
// Se usa para enviar el nombre del parámetro que se quiere activar 
// (asignación simple), puede enviarse tambien en este la descripción
// del parametro que se quiere que aparezca en la lista (asignación compuesta)
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros

// s_tipo_parametro[]
// Ej asignación número: 'NM'
// Ej asignación lista: 'LS'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si existe dos parametros con el mismo nombre y diferente tipo.
// Se usa para enviar el tipo del parámetro que se quiere activar.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros.

// s_lista_valores[]
// Ej asignación: 'DW=d_lista_empleados'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si el tipo de parámetro es lista (LS) y se quiere asignar
// una lista de datos diferente a la que tiene el parámetro por defecto.
// Se usa para enviar el tipo de la lista de datos que se quiere activar 
// debe enviarse tambien en este la lista de datos que se quiere que aparezca
// asignada en la lista, la asignación siempre debe ser compuesta.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros si se quiere llamar una lista por defecto.

// s_valor_x_defecto[]
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio del corte'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar, en el
// caso de las lista este debe corresponder a algunos de los valores de la
// lista.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// s_micro_ayuda[]
// Ej asignación: 'haga click en la fecha para desplegar el calendario'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar en la
// micro ayuda.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// b_ventana_seleccion[]
// Ej asignación: True (pone visible el icono de zoom) 
//	False (pone invisible el icono de zoom), esta propiedad se valida en el
// evento ue_activar_ventana_seleccion para la activación de las listas
// Tipo: Boolean
// Sensitivo: No
// Requerido: No
// Se usa para activar el icono de zoom y permitir que se ejecute el evento
// ue_activar_ventana_seleccion que activa las ventanas de selección de datos, esta activación
// programarse en el evento ue_activar_ventana_seleccion.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros, pero si debe programarse la activación de
// la ventana de selección en ue_activar_ventana_selección.

// s_mascara[]
// Ej asignación: ####
// Solo permite digitar cuatro (4) números en una casilla de tipo texto 
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para activar asignar una mascara específica al parámetro

//	Retorna la variable lb_continuar de tipo boleano que indica si durante el
// proceso de creación de la lista de parámetros hubo errores (False) o se
// creo la lista sin problemas (True)			
//************************************************************************

BOOLEAN	lb_continuar

is_filtro = ''
uf_filtrar_parametros()

iuo_ds_lista.Reset()
uf_parametros(astr_parametros)

Return lb_continuar
end function

public subroutine uf_asignar_foco (integer ai_fila_actual);//************************************************************************
//	David Felipe Arango F. 2005/01/04

//	Esta función, se usa para asignar el foco a la lista cuando el parámetro
// seleccionado despliega el calendario o para ocultar el calendario cuando
// se hizo click sobre un parámetro que despliega el calendario y se 
// hace click en un parámetro diferente.
// Actualiza las variables de instacia que almacenan la fila actual y el tipo
// y le tipo del parametro almacenado en esta.

//	Recibe como parámetro el número de la fila actual seleccionada as_fila_actual
// de tipo integer

//	No retorna ningún valor
//************************************************************************

STRING	ls_columna, ls_ventana_seleccion, ls_mascara, ls_tipo_fila_actual
WINDOW	lw_ventana

lw_ventana = Parent

ls_tipo_fila_actual = Upper(This.GetItemString(ai_fila_actual,'tipo_parametro'))

IF ii_fila_anterior <> ai_fila_actual THEN	
	IF is_tipo_fila_anterior = 'DA' OR &
		is_tipo_fila_anterior = 'DT' OR &	
		ls_tipo_fila_actual <> 'DA' OR &
		ls_tipo_fila_actual <> 'DT' THEN
		IF IsValid(iuo_calendario) THEN
			// Cierra una instancia del objeto calendario			
			lw_ventana.CloseUserObject(iuo_calendario)				
		END IF
	END IF
END IF

IF ls_tipo_fila_actual = 'DA' OR &
	ls_tipo_fila_actual = 'DT' THEN		
	This.SetColumn(This.GetColumnName())	
END IF

IF ai_fila_actual > 0 THEN
	This.SetRedraw(False)
	
	// Verifica si el parámetro no es de tipo lista y tiene 
	// ventana de selección asignada protejo el registro y
	// pongo la letra en colo gris, si no lo desportejo y pongo
	// la letra en color negro		
	CHOOSE CASE Upper(This.GetItemString(ai_fila_actual,'tipo_parametro'))

		CASE 'DC' // Decimal
			ls_columna = 'parametro_decimal'
								
		CASE 'NM' // Número
			ls_columna = 'parametro_numero'
		
		CASE 'ST' // String
			ls_columna = 'parametro_string'
								
	END CHOOSE
	
	ls_ventana_seleccion = Upper(Trim(This.GetItemString(ai_fila_actual,'ventana_seleccion')))
	IF ls_ventana_seleccion = 'S' THEN
		This.Modify(ls_columna + ".Edit.DisplayOnly=Yes")
		This.Modify(ls_columna + ".Color='12632256'")
	ELSE
		This.Modify(ls_columna + ".Edit.DisplayOnly=No")		
		This.Modify(ls_columna + ".Color='0'")

		// Verifica si el párámetro tiene una mascara asignada y asigna la mascara
		// al registro especifico del parámetro
		ls_mascara = This.GetItemString(ai_fila_actual,'mascara')
		
		IF Not IsNull(ls_mascara) AND Len(ls_mascara) > 0 THEN
			This.Modify(ls_columna + ".EditMask.Mask='" + ls_mascara + "'")	
		END IF		
	END IF	
	
	This.SetRedraw(True)
END IF

ii_fila_anterior = ai_fila_actual
is_tipo_fila_anterior = ls_tipo_fila_actual
end subroutine

public function string uf_obtener_valor_parametro (stru_frmwrk_parametros astr_parametro);//************************************************************************
//	David Felipe Arango F. 2005/01/11

//	Esta función, se usa para recuperar el codigo de un parámetro de la lista.

//	Recibe como parámetro la estructura astr_parametros de tipo STRU_FRMWRK_PARAMETROS
// la cual contiene los siguientes parámetros:

// astr_parametros.String[1] = Nombre del parámetro del cual se quiere recuperar
// el valor

//	Retorna un string con el valor del parametro seleccionado.
//************************************************************************

INTEGER						li_parametro, li_parametros
STRING						ls_parametro

li_parametros = This.RowCount()
astr_parametro.String[1] = Upper(astr_parametro.String[1])

IF li_parametros > 0 THEN
	This.AcceptText()	
	li_parametro = This.Find("Upper(nombre_parametro) = '" + astr_parametro.String[1] + "'",1,li_parametros)	
	IF li_parametro > 0 THEN	
		CHOOSE CASE Upper(This.GetItemString(li_parametro,'tipo_parametro'))
	
			CASE 'DA' // Fecha
				ls_parametro = String(This.GetItemDate(li_parametro,'parametro_fecha'),is_formato_fecha)
				
			CASE 'DC' // Decimal
				ls_parametro = String(This.GetItemDecimal(li_parametro,'parametro_decimal'))
				
			CASE 'DT' // Fecha Hora
				ls_parametro = String(This.GetItemDateTime(li_parametro,'parametro_fecha_hora'),is_formato_fecha+' hh:mm:ss')
				
			CASE 'LS' // Lista (puede ser SQL, DW o LV)	
				ls_parametro = Upper(Trim(This.GetItemString(li_parametro,'parametro_lista')))
														
			CASE 'NM' // Número
				ls_parametro = String(This.GetItemNumber(li_parametro,'parametro_numero'))
				
			CASE 'ST' // String
				ls_parametro = Upper(Trim(This.GetItemString(li_parametro,'parametro_string')))
				
			CASE 'TM' // Hora
				ls_parametro = String(This.GetItemTime(li_parametro,'parametro_hora'),'hh:mm:ss')									
												
		END CHOOSE
		
		IF UpperBound(astr_parametro.Boolean) >= 1 THEN
			IF astr_parametro.Boolean[1] THEN
				IF IsNull(ls_parametro) OR Len(ls_parametro) = 0 THEN
					MessageBox("Información","El valor del parámetro " + astr_parametro.String[1] + " es nulo, por favor seleccione o asigne un valor al parámetro e intente de nuevo.",Information!)																				
				END IF		
			END IF
		END IF
	ELSE
		MessageBox("Información","El parámetro " + astr_parametro.String[1] + " no existe.",Information!)																				
		SetNull(ls_parametro)
	END IF
END IF

Return ls_parametro
end function

public function string uf_reemplazar_parametros_sql (string as_sql);//************************************************************************
//	David Felipe Arango F. 2005/01/17

//	Esta función, se usa para reemplazar los parámetros de una instrucción
// sql por los valores que estos tengan asignados en la ventana de parámetros
// (Este Objeto)

// Recibe como parámetro el string as_sql el cual contiene la instruccion sql
// de la cual se quieren extraer los parámetros 
// Ej as_sql = SELECT TIPO_IDENTIFICACION, 
//							 NUMERO_IDENTIFICACION,	
//							 NOMBRE 
//					FROM INDIVIDUOS
//					WHERE NOMBRE
//					AND CIUDAD DE ORIGEN = :ACIUDAD DE ORIGEN.ST.V:: 
//					AND TIPO_IDENTIFICACION = :ATIPO DE DOCUMENTO.LS.LV=CEDULA	C/PASAPORTE P/.F:: 
//
//	Convención de la cadena para representar un argumento
//
// EJ con el argumento ':ATIPO DE DOCUMENTO.LS.LV=CEDULA	C/PASAPORTE P/.F::'
// de la instrucción SQL del ejemplo anterior
//
//	:A = Indicador de inicio de la cadena que contiene el argumento
//	TIPO DE DOCUMENTO = Nombre que tendrá el parametro en la ventana
// 						  cuando se construya
// . = Caracter de separación
// LS = Tipo del argumento (en este caso lista)
// . = Caracter de separación
// LV=CEDULA	C/PASAPORTE P/ = Lista de valores de la lista
//	. = Caracter de separación
//	F = Indicador para determinar si el parámetro tiene una lista de
//		 selección asociada
//	:: = Indicador de fin de la cadena que contiene el argumento


//	- El caracter de separación de cada parametro es el punto ('.')
// - El caracter que indica el inicio de la cadena que define el parametro es dos puntos (':')
// - El caracter que indica el fin de la cadena que define el parametro es dos puntos seguidos ('::')
//
//	Retorna la variable as_sql de tipo string con la instrucción SQL con los parámetros
// reemplazados.
//************************************************************************

STRU_FRMWRK_PARAMETROS	lstr_parametro
INTEGER						li_tamano_sql, li_parametro, li_parametros, li_posicion_inicial, &
								li_posicion_final, li_posicion_separador
STRING						ls_vlparametro

as_sql = Upper(Trim(as_sql))
li_tamano_sql = Len(as_sql)

IF Not IsNull(as_sql) AND li_tamano_sql > 0 THEN
	// Evalua la instruccion SQL para determinar si tiene 
	// parámetros adicionales y buscarlos en la datawindow
	// de parámetros (Este Objeto) extraer el valor asignado
	// a cada parámetro en esta y lo reemplaza dinamicamente
	// en la instrucción SQL
	li_posicion_inicial = 0

	li_parametros = This.RowCount()

	li_posicion_inicial = 1
	
	DO WHILE li_posicion_inicial > 0
		// Busco el caracter dos puntos(':A') que indica el inicio
		// de la cadena que contiene los datos del parámetro en la instrucción SQL
		li_posicion_inicial = Pos(as_sql,':A',li_posicion_inicial)			

		IF li_posicion_inicial > 0 THEN
			// Busco el caracter dos puntos seguidos('::') que indica el fin
			// de la cadena que contiene los datos del parámetro en la instrucción SQL
			li_posicion_final = Pos(as_sql,'::',li_posicion_inicial + 1)					
			// Si encontro una cadena con la definición de un parámetro
			// la extrae que contiene los datos del parámetro
			IF li_posicion_inicial > 0 AND li_posicion_final > 0 AND &
				li_posicion_final > li_posicion_inicial THEN		
				// Busca el primer caracter de separación para extraer de la cadena
				// solo el nombre del parámetro
				li_posicion_separador = Pos(as_sql,'.',li_posicion_inicial + 1) 										
				// Extrae el nombre del parámetro de la cadena
				lstr_parametro.String[1] = Upper(Mid(as_sql,li_posicion_inicial + 2,li_posicion_separador - li_posicion_inicial - 2))
				// Busca el parámetro dentro de la datawindow de parámetros (Este Objeto)
				li_parametro = This.Find("Upper(nombre_parametro) = '" + lstr_parametro.String[1] + "'",1,li_parametros)
				
				IF li_parametro > 0 THEN
					// Si encontro el párametro en la datawindow extrae el valor asignado a este	y lo
					// reemplaza en la instrucción SQL
					ls_vlparametro = "'" +This.uf_obtener_valor_parametro(lstr_parametro) +"'"
					IF IsNull(ls_vlparametro) OR Len(Trim(ls_vlparametro)) = 0 THEN
						ls_vlparametro = "'%'"
					END IF	
					as_sql = Replace(as_sql,li_posicion_inicial,(li_posicion_final + 2) - li_posicion_inicial,ls_vlparametro)
				ELSE
					MessageBox("Información","El parámetro " + lstr_parametro.String[1] + " no se puede reemplazar, no existe en la ventana de parámetros.",Information!)																				
					SetNull(as_sql)
					li_posicion_inicial = 0					
				END IF	
			ELSE
				MessageBox("Información","El parámetro " + lstr_parametro.String[1] + " no se puede reemplazar, la instrucción SQL tiene errores en la definición de los parámetros.",Information!)																				
				SetNull(as_sql)
				li_posicion_inicial = 0
			END IF	
		END IF
	LOOP												
END IF

Return as_sql
end function

public function integer uf_asignar_valor_parametro (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	David Felipe Arango F. 2005/01/11

//	Esta función, se usa para asignar el valor de un parámetro de la lista.

//	Recibe como parámetro la estructura astr_parametros de tipo STRU_FRMWRK_PARAMETROS
// la cual contiene los siguientes parámetros:

// astr_parametros.String[1] = Nombre del parámetro al cual se le quiere
// asignar el valor

// astr_parametros.String[2] o astr_parametros.Date[1] o astr_parametros.DateTime[1]
// o astr_parametros.Time[1] o astr_parametros.Decimal[1] o astr_parametros.Long[1]
// = Valor a asignar al parámetro de acuerdo al tipo del dato (Si es lista se envia
// en el tipo de dato String)

//	Retorna un Integer con el resultado de la asignación del valor (-1 error
// 1 exito)
//************************************************************************

BOOLEAN						lb_nulo
INTEGER						li_parametro, li_parametros, li_retorno
STRING						ls_parametro

li_parametros = This.RowCount()
ls_parametro = Upper(astr_parametros.String[1])

IF li_parametros > 0 THEN
	This.AcceptText()	
	li_parametro = This.Find("Upper(nombre_parametro) = '" + ls_parametro + "'",1,li_parametros)	
	IF li_parametro > 0 THEN	
		li_retorno = -1
		lb_nulo = True			
		CHOOSE CASE Upper(This.GetItemString(li_parametro,'tipo_parametro'))
	
			CASE 'DA' // Fecha
				IF Not IsNull(astr_parametros.Date[1]) THEN

					li_retorno = This.SetItem(li_parametro,'parametro_fecha',astr_parametros.Date[1])
					lb_nulo = False					
				END IF
				
			CASE 'DC' // Decimal
				IF Not IsNull(astr_parametros.Decimal[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_decimal',astr_parametros.Decimal[1])
					lb_nulo = False					
				END IF
				
			CASE 'DT' // Fecha Hora
				IF Not IsNull(astr_parametros.DateTime[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_fecha_hora',astr_parametros.DateTime[1])
					lb_nulo = False					
				END IF
				
			CASE 'LS' // Lista (puede ser SQL, DW o LV)	
				IF Not IsNull(astr_parametros.String[2]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_lista',astr_parametros.String[2])
					lb_nulo = False					
				END IF
				
			CASE 'NM' // Número
				IF Not IsNull(astr_parametros.Long[1]) THEN								
					li_retorno = This.SetItem(li_parametro,'parametro_numero',astr_parametros.Long[1])
					lb_nulo = False					
				END IF
				
			CASE 'ST' // String
				IF Not IsNull(astr_parametros.String[2]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_string',astr_parametros.String[2])
					lb_nulo = False					
				END IF
				
			CASE 'TM' // Hora
				IF Not IsNull(astr_parametros.Time[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_hora',astr_parametros.Time[1])
					lb_nulo = False					
				END IF
				
		END CHOOSE
		
		IF lb_nulo THEN
			MessageBox("Información","El valor del parámetro " + ls_parametro + " es nulo, por favor seleccione o asigne un valor al parámetro e intente de nuevo.",Information!)																							
		END IF		
	ELSE
		MessageBox("Información","El parámetro " + ls_parametro + " no existe.",Information!)																							
	END IF
END IF

This.AcceptText()

Return li_retorno
end function

public function string uf_construir_lista (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	David Felipe Arango F. 2004/09/21

//	Esta función, se usa para asignar los datos de las listas de parámetros
// a una datastore dinamica que se usa en la construcción de las listas
// dinamicamente durante la ejecución.

//	Recibe como parámetro la estructura astr_parametos de tipo STRU_FRMWRK_PARAMETROS
// astr_parametros.String[1] = Nombre del parámetro
// astr_parametros.String[2] = Cadena con la instrucción u objeto para generar
// la lista de datos a asignar al parámetro

// No retorna ningún valor
//************************************************************************

STRU_FRMWRK_PARAMETROS	lstr_datastore
DATASTORE					lds_lista
STRING						ls_parametro, ls_datos, ls_codigo, ls_descripcion
INTEGER						li_fila, li_filas

ls_parametro = astr_parametros.String[1]
ls_datos = astr_parametros.String[2]

// Crea una datastore local con el SQL o la Datawindow enviada como datos de la lista 
lstr_datastore.String[1] = ls_datos
lstr_datastore.String[2] = ' la lista para el parámetro ' + ls_parametro
lds_lista = f_crear_datastore(lstr_datastore) //ojo que estaba comentado por david

// Si no hubo error al crear la lista
IF IsValid(lds_lista) THEN
	// Conecta la lista a la base de datos
	lds_lista.SetTransObject(sqlca)											
	// Recupera los datos	
	li_filas = lds_lista.Retrieve()
	// Si la lista contiene registros
	IF li_filas > 0 THEN
		ls_datos = ''			
		// Hace un ciclo para recorrer cada uno de los registros de la lista
		DO WHILE li_fila < li_filas
			li_fila ++
			// Extrae el dato de visualización de la lista 
			ls_codigo = Trim(lds_lista.GetItemString(li_fila,'codigo'))
			// Extrae el código del dato que corresponde al dato de visualización de la lista 
			ls_descripcion = Trim(lds_lista.GetItemString(li_fila,'descripcion'))
			
			IF Not IsNull(ls_codigo) AND Len(ls_codigo) > 0 AND &
				Not IsNull(ls_descripcion) AND Len(ls_descripcion) > 0 THEN
				ls_datos = ls_datos + ls_descripcion + '~t' + ls_codigo + '/'			
			END IF
		LOOP

	ELSE
		MessageBox("Información","La lista de datos del parámetro " + ls_parametro + " está vacía.",Information!)																				
		SetNull(ls_datos)
	END IF
ELSE
	MessageBox("Información","La lista de datos del parámetro " + ls_parametro + " está vacía.",Information!)																				
	SetNull(ls_datos)
END IF

// Destruye la datastore local
Destroy lds_lista

Return ls_datos
end function

public function integer uf_asignar_descripcion_parametro (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	David Felipe Arango F. 2005/01/11

//	Esta función, se usa para asignar la descripción(valor de visualizacion)
// de un parámetro de la lista.

//	Recibe como parámetro la estructura astr_parametros de tipo STRU_FRMWRK_PARAMETROS
// la cual contiene los siguientes parámetros:

// astr_parametros.String[1] = Nombre del parámetro al cual se le quiere
// asignar la descripción

//	Retorna un Integer con el resultado de la asignación de la descripción 
// (-1 error 1 exito)
//************************************************************************

BOOLEAN						lb_nulo
INTEGER						li_parametro, li_parametros, li_retorno
STRING						ls_parametro, ls_descripcion

li_parametros = This.RowCount()
ls_parametro = Upper(astr_parametros.String[1])

IF li_parametros > 0 THEN
	This.AcceptText()	
	li_parametro = This.Find("Upper(nombre_parametro) = '" + ls_parametro + "'",1,li_parametros)	
	IF li_parametro > 0 THEN	
		li_retorno = -1
		lb_nulo = True			
		CHOOSE CASE Upper(This.GetItemString(li_parametro,'tipo_parametro'))
	
			CASE 'DA' // Fecha
				IF Not IsNull(astr_parametros.Date[1]) THEN
					li_retorno = This.SetItem(li_parametro,'parametro_fecha',astr_parametros.Date[1])
					ls_descripcion = f_frmwrk_fecha_larga(astr_parametros.Date[1])
					lb_nulo = False					
				END IF
				
			CASE 'DC' // Decimal
				IF Not IsNull(astr_parametros.Decimal[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_decimal',astr_parametros.Decimal[1])
					ls_descripcion = String(astr_parametros.Long[1],'###,###,###')
					lb_nulo = False					
				END IF
				
			CASE 'DT' // Fecha Hora
				IF Not IsNull(astr_parametros.DateTime[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_fecha_hora',astr_parametros.DateTime[1])
					//ls_descripcion = String(astr_parametros.DateTime[1],'yyyy/mm/dd hh:mm')					
					ls_descripcion = String(astr_parametros.DateTime[1],is_formato_fecha+' hh:mm')					
					
					lb_nulo = False					
				END IF
				
			CASE 'LS' // Lista (puede ser SQL, DW o LV)	
				IF Not IsNull(astr_parametros.String[2]) THEN				
					li_retorno = This.SetItem(li_parametro,'display_lista',astr_parametros.String[2])
					ls_descripcion = astr_parametros.String[2]
					lb_nulo = False					
				END IF
				
			CASE 'NM' // Número
				IF Not IsNull(astr_parametros.Long[1]) THEN								
					li_retorno = This.SetItem(li_parametro,'parametro_numero',astr_parametros.Long[1])
					ls_descripcion = String(astr_parametros.Long[1],'###,###,###')					
					lb_nulo = False					
				END IF
				
			CASE 'ST' // String
				IF Not IsNull(astr_parametros.String[2]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_string',astr_parametros.String[2])
					ls_descripcion = astr_parametros.String[2]					
					lb_nulo = False					
				END IF
				
			CASE 'TM' // Hora
				IF Not IsNull(astr_parametros.Time[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_hora',astr_parametros.Time[1])
					ls_descripcion = String(astr_parametros.Time[1],'hh:mm')					
					lb_nulo = False					
				END IF
				
		END CHOOSE
		
		IF lb_nulo THEN
			MessageBox("Información","El valor del parámetro " + ls_parametro + " es nulo, por favor seleccione o asigne un valor al parámetro e intente de nuevo.",Information!)																							
		ELSE
			IF li_retorno = 1 THEN
				This.SetItem(li_parametro,'descripcion_parametro',ls_descripcion)			
			END IF	
		END IF		
	ELSE
		MessageBox("Información","El parámetro " + ls_parametro + " no existe.",Information!)																							
	END IF
END IF

This.AcceptText()

Return li_retorno
end function

public function string uf_obtener_tipo_parametro (stru_frmwrk_parametros astr_parametro);//************************************************************************
//	David Felipe Arango F. 2005/01/19

//	Esta función, se usa para recuperar el tipo de un parámetro de la lista.

//	Recibe como parámetro la estructura astr_parametros de tipo STRU_FRMWRK_PARAMETROS
// la cual contiene los siguientes parámetros:

// astr_parametros.String[1] = Nombre del parámetro del cual se quiere recuperar
// el tipo

//	Retorna un string con el valor del parametro seleccionado.
//************************************************************************

INTEGER						li_parametro, li_parametros
STRING						ls_tipo_parametro

li_parametros = This.RowCount()
astr_parametro.String[1] = Upper(astr_parametro.String[1])

IF li_parametros > 0 THEN
	This.AcceptText()	
	li_parametro = This.Find("Upper(nombre_parametro) = '" + astr_parametro.String[1] + "'",1,li_parametros)	
	IF li_parametro > 0 THEN	
		ls_tipo_parametro = Upper(This.GetItemString(li_parametro,'tipo_parametro'))
		
		IF UpperBound(astr_parametro.Boolean) >= 1 THEN
			IF astr_parametro.Boolean[1] THEN		
				IF IsNull(ls_tipo_parametro) OR Len(ls_tipo_parametro) = 0 THEN
					MessageBox("Información","El tipo del parámetro " + astr_parametro.String[1] + " es nulo, por favor revise la definición del parámetro e intente de nuevo.",Information!)																												
				END IF		
			END IF
		END IF
	ELSE
		MessageBox("Información","El parámetro " + astr_parametro.String[1] + " no existe.",Information!)																							
	END IF
END IF

Return ls_tipo_parametro
end function

public subroutine uf_reconstruir_lista (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	David Felipe Arango F. 2005/01/11

//	Esta función, se usa para reconstruir una lista existente con unos nuevos
// datos con base en un dato seleccionado en otra lista.

//	Recibe como parámetro la estructura astr_parametros de tipo STRU_FRMWRK_PARAMETROS
// astr_parametros.String[1] = Nombre del parámetro al cual se le va a reconstruir
// la lista de datos

// astr_parametros.String[2] = Cadena que contiene la instruccion SQL que
// extrae la lista de datos a asignar al parámetro 

//	No retorna ningún valor
//************************************************************************

STRU_FRMWRK_PARAMETROS	lstr_lista, lstr_parametros
INTEGER						li_parametro_seleccionado, li_fila_lista
STRING						ls_parametro, ls_tipo_parametro, ls_lista

//MessageBox("Información","La función reconstruir lista del User Object de parámetros esta desactivada.",Information!)
ls_parametro = Upper(astr_parametros.String[1])

// Busca la fila en la que se encuentra el parámetro seleccionado
li_parametro_seleccionado = This.Find("Upper(nombre_parametro) = '" + ls_parametro + "'",1,This.RowCount())

// Recupera el tipo de parámetro
ls_tipo_parametro = Upper(This.GetItemString(li_parametro_seleccionado,'tipo_parametro'))

// Valida que el tipo de parametro a procesar sea una lista
IF ls_tipo_parametro = 'LS' THEN
	IF Not IsNull(ls_parametro) AND Len(ls_parametro) > 0 THEN			
		// Busca el parámetro en la datastore de instancia que almacena los parámetros de
		// tipo lista y los datos de cada una de las listas	
		li_fila_lista = iuo_ds_lista.Find("Upper(codigo) = '" + ls_parametro + "'",1,iuo_ds_lista.RowCount())
		
		IF li_fila_lista > 0 THEN
			lstr_lista.String[1] = ls_parametro
			lstr_lista.String[2] = astr_parametros.String[2]			
			ls_lista = uf_construir_lista(lstr_lista)							
			IF iuo_ds_lista.GetItemString(li_fila_lista,'descripcion') <> ls_lista THEN
				// Limpia los valores asignados
				lstr_parametros.String[1] = ls_parametro
				lstr_parametros.String[2] = ''
				uf_asignar_valor_parametro(lstr_parametros)
				uf_asignar_descripcion_parametro(lstr_parametros)			
				// Asigna la nueva lista
				iuo_ds_lista.SetItem(li_fila_lista,'descripcion',ls_lista)
				This.Modify('parametro_lista.Values="' + ls_lista +'"' ) //Ojo siempre trabajar con '"' no con "'"
			END IF				
		ELSE
			MessageBox("Información","No se encontro el parámetro " + ls_parametro + " para asignar los datos de la lista.",Information!)																										
		END IF
	END IF
ELSE
	MessageBox("Información","El parámetro " + ls_parametro + " no es de tipo lista (LS), no es posible reasiganrlo.",Information!)																										
END IF		

end subroutine

public function string uf_obtener_descripcion_parametro (stru_frmwrk_parametros astr_parametro);//************************************************************************
//	David Felipe Arango F. 2005/01/11

//	Esta función, se usa para recuperar la descripción (valor de visualización)
// de un parámetro de la lista.

//	Recibe como parámetro la estructura astr_parametros de tipo STRU_FRMWRK_PARAMETROS
// la cual contiene los siguientes parámetros:

// astr_parametros.String[1] = Nombre del parámetro del cual se quiere recuperar
// la descripción

//	Retorna un string con el valor del parametro seleccionado.
//************************************************************************

INTEGER						li_parametro, li_parametros
STRING						ls_parametro

li_parametros = This.RowCount()
astr_parametro.String[1] = Upper(astr_parametro.String[1])

IF li_parametros > 0 THEN
	This.AcceptText()	
	li_parametro = This.Find("Upper(nombre_parametro) = '" + astr_parametro.String[1] + "'",1,li_parametros)	
	IF li_parametro > 0 THEN	
		CHOOSE CASE Upper(This.GetItemString(li_parametro,'tipo_parametro'))
	
			CASE 'LS' // Lista (puede ser SQL, DW o LV)	
				ls_parametro = Upper(Trim(This.GetItemString(li_parametro,'display_lista')))
														
			CASE ELSE // Si es cualquier otro tipo de parámetro
				ls_parametro = Upper(Trim(This.GetItemString(li_parametro,'descripcion_parametro')))
				
		END CHOOSE
		
		IF UpperBound(astr_parametro.Boolean) >= 1 THEN
			IF astr_parametro.Boolean[1] THEN
				IF IsNull(ls_parametro) OR Len(ls_parametro) = 0 THEN
					MessageBox("Información","La descripción del parámetro " + astr_parametro.String[1] + " es nula, por favor seleccione o asigne una descripción al parámetro e intente de nuevo.",Information!)																															
				END IF		
			END IF
		END IF
	ELSE
		MessageBox("Información","El parámetro " + astr_parametro.String[1] + " no existe.",Information!)																															
		SetNull(ls_parametro)
	END IF
END IF

Return ls_parametro
end function

public function boolean uf_validar_parametros (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	David Felipe Arango F. 2005/01/12

//	Esta función, se usa para validar si alguno o todos los parametros de la 
// lista son nulos o vacios.

//	Recibe como parámetro la estructura astr_parametros de tipo STRU_FRMWRK_PARAMETROS
// la cual contiene los siguientes parámetros:

// astr_parametros.String[] = Nombre del parámetro del que se quiere validar el
// contenido.
// En caso de que el arreglo de tipo String no tenga el nombre de ningún parámetro
// se valida la completitud de los parámetros visualizados en la datawindow
// de parámetros, en el caso de que tenga el nombre de uno o más parámetros
// asignado se validan solo parámetros cuyo nombre corresponda al enviado en 
// el arreglo String[]

// astr_parametros.Boolean[1] = Despliega mensaje en caso de que uno de los parámetros
// evaluados sea nulo o vacio
// Solo se despliega el mensaje si este parámetro es Verdadero (True)

//	Retorna un boleano que indica si existen valores nulos (False)
// o los valores de los parámetros son válidos (True)
//************************************************************************

STRU_FRMWRK_PARAMETROS	lstr_parametro, lstr_parametros
BOOLEAN						lb_retorno
INTEGER						li_parametro, li_parametros

li_parametros = UpperBound(astr_parametros.String)

IF li_parametros = 0 THEN
	li_parametros = This.RowCount()	
END IF	

lb_retorno = False

IF li_parametros > 0 THEN
	lb_retorno = True
	DO WHILE li_parametro < li_parametros
		li_parametro++

		lstr_parametro.String[1] = This.GetItemString(li_parametro,'nombre_parametro')		

		IF UpperBound(astr_parametros.String) > 0 THEN
			lstr_parametro.String[1] = astr_parametros.String[li_parametro]
		END IF		

		lstr_parametro.String[1] = Upper(lstr_parametro.String[1])
		
		lstr_parametros.String[li_parametro] = This.uf_obtener_valor_parametro(lstr_parametro)
		
		IF IsNull(lstr_parametros.String[li_parametro]) OR Len(lstr_parametros.String[li_parametro]) = 0 THEN
			IF UpperBound(astr_parametros.String) > 0 THEN
				li_parametro = This.Find("Upper(nombre_parametro) = '" + lstr_parametro.String[1] + "'",1,li_parametros)
			END IF
			This.ScrollToRow(li_parametro)			
			li_parametro = li_parametros + 100			
		END IF	
	LOOP

	IF li_parametro = li_parametros + 100 THEN
		IF UpperBound(astr_parametros.Boolean) >= 1 THEN
			IF astr_parametros.Boolean[1] THEN
				MessageBox("Información","El parámetro " + lstr_parametro.String[1] + " seleccionado no puede ser nulo o vacío.",Information!)																																			
				This.SetFocus()
			END IF	
		END IF
		lb_retorno = False
	END IF		
END IF	

Return lb_retorno
end function

public function integer uf_asignar_descripcion_parametro_bck0703 (stru_frmwrk_parametros astr_parametros);//************************************************************************
//	David Felipe Arango F. 2005/01/11

//	Esta función, se usa para asignar la descripción(valor de visualizacion)
// de un parámetro de la lista.

//	Recibe como parámetro la estructura astr_parametros de tipo STRU_FRMWRK_PARAMETROS
// la cual contiene los siguientes parámetros:

// astr_parametros.String[1] = Nombre del parámetro al cual se le quiere
// asignar la descripción

//	Retorna un Integer con el resultado de la asignación de la descripción 
// (-1 error 1 exito)
//************************************************************************

BOOLEAN						lb_nulo
INTEGER						li_parametro, li_parametros, li_retorno
STRING						ls_parametro

li_parametros = This.RowCount()
ls_parametro = Upper(astr_parametros.String[1])

IF li_parametros > 0 THEN
	This.AcceptText()	
	li_parametro = This.Find("Upper(nombre_parametro) = '" + ls_parametro + "'",1,li_parametros)	
	IF li_parametro > 0 THEN	
		li_retorno = -1
		lb_nulo = True			
		CHOOSE CASE Upper(This.GetItemString(li_parametro,'tipo_parametro'))
	
			CASE 'DA' // Fecha
				IF Not IsNull(astr_parametros.Date[1]) THEN
					li_retorno = This.SetItem(li_parametro,'parametro_fecha',astr_parametros.Date[1])
					lb_nulo = False					
				END IF
				
			CASE 'DC' // Decimal
				IF Not IsNull(astr_parametros.Decimal[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_decimal',astr_parametros.Decimal[1])
					lb_nulo = False					
				END IF
				
			CASE 'DT' // Fecha Hora
				IF Not IsNull(astr_parametros.DateTime[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_fecha_hora',astr_parametros.DateTime[1])
					lb_nulo = False					
				END IF
				
			CASE 'LS' // Lista (puede ser SQL, DW o LV)	
				IF Not IsNull(astr_parametros.String[2]) THEN				
					li_retorno = This.SetItem(li_parametro,'display_lista',astr_parametros.String[2])
					lb_nulo = False					
				END IF
				
			CASE 'NM' // Número
				IF Not IsNull(astr_parametros.Long[1]) THEN								
					li_retorno = This.SetItem(li_parametro,'parametro_numero',astr_parametros.Long[1])
					lb_nulo = False					
				END IF
				
			CASE 'ST' // String
				IF Not IsNull(astr_parametros.String[2]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_string',astr_parametros.String[2])
					lb_nulo = False					
				END IF
				
			CASE 'TM' // Hora
				IF Not IsNull(astr_parametros.Time[1]) THEN				
					li_retorno = This.SetItem(li_parametro,'parametro_hora',astr_parametros.Time[1])
					lb_nulo = False					
				END IF
				
		END CHOOSE
		
		IF lb_nulo THEN
			MessageBox("Información","El valor del parámetro " + ls_parametro + " es nulo, por favor seleccione o asigne un valor al parámetro e intente de nuevo.",Information!)																							
		END IF		
	ELSE
		MessageBox("Información","El parámetro " + ls_parametro + " no existe.",Information!)																							
	END IF
END IF

This.AcceptText()

Return li_retorno
end function

on uo_frmwrk_datawindow_parametros.destroy
call super::destroy
end on

event destructor;//************************************************************************
//	David Felipe Arango F. 2004/09/21
//
//	Este evento NO SE DEBE SOBRESCRBIR, se usa para destruir la datastore de
// instancia que almacena los parámetros de tipo lista y los datos de cada
// una de las listas  para liberar la memoria
//
//************************************************************************

// Destruye el User Object de instancia que almacena la lista de parametros
// de tipo lista con sus datos

IF IsValid(iuo_ds_lista) THEN
	Destroy iuo_ds_lista	
END IF	

IF IsValid(iuo_calendario) THEN
	Destroy iuo_calendario	
END IF	

GarbageCollect()
end event

event constructor;//************************************************************************
//	David Felipe Arango 2004/09/21
//
//	Este evento NO SE DEBE SOBRESCRBIR, se usa para hacer invisible la ventana
// de parámetros  hasta que este configurada
//
//	Para la implementacion de la ventana de parámetros se debe hacer lo siguiente:
//
// 1 - Ingresar los parametros en la datawindow d_frmwrk_parametros abriendo esta en
// diseño y seleccionando la oción de menú rows\data, se deben tratar de ingresar
// valores para todas las columnas, aunque solo son requeridos los valores para las 
// columnas nombre_parametro y tipo_parametro 
// 2 - Crear un control de tipo UserObject
// 3 - Asignar al control el UserObject uo_frmwrk_datawindow_parametros
// 4 - Crear en el evento ue_postopen o en el evento open un variable de tipo
// 	 STRU_FRMWRK_PARAMETROS
// 5 - Asignar a la estructura los datos de los parámetros que se requieren de 
// acuerdo a los siguiente:
//
// NOTA:
// La lista de parámetros se ordenará en el orden en que se ingresen los parámetros
// en la estructura.
// 
// ***************    PROPIEDADES DE LA ESTRUCTURA   ***************
// s_parametro[] 
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio del corte'
// Tipo: String
// Sensitivo: No
// Requerido: Si
// Se usa para enviar el nombre del parámetro que se quiere activar 
// (asignación simple), puede enviarse tambien en este la descripción
// del parametro que se quiere que aparezca en la lista (asignación compuesta)
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros

// s_tipo_parametro[]
// Ej asignación número: 'NM'
// Ej asignación lista: 'LS'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si existe dos parametros con el mismo nombre y diferente tipo.
// Se usa para enviar el tipo del parámetro que se quiere activar.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros.

//			TIPOS DE DATOS DE LOS PARAMETROS
// 'DA' Fecha
// 'DC' Decimal
// 'DT' Fecha Hora
// 'LS' Lista (puede ser SQL, DW o LV)	
// 'NM' Número Entero
// 'ST' String
// 'TM' Hora

// s_lista_valores[]
// Ej asignación: 'DW=d_lista_empleados'
// Tipo: String
// Sensitivo: No
// Requerido: Solo si el tipo de parámetro es lista (LS) y se quiere asignar
// una lista de datos diferente a la que tiene el parámetro por defecto.
// Se usa para enviar el tipo de la lista de datos que se quiere activar 
// debe enviarse tambien en este la lista de datos que se quiere que aparezca
// asignada en la lista, la asignación siempre debe ser compuesta.
// Este dato debe haber sido matriculado previamente en la datawindow de
// parámetros d_frmwrk_parametros si se quiere llamar una lista por defecto.

// s_valor_x_defecto[]
// Ej asignación simple: 'Fecha Inicial'
// Ej asignación compuesta: 'Fecha Inicial=fecha de inicio del corte'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar, en el
// caso de las lista este debe corresponder a algunos de los valores de la
// lista.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// s_micro_ayuda[]
// Ej asignación: 'haga click en la fecha para desplegar el calendario'
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para enviar el valor por defecto que se quiere asignar en la
// micro ayuda.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros.

// b_ventana_seleccion[]
// Ej asignación: True (pone visible el icono de zoom) 
//	False (pone invisible el icono de zoom), esta propiedad se valida en el
// evento ue_activar_ventana_seleccion para la activación de las listas
// Tipo: Boolean
// Sensitivo: No
// Requerido: No
// Se usa para activar el icono de zoom y permitir que se ejecute el evento
// ue_activar_ventana_seleccion que activa las ventanas de selección de datos, esta activación
// programarse en el evento ue_activar_ventana_seleccion.
// No debe haber sido matriculado con anterioridad en la datawindow de
// parámetros d_frmwrk_parametros, pero si debe programarse la activación de
// la ventana de selección en ue_activar_ventana_selección.

// s_mascara[]
// Ej asignación: ####
// Solo permite digitar cuatro (4) números en una casilla de tipo texto 
// Tipo: String
// Sensitivo: No
// Requerido: No
// Se usa para activar asignar una mascara específica al parámetro

// ***************    EJEMPLO DE IMPLEMENTACION DE LA VENTANA DE PARAMETROS    ***************

// stru_frmwrk_parametros_reportes str_parametros

// str_parametros.s_parametro[1] = 'fecha inicial=fecha de inicio del proceso'
// str_parametros.s_tipo_parametro[1] = 'DA'
//
// str_parametros.s_parametro[2] = 'fecha final'
// str_parametros.s_tipo_parametro[2] = 'DA'
//
// str_parametros.s_parametro[3] = 'lista SQL'
// str_parametros.s_tipo_parametro[3] = 'LS'
// str_parametros.s_lista_valores[3] = "SQL=SELECT '1' CODIGO, 'AZUL' DESCRIPCION FROM DUAL UNION SELECT '2', 'ROJO' FROM DUAL UNION SELECT '3', 'VERDE' FROM DUAL"
// str_parametros.s_valor_x_defecto[3] = 'ROJO'
//
// str_parametros.s_parametro[4] = 'lista DW'
// str_parametros.s_tipo_parametro[4] = 'LS'
// str_parametros.s_lista_valores[4] = "DW=d_prueba_lista"
//
//str_parametros.s_parametro[5] = 'lista VALORES'
//str_parametros.s_tipo_parametro[5] = 'LS'
//str_parametros.s_lista_valores[5] = "LV=SI	S/NO	N/TODOS	T/NINGUNO	N/"
//str_parametros.s_valor_x_defecto[5] = 'TODOS'

//str_parametros.s_parametro[5] = 'Documento de identificación'
//str_parametros.s_tipo_parametro[5] = 'ST'
//str_parametros.s_mascara[5] = '@##############'
//
// Esta mascara limita la digitación a que el primero sea alfanúmerico
// y el resto sean solo números

// inv_objtr = nv_globales.nf_obtener_objtr()

n_cst_configuracion_regional	ln_cst_configuracion_regional

ln_cst_configuracion_regional= CREATE n_cst_configuracion_regional
is_formato_fecha= ln_cst_configuracion_regional.of_get_formato_fecha_corta( )

This.Object.display_fecha.Expression="String(parametro_fecha,'"+ is_formato_fecha+"')"
This.Visible = False
end event

event doubleclicked;call super::doubleclicked;//************************************************************************
//	David Felipe Arango F. 2004/09/21
//
//	Este evento NO SE DEBE SOBRESCRBIR, se usa para asignar el foco a la fila
// en la cual se hizo click o doble click
//
//************************************************************************

// Valida el click sea sobre un registro de la datawindow
IF row > 0 THEN
	ii_fila_enter = Row 	
	// Mueve el foco a la fila sobre la cual se hizo click	
	This.ScrollToRow(row)
	// Asigna el cursor a la fila sobre la cual se hizo click	
	This.SetRow(row)
END IF
end event

event clicked;call super::clicked;//************************************************************************
//	David Felipe Arango F. 2004/09/21
//
//	Este evento NO SE DEBE SOBRESCRBIR, se usa para construir las listas de
// parámetros de la ventana dinamicamente de acuerdo a los parámetros enviados.
//
//************************************************************************

// Valida el click sea sobre un registro de la datawindow
IF row > 0 THEN
	This.SetRedraw(False)
	// Si el parámetro es de tipo lista de datos asigna la lista
	// correspondiente al campo especifico
	uf_asignar_lista(row)
	This.SetRedraw(True)
	ii_fila_enter = Row 

	This.PostEvent("ue_post_clicked")		
END IF
end event

event rowfocuschanged;//************************************************************************
//	David Felipe Arango F. 2005/01/04

//	Este evento se DEBE CONSERVAR SOBRESCRITO SIN EXTENDER DEL PADRE (UO_FRMWRK_DATAWINDOW),
// y NO SE DEBE SOBRESCRIBIR ESTE en las nuevas herencias que se hagan, 
// se usa para asignar el foco a la lista cuando el parámetro seleccionado 
// despliega el calendario o para ocultar el calendario cuando se encontraba
// el foco en un parámetro que despliega el calendario y se hace click en un
// parámetro diferente.
// Actualiza las variables de instacia que almacenan la fila actual y el tipo
// y le tipo del parámetro almacenado en esta.


//	Recibe como parámetro el número de la fila actual seleccionada as_fila_actual
// de tipo integer

//	No retorna ningún valor
//************************************************************************

IF currentrow > 0 THEN
	uf_asignar_foco(currentrow)
END IF	
	
end event

event itemchanged;//************************************************************************
////	David Felipe Arango F. 2005/01/06
////
////	Este evento se DEBE CONSERVAR SOBRESCRITO SIN EXTENDER DEL PADRE (UO_FRMWRK_DATAWINDOW),
//// y NO SE DEBE SOBRESCRIBIR ESTE en las nuevas herencias que se hagan, 
//// se usa para guardar los valores anteriores de la columna modificada en 
//// variables de instancia para que en caso de error se puedan reasignar los
//// valores anteriores, para las listas se usa adicionalmente para asignar la 
//// descripción seleccionada en la lista al campo display lista cuando se 
//// crea una nueva lista dinamicamente, ya que se pierde la descripción
//// seleccionada de la ultima lista creada.
////
////************************************************************************

STRING	ls_valor, ls_descripcion, ls_display

data = Trim(data)

IF Not IsNull(data) AND Len(data) > 0 THEN
	ii_fila_dato_anterior = row

	ls_valor = data

	CHOOSE CASE Upper(This.GetItemString(row,'tipo_parametro'))
	
		CASE 'DA' // Fecha
			ida_valor_anterior = This.GetItemDate(row,'parametro_fecha')			
			IF (IsNull(ida_valor_anterior) AND Len(data) > 0) OR &
				(ida_valor_anterior <> Date(data)) THEN	
				This.SetItem(row,'parametro_fecha',Date(data))
				ls_descripcion = f_frmwrk_fecha_larga(Date(data))
			END IF
	
		CASE 'DC' // Decimal
			idc_valor_anterior = This.GetItemDecimal(row,'parametro_decimal')
			
		CASE 'DT' // Fecha Hora
			idt_valor_anterior = This.GetItemDateTime(row,'parametro_fecha_hora')
				
		CASE 'LS' // Lista (puede ser SQL, DW o LV)	
			ils_display_anterior = This.GetItemString(row,'display_lista')		
			ils_valor_anterior = This.GetItemString(row,'parametro_lista')		 
			This.AcceptText()
			ls_display = This.GetItemString(row,'cf_display_lista')
			IF (IsNull(ils_valor_anterior) AND Len(data) > 0) OR &
				(ils_valor_anterior <> data) THEN	
				This.SetItem(row,'display_lista',ls_display)
			END IF
				
			IF ls_valor = '%' THEN
				ls_descripcion = Upper('TODOS LOS ' + This.GetItemString(row,'nombre_parametro') + 'S') 
			ELSE
				ls_descripcion = Upper('SOLO CON ' + This.GetItemString(row,'nombre_parametro') + ' ' + ls_display)
			END IF
				
		CASE 'NM' // Número
			inm_valor_anterior = This.GetItemNumber(row,'parametro_numero')
			
		CASE 'ST' // String
			ist_valor_anterior = This.GetItemString(row,'parametro_string')
			
		CASE 'TM' // Hora
			itm_valor_anterior = This.GetItemTime(row,'parametro_hora')
			
	END CHOOSE
	
	This.SetItem(row,'descripcion_parametro',ls_descripcion)

END IF
end event

event rbuttondown;DATE		lda_null
DATETIME	ldt_null
DECIMAL	ldc_null
INTEGER	li_fila_lista, li_posicion, li_posicion_aux
LONG		lnm_null
STRING	lst_null, ls_valor_x_defecto, ls_descripcion_x_defecto, ls_tipo_parametro, ls_lista, ls_codigo
TIME		ltm_null

IF row > 0 THEN		
	// Si existe un valor por defecto verifica que tambien exista una descripción por defecto
	// si existe verifica el tipo del parámetro y le asigna el dato del valor por defecto a la
	// columna del tipo correspondiente
	
	ls_valor_x_defecto = Upper(Trim(This.GetItemString(row,'valor_x_defecto')))	
	ls_descripcion_x_defecto = Upper(Trim(This.GetItemString(row,'descripcion_x_defecto')))

	IF Not IsNull(ls_valor_x_defecto) AND Len(ls_valor_x_defecto) > 0 AND &
		Not IsNull(ls_descripcion_x_defecto) AND Len(ls_descripcion_x_defecto) > 0 THEN

		This.SetItem(row,'descripcion_parametro',ls_descripcion_x_defecto)
		ls_tipo_parametro = Trim(This.GetItemString(row,'tipo_parametro'))	
		
		IF Not IsNull(ls_tipo_parametro) AND Len(ls_tipo_parametro) > 0 THEN

			CHOOSE CASE ls_tipo_parametro
	
				CASE 'DA' // Fecha
					IF ls_valor_x_defecto = 'NULO' THEN
						SetNull(lda_null)
						This.SetItem(row,'parametro_fecha',lda_null)										
					ELSE
						This.SetItem(row,'parametro_fecha',Date(ls_valor_x_defecto))
					END IF
					
				CASE 'DC' // Decimal
					IF ls_valor_x_defecto = 'NULO' THEN
						SetNull(ldc_null)
						This.SetItem(row,'parametro_decimal',ldc_null)	
					ELSE
						This.SetItem(row,'parametro_decimal',Dec(ls_valor_x_defecto))
					END IF
					
				CASE 'DT' // Fecha Hora
					IF ls_valor_x_defecto = 'NULO' THEN
						SetNull(ldt_null)
						This.SetItem(row,'parametro_fecha_hora',ldt_null)
					ELSE
						This.SetItem(row,'parametro_fecha_hora',DateTime(ls_valor_x_defecto))
					END IF
					
				CASE 'LS' // Lista (puede ser SQL, DW o LV)
					// Recupera los datos de la lista que corresponde al parámetro 	
					ls_lista = This.GetItemString(row,'lista_valores')
					// Busca el dato correspondiente al codigo que se debe asignar por defecto
					li_posicion = Pos(ls_lista,ls_valor_x_defecto)
					li_posicion_aux = Pos(ls_lista,'/',li_posicion + 1)
					li_posicion = Pos(ls_lista,'~t',li_posicion + 1) + 1
					ls_codigo = Mid(ls_lista,li_posicion,li_posicion_aux - li_posicion)															
					// Asigna los datos del codigo y la descripción por defecto a la columnas
					// correspondientes
					This.SetItem(row,'display_lista',Upper(ls_descripcion_x_defecto))																			
					This.SetItem(row,'parametro_lista',Upper(ls_codigo))
															
				CASE 'NM' // Número Entero
					IF ls_valor_x_defecto = 'NULO' THEN
						SetNull(lnm_null)
						This.SetItem(row,'parametro_numero',lnm_null)
					ELSE
						This.SetItem(row,'parametro_numero',Long(ls_valor_x_defecto))
					END IF
					
				CASE 'ST' // String
					IF ls_valor_x_defecto = 'NULO' THEN
						SetNull(lst_null)
						This.SetItem(row,'parametro_string',lst_null)
					ELSE										
						This.SetItem(row,'parametro_string',Upper(ls_valor_x_defecto))
					END IF	
					
				CASE 'TM' // Hora
					IF ls_valor_x_defecto = 'NULO' THEN
						SetNull(ltm_null)
						This.SetItem(row,'parametro_hora',ltm_null)
					ELSE																				
						This.SetItem(row,'parametro_hora',Time(ls_valor_x_defecto))
					END IF											
					
			END CHOOSE	
		END IF	
	END IF	
END IF

end event

on uo_frmwrk_datawindow_parametros.create
call super::create
end on

