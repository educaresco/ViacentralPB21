$PBExportHeader$w_ajustar_tasa.srw
forward
global type w_ajustar_tasa from window
end type
type cb_1 from commandbutton within w_ajustar_tasa
end type
type dw_type_currency from datawindow within w_ajustar_tasa
end type
type dw_ajustar_type_rate from datawindow within w_ajustar_tasa
end type
type st_2 from statictext within w_ajustar_tasa
end type
type em_nivel from editmask within w_ajustar_tasa
end type
type st_1 from statictext within w_ajustar_tasa
end type
type cb_2 from commandbutton within w_ajustar_tasa
end type
type cb_calcular from commandbutton within w_ajustar_tasa
end type
type dw_info from datawindow within w_ajustar_tasa
end type
end forward

global type w_ajustar_tasa from window
integer width = 3264
integer height = 1852
boolean titlebar = true
string title = "Ajustar Type Rate"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_type_currency dw_type_currency
dw_ajustar_type_rate dw_ajustar_type_rate
st_2 st_2
em_nivel em_nivel
st_1 st_1
cb_2 cb_2
cb_calcular cb_calcular
dw_info dw_info
end type
global w_ajustar_tasa w_ajustar_tasa

type variables
LONG il_nivel_ajustado, il_registros_ajustados, il_fila_selec
end variables

on w_ajustar_tasa.create
this.cb_1=create cb_1
this.dw_type_currency=create dw_type_currency
this.dw_ajustar_type_rate=create dw_ajustar_type_rate
this.st_2=create st_2
this.em_nivel=create em_nivel
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_calcular=create cb_calcular
this.dw_info=create dw_info
this.Control[]={this.cb_1,&
this.dw_type_currency,&
this.dw_ajustar_type_rate,&
this.st_2,&
this.em_nivel,&
this.st_1,&
this.cb_2,&
this.cb_calcular,&
this.dw_info}
end on

on w_ajustar_tasa.destroy
destroy(this.cb_1)
destroy(this.dw_type_currency)
destroy(this.dw_ajustar_type_rate)
destroy(this.st_2)
destroy(this.em_nivel)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_calcular)
destroy(this.dw_info)
end on

event open;LONG l_fila, l_null


SetNull(l_null )

DATASTORE d_datos_param

d_datos_param = CREATE DATASTORE

d_datos_param = Message.PowerObjectParm
dw_type_currency.Visible = False


dw_info.SettransObject(SQLCA)
dw_ajustar_type_rate.SettransObject(SQLCA)

dw_type_currency.SettransObject(SQLCA)

FOR l_fila = 1 TO d_datos_param.RowCount()
	
	dw_info.InsertRow(0)
	
	dw_info.SetItem(l_fila, 'id_main_branch',d_datos_param.GetItemString(l_fila,'id_main_branch' ) )
	dw_info.SetItem(l_fila, 'id_rate_type',d_datos_param.GetItemNumber(l_fila,'id_rate_type' ) )
	dw_info.SetItem(l_fila, 'future_rate_type', l_null  )
	dw_info.SetItem(l_fila, 'id_modo_pago',d_datos_param.GetItemString(l_fila,'id_modo_pago' ) )
	dw_info.SetItem(l_fila, 'id_country_rate',d_datos_param.GetItemString(l_fila,'id_country_rate' ) )
	dw_info.SetItem(l_fila,'id_curreny', d_datos_param.GetItemString(l_fila,'id_curreny' ))
	
	dw_info.SetItem(l_fila, 'fila',d_datos_param.GetItemNumber(l_fila,'fila' ) )
		
NEXT



end event

event clicked;dw_type_currency.Visible = False
end event

type cb_1 from commandbutton within w_ajustar_tasa
integer x = 2299
integer y = 16
integer width = 457
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Limpiar"
end type

event clicked;INTEGER  i_fila
LONG  l_type_rate_futuro
DECIMAL d_future_rate

SetNull(d_future_rate)
SetNull(l_type_rate_futuro)

dw_type_currency.Visible = False

FOR i_fila = 1 TO dw_info.RowCount()
	
	dw_info.SetItem(i_fila,'future_rate_type', l_type_rate_futuro  )
	dw_info.SetItem(i_fila,'future_rate', d_future_rate  )
	
NEXT





end event

type dw_type_currency from datawindow within w_ajustar_tasa
boolean visible = false
integer x = 1993
integer y = 376
integer width = 1088
integer height = 1188
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Seleccionar Type Rate"
string dataobject = "dddw_rate_type_parameters"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event clicked;

If row = 0 THEN
	
	RETURN
	
END IF

This.SelectRow(0, false)
This.SelectRow(row, true)
end event

event doubleclicked;
DECIMAL ld_increase, ld_rate
LONG ll_type_rate

IF row = 0 THEN
	RETURN
END IF

ld_increase = dw_info.getitemnumber(il_fila_selec,"temp_rate_mod")


ld_rate = this.getitemDecimal(row,"rate")

ll_type_rate = this.getitemDecimal(row,"id_rate_type")
		
	// Actualiza el RATE de acuerdo al RATE_TYPE y al INCREMENTO	
//	SELECT rate
//	  INTO :ld_rate
//	  FROM dba.RATE_TYPE
//	 WHERE id_rate_type = :li_id_rate_type;
			
if isnull(ld_increase) then ld_increase = 0

dw_info.setitem(il_fila_selec,"rate",ld_rate+ld_increase)	

dw_info.setitem(il_fila_selec,"future_rate_type",ll_type_rate)	

this.visible = false
end event

event losefocus;dw_type_currency.visible = false
end event

type dw_ajustar_type_rate from datawindow within w_ajustar_tasa
boolean visible = false
integer x = 5
integer y = 1340
integer width = 3209
integer height = 220
integer taborder = 20
string title = "none"
string dataobject = "dw_ajustar_type_rate"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_ajustar_tasa
integer x = 878
integer y = 64
integer width = 338
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nivel"
boolean focusrectangle = false
end type

type em_nivel from editmask within w_ajustar_tasa
integer x = 398
integer y = 16
integer width = 457
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "-50~~+50"
end type

event modified;dw_type_currency.Visible = False
end event

type st_1 from statictext within w_ajustar_tasa
integer x = 55
integer y = 64
integer width = 338
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ajustar:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_ajustar_tasa
integer x = 2757
integer y = 1616
integer width = 457
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Aplicar"
end type

event clicked;DATASTORE ds_retorno
LONG l_fila, l_reg_modificados

dw_type_currency.Visible = False
ds_retorno =  CREATE DATASTORE
ds_retorno.dataObject = 'dw_ajustar_tasa'

ds_retorno.SettransObject(SQLCA)


FOR l_fila = 1 TO dw_info.RowCount()
	
	ds_retorno.InsertRow(0)
	
	ds_retorno.SetItem(l_fila, 'id_main_branch',dw_info.GetItemString(l_fila,'id_main_branch' ) )
	ds_retorno.SetItem(l_fila, 'id_rate_type',dw_info.GetItemNumber(l_fila,'id_rate_type' ) )
	ds_retorno.SetItem(l_fila, 'id_modo_pago',dw_info.GetItemString(l_fila,'id_modo_pago' ) )
	ds_retorno.SetItem(l_fila, 'id_country_rate',dw_info.GetItemString(l_fila,'id_country_rate' ) )
	
	ds_retorno.SetItem(l_fila, 'future_rate_type',dw_info.GetItemNumber(l_fila,'future_rate_type' ) )
	ds_retorno.SetItem(l_fila, 'future_rate',dw_info.GetItemDecimal(l_fila,'future_rate' ) )
	
	ds_retorno.SetItem(l_fila, 'fila',dw_info.GetItemNumber(l_fila,'fila' ) )
		
	
NEXT


l_reg_modificados = dw_info.GetItemNumber(1, 'total_modificados' )

 

IF il_nivel_ajustado <> 0 AND l_reg_modificados > 0 THEN
		messageBox('Atención','Todos los pagadores fueron ajustados '+ String(il_nivel_ajustado) + ' nivel(es).' )
ELSE
	messageBox('Atención','Los pagadores NO han sido ajustados de nivel.' )
END IF


CloseWithReturn ( parent, ds_retorno )
end event

type cb_calcular from commandbutton within w_ajustar_tasa
integer x = 2757
integer y = 16
integer width = 457
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Calcular"
end type

event clicked;STRING s_id_main_branch, s_id_country, ls_currency
INTEGER i_nivel, i_fila, l_nivel_actual, l_nivel_nuevo
LONG l_type_rate, l_type_rate_futuro
DECIMAL d_future_rate


i_nivel = Integer(em_nivel.text)
dw_type_currency.Visible = False

IF i_nivel = 0 THEN
	messageBox('Advertencia','Debe definir el nivel al que quiere ajustar el Type Rate')
	RETURN
END IF


il_nivel_ajustado = i_nivel

FOR i_fila = 1 TO dw_info.RowCount()
	
	
	//s_id_main_branch = dw_info.GetItemString(i_fila,'id_main_branch' ) 
	s_id_country = dw_info.GetItemString(i_fila,'id_country_rate' )
	
	l_type_rate = dw_info.GetItemNumber(i_fila,'id_rate_type' )
	
	ls_currency = dw_info.GetItemString(i_fila,'id_curreny' )
	
	dw_ajustar_type_rate.Retrieve(s_id_country,ls_currency, l_type_rate)	
	
	
	l_nivel_actual = dw_ajustar_type_rate.find('id_rate_type = '+String(l_type_rate),1,dw_ajustar_type_rate.RowCount() )
	
	IF l_nivel_actual > 0 THEN
		
		
		il_registros_ajustados = il_registros_ajustados + 1
		
		dw_ajustar_type_rate.SelectRow(l_nivel_actual, true)
		dw_ajustar_type_rate.SetRow ( l_nivel_actual )
		dw_ajustar_type_rate.scrolltorow(l_nivel_actual)
		
		l_nivel_nuevo = l_nivel_actual + i_nivel
		
		IF l_nivel_nuevo < 1 THEN
			l_nivel_nuevo = 1
		END IF
		
		IF l_nivel_nuevo > dw_ajustar_type_rate.RowCount() THEN
			l_nivel_nuevo = dw_ajustar_type_rate.RowCount()
		END IF
		
		dw_ajustar_type_rate.SelectRow(l_nivel_nuevo, true)
		
		
		l_type_rate_futuro =  dw_ajustar_type_rate.GetItemNumber(l_nivel_nuevo,'id_rate_type' )	
		d_future_rate = dw_ajustar_type_rate.GetItemDecimal(l_nivel_nuevo,'rate' )	 
		
		dw_info.SetItem(i_fila,'future_rate_type', l_type_rate_futuro  )
		dw_info.SetItem(i_fila,'future_rate', d_future_rate  )
		
	END IF
	
	
	
NEXT





end event

type dw_info from datawindow within w_ajustar_tasa
integer x = 5
integer y = 176
integer width = 3209
integer height = 1400
integer taborder = 10
string title = "none"
string dataobject = "dw_ajustar_tasa"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;STRING s_column

s_column = dwo.name

dw_type_currency.Visible = False

IF s_column = 'future_rate_type' THEN
	
	STRING s_country, s_currency
	LONG l_fila_encontrada, l_type_rate
	
	s_country =  dw_info.GetItemString(row,'id_country_rate')
	s_currency =  dw_info.GetItemString(row,'id_curreny' )
	l_type_rate =  dw_info.GetItemNumber(row,'future_rate_type' )
	
	dw_type_currency.Retrieve(s_country,s_currency )
	
	dw_type_currency.Visible = True
	
	l_fila_encontrada = dw_type_currency.Find('id_rate_type = '+  String( l_type_rate), 1,   dw_type_currency.RowCount() )
	
	IF l_fila_encontrada > 0 THEN
		
		dw_type_currency.SelectRow(l_fila_encontrada, true)
		dw_type_currency.scrolltorow( l_fila_encontrada)
		
	END IF
	
	
	
	il_fila_selec = row
END IF
end event

