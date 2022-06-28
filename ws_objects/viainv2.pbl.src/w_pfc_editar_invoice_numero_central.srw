$PBExportHeader$w_pfc_editar_invoice_numero_central.srw
forward
global type w_pfc_editar_invoice_numero_central from w_master
end type
type em_sender from u_em within w_pfc_editar_invoice_numero_central
end type
type st_1 from statictext within w_pfc_editar_invoice_numero_central
end type
type em_branch from u_em within w_pfc_editar_invoice_numero_central
end type
type st_2 from statictext within w_pfc_editar_invoice_numero_central
end type
type dw_recibo from datawindow within w_pfc_editar_invoice_numero_central
end type
type dw_recibo_matrix from datawindow within w_pfc_editar_invoice_numero_central
end type
type dw_1 from datawindow within w_pfc_editar_invoice_numero_central
end type
type dw_2 from datawindow within w_pfc_editar_invoice_numero_central
end type
type dw_motivo_hold from datawindow within w_pfc_editar_invoice_numero_central
end type
end forward

global type w_pfc_editar_invoice_numero_central from w_master
int X=0
int Y=0
int Width=3209
int Height=1956
boolean Visible=false
boolean TitleBar=true
string Title="Editing Invoices by Invoice's Number"
string MenuName="m_pfc_editar_invoice_numero_central"
long BackColor=80269524
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
global w_pfc_editar_invoice_numero_central w_pfc_editar_invoice_numero_central

type variables
string	Is_branch_insta=""
end variables

event ue_update;gs_branch_insta_cons = em_branch.text
gl_receiver_cons = Double(em_sender.text)

INSERT INTO dba.history_invoice  
		 ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change )  
VALUES ( :gs_branch_insta_cons,:gl_receiver_cons,'M',trim('M'),:gs_cashier,getdate(),getdate() )  ;

//dw_1.update()  sender no se actualiza
dw_2.update()		// solamente algunos campos del receiver

// GENERAR ARCHIVO DE ACTUALIZACION PARA LA AGENCIA


String	ls_id_branch, ls_name_branch, ls_name_sender, ls_address_sender, ls_city,   &
         ls_id_country, ls_type_id_sender, ls_number_id_sender,  ls_payment,   &
         ls_curreny, ls_id_flag_receiver, ls_id_city_receiver, ls_id_state_receiver,   &
         ls_id_country_receiver, ls_branch_pay_receiver, ls_id_cashier, ls_name_receiver,   &
         ls_address_receiver, ls_phone1_receiver, ls_phone2_receiver, ls_zip_receiver,   &
         ls_notes_receiver, ls_recomend_receiver, ls_mode_pay_receiver, ls_acc_receiver,  & 
			ls_mod_pay_currency, ls_trans_receiver, ls_bank_receiver, ls_state, ls_branch, ls_sql, ls_filename, &
			ls_fecha, ls_hora, ls_tmp, ls_tmp1, ls_modem, ls_branch_old, ls_fileline, ls_tollfree, ls_pinnumber

Double	ld_sender, ld_branch, ld_phone1_sender, ld_phone2_sender, ld_zip_sender, ld_id_sender, ld_receiver,  ld_net_amount_receiver,   &
         ld_rate_change_receiver, ld_telex_receiver, ld_urgency_receiver, ld_exchange_receiver, ld_handling_receiver,   &
         ld_total_receiver, ld_porc_comision_receiver, ld_total_pay_receiver, ld_exchange_company, ld_telex_company,   &
         ld_ref_receiver, ld_total_diference, ld_total_modo_pago, ld_commission_payee, ld_referencia, ld_batch, ld_total_modo_pago_comp

Datetime 		ld_date_receiver 
dateTime     lt_time_receiver
Integer	li_file, li_file2
Long		ll_num_inv, ll_tot_inv=0, LL_POS
String	ls_grupo, ls_grupo_batch, ls_file_schedule,ls_branch1

Setpointer(HourGlass!)
COMMIT ;

DECLARE BRANCH CURSOR FOR  
  
  SELECT dba.branch.id_branch
    FROM dba.branch   
   WHERE ( dba.branch.id_branch = :gs_branch_insta_cons );  
			
OPEN BRANCH ;

FETCH BRANCH INTO :ls_id_branch ;
ls_filename = "Z:\OUTPUT\"
ls_file_schedule = Left("Z:\OUTPUT\",2)
DO WHILE SQLCA.SQLCODE = 0
	ls_grupo = ls_id_branch
	ls_fecha = String(Today(), "yyyy-mm-dd")
	ls_hora = string(Now(),"HHMM")	
	ls_branch1 = ''
	ls_tmp=FILL('0',10 - LEN(trim(ls_id_branch)))+trim(ls_branch1)+left(String(ls_fecha),4)+left(ls_hora,4)+".sql"
   ls_filename = "Z:\OUTPUT\"+"GIR"+LS_TMP
	li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Append!)
	if li_file < 0 Then
		Messagebox("Error File Invoices","You Have To Verificate the Table Parameters")
		Return
	end if
	FileWrite(li_file,'SET option on_error = CONTINUE;')
	ls_tmp=String(today(),"yyyy-mm-dd")
	ls_tmp1=String(Now(),"HH:MM:SS")
	ls_branch_old = ls_id_branch
	ls_sql=''
	ll_num_inv = 0
	
	DECLARE invoice_grupo CURSOR FOR
  		SELECT dba.receiver.id_sender, dba.receiver.id_branch,
		       dba.receiver.id_receiver, dba.receiver.id_payment,     
				 dba.receiver.id_curreny, dba.receiver.id_flag_receiver,   
		       dba.receiver.id_city_receiver, dba.receiver.id_state_receiver,   
         	 dba.receiver.id_country_receiver, dba.receiver.branch_pay_receiver,   
         	 dba.receiver.id_cashier, dba.receiver.name_receiver,   
				 dba.receiver.address_receiver, dba.receiver.phone1_receiver,   
         	 dba.receiver.phone2_receiver, dba.receiver.zip_receiver,   
				 dba.receiver.notes_receiver, dba.receiver.date_receiver,   
	          dba.receiver.time_receiver, dba.receiver.net_amount_receiver,   
				 dba.receiver.rate_change_receiver, dba.receiver.telex_receiver,   
				 dba.receiver.urgency_receiver, dba.receiver.recomend_receiver,   
				 dba.receiver.mode_pay_receiver, dba.receiver.acc_receiver,   
				 dba.receiver.exchange_receiver, dba.receiver.handling_receiver,   
				 dba.receiver.total_receiver, dba.receiver.mod_pay_currency,   
				 dba.receiver.porc_comision_receiver, dba.receiver.total_pay_receiver,   
				 dba.receiver.trans_receiver, dba.receiver.exchange_company,   
				 dba.receiver.telex_company, dba.receiver.ref_receiver,   
         	 dba.receiver.bank_receiver, dba.receiver.total_diference,   
				 dba.receiver.total_modo_pago, dba.receiver.commission_payee,
				 dba.receiver.toll_free, dba.receiver.pin_number
    FROM dba.branch, dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
			( dba.branch.id_branch = :gs_branch_insta_cons) ;
			
	OPEN invoice_grupo ;
	FETCH invoice_grupo INTO :ld_id_sender, :ls_id_branch, :ld_receiver, :ls_payment, :ls_curreny,   
					             :ls_id_flag_receiver, :ls_id_city_receiver, :ls_id_state_receiver, :ls_id_country_receiver,   
           					 :ls_branch_pay_receiver, :ls_id_cashier, :ls_name_receiver, :ls_address_receiver,   
					             :ls_phone1_receiver, :ls_phone2_receiver, :ls_zip_receiver, :ls_notes_receiver,   
 					          :ld_date_receiver, :lt_time_receiver, :ld_net_amount_receiver, :ld_rate_change_receiver,   
						          :ld_telex_receiver, :ld_urgency_receiver, :ls_recomend_receiver, :ls_mode_pay_receiver,   
									 :ls_acc_receiver, :ld_exchange_receiver, :ld_handling_receiver, :ld_total_receiver,   
           					 :ls_mod_pay_currency, :ld_porc_comision_receiver,  :ld_total_pay_receiver,   
					             :ls_trans_receiver, :ld_exchange_company, :ld_telex_company, :ld_ref_receiver,   
           					 :ls_bank_receiver, :ld_total_diference, :ld_total_modo_pago, :ld_commission_payee, 
									 :ls_tollfree, :ls_pinnumber ;	

		IF IsNull(ld_id_sender) THEN ld_id_sender=0
		IF IsNull(ls_id_branch) THEN ls_id_branch=''
		IF IsNull(ld_receiver) THEN ld_receiver=0
		IF IsNull(ls_payment) THEN ls_payment=''
		IF IsNull(ls_curreny) THEN ls_curreny=''
		IF IsNull(ls_id_flag_receiver) THEN ls_id_flag_receiver=''
		IF IsNull(ls_id_city_receiver) THEN ls_id_city_receiver=''
		IF IsNull(ls_id_state_receiver) THEN ls_id_state_receiver=''
		IF IsNull(ls_id_country_receiver) THEN ls_id_country_receiver=''
		IF IsNull(ls_branch_pay_receiver) THEN ls_branch_pay_receiver=''
		IF IsNull(ls_id_cashier) THEN ls_id_cashier=''
		IF IsNull(ls_name_receiver) THEN ls_name_receiver=''
		IF IsNull(ls_address_receiver) THEN ls_address_receiver=''
		IF IsNull(ls_phone1_receiver) THEN ls_phone1_receiver=''
		IF IsNull(ls_phone2_receiver) THEN ls_phone2_receiver=''
		IF IsNull(ls_zip_receiver) THEN ls_zip_receiver=''
		IF IsNull(ls_notes_receiver) THEN ls_notes_receiver=''
//		IF IsNull(ld_date_receiver) THEN ld_date_receiver=getdate()
//		IF IsNull(lt_time_receiver) THEN lt_time_receiver=getdate()
		IF IsNull(ld_net_amount_receiver) THEN ld_net_amount_receiver=0
		IF IsNull(ld_rate_change_receiver) THEN ld_rate_change_receiver=0
		IF IsNull(ld_telex_receiver) THEN ld_telex_receiver=0
		IF IsNull(ld_urgency_receiver) THEN ld_urgency_receiver=0
		IF IsNull(ls_recomend_receiver) THEN ls_recomend_receiver=''
		IF IsNull(ls_mode_pay_receiver) THEN ls_mode_pay_receiver=''
		IF IsNull(ls_acc_receiver) THEN ls_acc_receiver=''
		IF IsNull(ld_exchange_receiver) THEN ld_exchange_receiver=0
		IF IsNull(ld_handling_receiver) THEN ld_handling_receiver=0
		IF IsNull(ld_total_receiver) THEN ld_total_receiver=0
		IF IsNull(ls_mod_pay_currency) THEN ls_mod_pay_currency=''
		IF IsNull(ld_porc_comision_receiver) THEN ld_porc_comision_receiver=0
		IF IsNull(ld_total_pay_receiver) THEN ld_total_pay_receiver=0
		IF IsNull(ls_trans_receiver) THEN ls_trans_receiver=''
		IF IsNull(ld_exchange_company) THEN ld_exchange_company=0
		IF IsNull(ld_telex_company) THEN ld_telex_company=0
		IF IsNull(ld_ref_receiver) THEN ld_ref_receiver=0
		IF IsNull(ls_bank_receiver) THEN ls_bank_receiver=''
		IF IsNull(ld_total_diference) THEN ld_total_diference=0
		IF IsNull(ld_total_modo_pago) THEN ld_total_modo_pago=0
		IF IsNull(ld_commission_payee) THEN ld_commission_payee=0
		IF IsNull(ld_total_modo_pago_comp) THEN ld_total_modo_pago_comp=0
	   IF IsNull(ls_tollfree) THEN ls_tollfree=''
		IF IsNull(ls_pinnumber) THEN ls_pinnumber=''

		ls_sql = 'UPDATE receiver  SET receiver.name_receiver='+ls_name_receiver 
		ls_sql += ' ,' +'receiver.address_receiver ='	+ls_address_receiver	+ ' ,' &
					      +'receiver.phone1_receiver ='		+ls_phone1_receiver	+ ' ,' &
							+'receiver.phone2_receiver ='		+ls_phone2_receiver	+ ' ,' &  
					      +'receiver.acc_receiver ='			+ls_acc_receiver		+ ' ,' &
					      +'receiver.bank_receiver ='		+ls_bank_receiver 
		ls_sql += 'WHERE ( receiver.id_branch = '+"'"+trim(ls_id_branch) + "' )"+" AND" 
		ls_sql += 			 '( receiver.id_receiver = '+ string(ld_receiver) +' )  ;'
		FileWrite(li_file, ls_sql)
		FileClose(li_file)
	
	CLOSE invoice_grupo ;
  	ls_fileline =  ls_filename+","+ls_branch_old +","+ ls_name_branch +",~""+ls_modem +"~","+ls_tmp+","+ls_tmp1+"," +&
						"I"+","+String(ll_num_inv)
	FileWrite(li_file2,ls_fileline)
	FETCH BRANCH INTO :ls_id_branch ;
	ll_tot_inv += ll_num_inv
LOOP
FileClose(li_file2)
CLOSE BRANCH ;
SetPointer(Arrow!)
IF ll_tot_inv > 0 THEN
	MessageBox("Information","The total number of invoices to transmit is "+String(ll_tot_inv)+".",Information!)
ELSE
	MessageBox("Atention","There is not invoices to transmit.",Exclamation!)
	Return
END IF
COMMIT ;
end event

event ue_documento;long 		ll_cont = 0
Double	ld_sender = 0
string	ls_branch


ld_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
gs_branch_insta_cons = ls_branch

if ld_sender = 0 then
	return
end if

  SELECT Count(*)  
    INTO :ll_cont  
    FROM dba.sender 
   WHERE ( dba.sender.id_sender = :ld_sender ) AND  
         ( dba.sender.id_branch = :ls_branch )   ;




if ll_cont = 0 then
	return
else
	Openwithparm(w_documento_sender_consulta,ld_sender)
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
Double	ld_sender = 0
string	ls_branch

ld_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
gs_branch_insta_cons = ls_branch

if ld_sender = 0 then
	return
end if

   SELECT Count(*)  
    INTO :ll_cont  
    FROM  dba.sender  
   WHERE ( dba.sender.id_sender = :ld_sender ) AND  
         ( dba.sender.id_branch = :ls_branch )   ;

if ll_cont = 0 then
	return
else
	gl_receiver_cons = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
	Openwithparm(w_consulta_reclamo,ld_sender)
end if
end event

event ue_imprimir;//Printsetup()
//dw_recibo.retrieve(dw_1.getitemstring(dw_1.getrow(),"id_branch"),dw_2.getitemnumber(dw_2.getrow(),"id_receiver"))
//dw_recibo.print()
//


string	ls_dot_pri

	Printsetup()

	ls_dot_pri=ProfileString("c:\CostamarMT\Envio.ini","Printer Setup","Dot Matrix","None")

	IF ls_dot_pri="None" OR ls_dot_pri = "No" Then
		
		dw_recibo.retrieve(dw_1.getitemstring(dw_1.getrow(),"id_branch"),dw_2.getitemnumber(dw_2.getrow(),"id_receiver"))
		dw_recibo.print()
				
	ELSEIF ls_dot_pri = "Yes" Then
		
		//w_pfc_consultar_invoice_numero.Triggerevent("ue_print_matrix")
		
	ELSEIF ls_dot_pri = "Pr" Then	
		dw_recibo_matrix.retrieve(dw_1.getitemstring(dw_1.getrow(),"id_branch"),dw_2.getitemnumber(dw_2.getrow(),"id_receiver"))
		dw_recibo_matrix.print()
	END IF

	
	
	
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
    FROM dba.RECEIVER,   
         dba.CITY,   
         dba.STATE,   
         dba.COUNTRY,   
         dba.MODO_PAGO,   
         dba.BRANCH,   
         dba.GROUP_BRANCH  
   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
			( dba.RECEIVER.ID_BRANCH = :gs_branch_consulta ) AND  
			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
			
			



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

  SELECT Count(*)  
    INTO :ll_cont  
    FROM dba.sender  
   WHERE ( dba.sender.id_sender = :ld_sender ) AND  
         ( dba.sender.id_branch = :ls_branch )   ;


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

  SELECT Count(*)  
    INTO :ll_cont  
    FROM dba.sender  
   WHERE ( dba.sender.id_sender = :ld_sender ) AND  
         ( dba.sender.id_branch = :ls_branch )   ;


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
    FROM dba.RECEIVER,   
         dba.CITY,   
         dba.STATE,   
         dba.COUNTRY,   
         dba.MODO_PAGO,   
         dba.BRANCH,   
         dba.GROUP_BRANCH  
   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
			( dba.RECEIVER.ID_RECEIVER = :gl_receiver_cons )   ;
			
			
			



	dw_2.retrieve(em_branch.text,Double(em_sender.text),ls_name_city,ls_name_state,ls_name_country,ls_name_branch,ls_name_group,ls_name_modo_pago) 

end if
end event

event ue_next;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido
Double	ld_receiver



ld_receiver = Double(em_sender.text) + 1
ls_branch   = em_branch.text


if isnull(ls_branch) or ls_branch = "" then 
	return
end if

if isnull(ld_receiver) or ld_receiver = 0 then 
	return
end if

  SELECT Count(*)  
    INTO :ll_cont  
    FROM dba.receiver  
   WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         ( dba.receiver.id_receiver = :ld_receiver )   ;

if ll_cont = 0 then
	return
end if



string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago
			
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
    FROM dba.RECEIVER,   
         dba.CITY,   
         dba.STATE,   
         dba.COUNTRY,   
         dba.MODO_PAGO,   
         dba.BRANCH,   
         dba.GROUP_BRANCH  
   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
			
			



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


if isnull(ls_branch) or ls_branch = "" then 
	return
end if

if isnull(ld_receiver) or ld_receiver = 0 then 
	return
end if

  SELECT Count(*)  
    INTO :ll_cont  
    FROM dba.receiver 
   WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         ( dba.receiver.id_receiver = :ld_receiver )   ;

if ll_cont = 0 then
	return
end if


string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago
			
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
    FROM dba.RECEIVER,   
         dba.CITY,   
         dba.STATE,   
         dba.COUNTRY,   
         dba.MODO_PAGO,   
         dba.BRANCH,   
         dba.GROUP_BRANCH  
   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
			
			



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

  SELECT MAX(dba.receiver.id_receiver)
    INTO :ld_receiver
    FROM dba.receiver  
   WHERE ( dba.receiver.id_branch = :ls_branch ) 
	and	(dba.receiver.id_receiver < 900000 ) ;
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
    FROM dba.RECEIVER,   
         dba.CITY,   
         dba.STATE,   
         dba.COUNTRY,   
         dba.MODO_PAGO,   
         dba.BRANCH,   
         dba.GROUP_BRANCH  
   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
			
			



if dw_2.retrieve(ls_branch,ld_receiver,ls_name_city,ls_name_state,ls_name_country,ls_name_branch,ls_name_group,ls_name_modo_pago) = 0 Then
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
FROM   dba.branch
WHERE  dba.branch.id_branch = :gs_branch_insta ;
//********************************

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
    FROM dba.city city,   
         dba.receiver receiver,   
         dba.sender sender,   
         dba.branch branch,
			dba.currency currency,
			dba.country country
   WHERE ( sender.id_sender = receiver.id_sender ) and  
         ( sender.id_branch = receiver.id_branch ) and  
         ( sender.id_city = city.id_city ) and  
         ( sender.id_state = city.id_state ) and  
         ( sender.id_country = city.id_country ) and 
			( sender.id_country = country.id_country ) and 
         ( branch.id_branch = receiver.branch_pay_receiver ) and  
			( receiver.id_curreny = currency.id_curreny ) and 
			( ( receiver.id_branch = :gs_branch_insta ) AND  
         ( receiver.id_receiver = :ld_receiver1 ) )   ;



	  SELECT city.name_city,   
         country.name_country  
    INTO :ls_name_city_rec,   
         :ls_name_country_rec  
    FROM dba.city city,   
         dba.country country 
   WHERE ( city.id_country = country.id_country ) and  
         ( ( city.id_city = :ls_city_receiver ) AND  
         ( city.id_country = :ls_country_receiver ) )   ;





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

on w_pfc_editar_invoice_numero_central.create
int iCurrent
call super::create
if this.MenuName = "m_pfc_editar_invoice_numero_central" then this.MenuID = create m_pfc_editar_invoice_numero_central
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
this.Control[iCurrent+1]=this.em_sender
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.em_branch
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_recibo
this.Control[iCurrent+6]=this.dw_recibo_matrix
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.dw_2
this.Control[iCurrent+9]=this.dw_motivo_hold
end on

on w_pfc_editar_invoice_numero_central.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
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

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_recibo.settransobject(sqlca)
dw_recibo_matrix.settransobject(sqlca)

is_branch_insta = fn_branch_instalacion()
em_branch.text = is_branch_insta	
dw_1.insertrow(0)
dw_2.insertrow(0)




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

type em_sender from u_em within w_pfc_editar_invoice_numero_central
int X=1591
int Y=8
int Width=658
int Height=88
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="########"
boolean AutoSkip=true
boolean Spin=true
double Increment=0
string MinMax="0~~999999"
int Weight=700
FontCharSet FontCharSet=Ansi!
end type

event losefocus;string	ls_branch,  ls_motivo_hold
Double   ld_receiver
long		ll_row

ls_branch = em_branch.text
ld_receiver = Double(em_sender.text)
dw_motivo_hold.reset()

string	ls_name_city, 		&  
         ls_name_state ,	&
			ls_name_country, 	&	
			ls_name_branch, 	&	  
         ls_name_group, 	&	  
         ls_name_modo_pago
			
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
    FROM dba.RECEIVER,   
         dba.CITY,   
         dba.STATE,   
         dba.COUNTRY,   
         dba.MODO_PAGO,   
         dba.BRANCH,   
         dba.GROUP_BRANCH  
   WHERE ( dba.CITY.ID_CITY = dba.RECEIVER.ID_CITY_RECEIVER ) and  
         ( dba.CITY.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.CITY.ID_COUNTRY = dba.RECEIVER.ID_COUNTRY_RECEIVER ) and  
         ( dba.STATE.ID_STATE = dba.CITY.ID_STATE ) and  
         ( dba.STATE.ID_COUNTRY = dba.CITY.ID_COUNTRY ) and  
         ( dba.STATE.ID_STATE = dba.RECEIVER.ID_STATE_RECEIVER ) and  
         ( dba.RECEIVER.ID_COUNTRY_RECEIVER = dba.STATE.ID_COUNTRY ) and  
         ( dba.COUNTRY.ID_COUNTRY = dba.STATE.ID_COUNTRY ) and  
         ( dba.MODO_PAGO.ID_MODO_PAGO = dba.RECEIVER.MODE_PAY_RECEIVER ) and  
         ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
         ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  AND  
			( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
			( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
			
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
end event

type st_1 from statictext within w_pfc_editar_invoice_numero_central
int X=1330
int Y=24
int Width=238
int Height=44
boolean Enabled=false
boolean BringToTop=true
string Text="Invoice :"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=80269524
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_branch from u_em within w_pfc_editar_invoice_numero_central
int X=850
int Y=8
int Width=425
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="!!!!!!!!!!!!!!!!!!!!!!!"
MaskDataType MaskDataType=StringMask!
boolean AutoSkip=true
double Increment=0
string MinMax=""
int Weight=700
FontCharSet FontCharSet=Ansi!
end type

event losefocus;em_sender.SelectText(1,10)
end event

type st_2 from statictext within w_pfc_editar_invoice_numero_central
int X=375
int Y=24
int Width=471
int Height=44
boolean Enabled=false
boolean BringToTop=true
string Text="Branch Number :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=80269524
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_recibo from datawindow within w_pfc_editar_invoice_numero_central
int X=2537
int Y=208
int Width=494
int Height=360
int TabOrder=40
boolean Visible=false
boolean BringToTop=true
string DataObject="dw_recibo"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type dw_recibo_matrix from datawindow within w_pfc_editar_invoice_numero_central
int X=2551
int Y=72
int Width=494
int Height=360
int TabOrder=30
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string DataObject="dw_recibo_dot_matrix"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type dw_1 from datawindow within w_pfc_editar_invoice_numero_central
int Y=100
int Width=2249
int Height=568
string DataObject="dw_pfc_editar_numero_new"
boolean Border=false
boolean LiveScroll=true
end type

type dw_2 from datawindow within w_pfc_editar_invoice_numero_central
int Y=148
int Width=3177
int Height=1584
string DataObject="dw_pfc_editar_receiver_numero_new"
boolean Border=false
boolean LiveScroll=true
end type

type dw_motivo_hold from datawindow within w_pfc_editar_invoice_numero_central
int X=2606
int Y=632
int Width=494
int Height=396
boolean BringToTop=true
string DataObject="dw_muestra_hold_consulta"
boolean Border=false
boolean VScrollBar=true
boolean LiveScroll=true
end type

event constructor;settransobject(sqlca)
end event

