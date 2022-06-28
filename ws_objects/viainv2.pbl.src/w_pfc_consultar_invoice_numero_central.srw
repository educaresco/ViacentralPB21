$PBExportHeader$w_pfc_consultar_invoice_numero_central.srw
forward
global type w_pfc_consultar_invoice_numero_central from w_master
end type
type cb_3 from commandbutton within w_pfc_consultar_invoice_numero_central
end type
type dw_orderrefundrequest from datawindow within w_pfc_consultar_invoice_numero_central
end type
type cb_2 from commandbutton within w_pfc_consultar_invoice_numero_central
end type
type cb_1 from commandbutton within w_pfc_consultar_invoice_numero_central
end type
type em_sender from u_em within w_pfc_consultar_invoice_numero_central
end type
type st_1 from statictext within w_pfc_consultar_invoice_numero_central
end type
type em_branch from u_em within w_pfc_consultar_invoice_numero_central
end type
type st_2 from statictext within w_pfc_consultar_invoice_numero_central
end type
type dw_recibo from datawindow within w_pfc_consultar_invoice_numero_central
end type
type dw_recibo_matrix from datawindow within w_pfc_consultar_invoice_numero_central
end type
type dw_1 from datawindow within w_pfc_consultar_invoice_numero_central
end type
type dw_2 from datawindow within w_pfc_consultar_invoice_numero_central
end type
type dw_motivo_hold from datawindow within w_pfc_consultar_invoice_numero_central
end type
end forward

global type w_pfc_consultar_invoice_numero_central from w_master
boolean visible = false
integer x = 133
integer y = 212
integer width = 3182
integer height = 1928
string title = "Consulting Invoices by Invoice~'s Number"
string menuname = "m_pfc_consulta_invoice_numero_central"
boolean resizable = false
long backcolor = 80269524
event ue_insertar pbm_custom66
event ue_update pbm_custom71
event ue_documento pbm_custom74
event ue_anulacion pbm_custom75
event ue_reclamo pbm_custom40
event ue_imprimir pbm_custom41
event ue_nombre pbm_custom43
event ue_hold pbm_custom67
event ue_pago pbm_custom20
event ue_next pbm_custom21
event ue_prior pbm_custom22
event ue_last pbm_custom23
event ue_print_matrix pbm_custom70
event ue_recipientmodification ( )
event ue_query_receivernot ( )
event ue_query_statusaudit ( )
event ue_fund_request ( )
event ue_customer_profile ( )
event ue_kyc ( )
cb_3 cb_3
dw_orderrefundrequest dw_orderrefundrequest
cb_2 cb_2
cb_1 cb_1
em_sender em_sender
st_1 st_1
em_branch em_branch
st_2 st_2
dw_recibo dw_recibo
dw_recibo_matrix dw_recibo_matrix
dw_1 dw_1
dw_2 dw_2
dw_motivo_hold dw_motivo_hold
end type
global w_pfc_consultar_invoice_numero_central w_pfc_consultar_invoice_numero_central

type variables
string	Is_branch_insta=""
string is_branch
double il_receiver

BOOLEAN ib_isKYC
end variables

forward prototypes
public subroutine wf_recuperar_info ()
end prototypes

event ue_update;STRING ls_branch, s_mensaje
LONG ll_receiver

dw_1.update()
dw_2.update()


IF ib_isKYC THEN	
	
	IF dw_2.GetItemNumber(1,'receiver_additional_information') = 1 THEN
		s_mensaje = "habilitado"
	ELSE
		s_mensaje = "deshabilitado"
	END IF
	
	
	MessageBox("Atención","Cambios guardardos exitosamente. KYC "+s_mensaje+" para diligenciamiento en ViaOne")
ELSE
	MessageBox("Atención","Cambios guardardos exitosamente.")
	
END IF
end event

event ue_documento;
Double ld_sender_global
INT li_cant_kyc

ld_sender_global = dw_1.getitemnumber(dw_1.getrow(),"id_sender_global")	


SELECT Count(*)  
INTO :li_cant_kyc
FROM dba.KYC_SENDER 
WHERE ID_SENDER_GLOBAL = :ld_sender_global;	
	
If fileExists("U:\Compliance\Processed\Senders\"+String(ld_sender_global)) OR li_cant_kyc > 0  then
					
	//Openwithparm(w_idviewer,string(ld_sender_global))			
	Openwithparm(w_faxcomponent_senderids,"Compliance\Processed\Senders\"+string(ld_sender_global))
	
else		
	Messagebox("","No hay IDs asignados para este cliente!")
end if
		
end event

event ue_anulacion;//long		ll_cont
//string	ls_branch, ls_flag, ls_transmitido
//Double	ld_sender, ld_ref
//
//ld_sender	=	0
//gl_receiver_cons = 0
//
//ld_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
//ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
//gs_branch_insta_cons = ls_branch
//
//
//
//if ld_sender = 0 then
//	return
//end if
//
//  SELECT Count(*)  
//    INTO :ll_cont  
//    FROM dba.sender
//   WHERE ( dba.sender.id_sender = :ld_sender ) AND  
//         ( dba.sender.id_branch = :ls_branch )   ;
//
//
//
//
//
//if ll_cont = 0 then
//	return
//else
//	if Messagebox("Warning","Do you Want to Put this Invoice in Void!",Question!,YesNo!) = 2 then 
//		return
//	end if
//	gl_receiver_cons = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
//	ls_flag = dw_2.getitemstring(dw_2.getrow(),"id_flag_receiver")
//	
//	
//			ld_ref = 0
//
//
//				SELECT  receiver.ref_receiver
//    			INTO    :ld_ref 
//    			FROM    dba.receiver receiver 
//  				WHERE ( receiver.id_branch   = :ls_branch ) AND  
//        				( receiver.id_receiver = :gl_receiver_cons     )   ;
//
//				if ld_ref > 0 then
//					Messagebox("Error","No se puede Anular, Genero Referencia")
//					Return
//				end if
//	
//	
//	
//	ls_transmitido = dw_2.getitemstring(dw_2.getrow(),"trans_receiver")
//	
//	if ls_transmitido = "T" then
//		Messagebox("Warning","Invoice Transfered") 
//		return
//	end if
//	
//	if ls_flag = "T" then
//		Messagebox("Warning","Invoice Transfered")  
//		return
//	end if
//	
//	if ls_flag = "A" then
//		Messagebox("Warning","Invoice Void")  
//		return
//	end if
//
//if ls_flag = "P" then
//		Messagebox("Warning","Invoice Paid") 
//		return
//	end if
//	
//
//	Openwithparm(w_motivo_anulacion_invoice,ld_sender)
//	dw_2.Retrieve(ls_branch,gl_receiver_cons)
//end if
end event

event ue_reclamo;long 		ll_cont = 0
Double	ld_sender = 0, ld_id_receiver
string		ls_id_branch

ld_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ld_id_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")	
ls_id_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")	

//ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
//gs_branch_insta_cons = ls_branch

if ld_sender = 0 then
	return
end if

//DON (04/14/2015) - PERFORMANCE TUNING.  **************
SELECT Count(*)  
INTO :ll_cont  
FROM  dba.sender  WITH (NOLOCK)
WHERE dba.sender.id_sender = :ld_sender
AND  dba.sender.id_branch = :ls_id_branch;
//***********************************************

if ll_cont = 0 then
	return
else
	
	//	gl_receiver_cons = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
	//	Openwithparm(w_consulta_reclamo,ld_sender)
			
	Openwithparm(w_receiver_ordernotes,trim(ls_id_branch)+'*'+string(ld_id_receiver))		
	
end if
end event

event ue_imprimir;//Printsetup()
//dw_recibo.retrieve(dw_1.getitemstring(dw_1.getrow(),"id_branch"),dw_2.getitemnumber(dw_2.getrow(),"id_receiver"))
//dw_recibo.print()

//"COPIA RECIBO:"

string	ls_dot_pri
String ls_branch_state, ls_branch

ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")

Printsetup()

//DON (04/14/2015) - PERFORMANCE TUNING.  ***********************
SELECT min(id_state)
  INTO :ls_branch_state
  FROM dba.branch	WITH (NOLOCK)
 WHERE dba.branch.id_branch = :ls_branch;
 //*******************************************************

if ls_branch_state = 'CA' then
//	dw_recibo.DataObject = 'dw_recibo_ca'
	dw_recibo.DataObject = 'dw_recibo_activefax_ca_new'
	dw_recibo.settransobject(SQLCA)
else
//	dw_recibo.DataObject = 'dw_recibo'	
	dw_recibo.DataObject = 'dw_recibo_activefax_new'
	dw_recibo.settransobject(SQLCA)
end if

//dw_recibo.retrieve(ls_branch,dw_2.getitemnumber(dw_2.getrow(),"id_receiver"))
dw_recibo.retrieve(ls_branch,dw_2.getitemnumber(dw_2.getrow(),"id_receiver"), '')

dw_recibo.print()
			
	
	
	
end event

event ue_nombre;double   	ld_receiver
string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago

gs_branch_consulta = ""

em_branch.text = ""
em_sender.text = string(0)	

Open(w_buscar_nombre_sender)

ld_receiver = message.doubleparm


if ld_receiver > 0 Then
	em_branch.text = gs_branch_consulta
	em_sender.text = string(ld_receiver)
	
	//DON (04/15/2015) - PERFORMANCE TUNING.  *************************
//	SELECT dba.CITY.NAME_CITY,   
//         dba.STATE.NAME_STATE,   
//         dba.COUNTRY.NAME_COUNTRY,   
//         dba.BRANCH.NAME_BRANCH,   
//         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
//         dba.MODO_PAGO.NOM_MODO_PAGO  
//    INTO :ls_name_city,   
//         :ls_name_state,   
//         :ls_name_country,   
//         :ls_name_branch,   
//         :ls_name_group,   
//         :ls_name_modo_pago  
//    FROM dba.RECEIVER,   
//         dba.CITY,   
//         dba.STATE,   
//         dba.COUNTRY,   
//         dba.MODO_PAGO,   
//         dba.BRANCH,   
//         dba.GROUP_BRANCH  
//   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
//         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
//         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
//         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
//         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
//         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
//         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
//         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
//         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
//			( dba.RECEIVER.ID_BRANCH = :gs_branch_consulta ) AND  
//			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
			
	SELECT dba.CITY.NAME_CITY,   
         dba.STATE.NAME_STATE,   
         dba.COUNTRY.NAME_COUNTRY,   
         dba.BRANCH.NAME_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
         dba.MODO_PAGO.NOM_MODO_PAGO  
    INTO :ls_name_city,   
         :ls_name_state,   
         :ls_name_country,   
         :ls_name_branch,   
         :ls_name_group,   
         :ls_name_modo_pago  			
	FROM dba.RECEIVER	WITH (NOLOCK) 
    INNER JOIN	 dba.BRANCH	WITH (NOLOCK)  
    ON	dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER
    JOIN	dba.GROUP_BRANCH	WITH (NOLOCK)
    ON	dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
    JOIN	dba.MODO_PAGO	WITH (NOLOCK)
    ON	dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER
    JOIN	dba.CITY	WITH (NOLOCK)
    ON	dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER  and  
        dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER  and  
        dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER 
	JOIN	dba.STATE	WITH (NOLOCK)
	ON	dba.STATE.ID_STATE = dba.CITY.ID_STATE  and  
        dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY  and  
        dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER	AND
        dba.STATE.ID_COUNTRY =	dba.RECEIVER.ID_COUNTRY_RECEIVER
	JOIN	dba.COUNTRY   WITH (NOLOCK)
	ON	dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY 
   	WHERE	( dba.RECEIVER.ID_BRANCH = :gs_branch_consulta ) AND  
				( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
	//*********************************************************


	if dw_2.retrieve(em_branch.text,Double(em_sender.text),ls_name_city,ls_name_state,ls_name_country,ls_name_branch,ls_name_group,ls_name_modo_pago) = 0 Then


		em_sender.selecttext(1,15)
		dw_1.reset()
		dw_2.reset()
		dw_1.insertrow(0)
		dw_2.insertrow(0)
	
		return
	else
		dw_1.retrieve(gs_branch_consulta,dw_2.getitemnumber(dw_2.getrow(),"id_sender"))
	end if
end if



end event

event ue_hold;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido
Double	ld_sender

ld_sender	=	0
gl_receiver_cons = 0

ld_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
gs_branch_insta_cons = ls_branch


IF  fn_branch_instalacion() = '0043' Then
	Return
END IF




if ld_sender = 0 then
	return
end if

//DON (04/15/2015) - PERFORMANCE TUNING.  ************************************
SELECT Count(*)  
    INTO :ll_cont  
FROM dba.sender  WITH (NOLOCK)
WHERE 	( dba.sender.id_sender = :ld_sender ) AND  
         	( dba.sender.id_branch = :ls_branch )   ;
//********************************************************************


if ll_cont = 0 then
	return
else
	if Messagebox("Warning","Do you Want to Put this Invoice in Hold!",Question!,YesNo!) = 2 then 
		return
	end if
	gl_receiver_cons = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
	ls_flag = dw_2.getitemstring(dw_2.getrow(),"id_flag_receiver")
	
	ls_transmitido = dw_2.getitemstring(dw_2.getrow(),"trans_receiver")
	
	if ls_flag = "T" then
		Messagebox("Warning","Invoice Transfered")  
		return
	end if
		
	if ls_flag = "D" then
		Messagebox("Warning","Invoice without Pay")  
		return
	end if
	
		
	if ls_transmitido = "T" then
		Messagebox("Warning","Invoice Transfered") 
		return
	end if
	
	if ls_flag = "A" then
		Messagebox("Warning","Invoice Void")  
	return
end if

if ls_flag = "P" then
		Messagebox("Warning","Invoice Paid") 
		return
	end if
	
	if ls_flag = "H" then
		messagebox("Permiso","No se puede liberar por esta Opcion.")
		
		return
		UPDATE dba.receiver  
      SET    dba.receiver.id_flag_receiver = 'I',
			    dba.receiver.date_receiver = Getdate()
      WHERE ( dba.receiver.id_branch    = :gs_branch_insta_cons ) AND  
            ( dba.receiver.id_receiver  = :gl_receiver_cons )   ;
				
		
		Commit ;
		dw_2.setitem(1,"id_flag_receiver","I")
		return
	else
		UPDATE dba.receiver  
      SET    dba.receiver.id_flag_receiver = 'H' 
      WHERE ( dba.receiver.id_branch   = :gs_branch_insta_cons ) AND  
            ( dba.receiver.id_receiver = :gl_receiver_cons )   ;
				
		INSERT INTO dba.history_invoice  
        	 	 ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change )  
  		VALUES ( :gs_branch_insta_cons,:gl_receiver_cons,:ls_flag,'H',:gs_cashier,getdate(),getdate() )  ;
				
				
		Commit ;
		dw_2.setitem(1,"id_flag_receiver","H")
	end if
end if
end event

event ue_pago;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido
Double	ld_sender

ld_sender	=	0
gl_receiver_cons = 0

ld_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
gs_branch_insta_cons = ls_branch

if ld_sender = 0 then
	return
end if

//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
SELECT Count(*)  
    INTO :ll_cont  
FROM dba.sender  WITH (NOLOCK)
WHERE 	( dba.sender.id_sender = :ld_sender ) AND  
         	( dba.sender.id_branch = :ls_branch )   ;
//***************************************************************


if ll_cont = 0 then
	return
else
//	if Messagebox("Warning","Do you Want to Pay this Invoice!",Question!,YesNo!) = 2 then 
//		return
//	end if
	gl_receiver_cons = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
	ls_flag = dw_2.getitemstring(dw_2.getrow(),"id_flag_receiver")
	
//	ls_transmitido = dw_2.getitemstring(dw_2.getrow(),"trans_receiver")
//	
//	if ls_transmitido <> "T" then
//		Messagebox("Warning","Invoice No Transfered") 
//		return
//	end if
//	
	if ls_flag = "C" then
		Messagebox("Warning","Invoice Cancel")  
		return
	end if
	
	
	if ls_flag = "A" then
		Messagebox("Warning","Invoice Void")  
	return
	end if
	
	Openwithparm(w_pagar_invoice_or_consultar,ld_sender)
	
	string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago

//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
//	  SELECT dba.CITY.NAME_CITY,   
//         dba.STATE.NAME_STATE,   
//         dba.COUNTRY.NAME_COUNTRY,   
//         dba.BRANCH.NAME_BRANCH,   
//         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
//         dba.MODO_PAGO.NOM_MODO_PAGO  
//    INTO :ls_name_city,   
//         :ls_name_state,   
//         :ls_name_country,   
//         :ls_name_branch,   
//         :ls_name_group,   
//         :ls_name_modo_pago  
//    FROM dba.RECEIVER,   
//         dba.CITY,   
//         dba.STATE,   
//         dba.COUNTRY,   
//         dba.MODO_PAGO,   
//         dba.BRANCH,   
//         dba.GROUP_BRANCH  
//   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
//         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
//         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
//         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
//         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
//         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
//         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
//         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
//         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
//			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
//			( dba.RECEIVER.ID_RECEIVER = :gl_receiver_cons )   ;
			
			
	  SELECT dba.CITY.NAME_CITY,   
         dba.STATE.NAME_STATE,   
         dba.COUNTRY.NAME_COUNTRY,   
         dba.BRANCH.NAME_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
         dba.MODO_PAGO.NOM_MODO_PAGO  
    INTO :ls_name_city,   
         :ls_name_state,   
         :ls_name_country,   
         :ls_name_branch,   
         :ls_name_group,   
         :ls_name_modo_pago  			
	FROM dba.RECEIVER	WITH (NOLOCK) 
    INNER JOIN	 dba.BRANCH	WITH (NOLOCK)  
    ON	dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER
    JOIN	dba.GROUP_BRANCH	WITH (NOLOCK)
    ON	dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
    JOIN	dba.MODO_PAGO	WITH (NOLOCK)
    ON	dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER
    JOIN	dba.CITY	WITH (NOLOCK)
    ON	dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER  and  
        dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER  and  
        dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER 
	JOIN	dba.STATE	WITH (NOLOCK)
	ON	dba.STATE.ID_STATE = dba.CITY.ID_STATE  and  
        dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY  and  
        dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER	AND
        dba.STATE.ID_COUNTRY =	dba.RECEIVER.ID_COUNTRY_RECEIVER
	JOIN	dba.COUNTRY   WITH (NOLOCK)
	ON	dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY 
	WHERE	( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
				( dba.RECEIVER.ID_RECEIVER = :gl_receiver_cons )   ;
//*************************************************************
   


	dw_2.retrieve(em_branch.text,Double(em_sender.text),ls_name_city,ls_name_state,ls_name_country,ls_name_branch,ls_name_group,ls_name_modo_pago) 

end if
end event

event ue_next;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido
Double	ld_receiver



ld_receiver = Double(em_sender.text) + 1
ls_branch   = em_branch.text

il_receiver = ld_receiver
is_branch = ls_branch

if isnull(ls_branch) or ls_branch = "" then 
	return
end if

if isnull(ld_receiver) or ld_receiver = 0 then 
	return
end if

//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
SELECT Count(*)  
    INTO :ll_cont  
FROM dba.receiver  WITH (NOLOCK)
WHERE 	( dba.receiver.id_branch = :ls_branch ) AND  
         	( dba.receiver.id_receiver = :ld_receiver )   ;
//***************************************************************

if ll_cont = 0 then
	return
end if



string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago
	
//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
//	  SELECT dba.CITY.NAME_CITY,   
//         dba.STATE.NAME_STATE,   
//         dba.COUNTRY.NAME_COUNTRY,   
//         dba.BRANCH.NAME_BRANCH,   
//         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
//         dba.MODO_PAGO.NOM_MODO_PAGO  
//    INTO :ls_name_city,   
//         :ls_name_state,   
//         :ls_name_country,   
//         :ls_name_branch,   
//         :ls_name_group,   
//         :ls_name_modo_pago  
//    FROM dba.RECEIVER,   
//         dba.CITY,   
//         dba.STATE,   
//         dba.COUNTRY,   
//         dba.MODO_PAGO,   
//         dba.BRANCH,   
//         dba.GROUP_BRANCH  
//   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
//         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
//         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
//         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
//         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
//         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
//         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
//         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
//         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
//			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
//			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
			
	  SELECT dba.CITY.NAME_CITY,   
         dba.STATE.NAME_STATE,   
         dba.COUNTRY.NAME_COUNTRY,   
         dba.BRANCH.NAME_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
         dba.MODO_PAGO.NOM_MODO_PAGO  
    INTO :ls_name_city,   
         :ls_name_state,   
         :ls_name_country,   
         :ls_name_branch,   
         :ls_name_group,   
         :ls_name_modo_pago  			
	FROM dba.RECEIVER	WITH (NOLOCK) 
    INNER JOIN	 dba.BRANCH	WITH (NOLOCK)  
    ON	dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER
    JOIN	dba.GROUP_BRANCH	WITH (NOLOCK)
    ON	dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
    JOIN	dba.MODO_PAGO	WITH (NOLOCK)
    ON	dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER
    JOIN	dba.CITY	WITH (NOLOCK)
    ON	dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER  and  
        dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER  and  
        dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER 
	JOIN	dba.STATE	WITH (NOLOCK)
	ON	dba.STATE.ID_STATE = dba.CITY.ID_STATE  and  
        dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY  and  
        dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER	AND
        dba.STATE.ID_COUNTRY =	dba.RECEIVER.ID_COUNTRY_RECEIVER
	JOIN	dba.COUNTRY   WITH (NOLOCK)
	ON	dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY 
	WHERE	( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
				( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
//**********************************************************


if dw_2.retrieve(ls_branch,ld_receiver,ls_name_city,ls_name_state,ls_name_country,ls_name_branch,ls_name_group,ls_name_modo_pago) = 0 Then

//	messagebox("Consultar","El Invoice no Existe, Rectifique e intente Nuevamente")
	em_sender.selecttext(1,15)
	dw_1.reset()
	dw_2.reset()
	dw_1.insertrow(0)
	dw_2.insertrow(0)
	
	return
else
	


	dw_1.retrieve(em_branch.text,dw_2.getitemnumber(dw_2.getrow(),"id_sender"))
	em_sender.text = string(ld_receiver)
	
	
	dw_motivo_hold.reset()
	
	long		ll_row
	string	ls_motivo_hold	
	
	
	DECLARE motivo_hold CURSOR FOR  
   SELECT desc_hold.descripcion  
    FROM  dba.motivo_hold motivo_hold,   
          dba.desc_hold desc_hold 
   WHERE ( desc_hold.tipo_hold = motivo_hold.type_motivo_hold ) and  
         ( ( motivo_hold.id_branch = :ls_branch ) AND  
         ( motivo_hold.id_receiver = :ld_receiver ) )   
   ORDER BY desc_hold.descripcion ASC  ;

	open motivo_hold ;
	Fetch motivo_hold  into :ls_motivo_hold  ;
	
	DO WHILE sqlca.sqlcode = 0
		ll_row = dw_motivo_hold.insertrow(0)
		dw_motivo_hold.setitem(ll_row,'desc',ls_motivo_hold)
		fetch motivo_hold  into :ls_motivo_hold ;
	LOOP
	
	Close motivo_hold ;
		
end if
end event

event ue_prior;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido
Double	ld_receiver


ld_receiver = Double(em_sender.text) - 1
ls_branch   = em_branch.text

il_receiver = ld_receiver
is_branch = ls_branch


if isnull(ls_branch) or ls_branch = "" then 
	return
end if

if isnull(ld_receiver) or ld_receiver = 0 then 
	return
end if

//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
SELECT Count(*)  
    INTO :ll_cont  
FROM dba.receiver WITH (NOLOCK)
WHERE 	( dba.receiver.id_branch = :ls_branch ) AND  
         	( dba.receiver.id_receiver = :ld_receiver )   ;
//***************************************************************

if ll_cont = 0 then
	return
end if


string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago
	
//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
//	  SELECT dba.CITY.NAME_CITY,   
//         dba.STATE.NAME_STATE,   
//         dba.COUNTRY.NAME_COUNTRY,   
//         dba.BRANCH.NAME_BRANCH,   
//         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
//         dba.MODO_PAGO.NOM_MODO_PAGO  
//    INTO :ls_name_city,   
//         :ls_name_state,   
//         :ls_name_country,   
//         :ls_name_branch,   
//         :ls_name_group,   
//         :ls_name_modo_pago  
//    FROM dba.RECEIVER,   
//         dba.CITY,   
//         dba.STATE,   
//         dba.COUNTRY,   
//         dba.MODO_PAGO,   
//         dba.BRANCH,   
//         dba.GROUP_BRANCH  
//   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
//         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
//         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
//         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
//         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
//         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
//         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
//         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
//         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
//			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
//			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
	SELECT dba.CITY.NAME_CITY,   
         dba.STATE.NAME_STATE,   
         dba.COUNTRY.NAME_COUNTRY,   
         dba.BRANCH.NAME_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
         dba.MODO_PAGO.NOM_MODO_PAGO  
    INTO :ls_name_city,   
         :ls_name_state,   
         :ls_name_country,   
         :ls_name_branch,   
         :ls_name_group,   
         :ls_name_modo_pago  
	FROM dba.RECEIVER	WITH (NOLOCK) 
    INNER JOIN	 dba.BRANCH	WITH (NOLOCK)  
    ON	dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER
    JOIN	dba.GROUP_BRANCH	WITH (NOLOCK)
    ON	dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
    JOIN	dba.MODO_PAGO	WITH (NOLOCK)
    ON	dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER
    JOIN	dba.CITY	WITH (NOLOCK)
    ON	dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER  and  
        dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER  and  
        dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER 
	JOIN	dba.STATE	WITH (NOLOCK)
	ON	dba.STATE.ID_STATE = dba.CITY.ID_STATE  and  
        dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY  and  
        dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER	AND
        dba.STATE.ID_COUNTRY =	dba.RECEIVER.ID_COUNTRY_RECEIVER
	JOIN	dba.COUNTRY   WITH (NOLOCK)
	ON		dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY 
	WHERE	( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
				( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
//************************************************************



if dw_2.retrieve(ls_branch,ld_receiver,ls_name_city,ls_name_state,ls_name_country,ls_name_branch,ls_name_group,ls_name_modo_pago) = 0 Then

//	messagebox("Consultar","El Invoice no Existe, Rectifique e intente Nuevamente")
	em_sender.selecttext(1,15)
	dw_1.reset()
	dw_2.reset()
	dw_1.insertrow(0)
	dw_2.insertrow(0)
	
	return
else
	

	
	dw_1.retrieve(em_branch.text,dw_2.getitemnumber(dw_2.getrow(),"id_sender"))
	em_sender.text = string(ld_receiver)
	dw_motivo_hold.reset()
	long		ll_row
	string	ls_motivo_hold	
	
	
	DECLARE motivo_hold CURSOR FOR  
   SELECT desc_hold.descripcion  
    FROM dba.motivo_hold motivo_hold,   
         dba.desc_hold desc_hold  
   WHERE ( desc_hold.tipo_hold = motivo_hold.type_motivo_hold ) and  
         ( ( motivo_hold.id_branch = :ls_branch ) AND  
         ( motivo_hold.id_receiver = :ld_receiver ) )   
   ORDER BY desc_hold.descripcion ASC  ;

	open motivo_hold ;
	Fetch motivo_hold  into :ls_motivo_hold  ;
	
	DO WHILE sqlca.sqlcode = 0
		ll_row = dw_motivo_hold.insertrow(0)
		dw_motivo_hold.setitem(ll_row,'desc',ls_motivo_hold)
		fetch motivo_hold  into :ls_motivo_hold ;
	LOOP
	
	Close motivo_hold ;
	end if
end event

event ue_last;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido
Double	ld_receiver



ls_branch   = em_branch.text


is_branch = ls_branch


if isnull(ls_branch) or ls_branch = "" then 
	return
end if

	ld_receiver = 0

SELECT dba.web_last_invoice.id_receiver  
    INTO :ld_receiver 
FROM dba.web_last_invoice  
WHERE dba.web_last_invoice.id_branch = :ls_branch   ;

	
	if isnull(ld_receiver) then ld_receiver = 0

if ld_receiver = 0 then

	//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
	SELECT MAX(dba.receiver.id_receiver)
		 INTO :ld_receiver
	FROM dba.receiver  WITH (NOLOCK)
	WHERE 	( dba.receiver.id_branch = :ls_branch ) 	and	(dba.receiver.id_receiver < 900000 ) ;
	//***************************************************************
end if

if isnull(ld_receiver) or ld_receiver = 0 then 
	return
end if

string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago
	
	//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
//	SELECT dba.CITY.NAME_CITY,   
//         dba.STATE.NAME_STATE,   
//         dba.COUNTRY.NAME_COUNTRY,   
//         dba.BRANCH.NAME_BRANCH,   
//         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
//         dba.MODO_PAGO.NOM_MODO_PAGO  
//    INTO :ls_name_city,   
//         :ls_name_state,   
//         :ls_name_country,   
//         :ls_name_branch,   
//         :ls_name_group,   
//         :ls_name_modo_pago  
//    FROM dba.RECEIVER,   
//         dba.CITY,   
//         dba.STATE,   
//         dba.COUNTRY,   
//         dba.MODO_PAGO,   
//         dba.BRANCH,   
//         dba.GROUP_BRANCH  
//   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
//         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
//         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
//         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
//         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
//         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
//         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
//         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
//         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
//			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
//			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
	SELECT dba.CITY.NAME_CITY,   
         dba.STATE.NAME_STATE,   
         dba.COUNTRY.NAME_COUNTRY,   
         dba.BRANCH.NAME_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
         dba.MODO_PAGO.NOM_MODO_PAGO  
    INTO :ls_name_city,   
         :ls_name_state,   
         :ls_name_country,   
         :ls_name_branch,   
         :ls_name_group,   
         :ls_name_modo_pago
	FROM dba.RECEIVER	WITH (NOLOCK) 
    INNER JOIN	 dba.BRANCH	WITH (NOLOCK)  
    ON	dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER
    JOIN	dba.GROUP_BRANCH	WITH (NOLOCK)
    ON	dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
    JOIN	dba.MODO_PAGO	WITH (NOLOCK)
    ON	dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER
    JOIN	dba.CITY	WITH (NOLOCK)
    ON	dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER  and  
        dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER  and  
        dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER 
	JOIN	dba.STATE	WITH (NOLOCK)
	ON	dba.STATE.ID_STATE = dba.CITY.ID_STATE  and  
        dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY  and  
        dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER	AND
        dba.STATE.ID_COUNTRY =	dba.RECEIVER.ID_COUNTRY_RECEIVER
	JOIN	dba.COUNTRY   WITH (NOLOCK)
	ON	dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY		
	WHERE	( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
				( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;		
//**************************************************************



if dw_2.retrieve(ls_branch,ld_receiver,ls_name_city,ls_name_state,ls_name_country,ls_name_branch,ls_name_group,ls_name_modo_pago) = 0 Then
	em_sender.selecttext(1,15)
	dw_1.reset()
	dw_2.reset()
	dw_1.insertrow(0)
	dw_2.insertrow(0)
	
	return
else
	
	il_receiver = ld_receiver
	

	
	dw_1.retrieve(em_branch.text,dw_2.getitemnumber(dw_2.getrow(),"id_sender"))
	em_sender.text = string(ld_receiver)
		dw_motivo_hold.reset()
	long		ll_row
	string	ls_motivo_hold	
	
	
	DECLARE motivo_hold CURSOR FOR  
   SELECT desc_hold.descripcion  
    FROM dba.motivo_hold motivo_hold,   
         dba.desc_hold desc_hold  
   WHERE ( desc_hold.tipo_hold = motivo_hold.type_motivo_hold ) and  
         ( ( motivo_hold.id_branch = :ls_branch ) AND  
         ( motivo_hold.id_receiver = :ld_receiver ) )   
   ORDER BY desc_hold.descripcion ASC  ;

	open motivo_hold ;
	Fetch motivo_hold  into :ls_motivo_hold  ;
	
	DO WHILE sqlca.sqlcode = 0
		ll_row = dw_motivo_hold.insertrow(0)
		dw_motivo_hold.setitem(ll_row,'desc',ls_motivo_hold)
		fetch motivo_hold  into :ls_motivo_hold ;
	LOOP
	
	Close motivo_hold ;
	
	
	
	
	
	
end if
end event

event ue_print_matrix;string 	ls_name_sender,				&
			ls_dir_sender,					&
			ls_city_sender,				&
			ls_name_branch,				&
			ls_branch, 						&  
      	ls_name_receiver,				&
			ls_dir_receiver, 				&
			ls_date,							&
			ls_linea,						&
			ls_dir_branch,					&
			ls_phone1_branch, 			&
			ls_rate, ls_telex, 			&
			ls_handling,					&
			ls_exchange, 					&
			ls_modo_pago,					&
			ls_total, 						&
			ls_amount,						&
			ls_total_pagar,				&
			ls_currency, 					&
			ls_bank,							&
			ls_acc, 							&
			ls_country_sender,			&
			ls_country_receiver,			&
			ls_city_receiver,				&
			ls_name_city_rec,				&
			ls_name_country_rec,       &
			ls_delivery,               &
			ls_menssage,               &
			ls_agent_branch,           &
			ls_agent_address,          &
			ls_Phone,                  &
			ls_tollfree,               &
			ls_pin
			
			
string	ld_phone1_receiver,			&
			ld_phone2_receiver		
			
			
Double   ld_phone1_sender,				&
			ld_phone2_sender,				&
			ld_receiver,					&
			ld_receiver1,              &
			ld_amount, 						&
			ld_rate,							&
			ld_exchange,					&		 
			ld_telex, 						&
			ld_handling,					&
			ld_total, 						&
			ld_modo_pago,					&
			ld_total_pagar,				&
			ld_clave
			

Date		ld_date = TODAY()


Long		ll_Job,		&
         ll_turno
Integer 	li_i,			&
			li_x,			&
			li_rc,		&
         li_turnos
			
String	ls_usu,		&
			ls_ser,		&
			ls_venta,	&
			ls_turno,	&
			ls_grupo,	&
			ls_fechor,  &
			ls_impant,  &
			ls_impact,  &
			ls_prn1,    &
			ls_statesender, &
			ls_citysender, &
			ls_state, &
			ls_country


ld_receiver1 = dw_2.getitemnumber(dw_1.getrow(),"id_receiver")

//ld_receiver = 1
//gs_branch_insta = '0000'
//****** buscando datos del agente

gs_branch_insta = dw_2.getitemstring(dw_1.getrow(),"id_branch")

//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
SELECT dba.branch.name_branch,
       dba.branch.address_branch,
		 dba.branch.phone1_branch,
		 dba.branch.id_state,
		 dba.branch.id_country
INTO	 :ls_agent_branch,       
		 :ls_agent_address,  
		 :ls_Phone,
		 :ls_state,
		 :ls_country
FROM   dba.branch	WITH (NOLOCK)
WHERE  dba.branch.id_branch = :gs_branch_insta ;
//**************************************************************

//    SELECT sender.name_sender,   
//         sender.addres_sender,   
//         sender.phone1_sender,   
//         sender.phone2_sender,   
//			sender.state_sender,
//			sender.city_sender,
//			city.name_city,   
//         branch.name_branch,   
//         receiver.id_branch,   
//         receiver.id_receiver,   
//         receiver.name_receiver,   
//         receiver.address_receiver,   
//         receiver.phone1_receiver,   
//         receiver.phone2_receiver,
//			receiver.date_receiver,
//			branch.address_branch,
//			branch.phone1_branch,
//			receiver.net_amount_receiver,
//			receiver.rate_change_receiver,
//			receiver.exchange_receiver,
//			receiver.telex_receiver,
//			receiver.handling_receiver,
//			receiver.total_modo_pago,
//			receiver.total_receiver,
//			receiver.total_pay_receiver,
//			currency.name_currency,
//			receiver.bank_receiver,
//			receiver.acc_receiver,
//			country.name_country,
//			receiver.id_city_receiver,
//			receiver.id_country_receiver,
//			receiver.mode_pay_receiver,
//			receiver.notes_receiver,
//			receiver.toll_free,
//			receiver.pin_number,
//			receiver.urgency_receiver
//    INTO :ls_name_sender,   
//         :ls_dir_sender,   
//         :ld_phone1_sender,   
//         :ld_phone2_sender,   
//			:ls_statesender,
//			:ls_citysender,
//			:ls_city_sender,   
//         :ls_name_branch,   
//         :ls_branch,   
//         :ld_receiver,   
//         :ls_name_receiver,   
//         :ls_dir_receiver,   
//         :ld_phone1_receiver,   
//         :ld_phone2_receiver,
//			:ld_date,
//			:ls_dir_branch,					
//			:ls_phone1_branch,
//			:ld_amount,
//			:ld_rate,
//			:ld_exchange,
//			:ld_telex,
//			:ld_handling,
//			:ld_modo_pago,
//			:ld_total,
//			:ld_total_pagar,
//			:ls_currency,
//			:ls_bank,
//			:ls_acc,
//			:ls_country_sender,
//			:ls_city_receiver,
//			:ls_country_receiver,
//			:ls_delivery,
//			:ls_menssage,
//			:ls_tollfree,
//			:ls_pin,
//			:ld_clave
//    FROM dba.city city,   
//         dba.receiver receiver,   
//         dba.sender sender,   
//         dba.branch branch,
//			dba.currency currency,
//			dba.country country
//   WHERE ( sender.id_sender = receiver.id_sender ) and  
//         ( sender.id_branch = receiver.id_branch ) and  
//         ( sender.id_city = city.id_city ) and  
//         ( sender.id_state = city.id_state ) and  
//         ( sender.id_country = city.id_country ) and 
//			( sender.id_country = country.id_country ) and 
//         ( branch.id_branch = receiver.branch_pay_receiver ) and  
//			( receiver.id_curreny = currency.id_curreny ) and 
//			( ( receiver.id_branch = :gs_branch_insta ) AND  
//         ( receiver.id_receiver = :ld_receiver1 ) )   ;

SELECT sender.name_sender,   
         sender.addres_sender,   
         sender.phone1_sender,   
         sender.phone2_sender,   
			sender.state_sender,
			sender.city_sender,
			city.name_city,   
         branch.name_branch,   
         receiver.id_branch,   
         receiver.id_receiver,   
         receiver.name_receiver,   
         receiver.address_receiver,   
         receiver.phone1_receiver,   
         receiver.phone2_receiver,
			receiver.date_receiver,
			branch.address_branch,
			branch.phone1_branch,
			receiver.net_amount_receiver,
			receiver.rate_change_receiver,
			receiver.exchange_receiver,
			receiver.telex_receiver,
			receiver.handling_receiver,
			receiver.total_modo_pago,
			receiver.total_receiver,
			receiver.total_pay_receiver,
			currency.name_currency,
			receiver.bank_receiver,
			receiver.acc_receiver,
			country.name_country,
			receiver.id_city_receiver,
			receiver.id_country_receiver,
			receiver.mode_pay_receiver,
			receiver.notes_receiver,
			receiver.toll_free,
			receiver.pin_number,
			receiver.urgency_receiver
    INTO :ls_name_sender,   
         :ls_dir_sender,   
         :ld_phone1_sender,   
         :ld_phone2_sender,   
			:ls_statesender,
			:ls_citysender,
			:ls_city_sender,   
         :ls_name_branch,   
         :ls_branch,   
         :ld_receiver,   
         :ls_name_receiver,   
         :ls_dir_receiver,   
         :ld_phone1_receiver,   
         :ld_phone2_receiver,
			:ld_date,
			:ls_dir_branch,					
			:ls_phone1_branch,
			:ld_amount,
			:ld_rate,
			:ld_exchange,
			:ld_telex,
			:ld_handling,
			:ld_modo_pago,
			:ld_total,
			:ld_total_pagar,
			:ls_currency,
			:ls_bank,
			:ls_acc,
			:ls_country_sender,
			:ls_city_receiver,
			:ls_country_receiver,
			:ls_delivery,
			:ls_menssage,
			:ls_tollfree,
			:ls_pin,
			:ld_clave
FROM	dba.receiver receiver	WITH (NOLOCK)
INNER JOIN	dba.sender sender	WITH (NOLOCK)
ON	sender.id_sender = receiver.id_sender and  
    sender.id_branch = receiver.id_branch 
JOIN	dba.branch branch
ON	branch.id_branch = receiver.branch_pay_receiver
JOIN	dba.city city
ON	sender.id_city = city.id_city  and  
    sender.id_state = city.id_state  and  
    sender.id_country = city.id_country 
JOIN	dba.country country
ON	sender.id_country = country.id_country
JOIN	dba.currency currency
ON	receiver.id_curreny = currency.id_curreny
WHERE	( ( receiver.id_branch = :gs_branch_insta ) AND  
         	( receiver.id_receiver = :ld_receiver1 ) )   ;


SELECT city.name_city,   country.name_country  
 INTO :ls_name_city_rec,  :ls_name_country_rec  
 FROM dba.city city 		WITH (NOLOCK)
INNER JOIN 	dba.country country 	WITH (NOLOCK)
ON		 city.id_country = country.id_country
WHERE 	( ( city.id_city = :ls_city_receiver ) AND  ( city.id_country = :ls_country_receiver ) )   ;
//*************************************************************





ls_impact = "Panasonic KX-P1150,PANSON9,LPT1:"
ls_prn1   = "Generic / Text Only,TTY,LPT1:"

li_turnos = 1


ls_impant = ProfileString("win.ini","Windows","device","Impresora por Defecto")

//If ls_impant <> ls_impact Then
//	li_rc = SetProfileString("WIN.INI","WINDOWS","DEVICE",ls_impact)
//   If li_rc <> 1 Then
//		Messagebox("Error","Colocando la impresora de Turnos por Defecto")
//		Return -1
//	End If
//End If


//PrintSend(ll_job, "~027~06710")

	ll_job    = PrintOpen()
	PrintSetSpacing(ll_Job, 1)
   IF ls_impant = ls_impact Then
	   PrintDefineFont(ll_Job, 1, "Draft 15Cpi", -18, 400, Default!, AnyFont!, FALSE, FALSE)
	End if
	
	ls_date = string(ld_date,"mm-dd-yyyy")
	
	// seleccion del modo de pago
	if ls_delivery = "P" then
		ls_delivery = "Office"
	end if
	if ls_delivery = "C" then
		ls_delivery = "Bank"
	end if
	if ls_delivery = "D" then
		ls_delivery = "Home"
	end if

	
	   PrintSetFont(ll_job, 1)
		IF ls_state = 'FL' and ls_country = 'USA' then
			string ls_licence
			  
			SELECT dba.branch_licencia.id_licencia  
    		INTO :ls_licence  
		   FROM dba.branch_licencia  
		   WHERE dba.branch_licencia.id_branch = :gs_branch_insta   ;
			
			  SELECT dba.licencia.licencia_name  
    		  INTO :ls_linea
			  FROM dba.licencia  
			  WHERE dba.licencia.id_licencia = :ls_licence   ;

		if isnull(ls_linea) then ls_linea = ''
    	Print(ll_job,  50, "AUTHORIZED AGENT FOR "+ls_linea)
//      	Print(ll_job,  50, "AUTHORIZED AGENT FOR FIRST FINANCIAL CARIBBEAN USA, Inc. PHONE (800) 723-1002")
		END IF	
      Print(ll_job,  50, ls_agent_branch)
	   ls_linea = ls_agent_address + Fill(" ",50 - len(ls_agent_address))+"                 DATE       INVOICE"
	   Print(ll_job,  50,ls_linea)                                                      
	   ls_linea = "Phone:"+ls_phone+Fill(" ",44 - len(ls_phone))+"               "+string(ls_date)+"   "+ls_branch+"-"+string(ld_receiver)
      Print(ll_job, 50,ls_linea)
	   Print(ll_job,  50, "                       SENDER                                                 RECEIVER               ")
	
	

   	ls_linea = "Name    :    "+ls_name_sender+ Fill(" ",50 - Len(ls_name_sender))+"Name    :     "+ls_name_receiver
    	Print(ll_job,  40,ls_linea)
	   ls_linea = "Address :    "+ls_dir_sender+ Fill(" ",50 - Len(ls_dir_sender))+"Address :     "+ls_dir_receiver
	   Print(ll_job,  40,ls_linea)
	   ls_linea = "Phone   :    "+string(ld_phone1_sender)+ Fill(" ",50 - Len(string(ld_phone1_sender)))+"Phone   :     "+string(ld_phone1_receiver)
	   Print(ll_job,  40,ls_linea)
	   ls_linea = "City    :    "+ls_citysender+ Fill(" ",50 - Len(ls_citysender))+"City    :     "+ls_name_city_rec
	   Print(ll_job,  40,ls_linea)
	   ls_linea = "Country :    "+ls_country_sender+Fill(" ",40 - Len(ls_country_sender))+ Fill(" ",10)+"Country :     "+ls_name_country_rec
	   Print(ll_job,  40,ls_linea)
	   if isnull(ls_acc) then
	      ls_linea = Fill(" ",63)+"Account :    "
      else
   		ls_linea = Fill(" ",63)+"Account :    "+ls_acc
   	end if	
   	Print(ll_job,  40,ls_linea)   
   	if isnull(ls_bank) then
	      ls_linea = Fill(" ",63)+"Bank    :    "
      else
	      ls_linea = Fill(" ",63)+"Bank    :    "+ls_bank
      end if
	   Print(ll_job,  40,ls_linea)
	   Print(ll_job,  50, "                                     PAYEE ")
	
	
   	ls_rate  		= String(ld_rate,"$#,##0.00;($#,##0.00)")
	   ls_amount  		= String(ld_amount,"$#,##0.00;($#,##0.00)")
	   ls_telex			= String(ld_telex,"$#,##0.00;($#,##0.00)")
	   ls_handling		= String(ld_handling,"$#,##0.00;($#,##0.00)")
	   ls_exchange		= String(ld_exchange,"$#,##0.00;($#,##0.00)")
	   ls_modo_pago	= String(ld_modo_pago,"$#,##0.00;($#,##0.00)")
	   ls_total    	= String(ld_total,"$#,##0.00;($#,##0.00)")
	   ls_total_pagar = String(ld_total_pagar,"$#,##0.00;($#,##0.00)")
	
   	ls_linea = "Company  :   "+ls_name_branch+Fill(" ",70 - Len(ls_name_branch))+"Rate        :"+Fill(" ",15 - len(ls_rate))+ls_rate
	   Print(ll_job,  40,ls_linea)
	   ls_linea = "Address  :   "+ls_dir_branch+Fill(" ",70 - Len(ls_dir_branch))+"Amount Sent :"+Fill(" ",15 - len(ls_amount))+ls_amount
	   Print(ll_job,  40,ls_linea)
	   ls_linea = "Phone    :   "+ls_phone1_branch+Fill(" ",70 - Len(ls_phone1_branch))+"Percent     :"+Fill(" ",15 - len(ls_exchange))+ls_exchange
	   Print(ll_job,  40,ls_linea)
	   ls_linea = "WILL PAY :   "+Fill(" ",15 - len(ls_total_pagar))+ls_total_pagar+" "+ ls_currency +Fill(" ",20 - len(ls_currency)) +Fill(" ",34)+"Telex       :"+Fill(" ",15 - len(ls_telex))+ls_telex
	   Print(ll_job,  40,ls_linea)                                                                                                                                 
	   ls_linea = "DELIVERY :   "+ls_delivery+Fill(" ",70 - Len(ls_delivery))+"Other       :"+Fill(" ",15 - len(ls_handling))+ls_handling
	   Print(ll_job,  40,ls_linea)
      //	ls_linea = "                                                                                   Delivery    :    "+Fill(" ",15 - len(ls_modo_pago))+ls_modo_pago
	   if isnull(ls_tollfree) then ls_tollfree=" "
      if isnull(ls_pin) then ls_pin=" "
		ls_linea = "TOLL FREE:   "+ls_tollfree+Fill(" ",70 - Len(ls_tollfree))+"Delivery    :"+Fill(" ",15 - len(ls_modo_pago))+ls_modo_pago
	   Print(ll_job,  40,ls_linea)
      // ls_linea = "                                                                                   Total       :    "+Fill(" ",15 - len(ls_total))+ls_total
      ls_linea = "PIN      :   "+ls_pin+Fill(" ",70 - Len(ls_pin))+"Total       :"+Fill(" ",15 - len(ls_total))+ls_total 
	   Print(ll_job,  40,ls_linea)
	   if isnull(ls_menssage) then
   		ls_linea = "MENSSAGE :"
   	else
   		ls_linea = "MENSSAGE :   "+mid(ls_menssage,1,80)
	   	Print(ll_job,  40,ls_linea)
	   	ls_linea = "             "+mid(ls_menssage,80,80)
      end if		
	   Print(ll_job,  40,ls_linea)
	   ls_linea = "Clave :"+string(ld_clave)
		Print(ll_job,  40, ls_linea)

	   Print(ll_job,  50, "            Sender Signature                                              Cashier Signature")
	
   	PrintClose(ll_job)

If ls_impant <> ls_impact Then
	li_rc = SetProfileString("WIN.INI","WINDOWS","DEVICE",ls_impant)
   If li_rc <> 1 Then
		Messagebox("Error","Colocando la impresora Anterior por Defecto")
		Return -1
	End If
End If

Return 1

end event

event ue_recipientmodification();string ls_id_branch, ls_id_flag
double ld_id_receiver
long ll_cont

ls_id_branch = dw_2.getitemstring(dw_2.getrow(),"id_branch")
ld_id_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")

//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
SELECT id_flag_receiver
  INTO :ls_id_flag
FROM dba.receiver	WITH (NOLOCK)
WHERE 	id_branch = :ls_id_branch
   			AND id_receiver = :ld_id_receiver
			AND id_flag_receiver in ('H','I','T');
//***************************************************************


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
	
em_sender.triggerevent(LoseFocus!)
end event

event ue_query_receivernot();string ls_id_branch, ls_id_flag
double ld_id_receiver
long ll_cont

ls_id_branch = dw_2.getitemstring(dw_2.getrow(),"id_branch")
ld_id_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")

OpenWithParm(w_receiver_payernoy,ls_id_branch+'*'+string(ld_id_receiver))
	
em_sender.triggerevent(LoseFocus!)

end event

event ue_query_statusaudit();string ls_id_branch, ls_id_flag
double ld_id_receiver
long ll_cont

ls_id_branch = dw_2.getitemstring(dw_2.getrow(),"id_branch")
ld_id_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")

OpenWithParm(w_receiver_statusaudit,ls_id_branch+'*'+string(ld_id_receiver))
	
em_sender.triggerevent(LoseFocus!)
end event

event ue_fund_request();string ls_id_branch, ls_id_main_branch_sent, ls_form_type, ls_fax_branch, ls_flag
double ld_id_receiver

ls_id_branch = dw_2.getitemstring(dw_2.getrow(),"id_branch")
ld_id_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
ls_fax_branch = fn_getbranchfax(ls_id_branch)

//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
SELECT id_main_branch_sent, id_flag_receiver
INTO :ls_id_main_branch_sent, :ls_flag
FROM dba.receiver	WITH (NOLOCK)
WHERE id_branch = :ls_id_branch
AND id_receiver = :ld_id_receiver;
//***************************************************************

ls_form_type = 'NO'

// Expirada
if ls_id_main_branch_sent = 'T000' then	ls_form_type = 'E'

// En Hold
if ls_flag = 'H' then ls_form_type = 'H'


if ls_form_type = 'NO' then	
	Messagebox("Error","No es posible enviar el formato para esta orden, ya que no es una orden expirada o en Hold",Stopsign!)
	return
end if 


If Messagebox("Confirmation","Do you really want to send the ORDER REFUND REQUEST FORM for "+trim(ls_id_branch)+"-" +String(ld_id_receiver) + " to the fax "+ls_fax_branch+"?",Question!,YesNo!) <> 1 Then
	return
end if		
	
ls_fax_branch = "@F201 "+ls_id_branch+"@@F211 "+ls_fax_branch+"@@F307 Formato de Reembolso "+trim(ls_id_branch)+"@"	
	
dw_orderrefundrequest.retrieve(ls_id_branch,ld_id_receiver,ls_form_type,ls_fax_branch)	
dw_orderrefundrequest.print()			
dw_orderrefundrequest.reset()

	
end event

event ue_customer_profile();double ld_sender_global
		
ld_sender_global = dw_1.getitemnumber(dw_1.getRow(),"id_sender_global")		
Openwithparm(w_customerprofile,ld_sender_global)		

end event

event ue_kyc();Double ld_receiver, ld_sender
string	ls_branch

ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
ld_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
ld_sender = dw_2.getitemnumber(dw_2.getrow(),"id_sender")

//Openwithparm(w_kyc,ls_branch+"*"+string(ld_receiver))

Openwithparm(w_pfc_sender_compliancedata,ls_branch+"*"+string(ld_sender)+"*"+string(ld_receiver)+"*2*N")

end event

public subroutine wf_recuperar_info ();string	ls_branch,  ls_motivo_hold, host_name
Double   ld_receiver
long		ll_row

ls_branch = TRIM(em_branch.text) 
ld_receiver = Double(em_sender.text)

is_branch = ls_branch
il_receiver = ld_receiver

dw_motivo_hold.reset()

string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago

//DON (04/15/2015) - PERFORMANCE TUNING.  ******************************
//	  SELECT dba.CITY.NAME_CITY,   
//         dba.STATE.NAME_STATE,   
//         dba.COUNTRY.NAME_COUNTRY,   
//         dba.BRANCH.NAME_BRANCH,   
//         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
//         dba.MODO_PAGO.NOM_MODO_PAGO  
//    INTO :ls_name_city,   
//         :ls_name_state,   
//         :ls_name_country,   
//         :ls_name_branch,   
//         :ls_name_group,   
//         :ls_name_modo_pago  
//    FROM dba.RECEIVER,   
//         dba.CITY,   
//         dba.STATE,   
//         dba.COUNTRY,   
//         dba.MODO_PAGO,   
//         dba.BRANCH,   
//         dba.GROUP_BRANCH  
//   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
//         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
//         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
//         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
//         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
//         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
//         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
//         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
//         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
//         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
//			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
//			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;

  SELECT dba.CITY.NAME_CITY,   
         dba.STATE.NAME_STATE,   
         dba.COUNTRY.NAME_COUNTRY,   
         dba.BRANCH.NAME_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
         dba.MODO_PAGO.NOM_MODO_PAGO  
    INTO :ls_name_city,   
         :ls_name_state,   
         :ls_name_country,   
         :ls_name_branch,   
         :ls_name_group,   
         :ls_name_modo_pago 
	FROM dba.RECEIVER	WITH (NOLOCK) 
    INNER JOIN	 dba.BRANCH	WITH (NOLOCK)  
    ON	dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER
    JOIN	dba.GROUP_BRANCH	WITH (NOLOCK)
    ON	dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
    JOIN	dba.MODO_PAGO	WITH (NOLOCK)
    ON	dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER
    JOIN	dba.CITY	WITH (NOLOCK)
    ON	dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER  and  
        dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER  and  
        dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER 
	JOIN	dba.STATE	WITH (NOLOCK)
	ON	dba.STATE.ID_STATE = dba.CITY.ID_STATE  and  
        dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY  and  
        dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER	AND
        dba.STATE.ID_COUNTRY =	dba.RECEIVER.ID_COUNTRY_RECEIVER
	JOIN	dba.COUNTRY   WITH (NOLOCK)
	ON		dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY 
	WHERE	( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
				( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
//***************************************************************

			
if dw_2.retrieve(em_branch.text,Double(em_sender.text),ls_name_city,ls_name_state,ls_name_country,ls_name_branch,ls_name_group,ls_name_modo_pago) = 0 Then
//	messagebox("Consultar","El Invoice no Existe, Rectifique e intente Nuevamente")
	em_sender.selecttext(1,15)
	dw_1.reset()
	dw_2.reset()
	dw_1.insertrow(0)
	dw_2.insertrow(0)
	
	return
else
	
	

	dw_1.retrieve(em_branch.text,dw_2.getitemnumber(dw_2.getrow(),"id_sender"))
	
	DECLARE motivo_hold CURSOR FOR  
   SELECT desc_hold.descripcion  
    FROM  dba.motivo_hold motivo_hold,   
          dba.desc_hold desc_hold 
   WHERE ( desc_hold.tipo_hold     = motivo_hold.type_motivo_hold ) and  
         ((motivo_hold.id_branch   = :ls_branch ) AND  
         ( motivo_hold.id_receiver = :ld_receiver ) )   
   ORDER BY desc_hold.descripcion ASC  ;

	open motivo_hold ;
	Fetch motivo_hold  into :ls_motivo_hold  ;
	
	DO WHILE sqlca.sqlcode = 0
		ll_row = dw_motivo_hold.insertrow(0)
		dw_motivo_hold.setitem(ll_row,'desc',ls_motivo_hold)
		fetch motivo_hold  into :ls_motivo_hold ;
	LOOP
	
	Close motivo_hold ;
	
end if
end subroutine

on w_pfc_consultar_invoice_numero_central.create
int iCurrent
call super::create
if this.MenuName = "m_pfc_consulta_invoice_numero_central" then this.MenuID = create m_pfc_consulta_invoice_numero_central
this.cb_3=create cb_3
this.dw_orderrefundrequest=create dw_orderrefundrequest
this.cb_2=create cb_2
this.cb_1=create cb_1
this.em_sender=create em_sender
this.st_1=create st_1
this.em_branch=create em_branch
this.st_2=create st_2
this.dw_recibo=create dw_recibo
this.dw_recibo_matrix=create dw_recibo_matrix
this.dw_1=create dw_1
this.dw_2=create dw_2
this.dw_motivo_hold=create dw_motivo_hold
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.dw_orderrefundrequest
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.em_sender
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_branch
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.dw_recibo
this.Control[iCurrent+10]=this.dw_recibo_matrix
this.Control[iCurrent+11]=this.dw_1
this.Control[iCurrent+12]=this.dw_2
this.Control[iCurrent+13]=this.dw_motivo_hold
end on

on w_pfc_consultar_invoice_numero_central.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_3)
destroy(this.dw_orderrefundrequest)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.em_sender)
destroy(this.st_1)
destroy(this.em_branch)
destroy(this.st_2)
destroy(this.dw_recibo)
destroy(this.dw_recibo_matrix)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.dw_motivo_hold)
end on

event open;call super::open;X=1
Y=1
Show()

STRU_PARAMETROS stru_parametros

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_recibo.settransobject(sqlca)
dw_recibo_matrix.settransobject(sqlca)

is_branch_insta = fn_branch_instalacion()
em_branch.text = trim(is_branch_insta)
dw_1.insertrow(0)
dw_2.insertrow(0)

stru_parametros = message.PowerObjectParm

ib_isKYC = false

LONG l_isKYCPerfil


SELECT count(*)
INTO :l_isKYCPerfil
FROM dba.SEC_USER_GROUP
WHERE ID_GROUP = 'KYC' 
AND ID_USER = :gs_cashier;
	  
IF l_isKYCPerfil > 0 THEN
	ib_isKYC = true
	dw_2.Modify("receiver_additional_information.Visible='1'" ) 
END IF



IF UpperBound(stru_parametros.String) > 0 THEN
	em_branch.text = stru_parametros.String[1]
	em_sender.text = String(stru_parametros.Long[1])
	wf_recuperar_info()
END IF

if fn_check_user_role('QFO') <= 0 then
	dw_2.object.b_show_folio.visible = 0
end if	
//
//ls_branch = TRIM(em_branch.text) 
//ld_receiver = Double(em_sender.text)
end event

event close;call super::close;dw_2.reset()
dw_1.reset()
end event

event pfc_close;call super::pfc_close;dw_2.reset()
dw_1.reset()
end event

event pfc_preclose;call super::pfc_preclose;return	dw_2.reset()
return  dw_1.reset()
end event

type cb_3 from commandbutton within w_pfc_consultar_invoice_numero_central
integer x = 2807
integer y = 1548
integer width = 91
integer height = 68
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;string ls_id_branch, ls_id_flag
double ld_id_receiver
long ll_cont

ls_id_branch = dw_2.getitemstring(dw_2.getrow(),"id_branch")
ld_id_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")

OpenWithParm(w_receiver_maintenance_fees,ls_id_branch+'*'+string(ld_id_receiver))
	
em_sender.triggerevent(LoseFocus!)

end event

type dw_orderrefundrequest from datawindow within w_pfc_consultar_invoice_numero_central
boolean visible = false
integer x = 2286
integer y = 1496
integer width = 686
integer height = 400
integer taborder = 40
string dataobject = "dw_orderrefundrequest"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_2 from commandbutton within w_pfc_consultar_invoice_numero_central
boolean visible = false
integer x = 786
integer y = 1884
integer width = 722
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "probar depositos VC2"
end type

event clicked;//fn_creditviachecktransactions()
end event

type cb_1 from commandbutton within w_pfc_consultar_invoice_numero_central
boolean visible = false
integer x = 41
integer y = 1888
integer width = 722
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "probar compass"
end type

event clicked;//String id_branch
//Double id_receiver
//
//SetPointer(HourGlass!)
//
//n_tr_compass P_ORACON1
//P_ORACON1 = Create n_tr_compass
//
//// Profile ICCGE
//P_ORACON1.DBMS = "O90 Oracle9i (9.0.1)"
//P_ORACON1.LogPass = "icc"
//P_ORACON1.ServerName = "ICCGE"
//P_ORACON1.LogId = "icc"
//P_ORACON1.AutoCommit = False
//P_ORACON1.DBParm = "PBCatalogOwner='icc'"
//
//P_ORACON1.of_connect()
//
//DECLARE cur_orders CURSOR FOR
//SELECT id_branch, id_receiver
//FROM DBA.RECEIVER
//WHERE DATE_RECEIVER BETWEEN '2008/02/20' AND '2008/02/21 00:00:00'
//AND ID_FLAG_RECEIVER <> 'A'
//AND ID_RECEIVER > 0
//ORDER BY DATE_RECEIVER;
//
//OPEN cur_orders;
//
//FETCH cur_orders INTO :id_branch, :id_receiver;
//
//DO WHILE SQLCA.SQLCODE = 0
//
//	fn_chkcompass(id_branch,id_receiver,P_ORACON1)	
//	FETCH cur_orders INTO :id_branch, :id_receiver;
//
//LOOP
//
//P_ORACON1.of_disconnect()
//
//Messagebox("","Done!")
//
//SetPointer(Arrow!)
end event

type em_sender from u_em within w_pfc_consultar_invoice_numero_central
integer x = 1531
integer y = 8
integer width = 795
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
borderstyle borderstyle = stylebox!
string mask = "################"
boolean autoskip = true
boolean spin = true
double increment = 0
string minmax = "0~~9999999999999999"
end type

event losefocus;wf_recuperar_info()
end event

type st_1 from statictext within w_pfc_consultar_invoice_numero_central
integer x = 1285
integer y = 24
integer width = 238
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean enabled = false
string text = "Invoice :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_branch from u_em within w_pfc_consultar_invoice_numero_central
integer x = 850
integer y = 8
integer width = 425
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
borderstyle borderstyle = stylebox!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!"
boolean autoskip = true
double increment = 0
string minmax = ""
end type

event losefocus;em_sender.SelectText(1,10)
end event

type st_2 from statictext within w_pfc_consultar_invoice_numero_central
integer x = 366
integer y = 24
integer width = 471
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean enabled = false
string text = "Branch Number :"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_recibo from datawindow within w_pfc_consultar_invoice_numero_central
boolean visible = false
integer x = 3328
integer y = 144
integer width = 1317
integer height = 1460
boolean bringtotop = true
string dataobject = "dw_recibo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_recibo_matrix from datawindow within w_pfc_consultar_invoice_numero_central
boolean visible = false
integer x = 2551
integer y = 72
integer width = 494
integer height = 360
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_recibo_dot_matrix"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_pfc_consultar_invoice_numero_central
integer y = 92
integer width = 2249
integer height = 500
string dataobject = "dw_pfc_consultar_numero_new"
boolean border = false
boolean livescroll = true
end type

event retrieveend;string  ls_computername



////////Ejecuta procedimiento almacenado que almacena informacion de la persona que acceso a la pantalla

if this.rowcount() = 1 then

RegistryGet("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName", "ComputerName", RegString!, ls_computername)

DECLARE sp_audit_receiver_query PROCEDURE FOR dba.spAddAuditReceiverQuery 	
	@ID_Branch = :is_branch, 	@ID_Receiver =  :il_receiver, @User =:gs_login, @Host =:ls_computername  , @System = 'VIACENTRAL';
	
	
// Execute it.
 EXECUTE  sp_audit_receiver_query ;

 string s_error
 s_error = sqlca.sqlerrtext
//////////////////////////////	

end if
end event

type dw_2 from datawindow within w_pfc_consultar_invoice_numero_central
event buttonclickedup pbm_dwnrbuttonup
event but pbm_dwnrbuttonup
integer x = 5
integer y = 44
integer width = 3141
integer height = 1656
string dataobject = "dw_pfc_consultar_receiver_numero_new"
boolean border = false
boolean livescroll = true
end type

event itemchanged;STRING ls_order_status	
	
	


IF dwo.name = 'receiver_additional_information' THEN
	ls_order_status = dw_2.GetItemString(1,'id_flag_receiver')

	IF ls_order_status = 'C' OR ls_order_status  = 'A' OR  ls_order_status = 'P' THEN
		RETURN 2
	END IF

		
END IF
end event

event buttonclicked;string ls_folio
integer li_row

if not( il_receiver > 0 )  then return

if dwo.name = 'b_show_folio' then 

	li_row = dw_1.getrow()
	ls_folio = fn_show_folio(il_receiver, is_branch)
	messagebox('Folio / Clave ', 'Folio / Clave : ' + ls_folio )
end if 



end event

type dw_motivo_hold from datawindow within w_pfc_consultar_invoice_numero_central
integer x = 2601
integer y = 604
integer width = 494
integer height = 364
boolean bringtotop = true
string dataobject = "dw_muestra_hold_consulta"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

