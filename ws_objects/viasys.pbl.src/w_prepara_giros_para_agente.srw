$PBExportHeader$w_prepara_giros_para_agente.srw
forward
global type w_prepara_giros_para_agente from window
end type
type cb_close from commandbutton within w_prepara_giros_para_agente
end type
type cb_generate from commandbutton within w_prepara_giros_para_agente
end type
type cb_4 from commandbutton within w_prepara_giros_para_agente
end type
type sle_branch from singlelineedit within w_prepara_giros_para_agente
end type
type st_5 from statictext within w_prepara_giros_para_agente
end type
type em_to from editmask within w_prepara_giros_para_agente
end type
type em_from from editmask within w_prepara_giros_para_agente
end type
type st_4 from statictext within w_prepara_giros_para_agente
end type
type st_3 from statictext within w_prepara_giros_para_agente
end type
type gb_1 from groupbox within w_prepara_giros_para_agente
end type
end forward

global type w_prepara_giros_para_agente from window
integer x = 823
integer y = 360
integer width = 978
integer height = 708
boolean titlebar = true
string title = "Retransmit Invoices to Agent"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
cb_close cb_close
cb_generate cb_generate
cb_4 cb_4
sle_branch sle_branch
st_5 st_5
em_to em_to
em_from em_from
st_4 st_4
st_3 st_3
gb_1 gb_1
end type
global w_prepara_giros_para_agente w_prepara_giros_para_agente

type variables
string       is_output
end variables

on w_prepara_giros_para_agente.create
this.cb_close=create cb_close
this.cb_generate=create cb_generate
this.cb_4=create cb_4
this.sle_branch=create sle_branch
this.st_5=create st_5
this.em_to=create em_to
this.em_from=create em_from
this.st_4=create st_4
this.st_3=create st_3
this.gb_1=create gb_1
this.Control[]={this.cb_close,&
this.cb_generate,&
this.cb_4,&
this.sle_branch,&
this.st_5,&
this.em_to,&
this.em_from,&
this.st_4,&
this.st_3,&
this.gb_1}
end on

on w_prepara_giros_para_agente.destroy
destroy(this.cb_close)
destroy(this.cb_generate)
destroy(this.cb_4)
destroy(this.sle_branch)
destroy(this.st_5)
destroy(this.em_to)
destroy(this.em_from)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.gb_1)
end on

event open;em_From.text = String(Today())
em_To.text = String(Today())

X=1
Y=1

SELECT DISTINCT dba.parametros.dir_output  
    INTO :is_output
    FROM dba.parametros  ;

is_output = trim(is_output)



end event

type cb_close from commandbutton within w_prepara_giros_para_agente
integer x = 480
integer y = 460
integer width = 389
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_generate from commandbutton within w_prepara_giros_para_agente
integer x = 59
integer y = 460
integer width = 389
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Generate"
boolean default = true
end type

event clicked;String	ls_id_branch, ls_name_branch, ls_name_sender, ls_address_sender, ls_city,   &
         ls_id_country, ls_type_id_sender, ls_number_id_sender,  ls_payment,   &
         ls_curreny, ls_id_flag_receiver, ls_id_city_receiver, ls_id_state_receiver,   &
         ls_id_country_receiver, ls_branch_pay_receiver, ls_id_cashier, ls_name_receiver,   &
         ls_address_receiver, ls_phone1_receiver, ls_phone2_receiver, ls_zip_receiver,   &
         ls_notes_receiver, ls_recomend_receiver, ls_mode_pay_receiver, ls_acc_receiver,  & 
			ls_mod_pay_currency, ls_trans_receiver, ls_bank_receiver, ls_state, ls_branch, ls_sql, ls_filename, &
			ls_fecha, ls_hora, ls_tmp, ls_tmp1, ls_modem, ls_branch_old, ls_fileline, ls_tollfree, ls_pinnumber, ls_clave_receiver, &
			ls_statesender, ls_citysender, ls_rec_fname, ls_rec_mname, ls_rec_lname, ls_rec_slname, ls_rec_createacc, ls_acc_typeid, &
			ls_typeid, ls_numid, ls_payment_date, ls_typed_date, &
			ls_sen_fname, ls_sen_mname, ls_sen_lname, ls_sen_slname, ls_sen_accrouting, ls_sen_accbank, ls_sen_accnumber,  &
			ls_sen_paymenttype, ls_email_sender, ls_dob_sender

Double	ld_sender, ld_branch, ld_phone1_sender, ld_phone2_sender, ld_zip_sender, ld_id_sender, ld_receiver,  ld_net_amount_receiver,   &
         ld_rate_change_receiver, ld_telex_receiver, ld_urgency_receiver, ld_exchange_receiver, ld_handling_receiver,   &
         ld_total_receiver, ld_porc_comision_receiver, ld_total_pay_receiver, ld_exchange_company, ld_telex_company,   &
         ld_ref_receiver, ld_total_diference, ld_total_modo_pago, ld_commission_payee, ld_referencia, ld_batch, ld_total_modo_pago_comp, &
			ld_fee_rate, ld_id_receiver_unique

Datetime ld_date_receiver, ld_payment_date, ld_typed_date, ld_dob_sender 
dateTime lt_time_receiver
Integer	li_file
Long		ll_num_inv, ll_tot_inv=0, LL_POS

Setpointer(HourGlass!)

COMMIT;

ls_filename = is_output

ls_id_branch = sle_branch.text

//ls_fecha = String(Today(), "yyyy-mm-dd")
//ls_hora = string(Now(),"HHMM")	
//ls_tmp=FILL('0',10 - LEN(trim(ls_id_branch)))+trim(ls_id_branch)+left(String(ls_fecha),4)+left(ls_hora,4)+".sql"
ls_tmp=FILL('0',10 - LEN(trim(ls_id_branch)))+trim(ls_id_branch)+".sql"
ls_filename = is_output + ls_id_branch + "\GIR" + LS_TMP
li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Append!)
if li_file < 0 Then
	Messagebox("Error Opening File","Path ["+ls_filename+"] not found",StopSign!)
	Return
end if
FileWrite(li_file,'SET option on_error = CONTINUE;')
ls_tmp=String(today(),"yyyy-mm-dd")
ls_tmp1=String(Now(),"HH:MM:SS")
ls_branch_old = ls_id_branch
ls_sql=''
ll_num_inv = 0

Date datefrom, dateto

datefrom = date(em_from.text)
dateto   = RelativeDate(date(em_to.text),1)
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
			 dba.receiver.toll_free, dba.receiver.pin_number, dba.receiver.clave_receiver,			 
			 dba.receiver.rec_fname, dba.receiver.rec_mname, dba.receiver.rec_lname, 
			 dba.receiver.rec_slname, dba.receiver.rec_createacc, dba.receiver.acc_typeid,
			 dba.receiver.typeid, dba.receiver.numid, dba.receiver.fee_rate, 
			 dba.receiver.id_receiver_unique, dba.receiver.payment_date, dba.receiver.typed_date
 FROM dba.branch (nolock), dba.receiver   (nolock)
WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
		( dba.receiver.date_receiver >= :datefrom ) and
		( dba.receiver.date_receiver <= :dateto ) and
		( dba.branch.id_branch = :sle_branch.text);			
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
								 :ls_tollfree, :ls_pinnumber, :ls_clave_receiver, :ls_rec_fname, :ls_rec_mname, :ls_rec_lname, 
								 :ls_rec_slname, :ls_rec_createacc, :ls_acc_typeid, :ls_typeid, :ls_numid, :ld_fee_rate,
								 :ld_id_receiver_unique, :ld_payment_date, :ld_typed_date ;
DO WHILE SQLCA.SQLCODE = 0
	ll_num_inv ++
		
	// INSERTING SENDER INFORMATION
	SELECT dba.sender.id_sender, dba.sender.id_branch,
			 dba.sender.name_sender, dba.sender.addres_sender,
			 dba.sender.phone1_sender, dba.sender.phone2_sender,
			 dba.sender.zip_sender, dba.sender.id_city,
			 dba.sender.id_state, dba.sender.id_country,
			 dba.sender.id_type_id_sender, dba.sender.number_id_sender,
			 dba.sender.state_sender, dba.sender.city_sender,			 
			 dba.sender.sen_fname, dba.sender.sen_mname, dba.sender.sen_lname, dba.sender.sen_slname, 
			 dba.sender.sen_accrouting, dba.sender.sen_accbank, dba.sender.sen_accnumber,
			 dba.sender.sen_paymenttype, dba.sender.email_sender, dba.sender.dob_sender		
	  INTO :ld_id_sender, :ls_id_branch,
			 :ls_name_sender, :ls_address_sender,  
			 :ld_phone1_sender, :ld_phone2_sender,
			 :ld_zip_sender, :ls_city,  
			 :ls_state, :ls_id_country,
			 :ls_type_id_sender, :ls_number_id_sender,
			 :ls_statesender, :ls_citysender,			 
			 :ls_sen_fname, :ls_sen_mname, :ls_sen_lname, :ls_sen_slname, 
			 :ls_sen_accrouting, :ls_sen_accbank, :ls_sen_accnumber,
			 :ls_sen_paymenttype, :ls_email_sender, :ld_dob_sender
	  FROM dba.sender (nolock),   
			 dba.receiver   (nolock)
	 WHERE ( dba.receiver.id_sender = dba.sender.id_sender ) and  
			 ( dba.receiver.id_branch = dba.sender.id_branch ) and  
			 ( ( dba.receiver.id_sender = :ld_id_sender ) AND  
			 ( dba.receiver.id_branch = :ls_id_branch ) AND  
			 ( dba.receiver.id_receiver = :ld_receiver ) )   ;
	IF IsNull(ls_address_sender) THEN ls_address_sender = ''
	IF IsNull(ld_phone1_sender) THEN ld_phone1_sender = 0
	IF IsNull(ld_phone2_sender) THEN ld_phone2_sender = 0
	IF IsNull(ld_zip_sender) THEN ld_zip_sender=0
	IF IsNull(ls_type_id_sender) THEN ls_type_id_sender=''
	IF	IsNull(ls_number_id_sender) THEN ls_number_id_sender=''
	IF	IsNull(ls_statesender) THEN ls_statesender=''
	IF	IsNull(ls_citysender) THEN ls_citysender=''
	
	IF	IsNull(ls_sen_fname) THEN ls_sen_fname=''
	IF	IsNull(ls_sen_mname) THEN ls_sen_mname=''
	IF	IsNull(ls_sen_lname) THEN ls_sen_lname=''
	IF	IsNull(ls_sen_slname) THEN ls_sen_slname=''
	IF	IsNull(ls_sen_accrouting) THEN ls_sen_accrouting=''
	IF	IsNull(ls_sen_accbank) THEN ls_sen_accbank=''
	IF	IsNull(ls_sen_accnumber) THEN ls_sen_accnumber=''
	IF	IsNull(ls_sen_paymenttype) THEN ls_sen_paymenttype=''
	IF	IsNull(ls_email_sender) THEN ls_email_sender=''
	IF IsNull(ld_dob_sender) THEN ls_dob_sender = 'NULL' else ls_dob_sender = "'"+String(ld_dob_sender,'yyyy-mm-dd hh:mm:ss')+"'"	
	
	ls_sql =  'INSERT INTO sender ( id_sender, id_branch, name_sender, addres_sender, phone1_sender, phone2_sender, '
	ls_sql += 'zip_sender, id_city, id_state, id_country, id_type_id_sender, number_id_sender, state_sender, city_sender, '
	ls_sql += 'sen_fname, sen_mname, sen_lname, sen_slname, sen_accrouting, sen_accbank, sen_accnumber, sen_paymenttype, '	
	ls_sql += 'email_sender, dob_sender'		
	ls_sql += ') VALUES ('		
	ls_sql += trim(String(ld_id_sender))+",'"+trim(ls_id_branch)+"','"+trim(ls_name_sender)+"','"+trim(ls_address_sender)+"',"+trim(String(ld_phone1_sender))&
				 +','+trim(String(ld_phone2_sender))+','+trim(String(ld_zip_sender))+",'"+trim(ls_city)+"','"+trim(ls_state)+"','"+trim(ls_id_country)+"','"+&   
				 trim(ls_type_id_sender)+"','"+trim(ls_number_id_sender)+"','"+trim(ls_statesender)+"','"+trim(ls_citysender)+"','"+&
				 trim(ls_sen_fname)+"','"+trim(ls_sen_mname)+"','"+trim(ls_sen_lname)+"','"+trim(ls_sen_slname)+"','"+trim(ls_sen_accrouting)+"','"+&
				 trim(ls_sen_accbank)+"','"+trim(ls_sen_accnumber)+"','"+trim(ls_sen_paymenttype)+"','"+trim(ls_email_sender)+"',"+trim(ls_dob_sender)+&
				 +");"
	FileWrite(li_file, ls_sql)
	// INSERTING RECEIVER INFORMATION
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
	IF IsNull(ls_clave_receiver) THEN ls_clave_receiver = ''	
	IF IsNull(ls_rec_fname) THEN ls_rec_fname = ''
	IF IsNull(ls_rec_mname) THEN ls_rec_mname = ''
	IF IsNull(ls_rec_lname) THEN ls_rec_lname = ''
	IF IsNull(ls_rec_slname) THEN ls_rec_slname = ''
	IF IsNull(ls_rec_createacc) THEN ls_rec_createacc = ''
	IF IsNull(ls_acc_typeid) THEN ls_acc_typeid = ''
	IF IsNull(ls_typeid) THEN ls_typeid = ''
	IF IsNull(ls_numid) THEN ls_numid = ''
	IF IsNull(ld_fee_rate) THEN ld_fee_rate = 0
	IF IsNull(ld_id_receiver_unique) THEN ld_id_receiver_unique = ld_receiver	
	IF IsNull(ld_payment_date) THEN ls_payment_date = 'NULL' else ls_payment_date = "'"+String(ld_payment_date,'yyyy-mm-dd hh:mm:ss')+"'"
	IF IsNull(ld_typed_date) THEN ls_typed_date = 'NULL' else ls_typed_date = "'"+String(ld_typed_date,'yyyy-mm-dd hh:mm:ss')+"'"
	
	ld_commission_payee = 0
	ls_id_cashier = 'ADM'
	
	ls_sql = "INSERT INTO receiver ( id_sender, id_branch, id_receiver, id_payment, id_curreny, id_flag_receiver, "
	ls_sql += "id_city_receiver, id_state_receiver, id_country_receiver, branch_pay_receiver, id_cashier, "
	ls_sql += "name_receiver, address_receiver, phone1_receiver, phone2_receiver, zip_receiver, notes_receiver, "
	ls_sql += "date_receiver, time_receiver, net_amount_receiver, rate_change_receiver, telex_receiver, "
	ls_sql += "urgency_receiver, recomend_receiver, mode_pay_receiver, acc_receiver, exchange_receiver, "
	ls_sql += "handling_receiver, total_receiver, mod_pay_currency, porc_comision_receiver, total_pay_receiver, "
	ls_sql += "trans_receiver, exchange_company, telex_company, ref_receiver, bank_receiver, total_diference, "
	ls_sql += "total_modo_pago, commission_payee, total_modo_pago_comp, toll_free, pin_number, clave_receiver, "
	ls_sql += "rec_fname, rec_mname, rec_lname, rec_slname, rec_createacc, acc_typeid, typeid, numid, "	
	ls_sql += "fee_rate, id_receiver_unique, payment_date, typed_date ) VALUES ("	
	ls_sql += trim(String(ld_id_sender))+",'"+trim(ls_id_branch)+"',"+trim(String(ld_receiver))+",'"+trim(ls_payment)+"','"+trim(ls_curreny)+"','" + &
				 trim(ls_id_flag_receiver)+"','"+trim(ls_id_city_receiver)+"','"+trim(ls_id_state_receiver)+"','"+trim(ls_id_country_receiver)+"','" + &
				 trim(ls_branch_pay_receiver)+"','"+trim(ls_id_cashier)+"','"+trim(ls_name_receiver)+"','"+trim(ls_address_receiver)+"','" + &
				 trim(ls_phone1_receiver)+"','"+trim(ls_phone2_receiver)+"','"+trim(ls_zip_receiver)+"','"+trim(ls_notes_receiver)+"','" + &
				 trim(String(ld_date_receiver,"yyyy-mm-dd"))+"','"+trim(String(lt_time_receiver,"HH:MM:SS"))+"',"+ &
				 trim(String(ld_net_amount_receiver))+","+trim(String(ld_rate_change_receiver))+","+trim(String(ld_telex_receiver))+"," + &
				 trim(String(ld_urgency_receiver))+",'"+trim(ls_recomend_receiver)+"','"+trim(ls_mode_pay_receiver)+"','"+trim(ls_acc_receiver)+"'," + &
				 trim(String(ld_exchange_receiver))+","+trim(String(ld_handling_receiver))+","+trim(String(ld_total_receiver))+",'" + &
				 trim(ls_mod_pay_currency)+"',"+trim(String(ld_porc_comision_receiver))+","+trim(String(ld_total_pay_receiver))+",'"+&
				 trim(ls_trans_receiver)+"',"+trim(String(ld_exchange_company))+","+trim(String(ld_telex_company))+","+&
				 trim(String(ld_ref_receiver))+",'"+trim(ls_bank_receiver)+"',"+trim(String(ld_total_diference))+","+&
				 trim(String(ld_total_modo_pago))+","+trim(String(ld_commission_payee))+","+trim(String(ld_total_modo_pago_comp))+",'"+&
				 trim(ls_tollfree)+"','"+trim(ls_pinnumber)+"','"+trim(ls_clave_receiver)+"','"+ &				 
				 trim(ls_rec_fname)+"','"+trim(ls_rec_mname)+"','"+trim(ls_rec_lname)+"','"+trim(ls_rec_slname)+"','"+trim(ls_rec_createacc)+"','"+&
				 trim(ls_acc_typeid)+"','"+trim(ls_typeid)+"','"+trim(ls_numid)+"',"+trim(String(ld_fee_rate))+","+&
				 trim(String(ld_id_receiver_unique))+","+ls_payment_date+","+ls_typed_date+&
				 ");"				 
	FileWrite(li_file, ls_sql)
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
								 :ls_tollfree, :ls_pinnumber, :ls_clave_receiver, :ls_rec_fname, :ls_rec_mname, :ls_rec_lname, 
								 :ls_rec_slname, :ls_rec_createacc, :ls_acc_typeid, :ls_typeid, :ls_numid, :ld_fee_rate,
								 :ld_id_receiver_unique, :ld_payment_date, :ld_typed_date ;
LOOP
FileWrite(li_file,"COMMIT;")
FileClose(li_file)
CLOSE invoice_grupo ;

ll_tot_inv += ll_num_inv

SetPointer(Arrow!)
IF ll_tot_inv > 0 THEN
	MessageBox("Information",String(ll_tot_inv)+" Invoices were generated to the agent.",Information!)
ELSE
	MessageBox("Atention","There are not invoices to retransmit.",Exclamation!)
	IF NOT Parent.Visible THEN
		Close(Parent)
		Return
	END IF
	Return
END IF
COMMIT ;

end event

type cb_4 from commandbutton within w_prepara_giros_para_agente
integer x = 2103
integer y = 84
integer width = 1074
integer height = 108
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Prepare File"
end type

event clicked;//String	ls_id_branch, ls_name_branch, ls_name_sender, ls_address_sender, ls_city,   &
//         ls_id_country, ls_type_id_sender, ls_number_id_sender,  ls_payment,   &
//         ls_curreny, ls_id_flag_receiver, ls_id_city_receiver, ls_id_state_receiver,   &
//         ls_id_country_receiver, ls_branch_pay_receiver, ls_id_cashier, ls_name_receiver,   &
//         ls_address_receiver, ls_phone1_receiver, ls_phone2_receiver, ls_zip_receiver,   &
//         ls_notes_receiver, ls_recomend_receiver, ls_mode_pay_receiver, ls_acc_receiver,  & 
//			ls_mod_pay_currency, ls_trans_receiver, ls_bank_receiver, ls_state, ls_branch, ls_sql, ls_filename, &
//			ls_fecha, ls_hora, ls_tmp, ls_tmp1, ls_modem, ls_branch_old, ls_fileline, ls_tollfree, ls_pinnumber
//
//Double	ld_sender, ld_branch, ld_phone1_sender, ld_phone2_sender, ld_zip_sender, ld_id_sender, ld_receiver,  ld_net_amount_receiver,   &
//         ld_rate_change_receiver, ld_telex_receiver, ld_urgency_receiver, ld_exchange_receiver, ld_handling_receiver,   &
//         ld_total_receiver, ld_porc_comision_receiver, ld_total_pay_receiver, ld_exchange_company, ld_telex_company,   &
//         ld_ref_receiver, ld_total_diference, ld_total_modo_pago, ld_commission_payee, ld_referencia, ld_batch, ld_total_modo_pago_comp
//
//Datetime 		ld_date_receiver 
//dateTime     lt_time_receiver
//Integer	li_file, li_file2
//Long		ll_num_inv, ll_tot_inv=0, LL_POS
//String	ls_grupo, ls_grupo_batch, ls_file_schedule,ls_branch1
//
//Setpointer(HourGlass!)
//COMMIT ;
//DECLARE Grupo CURSOR FOR  
//  SELECT DISTINCT dba.group_branch.id_main_branch
//    FROM dba.receiver,   
//         dba.branch,   
//         dba.group_branch  
//   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
//         ( dba.group_branch.id_main_branch = :sle_grupo.text ) ;
//			
//OPEN Grupo ;
//FETCH Grupo INTO :ls_id_branch ;
//ls_filename = is_output
//ls_file_schedule = Left(is_output,2)
//DO WHILE SQLCA.SQLCODE = 0
//	ls_grupo = ls_id_branch
//	ls_fecha = String(Today(), "yyyy-mm-dd")
//	ls_hora = string(Now(),"HHMM")	
//	ls_branch1 = sle_branch.text
//	ls_tmp=FILL('0',10 - LEN(trim(ls_id_branch)))+trim(ls_branch1)+left(String(ls_fecha),4)+left(ls_hora,4)+".sql"
//   ls_filename = is_output+"GIR"+LS_TMP
//	li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Replace!)
//	if li_file < 0 Then
//		Messagebox("Error File Invoices","You Have To Verificate the Table Parameters")
//		Return
//	end if
//	FileWrite(li_file,'SET option on_error = CONTINUE;')
//	ls_tmp=String(today(),"yyyy-mm-dd")
//	ls_tmp1=String(Now(),"HH:MM:SS")
//	ls_branch_old = ls_id_branch
//	ls_sql=''
//	ll_num_inv = 0
//	
//	Date datefrom, dateto
//	
//	datefrom = date(em_from.text)
//	dateto   = RelativeDate(date(em_to.text),1)
//	DECLARE invoice_grupo CURSOR FOR
//  		SELECT dba.receiver.id_sender, dba.receiver.id_branch,
//		       dba.receiver.id_receiver, dba.receiver.id_payment,     
//				 dba.receiver.id_curreny, dba.receiver.id_flag_receiver,   
//		       dba.receiver.id_city_receiver, dba.receiver.id_state_receiver,   
//         	 dba.receiver.id_country_receiver, dba.receiver.branch_pay_receiver,   
//         	 dba.receiver.id_cashier, dba.receiver.name_receiver,   
//				 dba.receiver.address_receiver, dba.receiver.phone1_receiver,   
//         	 dba.receiver.phone2_receiver, dba.receiver.zip_receiver,   
//				 dba.receiver.notes_receiver, dba.receiver.date_receiver,   
//	          dba.receiver.time_receiver, dba.receiver.net_amount_receiver,   
//				 dba.receiver.rate_change_receiver, dba.receiver.telex_receiver,   
//				 dba.receiver.urgency_receiver, dba.receiver.recomend_receiver,   
//				 dba.receiver.mode_pay_receiver, dba.receiver.acc_receiver,   
//				 dba.receiver.exchange_receiver, dba.receiver.handling_receiver,   
//				 dba.receiver.total_receiver, dba.receiver.mod_pay_currency,   
//				 dba.receiver.porc_comision_receiver, dba.receiver.total_pay_receiver,   
//				 dba.receiver.trans_receiver, dba.receiver.exchange_company,   
//				 dba.receiver.telex_company, dba.receiver.ref_receiver,   
//         	 dba.receiver.bank_receiver, dba.receiver.total_diference,   
//				 dba.receiver.total_modo_pago, dba.receiver.commission_payee,
//				 dba.receiver.toll_free, dba.receiver.pin_number
//    FROM dba.branch, dba.receiver  
//   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
//	      ( dba.receiver.date_receiver >= :datefrom ) and
//			( dba.receiver.date_receiver <= :dateto ) and
//			( dba.branch.id_main_branch = :sle_grupo.text ) ;
//	OPEN invoice_grupo ;
//	FETCH invoice_grupo INTO :ld_id_sender, :ls_id_branch, :ld_receiver, :ls_payment, :ls_curreny,   
//					             :ls_id_flag_receiver, :ls_id_city_receiver, :ls_id_state_receiver, :ls_id_country_receiver,   
//           						 :ls_branch_pay_receiver, :ls_id_cashier, :ls_name_receiver, :ls_address_receiver,   
//					             :ls_phone1_receiver, :ls_phone2_receiver, :ls_zip_receiver, :ls_notes_receiver,   
// 					             :ld_date_receiver, :lt_time_receiver, :ld_net_amount_receiver, :ld_rate_change_receiver,   
//						          :ld_telex_receiver, :ld_urgency_receiver, :ls_recomend_receiver, :ls_mode_pay_receiver,   
//									 :ls_acc_receiver, :ld_exchange_receiver, :ld_handling_receiver, :ld_total_receiver,   
//           						 :ls_mod_pay_currency, :ld_porc_comision_receiver,  :ld_total_pay_receiver,   
//					             :ls_trans_receiver, :ld_exchange_company, :ld_telex_company, :ld_ref_receiver,   
//           						 :ls_bank_receiver, :ld_total_diference, :ld_total_modo_pago, :ld_commission_payee, 
//									 :ls_tollfree, :ls_pinnumber ;	
//	DO WHILE SQLCA.SQLCODE = 0
//		ll_num_inv ++
//   	string ls_statesender, ls_citysender	
//		// INSERTING SENDER INFORMATION
//		SELECT dba.sender.id_sender, dba.sender.id_branch,   
//		       dba.sender.name_sender, dba.sender.addres_sender,   
//		       dba.sender.phone1_sender, dba.sender.phone2_sender,   
//		       dba.sender.zip_sender, dba.sender.id_city,   
//		       dba.sender.id_state, dba.sender.id_country,   
//		       dba.sender.id_type_id_sender, dba.sender.number_id_sender,
//			   dba.sender.state_sender, dba.sender.city_sender
//		  INTO :ld_id_sender, :ls_id_branch,   
//		       :ls_name_sender, :ls_address_sender,   
//		       :ld_phone1_sender, :ld_phone2_sender,   
//		       :ld_zip_sender, :ls_city,   
//		       :ls_state, :ls_id_country,   
//		       :ls_type_id_sender, :ls_number_id_sender, :ls_statesender, :ls_citysender
//		  FROM dba.sender,   
//		       dba.receiver  
//		 WHERE ( dba.receiver.id_sender = dba.sender.id_sender ) and  
//		       ( dba.receiver.id_branch = dba.sender.id_branch ) and  
//		       ( ( dba.receiver.id_sender = :ld_id_sender ) AND  
//		       ( dba.receiver.id_branch = :ls_id_branch ) AND  
//		       ( dba.receiver.id_receiver = :ld_receiver ) )   ;
//		IF IsNull(ls_address_sender) THEN ls_address_sender = ''
//		IF IsNull(ld_phone1_sender) THEN ld_phone1_sender = 0
//		IF IsNull(ld_phone2_sender) THEN ld_phone2_sender = 0
//		IF IsNull(ld_zip_sender) THEN ld_zip_sender=0
//	   IF IsNull(ls_type_id_sender) THEN ls_type_id_sender=''
//		IF	IsNull(ls_number_id_sender) THEN ls_number_id_sender=''
//		IF	IsNull(ls_statesender) THEN ls_statesender=''
//		IF	IsNull(ls_citysender) THEN ls_citysender=''
//		ls_sql =  'INSERT INTO sender ( id_sender, id_branch, name_sender, addres_sender, phone1_sender, phone2_sender, '
//		ls_sql += 'zip_sender, id_city, id_state, id_country, id_type_id_sender, number_id_sender, state_sender, city_sender) VALUES ('
//		ls_sql += String(ld_id_sender)+",'"+ls_id_branch+"','"+ls_name_sender+"','"+ls_address_sender+"',"+String(ld_phone1_sender)&
//					 +','+String(ld_phone2_sender)+','+String(ld_zip_sender)+",'"+ls_city+"','"+ls_state+"','"+ls_id_country+"','"+&   
//			       ls_type_id_sender+"','"+ls_number_id_sender+"','"+ls_statesender+"','"+ls_citysender+"');"
//		FileWrite(li_file, ls_sql)
//		// INSERTING RECEIVER INFORMATION
//		IF IsNull(ld_id_sender) THEN ld_id_sender=0
//		IF IsNull(ls_id_branch) THEN ls_id_branch=''
//		IF IsNull(ld_receiver) THEN ld_receiver=0
//		IF IsNull(ls_payment) THEN ls_payment=''
//		IF IsNull(ls_curreny) THEN ls_curreny=''
//		IF IsNull(ls_id_flag_receiver) THEN ls_id_flag_receiver=''
//		IF IsNull(ls_id_city_receiver) THEN ls_id_city_receiver=''
//		IF IsNull(ls_id_state_receiver) THEN ls_id_state_receiver=''
//		IF IsNull(ls_id_country_receiver) THEN ls_id_country_receiver=''
//		IF IsNull(ls_branch_pay_receiver) THEN ls_branch_pay_receiver=''
//		IF IsNull(ls_id_cashier) THEN ls_id_cashier=''
//		IF IsNull(ls_name_receiver) THEN ls_name_receiver=''
//		IF IsNull(ls_address_receiver) THEN ls_address_receiver=''
//		IF IsNull(ls_phone1_receiver) THEN ls_phone1_receiver=''
//		IF IsNull(ls_phone2_receiver) THEN ls_phone2_receiver=''
//		IF IsNull(ls_zip_receiver) THEN ls_zip_receiver=''
//		IF IsNull(ls_notes_receiver) THEN ls_notes_receiver=''
////		IF IsNull(ld_date_receiver) THEN ld_date_receiver=today()
////		IF IsNull(lt_time_receiver) THEN lt_time_receiver=now()
//		IF IsNull(ld_net_amount_receiver) THEN ld_net_amount_receiver=0
//		IF IsNull(ld_rate_change_receiver) THEN ld_rate_change_receiver=0
//		IF IsNull(ld_telex_receiver) THEN ld_telex_receiver=0
//		IF IsNull(ld_urgency_receiver) THEN ld_urgency_receiver=0
//		IF IsNull(ls_recomend_receiver) THEN ls_recomend_receiver=''
//		IF IsNull(ls_mode_pay_receiver) THEN ls_mode_pay_receiver=''
//		IF IsNull(ls_acc_receiver) THEN ls_acc_receiver=''
//		IF IsNull(ld_exchange_receiver) THEN ld_exchange_receiver=0
//		IF IsNull(ld_handling_receiver) THEN ld_handling_receiver=0
//		IF IsNull(ld_total_receiver) THEN ld_total_receiver=0
//		IF IsNull(ls_mod_pay_currency) THEN ls_mod_pay_currency=''
//		IF IsNull(ld_porc_comision_receiver) THEN ld_porc_comision_receiver=0
//		IF IsNull(ld_total_pay_receiver) THEN ld_total_pay_receiver=0
//		IF IsNull(ls_trans_receiver) THEN ls_trans_receiver=''
//		IF IsNull(ld_exchange_company) THEN ld_exchange_company=0
//		IF IsNull(ld_telex_company) THEN ld_telex_company=0
//		IF IsNull(ld_ref_receiver) THEN ld_ref_receiver=0
//		IF IsNull(ls_bank_receiver) THEN ls_bank_receiver=''
//		IF IsNull(ld_total_diference) THEN ld_total_diference=0
//		IF IsNull(ld_total_modo_pago) THEN ld_total_modo_pago=0
//		IF IsNull(ld_commission_payee) THEN ld_commission_payee=0
//		IF IsNull(ld_total_modo_pago_comp) THEN ld_total_modo_pago_comp=0
//	   IF IsNull(ls_tollfree) THEN ls_tollfree=''
//		IF IsNull(ls_pinnumber) THEN ls_pinnumber=''
//		ls_sql = "INSERT INTO receiver ( id_sender, id_branch, id_receiver, id_payment, id_curreny, id_flag_receiver, "
//		ls_sql += "id_city_receiver, id_state_receiver, id_country_receiver, branch_pay_receiver, id_cashier, "
//		ls_sql += "name_receiver, address_receiver, phone1_receiver, phone2_receiver, zip_receiver, notes_receiver, "
//		ls_sql += "date_receiver, time_receiver, net_amount_receiver, rate_change_receiver, telex_receiver, "
//		ls_sql += "urgency_receiver, recomend_receiver, mode_pay_receiver, acc_receiver, exchange_receiver, "
//		ls_sql += "handling_receiver, total_receiver, mod_pay_currency, porc_comision_receiver, total_pay_receiver, "
//		ls_sql += "trans_receiver, exchange_company, telex_company, ref_receiver, bank_receiver, total_diference, "
//		ls_sql += "total_modo_pago, commission_payee, total_modo_pago_comp, toll_free, pin_number ) VALUES ("
//		ls_sql += String(ld_id_sender)+",'"+ls_id_branch+"',"+String(ld_receiver)+",'"+ls_payment+"','"+ls_curreny+"','" + &
//					 ls_id_flag_receiver+"','"+ls_id_city_receiver+"','"+ls_id_state_receiver+"','"+ls_id_country_receiver+"','" + &
//					 ls_branch_pay_receiver+"','"+ls_id_cashier+"','"+ls_name_receiver+"','"+ls_address_receiver+"','" + &
//					 ls_phone1_receiver+"','"+ls_phone2_receiver+"','"+ls_zip_receiver+"','"+ls_notes_receiver+"','" + &
//					 String(ld_date_receiver,"yyyy-mm-dd")+"','"+String(lt_time_receiver,"HH:MM:SS")+"',"+ &
//					 String(ld_net_amount_receiver)+","+String(ld_rate_change_receiver)+","+String(ld_telex_receiver)+"," + &
//					 String(ld_urgency_receiver)+",'"+ls_recomend_receiver+"','"+ls_mode_pay_receiver+"','"+ls_acc_receiver+"'," + &
//					 String(ld_exchange_receiver)+","+String(ld_handling_receiver)+","+String(ld_total_receiver)+",'" + &
//					 ls_mod_pay_currency+"',"+String(ld_porc_comision_receiver)+","+String(ld_total_pay_receiver)+",'"+&
//					 ls_trans_receiver+"',"+String(ld_exchange_company)+","+String(ld_telex_company)+","+&
//					 String(ld_ref_receiver)+",'"+ls_bank_receiver+"',"+String(ld_total_diference)+","+&
//					 String(ld_total_modo_pago)+","+String(ld_commission_payee)+","+String(ld_total_modo_pago_comp)+",'"+ls_tollfree+"','"+ls_pinnumber+"');"
//		FileWrite(li_file, ls_sql)
//		FETCH invoice_grupo INTO :ld_id_sender, :ls_id_branch, :ld_receiver, :ls_payment, :ls_curreny,   &
//					             :ls_id_flag_receiver, :ls_id_city_receiver, :ls_id_state_receiver, :ls_id_country_receiver,   &
//           						 :ls_branch_pay_receiver, :ls_id_cashier, :ls_name_receiver, :ls_address_receiver,   &
//					             :ls_phone1_receiver, :ls_phone2_receiver, :ls_zip_receiver, :ls_notes_receiver,   &
// 					             :ld_date_receiver, :lt_time_receiver, :ld_net_amount_receiver, :ld_rate_change_receiver,   &
//						          :ld_telex_receiver, :ld_urgency_receiver, :ls_recomend_receiver, :ls_mode_pay_receiver,   &
//									 :ls_acc_receiver, :ld_exchange_receiver, :ld_handling_receiver, :ld_total_receiver,   &
//           						 :ls_mod_pay_currency, :ld_porc_comision_receiver,  :ld_total_pay_receiver,   &
//					             :ls_trans_receiver, :ld_exchange_company, :ld_telex_company, :ld_ref_receiver, &   
//           						 :ls_bank_receiver, :ld_total_diference, :ld_total_modo_pago, :ld_commission_payee, & 
//									 :ls_tollfree, :ls_pinnumber	;
//	LOOP
//	FileClose(li_file)
//	CLOSE invoice_grupo ;
//  	ls_fileline =  ls_filename+","+ls_branch_old +","+ ls_name_branch +",~""+ls_modem +"~","+ls_tmp+","+ls_tmp1+"," +&
//						"I"+","+String(ll_num_inv)
//	FileWrite(li_file2,ls_fileline)
//	FETCH Grupo INTO :ls_id_branch ;
//	ll_tot_inv += ll_num_inv
//LOOP
//FileClose(li_file2)
//CLOSE Grupo ;
//SetPointer(Arrow!)
//IF ll_tot_inv > 0 THEN
//	MessageBox("Information","The total number of invoices to transmit is "+String(ll_tot_inv)+".",Information!)
//ELSE
//	MessageBox("Atention","There is not invoices to transmit.",Exclamation!)
//	IF NOT Parent.Visible THEN
//		Close(Parent)
//		Return
//	END IF
//	Return
//END IF
//COMMIT ;
//close(w_prepara_giros_para_agente);
end event

type sle_branch from singlelineedit within w_prepara_giros_para_agente
integer x = 416
integer y = 124
integer width = 306
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_prepara_giros_para_agente
integer x = 206
integer y = 124
integer width = 192
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_to from editmask within w_prepara_giros_para_agente
integer x = 416
integer y = 300
integer width = 306
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event losefocus;//dw_1.settransobject(sqlca)
//dw_1.retrieve(sle_grupo.text,date(em_from.text),date(em_to.text))
end event

type em_from from editmask within w_prepara_giros_para_agente
integer x = 416
integer y = 212
integer width = 306
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type st_4 from statictext within w_prepara_giros_para_agente
integer x = 206
integer y = 300
integer width = 192
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "To :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_prepara_giros_para_agente
integer x = 206
integer y = 212
integer width = 192
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "From :"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_prepara_giros_para_agente
integer x = 59
integer y = 36
integer width = 814
integer height = 400
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

