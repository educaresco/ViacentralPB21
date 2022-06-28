$PBExportHeader$w_retransmitir_cancelados.srw
forward
global type w_retransmitir_cancelados from wb_report_fechas
end type
type cb_1 from commandbutton within w_retransmitir_cancelados
end type
end forward

global type w_retransmitir_cancelados from wb_report_fechas
integer x = 214
integer y = 221
integer width = 3022
integer height = 2272
string title = "Change the status for retransmittion"
string menuname = "mb_retransmitir"
event ue_update ( )
cb_1 cb_1
end type
global w_retransmitir_cancelados w_retransmitir_cancelados

type variables

end variables

event ue_update;//dw_1.update()
//
//commit ;
end event

on w_retransmitir_cancelados.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "mb_retransmitir" then this.MenuID = create mb_retransmitir
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_retransmitir_cancelados.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_retransmitir_cancelados
integer x = 32
integer width = 2926
integer height = 1876
string dataobject = "dw_retransmitir_cancelados"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_retransmitir_cancelados
integer y = 12
integer height = 92
end type

type st_1 from wb_report_fechas`st_1 within w_retransmitir_cancelados
integer x = 622
integer width = 288
integer height = 48
string text = "Initial Date :"
end type

type st_2 from wb_report_fechas`st_2 within w_retransmitir_cancelados
integer x = 1381
integer width = 306
integer height = 44
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_retransmitir_cancelados
integer x = 1705
integer y = 12
integer height = 92
end type

event em_fecha2::modified;return ;
end event

event em_fecha2::losefocus;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)
Setpointer(Hourglass!)
dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type cb_1 from commandbutton within w_retransmitir_cancelados
integer x = 2139
integer y = 12
integer width = 343
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Generate File"
end type

event clicked;String	ls_id_branch, ls_name_branch, ls_name_sender, ls_address_sender, ls_city,   &
         ls_id_country, ls_type_id_sender, ls_number_id_sender,  ls_payment,   &
         ls_curreny, ls_id_flag_receiver, ls_id_city_receiver, ls_id_state_receiver,   &
         ls_id_country_receiver, ls_branch_pay_receiver, ls_id_cashier, ls_name_receiver,   &
         ls_address_receiver, ls_phone1_receiver, ls_phone2_receiver, ls_zip_receiver,   &
         ls_notes_receiver, ls_recomend_receiver, ls_mode_pay_receiver, ls_acc_receiver,  & 
			ls_mod_pay_currency, ls_trans_receiver, ls_bank_receiver, ls_state, ls_sql, ls_filename, &
			ls_fecha, ls_hora, ls_tmp, ls_tmp1, ls_modem, ls_branch_old, ls_fileline, ls_tollfree, ls_pinnumber, is_output

Double	ld_sender, ld_branch, ld_phone1_sender, ld_phone2_sender, ld_zip_sender, ld_id_sender, ld_receiver,  ld_net_amount_receiver,   &
         ld_rate_change_receiver, ld_telex_receiver, ld_urgency_receiver, ld_exchange_receiver, ld_handling_receiver,   &
         ld_total_receiver, ld_porc_comision_receiver, ld_total_pay_receiver, ld_exchange_company, ld_telex_company,   &
         ld_ref_receiver, ld_total_diference, ld_total_modo_pago, ld_commission_payee, ld_referencia, ld_batch, ld_total_modo_pago_comp, ld_cancelado

Datetime 		ld_date_receiver , ld_fecha
Date		ld_date_receiver1
time		 lt_time_receiver1
Datetime     lt_time_receiver
Integer	li_file, li_file2
Long		ll_num_inv, ll_tot_inv=0, LL_POS, ll_filenum1
String	ls_grupo, ls_grupo_batch, ls_file_schedule

double	ld_fee_rate = 0


string	ls_branch
Date		ld_date
Time		lt_hour
long		ll_cont, ll_filenum,i
string	ls_flag, ls_date, ls_time

SELECT dba.parametros.dir_output   
INTO :is_output   
FROM dba.parametros  ;
is_output = TRIM(is_output)

FOR  i = 1 TO dw_1.rowcount()
	
	ls_branch   = dw_1.getitemstring(i,"id_branch")
	ld_receiver = dw_1.getitemnumber(i,"id_receiver")

	ld_fee_rate = 0
							///// Seleccionar los datos del Invoice/ ////////////
			
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
		
		
		lt_time_receiver1  = Time('11:11:11')					
		ls_trans_receiver = 'T'
		ld_date_receiver1  = date(ld_date_receiver)
		
								ls_sql = "INSERT INTO receiver ( id_sender, id_branch, id_receiver, id_payment, id_curreny, id_flag_receiver, "
								ls_sql += "id_city_receiver, id_state_receiver, id_country_receiver, branch_pay_receiver, id_cashier, "
								ls_sql += "name_receiver, address_receiver, phone1_receiver, phone2_receiver, zip_receiver, notes_receiver, "
								ls_sql += "date_receiver, time_receiver, net_amount_receiver, rate_change_receiver, telex_receiver, "
								ls_sql += "urgency_receiver, recomend_receiver, mode_pay_receiver, acc_receiver, exchange_receiver, "
								ls_sql += "handling_receiver, total_receiver, mod_pay_currency, porc_comision_receiver, total_pay_receiver, "
								ls_sql += "trans_receiver, exchange_company, telex_company, ref_receiver, bank_receiver, total_diference, "
								ls_sql += "total_modo_pago, commission_payee, total_modo_pago_comp, toll_free, pin_number ,status_pago_payee, status_pago_agent, fee_rate ) VALUES ("
								ls_sql += String(ld_id_sender)+",'"+ls_id_branch+"',"+String(ld_receiver)+",'"+ls_payment+"','"+ls_curreny+"','" + &
					 			ls_id_flag_receiver+"','"+ls_id_city_receiver+"','"+ls_id_state_receiver+"','"+ls_id_country_receiver+"','" + &
					 			ls_branch_pay_receiver+"','"+"CH1"+"','"+ls_name_receiver+"','"+ls_address_receiver+"','" + &
								ls_phone1_receiver+"','"+ls_phone2_receiver+"','"+ls_zip_receiver+"','"+ls_notes_receiver+"','" + &
					 			String(ld_date_receiver1,"yyyy-mm-dd")+"','"+String(lt_time_receiver,"HH:MM:SS")+"',"+ &
					 			String(ld_net_amount_receiver)+","+String(ld_rate_change_receiver)+","+String(ld_telex_receiver)+"," + &
					 			String(ld_urgency_receiver)+",'"+ls_recomend_receiver+"','"+ls_mode_pay_receiver+"','"+ls_acc_receiver+"'," + &
					 			String(ld_exchange_receiver)+","+String(ld_handling_receiver)+","+String(ld_total_receiver)+",'" + &
					 			ls_mod_pay_currency+"',"+String(ld_porc_comision_receiver)+","+String(ld_total_pay_receiver)+",'"+&
					 			ls_trans_receiver+"',"+String(ld_exchange_company)+","+String(ld_telex_company)+","+&
					 			String(ld_ref_receiver)+",'"+ls_bank_receiver+"',"+String(ld_total_diference)+","+&
					 			String(ld_total_modo_pago)+","+String(ld_commission_payee)+","+String(ld_total_modo_pago_comp)+",'"+ls_tollfree+"','"+ls_pinnumber+"','U','U',"+string(ld_fee_rate)+");"
										
								
								ls_filename=is_output+'CAN'+Fill('0',10 - Len(ls_id_branch))+ls_id_branch+".sql"
								ll_filenum1=FileOpen(ls_filename, LineMode!, Write!, LockWrite!, Append!)
								
								FileWrite (ll_filenum1,"DELETE receiver WHERE ( receiver.id_branch = '"+ls_id_branch+"' AND  receiver.id_receiver = "+string(ld_receiver)+" );")
								
								ld_receiver = ABS(ld_receiver)
								
								FileWrite (ll_filenum1,ls_sql)
								FileWrite (ll_filenum1," UPDATE receiver SET id_flag_receiver = 'C'  WHERE ( receiver.id_branch = '"+ls_id_branch+"' AND  receiver.id_receiver = "+string(ld_receiver)+" )   ;")
								FileClose (ll_filenum1)
							
						
NEXT

messagebox('Final','')
end event

