$PBExportHeader$w_correo.srw
$PBExportComments$Ventana para envio de correo ESTA ES LA NUEVA CONSTRUIDA POR AVANSOFT S.A.~r~nSe construyo para agregar la asignación de la dirección electronica del usuario de la tabla UN_TERCERGENER
forward
global type w_correo from window
end type
type gb_4 from groupbox within w_correo
end type
type cbx_acuse_recibo from checkbox within w_correo
end type
type st_bcc from statictext within w_correo
end type
type st_cc from statictext within w_correo
end type
type mle_bcc from multilineedit within w_correo
end type
type mle_cc from multilineedit within w_correo
end type
type st_1 from statictext within w_correo
end type
type mle_para from multilineedit within w_correo
end type
type mle_mensaje from multilineedit within w_correo
end type
type gb_mensaje from groupbox within w_correo
end type
type mle_subject from multilineedit within w_correo
end type
type gb_2 from groupbox within w_correo
end type
type gb_1 from groupbox within w_correo
end type
type pb_enviar from picturebutton within w_correo
end type
type pb_borrar_adjunto from picturebutton within w_correo
end type
type pb_adjuntar from picturebutton within w_correo
end type
type pb_direcciones from picturebutton within w_correo
end type
type plb_adjuntos from picturelistbox within w_correo
end type
type gb_3 from groupbox within w_correo
end type
end forward

global type w_correo from window
integer width = 3424
integer height = 1296
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
gb_4 gb_4
cbx_acuse_recibo cbx_acuse_recibo
st_bcc st_bcc
st_cc st_cc
mle_bcc mle_bcc
mle_cc mle_cc
st_1 st_1
mle_para mle_para
mle_mensaje mle_mensaje
gb_mensaje gb_mensaje
mle_subject mle_subject
gb_2 gb_2
gb_1 gb_1
pb_enviar pb_enviar
pb_borrar_adjunto pb_borrar_adjunto
pb_adjuntar pb_adjuntar
pb_direcciones pb_direcciones
plb_adjuntos plb_adjuntos
gb_3 gb_3
end type
global w_correo w_correo

type variables
BOOLEAN					ib_correo
MAILSESSION				iml_session_correo
MAILRETURNCODE			iml_codigo_correo
MAILMESSAGE				iml_mensaje_correo
MAILFILEDESCRIPTION	iml_archivo_adjunto
//N_B_TR					inv_objtr
STRING					is_ruta_archivo_adjunto, is_archivo_adjunto, is_email
//W_B_MANTENIMIENTO_M	iwv_ventana_activa

Integer	ii_index_adjunto
n_cst_envio_correo in_cst_envio_correo



end variables

forward prototypes
public function integer wf_picture_index (string as_archivo)
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

public function integer wf_picture_index (string as_archivo);Integer li_picture_index
CHOOSE CASE Mid(as_archivo, LastPos(as_archivo,'.')+1)
		CASE 'txt', 'doc'
			li_picture_index=1
		CASE 'xls', 'ods'
			li_picture_index=2
		CASE 'csv'
			li_picture_index=3
		CASE 'wmf'
			li_picture_index=4
		CASE 'html', 'htm'
			li_picture_index=5
		CASE 'pdf'
			li_picture_index=6
		CASE ELSE
			li_picture_index=0
	END CHOOSE
	
Return li_picture_index
end function

on w_correo.create
this.gb_4=create gb_4
this.cbx_acuse_recibo=create cbx_acuse_recibo
this.st_bcc=create st_bcc
this.st_cc=create st_cc
this.mle_bcc=create mle_bcc
this.mle_cc=create mle_cc
this.st_1=create st_1
this.mle_para=create mle_para
this.mle_mensaje=create mle_mensaje
this.gb_mensaje=create gb_mensaje
this.mle_subject=create mle_subject
this.gb_2=create gb_2
this.gb_1=create gb_1
this.pb_enviar=create pb_enviar
this.pb_borrar_adjunto=create pb_borrar_adjunto
this.pb_adjuntar=create pb_adjuntar
this.pb_direcciones=create pb_direcciones
this.plb_adjuntos=create plb_adjuntos
this.gb_3=create gb_3
this.Control[]={this.gb_4,&
this.cbx_acuse_recibo,&
this.st_bcc,&
this.st_cc,&
this.mle_bcc,&
this.mle_cc,&
this.st_1,&
this.mle_para,&
this.mle_mensaje,&
this.gb_mensaje,&
this.mle_subject,&
this.gb_2,&
this.gb_1,&
this.pb_enviar,&
this.pb_borrar_adjunto,&
this.pb_adjuntar,&
this.pb_direcciones,&
this.plb_adjuntos,&
this.gb_3}
end on

on w_correo.destroy
destroy(this.gb_4)
destroy(this.cbx_acuse_recibo)
destroy(this.st_bcc)
destroy(this.st_cc)
destroy(this.mle_bcc)
destroy(this.mle_cc)
destroy(this.st_1)
destroy(this.mle_para)
destroy(this.mle_mensaje)
destroy(this.gb_mensaje)
destroy(this.mle_subject)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.pb_enviar)
destroy(this.pb_borrar_adjunto)
destroy(this.pb_adjuntar)
destroy(this.pb_direcciones)
destroy(this.plb_adjuntos)
destroy(this.gb_3)
end on

event open;/*
Esta ventana se debe invocar de la siguiente manera:
1. Sin Parámetros:
	stru_frmwrk_parametros	lstr_parametros
	lstr_parametros.b_nulo=True
	
2. Com parámetros:
	lstr_parametros.String[1]= Ruta del archivo adjunto
	lstr_parametros.String[2]= Nombre del archivo adjunto
	lstr_parametros.String[3]= Correo Electrónico (opcional)
	lstr_parametros.String[4]= Asunto
	lstr_parametros.String[5]= Cuerpo-Mensaje
*/


Integer li_picture_index

stru_frmwrk_parametros	lstr_parametros

in_cst_envio_correo= CREATE n_cst_envio_correo

//Recupera los parámetros para el envío del correo
lstr_parametros 			= Message.PowerObjectParm	

IF lstr_parametros.b_nulo=True THEN Return

is_ruta_archivo_adjunto = lstr_parametros.String[1]
is_archivo_adjunto 		= lstr_parametros.String[2]
is_email 					= lstr_parametros.String[3]//Valor opcional

mle_para.Text= is_email

IF UpperBound(lstr_parametros.String) >= 4 THEN
	mle_subject.Text = lstr_parametros.String[4]
END IF

IF UpperBound(lstr_parametros.String) >= 5 THEN
	mle_mensaje.Text = lstr_parametros.String[5]
END IF

//Busca el icono correspondiente al tipo de archivo adjunto enviado 
li_picture_index=	wf_picture_index( is_ruta_archivo_adjunto)
plb_adjuntos.insertitem( is_ruta_archivo_adjunto, li_picture_index,0)

//Ingresa en el vector la ruta del archivo a adjuntar
in_cst_envio_correo.of_set_attach_name( is_ruta_archivo_adjunto)
end event

type gb_4 from groupbox within w_correo
integer x = 55
integer y = 1000
integer width = 379
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

type cbx_acuse_recibo from checkbox within w_correo
integer x = 2738
integer y = 1056
integer width = 635
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitar acuse de recibo"
end type

type st_bcc from statictext within w_correo
integer x = 91
integer y = 248
integer width = 137
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "BCC:"
boolean focusrectangle = false
end type

type st_cc from statictext within w_correo
integer x = 91
integer y = 172
integer width = 137
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "CC:"
boolean focusrectangle = false
end type

type mle_bcc from multilineedit within w_correo
integer x = 233
integer y = 236
integer width = 2245
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 16777215
boolean hscrollbar = true
boolean autohscroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/******************************************************************************************
 Evento getfocus
 Descripción : asigna el michohelp
******************************************************************************************/

//w_b_mdi.SetMicrohelp("Describa el asunto del correo")
end event

type mle_cc from multilineedit within w_correo
integer x = 233
integer y = 156
integer width = 2245
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 16777215
boolean autohscroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/******************************************************************************************
 Evento getfocus
 Descripción : asigna el michohelp
******************************************************************************************/

//w_b_mdi.SetMicrohelp("Describa el asunto del correo")
end event

type st_1 from statictext within w_correo
integer x = 91
integer y = 88
integer width = 137
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

type mle_para from multilineedit within w_correo
integer x = 233
integer y = 72
integer width = 2245
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 16777215
boolean autohscroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/******************************************************************************************
 Evento getfocus
 Descripción : asigna el michohelp
******************************************************************************************/

//w_b_mdi.SetMicrohelp("Describa el asunto del correo")
end event

type mle_mensaje from multilineedit within w_correo
integer x = 233
integer y = 572
integer width = 3099
integer height = 428
integer taborder = 50
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

type gb_mensaje from groupbox within w_correo
integer x = 55
integer y = 508
integer width = 3323
integer height = 528
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

type mle_subject from multilineedit within w_correo
integer x = 233
integer y = 416
integer width = 2245
integer height = 76
integer taborder = 40
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

type gb_2 from groupbox within w_correo
integer x = 55
integer y = 344
integer width = 2510
integer height = 196
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Asunto"
end type

type gb_1 from groupbox within w_correo
integer x = 55
integer y = 12
integer width = 2510
integer height = 364
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Destinatarios"
end type

type pb_enviar from picturebutton within w_correo
integer x = 288
integer y = 1056
integer width = 101
integer height = 88
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\enviarMail.gif"
alignment htextalign = left!
string powertiptext = "Enviar"
end type

event clicked;Integer li_i
stru_frmwrk_parametros lstru_param_correo

SetPointer(HourGlass!)

lstru_param_correo.string[1]	= mle_para.text
lstru_param_correo.string[2]	= mle_cc.Text
lstru_param_correo.string[3]	= mle_bcc.Text
lstru_param_correo.string[4]	= mle_subject.Text
lstru_param_correo.string[5]	= mle_mensaje.Text
lstru_param_correo.boolean[1]	= cbx_acuse_recibo.Checked

//FOR li_i=1 TO plb_adjuntos.TotalItems ( )
//	in_cst_envio_correo.of_set_attach_name(plb_adjuntos.item[li_i])
//NEXT

//Realiza el envio del correo
IF in_cst_envio_correo.of_envio_correo_mapi(lstru_param_correo)= True THEN
	Close(Parent)
ELSE
	
END IF
end event

type pb_borrar_adjunto from picturebutton within w_correo
boolean visible = false
integer x = 562
integer y = 1056
integer width = 101
integer height = 88
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DeleteRow!"
alignment htextalign = left!
string powertiptext = "Eliminar adjunto"
end type

event clicked;//String ls_archivo
//
//ls_archivo= in_cst_envio_correo.of_set_attach_name()
//plb_adjuntos.insertitem( ls_archivo, 1)
//plb_adjuntos.deleteitem(ii_index_adjunto)

end event

type pb_adjuntar from picturebutton within w_correo
integer x = 187
integer y = 1056
integer width = 101
integer height = 88
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\adjuntarArchivo.gif"
alignment htextalign = left!
string powertiptext = "Adjuntar"
end type

event clicked;String ls_archivo
Integer li_picture_index

//Ejecuta la inserción de una ruta en el picturelistbox y llena el vector instanciado de adjuntos
ls_archivo= in_cst_envio_correo.of_set_attach_name()

IF ls_archivo<>'' THEN
	//Asigna el icono
	li_picture_index=	wf_picture_index( ls_archivo)
	plb_adjuntos.insertitem( ls_archivo, li_picture_index ,0	 )
END IF
end event

type pb_direcciones from picturebutton within w_correo
integer x = 82
integer y = 1056
integer width = 101
integer height = 88
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\libretaDirecciones.gif"
alignment htextalign = left!
string powertiptext = "Libreta de direcciones"
end type

event clicked;//stru_frmwrk_parametros	lstr_mensajes
//BOOLEAN				lb_continuar
//INTEGER				li_destino, li_destinos
//STRING				ls_mensaje, ls_email, Ls_direcciones_original
//MAILMESSAGE			lml_mensaje_correo_original
//
//lb_continuar = True
//
//IF ib_correo THEN
//	// Despliega la lista de direcciones(email) para seleccionar las direcciones de destino
//	lml_mensaje_correo_original= iml_mensaje_correo
//	ls_direcciones_original 	= mle_para.Text
//	iml_codigo_correo 			= iml_session_correo.mailAddress()	
//
//	// Si se asignaron direcciones hace un ciclo para verificar que sean validas
//	SetPointer(HourGlass!)
//	mle_para.Text = ''
//	li_destinos = UpperBound(iml_mensaje_correo.Recipient)
//	
//	IF li_destinos > 0 THEN
//		DO WHILE li_destino < li_destinos
//			li_destino++
//			ls_email 			= iml_mensaje_correo.Recipient[li_destino].Name								
//			iml_codigo_correo = iml_session_correo.mailResolveRecipient(ls_email)				
//			
////			IF lstr_mensajes.b_nulo THEN
////				mle_para.Text = ls_direcciones_original
////				iml_mensaje_correo	= lml_mensaje_correo_original
////				lb_continuar 			= False
////				li_destino 				= li_destinos						
////			ELSE					
////				IF li_destino > 1 THEN
////					//mle_para.Text += '~r~n'	
////				END IF					
//				mle_para.Text += ls_email 					
//			//END IF	
//		LOOP
//		
//		
//		is_email = mle_para.Text
//
//		// Evalua el resultado de la validación de direcciones(email)
//		// si hubo error despliega el mensaje
////		IF Not lb_continuar THEN
////			IF Not IsNull(lstr_mensajes.String[1]) THEN  
////				MessageBox("Correo",lstr_mensajes.String[1] )
////			END IF
////		ELSE									
//			iml_codigo_correo = iml_session_correo.mailAddress(iml_mensaje_correo)
////		END IF
//	END IF
//END IF

/******************************************************************************/
mailSession				mSes
mailReturnCode			mRet
mailMessage mMsg


Integer	li_destinos, li_destino
String	ls_email

// Create a mail session
mSes = CREATE mailSession

// Log on to the session
mRet = mSes.mailLogon(mailNewSession!)

IF mRet <> mailReturnSuccess! THEN
    MessageBox("Mail", 'Logon failed.')
    RETURN
END IF

mRet = mSes.mailAddress(mMsg)

IF mRet <> mailReturnSuccess! THEN
    MessageBox("Mail", 'Addressing failed.')
    RETURN
END IF

li_destinos = UpperBound(mMsg.Recipient)
	
IF li_destinos > 0 THEN
	DO WHILE li_destino < li_destinos
		li_destino++
		ls_email 			= mMsg.Recipient[li_destino].address
		
		IF Pos(ls_email,"SMTP:")>0 THEN
			ls_email=Mid(ls_email, Pos(ls_email,"SMTP:")+5)
		END IF
		//iml_codigo_correo = iml_session_correo.mailResolveRecipient(ls_email)				
	
		CHOOSE CASE mMsg.Recipient[li_destino].RecipientType
				CASE mailTo!
					IF mle_para.Text='' THEN
						mle_para.Text += ls_email 					
					ELSE
						mle_para.Text += ';'+ ls_email
					END IF
				CASE mailCC!
					IF mle_cc.Text='' THEN
						mle_cc.Text += ls_email 					
					ELSE
						mle_cc.Text += ';'+ ls_email
					END IF
				CASE mailBCC!
					IF mle_Bcc.Text='' THEN
						mle_Bcc.Text += ls_email 					
					ELSE
						mle_Bcc.Text += ';'+ ls_email
					END IF
		END CHOOSE
		
	LOOP
END IF

mSes.mailLogoff()

DESTROY mSes

end event

type plb_adjuntos from picturelistbox within w_correo
integer x = 2583
integer y = 68
integer width = 763
integer height = 448
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 41943040
boolean border = false
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
string picturename[] = {"imagenes\texto.gif","imagenes\excel.gif","imagenes\csv.gif","imagenes\windows.gif","imagenes\html.gif","imagenes\pdf.gif"}
long picturemaskcolor = 536870912
end type

event selectionchanged;ii_index_adjunto= index
end event

type gb_3 from groupbox within w_correo
integer x = 2555
integer y = 8
integer width = 827
integer height = 532
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Adjuntos"
end type

type st_status_bar from statictext within w_correo
integer x = 41
integer y = 1144
integer width = 512
integer height = 76
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

