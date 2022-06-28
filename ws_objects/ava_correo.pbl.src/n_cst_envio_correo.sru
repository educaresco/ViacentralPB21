$PBExportHeader$n_cst_envio_correo.sru
forward
global type n_cst_envio_correo from nonvisualobject
end type
end forward

global type n_cst_envio_correo from nonvisualobject
end type
global n_cst_envio_correo n_cst_envio_correo

type variables
String	is_attach_name[],	/*Vector para almacenar las rutas de los adjuntos*/&
			is_mensaje,		  	/*Cuerpo(mensaje) del correo*/ &
			is_asunto			/*Asunto del correo*/
Boolean	ib_acuse_recibo   /*Indica si el correo tiene acuse de recibo*/
end variables

forward prototypes
public function string of_mailreturncode (mailreturncode a_mailreturncode)
public function integer of_logoff (mailsession ams_mses, string as_attach_name[])
public subroutine of_set_attach_name (string as_ruta_archivo)
public function string of_set_attach_name ()
public function boolean of_envio_correo_mapi (stru_frmwrk_parametros astru_param_correo)
end prototypes

public function string of_mailreturncode (mailreturncode a_mailreturncode);string	ls_Message

choose case a_MailReturnCode
	case mailReturnAccessDenied!
		ls_Message= 'Acceso denegado'
	case mailReturnAttachmentNotFound!
		ls_Message= 'No se encontró adjunto'
	case mailReturnAttachmentOpenFailure!
		ls_Message= 'Falla de apertura de adjunto(s)'
	case mailReturnAttachmentWriteFailure!
		ls_Message= 'Falla de escritura de adjunto(s)'
	case mailReturnDiskFull!
		ls_Message= 'Disco Lleno'
	case mailReturnFailure!
		ls_Message= 'Falla'
	case mailReturnInsufficientMemory!
		ls_Message= 'Memoria insuficiente'
	case mailReturnInvalidMessage!
		ls_Message= 'Mensaje inválido'
	case mailReturnLoginFailure!
		ls_Message= 'Falla Login'
	case mailReturnMessageInUse!
		ls_Message= 'Mensaje en uso'
	case mailReturnNoMessages!
		ls_Message= 'Sin mensajes'
	case mailReturnSuccess!
		ls_Message= 'Exitoso'
	case mailReturnTextTooLarge!
		ls_Message= 'Texto muy largo'
	case mailReturnTooManyFiles!
		ls_Message= 'Muchos archivos'
	case mailReturnTooManyRecipients!
		ls_Message= 'Muchos recipientes'
	case mailReturnTooManySessions!
		ls_Message= 'Muchas sesiones'
	case mailReturnUnknownRecipient!
		ls_Message= 'Recipiente desconocido'
	case mailReturnUserAbort!
		ls_Message= 'El usuario aborto el proceso'
	case else
		ls_Message= 'Error no definido'
end choose

return ls_Message
end function

public function integer of_logoff (mailsession ams_mses, string as_attach_name[]);string 	ls_ret	
Int		li_i

mailreturncode mRet

/*****************************************************************
	Log off from the mail system
 *****************************************************************/
mRet 	= ams_mSes.mailLogoff ( )
ls_ret= This.of_mailreturncode( mRet)

If mRet <> mailReturnSuccess! Then
	MessageBox ("Logoff", ls_ret, StopSign!)
	return 0
End If

/*****************************************************************
	Finally, destroy the mail session object created earlier.
	Also, delete the temporary attachment file.
 *****************************************************************/
destroy ams_mses

/*
FOR li_i=1 TO UpperBound(as_attach_name[])
	FileDelete ( as_attach_name[li_i] )
NEXT
*/

Return 1
end function

public subroutine of_set_attach_name (string as_ruta_archivo);/*
DRT==>2008-Sep
*/

//Se asigna al vector la ruta del archivo a adjuntar
is_attach_name[ UpperBound(is_attach_name[])+1 ]= as_ruta_archivo
end subroutine

public function string of_set_attach_name ();/*
DRT==>2008-Sep
*/

String ls_pathname, ls_filename


//Abre una caja de dialogo para seleccionar el archivo a adjuntar. 
IF GetFileOpenName ( "Adjuntar", ls_pathname, ls_filename  )=1 THEN
	//Se asigna al vector la ruta del archivo a adjuntar
	is_attach_name[ UpperBound(is_attach_name[])+1 ]= ls_pathname
	Return ls_pathname
ELSE
	Return ""
END IF



end function

public function boolean of_envio_correo_mapi (stru_frmwrk_parametros astru_param_correo);/*******************************************************************
DRT==>2008-Sep

Este método se encarga de enviar el correo electrónico mediante MAPI

Recibe una estructura con la información usada en un formato de correo
convencional
	
astru_param_correo.string[1]= //Para
astru_param_correo.string[2]= //CC
astru_param_correo.string[3]= //BCC
astru_param_correo.string[4]= //Asunto
astru_param_correo.string[5]= //Mensaje
astru_param_correo.boolean[1]= //Acuse de recibo
*******************************************************************/


mailSession				lmSes_sesion
mailReturnCode			lmRet_returncode
mailMessage				lmMsg_mensaje
mailFileDescription	lmfd_attachment
String					ls_ret
Int						li_index, li_i


SetPointer(HourGlass!)

is_asunto		= astru_param_correo.string[4]
is_mensaje		= astru_param_correo.string[5]
ib_acuse_recibo= astru_param_correo.boolean[1]

/****************************************************************
	Establish an instance of the Mail Session object, and log on
*****************************************************************/
lmSes_sesion = create mailSession

/*****************************************************************
	Note: If the mail-system user ID and password are known,
			they could be hard-coded here, as shown in the
			commented-out statement that follows.  If user ID and
			password are not supplied, it is assumed that they
			are stored in MSMAIL.INI
 *****************************************************************/
lmRet_returncode 	= lmSes_sesion.mailLogon ( mailNewSession! )
ls_ret 				= of_MailReturnCode ( lmRet_returncode )
//st_status_bar.text = ' Logon: ' + ls_ret
If lmRet_returncode <> mailReturnSuccess! Then
	MessageBox ('Correo', ls_ret, StopSign!)
	of_logoff(lmSes_sesion, is_attach_name)
	return False
End If


/*****************************************************************
	Copy user's subject to the mail message.
	Set return receipt flag If needed.
	Build an Attachment structure, and assign it to the mail message.
 *****************************************************************/
lmMsg_mensaje.Subject	= is_asunto

If ib_acuse_recibo Then
	lmMsg_mensaje.ReceiptRequested = true
End If

lmMsg_mensaje.notetext = is_mensaje +"~n~r "

FOR LI_I=1 to Upperbound(is_attach_name[])
	lmfd_attachment.FileType = mailAttach!
	lmfd_attachment.PathName = is_attach_name[li_i]
	lmfd_attachment.FileName = Mid(is_attach_name[li_i], LastPos( is_attach_name[li_i], '\' )+1)

	//Note: In MS Mail version 3.0b, Position=-1 puts attachment at the beginning of the message.
	//This will place the attachment at the End of the text of the message
	
	lmfd_attachment.Position = len(lmMsg_mensaje.notetext) - 1		
	lmMsg_mensaje.AttachmentFile[li_i] = lmfd_attachment
NEXT


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
////		wf_logoff_mail(lmSes_sesion, ls_attach_name)
////		return
////	End If
////
////	li_nrecipients = 0
////	do while FileRead ( li_nfile, ls_name ) > 0
////		li_nrecipients = li_nrecipients + 1
////		lmMsg_mensaje.Recipient[li_nrecipients].Name = ls_name
////	loop
////	FileClose ( li_nfile )
////End If



///*****************************************************************
//	If user requested "address-from-Post-Office," call the
//	mail system's Address function
// *****************************************************************/
////If cbx_address_live.checked Then
//	lmRet_returncode = lmSes_sesion.mailAddress ( lmMsg_mensaje )
//	If lmRet_returncode = mailReturnUserAbort! Then 
//		st_status_bar.text = "User Canceled send Mail"
//		wf_logoff_mail(lmSes_sesion, ls_attach_name)
//		Return
//	End If
//	ls_ret = f_mail_error_to_string ( lmRet_returncode, 'Address Mail:', FALSE )
//	st_status_bar.text = ' Address Mail: ' + ls_ret
////End If
//
//
/*****************************************************************
	Resolve recipient addresses, which may be only partially
	supplied, to get the complete address for each one.

	Loop in this until the names are all resovled with no
	errors. The message will not be sent If errors are in
	the user name.

	The user can cancel out of resolving names which
	will cancel the entire send mail process
 *****************************************************************/

SetPointer(HourGlass!)

Integer li_cantidad_recipientes, li_j, li_destinos
string ls_e-mail
	
	IF astru_param_correo.string[1]<> '' THEN
		li_cantidad_recipientes= f_cantidad_tokens(astru_param_correo.string[1] , ";")
	
		FOR li_i=1 to li_cantidad_recipientes
			ls_e-mail									= f_obtener_token(astru_param_correo.string[1], ";",li_i )
			lmMsg_mensaje.recipient[li_i].Name	= ls_e-mail
			lmMsg_mensaje.recipient[li_i].Address= 'SMTP:'+ls_e-mail
			lmMsg_mensaje.recipient[li_i].RecipientType = mailto!
		NEXT
	END IF

	//Con copia
	IF astru_param_correo.string[2]<>'' THEN
		li_cantidad_recipientes= f_cantidad_tokens(astru_param_correo.string[2] , ";")
		li_j= UpperBound(lmMsg_mensaje.recipient[])+1
		FOR li_i=1 to li_cantidad_recipientes
			ls_e-mail											= f_obtener_token(astru_param_correo.string[2], ";",li_i )
			lmMsg_mensaje.recipient[li_j].Name	= ls_e-mail
			lmMsg_mensaje.recipient[li_j].Address= 'SMTP:'+ls_e-mail
			lmMsg_mensaje.recipient[li_j].RecipientType = mailCC!
			li_j++
		NEXT
	END IF
	
	
	IF astru_param_correo.string[3] <>'' THEN
		li_cantidad_recipientes= f_cantidad_tokens(astru_param_correo.string[3] , ";")
		//Con copia oculta
		FOR li_i=1 to li_cantidad_recipientes
			ls_e-mail									= f_obtener_token(astru_param_correo.string[3], ";",li_i )
			lmMsg_mensaje.recipient[li_j].Name	= ls_e-mail
			lmMsg_mensaje.recipient[li_j].Address= 'SMTP:'+ls_e-mail
			lmMsg_mensaje.recipient[li_j].RecipientType = mailBCC!
			li_j++
		NEXT
	END IF
	
/*
//Do 
	lb_noerrors = True
	li_nrecipients = UpperBound( lmMsg_mensaje.Recipient )
	
	For li_index = 1 To li_nrecipients
		lmRet_returncode = lmSes_sesion.mailResolveRecipient(lmMsg_mensaje.Recipient[li_index].Name)
		
		If lmRet_returncode <> mailReturnSuccess! Then 
			lb_noerrors = False
			ls_ret = this.of_mailreturncode( lmRet_returncode)
		END IF0
		//st_status_bar.text = ' Resolve Recipient (' + lmMsg_mensaje.Recipient[li_index].Name + '): ' + ls_ret
	Next 
	
	If Not lb_noerrors Then
		of_logoff(lmSes_sesion, is_attach_name)
		Messagebox("Microsoft Mail",ls_ret+ "~n~r"+&
						"Los nombres no subrayados no fueron resuetlos.~n~n~rPor favor corrija o cancele.",StopSign!)
		Return False
		/*lmRet_returncode = lmSes_sesion.mailAddress(lmMsg_mensaje)
		If lmRet_returncode = mailReturnUserAbort! Then 
			//st_status_bar.text = "User Canceled Send Mail"
			of_logoff(lmSes_sesion, is_attach_name)
			Return False
		End If*/
	End If
//Loop Until lb_noerrors
*/

///*****************************************************************
//	Now, send the mail message, including the attachment
// *****************************************************************/
If UpperBound ( lmMsg_mensaje.Recipient ) < 1 Then 
	messagebox ("Envío","El correo debe incluir al menos un destinatario.",Exclamation!)
	of_logoff(lmSes_sesion, is_attach_name)
	return False
End If

lmRet_returncode = lmSes_sesion.mailsend ( lmMsg_mensaje )
ls_ret = this.of_mailreturncode( lmRet_returncode)
//st_status_bar.text = ' send Mail: ' + ls_ret
of_logoff(lmSes_sesion, is_attach_name)

IF ls_ret='Exitoso' THEN
	Return True
ELSE
	MessageBox("Error", ls_ret)
	Return False
END IF
end function

on n_cst_envio_correo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_envio_correo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

