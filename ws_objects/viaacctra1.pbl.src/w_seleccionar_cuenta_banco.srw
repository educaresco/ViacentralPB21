$PBExportHeader$w_seleccionar_cuenta_banco.srw
forward
global type w_seleccionar_cuenta_banco from Window
end type
type dw_1 from datawindow within w_seleccionar_cuenta_banco
end type
end forward

global type w_seleccionar_cuenta_banco from Window
int X=823
int Y=360
int Width=2469
int Height=1204
boolean TitleBar=true
string Title="Untitled"
long BackColor=80269524
boolean ControlMenu=true
WindowType WindowType=response!
dw_1 dw_1
end type
global w_seleccionar_cuenta_banco w_seleccionar_cuenta_banco

on w_seleccionar_cuenta_banco.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_seleccionar_cuenta_banco.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_seleccionar_cuenta_banco
int X=27
int Y=32
int Width=2377
int Height=1048
int TabOrder=10
string DataObject="dw_seleccionar_cuenta_banco"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event doubleclicked;long		ll_row
string	ls_banco, ls_cuenta, ls_cadena, ls_nombre

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_banco = dw_1.getitemstring(ll_row,"id_banco")
	ls_cuenta = dw_1.getitemstring(ll_row,"id_cuenta_banco")
	ls_nombre = dw_1.getitemstring(ll_row,"banco_name_banco")
	ls_cadena = ls_banco +','+ ls_cuenta + ',' + ls_nombre
	closewithreturn(w_seleccionar_cuenta_banco,ls_cadena)
end if
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

event constructor;dw_1.settransobject(sqlca)

dw_1.retrieve()
end event

