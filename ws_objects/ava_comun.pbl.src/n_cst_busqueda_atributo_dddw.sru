$PBExportHeader$n_cst_busqueda_atributo_dddw.sru
$PBExportComments$PFC DataWindow DropDownSearch attributes
forward
global type n_cst_busqueda_atributo_dddw from nonvisualobject
end type
end forward

global type n_cst_busqueda_atributo_dddw from nonvisualobject autoinstantiate
end type

type variables
Public:
string		s_columnname
string		s_editstyle
datawindowchild		dwc_object
end variables

on n_cst_busqueda_atributo_dddw.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_busqueda_atributo_dddw.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

