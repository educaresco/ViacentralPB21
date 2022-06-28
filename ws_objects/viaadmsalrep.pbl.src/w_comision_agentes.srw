$PBExportHeader$w_comision_agentes.srw
forward
global type w_comision_agentes from wb_single_tb
end type
end forward

global type w_comision_agentes from wb_single_tb
integer width = 2875
integer height = 2000
string title = "Sales Representatives~' Comission"
end type
global w_comision_agentes w_comision_agentes

on w_comision_agentes.create
call super::create
end on

on w_comision_agentes.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision_agentes
integer width = 2821
integer height = 1808
string dataobject = "dw_comision_agente"
end type

event dw_1::constructor;call super::constructor;
//of_SetTransObject(sqlca)

// Start the Drop-down Calendar and associate with the 
// "order date" column of the DataWindow.
of_SetDropDownCalendar(true)
iuo_calendar.of_Register('date_ini_comision', iuo_calendar.DDLB_WITHARROW)
iuo_calendar.of_Register('date_fin_comision', iuo_calendar.DDLB_WITHARROW)

// Start the Drop-down Calculator and associate with the "quantity" column
// of the DataWindow.
of_SetDropDownCalculator(true)
iuo_calculator.of_Register('valor_comision_agente', iuo_calculator.DDLB_WITHARROW)

//  Call the of_Retrieve function to retrieve the data.
of_Retrieve()
end event

