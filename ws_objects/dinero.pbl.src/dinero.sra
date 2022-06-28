$PBExportHeader$dinero.sra
forward
global type dinero from application
end type
global n_tr sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global n_msg message
end forward

global variables
n_DineroAppmanager gnv_app

// ViaChecks Database:
n_tr	SQLVIACHECKS
// Read Only database:
n_tr 	SQLCARPT

string	gs_cashier,gs_ofac_city,	&
	gs_login,		&
	gs_mod_pay,	&
	gs_mod_currency,	&
	gs_city,		&
	gs_branch,	&
	gs_branch_insta,	&
	gs_city_receiver,	&
	gs_country_receiver,	&
	gs_branch_insta_cons,	&
	gs_branch_consulta,	&
	gs_ver, gs_pagador_ultimo,gs_ofac_address,gs_ofac_country

Double	gl_sender, gl_receiver_cons, gd_phone_sender
Double	gd_porcentaje

Boolean	gb_actualizado = False, gb_admin = False

Date	gd_fecha1, gd_fecha2

String	gs_database, gs_db, gs_iduser
//, gs_ini
n_common_connect	gnv_common_connect  

Long  	gl_timer = 0, gl_sp_no_trans = 0, gi_winpos
double	gl_pendientes = 0, gd_contable = 0

string	gs_user, gs_pass, gs_phone_receiver_ofac

String	gs_name_ofac_sender, gs_name_ofac_receiver
datetime gd_ofac_datereceiver

String   gs_release = '0'

Boolean  gb_ofacbysender = FALSE

Boolean 	gb_exportarlimitecredito = FALSE
Boolean gb_prevent_rate_retrieve = FALSE

Long 		gl_vernum

Boolean  gb_isProduction = TRUE

double ld_areceiver[], ld_dummy[]

String gs_nombre_aplicacion, gs_usuario, gs_servidor, gs_nombre_empresa
string	gs_input,  gs_data, gs_isProduction, gs_current_env, gs_ini_file, gs_drive, gs_agencies_folder

Window gw_ventana_seleccion

//impresion
String gs_impresora

String gs_specialallowedchars

String gs_servername_rpt, gs_db_rpt
end variables

global type dinero from application
string appname = "dinero"
string appruntimeversion = "21.0.0.1506"
end type
global dinero dinero

type prototypes
FUNCTION boolean CopyFileA(ref string cfrom, ref string cto, boolean flag) LIBRARY "Kernel32.dll" alias for "CopyFileA;Ansi"
SUBROUTINE Sleep(ulong milli) LIBRARY "Kernel32.dll"

// Browse for folder!
Function unsignedlong SHGetPathFromIDListA( unsignedlong pidl, ref string pszPath) Library 'shell32' alias for "SHGetPathFromIDListA;Ansi"
Function unsignedlong SHBrowseForFolderA( browseinfo lpbrowseinfo ) Library 'shell32' alias for "SHBrowseForFolderA;Ansi"
Subroutine CoTaskMemFree( ulong idlist ) Library 'ole32'

end prototypes

on dinero.create
appname="dinero"
message=create n_msg
sqlca=create n_tr
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on dinero.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;gnv_app = create n_DineroAppmanager
gnv_app.TriggerEvent('Pfc_open')

end event

event close;gnv_app.TriggerEvent('pfc_close')
if IsValid(gnv_app) then destroy gnv_app


end event

event systemerror;gnv_app.event pfc_systemerror()
end event

