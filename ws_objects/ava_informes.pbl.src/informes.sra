$PBExportHeader$informes.sra
forward
global type informes from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
WINDOW	gw_ventana_seleccion
STRING		gs_nombre_empresa, &
		gs_nombre_aplicacion, &
		gs_usuario, &
		gs_servidor
		
		
//a borrar 
n_DineroAppmanager gnv_app
end variables

global type informes from application
string appname = "informes"
end type
global informes informes

on informes.create
appname="informes"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on informes.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Open(w_principal)
end event

