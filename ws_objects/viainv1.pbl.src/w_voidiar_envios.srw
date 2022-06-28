$PBExportHeader$w_voidiar_envios.srw
forward
global type w_voidiar_envios from wb_response
end type
type dw_voidear_envios from datawindow within w_voidiar_envios
end type
end forward

global type w_voidiar_envios from wb_response
int Width=1815
int Height=768
boolean TitleBar=true
string Title="Void an Order"
long BackColor=82042848
dw_voidear_envios dw_voidear_envios
end type
global w_voidiar_envios w_voidiar_envios

on w_voidiar_envios.create
int iCurrent
call super::create
this.dw_voidear_envios=create dw_voidear_envios
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_voidear_envios
end on

on w_voidiar_envios.destroy
call super::destroy
destroy(this.dw_voidear_envios)
end on

event open;call super::open;if dw_voidear_envios.retrieve() = 0 then
	messagebox('Warning','No Voidable Orders Available')
//	close(w_voidiar_envios)
	
end if
end event

type dw_voidear_envios from datawindow within w_voidiar_envios
int X=9
int Y=24
int Width=1797
int Height=612
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_voidear_envios"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event constructor;SETTRANSobject(sqlca)
end event

event buttonclicked;String	ls_date, ls_time, ls_filename, ls_branch,	ls_grupo, ls_flag
Double	ld_receiver
long		ll_filenum, ll_cont = 0


commit ;

ls_branch   = dw_voidear_envios.getitemstring(row,"id_branch")
ld_receiver = dw_voidear_envios.getitemnumber(row,"id_receiver")

if Messagebox("","Do you wat to Void the Invoice : "+ls_branch+'-'+string(ld_receiver),Question!,YesNo!) = 2 then 
	return
end if

	ls_flag = ''
	
	  SELECT receiver.id_flag_receiver  
     INTO :ls_flag  
     FROM dba.receiver receiver 
     WHERE ( receiver.id_branch = :ls_branch ) AND  
         ( receiver.id_receiver = :ld_receiver )   ;


		if ls_flag <> 'I' then
			dw_voidear_envios.retrieve()
			Return
		end if


 
	  UPDATE dba.receiver  
     SET id_flag_receiver = 'A',   
         net_amount_receiver = 0,   
         rate_change_receiver = 0,   
         telex_receiver = 0,   
         recomend_receiver = 0,   
         exchange_receiver = 0,   
         handling_receiver = 0,   
         total_receiver = 0,   
         porc_comision_receiver = 0,   
         total_pay_receiver = 0,   
         exchange_company = 0,   
         telex_company = 0,   
         total_diference = 0,  
			total_modo_pago = 0,
			total_modo_pago_comp = 0,
			fee_rate = 0
		 WHERE ( id_branch = :ls_branch) AND  
   		    ( id_receiver = :ld_receiver)   ;
	
	  
	  		if sqlca.sqlcode < 0 then
					Messagebox("Warning","Error of Fetch SQL")
					return
			else
//					Messagebox("Void","The Invoice was Void")
					commit ; 
	  
				  string	ls_pagadora
				  Double	ld_folio
				  
				  SELECT branch_pay_receiver,   
         				urgency_receiver  
    				INTO  :ls_pagadora,   
         				:ld_folio  
    				FROM  dba.receiver  
   				WHERE ( id_branch = :gs_branch_insta_cons ) AND  
         				( id_receiver = :gl_receiver_cons )   ;
  			
			  	   SELECT id_main_branch  
    				INTO   :ls_grupo  
    				FROM   dba.branch  
   				WHERE  id_branch = :ls_pagadora   ;

			  	if ls_grupo = 'BBA' then
					
					   UPDATE dba.claves  
     					SET    id_used = 'S'  
   					WHERE  id_clave = :ld_folio   ;
						
						commit ;

					   UPDATE dba.group_clave  
     				   SET    id_flag_clave = 'I',   
         				    id_trans_clave = 'T'  
   					WHERE  id_clave = :ld_folio   ;
						
						commit ;
				end if
				
			close(parent)
		END IF
				
				
				
		
	

end event

