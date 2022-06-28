$PBExportHeader$w2_closing_payee_nat.srw
$PBExportComments$Closing de los corresponsales en Moneda Nacional
forward
global type w2_closing_payee_nat from window
end type
type cb_1 from commandbutton within w2_closing_payee_nat
end type
type cb_cierrepayer3 from commandbutton within w2_closing_payee_nat
end type
type cb_close from commandbutton within w2_closing_payee_nat
end type
type cb_cierrepayer from commandbutton within w2_closing_payee_nat
end type
type cb_cierrepayer2 from commandbutton within w2_closing_payee_nat
end type
type cb_cierrepayer1 from commandbutton within w2_closing_payee_nat
end type
type st_3 from statictext within w2_closing_payee_nat
end type
type lb_log from listbox within w2_closing_payee_nat
end type
type em_date from editmask within w2_closing_payee_nat
end type
type st_2 from statictext within w2_closing_payee_nat
end type
type lst_payers from my_ddlb within w2_closing_payee_nat
end type
type st_1 from statictext within w2_closing_payee_nat
end type
type gb_1 from groupbox within w2_closing_payee_nat
end type
end forward

global type w2_closing_payee_nat from window
integer width = 1669
integer height = 1308
boolean titlebar = true
string title = "Closing Payee - Nat Currency"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cb_cierrepayer3 cb_cierrepayer3
cb_close cb_close
cb_cierrepayer cb_cierrepayer
cb_cierrepayer2 cb_cierrepayer2
cb_cierrepayer1 cb_cierrepayer1
st_3 st_3
lb_log lb_log
em_date em_date
st_2 st_2
lst_payers lst_payers
st_1 st_1
gb_1 gb_1
end type
global w2_closing_payee_nat w2_closing_payee_nat

event open;lb_log.reset()
end event

on w2_closing_payee_nat.create
this.cb_1=create cb_1
this.cb_cierrepayer3=create cb_cierrepayer3
this.cb_close=create cb_close
this.cb_cierrepayer=create cb_cierrepayer
this.cb_cierrepayer2=create cb_cierrepayer2
this.cb_cierrepayer1=create cb_cierrepayer1
this.st_3=create st_3
this.lb_log=create lb_log
this.em_date=create em_date
this.st_2=create st_2
this.lst_payers=create lst_payers
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_cierrepayer3,&
this.cb_close,&
this.cb_cierrepayer,&
this.cb_cierrepayer2,&
this.cb_cierrepayer1,&
this.st_3,&
this.lb_log,&
this.em_date,&
this.st_2,&
this.lst_payers,&
this.st_1,&
this.gb_1}
end on

on w2_closing_payee_nat.destroy
destroy(this.cb_1)
destroy(this.cb_cierrepayer3)
destroy(this.cb_close)
destroy(this.cb_cierrepayer)
destroy(this.cb_cierrepayer2)
destroy(this.cb_cierrepayer1)
destroy(this.st_3)
destroy(this.lb_log)
destroy(this.em_date)
destroy(this.st_2)
destroy(this.lst_payers)
destroy(this.st_1)
destroy(this.gb_1)
end on

type cb_1 from commandbutton within w2_closing_payee_nat
integer x = 1175
integer y = 1324
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;
Date ld_date


ld_date = date("2007/01/01")

do while ld_date < date('2007/11/06' )
	em_date.text = string(ld_date)

	cb_cierrepayer.TriggerEvent(Clicked!)
	
	ld_date = relativedate(ld_date,1)
loop
end event

type cb_cierrepayer3 from commandbutton within w2_closing_payee_nat
integer x = 5
integer y = 1464
integer width = 983
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Rehacer Cierre Pagador (Cancelaciones)"
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
		
	Setpointer(Hourglass!)


	string ls_group_closing

	//ld_date = today()
	ld_date = date(em_date.text)
	ls_group_closing = lst_payers.getdataid()

	ld_from 	= datetime(ld_date,time('00:00:00'))
	ld_to   	= datetime(ld_date,time('23:59:59'))	

	
	 SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee_nat
   WHERE (dba.transaccion_diaria_payee_nat.date_trans_diaria >= :ld_from ) AND  
			(dba.transaccion_diaria_payee_nat.date_trans_diaria <= :ld_to ) AND
   		ID_GROUP_TRANS_DIARIA = :ls_group_closing AND
			(dba.transaccion_diaria_payee_nat.id_concepto_contable = 'CPN' ) ;  //TRANSACCION PAYEE
			
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if

	if ll_cont1 > 0 then
		return
	end if


	
	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT id_main_branch_sent 
    FROM dba.receiver  
   WHERE ( dba.receiver.date_trans_payee >= :ld_from ) 
	AND	( dba.receiver.date_trans_payee <= :ld_to )    
	AND  	( dba.receiver.ref_receiver > 0 ) 
	AND	( dba.receiver.net_amount_receiver < 0 ) 
	AND	( dba.receiver.id_receiver < 0 ) 
	AND   ( dba.receiver.id_flag_receiver = 'C' )
	AND id_main_branch_sent = :ls_group_closing
	AND	( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
		                                                                           from dba.relacion_invoices_payee_nat
																										   where (dba.relacion_invoices_payee_nat.id_concepto_contable  = 'CPN' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee_nat.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee_nat.id_branch_invoice))	;

			
			
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	 SELECT  SUM(dba.receiver.total_pay_receiver)//SUM(dba.receiver.net_amount_receiver + dba.receiver.commission_payee) 
    INTO 	:ld_valor  
    FROM 	dba.receiver  
   WHERE ( id_main_branch_sent			= :ls_group ) 
	AND  	( dba.receiver.date_trans_payee 		>= :ld_from ) 
	AND	( dba.receiver.date_trans_payee 		<= :ld_to )    
	AND  	( dba.receiver.ref_receiver 			> 0 ) 
	AND	( dba.receiver.net_amount_receiver < 0 ) 
	AND	( dba.receiver.id_receiver 			< 0 ) 
	AND   ( dba.receiver.id_flag_receiver 	= 'C' ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
		                                                                           from dba.relacion_invoices_payee_nat
																										   where (dba.relacion_invoices_payee_nat.id_concepto_contable  = 'CPN' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee_nat.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee_nat.id_branch_invoice))	;

			
			
	  
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
			
			SELECT Max(dba.transaccion_diaria_payee_nat.cons_trans_diaria) + 1  
       	INTO 	:ld_cons  
       	FROM 	dba.transaccion_diaria_payee_nat  ;
		 
		 
			If sqlca.sqlcode < 0 then
//				FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
				rollback;
				return
			end if
				
		
		  INSERT INTO dba.transaccion_diaria_payee_nat 
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria )  
  			VALUES ( :ld_cons,:ls_group,:ld_datetime,:ld_datetime,'CPN','CLOSING PAYEE CANCEL NAT.CUR.',0,:ld_valor,:ld_balance )  ;
			  
			  
		If sqlca.sqlcode < 0 then		
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		
			INSERT INTO dba.relacion_invoices_payee_nat  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_datetime,
						'CPN'
    			FROM  dba.receiver  
   			WHERE ( id_main_branch_sent = :ls_group ) 
				AND   ( dba.receiver.date_trans_payee >= :ld_from ) 
				AND	( dba.receiver.date_trans_payee <= :ld_to )    
				AND   ( dba.receiver.ref_receiver > 0 ) 
				AND   ( dba.receiver.id_receiver < 0 ) 
				AND	( dba.receiver.id_flag_receiver = 'C'  ) 
				AND	( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select  (dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
																																	 from 	 dba.relacion_invoices_payee_nat
																																	 where 	(dba.relacion_invoices_payee_nat.id_concepto_contable  = 'CPN' ) 
																																	 and		(dba.receiver.id_receiver 	= dba.relacion_invoices_payee_nat.id_receiver ) 
																																	 and		(dba.receiver.id_branch 	= 	dba.relacion_invoices_payee_nat.id_branch_invoice))	;


						
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

type cb_close from commandbutton within w2_closing_payee_nat
integer x = 1143
integer y = 1080
integer width = 402
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_cierrepayer from commandbutton within w2_closing_payee_nat
integer x = 133
integer y = 336
integer width = 1298
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Re-build Payer Closing"
end type

event clicked;SetPointer(HourGlass!)
cb_cierrepayer1.triggerEvent(Clicked!)
cb_cierrepayer2.triggerEvent(Clicked!)
cb_cierrepayer3.triggerEvent(Clicked!)
SetPointer(Arrow!)
end event

type cb_cierrepayer2 from commandbutton within w2_closing_payee_nat
integer y = 1380
integer width = 983
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Rehacer Cierre Pagador (Confirmaciones)"
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


	string ls_group_closing

	//ld_date = today()
	ld_date = date(em_date.text)
	ls_group_closing = lst_payers.getdataid()

	ld_from 	= datetime(ld_date,time('00:00:00'))
	ld_to   	= datetime(ld_date,time('23:59:59'))	

		
	SELECT Count(*) 
   INTO   :ll_cont1 
   FROM   dba.transaccion_diaria_payee_nat
   WHERE (dba.transaccion_diaria_payee_nat.date_trans_diaria 		>= :ld_from ) 
	AND   (dba.transaccion_diaria_payee_nat.date_trans_diaria 		<= :ld_to )
   AND   ID_GROUP_TRANS_DIARIA = :ls_group_closing
	AND  	(dba.transaccion_diaria_payee_nat.id_concepto_contable 	= 'CPCN' ) ;	

	if ll_cont1 > 0 then
		return	
	end if

	
	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT id_main_branch_sent
    FROM dba.receiver  
   WHERE ( dba.receiver.payment_date >= :ld_from ) AND
			( dba.receiver.payment_date <= :ld_to)    AND 
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			dba.receiver.id_main_branch_sent = :ls_group_closing AND 
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
		                                                                           from dba.relacion_invoices_payee_nat
																										   where (dba.relacion_invoices_payee_nat.id_concepto_contable  = 'CPCN' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee_nat.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee_nat.id_branch_invoice))	;

			
			
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   4"+sqlca.sqlerrtext)
			return
		end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	 SELECT  SUM(dba.receiver.total_pay_receiver)// SUM(dba.receiver.net_amount_receiver  + dba.receiver.commission_payee) 
    INTO :ld_valor  
    FROM dba.receiver  
   WHERE ( id_main_branch_sent = :ls_group ) AND  
         ( dba.receiver.payment_date >= :ld_from ) AND
			( dba.receiver.payment_date <= :ld_to)    AND 
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
		                                                                           from dba.relacion_invoices_payee_nat
																										   where (dba.relacion_invoices_payee_nat.id_concepto_contable  = 'CPCN' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee_nat.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee_nat.id_branch_invoice))	;

			
			
			
		IF ISNULL(ld_valor) THEN ld_valor = 0	
			
	  
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   5"+sqlca.sqlerrtext)
			return
		end if
		
		 SELECT MAX(dba.transaccion_diaria_payee_nat.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee_nat  ;
		 
		 
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
			
			
			
		
		  INSERT INTO dba.transaccion_diaria_payee_nat 
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
           'CPCN','CLOSING PAYEE CONFIRMATION NAT.CUR.',0,:ld_valor,:ld_balance )  ;
			  
			  
		If sqlca.sqlcode < 0 then		
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   7"+sqlca.sqlerrtext)
			return
		end if
		
		
			INSERT INTO dba.relacion_invoices_payee_nat  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_datetime,
						'CPCN'
    			FROM  dba.receiver  
   			WHERE ( id_main_branch_sent = :ls_group ) AND  
         			( dba.receiver.payment_date >= :ld_from ) AND
						( dba.receiver.payment_date <= :ld_to)    AND 
						( dba.receiver.ref_receiver > 0 ) AND
						( dba.receiver.id_receiver > 0 ) AND
         			( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
		                                                                           from dba.relacion_invoices_payee_nat
																										   where (dba.relacion_invoices_payee_nat.id_concepto_contable  = 'CPCN' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee_nat.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee_nat.id_branch_invoice))	;


						
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

type cb_cierrepayer1 from commandbutton within w2_closing_payee_nat
integer y = 1300
integer width = 983
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Rehacer Cierre Pagador"
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


	string ls_group_closing

	//ld_date = today()
	ld_date = date(em_date.text)
	ls_group_closing = lst_payers.getdataid()

	ld_from 	= datetime(ld_date,time('00:00:00'))
	ld_to   	= datetime(ld_date,time('23:59:59'))	

		
	SELECT Count(*) 
   INTO   :ll_cont1 
   FROM   dba.transaccion_diaria_payee_nat
   WHERE (dba.transaccion_diaria_payee_nat.date_trans_diaria 		>= :ld_from ) 
	AND   (dba.transaccion_diaria_payee_nat.date_trans_diaria 		<= :ld_to )
   AND   ID_GROUP_TRANS_DIARIA = :ls_group_closing
	AND  	(dba.transaccion_diaria_payee_nat.id_concepto_contable 	= 'TPN' ) ;  //TRANSACCION PAYEE
			
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if

	if ll_cont1 > 0 then
			
			DELETE FROM dba.relacion_invoices_payee_nat  
   		WHERE (dba.relacion_invoices_payee_nat.date_relacion_diaria >= :ld_from   ) 
			and	(dba.relacion_invoices_payee_nat.date_relacion_diaria <= :ld_to   ) 
			and	(dba.relacion_invoices_payee_nat.id_concepto_contable  = 'TPN' )
			and	(dba.relacion_invoices_payee_nat.cons_trans_diaria IN (SELECT cons_trans_diaria
																						FROM dba.transaccion_diaria_payee_nat
																						WHERE (dba.transaccion_diaria_payee_nat.date_trans_diaria >= :ld_from ) AND  
																								(dba.transaccion_diaria_payee_nat.date_trans_diaria <= :ld_to ) AND  
																								(dba.transaccion_diaria_payee_nat.id_concepto_contable = 'TPN' ) AND
																								(dba.transaccion_diaria_payee_nat.id_group_trans_diaria  = :ls_group_closing) ));			
			
				
			If sqlca.sqlcode < 0 then
//				FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
				return
			end if

		 	DELETE FROM dba.transaccion_diaria_payee_nat  
   		WHERE (dba.transaccion_diaria_payee_nat.date_trans_diaria >= :ld_from ) 
			AND  	(dba.transaccion_diaria_payee_nat.date_trans_diaria <= :ld_to   ) 
		   AND   ID_GROUP_TRANS_DIARIA = :ls_group_closing			
			AND  	(dba.transaccion_diaria_payee_nat.id_concepto_contable = 'TPN'   ) ;
			
			If sqlca.sqlcode < 0 then
//				FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
				rollback;
				return
			end if

	end if
	
	DECLARE branch_cierre CURSOR FOR  
   SELECT DISTINCT dba.receiver.id_main_branch_sent  
     FROM dba.receiver  
    WHERE dba.receiver.date_trans_payee >= :ld_from
		AND dba.receiver.date_trans_payee <= :ld_to
	   AND dba.receiver.ref_receiver > 0
	   AND dba.receiver.id_receiver > 0
	   AND dba.receiver.id_flag_receiver in ('T','P','C')
	   AND dba.receiver.id_main_branch_sent = :ls_group_closing
	   AND dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver) not in ( select (dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
																														  from  dba.relacion_invoices_payee_nat
																														 where (dba.relacion_invoices_payee_nat.id_concepto_contable  = 'TPN' ) 																														 
																														 and    (dba.receiver.id_receiver = dba.relacion_invoices_payee_nat.id_receiver ) 																														 
																														 and	  (dba.receiver.id_branch 	 =	dba.relacion_invoices_payee_nat.id_branch_invoice));
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	SELECT SUM(dba.receiver.total_pay_receiver)
     INTO :ld_valor  
     FROM dba.receiver  
    WHERE dba.receiver.id_main_branch_sent	= :ls_group
		AND dba.receiver.date_trans_payee 		>= :ld_from
		AND dba.receiver.date_trans_payee 		<= :ld_to
		AND dba.receiver.ref_receiver 			> 0
		AND dba.receiver.id_receiver 			> 0
		AND dba.receiver.id_flag_receiver 		in ('T','P','C')
      AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in (   select (dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
																															from 	 dba.relacion_invoices_payee_nat
																															where (dba.relacion_invoices_payee_nat.id_concepto_contable  = 'TPN' ) 
																															and	(dba.receiver.id_receiver 			= dba.relacion_invoices_payee_nat.id_receiver ) 
																															and	(dba.receiver.id_branch 			= 	dba.relacion_invoices_payee_nat.id_branch_invoice))	;	  
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		
			
			//ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
			If ISNULL(ld_balance) then ld_balance = 0
			
			ld_balance = ld_balance - ld_valor
			
			ld_datetime = datetime(ld_date,ld_time)
			
			ld_balance = ROUND(ld_balance,2)
			ld_valor   = ROUND(ld_valor,2)
			
		 SELECT 	Max(dba.transaccion_diaria_payee_nat.cons_trans_diaria) + 1  
       INTO 	:ld_cons  
       FROM 	dba.transaccion_diaria_payee_nat  ;
		 
		 
			If sqlca.sqlcode < 0 then
//				FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
				rollback;
				return
			end if
		
			if isnull(ld_cons) then ld_cons = 1
				
		
		  INSERT INTO dba.transaccion_diaria_payee_nat 
						( cons_trans_diaria,   
						  id_group_trans_diaria,   
						  date_trans_diaria,   
						  hour_trans_diaria,   
						  id_concepto_contable,   
						  des_trans_diaria,   
						  debit_trans_diaria,   
						  credit_trans_diaria,   
						  balance_trans_diaria )  
  		  VALUES ( :ld_cons,:ls_group,:ld_datetime,:ld_datetime,'TPN','TRANS. TO PAYER NAT.CUR.',0,:ld_valor,:ld_balance )  ;
			  
			  
		If sqlca.sqlcode < 0 then		
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			rollback;
			return
		end if
		
		
			INSERT INTO dba.relacion_invoices_payee_nat  
							 ( cons_trans_diaria,   
								id_branch_invoice,   
								id_receiver,   
								date_relacion_diaria,
								id_concepto_contable  )
			  SELECT :ld_cons,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_datetime,
						'TPN'
    			FROM  dba.receiver  
   			WHERE ( dba.receiver.id_main_branch_sent = :ls_group ) 
				AND   ( dba.receiver.date_trans_payee >= :ld_from ) 
				AND   ( dba.receiver.date_trans_payee <= :ld_to )    
				AND   ( dba.receiver.ref_receiver > 0 ) 
				AND	( dba.receiver.id_receiver > 0 ) 
				AND   ( dba.receiver.id_flag_receiver in ('T','P','C') ) 
				AND   ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( 	select 	(dba.relacion_invoices_payee_nat.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee_nat.id_receiver))
																																		from 		dba.relacion_invoices_payee_nat
																																		where 	(dba.relacion_invoices_payee_nat.id_concepto_contable  = 'TPN' ) 
																																		and		(dba.receiver.id_receiver 		= dba.relacion_invoices_payee_nat.id_receiver ) 
																																		and		(dba.receiver.id_branch 		= 	dba.relacion_invoices_payee_nat.id_branch_invoice))	;


						
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

type st_3 from statictext within w2_closing_payee_nat
integer x = 37
integer y = 536
integer width = 507
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Closing Log:"
boolean focusrectangle = false
end type

type lb_log from listbox within w2_closing_payee_nat
integer x = 37
integer y = 600
integer width = 1513
integer height = 444
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type em_date from editmask within w2_closing_payee_nat
integer x = 361
integer y = 232
integer width = 425
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyydd"
end type

type st_2 from statictext within w2_closing_payee_nat
integer x = 91
integer y = 236
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Date :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_payers from my_ddlb within w2_closing_payee_nat
integer x = 361
integer y = 136
integer width = 1070
integer height = 1136
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_payers.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type IN ('P','A') order by name_main_branch;")
end event

type st_1 from statictext within w2_closing_payee_nat
integer x = 91
integer y = 144
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Payer :"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w2_closing_payee_nat
integer x = 37
integer y = 32
integer width = 1513
integer height = 460
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Re-Build Payer Closing (National Currency)"
end type

