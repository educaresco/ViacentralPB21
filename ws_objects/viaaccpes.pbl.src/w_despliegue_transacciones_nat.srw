$PBExportHeader$w_despliegue_transacciones_nat.srw
forward
global type w_despliegue_transacciones_nat from window
end type
type cb_4 from commandbutton within w_despliegue_transacciones_nat
end type
type cb_fax from commandbutton within w_despliegue_transacciones_nat
end type
type lb_fax from listbox within w_despliegue_transacciones_nat
end type
type cb_3 from commandbutton within w_despliegue_transacciones_nat
end type
type sle_des2 from singlelineedit within w_despliegue_transacciones_nat
end type
type sle_des1 from singlelineedit within w_despliegue_transacciones_nat
end type
type em_1 from editmask within w_despliegue_transacciones_nat
end type
type rb_1 from radiobutton within w_despliegue_transacciones_nat
end type
type cb_conciliar from commandbutton within w_despliegue_transacciones_nat
end type
type cb_2 from commandbutton within w_despliegue_transacciones_nat
end type
type rb_acoount from radiobutton within w_despliegue_transacciones_nat
end type
type rb_date from radiobutton within w_despliegue_transacciones_nat
end type
type dw_2 from datawindow within w_despliegue_transacciones_nat
end type
type cb_print from commandbutton within w_despliegue_transacciones_nat
end type
type cb_select from commandbutton within w_despliegue_transacciones_nat
end type
type cb_1 from commandbutton within w_despliegue_transacciones_nat
end type
type dw_1 from u_dw within w_despliegue_transacciones_nat
end type
type gb_1 from groupbox within w_despliegue_transacciones_nat
end type
end forward

global type w_despliegue_transacciones_nat from window
integer x = 23
integer y = 100
integer width = 3410
integer height = 1992
boolean titlebar = true
string title = "ACCOUNT - TRANSACTIONS"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_4 cb_4
cb_fax cb_fax
lb_fax lb_fax
cb_3 cb_3
sle_des2 sle_des2
sle_des1 sle_des1
em_1 em_1
rb_1 rb_1
cb_conciliar cb_conciliar
cb_2 cb_2
rb_acoount rb_acoount
rb_date rb_date
dw_2 dw_2
cb_print cb_print
cb_select cb_select
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_despliegue_transacciones_nat w_despliegue_transacciones_nat

type variables
string	is_group

Double	id_cons
end variables

event open;long 		ll_row
em_1.text = string(today())

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

is_group = Message.StringParm	

IF dw_1.retrieve(is_group) >0 THEN
	ll_row = dw_1.rowcount()
	dw_1.scrolltorow(ll_row)
	dw_1.SetRow(ll_row)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(ll_row, TRUE)
	dw_1.SetFocus()
	
	//BAD PERFORMANCE
//	cb_conciliar.triggerevent(Clicked!)
	
	
	return
END IF
end event

on w_despliegue_transacciones_nat.create
this.cb_4=create cb_4
this.cb_fax=create cb_fax
this.lb_fax=create lb_fax
this.cb_3=create cb_3
this.sle_des2=create sle_des2
this.sle_des1=create sle_des1
this.em_1=create em_1
this.rb_1=create rb_1
this.cb_conciliar=create cb_conciliar
this.cb_2=create cb_2
this.rb_acoount=create rb_acoount
this.rb_date=create rb_date
this.dw_2=create dw_2
this.cb_print=create cb_print
this.cb_select=create cb_select
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.cb_fax,&
this.lb_fax,&
this.cb_3,&
this.sle_des2,&
this.sle_des1,&
this.em_1,&
this.rb_1,&
this.cb_conciliar,&
this.cb_2,&
this.rb_acoount,&
this.rb_date,&
this.dw_2,&
this.cb_print,&
this.cb_select,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_despliegue_transacciones_nat.destroy
destroy(this.cb_4)
destroy(this.cb_fax)
destroy(this.lb_fax)
destroy(this.cb_3)
destroy(this.sle_des2)
destroy(this.sle_des1)
destroy(this.em_1)
destroy(this.rb_1)
destroy(this.cb_conciliar)
destroy(this.cb_2)
destroy(this.rb_acoount)
destroy(this.rb_date)
destroy(this.dw_2)
destroy(this.cb_print)
destroy(this.cb_select)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event key;IF KeyDown(KeyUpArrow!) THEN 
	MessageBox("UP","UP")
END IF

IF dw_1.GetRow() > 0 THEN
	IF KeyDown(KeyUpArrow!) then
		IF dw_1.GetRow() > 1 THEN
			dw_1.SelectRow(0, FALSE)
			dw_1.SelectRow(dw_1.GetRow() - 1, TRUE)
			dw_1.SetRow(dw_1.GetRow() - 1)
			dw_1.ScrollToRow(dw_1.GetRow() - 1)
			Return
		END IF
	ELSEIF KeyDown(KeyDownArrow!) then
		IF dw_1.GetRow() < dw_1.RowCount() THEN
			dw_1.SelectRow(0, FALSE)
			dw_1.SelectRow(dw_1.GetRow()+1, TRUE)
			dw_1.SetRow(dw_1.GetRow()+1)
			dw_1.ScrollToRow(dw_1.GetRow()+1)
			Return
		END IF
	END IF
END IF
end event

type cb_4 from commandbutton within w_despliegue_transacciones_nat
integer x = 3214
integer y = 1808
integer width = 146
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Filter"
end type

event clicked;long	ll_row
Double ld_debito, ld_credito
datetime	ld_corte

// -----------------------------
// Filter
dw_1.accepttext()

string ls_date
ls_date = em_1.text
dw_1.setfilter(" date(date_trans_diaria) >= date('"+ls_date+"')")
// -----------------------------

ld_corte = datetime(Date(em_1.text),time('23:59:59'))

IF dw_1.retrieve(is_group,Date(em_1.text)) >0 THEN
	
	/// INSERTA LA PRIMERA LINEA CON LOS BALANCES ANTERIORES AL RANGO DE FECHAS
	dw_1.INSERTROW(1)
	dw_1.SETITEM(1,'cons',1)
	dw_1.SETITEM(1,'date_trans_diaria',ld_corte)
	dw_1.SETITEM(1,'id_group_trans_diaria',is_group)//ALEJO
	
	  SELECT SUM(dba.transaccion_diaria_payee_nat.debit_trans_diaria),   
         SUM(dba.transaccion_diaria_payee_nat.credit_trans_diaria)  
     INTO :ld_debito,   
         :ld_credito  
     FROM dba.transaccion_diaria_payee_nat  
     WHERE dba.transaccion_diaria_payee_nat.date_trans_diaria < :ld_corte and
			  dba.transaccion_diaria_payee_nat.id_group_trans_diaria  = :is_group ;
			  
IF (ISNULL(ld_debito)) OR (ISNULL(ld_credito))  then
			Ld_DEBITO=0
			ld_credito=0
		end if

	dw_1.SETITEM(1,'debit_trans_diaria',ld_debito)
	dw_1.SETITEM(1,'credit_trans_diaria',ld_credito)
	
dw_1.SETITEM(1,'des_trans_diaria','BALANCE ANTERIOR A LA FECHA DE CORTE')
dw_1.SETITEM(1,'balance_trans_diaria',ld_debito - ld_credito)
	
//return
END IF


end event

type cb_fax from commandbutton within w_despliegue_transacciones_nat
boolean visible = false
integer x = 2048
integer y = 1808
integer width = 306
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Fax"
end type

event clicked;double ld_cons
ld_cons = dw_1.getitemnumber(dw_1.getrow(),"cons")
lb_fax.reset()
lb_fax.dirlist("u:\accounting\processed\*_"+string(ld_cons)+".tif",0)
if lb_fax.totalitems() > 0 then
	lb_fax.selectitem(1)	
	OpenWithParm(w_faxviewer_view,lb_fax.selecteditem())
end if
end event

type lb_fax from listbox within w_despliegue_transacciones_nat
boolean visible = false
integer x = 2866
integer y = 1476
integer width = 494
integer height = 360
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_despliegue_transacciones_nat
integer x = 3086
integer y = 12
integer width = 274
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update"
end type

event clicked;string	ls_desc2

ls_desc2 = sle_des2.text

UPDATE 	dba.TRANSACCION_DIARIA_PAYEE_NAT
SET 		DESC_TRANS_DIARIA1 = :ls_desc2 
WHERE 	dba.TRANSACCION_DIARIA_PAYEE_NAT.CONS_TRANS_DIARIA = :id_cons;

commit ;


end event

type sle_des2 from singlelineedit within w_despliegue_transacciones_nat
integer x = 1070
integer y = 12
integer width = 2002
integer height = 72
integer taborder = 10
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 99
end type

type sle_des1 from singlelineedit within w_despliegue_transacciones_nat
integer y = 12
integer width = 1061
integer height = 72
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean autohscroll = false
boolean displayonly = true
end type

type em_1 from editmask within w_despliegue_transacciones_nat
integer x = 2894
integer y = 1808
integer width = 315
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type rb_1 from radiobutton within w_despliegue_transacciones_nat
boolean visible = false
integer x = 2693
integer y = 1800
integer width = 210
integer height = 80
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Corte"
boolean righttoleft = true
end type

event clicked;dw_1.dataobject = 'dw_despliegue_transacciones_cortefechas'
dw_1.settransobject(sqlca)

end event

type cb_conciliar from commandbutton within w_despliegue_transacciones_nat
boolean visible = false
integer x = 1733
integer y = 1808
integer width = 306
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Conciliar"
end type

event clicked;// SE INACTIVO X QUE SE ESTA USANDO LA FUNCION ACUMULATIVESUM EN EL DW

//
//long 		ll_rows, i
//Double	ld_credito, ld_debito, ld_final, ld_anterior, ld_balance
//double ld_cons
//
//SetPointer(HourGlass!)
//
//ll_rows = dw_1.rowcount()
//
//FOR i = 1 TO ll_rows
//	
//	if i = 1 then
//		ld_balance = 0
//	else
//		ld_balance = dw_1.getitemnumber(i - 1,"balance_trans_diaria")
//	end if
//
//	ld_debito  = dw_1.getitemnumber(i,"debit_trans_diaria")
//	ld_credito = dw_1.getitemnumber(i,"credit_trans_diaria")
//	ld_final = ld_balance + ld_debito - ld_credito
//	
//	// Optimizacion: Si se hace el update solo cuando es diferente el tiempo es menor
//	if dw_1.getitemnumber(i,"balance_trans_diaria") <> ld_final then
//		dw_1.setitem(i,"balance_trans_diaria",ld_final)
//		dw_1.accepttext()
//	end if	
//	
//NEXT
//
//dw_1.update()
//commit ;
//
//
//
//
//
end event

type cb_2 from commandbutton within w_despliegue_transacciones_nat
integer x = 1417
integer y = 1808
integer width = 306
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Export"
boolean cancel = true
end type

event clicked;dw_1.saveas()
end event

type rb_acoount from radiobutton within w_despliegue_transacciones_nat
integer x = 306
integer y = 1812
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "By Reference"
boolean righttoleft = true
end type

event clicked;dw_1.SetRedraw(false)
dw_1.SetSort("#7 A")
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type rb_date from radiobutton within w_despliegue_transacciones_nat
integer x = 27
integer y = 1812
integer width = 265
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "By Date"
boolean righttoleft = true
end type

event clicked;dw_1.SetRedraw(false)
dw_1.SetSort("#2 A, #9 A")
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type dw_2 from datawindow within w_despliegue_transacciones_nat
boolean visible = false
integer x = 1371
integer y = 508
integer width = 494
integer height = 360
integer taborder = 40
boolean enabled = false
string dataobject = "dw_print_despliegue_transacciones"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_despliegue_transacciones_nat
integer x = 786
integer y = 1808
integer width = 306
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Print"
boolean cancel = true
end type

event clicked;//dw_2.retrieve(is_group)
printsetup()
//dw_2.print()
dw_1.print()
end event

type cb_select from commandbutton within w_despliegue_transacciones_nat
integer x = 1102
integer y = 1808
integer width = 306
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select"
boolean default = true
end type

event clicked;long		ll_row, ll_cont
double	ld_referencia
string	ls_group, ls_concepto_contable = ''
Date		ld_date
Datetime	ld_datetime

SetPointer(HourGlass!)

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
end if

if ll_row <> 0 then
	ls_concepto_contable = TRIM(dw_1.getitemstring(ll_row,"id_concepto_contable"))
		
	if ls_concepto_contable = "DAN" Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_invoices_relacionados_agent,ld_referencia)
		Return
	end if
	
	if ls_concepto_contable = "TPN"  Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_TPN,ld_referencia)
		Return
	end if
	
	if ls_concepto_contable = "CPN"  Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_tpccn,ld_referencia)
		Return
	end if
	
end if
end event

type cb_1 from commandbutton within w_despliegue_transacciones_nat
integer x = 2363
integer y = 1808
integer width = 306
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(parent)
end event

type dw_1 from u_dw within w_despliegue_transacciones_nat
integer y = 96
integer width = 3360
integer height = 1692
integer taborder = 0
string dataobject = "dw_despliegue_transacciones_nat"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;//of_SetTransObject(sqlca) 
//
//of_SetSort(true) 
//
//inv_sort.of_SetStyle(inv_sort.DRAGDROP)
//inv_sort.of_SetColumnNameSource(inv_sort.HEADER)
//inv_sort.of_SetVisibleOnly(true)
//
//inv_sort.of_SetUseDisplay(true)
//of_SetUpdateable(false)
//
//Retrieve(is_name)
end event

event clicked;call super::clicked;String	ls_desc1, ls_desc2

if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
	
	if row <> 0 then
	
		id_cons     = dw_1.getitemnumber(row,"cons")
	
	  	SELECT DES_TRANS_DIARIA,   
            DESC_TRANS_DIARIA1  
     	INTO :ls_desc1,   
          :ls_desc2  
     	FROM dba.TRANSACCION_DIARIA_PAYEE_NAT
     	WHERE CONS_TRANS_DIARIA = :id_cons   ;

		sle_des1.text = ls_desc1
		sle_des2.text = ls_desc2		
		
		lb_fax.reset()
		lb_fax.dirlist("u:\accounting\processed\*_"+string(id_cons)+".tif",0)
		if lb_fax.totalitems() > 0 then
			cb_fax.enabled = true
		else
			cb_fax.enabled = false
		end if


	else
			dw_1.SelectRow(0, FALSE)
			This.SelectRow(1, TRUE)
			SetRow(1)
			return
	end if
	
end if

end event

event doubleclicked;cb_select.triggerevent(clicked!)
end event

event rowfocuschanged;call super::rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, TRUE)
SetRow(currentrow)
end event

event buttonclicked;




//double	ld_cons,   ld_total
//string	ls_concepto
//
//ld_cons     = dw_1.getitemnumber(row,"cons")
//ls_concepto = dw_1.getitemstring(row,"id_concepto_contable")
//
//if ls_concepto <> 'TD' then
//	return
//end if
//
//
// ld_total = 0
//
//  SELECT SUM(net_amount_receiver + exchange_company + telex_company + total_modo_pago_comp + handling_receiver + fee_rate)
//     INTO :ld_total  
//    FROM relacion_invoices_payee,   
//         receiver  
//   WHERE ( relacion_invoices_payee.id_branch_invoice = receiver.id_branch ) and  
//         ( receiver.id_receiver = relacion_invoices_payee.id_receiver ) and  
//         ( ( relacion_invoices_payee.cons_trans_diaria = :ld_cons ) )   ;
//			
//			
//	commit ;
//	
//	  UPDATE transaccion_diaria_payee  
//     SET debit_trans_diaria = :ld_total  
//   WHERE transaccion_diaria_payee.cons_trans_diaria = :ld_cons   ;
//	
//	
//	commit ;
//	commit ;
//	Messagebox('Actualizado','Actualizado Valor')
//
//
end event

type gb_1 from groupbox within w_despliegue_transacciones_nat
integer y = 1772
integer width = 727
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
end type

