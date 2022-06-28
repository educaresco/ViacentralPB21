$PBExportHeader$w_consignacion_group_agent.srw
$PBExportComments$Ventana donde se Ingresan las consiaaciones de las Agencias.
forward
global type w_consignacion_group_agent from wb_response
end type
type gb_1 from groupbox within w_consignacion_group_agent
end type
type dw_1 from datawindow within w_consignacion_group_agent
end type
type dw_2 from datawindow within w_consignacion_group_agent
end type
type cb_1 from commandbutton within w_consignacion_group_agent
end type
type cb_save from commandbutton within w_consignacion_group_agent
end type
type dw_3 from datawindow within w_consignacion_group_agent
end type
type cb_2 from commandbutton within w_consignacion_group_agent
end type
type em_date from editmask within w_consignacion_group_agent
end type
type st_1 from statictext within w_consignacion_group_agent
end type
type cb_print from commandbutton within w_consignacion_group_agent
end type
type cb_continuar from commandbutton within w_consignacion_group_agent
end type
type cb_3 from commandbutton within w_consignacion_group_agent
end type
type em_agent from editmask within w_consignacion_group_agent
end type
type em_group from editmask within w_consignacion_group_agent
end type
type st_branch from statictext within w_consignacion_group_agent
end type
type st_group from statictext within w_consignacion_group_agent
end type
type cb_5 from commandbutton within w_consignacion_group_agent
end type
type sle_selectedfax from singlelineedit within w_consignacion_group_agent
end type
type sle_completefaxpath from singlelineedit within w_consignacion_group_agent
end type
type cb_faxviewer from commandbutton within w_consignacion_group_agent
end type
type cb_4 from commandbutton within w_consignacion_group_agent
end type
type lb_fax from listbox within w_consignacion_group_agent
end type
type gb_2 from groupbox within w_consignacion_group_agent
end type
end forward

global type w_consignacion_group_agent from wb_response
integer width = 3374
integer height = 2120
string title = "Pay Agencies"
long backcolor = 80269524
gb_1 gb_1
dw_1 dw_1
dw_2 dw_2
cb_1 cb_1
cb_save cb_save
dw_3 dw_3
cb_2 cb_2
em_date em_date
st_1 st_1
cb_print cb_print
cb_continuar cb_continuar
cb_3 cb_3
em_agent em_agent
em_group em_group
st_branch st_branch
st_group st_group
cb_5 cb_5
sle_selectedfax sle_selectedfax
sle_completefaxpath sle_completefaxpath
cb_faxviewer cb_faxviewer
cb_4 cb_4
lb_fax lb_fax
gb_2 gb_2
end type
global w_consignacion_group_agent w_consignacion_group_agent

type variables
Boolean	ib_lookup = False
end variables

on w_consignacion_group_agent.create
int iCurrent
call super::create
this.gb_1=create gb_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.cb_1=create cb_1
this.cb_save=create cb_save
this.dw_3=create dw_3
this.cb_2=create cb_2
this.em_date=create em_date
this.st_1=create st_1
this.cb_print=create cb_print
this.cb_continuar=create cb_continuar
this.cb_3=create cb_3
this.em_agent=create em_agent
this.em_group=create em_group
this.st_branch=create st_branch
this.st_group=create st_group
this.cb_5=create cb_5
this.sle_selectedfax=create sle_selectedfax
this.sle_completefaxpath=create sle_completefaxpath
this.cb_faxviewer=create cb_faxviewer
this.cb_4=create cb_4
this.lb_fax=create lb_fax
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_save
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.em_date
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.cb_continuar
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.em_agent
this.Control[iCurrent+14]=this.em_group
this.Control[iCurrent+15]=this.st_branch
this.Control[iCurrent+16]=this.st_group
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.sle_selectedfax
this.Control[iCurrent+19]=this.sle_completefaxpath
this.Control[iCurrent+20]=this.cb_faxviewer
this.Control[iCurrent+21]=this.cb_4
this.Control[iCurrent+22]=this.lb_fax
this.Control[iCurrent+23]=this.gb_2
end on

on w_consignacion_group_agent.destroy
call super::destroy
destroy(this.gb_1)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.cb_save)
destroy(this.dw_3)
destroy(this.cb_2)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.cb_print)
destroy(this.cb_continuar)
destroy(this.cb_3)
destroy(this.em_agent)
destroy(this.em_group)
destroy(this.st_branch)
destroy(this.st_group)
destroy(this.cb_5)
destroy(this.sle_selectedfax)
destroy(this.sle_completefaxpath)
destroy(this.cb_faxviewer)
destroy(this.cb_4)
destroy(this.lb_fax)
destroy(this.gb_2)
end on

event open;call super::open;Hide()
X=1
Y=1
Show()
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)



dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)



Double	ld_cons


		SELECT Max(cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba."transaccion_diaria_payee"  ;
		
		if isnull(ld_cons) then ld_cons = 1
		
		
		
dw_1.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"cons",ld_cons)

dw_1.setfocus()

end event

event close;call super::close;dw_1.reset()
dw_2.reset()
dw_3.reset()
RETURN

end event

event pfc_close;call super::pfc_close;dw_1.reset()
dw_2.reset()
dw_3.reset()
RETURN

end event

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

type gb_1 from groupbox within w_consignacion_group_agent
integer x = 32
integer y = 208
integer width = 2432
integer height = 232
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bank Information"
end type

type dw_1 from datawindow within w_consignacion_group_agent
integer x = 46
integer y = 260
integer width = 2373
integer height = 172
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_selet_cuenta_pago_corresponsal"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string s_filter
DataWindowChild	ldw_dw

if not(ib_lookup) then

	IF dwo.Name = 'id_banco' THEN
		dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",'')
		dw_1.setitem(dw_1.getrow(),"deposit_code",'')
		GetChild('id_cuenta_banco',ldw_dw)
		ldw_dw.SetTransObject(SQLCA)
		ldw_dw.SetFilter("id_banco = '"+GetText()+"'")
		ldw_dw.Filter()
	END IF	
	
	
end if	

DataWindowChild	ldw_dw1

if not(ib_lookup) then

	IF dwo.Name = 'id_cuenta_banco' THEN
		dw_1.setitem(dw_1.getrow(),"deposit_code",'')
		GetChild('deposit_code',ldw_dw1)
		ldw_dw1.SetTransObject(SQLCA)
		s_filter ="id_banco = '"+this.getitemstring(this.getrow(),"id_banco" ) +" ' " + "and " + "id_cuenta_banco = '"+GetText()+"'" +"and "+ "id_branch = '"+em_agent.text +" ' " 
		ldw_dw1.SetFilter(s_filter)
		ldw_dw1.Filter()
	END IF	
	
	
end if	
end event

event itemfocuschanged;//DataWindowChild	ldw_dw
//
//IF dwo.Name = 'id_banco' THEN
//	GetChild('id_cuenta_banco',ldw_dw)
//	ldw_dw.SetTransObject(SQLCA)
//	ldw_dw.SetFilter("id_banco = '"+GetText()+"'")
//	ldw_dw.Filter()
//END IF
//
//dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",'')
end event

type dw_2 from datawindow within w_consignacion_group_agent
integer x = 55
integer y = 496
integer width = 3090
integer height = 172
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_consignacion_group_agent"
boolean border = false
boolean livescroll = true
end type

event itemchanged;DatawindowChild 	ldw_dw

IF dwo.Name = 'id_banco' THEN
	GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter('id_banco = '+GetText())
	ldw_dw.Filter()
END IF

end event

type cb_1 from commandbutton within w_consignacion_group_agent
integer x = 2747
integer y = 96
integer width = 416
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New Deposit"
end type

event clicked;COMMIT ;
string ls_banco,ls_cuenta


//ls_banco = dw_1.GetItemString(1, "id_banco")
//ls_cuenta = dw_1.GetItemString(1, "id_cuenta_banco")


dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
sle_selectedfax.text = "[No Fax Selected]"
em_agent.TEXT = ''
em_group.TEXT = ''

ib_lookup   = False

dw_1.settaborder(5,1) //Reconciliation Date
dw_1.settaborder(2,10) //El Banco
dw_1.settaborder(3,20) //La cuenta
dw_2.settaborder(2,1) 

//dw_1.setitem(dw_1.getrow(),"id_banco",ls_banco) 
//dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_cuenta) 
//

//Double	ld_cons
//
//
//		SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
//       INTO :ld_cons  
//       FROM dba.transaccion_diaria_payee  ;
//		
//		if isnull(ld_cons) then ld_cons = 1
//		
//		
//		
//dw_1.setitem(1,"cons",ld_cons)
//dw_2.setitem(1,"cons",ld_cons)

dw_1.setfocus()




end event

type cb_save from commandbutton within w_consignacion_group_agent
integer x = 2747
integer y = 208
integer width = 416
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save Deposit"
end type

event clicked;Double	ld_cons, ld_deposito, 		&
			ld_nivel_endeudamiento, 	&
			ld_total_deuda_grupo, 		&
			ld_receiver, 					&
			ld_amount, 						&
			ld_deposit_count,   &
			ld_balance = 0
			
String	ls_branch,						&
			ls_group, 						&
			ls_account,ls_desc_anterior, ls_banco, ls_deposit_code, s_dep_banco

Datetime ld_datetime

long		ll_cons = 0

Datetime	ld_hoy,ld_date, ld_recdate, ld_recdate1 , ld_recdate2
LONG	ll_dias

string ls_banco_validar,ls_cuenta_validar

dw_1.accepttext()
dw_2.accepttext()

ls_banco_validar	   = dw_1.getitemstring(dw_1.getrow(),"id_banco")
ls_cuenta_validar 	= dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")


SELECT DEP_BANCO
INTO :s_dep_banco
FROM DBA.BANCO
WHERE ID_BANCO = :ls_banco_validar;

IF s_dep_banco = 'N' THEN
	messagebox('Error','El banco se encuentra bloqueado para depositos' )
	return
	
END IF


if (len(ls_banco_validar)=0 or isnull(ls_banco_validar) or len(ls_cuenta_validar) < 6 or isnull(ls_cuenta_validar) )  then
	messagebox('Error','Verify Bank and Account Information')
	return
end if 	

if dw_1.rowcount() = 0 then
	Return
end if

dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)

dw_2.SETFOCUS()

ld_date = dw_2.getitemdateTIME(dw_2.getrow(),"date")

dw_2.SETCOLUMN(6)
dw_2.accepttext()

/*
IF dw_1.getitemstring(dw_1.getrow(),"id_banco") = '' or isnull(dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")) THEN
	messagebox('Warning','Please Verify the Bank')
	Return
END IF

IF LEN(dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco") ) < 6  THEN
	messagebox('Warning','Please Verify the Account')
	Return
END IF

IF dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco") = '' or isnull(dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")) THEN
	messagebox('Warning','Please Verify the Account')
	Return
END IF
*/


//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
// Verificar si la fecha no esta bloqueada
datetime		ld_date_inicio, ld_date_final		, new_date	
string  s_business_day
			
SELECT dba.ACC_PARAMETERS.DATE_BLOCKER,   
		dba.ACC_PARAMETERS.DATE_BLOCKER_POST  
 INTO :ld_date_inicio,   
		:ld_date_final  
 FROM dba.ACC_PARAMETERS  ;

if ( ld_date_inicio > dw_1.getitemdatetime(dw_1.getrow(),"reconciliationdate") ) or ( ld_date_final < dw_1.getitemdatetime(dw_1.getrow(),"reconciliationdate") ) then
	messagebox("Error","The date you are using was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
	Return
END IF

NEW_DATE =dw_1.getitemdatetime(dw_1.getrow(),"reconciliationdate")

SELECT dba.sfGetIsBusinessDay(:new_date)
INTO :s_business_day
FROM DBA.DUAL;


IF s_business_day = 'N' THEN
	messagebox("Error","The date you are using is not a business day, please check for the next avalilable business day",StopSign!)
	Return
END IF
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	
COMMIT;


ld_recdate	 = dw_1.getitemdatetime(dw_1.getrow(),"reconciliationdate")
ld_recdate1  = Datetime(Date(ld_recdate),Time('00:00:00'))
ld_recdate2  = Datetime(Date(ld_recdate),Time('23:59:59'))

ls_banco      = dw_1.getitemstring(dw_1.getrow(),"id_banco")
ls_account 	= dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")
ls_deposit_code = dw_1.getitemstring(dw_1.getrow(),"deposit_code")
ls_group 	= dw_2.getitemstring(dw_2.getrow(),"id_group")
ld_deposito =  dw_2.getitemnumber(dw_2.getrow(),"credit")

ls_desc_anterior = dw_2.getitemstring(dw_2.getrow(),"description") + "  DEP "+string(ld_recdate,"MM-DD-YYYY")
ls_branch = em_agent.text
ls_desc_anterior = fn_replace(ls_desc_anterior,'  ',' ')
ls_desc_anterior = fn_replace(ls_desc_anterior,'  ',' ')

ls_desc_anterior = left(ls_desc_anterior,50)

dw_2.setitem(dw_2.getrow(),"description",ls_desc_anterior)

if ld_deposito = 0 then
	Messagebox("Error","Amount 0 ")
	return
end if


// --------------------------------------------
// Evita que graben transacciones sin banco.
long ll_cont1

SELECT count(*) 
  INTO :ll_cont1
  FROM dba.CUENTA_BANCO
 WHERE id_banco = :ls_banco
	AND id_cuenta_banco = :ls_account;
 
If ll_cont1 <> 1 then	
	Messagebox("Error","Favor Verifique la Cuenta. ["+trim(ls_banco)+"-"+trim(ls_account)+"]",StopSign!)
	return
end if
// --------------------------------------------

if isnull(ls_account) or ls_account = '' then
	Messagebox("Error","You have to select the account")
	return
end if


//------------------------------------------------------
// This is to validate the deposit code
//
//------------------------------------------------------

if not(isnull(ls_banco) or ls_banco = '') then
	if not (isnull(ls_account) or ls_account = '') then
		if isnull(ls_deposit_code) or ls_deposit_code = '' then
			
			SELECT COUNT( DEPOSIT_CODE)
			INTO :ld_deposit_count
			FROM dba.DEPOSIT_CODES
			WHERE ID_BANCO = :ls_banco 
			AND ID_CUENTA_BANCO = :ls_account
			AND ID_BRANCH = :ls_branch;
			
			if ld_deposit_count = 1 then
				
				SELECT  DEPOSIT_CODE
				INTO :ls_deposit_code
				FROM dba.DEPOSIT_CODES
				WHERE ID_BANCO = :ls_banco 
				AND ID_CUENTA_BANCO = :ls_account
				AND ID_BRANCH = :ls_branch;
				
				dw_1.setitem(1,"deposit_code",ls_deposit_code)
				
			else
				if ld_deposit_count > 1 then
					messagebox('ALERT', 'You Must Select a Deposit Code', stopsign!)
					dw_1.setfocus()
					dw_1.setcolumn('deposit_code')
					return
				end if
			end if
		end if
	end if
end if
//----------------------------------------------------------------

//Verificar si hay otro deposito en la misma fecha del mismo agente
//Long	ll_cont
//
//  SELECT Count(*)  
//    INTO :ll_cont  
//    FROM dba.TRANSACCION_DIARIA_PAYEE  
//   WHERE ( dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA = :ls_group ) AND  
//         ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= :ld_recdate1 ) AND  
//         ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= :ld_recdate2 ) AND  
//         ( dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA = :ld_deposito ) AND  
//         ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE = 'DA' )   ;
//
//
//	ll_cont = 0
//
//	If ll_cont > 0 then
//		if Messagebox('Warning','Hay un deposito de Identico Valor, Desea Continuar',Question!,YesNo!) = 2 then
//			Return
//		end if	
//	end if
	
	
//	ld_balance = fn_balance_escalable(ls_group,String(Today(),'mm-dd-yyyy'))	

IF Isnull(ld_balance) Then ld_balance = 0

ld_balance = round(ld_balance,2) - round(ld_deposito,2)

SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
INTO :ld_cons  
FROM dba.transaccion_diaria_payee  ;
		
if isnull(ld_cons) then ld_cons = 1		
		
dw_1.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"balance",ld_balance)


dw_2.accepttext()

IF dw_2.update()=1 THEN
	IF dw_1.update()=1 THEN
		dw_1.enabled = False
		dw_2.enabled = False
		COMMIT ;
		Messagebox("Deposit Group","Verificando el Deposito .....")
		COMMIT ;
		
		SELECT Count(*)  
		INTO :ll_cons  
		FROM dba.transaccion_diaria_payee  
		WHERE dba.transaccion_diaria_payee.cons_trans_diaria = :ld_cons   ;

		if ll_cons <> 1 then
			Messagebox('Error','Transaction was not saved',StopSign!)
		else
			Messagebox('Process Complete','Transaction was saved successful')
			// ---------------------------------------------------->			
			// Moviendo el Fax a la carpeta de procesados
			if sle_selectedfax.text <> "[No Fax Selected]" then
				String ls_faxpath, ls_faxname, ls_newfaxname, ls_bankid
				
				SELECT dba.CUENTA_BANCO.ID_BANCO  
				INTO :ls_bankid  
				FROM dba.CUENTA_BANCO  
				WHERE dba.CUENTA_BANCO.ID_CUENTA_BANCO = :ls_account   ;

				if isnull(ls_bankid) then ls_bankid = "xxxxx"
				if isnull(ls_account) then ls_account = "xxxxx"				
				
				ls_faxpath = "u:\accounting\"
				ls_faxname = sle_selectedfax.text
				if FileExists(ls_faxpath+ls_faxname) then			
					ls_newfaxname = "0_" + trim(em_agent.text) + "_" + trim(ls_bankid) + "_" + trim(ls_account) + "_" + string(round(ld_deposito,0)) + "_"+string(ld_cons)+".tif"
					fn_filemove(ls_faxpath+ls_faxname,ls_faxpath+"processed\"+ls_newfaxname)	
					sle_selectedfax.text = ls_newfaxname
					sle_completefaxpath.text = "u:\accounting\processed\"+sle_selectedfax.text
				end if
			end if	
			// ---------------------------------------------------->
		end if
	ELSE
		ROLLBACK ;
		Return
	END IF
ELSE
	ROLLBACK ;
	Return
END IF

ls_group = dw_2.getitemstring(dw_2.getrow(),"id_group")
ld_deposito =  dw_2.getitemnumber(dw_2.getrow(),"credit")


dw_2.reset()
dw_3.Retrieve(relativedate(today(),-30),ls_group)
dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
sle_selectedfax.text = "[No Fax Selected]"
em_agent.TEXT = ''
em_group.TEXT = ''
ib_lookup   = False

dw_1.settaborder(5,1) //Reconciliation Date
dw_1.settaborder(2,10) //El Banco
dw_1.settaborder(3,20) //La cuenta


dw_2.settaborder(2,1) 


end event

type dw_3 from datawindow within w_consignacion_group_agent
integer x = 32
integer y = 696
integer width = 3287
integer height = 1148
integer taborder = 60
boolean bringtotop = true
boolean titlebar = true
string title = "Transactions"
string dataobject = "dw_rep_depositos_agencia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransOBject(SQLCA)
end event

type cb_2 from commandbutton within w_consignacion_group_agent
integer x = 1563
integer y = 1912
integer width = 379
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Info.  Savings"
end type

event clicked;IF IsNull(dw_2.Object.id_group[dw_2.GetRow()]) OR dw_2.Object.id_group[dw_2.GetRow()]='' THEN
	MessageBox('Atention','You have to choose a group and then press Info. Savings.')
	Return
END IF

dw_3.Retrieve(Date(em_date.text),dw_2.Object.id_group[dw_2.GetRow()])
end event

type em_date from editmask within w_consignacion_group_agent
integer x = 1166
integer y = 1912
integer width = 366
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event constructor;text=String(RelativeDate(Today(),-10),'mm/dd/yyyy')
end event

type st_1 from statictext within w_consignacion_group_agent
integer x = 878
integer y = 1916
integer width = 265
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Date Since :"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_consignacion_group_agent
integer x = 1952
integer y = 1912
integer width = 361
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print"
end type

event clicked;dw_3.print()
end event

type cb_continuar from commandbutton within w_consignacion_group_agent
integer x = 2747
integer y = 316
integer width = 416
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Continue"
end type

event clicked;

if Messagebox('Warning','Esta Seguro que desea Continuar, todo se borrarra, asegurese de haber Salvado',question!,YesNo!)  <> 1 then
	return
end if

COMMIT ;

string ls_banco,ls_cuenta, ls_grupo


ls_banco = dw_1.GetItemString(1, "id_banco")
ls_cuenta = dw_1.GetItemString(1, "id_cuenta_banco")
ls_grupo  = dw_2.GetItemString(1, "id_group")

dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
sle_selectedfax.text = "[No Fax Selected]"

dw_1.setitem(dw_1.getrow(),"id_banco",ls_banco) 
dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_cuenta) 
dw_2.setitem(dw_2.getrow(),"id_group",ls_grupo) 


dw_2.setfocus()
dw_2.SetColumn(6)
end event

type cb_3 from commandbutton within w_consignacion_group_agent
integer x = 50
integer y = 80
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Look Up"
end type

event clicked;String ls_depositcode, ls_idbranch, ls_idgroup, ls_idbanco, ls_idcuenta  

	
	
	dw_2.settaborder(2,0)  //El grupo
	
	ib_lookup = True

Openwithparm(w_deposit_lookup,"")
ls_depositcode = message.stringparm				

if ls_depositcode <> 'none' and ls_depositcode <> '' then
	
	dw_1.settaborder(2,0) //El Banco
	dw_1.settaborder(3,0) //La cuenta
	dw_1.settaborder(4,0) //The deposit code
	dw_1.settaborder(5,10) //Reconciliation Date

	// --------------------------------------------
	// Remueve filtro Cuentas
	DataWindowChild	ldw_dw
	dw_1.GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("")
	ldw_dw.Filter()
	// --------------------------------------------	
	
	//---------------------------------------------
	//Remueve filttro Deposit Codes
	DataWindowChild	ldw_dw1
	dw_1.GetChild('deposit_code',ldw_dw)
	ldw_dw1.SetTransObject(SQLCA)
	ldw_dw1.SetFilter("")
	ldw_dw1.Filter()
	// --------------------------------------------	
	
	
	SELECT dba.BRANCH.ID_BRANCH,   
			dba.BRANCH.ID_MAIN_BRANCH,   
			dba.DEPOSIT_CODES.ID_BANCO,   
			dba.DEPOSIT_CODES.ID_CUENTA_BANCO  
	 INTO :ls_idbranch,   
			:ls_idgroup,   
			:ls_idbanco,   
			:ls_idcuenta  
	 FROM dba.BRANCH,   
			dba.DEPOSIT_CODES  
	WHERE ( dba.DEPOSIT_CODES.ID_BRANCH = dba.BRANCH.ID_BRANCH ) and  
			( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) )   ;
	
	
	dw_1.setitem(dw_1.getrow(),"id_banco",ls_idbanco)
	dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_idcuenta)
	dw_1.setitem(dw_1.getrow(),"deposit_code",ls_depositcode)

	em_agent.text = ls_idbranch
	em_group.text = ls_idgroup
	
	dw_2.setitem(1,"id_group",ls_idgroup)
	
	dw_3.Retrieve(relativedate(today(),-30),ls_idgroup)
	
end if

end event

type em_agent from editmask within w_consignacion_group_agent
integer x = 498
integer y = 84
integer width = 297
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event losefocus;String	ls_branch, ls_grupo, ls_depositcode, ls_idbanco, ls_idcuenta


ls_branch = em_agent.text

SELECT dba.branch.id_main_branch  
 INTO :ls_grupo  
 FROM dba.branch  
WHERE dba.branch.id_branch = :ls_branch   ;

em_group.text = ls_grupo

dw_2.setitem(1,"id_group",ls_grupo)

dw_3.Retrieve(relativedate(today(),-30),ls_grupo)

if isnull(ls_grupo) or len(trim(ls_grupo)) < 1 then 
	st_branch.TextColor = RGB(255,0,0)
else
	st_branch.TextColor = RGB(0,0,0)
end if	


/***********csarmiento: same behavio as the lookup button *********************/
/**requested by Joel Silva , Wednesday, May 28, 2014 12:09 PM
I would like to request a change in Viacentral that would help reduce mistakes being made by the accounting staff when deposits are made. 
The printscreen is where deposits are made by accounting.  The Bank is a dropdown which currently the agent can select any bank
and leaves room for error.  I would like to have this automatically populate from the information that is currently housed in the Group Branch-Financial Profile

**/


select fin_depdepositcode
	into :ls_depositcode
 from dba.group_branch  (nolock)
 where id_main_branch = :ls_grupo ;

if ls_depositcode <> 'none' and ls_depositcode <> '' then
	
	dw_1.settaborder(2,0) //El Banco
	dw_1.settaborder(3,0) //La cuenta
	dw_1.settaborder(4,0) //The deposit code
	dw_1.settaborder(5,10) //Reconciliation Date

	// --------------------------------------------
	// Remueve filtro Cuentas
	DataWindowChild	ldw_dw
	dw_1.GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("")
	ldw_dw.Filter()
	// --------------------------------------------	
	
	//---------------------------------------------
	//Remueve filttro Deposit Codes
	DataWindowChild	ldw_dw1
	dw_1.GetChild('deposit_code',ldw_dw)
	ldw_dw1.SetTransObject(SQLCA)
	ldw_dw1.SetFilter("")
	ldw_dw1.Filter()
	// --------------------------------------------	
	
	
	SELECT 	dba.DEPOSIT_CODES.ID_BANCO,   
			dba.DEPOSIT_CODES.ID_CUENTA_BANCO  
	 INTO :ls_idbanco,   
			:ls_idcuenta  
	 FROM dba.BRANCH  (nolock),   
			dba.DEPOSIT_CODES   (nolock)
	WHERE ( dba.DEPOSIT_CODES.ID_BRANCH = dba.BRANCH.ID_BRANCH ) and  
			( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) )   ;
	
	
	dw_1.setitem(dw_1.getrow(),"id_banco",ls_idbanco)
	dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_idcuenta)
	dw_1.setitem(dw_1.getrow(),"deposit_code",ls_depositcode)


end if


/*****************************************************************/
end event

type em_group from editmask within w_consignacion_group_agent
integer x = 1001
integer y = 84
integer width = 297
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;string	ls_grupo


ls_grupo = em_group.text

dw_2.setitem(1,"id_group",ls_grupo)
end event

type st_branch from statictext within w_consignacion_group_agent
integer x = 325
integer y = 84
integer width = 165
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Agent :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_group from statictext within w_consignacion_group_agent
integer x = 809
integer y = 84
integer width = 192
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Group :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_consignacion_group_agent
integer x = 1330
integer y = 80
integer width = 311
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select Fax"
end type

event clicked;//+++++++++++++++++++++++++++++++++++++++++++
// Abre el Fax Viewer y trae los parametros

String ls_return
//Openwithparm(w_faxviewer,em_agent.text)
//Openwithparm(w_faxviewer,"")

Openwithparm(w_faxcomponent_deposits,"Accounting")
ls_return = message.stringparm	


if ls_return = "-none-" then
	sle_selectedfax.text = "[No Fax Selected]"
	cb_faxviewer.enabled = false
	return
else
	sle_selectedfax.text = fn_token(ls_return,"*",1)
	sle_completefaxpath.text = "u:\accounting\"+sle_selectedfax.text
	cb_faxviewer.enabled = true
end if

String ls_branch
Double ld_amount

ls_branch = trim(fn_token(ls_return,"*",2))
ld_amount = double(trim(fn_token(ls_return,"*",3)))

em_agent.text = ls_branch
//em_agent.triggerevent(LoseFocus!)

dw_2.setitem(dw_2.getrow(),"credit",ld_amount)
//+++++++++++++++++++++++++++++++++++++++++++
string	ls_depositcode,	&
			ls_idbranch, 		&
			ls_idgroup, 		&
			ls_idbanco, 		&
			ls_idcuenta

  SELECT min(dba.DEPOSIT_CODES.DEPOSIT_CODE)  
    INTO :ls_depositcode
    FROM dba.DEPOSIT_CODES  
   WHERE dba.DEPOSIT_CODES.ID_BRANCH = :ls_branch   ;

if isnull(ls_depositcode) or len(trim(ls_depositcode)) < 1 then ls_depositcode = 'none'

if ls_depositcode <> 'none' then

	// --------------------------------------------
	// Remueve filtro Cuentas
	DataWindowChild	ldw_dw
	dw_1.GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("")
	ldw_dw.Filter()
	// --------------------------------------------	

	SELECT dba.BRANCH.ID_BRANCH,   
			dba.BRANCH.ID_MAIN_BRANCH,   
			dba.DEPOSIT_CODES.ID_BANCO,   
			dba.DEPOSIT_CODES.ID_CUENTA_BANCO  
	 INTO :ls_idbranch,   
			:ls_idgroup,   
			:ls_idbanco,   
			:ls_idcuenta  
	 FROM dba.BRANCH,   
			dba.DEPOSIT_CODES  
	WHERE ( dba.DEPOSIT_CODES.ID_BRANCH = dba.BRANCH.ID_BRANCH ) and  
			( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) )   ;
	
	dw_1.setitem(dw_1.getrow(),"id_banco",ls_idbanco)
	dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_idcuenta)
	dw_1.setitem(dw_1.getrow(),"deposit_code",ls_depositcode)
	em_agent.text = ls_idbranch
	em_group.text = ls_idgroup	
	
	dw_2.setitem(1,"id_group",ls_idgroup)
	dw_3.Retrieve(relativedate(today(),-30),ls_idgroup)
ELSEIF ls_depositcode = 'none' or ls_depositcode = '' or isnull(ls_depositcode) THEN
		
		select ID_MAIN_BRANCH
		into   :ls_idgroup
		from   dba.BRANCH
		where  id_branch = :ls_branch;
		
		dw_3.Retrieve(relativedate(today(),-30),ls_idgroup)
end if

end event

type sle_selectedfax from singlelineedit within w_consignacion_group_agent
integer x = 1655
integer y = 84
integer width = 699
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "[No Fax Selected]"
boolean autohscroll = false
boolean displayonly = true
end type

event modified;if this.text = "[No Fax Selected]" then
	cb_faxviewer.enabled = false
else
	cb_faxviewer.enabled = true
end if
end event

type sle_completefaxpath from singlelineedit within w_consignacion_group_agent
boolean visible = false
integer x = 2405
integer y = 1524
integer width = 507
integer height = 68
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_faxviewer from commandbutton within w_consignacion_group_agent
integer x = 2359
integer y = 80
integer width = 119
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "..."
end type

event clicked;if sle_selectedfax.text <> "[No Fax Selected]" then
	OpenWithParm(w_faxviewer_view,sle_completefaxpath.text)
end if
end event

type cb_4 from commandbutton within w_consignacion_group_agent
boolean visible = false
integer x = 2176
integer y = 1868
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fax"
end type

event clicked;double ld_cons

ld_cons = dw_3.getitemnumber(dw_3.getrow(),"cons")

lb_fax.reset()
lb_fax.dirlist("u:\accounting\processed\*_"+string(ld_cons)+".tif",0)

//Messagebox(string(ld_cons),string(lb_fax.totalitems()))

if lb_fax.totalitems() > 0 then
	lb_fax.selectitem(1)	
	OpenWithParm(w_faxviewer_view,lb_fax.selecteditem())
end if
end event

type lb_fax from listbox within w_consignacion_group_agent
boolean visible = false
integer x = 2711
integer y = 1220
integer width = 494
integer height = 360
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_consignacion_group_agent
integer x = 32
integer width = 3291
integer height = 684
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Branch Information"
end type

