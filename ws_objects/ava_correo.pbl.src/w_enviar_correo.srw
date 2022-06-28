$PBExportHeader$w_enviar_correo.srw
$PBExportComments$Ventana para envio de correo ESTA ES LA NUEVA CONSTRUIDA POR AVANSOFT S.A.~r~nSe construyo para agregar la asignación de la dirección electronica del usuario de la tabla UN_TERCERGENER
forward
global type w_enviar_correo from window
end type
type cb_cancelar from commandbutton within w_enviar_correo
end type
type st_status_bar from statictext within w_enviar_correo
end type
type cb_enviar from commandbutton within w_enviar_correo
end type
type st_2 from statictext within w_enviar_correo
end type
type st_1 from statictext within w_enviar_correo
end type
type mle_direcciones from multilineedit within w_enviar_correo
end type
type pb_direcciones from picturebutton within w_enviar_correo
end type
type mle_mensaje from multilineedit within w_enviar_correo
end type
type gb_mensaje from groupbox within w_enviar_correo
end type
type mle_subject from multilineedit within w_enviar_correo
end type
end forward

global type w_enviar_correo from window
integer width = 2702
integer height = 1148
boolean titlebar = true
string title = "Correo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
boolean clientedge = true
boolean center = true
event ue_postzoom ( )
event ue_eventos_windows pbm_syscommand
event ue_mover pbm_move
event ue_postopen ( )
cb_cancelar cb_cancelar
st_status_bar st_status_bar
cb_enviar cb_enviar
st_2 st_2
st_1 st_1
mle_direcciones mle_direcciones
pb_direcciones pb_direcciones
mle_mensaje mle_mensaje
gb_mensaje gb_mensaje
mle_subject mle_subject
end type
global w_enviar_correo w_enviar_correo

type variables
BOOLEAN					ib_correo
MAILSESSION				iml_session_correo
MAILRETURNCODE			iml_codigo_correo
MAILMESSAGE				iml_mensaje_correo
MAILFILEDESCRIPTION	iml_archivo_adjunto
//N_B_TR					inv_objtr
STRING					is_ruta_archivo_adjunto, is_archivo_adjunto, is_email
//W_B_MANTENIMIENTO_M	iwv_ventana_activa





end variables

forward prototypes
public subroutine wf_asignar_foco ()
public function boolean wf_validar_salida ()
public subroutine wf_desconectar_correo ()
public function stru_frmwrk_parametros wf_validar_correo (string as_accion)
public subroutine wf_inicializar_correo ()
public subroutine wf_logoff_mail (mailsession ams_mses, string as_attach_name)
end prototypes

event ue_eventos_windows;//IF message.wordparm = 61458 THEN
//	
////	El código 61458 corresponde al evento mover (pb_move), caso en el que se prende la
////	booleana ib_mover para que en el evento ue_mover se haga el control respectivo
//	ib_mover = TRUE
//	message.processed = FALSE
//END IF
//
end event

event ue_postopen();/*******************************************************************************************
 Evento ue_postopen
 Descripción : Asigna la posición de la ventana
*******************************************************************************************/

This.X      = 620
This.Y      = 500
This.Width	= 2702
This.Height	= 1148

wf_inicializar_correo()

SetRedraw(TRUE)
end event

public subroutine wf_asignar_foco ();/******************************************************************************************
 	NOMBRE:	    wf_asignar_foco

	DESCRIPCION: Esta  función  por  defecto  devuelve el foco a la datawindow actual del
					 objeto del negocio asociado a la ventana.
					 
					 Para aquellos  casos en que el foco de la ventana pueda estar en objetos
					 diferentes a la datawindow del objeto del negocio, esta función debe ser
					 sobreescrita por la respectiva ventana.

 	ARGUMENTOS:  ninguno

	RETORNO:		 ninguno.

******************************************************************************************/

SetFocus()
end subroutine

public function boolean wf_validar_salida ();Return true
end function

public subroutine wf_desconectar_correo ();stru_frmwrk_parametros	lstr_mensajes

// Se desconecta del servidor de correo
iml_codigo_correo = iml_session_correo.mailLogoff( )
// Valida el resultado de la desconexión
lstr_mensajes = wf_validar_correo('')

// Evalua el resultado si hubo error despliega el mensaje
IF lstr_mensajes.b_nulo THEN
	IF Not IsNull(lstr_mensajes.String[1]) THEN
		MessageBox("Correo",lstr_mensajes.String[1])
	END IF
END IF

ib_correo = False
Destroy iml_session_correo
end subroutine

public function stru_frmwrk_parametros wf_validar_correo (string as_accion);//************************************************************************
//	AvanSoft S.A. 2005/05/24
//
//	Esta función se usa validar el resultado del procesamiento de una
// accion sobre el objeto de correo electrónico

//	Recibe el parámetro as_accion de tipo String el cual contiene la 
// un mensaje adicional para concatenarlo al mensaje original de la
// función en algunos casos.

//	Retorna la estructura lstr_mensajes de tipo stru_b_parametros
// la cual tiene los siguientes datos:
//
//	lstr_mensajes.String[1]
// Tipo: String
// Contiene el mensaje correspondiente al resultado de la acción 
// ejecutada sobre el objeto de correo electrónico
//
// lstr_retorno.b_nulo
// Tipo: boleano
// Contiene el indicador de si el mensaje corresponde a una error
// (True) o no (False)			
//************************************************************************

stru_frmwrk_parametros	lstr_mensajes

lstr_mensajes.b_nulo = True

CHOOSE CASE iml_codigo_correo
		
	CASE mailReturnAccessDenied!
		lstr_mensajes.String[1] = 'El acceso fue negado'
		
	CASE mailReturnAttachmentNotFound!
		lstr_mensajes.String[1] = 'No se encontró el archivo para adjuntar'
		
	CASE mailReturnAttachmentOpenFailure!
		lstr_mensajes.String[1] = 'Se produjo un error al abrir el archivo adjunto'
		
	CASE mailReturnAttachmentWriteFailure!
		lstr_mensajes.String[1] = 'Se produjo un error al escribir el archivo adjunto'
		
	CASE mailReturnDiskFull!
		lstr_mensajes.String[1] = 'No se encontró espacio en el disco'
		
	CASE mailReturnFailure!
		lstr_mensajes.String[1] = 'Error'
		
	CASE mailReturnInsufficientMemory!
		lstr_mensajes.String[1] = 'No hay memoria suficiente para realizar el proceso'
		
	CASE mailReturnInvalidMessage!
		lstr_mensajes.String[1] = 'El mensaje del correo electrónico no es válido'
		
	CASE mailReturnLoginFailure!
		lstr_mensajes.String[1] = 'El usuario del correo electrónico no es válido'
		
	CASE mailReturnMessageInUse!
		lstr_mensajes.String[1] = 'El mensaje esta en uso'
		
	CASE mailReturnNoMessages!
		lstr_mensajes.String[1] = 'No hay mensajes'
		
	CASE mailReturnSuccess!
		lstr_mensajes.String[1] = 'El proceso de envío de correo se realizó exitosamente'
		lstr_mensajes.b_nulo = False
		
	CASE mailReturnTextTooLarge!
		lstr_mensajes.String[1] = 'El texto es demasiado largo'
		
	CASE mailReturnTooManyFiles!
		lstr_mensajes.String[1] = 'Se adjuntaron demasiados archivos'
		
	CASE mailReturnTooManyRecipients!
		lstr_mensajes.String[1] = 'Se definieron demasiados correos de destino'
		
	CASE mailReturnTooManySessions!
		lstr_mensajes.String[1] = 'Existen demasiadas sesiones'
		
	CASE mailReturnUnknownRecipient!
		lstr_mensajes.String[1] = 'La dirección' + as_accion + ' del correo de destino no se encontró'
		
	CASE mailReturnUserAbort!
		lstr_mensajes.String[1] = 'El usuario cancelo' + as_accion

	CASE ELSE
		lstr_mensajes.String[1] = 'Ocurrió un error desconocido'

END CHOOSE

Return lstr_mensajes




end function

public subroutine wf_inicializar_correo ();//************************************************************************
//	AvanSoft S.A. 2005/05/23
//
//	Esta función se usa para inicializar el servicio de correo electrónico

//	No recibe ningún parámetro

//	No retorna ningún parámetro
//************************************************************************

stru_frmwrk_parametros	lstr_mensajes

ib_correo = True

// Crea una nueva sesión de correo electronico
iml_session_correo = Create mailSession
iml_codigo_correo = iml_session_correo.mailLogon(mailNewSession!)

// Válida el resultado de la creación la nueva sesión de correo electrónico  
lstr_mensajes = wf_validar_correo('')

// Evalua el resultado si hubo error despliega el mensaje
IF lstr_mensajes.b_nulo THEN
	IF Not IsNull(lstr_mensajes.String[1]) THEN
		MessageBox("Error", lstr_mensajes.String[1])
		wf_desconectar_correo()
		ib_correo = False		
	END IF
END IF
end subroutine

public subroutine wf_logoff_mail (mailsession ams_mses, string as_attach_name);string 	ls_ret	
mailreturncode mRet

/*****************************************************************
	Log off from the mail system
 *****************************************************************/
mRet = ams_mSes.mailLogoff ( )
ls_ret = f_mail_error_to_string ( mRet, 'Logoff:', FALSE )
st_status_bar.text = ' Logoff: ' + ls_ret

If mRet <> mailReturnSuccess! Then
	MessageBox ("Mail Logoff", 'Return Code <> mailReturnSuccess!' )
	return
End If

/*****************************************************************
	Finally, destroy the mail session object created earlier.
	Also, delete the temporary attachment file.
 *****************************************************************/
destroy ams_mses


FileDelete ( as_attach_name )
end subroutine

on w_enviar_correo.create
this.cb_cancelar=create cb_cancelar
this.st_status_bar=create st_status_bar
this.cb_enviar=create cb_enviar
this.st_2=create st_2
this.st_1=create st_1
this.mle_direcciones=create mle_direcciones
this.pb_direcciones=create pb_direcciones
this.mle_mensaje=create mle_mensaje
this.gb_mensaje=create gb_mensaje
this.mle_subject=create mle_subject
this.Control[]={this.cb_cancelar,&
this.st_status_bar,&
this.cb_enviar,&
this.st_2,&
this.st_1,&
this.mle_direcciones,&
this.pb_direcciones,&
this.mle_mensaje,&
this.gb_mensaje,&
this.mle_subject}
end on

on w_enviar_correo.destroy
destroy(this.cb_cancelar)
destroy(this.st_status_bar)
destroy(this.cb_enviar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_direcciones)
destroy(this.pb_direcciones)
destroy(this.mle_mensaje)
destroy(this.gb_mensaje)
destroy(this.mle_subject)
end on

event open;stru_frmwrk_parametros	lstr_parametros

// Recupera los parámetros para el envío del correo
lstr_parametros = Message.PowerObjectParm	

is_ruta_archivo_adjunto = lstr_parametros.String[1]
is_archivo_adjunto 		= lstr_parametros.String[2]
is_email 					= lstr_parametros.String[3]

IF UpperBound(lstr_parametros.String) >= 4 THEN
	mle_subject.Text = lstr_parametros.String[4]
END IF	

IF UpperBound(lstr_parametros.String) >= 5 THEN
	mle_mensaje.Text = lstr_parametros.String[5]
END IF

POST EVENT ue_postopen()




end event

event close;/**************************************************************************************** 
Evento close de w_tro_fin_hecta
Descripción : Se habilita la ventana ppal de fincas y se destruye el objeto del negocio 
*****************************************************************************************/


window	lw_proxima_ventana
window	lw_ventana_actual

//wf_desconectar_correo()

//n_parametros lnv_parametros
//lnv_parametros = CREATE n_parametros
//
//lw_ventana_actual	   =	w_b_mdi.GetActiveSheet()
//lw_proxima_ventana	=	w_b_mdi.GetnextSheet(lw_ventana_actual)
//
//// Cuando no existan mas ventanas activas se debe restaurar la configuracion de los botones,
//// de lo contrario, se debe conservar
//IF Not IsValid(lw_proxima_ventana) THEN
//	IF IsValid(u_barra_gral) OR IsValid(u_barra_gral_t) THEN
//		u_barra_gral.uf_restaurar_config_inicial()
//	END IF
//END IF
//
//IF	IsValid(iwv_ventana_activa)	THEN
//	iwv_ventana_activa.Enabled	=	TRUE
//END IF
//
//w_b_mdi.SetMicroHelp("Ready")


end event

type cb_cancelar from commandbutton within w_enviar_correo
integer x = 1289
integer y = 892
integer width = 343
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;/******************************************************************************************
 Evento : clicked
 Descripción : cerra la ventana
******************************************************************************************/

IF IsValid(Parent) THEN
	//CloseWithReturn(Parent,'El envío del archivo ' + is_archivo_adjunto + ' fue fue cancelado por el usuario.~r~n~r~nProceso Cancelado')
	Close(Parent)
END IF


end event

type st_status_bar from statictext within w_enviar_correo
integer x = 1838
integer y = 900
integer width = 809
integer height = 88
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 32768
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_enviar from commandbutton within w_enviar_correo
integer x = 937
integer y = 892
integer width = 343
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enviar"
end type

event clicked;//// Clicked script for cb_send_mail
//
///*******************************************************************
//	Mail the definition and current contents of a DataWindow using
//	MAPI facilities.
//	1. Get the PSR file saved from the datawindow chosen
//	2. Create a mail session object and log onto the mail system
//	3. Read addressees from a file (ASCII, one per line), If desired
//	4. Get address names from box If needed
//	5. Resolve all names
//	6. send mail, with attached .dwx file
//	7. Log off from mail system
//	8. Destroy the mail session object
//	9. Delete the attachment (saved) file
// *******************************************************************/
//
//mailSession				mSes
//mailReturnCode			mRet
//mailMessage			mMsg
//mailFileDescription		mAttach
//string					ls_ret, ls_syntax, ls_name, ls_open_pathname, ls_filename
//string					ls_attach_name
//int						li_index, li_nret, li_nrecipients, li_nfile
//boolean 				lb_noerrors
//
//
//
//ls_attach_name= is_ruta_archivo_adjunto
//
///*****************************************************************
//	Establish an instance of the Mail Session object, and log on
// *****************************************************************/
//mSes = create mailSession
//
///*****************************************************************
//	Note: If the mail-system user ID and password are known,
//			they could be hard-coded here, as shown in the
//			commented-out statement that follows.  If user ID and
//			password are not supplied, it is assumed that they
//			are stored in MSMAIL.INI
// *****************************************************************/
//mRet = mSes.mailLogon ( mailNewSession! )
//ls_ret = f_mail_error_to_string ( mRet, 'Logon:', FALSE )
//st_status_bar.text = ' Logon: ' + ls_ret
//If mRet <> mailReturnSuccess! Then
//	MessageBox ("Mail Logon", 'Return Code <> mailReturnSuccess!' )
//	wf_logoff_mail(mSes, ls_attach_name)
//	return
//End If
//
//SetPointer(HourGlass!)
//
///*****************************************************************
//	Copy user's subject to the mail message.
//	Set return receipt flag If needed.
//	Build an Attachment structure, and assign it to the mail message.
// *****************************************************************/
//mMsg.Subject	= mle_subject.text
//
////If cbx_receipt_requested.checked Then
//	mMsg.ReceiptRequested = true
////End If
//
//mMsg.notetext = mle_mensaje.text +"~n~r "
//
//mAttach.FileType = mailAttach!
//mAttach.PathName = ls_attach_name
//mAttach.FileName = is_archivo_adjunto
//// Note: In MS Mail version 3.0b, Position=-1 puts attachment at
////  the beginning of the message.
//// This will place the attachment at the End of the text of the message
//mAttach.Position = len(mMsg.notetext) - 1		
//mMsg.AttachmentFile[1] = mAttach
//
///*****************************************************************
//	If user requested "addresses-from-a-file," open that file and
//	read the address list.
// *****************************************************************/
////If cbx_file.checked Then
////	li_nret = GetFileOpenName ("Address", ls_open_pathname, &
////								ls_filename,"adr", &
////		"Address Text Files (*.adr),*.adr,All Files (*.*),*.*")
////	If li_nret < 1 Then return
////	li_nfile = FileOpen ( ls_open_pathname )
////	If li_nfile < 0 Then
////		MessageBox ( "send Mail", "Unable to open file " &
////						+ ls_open_pathname, StopSign! )
////		wf_logoff_mail(mSes, ls_attach_name)
////		return
////	End If
////
////	li_nrecipients = 0
////	do while FileRead ( li_nfile, ls_name ) > 0
////		li_nrecipients = li_nrecipients + 1
////		mMsg.Recipient[li_nrecipients].Name = ls_name
////	loop
////	FileClose ( li_nfile )
////End If
//
//
//
///*****************************************************************
//	If user requested "address-from-Post-Office," call the
//	mail system's Address function
// *****************************************************************/
////If cbx_address_live.checked Then
//	mRet = mSes.mailAddress ( mMsg )
//	If mRet = mailReturnUserAbort! Then 
//		st_status_bar.text = "User Canceled send Mail"
//		wf_logoff_mail(mSes, ls_attach_name)
//		Return
//	End If
//	ls_ret = f_mail_error_to_string ( mRet, 'Address Mail:', FALSE )
//	st_status_bar.text = ' Address Mail: ' + ls_ret
////End If
//
//
///*****************************************************************
//	Resolve recipient addresses, which may be only partially
//	supplied, to get the complete address for each one.
//
//	Loop in this until the names are all resovled with no
//	errors. The message will not be sent If errors are in
//	the user name.
//
//	The user can cancel out of resolving names which
//	will cancel the entire send mail process
// *****************************************************************/
//SetPointer(HourGlass!)
//
//Do 
//	lb_noerrors = True
//	li_nrecipients = UpperBound( mMsg.Recipient )
//	For li_index = 1 To li_nrecipients
//		mRet = mSes.mailResolveRecipient(mMsg.Recipient[li_index].Name)
//		If mRet <> mailReturnSuccess! Then lb_noerrors = False
//		ls_ret = f_mail_error_to_string ( mRet, 'Resolve Recipient:', FALSE )
//		st_status_bar.text = ' Resolve Recipient (' + mMsg.Recipient[li_index].Name + '): ' + ls_ret
//	Next
//	If Not lb_noerrors Then
//		Messagebox("Microsoft Mail","Error Resolving Name(s)~n~r"+&
//		"The name(s) not underlined are unresolvable.~n~n~rPlease Correct or Cancel"&
//		,Exclamation!)
//		mRet = mSes.mailAddress(mMsg)
//		If mRet = mailReturnUserAbort! Then 
//			st_status_bar.text = "User Canceled Send Mail"
//			wf_logoff_mail(mSes, ls_attach_name)
//			Return
//		End If
//	End If
//Loop Until lb_noerrors
//
///*****************************************************************
//	Now, send the mail message, including the attachment
// *****************************************************************/
//If UpperBound ( mMsg.Recipient ) < 1 Then 
//	messagebox ("Powerbuilder send","Mail must included at least 1 recipient",Exclamation!)
//	wf_logoff_mail(mSes, ls_attach_name)
//	return
//End If
//mRet = mSes.mailsend ( mMsg )
//ls_ret = f_mail_error_to_string ( mRet, 'send Mail:', FALSE )
//st_status_bar.text = ' send Mail: ' + ls_ret
//
//
//
//wf_logoff_mail(mSes, ls_attach_name)


/*******************************************************************
   CREADO:  15/04/2002  Lina M. Saldarriaga
	MODIFICADO: 25/05/2005 AvanSoft S.A.

	Se envía el Atach por correo a una lista de direcciones
	
	Condiciones para enviar correo usando MAPI.
	1. Salvar un archivo tipo CSV de la datawindow que se desea
	2. Crear un objeto de sesion de correo
	3. Leer u obtener las direcciones desde el libro de direcciones
	4. Revisar las direcciones
	5. Enviar el correo con attachment
	6. Cerrar la sesion de correo
	7. Destruir el objeto de sesion
	8. Borrar el archivo de attach salvado
 *******************************************************************/
 
 
/*******************************************************************************************/
stru_frmwrk_parametros	lstr_mensajes
INTEGER				li_destinos	
STRING				ls_mensaje, ls_e-mail

IF ib_correo THEN
	SetPointer(HourGlass!)
	//Revisa todas las direcciones electrónicas del campo para
	
	Integer li_cantidad_recipientes,li_i
	li_cantidad_recipientes= fn_tokens(mle_direcciones.text, ";")
	
	FOR li_i=1 to li_cantidad_recipientes
		ls_e-mail											= fn_token(mle_direcciones.text, ";",li_i )
		iml_mensaje_correo.recipient[li_i].Name	= ls_e-mail
		iml_mensaje_correo.recipient[li_i].Address= ls_e-mail
	NEXT
	
	li_destinos = UpperBound(iml_mensaje_correo.Recipient)
	
	// Valida que al menos tenga asignada una direccion(email) de destino
	IF li_destinos > 0 THEN
		// Extrae la descripción del asunto y la asigna
		// al objeto de correo electrónico
		iml_mensaje_correo.Subject	= mle_subject.text

		//If cbx_receipt_requested.checked Then
			iml_mensaje_correo.ReceiptRequested = True
		//End If
		
		// Extrae el cuerpo del mensaje y lo asigna 
		// al objeto de correo electrónico
		iml_mensaje_correo.notetext = mle_mensaje.text + '~n~r '
		
		// Asigna la ruta del archivo y el archivo adjunto 
		// al objeto de correo electrónico
		iml_archivo_adjunto.FileType = mailAttach!
		iml_archivo_adjunto.PathName = is_ruta_archivo_adjunto
		iml_archivo_adjunto.FileName = is_archivo_adjunto

		iml_archivo_adjunto.Position = Len(iml_mensaje_correo.notetext) - 1		
		iml_mensaje_correo.AttachmentFile[1] = iml_archivo_adjunto

		// Envia el mensaje a la direcciones(email) asignadas
		iml_codigo_correo = iml_session_correo.mailsend(iml_mensaje_correo)
		// Valida el resultado del envio
		lstr_mensajes = wf_validar_correo('')
	ELSE
		// Si no se asignaron direcciones(email) de envio
		lstr_mensajes.b_nulo = True
		lstr_mensajes.String[1] = 'Debe seleccionar mínimo una direccion de correo electrónico de destino' 		
	END IF	
END IF

// Despliega el mensaje
IF lstr_mensajes.b_nulo THEN
	IF Not IsNull(lstr_mensajes.String[1]) THEN
		wf_desconectar_correo( )
		MessageBox("Envio",lstr_mensajes.String[1])
	END IF
ELSE
	ls_mensaje = 'El archivo ' + is_archivo_adjunto + ' fue enviado a'
	IF li_destinos = 1 THEN
		 ls_mensaje += ' la siguiente dirección: ' + mle_direcciones.text + '.'
	END IF
	IF li_destinos > 1 THEN	
		ls_mensaje += ' las siguientes direcciones: ~r~n' + mle_direcciones.text + '.~r'	
	END IF

	MessageBox("Envio",ls_mensaje)
	wf_desconectar_correo( )
	Close(Parent)
	//CloseWithReturn(Parent,ls_mensaje)
		
END IF	
end event

type st_2 from statictext within w_enviar_correo
integer x = 165
integer y = 148
integer width = 201
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Asunto:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_enviar_correo
integer x = 165
integer y = 48
integer width = 233
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Para:"
boolean focusrectangle = false
end type

type mle_direcciones from multilineedit within w_enviar_correo
integer x = 402
integer y = 32
integer width = 2245
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 16777215
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/******************************************************************************************
 Evento getfocus
 Descripción : asigna el michohelp
******************************************************************************************/

//w_b_mdi.SetMicrohelp("Describa el asunto del correo")
end event

type pb_direcciones from picturebutton within w_enviar_correo
integer x = 37
integer y = 32
integer width = 101
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "PlaceColumn!"
alignment htextalign = left!
end type

event clicked;stru_frmwrk_parametros	lstr_mensajes
BOOLEAN				lb_continuar
INTEGER				li_destino, li_destinos
STRING				ls_mensaje, ls_email, Ls_direcciones_original
MAILMESSAGE			lml_mensaje_correo_original

lb_continuar = True

IF ib_correo THEN
	// Despliega la lista de direcciones(email) para seleccionar las direcciones de destino
	lml_mensaje_correo_original= iml_mensaje_correo
	ls_direcciones_original 	= mle_direcciones.Text
//	iml_codigo_correo 			= iml_session_correo.mailAddress(iml_mensaje_correo)	
	iml_codigo_correo 			= iml_session_correo.mailAddress()	

	// Valida el resultado de la asignación de direcciones
	lstr_mensajes = wf_validar_correo(' la selección de direcciones de envío del correo electrónico')
	// Evalua el resultado si hubo error despliega el mensaje
	IF lstr_mensajes.b_nulo THEN
		IF Not IsNull(lstr_mensajes.String[1]) THEN
			MessageBox("Correo",lstr_mensajes.String[1] )
		END IF
	ELSE
		// Si se asignaron direcciones hace un ciclo para 
		// verificar que sean validas
		SetPointer(HourGlass!)
		mle_direcciones.Text = ''
		li_destinos = UpperBound(iml_mensaje_correo.Recipient)
		IF li_destinos > 0 THEN
			mle_direcciones.VScrollBar = False			
			DO WHILE li_destino < li_destinos
				li_destino++
				ls_email 			= iml_mensaje_correo.Recipient[li_destino].Name								
				iml_codigo_correo = iml_session_correo.mailResolveRecipient(ls_email)				
				lstr_mensajes 		= wf_validar_correo(' la asignación de direcciones de envío, la dirección ' + ls_email + ' no es válida')
				
				IF lstr_mensajes.b_nulo THEN
					mle_direcciones.Text = ls_direcciones_original
					iml_mensaje_correo	= lml_mensaje_correo_original
					lb_continuar 			= False
					li_destino 				= li_destinos						
				ELSE					
					IF li_destino > 1 THEN
						mle_direcciones.Text += '~r~n'	
						mle_direcciones.VScrollBar = True
					END IF					
					mle_direcciones.Text += ls_email 					
				END IF	
			LOOP
			
			IF UpperBound(iml_mensaje_correo.Recipient) > 1 THEN
				mle_direcciones.VScrollBar = True
			ELSE	
				mle_direcciones.VScrollBar = False				
			END IF
			
			is_email = mle_direcciones.Text

			// Evalua el resultado de la validación de direcciones(email)
			// si hubo error despliega el mensaje
			IF Not lb_continuar THEN
				IF Not IsNull(lstr_mensajes.String[1]) THEN
					MessageBox("Correo",lstr_mensajes.String[1] )
				END IF
			ELSE									
				iml_codigo_correo = iml_session_correo.mailAddress(iml_mensaje_correo)
			END IF
		END IF
	END IF
END IF
end event

type mle_mensaje from multilineedit within w_enviar_correo
integer x = 73
integer y = 316
integer width = 2519
integer height = 520
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/******************************************************************************************
 Evento getfocus
 Descripción : asigna el michohelp
******************************************************************************************/

//w_b_mdi.SetMicrohelp("Describa el mensaje del correo")
end event

type gb_mensaje from groupbox within w_enviar_correo
integer x = 37
integer y = 252
integer width = 2601
integer height = 620
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Mensaje"
end type

type mle_subject from multilineedit within w_enviar_correo
integer x = 402
integer y = 132
integer width = 2245
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/******************************************************************************************
 Evento getfocus
 Descripción : asigna el michohelp
******************************************************************************************/

//w_b_mdi.SetMicrohelp("Describa el asunto del correo")
end event

