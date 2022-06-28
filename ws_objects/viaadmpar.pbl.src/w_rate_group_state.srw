$PBExportHeader$w_rate_group_state.srw
forward
global type w_rate_group_state from wb_single_tb
end type
type lst_payer from my_ddlb within w_rate_group_state
end type
type st_2 from statictext within w_rate_group_state
end type
type gb_1 from groupbox within w_rate_group_state
end type
end forward

global type w_rate_group_state from wb_single_tb
integer width = 3493
integer height = 1712
string title = "Rate Group State"
lst_payer lst_payer
st_2 st_2
gb_1 gb_1
end type
global w_rate_group_state w_rate_group_state

on w_rate_group_state.create
int iCurrent
call super::create
this.lst_payer=create lst_payer
this.st_2=create st_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_payer
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.gb_1
end on

on w_rate_group_state.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_payer)
destroy(this.st_2)
destroy(this.gb_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_rate_group_state
integer y = 164
integer width = 3438
integer height = 1360
string dataobject = "dw_rate_group_state"
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

dw_1.setitem(dw_1.getrow(),"date_upgrade",today())

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

type lst_payer from my_ddlb within w_rate_group_state
integer x = 265
integer y = 44
integer width = 978
integer height = 1448
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type in ('A','P') and flag_grupo = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;String ls_filter

dw_1.Retrieve()
if lst_payer.getdataid() <> '--' then
	ls_filter = "id_main_branch = '"+lst_payer.getdataid()+"'"
else
	ls_filter = ''
end if
dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end event

type st_2 from statictext within w_rate_group_state
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

type gb_1 from groupbox within w_rate_group_state
integer width = 1312
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

