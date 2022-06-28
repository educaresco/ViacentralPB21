$PBExportHeader$n_cst_configuracion_regional.sru
forward
global type n_cst_configuracion_regional from nonvisualobject
end type
end forward

global type n_cst_configuracion_regional from nonvisualobject
end type
global n_cst_configuracion_regional n_cst_configuracion_regional

type variables

end variables

forward prototypes
public function string of_get_formato_fecha_corta ()
end prototypes

public function string of_get_formato_fecha_corta ();String ls_direccion, ls_fecha_corta

//Dirección del REGEDIT donde está almacenada la configuración regional
ls_direccion = "HKEY_CURRENT_USER\Control Panel\International"

//Obtiene las configuraciones específicas
RegistryGet(ls_direccion, "sShortDate", RegString!, ls_fecha_corta)

Return ls_fecha_corta
end function

on n_cst_configuracion_regional.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_configuracion_regional.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

