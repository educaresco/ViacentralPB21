$PBExportHeader$w_closing_payee_confirmados.srw
forward
global type w_closing_payee_confirmados from wb_report
end type
type cb_1 from commandbutton within w_closing_payee_confirmados
end type
type em_date from editmask within w_closing_payee_confirmados
end type
type st_1 from statictext within w_closing_payee_confirmados
end type
type dw_2 from datawindow within w_closing_payee_confirmados
end type
type cb_2 from commandbutton within w_closing_payee_confirmados
end type
type dw_4 from datawindow within w_closing_payee_confirmados
end type
type cb_fx from commandbutton within w_closing_payee_confirmados
end type
type cb_3 from commandbutton within w_closing_payee_confirmados
end type
end forward

global type w_closing_payee_confirmados from wb_report
int Width=3584
int Height=2180
boolean TitleBar=true
string Title="Closing Payee Confirmation"
long BackColor=82042848
cb_1 cb_1
em_date em_date
st_1 st_1
dw_2 dw_2
cb_2 cb_2
dw_4 dw_4
cb_fx cb_fx
cb_3 cb_3
end type
global w_closing_payee_confirmados w_closing_payee_confirmados

on w_closing_payee_confirmados.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.em_date=create em_date
this.st_1=create st_1
this.dw_2=create dw_2
this.cb_2=create cb_2
this.dw_4=create dw_4
this.cb_fx=create cb_fx
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.em_date
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_2
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.cb_fx
this.Control[iCurrent+8]=this.cb_3
end on

on w_closing_payee_confirmados.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.dw_4)
destroy(this.cb_fx)
destroy(this.cb_3)
end on

event open;call super::open;Commit;
end event

type dw_1 from wb_report`dw_1 within w_closing_payee_confirmados
int X=18
int Y=108
int Width=3529
int Height=1840
boolean BringToTop=true
string DataObject="dw_payee_confirmacion"
end type

event dw_1::constructor;SetTransObject(SQLCA)
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type cb_1 from commandbutton within w_closing_payee_confirmados
int X=2528
int Y=8
int Width=974
int Height=80
int TabOrder=20
boolean Visible=false
boolean BringToTop=true
string Text="Closing Payee by Confirmation"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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
Datetime		ld_datetime

time			ld_time = Now()

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

If messagebox("","Do you want to Continue",question!,yesno!) = 1 then
	
	 

	commit ;
	

	ld_date = date(em_date.text)
	ld_new_date = RelativeDate(ld_date,1)
	
	 UPDATE dba.receiver  
    SET dba.receiver.fee_rate = 0  
    WHERE ( dba.receiver.fee_rate is null ) AND  
          ( dba.receiver.date_receiver = :ld_date )   ;
	
	
	SELECT Count(*)
   INTO :ll_cont1
   FROM dba.transaccion_diaria_payee
   WHERE (dba.transaccion_diaria_payee.date_trans_diaria = :ld_date ) AND   
			( dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) ;  


//	if ll_cont1 > 0 then
//	   messagebox("Warning","Closing already Done,") 
//		return	
//	end if


	commit ;


	//Calcular las comisiones de los pagadores de cada invoice.
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
	        ( dba.branch.id_main_branch not in ('6022','5200','5100')) AND
           ( convert(char(12),dba.receiver.payment_date,110) = convert(char(12),:ld_date,110) ) AND
			  ( dba.receiver.ref_receiver > 0 ) AND
			  ( dba.receiver.id_receiver > 0 ) AND
			  ( dba.receiver.id_flag_receiver in ('P') )  ;
			  
				  
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
			return
		end if

	
	Open  commision_payee;
	
	Fetch  commision_payee into :ls_country, :ls_group_payee, :ld_amount, :ls_mod_pay_currency, :ls_branch, :id_receiver, :ls_modo_pago, :ls_city_receiver ;

	DO WHILE SQLCA.sqlcode = 0
		
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
			ld_porcentaje          = fn_comision_grupo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_valor_comision_fijo = fn_comision_grupo_fijo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_porc_group_state    = fn_comision_group_state(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_group_state   = fn_comision_group_state_fijo(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_valor_group_state   = ld_porc_group_state + ld_telex_group_state
			ld_total_group_city    = fn_comision_group_city(ls_group_payee,ls_city_receiver,ls_modo_pago,ld_amount)
			
			ld_comision            = (ld_amount * ld_porcentaje * -1) - ld_valor_comision_fijo - ld_valor_modo_pago - ld_valor_group_state - ld_total_group_city
		else
			ld_porc_modo_pago      = fn_comision_modo_pago_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_modo_pago     = fn_comision_modo_pago_fija_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_porcentaje          = fn_comision_grupo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_valor_comision_fijo = fn_comision_grupo_fijo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_valor_modo_pago     = ld_porc_modo_pago   + ld_telex_modo_pago 
			ld_porc_group_state    = fn_comision_group_state(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_group_state   = fn_comision_group_state_fijo(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_valor_group_state   = ld_porc_group_state + ld_telex_group_state
			ld_total_group_city    = fn_comision_group_city(ls_group_payee,ls_city_receiver,ls_modo_pago,ld_amount)
			
			
			ld_comision            = (ld_amount * ld_porcentaje) + ld_valor_comision_fijo + ld_valor_modo_pago + ld_valor_group_state + ld_total_group_city
		end if

			UPDATE dba.receiver  
   	  	SET dba.receiver.commission_payee = :ld_comision  
   	  	WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
           	   ( dba.receiver.id_receiver = :id_receiver )   ;
				  
			If sqlca.sqlcode < 0 then
				rollback;
				messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
				return
			end if
		
	 Fetch  commision_payee into :ls_country, :ls_group_payee, :ld_amount, :ls_mod_pay_currency, :ls_branch, :id_receiver, :ls_modo_pago, :ls_city_receiver ;
	LOOP

	CLOSE commision_payee;
	
	Commit;
		
	if dw_1.retrieve(date(em_date.text)) = 0 then return
		
	
	 SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee
   WHERE (dba.transaccion_diaria_payee.date_trans_diaria = :ld_date ) AND   
			( dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) ;  //TRANSACCION PAYEE
			
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
			return
		end if

	if ll_cont1 > 0 then
		if messagebox("Warning","Closing was made, Do you want to Close Again ?", Question!,yesno!) = 2 then
			return	
		else
			//Borrar el Closing Realizado Anteriormente
			DELETE FROM dba.relacion_invoices_payee  
   		WHERE ((dba.relacion_invoices_payee.date_relacion_diaria = :ld_date   ) and
					 (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ));
			
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
			return
		end if

		 	DELETE FROM dba.transaccion_diaria_payee  
   		WHERE ( dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) AND  
         		( dba.transaccion_diaria_payee.date_trans_diaria = :ld_date )   ;
					
			If sqlca.sqlcode < 0 then
				rollback;
				messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
				return
			end if

		end if
	end if
	
	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
	      ( dba.receiver.id_flag_receiver = 'P' ) AND
			( dba.branch.id_main_branch not in ('6022','5200','5100')) AND
			( dba.receiver.id_receiver > 0 ) AND
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.payment_date >= :ld_date ) AND
			( dba.receiver.payment_date <= dateadd(dd,1,:ld_date))    AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (TRIM(dba.relacion_invoices_payee.id_concepto_contable)  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

				
			
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
			return
		end if

Open 	branch_cierre;

Fetch branch_cierre into :ls_group;

DO WHILE SQLCA.sqlcode = 0
	
	
	  SELECT SUM(net_amount_receiver  + commission_payee) , COUNT(*)
    INTO :ld_valor , :ll_cont 
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
	      ( dba.receiver.id_flag_receiver = 'P' ) AND
			( dba.branch.id_main_branch not in ('6022','5200','5100')) AND
			( dba.receiver.id_receiver > 0 ) AND
			( dba.receiver.ref_receiver > 0 ) AND
			( dba.receiver.payment_date >= :ld_date ) AND
			( dba.receiver.payment_date <= dateadd(dd,1,:ld_date))    AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (TRIM(dba.relacion_invoices_payee.id_concepto_contable)  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

				
			
		messagebox('',ls_group+ '   -  '+string(ll_cont))	
	  
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
			return
		end if
		
		 SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		 
		 
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
			return
		end if
		
			if isnull(ld_cons) then ld_cons = 1
			
			ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
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
  			VALUES ( :ld_cons,:ls_group,:ld_date,:ld_datetime,   
            'CPC','CLOSING PAYEE CONRIRMATION',0,:ld_valor,:ld_balance )  ;
					
					  
		If sqlca.sqlcode < 0 then		
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
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
						'CPC'
    			FROM  dba.branch,   
         			dba.receiver  
   			 WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
	      				( dba.receiver.id_flag_receiver = 'P' ) AND
							( dba.branch.id_main_branch not in ('6022','5200','5100')) AND
							( dba.receiver.id_receiver > 0 ) AND
							( dba.receiver.ref_receiver > 0 ) AND
							( dba.receiver.payment_date >= :ld_date ) AND
							( dba.receiver.payment_date <= dateadd(dd,1,:ld_date))    AND
							( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (TRIM(dba.relacion_invoices_payee.id_concepto_contable)  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

				
						
		
						
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
			return
		end if
		
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;

else
	return
end if
commit ;
Setpointer(Arrow!)
end event

type em_date from editmask within w_closing_payee_confirmados
int X=489
int Width=306
int Height=88
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;text = string(today(),"mm/dd/yyyy")
end event

type st_1 from statictext within w_closing_payee_confirmados
int X=37
int Y=12
int Width=448
int Height=68
boolean Enabled=false
boolean BringToTop=true
string Text="Date of Closing :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_2 from datawindow within w_closing_payee_confirmados
int X=41
int Y=16
int Width=137
int Height=72
int TabOrder=50
boolean Visible=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type cb_2 from commandbutton within w_closing_payee_confirmados
int X=293
int Y=8
int Width=622
int Height=80
int TabOrder=60
boolean Visible=false
boolean BringToTop=true
string Text="Recalcular Comisiones"
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, ld_porcentaje, ld_balance = 0

Date			ld_date

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

If messagebox("","Do you want to Continue",question!,yesno!) = 1 then

	ld_date = date(em_date.text)

		
	 DECLARE commision_payee CURSOR FOR  
 	 SELECT "receiver"."id_country_receiver",   
           "branch"."id_main_branch",   
           "receiver"."net_amount_receiver",   
           "receiver"."mod_pay_currency",
			  "receiver"."id_branch",
			  "receiver"."id_receiver",
			  "receiver"."mode_pay_receiver",
			  "receiver"."id_city_receiver"  
    FROM   dba."receiver",   
           dba."branch"  
    WHERE  ( "branch"."id_branch" = "receiver"."branch_pay_receiver" ) and  
           ( "receiver"."date_receiver" = :ld_date ) AND
			  ( "receiver"."ref_receiver" > 0 ) AND
			  ( "receiver"."id_flag_receiver" in ('T','P','C') )  ;
			  
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
			return
		end if

	
	Open  commision_payee;
	
	Fetch  commision_payee into :ls_country, :ls_group_payee, :ld_amount, :ls_mod_pay_currency, :ls_branch, :id_receiver, :ls_modo_pago, :ls_city_receiver ;

	DO WHILE SQLCA.sqlcode = 0
		
		   SELECT branch.id_country,   
         		branch.id_state  
    		INTO :ls_country_sender,   
         	  :ls_state_sender  
    		FROM branch  
   		WHERE branch.id_branch = :ls_branch   ;

		if ld_amount < 0 then
			ld_amount              = ld_amount  * -1
			ld_porc_modo_pago      = fn_comision_modo_pago_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_modo_pago     = fn_comision_modo_pago_fija_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_valor_modo_pago     = ld_porc_modo_pago + ld_telex_modo_pago 
			ld_porcentaje          = fn_comision_grupo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_valor_comision_fijo = fn_comision_grupo_fijo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_porc_group_state    = fn_comision_group_state(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_group_state   = fn_comision_group_state_fijo(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_valor_group_state   = ld_porc_group_state + ld_telex_group_state
			ld_total_group_city    = fn_comision_group_city(ls_group_payee,ls_city_receiver,ls_modo_pago,ld_amount)
			
			ld_comision            = (ld_amount * ld_porcentaje * -1) - ld_valor_comision_fijo - ld_valor_modo_pago - ld_valor_group_state - ld_total_group_city
		else
			ld_porc_modo_pago      = fn_comision_modo_pago_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_modo_pago     = fn_comision_modo_pago_fija_payee(ls_group_payee,ls_country,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_porcentaje          = fn_comision_grupo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_valor_comision_fijo = fn_comision_grupo_fijo(ls_country, ls_group_payee, ld_amount, ls_mod_pay_currency)
			ld_valor_modo_pago     = ld_porc_modo_pago   + ld_telex_modo_pago 
			ld_porc_group_state    = fn_comision_group_state(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_telex_group_state   = fn_comision_group_state_fijo(ls_group_payee,ls_country_sender,ls_state_sender,ls_mod_pay_currency,ls_modo_pago,ld_amount)
			ld_valor_group_state   = ld_porc_group_state + ld_telex_group_state
			ld_total_group_city    = fn_comision_group_city(ls_group_payee,ls_city_receiver,ls_modo_pago,ld_amount)
			
			
			ld_comision            = (ld_amount * ld_porcentaje) + ld_valor_comision_fijo + ld_valor_modo_pago + ld_valor_group_state + ld_total_group_city
		end if

			UPDATE dba."receiver"  
   	  	SET "commission_payee" = :ld_comision  
   	  	WHERE ( "receiver"."id_branch" = :ls_branch ) AND  
           	   ( "receiver"."id_receiver" = :id_receiver )   ;
				  
			If sqlca.sqlcode < 0 then
				rollback;
				messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
				return
			end if
		
	 Fetch  commision_payee into :ls_country, :ls_group_payee, :ld_amount, :ls_mod_pay_currency, :ls_branch, :id_receiver, :ls_modo_pago, :ls_city_receiver ;
	LOOP

	CLOSE commision_payee;
	
	Commit;
	
end if
		
	if dw_1.retrieve(date(em_date.text)) = 0 then return
		
	
end event

type dw_4 from datawindow within w_closing_payee_confirmados
int X=18
int Y=1088
int Width=3529
int Height=856
int TabOrder=40
boolean Visible=false
boolean BringToTop=true
string DataObject="dw_payee_confirmacion_fx"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event constructor;SETTRANSOBJECT(SQLCA)
end event

type cb_fx from commandbutton within w_closing_payee_confirmados
int X=1568
int Y=12
int Width=727
int Height=80
int TabOrder=70
boolean Visible=false
boolean BringToTop=true
string Text="Closing FX"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//Double		ld_valor, ld_cons, ld_amount, id_receiver, ld_comision, ld_porcentaje, ld_balance = 0
//
//Date			ld_date, ld_new_date  
//
//string		ls_group,				&
//				ls_group_payee, 		&
//				ls_mod_pay_currency, &
//				ls_country,				&
//				ls_branch, 				&
//				ls_modo_pago, 			&
//				ls_country_sender,	&
//				ls_state_sender,		&
//				ls_city_receiver
//
//
//time			ld_time = Now()
//
//long 			ll_cont, ll_cont1
//
//Double		ld_cons_trans_diaria, 		&
//				ld_valor_comision_fijo, 	&
//				ld_diference,					&
//				ld_porc_modo_pago  = 0,		&
//				ld_telex_modo_pago = 0,		&
//				ld_valor_modo_pago = 0,		&
//				ld_valor_group_state = 0,	&
//				ld_telex_group_state = 0,	&
//				ld_porc_group_state = 0,   &
//				ld_total_group_city  = 0
//
//
//Setpointer(Hourglass!)
//Commit ;
//
//If messagebox("","Do you want to Continue",question!,yesno!) = 1 then
//	
//	  UPDATE receiver  
//     SET fx_receiver = 0  
//   WHERE ( receiver.date_trans_payee = :ld_date ) AND  
//         ( receiver.fx_receiver is NULL )   ;
//
//	
//	
//	ld_date = date(em_date.text)
//	ld_new_date = RelativeDate(ld_date,1)
//	
//	
//	SELECT Count(*)
//   INTO :ll_cont1
//   FROM dba.transaccion_diaria_payee
//   WHERE (date_trans_diaria = :ld_date ) AND   
//			( id_concepto_contable = 'CPCFX' ) ;  
//			
//	
//
//	if ll_cont1 > 0 then
//	   messagebox("Warning","Closing already Done,") 
//		return	
//	end if
//
//
//
//	commit ;
//
//		
//	if dw_4.retrieve(date(em_date.text)) = 0 then return
//		
//	
//	 SELECT Count(*) 
//    INTO :ll_cont1 
//    FROM dba.transaccion_diaria_payee
//   WHERE (date_trans_diaria = :ld_date ) AND   
//			( id_concepto_contable = 'CPCFX' ) ;  //TRANSACCION PAYEE
//			
//		If sqlca.sqlcode < 0 then
//			rollback;
//			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
//			return
//		end if
//
//	if ll_cont1 > 0 then
//		if messagebox("Warning","Closing was made, Do you want to Close Again ?", Question!,yesno!) = 2 then
//			return	
//		else
//			//Borrar el Closing Realizado Anteriormente
//			DELETE FROM dba.relacion_invoices_payee  
//   		WHERE ((date_relacion_diaria = :ld_date   ) and
//					 (id_concepto_contable  = 'CPCFX' ));
//			
//		If sqlca.sqlcode < 0 then
//			rollback;
//			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
//			return
//		end if
//
//		 	DELETE FROM dba.transaccion_diaria_payee  
//   		WHERE ( id_concepto_contable = 'CPCFX' ) AND  
//         		( date_trans_diaria = :ld_date )   ;
//					
//			If sqlca.sqlcode < 0 then
//				rollback;
//				messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
//				return
//			end if
//
//		end if
//	end if
//	
//	 DECLARE branch_cierre CURSOR FOR  
//    SELECT DISTINCT "branch"."id_main_branch"  
//    FROM dba."branch",   
//         dba."receiver",
//			dba."group_branch"
//    WHERE ( "receiver"."branch_pay_receiver" = "branch"."id_branch" ) and  
//			( "group_branch"."id_main_branch" = branch.id_main_branch ) and  
//         ( "receiver"."payment_date" = :ld_date ) AND  
//			( "receiver"."ref_receiver" > 0 ) AND
//         ( "receiver"."id_flag_receiver" = 'P' ) AND
//			( "branch"."id_main_branch" in ('5095','6081','5045','5040','5044','5041','5035','6035','5036')) AND
//			( "receiver"."mod_pay_currency" = 'N' ) AND  
//         ( "group_branch"."diference_exchange" <> 0 ) AND  
//			("receiver"."id_branch"+'-'+string("receiver"."id_receiver")) not in ( select (id_branch_invoice+'-'+string(id_receiver))
//		                                                                           from relacion_invoices_payee
//																										   where (id_concepto_contable  = 'CPCFX' ) and
//																										 		   (receiver.id_receiver = relacion_invoices_payee.id_receiver ) and
//																										 		   (receiver.id_branch = 	relacion_invoices_payee.id_branch_invoice))	;
//
//			
//			
//		If sqlca.sqlcode < 0 then
//			rollback;
//			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
//			return
//		end if
//
//Open 	branch_cierre;
//
//Fetch branch_cierre into :ls_group;
//
//DO WHILE SQLCA.sqlcode = 0
//	
//	
// SELECT SUM(fx_receiver) 
//    INTO :ld_valor  
//    FROM dba."branch",   
//         dba."receiver",
//			dba."group_branch"
//    WHERE ( "receiver"."branch_pay_receiver" = "branch"."id_branch" ) and  
//			( "group_branch"."id_main_branch" = branch.id_main_branch ) and  
//         ( "receiver"."payment_date" = :ld_date ) AND  
//			( "receiver"."ref_receiver" > 0 ) AND
//			(  "branch"."id_main_branch" = :ls_group ) AND  
//         ( "receiver"."id_flag_receiver" = 'P' ) AND
//			( "receiver"."mod_pay_currency" = 'N' ) AND  
//         ( "group_branch"."diference_exchange" <> 0 ) AND  
//			("receiver"."id_branch"+'-'+string("receiver"."id_receiver")) not in ( select (id_branch_invoice+'-'+string(id_receiver))
//		                                                                           from relacion_invoices_payee
//																										   where (id_concepto_contable  = 'CPCFX' ) and
//																										 		   (receiver.id_receiver = relacion_invoices_payee.id_receiver ) and
//																										 		   (receiver.id_branch = 	relacion_invoices_payee.id_branch_invoice))	;
//
//			
//		
//		IF isnull(ld_valor) then ld_valor = 0
//		
//	  
//		If sqlca.sqlcode < 0 then
//			rollback;
//			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
//			return
//		end if
//		
//		 SELECT Max(cons_trans_diaria) + 1  
//       INTO :ld_cons  
//       FROM dba."transaccion_diaria_payee"  ;
//		 
//		 
//		If sqlca.sqlcode < 0 then
//			rollback;
//			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
//			return
//		end if
//		
//			if isnull(ld_cons) then ld_cons = 1
//			If ISNULL(ld_balance) then ld_balance = 0
//			
//			ld_balance = 0
//			
//	
//		
//		  INSERT INTO dba."transaccion_diaria_payee"  
//         ( "cons_trans_diaria",   
//           "id_group_trans_diaria",   
//           "date_trans_diaria",   
//           "hour_trans_diaria",   
//           "id_concepto_contable",   
//           "des_trans_diaria",   
//           "debit_trans_diaria",   
//           "credit_trans_diaria",   
//           "balance_trans_diaria" )  
//  			VALUES ( :ld_cons,:ls_group,:ld_date,:ld_time,   
//           'CPCFX','F/X PAYEE CONFIRMATION',:ld_valor,0,:ld_balance )  ;
//			  
//			  
//		If sqlca.sqlcode < 0 then		
//			rollback;
//			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
//			return
//		end if
//		
//		
//			INSERT INTO dba."relacion_invoices_payee"  
//      	   ( "cons_trans_diaria",   
//           		"id_branch_invoice",   
//           		"id_receiver",   
//           		"date_relacion_diaria",
//					"id_concepto_contable"  )
//			  SELECT :ld_cons,   
//						"receiver"."id_branch",   
//         			"receiver"."id_receiver",   
//         			:ld_date,
//						'CPCFX'
//    			FROM  dba."branch",   
//         			dba."receiver",  
//   						dba."group_branch"
//    WHERE ( "receiver"."branch_pay_receiver" = "branch"."id_branch" ) and  
//			( "group_branch"."id_main_branch" = branch.id_main_branch ) and  
//         ( "receiver"."payment_date" = :ld_date ) AND  
//			( "receiver"."ref_receiver" > 0 ) AND
//         ( "receiver"."id_flag_receiver" = 'P' ) AND
//			(  "branch"."id_main_branch" = :ls_group ) AND  
//			( "receiver"."mod_pay_currency" = 'N' ) AND  
//         ( "group_branch"."diference_exchange" <> 0 ) AND  
//			("receiver"."id_branch"+'-'+string("receiver"."id_receiver")) not in ( select (id_branch_invoice+'-'+string(id_receiver))
//		                                                                           from relacion_invoices_payee
//																										   where (id_concepto_contable  = 'CPCFX' ) and
//																										 		   (receiver.id_receiver = relacion_invoices_payee.id_receiver ) and
//																										 		   (receiver.id_branch = 	relacion_invoices_payee.id_branch_invoice))	;
//
//
//						
//		If sqlca.sqlcode < 0 then
//			rollback;
//			messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
//			return
//		end if
//		
//	Fetch branch_cierre into :ls_group;
//
//	LOOP
//
//CLOSE branch_cierre;
//
//else
//	return
//end if
//commit ;
//Setpointer(Arrow!)
//
//
end event

type cb_3 from commandbutton within w_closing_payee_confirmados
int X=814
int Y=4
int Width=1134
int Height=80
int TabOrder=70
boolean BringToTop=true
string Text="Closing Payee by Confirmation"
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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


Setpointer(Hourglass!)
Commit ;

If messagebox("","Do you want to Continue",question!,yesno!) = 1 then

	ld_date = date(em_date.text)
	ld_new_date = RelativeDate(ld_date,1)
	

//	if ll_cont1 > 0 then
//	   messagebox("Warning","Closing already Done,") 
//		return	
//	end if

	if dw_1.retrieve(date(em_date.text)) = 0 then return
		
	
	 SELECT Count(*) 
    INTO :ll_cont1 
    FROM dba.transaccion_diaria_payee
   WHERE (convert(char(12),dba.transaccion_diaria_payee.date_trans_diaria,110) = convert(char(12),:ld_date,110) ) AND   
			(dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) ;  //TRANSACCION PAYEE
			
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence   1"+sqlca.sqlerrtext )
			return
		end if

	if ll_cont1 > 0 then
		if messagebox("Warning","Closing was made, Do you want to Close Again ?", Question!,yesno!) = 2 then
			return	
		else
			//Borrar el Closing Realizado Anteriormente
			DELETE FROM dba.relacion_invoices_payee  
   		WHERE ((convert(char(12),dba.relacion_invoices_payee.date_relacion_diaria,110) = convert(char(12),:ld_date,110)   ) and
					 (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ));
			
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence    2"+sqlca.sqlerrtext)
			return
		end if

		 	DELETE FROM dba.transaccion_diaria_payee  
   		WHERE ( dba.transaccion_diaria_payee.id_concepto_contable = 'CPC' ) AND  
         		( convert(char(12),dba.transaccion_diaria_payee.date_trans_diaria,110) = convert(char(12),:ld_date,110) )   ;
					
			If sqlca.sqlcode < 0 then
				rollback;
				messagebox("Error","SQL Sentence   3"+sqlca.sqlerrtext)
				return
			end if

		end if
	end if
	
	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         ( dba.receiver.payment_date >= :ld_date ) AND
			( dba.receiver.payment_date <= dateadd(dd,1,:ld_date))    AND 
			  ( dba.branch.id_main_branch not in ('6022','5200','5100')) AND
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
			messagebox("Error","SQL Sentence   4"+sqlca.sqlerrtext)
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
         ( dba.receiver.payment_date >= :ld_date ) AND
			( dba.receiver.payment_date <= dateadd(dd,1,:ld_date))    AND   
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
			messagebox("Error","SQL Sentence   5"+sqlca.sqlerrtext)
			return
		end if
		
		 SELECT MAX(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		 
		 
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence    6"+sqlca.sqlerrtext)
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
			messagebox("Error","SQL Sentence   7"+sqlca.sqlerrtext)
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
         			( dba.receiver.payment_date >= :ld_date ) AND
						( dba.receiver.payment_date <= dateadd(dd,1,:ld_date))    AND 
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
			messagebox("Error","SQL Sentence   8"+sqlca.sqlerrtext)
			return
		end if
		
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;

else
	return
end if
commit ;
Setpointer(Arrow!)
end event

