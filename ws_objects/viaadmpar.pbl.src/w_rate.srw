$PBExportHeader$w_rate.srw
forward
global type w_rate from wb_single_tb
end type
end forward

global type w_rate from wb_single_tb
integer x = 214
integer y = 221
integer width = 2981
integer height = 1632
string title = "Rate"
end type
global w_rate w_rate

on w_rate.create
call super::create
end on

on w_rate.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;
dw_1.SetFilter("id_country_source = 'USA' ")
end event

type dw_1 from wb_single_tb`dw_1 within w_rate
integer width = 2930
integer height = 1432
string dataobject = "dw_rate"
end type

event dw_1::constructor;call super::constructor;
//of_SetTransObject(sqlca)

// Start the Drop-down Calendar and associate with the 
// "order date" column of the DataWindow.
of_SetDropDownCalendar(true)
iuo_calendar.of_Register('date_begin_rate', iuo_calendar.DDLB_WITHARROW)

// Start the Drop-down Calculator and associate with the "quantity" column
// of the DataWindow.
of_SetDropDownCalculator(true)
iuo_calculator.of_Register('rate', iuo_calculator.DDLB_WITHARROW)
//filter

//  Call the of_Retrieve function to retrieve the data.
of_Retrieve()
end event

event dw_1::itemchanged;call super::itemchanged;dw_1.setitem(dw_1.getrow(),"date_end_rate",today())


end event

event dw_1::pfc_preupdate;call super::pfc_preupdate;double ld_new_rate
String ls_country 
String ls_country_source 
String ls_countries
int ld_return

double ld_max, ld_min, ld_dif
long ll_cont, i


ll_cont = 0
FOR i = 1 TO dw_1.rowcount()
	ld_return= 0
	ld_new_rate = dw_1.GetItemnumber(i,"RATE")
	ls_country =dw_1.getitemstring(i,"ID_COUNTRY")
	ls_country_source =dw_1.getitemstring(i,"ID_COUNTRY_SOURCE")
	
	select count(*)
	 into :ld_return
	  from DBA.RATE 
	where DBA.RATE.ID_COUNTRY = :ls_country
	  and DBA.RATE.ID_COUNTRY_SOURCE = :ls_country_source
	  and abs(((:ld_new_rate - DBA.RATE.RATE )/ DBA.RATE.RATE)*100) > 10.00;

	if ld_return > 0  then
		ll_cont= ll_cont+ 1
		ls_countries = ls_countries +"-" + ls_country
	end if
NEXT

if (ll_cont > 0) then
	Messagebox("Error","La variación de la tasa nueva es muy grande para las tasas de: " + ls_countries + ", No se realizará la actualización de las tasas.  Por favor revise nuevamente.",StopSign!)
	return -1
else
	return  1
end if

end event

