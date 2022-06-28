$PBExportHeader$w_closing_group_agent.srw
forward
global type w_closing_group_agent from wb_report
end type
type cb_1 from commandbutton within w_closing_group_agent
end type
type em_date from editmask within w_closing_group_agent
end type
type st_1 from statictext within w_closing_group_agent
end type
type dw_2 from datawindow within w_closing_group_agent
end type
type cb_refuerzo from commandbutton within w_closing_group_agent
end type
type dw_3 from u_dw within w_closing_group_agent
end type
type cb_cancelados from commandbutton within w_closing_group_agent
end type
end forward

global type w_closing_group_agent from wb_report
int Width=3598
int Height=2432
boolean TitleBar=true
string Title="Closing Agent for Group Update"
long BackColor=80269524
cb_1 cb_1
em_date em_date
st_1 st_1
dw_2 dw_2
cb_refuerzo cb_refuerzo
dw_3 dw_3
cb_cancelados cb_cancelados
end type
global w_closing_group_agent w_closing_group_agent

type variables
string	is_mod_currency = ''
end variables

on w_closing_group_agent.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.em_date=create em_date
this.st_1=create st_1
this.dw_2=create dw_2
this.cb_refuerzo=create cb_refuerzo
this.dw_3=create dw_3
this.cb_cancelados=create cb_cancelados
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.em_date
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_2
this.Control[iCurrent+5]=this.cb_refuerzo
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.cb_cancelados
end on

on w_closing_group_agent.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.cb_refuerzo)
destroy(this.dw_3)
destroy(this.cb_cancelados)
end on

event open;call super::open;Commit;
end event

type dw_1 from wb_report`dw_1 within w_closing_group_agent
int X=18
int Y=100
int Width=3529
int Height=1180
boolean BringToTop=true
string DataObject="dw_datos_closing_group_agent"
BorderStyle BorderStyle=StyleBox!
end type

event dw_1::constructor;SetTransObject(SQLCA)
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type cb_1 from commandbutton within w_closing_group_agent
int X=2085
int Width=731
int Height=80
int TabOrder=30
boolean BringToTop=true
string Text="Closing Agent"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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
				
Datetime		ld_datefrom, ld_dateto

Setpointer(Hourglass!)


  UPDATE dba.receiver  
     SET dba.receiver.fee_rate = 0  
   WHERE dba.receiver.id_branch = '0059'   ;

Commit;

ld_date = date(em_date.text)

ld_datefrom = datetime(ld_date,time('00:00:00'))
ld_dateto   = datetime(ld_date,time('23:59:59'))


				SELECT Count(*)
    		   INTO :ll_cont1
    			FROM dba.transaccion_diaria_payee
    			WHERE (dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND  
				 		(dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			 			( dba.transaccion_diaria_payee.id_concepto_contable = 'TD' ) ;  


				if ll_cont1 > 0 then
		         messagebox("Warning","Closing already Done,") 
					return	
				end if

		  			INSERT INTO dba.responsable_cierre  
         		  ( 	id_cashier,   
           			date_cierre,   
           			hora_cierre,   
           			tipo_cierre )  
 				 	VALUES ( :gs_cashier,GETDATE(),GETDATE(),'A' )  ;

//////////////////////// Recalcular las comisiones de cada Envio  /////////////////////////


 DECLARE comisiones CURSOR FOR  
 	 SELECT dba.receiver.id_country_receiver,   
           dba.branch.id_main_branch,   
           dba.receiver.net_amount_receiver,   
           dba.receiver.mod_pay_currency,
			  dba.receiver.id_branch,
			  dba.receiver.id_receiver,
			  dba.receiver.mode_pay_receiver,
			  dba.receiver.handling_receiver,
			  dba.receiver.id_city_receiver
    FROM   dba.receiver,   
           dba.branch  
    WHERE  ( dba.branch.id_branch = dba.receiver.branch_pay_receiver ) and  
	 		  ( dba.receiver.date_receiver >= :ld_datefrom ) AND  
				( dba.receiver.date_receiver <= :ld_dateto ) AND  
           ( dba.receiver.id_flag_receiver <> 'A'  )  ;
			  
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence Cursor para calcular Comisiones "+sqlca.sqlerrtext)
			return
		end if


	
	Open  comisiones ;
	Fetch  comisiones into :ls_country, :ls_group_payee, :ld_amount, :is_mod_currency, :ls_branch, :id_receiver, :ls_modo_pago1, :ld_other, :ls_city ;

	DO WHILE SQLCA.sqlcode  		= 0
			ll_cont_delivery	 		= 0
			ld_feet 						= 0 
			ld_feet_comp       		= 0 
			ld_porcentaje      		= 0
			ld_porcentaje_comp 		= 0
			ld_comision        		= 0
			ld_comision_comp	 		= 0
			ld_porc_modo_pago_comp 	= 0
			ll_contagent_group 		= 0
			ld_porcentaje_comp_city = 0
   		ld_feet_comp_city			= 0
   		ld_porcentaje_city		= 0
   		ld_feet_city 				= 0		
			ld_comision_city 			= 0
			ld_feet_city 				= 0
			ld_comision_comp_city 	= 0
			ld_feet_comp_city 		= 0

		gs_branch_insta     = ls_branch
		gs_country_receiver = ls_country
		
			
		   SELECT dba.receiver.fee_rate  
    		INTO :ld_fee_rate  
    		FROM dba.receiver  
   		WHERE ( dba.receiver.id_branch = :ls_branch  ) AND  
         		( dba.receiver.id_receiver = :id_receiver )   ;

		
			if isnull(ld_fee_rate) then
				
				UPDATE dba.receiver  
     			SET dba.fee_rate = 0  
  				WHERE ( dba.receiver.id_branch = :ls_branch  ) AND  
         			( dba.receiver.id_receiver = :id_receiver )   ;

				
				
			end if
		
		
		
		
		If isnull(ld_other) then ld_other = 0
		ls_propia = ""
		
		ls_propia = fn_agencia_propia(ls_branch)
		ld_amount = ABS(ld_amount)
		ll_contagent_group = 0
	
	SELECT Count(*)  
    INTO :ll_contagent_group
    FROM dba.comision_agent_modo_pago_grupo  
   WHERE ( dba.comision_agent_modo_pago_grupo.id_branch = :gs_branch_insta ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_main_branch = :ls_group_payee ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_country = :gs_country_receiver ) AND  
         ( dba.comision_agent_modo_pago_grupo.mod_pay_currency = :is_mod_currency  ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) AND  
         ( dba.comision_agent_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) AND  
         ( dba.comision_agent_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

IF ll_contagent_group > 0 then
	ld_vlr_modo_pago 		 = 0
	ld_vlr_modo_pago_comp = 0	
	
	  SELECT dba.comision_agent_modo_pago_grupo.porcent_comision_comp,   
         dba.comision_agent_modo_pago_grupo.feet_comision_comp,   
         dba.comision_agent_modo_pago_grupo.porcent_comision_agente,   
         dba.comision_agent_modo_pago_grupo.feet_comision_agente  
    INTO :ld_porcentaje_comp,   
         :ld_feet_comp ,   
         :ld_porcentaje,   
         :ld_feet  
    FROM dba.comision_agent_modo_pago_grupo  
      WHERE ( dba.comision_agent_modo_pago_grupo.id_branch = :gs_branch_insta ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_main_branch = :ls_group_payee ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_country = :gs_country_receiver ) AND  
         ( dba.comision_agent_modo_pago_grupo.mod_pay_currency = :is_mod_currency  ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) AND  
         ( dba.comision_agent_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) AND  
         ( dba.comision_agent_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

			ld_comision       = ( ld_amount * ld_porcentaje )   				
			ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
ELSE
			SELECT Count(*)  
    		INTO :ll_cont
    		FROM dba.comision  
   		WHERE ( dba.comision.id_branch = :gs_branch_insta ) 		AND 
					( dba.comision.id_country = :gs_country_receiver )  AND  
         		( dba.comision.range_begin_comision <= :ld_amount ) AND  
         		( dba.comision.range_end_comision >= :ld_amount )   AND
					( dba.comision.mod_pay_currency	= :is_mod_currency )  ;
			
			if ll_cont <> 0 then  ////////////// Verifica si esta en la tabla de Exclusion.
				ld_feet = fn_feet(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
				ld_feet_comp = fn_feet_company(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
				ld_porcentaje = fn_comision(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
				ld_porcentaje_comp = fn_comision_company(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
				ld_comision = ( ld_amount * ld_porcentaje )   				
				ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
			else
				ld_feet = fn_fee_standar(gs_country_receiver,ld_amount,is_mod_currency)
				ld_feet_comp = fn_fee_company_standar(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
				ld_porcentaje = fn_comision_standar(gs_country_receiver,ld_amount,is_mod_currency)
				ld_porcentaje_comp = fn_comision_company_standar(gs_country_receiver,ld_amount,is_mod_currency)
				ld_comision = ( ld_amount * ld_porcentaje )   				
				ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
			end if
		
			//SI ESTA EN LA TABLA COMISION_DELIVERY ANULAR LA STANDAR Y EXCLUSION

				ll_cont = 0
				lb_comision_delivery = False		
									
				SELECT Count(*)  
    			INTO :ll_cont  
    			FROM dba.comision_delivery  
   			WHERE ( dba.comision_delivery.comision_delivery.id_country = :gs_country_receiver ) AND  
         			( dba.comision_delivery.comision_delivery.id_modo_pago = :ls_modo_pago1 ) AND  
         			( dba.comision_delivery.comision_delivery.range_begin <= :ld_amount ) AND  
         			( dba.comision_delivery.comision_delivery.range_end >= :ld_amount )   ;
			
				if ll_cont > 0 then  
					lb_comision_delivery = True	
					
					   SELECT dba.comision_delivery.porcent_comp,   
         			 dba.comision_delivery.feet_comp,   
         			 dba.comision_delivery.porcent_agente,   
         			 dba.comision_delivery.feet_agente  
    					INTO :ld_porcentaje_comp,   
         				  :ld_feet_comp,   
         				  :ld_porcentaje,   
         				  :ld_feet  
    					FROM dba.comision_delivery  
   					WHERE ( dba.comision_delivery.id_country = :gs_country_receiver ) AND  
         					( dba.comision_delivery.id_modo_pago = :ls_modo_pago1 ) AND  
         					( dba.comision_delivery.range_begin <= :ld_amount ) AND  
         					( dba.comision_delivery.range_end >= :ld_amount )   ;

					ld_comision = ( ld_amount * ld_porcentaje )   				
					ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
				end if

		
			////////////////////////////  Costo dependiendo del Modo de Pago  ///////////////////////
					
					ld_porc_modo_pago      = 0
					ld_telex_modo_pago     = 0
					ld_porc_modo_pago_comp = 0
					ld_telex_modo_pago_comp = 0
		
   				   SELECT dba.comision_modo_pago_grupo.porcent_comision_agente,   
         	 				 dba.comision_modo_pago_grupo.feet_comision_agente, 
								 dba.comision_modo_pago_grupo.porcent_comision_comp,   
         	  				 dba.comision_modo_pago_grupo.feet_comision_comp  
    					INTO :ld_porc_modo_pago,   
          		 		  :ld_telex_modo_pago, 
							  :ld_porc_modo_pago_comp,   
           				  :ld_telex_modo_pago_comp 
    					FROM dba.comision_modo_pago_grupo  
  						WHERE ( dba.comision_modo_pago_grupo.id_main_branch = :ls_group_payee ) AND  
         					( dba.comision_modo_pago_grupo.id_country = :gs_country_receiver ) AND  
         					( dba.comision_modo_pago_grupo.mod_pay_currency = :is_mod_currency ) AND  
         					( dba.comision_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) AND  
         					( dba.comision_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) AND  
         					( dba.comision_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

	 		 				if isnull(ld_porc_modo_pago) then  ld_porc_modo_pago  = 0
	 		 				if isnull(ld_telex_modo_pago) then ld_telex_modo_pago = 0
	  						if isnull(ld_porc_modo_pago_comp) then  ld_porc_modo_pago_comp  = 0
	  						if isnull(ld_telex_modo_pago_comp) then ld_telex_modo_pago_comp = 0
	  					
	 		 				ld_vlr_modo_pago      = (ld_amount * ld_porc_modo_pago)      + ld_telex_modo_pago
  							ld_vlr_modo_pago_comp = (ld_amount * ld_porc_modo_pago_comp) + ld_telex_modo_pago_comp
	
	
			
			//////////////////////////////////////////////////////////////////////////////////// 
			///// Verificar Nuevamente si al tomar el Delivery aplica la exclusion o la Standar 
 	
		ls_standar_exclusion = ''
	
			SELECT standar_exclusion   
         INTO 	:ls_standar_exclusion   
    		FROM dba.comision_modo_pago_grupo  
  						WHERE ( dba.comision_modo_pago_grupo.id_main_branch = :ls_group_payee ) AND  
         					( dba.comision_modo_pago_grupo.id_country = :gs_country_receiver ) AND  
         					( dba.comision_modo_pago_grupo.mod_pay_currency = :is_mod_currency ) AND  
         					( dba.comision_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) AND  
         					( dba.comision_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) AND  
         					( dba.comision_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

				if lb_comision_delivery then
					ls_standar_exclusion = ''
				end if

				if ls_standar_exclusion = 'S' and Not(lb_comision_delivery) then
					ld_feet = fn_fee_standar(gs_country_receiver,ld_amount,is_mod_currency)
					ld_feet_comp = fn_fee_company_standar(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
					ld_porcentaje = fn_comision_standar(gs_country_receiver,ld_amount,is_mod_currency)
					ld_porcentaje_comp = fn_comision_company_standar(gs_country_receiver,ld_amount,is_mod_currency)
					ld_comision = ( ld_amount * ld_porcentaje )   				
					ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
				end if
	
		////////////////////////////////////////////////////////////////////////////////////
 END IF
 
 
 		//LA TABLA COMISION_CITY ES UN ADICIONAL A LO QUE ESTE
	ll_cont = 0 
	ld_porcentaje_comp_city = 0
   ld_feet_comp_city= 0
   ld_porcentaje_city= 0
   ld_feet_city = 0		
	ld_comision_city = 0
	ld_feet_city = 0
	ld_comision_comp_city = 0
	ld_feet_comp_city = 0
	
	SELECT Count(*)  
    INTO :ll_cont  
    FROM comision_city  
   WHERE ( comision_city.id_city = :ls_city ) AND  
         ( comision_city.id_modo_pago = :ls_modo_pago1 ) AND  
         ( comision_city.range_begin <= :ld_amount ) AND  
         ( comision_city.range_end >= :ld_amount )   ;
			
	if ll_cont > 0 then
		
		
		
		SELECT comision_city.porcent_comp,   
        comision_city.feet_comp,   
        comision_city.porcent_agente,   
        comision_city.feet_agente  
    	INTO :ld_porcentaje_comp_city,   
           :ld_feet_comp_city,   
           :ld_porcentaje_city,   
           :ld_feet_city  
    	FROM comision_city  
  		WHERE ( comision_city.id_city = :ls_city ) AND  
         	( comision_city.id_modo_pago = :ls_modo_pago1 ) AND  
         	( comision_city.range_begin <= :ld_amount ) AND  
         	( comision_city.range_end >= :ld_amount )   ;
				
	ld_comision_city        = ( ld_amount * ld_porcentaje_city )   				
	ld_comision_comp_city	= ( ld_amount * ld_porcentaje_comp_city )			
				
	else
			ld_porcentaje_comp_city = 0
         ld_feet_comp_city= 0
         ld_porcentaje_city= 0
         ld_feet_city = 0	
			ll_cont = 0 
			ld_porcentaje_comp_city = 0
   		ld_feet_comp_city= 0
   		ld_porcentaje_city= 0
   		ld_feet_city = 0		
			ld_comision_city = 0
			ld_feet_city = 0
			ld_comision_comp_city = 0
			ld_feet_comp_city = 0
	end if
	
	ld_comision        = ld_comision        + ld_comision_city
	ld_feet            = ld_feet            + ld_feet_city
	ld_comision_comp   = ld_comision_comp   + ld_comision_comp_city
	ld_feet_comp       = ld_feet_comp       + ld_feet_comp_city
	
////////////////////////////////////////////////////////////////////////////////////
 
 

	   if  id_receiver < 0 and id_receiver > -9000000 then
			
				id_receiver = id_receiver * -1	
			
			  SELECT receiver.exchange_receiver,   
        		 		receiver.telex_receiver,   
         			receiver.total_modo_pago, 
			  			receiver.exchange_company,   
         	      receiver.telex_company,   
                  receiver.total_modo_pago_comp  
           INTO  :ld_comision,
			  		  :ld_feet,
					  :ld_vlr_modo_pago,
			  		  :ld_comision_comp,   
                 :ld_feet_comp,   
                 :ld_vlr_modo_pago_comp  
           FROM receiver  
           WHERE ( receiver.id_branch = :ls_branch ) AND  
                 ( receiver.id_receiver = :id_receiver )   ;

			ld_comision           = (ld_comision   		   * -1 )
			ld_feet               = (ld_feet   		   		* -1 )
			ld_vlr_modo_pago      = (ld_vlr_modo_pago   	   * -1 )
			ld_comision_comp      = (ld_comision_comp   		* -1 )
			ld_feet_comp          = (ld_feet_comp		  		* -1 )	
			ld_vlr_modo_pago_comp = (ld_vlr_modo_pago_comp  * -1 )
			id_receiver           = id_receiver * -1	
		end if


	 if ls_propia = 'S' then   // si es una agencia propia iguala las comisiones
		ld_comision_comp      = ld_comision
		ld_feet_comp 			 = ld_feet
		ld_vlr_modo_pago_comp = ld_vlr_modo_pago
		ld_porcentaje_comp 	 = ld_porcentaje

				UPDATE dba.receiver  
     			SET dba.receiver.exchange_company = :ld_comision_comp,   
         		 dba.receiver.telex_company = :ld_feet_comp,   
         		 dba.receiver.total_modo_pago_comp = :ld_vlr_modo_pago_comp
   			WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         			( dba.receiver.id_receiver = :id_receiver )   ;		
		else
			
				UPDATE dba.receiver  
     			SET dba.receiver.exchange_company = :ld_comision_comp,   
         		 dba.receiver.telex_company = :ld_feet_comp,   
         		 dba.receiver.total_modo_pago_comp = :ld_vlr_modo_pago_comp,
					 dba.receiver.handling_receiver = 0
   			WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         			( dba.receiver.id_receiver = :id_receiver )   ;		

		end if	
		
			ls_propia = ""
			
//			ls_sql = 'UPDATE receiver SET exchange_company = '+string(ld_comision_comp)+' ,telex_company = '+string(ld_feet_comp)+' ,total_modo_pago_comp = '+string(ld_vlr_modo_pago_comp)
//			ls_sql = ls_sql + " WHERE ( id_branch = '"+string(ls_branch)+"' ) AND ( id_receiver = "+string(id_receiver)+" )   ;"
//			ls_output  = "N:\DINERO\OUTPUT\"	
//			ls_filesql = ls_output+'CLS'+Fill('0',10 - Len(ls_branch))+ls_branch+".sql"
//			ll_file   = FileOpen(ls_filesql, LineMode!, Write!, LockWrite!, Append!)
//			FileWrite (ll_file,ls_sql)
//			FileClose (ll_file)		

	Fetch  comisiones into :ls_country, :ls_group_payee, :ld_amount, :is_mod_currency, :ls_branch, :id_receiver, :ls_modo_pago1, :ld_other, :ls_city ;

	LOOP

	CLOSE comisiones;
	
	Commit;


///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////


	if dw_1.retrieve(ld_datefrom,ld_dateto) = 0 then return

	 SELECT Count(*)
    INTO :ll_cont1
    FROM dba.transaccion_diaria_payee
    WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND   
	 		 ( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND   
			 ( dba.transaccion_diaria_payee.id_concepto_contable = 'TD' ) ;  
			
	If sqlca.sqlcode < 0 then
		messagebox("Error","SQL Sentence Borrado Closing Anterior "+sqlca.sqlerrtext)
		rollback;
		return
	end if

	if ll_cont1 > 0 then
		if messagebox("Warning","Closing was made, Do you want to Close Again ?", Question!,yesno!) = 2 then
			return	
		else
			//Borrar el Closing Realizado Anteriormente
			DELETE FROM dba.relacion_invoices_payee  
   		WHERE  (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_datefrom  ) and
					 (dba.relacion_invoices_payee.date_relacion_diaria <= :ld_dateto  ) and
					 (dba.relacion_invoices_payee.id_concepto_contable  = 'TD' );
			
			If sqlca.sqlcode < 0 then
				rollback;
				messagebox("Error","SQL Sentence Borrado Closing Detalle"+sqlca.sqlerrtext)
				return
			end if

		 	DELETE FROM dba.transaccion_diaria_payee
   		WHERE ( dba.transaccion_diaria_payee.id_concepto_contable = 'TD' ) AND  
					( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom) and
					( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto) ;
					
			If sqlca.sqlcode < 0 then
				messagebox("Error","SQL Sentence bORRANDO EL cLOSING PAPA"+sqlca.sqlerrtext)
				rollback;
				return
			end if

		end if
	end if
	


	 DECLARE branch_cierre CURSOR FOR  
    SELECT DISTINCT dba.branch.id_main_branch  
    FROM dba.branch,   
         dba.receiver  
   WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and 
			( dba.receiver.id_receiver > 0 ) AND
			( dba.receiver.date_receiver >= :ld_datefrom ) AND
			( dba.receiver.date_receiver <= :ld_dateto )    AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'TD' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

	If sqlca.sqlcode < 0 then
		messagebox("Error","SQL Sentence Cursor Relacionar Cierre "+sqlca.sqlerrtext)
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
         ( dba.receiver.id_flag_receiver <> 'A' ) AND
			( dba.receiver.id_receiver > 0 ) AND
         ( dba.receiver.date_receiver >= :ld_datefrom ) AND
			( dba.receiver.date_receiver <= :ld_dateto )    AND
			( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'TD' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;

		if isnull(ld_valor) then
			ld_valor = 0
		end if

		If sqlca.sqlcode < 0 then
			messagebox("Error","SQL Sentence SUMANDO LOS VALORES"+sqlca.sqlerrtext)
			rollback;
			return
		end if
	  
	  	ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))
	  
	  
		 SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
	 
		 if sqlca.sqlcode < 0 then
			messagebox("Error","SQL Sentence CONSULTANDO EL CONSECUTIVO"+sqlca.sqlerrtext)
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
			messagebox("Error","SQL Sentence INSERTANDO EL MAESTRO DEL CIERRE"+sqlca.sqlerrtext)
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
    			FROM  dba.branch,   
         			dba.receiver  
   			WHERE ( dba.receiver.id_branch = dba.branch.id_branch ) and  
         			(  dba.branch.id_main_branch = :ls_group ) AND  
         			( dba.receiver.id_flag_receiver <> 'D' ) AND 
						( dba.receiver.id_receiver > 0 ) AND
         			( dba.receiver.date_receiver >= :ld_datefrom )  AND
         			( dba.receiver.date_receiver <= :ld_dateto )  AND						
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver)
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'TD' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch   = dba.relacion_invoices_payee.id_branch_invoice))	;

						
		If sqlca.sqlcode < 0 then
			messagebox("Error","SQL Sentence In Relation Invoices "+sqlca.sqlerrtext)
			rollback;
			return
		end if

			
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;

commit ;
Setpointer(Arrow!)




//cb_refuerzo.triggerevent(Clicked!)

end event

type em_date from editmask within w_closing_group_agent
int X=1765
int Width=306
int Height=88
int TabOrder=40
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

type st_1 from statictext within w_closing_group_agent
int X=1303
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

type dw_2 from datawindow within w_closing_group_agent
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

type cb_refuerzo from commandbutton within w_closing_group_agent
int Y=12
int Width=805
int Height=84
int TabOrder=60
boolean Visible=false
boolean BringToTop=true
string Text="Refuerzo Closing- Desactivado"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//string		ls_agencia,ls_output, ls_concepto
//date			ld_datei,ld_datef
//
//long			ll_cons_trans_diaria,li_FileNum
//string		ls_id_group_trans_diaria,ls_id_concepto_contable,ls_des_trans_diaria,ls_referencia,ls_banco,ls_cuenta
//date			ld_date_trans_diaria,ld_tdate
//time			lt_hour_trans_diaria
//
//double		ld_debit_trans_diaria,ld_credit_trans_diaria,ld_balance_trans_diaria
//
//
//string		ls_tbranch,ls_cadena, ls_file_name, ls_branch, ls_grupo
//Double		ld_treceiver
//
//
//ls_tbranch=''
//ls_cadena = ''
//ld_treceiver=0
//ld_datei		=	Relativedate(date(em_date.text),-1)
//ld_datef		=	Relativedate(date(em_date.text),1)
//
//
//SELECT parametros.dir_output
//INTO :ls_output
//FROM parametros  ;
//
//  DECLARE cur_branch CURSOR FOR
//  SELECT Distinct branch.id_branch,transaccion_diaria_payee.id_group_trans_diaria  
//    FROM transaccion_diaria_payee,   
//         branch  
//   WHERE ( branch.id_main_branch = transaccion_diaria_payee.id_group_trans_diaria ) and 
//         ( ( transaccion_diaria_payee.date_trans_diaria >= :ld_datei ) AND  
//         ( transaccion_diaria_payee.date_trans_diaria <= :ld_datef ) )   ;
//
//
//open cur_branch;
//fetch cur_branch INTO :ls_agencia,:ls_grupo;
//
//DO WHILE SQLCA.SQLCODE = 0
//
//	DECLARE cur_diaria_payee CURSOR FOR
//		  SELECT 	transaccion_diaria_payee.cons_trans_diaria,
//         			transaccion_diaria_payee.id_group_trans_diaria,
//		         	transaccion_diaria_payee.date_trans_diaria,
//      		   	transaccion_diaria_payee.hour_trans_diaria,
//         			transaccion_diaria_payee.id_concepto_contable,
//		         	transaccion_diaria_payee.des_trans_diaria,
//      		   	transaccion_diaria_payee.debit_trans_diaria,
//         			transaccion_diaria_payee.credit_trans_diaria,
//		         	transaccion_diaria_payee.balance_trans_diaria
//	    FROM 		transaccion_diaria_payee
//		 WHERE 		date_trans_diaria 		>= :ld_datei	AND
//		 				date_trans_diaria 		<= :ld_datef	AND
//						id_group_trans_diaria 	=	:ls_grupo ;
//
//	open  cur_diaria_payee;
//	fetch cur_diaria_payee INTO :ll_cons_trans_diaria,:ls_id_group_trans_diaria,:ld_date_trans_diaria,:lt_hour_trans_diaria,:ls_id_concepto_contable,&
//         :ls_des_trans_diaria,:ld_debit_trans_diaria,:ld_credit_trans_diaria,:ld_balance_trans_diaria;
//
//	ls_file_name = ls_output + "CLS"+FILL('0',10 - LEN(ls_agencia))+ls_agencia +".sql"
//	li_FileNum = FileOpen(ls_file_name, LineMode!, Write!, LockWrite!,Replace!)
//
//	ls_cadena = "CREATE TABLE dba.concepto_contable (id_concepto_contable char(5) NOT NULL,name_concepto_contable char(50) NOT NULL) ;"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "CREATE UNIQUE INDEX idx_concepto_contable ON dba.concepto_contable (id_concepto_contable ) ;"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "CREATE TABLE dba.transaccion_diaria_payee (cons_trans_diaria numeric(12,0) NOT NULL,id_group_trans_diaria char(4) NOT NULL,date_trans_diaria date NOT NULL,hour_trans_diaria time NOT NULL,id_concepto_contable char(5),des_trans_diaria char(50) ,debit_trans_diaria numeric(17,4) NOT NULL,credit_trans_diaria numeric(17,4) NOT NULL,balance_trans_diaria numeric(17,4) NOT NULL,descripcion_suspense char(15) ,link_reference numeric(17,0) ) ;"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "CREATE UNIQUE INDEX idx_trans_di_payee_o1 ON dba.transaccion_diaria_payee (cons_trans_diaria ) ;"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "INSERT INTO concepto_contable VALUES ('AC','MANUAL ENTRY');"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "INSERT INTO concepto_contable VALUES ('DA','DEPOSIT AGENT');"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "INSERT INTO concepto_contable VALUES ('DP','WIRE TO PAYEE');"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "INSERT INTO concepto_contable VALUES ('SA','SUSPENSE ACCOUNT');"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "INSERT INTO concepto_contable VALUES ('TD','AGENT DAILY TRANSMISSION');"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "INSERT INTO concepto_contable VALUES ('TP','PAYEE DAILY TRANSMISSION');"
//	filewrite(li_FileNum,ls_cadena)
//	ls_cadena = "INSERT INTO concepto_contable VALUES ('CA','ANUAL CLOSING');"
//	filewrite(li_FileNum,ls_cadena)
//
//
//	DO WHILE SQLCA.SQLCODE = 0
//		ls_cadena ="INSERT INTO transaccion_diaria_payee ( cons_trans_diaria, id_group_trans_diaria, date_trans_diaria,"
//		ls_cadena = ls_cadena + "hour_trans_diaria,id_concepto_contable,des_trans_diaria,debit_trans_diaria,"
//		ls_cadena = ls_cadena + "credit_trans_diaria,balance_trans_diaria) VALUES ( "
//		ls_cadena = ls_cadena + string(ll_cons_trans_diaria) + ",'" + ls_id_group_trans_diaria + "','"
//		ls_cadena = ls_cadena + string(ld_date_trans_diaria,"yyyy-mm-dd") + "','" + string(lt_hour_trans_diaria,"HH:MM:SS") + "','"
//		ls_cadena = ls_cadena + ls_id_concepto_contable + "','" + ls_des_trans_diaria + "'," + string(ld_debit_trans_diaria) + ","
//		ls_cadena = ls_cadena + string(ld_credit_trans_diaria) + "," + string(ld_balance_trans_diaria) + ","
//		ls_cadena = ls_cadena + ");"
//		filewrite(li_FileNum,ls_cadena)
//					
//		DECLARE relacion_closing_balance CURSOR FOR  
//  		SELECT relacion_invoices_payee.id_branch_invoice,   
//         relacion_invoices_payee.id_receiver,   
//         relacion_invoices_payee.date_relacion_diaria,   
//         relacion_invoices_payee.id_concepto_contable  
//    	FROM relacion_invoices_payee  
//   	WHERE relacion_invoices_payee.cons_trans_diaria = :ll_cons_trans_diaria   ;
//	
//		Open  relacion_closing_balance ;
//
//		Fetch  relacion_closing_balance into :ls_tbranch,:ld_treceiver,:ld_tdate,:ls_concepto;
//
//		DO WHILE SQLCA.sqlcode = 0
//
//			ls_cadena = "INSERT INTO relacion_invoices_payee (cons_trans_diaria,id_branch_invoice,id_receiver,date_relacion_diaria,id_concepto_contable)"
//			ls_cadena = ls_cadena + "values (" + string(ll_cons_trans_diaria) + ",'" + ls_tbranch+ "'," + string(ld_treceiver) + ",'" + string(ld_tdate,"yyyy-mm-dd") + "','"+ls_concepto+"');"
//			filewrite(li_FileNum,ls_cadena)
//			
//			// Verificar el closing las comisiones
//			string	ls_sql
//			Double	ld_comision_comp,ld_feet_comp,ld_vlr_modo_pago_comp
//			
//			   SELECT receiver.telex_company,   
//         	receiver.exchange_company,   
//         	receiver.total_modo_pago_comp  
//    			INTO :ld_feet_comp,   
//         		  :ld_comision_comp,   
//         		  :ld_vlr_modo_pago_comp 
//    			FROM receiver  
//   			WHERE ( receiver.id_branch = :ls_tbranch ) AND  
//         			( receiver.id_receiver = :ld_treceiver )   ;
//
//			
//			ls_sql = ''
//			ls_sql = 'UPDATE receiver SET exchange_company = '+string(ld_comision_comp)+' ,telex_company = '+string(ld_feet_comp)+' ,total_modo_pago_comp = '+string(ld_vlr_modo_pago_comp)
//			ls_sql = ls_sql + " WHERE ( id_branch = '"+string(ls_tbranch)+"' ) AND ( id_receiver = "+string(ld_treceiver)+' )   ;'
//			filewrite(li_FileNum,ls_sql)
//	
//			
//			Fetch  relacion_closing_balance into :ls_tbranch,:ld_treceiver,:ld_tdate,:ls_concepto;
//
//		loop
//		close relacion_closing_balance;
//
//
//		fetch cur_diaria_payee INTO :ll_cons_trans_diaria,:ls_id_group_trans_diaria,:ld_date_trans_diaria,:lt_hour_trans_diaria,:ls_id_concepto_contable,&
//         :ls_des_trans_diaria,:ld_debit_trans_diaria,:ld_credit_trans_diaria,:ld_balance_trans_diaria;
//	loop
//	close cur_diaria_payee;
//	fileclose(li_FileNum)
//
//	fetch cur_branch INTO :ls_agencia,:ls_grupo;
//LOOP
//
//Close cur_branch ;
//
//messagebox('','Finish')
//
////////////////FIN REFUERZO CLOSING
//
end event

type dw_3 from u_dw within w_closing_group_agent
int X=18
int Y=1296
int Width=3529
int Height=912
int TabOrder=20
boolean BringToTop=true
string DataObject="dw_datos_closing_group_agent_cancel"
BorderStyle BorderStyle=StyleBox!
boolean HScrollBar=true
boolean HSplitScroll=true
end type

event constructor;settransobject(sqlca)
end event

type cb_cancelados from commandbutton within w_closing_group_agent
int X=2821
int Width=731
int Height=80
int TabOrder=70
boolean BringToTop=true
string Text="Closing Cancelados"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
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

ld_date = date(em_date.text)

ld_datefrom = datetime(ld_date,time('00:00:00'))
ld_dateto   = datetime(ld_date,time('23:59:59'))

				SELECT Count(*)
    		   INTO :ll_cont1
    			FROM dba.transaccion_diaria_payee
    			WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND  
				 		( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			 			( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) ;  


				if ll_cont1 > 0 then
		         messagebox("Warning","Closing already Done,") 
					return	
				end if


	if dw_3.retrieve(ld_datefrom,ld_dateto) = 0 then return

	 SELECT Count(*)
    INTO :ll_cont1
    FROM dba.transaccion_diaria_payee
    WHERE ( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom ) AND   
	 		 ( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto ) AND 
			 ( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) ;  
			
	If sqlca.sqlcode < 0 then
		messagebox("Error","SQL Sentence Borrado Closing Anterior "+sqlca.sqlerrtext)
		rollback;
		return
	end if

	if ll_cont1 > 0 then
		if messagebox("Warning","Closing was made, Do you want to Close Again ?", Question!,yesno!) = 2 then
			return	
		else
			//Borrar el Closing Realizado Anteriormente
			DELETE FROM dba.relacion_invoices_payee  
   		WHERE  (dba.relacion_invoices_payee.date_relacion_diaria >= :ld_datefrom  ) and
					 (dba.relacion_invoices_payee.date_relacion_diaria <= :ld_dateto  ) and
					 (dba.relacion_invoices_payee.id_concepto_contable  = 'AVO' );
			
			If sqlca.sqlcode < 0 then
				rollback;
				messagebox("Error","SQL Sentence Borrado Closing Detalle"+sqlca.sqlerrtext)
				return
			end if

		 	DELETE FROM dba.transaccion_diaria_payee
   		WHERE ( dba.transaccion_diaria_payee.id_concepto_contable = 'AVO' ) AND  
					( dba.transaccion_diaria_payee.date_trans_diaria >= :ld_datefrom) and
					( dba.transaccion_diaria_payee.date_trans_diaria <= :ld_dateto  )  ;
					
			If sqlca.sqlcode < 0 then
				messagebox("Error","SQL Sentence bORRANDO EL cLOSING PAPA"+sqlca.sqlerrtext)
				rollback;
				return
			end if
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
		messagebox("Error","SQL Sentence Cursor Relacionar Cierre "+sqlca.sqlerrtext)
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
			messagebox("Error","SQL Sentence SUMANDO LOS VALORES"+sqlca.sqlerrtext)
			rollback;
			return
		end if
	  
		 SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
	 
		 if sqlca.sqlcode < 0 then
			messagebox("Error","SQL Sentence CONSULTANDO EL CONSECUTIVO"+sqlca.sqlerrtext)
			rollback;
			return
		 end if
		
			if isnull(ld_cons) then ld_cons = 1
			//ld_balance = fn_balance_escalable(ls_group,String(ld_date,'mm-dd-yyyy'))	
			
			if ISNULL(ld_balance) then ld_balance = 0
			//ld_balance = round(ld_balance,2) + round(ld_valor,2)
			ld_balance = 0
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
			messagebox("Error","SQL Sentence INSERTANDO EL MAESTRO DEL CIERRE"+sqlca.sqlerrtext)
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
			messagebox("Error","SQL Sentence In Relation Invoices"+sqlca.sqlerrtext)
			rollback;
			return
		end if

			
	Fetch branch_cierre into :ls_group;

	LOOP

CLOSE branch_cierre;

commit ;
Setpointer(Arrow!)


end event

