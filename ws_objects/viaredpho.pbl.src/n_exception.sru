$PBExportHeader$n_exception.sru
forward
global type n_exception from throwable
end type
end forward

global type n_exception from throwable
end type
global n_exception n_exception

type variables
private STRING is_tipo_mensaje
end variables

forward prototypes
public subroutine set_tipo_mensaje (string ps_tipo_mensaje)
public function string get_tipo_mensaje ()
end prototypes

public subroutine set_tipo_mensaje (string ps_tipo_mensaje);is_tipo_mensaje = ps_tipo_mensaje
end subroutine

public function string get_tipo_mensaje ();RETURN is_tipo_mensaje
end function

on n_exception.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_exception.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

