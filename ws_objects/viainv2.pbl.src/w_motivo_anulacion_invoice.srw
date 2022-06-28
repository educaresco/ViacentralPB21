$PBExportHeader$w_motivo_anulacion_invoice.srw
forward
global type w_motivo_anulacion_invoice from wb_response
end type
type dw_1 from datawindow within w_motivo_anulacion_invoice
end type
type cb_1 from commandbutton within w_motivo_anulacion_invoice
end type
type cb_2 from commandbutton within w_motivo_anulacion_invoice
end type
end forward

global type w_motivo_anulacion_invoice from wb_response
int X=814
int Y=892
int Width=1769
int Height=624
boolean TitleBar=true
string Title="Void Invoice"
dw_1 dw_1
cb_1 cb_1
cb_2 cb_2
end type
global w_motivo_anulacion_invoice w_motivo_anulacion_invoice

type variables
string	is_output
end variables

on w_motivo_anulacion_invoice.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_motivo_anulacion_invoice.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;dw_1.settransobject(sqlca)

Double	ld_sender

ld_sender = message.doubleparm

dw_1.insertrow(0)
dw_1.setitem(dw_1.getrow(),"id_sender_mot_anu",ld_Sender)
dw_1.setitem(dw_1.getrow(),"id_branch_mot_anu",gs_branch_insta_cons)
dw_1.setitem(dw_1.getrow(),"id_receiver_mot_anu",gl_receiver_cons)
dw_1.setitem(dw_1.getrow(),"id_cashier_mot_anu",gs_cashier)

dw_1.accepttext()


end event

event close;dw_1.reset()
end event

event pfc_close;dw_1.reset()
end event

event pfc_preclose;return dw_1.reset()
end event

type dw_1 from datawindow within w_motivo_anulacion_invoice
int X=18
int Y=52
int Width=1710
int Height=216
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_motivo_anulacion_invoice"
boolean Border=false
boolean LiveScroll=true
end type

type cb_1 from commandbutton within w_motivo_anulacion_invoice
int X=453
int Y=316
int Width=357
int Height=96
int TabOrder=20
boolean BringToTop=true
string Text="&Save"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_sender, ld_ref 
ld_Sender = Message.doubleparm

String	ls_date, ls_time, ls_filename, ls_branch, ls_sqlsyntax, ls_grupo

long		ll_filenum

Date		ld_fecha

Time		lt_hora

Datetime ld_datetime

ld_fecha = Today()
lt_hora = Now()
ld_datetime = Datetime(ld_fecha, lt_hora)

ld_ref = 0


				SELECT dba.receiver.ref_receiver
    			INTO :ld_ref 
    			FROM dba.receiver  
  				WHERE ( dba.receiver.id_branch   = :gs_branch_insta_cons ) AND  
        				( dba.receiver.id_receiver = :gl_receiver_cons     )   ;

if ld_ref > 0 then
	Messagebox("Error","No se puede Anular, Genero Referencia")
	Return
end if


if Messagebox("","Do you wat to put this Invoice in Void",Question!,YesNo!) = 2 then 
	return
end if
  

dw_1.Update()

if sqlca.sqlcode = 0 then
	
		Double	ld_amount, ld_comision, ld_comision_cliente, ld_fee_rate
		Long		ll_cont 

	
	  			SELECT dba.receiver.net_amount_receiver,   
         			 dba.receiver.exchange_company+dba.receiver.telex_company+dba.receiver.total_modo_pago_comp ,
						 dba.receiver.telex_receiver+dba.receiver.exchange_receiver+dba.receiver.total_modo_pago  ,
						 dba.receiver.fee_rate
    			INTO :ld_amount,   
         		  :ld_comision,
					  :ld_comision_cliente,
					  :ld_fee_rate
    			FROM dba.receiver  
  				WHERE ( dba.receiver.id_branch = :gs_branch_insta_cons ) AND  
        				( dba.receiver.id_receiver = :gl_receiver_cons )   ;
	
	
		if isnull(ld_fee_rate) then ld_fee_rate = 0
	
	  
	  ll_cont = 0
	  
     SELECT Count(*)  
     INTO :ll_cont  
     FROM    dba.relacion_invoices_payee  
     WHERE ( dba.relacion_invoices_payee.id_branch_invoice = :gs_branch_insta_cons ) AND  
           ( dba.relacion_invoices_payee.id_receiver = :gl_receiver_cons ) AND  
           ( dba.relacion_invoices_payee.id_concepto_contable = 'TD' )   ;


		if ll_cont > 0 then  // Devolucion del dinero a la agencia
			
			string	ls_desc
			Double	ld_credito, ld_debito, ld_cons
			
		SELECT dba.branch.id_main_branch  
    	INTO :ls_grupo  
    	FROM  dba.branch  
   	WHERE dba.branch.id_branch = :gs_branch_insta_cons   ;	
			
			
			
			  
		 SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
			
			
			
			ls_desc = 'Anulacion de Invoice :'+gs_branch_insta_cons+'-'+string(gl_receiver_cons)
			ld_credito = 0
			ld_debito  = 0
			
			
			ld_credito = ld_amount + ld_comision + ld_fee_rate
			
			
			
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
  				VALUES ( :ld_cons,   
           :ls_grupo,   
           getdate(),   
           getdate(),   
           'AC',   
           :ls_desc,   
           :ld_debito,   
           :ld_credito,   
           0 )  ;

			commit ;
	
	
		end if


	
	
	
	
	
	  UPDATE dba.receiver  
     SET dba.receiver.id_flag_receiver = 'A',   
         dba.receiver.net_amount_receiver = 0,   
         dba.receiver.rate_change_receiver = 0,   
         dba.receiver.telex_receiver = 0,   
         dba.receiver.recomend_receiver = 0,   
         dba.receiver.exchange_receiver = 0,   
         dba.receiver.handling_receiver = 0,   
         dba.receiver.total_receiver = 0,   
         dba.receiver.porc_comision_receiver = 0,   
         dba.receiver.total_pay_receiver = 0,   
         dba.receiver.exchange_company = 0,   
         dba.receiver.telex_company = 0,   
         dba.receiver.total_diference = 0,  
			dba.receiver.total_modo_pago = 0,
			dba.receiver.total_modo_pago_comp = 0,
			dba.receiver.fee_rate = 0
 WHERE ( dba.receiver.id_sender = :ld_sender ) AND  
         ( dba.receiver.id_branch = :gs_branch_insta_cons ) AND  
   		( dba.receiver.id_receiver = :gl_receiver_cons )   ;
	
	  
	  
				if sqlca.sqlcode < 0 then
					Messagebox("Update SQL","Error of Fetch SQL")
					return
				else
					Messagebox("Void","The Invoice was Void")
					COMMIT ;
					
					
									  
				  string	ls_pagadora
				  Double	ld_folio
				  
				  SELECT dba.receiver.branch_pay_receiver,   
         				dba.receiver.urgency_receiver  
    				INTO :ls_pagadora,   
         			  :ld_folio  
    				FROM dba.receiver  
   				WHERE ( dba.receiver.id_branch = :gs_branch_insta_cons ) AND  
         				( dba.receiver.id_receiver = :gl_receiver_cons )   ;
  			
			  	   SELECT dba.branch.id_main_branch  
    				INTO :ls_grupo  
    				FROM dba.branch  
   				WHERE dba.branch.id_branch = :ls_pagadora   ;

			 
			  
			  
			  	if ls_grupo = '6022' then
					
					   UPDATE dba.claves  
     					SET dba.claves.id_used = 'S'  
   					WHERE dba.claves.id_clave = :ld_folio   ;


					   UPDATE dba.group_clave  
     				   SET   dba.group_clave.id_flag_clave = 'I',   
         				   dba.group_clave.id_trans_clave = 'T'  
   					WHERE dba.group_clave.id_clave = :ld_folio   ;

					
				end if
					
					
					
					
					
					
					INSERT INTO dba.history_invoice  
        	 				 ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change )  
  					VALUES ( :gs_branch_insta_cons,:gl_receiver_cons,'I','C',:gs_cashier,GETDATE(),GETDATE() )  ;

					
					INSERT INTO dba.change_status_invoice  
                      ( id_branch,id_receiver,id_cashier,fecha,hora,id_flag_receiver_old,id_flag_receiver_new )  
           		VALUES ( :gs_branch_insta_cons,:gl_receiver_cons,:gs_cashier,:ld_datetime,:ld_datetime,'I','A' )  ;

					
					
					
					IF ProfileString(gs_database, "HostID","ID", "None")= '0001A00001' THEN //Headquaters
						////////////////////// GENERAR UNA SENTENCIA SQL PARA LAS AGENCIAS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
						
							SELECT DISTINCT dba.parametros.dir_output  
    							INTO :is_output
    						FROM dba.parametros  ;


							 ls_branch = gs_branch_insta_cons
					
					
					
							ls_date = String(Today(), "mmdd")
							ls_time = string(Now(),"HHMM")
		
							ls_filename=is_output+'SEN'+Fill('0',10 - Len(ls_branch))+ls_branch+".sql"
							ll_filenum=FileOpen(ls_filename, LineMode!, Write!, LockWrite!, Append!)
														
							ls_sqlsyntax= "UPDATE dba.receiver SET dba.receiver.id_flag_receiver = 'A', dba.receiver.net_amount_receiver = 0, "+ &
												"dba.receiver.rate_change_receiver = 0, dba.receiver.telex_receiver = 0, dba.receiver.exchange_receiver = 0, "+ &
												"dba.receiver.handling_receiver = 0, dba.receiver.total_receiver = 0, dba.receiver.porc_comision_receiver = 0, dba.receiver.total_pay_receiver = 0, "+&
												"dba.receiver.exchange_company = 0,  dba.receiver.telex_company = 0, dba.receiver.total_diference = 0, dba.receiver.fee_rate = 0 "
												
							
							ls_sqlsyntax +=	" WHERE dba.receiver.id_sender = "+ String(dw_1.GetItemNumber(1,"id_sender_mot_anu")) + " AND " + &
													"dba.receiver.id_branch = '"+ dw_1.GetItemString(1,"id_branch_mot_anu") + "' AND " + &
													"dba.receiver.id_receiver = "+ String(dw_1.GetItemNumber(1,"id_receiver_mot_anu")) + " ;"
		
							FileWrite (ll_filenum,ls_sqlsyntax)
							FileClose (ll_filenum)
							
					///////////////////////////////////////////////////////////////////////////////////////////////////
				end if	
					close(parent)
				end if
else
	Messagebox("Warning","Error ")
end if
end event

type cb_2 from commandbutton within w_motivo_anulacion_invoice
int X=841
int Y=316
int Width=357
int Height=96
int TabOrder=30
boolean BringToTop=true
string Text="&Cancel"
boolean Cancel=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

