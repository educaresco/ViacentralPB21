$PBExportHeader$uo_frmwrk_datawindow.sru
forward
global type uo_frmwrk_datawindow from datawindow
end type
end forward

shared variables

end variables

global type uo_frmwrk_datawindow from datawindow
int Width=82
int Height=72
int TabOrder=1
event ue_dato_anterior_dw ( )
event ue_tecla_presionada pbm_dwnkey
event ue_asignar_dato ( )
end type
global uo_frmwrk_datawindow uo_frmwrk_datawindow

type variables
STRU_FRMWRK_PARAMETROS	istr_datos
BOOLEAN			ib_ordenar = False, &
				ib_filtro_activos = False, &
				ib_resaltar_fila = False
DATE				id_anterior
DATETIME			idt_anterior
DECIMAL{2}			idc_anterior
KEYCODE			ik_dwtecla
LONG				il_fila, &
				il_fila_anterior
STRING 				is_campo, &
				is_tipo_dato, &
				is_anterior, &
				is_columna_orden, &
				is_tipo_orden, &
				is_filtro_activos
WINDOW			iw_dwventana
end variables

forward prototypes
public subroutine uof_leer_dato_anterior ()
end prototypes

event ue_dato_anterior_dw;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//
// Nota: antes de realizar el proceso de validación del dato pero dentro del 
// evento de ItemChanged se debe invocar la funcion uof_leer_dato_anterior
//************************************************************************

This.SetColumn(is_campo)
This.SetFocus()

CHOOSE CASE Upper(is_tipo_dato)

	CASE 'DATE'
		This.SetItem(il_fila_anterior,is_campo,id_anterior)

	CASE 'DATETIME'
		This.SetItem(il_fila_anterior,is_campo,idt_anterior)

	CASE 'STRING', 'CHAR'
		This.SetItem(il_fila_anterior,is_campo,is_anterior)

	CASE 'DECIMAL', 'DOUBLE', 'LONG', 'INTEGER', 'NUMBER'
		This.SetItem(il_fila_anterior,is_campo,idc_anterior)

END CHOOSE

This.SetFocus()
end event

event ue_tecla_presionada;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//************************************************************************

ik_dwtecla = key
iw_dwventana.PostEvent("ue_teclas")

end event

event ue_asignar_dato;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//
// Este script debe ser adicionado en este evento en los objetos que se  
// hereden de este 
//
//	CHOOSE CASE istr_datos.String[1]
//		
//		CASE 'DATE'	
//			This.SetItem(istr_datos.Integer[1],istr_datos.String[2],istr_datos.Date[1])
//		CASE 'DEC'
//			This.SetItem(istr_datos.Integer[1],istr_datos.String[2],istr_datos.Decimal[1])		
//		CASE 'STR'
//			This.SetItem(istr_datos.Integer[1],istr_datos.String[2],Trim(istr_datos.String[3]))
//		
//	END CHOOSE
//************************************************************************
end event

public subroutine uof_leer_dato_anterior ();INTEGER li_posicion

il_fila_anterior = This.GetRow()
is_tipo_dato = This.Describe(is_campo+".ColType")

li_posicion = Pos(is_tipo_dato,'(')

IF li_posicion > 0 THEN
	is_tipo_dato = Left(is_tipo_dato,li_posicion - 1) 
END IF

CHOOSE CASE Upper(is_tipo_dato)
		
	CASE 'DATE'
		id_anterior = This.GetItemDate(il_fila_anterior,is_campo)

	CASE 'DATETIME'
		idt_anterior = This.GetItemDateTime(il_fila_anterior,is_campo)

	CASE 'STRING', 'CHAR'
		is_anterior = This.GetItemString(il_fila_anterior,is_campo)

	CASE 'DECIMAL', 'DOUBLE', 'LONG', 'INTEGER', 'NUMBER'
		idc_anterior = This.GetItemDecimal(il_fila_anterior,is_campo)

END CHOOSE
end subroutine

event itemchanged;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//
// Este script debe ser adicionado en este evento en los objetos que se  
// hereden de este 
//
// PostEvent("ue_dato_anterior")
//************************************************************************

is_campo = This.GetColumnName()
il_fila = row
uof_leer_dato_anterior()

This.AcceptText()






end event

event itemfocuschanged;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//************************************************************************

//iw_dwventana.SetMicroHelp(This.Describe(This.GetColumnName() + '.tag'))

//iw_dwventana.SetMicroHelp('Insertanddooo')

///MessageBox("",This.Describe(This.GetColumnName() + '.tag'))
end event

event getfocus;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
//
// Este script debe ser adicionado en este evento en los objetos que se  
// hereden de este 
//
// This.iw_dwventana = iw_ventana
//************************************************************************

This.PostEvent(ItemFocusChanged!)


end event

event doubleclicked;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//************************************************************************

IF row >= 0 THEN
	is_campo = This.GetColumnName()
	il_fila = row
ELSE
	il_fila = This.GetRow()
END IF


end event

event clicked;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//************************************************************************

IF row > 0 THEN
	il_fila_anterior = row
	il_fila = row	
END IF

IF il_fila > 0 THEN 
	This.ScrollToRow(il_fila)
END IF




end event

event buttonclicked;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//************************************************************************

IF ib_ordenar = True THEN
	IF is_columna_orden = Mid(dwo.Name,4) THEN
		IF is_tipo_orden = " A" THEN
			is_tipo_orden = " D"
		ELSEIF is_tipo_orden = " D" THEN
			is_tipo_orden = " A"
		END IF
	ELSE
		is_columna_orden = Mid(dwo.Name,4)	
		is_tipo_orden = " A"
	END IF	
	This.SetSort(is_columna_orden + is_tipo_orden)
	This.Sort()

	This.SelectRow(0,False)
END IF
end event

event rowfocuschanged;//	Este evento es general para todas las datawindows que hereden de esta
// datawindow. El evento debe ser declarado en las datawindows heredadas
// como <extended>, si se hace necesario realizar algun proceso adicional
// en el evento de la datawindow que fue heredada, en caso de que sea 
// necesario reescribir el evento en el padre se debe de adicionar este 
// código en el evento de la datawindow heredada
//************************************************************************

IF ib_resaltar_fila = True THEN
	IF currentrow > 0 THEN 
		This.SelectRow(0,False)
		This.SelectRow(currentrow,True)
	END IF
END IF	
end event

