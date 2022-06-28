$PBExportHeader$w_rate_group_state_city.srw
forward
global type w_rate_group_state_city from wb_single_tb
end type
end forward

global type w_rate_group_state_city from wb_single_tb
int Width=3502
int Height=1580
boolean TitleBar=true
string Title="Rate Group State Delivery"
end type
global w_rate_group_state_city w_rate_group_state_city

on w_rate_group_state_city.create
call super::create
end on

on w_rate_group_state_city.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_rate_group_state_city
int Width=3438
int Height=1372
boolean BringToTop=true
string DataObject="dw_rate_group_state_city"
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

event dw_1::buttonclicked;//string	ls_grupo, ls_group
//long		ll_row, I
//Double	ld_rate
//
//ls_grupo = dw_1.getitemstring(row,"id_main_branch")
//ld_rate = 0
//
//OpenWithParm(w_cambio_tasa_pagador,ls_grupo)
//
//
//ld_rate = message.doubleparm
//
//if ld_rate = 0 then
//	Return
//end if
//
//ll_row = dw_1.rowcount()
//
//
//FOR I = 1 TO ll_row
//	ls_group = dw_1.getitemstring(I,"id_main_branch")
//	
//	if ls_grupo = ls_group then
//		dw_1.setitem(I,"rate",ld_rate)
//	end if
//
//NEXT
//
//dw_1.update()
//commit ;
//
//
//
//
end event

