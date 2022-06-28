$PBExportHeader$n_common_connect.sru
forward
global type n_common_connect from nonvisualobject
end type
end forward

global type n_common_connect from nonvisualobject
end type
global n_common_connect n_common_connect

forward prototypes
public function boolean of_connect_sqlca ()
public function boolean of_connect_sqlviachecks ()
end prototypes

public function boolean of_connect_sqlca ();long		ll_profile, ll_cont
string		ls_database, ls_logpass, ls_path_pass, ls_cashier
String 	ls_servername, ls_logid, ls_password, ls_db, ls_dbms, ls_AutoCommit



//Don (11-14-2013) - Added some changes to what Carlos started.  ****************
gs_current_env	=	ProfileString(gs_ini_file,'ENVIRONMENT','Current','Development')

IF gs_current_env = "Production"	THEN
	ls_dbms			=	ProfileString(gs_ini_file,gs_current_env,'DBMS','')
	ls_servername	=	ProfileString(gs_ini_file,gs_current_env,'ServerName','')
	ls_logid			=	ProfileString(gs_ini_file,gs_current_env,'LogId','')
	ls_logpass		=	ProfileString(gs_ini_file,gs_current_env,'LogPass','')
	ls_db				=	ProfileString(gs_ini_file,gs_current_env,'Database','')
	ls_AutoCommit	=	ProfileString(gs_ini_file,gs_current_env,'AutoCommit','')
	gs_drive 			= 	"S:\"	
	gs_agencies_folder = 'R:\OUTPUT\'
	
ELSE
	ls_dbms			=	ProfileString(gs_ini_file,gs_current_env,'DBMS','')
	ls_servername	=	ProfileString(gs_ini_file,gs_current_env,'ServerName','')
	ls_logid			=	ProfileString(gs_ini_file,gs_current_env,'LogId','')
	ls_logpass		=	ProfileString(gs_ini_file,gs_current_env,'LogPass','')
	ls_db				=	ProfileString(gs_ini_file,gs_current_env,'Database','') 
	ls_AutoCommit	=	ProfileString(gs_ini_file,gs_current_env,'AutoCommit','')
	gs_drive 			= 	"J:\"
	gs_agencies_folder = 'J:\OUTPUT\'
END IF

IF UPPER(ls_AutoCommit) = "TRUE"	THEN
	SQLCA.AutoCommit       = TRUE
ELSE
	SQLCA.AutoCommit       = FALSE
END IF

// Domain Authentication 04/12/2012 (el usuario se valida en ViaCentral.exe (VB.NET)
SQLCA.DBMS			=	ls_dbms
SQLCA.ServerName	=	ls_servername
SQLCA.LogId			=	ls_logid
SQLCA.LogPass			=	ls_logpass
SQLCA.DBParm = "Database='" + ls_db + "',TrimSpaces=1,Provider='SQLNCLI10',AppName='ViaTransmitir'"
//*******************  END OF .INI FILE CHANGES  *******************************************

IF NOT SQLCA.of_IsConnected()	THEN
	CONNECT USING SQLCA;
	IF SQLCA.SQLCODE <> 0	THEN
		Messagebox("Error","Unable to Connect:  " + SQLCA.SQLErrText)
		HALT
	END IF
END IF

//DON TEST UNCOMMENT below before check in
//if SQLCA.of_connect() <> 0 then
//                //fn_logattempt(upper(ls_cashier),'ERROR-DBA')
//                Messagebox("Error","Your account doesn't have ViaCentral Access! (100-ViaCentralDB Role)"+char(13)+char(10)+SQLCA.SQLErrText,StopSign!)
//                Halt close
//                return
//end if
                



RETURN	TRUE
end function

public function boolean of_connect_sqlviachecks ();long		ll_profile, ll_cont
string		ls_database, ls_pass, ls_path_pass, ls_cashier
String 	ls_servername, ls_id, ls_password, ls_db, ls_dbms, ls_AutoCommit



//Don (11-06-2013) - Added some changes to what Carlos started.  ****************
IF SQLVIACHECKS.of_IsConnected()	THEN	RETURN TRUE
	
gs_ini_file	= 	"C:\VIAMERICASMT\ViaCentral2.ini"
gs_current_env	=	ProfileString(gs_ini_file,'SQLVIACHECKS','Current','SQLVIACHECKS-Development')

IF gs_current_env = "SQLVIACHECKS-Production"	THEN
	ls_dbms			=	ProfileString(gs_ini_file,gs_current_env,'DBMS','')
	ls_servername	=	ProfileString(gs_ini_file,gs_current_env,'ServerName','')
	ls_id				=	ProfileString(gs_ini_file,gs_current_env,'LogId','')
	ls_password		=	ProfileString(gs_ini_file,gs_current_env,'LogPass','')
	ls_db				=	ProfileString(gs_ini_file,gs_current_env,'Database','')
	ls_AutoCommit	=	ProfileString(gs_ini_file,gs_current_env,'AutoCommit','')
ELSE
	ls_dbms			=	ProfileString(gs_ini_file,gs_current_env,'DBMS','')
	ls_servername	=	ProfileString(gs_ini_file,gs_current_env,'ServerName','')
	ls_id				=	ProfileString(gs_ini_file,gs_current_env,'LogId','')
	ls_password		=	ProfileString(gs_ini_file,gs_current_env,'LogPass','')
	ls_db				=	ProfileString(gs_ini_file,gs_current_env,'Database','') 
	ls_AutoCommit	=	ProfileString(gs_ini_file,gs_current_env,'AutoCommit','')
END IF

IF UPPER(ls_AutoCommit) = "TRUE"	THEN
	SQLVIACHECKS.AutoCommit       = TRUE
ELSE
	SQLVIACHECKS.AutoCommit       = FALSE
END IF

// Domain Authentication 04/12/2012 (el usuario se valida en ViaCentral.exe (VB.NET)
SQLVIACHECKS.DBMS			=	ls_dbms
SQLVIACHECKS.ServerName	=	ls_servername
SQLVIACHECKS.LogId				=	ls_id
SQLVIACHECKS.LogPass			=	ls_password
//SQLCA.DBParm = "ConnectString='DSN=ViamericasMT;UID=" + ls_id + ";PWD=" + ls_password + "'"  //ODBC CONNECTION
SQLVIACHECKS.DBParm      	= 	"Database='" + ls_db + "',Provider='SQLNCLI10',AppName='ViaTransmitir'"	//,TrustedConnection=1,TrimSpaces=1,Secure=1"


//SQLCA.DBParm                                 = "Database='"+ls_db+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
//SQLCA.ServerName        =  ls_servername // '192.168.11.100' 
//SQLCA.ServerName    =  '192.168.11.102'
//*******************  END OF .INI FILE CHANGES  *******************************************


CONNECT USING SQLVIACHECKS;
IF SQLVIACHECKS.SQLCODE <> 0	THEN
	Messagebox("Error","Unable to Connect:  " + SQLVIACHECKS.SQLErrText)
	HALT
END IF


//DON TEST UNCOMMENT below before check in
//if SQLVIACHECKS.of_connect() <> 0 then
//                //fn_logattempt(upper(ls_cashier),'ERROR-DBA')
//                Messagebox("Error","Your account doesn't have ViaCentral Access! (100-ViaCentralDB Role)"+char(13)+char(10)+SQLVIACHECKS.SQLErrText,StopSign!)
//                Halt close
//                return
//end if
                



RETURN	TRUE
end function

on n_common_connect.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_common_connect.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

