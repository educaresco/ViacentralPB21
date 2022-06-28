$PBExportHeader$w_query_general.srw
forward
global type w_query_general from w_base_query
end type
type pb_print from u_pb within w_query_general
end type
type pb_print2 from u_pb within w_query_general
end type
type dw_2 from datawindow within w_query_general
end type
type cb_hold from commandbutton within w_query_general
end type
type cb_complain from commandbutton within w_query_general
end type
type cb_void from commandbutton within w_query_general
end type
type cb_pago from commandbutton within w_query_general
end type
type cb_history from commandbutton within w_query_general
end type
type dw_recibo_matrix from datawindow within w_query_general
end type
type dw_recibo from datawindow within w_query_general
end type
type gb_2 from groupbox within w_query_general
end type
type gb_1 from groupbox within w_query_general
end type
type em_fec_ini from editmask within w_query_general
end type
type st_1 from statictext within w_query_general
end type
type st_2 from statictext within w_query_general
end type
type em_fec_fin from editmask within w_query_general
end type
type rb_yes from radiobutton within w_query_general
end type
type rb_no from radiobutton within w_query_general
end type
type dw_3 from datawindow within w_query_general
end type
type dw_4 from datawindow within w_query_general
end type
type dw_5 from datawindow within w_query_general
end type
type dw_6 from datawindow within w_query_general
end type
type cb_1 from commandbutton within w_query_general
end type
type cb_2 from commandbutton within w_query_general
end type
type dw_motivo_hold from datawindow within w_query_general
end type
type cb_sentupdate from commandbutton within w_query_general
end type
type cb_solutions from commandbutton within w_query_general
end type
type dw_motivo_hold_solutions from datawindow within w_query_general
end type
end forward

global type w_query_general from w_base_query
integer x = 9
integer y = 212
integer width = 3255
integer height = 1960
string title = "Query Invoice"
string menuname = "m_consulta"
event ue_hold ( )
event ue_save ( )
event ue_reclamo ( )
event ue_pago ( )
event ue_anulacion ( )
event ue_history ( )
event ue_clean ( )
event ue_saveas ( )
event ue_consult ( )
event ue_sort ( )
event ue_print_one ( )
event ue_print_all ( )
event ue_print_receipt ( )
event ue_cancel ( )
event ue_change_payee ( )
event ue_change_rate ( )
event ue_print_trans ( )
event ue_bancomer ( )
event ue_suspicious_abreu ( )
event ue_referencia ( )
event ue_suspicious_bancomer ( )
event ue_retransmit_cancelados ( )
event ue_print_recibo_matriz ( )
event ue_history_invoice ( )
event ue_asignar_pin ( )
event ue_cancelacion_bancomer ( )
event ue_solicitud_cancelacion ( )
event ue_documento ( )
pb_print pb_print
pb_print2 pb_print2
dw_2 dw_2
cb_hold cb_hold
cb_complain cb_complain
cb_void cb_void
cb_pago cb_pago
cb_history cb_history
dw_recibo_matrix dw_recibo_matrix
dw_recibo dw_recibo
gb_2 gb_2
gb_1 gb_1
em_fec_ini em_fec_ini
st_1 st_1
st_2 st_2
em_fec_fin em_fec_fin
rb_yes rb_yes
rb_no rb_no
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
dw_6 dw_6
cb_1 cb_1
cb_2 cb_2
dw_motivo_hold dw_motivo_hold
cb_sentupdate cb_sentupdate
cb_solutions cb_solutions
dw_motivo_hold_solutions dw_motivo_hold_solutions
end type
global w_query_general w_query_general

type variables
integer ii_MaxRangeDaysQInvoice

String	is_mod_sql1, is_output
end variables

forward prototypes
public subroutine of_create_dblog ()
public function integer fn_validate_dates ()
end prototypes

event ue_hold;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido, ls_name_sender, ls_name_receiver
Double	ld_id_receiver

Date	ld_fecha
time	lt_hora

commit ;

IF dw_1.GetRow()<=0 THEN
	MessageBox('HOLD','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('HOLD','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_name_sender=dw_1.Object.sender_name_sender[dw_1.GetRow()]
ls_name_receiver=dw_1.Object.name_receiver[dw_1.GetRow()]



//ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_flag = fn_estado_invoice(ls_branch, ld_id_receiver)
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	
IF ls_flag = "T" OR ls_transmitido = "T" THEN
	Messagebox("Atención","No se puede cambiar el estado a Hold por que el giro ya habia sido transmitido.",Exclamation!)
	Return
END IF

IF ls_flag = "D" THEN
	Messagebox("Atención","No se puede cambiar el estado a Hold por que el giro no ha sido pagado en caja.",Exclamation!)
	Return
END IF

IF ls_flag = "A" then
	Messagebox("Atención","No se puede cambiar el estado a Hold por que el giro esta anulado.",Exclamation!)
	Return
END IF

IF ls_flag = "P" then
	Messagebox("Atención","No se puede cambiar el estado a Hold por que ya fue pagado.",Exclamation!)
	Return
END IF

IF ls_flag = "C" then
	Messagebox("Atención","No se puede cambiar el estado a Hold por que ya fue cancelado.",Exclamation!)
	Return
END IF

IF ls_flag = "H" THEN
	
	Messagebox("Atención","No se puede cambiar el Estado por esta opcion.",Exclamation!)
	Return
	
//	IF Messagebox("INGRESADO","Num. Recibo : " + ls_branch +'-'+ String(ld_id_receiver)+&
//								 "~r~nRemitente : " + ls_name_sender + &
//								 "~r~nBeneficiario : "  + ls_name_receiver + &
//								 "~r~n~r~nDesea colocar este giro en INGRESADO ?",Question!,YesNo!,1) = 2 then 
//	
//		Return
//	END IF
//	
//	if ls_branch <> '0043' then	
//	
//		UPDATE "receiver"  
//     	SET "id_flag_receiver" = 'I' ,
//	  		"date_receiver" = Today(),
//	  		"id_cashier" = :gs_cashier
//   	WHERE ( "receiver"."id_branch"   = :ls_branch ) AND  
//         ( "receiver"."id_receiver" = :ld_id_receiver )   ;
//			
//	else
//		
//		UPDATE "receiver"  
//     	SET "id_flag_receiver" = 'I' ,
//	  		"date_receiver" = Today()
//   	WHERE ( "receiver"."id_branch"   = :ls_branch ) AND  
//         ( "receiver"."id_receiver" = :ld_id_receiver )   ;
//	
//	
//	end if	
//	
//	commit ;	
//
//	dw_1.setitem(dw_1.GetRow(),"id_flag_receiver","I")
//	dw_1.setitem(dw_1.GetRow(),"id_cashier",gs_cashier)
//	
//		INSERT INTO change_status_invoice  
//             ( id_branch,id_receiver,id_cashier,fecha,hora,id_flag_receiver_old,id_flag_receiver_new )  
//      VALUES ( :ls_branch,:ld_id_receiver,:gs_cashier,:ld_fecha,:lt_hora,'H','I' )  ;
//
//	commit ;
//	
	
ELSEIF ls_flag = "I" THEN
	IF Messagebox("HOLD","Num. Recibo : " + ls_branch +'-'+ String(ld_id_receiver)+&
								 "~r~nRemitente : " + ls_name_sender + &
								 "~r~nBeneficiario : "  + ls_name_receiver + &
								 "~r~n~r~nDesea colocar este giro en HOLD ?",Question!,YesNo!,1) = 2 then 
	
		Return
	END IF
	
	UPDATE  dba.receiver
      SET  id_flag_receiver = 'H' 
    WHERE (id_branch   = :ls_branch ) AND  
          (id_receiver = :ld_id_receiver)   ;
			 
	INSERT INTO dba.history_invoice  
        	 ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change )  
  	VALUES ( :ls_branch,:ld_id_receiver,:ls_flag,'H',:gs_cashier,today(),now() )  ;
			  
			  		
					 
			 
			 
	commit ;		 

	dw_1.setitem(dw_1.GetRow(),"id_flag_receiver","H")
	
	INSERT INTO dba.change_status_invoice  
             ( id_branch,id_receiver,id_cashier,fecha,hora,id_flag_receiver_old,id_flag_receiver_new )  
   VALUES ( :ls_branch,:ld_id_receiver,:gs_cashier,:ld_fecha,:lt_hora,'I','H' )  ;

	commit ;
END IF

dw_1.SetFocus()
end event

event ue_save;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido, ls_name_sender, ls_name_receiver
Double	ld_id_receiver

IF dw_1.GetRow()<=0 THEN
	MessageBox('SALVAR','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('SALVAR','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_name_sender=dw_1.Object.sender_name_sender[dw_1.GetRow()]
ls_name_receiver=dw_1.Object.name_receiver[dw_1.GetRow()]


IF Messagebox("SALVAR","Num. Recibo : " + ls_branch +'-'+ String(ld_id_receiver)+&
							 "~r~nRemitente : " + ls_name_sender + &
							 "~r~nBeneficiario : "  + ls_name_receiver + &
							 "~r~n~r~nDesea cambiar la Información de este giro ?",Question!,YesNo!,1) = 2 then 
	
	Return
END IF

ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	
//IF ls_flag = "T" OR ls_transmitido = "T" THEN
//	Messagebox("Atención","No se puede cambiar la informacion de un giro transmitido.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "A" then
//	Messagebox("Atención","No se puede cambiar la informacion de un giro anulado.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "P" then
//	Messagebox("Atención","No se puede cambiar la informacion de un giro pagado.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "H" THEN
//	Messagebox("Atención","No se puede cambiar la informacion de un giro que esta en Hold.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "C" THEN
//	Messagebox("Atención","No se puede cambiar la informacion de un giro que esta Cancelado.",Exclamation!)
//	Return
//END IF

IF dw_1.Update()=1 THEN
	dw_1.SetFocus()
	if messagebox('Warning','Desea Enviar el Cambio a la Agencia',Question!,YesNo!) = 1 then
		cb_sentupdate.triggerevent(Clicked!)
	end if
	Return
END IF
end event

event ue_reclamo;Long 		ll_cont = 0
Double	ld_sender = 0
String	ls_branch


IF dw_1.GetRow()<=0 THEN
	MessageBox('MENSAJES','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	dw_1.SetFocus()
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('MENSAJES','Debe consultar y seleccionar un giro antes de realizar esta operación.')
	dw_1.SetFocus()
	Return
END IF


ld_sender = dw_1.getitemnumber(dw_1.getrow(),"sender_id_sender")
ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
gs_branch_insta_cons = ls_branch

gl_receiver_cons = dw_1.getitemnumber(dw_1.getrow(),"id_receiver")

Openwithparm(w_consulta_reclamo,ld_sender)
dw_1.SetFocus()
end event

event ue_pago;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido, ls_name_sender, ls_name_receiver
Double	ld_id_receiver, ld_sender

IF dw_1.GetRow()<=0 THEN
	MessageBox('PAGO','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('PAGO','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_name_sender=dw_1.Object.sender_name_sender[dw_1.GetRow()]
ls_name_receiver=dw_1.Object.name_receiver[dw_1.GetRow()]


IF Messagebox("PAGO","Num. Recibo : " + ls_branch +'-'+ String(ld_id_receiver)+&
							 "~r~nRemitente : " + ls_name_sender + &
							 "~r~nBeneficiario : "  + ls_name_receiver + &
							 "~r~n~r~nDesea consultar el pago/pagar este giro ?",Question!,YesNo!,1) = 2 then 
	
	Return
END IF

//ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_flag = fn_estado_invoice(ls_branch, ld_id_receiver)
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	
IF ls_flag = "C" then
	Messagebox("Atención","El pago no puede ser consultado/registrado porque el giro fue Cancelado.",Exclamation!)
	Return
END IF

IF ls_flag = "H" then
	Messagebox("Atención","El pago no puede ser consultado/registrado porque el giro esta en Hold.~r~nPrimero, cambielo a Ingresado.",Exclamation!)
	Return
END IF

IF ls_flag = "A" then
	Messagebox("Atención","El pago no puede ser consultado/registrado porque el giro fue Anulado.",Exclamation!)
	Return
END IF

IF ls_flag = "D" then
	Messagebox("Atención","El pago no puede ser consultado/registrado porque el giro no ha sido pagado en Caja.",Exclamation!)
	Return
END IF

ld_sender=dw_1.Object.sender_id_sender[dw_1.GetRow()]

gl_receiver_cons = ld_id_receiver
gs_branch_insta_cons = ls_branch

Openwithparm(w_pagar_invoice_or_consultar,ld_sender)
dw_1.setitem(dw_1.getrow(),"id_flag_receiver","P")
	
	
dw_1.SetFocus()
end event

event ue_anulacion();long		ll_cont
string	ls_branch, ls_flag, ls_transmitido
Double	ld_sender

ld_sender	=	0
gl_receiver_cons = 0

ld_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
gs_branch_insta_cons = ls_branch


if ld_sender = 0 then
	return
end if

//DON (04/13/2015) - PERFORMANCE TUNING.  ***********************
  SELECT   Count(*)  
    INTO   :ll_cont  
    FROM   dba.sender	WITH	(NOLOCK)
   WHERE ( dba.sender.id_sender = :ld_sender ) AND  
         ( dba.sender.id_branch = :ls_branch )   ;
//********************************************************

if ll_cont = 0 then
	return
else
	if Messagebox("Warning","Do you Want to Put this Invoice in Void!",Question!,YesNo!) = 2 then 
		return
	end if
	gl_receiver_cons = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
	ls_flag = dw_2.getitemstring(dw_2.getrow(),"id_flag_receiver")
	
	ls_transmitido = dw_2.getitemstring(dw_2.getrow(),"trans_receiver")
	
	if ls_transmitido = "T" then
		Messagebox("Warning","Invoice Transfered") 
		return
	end if
	
	if ls_flag = "T" then
		Messagebox("Warning","Invoice Transfered")  
		return
	end if
	
	if ls_flag = "A" then
		Messagebox("Warning","Invoice Void")  
		return
	end if

if ls_flag = "P" then
		Messagebox("Warning","Invoice Paid") 
		return
	end if
	

	Openwithparm(w_motivo_anulacion_invoice,ld_sender)
	dw_2.Retrieve(ls_branch,gl_receiver_cons)
end if
end event

event ue_history;//Long 		ll_cont = 0
//Double	ld_sender = 0, ld_receiver
//String	ls_branch
//
//
//IF dw_1.GetRow()<=0 THEN
//	MessageBox('HISTORIA','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
//	Return
//END IF
//
//IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
//	MessageBox('HISTORIA','Debe consultar y seleccionar un giro antes de realizar esta operación.')
//	Return
//END IF
//
//
//ld_receiver = dw_1.getitemnumber(dw_1.getrow(),"num_giro")
//ls_branch = dw_1.getitemstring(dw_1.getrow(),"cod_agencia")
//
//Openwithparm(w_invoice_history,ls_branch+'&'+String(ld_receiver))
//dw_1.SetFocus()
end event

event ue_clean;pb_clean.Event Clicked()
end event

event ue_saveas;dw_1.SaveAs()
end event

event ue_consult;pb_query.Event Clicked()
end event

event ue_sort;pb_sort.Event clicked()
end event

event ue_print_one;Double	ld_id_sender, ld_id_receiver
String	ls_id_branch

IF dw_1.GetRow()<=0 THEN
	MessageBox('Atencion','Debe seleccionar un giro antes de imprimir.')
	Return
END IF

ld_id_sender=dw_1.Object.sender_id_sender[dw_1.GetRow()]
ls_id_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]

dw_1.SetRedraw(FALSE)
dw_1.SetFilter("sender_id_sender = "+String(ld_id_sender)+" AND id_branch = '"+ls_id_branch+"' AND id_receiver = "+String(ld_id_receiver))
dw_1.Filter()
dw_1.Print()
dw_1.SetFilter("")
dw_1.Filter()
dw_1.SetRedraw(TRUE)


end event

event ue_print_all;String 		original_select, rc, mod_string, ls_name_cashier
Integer		li_ini, li_fin
long 			start_pos=1
string 		old_str, new_str, mystring

dw_2.SetTransOBject(SQLCA)

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('Atención','Debe consultar antes de Imprimir.')
	Return
END IF

mystring = is_mod_sql
start_pos=1
old_str = "'"
new_str = "~~'"
// Find the first occurrence of old_str.
start_pos = Pos(mystring, old_str, start_pos)
// Only enter the loop if you find old_str.
DO WHILE start_pos > 0

	// Replace old_str with new_str.
	mystring = Replace(mystring, start_pos,Len(old_str), new_str)

	// Find the next occurrence of old_str.

	start_pos = Pos(mystring, old_str,start_pos+Len(new_str))

LOOP

mod_string = mystring

mod_string = "DataWindow.Table.Select='" + Trim(mod_string) + "'"

rc = dw_2.Modify(mod_string)

IF rc = "" THEN
	Open(w_report_setup_gloria)
	IF Message.StringParm <> '-1' THEN
		dw_2.Object.DataWindow.Print.Orientation=1
		dw_2.Retrieve(Message.StringParm,ls_name_cashier)
		dw_2.Print()
	END IF
ELSE
	MessageBox("Status", "Modify Failed" + rc)
END IF
end event

event ue_print_receipt;String	ls_dot_pri, ls_tmp, ls_id_branch, ls_flag, ls_transmitido
Double	ld_id_receiver

IF dw_1.GetRow()<=0 THEN
	MessageBox('IMPRIMIR COPIA DE RECIBO','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('IMPRIMIR COPIA DE RECIBO','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_id_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	

Printsetup()

ls_dot_pri=ProfileString("c:\Dinero\Envio.ini","Printer Setup","Dot Matrix","None")

IF ls_dot_pri="None" OR ls_dot_pri = "No" Then
	ls_tmp=ProfileString("c:\Dinero\Envio.ini","Preferences","Branch Inv","None")
	IF ls_tmp="None" OR ls_tmp="No" Then
		dw_recibo.retrieve(ls_id_branch,ld_id_receiver,'N')
	ELSE
		dw_recibo.retrieve(ls_id_branch,ld_id_receiver,'Y')
	END IF
	
	dw_recibo.print()
ELSEIF ls_dot_pri <> "None" OR ls_dot_pri = "Yes" Then
	ls_tmp=ProfileString("c:\Dinero\Envio.ini","Preferences","Branch Inv","None")
	IF ls_tmp="None" OR ls_tmp="No" Then
		dw_recibo_matrix.retrieve(ls_id_branch,ld_id_receiver,'N')
	ELSE
		dw_recibo_matrix.retrieve(ls_id_branch,ld_id_receiver,'Y')
	END IF
		dw_recibo_matrix.print()
END IF
end event

event ue_cancel;//String	ls_branch, ls_name_sender, ls_name_receiver, ls_flag, ls_transmitido
//Double	ld_id_receiver
//Long		ll_cont
//Date		ld_date
//Time		lt_hour
//
//IF dw_1.GetRow()<=0 THEN
//	MessageBox('CANCELAR','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
//	Return
//END IF
//
//IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
//	MessageBox('CANCELAR','Debe consultar antes de realizar esta operación.')
//	Return
//END IF
//
//ls_branch=dw_1.Object.cod_agencia[dw_1.GetRow()]
//ld_id_receiver=dw_1.Object.num_giro[dw_1.GetRow()]
//ls_name_sender=dw_1.Object.nombre_remitente[dw_1.GetRow()]
//ls_name_receiver=dw_1.Object.nombre_beneficiario[dw_1.GetRow()]
//
//ls_flag = dw_1.getitemstring(dw_1.getrow(),"estado_giro")
//ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
//	
//IF ls_flag = "D" THEN
//	Messagebox("Atención","No se puede cambiar el estado a Hold por que el giro no ha sido pagado en caja.~r~nRecuerde, solo se pueden Cancelar giros que han sido transmitidos.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "I" THEN
//	Messagebox("Atención","No se puede cambiar el estado a Cancelado.~r~nRecuerde, solo se pueden Cancelar giros que han sido transmitidos.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "A" then
//	Messagebox("Atención","No se puede cambiar el estado a Cancelado por que el giro esta anulado.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "P" then
//	Messagebox("Atención","No se puede cambiar el estado a Cancelado por que ya fue pagado.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "C" then
//	Messagebox("Atención","El giro ya estaba cancelado.",Exclamation!)
//	Return
//END IF
//
//IF ls_flag = "T" OR ls_transmitido = "T" THEN
//	Messagebox("Atención","No se puede cambiar el estado a Hold por que el giro ya habia sido transmitido.",Exclamation!)
//	Return
//END IF
//
//  SELECT Count(*)  
//    INTO :ll_cont  
//    FROM "relacion_invoices_payee"  
//   WHERE ( "relacion_invoices_payee"."id_branch_invoice" = :ls_branch ) AND  
//         ( "relacion_invoices_payee"."id_receiver" = :ld_id_receiver )   ;
//
//IF ll_cont = 0 THEN
//	Messagebox("Atención","Debe primero realizar un cierre antes de cancelar este giro.")
//	Return
//END IF
//
//IF Messagebox("CANCELAR","Num. Recibo : " + ls_branch +'-'+ String(ld_id_receiver)+&
//								 "~r~nRemitente : " + ls_name_sender + &
//								 "~r~nBeneficiario : "  + ls_name_receiver + &
//								 "~r~n~r~nDesea CANCELAR este giro?",Question!,YesNo!,1) = 2 then 
//								 
//	Return
//END IF
//
//ld_date     = Today()
//lt_hour		= Now()
//
//  INSERT INTO "receiver"  
//         ( "id_sender",   
//           "id_branch",   
//           "id_receiver",   
//           "id_payment",   
//           "id_curreny",   
//           "id_flag_receiver",   
//           "id_city_receiver",   
//           "id_state_receiver",   
//           "id_country_receiver",   
//           "branch_pay_receiver",   
//           "id_cashier",   
//           "name_receiver",   
//           "address_receiver",   
//           "phone1_receiver",   
//           "phone2_receiver",   
//           "zip_receiver",   
//           "notes_receiver",   
//           "date_receiver",   
//           "time_receiver",   
//           "net_amount_receiver",   
//           "rate_change_receiver",   
//           "telex_receiver",   
//           "urgency_receiver",   
//           "recomend_receiver",   
//           "mode_pay_receiver",   
//           "acc_receiver",   
//           "exchange_receiver",   
//           "handling_receiver",   
//           "total_receiver",   
//           "mod_pay_currency",   
//           "porc_comision_receiver",   
//           "total_pay_receiver",   
//           "trans_receiver",   
//           "exchange_company",   
//           "telex_company",   
//           "ref_receiver",   
//           "bank_receiver",   
//           "total_diference",   
//           "total_modo_pago",   
//           "commission_payee" )  
//     SELECT ("receiver"."id_sender"),   
//            "receiver"."id_branch",   
//            ("receiver"."id_receiver" * -1),   
//            "receiver"."id_payment",   
//            "receiver"."id_curreny",   
//            'C',   
//            "receiver"."id_city_receiver",   
//            "receiver"."id_state_receiver",   
//            "receiver"."id_country_receiver",   
//            "receiver"."branch_pay_receiver",   
//            :gs_cashier,   
//            "receiver"."name_receiver",   
//            "receiver"."address_receiver",   
//            "receiver"."phone1_receiver",   
//            "receiver"."phone2_receiver",   
//            "receiver"."zip_receiver",   
//            "receiver"."notes_receiver",   
//            :ld_date,   
//            "receiver"."time_receiver",   
//            ("receiver"."net_amount_receiver" * -1),   
//            "receiver"."rate_change_receiver",   
//            ("receiver"."telex_receiver" * -1),
//            "receiver"."urgency_receiver",   
//            "receiver"."recomend_receiver",   
//            "receiver"."mode_pay_receiver",   
//            "receiver"."acc_receiver",   
//            ("receiver"."exchange_receiver" * -1),   
//            ("receiver"."handling_receiver" * -1),  
//            ("receiver"."total_receiver" * -1),   
//            "receiver"."mod_pay_currency",   
//            "receiver"."porc_comision_receiver",   
//            ("receiver"."total_pay_receiver"* -1 ),   
//            "receiver"."trans_receiver",   
//            ("receiver"."exchange_company" * -1),   
//            ("receiver"."telex_company"* -1),   
//            "receiver"."ref_receiver",   
//            "receiver"."bank_receiver",   
//            ("receiver"."total_diference"* -1),   
//            ("receiver"."total_modo_pago" * -1),   
//            ("receiver"."commission_payee" * -1)  
//       FROM "receiver"  
//      WHERE ( "receiver"."id_branch" = :ls_branch ) AND  
//            ( "receiver"."id_receiver" = :ld_id_receiver )   ;
//
//
//If sqlca.sqlcode <> 0 then
//	rollback;
//	messagebox("Error","Error Canceling Invoice.~r~n The error is : "+SQLCA.SQLERRTEXT,StopSign!)
//	return
//else
//	  UPDATE "receiver"  
//     SET "id_flag_receiver" = 'C'  
//     WHERE ( "receiver"."id_branch" = :ls_branch ) AND  
//           ( "receiver"."id_receiver" = :ld_id_receiver )   ;
//
//	  If sqlca.sqlcode <> 0 then
//			rollback;
//			messagebox("Update Flag Invoice","Error Canceling Invoice.~r~n"+SQLCA.SQLERRTEXT+".")
//			return
//		end if
//		
//	dw_1.Object.estado_giro[dw_1.GetRow()]='C'
//	
//	commit;
//	
//	messagebox("CANCELAR","El giro fue cancelado.")
//END IF
end event

event ue_change_payee();string		ls_city,					& 
				ls_country, 			&
				ls_mod_pay, 			&
				ls_mode_currency,		&
				ls_branch,				&
				ls_branch_pay, ls_flag, ls_group_pay 
				
Double		ld_receiver, ld_amount


str_change_payee	str_pagador

IF dw_1.GetRow()<=0 THEN
	MessageBox('Change Payee','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('Change Payee','Debe consultar antes de realizar esta operación.')
	Return
END IF
			
		
		
		ls_country			= dw_1.getitemstring(dw_1.getrow(),"id_country_receiver")
		ls_city  			= dw_1.getitemstring(dw_1.getrow(),"id_city_receiver")
		ls_mode_currency  = dw_1.getitemstring(dw_1.getrow(),"mod_pay_currency")
		ls_mod_pay			= dw_1.getitemstring(dw_1.getrow(),"mode_pay_receiver")
		ls_branch			= dw_1.getitemstring(dw_1.getrow(),"id_branch")
		ld_receiver			= dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
		ls_branch_pay     = dw_1.getitemstring(dw_1.getrow(),"branch_pay_receiver")
		ld_amount         = dw_1.getitemnumber(dw_1.getrow(),"net_amount_receiver")
		ls_group_pay      = dw_1.getitemstring(dw_1.getrow(),"branch_id_main_branch")
		
			
		ls_flag = fn_estado_invoice(ls_branch, ld_receiver)	
		
		if ls_flag = 'P' Or ls_flag = 'C' Or ls_flag = 'D' Or ls_flag = 'A' Then 
			Messagebox("Status","You Can't Change this Invoice ")
			return
		end if
		
		

str_pagador.branch      = ls_branch
str_pagador.receiver	   = ld_receiver     
str_pagador.branch_pay  = ls_branch_pay
str_pagador.country 		= ls_country
str_pagador.city        = ls_city 
str_pagador.currency    = ls_mode_currency
str_pagador.mode_pay    = ls_mod_pay
str_pagador.amount		= ld_amount 

Openwithparm(w_change_payee,str_pagador)


ls_branch_pay = message.stringparm

//DON (04/13/2015) - PERFORMANCE TUNING.  ***********************
  SELECT branch.id_main_branch  
    INTO :ls_group_pay  
    FROM dba.branch branch WITH (NOLOCK)
   WHERE branch.id_branch = :ls_branch_pay  ;
//********************************************************


dw_1.setitem(dw_1.getrow(),"branch_pay_receiver",ls_branch_pay)
dw_1.setitem(dw_1.getrow(),"branch_id_main_branch",ls_group_pay)





end event

event ue_change_rate;Double	ld_rate, ld_receiver, ld_amount, ld_total_pay
string	ls_branch, ls_flag


IF dw_1.GetRow()<=0 THEN
	MessageBox('Change Payee','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('Change Payee','Debe consultar antes de realizar esta operación.')
	Return
END IF
			
		commit ;		
		ls_branch			= dw_1.getitemstring(dw_1.getrow(),"id_branch")
		ld_receiver			= dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
		ld_amount			= dw_1.getitemnumber(dw_1.getrow(),"net_amount_receiver")	
			
		ls_flag = fn_estado_invoice(ls_branch, ld_receiver)	
		
		if ls_flag = 'P' Or ls_flag = 'C' Or ls_flag = 'D' Or ls_flag = 'A' Then 
			Messagebox("Status","You Can't Change this Invoice ")
			return
		end if
Open(w_change_rate)

ld_rate = message.doubleparm

if ld_rate = 0 then
	return
else
	ld_total_pay = ld_amount * ld_rate
	
	  UPDATE dba.receiver
     SET    rate_change_receiver = :ld_rate,
	  		   total_pay_receiver   = :ld_total_pay
   WHERE (  id_branch = :ls_branch ) AND  
         (  id_receiver = :ld_receiver )   ;
			
		if sqlca.sqlcode <> 0 then
			Messagebox("Error","Error Data Base")
			rollback ;
		else
			commit ;
			dw_1.setitem(dw_1.getrow(),"rate_change_receiver",ld_rate)		
			dw_1.setitem(dw_1.getrow(),"total_pay_receiver",ld_total_pay)	
		end if
end if





end event

event ue_print_trans;string	ls_id_branch, ls_flag, ls_transmitido
Double	ld_id_receiver


IF dw_1.GetRow()<=0 THEN
	MessageBox('IMPRIMIR COPIA DE TRANSMISION','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('IMPRIMIR COPIA DE TRANSMISION','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_id_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	


dw_3.SETTRANSOBJECT(sqlca)

if dw_3.retrieve(ls_id_branch,ld_id_receiver,gs_cashier) = 0 then
	return
else
	Printsetup()
	dw_3.print()
end if




end event

event ue_bancomer;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido, ls_name_sender, ls_name_receiver
Double	ld_id_receiver

IF dw_1.GetRow()<=0 THEN
	MessageBox('SALVAR','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('SALVAR','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_name_sender=dw_1.Object.sender_name_sender[dw_1.GetRow()]
ls_name_receiver=dw_1.Object.name_receiver[dw_1.GetRow()]


IF Messagebox("Change","Num. Recibo : " + ls_branch +'-'+ String(ld_id_receiver)+&
							 "~r~nSender : " + ls_name_sender + &
							 "~r~nReceiver : "  + ls_name_receiver + &
							 "~r~n~r~nDesea cambiar la Información de este giro ?",Question!,YesNo!,1) = 2 then 
	
	Return
END IF

ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	
IF ls_flag = "A" then
	Messagebox("Atención","No se puede cambiar la informacion de un giro anulado.",Exclamation!)
	Return
END IF

IF ls_flag = "P" then
	Messagebox("Atención","No se puede cambiar la informacion de un giro pagado.",Exclamation!)
	Return
END IF

IF ls_flag = "C" THEN
	Messagebox("Atención","No se puede cambiar la informacion de un giro que esta Cancelado.",Exclamation!)
	Return
END IF

IF dw_1.Update()=1 THEN
	dw_1.SetFocus()
	commit ;
	Return
END IF
end event

event ue_suspicious_abreu;string	ls_id_branch, ls_flag, ls_transmitido
Double	ld_id_receiver


IF dw_1.GetRow()<=0 THEN
	MessageBox('IMPRIMIR COPIA DE TRANSMISION','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('IMPRIMIR COPIA DE TRANSMISION','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_id_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	


dw_4.SETTRANSOBJECT(sqlca)

if dw_4.retrieve(ls_id_branch,ld_id_receiver) = 0 then
	return
else
	Printsetup()
	dw_4.print()
	
end if




end event

event ue_referencia;string	ls_id_branch, ls_flag, ls_transmitido, ls_confirmacion, ls_banc_group, ls_payee, ls_referencia  
Double	ld_id_receiver, ld_confirmacion, ld_folio


IF dw_1.GetRow()<=0 THEN
	MessageBox('Retransmit Clave','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('Retransmit Clave','Debe consultar antes de realizar esta operación.')
	Return
END IF

     		SELECT dir_output   
         INTO   :is_output   
         FROM   dba.parametros  ;


ls_id_branch    = dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver  = dw_1.Object.id_receiver[dw_1.GetRow()]
ls_flag         = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_transmitido  = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
ld_confirmacion = dw_1.getitemnumber(dw_1.getrow(),"ref_receiver")
ls_payee        = dw_1.Object.branch_id_main_branch[dw_1.GetRow()]
ls_referencia   = string(dw_1.Object.ref_receiver[dw_1.GetRow()])

if ld_confirmacion = 0 or Isnull(ld_confirmacion) then
	Messagebox("Warning","Invoice Without Confirmation")
	return ;
else
	ls_confirmacion = String(ld_confirmacion)
end if	

string	ls_filename_sql, ls_sql
long		ll_filenum

Double	ld_receiver
			
		
		ld_folio = dw_1.Object.urgency_receiver[dw_1.GetRow()]
	
		If ld_folio <> 0 and Not(Isnull(ld_folio)) then
			ls_confirmacion = String(ld_folio)
			ls_sql = ''		
			ls_filename_sql  = is_output+'SEN'+Fill('0',10 - Len(ls_id_branch))+ls_id_branch+".sql"
			ll_filenum   = FileOpen(ls_filename_sql, LineMode!, Write!, LockWrite!, Append!)
			FileWrite (ll_filenum, 'SET option on_error = CONTINUE;')
			ls_sql  = 'UPDATE receiver SET ref_receiver = '+ls_Confirmacion+' , '
			ls_sql += 'urgency_receiver = '+ls_Confirmacion+ ' '
			ls_sql += 'WHERE ( receiver.id_branch = '+"'"+ls_id_branch + "' )"+" AND"
			ls_sql += '( receiver.id_receiver = '+ string(ld_id_receiver) +' )  ;'
			FileWrite (ll_filenum,ls_sql)
			FileWrite (ll_FileNum,'COMMIT;')
			FileClose (ll_filenum)							
		else
			ls_filename_sql  = is_output+'CON'+Fill('0',10 - Len(ls_id_branch))+ls_id_branch+".sql"
			ll_filenum   = FileOpen(ls_filename_sql, LineMode!, Write!, LockWrite!, Append!)
			FileWrite (ll_filenum, 'SET option on_error = CONTINUE;')
			ls_sql  = 'UPDATE receiver SET ref_receiver = '+ls_referencia+' , '
			ls_sql += 'urgency_receiver = '+ls_Confirmacion+ ' '
			ls_sql += 'WHERE ( receiver.id_branch = '+"'"+ls_id_branch + "' )"+" AND"
			ls_sql += '( receiver.id_receiver = '+ string(ld_id_receiver) +' )  ;'
			FileWrite (ll_filenum,ls_sql)
			FileWrite (ll_FileNum,'COMMIT;')
			FileClose (ll_filenum)		
		end if	
			
			
			
			
Messagebox("Generate Clave","Finish")			
			
end event

event ue_suspicious_bancomer;string	ls_id_branch, ls_flag, ls_transmitido
Double	ld_id_receiver


IF dw_1.GetRow()<=0 THEN
	MessageBox('IMPRIMIR COPIA DE TRANSMISION','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('IMPRIMIR COPIA DE TRANSMISION','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_id_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	


dw_5.SETTRANSOBJECT(sqlca)

if dw_5.retrieve(ls_id_branch,ld_id_receiver) = 0 then
	return
else
	Printsetup()
	dw_5.print()
	
end if




end event

event ue_retransmit_cancelados();String	ls_id_branch, ls_name_branch, ls_name_sender, ls_address_sender, ls_city,   &
         ls_id_country, ls_type_id_sender, ls_number_id_sender,  ls_payment,   &
         ls_curreny, ls_id_flag_receiver, ls_id_city_receiver, ls_id_state_receiver,   &
         ls_id_country_receiver, ls_branch_pay_receiver, ls_id_cashier, ls_name_receiver,   &
         ls_address_receiver, ls_phone1_receiver, ls_phone2_receiver, ls_zip_receiver,   &
         ls_notes_receiver, ls_recomend_receiver, ls_mode_pay_receiver, ls_acc_receiver,  & 
			ls_mod_pay_currency, ls_trans_receiver, ls_bank_receiver, ls_state, ls_sql, ls_filename, &
			ls_fecha, ls_hora, ls_tmp, ls_tmp1, ls_modem, ls_branch_old, ls_fileline, ls_tollfree, ls_pinnumber

Double	ld_sender, ld_branch, ld_phone1_sender, ld_phone2_sender, ld_zip_sender, ld_id_sender, ld_receiver,  ld_net_amount_receiver,   &
         ld_rate_change_receiver, ld_telex_receiver, ld_urgency_receiver, ld_exchange_receiver, ld_handling_receiver,   &
         ld_total_receiver, ld_porc_comision_receiver, ld_total_pay_receiver, ld_exchange_company, ld_telex_company,   &
         ld_ref_receiver, ld_total_diference, ld_total_modo_pago, ld_commission_payee, ld_referencia, ld_batch, ld_total_modo_pago_comp, ld_cancelado

Datetime 		ld_date_receiver , ld_fecha,lt_time_receiver

time lt_time_receiver1
date	ld_date_receiver1

Integer	li_file, li_file2
Long		ll_num_inv, ll_tot_inv=0, LL_POS, ll_filenum1
String	ls_grupo, ls_grupo_batch, ls_file_schedule

double	ld_fee_rate = 0


string	ls_branch
Date		ld_date
Time		lt_hour
long		ll_cont, ll_filenum
string	ls_flag, ls_date, ls_time




IF dw_1.GetRow()<=0 THEN
	MessageBox('Retransmit Clave','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('Retransmit Clave','Debe consultar antes de realizar esta operación.')
	Return
END IF

     		SELECT dba.parametros.dir_output   
         INTO :is_output   
         FROM dba.parametros  ;

	
is_output = trim(is_output)	

ls_branch    = dw_1.Object.id_branch[dw_1.GetRow()]
ld_receiver  = dw_1.Object.id_receiver[dw_1.GetRow()]
ls_flag         = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")



if ls_flag <> 'C' then
	Messagebox("Verificar","Invoice no Cancelado")
	Return
end if

	if ld_receiver > 0 then
		ld_receiver = ld_receiver * -1
	end if

	ld_fee_rate = 0
							///// Seleccionar los datos del Invoice/ ////////////
			
							//DON (04/13/2015) - PERFORMANCE TUNING.  ***********************
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
					    FROM dba.receiver  WITH	(NOLOCK)
   					WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         					( dba.receiver.id_receiver = :ld_receiver )   ;
					//*****************************************************
				
							
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
		ls_branch_pay_receiver+"','"+ls_id_cashier+"','"+ls_name_receiver+"','"+ls_address_receiver+"','" + &
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
							


//messagebox('Final','')
end event

event ue_print_recibo_matriz;string	ls_id_branch, ls_flag, ls_transmitido
Double	ld_id_receiver


IF dw_1.GetRow()<=0 THEN
	MessageBox('IMPRIMIR COPIA DE TRANSMISION','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('IMPRIMIR COPIA DE TRANSMISION','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_id_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	


dw_6.SETTRANSOBJECT(sqlca)

if dw_6.retrieve(ls_id_branch,ld_id_receiver) = 0 then
	return
else
	Printsetup()
	dw_6.print()
end if




end event

event ue_history_invoice;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido, ls_name_sender, ls_name_receiver
Double	ld_id_receiver, ld_sender

IF dw_1.GetRow()<=0 THEN
	MessageBox('History','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('History','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ld_sender=dw_1.Object.sender_id_sender[dw_1.GetRow()]

gl_receiver_cons = ld_id_receiver
gs_branch_insta_cons = ls_branch

Openwithparm(w_rep_history_invoice,ld_sender)

end event

event ue_asignar_pin;long		ll_cont
string	ls_branch, ls_flag, ls_pin, ls_tollfree
Double	ld_sender, ld_receiver

ld_sender	=	0
ls_pin      = ''
ld_sender   = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ls_branch   = dw_1.getitemstring(dw_1.getrow(),"id_branch")
ld_receiver = dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
ls_tollfree	= dw_1.getitemstring(dw_1.getrow(),"receiver_toll_free")
ls_pin		= dw_1.getitemstring(dw_1.getrow(),"receiver_pin_number")

//if ls_pin <> '' then 
//	Messagebox("Warning","Invoice has a PIN")  
//	return
//end if
//
//if len(ls_pin) > 9 then
//	Messagebox("Warning","Invoice has a PIN..")  
//	return
//end if

if ld_sender = 0 then
	return
end if
 
	ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")

	if ls_flag = "A" then
		Messagebox("Warning","Invoice Void")  
		return
	end if

	if ls_flag = "C" then
		Messagebox("Warning","Invoice CANCEL")  
		return
	end if
	
	
	 SELECT tollfree.phone  
    INTO :ls_tollfree  
    FROM dba.tollfree tollfree 
   WHERE tollfree.cod_company = '300'   ;
	
	 SELECT DISTINCT MAX(callingcard.pin_number)  
    INTO :ls_pin  
    FROM dba.callingcard callingcard 
    WHERE callingcard.cod_company = '300'  and
	 		 callingcard.flag_trans <> 'T'    and
			 callingcard.flag_uso   <> 'U'  ;


	 dw_1.setitem(dw_1.getrow(),"receiver_toll_free",ls_tollfree)
	 dw_1.setitem(dw_1.getrow(),"receiver_pin_number",ls_pin)

	  UPDATE dba.receiver  
     SET dba.receiver.toll_free = :ls_tollfree,   
         dba.receiver.pin_number = :ls_pin  
   WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         ( dba.receiver.id_receiver = :ld_receiver )   ;
	commit ;
	
	  UPDATE dba.callingcard  
     SET    dba.callingcard.flag_trans = 'T',   
            dba.callingcard.flag_uso = 'U'  
    WHERE ( dba.callingcard.cod_company = '300' ) AND  
          ( dba.callingcard.pin_number = :ls_pin )   ;

		commit ;
		
	Messagebox('Complete',' New Pin Number ')
	
	
	
end event

event ue_cancelacion_bancomer();integer 	Total, i
String	ls_filename,	ls_cadena, ls_comentario, ls_path, ls_opcode_new
long		ll_cont
Double	ld_referencia, ld_receiver, ld_sender, ld_consecutivo, ld_ref_receiver, ld_numbts

Datetime		ld_bts_process_date, ld_date
long		ll_opcode
string	ld_ref_receiver1, ls_branch, ls_flag_receiver, ls_clave_receiver, ls_semilla
Setpointer(Hourglass!)
	dw_1.accepttext()
	

	ld_referencia 				 = dw_1.getitemnumber(dw_1.getrow(),'urgency_receiver')
	ld_ref_receiver1         = string(dw_1.getitemnumber(dw_1.getrow(),'urgency_receiver'))


	IF ld_ref_receiver1 = '' OR ISNULL(ld_ref_receiver1) then
		messagebox("Error","Debe Ingresar la referencia del Invoice que desea Cancelar")
	end if
	
	//DON (04/13/2015) - PERFORMANCE TUNING.  ***********************
	  SELECT dba.RECEIVER.ID_BRANCH,   
            dba.RECEIVER.ID_RECEIVER,   
            dba.RECEIVER.id_flag_receiver, 
			   dba.RECEIVER.URGENCY_RECEIVER
    INTO :ls_branch,   
         :ld_receiver,   
         :ls_flag_receiver,
			:ld_numbts
    FROM dba.RECEIVER
	 INNER JOIN		dba.BRANCH  
	 ON	dba.RECEIVER.BRANCH_PAY_RECEIVER = dba.BRANCH.ID_BRANCH
   WHERE	( dba.BRANCH.ID_MAIN_BRANCH = '6022' ) AND  
         		( dba.RECEIVER.URGENCY_RECEIVER = :ld_referencia )   ;
	//********************************************************

	
			ld_date = datetime(today(),now())
			
			
	IF ls_branch = '' or ISNULL(ls_branch) then
		Messagebox("Error","Invoice Inexistente")
		dw_1.reset()
		Return
	End if
	
	
	
	
	if ls_flag_receiver = 'P'	THEN
		Messagebox("Error","El Invoice se encuentra en estado Pagado")
		Return
	elseif ls_flag_receiver = 'A'	THEN
		Messagebox("Error","El Invoice se encuentra en estado Anulado")
		Return
	END IF
	
	
	if Messagebox("Cancelation","Desea cancelar el Invoice :"+ls_branch+' - '+string(ld_receiver),Question!,YesNo!) = 2 then
		Return ;
	end if		
		
		
	
	
	  INSERT INTO dba.bancomer_cancelacion  
         ( operator,   
           btsconfirmationnumber,   
           branch,   
           receiver,   
           cancelation_type,   
           date_cancelation,   
           time_cancelation,   
           transfer,   
           opcode,   
           opcodestring,   
           referencia,   
           orderstatus,   
           desc_orderstatus,   
           btspocessdate,   
           btspocestime )  
  VALUES ( :gs_cashier,   
           :ld_ref_receiver1,   
           :ls_branch,   
           :ld_receiver,   
           'R',   
           getdate(),   
           getdate(),   
           'N',   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null )  ;

			if sqlca.sqlcode <> 0 then
				messagebox('',sqlca.sqlerrtext)
				rollback ;
				return  ;
			else
				commit ;
			end if
	
	
			

		


		messagebox('Solicitud','Solicitud Procesada')
		
		
		Setpointer(Arrow!)
		
		


		

end event

event ue_solicitud_cancelacion;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido, ls_name_sender, ls_name_receiver
Double	ld_id_receiver, ld_sender

IF dw_1.GetRow()<=0 THEN
	MessageBox('SOLICITUD CANCELACION','Seleccione un giro dando un click sobre el giro deseado e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('SOLICITUD CANCELACION','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_branch=dw_1.Object.id_branch[dw_1.GetRow()]
ld_id_receiver=dw_1.Object.id_receiver[dw_1.GetRow()]
ls_name_sender=dw_1.Object.sender_name_sender[dw_1.GetRow()]
ls_name_receiver=dw_1.Object.name_receiver[dw_1.GetRow()]


IF Messagebox("SOLICITUD CANCELACION","Num. Recibo : " + ls_branch +'-'+ String(ld_id_receiver)+&
							 "~r~nRemitente : " + ls_name_sender + &
							 "~r~nBeneficiario : "  + ls_name_receiver + &
							 "~r~n~r~nDesea Solicitar la Cancelacion de Este Envio ?",Question!,YesNo!,1) = 2 then 
	
	Return
END IF

//ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")
ls_flag = fn_estado_invoice(ls_branch, ld_id_receiver)
ls_transmitido = dw_1.getitemstring(dw_1.getrow(),"trans_receiver")
	
IF ls_flag = "C" then
	Messagebox("Atención","Envia esta Cancelado.",Exclamation!)
	Return
END IF

IF ls_flag = "H" then
	Messagebox("Atención","Envio esta en Hold.",Exclamation!)
	Return
END IF

IF ls_flag = "A" then
	Messagebox("Atención","Envio esta Anulado.",Exclamation!)
	Return
END IF

IF ls_flag = "I" then
	Messagebox("Atención","Envio esta Ingresado.",Exclamation!)
	Return
END IF

IF ls_flag <> "T" then
	Messagebox("Atención","El Envio debe estar en estado Transmitido para Solicitar la Cancelacion.",Exclamation!)
	Return
END IF


ld_sender=dw_1.Object.sender_id_sender[dw_1.GetRow()]
gl_receiver_cons = ld_id_receiver
gs_branch_insta_cons = ls_branch

//Openwithparm(w_solicitud_cancelacion,ld_sender)

dw_1.SetFocus()
end event

event ue_documento();
Double ld_sender_global
INT li_cant_kyc

ld_sender_global = dw_1.getitemnumber(dw_1.getrow(),"sender_id_sender_global")	

SELECT Count(*)  
INTO :li_cant_kyc
FROM dba.KYC_SENDER 
WHERE ID_SENDER_GLOBAL = :ld_sender_global;
	
		


If fileExists("U:\Compliance\Processed\Senders\"+String(ld_sender_global)) OR li_cant_kyc > 0 then
	//	Openwithparm(w_idviewer,string(ld_sender_global))				
	Openwithparm(w_faxcomponent_senderids,"Compliance\Processed\Senders\"+string(ld_sender_global))
	
else		
	Messagebox("","No hay IDs asignados para este cliente!")
end if
		

end event

public subroutine of_create_dblog ();//**************************************** Funcion Log ***************************************************
//
//    Esta funcion se encarga de crear un registro por cada usuario cuando este consulta algun giro
//    El registro es creadoe ne la tabla AUDIT_RECEIVER_QUERY
//   Esto se realiza ejecutando el procedimiento almacenado "sp_audit_receiver_query"
//
//******************************************************************************************************

string  ls_computername, s_id_branch
double d_id_receiver

s_id_branch = dw_1.getitemstring(dw_1.getrow(),'id_branch' )
d_id_receiver = dw_1.getitemnumber(dw_1.getrow(),'id_receiver')
	

	RegistryGet("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName", "ComputerName", RegString!, ls_computername)

	DECLARE sp_audit_receiver_query PROCEDURE FOR dba.spAddAuditReceiverQuery 	
	@ID_Branch = :s_id_branch, 	@ID_Receiver =  :d_id_receiver, @User =:gs_login, @Host =:ls_computername  , @System = 'VIACENTRAL';
	
	
// Execute the store porcedure.
 	EXECUTE  sp_audit_receiver_query ;
end subroutine

public function integer fn_validate_dates ();date ld_fecha_inicio, ld_fecha_fin
integer li_datediff

ld_fecha_inicio = date(em_fec_ini.text)
ld_fecha_fin = date(em_fec_fin.text)

li_datediff = DaysAfter(ld_fecha_inicio, ld_fecha_fin)

IF li_datediff > ii_MaxRangeDaysQInvoice THEN
	messagebox("Error", "Days between Range Dates cannot be grater than " + string(ii_MaxRangeDaysQInvoice) + " days")
	return -1
END IF 

return 1
end function

on w_query_general.create
int iCurrent
call super::create
if this.MenuName = "m_consulta" then this.MenuID = create m_consulta
this.pb_print=create pb_print
this.pb_print2=create pb_print2
this.dw_2=create dw_2
this.cb_hold=create cb_hold
this.cb_complain=create cb_complain
this.cb_void=create cb_void
this.cb_pago=create cb_pago
this.cb_history=create cb_history
this.dw_recibo_matrix=create dw_recibo_matrix
this.dw_recibo=create dw_recibo
this.gb_2=create gb_2
this.gb_1=create gb_1
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.rb_yes=create rb_yes
this.rb_no=create rb_no
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_6=create dw_6
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_motivo_hold=create dw_motivo_hold
this.cb_sentupdate=create cb_sentupdate
this.cb_solutions=create cb_solutions
this.dw_motivo_hold_solutions=create dw_motivo_hold_solutions
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_print
this.Control[iCurrent+2]=this.pb_print2
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.cb_hold
this.Control[iCurrent+5]=this.cb_complain
this.Control[iCurrent+6]=this.cb_void
this.Control[iCurrent+7]=this.cb_pago
this.Control[iCurrent+8]=this.cb_history
this.Control[iCurrent+9]=this.dw_recibo_matrix
this.Control[iCurrent+10]=this.dw_recibo
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.em_fec_ini
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.em_fec_fin
this.Control[iCurrent+17]=this.rb_yes
this.Control[iCurrent+18]=this.rb_no
this.Control[iCurrent+19]=this.dw_3
this.Control[iCurrent+20]=this.dw_4
this.Control[iCurrent+21]=this.dw_5
this.Control[iCurrent+22]=this.dw_6
this.Control[iCurrent+23]=this.cb_1
this.Control[iCurrent+24]=this.cb_2
this.Control[iCurrent+25]=this.dw_motivo_hold
this.Control[iCurrent+26]=this.cb_sentupdate
this.Control[iCurrent+27]=this.cb_solutions
this.Control[iCurrent+28]=this.dw_motivo_hold_solutions
end on

on w_query_general.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.pb_print)
destroy(this.pb_print2)
destroy(this.dw_2)
destroy(this.cb_hold)
destroy(this.cb_complain)
destroy(this.cb_void)
destroy(this.cb_pago)
destroy(this.cb_history)
destroy(this.dw_recibo_matrix)
destroy(this.dw_recibo)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.rb_yes)
destroy(this.rb_no)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_motivo_hold)
destroy(this.cb_sentupdate)
destroy(this.cb_solutions)
destroy(this.dw_motivo_hold_solutions)
end on

event open;call super::open;SELECT numericvalue
INTO :ii_MaxRangeDaysQInvoice
FROM dba.PARAMETERS
WHERE idparameter = "MaxRangeDaysQInvoice";

rb_yes.Event Clicked()

em_fec_ini.text = string(RelativeDate(today(), -7), "mm/dd/yyyy")

em_fec_fin.text = string(today(), "mm/dd/yyyy")

if fn_check_user_role('QFO') <= 0 then
	dw_1.object.b_show_folio.visible = 0
end if	
end event

type dw_1 from w_base_query`dw_1 within w_query_general
integer x = 0
integer y = 0
integer width = 2615
integer height = 1708
string dataobject = "dw_query_invoice"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::sqlpreview;
Integer li_file, li_start, li_end, li_cont, li_iniline, li_endline, li_tot_tab, li_ini, li_fin
String ls_cad, ls_sql, ls_line
Boolean	lb_cad=FALSE

IF fn_validate_dates() = -1 THEN
	pb_clean.Post Event Clicked()
	Return 1
END IF

IF POS(sqlsyntax,'UPDATE')>0 OR POS(sqlsyntax,'update')>0 OR POS(sqlsyntax,'DELETE')>0 or POS(sqlsyntax,'delete')>0 THEN
	Return
END IF

IF NOT lb_ent THEN
	Return
END IF

IF NOT ib_modified THEN
	messageBox("Warning", "Debe ingresar por lo menos un parámetro para la consulta de información")

	
	pb_clean.Post Event Clicked()
	Return 1
END IF


li_start=Pos(sqlsyntax,'(((')
li_end=Pos(sqlsyntax,')))')

IF Pos(sqlsyntax,'where') >0 THEN
	ls_sql = Left(sqlsyntax,Pos(sqlsyntax,'where') - 1)
ELSEIF Pos(sqlsyntax,'WHERE') >0 THEN
	ls_sql = Left(sqlsyntax,Pos(sqlsyntax,'WHERE') - 1)
ELSE
	messageBox("Warning", "Debe ingresar por lo menos un parámetro para la consulta de información")
	pb_clean.Post Event Clicked()
	Return 1
END IF

ls_sql += 'WHERE (('

FOR li_start=Pos(sqlsyntax,'(((') TO li_end
	IF Mid(sqlsyntax,li_start+2,1) = '(' THEN
		li_iniline = li_start + 2
		lb_cad=TRUE
	END IF

	IF Mid(sqlsyntax,li_start+2,1) = ')' AND Mid(sqlsyntax,li_start+3,1) <> ')' THEN
		li_endline = li_start + 2
		ls_cad = Mid(sqlsyntax, li_iniline, li_endline - li_iniline + 1)

		IF pos(ls_cad,')))') > 0 THEN
			ls_cad=Mid(ls_cad,1,len(ls_cad) - 2)
		END IF
		
	   ls_cad = Mid(ls_cad,2,Len(ls_cad) - 1)
		ls_cad = Left(ls_cad,Len(ls_cad) - 1)
		
		ls_line = Left(ls_cad,Pos(ls_cad,"="))
		li_ini=Pos(ls_cad,"'")
		li_fin=Pos(ls_cad,"'",li_ini+1)
		
		IF li_ini>0 AND li_fin>0 THEN //It's a string, or a date or a time

			ls_cad=Mid(ls_cad,li_ini+1,li_fin - li_ini)
			ls_cad=Left(ls_cad,Len(ls_cad)-1)
			ls_cad=Trim(ls_cad)
			IF IsDate(ls_cad) OR (Pos(ls_cad,":") = 3 AND Pos(ls_cad,":",4) = 6) THEN
				// Do not put '%' It's a date
				ls_cad = "'"+ls_cad+"'" 
			ELSE
				ls_cad="'%"+ls_cad+"%'"  // It's a String
				ls_line = Left(ls_line,Len(ls_line) - 1) + " like "
			END IF
		ELSE  // It's a number
			ls_cad = Mid(ls_cad,Pos(ls_cad,"=")+1,Len(ls_cad)-1)
		END IF
		
		ls_sql += '( ' + ls_line + ls_cad + ' ) and '
		

		lb_cad = FALSE
	END IF
NEXT

String ls_tmp

ls_sql = Left(ls_sql,Len(ls_sql)-4)+"))"

IF Pos(is_ori_sql,'where') >0  THEN
	ls_sql = is_ori_sql+ ' and ' + Mid(ls_sql,Pos(ls_sql,'where') + 5,Len(ls_sql) - Pos(ls_sql,'where') + 5)
ELSEIF Pos(is_ori_sql,'WHERE') >0 THEN
	ls_sql = is_ori_sql+ ' and ' + Mid(ls_sql,Pos(ls_sql,'WHERE') + 5,Len(ls_sql) - Pos(ls_sql,'WHERE') + 5)
END IF

ls_tmp=''
FOR li_start=1 TO len(ls_sql)
	IF Mid(ls_sql,li_start,1) = '~~' THEN
		
	ELSE
		ls_tmp+=Mid(ls_sql,li_start,1)
	END IF
NEXT

ls_sql=ls_tmp

is_mod_sql=ls_sql

SetSQLPreview(ls_sql)


IF rb_yes.Checked THEN
	sqlsyntax += " AND ( date_receiver >= '" + String(Date(em_fec_ini.text),'yyyy-mm-dd') + "' AND " +&
					 " date_receiver <= '" + String(RelativeDate(Date(em_fec_fin.text),1),'yyyy-mm-dd') + "' )"
	SetSQLPreview(sqlsyntax)
END IF


end event

event dw_1::clicked;call super::clicked;dw_motivo_hold.reset()
end event

event dw_1::buttonclicked;call super::buttonclicked;if this.rowcount() > 1 then
	
	string s_id_branch, ls_computername
	double d_id_receiver
	
	
	if dw_1.object.b_1 then
		
	of_create_dblog()

	else
	 
	 	if dw_1.object.b_2 then
		
		of_create_dblog()
		else
		
			if dw_1.object.b_3 then
			
			of_create_dblog()
			else
				if dw_1.object.b_4 then
				of_create_dblog()
			
				end if
			end if
     	 end if
 	 end if
end if

string ls_folio, ls_branch
long  li_receiver


if not( row > 0 )  then return

if dwo.name = 'b_show_folio' then 

	ls_branch = dw_1.getitemstring( row, 'id_branch')
	li_receiver = dw_1.getitemnumber( row, 'id_receiver')

	if not( li_receiver <> 0 )  then return

	
	ls_folio = fn_show_folio(li_receiver, ls_branch)
	messagebox('Folio / Clave ', 'Folio / Clave : ' + ls_folio )
end if 



end event

event dw_1::constructor;of_SetTransObject(SQLCArpt)
of_setsort(TRUE)
inv_sort.of_SetStyle(1)
dw_1.Object.DataWindow.QueryMode = "yes"

is_ori_sql=	Describe("DataWindow.Table.Select")
end event

type pb_query from w_base_query`pb_query within w_query_general
integer x = 3762
integer y = 144
integer taborder = 0
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "&Consultar"
end type

event pb_query::clicked;call super::clicked;	dw_motivo_hold.reset()
	
	if dw_1.rowcount() > 0 then
		of_create_dblog()
	end if
end event

type pb_exit from w_base_query`pb_exit within w_query_general
integer x = 3762
integer y = 1308
integer taborder = 0
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "&Salir"
end type

type st_count from w_base_query`st_count within w_query_general
integer x = 2624
integer y = 536
integer width = 558
string facename = "Tahoma"
long textcolor = 0
long backcolor = 80269524
borderstyle borderstyle = stylebox!
end type

type pb_clean from w_base_query`pb_clean within w_query_general
boolean visible = false
integer x = 3762
integer y = 40
integer taborder = 240
string text = "&Limpiar"
end type

event pb_clean::clicked;call super::clicked;rb_yes.Event Clicked()
rb_yes.checked = TRUE
end event

type pb_pick from w_base_query`pb_pick within w_query_general
integer x = 3753
integer y = 476
integer taborder = 220
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type pb_sort from w_base_query`pb_sort within w_query_general
integer x = 3744
integer y = 344
integer taborder = 230
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "&Ordenar"
end type

type pb_print from u_pb within w_query_general
boolean visible = false
integer x = 3771
integer y = 1056
integer height = 100
integer taborder = 20
boolean bringtotop = true
string text = "Imprimir Uno"
boolean cancel = true
end type

event clicked;Event ue_print_one()
end event

type pb_print2 from u_pb within w_query_general
boolean visible = false
integer x = 3762
integer y = 1160
integer height = 100
integer taborder = 40
boolean bringtotop = true
string text = "Imprimir Todos"
boolean cancel = true
end type

event clicked;Event ue_print_all()
end event

type dw_2 from datawindow within w_query_general
boolean visible = false
integer x = 3314
integer y = 1116
integer width = 663
integer height = 540
integer taborder = 60
boolean bringtotop = true
boolean titlebar = true
string title = "Reportes"
string dataobject = "dw_rep_query"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_hold from commandbutton within w_query_general
boolean visible = false
integer x = 3771
integer y = 468
integer width = 352
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Hold"
end type

event clicked;Parent.Event ue_hold()

end event

type cb_complain from commandbutton within w_query_general
boolean visible = false
integer x = 3762
integer y = 952
integer width = 352
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mensajes"
end type

event clicked;Parent.Event ue_reclamo()

end event

type cb_void from commandbutton within w_query_general
boolean visible = false
integer x = 3762
integer y = 704
integer width = 352
integer height = 100
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anular"
end type

event clicked;Parent.Event ue_anulacion()

end event

type cb_pago from commandbutton within w_query_general
boolean visible = false
integer x = 3767
integer y = 812
integer width = 357
integer height = 100
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Con/Reg Pago"
end type

event clicked;Event ue_pago()
end event

type cb_history from commandbutton within w_query_general
boolean visible = false
integer x = 3762
integer y = 1448
integer width = 352
integer height = 100
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Historia"
end type

event clicked;Parent.Event ue_history()

end event

type dw_recibo_matrix from datawindow within w_query_general
boolean visible = false
integer x = 2775
integer y = 68
integer width = 494
integer height = 360
integer taborder = 250
boolean bringtotop = true
string dataobject = "dw_recibo_dot_matrix_gloria"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_recibo from datawindow within w_query_general
boolean visible = false
integer x = 2862
integer y = 528
integer width = 494
integer height = 360
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_recibo_gloria"
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type gb_2 from groupbox within w_query_general
integer x = 2624
integer y = 16
integer width = 558
integer height = 212
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Query by Dates"
end type

type gb_1 from groupbox within w_query_general
integer x = 2624
integer y = 236
integer width = 558
integer height = 296
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Range Dates"
end type

type em_fec_ini from editmask within w_query_general
integer x = 2802
integer y = 324
integer width = 361
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
boolean spin = true
end type

event constructor;this.text=String(Today(),'mm/dd/yyyy')

end event

event modified;fn_validate_dates()
end event

type st_1 from statictext within w_query_general
integer x = 2642
integer y = 332
integer width = 160
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "From :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_query_general
integer x = 2638
integer y = 420
integer width = 160
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "To :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_query_general
integer x = 2807
integer y = 408
integer width = 361
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
boolean spin = true
end type

event constructor;this.text=String(Today(),'mm/dd/yyyy')
end event

event modified;fn_validate_dates()
end event

type rb_yes from radiobutton within w_query_general
integer x = 2697
integer y = 104
integer width = 197
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Yes"
boolean checked = true
end type

event clicked;em_fec_ini.enabled = TRUE
em_fec_fin.enabled = TRUE

end event

type rb_no from radiobutton within w_query_general
integer x = 2930
integer y = 104
integer width = 197
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "No"
end type

event clicked;em_fec_ini.enabled = FALSE
em_fec_fin.enabled = FALSE
end event

type dw_3 from datawindow within w_query_general
boolean visible = false
integer x = 3433
integer y = 604
integer width = 603
integer height = 1088
integer taborder = 140
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_print_envio_fax_unificado"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_query_general
boolean visible = false
integer x = 3314
integer y = 796
integer width = 494
integer height = 360
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string dataobject = "envios_abreu_y_collado_form"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_query_general
boolean visible = false
integer x = 3237
integer y = 816
integer width = 494
integer height = 360
integer taborder = 190
boolean bringtotop = true
boolean enabled = false
string dataobject = "envios_altos_bancomer"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within w_query_general
boolean visible = false
integer x = 3461
integer y = 732
integer width = 494
integer height = 360
integer taborder = 150
boolean bringtotop = true
string dataobject = "dw_recibo_peru"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_query_general
integer x = 2624
integer y = 688
integer width = 558
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Asignar PIN"
end type

event clicked;long		ll_cont
string	ls_branch, ls_flag, ls_pin, ls_tollfree
Double	ld_sender, ld_receiver

ld_sender	=	0
ls_pin      = ''
ld_sender   = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ls_branch   = dw_1.getitemstring(dw_1.getrow(),"id_branch")
ld_receiver = dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
ls_tollfree	= dw_1.getitemstring(dw_1.getrow(),"receiver_toll_free")
ls_pin		= dw_1.getitemstring(dw_1.getrow(),"receiver_pin_number")

//if ls_pin <> '' then 
//	Messagebox("Warning","Invoice has a PIN")  
//	return
//end if
//
//if len(ls_pin) > 9 then
//	Messagebox("Warning","Invoice has a PIN..")  
//	return
//end if

if ld_sender = 0 then
	return
end if
 
	ls_flag = dw_1.getitemstring(dw_1.getrow(),"id_flag_receiver")

	if ls_flag = "A" then
		Messagebox("Warning","Invoice Void")  
		return
	end if

	if ls_flag = "C" then
		Messagebox("Warning","Invoice CANCEL")  
		return
	end if
	
	
	 SELECT tollfree.phone  
    INTO   :ls_tollfree  
    FROM   dba.tollfree tollfree 
   WHERE   tollfree.cod_company = '300'   ;
	
	 SELECT DISTINCT MAX(callingcard.pin_number)  
    INTO  :ls_pin  
    FROM  dba.callingcard callingcard 
    WHERE callingcard.cod_company = '300'  and
	 		 callingcard.flag_trans <> 'T'    and
			 callingcard.flag_uso   <> 'U'  ;


	 dw_1.setitem(dw_1.getrow(),"receiver_toll_free",ls_tollfree)
	 dw_1.setitem(dw_1.getrow(),"receiver_pin_number",ls_pin)

	  UPDATE dba.receiver  
     SET    dba.receiver.toll_free   = :ls_tollfree,   
            dba.receiver.pin_number  = :ls_pin  
   WHERE (  dba.receiver.id_branch   = :ls_branch ) AND  
         (  dba.receiver.id_receiver = :ld_receiver )   ;
	commit ;
	
	  UPDATE dba.callingcard  
     SET    dba.callingcard.flag_trans = 'T',   
            dba.callingcard.flag_uso = 'U'  
    WHERE ( dba.callingcard.cod_company = '300' ) AND  
          ( dba.callingcard.pin_number = :ls_pin )   ;

		commit ;
		
	Messagebox('Complete',' New Pin Number ')
	
	
	
end event

type cb_2 from commandbutton within w_query_general
integer x = 2624
integer y = 768
integer width = 558
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Hold Reason"
end type

event clicked;

IF dw_1.GetRow()<=0 THEN
	dw_1.SetFocus()
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	dw_1.SetFocus()
	Return
END IF

string	ls_branch

Double	ld_receiver

	
ls_branch        = dw_1.getitemstring(dw_1.getrow(),"id_branch")
gl_receiver_cons = dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
	
	dw_motivo_hold.reset()
	long		ll_row
	string	ls_motivo_hold	, ls_desc_motivo_hold
	
	
	DECLARE motivo_hold CURSOR FOR
	
   SELECT desc_hold.descripcion   
    FROM  dba.motivo_hold motivo_hold,   
          dba.desc_hold desc_hold 
   WHERE (desc_hold.tipo_hold = motivo_hold.type_motivo_hold ) and  
         ((motivo_hold.id_branch = :ls_branch ) AND  
         ( motivo_hold.id_receiver = :gl_receiver_cons ) )   
   ORDER BY desc_hold.descripcion ASC  ;

	open motivo_hold ;
	
	Fetch motivo_hold  into :ls_motivo_hold ;
	
	DO WHILE sqlca.sqlcode = 0
		ll_row = dw_motivo_hold.insertrow(0)
		dw_motivo_hold.setitem(ll_row,'desc',ls_motivo_hold)
		fetch motivo_hold  into :ls_motivo_hold  ;
	LOOP
	
	Close motivo_hold ;

	
	DECLARE motivo_hold_hist CURSOR FOR
	
   SELECT desc_hold.descripcion   
    FROM  dba.motivo_hold_history motivo_hold,   
          dba.desc_hold desc_hold 
   WHERE (desc_hold.tipo_hold = motivo_hold.type_motivo_hold ) and  
         ((motivo_hold.id_branch = :ls_branch ) AND  
         ( motivo_hold.id_receiver = :gl_receiver_cons ) )   
   ORDER BY desc_hold.descripcion ASC  ;

	open motivo_hold_hist ;
	
	Fetch motivo_hold_hist  into :ls_motivo_hold ;
	
	DO WHILE sqlca.sqlcode = 0
		ll_row = dw_motivo_hold.insertrow(0)
		dw_motivo_hold.setitem(ll_row,'desc',ls_motivo_hold)
		fetch motivo_hold  into :ls_motivo_hold  ;
	LOOP
	
	Close motivo_hold_hist ;

end event

type dw_motivo_hold from datawindow within w_query_general
integer x = 2624
integer y = 848
integer width = 558
integer height = 580
integer taborder = 210
boolean bringtotop = true
string dataobject = "dw_muestra_hold_consulta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean hsplitscroll = true
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type cb_sentupdate from commandbutton within w_query_general
integer x = 2624
integer y = 608
integer width = 558
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Sent Update"
end type

event clicked;string	ls_branch, ls_output , Ls_output1, ls_name_sender, ls_dir_sender, ls_id_sender, ls_tipo_id_sender, ls_sql
Double	ld_receiver, ld_sender, ld_tel1_sender , ld_tel2_sender 
long		ll_FileNum, row

SetPointer(HourGlass!)


  SELECT dba.parametros.dir_output  
    INTO :ls_output  
    FROM dba.parametros  ;
	 
//ls_output = 'C:\'
row = dw_1.GETROW()

if row = 0 then
	Return
end if

///ACTUALIZAR EL SENDER

ls_branch 			= TRIM(dw_1.getitemstring(row,'id_branch'))
ld_sender			= dw_1.getitemnumber(row,'id_sender')
ld_receiver			= dw_1.getitemnumber(row,'id_receiver')
ls_name_sender 	= TRIM(dw_1.getitemstring(row,'sender_name_sender') )
ls_dir_sender  	= TRIM(dw_1.getitemstring(row,'sender_addres_sender'))
ld_tel1_sender    = dw_1.getitemnumber(row,'sender_phone1_sender')
ld_tel2_sender    = dw_1.getitemnumber(row,'sender_phone2_sender')
ls_tipo_id_sender = TRIM(dw_1.getitemstring(row,'sender_id_type_id_sender'))
ls_id_sender      = TRIM(dw_1.getitemstring(row,'sender_number_id_sender'))


if isnull(ls_id_sender) then  ls_id_sender = ''
if isnull(ls_dir_sender) then  ls_dir_sender = ''
if isnull(ld_tel1_sender) then  ld_tel1_sender = 0
if isnull(ld_tel2_sender) then  ld_tel2_sender = 0
if isnull(ls_tipo_id_sender) then  ls_tipo_id_sender = ''
if isnull(ls_id_sender) then  ls_id_sender = ''


//ACTUALIZAR EL RECEIVER \\
string	ls_bank, ls_acc

ls_bank 	= TRIM(dw_1.getitemstring(row,'bank_receiver'))
ls_acc 	= TRIM(dw_1.getitemstring(row,'receiver_acc_receiver'))

if isnull(ls_bank) then  ls_bank = ''
if isnull(ls_acc)  then  ls_acc  = ''

ls_output = TRIM(ls_output)

ls_output1 = ls_output   + "UPG"+FILL('0',10 - LEN(TRIM(ls_branch)))+ls_branch+".sql"
ll_FileNum = FileOpen(ls_output1, LineMode!, Write!, LockWrite!,APPEND!)

if ll_filenum < 0 Then
	Messagebox("Error","You Have To Verificate the Table Parameters")
	Return
end if

ls_sql = "UPDATE sender SET name_sender = '"+ls_name_sender+"',addres_sender = '"+ls_dir_sender+"', phone1_sender = "+string(ld_tel1_sender)+",phone2_sender = "+string(ld_tel2_sender)+",id_type_id_sender = '"+ls_tipo_id_sender+"',number_id_sender = '"+ls_id_sender+"' WHERE ( sender.id_sender = "+string(ld_sender)+" ) AND ( sender.id_branch = '"+ls_branch+"' )   ;"
FileWrite (ll_filenum, ls_sql)
ls_sql =  "UPDATE receiver SET bank_receiver = '"+ls_bank+"',acc_receiver = '"+ls_acc+"' WHERE ( id_receiver = "+string(ld_receiver)+" ) AND ( id_branch = '"+ls_branch+"' )   ;"
FileWrite (ll_filenum, ls_sql) 
  
  fileclose(ll_filenum)
  
  Messagebox('Generado','Actualizacion de Datos')
end event

type cb_solutions from commandbutton within w_query_general
integer x = 2624
integer y = 1436
integer width = 558
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Hold Solutions"
end type

event clicked;

IF dw_1.GetRow()<=0 THEN
	dw_1.SetFocus()
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	dw_1.SetFocus()
	Return
END IF

string	ls_branch

Double	ld_receiver

	
ls_branch        = dw_1.getitemstring(dw_1.getrow(),"id_branch")
gl_receiver_cons = dw_1.getitemnumber(dw_1.getrow(),"id_receiver")
	
	dw_motivo_hold.reset()
	long		ll_row
	string	ls_motivo_hold	, ls_desc_motivo_hold
	
	
	DECLARE motivo_hold CURSOR FOR
	
   SELECT desc_hold.descripcion , motivo_hold_history.desc_motivo_hold  
    FROM  dba.motivo_hold_history motivo_hold_history,   
          dba.desc_hold desc_hold 
   WHERE (desc_hold.tipo_hold = motivo_hold_history.type_motivo_hold ) and  
         ((motivo_hold_history.id_branch = :ls_branch ) AND  
         ( motivo_hold_history.id_receiver = :gl_receiver_cons ) )   
   ORDER BY desc_hold.descripcion ASC  ;

	open motivo_hold ;
	
	Fetch motivo_hold  into :ls_motivo_hold , :ls_desc_motivo_hold  ;
	
	DO WHILE sqlca.sqlcode = 0
		ll_row = dw_motivo_hold_solutions.insertrow(0)
		//dw_motivo_hold.setitem(ll_row,'desc',ls_motivo_hold)
		dw_motivo_hold_solutions.setitem(ll_row,'desc',ls_desc_motivo_hold)
		fetch motivo_hold  into :ls_motivo_hold , :ls_desc_motivo_hold ;
	LOOP
	
	Close motivo_hold ;

	
	
end event

type dw_motivo_hold_solutions from datawindow within w_query_general
integer x = 2624
integer y = 1516
integer width = 558
integer height = 204
integer taborder = 130
boolean bringtotop = true
string dataobject = "dw_muestra_hold_consulta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean hsplitscroll = true
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

