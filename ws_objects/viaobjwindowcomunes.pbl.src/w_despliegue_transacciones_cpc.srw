$PBExportHeader$w_despliegue_transacciones_cpc.srw
forward
global type w_despliegue_transacciones_cpc from window
end type
type cb_4 from commandbutton within w_despliegue_transacciones_cpc
end type
type cb_3 from commandbutton within w_despliegue_transacciones_cpc
end type
type sle_des2 from singlelineedit within w_despliegue_transacciones_cpc
end type
type sle_des1 from singlelineedit within w_despliegue_transacciones_cpc
end type
type em_1 from editmask within w_despliegue_transacciones_cpc
end type
type rb_1 from radiobutton within w_despliegue_transacciones_cpc
end type
type cb_conciliar from commandbutton within w_despliegue_transacciones_cpc
end type
type rb_acoount from radiobutton within w_despliegue_transacciones_cpc
end type
type rb_date from radiobutton within w_despliegue_transacciones_cpc
end type
type dw_2 from datawindow within w_despliegue_transacciones_cpc
end type
type cb_print from commandbutton within w_despliegue_transacciones_cpc
end type
type cb_select from commandbutton within w_despliegue_transacciones_cpc
end type
type cb_1 from commandbutton within w_despliegue_transacciones_cpc
end type
type dw_1 from u_dw within w_despliegue_transacciones_cpc
end type
type gb_1 from groupbox within w_despliegue_transacciones_cpc
end type
end forward

global type w_despliegue_transacciones_cpc from window
integer x = 23
integer y = 100
integer width = 3323
integer height = 1992
boolean titlebar = true
string title = "ACCOUNT - TRANSACTIONS"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_4 cb_4
cb_3 cb_3
sle_des2 sle_des2
sle_des1 sle_des1
em_1 em_1
rb_1 rb_1
cb_conciliar cb_conciliar
rb_acoount rb_acoount
rb_date rb_date
dw_2 dw_2
cb_print cb_print
cb_select cb_select
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_despliegue_transacciones_cpc w_despliegue_transacciones_cpc

type variables
string	is_group

Double	id_cons
end variables

event open;//////////////////////////////////////////
//X=1
//Y=1
//Show()
//long 		ll_row
//string	ls_cadena
//Double	ld_debito,   		&
//         ld_credito
//
//
//dw_1.settransobject(sqlca)
//dw_2.settransobject(sqlca)
//
//
//is_group = Message.StringParm	
//
//IF dw_1.retrieve(is_group,gd_date1,gd_date2) >0 THEN
//	
//	/// INSERTA LA PRIMERA LINEA CON LOS BALANCES ANTERIORES AL RANGO DE FECHAS
//	dw_1.INSERTROW(1)
//	dw_1.SETITEM(1,'cons',1)
//	dw_1.SETITEM(1,'date_trans_diaria',gd_date1)
//	dw_1.SETITEM(1,'id_group_trans_diaria',is_group)//ALEJO
//	
//	  SELECT SUM(transaccion_diaria_payee.debit_trans_diaria),   
//         SUM(transaccion_diaria_payee.credit_trans_diaria)  
//     INTO :ld_debito,   
//         :ld_credito  
//     FROM transaccion_diaria_payee  
//     WHERE transaccion_diaria_payee.date_trans_diaria>=DATE( '2003-08-01' ) AND transaccion_diaria_payee.date_trans_diaria < :gd_date1 and
//	        transaccion_diaria_payee.id_concepto_contable not in ('TM','CP') and
//			  transaccion_diaria_payee.id_group_trans_diaria  = :is_group ;
//IF (ISNULL(ld_debito)) OR (ISNULL(ld_credito))  then
//			Ld_DEBITO=0
//			ld_credito=0
//		end if
//
//	dw_1.SETITEM(1,'debit_trans_diaria',ld_debito)
//	dw_1.SETITEM(1,'credit_trans_diaria',ld_credito)
//	
//dw_1.SETITEM(1,'des_trans_diaria','BALANCE ANTERIOR A LA FECHA DE CORTE')
//dw_1.SETITEM(1,'balance_trans_diaria',ld_debito - ld_credito)
//	
////return
//END IF	
//
//	cb_2.triggerevent(Clicked!) //ALEJO
//	ll_row = dw_1.rowcount()
//	dw_1.scrolltorow(ll_row)
//	dw_1.SetRow(ll_row)
//	dw_1.SelectRow(0, FALSE)
//	dw_1.SelectRow(ll_row, TRUE)
//	dw_1.SetFocus()
//	
//
//
/////////////////////////////////////////
long 		ll_row
em_1.text = string(today())

//dw_1.settransobject(sqlca)
//dw_2.settransobject(sqlca)

// 7/3/2018: connects to readonly DB
dw_1.SetTransObject(SQLCArpt)
dw_2.SetTransObject(SQLCArpt)


is_group = Message.StringParm	

IF dw_1.retrieve(is_group) >0 THEN
	ll_row = dw_1.rowcount()
	dw_1.scrolltorow(ll_row)
	dw_1.SetRow(ll_row)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(ll_row, TRUE)
	dw_1.SetFocus()
	cb_conciliar.triggerevent(Clicked!)
	return
END IF
end event

on w_despliegue_transacciones_cpc.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.sle_des2=create sle_des2
this.sle_des1=create sle_des1
this.em_1=create em_1
this.rb_1=create rb_1
this.cb_conciliar=create cb_conciliar
this.rb_acoount=create rb_acoount
this.rb_date=create rb_date
this.dw_2=create dw_2
this.cb_print=create cb_print
this.cb_select=create cb_select
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.sle_des2,&
this.sle_des1,&
this.em_1,&
this.rb_1,&
this.cb_conciliar,&
this.rb_acoount,&
this.rb_date,&
this.dw_2,&
this.cb_print,&
this.cb_select,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_despliegue_transacciones_cpc.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.sle_des2)
destroy(this.sle_des1)
destroy(this.em_1)
destroy(this.rb_1)
destroy(this.cb_conciliar)
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

type cb_4 from commandbutton within w_despliegue_transacciones_cpc
integer x = 1513
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

type cb_3 from commandbutton within w_despliegue_transacciones_cpc
integer x = 3086
integer width = 183
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;string	ls_desc2

	

	ls_desc2 = sle_des2.text
	
	//messagebox('',string(id_cons)+' - '+ls_desc2)

     UPDATE dba.TRANSACCION_DIARIA_PAYEE  
     SET DESC_TRANS_DIARIA1 = :ls_desc2  
     WHERE dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA = :id_cons   ;

    commit ;


end event

type sle_des2 from singlelineedit within w_despliegue_transacciones_cpc
integer x = 1070
integer width = 2002
integer height = 84
integer taborder = 10
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 99
end type

type sle_des1 from singlelineedit within w_despliegue_transacciones_cpc
integer width = 1065
integer height = 84
integer taborder = 30
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
end type

type em_1 from editmask within w_despliegue_transacciones_cpc
integer x = 2930
integer y = 1796
integer width = 343
integer height = 76
integer taborder = 110
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

event losefocus;long	ll_row
Double ld_debito, ld_credito
datetime	ld_corte

ld_corte = datetime(Date(em_1.text),time('23:59:59'))

IF dw_1.retrieve(is_group,Date(em_1.text)) >0 THEN
	
	/// INSERTA LA PRIMERA LINEA CON LOS BALANCES ANTERIORES AL RANGO DE FECHAS
	dw_1.INSERTROW(1)
	dw_1.SETITEM(1,'cons',1)
	dw_1.SETITEM(1,'date_trans_diaria',ld_corte)
	dw_1.SETITEM(1,'id_group_trans_diaria',is_group)//ALEJO
	
	  SELECT SUM(dba.transaccion_diaria_payee.debit_trans_diaria),   
         SUM(dba.transaccion_diaria_payee.credit_trans_diaria)  
     INTO :ld_debito,   
         :ld_credito  
     FROM dba.transaccion_diaria_payee  
     WHERE dba.transaccion_diaria_payee.date_trans_diaria < :ld_corte and
			  dba.transaccion_diaria_payee.id_group_trans_diaria  = :is_group ;
			  
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

type rb_1 from radiobutton within w_despliegue_transacciones_cpc
integer x = 2697
integer y = 1792
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

type cb_conciliar from commandbutton within w_despliegue_transacciones_cpc
integer x = 2139
integer y = 1808
integer width = 306
integer height = 72
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Conciliar"
end type

event clicked;long 		ll_rows, i
Double	ld_credito, ld_debito, ld_final, ld_anterior, ld_balance

ll_rows = dw_1.rowcount()

FOR i = 1 TO ll_rows
	
	if i = 1 then
		ld_balance = 0
	else
		ld_balance = dw_1.getitemnumber(i - 1,"balance_trans_diaria")
	end if

	ld_debito  = dw_1.getitemnumber(i,"debit_trans_diaria")
	ld_credito = dw_1.getitemnumber(i,"credit_trans_diaria")
	ld_final = ld_balance + ld_debito - ld_credito
	dw_1.setitem(i,"balance_trans_diaria",ld_final)
	dw_1.accepttext()

NEXT

//dw_1.update()
//commit ;





end event

type rb_acoount from radiobutton within w_despliegue_transacciones_cpc
integer x = 306
integer y = 1812
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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

type rb_date from radiobutton within w_despliegue_transacciones_cpc
integer x = 37
integer y = 1808
integer width = 265
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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

type dw_2 from datawindow within w_despliegue_transacciones_cpc
boolean visible = false
integer x = 1371
integer y = 508
integer width = 494
integer height = 360
integer taborder = 50
boolean enabled = false
string dataobject = "dw_print_despliegue_transacciones"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_despliegue_transacciones_cpc
integer x = 891
integer y = 1808
integer width = 306
integer height = 72
integer taborder = 80
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

type cb_select from commandbutton within w_despliegue_transacciones_cpc
integer x = 1202
integer y = 1808
integer width = 306
integer height = 72
integer taborder = 60
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


ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_concepto_contable = TRIM(dw_1.getitemstring(ll_row,"id_concepto_contable"))
	
		
	if ls_concepto_contable = "CPC"  Then
		
		commit ;
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		//// Revisa si esta vacio y reconstruye el closing por confirmacion \\\\\\\\
		  SELECT Count(*)  
    	  INTO :ll_cont  
        FROM dba.RELACION_INVOICES_PAYEE  
        WHERE dba.RELACION_INVOICES_PAYEE.CONS_TRANS_DIARIA = :ld_referencia   ;

		
			if ll_cont = 0 then
				ld_datetime = dw_1.getitemdateTIME(ll_row,"date_trans_diaria")
				
				ld_date     = DATE(ld_datetime)
				
				ld_datetime = datetime(ld_date,now())
				
				//messagebox('',is_group)
				
				INSERT INTO dba.relacion_invoices_payee  
      	   ( cons_trans_diaria,   
           		id_branch_invoice,   
           		id_receiver,   
           		date_relacion_diaria,
					id_concepto_contable  )
			  SELECT :ld_referencia,   
						dba.receiver.id_branch,   
         			dba.receiver.id_receiver,   
         			:ld_datetime,
						'CPC'
    			FROM  dba.branch,   
         			dba.receiver  
   			WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         			( dba.branch.id_main_branch = :is_group ) AND  
         			( dba.receiver.payment_date >= :ld_date ) AND
						( dba.receiver.payment_date <= dateadd(dd,1,:ld_date))    AND 
						( dba.receiver.ref_receiver > 0 ) AND
						( dba.receiver.id_receiver > 0 ) AND
         			( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
		                                                                           from dba.relacion_invoices_payee
																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;


						
		If sqlca.sqlcode < 0 then
			rollback;
			messagebox("Error","SQL Sentence   8"+sqlca.sqlerrtext)
			return
		end if
				
		end if
		
		
		
		
		
		
		Openwithparm(w_despliegue_transacciones_detalle_cpc,ld_referencia)
		Return
	end if
	
		
	if ls_concepto_contable = "TD" Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_TD,ld_referencia)
		Return
	end if
	
	if  ls_concepto_contable = "CC" Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_cc,ld_referencia)
		Return
	end if
	
end if
end event

type cb_1 from commandbutton within w_despliegue_transacciones_cpc
integer x = 1824
integer y = 1808
integer width = 306
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(w_despliegue_transacciones_CPC)
end event

type dw_1 from u_dw within w_despliegue_transacciones_cpc
integer y = 100
integer width = 3278
integer height = 1688
integer taborder = 40
string dataobject = "dw_despliegue_transacciones_cpc"
boolean hscrollbar = true
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
	
	  	SELECT dba.TRANSACCION_DIARIA_PAYEE.DES_TRANS_DIARIA,   
            dba.TRANSACCION_DIARIA_PAYEE.DESC_TRANS_DIARIA1  
     	INTO :ls_desc1,   
          :ls_desc2  
     	FROM dba.TRANSACCION_DIARIA_PAYEE  
     	WHERE dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA = :id_cons   ;

		sle_des1.text = ls_desc1
		sle_des2.text = ls_desc2
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

event constructor;call super::constructor;// 7/3/2018: connects to readonly DB
SetTransObject(SQLCArpt)
end event

type gb_1 from groupbox within w_despliegue_transacciones_cpc
integer y = 1772
integer width = 727
integer height = 124
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
end type

