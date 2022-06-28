$PBExportHeader$w_receiver_request_details.srw
forward
global type w_receiver_request_details from w_master
end type
type st_8 from statictext within w_receiver_request_details
end type
type st_7 from statictext within w_receiver_request_details
end type
type mle_comments from multilineedit within w_receiver_request_details
end type
type st_6 from statictext within w_receiver_request_details
end type
type sle_id_type_req from singlelineedit within w_receiver_request_details
end type
type cb_ok from commandbutton within w_receiver_request_details
end type
type cb_save from commandbutton within w_receiver_request_details
end type
type cb_cancel2 from picturebutton within w_receiver_request_details
end type
type cb_void2 from picturebutton within w_receiver_request_details
end type
type cb_modify2 from picturebutton within w_receiver_request_details
end type
type cb_complain2 from picturebutton within w_receiver_request_details
end type
type cb_complain from commandbutton within w_receiver_request_details
end type
type cb_cancel from commandbutton within w_receiver_request_details
end type
type cb_void from commandbutton within w_receiver_request_details
end type
type cb_modify from commandbutton within w_receiver_request_details
end type
type mle_response from multilineedit within w_receiver_request_details
end type
type rb_rejected from radiobutton within w_receiver_request_details
end type
type rb_aproved from radiobutton within w_receiver_request_details
end type
type st_5 from statictext within w_receiver_request_details
end type
type sle_invoice from singlelineedit within w_receiver_request_details
end type
type sle_amount from singlelineedit within w_receiver_request_details
end type
type sle_payer from singlelineedit within w_receiver_request_details
end type
type sle_recipient from singlelineedit within w_receiver_request_details
end type
type sle_sender from singlelineedit within w_receiver_request_details
end type
type st_4 from statictext within w_receiver_request_details
end type
type st_3 from statictext within w_receiver_request_details
end type
type st_2 from statictext within w_receiver_request_details
end type
type st_1 from statictext within w_receiver_request_details
end type
type st_payer_info from statictext within w_receiver_request_details
end type
type gb_3 from groupbox within w_receiver_request_details
end type
type gb_1 from groupbox within w_receiver_request_details
end type
type gb_2 from groupbox within w_receiver_request_details
end type
type gb_4 from groupbox within w_receiver_request_details
end type
type gb_5 from groupbox within w_receiver_request_details
end type
end forward

global type w_receiver_request_details from w_master
integer width = 2917
integer height = 1324
string title = "Modification/Cancellation Details"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
st_8 st_8
st_7 st_7
mle_comments mle_comments
st_6 st_6
sle_id_type_req sle_id_type_req
cb_ok cb_ok
cb_save cb_save
cb_cancel2 cb_cancel2
cb_void2 cb_void2
cb_modify2 cb_modify2
cb_complain2 cb_complain2
cb_complain cb_complain
cb_cancel cb_cancel
cb_void cb_void
cb_modify cb_modify
mle_response mle_response
rb_rejected rb_rejected
rb_aproved rb_aproved
st_5 st_5
sle_invoice sle_invoice
sle_amount sle_amount
sle_payer sle_payer
sle_recipient sle_recipient
sle_sender sle_sender
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
st_payer_info st_payer_info
gb_3 gb_3
gb_1 gb_1
gb_2 gb_2
gb_4 gb_4
gb_5 gb_5
end type
global w_receiver_request_details w_receiver_request_details

type variables
String is_id_branch, is_id_type_req
Double id_id_receiver
end variables

event open;call super::open;String	ls_name_receiver, ls_name_sender, ls_destination_country, ls_payer, ls_flag, ls_payer_allow_mod
String 	ls_mod_interfase, ls_can_interfase, ls_request_comments, ls_id_response, ls_response_comments
String 	ls_user_response
Double 	ld_amount
DateTime	ld_date_response

is_id_branch = fn_token(Message.StringParm,'*',1)
id_id_receiver = double(fn_token(Message.StringParm,'*',2))
is_id_type_req = fn_token(Message.StringParm,'*',3)

SELECT dba.receiver.name_receiver,   
		 dba.sender.name_sender,   
		 dba.country.name_country,   
		 dba.group_branch.name_main_branch,
		 net_amount_receiver,
		 id_flag_receiver,
		 payer_allow_mod,
		 payer_mod_interfase,
		 payer_can_interfase
  INTO :ls_name_receiver,   
		 :ls_name_sender,   
		 :ls_destination_country,   
		 :ls_payer,
		 :ld_amount,
		 :ls_flag,
		 :ls_payer_allow_mod,
		 :ls_mod_interfase,
		 :ls_can_interfase
  FROM dba.branch,   
		 dba.country,   
		 dba.group_branch,   
		 dba.receiver,   
		 dba.sender  
 WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch )
   AND ( dba.sender.id_sender = dba.receiver.id_sender )
   AND ( dba.sender.id_branch = dba.receiver.id_branch )
   AND ( dba.branch.id_main_branch = dba.group_branch.id_main_branch )
   AND ( dba.country.id_country = dba.receiver.id_country_receiver )
   AND ( dba.receiver.id_branch = :is_id_branch)
   AND ( dba.receiver.id_receiver = :id_id_receiver);

  SELECT REQUEST_COMMENTS+" [REQUESTED BY "+ dba.RECEIVER_REQUEST.NAME_CASHIER +"]",
  			ID_RESPONSE,
			RESPONSE_COMMENTS,
			DATE_RESPONSE,
			DB_USER_NAME_RESPONSE
    INTO :ls_request_comments,
	   	:ls_id_response, 
			:ls_response_comments,
			:ld_date_response,
			:ls_user_response
    FROM dba.RECEIVER_REQUEST  
   WHERE ( id_branch = :is_id_branch)
     AND ( id_receiver = :id_id_receiver)
     AND ( id_type_req = :is_id_type_req);

sle_invoice.text = is_id_branch+'-'+string(id_id_receiver)
sle_sender.text = fn_replace(ls_name_sender,'  ',' ')
sle_recipient.text = fn_replace(ls_name_receiver,'  ',' ')
sle_payer.text = trim(ls_payer)+ ' (' + trim(ls_destination_country) + ')'
sle_amount.text = string(ld_amount,"$###,###.00")
mle_comments.text = ls_request_comments

if not isnull(ls_id_response) then

	rb_aproved.enabled = false
	rb_rejected.enabled = false
	mle_response.displayonly = true
	cb_save.enabled = false
	
	if ls_id_response = 'A' then
		rb_aproved.checked = true
		rb_rejected.checked = false
	else
		rb_aproved.checked = false
		rb_rejected.checked = true
	end if

	if isnull(ls_user_response) then ls_user_response = 'ADMIN'
		
	mle_response.text = string(ld_date_response,"mm/dd/yyyy hh:mm")+': '+trim(ls_response_comments)+" ["+ls_user_response+"]"
	
end if

if isnull(ls_mod_interfase) or trim(ls_mod_interfase)= '' then ls_mod_interfase = 'N'

if is_id_type_req = 'M' then
	sle_id_type_req.text = "MODIFICATION"
	
	if ls_mod_interfase = 'N' then
		st_payer_info.TextColor = RGB(255,0,0)
		st_payer_info.text = 'EL PAGADOR '+ls_payer+ ' NO SOPORTA MODIFICACIONES EN LINEA.'
	else
		st_payer_info.TextColor = RGB(0,0,0)
		st_payer_info.text = 'EL PAGADOR '+ls_payer+ ' SOPORTA MODIFICACIONES EN LINEA.'
	end if
else
	sle_id_type_req.text = "CANCELLATION"	
	if ls_can_interfase = 'N' then
		st_payer_info.TextColor = RGB(255,0,0)
		st_payer_info.text = 'EL PAGADOR '+ls_payer+ ' NO SOPORTA CANCELACIONES EN LINEA.'
	else
		st_payer_info.TextColor = RGB(0,0,0)
		st_payer_info.text = 'EL PAGADOR '+ls_payer+ ' SOPORTA CANCELACIONES EN LINEA.'
	end if
end if

end event

on w_receiver_request_details.create
int iCurrent
call super::create
this.st_8=create st_8
this.st_7=create st_7
this.mle_comments=create mle_comments
this.st_6=create st_6
this.sle_id_type_req=create sle_id_type_req
this.cb_ok=create cb_ok
this.cb_save=create cb_save
this.cb_cancel2=create cb_cancel2
this.cb_void2=create cb_void2
this.cb_modify2=create cb_modify2
this.cb_complain2=create cb_complain2
this.cb_complain=create cb_complain
this.cb_cancel=create cb_cancel
this.cb_void=create cb_void
this.cb_modify=create cb_modify
this.mle_response=create mle_response
this.rb_rejected=create rb_rejected
this.rb_aproved=create rb_aproved
this.st_5=create st_5
this.sle_invoice=create sle_invoice
this.sle_amount=create sle_amount
this.sle_payer=create sle_payer
this.sle_recipient=create sle_recipient
this.sle_sender=create sle_sender
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_payer_info=create st_payer_info
this.gb_3=create gb_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_8
this.Control[iCurrent+2]=this.st_7
this.Control[iCurrent+3]=this.mle_comments
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.sle_id_type_req
this.Control[iCurrent+6]=this.cb_ok
this.Control[iCurrent+7]=this.cb_save
this.Control[iCurrent+8]=this.cb_cancel2
this.Control[iCurrent+9]=this.cb_void2
this.Control[iCurrent+10]=this.cb_modify2
this.Control[iCurrent+11]=this.cb_complain2
this.Control[iCurrent+12]=this.cb_complain
this.Control[iCurrent+13]=this.cb_cancel
this.Control[iCurrent+14]=this.cb_void
this.Control[iCurrent+15]=this.cb_modify
this.Control[iCurrent+16]=this.mle_response
this.Control[iCurrent+17]=this.rb_rejected
this.Control[iCurrent+18]=this.rb_aproved
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.sle_invoice
this.Control[iCurrent+21]=this.sle_amount
this.Control[iCurrent+22]=this.sle_payer
this.Control[iCurrent+23]=this.sle_recipient
this.Control[iCurrent+24]=this.sle_sender
this.Control[iCurrent+25]=this.st_4
this.Control[iCurrent+26]=this.st_3
this.Control[iCurrent+27]=this.st_2
this.Control[iCurrent+28]=this.st_1
this.Control[iCurrent+29]=this.st_payer_info
this.Control[iCurrent+30]=this.gb_3
this.Control[iCurrent+31]=this.gb_1
this.Control[iCurrent+32]=this.gb_2
this.Control[iCurrent+33]=this.gb_4
this.Control[iCurrent+34]=this.gb_5
end on

on w_receiver_request_details.destroy
call super::destroy
destroy(this.st_8)
destroy(this.st_7)
destroy(this.mle_comments)
destroy(this.st_6)
destroy(this.sle_id_type_req)
destroy(this.cb_ok)
destroy(this.cb_save)
destroy(this.cb_cancel2)
destroy(this.cb_void2)
destroy(this.cb_modify2)
destroy(this.cb_complain2)
destroy(this.cb_complain)
destroy(this.cb_cancel)
destroy(this.cb_void)
destroy(this.cb_modify)
destroy(this.mle_response)
destroy(this.rb_rejected)
destroy(this.rb_aproved)
destroy(this.st_5)
destroy(this.sle_invoice)
destroy(this.sle_amount)
destroy(this.sle_payer)
destroy(this.sle_recipient)
destroy(this.sle_sender)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_payer_info)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_4)
destroy(this.gb_5)
end on

type st_8 from statictext within w_receiver_request_details
integer x = 59
integer y = 860
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comments :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_receiver_request_details
integer x = 59
integer y = 552
integer width = 265
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notes :"
boolean focusrectangle = false
end type

type mle_comments from multilineedit within w_receiver_request_details
integer x = 347
integer y = 860
integer width = 1147
integer height = 204
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean vscrollbar = true
boolean displayonly = true
end type

type st_6 from statictext within w_receiver_request_details
integer x = 59
integer y = 788
integer width = 265
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Req. Type :"
boolean focusrectangle = false
end type

type sle_id_type_req from singlelineedit within w_receiver_request_details
integer x = 347
integer y = 788
integer width = 1147
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type cb_ok from commandbutton within w_receiver_request_details
integer x = 2203
integer y = 1108
integer width = 654
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_save from commandbutton within w_receiver_request_details
integer x = 2441
integer y = 92
integer width = 334
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;String ls_id_response, ls_name_response

if not rb_aproved.checked and not rb_rejected.checked then
	MessageBox("Error","Please select a response type (Aproved/Rejected)",StopSign!)
	return
end if

// Aprobacion de una Solicitud de Cancelacion, siempre es automatica cuando el giro se cancela
if (is_id_type_req = 'C') and (rb_aproved.checked) then
	MessageBox("Error","You cannot aprove a cancellation on this screen.~nGo to the 'Cancel Invoice' screen and the request will be automatically aproved when the cancellation is processed.",StopSign!)
	return
end if

if rb_aproved.checked then
	ls_id_response = 'A'
	ls_name_response = 'APROVED'
else
	ls_id_response = 'R'
	ls_name_response = 'REJECTED'
end if

if messagebox("Confirmation","Are you sure that you want to close this request as "+ls_name_response+"?",Question!,YesNo!) <> 1 Then
	return
end if

UPDATE dba.RECEIVER_REQUEST
   SET ID_RESPONSE = :ls_id_response,
       RESPONSE_COMMENTS = :mle_response.text,
	    DATE_RESPONSE = getDate(),
	    SEND_RESPONSE = 'Y'
 WHERE ID_BRANCH = :is_id_branch
   AND ID_RECEIVER = :id_id_receiver
	AND ID_TYPE_REQ = :is_id_type_req;

if SQLCA.SQLCode <> 0 then
	Messagebox("SQL Error Updating Receiver Request","The Error is: "+SQLCA.SQLErrText,StopSign!)
	return
end if

rb_aproved.enabled = false
rb_rejected.enabled = false
mle_response.displayonly = true
cb_save.enabled = false

MessageBox("Notification","Request was closed as "+ls_name_response,Information!)


end event

type cb_cancel2 from picturebutton within w_receiver_request_details
integer x = 1829
integer y = 652
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "OutputStop!"
alignment htextalign = left!
end type

event clicked;cb_cancel.triggerEvent(Clicked!)
end event

type cb_void2 from picturebutton within w_receiver_request_details
integer x = 1829
integer y = 524
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Custom080!"
alignment htextalign = left!
end type

event clicked;cb_void.triggerEvent(Clicked!)
end event

type cb_modify2 from picturebutton within w_receiver_request_details
integer x = 1829
integer y = 780
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "Custom094!"
alignment htextalign = left!
end type

event clicked;cb_modify.triggerEvent(Clicked!)
end event

type cb_complain2 from picturebutton within w_receiver_request_details
integer x = 1829
integer y = 908
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "Custom043!"
alignment htextalign = left!
end type

event clicked;cb_complain.triggerEvent(Clicked!)
end event

type cb_complain from commandbutton within w_receiver_request_details
integer x = 1819
integer y = 900
integer width = 869
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Complaints/Messages"
end type

event clicked;Double ld_id_sender

gs_branch_insta_cons = is_id_branch
gl_receiver_cons = id_id_receiver

SELECT id_sender 
  INTO :ld_id_sender  
  FROM  dba.receiver
 WHERE ( dba.receiver.id_branch = :is_id_branch ) 
   AND ( dba.receiver.id_receiver = :id_id_receiver );	
	
Openwithparm(w_consulta_reclamo,ld_id_sender)






end event

type cb_cancel from commandbutton within w_receiver_request_details
integer x = 1819
integer y = 644
integer width = 869
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel this invoice"
end type

event clicked;OpenWithParm(w_cancelar_invoice,is_id_branch+'*'+string(id_id_receiver))
end event

type cb_void from commandbutton within w_receiver_request_details
integer x = 1819
integer y = 516
integer width = 869
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Void this invoice"
end type

event clicked;Open(w_voidiar_envios_central)

end event

type cb_modify from commandbutton within w_receiver_request_details
integer x = 1819
integer y = 772
integer width = 869
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Modify Recipient Info."
end type

event clicked;string ls_id_branch, ls_id_flag
double ld_id_receiver
long ll_cont

ls_id_branch = is_id_branch
ld_id_receiver = id_id_receiver

SELECT id_flag_receiver
  INTO :ls_id_flag
  FROM dba.receiver
 WHERE id_branch = :ls_id_branch
   AND id_receiver = :ld_id_receiver
	AND id_flag_receiver in ('H','I','T');


if ls_id_flag = 'H' then
	
	SELECT COUNT(*)
	  INTO :ll_cont
	  FROM dba.MOTIVO_HOLD
	 WHERE DESC_MOTIVO_HOLD IN (1,2,3,4,7,8,9,19,21,62,65,90)
	   AND id_branch = :ls_id_branch
		AND id_receiver = :ld_id_receiver;
		
		if ll_cont > 0 then
			Messagebox("Modification Not Allowed","This invoice cannot be modified because it is under compliance investigation.",StopSign!)
			return
		end if

end if

if ls_id_flag <> 'H' and ls_id_flag <> 'I' and ls_id_flag <> 'T' and trim(gs_cashier) <> '1000' then
	Messagebox("Modification Not Allowed","This incoice cannot be modified because its status is not a valid status for modifications.",StopSign!)
	return
end if

OpenWithParm(w_recipientmodification,ls_id_branch+'*'+string(ld_id_receiver))
	
end event

type mle_response from multilineedit within w_receiver_request_details
integer x = 1659
integer y = 192
integer width = 1115
integer height = 176
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
textcase textcase = upper!
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type rb_rejected from radiobutton within w_receiver_request_details
integer x = 2039
integer y = 112
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rejected"
end type

type rb_aproved from radiobutton within w_receiver_request_details
integer x = 1664
integer y = 112
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aproved"
end type

type st_5 from statictext within w_receiver_request_details
integer x = 59
integer y = 112
integer width = 265
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Invoice :"
boolean focusrectangle = false
end type

type sle_invoice from singlelineedit within w_receiver_request_details
integer x = 347
integer y = 108
integer width = 411
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type sle_amount from singlelineedit within w_receiver_request_details
integer x = 347
integer y = 312
integer width = 411
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type sle_payer from singlelineedit within w_receiver_request_details
integer x = 347
integer y = 484
integer width = 1147
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type sle_recipient from singlelineedit within w_receiver_request_details
integer x = 347
integer y = 244
integer width = 1147
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type sle_sender from singlelineedit within w_receiver_request_details
integer x = 347
integer y = 176
integer width = 1147
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type st_4 from statictext within w_receiver_request_details
integer x = 59
integer y = 316
integer width = 265
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Amount :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_receiver_request_details
integer x = 59
integer y = 488
integer width = 265
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_receiver_request_details
integer x = 59
integer y = 248
integer width = 265
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recipient :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_receiver_request_details
integer x = 59
integer y = 180
integer width = 265
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sender :"
boolean focusrectangle = false
end type

type st_payer_info from statictext within w_receiver_request_details
integer x = 347
integer y = 552
integer width = 1147
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_receiver_request_details
integer x = 32
integer y = 724
integer width = 1522
integer height = 364
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Request Information"
end type

type gb_1 from groupbox within w_receiver_request_details
integer x = 32
integer y = 28
integer width = 1522
integer height = 380
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Invoice Information"
end type

type gb_2 from groupbox within w_receiver_request_details
integer x = 1591
integer y = 412
integer width = 1266
integer height = 676
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tools"
end type

type gb_4 from groupbox within w_receiver_request_details
integer x = 1591
integer y = 28
integer width = 1266
integer height = 380
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Response Information"
end type

type gb_5 from groupbox within w_receiver_request_details
integer x = 32
integer y = 412
integer width = 1522
integer height = 296
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer Information"
end type

