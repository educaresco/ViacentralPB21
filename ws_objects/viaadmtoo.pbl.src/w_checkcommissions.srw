$PBExportHeader$w_checkcommissions.srw
forward
global type w_checkcommissions from wb_report_fechas
end type
type sle_idbranch from singlelineedit within w_checkcommissions
end type
type st_4 from statictext within w_checkcommissions
end type
type cb_1 from commandbutton within w_checkcommissions
end type
type cb_2 from commandbutton within w_checkcommissions
end type
type cb_3 from commandbutton within w_checkcommissions
end type
type cb_crosstab from commandbutton within w_checkcommissions
end type
type cb_addresses from commandbutton within w_checkcommissions
end type
type cb_4 from commandbutton within w_checkcommissions
end type
type cb_create_salesrep from commandbutton within w_checkcommissions
end type
type cb_5 from commandbutton within w_checkcommissions
end type
type cb_6 from commandbutton within w_checkcommissions
end type
type cb_7 from commandbutton within w_checkcommissions
end type
type cb_8 from commandbutton within w_checkcommissions
end type
type cb_10 from commandbutton within w_checkcommissions
end type
type cb_dailysalesrep from commandbutton within w_checkcommissions
end type
type dw_dailysales from datawindow within w_checkcommissions
end type
type dw_dailysalespayer from datawindow within w_checkcommissions
end type
type cb_9 from commandbutton within w_checkcommissions
end type
type cb_11 from commandbutton within w_checkcommissions
end type
type cb_12 from commandbutton within w_checkcommissions
end type
type cb_14 from commandbutton within w_checkcommissions
end type
type cb_15 from commandbutton within w_checkcommissions
end type
type cb_16 from commandbutton within w_checkcommissions
end type
type cb_17 from commandbutton within w_checkcommissions
end type
type cb_13 from commandbutton within w_checkcommissions
end type
type sle_branch from singlelineedit within w_checkcommissions
end type
type sle_receiver from singlelineedit within w_checkcommissions
end type
type cb_18 from commandbutton within w_checkcommissions
end type
type cb_19 from commandbutton within w_checkcommissions
end type
type lb_1 from listbox within w_checkcommissions
end type
type lb_2 from listbox within w_checkcommissions
end type
type cb_20 from commandbutton within w_checkcommissions
end type
type cb_21 from commandbutton within w_checkcommissions
end type
end forward

global type w_checkcommissions from wb_report_fechas
integer width = 2098
integer height = 2376
string title = "Check Commisions"
long backcolor = 80269524
sle_idbranch sle_idbranch
st_4 st_4
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_crosstab cb_crosstab
cb_addresses cb_addresses
cb_4 cb_4
cb_create_salesrep cb_create_salesrep
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_10 cb_10
cb_dailysalesrep cb_dailysalesrep
dw_dailysales dw_dailysales
dw_dailysalespayer dw_dailysalespayer
cb_9 cb_9
cb_11 cb_11
cb_12 cb_12
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
cb_17 cb_17
cb_13 cb_13
sle_branch sle_branch
sle_receiver sle_receiver
cb_18 cb_18
cb_19 cb_19
lb_1 lb_1
lb_2 lb_2
cb_20 cb_20
cb_21 cb_21
end type
global w_checkcommissions w_checkcommissions

on w_checkcommissions.create
int iCurrent
call super::create
this.sle_idbranch=create sle_idbranch
this.st_4=create st_4
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_crosstab=create cb_crosstab
this.cb_addresses=create cb_addresses
this.cb_4=create cb_4
this.cb_create_salesrep=create cb_create_salesrep
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_10=create cb_10
this.cb_dailysalesrep=create cb_dailysalesrep
this.dw_dailysales=create dw_dailysales
this.dw_dailysalespayer=create dw_dailysalespayer
this.cb_9=create cb_9
this.cb_11=create cb_11
this.cb_12=create cb_12
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.cb_17=create cb_17
this.cb_13=create cb_13
this.sle_branch=create sle_branch
this.sle_receiver=create sle_receiver
this.cb_18=create cb_18
this.cb_19=create cb_19
this.lb_1=create lb_1
this.lb_2=create lb_2
this.cb_20=create cb_20
this.cb_21=create cb_21
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_idbranch
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_crosstab
this.Control[iCurrent+7]=this.cb_addresses
this.Control[iCurrent+8]=this.cb_4
this.Control[iCurrent+9]=this.cb_create_salesrep
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.cb_6
this.Control[iCurrent+12]=this.cb_7
this.Control[iCurrent+13]=this.cb_8
this.Control[iCurrent+14]=this.cb_10
this.Control[iCurrent+15]=this.cb_dailysalesrep
this.Control[iCurrent+16]=this.dw_dailysales
this.Control[iCurrent+17]=this.dw_dailysalespayer
this.Control[iCurrent+18]=this.cb_9
this.Control[iCurrent+19]=this.cb_11
this.Control[iCurrent+20]=this.cb_12
this.Control[iCurrent+21]=this.cb_14
this.Control[iCurrent+22]=this.cb_15
this.Control[iCurrent+23]=this.cb_16
this.Control[iCurrent+24]=this.cb_17
this.Control[iCurrent+25]=this.cb_13
this.Control[iCurrent+26]=this.sle_branch
this.Control[iCurrent+27]=this.sle_receiver
this.Control[iCurrent+28]=this.cb_18
this.Control[iCurrent+29]=this.cb_19
this.Control[iCurrent+30]=this.lb_1
this.Control[iCurrent+31]=this.lb_2
this.Control[iCurrent+32]=this.cb_20
this.Control[iCurrent+33]=this.cb_21
end on

on w_checkcommissions.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_idbranch)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_crosstab)
destroy(this.cb_addresses)
destroy(this.cb_4)
destroy(this.cb_create_salesrep)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_10)
destroy(this.cb_dailysalesrep)
destroy(this.dw_dailysales)
destroy(this.dw_dailysalespayer)
destroy(this.cb_9)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.cb_17)
destroy(this.cb_13)
destroy(this.sle_branch)
destroy(this.sle_receiver)
destroy(this.cb_18)
destroy(this.cb_19)
destroy(this.lb_1)
destroy(this.lb_2)
destroy(this.cb_20)
destroy(this.cb_21)
end on

type dw_1 from wb_report_fechas`dw_1 within w_checkcommissions
integer x = 2519
integer y = 1100
integer width = 439
integer height = 268
integer taborder = 0
boolean enabled = false
string dataobject = "dw_checkcommissions"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_checkcommissions
integer x = 1614
integer y = 140
integer width = 416
integer height = 72
integer taborder = 0
end type

type st_1 from wb_report_fechas`st_1 within w_checkcommissions
integer x = 974
integer y = 144
end type

type st_2 from wb_report_fechas`st_2 within w_checkcommissions
integer x = 1266
integer width = 247
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_checkcommissions
integer x = 1536
integer width = 393
integer height = 72
integer taborder = 0
end type

event em_fecha2::modified;return 0
end event

type sle_idbranch from singlelineedit within w_checkcommissions
integer x = 2263
integer y = 28
integer width = 261
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_checkcommissions
integer x = 1952
integer y = 40
integer width = 306
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Id Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_checkcommissions
integer x = 3177
integer y = 56
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Query"
end type

event clicked;dw_1.retrieve(sle_idbranch.text,date(em_fecha1.text),date(em_fecha2.text))
end event

type cb_2 from commandbutton within w_checkcommissions
integer x = 3195
integer y = 172
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Generar Cancelaciones"
end type

event clicked;String	ls_id_branch, ls_name_branch, ls_name_sender, ls_address_sender, ls_city,   &
         ls_id_country, ls_type_id_sender, ls_number_id_sender,  ls_payment,   &
         ls_curreny, ls_id_flag_receiver, ls_id_city_receiver, ls_id_state_receiver,   &
         ls_id_country_receiver, ls_branch_pay_receiver, ls_id_cashier, ls_name_receiver,   &
         ls_address_receiver, ls_phone1_receiver, ls_phone2_receiver, ls_zip_receiver,   &
         ls_notes_receiver, ls_recomend_receiver, ls_mode_pay_receiver, ls_acc_receiver,  & 
			ls_mod_pay_currency, ls_trans_receiver, ls_bank_receiver, ls_state, ls_sql, ls_filename, &
			ls_fecha, ls_hora, ls_tmp, ls_tmp1, ls_modem, ls_branch_old, ls_fileline, ls_tollfree, ls_pinnumber

Double	ld_sender, ld_branch, ld_phone1_sender, ld_phone2_sender, ld_zip_sender, ld_id_sender, ld_receiver,  ld_net_amount_receiver,   &
         ld_rate_change_receiver, ld_telex_receiver, ld_urgency_receiver, ld_exchange_receiver, ld_handling_receiver,   &
         ld_total_receiver, ld_porc_comision_receiver, ld_total_pay_receiver, ld_exchange_company, ld_telex_company,   &
         ld_ref_receiver, ld_total_diference, ld_total_modo_pago, ld_commission_payee, ld_referencia, ld_batch, ld_total_modo_pago_comp, ld_cancelado, ld_receiver1

DateTime 		ld_date_receiver , ld_fecha, lt_time_receiver
Integer	li_file, li_file2
Long		ll_num_inv, ll_tot_inv=0, LL_POS, ll_filenum1
String	ls_grupo, ls_grupo_batch, ls_file_schedule, ls_country

Double	ld_fee_rate, ld_balance, ld_cons

ld_cons = 0

SetPointer(HourGlass!)

string	ls_branch, ls_sender
Date		ld_date
Time		lt_hour
Datetime ld_datetime
long		ll_cont, ll_filenum, ll_filenum2
string	ls_flag, ls_date, ls_time


//ld_fee_rate = 0
//ls_branch   = dw_1.getitemstring(1,"id_branch")
//ld_receiver = dw_1.getitemnumber(1,"id_receiver")
//ls_country  = dw_1.getitemstring(1,"id_country_receiver")
ld_date     = Today()
lt_hour		= Now()
ld_datetime = Datetime(ld_date,lt_hour)
//ls_flag		= dw_1.getitemstring(1,"id_flag_receiver")	

 DECLARE cur_cancelations CURSOR FOR  
  SELECT dba.RECEIVER.ID_SENDER,   
         dba.RECEIVER.ID_BRANCH,   
         dba.RECEIVER.ID_RECEIVER,   
         dba.RECEIVER.id_flag_receiver  
    FROM dba.RECEIVER  
   WHERE ( dba.RECEIVER.DATE_RECEIVER >= '2004-10-15 00:00:00' ) AND  
         ( dba.RECEIVER.id_flag_receiver = 'C' )   
			and dba.RECEIVER.ID_RECEIVER > 0 ;		
//			and id_branch = 'A00315';

open cur_cancelations;

FETCH cur_cancelations INTO :ls_sender, :ls_branch, :ld_receiver, :ls_flag;

DO WHILE SQLCA.SQLCODE = 0

//if ls_flag  <> 'C' then return

//if ld_receiver <= 0 then return

				
	
	//	////////////////////// GENERAR UNA SENTENCIA SQL PARA LAS AGENCIAS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
						

						String is_output
			
							SELECT ISNULL(DIR_OUTPUT,'S:\OUTPUT\')
							  INTO :is_output
							  FROM dba.PARAMETROS;																							

							ls_date = String(Today(), "mmdd")
							ls_time = string(Now(),"HHMM")
							
							ld_receiver1 = ld_receiver
							ld_receiver  = ld_receiver * -1
//							///// Seleccionar los datos del Invoice/ ////////////
			
							  SELECT dba.receiver.id_sender,   
         							dba.receiver.id_branch,   
         							dba.receiver.id_receiver,   
         							dba.receiver.id_payment,   
         							dba.receiver.id_curreny,   
         							dba.receiver.id_flag_receiver,   
         							dba.receiver.id_city_receiver,   
         							dba.receiver.id_state_receiver,   
         							dba.receiver.id_country_receiver,   
        								dba.receiver.branch_pay_receiver,   
        								dba.receiver.id_cashier,   
         							dba.receiver.name_receiver,   
         							dba.receiver.address_receiver,   
         							dba.receiver.phone1_receiver,   
         							dba.receiver.phone2_receiver,   
         							dba.receiver.zip_receiver,   
         							dba.receiver.notes_receiver,   
         							dba.receiver.date_receiver,   
         							dba.receiver.time_receiver,   
         							dba.receiver.net_amount_receiver,   
         							dba.receiver.rate_change_receiver,   
         							dba.receiver.telex_receiver,   
         							dba.receiver.urgency_receiver,   
         							dba.receiver.recomend_receiver,   
         							dba.receiver.mode_pay_receiver,   
         							dba.receiver.acc_receiver,   
         							dba.receiver.exchange_receiver,   
         							dba.receiver.handling_receiver,   
         							dba.receiver.total_receiver,   
         							dba.receiver.mod_pay_currency,   
         							dba.receiver.porc_comision_receiver,   
         							dba.receiver.total_pay_receiver,   
         							dba.receiver.trans_receiver,   
         							dba.receiver.exchange_company,   
         							dba.receiver.telex_company,   
         							dba.receiver.ref_receiver,   
         							dba.receiver.bank_receiver,   
         							dba.receiver.total_diference,   
         							dba.receiver.total_modo_pago,   
         							dba.receiver.commission_payee,   
         							dba.receiver.total_modo_pago_comp,   
         							dba.receiver.toll_free,   
         							dba.receiver.pin_number,
										dba.receiver.fee_rate
    						INTO 		:ld_id_sender,   
         							:ls_id_branch,   
         							:ld_receiver,   
        								:ls_payment,   
         							:ls_curreny,   
         							:ls_id_flag_receiver, 
										:ls_id_city_receiver, 
										:ls_id_state_receiver, 
										:ls_id_country_receiver, 
										:ls_branch_pay_receiver,
         							:ls_id_cashier,   
         							:ls_name_receiver, 
										:ls_address_receiver,
										:ls_phone1_receiver,
										:ls_phone2_receiver,
								   	:ls_zip_receiver,
										:ls_notes_receiver,
					 					:ld_date_receiver,
										:lt_time_receiver,
										:ld_net_amount_receiver,
										:ld_rate_change_receiver,
										:ld_telex_receiver,
										:ld_urgency_receiver,
										:ls_recomend_receiver,
										:ls_mode_pay_receiver,
										:ls_acc_receiver,
										:ld_exchange_receiver,
										:ld_handling_receiver,
										:ld_total_receiver,
										:ls_mod_pay_currency,
										:ld_porc_comision_receiver,
										:ld_total_pay_receiver,
										:ls_trans_receiver,
										:ld_exchange_company,
										:ld_telex_company,
										:ld_ref_receiver,
										:ls_bank_receiver,
										:ld_total_diference,
										:ld_total_modo_pago,
										:ld_commission_payee,
										:ld_total_modo_pago_comp,
										:ls_tollfree,
										:ls_pinnumber,
										:ld_fee_rate
					    FROM dba.receiver  
   					WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         					( dba.receiver.id_receiver = :ld_receiver )   ;
				
							
						/////////////////////////////////////////////
							
							
							////////////////////// proceso de Insertar Cancelaciones .
							//	INSERTING RECEIVER INFORMATION
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
		IF IsNull(ld_fee_rate) THEN ld_fee_rate = 0
		
		      ls_id_branch  = Trim(ls_id_branch)   
      ls_payment  = Trim(ls_payment)   
      ls_curreny  = Trim(ls_curreny)   
      ls_id_flag_receiver  = Trim(ls_id_flag_receiver) 
		ls_id_city_receiver  = Trim(ls_id_city_receiver) 
		ls_id_state_receiver  = Trim(ls_id_state_receiver) 
		ls_id_country_receiver  = Trim(ls_id_country_receiver) 
		ls_branch_pay_receiver  = Trim(ls_branch_pay_receiver)
      ls_id_cashier  = Trim(ls_id_cashier)   
      ls_name_receiver  = Trim(ls_name_receiver) 
		ls_address_receiver  = Trim(ls_address_receiver)
		ls_phone1_receiver  = Trim(ls_phone1_receiver)
		ls_phone2_receiver  = Trim(ls_phone2_receiver)
		ls_zip_receiver  = Trim(ls_zip_receiver)
		ls_notes_receiver  = Trim(ls_notes_receiver)
		ls_recomend_receiver  = Trim(ls_recomend_receiver)
		ls_mode_pay_receiver  = Trim(ls_mode_pay_receiver)
		ls_acc_receiver  = Trim(ls_acc_receiver)
		ls_mod_pay_currency  = Trim(ls_mod_pay_currency)
		ls_trans_receiver  = Trim(ls_trans_receiver)
		ls_bank_receiver  = Trim(ls_bank_receiver)
		ls_tollfree  = Trim(ls_tollfree)
		ls_pinnumber  = Trim(ls_pinnumber)
		
		date	ld_date_receiver1	
		time	lt_time_receiver1
		
		lt_time_receiver1  = Time('11:11:11')					
		ls_trans_receiver = 'T'
		ld_date_receiver1  = date(ld_date_receiver)
		
		
		ls_trans_receiver = 'T'
		
								
								// --------------------------------------------------------------------------
								// Chequea si la agencia no tiene la nueva version
								// Si se le generan los nuevos archivos se dana la agencia con sistema viejo
								Long ll_hasoldversion
								
								SELECT count(*)  
								INTO :ll_hasoldversion  
								FROM dba.VERSION_PROGRAMA  
								WHERE dba.VERSION_PROGRAMA.IB_BRANCH = :ls_branch   ;
								
								If ll_hasoldversion < 1 then


									// old version
									ls_sql = "INSERT INTO receiver ( id_sender, id_branch, id_receiver, id_payment, id_curreny, id_flag_receiver, "
									ls_sql += "id_city_receiver, id_state_receiver, id_country_receiver, branch_pay_receiver, id_cashier, "
									ls_sql += "name_receiver, address_receiver, phone1_receiver, phone2_receiver, zip_receiver, notes_receiver, "
									ls_sql += "date_receiver, time_receiver, net_amount_receiver, rate_change_receiver, telex_receiver, "
									ls_sql += "urgency_receiver, recomend_receiver, mode_pay_receiver, acc_receiver, exchange_receiver, "
									ls_sql += "handling_receiver, total_receiver, mod_pay_currency, porc_comision_receiver, total_pay_receiver, "
									ls_sql += "trans_receiver, exchange_company, telex_company, ref_receiver, bank_receiver, total_diference, "
									ls_sql += "total_modo_pago, commission_payee, total_modo_pago_comp, "
									ls_sql += "inv_sent, cons_closing_agency, cons_closing_payee, cons_closing_both, "
									ls_sql += "rec_code, sus_code, acc_typeid, id_branch_bank, rec_createacc, "
									ls_sql += "rec_synch, rec_folio, acc_routingnumber "																		
									ls_sql += ") VALUES ("+String(ld_id_sender)+",'"+ls_id_branch+"',"+String(ld_receiver)+",'"+ls_payment+"','"+ls_curreny+"','" + &
									ls_id_flag_receiver+"','"+ls_id_city_receiver+"','"+ls_id_state_receiver+"','"+ls_id_country_receiver+"','" + &
									ls_branch_pay_receiver+"','"+"CH1"+"','"+ls_name_receiver+"','"+ls_address_receiver+"','" + &
									ls_phone1_receiver+"','"+ls_phone2_receiver+"','"+ls_zip_receiver+"','"+ls_notes_receiver+"','" + &
									String(ld_date_receiver,"yyyy-mm-dd")+"','"+String(lt_time_receiver,"HH:MM:SS")+"',"+ &
									String(ld_net_amount_receiver)+","+String(ld_rate_change_receiver)+","+String(ld_telex_receiver)+"," + &
									String(ld_urgency_receiver)+",'"+ls_recomend_receiver+"','"+ls_mode_pay_receiver+"','"+ls_acc_receiver+"'," + &
									String(ld_exchange_receiver)+","+String(ld_handling_receiver)+","+String(ld_total_receiver)+",'" + &
									ls_mod_pay_currency+"',"+String(ld_porc_comision_receiver)+","+String(ld_total_pay_receiver)+",'"+&
									ls_trans_receiver+"',"+String(ld_exchange_company)+","+String(ld_telex_company)+","+&
									String(ld_ref_receiver)+",'"+ls_bank_receiver+"',"+String(ld_total_diference)+","+&
									String(ld_total_modo_pago)+","+String(ld_commission_payee)+","+String(ld_total_modo_pago_comp)+","+&
									"'N',0,0,0,0,'','','','N','N','-1','N');"
								
								else
								
									// MTSA Version
									ls_sql = "INSERT INTO receiver ( id_sender, id_branch, id_receiver, id_payment, id_curreny, id_flag_receiver, "
									ls_sql += "id_city_receiver, id_state_receiver, id_country_receiver, branch_pay_receiver, id_cashier, "
									ls_sql += "name_receiver, address_receiver, phone1_receiver, phone2_receiver, zip_receiver, notes_receiver, "
									ls_sql += "date_receiver, time_receiver, net_amount_receiver, rate_change_receiver, telex_receiver, "
									ls_sql += "urgency_receiver, recomend_receiver, mode_pay_receiver, acc_receiver, exchange_receiver, "
									ls_sql += "handling_receiver, total_receiver, mod_pay_currency, porc_comision_receiver, total_pay_receiver, "
									ls_sql += "trans_receiver, exchange_company, telex_company, ref_receiver, bank_receiver, total_diference, "
									ls_sql += "total_modo_pago, commission_payee, total_modo_pago_comp, toll_free, pin_number ,status_pago_payee, status_pago_agent, date_trans_payee, clave_receiver, fee_rate ) VALUES ("
									ls_sql += String(ld_id_sender)+",'"+ls_id_branch+"',"+String(ld_receiver)+",'"+ls_payment+"','"+ls_curreny+"','" + &
									ls_id_flag_receiver+"','"+ls_id_city_receiver+"','"+ls_id_state_receiver+"','"+ls_id_country_receiver+"','" + &
									ls_branch_pay_receiver+"','"+"CH1"+"','"+ls_name_receiver+"','"+ls_address_receiver+"','" + &
									ls_phone1_receiver+"','"+ls_phone2_receiver+"','"+ls_zip_receiver+"','"+ls_notes_receiver+"','" + &
									String(ld_date_receiver,"yyyy-mm-dd")+"','"+String(lt_time_receiver,"HH:MM:SS")+"',"+ &
									String(ld_net_amount_receiver)+","+String(ld_rate_change_receiver)+","+String(ld_telex_receiver)+"," + &
									String(ld_urgency_receiver)+",'"+ls_recomend_receiver+"','"+ls_mode_pay_receiver+"','"+ls_acc_receiver+"'," + &
									String(ld_exchange_receiver)+","+String(ld_handling_receiver)+","+String(ld_total_receiver)+",'" + &
									ls_mod_pay_currency+"',"+String(ld_porc_comision_receiver)+","+String(ld_total_pay_receiver)+",'"+&
									ls_trans_receiver+"',"+String(ld_exchange_company)+","+String(ld_telex_company)+","+&
									String(ld_ref_receiver)+",'"+ls_bank_receiver+"',"+String(ld_total_diference)+","+&
									String(ld_total_modo_pago)+","+String(ld_commission_payee)+","+String(ld_total_modo_pago_comp)+",'"+ls_tollfree+"','"+ls_pinnumber+"','U','U',NULL,''," + string(ld_fee_rate) + ");"
	
								end if
								// --------------------------------------------------------------------------								

								ls_filename=TRIM(is_output)+'CAN'+Fill('0',10 - Len(TRIM(ls_id_branch)))+TRIM(ls_id_branch)+".sql"
								ll_filenum1=FileOpen(ls_filename, LineMode!, Write!, LockWrite!, Append!)
								FileWrite (ll_filenum1,"UPDATE receiver SET id_flag_receiver = 'C'  WHERE ( receiver.id_branch = '"+ls_id_branch+"' AND  receiver.id_receiver = "+string(ld_receiver * -1)+" )   ;")
								FileWrite (ll_filenum1,ls_sql)
								FileClose (ll_filenum1)
								
FETCH cur_cancelations INTO :ls_sender, :ls_branch, :ld_receiver, :ls_flag;
LOOP;
							
close cur_cancelations;


end event

type cb_3 from commandbutton within w_checkcommissions
integer x = 3195
integer y = 320
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Insertar Wires de GP"
end type

event clicked;SetPointer(HourGlass!)


Double ls_cons_trans_diaria
Long ll_current
Double ld_tran_amt
DateTime ld_tran_date
String ld_id_gp, ls_group


ll_current = 0
 
 DECLARE cur_wires CURSOR FOR  
  SELECT dba.gp_temp2004wires.id_gp,   
         dba.gp_temp2004wires.tran_datedate,   
         dba.gp_temp2004wires.tran_amt  
    FROM dba.gp_temp2004wires  
   WHERE dba.gp_temp2004wires.isapplied = 'N'   
	AND dba.gp_temp2004wires.id_gp IN (SELECT dba.GP_GROUP_BRANCH.id_gp FROM dba.GP_GROUP_BRANCH);

OPEN cur_wires;

FETCH cur_wires INTO :ld_id_gp, :ld_tran_date, :ld_tran_amt;

DO WHILE SQLCA.SQLCODE = 0

	SELECT MAX(CONS_TRANS_DIARIA)
	INTO :ls_cons_trans_diaria
	FROM dba.transaccion_diaria_payee;

	IF SQLCA.SQLCODE <> 0 THEN
		messagebox("Error",SQLCA.SQLErrText)
		return
	END IF


	ls_cons_trans_diaria = ls_cons_trans_diaria + 1

	SELECT dba.GP_GROUP_BRANCH.ID_MAIN_BRANCH 
	INTO :ls_group
	FROM dba.GP_GROUP_BRANCH 
	WHERE id_gp = :ld_id_gp;

	IF SQLCA.SQLCODE <> 0 THEN
		messagebox("Error",SQLCA.SQLErrText)
		return
	END IF


	INSERT INTO transaccion_diaria_payee VALUES (
	:ls_cons_trans_diaria,
	:ls_group,
	:ld_tran_date,
	:ld_tran_date,
	'DP   ',
	'GP TRANS. FOR '+:ld_id_gp,
	:ld_tran_amt,
	0,
	0,
	NULL,
	NULL,
	NULL,
	:ld_tran_date,
	'ADM',
	NULL,
	NULL,
	NULL);
	
	IF SQLCA.SQLCODE <> 0 THEN
		messagebox("Error",SQLCA.SQLErrText)
		return
	END IF

	ll_current++
	this.text = "Record "+string(ll_current)

	FETCH cur_wires INTO :ld_id_gp, :ld_tran_date, :ld_tran_amt;
LOOP

CLOSE cur_wires;


UPDATE dba.gp_temp2004wires SET dba.gp_temp2004wires.isapplied = 'Y'
WHERE dba.gp_temp2004wires.isapplied = 'N'
AND dba.gp_temp2004wires.id_gp IN (SELECT dba.GP_GROUP_BRANCH.id_gp FROM dba.GP_GROUP_BRANCH);


COMMIT;


SetPointer(Arrow!)
end event

type cb_crosstab from commandbutton within w_checkcommissions
integer x = 3195
integer y = 468
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "CrosstabReport1"
end type

event clicked;SetPointer(HourGlass!)

string ls_group, ls_groupname, ls_linea, ls_linea1
date ld_date
datetime ld_datetime1, ld_datetime2
double ld_invoices, ld_amount
long ll_filenum, ll_filenum1

ld_date = date('11/01/2003')

ll_filenum=FileOpen('c:\reportbydateandpayoramts.csv', LineMode!, Write!, LockWrite!, Replace!)
ll_filenum1=FileOpen('c:\reportbydateandpayorcnts.csv', LineMode!, Write!, LockWrite!, Replace!)

ls_linea = 'DATE,'

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Titles
DECLARE cur_groupstitles CURSOR FOR  
SELECT distinct RTRIM(dba.GROUP_BRANCH.NAME_MAIN_BRANCH) + ' - ' + rtrim(dba.GROUP_BRANCH.ID_MAIN_BRANCH),
		 dba.GROUP_BRANCH.ID_MAIN_BRANCH
FROM dba.BRANCH,   
	  dba.GROUP_BRANCH,   
	  dba.RECEIVER  
WHERE ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH ) AND  
			( dba.RECEIVER.BRANCH_PAY_RECEIVER = dba.BRANCH.ID_BRANCH ) AND 
			( dba.RECEIVER.id_flag_receiver <> 'A' ) AND  
			( dba.RECEIVER.id_flag_receiver <> 'C' ) AND  
			( dba.RECEIVER.DATE_RECEIVER >= '2003-11-01 00:00:00' ) AND  
			( dba.RECEIVER.DATE_RECEIVER <= '2004-10-31 23:59:59' )
ORDER BY 2;

OPEN cur_groupstitles;
FETCH cur_groupstitles INTO :ls_groupname, :ls_group;
DO WHILE SQLCA.SQLCODE = 0
	ls_linea = ls_linea + ls_groupname + ','				
	FETCH cur_groupstitles INTO :ls_groupname, :ls_group;
LOOP
CLOSE cur_groupstitles;

FileWrite (ll_filenum,ls_linea)
FileWrite (ll_filenum1,ls_linea)
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


// =========================================================================
// Ciclo Dias
DO WHILE ld_date < date('11/01/2004')
	 
	ls_linea = string(ld_date,'mm/dd/yyyy')+','
	ls_linea1 = string(ld_date,'mm/dd/yyyy')+','	

	//===================================================
	// Ciclo Grupos	
	DECLARE cur_groups CURSOR FOR  
	SELECT distinct dba.BRANCH.ID_MAIN_BRANCH
	FROM dba.BRANCH,   
		  dba.RECEIVER  
	WHERE 	( dba.RECEIVER.BRANCH_PAY_RECEIVER = dba.BRANCH.ID_BRANCH ) AND 
				( dba.RECEIVER.id_flag_receiver <> 'A' ) AND  
				( dba.RECEIVER.id_flag_receiver <> 'C' ) AND  
				( dba.RECEIVER.DATE_RECEIVER >= '2003-11-01 00:00:00' ) AND  
				( dba.RECEIVER.DATE_RECEIVER <= '2004-10-31 23:59:59' )
	ORDER BY 1;
	
	OPEN cur_groups;
	FETCH cur_groups INTO :ls_group;
	DO WHILE SQLCA.SQLCODE = 0
	
		ld_datetime1 = datetime(ld_date,time('00:00:00'))
		ld_datetime2 = datetime(ld_date,time('23:59:59'))
	
		SELECT  count(*) as CountInvoices,   
		round(sum(net_amount_receiver),2) as SumAmount 
		INTO :ld_invoices, :ld_amount
		FROM dba.BRANCH, 					
		dba.RECEIVER  
		WHERE ( dba.RECEIVER.BRANCH_PAY_RECEIVER = dba.BRANCH.ID_BRANCH ) AND
		( dba.BRANCH.ID_MAIN_BRANCH = :ls_group ) AND
		( dba.RECEIVER.id_flag_receiver <> 'A' ) AND  
		( dba.RECEIVER.id_flag_receiver <> 'C' ) AND  
		( dba.RECEIVER.DATE_RECEIVER >= :ld_datetime1 ) AND  
		( dba.RECEIVER.DATE_RECEIVER <= :ld_datetime2 );		
				
		if isnull(ld_invoices) then ld_invoices = 0
		if isnull(ld_amount) then ld_amount = 0
		
		//ls_linea = ls_linea + string(ld_amount) + ' (' + string(ld_invoices) + ') for '+trim(ls_group)+','
		ls_linea = ls_linea + string(ld_amount) + ',' 
		ls_linea1 = ls_linea1 + string(ld_invoices) + ',' 
		
		FETCH cur_groups INTO :ls_group;
	LOOP
	CLOSE cur_groups;
	// Ciclo Grupos
	//===================================================
	
	FileWrite (ll_filenum,ls_linea)		
	FileWrite (ll_filenum1,ls_linea1)			
	this.text = string(ld_date,"mm/dd/yyyy")
	ld_date = relativedate(ld_date,1)
	

LOOP
// Ciclo Dias
// =========================================================================

FileClose (ll_filenum)
FileClose (ll_filenum1)
SetPointer(Arrow!)
end event

type cb_addresses from commandbutton within w_checkcommissions
integer x = 3195
integer y = 616
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Addresses"
end type

event clicked;SetPointer(HourGlass!)

string ls_branch, ls_validaddress, ls_newcity, ls_trimedvalidaddress, ls_newguess
double ld_sender
long i, posi, posj

i = 0
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Titles
DECLARE cur_senderaddress CURSOR FOR  
  SELECT dba.SENDER_VALIDADDRESSES.id_branch,   
         dba.SENDER_VALIDADDRESSES.id_sender,   
         dba.SENDER_VALIDADDRESSES.validaddress  
    FROM dba.SENDER_VALIDADDRESSES  
   WHERE dba.SENDER_VALIDADDRESSES.finaladdress is null and computedcity is null;

OPEN cur_senderaddress;
FETCH cur_senderaddress INTO :ls_branch, :ld_sender, :ls_validaddress;
//DO WHILE SQLCA.SQLCODE = 0 and i < 150
DO WHILE SQLCA.SQLCODE = 0

	i++

	this.text = trim(ls_branch)+'-'+string(ld_sender)
	
	if trim(ls_validaddress) = "Malformed Answer" then
		ls_newcity = "Not Found"
	elseif mid(ls_validaddress,1,18) = "<No Address Found>" then
		ls_newcity = mid(ls_validaddress, 20, pos(ls_validaddress,',',1)-20)
	elseif ls_validaddress = "Not Found" then 
		ls_newcity = "Not Found"
	else
		setnull(ls_newcity)

//		ls_trimedvalidaddress = mid(ls_validaddress, 1, pos(ls_validaddress,',',1)-1)

//		select min(name_city)
//		into :ls_newcity
//		from dba.city
//		where upper(:ls_validaddress) like '%'+upper(rtrim(str_replace(str_replace(name_city,'[',''),']','')))+'%';		

		if isnull(ls_newcity) then
			// Escoge la ultima palabra antes de la coma!
			ls_newcity = mid(ls_validaddress, 1, pos(ls_validaddress,',')-1)	

//			posj = 1
//			posi = pos(ls_newcity,' ',1)
//			do while posi > 0
//				posj = posi
//				posi = pos(ls_newcity,' ',posi+1)
//			loop
//			ls_newcity = mid(ls_newcity,posj)	

			// cuenta cuantas palabras hay
			posj = 1
			posi = pos(ls_newcity,' ',1)
			do while posi > 0
				posj++
				posi = pos(ls_newcity,' ',posi+1)
			loop

			// La ultima palabra
			ls_newguess = upper(trim(fn_token(ls_newcity,' ',posj)))
			if ls_newguess = 'BEACH' then ls_newguess = upper(trim(fn_token(ls_newcity,' ',posj -1))) + ' ' + ls_newguess
			if ls_newguess = 'GABLES' then ls_newguess = upper(trim(fn_token(ls_newcity,' ',posj -1))) + ' ' + ls_newguess			
			if ls_newguess = 'SPRINGS' then ls_newguess = upper(trim(fn_token(ls_newcity,' ',posj -1))) + ' ' + ls_newguess			
			if ls_newguess = 'YORK' then ls_newguess = upper(trim(fn_token(ls_newcity,' ',posj -1))) + ' ' + ls_newguess
			if ls_newguess = 'PARK' then ls_newguess = upper(trim(fn_token(ls_newcity,' ',posj -1))) + ' ' + ls_newguess
			
			ls_newcity = ls_newguess

			// busca la ultima palabra antes de la , en la tabla de ciudades con un =
			setnull(ls_newguess)
			select min(name_city)
			into :ls_newguess
			from dba.city
			where id_country = 'USA'
			and upper(rtrim(str_replace(name_city,' ',''))) = upper(rtrim(str_replace(:ls_newcity,' ','')));

			// busca la ultima palabra antes de la , en la tabla de ciudades con un like
			if isnull(ls_newguess) then
				select min(name_city)
				into :ls_newguess
				from dba.city
				where id_country = 'USA'
				and upper(rtrim(str_replace(str_replace(name_city,'[',''),']',''))) like '%'+upper(:ls_newcity)+'%';
			end if

			if not isnull(ls_newguess) then ls_newcity = ls_newguess

		end if

	end if

	ls_newcity = upper(trim(ls_newcity))

	update dba.SENDER_VALIDADDRESSES 
	set computedcity = :ls_newcity 
	where id_branch = :ls_branch
   and id_sender = :ld_sender;

	FETCH cur_senderaddress INTO :ls_branch, :ld_sender, :ls_validaddress;
LOOP
CLOSE cur_senderaddress;

commit;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
this.text = 'Done'

SetPointer(Arrow!)
end event

type cb_4 from commandbutton within w_checkcommissions
integer x = 3195
integer y = 764
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re-Calculate Payer Comm."
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, ld_porcentaje, ld_balance = 0

Date			ld_date
Datetime		ld_from, ld_to

string		ls_group,				&
				ls_group_payee, 		&
				ls_mod_pay_currency, &
				ls_country,				&
				ls_branch, 				&
				ls_modo_pago, 			&
				ls_country_sender,	&
				ls_state_sender,		&
				ls_city_receiver


time			ld_time = Now()
datetime    ld_datetime
long 			ll_cont, ll_cont1

Double		ld_cons_trans_diaria, 		&
				ld_valor_comision_fijo, 	&
				ld_diference,					&
				ld_porc_modo_pago  = 0,		&
				ld_telex_modo_pago = 0,		&
				ld_valor_modo_pago = 0,		&
				ld_valor_group_state = 0,	&
				ld_telex_group_state = 0,	&
				ld_porc_group_state = 0,   &
				ld_total_group_city  = 0


Setpointer(Hourglass!)
Commit ;

	//ld_date = today()
	ld_date = relativedate(today(),-1)
	ld_from 	= datetime(relativedate(today(),-150),time('00:00:00'))
	ld_to   	= datetime(today(),time('23:59:59'))
		
		
		//????????????
		
	long ll_conta	, ll_current	
		
 	 SELECT count(*)
	  into :ll_conta
    FROM   dba.receiver,   
           dba.branch  
    WHERE  ( dba.branch.id_branch = dba.receiver.branch_pay_receiver ) and
			  ( dba.receiver.date_trans_payee >= :ld_from ) AND
			  ( dba.receiver.date_trans_payee <= :ld_to )    AND  
			  ( dba.receiver.ref_receiver > 0 ) AND
			  ( dba.receiver.id_receiver > 0 ) AND
			  ( dba.receiver.id_flag_receiver in ('T','P','C') )  ;		
		
		//????????????
		
		
	 DECLARE commision_payee CURSOR FOR  
 	 SELECT dba.receiver.id_country_receiver,   
           dba.branch.id_main_branch,   
           dba.receiver.net_amount_receiver,   
           dba.receiver.mod_pay_currency,
			  dba.receiver.id_branch,
			  dba.receiver.id_receiver,
			  dba.receiver.mode_pay_receiver,
			  dba.receiver.id_city_receiver  
    FROM   dba.receiver,   
           dba.branch  
    WHERE  ( dba.branch.id_branch = dba.receiver.branch_pay_receiver ) and
			  ( dba.receiver.date_trans_payee >= :ld_from ) AND
			  ( dba.receiver.date_trans_payee <= :ld_to )    AND  
			  ( dba.receiver.ref_receiver > 0 ) AND
			  ( dba.receiver.id_receiver > 0 ) AND
			  ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			  ( dba.branch.id_main_branch IN ('T055') );
			  
		If sqlca.sqlcode < 0 then
			messagebox("Error","Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if
		
	
	ll_current = 0
	
	Open  commision_payee;
	
	Fetch  commision_payee into :ls_country, :ls_group_payee, :ld_amount, :ls_mod_pay_currency, :ls_branch, :id_receiver, :ls_modo_pago, :ls_city_receiver ;

	DO WHILE SQLCA.sqlcode = 0
		
		
		this.text = trim(ls_branch)+"-"+string(id_receiver)
		
		ll_current ++
		
		   SELECT dba.branch.id_country,   
         		dba.branch.id_state  
    		INTO :ls_country_sender,   
         	  :ls_state_sender  
    		FROM dba.branch  
   		WHERE dba.branch.id_branch = :ls_branch   ;

		if ld_amount < 0 then
			ld_amount              = ld_amount  * -1
			ld_porc_modo_pago      = fn_comision_modo_pago_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_modo_pago     = fn_comision_modo_pago_fija_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_valor_modo_pago     = ld_porc_modo_pago + ld_telex_modo_pago 
			
			//ld_porcentaje          = fn_comision_grupo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			//ld_valor_comision_fijo = fn_comision_grupo_fijo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_porcentaje          = fn_comision_grupo2(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency,ls_modo_pago,'%')
			ld_valor_comision_fijo = fn_comision_grupo2(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency,ls_modo_pago,'F')			
			
			
			ld_porc_group_state    = fn_comision_group_state(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_group_state   = fn_comision_group_state_fijo(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_valor_group_state   = ld_porc_group_state + ld_telex_group_state
			ld_total_group_city    = fn_comision_group_city(ls_group_payee,ls_city_receiver,ls_modo_pago,ld_amount)
			
			ld_comision            = (ld_amount * ld_porcentaje * -1) - ld_valor_comision_fijo - ld_valor_modo_pago - ld_valor_group_state - ld_total_group_city
		else
			ld_porc_modo_pago      = fn_comision_modo_pago_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_modo_pago     = fn_comision_modo_pago_fija_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)

			//ld_porcentaje          = fn_comision_grupo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			//ld_valor_comision_fijo = fn_comision_grupo_fijo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_porcentaje          = fn_comision_grupo2(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency,ls_modo_pago,'%')
			ld_valor_comision_fijo = fn_comision_grupo2(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency,ls_modo_pago,'F')
			
			ld_valor_modo_pago     = ld_porc_modo_pago   + ld_telex_modo_pago 
			ld_porc_group_state    = fn_comision_group_state(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_group_state   = fn_comision_group_state_fijo(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_valor_group_state   = ld_porc_group_state + ld_telex_group_state
			ld_total_group_city    = fn_comision_group_city(ls_group_payee,ls_city_receiver,ls_modo_pago,ld_amount)
			
			
			ld_comision            = (ld_amount * ld_porcentaje) + ld_valor_comision_fijo + ld_valor_modo_pago + ld_valor_group_state + ld_total_group_city
			ld_comision = round(ld_comision,4)
		end if

			UPDATE  dba.receiver  
   	  	SET     dba.receiver.commission_payee = :ld_comision  
   	  	WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
           	   ( dba.receiver.id_receiver = :id_receiver )   ;
				  
			If sqlca.sqlcode < 0 then
				messagebox("Error","Error: SQL Sentence"+sqlca.sqlerrtext)
				rollback;
				return
			end if
		
		
		this.text = string(ll_current)+"/"+string(ll_conta)
		
	 Fetch  commision_payee into :ls_country, :ls_group_payee, :ld_amount, :ls_mod_pay_currency, :ls_branch, :id_receiver, :ls_modo_pago, :ls_city_receiver ;
	LOOP

	CLOSE commision_payee;
	
	Commit;
		
	
	this.text = "Done!"
	
Setpointer(Arrow!)
end event

type cb_create_salesrep from commandbutton within w_checkcommissions
integer x = 2478
integer y = 312
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Weekly Sales Report"
end type

event clicked;Setpointer(Hourglass!)

date ld_currdate, ld_initial_sunday
datetime ld_week_date, ld_week_dateend
string ls_id_branch, ls_name_branch, ls_id_agent, ls_name_agent, ls_id_state
double ld_net_trans, ld_per_growing, ld_prev_net_trans

Messagebox("","Acordarse de borrar los cvs de los vendedores")

delete from dba.HISTORY_WEEKLY_NETTRANS;

commit;

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Determina el domingo inicial
string day_name
ld_initial_sunday = today() 
day_name = DayName(ld_initial_sunday)

do while (mid(upper(day_name),1,2) <> 'SU')
	ld_initial_sunday = relativedate(ld_initial_sunday,-1)
	day_name = DayName(ld_initial_sunday)
loop

ld_initial_sunday = relativedate(ld_initial_sunday,-16*7)

//messagebox("",string(ld_initial_sunday,'yyyy-mm-dd'))
//return 
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//ld_initial_sunday = date('2004-12-05')
//ld_initial_sunday = date('2004-09-26')

ld_currdate = ld_initial_sunday
ld_prev_net_trans = 0

do while relativedate(ld_currdate,7) < today()
	
	//messagebox("",string(ld_currdate))
	ld_week_date = datetime(ld_currdate,time('00:00:00'))
	ld_week_dateend = datetime(relativedate(ld_currdate,7),time('00:00:00'))

	declare cur_branch cursor for
	SELECT dba.BRANCH.ID_BRANCH,   
			 dba.BRANCH.NAME_BRANCH,
			 dba.BRANCH.ID_STATE,
			 sum(id_receiver/abs(id_receiver)) as Transactions  
	FROM 	dba.BRANCH,   
			dba.RECEIVER  
	WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.ID_BRANCH ) AND
	      ( dba.RECEIVER.id_flag_receiver <> 'A' ) AND  
	      ( dba.RECEIVER.DATE_RECEIVER >= :ld_week_date ) AND  
	      ( dba.RECEIVER.DATE_RECEIVER < :ld_week_dateend ) AND
			( dba.BRANCH.id_flag_branch = 'A' )
	GROUP BY dba.BRANCH.ID_BRANCH,   
			   dba.BRANCH.NAME_BRANCH,
				dba.BRANCH.ID_STATE;
				
	open cur_branch;

	FETCH cur_branch INTO :ls_id_branch, :ls_name_branch, :ls_id_state, :ld_net_trans;
	DO WHILE SQLCA.SQLCODE = 0
		
		SELECT dba.AGENT.ID_AGENT,   
				 dba.AGENT.NAME_AGENT  
		INTO 	:ls_id_agent,   
				:ls_name_agent  
		FROM 	dba.AGENT,   
				dba.BRANCH_AGENT  
		WHERE ( dba.BRANCH_AGENT.ID_AGENT = dba.AGENT.ID_AGENT ) and  
				( dba.BRANCH_AGENT.ID_BRANCH = :ls_id_branch );

		if isnull(ls_id_agent) then
			ls_id_agent = ''
			ls_name_agent = 'UNASSIGNED'
		end if
		
		INSERT INTO dba.HISTORY_WEEKLY_NETTRANS  
		( week_date,   
		id_branch,   
		name_branch,   
		id_agent,   
		name_agent,   
		id_state,   
		net_trans,   
		per_growing )  
		VALUES ( 
		:ld_week_date,   
		:ls_id_branch,   
		:ls_name_branch,   
		:ls_id_agent,   
		:ls_name_agent,   
		:ls_id_state,   
		:ld_net_trans,   
		0 );
		

		FETCH cur_branch INTO :ls_id_branch, :ls_name_branch, :ls_id_state, :ld_net_trans;		
	LOOP				
			
	close cur_branch;
	
	ld_prev_net_trans = ld_net_trans
	ld_currdate = relativedate(ld_currdate,7)
loop

commit;


SetPointer(HourGlass!)

string ls_linea, ls_lineaTitles
long ll_filenum, ll_filenumA
string ls_VendorFile

ll_filenum=FileOpen('c:\SalesReport.csv', LineMode!, Write!, LockWrite!, Replace!)

ld_currdate = ld_initial_sunday

ls_linea = 'AGENCY,SALESREP,STATE,'

//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Titles
do while relativedate(ld_currdate,7) < today()
	ls_linea = ls_linea + string(ld_currdate,"mm/dd/yyyy")+"-"+string(relativedate(ld_currdate,6),"mm/dd/yyyy") + ","
	ld_currdate = relativedate(ld_currdate,7)
loop
ls_lineaTitles = ls_linea
FileWrite (ll_filenum,ls_linea)
//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ls_linea = ''

//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Records
declare cur_branches cursor for
SELECT DISTINCT ID_BRANCH,
					 name_branch,    
					 name_agent,   
					 id_state
FROM dba.HISTORY_WEEKLY_NETTRANS
ORDER BY NAME_BRANCH;

open cur_branches;
FETCH cur_branches INTO :ls_id_branch, :ls_name_branch, :ls_name_agent, :ls_id_state;		
DO WHILE SQLCA.SQLCODE = 0			

	ls_linea = char(34) + ls_name_branch + char(34) + ',' + char(34) + ls_name_agent + char(34) + ',' + ls_id_state + ','
	ld_currdate = ld_initial_sunday

	//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// Dias
	do while relativedate(ld_currdate,7) < today()
	
		ld_week_date = datetime(ld_currdate,time('00:00:00'))
	
		SELECT    
		dba.HISTORY_WEEKLY_NETTRANS.net_trans,   
		dba.HISTORY_WEEKLY_NETTRANS.per_growing  
		INTO 
		:ld_net_trans,   
		:ld_per_growing
		FROM dba.HISTORY_WEEKLY_NETTRANS 
		WHERE week_date = :ld_week_date
		AND id_branch = :ls_id_branch;
		
		if SQLCA.SQLCode <> 0 then
			ld_net_trans = 0
		end if
	
		if isnull(ld_net_trans) then ld_net_trans = 0
		
		//ls_linea = ls_linea + string(ld_currdate,"mm/dd/yyyy") +">>"+ string(ld_net_trans) + ','
		ls_linea = ls_linea + string(ld_net_trans) + ','

		ld_currdate = relativedate(ld_currdate,7)
	loop
	//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	ls_VendorFile = "C:\"+trim(fn_replace(ls_name_agent," ",""))+".csv"
	
	// {Begin Archivo por vendedor}
	if not fileexists(ls_VendorFile) then
		ll_filenumA = FileOpen(ls_VendorFile, LineMode!, Write!, LockWrite!, Append!)
		FileWrite (ll_filenumA,ls_lineaTitles)
		FileClose(ll_filenumA)		
	end if

	ll_filenumA = FileOpen(ls_VendorFile, LineMode!, Write!, LockWrite!, Append!)
	FileWrite (ll_filenumA,ls_linea)
	FileClose(ll_filenumA)
	// {End Archivo por vendedor}
	
	FileWrite (ll_filenum,ls_linea)

	FETCH cur_branches INTO :ls_id_branch, :ls_name_branch, :ls_name_agent, :ls_id_state;		
LOOP
close cur_branches;	

//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


FileClose (ll_filenum)
Setpointer(Arrow!)
end event

type cb_5 from commandbutton within w_checkcommissions
integer width = 667
integer height = 108
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "WSR ONLINE"
end type

event clicked;Setpointer(Hourglass!)

date ld_currdate, ld_initial_sunday
datetime ld_week_date, ld_week_dateend
string ls_id_branch, ls_name_branch, ls_id_agent, ls_name_agent, ls_id_state, ls_sql, ls_net_trans
string ls_lastdate
double ld_net_trans, ld_per_growing, ld_prev_net_trans
long ll_cont, ll_week


delete from DBA.REP_SALES16WEEKS;
commit;

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Determina el domingo inicial
string day_name
ld_initial_sunday = today() 
day_name = DayName(ld_initial_sunday)

do while (mid(upper(day_name),1,2) <> 'SU')
	ld_initial_sunday = relativedate(ld_initial_sunday,-1)
	day_name = DayName(ld_initial_sunday)
loop

ld_initial_sunday = relativedate(ld_initial_sunday,-16*7)

//messagebox("",string(ld_initial_sunday,'yyyy-mm-dd'))
//return 
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//ld_initial_sunday = date('2004-12-05')
//ld_initial_sunday = date('2004-09-26')

ld_currdate = ld_initial_sunday
ld_prev_net_trans = 0
ll_week = 1

do while relativedate(ld_currdate,7) < today()
	
	//messagebox("",string(ld_currdate))
	ld_week_date = datetime(ld_currdate,time('23:59:59'))
	ld_week_dateend = datetime(relativedate(ld_currdate,7),time('23:59:59'))

	declare cur_branch cursor for
	SELECT dba.BRANCH.ID_BRANCH,   
			 rtrim(dba.BRANCH.NAME_BRANCH) + CASE ID_STATUS_BRANCH WHEN 'C' THEN ' - CLOSED' ELSE CASE ID_FLAG_BRANCH WHEN 'I' THEN ' - INACTIVE' ELSE '' END END,
			 dba.BRANCH.ID_STATE,
			 sum(id_receiver/abs(id_receiver)) as Transactions  
	FROM 	dba.BRANCH,   
			dba.RECEIVER  
	WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.ID_BRANCH ) AND
	      ( dba.RECEIVER.id_flag_receiver <> 'A' ) AND  
	      ( dba.RECEIVER.DATE_RECEIVER > :ld_week_date ) AND  
	      ( dba.RECEIVER.DATE_RECEIVER <= :ld_week_dateend )
	GROUP BY dba.BRANCH.ID_BRANCH,
			   rtrim(dba.BRANCH.NAME_BRANCH) + CASE ID_STATUS_BRANCH WHEN 'C' THEN ' - CLOSED' ELSE CASE ID_FLAG_BRANCH WHEN 'I' THEN ' - INACTIVE' ELSE '' END END,
				dba.BRANCH.ID_STATE;
				
	open cur_branch;

	FETCH cur_branch INTO :ls_id_branch, :ls_name_branch, :ls_id_state, :ld_net_trans;
	DO WHILE SQLCA.SQLCODE = 0
							
		SELECT dba.AGENT.ID_AGENT,   
				 dba.AGENT.NAME_AGENT  
		INTO 	:ls_id_agent,   
				:ls_name_agent  
		FROM 	dba.AGENT,   
				dba.BRANCH_AGENT  
		WHERE ( dba.BRANCH_AGENT.ID_AGENT = dba.AGENT.ID_AGENT ) and  
				( dba.BRANCH_AGENT.ID_BRANCH = :ls_id_branch );
				
		if isnull(ls_id_agent) then
			ls_id_agent = ''
			ls_name_agent = 'UNASSIGNED'
		end if

		ls_id_branch = trim(ls_id_branch)
		ls_name_branch = trim(ls_name_branch)
		ls_id_state = trim(ls_id_state)
		ls_id_agent = trim(ls_id_agent)		
		ls_name_agent = trim(ls_name_agent)				
		
		SELECT COUNT(*)
		INTO :ll_cont
		FROM DBA.REP_SALES16WEEKS
		WHERE ID_BRANCH = :ls_id_branch;

		if isnull(ld_net_trans) then ld_net_trans = 0
		ls_net_trans = string(ld_net_trans)
		
		If ll_week < 17 then

			If ll_cont = 0 then	
	
				ls_sql = "INSERT INTO DBA.REP_SALES16WEEKS(ID_BRANCH,NAME_BRANCH,ID_STATE,ID_AGENT,NAME_AGENT,WEEK"+STRING(ll_week)+ ") " + &
				"VALUES ('"+ls_id_branch+"','"+fn_replace(ls_name_branch,"'","")+"','"+ls_id_state+"','"+ls_id_agent+"','"+ls_name_agent+"',"+ls_net_trans+")"
	
				EXECUTE IMMEDIATE :ls_sql;			
				IF SQLCA.SQLCode <> 0 then
					Messagebox("Insert",ls_sql + "        " + SQLCA.SQLErrText)
					return
				end if
				
			else
				
				ls_sql = "UPDATE DBA.REP_SALES16WEEKS SET WEEK"+STRING(ll_week)+ " = "+string(ld_net_trans)+" WHERE ID_BRANCH = '"+trim(ls_id_branch)+"'"
				EXECUTE IMMEDIATE :ls_sql;			
				IF SQLCA.SQLCode <> 0 then
					Messagebox("Update",SQLCA.SQLErrText)
					return
				end if							
			end if

		END IF

		FETCH cur_branch INTO :ls_id_branch, :ls_name_branch, :ls_id_state, :ld_net_trans;		
	LOOP				
			
	close cur_branch;
	
	ld_prev_net_trans = ld_net_trans
	ld_currdate = relativedate(ld_currdate,7)
	ll_week++
loop

ls_lastdate = string(ld_currdate,'yyyy-mm-dd')
update dba.parameters set stringvalue = :ls_lastdate where idparameter = 'REP_SALES16WEEKS';

commit;

Setpointer(Arrow!)
end event

type cb_6 from commandbutton within w_checkcommissions
integer x = 3195
integer y = 1208
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Old DSO"
end type

event clicked;// ----------------------------------------------
// This Script runs every night on MTClosing and
// can be runned manually in w_balancemgmt
// ----------------------------------------------

string   ls_group
double   ld_balance, ld_remamount, ld_remadjamount, ld_dailydebits, ld_amttobereconciled
date     ld_movingdate, ld_dsodate
decimal  ld_dso, ld_ajusteddso, ld_remmaining
datetime ld_datefrom, ld_dateto
boolean  lb_ajusteddsodone

Setpointer(HourGlass!)

//ld_dsodate = today()
ld_dsodate = date('2005-01-01')

//DELETE FROM dba.HISTORY_BALANCE WHERE date_balance = :ld_dsodate;
//commit;

// DECLARE cur_groups CURSOR FOR
//  SELECT ID_MAIN_BRANCH,
//         balance_group,
//			0 as fin_amttobereconciled
//    FROM dba.GROUP_BRANCH, dba.HISTORY_BALANCE
//   WHERE dba.GROUP_BRANCH.group_type in ('A','R')
//	ORDER BY ID_MAIN_BRANCH;

  DECLARE cur_groups CURSOR FOR 
  SELECT dba.GROUP_BRANCH.ID_MAIN_BRANCH, 
		   dba.HISTORY_BALANCE.balance,         
			0 as fin_amttobereconciled
    FROM dba.GROUP_BRANCH, dba.HISTORY_BALANCE
   WHERE dba.GROUP_BRANCH.group_type in ('A','R')
     AND dba.group_branch.id_main_branch = dba.HISTORY_BALANCE.id_main_branch
     AND dba.HISTORY_BALANCE.date_balance = :ld_dsodate
	ORDER BY dba.group_branch.ID_MAIN_BRANCH;

open cur_groups;

fetch cur_groups into :ls_group, :ld_balance, :ld_amttobereconciled;

do while SQLCA.SQLCode = 0 
	
	// No se sabia cuanto era en esa epoca
	ld_amttobereconciled = 0
	
	this.text = "Calculating Group "+ls_group
	
	if isnull(ld_balance) then ld_balance = 0
	if isnull(ld_amttobereconciled) then ld_amttobereconciled = 0	
	
	ld_movingdate = relativedate(ld_dsodate,-1)
	ld_remamount = ld_balance
	ld_remadjamount = ld_balance - ld_amttobereconciled
	ld_dso = 0
	ld_ajusteddso = 0
	lb_ajusteddsodone = FALSE
	ld_remmaining = 0
	
	do while ld_remamount > 0

		if upper(DayName(ld_movingdate)) <> 'SUNDAY' then

			// Las transacciones del Domingo son sumadas el dia Lunes!
			if upper(DayName(ld_movingdate)) = 'MONDAY' then
				ld_datefrom = datetime(relativedate(ld_movingdate, -1),time('00:00:00'))
			else
				ld_datefrom = datetime(ld_movingdate,time('00:00:00'))
			end if
			
			ld_dateto = datetime(ld_movingdate,time('23:59:59'))	
			
			// Get the daily debits (transactions - cancelations)	
			SELECT sum(debit_trans_diaria) - sum(credit_trans_diaria)  
			INTO :ld_dailydebits  
			FROM dba.TRANSACCION_DIARIA_PAYEE  
			WHERE ( dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA = :ls_group ) AND  
				   ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE in ('AVO','TD') ) AND  
				   ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= :ld_datefrom ) AND
				   ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= :ld_dateto );
		
			if isnull(ld_dailydebits) then ld_dailydebits = 0
		
			ld_remamount = ld_remamount - ld_dailydebits
			ld_remadjamount = ld_remadjamount - ld_dailydebits
			
			// DSO
			if ld_remamount > 0 then
				ld_dso++
			else			
				if ld_dailydebits > 0 then				
					ld_dso = ld_dso + ((ld_remamount + ld_dailydebits) / ld_dailydebits ) // Percentage for the last day
				end if
			end if						

			// Adjusted DSO
			if ld_remadjamount > 0 then
				ld_ajusteddso++
			else
				if ld_dailydebits > 0 and not lb_ajusteddsodone then
					ld_ajusteddso = ld_ajusteddso + ((ld_remadjamount + ld_dailydebits) / ld_dailydebits ) // Percentage for the last day
					lb_ajusteddsodone = TRUE
				end if
			end if
			
			// Maximun DSO = 30 days
			if ld_dso > 89 then
				ld_remmaining = ld_remamount
				ld_remamount = -1
			end if

		end if

		ld_movingdate = relativedate(ld_movingdate,-1)

	loop

	ld_dso = round(ld_dso,2)
	ld_ajusteddso = round(ld_ajusteddso,2)

	// Actualiza el DSO para el grupo

	INSERT INTO dba.TMP_OLD_DSO VALUES(:ls_group,:ld_balance,:ld_dso,:ld_remmaining);
	if SQLCA.SQLCode <> 0 then
		Messagebox("Inserting",SQLCA.SQLErrText)
		return
	end if


//	UPDATE dba.GROUP_BRANCH
//	SET fin_dso = :ld_dso,
//	    fin_ajusteddso = :ld_ajusteddso
//	WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :ls_group;

	fetch cur_groups into :ls_group, :ld_balance, :ld_amttobereconciled;
loop

close cur_groups;

commit;

ld_datefrom = datetime(ld_dsodate,time('00:00:00'))
ld_dateto = datetime(ld_dsodate,time('23:59:59'))	

// Delete previous history for the same day
//DELETE FROM dba.HISTORY_BALANCE WHERE date_balance >= :ld_datefrom AND date_balance <= :ld_dateto;
//commit;

// Insert the history for this day
//INSERT INTO dba.HISTORY_BALANCE
//SELECT id_main_branch, :ld_dsodate, ISNULL(DEBITO_GROUP,0), ISNULL(CREDITO_GROUP,0), ISNULL(BALANCE_GROUP,0), 
//       ISNULL(fin_dso,0), ISNULL(fin_amttobereconciled,0), ISNULL(fin_ajusteddso,0)
//FROM dba.GROUP_BRANCH WHERE GROUP_TYPE IN ('A','R') AND FLAG_GRUPO <> 'C';
commit;

////////////////

this.text = "Done!"

Setpointer(Arrow!)
end event

type cb_7 from commandbutton within w_checkcommissions
integer x = 3195
integer y = 1504
integer width = 315
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, ld_porcentaje, ld_balance = 0

Date			ld_date, ld_new_date  

string		ls_group,				&
				ls_group_payee, 		&
				ls_mod_pay_currency, &
				ls_country,				&
				ls_branch, 				&
				ls_modo_pago, 			&
				ls_country_sender,	&
				ls_state_sender,		&
				ls_city_receiver


time			ld_time = Now()
datetime    ld_datetime
long 			ll_cont, ll_cont1

Double		ld_cons_trans_diaria, 		&
				ld_valor_comision_fijo, 	&
				ld_diference,					&
				ld_porc_modo_pago  = 0,		&
				ld_telex_modo_pago = 0,		&
				ld_valor_modo_pago = 0,		&
				ld_valor_group_state = 0,	&
				ld_telex_group_state = 0,	&
				ld_porc_group_state = 0,   &
				ld_total_group_city  = 0


DateTime		ld_from, ld_to

Setpointer(Hourglass!)
Commit ;
		
//	ld_date = today()
	ld_date = relativedate(today(),-1)
	ld_from 	= datetime(relativedate(today(),-1),time('00:00:00'))
	ld_to   	= datetime(relativedate(today(),-1),time('23:59:59'))
		
	
  SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee
   WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
			(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
			(dba.transaccion_diaria_payee.id_concepto_contable = 'CP' ) ;  //TRANSACCION PAYEE
			
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if

	if ll_cont1 > 0 then
		return
	end if


	
	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
			( dba.receiver.date_trans_payee >= :ld_from ) AND
			( dba.receiver.date_trans_payee <= :ld_to )    AND  
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.id_receiver < 0 ) AND
         ( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CP' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

			
			
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	  SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.commission_payee) 
    INTO :ld_valor  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         ( dba.branch.id_main_branch = :ls_group ) AND  
			( dba.receiver.date_trans_payee >= :ld_from ) AND
			( dba.receiver.date_trans_payee <= :ld_to )    AND  
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.id_receiver < 0 ) AND
         ( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CP' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

			
			
	  
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if
		
	
		
			if isnull(ld_cons) then ld_cons = 1
			
			//ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
			If ISNULL(ld_balance) then ld_balance = 0
			
			ld_balance = ld_balance - ld_valor
			
			ld_datetime = datetime(ld_date,ld_time)
			
			ld_balance = ROUND(ld_balance,2)
			ld_valor   = ROUND(ld_valor,2)
			
			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       	INTO :ld_cons  
       	FROM dba.transaccion_diaria_payee  ;
		 
		 
			If sqlca.sqlcode < 0 then
//				FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
				rollback;
				return
			end if
				
		
		  INSERT INTO dba.transaccion_diaria_payee 
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria )  
  			VALUES ( :ld_cons,:ls_group,:ld_datetime,:ld_datetime,   
           'CP','CLOSING CANCEL PAYEE...',0,:ld_valor,:ld_balance )  ;
			  
			  
		If sqlca.sqlcode < 0 then		
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		
			INSERT INTO dba.relacion_invoices_payee  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_datetime,
						'CP'
    			FROM  dba.branch,   
         			dba.receiver  
   			WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         			( dba.branch.id_main_branch = :ls_group ) AND  
						( dba.receiver.date_trans_payee >= :ld_from ) AND
			         ( dba.receiver.date_trans_payee <= :ld_to )    AND  
						( dba.receiver.ref_receiver > 0 ) AND
						( dba.receiver.id_receiver < 0 ) AND
         			( dba.receiver.id_flag_receiver = 'C'  ) AND
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CP' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;


						
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if
		
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;


commit ;
Setpointer(Arrow!)
end event

type cb_8 from commandbutton within w_checkcommissions
integer x = 3543
integer y = 1504
integer width = 343
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, ld_porcentaje, ld_balance = 0

Date			ld_date, ld_new_date  

string		ls_group,				&
				ls_group_payee, 		&
				ls_mod_pay_currency, &
				ls_country,				&
				ls_branch, 				&
				ls_modo_pago, 			&
				ls_country_sender,	&
				ls_state_sender,		&
				ls_city_receiver


time			ld_time = Now()
datetime    ld_datetime
long 			ll_cont, ll_cont1

Double		ld_cons_trans_diaria, 		&
				ld_valor_comision_fijo, 	&
				ld_diference,					&
				ld_porc_modo_pago  = 0,		&
				ld_telex_modo_pago = 0,		&
				ld_valor_modo_pago = 0,		&
				ld_valor_group_state = 0,	&
				ld_telex_group_state = 0,	&
				ld_porc_group_state = 0,   &
				ld_total_group_city  = 0
				
Datetime	ld_from,ld_to			


Setpointer(Hourglass!)
Commit ;

	//ld_date = today()
	ld_date = relativedate(today(),-1)	
	ld_from 	= datetime(relativedate(today(),-1),time('00:00:00'))
	ld_to   	= datetime(relativedate(today(),-1),time('23:59:59'))
	

 	SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee
   WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND   
			(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
			(dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) ; 
	
	

	if ll_cont1 > 0 then
		return	
	end if

	
	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         ( dba.receiver.payment_date >= :ld_from ) AND
			( dba.receiver.payment_date <= :ld_to)    AND 
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

			
			
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   4"+sqlca.sqlerrtext)
			return
		end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	  SELECT SUM(dba.receiver.net_amount_receiver  + dba.receiver.commission_payee) 
    INTO :ld_valor  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.payment_date >= :ld_from ) AND
			( dba.receiver.payment_date <= :ld_to)    AND 
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

			
			
			
		IF ISNULL(ld_valor) THEN ld_valor = 0	
			
	  
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   5"+sqlca.sqlerrtext)
			return
		end if
		
		 SELECT MAX(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		 
		 
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence    6"+sqlca.sqlerrtext)
			return
		end if
		
			if isnull(ld_cons) then ld_cons = 1
			
			//ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
			If ISNULL(ld_balance) then ld_balance = 0
			
			ld_balance = ld_balance - ld_valor
			
			ld_datetime = datetime(ld_date,ld_time)
			
			
			
		
		  INSERT INTO dba.transaccion_diaria_payee 
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria )  
  			VALUES ( :ld_cons,:ls_group,:ld_datetime,:ld_datetime,   
           'CPC','CLOSING PAYEE CONRIRMATION',0,:ld_valor,:ld_balance )  ;
			  
			  
		If sqlca.sqlcode < 0 then		
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   7"+sqlca.sqlerrtext)
			return
		end if
		
		
			INSERT INTO dba.relacion_invoices_payee  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_datetime,
						'CPC'
    			FROM  dba.branch,   
         			dba.receiver  
   			WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         			( dba.branch.id_main_branch = :ls_group ) AND  
         			( dba.receiver.payment_date >= :ld_from ) AND
						( dba.receiver.payment_date <= :ld_to)    AND 
						( dba.receiver.ref_receiver > 0 ) AND
						( dba.receiver.id_receiver > 0 ) AND
         			( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;


						
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   8"+sqlca.sqlerrtext)
			return
		end if
		
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;


commit ;
Setpointer(Arrow!)
end event

type cb_10 from commandbutton within w_checkcommissions
integer x = 3040
integer y = 972
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Closing Payee Confirmations"
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, ld_porcentaje, ld_balance = 0

Date			ld_date, ld_new_date  

string		ls_group,				&
				ls_group_payee, 		&
				ls_mod_pay_currency, &
				ls_country,				&
				ls_branch, 				&
				ls_modo_pago, 			&
				ls_country_sender,	&
				ls_state_sender,		&
				ls_city_receiver


time			ld_time = Now()
datetime    ld_datetime
long 			ll_cont, ll_cont1

Double		ld_cons_trans_diaria, 		&
				ld_valor_comision_fijo, 	&
				ld_diference,					&
				ld_porc_modo_pago  = 0,		&
				ld_telex_modo_pago = 0,		&
				ld_valor_modo_pago = 0,		&
				ld_valor_group_state = 0,	&
				ld_telex_group_state = 0,	&
				ld_porc_group_state = 0,   &
				ld_total_group_city  = 0
				
Datetime	ld_from,ld_to			


Setpointer(Hourglass!)
Commit ;

	
	date ld_closingdate
	string ls_group_cierre
	
	ld_closingdate = date('2005-02-19')
	ls_group_cierre = 'T033'
	
	//ld_date = today()
	ld_date = relativedate(today(),-1)	
	ld_from 	= datetime(ld_closingdate,time('00:00:00'))
	ld_to   	= datetime(ld_closingdate,time('23:59:59'))
	

 	SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee
   WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND   
			(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND 
			(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_cierre) AND
			(dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) ; 
	
	

	if ll_cont1 > 0 then
		return	
	end if

	
	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
			( dba.branch.id_main_branch = :ls_group_cierre) and
         ( dba.receiver.payment_date >= :ld_from ) AND
			( dba.receiver.payment_date <= :ld_to)    AND 
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

			
			
		If sqlca.sqlcode < 0 then
			rollback;
			//FileWrite(FileNum,"Error: SQL Sentence   4"+sqlca.sqlerrtext)
			return
		end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	  SELECT SUM(dba.receiver.net_amount_receiver  + dba.receiver.commission_payee) 
    INTO :ld_valor  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.payment_date >= :ld_from ) AND
			( dba.receiver.payment_date <= :ld_to)    AND 
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

			
						
		IF ISNULL(ld_valor) THEN ld_valor = 0	
			
	  
		If sqlca.sqlcode < 0 then
			rollback;
			//FileWrite(FileNum,"Error: SQL Sentence   5"+sqlca.sqlerrtext)
			return
		end if
		
		 SELECT MAX(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		 
		 
		If sqlca.sqlcode < 0 then
			rollback;
			//FileWrite(FileNum,"Error: SQL Sentence    6"+sqlca.sqlerrtext)
			return
		end if
		
			if isnull(ld_cons) then ld_cons = 1
			
			//ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
			If ISNULL(ld_balance) then ld_balance = 0
			
			ld_balance = ld_balance - ld_valor
			
			ld_datetime = datetime(ld_closingdate,ld_time)
			
			
			
		
		  INSERT INTO dba.transaccion_diaria_payee 
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria )  
  			VALUES ( :ld_cons,:ls_group,:ld_datetime,:ld_datetime,   
           'CPC','CLOSING PAYEE CONFIRMATION',0,:ld_valor,:ld_balance )  ;
			  
			  
		If sqlca.sqlcode < 0 then		
			rollback;
			//FileWrite(FileNum,"Error: SQL Sentence   7"+sqlca.sqlerrtext)
			return
		end if
		
		
			INSERT INTO dba.relacion_invoices_payee  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_datetime,
						'CPC'
    			FROM  dba.branch,   
         			dba.receiver  
   			WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         			( dba.branch.id_main_branch = :ls_group ) AND  
         			( dba.receiver.payment_date >= :ld_from ) AND
						( dba.receiver.payment_date <= :ld_to)    AND 
						( dba.receiver.ref_receiver > 0 ) AND
						( dba.receiver.id_receiver > 0 ) AND
         			( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;


						
		If sqlca.sqlcode < 0 then
			rollback;
			//FileWrite(FileNum,"Error: SQL Sentence   8"+sqlca.sqlerrtext)
			return
		end if
		
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;


commit ;
Setpointer(Arrow!)
end event

type cb_dailysalesrep from commandbutton within w_checkcommissions
integer y = 112
integer width = 667
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Daily Sales by Sales Rep"
end type

event clicked;
String ls_idagent, ls_name_agent, ls_emailagent

date 		ld_repdate
datetime ld_date1, ld_date2

ld_repdate = today()
ld_repdate = date('2006/06/30')

ld_date1 = datetime(ld_repdate,time('00:00:00'))
ld_date2 = datetime(ld_repdate,time('23:59:59'))

//// Reportes Individuales
//DECLARE cur_agents CURSOR FOR
//SELECT DISTINCT 
//       DBA.AGENT.ID_AGENT, 
//       DBA.AGENT.NAME_AGENT, 
//       DBA.AGENT.EMAIL_AGENT
//  FROM DBA.BRANCH_AGENT, DBA.AGENT
// WHERE DBA.AGENT.ID_AGENT = DBA.BRANCH_AGENT.ID_AGENT
//   AND STATUS_AGENT = 'A';
////	AND dba.agent.id_agent = '12';
//	
//OPEN cur_agents;
//
//FETCH cur_agents INTO :ls_idagent, :ls_name_agent, :ls_emailagent;
//
//DO WHILE SQLCA.SQLCODE = 0 
//
//	if isnull(ls_emailagent) then ls_emailagent = 'ebernal@viamericas.com'
//	ls_emailagent = fn_replace(ls_emailagent,'@','\@')	
//	dw_dailysales.retrieve(ld_date1,ld_date2,ls_idagent,"@F212 "+ls_emailagent+"@@F307 DAILY SALES REPORT FOR "+TRIM(ls_name_agent)+" - "+string(ld_repdate,'mm/dd/yyyy')+'@')	
//	dw_dailysales.print()	
//
//	FETCH cur_agents INTO :ls_idagent, :ls_name_agent, :ls_emailagent;
//
//LOOP

// Reporte General
ls_emailagent = "jargilagos\@viamericas.com;ebernal\@viamericas.com"
dw_dailysales.retrieve(ld_date1,ld_date2,"ALL","@F212 "+ls_emailagent+"@@F307 DAILY SALES REPORT - "+string(ld_repdate,'mm/dd/yyyy')+'@')	
dw_dailysales.print()	

end event

type dw_dailysales from datawindow within w_checkcommissions
integer x = 2514
integer y = 1376
integer width = 439
integer height = 268
boolean bringtotop = true
string title = "none"
string dataobject = "dw_dailysalesbysalesrep"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_dailysalespayer from datawindow within w_checkcommissions
integer x = 2523
integer y = 1660
integer width = 439
integer height = 268
boolean bringtotop = true
string title = "none"
string dataobject = "dw_dailysalesbypayer"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_9 from commandbutton within w_checkcommissions
integer x = 2473
integer y = 172
integer width = 690
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Daily Sales by Payer"
end type

event clicked;//////////muy lento

//
//String ls_idagent, ls_name_agent, ls_emailagent
//
//date 		ld_repdate
//datetime ld_date1, ld_date2
//
//ld_repdate = today()
//
//ld_date1 = datetime(ld_repdate,time('00:00:00'))
//ld_date2 = datetime(ld_repdate,time('23:59:59'))
//
////// Reportes Individuales
////DECLARE cur_agents CURSOR FOR
////SELECT DISTINCT 
////       DBA.AGENT.ID_AGENT, 
////       DBA.AGENT.NAME_AGENT, 
////       DBA.AGENT.EMAIL_AGENT
////  FROM DBA.BRANCH_AGENT, DBA.AGENT
//// WHERE DBA.AGENT.ID_AGENT = DBA.BRANCH_AGENT.ID_AGENT
////   AND STATUS_AGENT = 'A';
//////	AND dba.agent.id_agent = '16';
////	
////OPEN cur_agents;
////
////FETCH cur_agents INTO :ls_idagent, :ls_name_agent, :ls_emailagent;
////
////DO WHILE SQLCA.SQLCODE = 0 
////
////	if isnull(ls_emailagent) then ls_emailagent = 'ebernal@viamericas.com'
////	ls_emailagent = fn_replace(ls_emailagent,'@','\@')	
////	dw_dailysales.retrieve(ld_date1,ld_date2,ls_idagent,"@F212 "+ls_emailagent+"@@F307 DAILY SALES REPORT FOR "+TRIM(ls_name_agent)+" - "+string(ld_repdate,'mm/dd/yyyy')+'@')	
////	dw_dailysales.print()	
////
////	FETCH cur_agents INTO :ls_idagent, :ls_name_agent, :ls_emailagent;
////
////LOOP
//
//// Reporte General
//ls_emailagent = "ebernal\@viamericas.com"
//dw_dailysalespayer.retrieve(ld_date1,ld_date2,"T060","@F212 "+ls_emailagent+"@@F307 DAILY SALES REPORT - "+string(ld_repdate,'mm/dd/yyyy')+'@',"BANCOLOMBIA")
//dw_dailysalespayer.print()	

end event

type cb_11 from commandbutton within w_checkcommissions
integer x = 2958
integer y = 1664
integer width = 928
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "cierre cancelaciones fecha"
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, 	&
				ld_porcentaje,			&
				ld_porc_modo_pago, 	& 
          	ld_telex_modo_pago, ld_fee_rate 
	
Boolean		lb_comision_delivery	
	
Date			ld_date 
Datetime    ld_datetime
string		ls_group, ls_group_payee,	&
				ls_mod_pay_currency, ls_country, ls_branch, ls_modo_pago1, ls_city
				
Double		ld_feet_comp,			&
				ld_porcentaje_comp,	&
				ld_comision_comp,		&
				ld_other = 0, ld_vlr_modo_pago = 0

Double		ld_porcentaje_comp_city = 0	,	&
         	ld_feet_comp_city= 0				,	&
         	ld_porcentaje_city= 0			,	&
         	ld_feet_city = 0					,	&
				ld_comision_city					,	&
				ld_comision_comp_city

Double		ld_porc_modo_pago_comp,		&
				ld_telex_modo_pago_comp,	&
				ld_total, 						&
				ld_balance = 0, 				&
				ld_delivery_inicial	= 0
				
Double		ld_feet = 0
				
time			ld_time = Now()

long 			ll_cont, 		&
				ll_cont1,		&
				ll_file, 		&
				ll_cont5,			&
				ll_cont_delivery, ll_contagent_group
				
				
Double		ld_cons_trans_diaria,  ld_vlr_modo_pago_comp

string		ls_standar_exclusion,		&
				ls_propia, 						&
				ls_filesql,						&
				ls_sql, ls_output
				
Datetime		ld_new_date , ld_datefrom, ld_dateto

Setpointer(Hourglass!)

string ls_branchcan
string ls_groupcan


Commit;

//ld_date = today()
	ld_date = relativedate(today(),-1)

	ls_branchcan 	= 'A00765'

	SELECT id_main_branch
	INTO :ls_groupcan
	FROM dba.branch
	WHERE id_branch = :ls_branchcan;

	ld_datefrom 	= datetime(date('2004-10-25'),time('00:00:00'))
	ld_dateto   	= datetime(date('2004-10-25'),time('23:59:59'))

	SELECT Count(*)
	INTO :ll_cont1
	FROM dba.transaccion_diaria_payee
	WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND  
			( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) 
	 AND id_group_trans_diaria = :ls_groupcan;  

//				if ll_cont1 > 0 then
//		         messagebox("Warning","Closing already Done,") 
//					return	
//				end if

	 SELECT Count(*)
    INTO :ll_cont1
    FROM dba.transaccion_diaria_payee
    WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND   
	 		 ( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			 ( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) 
		 AND id_group_trans_diaria = :ls_groupcan;  
			
	If sqlca.sqlcode < 0 then
		//FileWrite(FileNum,"Error: SQL Sentence Borrado Closing Anterior "+sqlca.sqlerrtext)
		rollback;
		return
	end if

	if ll_cont1 > 0 then
			//Borrar el Closing Realizado Anteriormente
			DELETE FROM dba.relacion_invoices_payee  
   		WHERE  (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_datefrom  ) and
					 (dba.relacion_invoices_payee.date_relacion_diaria <= :ld_dateto  ) and
					 (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' )
					 AND id_branch_invoice = :ls_branchcan;
			
			If sqlca.sqlcode < 0 then
				rollback;
//.				FileWrite(FileNum,"Error: SQL Sentence Borrado Closing Detalle"+sqlca.sqlerrtext)
				return
			end if

		 	DELETE FROM dba.transaccion_diaria_payee
   		WHERE ( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) AND  
					( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom) and
					( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto  ) 
					AND id_group_trans_diaria = :ls_groupcan;
					
			If sqlca.sqlcode < 0 then
//				FileWrite(FileNum,"Error: SQL Sentence bORRANDO EL cLOSING PAPA"+sqlca.sqlerrtext)
				rollback;
				return
			end if
	end if
	
	DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
			( dba.receiver.id_receiver < 0 ) AND
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.date_receiver >= :ld_datefrom ) AND
			( dba.receiver.date_receiver <= :ld_dateto)    AND
			( dba.receiver.id_branch = :ls_branchcan)    AND			
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

				
	If sqlca.sqlcode < 0 then
//		FileWrite(FileNum,"Error: SQL Sentence Cursor Relacionar Cierre "+sqlca.sqlerrtext)
		rollback;
		return
	end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0

	SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.exchange_company + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.handling_receiver + dba.receiver.fee_rate)
    INTO :ld_valor  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and  
         ( dba.branch.id_main_branch = :ls_group ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.id_receiver < 0 ) AND
			( dba.receiver.date_receiver >= :ld_datefrom ) AND
			( dba.receiver.date_receiver <= :ld_dateto)    AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;


	
	
		if isnull(ld_valor) then
			ld_valor = 0
		end if

		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence SUMANDO LOS VALORES"+sqlca.sqlerrtext)
			rollback;
			return
		end if
	  
		 SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
	 
		 if sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence CONSULTANDO EL CONSECUTIVO"+sqlca.sqlerrtext)
			rollback;
			return
		 end if
		
			if isnull(ld_cons) then ld_cons = 1
			ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
			if ISNULL(ld_balance) then ld_balance = 0
			ld_balance = round(ld_balance,2) + round(ld_valor,2)
			
			ld_valor = abs(ld_valor)
			ld_datetime = datetime(ld_date,ld_time)
				
		  INSERT INTO dba.transaccion_diaria_payee  
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria )  
  			VALUES ( :ld_cons,:ls_group,:ld_date,:ld_datetime,   
            'AVO','CLOSING CANC. AGENT',0,:ld_valor,:ld_balance )  ;
				
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence INSERTANDO EL MAESTRO DEL CIERRE"+sqlca.sqlerrtext)
			return
		end if
			
			INSERT INTO dba.relacion_invoices_payee  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )  
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_date,
						'AVO'
    			FROM  dba.branch,   
         			dba.receiver  
   			WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and  
         			(  dba.branch.id_main_branch = :ls_group ) AND  
         			( dba.receiver.id_flag_receiver = 'C' ) AND
						( dba.receiver.net_amount_receiver < 0 ) AND
						( dba.receiver.id_receiver < 0 ) AND
						( dba.receiver.date_receiver >= :ld_datefrom ) AND
						( dba.receiver.date_receiver <= :ld_dateto)    AND					
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver)
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

						
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence In Relation Invoices"+sqlca.sqlerrtext)
			rollback;
			return
		end if

			
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;

commit ;
Setpointer(Arrow!)


end event

type cb_12 from commandbutton within w_checkcommissions
integer x = 3003
integer y = 1788
integer width = 773
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "cierre de cancelaciones ayer"
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, 	&
				ld_porcentaje,			&
				ld_porc_modo_pago, 	& 
          	ld_telex_modo_pago, ld_fee_rate 
	
Boolean		lb_comision_delivery	
	
Date			ld_date 
Datetime    ld_datetime
string		ls_group, ls_group_payee,	&
				ls_mod_pay_currency, ls_country, ls_branch, ls_modo_pago1, ls_city
				
Double		ld_feet_comp,			&
				ld_porcentaje_comp,	&
				ld_comision_comp,		&
				ld_other = 0, ld_vlr_modo_pago = 0

Double		ld_porcentaje_comp_city = 0	,	&
         	ld_feet_comp_city= 0				,	&
         	ld_porcentaje_city= 0			,	&
         	ld_feet_city = 0					,	&
				ld_comision_city					,	&
				ld_comision_comp_city

Double		ld_porc_modo_pago_comp,		&
				ld_telex_modo_pago_comp,	&
				ld_total, 						&
				ld_balance = 0, 				&
				ld_delivery_inicial	= 0
				
Double		ld_feet = 0
				
time			ld_time = Now()

long 			ll_cont, 		&
				ll_cont1,		&
				ll_file, 		&
				ll_cont5,			&
				ll_cont_delivery, ll_contagent_group
				
				
Double		ld_cons_trans_diaria,  ld_vlr_modo_pago_comp

string		ls_standar_exclusion,		&
				ls_propia, 						&
				ls_filesql,						&
				ls_sql, ls_output
				
Datetime		ld_new_date , ld_datefrom, ld_dateto

Setpointer(Hourglass!)


Commit;

//ld_date = today()
	ld_date = relativedate(today(),-1)

	ld_datefrom 	= datetime(relativedate(today(),-1),time('00:00:00'))
	ld_dateto   	= datetime(relativedate(today(),-1),time('23:59:59'))

	SELECT Count(*)
	INTO :ll_cont1
	FROM dba.transaccion_diaria_payee
	WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND  
			( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) ;  

//				if ll_cont1 > 0 then
//		         messagebox("Warning","Closing already Done,") 
//					return	
//				end if

	 SELECT Count(*)
    INTO :ll_cont1
    FROM dba.transaccion_diaria_payee
    WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND   
	 		 ( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			 ( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) ;  
			
	If sqlca.sqlcode < 0 then
//		FileWrite(FileNum,"Error: SQL Sentence Borrado Closing Anterior "+sqlca.sqlerrtext)
		rollback;
		return
	end if

	if ll_cont1 > 0 then
			//Borrar el Closing Realizado Anteriormente
			DELETE FROM dba.relacion_invoices_payee  
   		WHERE  (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_datefrom  ) and
					 (dba.relacion_invoices_payee.date_relacion_diaria <= :ld_dateto  ) and
					 (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' );
			
			If sqlca.sqlcode < 0 then
				rollback;
//				FileWrite(FileNum,"Error: SQL Sentence Borrado Closing Detalle"+sqlca.sqlerrtext)
				return
			end if

		 	DELETE FROM dba.transaccion_diaria_payee
   		WHERE ( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) AND  
					( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom) and
					( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto  )  ;
					
			If sqlca.sqlcode < 0 then
//				FileWrite(FileNum,"Error: SQL Sentence bORRANDO EL cLOSING PAPA"+sqlca.sqlerrtext)
				rollback;
				return
			end if
	end if
	
	DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
			( dba.receiver.id_receiver < 0 ) AND
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.date_receiver >= :ld_datefrom ) AND
			( dba.receiver.date_receiver <= :ld_dateto)    AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

				
	If sqlca.sqlcode < 0 then
//		FileWrite(FileNum,"Error: SQL Sentence Cursor Relacionar Cierre "+sqlca.sqlerrtext)
		rollback;
		return
	end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0

	SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.exchange_company + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.handling_receiver + dba.receiver.fee_rate)	
    INTO :ld_valor  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and  
         ( dba.branch.id_main_branch = :ls_group ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.id_receiver < 0 ) AND
			( dba.receiver.date_receiver >= :ld_datefrom ) AND
			( dba.receiver.date_receiver <= :ld_dateto)    AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;


	
	
		if isnull(ld_valor) then
			ld_valor = 0
		end if

		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence SUMANDO LOS VALORES"+sqlca.sqlerrtext)
			rollback;
			return
		end if
	  
		 SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
	 
		 if sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence CONSULTANDO EL CONSECUTIVO"+sqlca.sqlerrtext)
			rollback;
			return
		 end if
		
			if isnull(ld_cons) then ld_cons = 1
			ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
			if ISNULL(ld_balance) then ld_balance = 0
			ld_balance = round(ld_balance,2) + round(ld_valor,2)
			
			ld_valor = abs(ld_valor)
			ld_datetime = datetime(ld_date,ld_time)
			
		  INSERT INTO dba.transaccion_diaria_payee  
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria )  
  			VALUES ( :ld_cons,:ls_group,:ld_date,:ld_datetime,   
            'AVO','CLOSING CANC. AGENT',0,:ld_valor,:ld_balance )  ;
				
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence INSERTANDO EL MAESTRO DEL CIERRE"+sqlca.sqlerrtext)
			return
		end if
			
			INSERT INTO dba.relacion_invoices_payee  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )  
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_date,
						'AVO'
    			FROM  dba.branch,   
         			dba.receiver  
   			WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and  
         			( dba.branch.id_main_branch = :ls_group ) AND  
         			( dba.receiver.id_flag_receiver = 'C' ) AND
						( dba.receiver.net_amount_receiver < 0 ) AND
						( dba.receiver.id_receiver < 0 ) AND
						( dba.receiver.date_receiver >= :ld_datefrom ) AND
						( dba.receiver.date_receiver <= :ld_dateto)    AND					
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver)
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

						
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence In Relation Invoices"+sqlca.sqlerrtext)
			rollback;
			return
		end if

			
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;

commit ;
Setpointer(Arrow!)


end event

type cb_14 from commandbutton within w_checkcommissions
integer x = 2341
integer y = 424
integer width = 754
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retornar comision orden"
end type

event clicked;STRING ls_id_branch
DOUBLE ld_receiver

ls_id_branch = 'A00449'
ld_receiver = 1893
	
	// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Si solicitaron Refund, da el credito a la agencia
	long ll_count
	double ld_refund
	
	ld_refund = 0
	
	SELECT COUNT(*)
	  INTO :ll_count
	  FROM dba.RECEIVER_CANCELATIONREFUND
	 WHERE ID_BRANCH = :ls_id_branch
	   AND ID_RECEIVER = abs(:ld_receiver)
		AND CONS_TRANS_DIARIA = 0;

	// Se da el refund como un credito
	IF ll_count = 1 THEN

		SELECT ISNULL(dba.receiver.handling_receiver,0)+
				 ISNULL(dba.receiver.exchange_company,0)+
				 ISNULL(dba.receiver.telex_company,0)+ 
				 ISNULL(dba.receiver.total_modo_pago_comp,0)+
				 ISNULL(dba.receiver.fee_rate,0)
  		  INTO :ld_refund
		  FROM dba.RECEIVER
		 WHERE ID_BRANCH = :ls_id_branch
			AND ID_RECEIVER = abs(:ld_receiver);
		
		IF ISNULL(ld_refund) THEN ld_refund = 0
		
		IF ld_refund > 0 THEN
		
			Double ld_constd, ld_debit, ld_credit
			Datetime ld_now
			String ls_desc, ls_desc1, ls_group
	
			SELECT id_main_branch
			  INTO :ls_group
			  FROM DBA.BRANCH
			 WHERE id_branch = :ls_id_branch;			
	
			SELECT 'REASON: '+rtrim(left(REFUND_DESC,72))+' ('+left(DB_USER_NAME,20)+')'
			  INTO :ls_desc1
			  FROM dba.RECEIVER_CANCELATIONREFUND
			 WHERE ID_BRANCH = :ls_id_branch
				AND ID_RECEIVER = abs(:ld_receiver);			
				
			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1
			  INTO :ld_constd
			  FROM dba.transaccion_diaria_payee;
				
			if isnull(ld_constd) then ld_constd = 1		
				
			ld_now = datetime(today(),now())
					
			ls_desc = "REFUND COMMISSION ORDER " + TRIM(ls_id_branch)+'-'+STRING(abs(ld_receiver))
			ld_debit = 0
			ld_credit = ld_refund			
		
			  INSERT INTO dba.TRANSACCION_DIARIA_PAYEE
						( CONS_TRANS_DIARIA,
						  ID_GROUP_TRANS_DIARIA,
						  DATE_TRANS_DIARIA,
						  HOUR_TRANS_DIARIA,
						  ID_CONCEPTO_CONTABLE,
						  DES_TRANS_DIARIA,
						  DEBIT_TRANS_DIARIA,
						  CREDIT_TRANS_DIARIA,
						  BALANCE_TRANS_DIARIA,
						  DESCRIPCION_SUSPENSE,
						  LINK_REFERENCE,
						  DESC_TRANS_DIARIA1,
						  DATE_SYSTEM,
						  ID_CASHIER, 
						  TOTAL_AMOUNT,
						  BNKID,
						  NUM_WIRETRANSFER)
			  VALUES ( :ld_constd,
						  :ls_group,
						  :ld_now,
						  :ld_now,
						  'AC',
						  :ls_desc,
						  :ld_debit,
						  :ld_credit,
						  0,
						  NULL,
						  NULL,
						  :ls_desc1,
						  :ld_now,
						  'ADMIN',
						  NULL,
						  NULL,
						  NULL);
						
			UPDATE dba.RECEIVER_CANCELATIONREFUND
				SET CONS_TRANS_DIARIA = :ld_constd
			 WHERE ID_BRANCH = :ls_id_branch
				AND ID_RECEIVER = abs(:ld_receiver);
				
		END IF
				
	END IF	
	
	// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

end event

type cb_15 from commandbutton within w_checkcommissions
integer y = 224
integer width = 667
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "QuickBooks"
end type

event clicked;SetPointer(HourGlass!)

String 	ls_line, ls_type_group
String 	ls_id_branch, ls_payer, ls_bank
Double 	ld_total, ld_viafees, ld_customerfees, ld_payerfees, ld_total_and_fees, ld_agency_fees
DateTime	ld_date1, ld_date2
Date		ld_date
String 	ls_FileName
Long		ll_FileNum

ld_date = date('2007-08-01')

ls_FileName = "C:\MTSA_ACC_Export_"+String(ld_date,"yyyy-mm")+".iif"
ll_FileNum = FileOpen(ls_FileName,LineMode!,Write!,LockReadWrite!,Replace!)

	DO WHILE ld_date < DATE('2007-09-01')
	
		ld_date1 = DateTime(ld_date,time('00:00:00'))
		ld_date2 = DateTime(ld_date,time('23:59:59'))
	
	  DECLARE cur_data CURSOR FOR
		SELECT dba.RECEIVER.ID_BRANCH,   
				dba.BRANCH.ID_MAIN_BRANCH,
				dba.sfGetBranchBank(dba.RECEIVER.ID_BRANCH) AS BANK,
				SUM(dba.RECEIVER.NET_AMOUNT_RECEIVER) TOTAL,
				SUM((dba.receiver.exchange_company + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.handling_receiver + dba.receiver.fee_rate)) AS VIAFEES,
				SUM((dba.RECEIVER.TELEX_RECEIVER+dba.RECEIVER.EXCHANGE_RECEIVER)) AS CUSTOMERFEES,
				SUM(dba.RECEIVER.COMMISSION_PAYEE) PAYERFEES
		 FROM dba.BRANCH,   
				dba.RECEIVER  
		WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER )
		  AND ( dba.RECEIVER.date_receiver >= :ld_date1 )
		  AND ( dba.RECEIVER.date_receiver <= :ld_date2 )
		GROUP BY dba.RECEIVER.ID_BRANCH, dba.BRANCH.ID_MAIN_BRANCH;
	
	FileWrite(ll_FileNum,"!TRNS	TRNSID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	TOPRINT	NAMEISTAXABLE	ADDR1	ADDR3	TERMS	SHIPVIA	SHIPDATE")
	FileWrite(ll_FileNum,"!SPL	SPLID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	QNTY	PRICE	INVITEM	TAXABLE	OTHER2	YEARTODATE	WAGEBASE")
	
	OPEN cur_data;
	FETCH cur_data INTO :ls_id_branch, :ls_payer, :ls_bank, :ld_total, :ld_viafees, :ld_customerfees, :ld_payerfees;
	DO WHILE SQLCA.SQLCODE = 0
	
		ls_line = ''
		
		ld_total = round(ld_total,2)
		ld_customerfees = round(ld_customerfees,2)
		
		ld_total_and_fees = ld_total + ld_customerfees
		ld_agency_fees = ld_customerfees - ld_viafees
	
		FileWrite(ll_FileNum,"!ENDTRNS																	")	
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_total_and_fees,"######.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Transfer Fees	"+trim(ls_id_branch)+"		"+string(ld_customerfees * -1,"######.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Pending Orders	"+trim(ls_payer)+"		"+string(ld_total * -1,"######.00")+"										")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_agency_fees * -1,"######.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - US Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_agency_fees,"######.00")+"										")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Pending Orders	"+trim(ls_payer)+"		"+string(ld_payerfees * -1,"######.00")+"										")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - Payout Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_payerfees,"######.00")+"		"+ls_payer+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")


//		FileWrite(ll_FileNum,"!ENDTRNS																	")	
//		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_total_and_fees,"######.00")+"										")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Transfer Fees	"+trim(ls_id_branch)+"		"+string(ld_customerfees * -1,"######.00")+"										")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Pending Orders	"+trim(ls_payer)+"		"+string(ld_total * -1,"######.00")+"										")
//		FileWrite(ll_FileNum,"ENDTRNS																	")
//		FileWrite(ll_FileNum,"!ENDTRNS																	")
//		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_agency_fees * -1,"######.00")+"										")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - US Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_agency_fees,"######.00")+"										")
//		FileWrite(ll_FileNum,"ENDTRNS																	")
//		FileWrite(ll_FileNum,"!ENDTRNS																	")
//		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Pending Orders	"+trim(ls_payer)+"		"+string(ld_payerfees * -1,"######.00")+"										")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - Payout Agent Commission	"+trim(ls_payer)+"		"+string(ld_payerfees,"######.00")+"										")
//		FileWrite(ll_FileNum,"ENDTRNS																	")
	
	
		FETCH cur_data INTO :ls_id_branch, :ls_payer, :ls_bank, :ld_total, :ld_viafees, :ld_customerfees, :ld_payerfees;
	LOOP
	CLOSE cur_data;
	
	String	ls_group, ls_concepto, LS_ACCNT, ls_name, LS_MEMO
	Double	ld_debit, ld_credit, ld_amount
	
	
	 DECLARE cur_data2 CURSOR FOR
	  SELECT dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA,
				dba.BANCO.NAME_BANCO,   
				dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
				dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA,   
				dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA  
		 FROM dba.TRANSACCION_DIARIA_BANCO_PAYEE,   
				dba.TRANSACCION_DIARIA_PAYEE,   
				dba.BANCO  
		WHERE ( dba.TRANSACCION_DIARIA_BANCO_PAYEE.CONS_TRANS_DIARIA = dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA )
		  AND ( dba.TRANSACCION_DIARIA_BANCO_PAYEE.ID_BANCO = dba.BANCO.ID_BANCO )
		  AND ( dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE >= :ld_date1 )
		  AND ( dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE <= :ld_date2 )
	ORDER BY ID_CONCEPTO_CONTABLE;
		  
	OPEN cur_data2;
	FETCH cur_data2 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ld_amount = ld_debit - ld_credit
		
		SELECT MIN(ID_BRANCH)
		  INTO :ls_name
		  FROM DBA.BRANCH
		 WHERE ID_MAIN_BRANCH = :ls_group;

		SELECT group_type
		  INTO :ls_type_group
		  FROM dba.GROUP_BRANCH
	    WHERE ID_MAIN_BRANCH = :ls_group;
				
		if ls_type_group = 'P' then
			ls_name = ls_group
			LS_ACCNT = 'Pending Orders'		
		else
			LS_ACCNT = 'AR-Customers ViaReps'
		end if
		
		if ls_concepto = 'ACH' then
			LS_MEMO = "ACH AGENCY"
		elseif ls_concepto = 'DA' then
			LS_MEMO = "DEPOSIT AGENCY"
		elseif ls_concepto = 'DE' then
			LS_MEMO = "AJUSTMENT (TELLER ERROR)"
		elseif ls_concepto = 'AC' then
			LS_MEMO = "AJUSTMENT"
		elseif ls_concepto = 'DP' then
			LS_MEMO = "WIRE PAYER"	
		elseif ls_concepto = 'CCC' then
			LS_MEMO = "CHK CASHING COMMISION (DEBIT)"
		elseif ls_concepto = 'CCD' then
			LS_MEMO = "CHK CASHING DEPOSIT (CREDIT)"
		elseif ls_concepto = 'CCK' then
			LS_MEMO = "CHK CASHING RETURN CHARGE (DEBIT)"
		elseif ls_concepto = 'CCL' then
			LS_MEMO = "CHK CASHING EQUIPMENT LEASE (DEBIT)"
		elseif ls_concepto = 'CCM' then
			LS_MEMO = "CHK CASHING MONTHLY FEE (DEBIT)"
		elseif ls_concepto = 'CCR' then
			LS_MEMO = "CHK CASHING RETURN CHECK (DEBIT)"
		elseif ls_concepto = 'CCW' then
			LS_MEMO = "CHK CASHING WIRE TO AGENT (DEBIT)"
		elseif ls_concepto = 'CCY' then
			LS_MEMO = "CHK CASHING WIRE CHARGE (DEBIT)"
		elseif ls_concepto = 'ARF' then
			LS_MEMO = "RETURNED ACH FEE"
		elseif ls_concepto = 'BNO' then
			LS_MEMO = "BANK AND OTHER COSTS"
		elseif ls_concepto = 'DRC' then
			LS_MEMO = "RETURNED CHK FEE"
		elseif ls_concepto = 'INT' then
			LS_MEMO = "INTERESTS"
		elseif ls_concepto = 'INC' then
			LS_MEMO = "INTERESTS COLLECTION"
		elseif ls_concepto = 'PCS' then
			LS_MEMO = "PETTY CASH"		
		elseif ls_concepto = 'SCM' then
			LS_MEMO = "SPECIAL COMMISSION"
		else
			LS_MEMO = "UNKNOWN TN TYPE"
		end if
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_name)+"		"+string(ld_amount,"######.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"######.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		
		FETCH cur_data2 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data2;




	// Las comisiones que cobramos por los cheques

	 DECLARE cur_data3 CURSOR FOR
	  SELECT dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA,
				'CHK CASHING COMMISION',   
				dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
				dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA,   
				dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA  
		 FROM dba.TRANSACCION_DIARIA_PAYEE 
		WHERE ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= :ld_date1 )
		  AND ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= :ld_date2 )
		  AND ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE = 'CCC' )
	ORDER BY ID_CONCEPTO_CONTABLE;
		  
	OPEN cur_data3;
	FETCH cur_data3 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ld_amount = ld_debit - ld_credit
		
		SELECT MIN(ID_BRANCH)
		  INTO :ls_name
		  FROM DBA.BRANCH
		 WHERE ID_MAIN_BRANCH = :ls_group;

		SELECT group_type
		  INTO :ls_type_group
		  FROM dba.GROUP_BRANCH
	    WHERE ID_MAIN_BRANCH = :ls_group;
				
		if ls_type_group = 'P' then
			ls_name = ls_group
			LS_ACCNT = 'Pending Orders'		
		else
			LS_ACCNT = 'AR-Customers ViaReps'
		end if
		
		if ls_concepto = 'CCC' then
			LS_MEMO = "CHK CASHING COMMISION"
		else
			LS_MEMO = "UNKNOWN TN TYPE (#1)"
		end if
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_name)+"		"+string(ld_amount,"######.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Check Processing:"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"######.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		
		FETCH cur_data3 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data3;



	// Los cheques que enviamos de comisiones


	 DECLARE cur_data4 CURSOR FOR
	  SELECT ID_GROUP_TRANS_DIARIA,
				'CASH - SETTLEMENT ASSETS:US Bank Commissions',   
				ID_CONCEPTO_CONTABLE,   
				DEBIT_TRANS_DIARIA,   
				CREDIT_TRANS_DIARIA  
		 FROM dba.TRANSACCION_DIARIA_PAYEE_COMM
		WHERE ( DATE_CHK_PRINTED >= :ld_date1 )
		  AND ( DATE_CHK_PRINTED <= :ld_date2 )
		  AND ( ID_CONCEPTO_CONTABLE = 'DAC' )
	ORDER BY ID_CONCEPTO_CONTABLE;
		  
	OPEN cur_data4;
	FETCH cur_data4 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ld_amount = ld_debit - ld_credit
		
		SELECT MIN(ID_BRANCH)
		  INTO :ls_name
		  FROM DBA.BRANCH
		 WHERE ID_MAIN_BRANCH = :ls_group;

		SELECT group_type
		  INTO :ls_type_group
		  FROM dba.GROUP_BRANCH
	    WHERE ID_MAIN_BRANCH = :ls_group;
				
		if ls_type_group = 'P' then
			ls_name = ls_group
			LS_ACCNT = 'Pending Orders'		
		else
			LS_ACCNT = 'AR-Customers ViaReps'
		end if
		
		if ls_concepto = 'DAC' then
			LS_MEMO = "AGENCY COMMISSIONS PAID BY CHECK"
		else
			LS_MEMO = "UNKNOWN TN TYPE (#2)"
		end if
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_name)+"		"+string(ld_amount,"######.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"######.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		
		FETCH cur_data4 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data4;




	ld_date = RELATIVEDATE(ld_date,1)

LOOP







THIS.TEXT = STRING(ld_date,"MM/DD/YYYY")

FileClose(ll_FileNum)

SetPointer(Arrow!)
end event

type cb_16 from commandbutton within w_checkcommissions
integer x = 1943
integer y = 392
integer width = 375
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cierre Agencia"
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, 	&
				ld_porcentaje,			&
				ld_porc_modo_pago, 	& 
          	ld_telex_modo_pago, ld_fee_rate 
	
Boolean		lb_comision_delivery	
	
Date			ld_date
Datetime    ld_datetime
string		ls_group, ls_group_payee,	&
				ls_mod_pay_currency, ls_country, ls_branch, ls_modo_pago1, ls_city, is_mod_currency
				
Double		ld_feet_comp,			&
				ld_porcentaje_comp,	&
				ld_comision_comp,		&
				ld_other = 0, ld_vlr_modo_pago = 0

Double		ld_porcentaje_comp_city = 0	,	&
         	ld_feet_comp_city= 0				,	&
         	ld_porcentaje_city= 0			,	&
         	ld_feet_city = 0					,	&
				ld_comision_city					,	&
				ld_comision_comp_city

Double		ld_porc_modo_pago_comp,		&
				ld_telex_modo_pago_comp,	&
				ld_total, 						&
				ld_balance = 0, 				&
				ld_delivery_inicial	= 0
				
Double		ld_feet = 0
				
time			ld_time = Now()

long 			ll_cont, 		&
				ll_cont1,		&
				ll_file, 		&
				ll_cont5,			&
				ll_cont_delivery, ll_contagent_group
				
				
Double		ld_cons_trans_diaria,  ld_vlr_modo_pago_comp

string		ls_standar_exclusion,		&
				ls_propia, 						&
				ls_filesql,						&
				ls_sql, ls_output
				
Datetime		ld_datefrom, ld_dateto

String 		ls_branch_pay_ori, ls_group_payee_ori

Setpointer(Hourglass!)

ld_date = relativedate(today(),-1)

ld_datefrom 	= datetime(relativedate(today(),-1),time('00:00:00'))
ld_dateto   	= datetime(relativedate(today(),-1),time('23:59:59'))


//SELECT Count(*)
//  INTO :ll_cont1
//  FROM dba.transaccion_diaria_payee
// WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) 
//   AND ( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) 
//	AND ( dba.transaccion_diaria_payee.id_concepto_contable = 'TD' );  
//
//
//if ll_cont1 > 0 then
//	return	
//end if
//
//INSERT INTO dba.responsable_cierre  
//       ( id_cashier,   
// 			date_cierre,   
//			hora_cierre,   
//			tipo_cierre )  
//VALUES ( 'CH1',:ld_datefrom,:ld_datefrom,'A' );
//
//COMMIT;
//	
//INSERT INTO dba.CONTROL_CLOSING  
// 		 ( DATE_CLOSING,CASHIER_CLOSING )  
//VALUES ( :ld_datefrom,'CH1');
//
//COMMIT;
//
////////////////////////// Recalcular las comisiones de cada Envio  /////////////////////////
//
//DECLARE comisiones CURSOR FOR  
// SELECT dba.receiver.id_country_receiver,   
//		  dba.branch.id_main_branch,   
//		  dba.receiver.net_amount_receiver,   
//		  dba.receiver.mod_pay_currency,
//		  dba.receiver.id_branch,
//		  dba.receiver.id_receiver,
//		  dba.receiver.mode_pay_receiver,
//		  dba.receiver.handling_receiver,
//		  dba.receiver.id_city_receiver,
//		  dba.receiver.branch_pay_receiver_original
//   FROM dba.receiver,   
//		  dba.branch  
//  WHERE ( dba.branch.id_branch = dba.receiver.branch_pay_receiver )
//    AND ( dba.receiver.date_receiver >= :ld_datefrom )
//	 AND ( dba.receiver.date_receiver <= :ld_dateto )
// 	 AND ( dba.receiver.id_flag_receiver <> 'A' );
//		  
//If sqlca.sqlcode < 0 then
//	FileWrite(FileNum,"Error: SQL Sentence Cursor para calcular Comisiones "+sqlca.sqlerrtext)
//	rollback;			
//	return
//end if
//	
//OPEN  comisiones ;
//FETCH  comisiones INTO :ls_country, :ls_group_payee, :ld_amount, :is_mod_currency, :ls_branch, :id_receiver, :ls_modo_pago1, :ld_other, :ls_city, :ls_branch_pay_ori;
//
//DO WHILE SQLCA.sqlcode  = 0
//
//	ll_cont_delivery	 		= 0
//	ld_feet 						= 0 
//	ld_feet_comp       		= 0 
//	ld_porcentaje      		= 0
//	ld_porcentaje_comp 		= 0
//	ld_comision        		= 0
//	ld_comision_comp	 		= 0
//	ld_porc_modo_pago_comp 	= 0
//	ll_contagent_group 		= 0
//	ld_porcentaje_comp_city = 0
//	ld_feet_comp_city			= 0
//	ld_porcentaje_city		= 0
//	ld_feet_city 				= 0		
//	ld_comision_city 			= 0
//	ld_feet_city 				= 0
//	ld_comision_comp_city 	= 0
//	ld_feet_comp_city 		= 0
//	gs_branch_insta     		= ls_branch
//	gs_country_receiver 		= ls_country
//					
//	SELECT dba.receiver.fee_rate  
//	INTO :ld_fee_rate  
//	FROM dba.receiver  
//	WHERE ( dba.receiver.id_branch = :ls_branch  ) AND  
//		( dba.receiver.id_receiver = :id_receiver );
//	
//	if isnull(ld_fee_rate) then
//		UPDATE dba.receiver  
//		SET fee_rate = 0  
//		WHERE ( dba.receiver.id_branch = :ls_branch  ) AND  
//				( dba.receiver.id_receiver = :id_receiver )   ;					
//	end if
//	
//	// <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//	// Fue una orden redireccionada (se calculan las comisiones de acuerdo al pagador original)
//	if not isnull(ls_branch_pay_ori) and len(trim(ls_branch_pay_ori)) > 1 and trim(ls_branch_pay_ori) <> '' then		
//		SELECT ID_MAIN_BRANCH 
//		INTO :ls_group_payee_ori
//		FROM DBA.BRANCH
//		WHERE ID_BRANCH = :ls_branch_pay_ori;
//		
//		If sqlca.sqlcode = 0 then
//			ls_group_payee = ls_group_payee_ori
//		end if
//	end if
//	// <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>	
//
//	If isnull(ld_other) then ld_other = 0
//	ls_propia = ""
//	
//	ls_propia = fn_agencia_propia(ls_branch)
//	ld_amount = ABS(ld_amount)
//	ll_contagent_group = 0
//	
//	SELECT Count(*)  
//     INTO :ll_contagent_group
//     FROM dba.comision_agent_modo_pago_grupo  
//    WHERE ( dba.comision_agent_modo_pago_grupo.id_branch = :gs_branch_insta ) 
//	   AND ( dba.comision_agent_modo_pago_grupo.id_main_branch = :ls_group_payee ) 
//		AND ( dba.comision_agent_modo_pago_grupo.id_country = :gs_country_receiver ) 
//		AND ( dba.comision_agent_modo_pago_grupo.mod_pay_currency = :is_mod_currency  ) 
//		AND ( dba.comision_agent_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) 
//		AND ( dba.comision_agent_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) 
//		AND ( dba.comision_agent_modo_pago_grupo.range_end_comision_pay >= :ld_amount );
//
//	IF ll_contagent_group > 0 then
//		
//		ld_vlr_modo_pago 		 = 0
//		ld_vlr_modo_pago_comp = 0	
//		
//		SELECT dba.comision_agent_modo_pago_grupo.porcent_comision_comp,   
//				 dba.comision_agent_modo_pago_grupo.feet_comision_comp,   
//				 dba.comision_agent_modo_pago_grupo.porcent_comision_agente,   
//				 dba.comision_agent_modo_pago_grupo.feet_comision_agente  
//		  INTO :ld_porcentaje_comp,   
//				 :ld_feet_comp ,   
//				 :ld_porcentaje,   
//				 :ld_feet  
//		  FROM dba.comision_agent_modo_pago_grupo  
//		 WHERE ( dba.comision_agent_modo_pago_grupo.id_branch = :gs_branch_insta ) 
//			AND ( dba.comision_agent_modo_pago_grupo.id_main_branch = :ls_group_payee ) 
//			AND ( dba.comision_agent_modo_pago_grupo.id_country = :gs_country_receiver ) 
//			AND ( dba.comision_agent_modo_pago_grupo.mod_pay_currency = :is_mod_currency  ) 
//			AND ( dba.comision_agent_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) 
//			AND ( dba.comision_agent_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) 
//			AND ( dba.comision_agent_modo_pago_grupo.range_end_comision_pay >= :ld_amount );
//	
//			ld_comision       = ( ld_amount * ld_porcentaje )   				
//			ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
//	ELSE
//	
//		SELECT Count(*)  
//		  INTO :ll_cont
//		  FROM dba.comision  
//		 WHERE ( dba.comision.id_branch = :gs_branch_insta )
//			AND ( dba.comision.id_country = :gs_country_receiver )  
//			AND ( dba.comision.range_begin_comision <= :ld_amount ) 
//			AND ( dba.comision.range_end_comision >= :ld_amount )   
//			AND ( dba.comision.mod_pay_currency	= :is_mod_currency );
//			
//		if ll_cont <> 0 then  ////////////// Verifica si esta en la tabla de Exclusion.
//			ld_feet = fn_feet(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
//			ld_feet_comp = fn_feet_company(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
//			ld_porcentaje = fn_comision(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
//			ld_porcentaje_comp = fn_comision_company(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
//			ld_comision = ( ld_amount * ld_porcentaje )   				
//			ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
//		else
//			ld_feet = fn_fee_standar(gs_country_receiver,ld_amount,is_mod_currency)
//			ld_feet_comp = fn_fee_company_standar(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
//			ld_porcentaje = fn_comision_standar(gs_country_receiver,ld_amount,is_mod_currency)
//			ld_porcentaje_comp = fn_comision_company_standar(gs_country_receiver,ld_amount,is_mod_currency)
//			ld_comision = ( ld_amount * ld_porcentaje )   				
//			ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
//		end if
//		
//		// SI ESTA EN LA TABLA COMISION_DELIVERY ANULAR LA STANDAR Y EXCLUSION
//
//		ll_cont = 0
//		lb_comision_delivery = False		
//							
//		SELECT Count(*)  
//		  INTO :ll_cont  
//		  FROM dba.comision_delivery  
//		 WHERE ( dba.comision_delivery.id_main_branch = :ls_group_payee ) 
//		   AND ( dba.comision_delivery.mod_pay_currency = :is_mod_currency ) 
//			AND ( dba.comision_delivery.id_country = :gs_country_receiver ) 
//			AND ( dba.comision_delivery.id_modo_pago = :ls_modo_pago1 ) 
//			AND ( dba.comision_delivery.range_begin <= :ld_amount ) 
//			AND ( dba.comision_delivery.range_end >= :ld_amount );
//
//			
//		if ll_cont > 0 then  
//
//			lb_comision_delivery = True	
//			
//			SELECT dba.comision_delivery.porcent_comp,   
//			    	 dba.comision_delivery.feet_comp,   
//					 dba.comision_delivery.porcent_agente,   
//					 dba.comision_delivery.feet_agente  
//			  INTO :ld_porcentaje_comp,   
//			  		 :ld_feet_comp,   
//			  		 :ld_porcentaje,   
//			       :ld_feet  
//			  FROM dba.comision_delivery  
//			 WHERE ( dba.comision_delivery.id_main_branch = :ls_group_payee ) 
//				AND ( dba.comision_delivery.mod_pay_currency = :is_mod_currency ) 
//				AND ( dba.comision_delivery.id_country = :gs_country_receiver ) 
//				AND ( dba.comision_delivery.id_modo_pago = :ls_modo_pago1 ) 
//				AND ( dba.comision_delivery.range_begin <= :ld_amount ) 
//				AND ( dba.comision_delivery.range_end >= :ld_amount );
//		
//			ld_comision = ( ld_amount * ld_porcentaje )   				
//			ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )
//			
//		end if
//
//		
//		////////////////////////////  Costo dependiendo del Modo de Pago  ///////////////////////
//					
//		ld_porc_modo_pago       = 0
//		ld_telex_modo_pago      = 0
//		ld_porc_modo_pago_comp  = 0
//		ld_telex_modo_pago_comp = 0
//		
//		SELECT dba.comision_modo_pago_grupo.porcent_comision_agente,   
//			 	 dba.comision_modo_pago_grupo.feet_comision_agente, 
//			 	 dba.comision_modo_pago_grupo.porcent_comision_comp,   
//			 	 dba.comision_modo_pago_grupo.feet_comision_comp  
//		  INTO :ld_porc_modo_pago,   
//		  	    :ld_telex_modo_pago, 
//		  		 :ld_porc_modo_pago_comp,   
//		  		 :ld_telex_modo_pago_comp 
//		  FROM dba.comision_modo_pago_grupo  
//		 WHERE ( dba.comision_modo_pago_grupo.id_main_branch = :ls_group_payee ) 
//		   AND ( dba.comision_modo_pago_grupo.id_country = :gs_country_receiver ) 
//			AND ( dba.comision_modo_pago_grupo.mod_pay_currency = :is_mod_currency ) 
//			AND ( dba.comision_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) 
//			AND ( dba.comision_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) 
//			AND ( dba.comision_modo_pago_grupo.range_end_comision_pay >= :ld_amount );
//		
//		if isnull(ld_porc_modo_pago) then  ld_porc_modo_pago  = 0
//		if isnull(ld_telex_modo_pago) then ld_telex_modo_pago = 0
//		if isnull(ld_porc_modo_pago_comp) then  ld_porc_modo_pago_comp  = 0
//		if isnull(ld_telex_modo_pago_comp) then ld_telex_modo_pago_comp = 0
//		
//		ld_vlr_modo_pago      = (ld_amount * ld_porc_modo_pago)      + ld_telex_modo_pago
//		ld_vlr_modo_pago_comp = (ld_amount * ld_porc_modo_pago_comp) + ld_telex_modo_pago_comp
//			
//		//////////////////////////////////////////////////////////////////////////////////// 
//		///// Verificar Nuevamente si al tomar el Delivery aplica la exclusion o la Standar 
// 	
//		ls_standar_exclusion = ''
//	
//		SELECT standar_exclusion   
//		  INTO :ls_standar_exclusion   
//		  FROM dba.comision_modo_pago_grupo  
//		 WHERE ( dba.comision_modo_pago_grupo.id_main_branch = :ls_group_payee ) 
//		   AND ( dba.comision_modo_pago_grupo.id_country = :gs_country_receiver ) 
//			AND ( dba.comision_modo_pago_grupo.mod_pay_currency = :is_mod_currency ) 
//			AND ( dba.comision_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) 
//			AND ( dba.comision_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) 
//			AND ( dba.comision_modo_pago_grupo.range_end_comision_pay >= :ld_amount );
//
//		if lb_comision_delivery then
//			ls_standar_exclusion = ''
//		end if
//		
//		if ls_standar_exclusion = 'S' and Not(lb_comision_delivery) then
//			ld_feet = fn_fee_standar(gs_country_receiver,ld_amount,is_mod_currency)
//			ld_feet_comp = fn_fee_company_standar(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
//			ld_porcentaje = fn_comision_standar(gs_country_receiver,ld_amount,is_mod_currency)
//			ld_porcentaje_comp = fn_comision_company_standar(gs_country_receiver,ld_amount,is_mod_currency)
//			ld_comision = ( ld_amount * ld_porcentaje )   				
//			ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
//		end if
//	
//	
// 	END IF
// 
// 
// 	//// LA TABLA COMISION_CITY ES UN ADICIONAL A LO QUE ESTE
//	ll_cont = 0 
//	ld_porcentaje_comp_city = 0
//   ld_feet_comp_city= 0
//   ld_porcentaje_city= 0
//   ld_feet_city = 0		
//	ld_comision_city = 0
//	ld_feet_city = 0
//	ld_comision_comp_city = 0
//	ld_feet_comp_city = 0
//	
//	SELECT Count(*)  
//     INTO :ll_cont  
//     FROM dba.comision_city  
//    WHERE ( dba.comision_city.id_city = :ls_city ) 
//	   AND ( dba.comision_city.id_modo_pago = :ls_modo_pago1 ) 
//		AND ( dba.comision_city.range_begin <= :ld_amount ) 
//		AND ( dba.comision_city.range_end >= :ld_amount );
//			
//	if ll_cont > 0 then
//		
//		SELECT dba.comision_city.porcent_comp,   
//        		 dba.comision_city.feet_comp,   
//        		 dba.comision_city.porcent_agente,   
//        		 dba.comision_city.feet_agente  
//    	  INTO :ld_porcentaje_comp_city,   
//             :ld_feet_comp_city,   
//             :ld_porcentaje_city,   
//             :ld_feet_city  
//    	  FROM dba.comision_city  
//  		 WHERE ( dba.comision_city.id_city = :ls_city ) 
//			AND ( dba.comision_city.id_modo_pago = :ls_modo_pago1 ) 
//			AND ( dba.comision_city.range_begin <= :ld_amount ) 
//			AND ( dba.comision_city.range_end >= :ld_amount )   ;
//				
//		ld_comision_city        = ( ld_amount * ld_porcentaje_city )   				
//		ld_comision_comp_city	= ( ld_amount * ld_porcentaje_comp_city )			
//				
//	else
//		
//		ld_porcentaje_comp_city = 0
//		ld_feet_comp_city= 0
//		ld_porcentaje_city= 0
//		ld_feet_city = 0	
//		ll_cont = 0 
//		ld_porcentaje_comp_city = 0
//		ld_feet_comp_city= 0
//		ld_porcentaje_city= 0
//		ld_feet_city = 0		
//		ld_comision_city = 0
//		ld_feet_city = 0
//		ld_comision_comp_city = 0
//		ld_feet_comp_city = 0
//		
//	end if
//	
//	ld_comision        = ld_comision        + ld_comision_city
//	ld_feet            = ld_feet            + ld_feet_city
//	ld_comision_comp   = ld_comision_comp   + ld_comision_comp_city
//	ld_feet_comp       = ld_feet_comp       + ld_feet_comp_city
//	
//	////////////////////////////////////////////////////////////////////////////////////
//
//	if  id_receiver < 0 and id_receiver > -9000000 then
//		
//			id_receiver = id_receiver * -1	
//		
//		  SELECT dba.receiver.exchange_receiver,   
//					dba.receiver.telex_receiver,   
//					dba.receiver.total_modo_pago, 
//					dba.receiver.exchange_company,   
//					dba.receiver.telex_company,   
//					dba.receiver.total_modo_pago_comp  
//		    INTO :ld_comision,
//				   :ld_feet,
//				   :ld_vlr_modo_pago,
//				   :ld_comision_comp,   
//				   :ld_feet_comp,   
//				   :ld_vlr_modo_pago_comp  
//		    FROM dba.receiver  
//		   WHERE ( dba.receiver.id_branch = :ls_branch ) 
//			  AND ( dba.receiver.id_receiver = :id_receiver );
//	
//		ld_comision           = (ld_comision   		   * -1 )
//		ld_feet               = (ld_feet   		   		* -1 )
//		ld_vlr_modo_pago      = (ld_vlr_modo_pago   	   * -1 )
//		
//		// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//// No se retornan las comisiones a la agencia!
//		//		ld_comision_comp      = (ld_comision_comp   		* -1 )
//		//		ld_feet_comp          = (ld_feet_comp		  		* -1 )	
//		//		ld_vlr_modo_pago_comp = (ld_vlr_modo_pago_comp  * -1 )
//		ld_comision_comp      = 0
//		ld_feet_comp          = 0
//		ld_vlr_modo_pago_comp = 0
//		// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::		
//		
//		id_receiver           = id_receiver * -1	
//
//	end if
//
//	// si es una agencia propia iguala las comisiones
//	if ls_propia = 'S' then   
//
//		ld_comision_comp      = ld_comision
//		ld_feet_comp 			 = ld_feet
//		ld_vlr_modo_pago_comp = ld_vlr_modo_pago
//		ld_porcentaje_comp 	 = ld_porcentaje
//	
//		UPDATE dba.receiver  
//		   SET dba.receiver.exchange_company = :ld_comision_comp,   
//			    dba.receiver.telex_company = :ld_feet_comp,   
//			    dba.receiver.total_modo_pago_comp = :ld_vlr_modo_pago_comp
//		 WHERE ( dba.receiver.id_branch = :ls_branch )
//		   AND ( dba.receiver.id_receiver = :id_receiver );		
//	else
//		
//		UPDATE dba.receiver  
//			SET dba.receiver.exchange_company = :ld_comision_comp,   
//				 dba.receiver.telex_company = :ld_feet_comp,   
//				 dba.receiver.total_modo_pago_comp = :ld_vlr_modo_pago_comp,
//				 dba.receiver.handling_receiver = 0
//		 WHERE ( dba.receiver.id_branch = :ls_branch ) 
//		   AND ( dba.receiver.id_receiver = :id_receiver );
//	
//	end if	
//	
//	ls_propia = ""	
//	
//	FETCH  comisiones INTO :ls_country, :ls_group_payee, :ld_amount, :is_mod_currency, :ls_branch, :id_receiver, :ls_modo_pago1, :ld_other, :ls_city, :ls_branch_pay_ori;
//LOOP
//
//CLOSE comisiones;
//	
//Commit;
//
/////////////////////////////////////////////////////////////////////////////////////////


String ls_id_branch, ls_id_main_branch

ls_id_main_branch = 'M116'

ls_id_branch = 'A01317'


SELECT Count(*)
  INTO :ll_cont1
  FROM dba.transaccion_diaria_payee
 WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) 
   AND ( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) 
	AND ( dba.transaccion_diaria_payee.id_concepto_contable = 'TD' )
	AND ID_GROUP_TRANS_DIARIA = :ls_id_main_branch ;
			
If sqlca.sqlcode < 0 then
	//FileWrite(FileNum,"Error: SQL Sentence Borrado Closing Anterior "+sqlca.sqlerrtext)
	rollback;
	return
end if

if ll_cont1 > 0 then
	
	//Borrar el Closing Realizado Anteriormente
	DELETE FROM dba.relacion_invoices_payee  
	 WHERE (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_datefrom  ) 
	   AND (dba.relacion_invoices_payee.date_relacion_diaria <= :ld_dateto  ) 
		AND (dba.relacion_invoices_payee.id_concepto_contable  = 'TD' )
		AND ID_BRANCH_INVOICE = :ls_id_branch;
	
	If sqlca.sqlcode < 0 then
		//FileWrite(FileNum,"Error: SQL Sentence Borrado Closing Detalle"+sqlca.sqlerrtext)
		rollback;				
		return
	end if

	DELETE FROM dba.transaccion_diaria_payee
	 WHERE ( dba.transaccion_diaria_payee.id_concepto_contable = 'TD' ) 
	   AND ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom) 
		AND ( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto)
		AND ID_GROUP_TRANS_DIARIA = :ls_id_main_branch ;
			
	If sqlca.sqlcode < 0 then
		//FileWrite(FileNum,"Error: SQL Sentence Borrando el closing papa"+sqlca.sqlerrtext)
		rollback;
		return
	end if
	
end if

DECLARE branch_cierre CURSOR FOR  
SELECT DISTINCT dba.branch.id_main_branch  
  FROM dba.branch,   
	    dba.receiver  
 WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) 
   AND ( dba.receiver.id_receiver > 0 ) 
	AND ( dba.receiver.date_receiver >= :ld_datefrom ) 
	AND ( dba.receiver.date_receiver <= :ld_dateto )
	AND ( dba.receiver.id_branch = :ls_id_branch )
	AND ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
																									                FROM dba.relacion_invoices_payee
																									               WHERE (dba.relacion_invoices_payee.id_concepto_contable  = 'TD' )
																										              AND (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver )
																										              AND (dba.receiver.id_branch = dba.relacion_invoices_payee.id_branch_invoice))	;

If sqlca.sqlcode < 0 then
	//FileWrite(FileNum,"Error: SQL Sentence Cursor Relacionar Cierre "+sqlca.sqlerrtext)
	rollback;
	return
end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0

	SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.exchange_company + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.handling_receiver + dba.receiver.fee_rate)
    INTO :ld_valor  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch )
     AND ( dba.branch.id_main_branch = :ls_group )
     AND ( dba.receiver.id_flag_receiver <> 'A' )
	  AND ( dba.receiver.id_receiver > 0 )
     AND ( dba.receiver.date_receiver >= :ld_datefrom )
	  AND ( dba.receiver.date_receiver <= :ld_dateto )
	  AND ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                                       FROM dba.relacion_invoices_payee
																										              WHERE (dba.relacion_invoices_payee.id_concepto_contable  = 'TD' )
																										 		          AND (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver )
																										 		          AND (dba.receiver.id_branch = dba.relacion_invoices_payee.id_branch_invoice));

	if isnull(ld_valor) then
		ld_valor = 0
	end if

	If sqlca.sqlcode < 0 then
		//FileWrite(FileNum,"Error: SQL Sentence SUMANDO LOS VALORES"+sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))
		
	SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
	  INTO :ld_cons  
	  FROM dba.transaccion_diaria_payee;
	
	if sqlca.sqlcode < 0 then
		//FileWrite(FileNum,"Error: SQL Sentence CONSULTANDO EL CONSECUTIVO"+sqlca.sqlerrtext)
		rollback;
		return
	end if
		
	if isnull(ld_cons) then ld_cons = 1
	
	if ISNULL(ld_balance) then ld_balance = 0
	ld_balance = round(ld_balance,2) + round(ld_valor,2)
	
	ld_datetime = datetime(ld_date,ld_time)
	
	INSERT INTO dba.transaccion_diaria_payee  
	       ( cons_trans_diaria,   
	  		   id_group_trans_diaria,   
	  			date_trans_diaria,   
	  			hour_trans_diaria,   
	  			id_concepto_contable,   
	  			des_trans_diaria,   
	  			debit_trans_diaria,   
	  			credit_trans_diaria,   
	  			balance_trans_diaria )  
	VALUES ( :ld_cons,:ls_group,:ld_date,:ld_datetime,   
		      'TD','CLOSING AGENT',:ld_valor,0,:ld_balance )  ;
				
	If sqlca.sqlcode < 0 then
		//FileWrite(FileNum,"Error: SQL Sentence INSERTANDO EL MAESTRO DEL CIERRE"+sqlca.sqlerrtext)
		rollback;
		return
	end if
			  
				
	INSERT INTO dba.relacion_invoices_payee  
	       ( cons_trans_diaria,   
		      id_branch_invoice,   
		      id_receiver,   
		      date_relacion_diaria,
		      id_concepto_contable  )  
	SELECT :ld_cons,   
			 dba.receiver.id_branch,   
			 dba.receiver.id_receiver,   
			 :ld_date,
			 'TD'
	  FROM dba.branch,   
			 dba.receiver  
	 WHERE ( dba.receiver.id_branch = dba.branch.id_branch )
		AND (  dba.branch.id_main_branch = :ls_group )
		AND ( dba.receiver.id_flag_receiver <> 'D' )
		AND ( dba.receiver.id_receiver > 0 )
		AND ( dba.receiver.date_receiver >= :ld_datefrom )
		AND ( dba.receiver.date_receiver <= :ld_dateto )
		AND ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver)
																								                      FROM dba.relacion_invoices_payee
																								                     WHERE (dba.relacion_invoices_payee.id_concepto_contable  = 'TD' )
																										                 AND (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver )
																										 		           AND (dba.receiver.id_branch = dba.relacion_invoices_payee.id_branch_invoice));
						
	If sqlca.sqlcode < 0 then
		//FileWrite(FileNum,"Error: SQL Sentence In Relation Invoices "+sqlca.sqlerrtext)
		rollback;
		return
	end if
			
	Fetch branch_cierre into :ls_group;

LOOP

CLOSE branch_cierre;

COMMIT;

Setpointer(Arrow!)

end event

type cb_17 from commandbutton within w_checkcommissions
integer x = 2235
integer y = 588
integer width = 517
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cierre Cancelaciones"
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, 	&
				ld_porcentaje,			&
				ld_porc_modo_pago, 	& 
          	ld_telex_modo_pago, ld_fee_rate 
	
Boolean		lb_comision_delivery	
	
Date			ld_date 
Datetime    ld_datetime
string		ls_group, ls_group_payee,	&
				ls_mod_pay_currency, ls_country, ls_branch, ls_modo_pago1, ls_city
				
Double		ld_feet_comp,			&
				ld_porcentaje_comp,	&
				ld_comision_comp,		&
				ld_other = 0, ld_vlr_modo_pago = 0

Double		ld_porcentaje_comp_city = 0	,	&
         	ld_feet_comp_city= 0				,	&
         	ld_porcentaje_city= 0			,	&
         	ld_feet_city = 0					,	&
				ld_comision_city					,	&
				ld_comision_comp_city

Double		ld_porc_modo_pago_comp,		&
				ld_telex_modo_pago_comp,	&
				ld_total, 						&
				ld_balance = 0, 				&
				ld_delivery_inicial	= 0
				
Double		ld_feet = 0
				
time			ld_time = Now()

long 			ll_cont, 		&
				ll_cont1,		&
				ll_file, 		&
				ll_cont5,			&
				ll_cont_delivery, ll_contagent_group
				
				
Double		ld_cons_trans_diaria,  ld_vlr_modo_pago_comp

string		ls_standar_exclusion,		&
				ls_propia, 						&
				ls_filesql,						&
				ls_sql, ls_output
				
Datetime		ld_new_date , ld_datefrom, ld_dateto

String 		ls_group_to_close, ls_branch_to_close

Setpointer(Hourglass!)



Commit;

	ld_date = date('06/23/2006')
	ls_group_to_close = 'G075'


	
	String ls_description
	ls_description = 'CLOSING CANC. AGENT'
	//+string(ld_date,'dd/mm/yyyy')

	
	select id_branch
	into :ls_branch_to_close
	from dba.branch
	where id_main_branch = :ls_group_to_close;
	
	
	ld_datefrom 	= datetime(ld_date,time('00:00:00'))
	ld_dateto   	= datetime(ld_date,time('23:59:59'))

	SELECT Count(*)
	INTO :ll_cont1
	FROM dba.transaccion_diaria_payee
	WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND  
			( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) AND
			id_group_trans_diaria = :ls_group_to_close;  

//				if ll_cont1 > 0 then
//		         messagebox("Warning","Closing already Done,") 
//					return	
//				end if

	 SELECT Count(*)
    INTO :ll_cont1
    FROM dba.transaccion_diaria_payee
    WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND   
	 		 ( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			 ( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) and
			 id_group_trans_diaria = :ls_group_to_close;  
			
	If sqlca.sqlcode < 0 then
//		FileWrite(FileNum,"Error: SQL Sentence Borrado Closing Anterior "+sqlca.sqlerrtext)
		rollback;
		return
	end if

	if ll_cont1 > 0 then
			//Borrar el Closing Realizado Anteriormente
			DELETE FROM dba.relacion_invoices_payee  
   		WHERE  (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_datefrom  ) and
					 (dba.relacion_invoices_payee.date_relacion_diaria <= :ld_dateto  ) and
					 (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
					 ID_BRANCH_INVOICE = :ls_branch_to_close;
			
			If sqlca.sqlcode < 0 then
				rollback;
//				FileWrite(FileNum,"Error: SQL Sentence Borrado Closing Detalle"+sqlca.sqlerrtext)
				return
			end if

		 	DELETE FROM dba.transaccion_diaria_payee
   		WHERE ( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) AND  
					( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom) and
					( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto  ) and
					id_group_trans_diaria = :ls_branch_to_close;
					
			If sqlca.sqlcode < 0 then
//				FileWrite(FileNum,"Error: SQL Sentence bORRANDO EL cLOSING PAPA"+sqlca.sqlerrtext)
				rollback;
				return
			end if
	end if
	
	DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
			( dba.receiver.id_receiver < 0 ) AND
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.date_receiver >= :ld_datefrom ) AND
			( dba.receiver.date_receiver <= :ld_dateto)    AND
			dba.branch.id_main_branch = :ls_group_to_close and
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice) and
																													 ID_BRANCH_INVOICE = :ls_branch_to_close)	;

				
	If sqlca.sqlcode < 0 then
//		FileWrite(FileNum,"Error: SQL Sentence Cursor Relacionar Cierre "+sqlca.sqlerrtext)
		rollback;
		return
	end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0

	SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.exchange_company + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.handling_receiver + dba.receiver.fee_rate)	
    INTO :ld_valor  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and  
         ( dba.branch.id_main_branch = :ls_group ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.id_receiver < 0 ) AND
			( dba.receiver.date_receiver >= :ld_datefrom ) AND
			( dba.receiver.date_receiver <= :ld_dateto)    AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;


	
	
		if isnull(ld_valor) then
			ld_valor = 0
		end if

		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence SUMANDO LOS VALORES"+sqlca.sqlerrtext)
			rollback;
			return
		end if
	  
		 SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
	 
		 if sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence CONSULTANDO EL CONSECUTIVO"+sqlca.sqlerrtext)
			rollback;
			return
		 end if
		
			if isnull(ld_cons) then ld_cons = 1
			ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
			if ISNULL(ld_balance) then ld_balance = 0
			ld_balance = round(ld_balance,2) + round(ld_valor,2)
			
			ld_valor = abs(ld_valor)
			ld_datetime = datetime(ld_date,ld_time)
						
		  INSERT INTO dba.transaccion_diaria_payee  
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria )  
  			VALUES ( :ld_cons,:ls_group,:ld_date,:ld_datetime,   
            'AVO',:ls_description,0,:ld_valor,:ld_balance )  ;
				
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence INSERTANDO EL MAESTRO DEL CIERRE"+sqlca.sqlerrtext)
			return
		end if
			
			INSERT INTO dba.relacion_invoices_payee  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )  
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_date,
						'AVO'
    			FROM  dba.branch,   
         			dba.receiver  
   			WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and  
         			( dba.branch.id_main_branch = :ls_group ) AND  
         			( dba.receiver.id_flag_receiver = 'C' ) AND
						( dba.receiver.net_amount_receiver < 0 ) AND
						( dba.receiver.id_receiver < 0 ) AND
						( dba.receiver.date_receiver >= :ld_datefrom ) AND
						( dba.receiver.date_receiver <= :ld_dateto)    AND					
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver)
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

						
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence In Relation Invoices"+sqlca.sqlerrtext)
			rollback;
			return
		end if

			
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;

commit ;
Setpointer(Arrow!)


end event

type cb_13 from commandbutton within w_checkcommissions
integer x = 50
integer y = 608
integer width = 562
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Chk Compliance"
end type

event clicked;fn_chkcompliance(sle_branch.text,double(sle_receiver.text))
end event

type sle_branch from singlelineedit within w_checkcommissions
integer x = 46
integer y = 516
integer width = 283
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "A0"
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_receiver from singlelineedit within w_checkcommissions
integer x = 338
integer y = 512
integer width = 283
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_18 from commandbutton within w_checkcommissions
integer x = 2071
integer y = 704
integer width = 667
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "QuickBooks"
end type

event clicked;SetPointer(HourGlass!)

String 	ls_line, ls_type_group
String 	ls_id_branch, ls_payer, ls_bank
Double 	ld_total, ld_viafees, ld_customerfees, ld_payerfees, ld_total_and_fees, ld_agency_fees
DateTime	ld_date1, ld_date2
Date		ld_date
String 	ls_FileName
Long		ll_FileNum

ld_date = date('2007-05-01')

ls_FileName = "C:\MTSA_ACC_Export_"+String(ld_date,"yyyy-mm")+"additional.iif"
ll_FileNum = FileOpen(ls_FileName,LineMode!,Write!,LockReadWrite!,Replace!)

	DO WHILE ld_date < DATE('2007-06-01')
	
		ld_date1 = DateTime(ld_date,time('00:00:00'))
		ld_date2 = DateTime(ld_date,time('23:59:59'))
	
//	  DECLARE cur_data CURSOR FOR
//		SELECT dba.RECEIVER.ID_BRANCH,   
//				dba.BRANCH.ID_MAIN_BRANCH,
//				dba.sfGetBranchBank(dba.RECEIVER.ID_BRANCH) AS BANK,
//				SUM(dba.RECEIVER.NET_AMOUNT_RECEIVER) TOTAL,
//				SUM((dba.receiver.exchange_company + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.handling_receiver + dba.receiver.fee_rate)) AS VIAFEES,
//				SUM((dba.RECEIVER.TELEX_RECEIVER+dba.RECEIVER.EXCHANGE_RECEIVER)) AS CUSTOMERFEES,
//				SUM(dba.RECEIVER.COMMISSION_PAYEE) PAYERFEES
//		 FROM dba.BRANCH,   
//				dba.RECEIVER  
//		WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER )
//		  AND ( dba.RECEIVER.date_receiver >= :ld_date1 )
//		  AND ( dba.RECEIVER.date_receiver <= :ld_date2 )
//		GROUP BY dba.RECEIVER.ID_BRANCH, dba.BRANCH.ID_MAIN_BRANCH;
//	
//	FileWrite(ll_FileNum,"!TRNS	TRNSID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	TOPRINT	NAMEISTAXABLE	ADDR1	ADDR3	TERMS	SHIPVIA	SHIPDATE")
//	FileWrite(ll_FileNum,"!SPL	SPLID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	QNTY	PRICE	INVITEM	TAXABLE	OTHER2	YEARTODATE	WAGEBASE")
//	
//	OPEN cur_data;
//	FETCH cur_data INTO :ls_id_branch, :ls_payer, :ls_bank, :ld_total, :ld_viafees, :ld_customerfees, :ld_payerfees;
//	DO WHILE SQLCA.SQLCODE = 0
//	
//		ls_line = ''
//		
//		ld_total = round(ld_total,2)
//		ld_customerfees = round(ld_customerfees,2)
//		
//		ld_total_and_fees = ld_total + ld_customerfees
//		ld_agency_fees = ld_customerfees - ld_viafees
///*	
//		FileWrite(ll_FileNum,"!ENDTRNS																	")	
//		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_total_and_fees,"######.00")+"										")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Transfer Fees	"+trim(ls_id_branch)+"		"+string(ld_customerfees * -1,"######.00")+"										")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Pending Orders	"+trim(ls_payer)+"		"+string(ld_total * -1,"######.00")+"										")
//		FileWrite(ll_FileNum,"ENDTRNS																	")
//		FileWrite(ll_FileNum,"!ENDTRNS																	")
//		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	AR-Customers ViaReps	"+trim(ls_id_branch)+"		"+string(ld_agency_fees * -1,"######.00")+"										")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - US Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_agency_fees,"######.00")+"										")
//		FileWrite(ll_FileNum,"ENDTRNS																	")
//		FileWrite(ll_FileNum,"!ENDTRNS																	")
//		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Pending Orders	"+trim(ls_payer)+"		"+string(ld_payerfees * -1,"######.00")+"										")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	COGS - Payout Agent Commission	"+trim(ls_id_branch)+"		"+string(ld_payerfees,"######.00")+"		"+ls_payer+"								")
//		FileWrite(ll_FileNum,"ENDTRNS																	")
//*/
//
//		FETCH cur_data INTO :ls_id_branch, :ls_payer, :ls_bank, :ld_total, :ld_viafees, :ld_customerfees, :ld_payerfees;
//	LOOP
//	CLOSE cur_data;
	
	String	ls_group, ls_concepto, LS_ACCNT, ls_name, LS_MEMO
	Double	ld_debit, ld_credit, ld_amount
	
	
	 DECLARE cur_data2 CURSOR FOR
	  SELECT dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA,
				dba.BANCO.NAME_BANCO,   
				dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
				dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA,   
				dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA  
		 FROM dba.TRANSACCION_DIARIA_BANCO_PAYEE,   
				dba.TRANSACCION_DIARIA_PAYEE,   
				dba.BANCO, dba.TMP_06122007
		WHERE ( dba.TRANSACCION_DIARIA_BANCO_PAYEE.CONS_TRANS_DIARIA = dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA )
		  AND ( dba.TRANSACCION_DIARIA_BANCO_PAYEE.ID_BANCO = dba.BANCO.ID_BANCO )
		  AND ( dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE >= :ld_date1 )
		  AND ( dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE <= :ld_date2 )
		  and ( dba.TMP_06122007.CONS = dba.TRANSACCION_DIARIA_BANCO_PAYEE.CONS_TRANS_DIARIA )
	ORDER BY ID_CONCEPTO_CONTABLE;
		  
	OPEN cur_data2;
	FETCH cur_data2 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
	DO WHILE SQLCA.SQLCODE = 0
		
		ld_amount = ld_debit - ld_credit
		
		SELECT MIN(ID_BRANCH)
		  INTO :ls_name
		  FROM DBA.BRANCH
		 WHERE ID_MAIN_BRANCH = :ls_group;

		SELECT group_type
		  INTO :ls_type_group
		  FROM dba.GROUP_BRANCH
	    WHERE ID_MAIN_BRANCH = :ls_group;
				
		if ls_type_group = 'P' then
			ls_name = ls_group
			LS_ACCNT = 'Pending Orders'		
		else
			LS_ACCNT = 'AR-Customers ViaReps'
		end if
		
		if ls_concepto = 'ACH' then
			LS_MEMO = "ACH AGENCY"
		elseif ls_concepto = 'DA' then
			LS_MEMO = "DEPOSIT AGENCY"
		elseif ls_concepto = 'DE' then
			LS_MEMO = "AJUSTMENT (TELLER ERROR)"
		elseif ls_concepto = 'AC' then
			LS_MEMO = "AJUSTMENT"
		elseif ls_concepto = 'DP' then
			LS_MEMO = "WIRE PAYER"	
		elseif ls_concepto = 'CCC' then
			LS_MEMO = "CHK CASHING COMMISION (DEBIT)"
		elseif ls_concepto = 'CCD' then
			LS_MEMO = "CHK CASHING DEPOSIT (CREDIT)"
		elseif ls_concepto = 'CCK' then
			LS_MEMO = "CHK CASHING RETURN CHARGE (DEBIT)"
		elseif ls_concepto = 'CCL' then
			LS_MEMO = "CHK CASHING EQUIPMENT LEASE (DEBIT)"
		elseif ls_concepto = 'CCM' then
			LS_MEMO = "CHK CASHING MONTHLY FEE (DEBIT)"
		elseif ls_concepto = 'CCR' then
			LS_MEMO = "CHK CASHING RETURN CHECK (DEBIT)"
		elseif ls_concepto = 'CCW' then
			LS_MEMO = "CHK CASHING WIRE TO AGENT (DEBIT)"
		elseif ls_concepto = 'CCY' then
			LS_MEMO = "CHK CASHING WIRE CHARGE (DEBIT)"
		elseif ls_concepto = 'ARF' then
			LS_MEMO = "RETURNED ACH FEE"
		elseif ls_concepto = 'BNO' then
			LS_MEMO = "BANK AND OTHER COSTS"
		elseif ls_concepto = 'DRC' then
			LS_MEMO = "RETURNED CHK FEE"
		elseif ls_concepto = 'INT' then
			LS_MEMO = "INTERESTS"
		elseif ls_concepto = 'INC' then
			LS_MEMO = "INTERESTS COLLECTION"
		elseif ls_concepto = 'PCS' then
			LS_MEMO = "PETTY CASH"		
		elseif ls_concepto = 'SCM' then
			LS_MEMO = "SPECIAL COMMISSION"
		else
			LS_MEMO = "UNKNOWN TN TYPE"
		end if
		
		FileWrite(ll_FileNum,"!ENDTRNS																	")
		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_name)+"		"+string(ld_amount,"######.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"######.00")+"		"+LS_MEMO+"								")
		FileWrite(ll_FileNum,"ENDTRNS																	")
		
		FETCH cur_data2 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
		
	LOOP
	CLOSE cur_data2;




	// Las comisiones que cobramos por los cheques

//	 DECLARE cur_data3 CURSOR FOR
//	  SELECT dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA,
//				'CHK CASHING COMMISION',   
//				dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE,   
//				dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA,   
//				dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA  
//		 FROM dba.TRANSACCION_DIARIA_PAYEE 
//		WHERE ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= :ld_date1 )
//		  AND ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= :ld_date2 )
//		  AND ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE = 'CCC' )
//	ORDER BY ID_CONCEPTO_CONTABLE;
//		  
//	OPEN cur_data3;
//	FETCH cur_data3 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
//	DO WHILE SQLCA.SQLCODE = 0
//		
//		ld_amount = ld_debit - ld_credit
//		
//		SELECT MIN(ID_BRANCH)
//		  INTO :ls_name
//		  FROM DBA.BRANCH
//		 WHERE ID_MAIN_BRANCH = :ls_group;
//
//		SELECT group_type
//		  INTO :ls_type_group
//		  FROM dba.GROUP_BRANCH
//	    WHERE ID_MAIN_BRANCH = :ls_group;
//				
//		if ls_type_group = 'P' then
//			ls_name = ls_group
//			LS_ACCNT = 'Pending Orders'		
//		else
//			LS_ACCNT = 'AR-Customers ViaReps'
//		end if
//		
//		if ls_concepto = 'CCC' then
//			LS_MEMO = "CHK CASHING COMMISION"
//		else
//			LS_MEMO = "UNKNOWN TN TYPE (#1)"
//		end if
///*		
//		FileWrite(ll_FileNum,"!ENDTRNS																	")
//		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_name)+"		"+string(ld_amount,"######.00")+"		"+LS_MEMO+"								")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	Revenue - Check Processing:"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"######.00")+"		"+LS_MEMO+"								")
//		FileWrite(ll_FileNum,"ENDTRNS																	")
//*/
//
//		FETCH cur_data3 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
//		
//	LOOP
//	CLOSE cur_data3;



	// Los cheques que enviamos de comisiones


//	 DECLARE cur_data4 CURSOR FOR
//	  SELECT ID_GROUP_TRANS_DIARIA,
//				'CASH - SETTLEMENT ASSETS:US Bank Commissions',   
//				ID_CONCEPTO_CONTABLE,   
//				DEBIT_TRANS_DIARIA,   
//				CREDIT_TRANS_DIARIA  
//		 FROM dba.TRANSACCION_DIARIA_PAYEE_COMM
//		WHERE ( DATE_CHK_PRINTED >= :ld_date1 )
//		  AND ( DATE_CHK_PRINTED <= :ld_date2 )
//		  AND ( ID_CONCEPTO_CONTABLE = 'DAC' )
//	ORDER BY ID_CONCEPTO_CONTABLE;
//		  
//	OPEN cur_data4;
//	FETCH cur_data4 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
//	DO WHILE SQLCA.SQLCODE = 0
//		
//		ld_amount = ld_debit - ld_credit
//		
//		SELECT MIN(ID_BRANCH)
//		  INTO :ls_name
//		  FROM DBA.BRANCH
//		 WHERE ID_MAIN_BRANCH = :ls_group;
//
//		SELECT group_type
//		  INTO :ls_type_group
//		  FROM dba.GROUP_BRANCH
//	    WHERE ID_MAIN_BRANCH = :ls_group;
//				
//		if ls_type_group = 'P' then
//			ls_name = ls_group
//			LS_ACCNT = 'Pending Orders'		
//		else
//			LS_ACCNT = 'AR-Customers ViaReps'
//		end if
//		
//		if ls_concepto = 'DAC' then
//			LS_MEMO = "AGENCY COMMISSIONS PAID BY CHECK"
//		else
//			LS_MEMO = "UNKNOWN TN TYPE (#2)"
//		end if
///*		
//		FileWrite(ll_FileNum,"!ENDTRNS																	")
//		FileWrite(ll_FileNum,"TRNS		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+LS_ACCNT+"	"+trim(ls_name)+"		"+string(ld_amount,"######.00")+"		"+LS_MEMO+"								")
//		FileWrite(ll_FileNum,"SPL		GENERAL JOURNAL	"+String(ld_date1,"mm/dd/yyyy")+"	"+trim(ls_bank)+"	"+trim(ls_name)+"		"+string(ld_amount * -1,"######.00")+"		"+LS_MEMO+"								")
//		FileWrite(ll_FileNum,"ENDTRNS																	")
//*/		
//		FETCH cur_data4 INTO :ls_group, :ls_bank, :ls_concepto, :ld_debit, :ld_credit;
//		
//	LOOP
//	CLOSE cur_data4;






	ld_date = RELATIVEDATE(ld_date,1)

LOOP









THIS.TEXT = STRING(ld_date,"MM/DD/YYYY")

FileClose(ll_FileNum)

SetPointer(Arrow!)
end event

type cb_19 from commandbutton within w_checkcommissions
integer y = 1024
integer width = 640
integer height = 100
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Catalogar IDs"
end type

event clicked;
lb_1.dirlist("U:\Compliance\Processed\a*.*",16)

integer li_i, li_j, li_pos1, li_pos2
string ls_folder, ls_file, ls_branch, ls_global_sender, ls_newfolder
double ld_receiver
long ll_Filelog

for li_i = 2 to lb_1.totalitems()
	lb_1.selectitem(li_i)
//	messagebox("",lb_1.SelectedItem())
	ls_folder = "U:\Compliance\Processed\" +  fn_replace(fn_replace(lb_1.SelectedItem(),"[",""),"]","")
	
	if upper( fn_replace(fn_replace(lb_1.SelectedItem(),"[",""),"]","") ) <> 'SENDERS' then
		//Messagebox("",ls_folder+"\*.*")
		
		if lb_2.dirlist(ls_folder+"\*.*",32) then
			
		
			if lb_2.totalitems()  = 0 then
				//Messagebox("",ls_folder)
				//return
				/////Removedirectory( ls_folder )
				// habilitar con cuidado!
				
			else
													
				for li_j =1 to lb_2.totalitems() 
				
					lb_2.selectitem(li_j)
					ls_file = lb_2.SelectedItem()
				
					//0_A00315_123_fecha.tif
					
					ld_receiver = 0
					
					ls_branch = fn_token(ls_file,"_",2)
					
					if ls_branch = 'AOO120' then ls_branch = 'A00120'
					
					if isnumber(fn_token(ls_file,"_",3)) then
						// Tiene una sola orden
						ld_receiver = double(fn_token(ls_file,"_",3))
					elseif isnumber( fn_token(fn_token(ls_file,"_",3),'-',1)  )   then
						//Tiene dos ordenes separadas por -
						ld_receiver = double(fn_token(fn_token(ls_file,"_",3),'-',1))					
					end if
					
					//Messagebox(string(ld_receiver),ls_branch)
				
					if ld_receiver <> 0 then
				
						ls_global_sender = ''
				
						 SELECT convert(varchar,id_sender_global)
							 INTO :ls_global_sender
							FROM dba.receiver, dba.sender
						 WHERE dba.receiver.ID_BRANCH = dba.sender.ID_BRANCH
							 AND dba.receiver.id_sender = dba.sender.id_sender
							 AND dba.receiver.id_branch = :ls_branch
							 AND dba.receiver.id_receiver = :ld_receiver;
						
						if SQLCA.SQLCODE <> 0 or isnull(ls_global_sender) or ls_global_sender = '0' or ls_global_sender = '' then		
							//hubo un error
						else
							
							ls_global_sender = trim(ls_global_sender)
				
							ls_newfolder = "U:\Compliance\Processed\Senders\" + ls_global_sender	
				
							if not fileexists(ls_newfolder) then CreateDirectory ( ls_newfolder )			
				
							//Messagebox(ls_folder + "\" + ls_file, ls_newfolder + "\" + ls_file)	
							fn_filemove(ls_folder + "\" + ls_file, ls_newfolder + "\" + ls_file)	
				
			
				
						end if			
				
					end if
				
				next
				
			end if			
			
			
		end if
	end if
	
		
next 

end event

type lb_1 from listbox within w_checkcommissions
integer y = 1176
integer width = 987
integer height = 960
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type lb_2 from listbox within w_checkcommissions
integer x = 1024
integer y = 1176
integer width = 987
integer height = 960
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_20 from commandbutton within w_checkcommissions
integer x = 1061
integer y = 680
integer width = 686
integer height = 288
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test DSO"
end type

event clicked;// ----------------------------------------------
// This Script runs every night on MTClosing and
// can be runned manually in w_balancemgmt
// ----------------------------------------------

string   ls_group
double   ld_balance, ld_remamount, ld_remadjamount, ld_dailydebits, ld_amttobereconciled
date     ld_movingdate, ld_dsodate
decimal  ld_dso, ld_ajusteddso
datetime ld_datefrom, ld_dateto
boolean  lb_ajusteddsodone

Setpointer(HourGlass!)

ld_dsodate = today()


 DECLARE cur_groups CURSOR FOR  
  SELECT ID_MAIN_BRANCH, 
         balance_group,
			fin_amttobereconciled
    FROM dba.GROUP_BRANCH  
   WHERE dba.GROUP_BRANCH.group_type in ('A','R')
	//and id_main_branch = 'M004'
	ORDER BY ID_MAIN_BRANCH;

open cur_groups;

fetch cur_groups into :ls_group, :ld_balance, :ld_amttobereconciled;

do while SQLCA.SQLCode = 0 
	
	//this.text = "Calculating Group "+ls_group
	
	if isnull(ld_balance) then ld_balance = 0
	if isnull(ld_amttobereconciled) then ld_amttobereconciled = 0	
	
	ld_movingdate = relativedate(ld_dsodate,-1)
	ld_remamount = ld_balance
	ld_remadjamount = ld_balance - ld_amttobereconciled
	ld_dso = 0
	ld_ajusteddso = 0
	lb_ajusteddsodone = FALSE
	
	do while ld_remamount > 0

		if upper(DayName(ld_movingdate)) <> 'SUNDAY' then

			// Las transacciones del Domingo son sumadas el dia Lunes!
			if upper(DayName(ld_movingdate)) = 'MONDAY' then
				ld_datefrom = datetime(relativedate(ld_movingdate, -1),time('00:00:00'))
			else
				ld_datefrom = datetime(ld_movingdate,time('00:00:00'))
			end if
			
			ld_dateto = datetime(ld_movingdate,time('23:59:59'))	
			
			// Get the daily debits (transactions - cancelations)	
			SELECT sum(debit_trans_diaria) - sum(credit_trans_diaria)  
			INTO :ld_dailydebits  
			FROM dba.TRANSACCION_DIARIA_PAYEE  
			WHERE ( dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA = :ls_group ) AND  
				   ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE in ('AVO','TD') ) AND  
				   ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= :ld_datefrom ) AND
				   ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= :ld_dateto );
		
			if isnull(ld_dailydebits) then ld_dailydebits = 0
		
			ld_remamount = ld_remamount - ld_dailydebits
			ld_remadjamount = ld_remadjamount - ld_dailydebits
			
			// DSO
			if ld_remamount > 0 then
				ld_dso++
			else			
				if ld_dailydebits > 0 then				
					ld_dso = ld_dso + ((ld_remamount + ld_dailydebits) / ld_dailydebits ) // Percentage for the last day
				end if
			end if						

			// Adjusted DSO
			if ld_remadjamount > 0 then
				ld_ajusteddso++
			else
				if ld_dailydebits > 0 and not lb_ajusteddsodone then
					ld_ajusteddso = ld_ajusteddso + ((ld_remadjamount + ld_dailydebits) / ld_dailydebits ) // Percentage for the last day
					lb_ajusteddsodone = TRUE
				end if
			end if
			
			// Maximun DSO = 30 days
			if ld_dso > 29 then
				ld_remamount = -1
			end if

		end if

		ld_movingdate = relativedate(ld_movingdate,-1)

	loop

	ld_dso = round(ld_dso,2)
	ld_ajusteddso = round(ld_ajusteddso,2)



	// Actualiza el DSO para el grupo
	UPDATE dba.GROUP_BRANCH
	SET fin_dso = :ld_dso,
	    fin_ajusteddso = :ld_ajusteddso
	WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :ls_group;

	If sqlca.sqlcode <> 0 then
		Messagebox("","Error inserting DSO History (update group_branch): "+sqlca.sqlerrtext)
		return
	end if

	fetch cur_groups into :ls_group, :ld_balance, :ld_amttobereconciled;
	
loop

close cur_groups;



end event

type cb_21 from commandbutton within w_checkcommissions
integer x = 1147
integer y = 416
integer width = 343
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;

fn_httppost()
end event

