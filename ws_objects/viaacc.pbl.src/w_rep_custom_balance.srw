$PBExportHeader$w_rep_custom_balance.srw
forward
global type w_rep_custom_balance from wb_report_fechas
end type
type sle_grupo from singlelineedit within w_rep_custom_balance
end type
type st_4 from statictext within w_rep_custom_balance
end type
type cb_1 from commandbutton within w_rep_custom_balance
end type
type gb_1 from groupbox within w_rep_custom_balance
end type
end forward

global type w_rep_custom_balance from wb_report_fechas
integer x = 214
integer y = 221
integer width = 3941
integer height = 2344
string title = "Account - Reconciliation Agent"
long backcolor = 80269524
sle_grupo sle_grupo
st_4 st_4
cb_1 cb_1
gb_1 gb_1
end type
global w_rep_custom_balance w_rep_custom_balance

on w_rep_custom_balance.create
int iCurrent
call super::create
this.sle_grupo=create sle_grupo
this.st_4=create st_4
this.cb_1=create cb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_grupo
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_rep_custom_balance.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_grupo)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event closequery;////////////////////////////////////////////////////////////////////////////////
////
////	Event:  closequery
////
////	Description:
////	Search for unsaved datawindows prompting the user if any
////	pending updates are found.
////
////////////////////////////////////////////////////////////////////////////////
////	
////	Revision History
////
////	Version
////	5.0   Initial version
//// 6.0	Enhanced control on what objects are to be updated.
//// 6.0.01 Make sure the window is not minimized and behind other windows.
////
////////////////////////////////////////////////////////////////////////////////
////
////	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
////	Any distribution of the PowerBuilder Foundation Classes (PFC)
////	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
////
////////////////////////////////////////////////////////////////////////////////
//
//Constant Integer	ALLOW_CLOSE = 0
//Constant Integer	PREVENT_CLOSE = 1
//
//Integer	li_msg
//Integer	li_rc
//String	ls_msgparms[]
//Powerobject lpo_updatearray[]
//
//// Check if the CloseQuery process has been disabled
//If ib_disableclosequery Then
//	Return ALLOW_CLOSE
//End If
//
//// Call event to perform any pre-CloseQuery processing
//If This.Event pfc_preclose ( ) <> 1 Then
//	// Prevent the window from closing
//	Return PREVENT_CLOSE 
//End If
//
//// Prevent validation error messages from appearing while the window is closing
//// and allow others to check if the  CloseQuery process is in progress
//ib_closestatus = True
//
//// Determine the objects for which an update will be attempted.
//// For the CloseQuery, the order sequence is as follows: 
////		1) Specified permananent sequence (thru of_SetUpdateObjects(...)).
////		2) None was specified, so use default window control array.
//If UpperBound(ipo_updateobjects) > 0 Then
//	lpo_updatearray = ipo_updateobjects
//Else
//	lpo_updatearray = This.Control		
//End If
//
//// Check for any pending updates
//li_rc = of_UpdateChecks(lpo_updatearray)
//If li_rc = 0 Then
//	// Updates are NOT pending, allow the window to be closed.
//	ib_closestatus = False
//	Return ALLOW_CLOSE
//ElseIf li_rc < 0 Then
//	// Make sure the window is not minimized and behind other windows.
//	If this.WindowState = Minimized! Then
//		this.WindowState = Normal!
//	End If
//	this.BringToTop = True
//
//	// There are Updates pending, but at least one data entry error was found.
//	// Give the user an opportunity to close the window without saving changes
//	If IsValid(gnv_app.inv_error) Then
//		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_failsvalidation', &
//					 ls_msgparms, gnv_app.iapp_object.DisplayName)
//	Else
//		li_msg = of_MessageBox ("pfc_master_closequery_failsvalidation", &
//					gnv_app.iapp_object.DisplayName, &
//					"The information entered does not pass validation and "  + &
//					"must be corrected before changes can be saved.~r~n~r~n" + &
//					"Close without saving changes?", &
//					exclamation!, YesNo!, 2)
//	End If
//	If li_msg = 1 Then
//		ib_closestatus = False
//		Return ALLOW_CLOSE
//	End If
//Else
//	// Make sure the window is not minimized and behind other windows.
//	If this.WindowState = Minimized! Then
//		this.WindowState = Normal!
//	End If	
//	this.BringToTop = True
//	
//	// Changes are pending, prompt the user to determine if they should be saved
//	If IsValid(gnv_app.inv_error) Then
//		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_savechanges',  &
//					ls_msgparms, gnv_app.iapp_object.DisplayName)		
//	Else
//		li_msg = of_MessageBox ("pfc_master_closequery_savechanges", &
//					gnv_app.iapp_object.DisplayName, &
//					"Do you want to save changes?", exclamation!, YesNoCancel!, 1)
//	End If
//	Choose Case li_msg
//		Case 1
//			// YES - Update
//			// If the update fails, prevent the window from closing
//			If This.Event pfc_save() >= 1 Then
//				// Successful update, allow the window to be closed
//				ib_closestatus = False
//				Return ALLOW_CLOSE
//			End If
//		Case 2
//			// NO - Allow the window to be closed without saving changes
//			ib_closestatus = False
//			Return ALLOW_CLOSE
//		Case 3
//			// CANCEL -  Prevent the window from closing
//	End Choose
//End If
//
//// Prevent the window from closing
//ib_closestatus = False
//Return PREVENT_CLOSE
end event

type dw_1 from wb_report_fechas`dw_1 within w_rep_custom_balance
integer x = 9
integer y = 192
integer width = 3858
integer height = 1940
integer taborder = 0
string dataobject = "dw_rep_custom_balance"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_custom_balance
integer x = 1097
integer y = 52
integer width = 315
integer height = 72
integer taborder = 20
string facename = "Tahoma"
boolean spin = false
end type

type st_1 from wb_report_fechas`st_1 within w_rep_custom_balance
integer x = 887
integer y = 60
integer width = 197
integer height = 60
string facename = "Tahoma"
string text = "From :"
end type

type st_2 from wb_report_fechas`st_2 within w_rep_custom_balance
integer x = 1486
integer y = 60
integer width = 137
integer height = 60
string facename = "Tahoma"
string text = "To :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_custom_balance
integer x = 1632
integer y = 52
integer width = 315
integer height = 72
integer taborder = 30
string facename = "Tahoma"
boolean spin = false
end type

event em_fecha2::modified;return 0
end event

type sle_grupo from singlelineedit within w_rep_custom_balance
integer x = 603
integer y = 52
integer width = 261
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;//Date		ld_fecha1, ld_fecha2, ld_current
//datetime ld_fecha, ld_tmpdate, ld_tmpdate2
//string	ls_grupo, ls_branch,ls_descripcion,ls_agente
//string   ls_name_receiver,ls_fecha_receiver,ls_giro,ls_country,ls_fees,ls_agent_profit,ls_comp_profit
//double   i,ld_total_due_balance,ld_depositos,ld_total_amount,ld_total_fee,ld_amount,ld_total_comm,ld_total_due,ld_adj
//double   ld_total_deposits,ld_total_cancel,ld_total_adj
//double   ld_fees,ld_agent_profit,ld_comp_profit
//boolean  lb_hastransactions, lb_hasinvoices
//double   ld_bal_cumulativo ,ld_bal_due,ld_bal_due_dep,ld_bal_due_adj
//double   ld_gran_total_amount,ld_gran_total_fee,ld_gran_total_comm,ld_gran_total_due,ld_gran_total_deposits,ld_gran_total_cancel,ld_gran_total_adj
//String   ls_tittle, ls_id_banco, ls_name_banco
//
//ld_fecha1 = Date(em_fecha1.text)
//ld_fecha2 = Date(em_fecha2.text)
//ls_agente = sle_grupo.text
//i=0
//
//// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//// Balance Anterior
//
//select id_main_branch, rtrim(ltrim(name_branch))
//into   :ls_grupo, :ls_tittle
//from   dba.branch
//where  id_branch  = :ls_agente ;
//
//select ROUND(sum(debit_trans_diaria - credit_trans_diaria),2)
//into   :ld_bal_cumulativo
//from   dba.transaccion_diaria_payee
//where  id_group_trans_diaria = :ls_grupo
//and    date_trans_diaria     < :ld_fecha1
//AND    DBA.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'PB'
//AND    DBA.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'CPC';
////09/08/2005 adicione las dos ultimas condiciones al where anterior (EBernal)
//
//
//if isnull(ld_bal_cumulativo) then ld_bal_cumulativo = 0
//
//dw_1.retrieve(ld_Fecha2,ld_Fecha1,'xxxx',ls_tittle)
//dw_1.accepttext()
//i++
//dw_1.insertrow(i)
//dw_1.setitem(i,"nombre",'PREVIOUS BALANCE')
//dw_1.setitem(i,"fecha",string(DATETIME(RELATIVEDATE(ld_fecha1, -1),TIME("00:00:00")),'MM/dd/yyyy'))
//dw_1.setitem(i,"giro",'')
//dw_1.setitem(i,"pais",'')
//dw_1.setitem(i,"amount",'')
//dw_1.setitem(i,"fee",'')
//dw_1.setitem(i,"comm",'')
//dw_1.setitem(i,"due",'')
//dw_1.setitem(i,"deposits",'')
//dw_1.setitem(i,"cancellations",'')
//dw_1.setitem(i,"adjustments",'')
//dw_1.setitem(i,"last_col",string(round(ld_bal_cumulativo,2),"$#,##0.00"))
//
//// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//// """"""""""""""""""""""""""""""""""""""""""""""""""""""""
//// Carga el cursor de todos los giros ordenados por fecha
//declare rec cursor for
//select r.name_receiver,
//		 r.date_receiver,
//		 rtrim(ltrim(r.id_branch))+'-'+convert(char(17),abs(r.id_receiver)),
//		 c.name_country, 
//		 ROUND(r.net_amount_receiver,2),
//		 ROUND(r.telex_receiver + r.exchange_receiver,2),
//		 ROUND((r.telex_receiver + r.exchange_receiver) - (r.telex_company + r.exchange_company),2),
//		 ROUND(r.net_amount_receiver + (r.telex_company + r.exchange_company),2)
//from   dba.receiver r, dba.country c, dba.branch b
//where  r.net_amount_receiver <> 0
//and    r.id_country_receiver = c.id_country
//and    r.id_branch			  = b.id_branch
//and    r.date_receiver 		  >= :ld_fecha1
//and    r.date_receiver 		  <= :ld_fecha2
//and    b.id_main_branch		  = :ls_grupo
//order  by convert(varchar,r.date_receiver,2) asc, abs(r.id_receiver)   asc;
//open rec;
//fetch rec into :ls_name_receiver,:ld_fecha,:ls_giro,:ls_country,:ld_amount,:ld_fees,:ld_agent_profit,:ld_comp_profit;
//
//if sqlca.sqlcode <> 0 then
//	lb_hasinvoices = FALSE
//else
//	lb_hasinvoices = TRUE
//end if
//
//// """"""""""""""""""""""""""""""""""""""""""""""""""""""""
//
//// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//// Loop Fechas
//ld_current = ld_fecha1
//DO WHILE ld_current <= ld_fecha2
//	
//	// Acumuladores Diarios
//	ld_total_amount 		= 0	 
//	ld_total_fee    		= 0
//	ld_total_comm   		= 0
//	ld_total_due    		= 0
//	ld_total_deposits 	= 0
//	ld_total_cancel   	= 0
//	ld_total_adj      	= 0
//	ld_total_due_balance = 0
//	ld_bal_due_dep       = 0
//	lb_hastransactions = FALSE
//	
//	ld_tmpdate = datetime(date(string(ld_current,'mm/dd/yyyy')),time("00:00:00"))
//	ld_tmpdate2 = datetime(date(string(ld_current,'mm/dd/yyyy')),time("23:59:59"))	
//
//	// ***********************************************************************************
//	// Ciclo Invoices
//	do while lb_hasinvoices and (ld_fecha >= ld_tmpdate) and (ld_fecha <= ld_tmpdate2)
//	
//		lb_hastransactions = TRUE
//		
//		ls_fees = string(ld_fees,"$#,##0.00")
//		ls_agent_profit = string(ld_agent_profit,"$#,##0.00")
//		ls_comp_profit = string(ld_comp_profit,"$#,##0.00")
//	
//		i++
//		dw_1.insertrow(i)																	
//		if  ld_amount < 0 then					
//			// Cancelation
//			dw_1.setitem(i,"nombre",'INVOICE CANCELLED '+ls_giro)
//			ls_fecha_receiver = string(ld_fecha,'MM/dd/yyyy')
//			dw_1.setitem(i,"fecha",ls_fecha_receiver)
//			dw_1.setitem(i,"giro",'')
//			dw_1.setitem(i,"pais",'')
//			dw_1.setitem(i,"cancellations",ls_comp_profit)
//			dw_1.setitem(i,"fee",'')
//			dw_1.setitem(i,"comm",'')
//			dw_1.setitem(i,"due",'')
//			dw_1.setitem(i,"deposits",'')
//			dw_1.setitem(i,"amount",'')
//			dw_1.setitem(i,"adjustments",'')
//			ld_bal_due = ld_comp_profit
//			dw_1.setitem(i,"bal_due",string(ROUND(double(ld_bal_due),2),"$#,##0.00"))
//			ld_total_cancel = ld_total_cancel + ld_comp_profit
//			ld_gran_total_cancel = ld_gran_total_cancel + ld_total_cancel
//			
//			ld_amount       = 0
//			ls_agent_profit ='0'
//			ls_comp_profit  ='0'
//			ls_fees			 ='0'	
//			ld_agent_profit = 0
//			ld_comp_profit  = 0
//			ld_fees			 = 0			
//			ld_total_due_balance  = ld_total_due_balance	+ ld_total_cancel		
//			ld_bal_cumulativo = ld_bal_cumulativo + ld_bal_due
//			dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
//		else	
//			// Invoice
//			dw_1.setitem(i,"nombre",ls_name_receiver)
//			ls_fecha_receiver = string(ld_fecha,'MM/dd/yyyy')
//			dw_1.setitem(i,"fecha",ls_fecha_receiver)
//			dw_1.setitem(i,"giro",ls_giro)
//			dw_1.setitem(i,"pais",ls_country)
//			dw_1.setitem(i,"amount",string(ROUND(ld_amount,2),"$#,##0.00"))
//			dw_1.setitem(i,"fee",ls_fees)
//			dw_1.setitem(i,"comm",ls_agent_profit)
//			dw_1.setitem(i,"due",ls_comp_profit)
//			dw_1.setitem(i,"deposits",'')
//			dw_1.setitem(i,"cancellations",'')
//			dw_1.setitem(i,"adjustments",'')
//			ld_bal_due = ld_comp_profit
//			dw_1.setitem(i,"bal_due",string(round(ld_bal_due,2),"$#,##0.00"))
//			ld_total_due_balance   	= ld_total_due_balance + ld_comp_profit
//			ld_bal_cumulativo = ld_bal_cumulativo + ld_bal_due
//			dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
//		end if
//		
//		ld_total_amount = ld_total_amount + ld_amount
//		ld_total_fee    = ld_total_fee  	 + ld_fees
//		ld_total_comm   = ld_total_comm	 + ld_agent_profit
//		ld_total_due    = ld_total_due	 + ld_comp_profit
//			
//		fetch rec into :ls_name_receiver,:ld_fecha,:ls_giro,:ls_country,:ld_amount,:ld_fees,:ld_agent_profit,:ld_comp_profit;
//		if sqlca.sqlcode <> 0 then
//			lb_hasinvoices = FALSE
//		else
//			lb_hasinvoices = TRUE
//		end if
//		
//	loop
//	// Ciclo Invoices					
//	// ***********************************************************************************
//	
//
//	// ***********************************************************************************									
//	// Ciclo Depositos	
//	declare dep cursor for 
//	select t.credit_trans_diaria, t.des_trans_diaria, r.id_banco
//	from   dba.transaccion_diaria_payee t, DBA.transaccion_diaria_BANCO_payee r
//	where  t.id_group_trans_diaria 	= :ls_grupo
//	and    t.cons_trans_diaria   		= r.cons_trans_diaria
//	and    t.date_trans_diaria         >= :ld_tmpdate
//	and    t.date_trans_diaria         <= :ld_tmpdate2		
//	and    t.id_concepto_contable  	IN (SELECT ID_CONCEPTO_CONTABLE FROM dba.CONCEPTO_CONTABLE WHERE CATEGORY = 'AGDEP' AND CATEGORY IS NOT NULL);
//	
//	OPEN dep;
//	fetch dep into :ld_depositos,:ls_descripcion,:ls_id_banco;
//		do while sqlca.sqlcode = 0
//			
//			select shortname_banco
//			  into :ls_name_banco
//			  from dba.banco
//			 where id_banco = :ls_id_banco;			
//			
//			lb_hastransactions = TRUE
//			i++
//			dw_1.insertrow(i)
//			dw_1.setitem(i,"nombre",ls_descripcion)
//			dw_1.setitem(i,"fecha",string(ld_current,'MM/dd/yyyy'))
//			dw_1.setitem(i,"giro",'')
//			dw_1.setitem(i,"pais",trim(ls_name_banco))
//			dw_1.setitem(i,"amount",'')
//			dw_1.setitem(i,"fee",'')
//			dw_1.setitem(i,"comm",'')
//			dw_1.setitem(i,"due",'')
//			dw_1.setitem(i,"deposits",string(ROUND(ld_depositos,2),"$#,##0.00"))
//			dw_1.setitem(i,"cancellations",'')
//			dw_1.setitem(i,"adjustments",'')
//			ld_bal_due_dep  = ld_depositos * -1
//			dw_1.setitem(i,"bal_due",string(ROUND(ld_bal_due_dep,2),"$#,##0.00"))
//			
//			ld_total_deposits 	= ld_total_deposits    + ld_depositos
//			ld_total_due_balance = ld_total_due_balance + (ld_depositos * -1)							
//			ld_bal_cumulativo    = ld_bal_cumulativo    +  ld_bal_due_dep
//			
//			dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
//			
//			ld_gran_total_deposits = ld_bal_due_dep + ld_gran_total_deposits								
//			fetch dep into :ld_depositos,:ls_descripcion,:ls_id_banco;
//		loop
//	close dep;					
//	// Ciclo Depositos					
//	// ***********************************************************************************									
//
//	// ***********************************************************************************									
//	// Ciclo Adjusments	
//	declare adj cursor for 
//	select t.credit_trans_diaria-t.debit_trans_diaria, t.des_trans_diaria
//	from   dba.transaccion_diaria_payee t
//	where  t.id_group_trans_diaria 	= :ls_grupo
//	and    t.date_trans_diaria         >= :ld_tmpdate
//	and    t.date_trans_diaria         <= :ld_tmpdate2		
//	and    t.id_concepto_contable  	IN (SELECT ID_CONCEPTO_CONTABLE FROM dba.CONCEPTO_CONTABLE WHERE CATEGORY = 'AJUST' AND CATEGORY IS NOT NULL);
//	
//	OPEN adj;
//	fetch adj into :ld_adj,:ls_descripcion;
//		do while sqlca.sqlcode = 0 
//			lb_hastransactions = TRUE
//			i++
//			dw_1.insertrow(i)
//			dw_1.setitem(i,"nombre",ls_descripcion)
//			dw_1.setitem(i,"fecha",string(ld_current,'MM/dd/yyyy'))
//			dw_1.setitem(i,"giro",'')
//			dw_1.setitem(i,"pais",'')
//			dw_1.setitem(i,"amount",'')
//			dw_1.setitem(i,"fee",'')
//			dw_1.setitem(i,"comm",'')
//			dw_1.setitem(i,"due",'')
//			dw_1.setitem(i,"deposits",'')
//			dw_1.setitem(i,"cancellations",'')
//			dw_1.setitem(i,"adjustments",string(ROUND(ld_adj,2),"$#,##0.00"))
//			ld_bal_due_adj  = ld_adj * -1
//			dw_1.setitem(i,"bal_due",string(ROUND(ld_bal_due_adj,2),"$#,##0.00"))
//			
//			ld_total_adj 	= ld_total_adj + ld_adj
//			ld_total_due_balance = ld_total_due_balance + (ld_adj * -1)							
//			ld_bal_cumulativo    = ld_bal_cumulativo    +  ld_bal_due_adj
//			
//			dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
//			
//			ld_gran_total_adj = ld_bal_due_adj + ld_gran_total_adj								
//			fetch adj into :ld_adj,:ls_descripcion;
//		loop
//	close adj;					
//	// Ciclo Depositos					
//	// ***********************************************************************************	
//	
//	// Daily Total
//	if lb_hastransactions then
//		i++
//		dw_1.insertrow(i)
//		dw_1.setitem(i,"nombre",'')
//		dw_1.setitem(i,"fecha",'DAILY')
//		dw_1.setitem(i,"giro",'TOTAL')
//		dw_1.setitem(i,"pais",'')
//		dw_1.setitem(i,"amount",string( ROUND(ld_total_amount,2),"$#,##0.00"))
//		dw_1.setitem(i,"fee",string(ROUND(ld_total_fee,2),"$#,##0.00"))
//		dw_1.setitem(i,"comm",string(ROUND(ld_total_comm,2),"$#,##0.00"))
//		dw_1.setitem(i,"due",string(ROUND(ld_total_due,2),"$#,##0.00"))
//		dw_1.setitem(i,"deposits",string(ROUND(ld_total_deposits,2),"$#,##0.00"))
//		dw_1.setitem(i,"cancellations",string( ROUND(ld_total_cancel,2),"$#,##0.00"))
//		dw_1.setitem(i,"adjustments",string( ROUND(ld_total_adj,2),"$#,##0.00"))
//		dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
//	end if
//	
//	ld_gran_total_amount = ld_total_amount + ld_gran_total_amount
//	ld_gran_total_fee 	= ld_total_fee  	+ ld_gran_total_fee
//	ld_gran_total_comm   = ld_total_comm	+ ld_gran_total_comm
//	ld_gran_total_due    = ld_total_due		+ ld_gran_total_due	
//
//	ld_current = relativedate(ld_current,1)
//LOOP
//// Loop Fechas
//// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//close rec;
//
//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Grand Total
//i++	
//dw_1.insertrow(i)
//dw_1.setitem(i,"nombre",'')
//dw_1.setitem(i,"fecha",'')
//dw_1.setitem(i,"giro",'')
//dw_1.setitem(i,"pais",'TOTALES')
//dw_1.setitem(i,"amount",string(round(ld_gran_total_amount,2),"$#,##0.00"))
//dw_1.setitem(i,"fee",string(round(ld_gran_total_fee,2),"$#,##0.00"))
//dw_1.setitem(i,"comm",string(round(ld_gran_total_comm,2),"$#,##0.00"))
//dw_1.setitem(i,"due",string(round(ld_gran_total_due,2),"$#,##0.00"))
//dw_1.setitem(i,"deposits",string(round( ((ld_gran_total_deposits + ld_total_deposits) * -1 ),2),"$#,##0.00"))
//dw_1.setitem(i,"cancellations",string(round(ld_gran_total_cancel,2),"$#,##0.00"))
//dw_1.setitem(i,"adjustments",string(round(ld_gran_total_adj,2),"$#,##0.00"))
//dw_1.setitem(i,"last_col",string(round(ld_bal_cumulativo,2),"$#,##0.00"))
//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
end event

type st_4 from statictext within w_rep_custom_balance
integer x = 370
integer y = 60
integer width = 219
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_rep_custom_balance
integer x = 2048
integer y = 48
integer width = 411
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;Date		ld_fecha1, ld_fecha2, ld_current
datetime ld_fecha, ld_tmpdate, ld_tmpdate2
string	ls_grupo, ls_branch,ls_descripcion,ls_agente
string   ls_name_receiver,ls_fecha_receiver,ls_giro,ls_country,ls_fees,ls_agent_profit,ls_comp_profit
double   i,ld_total_due_balance,ld_depositos,ld_total_amount,ld_total_fee,ld_amount,ld_total_comm,ld_total_due,ld_adj
double   ld_total_deposits,ld_total_cancel,ld_total_adj
double   ld_fees,ld_agent_profit,ld_comp_profit, ld_handling_receiver, ld_total_handling_receiver, ld_gran_total_handling_receiver
boolean  lb_hastransactions, lb_hasinvoices
double   ld_bal_cumulativo ,ld_bal_due,ld_bal_due_dep,ld_bal_due_adj
double   ld_gran_total_amount,ld_gran_total_fee,ld_gran_total_comm,ld_gran_total_due,ld_gran_total_deposits,ld_gran_total_cancel,ld_gran_total_adj
String   ls_tittle, ls_id_banco, ls_name_banco

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)
ls_agente = sle_grupo.text
i=0

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Balance Anterior

select id_main_branch, rtrim(ltrim(name_branch))
into   :ls_grupo, :ls_tittle
from   dba.branch
where  id_branch  = :ls_agente ;

select ROUND(sum(debit_trans_diaria - credit_trans_diaria),2)
into   :ld_bal_cumulativo
from   dba.transaccion_diaria_payee
where  id_group_trans_diaria = :ls_grupo
and    date_trans_diaria     < :ld_fecha1
AND    DBA.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'PB'
AND    DBA.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'CPC';
//09/08/2005 adicione las dos ultimas condiciones al where anterior (EBernal)


if isnull(ld_bal_cumulativo) then ld_bal_cumulativo = 0

dw_1.retrieve(ld_Fecha2,ld_Fecha1,'xxxx',ls_tittle)
dw_1.accepttext()
i++
dw_1.insertrow(i)
dw_1.setitem(i,"nombre",'PREVIOUS BALANCE')
dw_1.setitem(i,"fecha",string(DATETIME(RELATIVEDATE(ld_fecha1, -1),TIME("00:00:00")),'MM/dd/yyyy'))
dw_1.setitem(i,"giro",'')
dw_1.setitem(i,"pais",'')
dw_1.setitem(i,"amount",'')
dw_1.setitem(i,"fee",'')
dw_1.setitem(i,"comm",'')
dw_1.setitem(i,"due",'')
dw_1.setitem(i,"deposits",'')
dw_1.setitem(i,"cancellations",'')
dw_1.setitem(i,"adjustments",'')
dw_1.setitem(i,"last_col",string(round(ld_bal_cumulativo,2),"$#,##0.00"))

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// """"""""""""""""""""""""""""""""""""""""""""""""""""""""
// Carga el cursor de todos los giros ordenados por fecha
//declare rec cursor for
//select r.name_receiver,
//		 r.date_receiver,
//		 rtrim(ltrim(r.id_branch))+'-'+convert(char(17),abs(r.id_receiver)),
//		 c.name_country, 
//		 ROUND(r.net_amount_receiver,2),
//		 ROUND(r.telex_receiver + r.exchange_receiver,2),
//		 ROUND((r.telex_receiver + r.exchange_receiver) - (r.telex_company + r.exchange_company),2),
//		 ROUND(r.net_amount_receiver + (r.telex_company + r.exchange_company),2)
//from   dba.receiver r, dba.country c, dba.branch b
//where  r.net_amount_receiver <> 0
//and    r.id_country_receiver = c.id_country
//and    r.id_branch			  = b.id_branch
//and    r.date_receiver 		  >= :ld_fecha1
//and    r.date_receiver 		  <= :ld_fecha2
//and    b.id_main_branch		  = :ls_grupo
//order  by convert(varchar,r.date_receiver,2) asc, abs(r.id_receiver)   asc;

declare rec cursor for
select r.name_receiver,
		 r.date_receiver,
		 rtrim(ltrim(r.id_branch))+'-'+convert(char(17),abs(r.id_receiver)),
		 c.iso_c3, 
		 ROUND(r.net_amount_receiver,2),
		 ROUND(r.telex_receiver + r.exchange_receiver,2),
		 ROUND((r.telex_receiver + r.exchange_receiver) - ((r.telex_company + isnull(r.agent_comm_profit,0)) + r.exchange_company),2),
		 ROUND(r.net_amount_receiver + ((r.telex_company + isnull(r.agent_comm_profit,0)) + r.exchange_company),2),
		 handling_receiver
from   dba.receiver r, dba.country c, dba.branch b
where  r.net_amount_receiver <> 0
and    r.id_country_receiver = c.id_country
and    r.id_branch = b.id_branch
and    r.date_receiver >= :ld_fecha1
and    r.date_receiver <= :ld_fecha2
and    b.id_main_branch = :ls_grupo
order  by convert(varchar,r.date_receiver,2) asc, abs(r.id_receiver)   asc;
open rec;
fetch rec into :ls_name_receiver,:ld_fecha,:ls_giro,:ls_country,:ld_amount,:ld_fees,:ld_agent_profit,:ld_comp_profit,:ld_handling_receiver;

//(r.telex_company + isnull(r.agent_comm_profit,0))


if sqlca.sqlcode <> 0 then
	lb_hasinvoices = FALSE
else
	lb_hasinvoices = TRUE
end if

// """"""""""""""""""""""""""""""""""""""""""""""""""""""""

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Loop Fechas
ld_current = ld_fecha1
DO WHILE ld_current <= ld_fecha2
	
	// Acumuladores Diarios
	ld_total_amount = 0	 
	ld_total_fee = 0
	ld_total_comm = 0
	ld_total_due = 0
	ld_total_deposits = 0
	ld_total_cancel = 0
	ld_total_adj = 0
	ld_total_due_balance = 0
	ld_total_handling_receiver = 0
	ld_bal_due_dep = 0
	lb_hastransactions = FALSE
	
	ld_tmpdate = datetime(date(string(ld_current,'mm/dd/yyyy')),time("00:00:00"))
	ld_tmpdate2 = datetime(date(string(ld_current,'mm/dd/yyyy')),time("23:59:59"))	

	// ***********************************************************************************
	// Ciclo Invoices
	do while lb_hasinvoices and (ld_fecha >= ld_tmpdate) and (ld_fecha <= ld_tmpdate2)
	
		lb_hastransactions = TRUE
		
		ld_comp_profit = ld_comp_profit + ld_handling_receiver
		
		ls_fees = string(ld_fees,"$#,##0.00")
		ls_agent_profit = string(ld_agent_profit,"$#,##0.00")
		ls_comp_profit = string(ld_comp_profit,"$#,##0.00")
	
		i++
		dw_1.insertrow(i)																	
		if  ld_amount < 0 then					
			// Cancelation
			dw_1.setitem(i,"nombre",'INVOICE CANCELLED '+ls_giro)
			ls_fecha_receiver = string(ld_fecha,'MM/dd/yyyy')
			dw_1.setitem(i,"fecha",ls_fecha_receiver)
			dw_1.setitem(i,"giro",'')
			dw_1.setitem(i,"pais",'')
			dw_1.setitem(i,"cancellations",ls_comp_profit)
			dw_1.setitem(i,"fee",'')
			dw_1.setitem(i,"comm",'')
			dw_1.setitem(i,"due",'')
			dw_1.setitem(i,"deposits",'')
			dw_1.setitem(i,"amount",'')
			dw_1.setitem(i,"adjustments",'')
			ld_bal_due = ld_comp_profit
			dw_1.setitem(i,"bal_due",string(ROUND(double(ld_bal_due),2),"$#,##0.00"))
			ld_total_cancel = ld_total_cancel + ld_comp_profit
			ld_gran_total_cancel = ld_gran_total_cancel + ld_total_cancel
			
			ld_amount = 0
			ls_agent_profit ='0'
			ls_comp_profit  ='0'
			ls_fees ='0'	
			ld_agent_profit = 0
			ld_comp_profit  = 0
			ld_fees = 0			
			ld_total_due_balance  = ld_total_due_balance	+ ld_total_cancel		
			ld_bal_cumulativo = ld_bal_cumulativo + ld_bal_due
			dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
		else	
			// Invoice
			dw_1.setitem(i,"nombre",ls_name_receiver)
			ls_fecha_receiver = string(ld_fecha,'MM/dd/yyyy')
			dw_1.setitem(i,"fecha",ls_fecha_receiver)
			dw_1.setitem(i,"giro",ls_giro)
			dw_1.setitem(i,"pais",ls_country)
			dw_1.setitem(i,"amount",string(ROUND(ld_amount,2),"$#,##0.00"))
			dw_1.setitem(i,"fee",ls_fees)
			dw_1.setitem(i,"comm",ls_agent_profit)
			dw_1.setitem(i,"due",ls_comp_profit)
			dw_1.setitem(i,"deposits",'')
			dw_1.setitem(i,"cancellations",'')
			dw_1.setitem(i,"adjustments",'')		
			dw_1.setitem(i,"receiver_handling_receiver",ld_handling_receiver)								
			ld_bal_due = ld_comp_profit
			dw_1.setitem(i,"bal_due",string(round(ld_bal_due,2),"$#,##0.00"))
			ld_total_due_balance   	= ld_total_due_balance + ld_comp_profit
			ld_bal_cumulativo = ld_bal_cumulativo + ld_bal_due
			dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
		end if
		
		ld_total_amount = ld_total_amount + ld_amount
		ld_total_fee = ld_total_fee + ld_fees
		ld_total_comm = ld_total_comm + ld_agent_profit
		ld_total_due = ld_total_due + ld_comp_profit 
		ld_total_handling_receiver = ld_total_handling_receiver + ld_handling_receiver
			
		fetch rec into :ls_name_receiver,:ld_fecha,:ls_giro,:ls_country,:ld_amount,:ld_fees,:ld_agent_profit,:ld_comp_profit,:ld_handling_receiver;
		if sqlca.sqlcode <> 0 then
			lb_hasinvoices = FALSE
		else
			lb_hasinvoices = TRUE
		end if
		
	loop
	// Ciclo Invoices					
	// ***********************************************************************************
	

	// ***********************************************************************************									
	// Ciclo Depositos	
	declare dep cursor for 
	select t.credit_trans_diaria, t.des_trans_diaria, r.id_banco
	from   dba.transaccion_diaria_payee t, DBA.transaccion_diaria_BANCO_payee r
	where  t.id_group_trans_diaria 	= :ls_grupo
	and    t.cons_trans_diaria   		= r.cons_trans_diaria
	and    t.date_trans_diaria         >= :ld_tmpdate
	and    t.date_trans_diaria         <= :ld_tmpdate2		
	and    t.id_concepto_contable  	IN (SELECT ID_CONCEPTO_CONTABLE FROM dba.CONCEPTO_CONTABLE WHERE CATEGORY = 'AGDEP' AND CATEGORY IS NOT NULL);
	
	OPEN dep;
	fetch dep into :ld_depositos,:ls_descripcion,:ls_id_banco;
		do while sqlca.sqlcode = 0
			
			select shortname_banco
			  into :ls_name_banco
			  from dba.banco
			 where id_banco = :ls_id_banco;			
			
			lb_hastransactions = TRUE
			i++
			dw_1.insertrow(i)
			dw_1.setitem(i,"nombre",ls_descripcion)
			dw_1.setitem(i,"fecha",string(ld_current,'MM/dd/yyyy'))
			dw_1.setitem(i,"giro",'')
			dw_1.setitem(i,"pais",trim(ls_name_banco))
			dw_1.setitem(i,"amount",'')
			dw_1.setitem(i,"fee",'')
			dw_1.setitem(i,"comm",'')
			dw_1.setitem(i,"due",'')
			dw_1.setitem(i,"deposits",string(ROUND(ld_depositos,2),"$#,##0.00"))
			dw_1.setitem(i,"cancellations",'')
			dw_1.setitem(i,"adjustments",'')
			ld_bal_due_dep  = ld_depositos * -1
			dw_1.setitem(i,"bal_due",string(ROUND(ld_bal_due_dep,2),"$#,##0.00"))
			
			ld_total_deposits 	= ld_total_deposits    + ld_depositos
			ld_total_due_balance = ld_total_due_balance + (ld_depositos * -1)							
			ld_bal_cumulativo    = ld_bal_cumulativo    +  ld_bal_due_dep
			
			dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
			
			ld_gran_total_deposits = ld_bal_due_dep + ld_gran_total_deposits								
			fetch dep into :ld_depositos,:ls_descripcion,:ls_id_banco;
		loop
	close dep;					
	// Ciclo Depositos					
	// ***********************************************************************************									

	// ***********************************************************************************									
	// Ciclo Adjusments	
	declare adj cursor for 
	select t.credit_trans_diaria-t.debit_trans_diaria, t.des_trans_diaria
	from   dba.transaccion_diaria_payee t
	where  t.id_group_trans_diaria 	= :ls_grupo
	and    t.date_trans_diaria         >= :ld_tmpdate
	and    t.date_trans_diaria         <= :ld_tmpdate2		
	and    t.id_concepto_contable  	IN (SELECT ID_CONCEPTO_CONTABLE FROM dba.CONCEPTO_CONTABLE WHERE CATEGORY = 'AJUST' AND CATEGORY IS NOT NULL);
	
	OPEN adj;
	fetch adj into :ld_adj,:ls_descripcion;
		do while sqlca.sqlcode = 0 
			lb_hastransactions = TRUE
			i++
			dw_1.insertrow(i)
			dw_1.setitem(i,"nombre",ls_descripcion)
			dw_1.setitem(i,"fecha",string(ld_current,'MM/dd/yyyy'))
			dw_1.setitem(i,"giro",'')
			dw_1.setitem(i,"pais",'')
			dw_1.setitem(i,"amount",'')
			dw_1.setitem(i,"fee",'')
			dw_1.setitem(i,"comm",'')
			dw_1.setitem(i,"due",'')
			dw_1.setitem(i,"deposits",'')
			dw_1.setitem(i,"cancellations",'')
			dw_1.setitem(i,"adjustments",string(ROUND(ld_adj,2),"$#,##0.00"))
			ld_bal_due_adj  = ld_adj * -1
			dw_1.setitem(i,"bal_due",string(ROUND(ld_bal_due_adj,2),"$#,##0.00"))
			
			ld_total_adj 	= ld_total_adj + ld_adj
			ld_total_due_balance = ld_total_due_balance + (ld_adj * -1)							
			ld_bal_cumulativo    = ld_bal_cumulativo    +  ld_bal_due_adj
			
			dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
			
			ld_gran_total_adj = ld_bal_due_adj + ld_gran_total_adj								
			fetch adj into :ld_adj,:ls_descripcion;
		loop
	close adj;					
	// Ciclo Depositos					
	// ***********************************************************************************	
	
	// Daily Total
	if lb_hastransactions then
		i++
		dw_1.insertrow(i)
		dw_1.setitem(i,"nombre",'')
		dw_1.setitem(i,"fecha",'DAILY')
		dw_1.setitem(i,"giro",'TOTAL')
		dw_1.setitem(i,"pais",'')
		dw_1.setitem(i,"amount",string( ROUND(ld_total_amount,2),"$#,##0.00"))
		dw_1.setitem(i,"fee",string(ROUND(ld_total_fee,2),"$#,##0.00"))
		dw_1.setitem(i,"comm",string(ROUND(ld_total_comm,2),"$#,##0.00"))
		dw_1.setitem(i,"due",string(ROUND(ld_total_due,2),"$#,##0.00"))
		dw_1.setitem(i,"deposits",string(ROUND(ld_total_deposits,2),"$#,##0.00"))
		dw_1.setitem(i,"cancellations",string( ROUND(ld_total_cancel,2),"$#,##0.00"))
		dw_1.setitem(i,"adjustments",string( ROUND(ld_total_adj,2),"$#,##0.00"))
		dw_1.setitem(i,"last_col",string(ROUND(ld_bal_cumulativo,2),"$#,##0.00"))
		dw_1.setitem(i,"receiver_handling_receiver",ld_total_handling_receiver)							
	end if
	
	ld_gran_total_amount = ld_total_amount + ld_gran_total_amount
	ld_gran_total_fee 	= ld_total_fee  	+ ld_gran_total_fee
	ld_gran_total_comm   = ld_total_comm	+ ld_gran_total_comm
	ld_gran_total_due    = ld_total_due		+ ld_gran_total_due	
	ld_gran_total_handling_receiver = ld_gran_total_handling_receiver + ld_total_handling_receiver


	ld_current = relativedate(ld_current,1)
LOOP
// Loop Fechas
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

close rec;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Grand Total
i++	
dw_1.insertrow(i)
dw_1.setitem(i,"nombre",'')
dw_1.setitem(i,"fecha",'')
dw_1.setitem(i,"giro",'')
dw_1.setitem(i,"pais",'TOTALES')
dw_1.setitem(i,"amount",string(round(ld_gran_total_amount,2),"$#,##0.00"))
dw_1.setitem(i,"fee",string(round(ld_gran_total_fee,2),"$#,##0.00"))
dw_1.setitem(i,"comm",string(round(ld_gran_total_comm,2),"$#,##0.00"))
dw_1.setitem(i,"due",string(round(ld_gran_total_due,2),"$#,##0.00"))
dw_1.setitem(i,"deposits",string(round( ((ld_gran_total_deposits + ld_total_deposits) * -1 ),2),"$#,##0.00"))
dw_1.setitem(i,"cancellations",string(round(ld_gran_total_cancel,2),"$#,##0.00"))
dw_1.setitem(i,"adjustments",string(round(ld_gran_total_adj,2),"$#,##0.00"))
dw_1.setitem(i,"last_col",string(round(ld_bal_cumulativo,2),"$#,##0.00"))
dw_1.setitem(i,"receiver_handling_receiver",ld_gran_total_handling_receiver)					
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

end event

type gb_1 from groupbox within w_rep_custom_balance
integer x = 37
integer width = 2578
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

