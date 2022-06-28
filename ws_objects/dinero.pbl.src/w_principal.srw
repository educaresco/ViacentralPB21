$PBExportHeader$w_principal.srw
forward
global type w_principal from w_frame
end type
end forward

global type w_principal from w_frame
integer x = 5
integer y = 4
integer width = 3685
integer height = 2500
string menuname = "m_principal"
windowstate windowstate = maximized!
long backcolor = 80269524
string icon = "C:\ViamericasMT\Graphics\Viamericas.ico"
boolean ib_isupdateable = false
end type
global w_principal w_principal

type variables
double	ld_x, ld_y, ld_xx, ld_yy
end variables

forward prototypes
public subroutine fn_posloggin ()
public subroutine fn_preloggin ()
end prototypes

public subroutine fn_posloggin ();long	ll_cont, ll_cont1, ll_cont3, ll_filenum2

// -----------------------------------------------	
// -----------------------------------------------
// Para abrir el menu:
SetPointer(HourGlass!)

string	ls_admin

gs_iduser = gs_cashier 
ls_admin = 'N'


SELECT dba.cashier.admin  
INTO :ls_admin  
FROM dba.cashier  
WHERE dba.cashier.id_cashier = :gs_cashier;


// 12/06/2012 : Special chars are parametrized!
SELECT STRINGVALUE
INTO :gs_specialallowedchars
FROM DBA.PARAMETERS
WHERE IDPARAMETER = 'SPECIAL_ALLOWED_CH';



if ls_admin = 'Y' then
	gb_admin = true
else
	//w_principal.SetRedraw(FALSE)
	fn_recursionmenu(m_principal)
	//w_principal.SetRedraw(TRUE)
end if

long	ll_cont_sec

SELECT COUNT(*)  
INTO :ll_cont_sec  
FROM dba.sec_menutitles  ;

if ll_cont_sec = 0  then
	fn_recursionfillmenutable(m_principal,0,'')
	commit;
end if
SetPointer(Arrow!)
// -----------------------------------------------
// -----------------------------------------------

If Message.DoubleParm = 2 Then
	event pfc_close()
	Close(w_principal)
	halt
	return
else
	if IsValid(inv_statusbar) then
		inv_statusbar.of_Register('text_id', 'text', " Cashier : " + gs_login, 2100)
	end if
	if IsValid(inv_statusbar) then
		inv_statusbar.of_Modify('text_id',"                   Cashier : " + gs_login)
	end if
end if

ld_x = w_principal.PointerX ( )
ld_y = w_principal.PointerX ( )
end subroutine

public subroutine fn_preloggin ();fn_recursionmenu(m_principal)
end subroutine

on w_principal.create
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_principal" then this.MenuID = create m_principal
end on

on w_principal.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Actualizar cada que se va a compilar!
gs_ver = '04/17/2018'
gl_vernum = 1
gs_release = string(gl_vernum)
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

gnv_app.of_Splash(2)

// Detecta la resolucion de la pantalla
environment env
integer rtn
long ancho, alto

rtn = GetEnvironment(env)
IF rtn <> 1 THEN	
	ancho = 800
	alto = 600
else
	ancho = env.ScreenWidth
	alto = env.ScreenHeight
end if;

//// Despliega la ventana si existe el archivo pop.swf en la carpeta raiz.
//if FileExists("c:\viamericasmt\via.swf") then
//  OpenSheet(w_pop_CENTRAL,w_principal,2,Original!)
//  w_pop_central.x = PixelsToUnits ( ancho	, XPixelsToUnits! ) - (w_pop_central.width + 20)
//end if

//// Abre la area de notificaciones
//OpenSheet(w_notificationarea,w_principal,2,Original!)
//w_notificationarea.y = PixelsToUnits ( alto	, YPixelsToUnits! ) - (w_notificationarea.Height +500)
//w_notificationarea.x = 10


// ------------------------------------------------
// Muestra el Mensaje de que hay una nueva version!

// ------------------------
// Check for a new version!

//integer li_FileNum, li_last_version
//long li_value
//long ll_fileread
//string ls_value
//
//// Si esta habilitada la ultima version!
////messagebox(fn_busparameter("LASTVERSION"),string(gl_vernum))
//if (fn_busparameter("LASTVERSION") = 'ON') then
//	li_last_version = fn_busparameter_numeric("LASTVERSION")
//	if (gl_vernum < li_last_version) then
//		w_notificationarea.lbl_message.text = "MTSA update available!"
//		w_notificationarea.lbl_message.x = 210
//		w_notificationarea.cb_update.visible=true
//	else
//		w_notificationarea.lbl_message.text = ""
//	end if
//end if
// ------------------------------------------------

string ls_titlemsg

ls_titlemsg = fn_busparameter("TITLEMSG")
if isnull(ls_titlemsg) then ls_titlemsg = ""

This.title = "ViaCentral - " + " [Updated "+gs_ver+"] " + ls_titlemsg 

fn_posloggin() 

end event

event pfc_preopen;of_SetStatusBar(true)
end event

event pfc_postopen;call super::pfc_postopen;
// Reemplaced by the domain authentication (viacentral.exe sends parameters to PB)

//Open(W_pass,w_principal)
//Timer(360)


end event

event timer;
// ------------------------------------------------
// Muestra el Mensaje de que hay una nueva version!

//long li_last_version
//
//if (fn_busparameter("LASTVERSION") = 'ON') then
//	li_last_version = fn_busparameter_numeric("LASTVERSION")
//	if (double(gs_release) < li_last_version) then
//		w_notificationarea.lbl_message.text = "MTSA update available!"
//		w_notificationarea.lbl_message.x = 210
//		w_notificationarea.cb_update.visible=true
//	else
//		w_notificationarea.lbl_message.text = ""
//		w_notificationarea.cb_update.visible=false
//	end if
//end if
// ------------------------------------------------
end event

