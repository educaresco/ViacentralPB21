$PBExportHeader$w_pagar_invoice_or_consultar.srw
forward
global type w_pagar_invoice_or_consultar from wb_response
end type
type dw_1 from datawindow within w_pagar_invoice_or_consultar
end type
type cb_update from commandbutton within w_pagar_invoice_or_consultar
end type
type cb_close from commandbutton within w_pagar_invoice_or_consultar
end type
type gb_1 from groupbox within w_pagar_invoice_or_consultar
end type
end forward

global type w_pagar_invoice_or_consultar from wb_response
integer x = 379
integer y = 864
integer width = 1294
integer height = 756
string title = "Pay"
long backcolor = 80269524
dw_1 dw_1
cb_update cb_update
cb_close cb_close
gb_1 gb_1
end type
global w_pagar_invoice_or_consultar w_pagar_invoice_or_consultar

type variables
Double	ld_sender
end variables

on w_pagar_invoice_or_consultar.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_update=create cb_update
this.cb_close=create cb_close
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_update
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.gb_1
end on

on w_pagar_invoice_or_consultar.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.gb_1)
end on

event open;call super::open;dw_1.settransobject(sqlca)

ld_sender = message.doubleparm

String ls_payer_manual_payments

ls_payer_manual_payments = 'N'

SELECT isnull(PAYER_MANUAL_PAYMENTS,'N')
INTO :ls_payer_manual_payments
FROM DBA.GROUP_BRANCH, DBA.RECEIVER
WHERE ID_MAIN_BRANCH_SENT = ID_MAIN_BRANCH
AND ID_BRANCH = :gs_branch_insta_cons
AND ID_RECEIVER = :gl_receiver_cons;

if ls_payer_manual_payments = 'N' then
	Messagebox('Error','This payer does not allow manual record of payments',StopSign!)
	close(this)
	return
end if

if dw_1.retrieve(ld_sender,gs_branch_insta_cons,gl_receiver_cons) = 0  then
	dw_1.insertrow(0)
	dw_1.setitem(1,"id_sender",ld_sender)
	dw_1.setitem(1,"id_branch",gs_branch_insta_cons)
	dw_1.setitem(1,"id_receiver",gl_receiver_cons)
	dw_1.setitem(1,"id_cashier",gs_cashier)		
	dw_1.setitem(1,"pago_invoice_pagador",datetime(today(),now()))		
	dw_1.setfocus()
else
//	dw_1.enabled = False
//	cb_update.Visible = False
end if
end event

event close;return dw_1.reset()
end event

event pfc_preclose;return dw_1.reset()
end event

type dw_1 from datawindow within w_pagar_invoice_or_consultar
integer x = 128
integer y = 116
integer width = 1042
integer height = 348
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_pago_invoice_or_consultar"
boolean border = false
boolean livescroll = true
end type

type cb_update from commandbutton within w_pagar_invoice_or_consultar
integer x = 155
integer y = 532
integer width = 512
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
boolean default = true
end type

event clicked;string 	id , ls_branch
Double	ld_receiver
long 		ll_row
datetime	ld_datereceiver, ld_datepayment

dw_1.accepttext()

ll_row = dw_1.getrow()
id = dw_1.getitemstring(ll_row,"cedula_pago_invoice")
ls_branch = dw_1.getitemstring(ll_row,"id_branch")
ld_receiver= dw_1.getitemnumber(ll_row,"id_receiver")

SELECT DATE_RECEIVER
    INTO :ld_datereceiver
   FROM dba.receiver
 WHERE id_branch = :ls_branch
      AND id_receiver = :ld_receiver;

ld_datepayment = dw_1.getitemdatetime(ll_row,"date")

if ld_datepayment < ld_datereceiver or ld_datepayment > datetime(today(),now()) then	
	Messagebox("Error"," La fecha de pago no es valida",StopSign!)
	return
end if


dw_1.setitem(ll_row,"time",dw_1.getitemdatetime(ll_row,"date"))

//messagebox("",string(ld_datepayment, "MM/dd/yyyy hh:mm:ss"))
//return

if trim(id) = '' then
	Messagebox("Error"," Por favor ingrese el numero de identificación",StopSign!)	
	return
end if	
			
if dw_1.update() = 1 then 
	
	INSERT INTO dba.history_invoice ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change )  
	VALUES ( :ls_branch,:ld_receiver,'T','P','ADM',getdate(),getdate() )  ;

else
	
	Messagebox("Error"," Error Update Flag Receiver",StopSign!)
	Rollback ;
	return
	
end if


Messagebox("Confirmacion","Pago Registrado Con Exito")	
Close(Parent)
end event

type cb_close from commandbutton within w_pagar_invoice_or_consultar
integer x = 713
integer y = 532
integer width = 512
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type gb_1 from groupbox within w_pagar_invoice_or_consultar
integer x = 41
integer y = 20
integer width = 1184
integer height = 468
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pago del Envío"
end type

