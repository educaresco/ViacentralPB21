$PBExportHeader$w_pass.srw
forward
global type w_pass from window
end type
type cb_3 from commandbutton within w_pass
end type
type st_8 from statictext within w_pass
end type
type st_1 from statictext within w_pass
end type
type st_arrow from statictext within w_pass
end type
type st_6 from statictext within w_pass
end type
type st_5 from statictext within w_pass
end type
type cb_5 from commandbutton within w_pass
end type
type cb_4 from commandbutton within w_pass
end type
type sle_new2 from singlelineedit within w_pass
end type
type sle_new1 from singlelineedit within w_pass
end type
type cb_changepass from commandbutton within w_pass
end type
type cbx_dev from checkbox within w_pass
end type
type cb_2 from commandbutton within w_pass
end type
type lb_files from listbox within w_pass
end type
type st_4 from statictext within w_pass
end type
type sle_intentos from singlelineedit within w_pass
end type
type sle_pass from singlelineedit within w_pass
end type
type sle_userid from singlelineedit within w_pass
end type
type cb_1 from commandbutton within w_pass
end type
type st_3 from statictext within w_pass
end type
type st_2 from statictext within w_pass
end type
type cb_cancel from commandbutton within w_pass
end type
type gb_1 from groupbox within w_pass
end type
type gb_2 from groupbox within w_pass
end type
end forward

global type w_pass from window
integer x = 987
integer y = 816
integer width = 1883
integer height = 708
windowtype windowtype = response!
long backcolor = 16777215
cb_3 cb_3
st_8 st_8
st_1 st_1
st_arrow st_arrow
st_6 st_6
st_5 st_5
cb_5 cb_5
cb_4 cb_4
sle_new2 sle_new2
sle_new1 sle_new1
cb_changepass cb_changepass
cbx_dev cbx_dev
cb_2 cb_2
lb_files lb_files
st_4 st_4
sle_intentos sle_intentos
sle_pass sle_pass
sle_userid sle_userid
cb_1 cb_1
st_3 st_3
st_2 st_2
cb_cancel cb_cancel
gb_1 gb_1
gb_2 gb_2
end type
global w_pass w_pass

type prototypes
Function ulong WNetGetUser(string lpname, ref string lpusername, ref ulong buflen) Library "mpr.dll" Alias For "WNetGetUserW"
Function boolean LogonUser ( string lpszUsername, string lpszDomain, string lpszPassword, ulong dwLogonType, ulong dwLogonProvider, ref ulong phToken) Library "advapi32.dll" Alias For "LogonUserW"
Function boolean CloseHandle (ulong hObject) Library "kernel32.dll"
end prototypes

type variables
long	il_intento = 0
Boolean	ib_actualizado=False

string is_session, is_user, is_domain, is_client

Constant ULong LOGON32_LOGON_NETWORK = 3
Constant ULong LOGON32_PROVIDER_DEFAULT = 0
end variables

forward prototypes
public subroutine fn_logattempt (string vc_user, string vc_result)
end prototypes

public subroutine fn_logattempt (string vc_user, string vc_result);

INSERT INTO dba.AUDIT_VCENTRAL_LOGIN(DATE_AUDIT,PC_DOMAIN,PC_USER,PC_SESSION,PC_CLIENT,VC_USER,RESULT)
VALUES(GETDATE(),:is_domain,:is_user,:is_session,:is_client,:vc_user,:vc_result);

end subroutine

on w_pass.create
this.cb_3=create cb_3
this.st_8=create st_8
this.st_1=create st_1
this.st_arrow=create st_arrow
this.st_6=create st_6
this.st_5=create st_5
this.cb_5=create cb_5
this.cb_4=create cb_4
this.sle_new2=create sle_new2
this.sle_new1=create sle_new1
this.cb_changepass=create cb_changepass
this.cbx_dev=create cbx_dev
this.cb_2=create cb_2
this.lb_files=create lb_files
this.st_4=create st_4
this.sle_intentos=create sle_intentos
this.sle_pass=create sle_pass
this.sle_userid=create sle_userid
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_3,&
this.st_8,&
this.st_1,&
this.st_arrow,&
this.st_6,&
this.st_5,&
this.cb_5,&
this.cb_4,&
this.sle_new2,&
this.sle_new1,&
this.cb_changepass,&
this.cbx_dev,&
this.cb_2,&
this.lb_files,&
this.st_4,&
this.sle_intentos,&
this.sle_pass,&
this.sle_userid,&
this.cb_1,&
this.st_3,&
this.st_2,&
this.cb_cancel,&
this.gb_1,&
this.gb_2}
end on

on w_pass.destroy
destroy(this.cb_3)
destroy(this.st_8)
destroy(this.st_1)
destroy(this.st_arrow)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.sle_new2)
destroy(this.sle_new1)
destroy(this.cb_changepass)
destroy(this.cbx_dev)
destroy(this.cb_2)
destroy(this.lb_files)
destroy(this.st_4)
destroy(this.sle_intentos)
destroy(this.sle_pass)
destroy(this.sle_userid)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_cancel)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//this.height = 728

cbx_dev.visible = false
cbx_dev.enabled = false
cbx_dev.checked = false

// -----------------------------------------------------------------------------
// Centra la pantalla
environment env
integer rtn
rtn = GetEnvironment(env)
this.x = (PixelsToUnits ( env.ScreenWidth, XPixelsToUnits! )/2) - (this.width/2)
this.y = (PixelsToUnits ( env.ScreenHeight, YPixelsToUnits! )/2) - (this.height/2) - 100
// Questions? estebanbernal@hotmail.com
// -----------------------------------------------------------------------------

il_intento = 1
sle_intentos.text = string(il_intento)
sle_userid.setfocus()

//w_principal.fn_preloggin() // Deshabilita el menu

//Timer(30)


// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Gets the Domain/session info!
ContextKeyword lcxk_base
string ls_values[]

this.GetContextService("Keyword", lcxk_base)


lcxk_base.GetContextKeywords("USERDOMAIN", ls_values)

IF Upperbound(ls_values) > 0 THEN   
	is_domain = upper(ls_values[1])
ELSE   
	is_domain = "*UNDEFINED*"
END IF

lcxk_base.GetContextKeywords("SESSIONNAME", ls_values)

IF Upperbound(ls_values) > 0 THEN   
	is_session = upper(ls_values[1])
ELSE
	is_session = "*UNDEFINED*"
END IF


lcxk_base.GetContextKeywords("CLIENTNAME", ls_values)

IF Upperbound(ls_values) > 0 THEN   
	is_client = upper(ls_values[1])
ELSE
	is_client = "*UNDEFINED*"
END IF

lcxk_base.GetContextKeywords("USERNAME", ls_values)

IF Upperbound(ls_values) > 0 THEN   
	is_user = upper(ls_values[1])
	sle_userid.text = is_domain +'\'+ lower(is_user)
	SetFocus(sle_pass)
ELSE   
	is_user = "*UNDEFINED*"
END IF

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end event

event timer;//CloseWithReturn(w_pass,2)
end event

type cb_3 from commandbutton within w_pass
integer x = 777
integer y = 500
integer width = 855
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Login"
boolean default = true
end type

event clicked;long		ll_cont = 0
string		ls_cashier, ls_pass, ls_domain
string 	ls_computername
ULong lul_token
Boolean lbl_result

RegistryGet("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName", "ComputerName", RegString!, ls_computername)
if isnull(ls_computername) or len(trim(ls_computername)) = 0 then ls_computername = 'UNKNOWN'		

If il_intento >= 4 then
	CloseWithReturn(w_pass,2)
	halt
	return
end if

string ls_titlemsg

ls_titlemsg = fn_busparameter("TITLEMSG")
if isnull(ls_titlemsg) then ls_titlemsg = ""


ls_cashier 	= fn_replace(lower(sle_userid.text),'viamericas\','')
gs_login    	= ls_cashier
ls_pass	  	= sle_pass.text

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the username

//SELECT Count(*)  
//INTO :ll_cont  
//FROM dba.cashier  
//WHERE dba.cashier.ad_user = :ls_cashier;
//
//// El Usuario No Existe
//if ll_cont = 0 and upper(ls_cashier) <> 'PRUEBAS' then
//	
//	// Failed Attempt : Unknown User
//	Messagebox("Error","Invalid Username",StopSign!)
//	sle_userid.selecttext(1,15)
//	sle_userid.setfocus()
//	sle_intentos.text = string(il_intento)
//	il_intento = il_intento + 1		
//	
//	fn_logattempt(upper(ls_cashier),'ERROR-UNF')
//	
//	return
//	
//end if
	
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the account
	
//SELECT Count(*)  
//INTO :ll_cont  
//FROM dba.cashier  
//WHERE dba.cashier.ad_user = :ls_cashier
//AND dba.cashier.id_flag = 'A';
//
//// La cuenta no esta activa
//if ll_cont = 0 and upper(ls_cashier) <> 'PRUEBAS' then
//	
//	fn_logattempt(upper(ls_cashier),'ERROR-UIN')
//	
//	// Failed attempt : Inactive Account
//	Messagebox("Error","Account is disabled, Please contact the System Administrator",StopSign!)
//	CloseWithReturn(w_pass,2)
//	halt
//	return
//	
//end if



//if cbx_dev.checked = true then
//	gb_isProduction = false
//else
	gb_isProduction = true
//end if

Int li_return_auth

//OLETxnObject EmpObj
//Integer li_rc
//EmpObj = CREATE OLETxnObject
//
//li_rc = EmpObj.ConnectTonewObject( "LoginActiveDirectory.LDAPAutenticador")
////li_rc = EmpObj.ConnectToObject( "C:\ViamericasMT\LoginActiveDirectory.dll", "LoginActiveDirectory.LDAPAutenticador")
//
//IF li_rc < 0 THEN
//    DESTROY EmpObj
//    // MessageBox("Connecting to COM Object Failed",   "Error: " + String(li_rc))
//	Messagebox("Autentification Error",'Unable to authenticate your credentials...!' )
//   Return
//END IF



//li_return_auth = EmpObj.AutenticatheUser(ls_cashier,ls_pass)
ls_domain = "VIAMERICAS"
lbl_result = LogonUser( ls_cashier, ls_domain, ls_pass, LOGON32_LOGON_NETWORK, LOGON32_PROVIDER_DEFAULT, lul_token )



//EmpObj.SetComplete()
//EmpObj.DisconnectObject()


if NOT lbl_result then 
		// Failed Attempt : Unknown User
	Messagebox("Error","Invalid credentials",StopSign!)
//	sle_userid.selecttext(1,15)
	sle_pass.post setfocus()
	sle_intentos.text = string(il_intento)
	il_intento = il_intento + 1		
	
	//fn_logattempt(upper(ls_cashier),'ERROR-UNF')
	return
end if


CloseWithReturn(parent,1)

end event

type st_8 from statictext within w_pass
boolean visible = false
integer x = 9
integer y = 236
integer width = 1801
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 8421504
long backcolor = 25231359
string text = "!! Please Use your EMAIL/Domain User and Password !!"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_1 from statictext within w_pass
integer x = 9
integer y = 60
integer width = 1801
integer height = 140
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 32768
long backcolor = 16777215
string text = "ViaCentral Login"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_arrow from statictext within w_pass
boolean visible = false
integer x = 1847
integer y = 816
integer width = 64
integer height = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
long textcolor = 33554432
long backcolor = 67108864
string text = "6"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;cb_changepass.triggerevent(Clicked!)
end event

type st_6 from statictext within w_pass
boolean visible = false
integer x = 27
integer y = 1076
integer width = 302
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
boolean enabled = false
string text = "New Pass.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_pass
boolean visible = false
integer x = 27
integer y = 984
integer width = 302
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
boolean enabled = false
string text = "New Pass.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_pass
boolean visible = false
integer x = 850
integer y = 1060
integer width = 302
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cancel"
end type

event clicked;cb_changepass.triggerevent(Clicked!)
end event

type cb_4 from commandbutton within w_pass
boolean visible = false
integer x = 850
integer y = 968
integer width = 302
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Change"
end type

event clicked;long		ll_cont = 0
string	ls_cashier, ls_pass
string 	ls_computername, ls_newpass

RegistryGet("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName", "ComputerName", RegString!, ls_computername)
if isnull(ls_computername) or len(trim(ls_computername)) = 0 then ls_computername = 'UNKNOWN'		

If il_intento >= 4 then
	CloseWithReturn(w_pass,2)
	halt
	return
end if

ls_cashier = sle_userid.text
gs_login   = ls_cashier
ls_pass	  = sle_pass.text


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the username

SELECT Count(*)  
  INTO :ll_cont  
  FROM dba.cashier  
 WHERE ( dba.cashier.name_cashier = :ls_cashier );

// El Usuario No Existe
if ll_cont = 0 then
	
	// Failed Attempt : Unknown User
	Messagebox("Error","Invalid Username",StopSign!)
	sle_userid.selecttext(1,15)
	sle_userid.setfocus()
	sle_intentos.text = string(il_intento)
	il_intento = il_intento + 1		
	return
	
end if

	
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the account
	
SELECT Count(*)  
  INTO :ll_cont  
  FROM dba.cashier  
 WHERE ( dba.cashier.name_cashier = :ls_cashier ) 
   AND ( dba.cashier.id_flag = 'A' ) ;

// La cuenta no esta activa
if ll_cont = 0 then
	
	// Failed attempt : Inactive Account
	Messagebox("Error","Account is disabled, Please contact the System Administrator",StopSign!)
	CloseWithReturn(w_pass,2)
	halt
	return
	
end if


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the password using the DB-USER

// :::::::::::::::::::::::::::::::::::::::::
// LOGIN DB CONNECTION
n_tr		SQLLOGGIN
SQLLOGGIN = Create n_tr
SQLLOGGIN.DBMS = "SNC SQL Native Client(OLE DB)"
SQLLOGGIN.DBParm = "Database='Envio'"
SQLLOGGIN.LogId 		= ls_cashier
SQLLOGGIN.LogPass 	= ls_pass		
SQLLOGGIN.ServerName 	= "VIARSQL"	
// :::::::::::::::::::::::::::::::::::::::::		


if SQLLOGGIN.of_connect() <> 0 then
	
	// Failed attempt
	Messagebox("Error","Invalid Password, yo must enter your current password before changing it",StopSign!)
	sle_pass.selecttext(1,15)
	sle_pass.setfocus()
	sle_intentos.text = string(il_intento)	
	il_intento = il_intento + 1

else

	// Desconecta la conexion LOGGIN ATTEMPT
	IF SQLLOGGIN.of_IsConnected() THEN
		SQLLOGGIN.of_Disconnect()
	END IF		
	

	// Password original ha sido validado, ahora se valida el cambio	
	if len(sle_new1.text) < 6 then
		Messagebox("Error","New password must be at least 6 chars",StopSign!)
		sle_new1.selecttext(1,15)
		sle_new1.setfocus()
		sle_new2.text = ""
		return
	end if
	
	if sle_new1.text <> sle_new2.text then
		Messagebox("Error","New password doesn't match, please re-enter new password",StopSign!)
		sle_new1.selecttext(1,15)
		sle_new1.setfocus()
		sle_new2.text = ""		
		return
	end if
	
	ls_newpass = sle_new1.text
	
	DECLARE sp_Password PROCEDURE FOR dbo.sp_password
	@old = NULL,
	@new = :ls_newpass,
	@loginame = :ls_cashier;	
	
	EXECUTE sp_password;

	MessageBox("Confirmation","Password Changed successful, please use the new password",Information!)	
	il_intento = 1
	cb_changepass.triggerevent(Clicked!)
	sle_pass.text = ""
	sle_pass.setfocus()

	
end if


end event

type sle_new2 from singlelineedit within w_pass
boolean visible = false
integer x = 334
integer y = 1064
integer width = 498
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean password = true
integer limit = 20
end type

type sle_new1 from singlelineedit within w_pass
boolean visible = false
integer x = 334
integer y = 972
integer width = 498
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean password = true
integer limit = 20
end type

type cb_changepass from commandbutton within w_pass
boolean visible = false
integer x = 1211
integer y = 968
integer width = 773
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Change Password  "
end type

event clicked;sle_new1.text = ""
sle_new2.text = ""
	
if parent.height > 1000 then
	parent.height = 728
	st_arrow.text = "6"
	cb_1.enabled = true
	cb_cancel.enabled = true
else
	parent.height = 1056
	st_arrow.text = "5"
	cb_1.enabled = false
	cb_cancel.enabled = false
end if
end event

type cbx_dev from checkbox within w_pass
boolean visible = false
integer x = 1303
integer y = 1056
integer width = 302
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 255
long backcolor = 16777215
string text = "Devel."
end type

type cb_2 from commandbutton within w_pass
boolean visible = false
integer x = 297
integer y = 352
integer width = 247
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "none"
end type

event clicked;String	ls_branch
 
 
 DECLARE ach CURSOR FOR  
  SELECT dba.ach.id_branch  
    FROM dba.ach  
ORDER BY dba.ach.id_branch ASC  ;

open ach ;
fetch ach into :ls_branch ;
DO WHILE sqlca.sqlcode = 0
	
	  UPDATE dba.BRANCH  
     SET FORMA_PAGO_BRANCH = '04'  
     WHERE dba.BRANCH.ID_BRANCH = :ls_branch   ;

	
	fetch ach into :ls_branch ;
LOOP


close ach ;

commit ;
end event

type lb_files from listbox within w_pass
boolean visible = false
integer x = 1010
integer y = 516
integer width = 494
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;integer Total=0


Setpointer(Hourglass!)


lb_files.DirList("C:\DINERO\upgrade.*",0)

Total = lb_files.TotalItems ( )
 

if Total = 1 then
//	st_upgrade.text = "File UPGRADE.ARJ | Upgrade the Aplication ..."
//	Run("ARJ e -y upgrade.arj",Minimized!)
	gb_actualizado = True
	Beep(40)
else
	gb_actualizado = False
End if
sle_userid.SETFOCUS()

Setpointer(Arrow!)



end event

type st_4 from statictext within w_pass
boolean visible = false
integer x = 1682
integer y = 376
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Intentos :"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_intentos from singlelineedit within w_pass
boolean visible = false
integer x = 1943
integer y = 364
integer width = 73
integer height = 92
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean autohscroll = false
borderstyle borderstyle = styleraised!
end type

type sle_pass from singlelineedit within w_pass
integer x = 471
integer y = 404
integer width = 1161
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean password = true
integer limit = 50
end type

type sle_userid from singlelineedit within w_pass
integer x = 471
integer y = 312
integer width = 1161
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 32768
boolean enabled = false
textcase textcase = lower!
integer limit = 50
end type

event modified;if UPPER(this.text) = "PRUEBAS" then
	cbx_dev.visible = true
	cbx_dev.enabled = true
	cbx_dev.checked = true
end if
end event

type cb_1 from commandbutton within w_pass
integer x = 430
integer y = 824
integer width = 663
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "OK"
end type

event clicked;long		ll_cont = 0
string		ls_cashier, ls_pass
string 	ls_computername

RegistryGet("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName", "ComputerName", RegString!, ls_computername)
if isnull(ls_computername) or len(trim(ls_computername)) = 0 then ls_computername = 'UNKNOWN'		

If il_intento >= 4 then
	CloseWithReturn(w_pass,2)
	halt
	return
end if

string ls_titlemsg

ls_titlemsg = fn_busparameter("TITLEMSG")
if isnull(ls_titlemsg) then ls_titlemsg = ""


ls_cashier 	= fn_replace(lower(sle_userid.text),'@viamericas.com','')
gs_login    	= ls_cashier
ls_pass	  	= sle_pass.text

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the username

SELECT Count(*)  
INTO :ll_cont  
FROM dba.cashier  
WHERE dba.cashier.ad_user = :ls_cashier;

// El Usuario No Existe
if ll_cont = 0 and upper(ls_cashier) <> 'PRUEBAS' then
	
	// Failed Attempt : Unknown User
	Messagebox("Error","Invalid Username",StopSign!)
	sle_userid.selecttext(1,15)
	sle_userid.setfocus()
	sle_intentos.text = string(il_intento)
	il_intento = il_intento + 1		
	
	fn_logattempt(upper(ls_cashier),'ERROR-UNF')
	
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
if ll_cont = 0 and upper(ls_cashier) <> 'PRUEBAS' then
	
	fn_logattempt(upper(ls_cashier),'ERROR-UIN')
	
	// Failed attempt : Inactive Account
	Messagebox("Error","Account is disabled, Please contact the System Administrator",StopSign!)
	CloseWithReturn(w_pass,2)
	halt
	return
	
end if

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Check the password using the DB-USER

if cbx_dev.checked = true then
	gb_isProduction = false
else
	gb_isProduction = true
end if

/*****csarmiento*******/
/***** mod: Oct/15/2013 
		get the database connection string from a file for Viachecks
**/
String  ls_servername, ls_db


ls_servername=ProfileString('ViaCentral.ini','LOGIN','ServerName','')
ls_db=ProfileString('ViaCentral.ini','LOGIN','Database','')

/*****************/

// :::::::::::::::::::::::::::::::::::::::::
// LOGIN DB CONNECTION

n_tr		SQLLOGGIN
SQLLOGGIN 				= Create n_tr
SQLLOGGIN.DBMS 		= "SNC SQL Native Client(OLE DB)"
SQLLOGGIN.LogId 		= ls_cashier		
SQLLOGGIN.LogPass 		= ls_pass		


if gb_isProduction = true then
	SQLLOGGIN.DBParm = "Database='"+ls_db+"'" + ",TrustedConnection=1,Secure=1"
	SQLLOGGIN.ServerName 	=  ls_servername //'192.168.11.100' //"VIARSQL"	
	w_principal.title = "ViaCentral .:::. " + " [Updated "+gs_ver+"] ***" + ls_titlemsg + " ["+SQLCA.ServerName+"]"	
else
	SQLLOGGIN.DBParm = "Database='EnvioRep'"	 + ",TrustedConnection=1,Secure=1"
	SQLLOGGIN.ServerName 	= '192.168.11.120\VIASQLDEV'//"192.168.1.160"//"ViaDevMTSA"		
	ls_computername 	= ls_computername + " (Development)"
	w_principal.title = "PRUEBAS!!! * * * * * * * * * * * * * * * * * * * * * * "
end if
	

SQLLOGGIN.AutoCommit = True
		
	
// Tries the SQL account
if SQLLOGGIN.of_connect() <> 0 then
	
	fn_logattempt(upper(ls_cashier),'ERROR-WPSS')
	
	// Failed attempt
	Messagebox("Error","Invalid Password for "+ls_cashier+" ~n~r"+SQLLOGGIN.sqlerrtext,StopSign!)
	sle_pass.selecttext(1,15)
	sle_pass.setfocus()
	sle_intentos.text = string(il_intento)	
	il_intento = il_intento + 1
	
	
	return 

end if



// Desconecta la conexion LOGGIN ATTEMPT
IF SQLLOGGIN.of_IsConnected() THEN
	SQLLOGGIN.of_Disconnect()
END IF		

// -------------------------------------------------
// Desconecta y connecta con el usuario
// Loggin Exitoso!

IF SQLCA.of_IsConnected() THEN
	SQLCA.of_Disconnect()
END IF		

// Profile SQLServer
SQLCA.DBMS = "SNC SQL Native Client(OLE DB)"		

if gb_isProduction = true then
	SQLCA.DBParm = "Database='"+ls_db+"',TrimSpaces=1" + ",TrustedConnection=1,Secure=1"
	SQLCA.ServerName 	= ls_servername // '192.168.11.100' //"VIARSQL"	
else
	SQLCA.DBParm = "Database='EnvioRep',TrimSpaces=1" + ",TrustedConnection=1,Secure=1"
	SQLCA.ServerName 	=  '192.168.11.120\VIASQLDEV'//"192.168.1.160"//"ViaDevMTSA"		
	ls_computername 	= ls_computername + " (Development)"
	w_principal.title = "PRUEBAS!!! * * * * * * * * * * * * * * * * * * * * * * "
end if

SQLCA.LogPass = ls_pass		
SQLCA.LogId = ls_cashier
SQLCA.AutoCommit = True
///SQLCA.DBParm = "AppName='ViaCentral',Host='"+ls_computername+"'"

if SQLCA.of_connect() <> 0 then
	MessageBox("Cannot Connect to Database", SQLCA.sqlerrtext,stopsign!)
	halt close
	return
end if
// ------------------------------------------------- 
	
// //////////////////////////////////////////
// Para activar el ROLE de APPLICACION
// Los usuarios de BD no tienen permisos, 
// los permisos se los da el APP ROLE.
//DECLARE sp_setapprole PROCEDURE FOR sp_setapprole @rolename = 'ap_viacentral', @password = 'GIMMITHAPOWER';
DECLARE sp_setapprole PROCEDURE FOR sp_setapprole @rolename = 'ap_viacentral', @password = 'gimmithapower';
Execute sp_setapprole;

If SQLCA.SQLCode <> 100 Then
	Messagebox("Error "+String(SQLCA.SQLCode),"0005 - ROLE 'ap_viacentral' WAS NOT ACTIVATED, PLEASE CONTACT TECHNOLOGY.~n"+SQLCA.SQLErrText,StopSign!)
End if
// //////////////////////////////////////////	

SELECT dba.cashier.id_cashier
INTO :gs_cashier
FROM dba.cashier
WHERE dba.cashier.ad_user = :ls_cashier;

w_principal.fn_posloggin() // Refresca el menu de acuerdo a los permisos	

fn_logattempt(upper(ls_cashier),'OK')

Close(parent)



end event

type st_3 from statictext within w_pass
integer x = 110
integer y = 324
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 32768
long backcolor = 16777215
boolean enabled = false
string text = "Username:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_pass
integer x = 110
integer y = 416
integer width = 343
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 32768
long backcolor = 16777215
boolean enabled = false
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_pass
integer x = 466
integer y = 500
integer width = 302
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cancel"
boolean cancel = true
end type

event clicked;halt
CloseWithReturn(w_pass,2)
end event

type gb_1 from groupbox within w_pass
integer x = 37
integer y = 208
integer width = 1801
integer height = 452
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
end type

type gb_2 from groupbox within w_pass
boolean visible = false
integer x = 9
integer y = 884
integer width = 1193
integer height = 312
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
end type

