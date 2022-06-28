$PBExportHeader$w_cancelar_invoice.srw
forward
global type w_cancelar_invoice from wb_response
end type
type pb_message_mt from picturebutton within w_cancelar_invoice
end type
type st_3 from statictext within w_cancelar_invoice
end type
type lst_cancelation_reason from my_ddlb within w_cancelar_invoice
end type
type cb_removecancelationrequest from commandbutton within w_cancelar_invoice
end type
type st_modecanc from statictext within w_cancelar_invoice
end type
type st_payer from statictext within w_cancelar_invoice
end type
type p_2 from picture within w_cancelar_invoice
end type
type cb_2 from commandbutton within w_cancelar_invoice
end type
type cbx_force from checkbox within w_cancelar_invoice
end type
type sle_reason from singlelineedit within w_cancelar_invoice
end type
type cbx_refund from checkbox within w_cancelar_invoice
end type
type cb_1 from commandbutton within w_cancelar_invoice
end type
type st_1 from statictext within w_cancelar_invoice
end type
type em_invoice from editmask within w_cancelar_invoice
end type
type st_2 from statictext within w_cancelar_invoice
end type
type sle_branch from singlelineedit within w_cancelar_invoice
end type
type dw_1 from datawindow within w_cancelar_invoice
end type
type gb_1 from groupbox within w_cancelar_invoice
end type
type p_1 from picture within w_cancelar_invoice
end type
end forward

global type w_cancelar_invoice from wb_response
integer x = 393
integer y = 276
integer width = 3026
integer height = 2260
string title = "Cancel Invoice"
long backcolor = 67108864
pb_message_mt pb_message_mt
st_3 st_3
lst_cancelation_reason lst_cancelation_reason
cb_removecancelationrequest cb_removecancelationrequest
st_modecanc st_modecanc
st_payer st_payer
p_2 p_2
cb_2 cb_2
cbx_force cbx_force
sle_reason sle_reason
cbx_refund cbx_refund
cb_1 cb_1
st_1 st_1
em_invoice em_invoice
st_2 st_2
sle_branch sle_branch
dw_1 dw_1
gb_1 gb_1
p_1 p_1
end type
global w_cancelar_invoice w_cancelar_invoice

type variables
Long	il_rows
string	is_output, is_agency_reason = '017' 
end variables

forward prototypes
public function integer f_existe_request_cancelation (string ps_idranch, long id_receiver)
public function boolean f_register_cancelation ()
end prototypes

public function integer f_existe_request_cancelation (string ps_idranch, long id_receiver);LONG l_existe

SELECT COUNT(1)
	INTO :l_existe
FROM DBA.RECEIVER_REQUEST RQ
WHERE RQ.ID_BRANCH =:ps_idranch
  AND RQ.ID_TYPE_REQ = 'C'
  AND RQ.ID_RECEIVER = :id_receiver
  AND RQ.SEND_RESPONSE = 'N';
  
RETURN l_existe 
end function

public function boolean f_register_cancelation ();STRING ls_idbranch, ls_cancelation_reason, s_type_message, s_id_cancelation
LONG ll_idreceiver, ll_id_sender



ls_idbranch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
ll_idreceiver = dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
ll_id_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")

ls_cancelation_reason = lst_cancelation_reason.text

s_id_cancelation = lst_cancelation_reason.getdataid()

IF IsNull(s_id_cancelation) or len(s_id_cancelation) = 0 THEN
	messageBox('Warning!','Please, select the cancelation reason')
	RETURN false
END IF

IF s_id_cancelation = is_agency_reason THEN
	s_type_message ='CA'
ELSE
	s_type_message = 'CB'
END IF

SELECT CR.DESC_CANCELATION_REASON
 INTO :ls_cancelation_reason
FROM dba.CANCELATION_REASONS CR
WHERE CR.ID_CANCELATION_REASON = :s_id_cancelation;

ls_cancelation_reason = s_id_cancelation+"-Order "+Trim(ls_idbranch)+"-"+String(ll_idreceiver) + " - "+ls_cancelation_reason

INSERT INTO dba.COSTUMER_SERVICE
	(
	ID_SENDER
	, ID_BRANCH
	, ID_RECEIVER
	, DATE_COSTUMER_SERVICE
	, TIME_COSTUMER_SERVICE
	, ID_CASHIER
	, DES_COSTUMER_SERVICE
	, TRANS_COSTUMER_SERVICE
	, FLAG_COSTUMER_SERVICE
	, SOURCE
	, FLAG_WEB
	, ID_TYPE_MESSAGE
	, WEB_USER
	, ATTACHMENT_PATH
	)
VALUES
	(
	:ll_id_sender
	,:ls_idbranch
	,:ll_idreceiver
	,getdate() +  .0001
	,getdate() +  .0001
	,:gs_cashier
	,:ls_cancelation_reason
	, 'N'
	,  'N'
	, 'A'
	, 'N'
	,:s_type_message
	, NULL
	, NULL
	);
	
RETURN true
end function

on w_cancelar_invoice.create
int iCurrent
call super::create
this.pb_message_mt=create pb_message_mt
this.st_3=create st_3
this.lst_cancelation_reason=create lst_cancelation_reason
this.cb_removecancelationrequest=create cb_removecancelationrequest
this.st_modecanc=create st_modecanc
this.st_payer=create st_payer
this.p_2=create p_2
this.cb_2=create cb_2
this.cbx_force=create cbx_force
this.sle_reason=create sle_reason
this.cbx_refund=create cbx_refund
this.cb_1=create cb_1
this.st_1=create st_1
this.em_invoice=create em_invoice
this.st_2=create st_2
this.sle_branch=create sle_branch
this.dw_1=create dw_1
this.gb_1=create gb_1
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_message_mt
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.lst_cancelation_reason
this.Control[iCurrent+4]=this.cb_removecancelationrequest
this.Control[iCurrent+5]=this.st_modecanc
this.Control[iCurrent+6]=this.st_payer
this.Control[iCurrent+7]=this.p_2
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cbx_force
this.Control[iCurrent+10]=this.sle_reason
this.Control[iCurrent+11]=this.cbx_refund
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.em_invoice
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.sle_branch
this.Control[iCurrent+17]=this.dw_1
this.Control[iCurrent+18]=this.gb_1
this.Control[iCurrent+19]=this.p_1
end on

on w_cancelar_invoice.destroy
call super::destroy
destroy(this.pb_message_mt)
destroy(this.st_3)
destroy(this.lst_cancelation_reason)
destroy(this.cb_removecancelationrequest)
destroy(this.st_modecanc)
destroy(this.st_payer)
destroy(this.p_2)
destroy(this.cb_2)
destroy(this.cbx_force)
destroy(this.sle_reason)
destroy(this.cbx_refund)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.em_invoice)
destroy(this.st_2)
destroy(this.sle_branch)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.p_1)
end on

event open;call super::open;String ls_id_branch
Double ld_id_receiver
LONG l_existe

ls_id_branch = fn_token(Message.StringParm,'*',1)
ld_id_receiver = double(fn_token(Message.StringParm,'*',2))

if not isnull(ls_id_branch) and len(trim(ls_id_branch)) > 3 and &
	not isnull(ld_id_receiver) and ld_id_receiver > 0 then
	
	sle_branch.text = ls_id_branch
	em_invoice.text = string(ld_id_receiver)
	
	sle_branch.enabled = false
	em_invoice.enabled = false
	
	
	
	l_existe = f_existe_request_cancelation(ls_id_branch, ld_id_receiver)
	  
  	
	IF l_existe > 0 THEN
		lst_cancelation_reason.Enabled = false
		lst_cancelation_reason.setselectedid(is_agency_reason)
	
	END IF
	
	em_invoice.triggerEvent(LoseFocus!)
	
end if

Commit;

cbx_force.enabled = false

//long ll_cont
//
//SELECT count(*)
//INTO :ll_cont
//FROM dba.SEC_USER_GROUP
//WHERE ID_GROUP = 'OCF' 
//AND ID_USER = :gs_cashier;
//	  
//if ll_cont > 0 then cbx_force.enabled = true

cb_removecancelationrequest.visible = false


if fn_check_user_role('OCF') > 0 then cbx_force.enabled = true
if fn_check_user_role('OCF') > 0 then cb_removecancelationrequest.visible = true


dw_1.settransobject(sqlca)
dw_1.insertrow(0)




end event

type pb_message_mt from picturebutton within w_cancelar_invoice
boolean visible = false
integer x = 2501
integer y = 224
integer width = 110
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Where!"
alignment htextalign = left!
string powertiptext = "Send Message Money Transfer"
end type

event clicked;IF f_register_cancelation() THEN
	Commit;
	
	pb_message_mt.enabled = false
	messagebox('Atention!','The message has been saved' )
END IF
end event

type st_3 from statictext within w_cancelar_invoice
integer x = 1207
integer y = 164
integer width = 475
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = ".50,5000;DB=ENVIO~'"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "Cancelation Reason:"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_cancelation_reason from my_ddlb within w_cancelar_invoice
integer x = 1216
integer y = 228
integer width = 1285
integer height = 348
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
end type

event constructor;call super::constructor;this.addquery("SELECT CR.DESC_SHORT_REASON, CR.ID_CANCELATION_REASON FROM dba.CANCELATION_REASONS CR WHERE CR.CANCELATION_TYPE = 'INTERNO' AND AVAIBLE_REASON = 'Y'   UNION select '','' ;;")
end event

type cb_removecancelationrequest from commandbutton within w_cancelar_invoice
integer x = 1737
integer y = 312
integer width = 827
integer height = 176
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Remove Cancelation Request"
end type

event clicked;double ld_idreceiver, ld_cancelation_req
string  ls_idbranch, ls_group, ls_can_interfase


ls_idbranch = sle_branch.text
ld_idreceiver = double( em_invoice.text )

		
 ls_group = dw_1.getitemstring(dw_1.getrow(),'id_main_branch_sent')
		
SELECT payer_can_interfase
INTO :ls_can_interfase
FROM dba.group_branch
WHERE dba.group_branch.id_main_branch = :ls_group;


if isnull(ls_can_interfase) or ls_can_interfase <> 'Y' then ls_can_interfase = 'N'

if (ls_can_interfase = 'Y')  then
	
	
	SELECT id_cancelation_req
	INTO :ld_cancelation_req
	FROM dba.receiver
	WHERE id_branch = :ls_idbranch
	and id_receiver =:ld_idreceiver;

	
	if ld_cancelation_req <> 1 then
	
		if messagebox('ALERT','Are you sure you want to remove the cancelation request for this order?',question!,yesno!,1) = 1 then
				
			UPDATE dba.RECEIVER
			SET id_cancelation_req = NULL
			WHERE ID_BRANCH = :ls_idbranch 
			AND ID_RECEIVER = :ld_idreceiver;
				
			Messagebox("Completed","Process Completed")
			return						

		
		else
			
			Messagebox("Canceled","Process Canceled",StopSign!)
			return		
	
		end if

	else

		Messagebox("Error","The order has cancelation status approved (1) and cannot be re-send",StopSign!)
		return
		
	end if

else
	
	Messagebox("Error","This payer does not use cancelation request thru the system",StopSign!)
	return

end if



end event

type st_modecanc from statictext within w_cancelar_invoice
integer x = 1381
integer y = 64
integer width = 1074
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_payer from statictext within w_cancelar_invoice
integer x = 151
integer y = 152
integer width = 1065
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type p_2 from picture within w_cancelar_invoice
integer x = 1093
integer y = 368
integer width = 73
integer height = 64
boolean originalsize = true
string picturename = "OutputStop!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type cb_2 from commandbutton within w_cancelar_invoice
integer x = 1065
integer y = 312
integer width = 658
integer height = 176
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "   Expire Invoice"
end type

event clicked;double d_rown, row, ld_idreceiver, ld_cancelation_req, ld_return
string  ls_idbranch, ls_desc_cancelation_req, ls_group, ls_branch_pay, ls_can_interfase, ls_flag

ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")

if messagebox('ALERT','Are you sure you want to expire this order?',question!,yesno!,1) = 1 then

	ls_idbranch = sle_branch.text
	ld_idreceiver = double( em_invoice.text )
	
	UPDATE dba.RECEIVER
	SET ORDER_EXPIRED = 'Y'
	WHERE ID_BRANCH = :ls_idbranch 
	AND ID_RECEIVER = :ld_idreceiver;
		
	
	SELECT BRANCH_PAY_RECEIVER, ID_MAIN_BRANCH_SENT
	INTO :ls_branch_pay, :ls_group
	FROM dba.receiver
	WHERE id_branch = :ls_idbranch
	and id_receiver =:ld_idreceiver;
				
	 ls_group = dw_1.getitemstring(dw_1.getrow(),'id_main_branch_sent')
			
	SELECT payer_can_interfase
	INTO :ls_can_interfase
	FROM dba.group_branch
	WHERE dba.group_branch.id_main_branch = :ls_group;
	
	if cbx_force.checked then
		fn_cancel_invoice(ls_idbranch,ld_idreceiver,'N')
		Messagebox("Cancelation Forced!","Invoice Canceled")	
		
		update dba.receiver
			set id_cancelation_req = 1
		 where id_branch = :ls_idbranch
			and id_receiver =: ld_idreceiver;
		
		return
		
	end if
	
	if isnull(ls_can_interfase) or ls_can_interfase <> 'Y' then ls_can_interfase = 'N'

	if (ls_can_interfase = 'Y')  then

		select id_cancelation_req
	  	into :ld_cancelation_req
	  	from dba.receiver
	 	where id_branch = :ls_idbranch
	   	and id_receiver =:ld_idreceiver;
			
	if isnull(ld_cancelation_req) or ld_cancelation_req = 9 then

		update dba.receiver
		set id_cancelation_req = 0
		where id_branch = :ls_idbranch
		and id_receiver =: ld_idreceiver;
		
		// La CANCELACION se envia en una retransmision a excepcion de Agricola
		if ls_group <> 'T053' then
			
			update dba.receiver
			   set trans_receiver = 'N'
			 where id_branch = :ls_idbranch
			   and id_receiver =: ld_idreceiver;			
			
		end if				
		
		commit;
		
		
	else
		
		select desc_cancelation_req
		  into :ls_desc_cancelation_req
		  from dba.cancelation_requests
		 where id_cancelation_req = :ld_cancelation_req;				
		
		if isnull(ls_desc_cancelation_req) then ls_desc_cancelation_req =''
		
		
	end if
	
	else
	
		ld_return = fn_cancel_invoice(ls_idbranch,ld_idreceiver,'N')
		if ld_return > -1 then
			Messagebox("Expiration Complete in MTSA","Order has been expired in MTSA.~nPlease be sure to confirm the Cancelation with the payer.")
			
		else
			Messagebox("Process Cancelled","Process cancelled by user, the order was not cancelled.")	
		end if
   end if

//	if ld_count = 0 then
//		messagebox('ALERT','No Record Selected',stopsign!)
//	else
//		messagebox('Expiration Request', 'Expiration Request was send to the Payer',exclamation!)
//	end if

end if



end event

type cbx_force from checkbox within w_cancelar_invoice
integer x = 155
integer y = 240
integer width = 635
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Force Cancel/Expiration"
end type

type sle_reason from singlelineedit within w_cancelar_invoice
boolean visible = false
integer x = 1637
integer y = 400
integer width = 946
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_refund from checkbox within w_cancelar_invoice
boolean visible = false
integer x = 1637
integer y = 320
integer width = 741
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Refund Commission, Reason :"
end type

event clicked;sle_reason.enabled = this.checked
end event

type cb_1 from commandbutton within w_cancelar_invoice
integer x = 146
integer y = 312
integer width = 905
integer height = 176
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&Cancel Invoice"
end type

event clicked;string 	ls_idbranch, ls_branch_pay, ls_group, ls_desc_cancelation_req, ls_flag, ls_can_interfase, ls_agencyfolder, ls_idpayment, ls_cancelation_reason
double 	ld_idreceiver, ld_cancelation_req, ld_maint_fee
datetime	ld_fecha_envio, ld_hoy
long 		ll_cont, ll_filenum, ld_return

ls_idbranch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
ld_idreceiver = dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
ls_branch_pay = dw_1.getitemstring(dw_1.getrow(),"branch_pay_receiver")
ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ld_fecha_envio = dw_1.getitemdatetime(dw_1.getrow(),"date_receiver")
ls_group = dw_1.getitemstring(dw_1.getrow(),'id_main_branch_sent')
ld_maint_fee = dw_1.getitemnumber(dw_1.getrow(),'maintenance_fee')

ls_cancelation_reason = lst_cancelation_reason.getdataid()

ls_idpayment = dw_1.getitemstring(dw_1.getrow(),"id_payment")

// ******************
// Validate U: Drive!
//fn_map_output()
//if not fileexists('R:\Output') then
//	Messagebox("Error!","Network drive not ready, please try again!",StopSign!)
//	return
//end if
// ******************

// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Prueba ANULAR el envio antes de hacer la CANCELACION

SELECT count(*)  
INTO :ll_cont  
FROM dba.RELACION_INVOICES_PAYEE  
WHERE ( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_idbranch) 
AND ( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_idreceiver );

SELECT getdate()
INTO :ld_hoy 
FROM dba.dual;

// Es posible anularlo:	- No ha sido transmitido (Hold o Done)
// 								- No esta en closing
//								- Es del mismo dia

if (ls_flag = 'I' or ls_flag = 'H') and &
   (Date(ld_fecha_envio) = Date(ld_hoy)) and &
	ll_cont = 0 then

	if messagebox("Confirmation","Are you sure that you want to CANCEL (VOID) the invoice "+ls_idbranch+'-'+string(ld_idreceiver)+"?",Question!,YesNo!) = 2 then
		return
	end if

	IF IsNull(ls_cancelation_reason) or len(ls_cancelation_reason) = 0 THEN
		Messagebox("Warning!","Please select a cancelation reason",StopSign!)
		return
	END IF

	// Anulacion
	UPDATE dba.receiver  
	SET dba.receiver.id_flag_receiver = 'A',   
	dba.receiver.net_amount_receiver = 0,   
	dba.receiver.rate_change_receiver = 0,   
	dba.receiver.telex_receiver = 0,   
	dba.receiver.exchange_receiver = 0,   
	dba.receiver.handling_receiver = 0,   
	dba.receiver.total_receiver = 0,   
	dba.receiver.porc_comision_receiver = 0,    
	dba.receiver.total_pay_receiver = 0,   
	dba.receiver.exchange_company = 0,   
	dba.receiver.telex_company = 0,   
	dba.receiver.total_diference = 0, 
	dba.receiver.fx_receiver = 0, 
	dba.receiver.total_modo_pago = 0,
	dba.receiver.total_modo_pago_comp = 0,
	dba.receiver.fee_rate = 0,
	dba.receiver.commission_payee = 0,
	dba.receiver.state_tax = 0,
	AGENT_COMM_PROFIT = 0
	WHERE (dba.receiver.id_branch = :ls_idbranch) 
	AND (dba.receiver.id_receiver = :ld_idreceiver);
	
	// **************************************************
	// Devuelve los puntos de Loyalty al cliente
	
	INSERT INTO dba.LOYALTY_CANCELATION_QUEUE
	SELECT ID_BRANCH,
	ID_RECEIVER,
	LOYALTY_SUBMIT,
	LOYALTY_SPEND
	FROM dba.RECEIVER_DYNAMO
	WHERE id_receiver = :ld_idreceiver
	AND id_branch = :ls_idbranch
	AND (LOYALTY_SUBMIT = 1 OR LOYALTY_SPEND =1);
	
	//**************************************************

	f_register_cancelation()

	if SQLCA.SQLCODE <> 0 then
		Messagebox("Error Updating","Error updating invoice info, the operation was not completed.~n"+SQLCA.SQLErrText,StopSign!)
		return		
	else
		

		
		INSERT INTO dba.history_invoice ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change)
			  VALUES (:ls_idbranch,:ld_idreceiver,:ls_flag,'A',:gs_cashier,getdate(),getdate());
		
//		// **************************************************
//		// Genera el archivo SQL para la agencia
//		String ls_output, ls_sqlsyntax, ls_date, ls_time, ls_filename
//		
//		SELECT DISTINCT dba.parametros.dir_output  
//		  INTO :ls_output
//		  FROM dba.parametros;
//		 
//		ls_output = trim(ls_output) 
//		
//		ls_date = String(Today(),"mmdd")
//		ls_time = String(Now(),"HHMM")
//		
//		ls_agencyfolder = ''
//		if fileexists(ls_output+trim(ls_idbranch)) then ls_agencyfolder = trim(ls_idbranch) + '\'
//		
//		
//		ls_filename = ls_output+ls_agencyfolder+'BNN'+Fill('0',10 - Len(ls_idbranch))+ls_idbranch+".sql"
//		ll_filenum  = FileOpen(ls_filename, LineMode!, Write!, LockWrite!, Append!)
//		
//		ls_sqlsyntax= "UPDATE receiver SET id_flag_receiver = 'A', net_amount_receiver = 0, "+ &
//						  "rate_change_receiver = 0, telex_receiver = 0, exchange_receiver = 0, "+ &
//						  "handling_receiver = 0, total_receiver = 0, porc_comision_receiver = 0, total_pay_receiver = 0, "+&
//						  "exchange_company = 0,  telex_company = 0, total_diference = 0, fee_rate = 0"								
//		ls_sqlsyntax +=	" WHERE id_branch = '"+ ls_idbranch + "' AND " + &
//								"id_receiver = "+ String(ld_idreceiver) + " ;"		
//		FileWrite (ll_filenum,ls_sqlsyntax)
//
//		
//		ls_sqlsyntax= "UPDATE receiver SET state_tax = 0, AGENT_COMM_PROFIT = 0"								
//		ls_sqlsyntax +=	" WHERE id_branch = '"+ ls_idbranch + "' AND " + &
//								"id_receiver = "+ String(ld_idreceiver) + " ;"		
//		FileWrite (ll_filenum,ls_sqlsyntax)		
//		
//		FileClose (ll_filenum)
//		// **************************************************

	end if
	
	// ........................................
	// refresh the canceled invoice
	dw_1.retrieve(ls_idbranch,ld_idreceiver)
	cbx_refund.checked = false
	sle_reason.enabled = false
	sle_reason.text = ''
	// ........................................	
	
	Return
end if

// Prueba ANULAR el envio antes de hacer la CANCELACION
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


// Cancelacion:


if cbx_refund.checked then

	if len(trim(sle_reason.text)) < 5 then
		Messagebox("No Refund Reason","You must provide a Refund Reason.",StopSign!)
		return
	end if	
		
	// Inserta el registro de solicitud de REFUND	
	INSERT INTO dba.RECEIVER_CANCELATIONREFUND (ID_BRANCH, ID_RECEIVER, CONS_TRANS_DIARIA, REFUND_DESC, DB_USER_NAME, DB_HOST_NAME)
     	  VALUES (:ls_idbranch, :ld_idreceiver, 0, :sle_reason.text, SYSTEM_USER, HOST_NAME());	
	
	if SQLCA.SQLCode <> 0 and SQLCA.SQLCode <> -1 then
		Messagebox("SQL ERROR "+string(SQLCA.SQLCode),"Error Inserting REFUND data, please contact support.~n"+SQLCA.SqlErrText, StopSign!)
		return				
	end if	
	
end if

// ::::::::::::::::::::::::::::::::::::::::::::::::::
if cbx_force.checked then
	
	IF IsNull(ls_cancelation_reason) or len(ls_cancelation_reason) = 0 THEN
		Messagebox("Warning!","Please select a cancelation reason",StopSign!)
		return
	END IF


	fn_cancel_invoice(ls_idbranch,ld_idreceiver,'N')
	f_register_cancelation()
	Messagebox("Cancelation Forced!","Invoice Canceled")	
	
	//moved to the SP
//	update dba.receiver
//	set id_cancelation_req = 1
//	where id_branch = :ls_idbranch
//	and id_receiver =: ld_idreceiver;
	
	return
	
end if
// ::::::::::::::::::::::::::::::::::::::::::::::::::

SELECT payer_can_interfase
  INTO :ls_can_interfase
  FROM dba.group_branch
 WHERE dba.group_branch.id_main_branch = :ls_group;

if isnull(ls_can_interfase) or ls_can_interfase <> 'Y' then ls_can_interfase = 'N'

if (ls_can_interfase = 'Y') and (ls_flag <> 'H') then

	select id_cancelation_req
	  into :ld_cancelation_req
	  from dba.receiver
	 where id_branch = :ls_idbranch
	   and id_receiver =: ld_idreceiver;
	
	if isnull(ld_cancelation_req) or ld_cancelation_req = 9 then

		update dba.receiver
		   set id_cancelation_req = 0
		 where id_branch = :ls_idbranch
		   and id_receiver =: ld_idreceiver;
		
		// La CANCELACION se envia en una retransmision a excepcion de  Agricola
		if ls_group <> 'T053' then
			
			update dba.receiver
			   set trans_receiver = 'N'
			 where id_branch = :ls_idbranch
			   and id_receiver =: ld_idreceiver;			
			
		end if				
		
		commit;
		
		Messagebox("Cancelation request sent","A cancelation request was sent to the payer.~nPlease use the 'Query Invoice' screen to check the cancelation request status.")	
		
	else
		
		select desc_cancelation_req
		  into :ls_desc_cancelation_req
		  from dba.cancelation_requests
		 where id_cancelation_req = :ld_cancelation_req;				
		
		if isnull(ls_desc_cancelation_req) then ls_desc_cancelation_req =''
		
		Messagebox("Cancelation in process","A cancelation request was already sent to the payer.~nCurrent status is: "+ls_desc_cancelation_req)	
	end if
		
else
	
	IF IsNull(ls_cancelation_reason) or len(ls_cancelation_reason) = 0 THEN
		Messagebox("Warning!","Please select a cancelation reason",StopSign!)
		return
	END IF
	
	
	ld_return = fn_cancel_invoice(ls_idbranch,ld_idreceiver,'N')
	
	if ld_return > 0 then
		f_register_cancelation()
		if (ls_flag = 'H') then
			Messagebox("Cancelation Complete in ViaCentral","Order has been canceled in ViaCentral.")
		else
			Messagebox("Cancelation Complete in ViaCentral","Order has been canceled in ViaCentral.~nPlease be sure to confirm the Cancelation with the payer.")
		end if
		// ........................................
		// refresh the canceled invoice
		dw_1.retrieve(ls_idbranch,ld_idreceiver)
		cbx_refund.checked = false
		sle_reason.enabled = false
		sle_reason.text = ''
		// ........................................		
	else
		Messagebox("Process Cancelled","Process Cancelled, the order was not cancelled.",StopSign!)	
	end if
	
end if

end event

type st_1 from statictext within w_cancelar_invoice
integer x = 727
integer y = 76
integer width = 224
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = ".50,5000;DB=ENVIO~'"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "Invoice :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_invoice from editmask within w_cancelar_invoice
integer x = 960
integer y = 64
integer width = 389
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###############"
double increment = 1
string minmax = "-999999~~999999"
end type

event losefocus;
string ls_branch, ls_group, ls_branch_pay, ls_payer_can_charge, ls_can_interfase, ls_name_payer, ls_flag
double ld_receiver
LONG l_existe

em_invoice.selecttext(1,15)
dw_1.reset()
st_payer.text = ''
st_modecanc.text = ''

cbx_refund.checked = false
sle_reason.enabled = false
sle_reason.text = ''
pb_message_mt.enabled = True

cb_1.enabled = false	
cb_2.enabled = false
cb_removecancelationrequest.enabled = false
pb_message_MT.Visible = false


ls_branch = sle_branch.text
ld_receiver = Double(em_invoice.text)

l_existe = f_existe_request_cancelation(ls_branch, ld_receiver)
	  
  	
IF l_existe > 0 THEN
	lst_cancelation_reason.setselectedid(is_agency_reason)
ELSE
	lst_cancelation_reason.setselectedid('' )
END IF


il_rows = dw_1.retrieve(ls_branch,ld_receiver) 



if il_rows = 0 then
	dw_1.reset()
	dw_1.insertrow(0)
	em_invoice.selecttext(1,12)	
	return
end if


ls_flag = trim(dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver"))



// ::::::::::::::::::::::::::::::::::::::::::::::::::::
// 06/27/2016: Counts for payments in process
int ll_cont
ll_cont = 0

SELECT count(*) 
INTO :ll_cont
FROM dba.PAGO_INVOICE WITH (NOLOCK)
WHERE id_branch = :ls_branch
AND id_receiver = :ld_receiver;
// :::::::::::::::::::::::::::::::::::::::::::::::::::::

if ((ls_flag = 'D' or ls_flag = 'H' or ls_flag = 'I' or ls_flag = 'T') and (ll_cont = 0)) then

	ls_group = dw_1.getitemstring(dw_1.getrow(),'id_main_branch_sent')
	
	SELECT payer_can_interfase, name_main_branch
	INTO :ls_can_interfase, :ls_name_payer
	FROM dba.group_branch
	WHERE dba.group_branch.id_main_branch = :ls_group;
	
	if isnull(ls_can_interfase) or ls_can_interfase <> 'Y' then ls_can_interfase = 'N'
	
	st_payer.text = ls_name_payer
	
	if (ls_flag <> 'H') then
		if (ls_can_interfase = 'Y') then
			st_modecanc.text = 'System'
			st_modecanc.textcolor = RGB(0,0,255)
		else
			st_modecanc.text = 'Manual'
			st_modecanc.textcolor = RGB(255,0,0)
		end if	
	else
		st_modecanc.text = 'Local (On Hold)'
		st_modecanc.textcolor = RGB(0,255,0)
	end if
	
	cb_1.enabled = true
	
	// Expiration button
	if fn_check_user_role('OEX') > 0 then cb_2.enabled = true
	
	// Remove cancelation request button
	if fn_check_user_role('OCF') > 0 then cb_removecancelationrequest.enabled = true


		cbx_refund.checked = true
		sle_reason.enabled = true
		sle_reason.text = "-SYSTEM: PAGADOR NO COBRA CANCELACIONES-"

		sle_reason.enabled = false
		cbx_refund.enabled = false

end if

IF ls_flag = 'C' THEN
	pb_message_MT.Visible = True

	
END IF



//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	// Determina si el pagador nos cobra las cancelaciones!
//	select branch_pay_receiver
//	into :ls_branch_pay
//	from dba.receiver
//	where id_branch = :ls_branch
//	and id_receiver = :ld_receiver;	
//	
//	ls_group = fn_grupo_pagador(ls_branch_pay)
//	
//	select payer_can_charge
//	  into :ls_payer_can_charge
//	  from dba.group_branch
//	 where id_main_branch = :ls_group;
//	 
//	if isnull(ls_payer_can_charge) or ls_payer_can_charge <> 'Y' then ls_payer_can_charge = 'N'
//
//	if ls_payer_can_charge = 'N' then
//		cbx_refund.checked = true
//		sle_reason.enabled = true
//		sle_reason.text = "-SYSTEM: PAGADOR NO COBRA CANCELACIONES-"
//
//		sle_reason.enabled = false
//		cbx_refund.enabled = false
//	end if	
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::	
	
//else
//	st_modecanc.text = ''
//	st_payer.text = ''
//	cb_1.enabled = false	
//	cb_2.enabled = false
//	cb_removecancelationrequest.enabled = false
//end if

end event

type st_2 from statictext within w_cancelar_invoice
integer x = 128
integer y = 76
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_branch from singlelineedit within w_cancelar_invoice
integer x = 352
integer y = 64
integer width = 338
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_cancelar_invoice
integer x = 69
integer y = 572
integer width = 2821
integer height = 1584
boolean enabled = false
string dataobject = "dw_cancelar_invoice"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type gb_1 from groupbox within w_cancelar_invoice
integer x = 37
integer y = 4
integer width = 2775
integer height = 556
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type p_1 from picture within w_cancelar_invoice
integer x = 325
integer y = 368
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "Custom080!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

