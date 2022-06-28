$PBExportHeader$w_rate_group_state_delivery.srw
forward
global type w_rate_group_state_delivery from wb_single_tb
end type
type lst_payer from my_ddlb within w_rate_group_state_delivery
end type
type st_2 from statictext within w_rate_group_state_delivery
end type
type lst_paymodes from my_ddlb within w_rate_group_state_delivery
end type
type st_label from statictext within w_rate_group_state_delivery
end type
type em_dif from editmask within w_rate_group_state_delivery
end type
type cb_apply from commandbutton within w_rate_group_state_delivery
end type
type st_1 from statictext within w_rate_group_state_delivery
end type
type gb_1 from groupbox within w_rate_group_state_delivery
end type
type gb_2 from groupbox within w_rate_group_state_delivery
end type
end forward

global type w_rate_group_state_delivery from wb_single_tb
integer width = 4110
integer height = 1672
string title = "Rate Group State Delivery"
lst_payer lst_payer
st_2 st_2
lst_paymodes lst_paymodes
st_label st_label
em_dif em_dif
cb_apply cb_apply
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_rate_group_state_delivery w_rate_group_state_delivery

on w_rate_group_state_delivery.create
int iCurrent
call super::create
this.lst_payer=create lst_payer
this.st_2=create st_2
this.lst_paymodes=create lst_paymodes
this.st_label=create st_label
this.em_dif=create em_dif
this.cb_apply=create cb_apply
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_payer
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.lst_paymodes
this.Control[iCurrent+4]=this.st_label
this.Control[iCurrent+5]=this.em_dif
this.Control[iCurrent+6]=this.cb_apply
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.gb_2
end on

on w_rate_group_state_delivery.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_payer)
destroy(this.st_2)
destroy(this.lst_paymodes)
destroy(this.st_label)
destroy(this.em_dif)
destroy(this.cb_apply)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;em_dif.enabled = false
cb_apply.enabled = false
end event

type dw_1 from wb_single_tb`dw_1 within w_rate_group_state_delivery
integer y = 168
integer width = 4027
integer height = 1292
string dataobject = "dw_rate_group_state_delivery"
end type

event dw_1::constructor;call super::constructor;//
////of_SetTransObject(sqlca)
//
//// Start the Drop-down Calendar and associate with the 
//// "order date" column of the DataWindow.
//of_SetDropDownCalendar(true)
//iuo_calendar.of_Register('date_begin_rate', iuo_calendar.DDLB_WITHARROW)
//
//// Start the Drop-down Calculator and associate with the "quantity" column
//// of the DataWindow.
//of_SetDropDownCalculator(true)
//iuo_calculator.of_Register('rate', iuo_calculator.DDLB_WITHARROW)
//
////  Call the of_Retrieve function to retrieve the data.
//of_Retrieve()
end event

event dw_1::buttonclicked;string	ls_grupo, ls_group
long		ll_row, I
Double	ld_rate

ls_grupo = dw_1.getitemstring(row,"id_main_branch")
ld_rate = 0

OpenWithParm(w_cambio_tasa_pagador,ls_grupo)


ld_rate = message.doubleparm

if ld_rate = 0 then
	Return
end if

ll_row = dw_1.rowcount()


FOR I = 1 TO ll_row
	ls_group = dw_1.getitemstring(I,"id_main_branch")
	
	if ls_grupo = ls_group then
		dw_1.setitem(I,"rate",ld_rate)
	end if

NEXT

dw_1.update()
commit ;




end event

event dw_1::itemchanged;call super::itemchanged;double ld_rate, ld_increase
date ld_nulldate, ld_calidthru
string ls_country, ls_currency
long	ll_cont
integer li_id_rate_type

SetNull(ld_nulldate)	

///// Modifican el RATE_TYPE
if dwo.name = 'id_rate_type' then
	
	if isnull(data) then
		return
	end if	
	
	li_id_rate_type = integer(data)	
	
	ls_country = dw_1.getitemstring(row,"id_country_rate")
	ls_currency = dw_1.getitemstring(row,"id_curreny")
	
	SELECT count(*)
	  INTO :ll_cont
	  FROM dba.RATE_TYPE
	 WHERE id_rate_type = :li_id_rate_type
		AND id_country = :ls_country
		AND id_currency = :ls_currency;
		
	if ll_cont = 0 then
		Messagebox("Error","La tasa seleccionada no es una tasa de este pais/moneda.",StopSign!)
		return 2		
	end if
	
	// Actualiza el RATE de acuerdo al RATE_TYPE
	SELECT rate
	  INTO :ld_rate
	  FROM dba.RATE_TYPE
	 WHERE id_rate_type = :li_id_rate_type;
				
	dw_1.setitem(row,"rate",ld_rate)						
		
end if
end event

type lst_payer from my_ddlb within w_rate_group_state_delivery
integer x = 265
integer y = 44
integer width = 978
integer height = 1448
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type in ('A','P') and flag_grupo = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;String ls_filter
ls_filter = ''
em_dif.enabled = false
cb_apply.enabled = false
dw_1.Retrieve()
if (lst_paymodes.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') then
	if lst_paymodes.getdataid() <> '--' then
		ls_filter = "id_modo_pago = '"+lst_paymodes.getdataid()+"'"
	else
		ls_filter = "id_modo_pago <> 'null'"
	end if		
	if lst_payer.getdataid() <> '--' then
		em_dif.enabled = true
		cb_apply.enabled = true
		em_dif.text = '0.00'				
		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"		
	else
		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
	end if
end if

dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end event

type st_2 from statictext within w_rate_group_state_delivery
integer x = 69
integer y = 60
integer width = 197
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer :"
boolean focusrectangle = false
end type

type lst_paymodes from my_ddlb within w_rate_group_state_delivery
integer x = 1650
integer y = 44
integer width = 718
integer height = 1448
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select nom_modo_pago, id_modo_pago from dba.modo_pago UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;String ls_filter
ls_filter = ''
em_dif.enabled = false
cb_apply.enabled = false
dw_1.Retrieve()
if (lst_paymodes.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') then
	if lst_paymodes.getdataid() <> '--' then
		ls_filter = "id_modo_pago = '"+lst_paymodes.getdataid()+"'"
	else
		ls_filter = "id_modo_pago <> 'null'"
	end if		
	if lst_payer.getdataid() <> '--' then
		em_dif.enabled = true
		cb_apply.enabled = true
		em_dif.text = '0.00'				
		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"		
	else
		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
	end if
end if

dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end event

type st_label from statictext within w_rate_group_state_delivery
integer x = 2793
integer y = 76
integer width = 270
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Increase :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_dif from editmask within w_rate_group_state_delivery
integer x = 3072
integer y = 64
integer width = 219
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0.00"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "00.00"
double increment = 0.1
string minmax = "-20.00~~20.00"
end type

event modified;if double(this.text) < 0 then
	st_label.text = 'Decrease :'
else
	st_label.text = 'Increase :'
end if
end event

type cb_apply from commandbutton within w_rate_group_state_delivery
integer x = 3301
integer y = 64
integer width = 215
integer height = 68
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Apply"
end type

event clicked;double ld_max, ld_min, ld_dif
long ll_cont, i

ld_dif = double (em_dif.text)

if dw_1.rowcount() < 1 or ld_dif = 0 then
	return
end if

ll_cont = 0
ld_max = dw_1.Object.data[1,7]
ld_min = dw_1.Object.data[1,7]

FOR i = 1 TO dw_1.rowcount()
	if dw_1.Object.data[i,7] > ld_max and isnull(dw_1.Object.data[i,11]) then
		ld_max = dw_1.Object.data[i,7]
	end if
	if dw_1.Object.data[i,7] < ld_min and isnull(dw_1.Object.data[i,11]) then
		ld_min = dw_1.Object.data[i,7]
	end if
	ll_cont++
NEXT

if ((ld_dif / ld_min) > 0.05) or ((ld_dif / ld_max) > 0.05) then
	Messagebox("Error","El Incremento/Decremento es muy grande para esta tasa!",StopSign!)
	return
end if

if Messagebox("Confirmación", string(ll_cont)+" Tasas van a ser modificadas entre "+string(ld_min + ld_dif)+" y "+string(ld_max + ld_dif)+", esta seguro?" ,Exclamation!, OKCancel!, 2) = 1 then
	ll_cont = 0
	FOR i = 1 TO dw_1.rowcount()		

		// no se actualizan las que tienen tipo de tasa (RATE_TYPE)
		if isnull(dw_1.Object.data[i,11]) then
			dw_1.Object.data[i,7] = dw_1.Object.data[i,7] + ld_dif
			ll_cont++
		end if
		
	NEXT
	Messagebox("Confirmación", string(ll_cont)+" Tasas modificadas, Debe grabar para aplicar los cambios.");
end if
end event

type st_1 from statictext within w_rate_group_state_delivery
integer x = 1367
integer y = 60
integer width = 256
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pay Mode :"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_rate_group_state_delivery
integer width = 2469
integer height = 148
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

type gb_2 from groupbox within w_rate_group_state_delivery
integer x = 2670
integer width = 1029
integer height = 148
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Multiple Rate Update -by Pay Mode- "
end type

