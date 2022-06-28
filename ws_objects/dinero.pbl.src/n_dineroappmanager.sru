$PBExportHeader$n_dineroappmanager.sru
forward
global type n_dineroappmanager from n_cst_appmanager
end type
end forward

global type n_dineroappmanager from n_cst_appmanager
end type
global n_dineroappmanager n_dineroappmanager

type variables
Public:
string                            is_examplesini
n_cst_aboutattrib         inv_aboutattrib
n_cst_filesrv                 inv_filesrv
n_tr                               itr_messagesource
w_principal                   iw_mainwindow
//[CLONDONO][2013-07-22] Variables added for the encryption function
n_cryptoapi					in_crypto
end variables

forward prototypes
public function string of_getpbini ()
public function string of_getpfcexampinipath (string as_pbinipath)
public function integer of_setcurrentdirectorytoexamples ()
public function boolean of_isregistryavailable ()
end prototypes

public function string of_getpbini ();string			ls_dir
string			ls_drive
string			ls_ext
string			ls_filename
string			ls_path
string			ls_pbini
string 			ls_regkey

// Get the PB.INI location from the App Path.
ls_regkey = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\" + &
	"CurrentVersion\App Paths\PB60.EXE"

If of_IsRegistryAvailable() Then
	if RegistryGet(ls_regkey, "", ls_path) = 1 then
		inv_filesrv.of_parsepath(ls_path, ls_drive, ls_dir, ls_filename, ls_ext) 
		ls_pbini = inv_filesrv.of_assemblepath( ls_drive, ls_dir, "PB", "INI" )
	end if
Else
	return ""
End if

if not FileExists(ls_pbini) then
	ls_pbini = ""
end if

return ls_pbini

end function

public function string of_getpfcexampinipath (string as_pbinipath);string 			ls_ini
string			ls_initpath
string			ls_path
string 			ls_selectedfilename
string 			ls_selectedpathandfilename
integer			li_pos
integer			li_pos1
integer			li_rc
integer 			li_value

ls_initpath = ProfileString(as_pbinipath, "Application", "AppLib", "error")
li_pos = Pos(ls_initpath, "\appexamp.pbl")
if li_pos > 0 then
	ls_initpath = Left(ls_initpath, (li_pos - 1))
	if FileExists(ls_initpath + "\" + is_appinifile) then
		inv_filesrv.of_ChangeDirectory(ls_initpath)
		is_examplesini = ls_initpath
		return ls_initpath + " \" + is_appinifile
	end if
else
	li_rc = MessageBox("Initialization Error", "The PFC Examples Application "+&
		"was unable to determine the specific " + &
		"path to the " + is_appinifile + " file.~n" + & 
		"Do you want to try and find this file yourself?", question!, yesno!) 
	if li_rc = 1 then 
		li_value = GetFileOpenName("Select the " + is_appinifile + " file", &
			ls_selectedpathandfilename, ls_selectedfilename, "INI", "INI Files (*.INI),*.INI")	
		if li_value = 1 then 
			is_appinifile = ls_selectedfilename
			li_pos1 = Pos(ls_selectedpathandfilename, is_appinifile ) 
			ls_path = Left(ls_selectedpathandfilename, (li_pos1 - 2) )
			ls_ini = ls_path + "\" + is_appinifile
		end if
	end if
	if li_rc = 2 or li_value <> 1 then 
		MessageBox ( "Initialization Error", "Unable to continue without " +&
			is_appinifile + ".~n" + &
		 	"Terminating application.", information! ) 
		return "error"
	end if
end if

inv_filesrv.of_ChangeDirectory(ls_path)
is_examplesini = ls_path

return ls_ini
end function

public function integer of_setcurrentdirectorytoexamples ();integer			li_rc
n_cst_filesrv	lnv_filesrv

f_SetFileSrv(lnv_filesrv, true)
li_rc = lnv_filesrv.of_ChangeDirectory(is_examplesini)
f_SetFileSrv(lnv_filesrv, false)

return li_rc
end function

public function boolean of_isregistryavailable ();Return False
end function

on n_dineroappmanager.create
call super::create
end on

on n_dineroappmanager.destroy
call super::destroy
end on

event pfc_close;call super::pfc_close;if IsValid(sqlca) then destroy sqlca
if IsValid(inv_trregistration) then destroy inv_trregistration
if IsValid(inv_error) then destroy inv_error
if IsValid(inv_dwcache) then destroy inv_dwcache


end event

event pfc_open;call super::pfc_open;Long		ll_cont, ll_log_return
String		ls_path_pass, ls_cashier
String		ls_servername, ls_db
String 	ls_computername

RegistryGet("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName", "ComputerName", RegString!, ls_computername)
if isnull(ls_computername) or len(trim(ls_computername)) = 0 then ls_computername = 'UNKNOWN'

//messagebox("",ls_computername)

gs_pass = (Trim(CommandParm()))
//todo

//if  ls_computername = 'APPDEV104'  then	 
//	 // for developnment!
//	 gs_pass = 'LaLAlAL11A1a1AwqqWWq1oolLlm001VIAMERICAS\carlos.sarmiento'
//elseif  ls_computername =   'VIAMIA-TEC001' or  ls_computername =   'VIAMIA-TEC002' then	 
//	 // for developnment!
//	 gs_pass = 'LaLAlAL11A1a1AwqqWWq1oolLlm001VIAMERICAS\Eduardo.Cartagena'
//elseif ls_computername = 'EBERNAL7' then	 
//	 // for developnment!
//	 gs_pass = 'LaLAlAL11A1a1AwqqWWq1oolLlm001VIAMERICAS\ESTEBAN.BERNAL'
//elseif ls_computername = 'IT-ADMIN' then 
//	// for developnment! 
//	gs_pass = 'LaLAlAL11A1a1AwqqWWq1oolLlm001VIAMERICAS\darrel.clark'	 
//elseif ls_computername = 'VIAM-DEV018'  then	 
//	 // for developnment!
//	 gs_pass = 'LaLAlAL11A1a1AwqqWWq1oolLlm001VIAMERICAS\juan.henao'	
//end if
//

// <><><><><><><><><><><><><><><><><><><><><><><><><><><><>
// Gets the Windows user!

ContextKeyword lcxk_base
string ls_values[]

this.GetContextService("Keyword", lcxk_base)
lcxk_base.GetContextKeywords("USERNAME", ls_values)

if Upperbound(ls_values) > 0 THEN   
	ls_cashier = upper(ls_values[1])               
else   
	Messagebox("Error","Your user is not a valid domain user! (103-WinUsr)",StopSign!)
	Halt close
	return
end if

lcxk_base.GetContextKeywords("USERDOMAIN", ls_values)

if Upperbound(ls_values) > 0 THEN   
	ls_cashier = upper(ls_values[1]) + '\' + ls_cashier
else   
	Messagebox("Error","Your session is not a valid domain session! (104-WinDmn)",StopSign!)
	Halt close
	return
end if

// <><><><><><><><><><><><><><><><><><><><><><><><><><><><>

openwithparm(w_pass,ls_cashier)
ll_log_return = message.doubleparm
if ll_log_return = 1 then 
	gs_pass = 'LaLAlAL11A1a1AwqqWWq1oolLlm001' + ls_cashier
else
	Halt close
end if 

// Secret parm validation
if left(gs_pass,30) <> 'LaLAlAL11A1a1AwqqWWq1oolLlm001' then
	// fn_logattempt(upper(ls_cashier),'ERROR-DIN')
	Messagebox("Error","This application is not intended to be executed.",StopSign!)
	Halt close
	return
end if

// Match user from VB app to PB
if upper(ls_cashier) <> upper(fn_replace(gs_pass,'LaLAlAL11A1a1AwqqWWq1oolLlm001','')) then
	Messagebox("Error","Login User mitsmatch (105-VC-PB)."+ls_cashier,StopSign!)
	Halt close
	return
end if


gs_database = "Envio.ini"

//gs_ini = "C:\VIAMERICASMT\EnvioINI.ini"

//// Profile SQLServer
//SQLCA.DBMS = "SNC SQL Native Client(OLE DB)"
//SQLCA.DBParm = "Database='Envio',TrimSpaces=1"
//SQLCA.LogPass = "sql2005"
//SQLCA.ServerName = "VIARSQL"
////SQLCA.ServerName = "VIASQL05"
//SQLCA.LogId = "dba"
//SQLCA.AutoCommit = True

/*****csarmiento*******/
/***** mod: Oct/15/2013 
get the database connection string from a file
for envio
**/


// Envio
ls_servername=ProfileString('ViaCentral.ini','Envio','ServerName','')
ls_db=ProfileString('ViaCentral.ini','Envio','Database','')

// EnvioREP (Read Only Database)
gs_servername_rpt=ProfileString('ViaCentral.ini','EnvioREP','ServerName','')
gs_db_rpt=ProfileString('ViaCentral.ini','EnvioREP','Database','')


//ls_id=ProfileString('ViaCentral.ini','Envio','LogId','')
//ls_password=ProfileString('ViaCentral.ini','Envio','LogPass','')


/*****************/

// Domain Authentication 04/12/2012 (el usuario se valida en ViaCentral.exe (VB.NET)
SQLCA.DBMS  = "SNC SQL Native Client(OLE DB)"
SQLCA.DBParm = "Database='"+ls_db+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
SQLCA.ServerName =  ls_servername
SQLCA.AutoCommit = True

if SQLCA.of_connect() <> 0 then
	//fn_logattempt(upper(ls_cashier),'ERROR-DBA')
	Messagebox("Error","Your account doesn't have ViaCentral Access! (100-ViaCentralDB Role)"+char(13)+char(10)+SQLCA.SQLErrText,StopSign!)
	Halt close
	return
	
else
	// test connection to RPT Server
	n_tr SQLCA_RPT
	SQLCA_RPT = Create n_tr
	SQLCA_RPT.DBMS = "SNC SQL Native Client(OLE DB)"
	SQLCA_RPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
	SQLCA_RPT.ServerName = gs_servername_rpt
	if SQLCA_RPT.of_connect() <> 0 then
		Messagebox("Error","Error trying connection to Reporting Database"+char(13)+char(10)+SQLCA_RPT.SQLErrText,StopSign!)
		// Reports will be run on production
		gs_db_rpt = ls_db
		gs_servername_rpt = ls_servername				
		
	else
		//Messagebox("OK","Reporting database OK"+char(13)+char(10))
		SQLCA_RPT.of_disconnect()
		destroy SQLCA_RPT
		
		// --- 
		//2018/04/16: Connects the permanent RPT object
		SQLCARPT = Create n_tr
		SQLCARPT.DBMS = "SNC SQL Native Client(OLE DB)"
		SQLCARPT.AutoCommit = True
		SQLCARPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
		SQLCARPT.ServerName = gs_servername_rpt
		if SQLCARPT.of_connect() <> 0 then
			Messagebox("Error","Error trying connection to Reporting Database(2) "+char(13)+char(10)+SQLCARPT.SQLErrText,StopSign!)
		end if
		//-----
	

	end if
	
end if
                


// //////////////////////////////////////////
// Para activar el ROLE de APPLICACION
// Los usuarios de BD no tienen permisos, 
// los permisos se los da el APP ROLE.
// DECLARE sp_setapprole PROCEDURE FOR sp_setapprole @rolename = 'ap_viacentral', @password = 'GIMMITHAPOWER';
DECLARE sp_setapprole PROCEDURE FOR sp_setapprole @rolename = 'ap_viacentral', @password = 'gimmithapower';
Execute sp_setapprole;

if SQLCA.SQLCode <> 100 then
	Messagebox("Error "+String(SQLCA.SQLCode),"ROLE 'ap_viacentral' WAS NOT ACTIVATED, PLEASE CONTACT TECHNOLOGY.~n"+SQLCA.SQLErrText,StopSign!)
	Halt close
	return 
end if

// Read 
DECLARE sp_setapprole1 PROCEDURE FOR sp_setapprole @rolename = 'ap_viacentral', @password = 'gimmithapower' using SQLCARPT;
Execute sp_setapprole1;
if SQLCARPT.SQLCode <> 100 then
	Messagebox("Error "+String(SQLCARPT.SQLCode),SQLCARPT.SQLErrText+"  ROLE 'ap_viacentral' WAS NOT ACTIVATED for Reporting DB, PLEASE CONTACT TECHNOLOGY.~n"+SQLCA.SQLErrText,StopSign!)
	Halt close
	return 
end if
// //////////////////////////////////////////       

ls_cashier = fn_replace(ls_cashier,"VIAMERICAS\","")

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the username

SELECT Count(*)  
INTO :ll_cont  
FROM dba.cashier  
WHERE dba.cashier.ad_user = :ls_cashier;

// El Usuario No Existe
if ll_cont = 0 then	
	// Failed Attempt : Unknown User
	//fn_logattempt(upper(ls_cashier),'ERROR-UNF')
	Messagebox("Error","Your account doesn't have ViaCentral Access! (101-CashierRecord)",StopSign!)
	Halt close
	return                
end if
                
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the account
                
SELECT Count(*)  
INTO :ll_cont  
FROM dba.cashier  
WHERE dba.cashier.ad_user = :ls_cashier
AND dba.cashier.id_flag = 'A';

// La cuenta no esta activa
if ll_cont = 0 then
	//fn_logattempt(upper(ls_cashier),'ERROR-UIN')
	// Failed attempt : Inactive Account
	Messagebox("Error","Account is disabled, Please contact the System Administrator  (102-CashierRecord)",StopSign!)
	//CloseWithReturn(w_pass,2)
	halt close
	return
end if

SELECT dba.cashier.id_cashier
INTO :gs_cashier
FROM dba.cashier
WHERE dba.cashier.ad_user = :ls_cashier;

// Global
gs_login = ls_cashier

Open(w_principal)

// moved to w_principal - open
//w_principal.fn_posloggin() // Refresca el menu de acuerdo a los permisos       
//fn_logattempt(upper(ls_cashier),'OK')

SetProfileString(gs_database,"HostID", "ID","0001A00001")
//FILEDELETE(gs_ini)
end event

event pfc_systemerror;call super::pfc_systemerror;halt close
end event

