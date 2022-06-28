$PBExportHeader$w_acc_forexhistoricrates.srw
forward
global type w_acc_forexhistoricrates from w_sheet
end type
type cbx_overrideexisting from checkbox within w_acc_forexhistoricrates
end type
type st_currency from statictext within w_acc_forexhistoricrates
end type
type cb_save from commandbutton within w_acc_forexhistoricrates
end type
type em_rate from editmask within w_acc_forexhistoricrates
end type
type st_5 from statictext within w_acc_forexhistoricrates
end type
type st_2 from statictext within w_acc_forexhistoricrates
end type
type st_1 from statictext within w_acc_forexhistoricrates
end type
type em_date2 from editmask within w_acc_forexhistoricrates
end type
type em_date1 from editmask within w_acc_forexhistoricrates
end type
type st_4 from statictext within w_acc_forexhistoricrates
end type
type st_3 from statictext within w_acc_forexhistoricrates
end type
type cb_query from commandbutton within w_acc_forexhistoricrates
end type
type dw_ratehistory from datawindow within w_acc_forexhistoricrates
end type
type lst_payers from my_ddlb within w_acc_forexhistoricrates
end type
type gb_1 from groupbox within w_acc_forexhistoricrates
end type
type gb_2 from groupbox within w_acc_forexhistoricrates
end type
end forward

global type w_acc_forexhistoricrates from w_sheet
integer width = 2158
integer height = 2044
string title = "Forex Historic Rates"
cbx_overrideexisting cbx_overrideexisting
st_currency st_currency
cb_save cb_save
em_rate em_rate
st_5 st_5
st_2 st_2
st_1 st_1
em_date2 em_date2
em_date1 em_date1
st_4 st_4
st_3 st_3
cb_query cb_query
dw_ratehistory dw_ratehistory
lst_payers lst_payers
gb_1 gb_1
gb_2 gb_2
end type
global w_acc_forexhistoricrates w_acc_forexhistoricrates

type variables
String is_id_currency, is_id_country, is_id_payer
Double ir_previousrate

end variables

on w_acc_forexhistoricrates.create
int iCurrent
call super::create
this.cbx_overrideexisting=create cbx_overrideexisting
this.st_currency=create st_currency
this.cb_save=create cb_save
this.em_rate=create em_rate
this.st_5=create st_5
this.st_2=create st_2
this.st_1=create st_1
this.em_date2=create em_date2
this.em_date1=create em_date1
this.st_4=create st_4
this.st_3=create st_3
this.cb_query=create cb_query
this.dw_ratehistory=create dw_ratehistory
this.lst_payers=create lst_payers
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_overrideexisting
this.Control[iCurrent+2]=this.st_currency
this.Control[iCurrent+3]=this.cb_save
this.Control[iCurrent+4]=this.em_rate
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.em_date2
this.Control[iCurrent+9]=this.em_date1
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.cb_query
this.Control[iCurrent+13]=this.dw_ratehistory
this.Control[iCurrent+14]=this.lst_payers
this.Control[iCurrent+15]=this.gb_1
this.Control[iCurrent+16]=this.gb_2
end on

on w_acc_forexhistoricrates.destroy
call super::destroy
destroy(this.cbx_overrideexisting)
destroy(this.st_currency)
destroy(this.cb_save)
destroy(this.em_rate)
destroy(this.st_5)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_date2)
destroy(this.em_date1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_query)
destroy(this.dw_ratehistory)
destroy(this.lst_payers)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cbx_overrideexisting from checkbox within w_acc_forexhistoricrates
integer x = 347
integer y = 512
integer width = 731
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Modificar Existentes"
end type

type st_currency from statictext within w_acc_forexhistoricrates
integer x = 709
integer y = 416
integer width = 402
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_save from commandbutton within w_acc_forexhistoricrates
integer x = 1600
integer y = 468
integer width = 402
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Grabar"
end type

event clicked;date ld_date1, ld_date2, ld_movingdate
long ll_cont
double ld_rate, ld_rate_allowance


ld_date1 = date(em_date1.text)
ld_date2 = date(em_date2.text)

// No permite poner la tasa mas alla de 5 dias en el futuro!
if ld_date2 > RelativeDate ( today(), 5 ) then
	Messagebox("Error","No puede poner tasas para la fecha "+String(ld_date2,"mm/dd/yyyy")+".", StopSign!)
	return
end if


if ld_date2 < ld_date1 then
	Messagebox("Error","La fecha HASTA debe ser mayor o igual a la fecha DESDE.", StopSign!)
	return
end if

ld_rate = double(em_rate.text)


// Cuando es un pagador nuevo (sin tasas en la historia), se basa en la tasa/moneda de la ultima orden del dia
if ir_previousrate = -1 and is_id_currency = '' then

	SELECT TOP 1 id_curreny, rate_change_receiver
     INTO :is_id_currency,
	  		 :ir_previousrate	   
     FROM dba.receiver 
    WHERE id_main_branch_sent = :is_id_payer 
       AND mod_pay_currency = 'N'
	  AND id_country_receiver = :is_id_country
    ORDER BY date_receiver DESC;
	
end if


SELECT min(RATE_ALLOWANCE)
  INTO :ld_rate_allowance
  FROM dba.ACC_PARAMETERS;

// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
if ir_previousrate > 0 then
	if abs((ir_previousrate - ld_rate) / ir_previousrate) > ld_rate_allowance then
		Messagebox("Valor Errado","La diferencia de tasa es muy alta respecto a la ultima tasa. Revise la tasa. (±"+String(ld_rate_allowance * 100)+"%)",StopSign!)
		SetFocus(em_rate)
		return		
	end if
end if

SELECT count(*)
  INTO :ll_cont
  FROM DBA.RATE_HISTORY
 WHERE ID_MAIN_BRANCH = :is_id_payer
   AND DATE_RATE BETWEEN :ld_date1 AND :ld_date2
   AND id_country = :is_id_country;

if ll_cont > 0 then
	
	String ls_confirmationtext
		
	if	cbx_overrideexisting.checked then
		ls_confirmationtext = "El rango seleccionado contiene fechas que ya tienen una tasa grabado. ~n~rLa tasa de esas fechas se modificará por haber seleccionado la opción SOBRESCRIBIR EXISTENTES. ~n~rDesea continuar?"
	else
		ls_confirmationtext = "El rango seleccionado contiene fechas que ya tienen una tasa grabado. ~n~rLa tasa de esas fechas no se modificara, unicamente se adicionaran las fechas faltantes. ~n~rDesea continuar?"
	end if
	
	if Messagebox("Confirmacion",ls_confirmationtext, Information!,YesNo!) > 1 then 
		return
	end if	
end if

ld_movingdate = ld_date1

do while ld_movingdate <= ld_date2
	
	SELECT count(*)
	  INTO :ll_cont
	  FROM DBA.RATE_HISTORY
	 WHERE ID_MAIN_BRANCH = :is_id_payer
		AND DATE_RATE = :ld_movingdate
         AND id_country = :is_id_country;		
		
	
	if ll_cont = 0 then

		  INSERT INTO dba.RATE_HISTORY  
					( ID_MAIN_BRANCH,   
					  DATE_RATE,   
					  ID_COUNTRY,   
					  ID_CURRENCY,   
					  RATE )  
		  VALUES ( :is_id_payer,   
					  :ld_movingdate,   
					  :is_id_country,   
					  :is_id_currency,   
					  :ld_rate)  ;
					  
		  	if SQLCA.SQLCode <> 0 then
				Messagebox("Error Guardando","Error grabando el registro. "+SQLCA.SQLErrText)
			end if
	
	else
	
		// Sobre Escribe las existentes si seleccionó la opción
		if cbx_overrideexisting.checked then
			
			UPDATE DBA.RATE_HISTORY
				SET RATE = :ld_rate
			 WHERE ID_MAIN_BRANCH = :is_id_payer
				AND DATE_RATE = :ld_movingdate
				AND ID_COUNTRY = :is_id_country;			

		  	if SQLCA.SQLCode <> 0 then
				Messagebox("Error Actualizando","Error actualizando el registro. "+SQLCA.SQLErrText)
			end if
	
		end if
		
	end if	
	
	
	ld_movingdate = relativedate(ld_movingdate,1)
loop

// refresh the dw
dw_ratehistory.retrieve(is_id_payer,is_id_country)

if dw_ratehistory.rowcount() > 0 then
	em_date1.text = string(relativedate(date(dw_ratehistory.getitemdatetime(1,"date_rate")),1),'mm/dd/yyyy')	
	ir_previousrate = dw_ratehistory.getitemnumber(1,"rate")		
end if
		

end event

type em_rate from editmask within w_acc_forexhistoricrates
integer x = 347
integer y = 420
integer width = 343
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean enabled = false
string text = "0.0000"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###.0000"
end type

type st_5 from statictext within w_acc_forexhistoricrates
integer x = 87
integer y = 428
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Tasa:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_acc_forexhistoricrates
integer x = 718
integer y = 328
integer width = 155
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_acc_forexhistoricrates
integer x = 87
integer y = 328
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Desde:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date2 from editmask within w_acc_forexhistoricrates
integer x = 896
integer y = 320
integer width = 343
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

event modified;em_rate.text = '0.0000'
end event

type em_date1 from editmask within w_acc_forexhistoricrates
integer x = 347
integer y = 320
integer width = 343
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

event modified;em_date2.text = this.text
em_rate.text = '0.0000'
end event

type st_4 from statictext within w_acc_forexhistoricrates
integer x = 87
integer y = 96
integer width = 251
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Pagador:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_acc_forexhistoricrates
integer x = 18
integer y = 620
integer width = 983
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historia de Tasa"
boolean focusrectangle = false
end type

type cb_query from commandbutton within w_acc_forexhistoricrates
integer x = 1600
integer y = 84
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Consultar"
end type

event clicked;String ls_mode
Datetime ld_datelaststock, ld_datelastorder

is_id_payer = fn_token(lst_payers.getdataid(),'^',1)
is_id_country = fn_token(lst_payers.getdataid(),'^',2)

//Messagebox(is_id_payer,is_id_country)

if is_id_payer <> '--' then

	dw_ratehistory.retrieve(is_id_payer,is_id_country)
	
	if dw_ratehistory.rowcount() > 0 then
		em_date1.text = string(relativedate(date(dw_ratehistory.getitemdatetime(1,"date_rate")),1),'mm/dd/yyyy')
		
		is_id_currency = dw_ratehistory.getitemstring(1,"id_currency")
		ir_previousrate = dw_ratehistory.getitemnumber(1,"rate")		
	else
		em_date1.text = string(today())
		ir_previousrate = -1
		is_id_currency = ''
	end if
	
	em_date2.text = em_date1.text
	
	em_date1.enabled = true
	em_date2.enabled = true
	em_rate.enabled = true
	cb_save.enabled = true
	
	SELECT name_currency
	  INTO :st_currency.text
	  FROM dba.CURRENCY
	 WHERE ID_CURRENY = :is_id_currency;
	
else
	
	em_date1.text = ''
	em_date2.text = ''
	em_rate.text = '0.0000'
	
	
	is_id_payer = '--'
	is_id_currency = ''
	is_id_country = ''
	ir_previousrate = -1
	
	dw_ratehistory.reset()
	
	em_date1.enabled = false
	em_date2.enabled = false
	em_rate.enabled = false
	cb_save.enabled = false
	
	st_currency.text = ''
	
end if
end event

type dw_ratehistory from datawindow within w_acc_forexhistoricrates
integer x = 14
integer y = 688
integer width = 2043
integer height = 1188
string title = "none"
string dataobject = "dw_acc_forexhistoricrates_ratehistory"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type lst_payers from my_ddlb within w_acc_forexhistoricrates
integer x = 347
integer y = 88
integer width = 1230
integer height = 1136
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_payers.addquery("select rtrim(name_main_branch) + ' (' + rtrim(id_country) + ')', dba.group_branch.id_main_branch+'^'+id_country from dba.group_branch, dba.FOREX_STOCK where dba.group_branch.ID_MAIN_BRANCH = dba.FOREX_STOCK.ID_MAIN_BRANCH and KEEP_HISTORIC_RATE = 'Y' order by name_main_branch;")
end event

type gb_1 from groupbox within w_acc_forexhistoricrates
integer x = 14
integer width = 2043
integer height = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_acc_forexhistoricrates
integer x = 14
integer y = 236
integer width = 2043
integer height = 364
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingreso de Tasa"
end type

