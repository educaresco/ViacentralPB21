$PBExportHeader$w_giros_fuera_closing_agente.srw
forward
global type w_giros_fuera_closing_agente from wb_report_fechas
end type
type sle_grupo from singlelineedit within w_giros_fuera_closing_agente
end type
type st_grupo from statictext within w_giros_fuera_closing_agente
end type
type cb_2 from commandbutton within w_giros_fuera_closing_agente
end type
type st_3 from statictext within w_giros_fuera_closing_agente
end type
type cb_sync from commandbutton within w_giros_fuera_closing_agente
end type
type cb_valores_cero from commandbutton within w_giros_fuera_closing_agente
end type
type cb_valores_ceroavo from commandbutton within w_giros_fuera_closing_agente
end type
type cb_reclosing from commandbutton within w_giros_fuera_closing_agente
end type
end forward

global type w_giros_fuera_closing_agente from wb_report_fechas
int Width=3963
int Height=2456
boolean TitleBar=true
string Title="Giros fuera del closing Agente"
long BackColor=80269524
sle_grupo sle_grupo
st_grupo st_grupo
cb_2 cb_2
st_3 st_3
cb_sync cb_sync
cb_valores_cero cb_valores_cero
cb_valores_ceroavo cb_valores_ceroavo
cb_reclosing cb_reclosing
end type
global w_giros_fuera_closing_agente w_giros_fuera_closing_agente

on w_giros_fuera_closing_agente.create
int iCurrent
call super::create
this.sle_grupo=create sle_grupo
this.st_grupo=create st_grupo
this.cb_2=create cb_2
this.st_3=create st_3
this.cb_sync=create cb_sync
this.cb_valores_cero=create cb_valores_cero
this.cb_valores_ceroavo=create cb_valores_ceroavo
this.cb_reclosing=create cb_reclosing
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_grupo
this.Control[iCurrent+2]=this.st_grupo
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.cb_sync
this.Control[iCurrent+6]=this.cb_valores_cero
this.Control[iCurrent+7]=this.cb_valores_ceroavo
this.Control[iCurrent+8]=this.cb_reclosing
end on

on w_giros_fuera_closing_agente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_grupo)
destroy(this.st_grupo)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.cb_sync)
destroy(this.cb_valores_cero)
destroy(this.cb_valores_ceroavo)
destroy(this.cb_reclosing)
end on

type dw_1 from wb_report_fechas`dw_1 within w_giros_fuera_closing_agente
int Y=140
int Width=3909
int Height=2136
int TabOrder=80
boolean BringToTop=true
string DataObject="w_giros_fuera_closing_agente"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_giros_fuera_closing_agente
int X=882
int Y=12
int TabOrder=20
boolean Visible=false
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_giros_fuera_closing_agente
int X=517
int Y=12
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_giros_fuera_closing_agente
int X=1285
int Y=20
int Width=293
boolean Visible=false
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_giros_fuera_closing_agente
int X=1577
int Y=20
int TabOrder=60
boolean Visible=false
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type sle_grupo from singlelineedit within w_giros_fuera_closing_agente
int X=1202
int Y=20
int Width=247
int Height=88
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = Date(em_fecha2.text)

//dw_1.retrieve(ld_Fecha1,ld_Fecha2,'%'+sle_grupo.text+'%')

dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

type st_grupo from statictext within w_giros_fuera_closing_agente
int X=983
int Y=28
int Width=210
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Group :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_2 from commandbutton within w_giros_fuera_closing_agente
int X=2711
int Y=20
int Width=590
int Height=92
int TabOrder=50
boolean BringToTop=true
string Text="Procesar"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string		ls_grupo, ls_branch, ls_flag
Double		ld_receiver, ld_amount, ld_comm, ld_otros, ld_exchange_company
DateTime		ld_date, ld_payment_date, LD_DATE_TRANS_PAYEE
Long			ll_cont, ll_row,ld_ref

dw_1.reset()

ls_grupo = sle_grupo.text

  DECLARE LOST CURSOR FOR 
  SELECT dba.RECEIVER.ID_BRANCH,   
         dba.RECEIVER.ID_RECEIVER,   
         dba.RECEIVER.DATE_RECEIVER,   
         dba.RECEIVER.NET_AMOUNT_RECEIVER,   
         dba.RECEIVER.COMMISSION_PAYEE,
			dba.RECEIVER.id_flag_receiver,
			dba.RECEIVER.REF_RECEIVER,
			dba.RECEIVER.PAYMENT_DATE,
			dba.RECEIVER.DATE_TRANS_PAYEE,
			dba.RECEIVER.HANDLING_RECEIVER,
			dba.RECEIVER.EXCHANGE_COMPANY
    FROM dba.RECEIVER,   
         dba.BRANCH  
   WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.ID_BRANCH ) and 
			( dba.RECEIVER.ID_RECEIVER  > 0 ) AND
			( dba.RECEIVER.NET_AMOUNT_RECEIVER <> 0 ) AND
         ( ( dba.BRANCH.ID_MAIN_BRANCH = :ls_grupo ) ) order by  dba.BRANCH.ID_BRANCH ASC,   dba.RECEIVER.ID_RECEIVER ASC ;
				
	OPEN LOST ;
	FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref, :ld_payment_date, :LD_DATE_TRANS_PAYEE, :ld_otros,:ld_exchange_company ;
	DO WHILE SQLCA.SQLCODE = 0
			st_3.text = trim(ls_branch)+'-'+string(ld_receiver)
			ll_cont = 0
		
		   SELECT count(*)  
    		INTO :ll_cont  
    		FROM dba.RELACION_INVOICES_PAYEE  
   		WHERE ( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE in ('TD') ) AND  
         		( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch ) AND  
         		( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver )   ;

			if ll_cont > 1 then
				ll_row = dw_1.insertrow(0)
				dw_1.setitem(ll_row,"id_branch",ls_branch )
				dw_1.setitem(ll_row,"id_receiver",ld_receiver)
				dw_1.setitem(ll_row,"id_flag_receiver",ls_flag)
				dw_1.setitem(ll_row,"net_amount_receiver",ld_amount)
				dw_1.setitem(ll_row,"HANDLING_RECEIVER",ld_otros)
				dw_1.setitem(ll_row,"exchange_company",ld_exchange_company)
				dw_1.setitem(ll_row,"date_receiver",ld_date)
				dw_1.setitem(ll_row,"ref_receiver",ld_ref)
	
				
				
				
			end if

		FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref , :ld_payment_date, :LD_DATE_TRANS_PAYEE, :ld_otros,:ld_exchange_company ;
	LOOP
	CLOSE LOST ;
		
			

end event

type st_3 from statictext within w_giros_fuera_closing_agente
int X=14
int Y=20
int Width=338
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
boolean FocusRectangle=false
long BackColor=65535
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_sync from commandbutton within w_giros_fuera_closing_agente
int X=3310
int Y=20
int Width=590
int Height=92
int TabOrder=40
boolean BringToTop=true
string Text="Sync"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string		ls_grupo, ls_branch, ls_flag
Double		ld_receiver, ld_amount, ld_comm, ld_otros, ld_exchange_company
DateTime		ld_date, ld_payment_date, LD_DATE_TRANS_PAYEE
Long			ll_cont, ll_row,ld_ref

dw_1.reset()

ls_grupo = sle_grupo.text

  DECLARE LOST CURSOR FOR 
  SELECT dba.RECEIVER.ID_BRANCH,   
         dba.RECEIVER.ID_RECEIVER,   
         dba.RECEIVER.DATE_RECEIVER,   
         dba.RECEIVER.NET_AMOUNT_RECEIVER,   
         dba.RECEIVER.COMMISSION_PAYEE,
			dba.RECEIVER.id_flag_receiver,
			dba.RECEIVER.REF_RECEIVER,
			dba.RECEIVER.PAYMENT_DATE,
			dba.RECEIVER.DATE_TRANS_PAYEE,
			dba.RECEIVER.HANDLING_RECEIVER,
			dba.RECEIVER.EXCHANGE_COMPANY
    FROM dba.RECEIVER,   
         dba.BRANCH  
   WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.ID_BRANCH ) and 
			( dba.RECEIVER.ID_RECEIVER  > 0 ) AND
			( dba.RECEIVER.NET_AMOUNT_RECEIVER <> 0 ) AND
			( dba.RECEIVER.id_flag_receiver = 'T' ) AND
			( dba.RECEIVER.DATE_RECEIVER > '2004-09-20 00:00:00' )  order by  dba.BRANCH.ID_BRANCH ASC,   dba.RECEIVER.ID_RECEIVER ASC ;
				
	OPEN LOST ;
	FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref, :ld_payment_date, :LD_DATE_TRANS_PAYEE, :ld_otros,:ld_exchange_company ;
	DO WHILE SQLCA.SQLCODE = 0
			st_3.text = trim(ls_branch)+'-'+string(ld_receiver)
			ll_cont = 0
		
		      SELECT Count(*)  
    			INTO :ll_cont  
            FROM dba.via_transactionqueue  
            WHERE ( dba.via_transactionqueue.smaagencyid = :ls_branch ) AND  
                  ( dba.via_transactionqueue.smaid = :ld_receiver )   ;

			if ll_cont = 0 then
				ll_row = dw_1.insertrow(0)
				dw_1.setitem(ll_row,"id_branch",ls_branch )
				dw_1.setitem(ll_row,"id_receiver",ld_receiver)
				dw_1.setitem(ll_row,"id_flag_receiver",ls_flag)
				dw_1.setitem(ll_row,"net_amount_receiver",ld_amount)
				dw_1.setitem(ll_row,"HANDLING_RECEIVER",ld_otros)
				dw_1.setitem(ll_row,"exchange_company",ld_exchange_company)
				dw_1.setitem(ll_row,"date_receiver",ld_date)
				dw_1.setitem(ll_row,"ref_receiver",ld_ref)
	
				
				
				
			end if

		FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref , :ld_payment_date, :LD_DATE_TRANS_PAYEE, :ld_otros,:ld_exchange_company ;
	LOOP
	CLOSE LOST ;
		
			

end event

type cb_valores_cero from commandbutton within w_giros_fuera_closing_agente
int X=2112
int Y=20
int Width=594
int Height=92
int TabOrder=30
boolean BringToTop=true
string Text="Anulados en Closing(TD) "
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;////string		ls_grupo, ls_branch, ls_flag
//Double		ld_receiver, ld_amount, ld_comm, ld_otros, ld_exchange_company, ld_total_closing_actual, ld_total_closing, ld_total_a , ld_total_b , ld_total_c
//DateTime		ld_date, ld_payment_date, LD_DATE_TRANS_PAYEE
//Long			ll_cont, ll_row,ld_ref, ld_cons = 0
//
//dw_1.reset()
//
//ls_grupo = sle_grupo.text
//
//
////cursor de los grupos malos
//  DECLARE GRUPO CURSOR FOR  
//  SELECT dba.FIX_BALANCE_GRUPO.ID_MAIN_BRANCH  
//    FROM dba.FIX_BALANCE_GRUPO  where dba.FIX_BALANCE_GRUPO.ID_MAIN_BRANCH = 'V001' ;
//
//OPEN GRUPO ;
//FETCH GRUPO INTO :ls_grupo ;
//
//DO WHILE SQLCA.SQLCODE = 0
//
//
//
//  DECLARE LOST CURSOR FOR 
//  SELECT dba.RECEIVER.ID_BRANCH,   
//         dba.RECEIVER.ID_RECEIVER,   
//         dba.RECEIVER.DATE_RECEIVER,   
//         dba.RECEIVER.NET_AMOUNT_RECEIVER,   
//         dba.RECEIVER.COMMISSION_PAYEE,
//			dba.RECEIVER.id_flag_receiver,
//			dba.RECEIVER.REF_RECEIVER,
//			dba.RECEIVER.PAYMENT_DATE,
//			dba.RECEIVER.DATE_TRANS_PAYEE,
//			dba.RECEIVER.HANDLING_RECEIVER,
//			dba.RECEIVER.EXCHANGE_COMPANY
//    FROM dba.RECEIVER,   
//         dba.BRANCH  
//   WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.ID_BRANCH ) and 
//			//( dba.RECEIVER.NET_AMOUNT_RECEIVER = 0 ) AND
//         ( ( dba.BRANCH.ID_MAIN_BRANCH = :ls_grupo ) ) order by  dba.BRANCH.ID_BRANCH ASC,   dba.RECEIVER.ID_RECEIVER ASC ;
//				
//	OPEN LOST ;
//	FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref, :ld_payment_date, :LD_DATE_TRANS_PAYEE, :ld_otros,:ld_exchange_company ;
//	DO WHILE SQLCA.SQLCODE = 0
//			st_3.text = trim(ls_branch)+'-'+string(ld_receiver)
//			ld_cons  = 0
//		
//		   SELECT dba.RELACION_INVOICES_PAYEE.CONS_TRANS_DIARIA  
//    		INTO :ld_cons  
//    		FROM dba.RELACION_INVOICES_PAYEE  
//   		WHERE ( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE in ('TD') ) AND  
//         		( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch ) AND  
//         		( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver )   ;
//
//	if ld_cons  <> 0 then
//		
//				
//				
//				
//				//*------------------------------------------------->
//				//Arregla el Closing
//				
//						ld_total_closing = 0
//				
//						SELECT SUM(dba.RECEIVER.NET_AMOUNT_RECEIVER + dba.RECEIVER.EXCHANGE_COMPANY + dba.RECEIVER.TELEX_COMPANY)  
//						INTO :ld_total_closing  
//						 FROM dba.RELACION_INVOICES_PAYEE,   
//								dba.RECEIVER  
//						WHERE ( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = dba.RECEIVER.ID_BRANCH ) and  
//								( dba.RECEIVER.ID_RECEIVER = dba.RELACION_INVOICES_PAYEE.ID_RECEIVER ) and  
//								( ( dba.RELACION_INVOICES_PAYEE.CONS_TRANS_DIARIA = :ld_cons ) AND  
//								( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE = 'TD' ) )   ;
//							
//							
//							//ld_total_closing = ld_total_a + ld_total_b + ld_total_c
//							
//							
//							IF ISNULL(ld_total_closing) then ld_total_closing = 0
//							
//							if sqlca.sqlcode <> 0 then
//								messagebox('',sqlca.sqlerrtext)
//							end if
//							
//								
//							ld_total_closing_actual = 0	
//								
//								
//						    SELECT dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA  
//							 INTO :ld_total_closing_actual  
//							 FROM dba.TRANSACCION_DIARIA_PAYEE  
//							WHERE dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA = :ld_cons   ;
//							
//							IF ISNULL(ld_total_closing_actual) then ld_total_closing_actual = 0
//								
//								
//					If ld_total_closing <> 	ld_total_closing_actual then
//						
//						ll_row = dw_1.insertrow(0)
//						dw_1.setitem(ll_row,"id_branch",ls_branch )
//						dw_1.setitem(ll_row,"id_receiver",ld_receiver)
//						dw_1.setitem(ll_row,"id_flag_receiver",ls_flag)
//						dw_1.setitem(ll_row,"net_amount_receiver",ld_amount)
//						dw_1.setitem(ll_row,"HANDLING_RECEIVER",ld_otros)
//						dw_1.setitem(ll_row,"exchange_company",ld_exchange_company)
//						dw_1.setitem(ll_row,"date_receiver",ld_date)
//						dw_1.setitem(ll_row,"ref_receiver",ld_ref)
//						dw_1.setitem(ll_row,"cons",ld_cons)
//						
//						  UPDATE dba.TRANSACCION_DIARIA_PAYEE  
//							  SET DEBIT_TRANS_DIARIA = :ld_total_closing  
//							WHERE ( dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA = :ld_cons ) AND  
//									( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE = 'TD' )   ;
//
//						
//						
//					end if
//								
//								
//
//				
//			end if	
//				
//				
//				
//				//*------------------------------------------------->
//
//
//		FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref , :ld_payment_date, :LD_DATE_TRANS_PAYEE, :ld_otros,:ld_exchange_company ;
//	LOOP
//	CLOSE LOST ;
//	
//		FETCH GRUPO INTO :ls_grupo ;
//	LOOP
//	CLOSE GRUPO ;
//	
//	COMMIT ;
//		
//			
//
end event

type cb_valores_ceroavo from commandbutton within w_giros_fuera_closing_agente
int X=1477
int Y=20
int Width=626
int Height=92
int TabOrder=70
boolean BringToTop=true
string Text="Anulados en Closing(AVO) "
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//string		ls_grupo, ls_branch, ls_flag
//Double		ld_receiver, ld_amount, ld_comm, ld_otros, ld_exchange_company, ld_total_closing_actual, ld_total_closing, ld_total_a , ld_total_b , ld_total_c
//DateTime		ld_date, ld_payment_date, LD_DATE_TRANS_PAYEE
//Long			ll_cont, ll_row,ld_ref, ld_cons = 0
//
//dw_1.reset()
//
//ls_grupo = sle_grupo.text
//
//
////cursor de los grupos malos
//  DECLARE GRUPO CURSOR FOR  
//  SELECT dba.FIX_BALANCE_GRUPO.ID_MAIN_BRANCH  
//    FROM dba.FIX_BALANCE_GRUPO ;//where dba.FIX_BALANCE_GRUPO.ID_MAIN_BRANCH = :ls_grupo ;
//
//OPEN GRUPO ;
//FETCH GRUPO INTO :ls_grupo ;
//
//DO WHILE SQLCA.SQLCODE = 0
//
//
//
//  DECLARE LOST CURSOR FOR 
//  SELECT dba.RECEIVER.ID_BRANCH,   
//         dba.RECEIVER.ID_RECEIVER,   
//         dba.RECEIVER.DATE_RECEIVER,   
//         dba.RECEIVER.NET_AMOUNT_RECEIVER,   
//         dba.RECEIVER.COMMISSION_PAYEE,
//			dba.RECEIVER.id_flag_receiver,
//			dba.RECEIVER.REF_RECEIVER,
//			dba.RECEIVER.PAYMENT_DATE,
//			dba.RECEIVER.DATE_TRANS_PAYEE,
//			dba.RECEIVER.HANDLING_RECEIVER,
//			dba.RECEIVER.EXCHANGE_COMPANY
//    FROM dba.RECEIVER,   
//         dba.BRANCH  
//   WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.ID_BRANCH ) and 
//			( dba.RECEIVER.NET_AMOUNT_RECEIVER < 0 ) AND
//         ( ( dba.BRANCH.ID_MAIN_BRANCH = :ls_grupo ) ) order by  dba.BRANCH.ID_BRANCH ASC,   dba.RECEIVER.ID_RECEIVER ASC ;
//				
//	OPEN LOST ;
//	FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref, :ld_payment_date, :LD_DATE_TRANS_PAYEE, :ld_otros,:ld_exchange_company ;
//	DO WHILE SQLCA.SQLCODE = 0
//			st_3.text = trim(ls_branch)+'-'+string(ld_receiver)
//			ld_cons  = 0
//		
//		   SELECT dba.RELACION_INVOICES_PAYEE.CONS_TRANS_DIARIA  
//    		INTO :ld_cons  
//    		FROM dba.RELACION_INVOICES_PAYEE  
//   		WHERE ( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE in ('AVO') ) AND  
//         		( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch ) AND  
//         		( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver )   ;
//
//	if ld_cons  <> 0 then
//		
//				
//				
//				
//				//*------------------------------------------------->
//				//Arregla el Closing
//				
//						ld_total_closing = 0
//				
//						SELECT SUM(dba.RECEIVER.NET_AMOUNT_RECEIVER + dba.RECEIVER.EXCHANGE_COMPANY + dba.RECEIVER.TELEX_COMPANY )  
//						INTO :ld_total_closing  
//						 FROM dba.RELACION_INVOICES_PAYEE,   
//								dba.RECEIVER  
//						WHERE ( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = dba.RECEIVER.ID_BRANCH ) and  
//								( dba.RECEIVER.ID_RECEIVER = dba.RELACION_INVOICES_PAYEE.ID_RECEIVER ) and  
//								( ( dba.RELACION_INVOICES_PAYEE.CONS_TRANS_DIARIA = :ld_cons ) AND  
//								( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE = 'AVO' ) )   ;
//							
//							
//					ld_total_closing = ld_total_closing * -1
//							
//							if sqlca.sqlcode <> 0 then
//								messagebox('',sqlca.sqlerrtext)
//							end if
//							
//								
//							ld_total_closing_actual = 0	
//								
//								
//						    SELECT dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA  
//							 INTO :ld_total_closing_actual  
//							 FROM dba.TRANSACCION_DIARIA_PAYEE  
//							WHERE dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA = :ld_cons   ;
//								
//								
//					If ld_total_closing <> 	ld_total_closing_actual then
//						
//						ll_row = dw_1.insertrow(0)
//						dw_1.setitem(ll_row,"id_branch",ls_branch )
//						dw_1.setitem(ll_row,"id_receiver",ld_receiver)
//						dw_1.setitem(ll_row,"id_flag_receiver",ls_flag)
//						dw_1.setitem(ll_row,"net_amount_receiver",ld_amount)
//						dw_1.setitem(ll_row,"HANDLING_RECEIVER",ld_otros)
//						dw_1.setitem(ll_row,"exchange_company",ld_exchange_company)
//						dw_1.setitem(ll_row,"date_receiver",ld_date)
//						dw_1.setitem(ll_row,"ref_receiver",ld_ref)
//						dw_1.setitem(ll_row,"cons",ld_cons)
//						
//						  UPDATE dba.TRANSACCION_DIARIA_PAYEE  
//							  SET CREDIT_TRANS_DIARIA = :ld_total_closing  
//							WHERE ( dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA = :ld_cons ) AND  
//									( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE = 'AVO' )   ;
//
//						
//						
//					end if
//								
//								
//
//				
//			end if	
//				
//				
//				
//				//*------------------------------------------------->
//
//
//		FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref , :ld_payment_date, :LD_DATE_TRANS_PAYEE, :ld_otros,:ld_exchange_company ;
//	LOOP
//	CLOSE LOST ;
//	
//		FETCH GRUPO INTO :ls_grupo ;
//	LOOP
//	CLOSE GRUPO ;
//	
//	COMMIT ;
//		
//			
//
end event

type cb_reclosing from commandbutton within w_giros_fuera_closing_agente
int X=421
int Y=20
int Width=402
int Height=108
int TabOrder=70
boolean Visible=false
boolean BringToTop=true
string Text="Rehacer closing"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//
//String	ls_grupo,ls_branch
//Double	ld_cons, ld_receiver
//Long		ll_cont, ll_row
//Datetime	ld_date 
//
// DECLARE contable CURSOR FOR  
//  SELECT dba.ANULADOS_INEXISTENTES.ID_GRUPO,   
//         dba.ANULADOS_INEXISTENTES.CONS,   
//         dba.ANULADOS_INEXISTENTES.ID_BRANCH,   
//         dba.ANULADOS_INEXISTENTES.ID_RECEIVER  
//    FROM dba.ANULADOS_INEXISTENTES  ;
//
//
//Open contable ;
//Fetch contable Into :ls_grupo,:ld_cons,:ls_branch,:ld_receiver ;
//DO WHILE sqlca.sqlcode = 0
//	
//	  SELECT count(*)  
//    INTO :ll_cont  
//    FROM dba.RELACION_INVOICES_PAYEE  
//   WHERE ( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch ) AND  
//         ( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver )   ;
//
//	
//	if ll_cont = 0 then
//		ll_row = dw_1.insertrow(0)
//		st_3.text = string(ll_row)
//		dw_1.setitem(ll_row,"id_branch",ls_branch )
//		dw_1.setitem(ll_row,"id_receiver",ld_receiver)
//		dw_1.setitem(ll_row,"cons",ld_cons)
//		
//		   SELECT dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA  
//    		INTO :ld_date  
//         FROM dba.TRANSACCION_DIARIA_PAYEE  
//         WHERE dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA = :ld_cons   ;
//
//		
//		
//		//Insertar el valor ne la tabla relacion invoices payee
//		  INSERT INTO dba.RELACION_INVOICES_PAYEE  
//         ( CONS_TRANS_DIARIA,   
//           ID_BRANCH_INVOICE,   
//           ID_RECEIVER,   
//           DATE_RELACION_DIARIA,   
//           ID_CONCEPTO_CONTABLE )  
//  		VALUES ( :ld_cons,   
//           :ls_branch,   
//           :ld_receiver,   
//           :ld_date,   
//           'AVO' )  ;
//
//		
//		
//		
//		
//		
//	end if
//	
//	Fetch contable Into :ls_grupo,:ld_cons,:ls_branch,:ld_receiver ;
//LOOP
//
//
//Close Contable ;
end event

