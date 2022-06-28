$PBExportHeader$w_receiver_reversestatus.srw
forward
global type w_receiver_reversestatus from w2_master_query_invoice
end type
type cb_reverse from commandbutton within w_receiver_reversestatus
end type
type cbx_inbursa from checkbox within w_receiver_reversestatus
end type
end forward

global type w_receiver_reversestatus from w2_master_query_invoice
integer width = 2770
integer height = 1776
cb_reverse cb_reverse
cbx_inbursa cbx_inbursa
end type
global w_receiver_reversestatus w_receiver_reversestatus

on w_receiver_reversestatus.create
int iCurrent
call super::create
this.cb_reverse=create cb_reverse
this.cbx_inbursa=create cbx_inbursa
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reverse
this.Control[iCurrent+2]=this.cbx_inbursa
end on

on w_receiver_reversestatus.destroy
call super::destroy
destroy(this.cb_reverse)
destroy(this.cbx_inbursa)
end on

type dw_invoice_info from w2_master_query_invoice`dw_invoice_info within w_receiver_reversestatus
end type

type em_clave from w2_master_query_invoice`em_clave within w_receiver_reversestatus
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type st_1 from w2_master_query_invoice`st_1 within w_receiver_reversestatus
end type

type em_invoice from w2_master_query_invoice`em_invoice within w_receiver_reversestatus
end type

type st_6 from w2_master_query_invoice`st_6 within w_receiver_reversestatus
end type

type em_agency from w2_master_query_invoice`em_agency within w_receiver_reversestatus
end type

type cb_query from w2_master_query_invoice`cb_query within w_receiver_reversestatus
end type

event cb_query::clicked;call super::clicked;
cb_reverse.enabled = false
cbx_inbursa.enabled = false
cbx_inbursa.checked = false

if dw_invoice_info.rowcount() = 1 then

	string ls_flag
	
	ls_flag = dw_invoice_info.Object.id_flag_receiver[1] 
	
	if ls_flag = 'P' then
		cb_reverse.enabled = true
		
		// las de Bital y banorte que tiene problemas con Inbursa
		if dw_invoice_info.Object.branch_id_main_branch[1] = 'T049' or dw_invoice_info.Object.branch_id_main_branch[1] = 'T037' or dw_invoice_info.Object.branch_id_main_branch[1] = 'U003' then
			cbx_inbursa.enabled = true
		end if
		
	end if

end if
end event

type gb_1 from w2_master_query_invoice`gb_1 within w_receiver_reversestatus
end type

type cb_reverse from commandbutton within w_receiver_reversestatus
integer x = 1449
integer y = 152
integer width = 1253
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Reverse Payment"
end type

event clicked;
String ls_branch, ls_foliopref, ls_newpayer, ls_clave
Double ld_receiver

SetPointer(HourGlass!)

ls_branch = trim(dw_invoice_info.Object.id_branch[1])
ld_receiver = dw_invoice_info.Object.id_receiver[1] 
ls_clave = trim(dw_invoice_info.Object.receiver_clave_receiver[1])

If messagebox("Confirmacion","Esta seguro que desea reversar el pago de la orden "+ls_branch+"-"+string(ld_receiver)+"?",Question!,YesNo!) = 1 then
	
	
	DECLARE spRevPago PROCEDURE FOR dba.spRevPago @id_branch = :ls_branch, @id_receiver = :ld_receiver;
	Execute spRevPago;	
		
	messagebox("Completed","Operation completed. Result: " + SQLCA.SQLErrText)
	
	
	if cbx_inbursa.enabled = true then
		
		If messagebox("Confirmacion","La orden ya fue reversada, esta seguro que desea enviar la orden nuevamente al pagador original?"+char(10)+char(13)+"OJO! SI LA ORDEN YA FUE PAGADA ESTO PUEDE CAUSAR QUE SE PAGE DOS VECES!",Question!,YesNo!) = 1 then

			// .........................................................................
			// Valores iniciales pero no se deben usar porque el where like no coincide!
			ls_foliopref = 'AEIOUEE'
			ls_newpayer = dw_invoice_info.Object.receiver_id_main_branch_sent[1]
			// .........................................................................
			
			if dw_invoice_info.Object.branch_id_main_branch[1] = 'T049' then
				
				// Determina porque camino de HSBC se debe ir, depende del prefijo del folio
				if left(ls_clave,4) = '4033' then
					ls_foliopref = '4033%'
					ls_newpayer = 'T049'
				elseif left(ls_clave,4) = '4072' then
					ls_foliopref = '4072%'
					ls_newpayer = 'U003'
				end if
				
			elseif dw_invoice_info.Object.branch_id_main_branch[1] = 'T037' then
				ls_foliopref = '8047%'	
				ls_newpayer = dw_invoice_info.Object.branch_id_main_branch[1] 
			end if
												
			UPDATE dba.receiver 
				SET ref_receiver = 0, trans_receiver = 'N', id_main_branch_sent = :ls_newpayer 
			 WHERE id_branch = :ls_branch 
				AND id_receiver = :ld_receiver 
				AND clave_receiver LIKE :ls_foliopref;
			
			if sqlca.sqlcode <> 0 then
				Messagebox("Error","Error resending the order to the payer! "+SQLCA.SQLErrText)			
			end if		
		
		end if				
				
	end if
	
end if

SetPointer(Arrow!)
end event

type cbx_inbursa from checkbox within w_receiver_reversestatus
integer x = 1449
integer y = 52
integer width = 1742
integer height = 72
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
string text = "Enviar al Banco Original (Si Tuvo problema en Inbursa)"
end type

