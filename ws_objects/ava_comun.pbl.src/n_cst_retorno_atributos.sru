$PBExportHeader$n_cst_retorno_atributos.sru
$PBExportComments$PFC Simple return attributes
forward
global type n_cst_retorno_atributos from nonvisualobject
end type
end forward

global type n_cst_retorno_atributos from nonvisualobject autoinstantiate
end type

type variables
Public:

integer	ii_rc=-99	// Return code
string	is_rs=''	// Return string
end variables

on n_cst_retorno_atributos.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_retorno_atributos.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

