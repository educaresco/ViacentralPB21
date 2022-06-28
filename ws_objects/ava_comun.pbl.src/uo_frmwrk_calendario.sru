$PBExportHeader$uo_frmwrk_calendario.sru
forward
global type uo_frmwrk_calendario from userobject
end type
type pb_ano_siguiente from picturebutton within uo_frmwrk_calendario
end type
type pb_ano_anterior from picturebutton within uo_frmwrk_calendario
end type
type pb_mes_anterior from picturebutton within uo_frmwrk_calendario
end type
type pb_mes_siguiente from picturebutton within uo_frmwrk_calendario
end type
type sle_date from singlelineedit within uo_frmwrk_calendario
end type
type dw_calendario from datawindow within uo_frmwrk_calendario
end type
end forward

global type uo_frmwrk_calendario from userobject
integer width = 827
integer height = 720
long backcolor = 80263328
long tabtextcolor = 33554432
event ue_postconstructor ( )
pb_ano_siguiente pb_ano_siguiente
pb_ano_anterior pb_ano_anterior
pb_mes_anterior pb_mes_anterior
pb_mes_siguiente pb_mes_siguiente
sle_date sle_date
dw_calendario dw_calendario
end type
global uo_frmwrk_calendario uo_frmwrk_calendario

type variables
STRU_FRMWRK_PARAMETROS	istr_parametros
DATAWINDOW			idw_datawindow_origen
INTEGER			ii_dia, ii_mes, &
				ii_ano, &
				ii_fila_origen
STRING 				is_columna_anterior, &
				is_columna_origen
STRING 				is_formato_fecha
DATE 				id_fecha_seleccionada
end variables

forward prototypes
public function date uof_recuperar_fecha ()
public function string uof_nombre_mes (integer pi_mes)
public subroutine uof_asignar_fecha (date pd_fecha)
public subroutine uof_asignar_formato_fecha (string ps_formato_fecha)
public function integer uof_deseleccionar_columna (string ps_columna)
public function integer uof_dias_del_mes (integer pi_mes, integer pi_ano)
public subroutine uof_escribir_mes (integer pi_ano, integer pi_mes)
public subroutine uof_inicializar_calendario (date pd_fecha_inicio)
public subroutine uof_numero_de_dias (integer pi_num_dia_inicial, integer pi_num_dias)
public function integer uof_numero_mes (string ps_mes)
public function integer uof_seleccionar_columna (string ps_columna)
end prototypes

event ue_postconstructor;id_fecha_seleccionada = Date(sle_date.Text)
dw_calendario.Reset()

IF ii_dia = 0 THEN 
	ii_dia = 1
END IF	

uof_inicializar_calendario(id_fecha_seleccionada)
dw_calendario.SetFocus()
end event

public function date uof_recuperar_fecha ();Return id_fecha_seleccionada
end function

public function string uof_nombre_mes (integer pi_mes);STRING s_mes

CHOOSE CASE pi_mes
		
	CASE 1
		s_mes = "Enero"
		
	CASE 2
		s_mes = "Febrero"
		
	CASE 3
		s_mes = "Marzo"
		
	CASE 4
		s_mes = "Abril"
		
	CASE 5
		s_mes = "Mayo"
		
	CASE 6
		s_mes = "Junio"
		
	CASE 7
		s_mes = "Julio"
		
	CASE 8
		s_mes = "Agosto"
		
	CASE 9
		s_mes = "Septiembre"
		
	CASE 10
		s_mes = "Octubre"
		
	CASE 11
		s_mes = "Noviembre"
		
	CASE 12
		s_mes = "Diciembre"
		
END CHOOSE

Return s_mes
end function

public subroutine uof_asignar_fecha (date pd_fecha);IF Not IsNull(pd_fecha) THEN 
	sle_date.Text = String(pd_fecha,is_formato_fecha)
END IF
end subroutine

public subroutine uof_asignar_formato_fecha (string ps_formato_fecha);is_formato_fecha = ps_formato_fecha

IF Not IsNull(id_fecha_seleccionada) THEN 
	uof_asignar_fecha(id_fecha_seleccionada)
END IF
end subroutine

public function integer uof_deseleccionar_columna (string ps_columna);INTEGER	li_retorno
STRING	ls_retorno

li_retorno = 1

IF ps_columna <> '' THEN
	ls_retorno = dw_calendario.Modify(ps_columna + ".border=0")
	IF ls_retorno <> "" THEN 
		li_retorno = -1
	END IF
END IF

Return li_retorno
end function

public function integer uof_dias_del_mes (integer pi_mes, integer pi_ano);INTEGER	li_dias 
INTEGER	li_maximo_dia[12] = {31,28,31,30,31,30,31,31,30,31,30,31}

// Verifica si el año es bisiesto.
li_dias = li_maximo_dia[pi_mes]

IF pi_mes = 2 THEN
	// Si el año es bisiesto entonces se cambia el número de días.
	IF ((Mod(pi_ano,4) = 0 AND Mod(pi_ano,100) <> 0) OR (Mod(pi_ano,400) = 0)) THEN
		li_dias = 29
	END IF
END IF

// Retorna el número de días en el mes seleccionado
Return li_dias

end function

public subroutine uof_escribir_mes (integer pi_ano, integer pi_mes);DATE		ld_dia_1
INTEGER  li_numero_dia_1, li_dia, li_dias_del_mes
STRING	ls_mes, ls_dia

SetPointer(Hourglass!)
SetRedraw(dw_calendario,FALSE)

ii_mes = pi_mes
ii_ano = pi_ano

// VerIFicar que la instancia del día sea válida para Mes/Año
// Reduce el valor del día en 1 si este es inválido es decir, 31 se convertirá en 30
Do While Date(ii_ano,ii_mes,ii_dia) = Date(0000,1,1)
	ii_dia --
Loop

li_dias_del_mes = uof_dias_del_mes(ii_mes,ii_ano)

// Asigna la fecha que corresponbde al primer día del mes
ld_dia_1 = Date(ii_ano,ii_mes,1)

//Encontrar que día de la semana es
li_numero_dia_1 = DayNumber(ld_dia_1)

//Colocar la primera celda
li_dia = li_numero_dia_1 + ii_dia - 1

//Quitar el recuadro a la columna anterior
uof_deseleccionar_columna (is_columna_anterior)

// Asigna el título
ls_mes = uof_nombre_mes(ii_mes)
ls_mes =  ls_mes + " " + String(ii_ano)
dw_calendario.Object.st_month.Text = ls_mes

// Colocar el número de los días en la datawindow
uof_numero_de_dias(li_numero_dia_1,li_dias_del_mes)

// Definir el nombre de la celda actual
ls_dia = 'cell'+string(li_dia)
 
// Resalta la fecha actual
uof_seleccionar_columna (ls_dia)

// Guardar la columna anterior para mas adelante
is_columna_anterior = ls_dia

SetPointer(Arrow!)
dw_calendario.SetRedraw(TRUE)

end subroutine

public subroutine uof_inicializar_calendario (date pd_fecha_inicio);INT			i_numero_primer_dia, i_celda, i_dias_en_el_mes
STRING		s_mes, s_retorno, s_celda
DATE			d_primer_dia

dw_calendario.InsertRow(0)

//Colocar las variables para dia, mes y año desde la fecha que se le envió a la función
ii_mes = Month(pd_fecha_inicio)
ii_ano = Year(pd_fecha_inicio)
ii_dia = Day(pd_fecha_inicio)

//Encontrar el número de días del mes
i_dias_en_el_mes = uof_dias_del_mes(ii_mes, ii_ano)

//Encontrar la fecha del primer día del mes
d_primer_dia = Date(ii_ano, ii_mes, 1)

//Enontrar que día de la semana es el primer día del mes
i_numero_primer_dia = DayNumber(d_primer_dia)

//Colocar la primera celda en la datawindow. Es decir, la columna en la cual se desplegará el primer día del mes
i_celda = i_numero_primer_dia + ii_dia - 1

//Colocar el título del calendario con el mes y el año
s_mes = uof_nombre_mes(ii_mes) + " " + string(ii_ano)
dw_calendario.Object.st_month.text = s_mes

uof_numero_de_dias(i_numero_primer_dia, i_dias_en_el_mes)

dw_calendario.SetItem(1,i_celda,String(Day(pd_fecha_inicio)))

s_celda = 'cell'+string(i_celda)

//Mostrar el primer día en negrita (ó 3D)
uof_seleccionar_columna (s_celda)

is_columna_anterior = s_celda

end subroutine

public subroutine uof_numero_de_dias (integer pi_num_dia_inicial, integer pi_num_dias);INTEGER	li_columna, li_dias

// Asignar un dato vacio a las columnas anteriores a la del primer día del mes
FOR li_columna = 1 to pi_num_dia_inicial
	dw_calendario.SetItem(1,li_columna,"")
NEXT

// Asignar a las columnas el nombre que corresponde al número de día
FOR li_columna = 1 TO pi_num_dias
	li_dias = pi_num_dia_inicial + li_columna - 1
	dw_calendario.SetItem(1,li_dias,String(li_columna))
NEXT
	
li_dias = li_dias + 1

FOR li_columna = li_dias TO 42
	dw_calendario.SetItem(1,li_columna,"")
NEXT

uof_deseleccionar_columna(is_columna_anterior)

is_columna_anterior = ''


end subroutine

public function integer uof_numero_mes (string ps_mes);INT i_numero_mes

CHOOSE CASE ps_mes
		
	CASE "Jan"
		i_numero_mes = 1
	
	CASE "Feb"
		i_numero_mes = 2
	
	CASE "Mar"
		i_numero_mes = 3
	
	CASE "Apr"
		i_numero_mes = 4
	
	CASE "May"
		i_numero_mes = 5
	
	CASE "Jun"
		i_numero_mes = 6
	
	CASE "Jul"
		i_numero_mes = 7
	
	CASE "Aug"
		i_numero_mes = 8
	
	CASE "Sep"
		i_numero_mes = 9
	
	CASE "Oct"
		i_numero_mes = 10
	
	CASE "Nov"
		i_numero_mes = 11
	
	CASE "Dec"
		i_numero_mes = 12

END CHOOSE

Return i_numero_mes
end function

public function integer uof_seleccionar_columna (string ps_columna);INTEGER	li_retorno
STRING	ls_retorno

li_retorno = 1

IF ps_columna <> '' THEN
	ls_retorno = dw_calendario.Modify(ps_columna + ".border=1")
	IF ls_retorno <> "" THEN 
		li_retorno = -1
	END IF
END IF

Return li_retorno
end function

event constructor;istr_parametros = Message.PowerObjectParm

idw_datawindow_origen= istr_parametros.Datawindow[1]
ii_fila_origen 		= istr_parametros.Integer[1]
is_columna_origen 	= istr_parametros.String[1]

uof_asignar_formato_fecha('yyyy/mm/dd')
This.PostEvent("ue_postconstructor")
end event

on uo_frmwrk_calendario.create
this.pb_ano_siguiente=create pb_ano_siguiente
this.pb_ano_anterior=create pb_ano_anterior
this.pb_mes_anterior=create pb_mes_anterior
this.pb_mes_siguiente=create pb_mes_siguiente
this.sle_date=create sle_date
this.dw_calendario=create dw_calendario
this.Control[]={this.pb_ano_siguiente,&
this.pb_ano_anterior,&
this.pb_mes_anterior,&
this.pb_mes_siguiente,&
this.sle_date,&
this.dw_calendario}
end on

on uo_frmwrk_calendario.destroy
destroy(this.pb_ano_siguiente)
destroy(this.pb_ano_anterior)
destroy(this.pb_mes_anterior)
destroy(this.pb_mes_siguiente)
destroy(this.sle_date)
destroy(this.dw_calendario)
end on

type pb_ano_siguiente from picturebutton within uo_frmwrk_calendario
integer x = 713
integer y = 8
integer width = 101
integer height = 80
integer taborder = 30
integer textsize = -6
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">>"
end type

event clicked;ii_ano = ii_ano + 1

IF not(isdate(string(ii_mes) + "/" + string(ii_dia) + "/"+ string(ii_ano))) THEN ii_dia = 1
	
//Escribir el mes
uof_escribir_mes(ii_ano, ii_mes)

//Retornar la fecha seleccionada en el SingleLineEdit en el formato seleccionado
id_fecha_seleccionada = date(ii_ano,ii_mes,ii_dia)
uof_asignar_fecha (id_fecha_seleccionada)

end event

type pb_ano_anterior from picturebutton within uo_frmwrk_calendario
integer x = 9
integer y = 12
integer width = 101
integer height = 80
integer taborder = 40
integer textsize = -6
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<<"
end type

event clicked;ii_ano = ii_ano - 1

IF not(isdate(string(ii_mes) + "/" + string(ii_dia) + "/"+ string(ii_ano))) THEN ii_dia = 1
	
//Draw the month
uof_escribir_mes ( ii_ano, ii_mes )

///Retornar la fecha seleccionada en el SingleLineEdit en el formato seleccionado
id_fecha_seleccionada = date(ii_ano,ii_mes,ii_dia)
uof_asignar_fecha (id_fecha_seleccionada)

end event

type pb_mes_anterior from picturebutton within uo_frmwrk_calendario
event clicked pbm_bnclicked
integer x = 110
integer y = 12
integer width = 101
integer height = 80
integer taborder = 30
integer textsize = -6
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<"
end type

event clicked;//Decrementa el mes, Si es Cero (0), Se pasa a 12 (Diciembre)
ii_mes = ii_mes - 1
IF ii_mes = 0 THEN
	ii_mes = 12
	ii_ano = ii_ano - 1
END IF

//Verificar qeu el dia seleccionado ya no es válido para el nuevo mes
IF Not(isdate(string(ii_mes) + "/" + string(ii_dia) + "/"+ string(ii_ano))) THEN ii_dia = 1

//Escribir el mes
uof_escribir_mes ( ii_ano, ii_mes )

//Retornar la fecha seleccionada en el SingleLineEdit en el formato seleccionado
id_fecha_seleccionada = date(ii_ano,ii_mes,ii_dia)
uof_asignar_fecha (id_fecha_seleccionada)

end event

type pb_mes_siguiente from picturebutton within uo_frmwrk_calendario
integer x = 613
integer y = 8
integer width = 101
integer height = 80
integer taborder = 50
integer textsize = -6
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">"
end type

event clicked;//Incrementar el número del mes, si es 13, se regresa a 1 (Enero)
ii_mes = ii_mes + 1
IF ii_mes = 13 THEN
	ii_mes = 1
	ii_ano = ii_ano + 1
END IF

//Verificar si el dia seleccionado ya no es válido para el nuevo mes
IF Not(isdate(string(ii_mes) + "/" + string(ii_dia) + "/"+ string(ii_ano))) THEN ii_dia = 1
	
uof_escribir_mes ( ii_ano, ii_mes )

//Retornar la fecha seleccionada en el SingleLineEdit en el formato seleccionado
id_fecha_seleccionada = date(ii_ano,ii_mes,ii_dia)
uof_asignar_fecha (id_fecha_seleccionada)

end event

type sle_date from singlelineedit within uo_frmwrk_calendario
integer y = 632
integer width = 297
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;IF is_columna_anterior <> '' THEN
	dw_calendario.Modify(is_columna_anterior + ".Font.Weight='400'")
END IF
end event

event modified;Messagebox('','')
end event

type dw_calendario from datawindow within uo_frmwrk_calendario
event ue_dwnkey pbm_dwnkey
string tag = "Presione Ctrl+Derecha o Ctrl+Izquierda para cambiar los meses"
integer width = 823
integer height = 628
integer taborder = 20
string dataobject = "d_frmwrk_calendario"
borderstyle borderstyle = stylelowered!
end type

event ue_dwnkey;// Habilita el uso de Ctrl+Derecha y Ctrl+Izquierda para cambiar los meses
IF KeyDown(KeyRightArrow!) AND KeyDown(KeyControl!) THEN
	pb_mes_siguiente.TriggerEvent(Clicked!)
ELSEIF KeyDown(KeyLeftArrow!) AND KeyDown(KeyControl!) THEN
	pb_mes_anterior.TriggerEvent(Clicked!)
END IF
end event

event clicked;STRING ls_columna, ls_idcolumna, ls_dia

// Valida si el usuario hizo click sobre el datawindow
IF Not IsNull(dwo) THEN
	IF Pos(dwo.name, "dia") > 0 THEN 
		// Identifica si se hizo click sobre una columna y si esta es válida
		ls_columna = dwo.name
		ls_idcolumna = dwo.id
		IF Len(Trim(ls_columna)) > 0 THEN 
			// Trasncribe el dia de la columna en que se hizo click al número del día equivalente
			ls_dia = dwo.primary[1]
			IF Len(Trim(ls_dia)) > 0 THEN 
				// Convierte el tipo de dato de String a Numerico lo asigna a una variable de instancia
				ii_dia = Integer(ls_dia)
		
				// Si existe una columna resaltada le cambio el estado al borde a estado normal
				uof_deseleccionar_columna (is_columna_anterior)
		
				// Le cambia el estado al borde a estado seleccionado a la nueva columna seleccionada
				dwo.border = 1
		
				// Almacena la nueva columna seleccionada en la variable de instancia 
				is_columna_anterior = ls_columna
		
				// Retorna la fecha correspondiente a la columna seleccionada en el SingleLineEdit 
				// con formato año, mes y día 'yyyy/mmm/dd'
				id_fecha_seleccionada = date(ii_ano, ii_mes, ii_dia)
				uof_asignar_fecha (id_fecha_seleccionada)
			END IF	
		END IF
	END IF
END IF	
end event

event doubleclicked;STRING						ls_dia

IF Not IsNull(dwo) THEN
	IF Pos(dwo.name,"dia") > 0 THEN 
		ls_dia = dwo.primary[1]
		ii_dia = Integer(ls_dia)
	
		// Retorna la fecha seleccionada en el SingleLineEdit en el formato año, mes y día 'yyy7mm7dd'
		id_fecha_seleccionada = Date(ii_ano,ii_mes,ii_dia)
		uof_asignar_fecha(id_fecha_seleccionada)

		idw_datawindow_origen.SetItem(ii_fila_origen,is_columna_origen,id_fecha_seleccionada)
		idw_datawindow_origen.SetItem(ii_fila_origen,'display_fecha',String(id_fecha_seleccionada,is_formato_fecha))
		idw_datawindow_origen.SetItem(ii_fila_origen,'descripcion_parametro',f_frmwrk_fecha_larga(id_fecha_seleccionada))			
		idw_datawindow_origen.AcceptText()
		Parent.Hide()
	END IF
END IF
end event

