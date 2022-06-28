$PBExportHeader$n_cst_atributos_filtro.sru
forward
global type n_cst_atributos_filtro from nonvisualobject
end type
end forward

global type n_cst_atributos_filtro from nonvisualobject autoinstantiate
end type

type variables
Public:
string	is_filter
string 	is_columns[]
string 	is_colnamedisplay[]
string 	is_dbnames[]
//u_dw 	idw_dw

uo_frmwrk_datawindow idw_dw

end variables

on n_cst_atributos_filtro.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_atributos_filtro.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

