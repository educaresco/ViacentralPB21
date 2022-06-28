$PBExportHeader$w_closing_payee.srw
$PBExportComments$Closin de los corresponsales
forward
global type w_closing_payee from window
end type
type cb_3 from commandbutton within w_closing_payee
end type
type st_6 from statictext within w_closing_payee
end type
type cb_2 from commandbutton within w_closing_payee
end type
type cbx_fix from checkbox within w_closing_payee
end type
type em_from from editmask within w_closing_payee
end type
type cb_cierrepayer2 from commandbutton within w_closing_payee
end type
type cb_1 from commandbutton within w_closing_payee
end type
type st_5 from statictext within w_closing_payee
end type
type lb_payers from listbox within w_closing_payee
end type
type em_fix from editmask within w_closing_payee
end type
type st_4 from statictext within w_closing_payee
end type
type em_date from editmask within w_closing_payee
end type
type cb_cierrepayer3 from commandbutton within w_closing_payee
end type
type cb_close from commandbutton within w_closing_payee
end type
type cb_cierrepayer from commandbutton within w_closing_payee
end type
type cb_cierrepayer1 from commandbutton within w_closing_payee
end type
type st_3 from statictext within w_closing_payee
end type
type lb_log from listbox within w_closing_payee
end type
type em_to from editmask within w_closing_payee
end type
type st_2 from statictext within w_closing_payee
end type
type lst_payers from my_ddlb within w_closing_payee
end type
type st_1 from statictext within w_closing_payee
end type
type gb_1 from groupbox within w_closing_payee
end type
type gb_2 from groupbox within w_closing_payee
end type
end forward

global type w_closing_payee from window
integer width = 1627
integer height = 1968
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
st_6 st_6
cb_2 cb_2
cbx_fix cbx_fix
em_from em_from
cb_cierrepayer2 cb_cierrepayer2
cb_1 cb_1
st_5 st_5
lb_payers lb_payers
em_fix em_fix
st_4 st_4
em_date em_date
cb_cierrepayer3 cb_cierrepayer3
cb_close cb_close
cb_cierrepayer cb_cierrepayer
cb_cierrepayer1 cb_cierrepayer1
st_3 st_3
lb_log lb_log
em_to em_to
st_2 st_2
lst_payers lst_payers
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_closing_payee w_closing_payee

event open;
lb_log.reset()


if gs_login <> 'EBERNAL' then
	Messagebox("","Esta opcion ha sido deshabilitada temporalmente - Si necesita corregir un cierre envie un EMail a ebernal")
	close(this)
end if
end event

on w_closing_payee.create
this.cb_3=create cb_3
this.st_6=create st_6
this.cb_2=create cb_2
this.cbx_fix=create cbx_fix
this.em_from=create em_from
this.cb_cierrepayer2=create cb_cierrepayer2
this.cb_1=create cb_1
this.st_5=create st_5
this.lb_payers=create lb_payers
this.em_fix=create em_fix
this.st_4=create st_4
this.em_date=create em_date
this.cb_cierrepayer3=create cb_cierrepayer3
this.cb_close=create cb_close
this.cb_cierrepayer=create cb_cierrepayer
this.cb_cierrepayer1=create cb_cierrepayer1
this.st_3=create st_3
this.lb_log=create lb_log
this.em_to=create em_to
this.st_2=create st_2
this.lst_payers=create lst_payers
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_3,&
this.st_6,&
this.cb_2,&
this.cbx_fix,&
this.em_from,&
this.cb_cierrepayer2,&
this.cb_1,&
this.st_5,&
this.lb_payers,&
this.em_fix,&
this.st_4,&
this.em_date,&
this.cb_cierrepayer3,&
this.cb_close,&
this.cb_cierrepayer,&
this.cb_cierrepayer1,&
this.st_3,&
this.lb_log,&
this.em_to,&
this.st_2,&
this.lst_payers,&
this.st_1,&
this.gb_1,&
this.gb_2}
end on

on w_closing_payee.destroy
destroy(this.cb_3)
destroy(this.st_6)
destroy(this.cb_2)
destroy(this.cbx_fix)
destroy(this.em_from)
destroy(this.cb_cierrepayer2)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.lb_payers)
destroy(this.em_fix)
destroy(this.st_4)
destroy(this.em_date)
destroy(this.cb_cierrepayer3)
destroy(this.cb_close)
destroy(this.cb_cierrepayer)
destroy(this.cb_cierrepayer1)
destroy(this.st_3)
destroy(this.lb_log)
destroy(this.em_to)
destroy(this.st_2)
destroy(this.lst_payers)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_3 from commandbutton within w_closing_payee
integer x = 87
integer y = 1652
integer width = 571
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Transferred"
end type

event clicked;String ls_payer
Date ld_date
Datetime ld_from, ld_to

ld_date = date(em_fix.text)

ld_from 	= datetime(ld_date,time('00:00:00'))
ld_to   	= datetime(ld_date,time('23:59:59'))	

SetPointer(HourGlass!)

lb_payers.reset()

DECLARE cur_missings CURSOR FOR
SELECT DISTINCT DBA.SFGETRECEIVERPAYERID(ID_BRANCH,ID_RECEIVER)
FROM DBA.RECEIVER
WHERE DATE_TRANS_PAYEE BETWEEN :ld_from AND :ld_to
AND RTRIM(ID_BRANCH)+CONVERT(VARCHAR,ID_RECEIVER) NOT IN
    (SELECT RTRIM(ID_BRANCH_INVOICE)+CONVERT(VARCHAR,ID_RECEIVER)
     FROM DBA.RELACION_INVOICES_PAYEE
     WHERE ID_CONCEPTO_CONTABLE = 'TP');
//	  ----------------revisar este query
	  	  
OPEN cur_missings;

FETCH cur_missings INTO :ls_payer;

DO WHILE SQLCA.sqlcode = 0
	
	lb_payers.additem(ls_payer)
	
	if cbx_fix.checked then
		lst_payers.setselectedid(ls_payer)
		em_date.text = em_fix.text
		cb_cierrepayer1.triggerEvent(Clicked!)
		lb_log.additem(ls_payer+" Completed!")
	end if	
	
	FETCH cur_missings INTO :ls_payer;	

LOOP

CLOSE cur_missings;

SetPointer(Arrow!)

//lst_payers.getdataid()
end event

type st_6 from statictext within w_closing_payee
integer x = 87
integer y = 1368
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_closing_payee
integer x = 87
integer y = 1560
integer width = 571
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cancelations"
end type

event clicked;String ls_payer
Date ld_date
Datetime ld_from, ld_to

ld_date = date(em_fix.text)

ld_from 	= datetime(ld_date,time('00:00:00'))
ld_to   	= datetime(ld_date,time('23:59:59'))	

SetPointer(HourGlass!)

lb_payers.reset()

DECLARE cur_missings CURSOR FOR
SELECT DISTINCT DBA.SFGETRECEIVERPAYERID(ID_BRANCH,ID_RECEIVER)
FROM DBA.RECEIVER
WHERE DATE_TRANS_PAYEE BETWEEN '2006-01-01' AND '2006-12-20'
AND DBA.RECEIVER.REF_RECEIVER > 0
AND DBA.RECEIVER.NET_AMOUNT_RECEIVER < 0
AND DBA.RECEIVER.ID_RECEIVER < 0
AND DBA.RECEIVER.ID_FLAG_RECEIVER = 'C'
AND RTRIM(ID_BRANCH)+CONVERT(VARCHAR,ID_RECEIVER) NOT IN
    (SELECT RTRIM(ID_BRANCH_INVOICE)+CONVERT(VARCHAR,ID_RECEIVER)
     FROM DBA.RELACION_INVOICES_PAYEE
     WHERE ID_CONCEPTO_CONTABLE = 'CP');
	  	  
OPEN cur_missings;

FETCH cur_missings INTO :ls_payer;

DO WHILE SQLCA.sqlcode = 0
	
	lb_payers.additem(ls_payer)
	
	if cbx_fix.checked then
		lst_payers.setselectedid(ls_payer)
		em_date.text = em_fix.text
		cb_cierrepayer3.triggerEvent(Clicked!)
		lb_log.additem(ls_payer+" Completed!")
	end if	
	
	FETCH cur_missings INTO :ls_payer;	

LOOP

CLOSE cur_missings;

SetPointer(Arrow!)

end event

type cbx_fix from checkbox within w_closing_payee
integer x = 658
integer y = 1368
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fix"
end type

type em_from from editmask within w_closing_payee
integer x = 357
integer y = 232
integer width = 366
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

type cb_cierrepayer2 from commandbutton within w_closing_payee
integer x = 1801
integer y = 796
integer width = 983
integer height = 72
integer taborder = 70
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

	string ls_group_closing

	//ld_date = today()
	ld_date = date(em_date.text)
	ls_group_closing = lst_payers.getdataid()

	ld_from 	= datetime(ld_date,time('00:00:00'))
	ld_to   	= datetime(ld_date,time('23:59:59'))	

 	SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee
   WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND   
			(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
			(dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) and
			(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing);  //TRANSACCION PAYEE			

	if ll_cont1 > 0 then

		//-------------------------------------------------------------------
		//Borrar el Closing Realizado Anteriormente
		DELETE FROM dba.relacion_invoices_payee  
		WHERE (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_from   ) and
				(dba.relacion_invoices_payee.date_relacion_diaria <= :ld_to   ) and
				(dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
				(dba.relacion_invoices_payee.cons_trans_diaria IN (SELECT cons_trans_diaria
																					FROM dba.transaccion_diaria_payee
																					WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
																							(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
																							(dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) AND
																							(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing) ));

		If sqlca.sqlcode < 0 then
			rollback;
			return
		end if

		DELETE
		 FROM dba.transaccion_diaria_payee
		WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
				(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
				(dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) AND
				(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing);		
		
		If sqlca.sqlcode < 0 then
			rollback;
			return
		end if
		//Borrar el Closing Realizado Anteriormente
		//-------------------------------------------------------------------

	end if

	DECLARE branch_cierre1 CURSOR FOR  
 SELECT DISTINCT dba.receiver.id_main_branch_sent
   FROM dba.receiver  
  WHERE dba.receiver.payment_date >= :ld_from
	 AND dba.receiver.payment_date <= :ld_to
	 AND dba.receiver.id_main_branch_sent = :ls_group_closing
	 AND dba.receiver.ref_receiver > 0
	 AND dba.receiver.id_receiver > 0
    AND dba.receiver.id_flag_receiver in ('T','P','C')
	 AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           		    FROM dba.relacion_invoices_payee
																										            WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'CPC'
																										 		   	  AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																										 		   	  AND dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice);

	/*
	 DECLARE branch_cierre1 CURSOR FOR  
    SELECT DISTINCT isnull(dba.receiver.id_main_branch_sent,dba.group_branch.id_main_branch)  
    FROM dba.group_branch,   
         dba.receiver  
   WHERE ( isnull(dba.receiver.id_main_branch_sent,dba.sfgetreceiverpayerid(dba.receiver.id_branch,dba.receiver.id_receiver)) = dba.group_branch.id_main_branch ) and  
         ( dba.receiver.payment_date >= :ld_from ) AND
			( dba.receiver.payment_date <= :ld_to)    AND 
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			( dba.group_branch.id_main_branch = :ls_group_closing ) AND			
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice));
			
	*/
			
		If sqlca.sqlcode < 0 then
			rollback;
			return
		end if

Open 	branch_cierre1;

Fetch branch_cierre1 into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	SELECT SUM(dba.receiver.net_amount_receiver  + dba.receiver.commission_payee) 
     INTO :ld_valor  
     FROM dba.receiver  
    WHERE dba.receiver.id_main_branch_sent = :ls_group
      AND dba.receiver.payment_date >= :ld_from
		AND dba.receiver.payment_date <= :ld_to
		AND dba.receiver.ref_receiver > 0
		AND dba.receiver.id_receiver > 0
      AND dba.receiver.id_flag_receiver in ('T','P','C')
		AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                          				   FROM dba.relacion_invoices_payee
																										   			  WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'CPC'
																										 		   		 AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																										 		   		 AND dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice);
		
			
			
			
		IF ISNULL(ld_valor) THEN ld_valor = 0	
			
	  
		If sqlca.sqlcode < 0 then
			rollback;
			return
		end if
		
		 SELECT MAX(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		 
		 
		If sqlca.sqlcode < 0 then
			rollback;
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
           'CPC','CLOSING PAYEE CONFIRMATION',0,:ld_valor,:ld_balance )  ;			  
			  
		If sqlca.sqlcode < 0 then		
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   7"+sqlca.sqlerrtext)
			return
		end if
		
		
		INSERT INTO dba.relacion_invoices_payee  
				 (cons_trans_diaria,   
				 id_branch_invoice,   
				 id_receiver,   
				 date_relacion_diaria,
				 id_concepto_contable  )
		SELECT :ld_cons,   
				 dba.receiver.id_branch,   
				 dba.receiver.id_receiver,   
				 :ld_datetime,
				 'CPC'
		  FROM dba.receiver  
		 WHERE dba.receiver.id_main_branch_sent = :ls_group
			AND dba.receiver.payment_date >= :ld_from
			AND dba.receiver.payment_date <= :ld_to
			AND dba.receiver.ref_receiver > 0
			AND dba.receiver.id_receiver > 0
			AND dba.receiver.id_flag_receiver in ('T','P','C')
			AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
																															  FROM dba.relacion_invoices_payee
																															 WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'CPC'
																																AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																																AND dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice);
		

						
		If sqlca.sqlcode < 0 then
			rollback;
//			FileWrite(FileNum,"Error: SQL Sentence   8"+sqlca.sqlerrtext)
			return
		end if
		
	Fetch branch_cierre1 into :ls_group;

	LOOP

CLOSE branch_cierre1;

lb_log.additem(""+string(ld_date,'mm/dd/yyyy')+" Done.")

Setpointer(Arrow!)
end event

type cb_1 from commandbutton within w_closing_payee
integer x = 87
integer y = 1468
integer width = 571
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Confirmations"
end type

event clicked;String ls_payer
Date ld_date
Datetime ld_from, ld_to

ld_date = date(em_fix.text)

ld_from 	= datetime(ld_date,time('00:00:00'))
ld_to   	= datetime(ld_date,time('23:59:59'))	

SetPointer(HourGlass!)

lb_payers.reset()

DECLARE cur_missings CURSOR FOR
SELECT DISTINCT DBA.SFGETRECEIVERPAYERID(ID_BRANCH,ID_RECEIVER)
FROM DBA.RECEIVER
WHERE PAYMENT_DATE BETWEEN :ld_from AND :ld_to
AND RTRIM(ID_BRANCH)+CONVERT(VARCHAR,ID_RECEIVER) NOT IN
    (SELECT RTRIM(ID_BRANCH_INVOICE)+CONVERT(VARCHAR,ID_RECEIVER)
     FROM DBA.RELACION_INVOICES_PAYEE
     WHERE ID_CONCEPTO_CONTABLE = 'CPC');
	  	  
OPEN cur_missings;

FETCH cur_missings INTO :ls_payer;

DO WHILE SQLCA.sqlcode = 0
	
	lb_payers.additem(ls_payer)
	
	if cbx_fix.checked then
		lst_payers.setselectedid(ls_payer)
		em_date.text = em_fix.text
		cb_cierrepayer2.triggerEvent(Clicked!)
		lb_log.additem(ls_payer+" Completed!")
	end if	
	
	FETCH cur_missings INTO :ls_payer;	

LOOP

CLOSE cur_missings;

SetPointer(Arrow!)

end event

type st_5 from statictext within w_closing_payee
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

type lb_payers from listbox within w_closing_payee
integer x = 978
integer y = 1404
integer width = 448
integer height = 308
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type em_fix from editmask within w_closing_payee
integer x = 251
integer y = 1360
integer width = 366
integer height = 76
integer taborder = 60
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

type st_4 from statictext within w_closing_payee
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
string text = "From :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date from editmask within w_closing_payee
integer x = 2405
integer y = 620
integer width = 366
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyydd"
end type

type cb_cierrepayer3 from commandbutton within w_closing_payee
integer x = 1801
integer y = 880
integer width = 983
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Rehacer Cierre Cancelaciones"
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
				ls_city_receiver, &
				ls_group_closing


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


	//ld_date = today()
	ld_date = date(em_date.text)
	ls_group_closing = lst_payers.getdataid()
	
	ld_from 	= datetime(ld_date,time('00:00:00'))
	ld_to   	= datetime(ld_date,time('23:59:59'))
	

  SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee
   WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
			(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
			(dba.transaccion_diaria_payee.id_concepto_contable = 'CP' ) and
			(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing);  //TRANSACCION PAYEE			
			
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			return
		end if

	if ll_cont1 > 0 then

		//-------------------------------------------------------------------
		//Borrar el Closing Realizado Anteriormente
		DELETE FROM dba.relacion_invoices_payee  
		WHERE (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_from   ) and
				(dba.relacion_invoices_payee.date_relacion_diaria <= :ld_to   ) and
				(dba.relacion_invoices_payee.id_concepto_contable  = 'CP' ) and
				(dba.relacion_invoices_payee.cons_trans_diaria IN (SELECT cons_trans_diaria
																					FROM dba.transaccion_diaria_payee
																					WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
																							(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
																							(dba.transaccion_diaria_payee.id_concepto_contable = 'CP' ) AND
																							(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing) ));

		If sqlca.sqlcode < 0 then
			return
		end if

		DELETE
		 FROM dba.transaccion_diaria_payee
		WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
				(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
				(dba.transaccion_diaria_payee.id_concepto_contable = 'CP' ) AND
				(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing);		
		
		If sqlca.sqlcode < 0 then
			return
		end if
		//Borrar el Closing Realizado Anteriormente
		//-------------------------------------------------------------------

	end if

	
	 DECLARE branch_cierre CURSOR FOR  
	 SELECT DISTINCT dba.receiver.id_main_branch_sent
	  FROM dba.receiver  
	 WHERE dba.receiver.date_trans_payee >= :ld_from
		AND dba.receiver.date_trans_payee <= :ld_to
		AND dba.receiver.id_main_branch_sent = :ls_group_closing
		AND dba.receiver.ref_receiver > 0
		AND dba.receiver.net_amount_receiver < 0
		AND dba.receiver.id_receiver < 0
		AND dba.receiver.id_flag_receiver = 'C'
		AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
																															FROM dba.relacion_invoices_payee
																														  WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'CP'
																															 AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																															 AND dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice);

/*    SELECT DISTINCT dba.group_branch.id_main_branch  
    FROM dba.group_branch,   
         dba.receiver  
   WHERE ( isnull(dba.receiver.id_main_branch_sent,dba.sfgetreceiverpayerid(dba.receiver.id_branch,dba.receiver.id_receiver)) = dba.group_branch.id_main_branch ) and   
			( dba.receiver.date_trans_payee >= :ld_from ) AND
			( dba.receiver.date_trans_payee <= :ld_to )    AND  
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.net_amount_receiver < 0 ) AND
			( dba.receiver.id_receiver < 0 ) AND
         ( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.group_branch.id_main_branch = :ls_group_closing ) AND			
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CP' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

*/			
			
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			return
		end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.commission_payee) 
     INTO :ld_valor  
     FROM dba.receiver  
    WHERE dba.receiver.id_main_branch_sent = :ls_group
	   AND dba.receiver.date_trans_payee >= :ld_from
		AND dba.receiver.date_trans_payee <= :ld_to
		AND dba.receiver.ref_receiver > 0
		AND dba.receiver.net_amount_receiver < 0
		AND dba.receiver.id_receiver < 0
      AND dba.receiver.id_flag_receiver = 'C'
		AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           				FROM dba.relacion_invoices_payee
																										   			  WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'CP'
																										 		   		 AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																										 		          AND dba.receiver.id_branch = dba.relacion_invoices_payee.id_branch_invoice);

			
			
	  
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
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
           'CP','CLOSING CANCEL PAYER',0,:ld_valor,:ld_balance )  ;
			  
			  
		If sqlca.sqlcode < 0 then		
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			return
		end if
		
		
	INSERT INTO dba.relacion_invoices_payee  
		    (cons_trans_diaria,   
			 id_branch_invoice,   
			 id_receiver,   
			 date_relacion_diaria,
			 id_concepto_contable  )
   SELECT :ld_cons,   
	 		 dba.receiver.id_branch,   
			 dba.receiver.id_receiver,   
			 :ld_datetime,
			 'CP'
  	  FROM dba.receiver  
	 WHERE dba.receiver.id_main_branch_sent = :ls_group
		AND dba.receiver.date_trans_payee >= :ld_from
		AND dba.receiver.date_trans_payee <= :ld_to
		AND dba.receiver.ref_receiver > 0
		AND dba.receiver.id_receiver < 0
		AND dba.receiver.id_flag_receiver = 'C'
		AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
																														  FROM dba.relacion_invoices_payee
																														 WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'CP'
																															AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																															AND dba.receiver.id_branch = dba.relacion_invoices_payee.id_branch_invoice);


						
		If sqlca.sqlcode < 0 then
//			FileWrite(FileNum,"Error: SQL Sentence"+sqlca.sqlerrtext)
			return
		end if
		
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;


Setpointer(Arrow!)
end event

type cb_close from commandbutton within w_closing_payee
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

type cb_cierrepayer from commandbutton within w_closing_payee
integer x = 133
integer y = 336
integer width = 1298
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Re-build Payer Closing"
end type

event clicked;
if Date(em_from.text) > Date(em_to.text) then
	Messagebox("Error","Verifique las fechas",StopSign!)
	return
end if

if messagebox('Confirmacion', 'Este proceso Recalculara los cierres contables del pagador entre las fechas seleccionadas, esta seguro qeu desea continuar?',question!, yesno!) <> 1 then
	return
end if 	

em_date.text = em_from.text

do 

	SetPointer(HourGlass!)
	cb_cierrepayer1.triggerEvent(Clicked!)
	cb_cierrepayer2.triggerEvent(Clicked!)
	cb_cierrepayer3.triggerEvent(Clicked!)
	SetPointer(Arrow!)

	em_date.text = string(Relativedate(date(em_date.text),1))

loop until Date(em_date.text) > Date(em_to.text)
end event

type cb_cierrepayer1 from commandbutton within w_closing_payee
integer x = 1801
integer y = 720
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
	
	lb_log.additem("Closing: "+string(ld_date,'mm/dd/yyyy')+"...")
	
//	 DECLARE commision_payee CURSOR FOR  
//	 SELECT dba.receiver.id_country_receiver,   
//			  dba.receiver.id_main_branch_sent,   
//			  dba.receiver.net_amount_receiver,   
//			  dba.receiver.mod_pay_currency,
//			  dba.receiver.id_branch,
//			  dba.receiver.id_receiver,
//			  dba.receiver.mode_pay_receiver,
//			  dba.receiver.id_city_receiver  
//		FROM dba.receiver
//	  WHERE dba.receiver.date_trans_payee >= :ld_from
//		 AND dba.receiver.date_trans_payee <= :ld_to		
//		 AND dba.receiver.id_main_branch_sent = :ls_group_closing
//		 AND dba.receiver.ref_receiver > 0
//		 AND dba.receiver.id_receiver > 0
//		 AND dba.receiver.id_flag_receiver in ('T','P','C');
//		
////	  WHERE dba.receiver.payment_date >= :ld_from
////		 AND dba.receiver.payment_date <= :ld_to		
//	
//// 	  WHERE dba.receiver.date_trans_payee >= :ld_from
////		 AND dba.receiver.date_trans_payee <= :ld_to			
////		
//		
//		If sqlca.sqlcode < 0 then
//			lb_log.additem("Error: Opening cursor: "+SQLCA.SQLErrText)
//			return
//		end if
//		
//	
//	Open  commision_payee;
//	
//	Fetch  commision_payee into :ls_country, :ls_group_payee, :ld_amount, :ls_mod_pay_currency, :ls_branch, :id_receiver, :ls_modo_pago, :ls_city_receiver ;
//
//	DO WHILE SQLCA.sqlcode = 0
//		
//		   SELECT dba.branch.id_country,   
//         		dba.branch.id_state  
//    		INTO :ls_country_sender,   
//         	  :ls_state_sender  
//    		FROM dba.branch  
//   		WHERE dba.branch.id_branch = :ls_branch   ;
//
//		if ld_amount < 0 then
//			
//			//// Esto parece que no se usa porque el :::: ( dba.receiver.id_receiver > 0 ) AND
//			//// se implemento en un update
//			
//			ld_amount              = ld_amount  * -1
//			ld_porc_modo_pago      = fn_comision_modo_pago_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
//			ld_telex_modo_pago     = fn_comision_modo_pago_fija_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
//			ld_valor_modo_pago     = ld_porc_modo_pago + ld_telex_modo_pago 
//			
//			//ld_porcentaje          = fn_comision_grupo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
//			//ld_valor_comision_fijo = fn_comision_grupo_fijo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
//			ld_porcentaje          = fn_comision_grupo2(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency,ls_modo_pago,'%')
//			ld_valor_comision_fijo = fn_comision_grupo2(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency,ls_modo_pago,'F')			
//			
//			ld_porc_group_state    = fn_comision_group_state(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
//			ld_telex_group_state   = fn_comision_group_state_fijo(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
//			ld_valor_group_state   = ld_porc_group_state + ld_telex_group_state
//			ld_total_group_city    = fn_comision_group_city(ls_group_payee,ls_city_receiver,ls_modo_pago,ld_amount)
//			
//			ld_comision            = (ld_amount * ld_porcentaje * -1) - ld_valor_comision_fijo - ld_valor_modo_pago - ld_valor_group_state - ld_total_group_city
//		else
//			ld_porc_modo_pago      = fn_comision_modo_pago_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
//			ld_telex_modo_pago     = fn_comision_modo_pago_fija_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
//						
//			//ld_porcentaje          = fn_comision_grupo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
//			//ld_valor_comision_fijo = fn_comision_grupo_fijo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
//			ld_porcentaje          = fn_comision_grupo2(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency,ls_modo_pago,'%')
//			ld_valor_comision_fijo = fn_comision_grupo2(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency,ls_modo_pago,'F')
//			
//			ld_valor_modo_pago     = ld_porc_modo_pago   + ld_telex_modo_pago 
//			ld_porc_group_state    = fn_comision_group_state(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
//			ld_telex_group_state   = fn_comision_group_state_fijo(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
//			ld_valor_group_state   = ld_porc_group_state + ld_telex_group_state
//			ld_total_group_city    = fn_comision_group_city(ls_group_payee,ls_city_receiver,ls_modo_pago,ld_amount)
//			
//			
//			ld_comision            = (ld_amount * ld_porcentaje) + ld_valor_comision_fijo + ld_valor_modo_pago + ld_valor_group_state + ld_total_group_city
//			ld_comision = round(ld_comision,4)
//		end if
//
//			UPDATE dba.receiver  
//   	  	   SET dba.receiver.commission_payee = :ld_comision  
//   	  	 WHERE ( dba.receiver.id_branch = :ls_branch )  
//           	AND ( dba.receiver.id_receiver = :id_receiver );
//				
//			If sqlca.sqlcode < 0 then
//				rollback;
//				return
//			end if				
//				
//			// ::::::::::::::::::::::::::::::::::::::::::::::::::::::
//			// La parte de arriba no esta calculando las comm de las 
//			// canceladas
//			double ld_comision_neg
//			
//			ld_comision_neg = ld_comision * -1
//		
//			UPDATE dba.receiver  
//   	  	   SET dba.receiver.commission_payee = :ld_comision_neg  
//   	  	 WHERE ( dba.receiver.id_branch = :ls_branch )  
//           	AND ( (dba.receiver.id_receiver * -1) = :id_receiver );
//				  
//				  
//			If sqlca.sqlcode < 0 then
//				rollback;
//				return
//			end if
//			// ::::::::::::::::::::::::::::::::::::::::::::::::::::::
//			
//		
//	 Fetch  commision_payee into :ls_country, :ls_group_payee, :ld_amount, :ls_mod_pay_currency, :ls_branch, :id_receiver, :ls_modo_pago, :ls_city_receiver ;
//	LOOP
//
//	CLOSE commision_payee;
	

//	----------------------------------------------------------
// Calculo de Comision del Pagador

	 UPDATE dba.receiver
		 SET commission_payee = dba.sfGetReceiverPayerFee(id_branch,id_receiver)
	  WHERE date_trans_payee >= :ld_from
		 AND date_trans_payee <= :ld_to	
		 AND id_main_branch_sent = :ls_group_closing
		 AND ref_receiver > 0;
		 
	If sqlca.sqlcode < 0 then
		rollback;
		return
	end if		 

//	----------------------------------------------------------
	
	
	
	 SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee
   WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
			(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
			(dba.transaccion_diaria_payee.id_concepto_contable = 'TP' ) AND
			(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing);  //TRANSACCION PAYEE
			
		If sqlca.sqlcode < 0 then
			rollback;
			return
		end if

	if ll_cont1 > 0 then

			//Borrar el Closing Realizado Anteriormente
			DELETE FROM dba.relacion_invoices_payee  
   		WHERE (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_from   ) and
					(dba.relacion_invoices_payee.date_relacion_diaria <= :ld_to   ) and
					(dba.relacion_invoices_payee.id_concepto_contable  = 'TP' ) and
					(dba.relacion_invoices_payee.cons_trans_diaria IN (SELECT cons_trans_diaria
																						FROM dba.transaccion_diaria_payee
																						WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
																								(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
																								(dba.transaccion_diaria_payee.id_concepto_contable = 'TP' ) AND
																								(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing) ));
			
		If sqlca.sqlcode < 0 then
			rollback;
			return
		end if

		 	DELETE
			 FROM dba.transaccion_diaria_payee
			WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_from ) AND  
					(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_to ) AND  
					(dba.transaccion_diaria_payee.id_concepto_contable = 'TP' ) AND
					(dba.transaccion_diaria_payee.id_group_trans_diaria  = :ls_group_closing);

			
			If sqlca.sqlcode < 0 then
				rollback;
				return
			end if

	end if
	


	DECLARE branch_cierre CURSOR FOR  
	 SELECT DISTINCT dba.receiver.id_main_branch_sent 
		FROM dba.receiver  
	  WHERE dba.receiver.date_trans_payee >= :ld_from
		 AND dba.receiver.date_trans_payee <= :ld_to
		 AND dba.receiver.id_main_branch_sent = :ls_group_closing
		 AND dba.receiver.ref_receiver > 0
		 AND dba.receiver.id_receiver > 0
		 AND dba.receiver.id_flag_receiver in ('T','P','C')
		 AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN (SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
																															FROM dba.relacion_invoices_payee
																														  WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'TP'
																															 AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																															 AND dba.receiver.id_branch = dba.relacion_invoices_payee.id_branch_invoice);
	
	
/*	
	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.group_branch.id_main_branch  
    FROM dba.group_branch,   
         dba.receiver  
   WHERE ( isnull(dba.receiver.id_main_branch_sent,dba.sfgetreceiverpayerid(dba.receiver.id_branch,dba.receiver.id_receiver)) = dba.group_branch.id_main_branch ) and   
			( dba.receiver.date_trans_payee >= :ld_from ) AND
			( dba.receiver.date_trans_payee <= :ld_to )    AND  
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			( dba.group_branch.id_main_branch = :ls_group_closing ) AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
																															from dba.relacion_invoices_payee
																														  where (dba.relacion_invoices_payee.id_concepto_contable  = 'TP' ) and
																																  (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																																  (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

*/			

			
			
		If sqlca.sqlcode < 0 then
			rollback;
			return
		end if


Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.commission_payee) 
     INTO :ld_valor  
     FROM dba.receiver  
    WHERE dba.receiver.id_main_branch_sent = :ls_group
		AND dba.receiver.date_trans_payee >= :ld_from
		AND dba.receiver.date_trans_payee <= :ld_to
		AND dba.receiver.ref_receiver > 0
		AND dba.receiver.id_receiver > 0
      AND dba.receiver.id_flag_receiver in ('T','P','C')
		AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           			   FROM dba.relacion_invoices_payee
																										   			  WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'TP'
																										 		          AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																										 		   		 AND dba.receiver.id_branch = dba.relacion_invoices_payee.id_branch_invoice);
	  
	If sqlca.sqlcode < 0 then
		rollback;
		return
	end if
									
	If ISNULL(ld_balance) then ld_balance = 0			
	ld_balance = ld_balance - ld_valor
	
	ld_datetime = datetime(ld_date,ld_time)
	
	ld_balance = ROUND(ld_balance,2)
	ld_valor   = ROUND(ld_valor,2)
	
	SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
	INTO :ld_cons  
	FROM dba.transaccion_diaria_payee  ;
		 
		 
	If sqlca.sqlcode < 0 then
		rollback;
		return
	end if
	
	if isnull(ld_cons) then ld_cons = 1
				
		
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
	  'TP','CLOSING PAYEE TRANSFERED',0,:ld_valor,:ld_balance )  ;
	  
	  
	If sqlca.sqlcode < 0 then		
		rollback;
		return
	end if
		
		
	INSERT INTO dba.relacion_invoices_payee  
		    (cons_trans_diaria,   
			 id_branch_invoice,   
			 id_receiver,   
			 date_relacion_diaria,
			 id_concepto_contable)
	SELECT :ld_cons,   
			 dba.receiver.id_branch,   
			 dba.receiver.id_receiver,   
			 :ld_datetime,
			 'TP'
	  FROM dba.receiver  
	 WHERE dba.receiver.id_main_branch_sent = :ls_group
		AND dba.receiver.date_trans_payee >= :ld_from
		AND dba.receiver.date_trans_payee <= :ld_to
		AND dba.receiver.ref_receiver > 0
		AND dba.receiver.id_receiver > 0
		AND dba.receiver.id_flag_receiver in ('T','P','C')
		AND (dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) NOT IN ( SELECT (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
																															FROM dba.relacion_invoices_payee
																														  WHERE dba.relacion_invoices_payee.id_concepto_contable  = 'TP'
																															 AND dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver
																															 AND dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice);


						
		If sqlca.sqlcode < 0 then			
			rollback;
			return
		end if
		
Fetch branch_cierre into :ls_group;

LOOP

CLOSE branch_cierre;

Setpointer(Arrow!)




end event

type st_3 from statictext within w_closing_payee
integer x = 965
integer y = 1348
integer width = 462
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
string text = "Missing Closings:"
boolean focusrectangle = false
end type

type lb_log from listbox within w_closing_payee
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

type em_to from editmask within w_closing_payee
integer x = 919
integer y = 232
integer width = 366
integer height = 76
integer taborder = 30
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

type st_2 from statictext within w_closing_payee
integer x = 741
integer y = 236
integer width = 155
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
string text = "To :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_payers from my_ddlb within w_closing_payee
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

type st_1 from statictext within w_closing_payee
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

type gb_1 from groupbox within w_closing_payee
integer x = 50
integer y = 1280
integer width = 1499
integer height = 524
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fix Missing Closings (All Payers)"
end type

type gb_2 from groupbox within w_closing_payee
integer x = 37
integer y = 32
integer width = 1513
integer height = 460
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Re-Build Payer Closing"
end type

