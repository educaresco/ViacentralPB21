$PBExportHeader$w_seleccionar_city.srw
forward
global type w_seleccionar_city from Window
end type
type dw_1 from datawindow within w_seleccionar_city
end type
end forward

global type w_seleccionar_city from Window
int X=823
int Y=360
int Width=2670
int Height=1204
boolean TitleBar=true
string Title="Untitled"
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
dw_1 dw_1
end type
global w_seleccionar_city w_seleccionar_city

on w_seleccionar_city.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_seleccionar_city.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_seleccionar_city
int X=18
int Y=28
int Width=2610
int Height=1036
int TabOrder=10
string DataObject="select_city"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event constructor;dw_1.settransobject(sqlca)

dw_1.retrieve()
end event

event clicked;if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
end if
end event

event doubleclicked;long		ll_row
string	ls_city, ls_state, ls_country, ls_name_city, ls_name_state, ls_name_country

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_city = dw_1.getitemstring(ll_row,"city_id_city")
	ls_state = dw_1.getitemstring(ll_row,"city_id_state")
	ls_country = dw_1.getitemstring(ll_row,"city_id_country")
	ls_name_city = dw_1.getitemstring(ll_row,"city_name_city")
	ls_name_state = dw_1.getitemstring(ll_row,"state_name_state")
	ls_name_country = dw_1.getitemstring(ll_row,"country_name_country")

   closewithreturn(w_seleccionar_city, ls_city+"-"+ls_state+"-"+ls_country+"-"+ls_name_city+"-"+ls_name_state+"-"+ls_name_country)

end if

end event

