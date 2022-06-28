$PBExportHeader$w_despliegue_transacciones.srw
forward
global type w_despliegue_transacciones from window
end type
type st_3 from statictext within w_despliegue_transacciones
end type
type em_to from editmask within w_despliegue_transacciones
end type
type st_2 from statictext within w_despliegue_transacciones
end type
type st_1 from statictext within w_despliegue_transacciones
end type
type cb_4 from commandbutton within w_despliegue_transacciones
end type
type cb_fax from commandbutton within w_despliegue_transacciones
end type
type lb_fax from listbox within w_despliegue_transacciones
end type
type cb_3 from commandbutton within w_despliegue_transacciones
end type
type sle_des2 from singlelineedit within w_despliegue_transacciones
end type
type em_from from editmask within w_despliegue_transacciones
end type
type rb_1 from radiobutton within w_despliegue_transacciones
end type
type cb_2 from commandbutton within w_despliegue_transacciones
end type
type rb_acoount from radiobutton within w_despliegue_transacciones
end type
type rb_date from radiobutton within w_despliegue_transacciones
end type
type dw_2 from datawindow within w_despliegue_transacciones
end type
type cb_print from commandbutton within w_despliegue_transacciones
end type
type cb_select from commandbutton within w_despliegue_transacciones
end type
type cb_1 from commandbutton within w_despliegue_transacciones
end type
type dw_1 from u_dw within w_despliegue_transacciones
end type
type gb_1 from groupbox within w_despliegue_transacciones
end type
type gb_2 from groupbox within w_despliegue_transacciones
end type
end forward

global type w_despliegue_transacciones from window
integer x = 23
integer y = 100
integer width = 3630
integer height = 2016
boolean titlebar = true
string title = "ACCOUNT - TRANSACTIONS"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_3 st_3
em_to em_to
st_2 st_2
st_1 st_1
cb_4 cb_4
cb_fax cb_fax
lb_fax lb_fax
cb_3 cb_3
sle_des2 sle_des2
em_from em_from
rb_1 rb_1
cb_2 cb_2
rb_acoount rb_acoount
rb_date rb_date
dw_2 dw_2
cb_print cb_print
cb_select cb_select
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_despliegue_transacciones w_despliegue_transacciones

type variables
String		is_group
Double	id_cons
end variables

event open;long 		ll_row
em_from.text = '2000/01/01'
em_to.text = string(today())

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
	
	//BAD PERFORMANCE
	//cb_conciliar.triggerevent(Clicked!)

	return
END IF
end event

on w_despliegue_transacciones.create
this.st_3=create st_3
this.em_to=create em_to
this.st_2=create st_2
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_fax=create cb_fax
this.lb_fax=create lb_fax
this.cb_3=create cb_3
this.sle_des2=create sle_des2
this.em_from=create em_from
this.rb_1=create rb_1
this.cb_2=create cb_2
this.rb_acoount=create rb_acoount
this.rb_date=create rb_date
this.dw_2=create dw_2
this.cb_print=create cb_print
this.cb_select=create cb_select
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.em_to,&
this.st_2,&
this.st_1,&
this.cb_4,&
this.cb_fax,&
this.lb_fax,&
this.cb_3,&
this.sle_des2,&
this.em_from,&
this.rb_1,&
this.cb_2,&
this.rb_acoount,&
this.rb_date,&
this.dw_2,&
this.cb_print,&
this.cb_select,&
this.cb_1,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_despliegue_transacciones.destroy
destroy(this.st_3)
destroy(this.em_to)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_fax)
destroy(this.lb_fax)
destroy(this.cb_3)
destroy(this.sle_des2)
destroy(this.em_from)
destroy(this.rb_1)
destroy(this.cb_2)
destroy(this.rb_acoount)
destroy(this.rb_date)
destroy(this.dw_2)
destroy(this.cb_print)
destroy(this.cb_select)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
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

type st_3 from statictext within w_despliegue_transacciones
integer x = 14
integer y = 1736
integer width = 389
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "Long Description:"
boolean focusrectangle = false
end type

type em_to from editmask within w_despliegue_transacciones
integer x = 759
integer y = 44
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

type st_2 from statictext within w_despliegue_transacciones
integer x = 658
integer y = 56
integer width = 146
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "To:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_despliegue_transacciones
integer x = 91
integer y = 56
integer width = 192
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "From:"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_despliegue_transacciones
integer x = 1184
integer y = 36
integer width = 325
integer height = 88
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
datetime	ld_date_from, ld_date_to


ld_date_from = datetime(Date(em_from.text),time('00:00:00'))
ld_date_to = datetime(RelativeDate(Date(em_to.text),1),time('00:00:00'))


// -----------------------------
// Filter
dw_1.accepttext()
dw_1.setfilter(" date(date_trans_diaria) >= date('"+string(ld_date_from,'mm/dd/yyyy')+"') and date(date_trans_diaria) < date('"+string(ld_date_to,'mm/dd/yyyy')+"')")
//messagebox(""," date(date_trans_diaria) >= date('"+string(ld_date_from,'mm/dd/yyyy')+"') and date(date_trans_diaria) < date('"+string(ld_date_to,'mm/dd/yyyy')+"')")
// -----------------------------


IF dw_1.retrieve(is_group) >0 THEN
	
	/// INSERTA LA PRIMERA LINEA CON LOS BALANCES ANTERIORES AL RANGO DE FECHAS
	dw_1.INSERTROW(1)
	dw_1.SETITEM(1,'cons',1)
	dw_1.SETITEM(1,'date_trans_diaria',ld_date_from)
	dw_1.SETITEM(1,'id_group_trans_diaria',is_group)//ALEJO
	
	SELECT SUM(dba.transaccion_diaria_payee.debit_trans_diaria),   
	SUM(dba.transaccion_diaria_payee.credit_trans_diaria)  
	INTO :ld_debito,   
	:ld_credito  
	FROM dba.transaccion_diaria_payee  
	WHERE dba.transaccion_diaria_payee.date_trans_diaria < :ld_date_from and
	dba.transaccion_diaria_payee.id_group_trans_diaria  = :is_group ;
			  
	if isnull(ld_debito) then ld_debito=0
	if isnull(ld_credito)  then ld_credito=0
	
	dw_1.SETITEM(1,'debit_trans_diaria',ld_debito)
	dw_1.SETITEM(1,'credit_trans_diaria',ld_credito)
		
	dw_1.SETITEM(1,'des_trans_diaria','PREV. BALANCE / BALANCE ANTERIOR')
	dw_1.SETITEM(1,'balance_trans_diaria',ld_debito - ld_credito)
		
//return
END IF


end event

type cb_fax from commandbutton within w_despliegue_transacciones
integer x = 1765
integer y = 1816
integer width = 325
integer height = 88
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
lb_fax.dirlist("u:\accounting\processed\*_"+string(ld_cons)+".*",0)
if lb_fax.totalitems() > 0 then
	lb_fax.selectitem(1)	
	//OpenWithParm(w_faxviewer_view,lb_fax.selecteditem())
	OpenWithParm(w_faxcomponent_singlefaxviewer,"u:\accounting\processed\"+lb_fax.selecteditem())	
end if
end event

type lb_fax from listbox within w_despliegue_transacciones
boolean visible = false
integer x = 2866
integer y = 1476
integer width = 494
integer height = 360
integer taborder = 10
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

type cb_3 from commandbutton within w_despliegue_transacciones
integer x = 3319
integer y = 1724
integer width = 274
integer height = 76
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

UPDATE dba.TRANSACCION_DIARIA_PAYEE  
SET DESC_TRANS_DIARIA1 = :ls_desc2
WHERE dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA = :id_cons;

commit ;


end event

type sle_des2 from singlelineedit within w_despliegue_transacciones
integer x = 416
integer y = 1724
integer width = 2889
integer height = 72
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

type em_from from editmask within w_despliegue_transacciones
integer x = 279
integer y = 44
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

type rb_1 from radiobutton within w_despliegue_transacciones
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

type cb_2 from commandbutton within w_despliegue_transacciones
integer x = 1440
integer y = 1816
integer width = 325
integer height = 88
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

type rb_acoount from radiobutton within w_despliegue_transacciones
integer x = 311
integer y = 1820
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

type rb_date from radiobutton within w_despliegue_transacciones
integer x = 27
integer y = 1820
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

type dw_2 from datawindow within w_despliegue_transacciones
boolean visible = false
integer x = 1371
integer y = 508
integer width = 494
integer height = 360
integer taborder = 20
boolean enabled = false
string dataobject = "dw_print_despliegue_transacciones"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_despliegue_transacciones
integer x = 791
integer y = 1816
integer width = 325
integer height = 88
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

type cb_select from commandbutton within w_despliegue_transacciones
integer x = 1115
integer y = 1816
integer width = 325
integer height = 88
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
	
//Messagebox("",	ls_concepto_contable)
	
	if ls_concepto_contable = "CCC" or ls_concepto_contable = "CCD" Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_vc,ld_referencia)
		Return		
	end if	
	
	if ls_concepto_contable = "DA" Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_invoices_relacionados_agent,ld_referencia)
		Return
	end if
	
	if ls_concepto_contable = "DP" Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_invoices_relacionados,ld_referencia)
		Return
	end if

	if ls_concepto_contable = "TP"  Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_TP,ld_referencia)
		Return
	end if
	
	if ls_concepto_contable = "CP"  Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_tpcc,ld_referencia)
		Return
	end if
	
	if ls_concepto_contable = "CPE"  Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_tcpe,ld_referencia)
		Return
	end if
	
	if ls_concepto_contable = "CPC"  Then
		
		commit ;
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")


// 06/03/09 EBERNAL inhabilitado por bloqueos.

//		//// Revisa si esta vacio y reconstruye el closing por confirmacion \\\\\\\\
//		  SELECT Count(*)  
//    	  INTO :ll_cont  
//        FROM dba.RELACION_INVOICES_PAYEE  
//        WHERE dba.RELACION_INVOICES_PAYEE.CONS_TRANS_DIARIA = :ld_referencia   ;
//
//
//
//		
//			if ll_cont = 0 then
//				ld_date = dw_1.getitemdate(ll_row,"date_trans_diaria")
//				
//				ld_datetime = datetime(ld_date,now())
//				
//				//messagebox('',is_group)
//				
//				INSERT INTO dba.relacion_invoices_payee  
//      	   ( cons_trans_diaria,   
//           		id_branch_invoice,   
//           		id_receiver,   
//           		date_relacion_diaria,
//					id_concepto_contable  )
//			  SELECT :ld_referencia,   
//						dba.receiver.id_branch,   
//         			dba.receiver.id_receiver,   
//         			:ld_datetime,
//						'CPC'
//    			FROM  dba.branch,   
//         			dba.receiver  
//   			WHERE ( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
//         			( dba.branch.id_main_branch = :is_group ) AND  
//         			( dba.receiver.payment_date >= :ld_date ) AND
//						( dba.receiver.payment_date <= dateadd(dd,1,:ld_date))    AND 
//						( dba.receiver.ref_receiver > 0 ) AND
//						( dba.receiver.id_receiver > 0 ) AND
//         			( dba.receiver.id_flag_receiver in ('T','P','C') ) AND
//			         ( dba.receiver.id_branch+'-'+convert(char(15),dba.receiver.id_receiver)) not in ( select (dba.relacion_invoices_payee.id_branch_invoice+'-'+convert(char(15),dba.relacion_invoices_payee.id_receiver))
//		                                                                           from dba.relacion_invoices_payee
//																										   where (dba.relacion_invoices_payee.id_concepto_contable  = 'CPC' ) and
//																										 		   (dba.receiver.id_receiver = dba.relacion_invoices_payee.id_receiver ) and
//																										 		   (dba.receiver.id_branch = 	dba.relacion_invoices_payee.id_branch_invoice))	;
//
//
//						
//		If sqlca.sqlcode < 0 then
//			rollback;
//			messagebox("Error","SQL Sentence "+sqlca.sqlerrtext)
//			return
//		end if
//				
//		end if
		
		Openwithparm(w_despliegue_transacciones_detalle_cpc,ld_referencia)
		
		Return
	end if
			
	if ls_concepto_contable = "TD" Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_TD,ld_referencia)
		Return
	end if
	
		if  ls_concepto_contable = "AVO" Then
		ld_referencia = dw_1.getitemnumber(ll_row,"cons")
		Openwithparm(w_despliegue_transacciones_detalle_cc,ld_referencia)
		Return
	end if
	
end if
end event

type cb_1 from commandbutton within w_despliegue_transacciones
integer x = 2089
integer y = 1816
integer width = 325
integer height = 88
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

type dw_1 from u_dw within w_despliegue_transacciones
integer y = 152
integer width = 3593
integer height = 1556
integer taborder = 0
string dataobject = "dw_despliegue_transacciones"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

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

		//sle_des1.text = ls_desc1
		sle_des2.text = ls_desc2
		
		
		lb_fax.reset()
		lb_fax.dirlist("u:\accounting\processed\*_"+string(id_cons)+".*",0)
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

type gb_1 from groupbox within w_despliegue_transacciones
integer y = 1780
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

type gb_2 from groupbox within w_despliegue_transacciones
integer width = 3593
integer height = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
end type

