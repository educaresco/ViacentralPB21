$PBExportHeader$w_match_deposit.srw
forward
global type w_match_deposit from window
end type
type cb_1 from commandbutton within w_match_deposit
end type
type cbx_sign from checkbox within w_match_deposit
end type
type st_2 from statictext within w_match_deposit
end type
type st_1 from statictext within w_match_deposit
end type
type dw_1 from datawindow within w_match_deposit
end type
type cbx_1 from checkbox within w_match_deposit
end type
type cb_query from commandbutton within w_match_deposit
end type
type lst_payers from my_ddlb within w_match_deposit
end type
type dw_3 from datawindow within w_match_deposit
end type
type dw_2 from datawindow within w_match_deposit
end type
type gb_1 from groupbox within w_match_deposit
end type
end forward

global type w_match_deposit from window
boolean visible = false
integer x = 923
integer y = 424
integer width = 4626
integer height = 1792
boolean titlebar = true
string title = "Match Unidentified Funds"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
cb_1 cb_1
cbx_sign cbx_sign
st_2 st_2
st_1 st_1
dw_1 dw_1
cbx_1 cbx_1
cb_query cb_query
lst_payers lst_payers
dw_3 dw_3
dw_2 dw_2
gb_1 gb_1
end type
global w_match_deposit w_match_deposit

type variables
string  is_syntax2 ='',is_payer
double  id_row=0
boolean ib_asc1 = true
end variables

on w_match_deposit.create
this.cb_1=create cb_1
this.cbx_sign=create cbx_sign
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.cbx_1=create cbx_1
this.cb_query=create cb_query
this.lst_payers=create lst_payers
this.dw_3=create dw_3
this.dw_2=create dw_2
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cbx_sign,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.cbx_1,&
this.cb_query,&
this.lst_payers,&
this.dw_3,&
this.dw_2,&
this.gb_1}
end on

on w_match_deposit.destroy
destroy(this.cb_1)
destroy(this.cbx_sign)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cbx_1)
destroy(this.cb_query)
destroy(this.lst_payers)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.gb_1)
end on

event open;X=1
Y=1
Show()
setfocus(lst_payers)

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

end event

event key;IF KeyDown(KeyUpArrow!) THEN 
	MessageBox("UP","UP")
END IF

IF dw_2.GetRow() > 0 THEN
	IF KeyDown(KeyUpArrow!) then
		IF dw_2.GetRow() > 1 THEN
			dw_2.SelectRow(0, FALSE)
			dw_2.SelectRow(dw_2.GetRow() - 1, TRUE)
			dw_2.SetRow(dw_2.GetRow() - 1)
			dw_2.ScrollToRow(dw_2.GetRow() - 1)
			Return
		END IF
	ELSEIF KeyDown(KeyDownArrow!) then
		IF dw_2.GetRow() < dw_2.RowCount() THEN
			dw_2.SelectRow(0, FALSE)
			dw_2.SelectRow(dw_2.GetRow()+1, TRUE)
			dw_2.SetRow(dw_2.GetRow()+1)
			dw_2.ScrollToRow(dw_2.GetRow()+1)
			Return
		END IF
	END IF
END IF
end event

type cb_1 from commandbutton within w_match_deposit
integer x = 1879
integer y = 1528
integer width = 443
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Export"
end type

event clicked;dw_2.saveas()

end event

type cbx_sign from checkbox within w_match_deposit
integer x = 841
integer y = 1532
integer width = 686
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Positve Sign"
boolean checked = true
end type

event clicked;
	
dw_1.reset()
dw_2.reset()

cb_query.triggerevent(clicked!)
end event

type st_2 from statictext within w_match_deposit
integer x = 2331
integer y = 1516
integer width = 2267
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_match_deposit
integer x = 2203
integer y = 36
integer width = 2158
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_match_deposit
integer x = 2331
integer y = 116
integer width = 2267
integer height = 1396
integer taborder = 30
string dataobject = "dw_get_match_deposit"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow <> 0 then
	SelectRow(0, FALSE)
	SelectRow(currentrow, TRUE)
	SetRow(currentrow)
end if
end event

event sqlpreview;string ls_sign =' '

if not cbx_sign.checked then
	ls_sign =   " AND   CREDIT_TRANS_DIARIA >= 0  "
else
	ls_sign =   " AND   CREDIT_TRANS_DIARIA <= 0  "
end if

is_syntax2  = ls_sign + is_syntax2
sqlsyntax  += is_syntax2
SetSQLPreview(sqlsyntax)
end event

event doubleclicked;double ld_cons,ld_cons2, d_current_row

if this.rowcount() >0  then
	if id_row <> 0 then

		ld_cons  = dw_2.getitemnumber(id_row,"cons_trans_diaria")
		ld_cons2 = dw_1.getitemnumber(dw_1.getrow(),"cons_trans_diaria")
		
		if cbx_1.checked then // Esta creando un link
			if 2 = messagebox('Warning','Do you want to link transaction # ('+STRING(ld_cons)+') with transaction # ('+string(ld_cons2)+')', question!,yesno!) then
				return;
			else
				setpointer(hourglass!)
				update dba.transaccion_diaria_payee set link_reference = :ld_cons  where cons_trans_diaria = :ld_cons2 and link_reference is null and id_group_trans_diaria = :is_payer;
				if sqlca.sqlcode <> 0 then
					setpointer(arrow!)
					rollback;
					messagebox('Error 1 ', sqlca.sqlerrtext)
					return;
				else 	
					update dba.transaccion_diaria_payee set link_reference = :ld_cons2 where cons_trans_diaria = :ld_cons  and link_reference is null and id_group_trans_diaria = :is_payer;
					if sqlca.sqlcode <> 0 then
						setpointer(arrow!)
						rollback;
						messagebox('Error 1 ', sqlca.sqlerrtext)
						return;
					end if
				end if 		
				d_current_row = dw_2.getrow()
				dw_2.retrieve(is_payer)
				dw_2.scrolltorow(d_current_row)
				dw_2.SelectRow(d_current_row, TRUE)
				//cb_query.triggerevent(clicked!)
				setpointer(arrow!)
			end if 
			
		else // Esta removiendo un link
			
			messagebox('Pendiente', 'Opcion en desarrollo, consulte con tecnologia si requiere ayuda.',StopSign!)
						
//			if 2 = messagebox('Warning','Do you want to REMOVE the link between transaction # ('+STRING(ld_cons)+') and transaction # ('+string(ld_cons2)+')', question!,yesno!) then
//				return;
//			else
//				setpointer(hourglass!)
//				update dba.transaccion_diaria_payee set link_reference = NULL where cons_trans_diaria = :ld_cons2 and link_reference is not null and id_group_trans_diaria = :is_payer;
//				if sqlca.sqlcode <> 0 then
//					setpointer(arrow!)
//					rollback;
//					messagebox('Error 1 ', sqlca.sqlerrtext)
//					return;
//				else 	
//					update dba.transaccion_diaria_payee set link_reference = NULL where cons_trans_diaria = :ld_cons  and link_reference is not null and id_group_trans_diaria = :is_payer;
//					if sqlca.sqlcode <> 0 then
//						setpointer(arrow!)
//						rollback;
//						messagebox('Error 1 ', sqlca.sqlerrtext)
//						return;
//					end if
//				end if 					
//				cb_query.triggerevent(clicked!)
//				setpointer(arrow!)
//			end if 		
		return
		
		end if			
	end if 	
end if 
end event

type cbx_1 from checkbox within w_match_deposit
integer x = 23
integer y = 1532
integer width = 686
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pending Transactions"
boolean checked = true
end type

event clicked;dw_1.reset()
dw_2.reset()

cb_query.triggerevent(clicked!)

end event

type cb_query from commandbutton within w_match_deposit
boolean visible = false
integer x = 1851
integer y = 8
integer width = 325
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;
if CBX_1.checked then
	st_1.text ='POSSIBLE MATCHES (DOUBLE CLICK TO LINK)'
else
	st_1.text ='LINKED TRANSACTIONS (DOUBLE CLICK TO REMOVE LINK)'
end if	

is_payer = lst_payers.getdataid()

dw_2.settransobject(sqlca)
dw_2.retrieve(is_payer)


end event

type lst_payers from my_ddlb within w_match_deposit
integer x = 23
integer y = 12
integer width = 1435
integer height = 788
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;//long 		ll_cont
//String	ls_payer
//
//ls_payer = lst_payers.getdataid()
//
//SELECT count(*) 
//  INTO :ll_cont
//  FROM dba.WIREBANK
// WHERE ID_MAIN_BRANCH = :ls_payer;
// 
//if ll_cont>0 then
////	lst_dest_bank.addquery("SELECT rtrim(bnkName) + ' ('+rtrim(bnkAccount)+')', bnkId FROM dba.WIREBANK WHERE id_main_branch = '"+ls_payer+"' ORDER BY 1")
//else
////	lst_dest_bank.addquery("SELECT 'PLEASE SELECT A PAYER WITH A DEST ACC.', '--'")
//end if

cb_query.triggerevent(Clicked!)
end event

event constructor;call super::constructor;lst_payers.addqueryad("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE name_main_branch like '%UNIDENTIFIED%' ORDER BY name_main_branch;")
end event

type dw_3 from datawindow within w_match_deposit
boolean visible = false
integer x = 1737
integer y = 1524
integer width = 1006
integer height = 748
integer taborder = 70
boolean enabled = false
string dataobject = "dw_printmotivo_hold"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_match_deposit
integer x = 23
integer y = 116
integer width = 2295
integer height = 1396
integer taborder = 20
string dataobject = "dw_match_deposit"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long	ll_row

String	ls_branch
Double	ld_amount, ld_cons
dw_1.settransobject(sqlca)

ll_row = dw_2.GetClickedRow ( )
id_row = ll_row

if row = 0 then row = ll_row

if ll_row =  1 then
	ld_cons = dw_2.getitemnumber(ll_row,"cons_trans_diaria")
	if cbx_1.checked then
		ld_amount  = (dw_2.getitemnumber(ll_row,"credit_trans_diaria")) * -1
		is_syntax2 = 'AND credit_trans_diaria = '+STRING(ld_amount)+' AND LINK_REFERENCE IS NULL;'

	else	
		is_syntax2 = 'AND LINK_REFERENCE = '+STRING(LD_CONS)+';'
	end if	
	dw_1.scrolltorow(row)
	dw_2.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(1, TRUE)
	dw_1.reset()
	dw_1.retrieve(is_payer)
	if cbx_1.checked then
		if dw_1.rowcount() = 0 then
			st_2.text = ' NO POSSIBLE MATCHES FOUND '
		elseif dw_1.rowcount() = 1 then
			st_2.text = ' 1 POSSIBLE MATCH FOUND '
		else	
			st_2.text = string(dw_1.rowcount()) + '  POSSIBLE MATCHES '
		end if 	
	end if 	
	return
elseif ll_row = 0 then
	if CBX_1.checked then
		st_1.text ='POSSIBLE MATCHES'
	else
		st_1.text ='LINKED TRANSACTIONS'
	end if	
	dw_2.SelectRow(0, FALSE)	
	dw_1.SelectRow(0, FALSE)	
	dw_1.reset()
	Return
else
	ld_cons 		= dw_2.getitemnumber(ll_row,"cons_trans_diaria")
	if cbx_1.checked then
		ld_amount  = (dw_2.getitemnumber(ll_row,"credit_trans_diaria")) * -1
		is_syntax2 = 'AND credit_trans_diaria = '+STRING(ld_amount)+' AND LINK_REFERENCE IS NULL;'

	else
		is_syntax2 	= 'AND LINK_REFERENCE = '+STRING(LD_CONS)+';'
	end if	
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	dw_1.reset()
	dw_1.retrieve(is_payer)
	if cbx_1.checked then
		if dw_1.rowcount() = 0 then
			st_2.text = ' NO POSSIBLE MATCHES FOUND '
		elseif dw_1.rowcount() = 1 then
			st_2.text = ' 1 POSSIBLE MATCH FOUND '
		else	
			st_2.text = string(dw_1.rowcount()) + '  POSSIBLE MATCHES '
		end if 	
	end if 	
end if

end event

event doubleclicked;
String ls_Object
string ls_sort,ls_desc
double ld_cons,ld_return,ld_cons_comm,ld_debit
ls_Object = String(dwo.name)

dw_2.SetRedraw(false)
if ib_asc1 then 
	ls_sort = 'D' 
	ib_asc1 = FALSE
else 
	ls_sort = 'A'
	ib_asc1 = TRUE
end if

choose case ls_object
		case 't_1'
			dw_2.SetSort("#1 "+ls_sort)
		case 't_2'
			dw_2.SetSort("#2 "+ls_sort)
		case 't_3'
			dw_2.SetSort("#3 "+ls_sort)
		case 't_4'
			dw_2.SetSort("#4 "+ls_sort)
		case 't_5'
			dw_2.SetSort("#5 "+ls_sort)
		case else 
			dw_2.SetRedraw(true)
			return
end choose

dw_1.reset()
dw_2.Sort()
dw_2.SetRedraw(true)
if CBX_1.checked then
	st_1.text ='POSSIBLE MATCHES'
else
	st_1.text ='LINKED TRANSACTIONS'
end if	


end event

event rowfocuschanged;if currentrow <> 0 then
	SelectRow(0, FALSE)
	SelectRow(currentrow, TRUE)
	SetRow(currentrow)
end if
end event

event sqlpreview;string ls_add,ls_sign =''

if cbx_sign.checked then
	ls_sign =   " AND   CREDIT_TRANS_DIARIA >= 0  "
else
	ls_sign =   " AND   CREDIT_TRANS_DIARIA <= 0  "
end if

if cbx_1.checked then
	ls_add = ls_sign + " AND link_reference IS NULL; "
else
	ls_add = ls_sign + " AND link_reference IS NOT NULL; "
end if 

sqlsyntax += ls_add
SetSQLPreview(sqlsyntax)
end event

event retrieveend;double ld_cons,ld_amount
if this.rowcount() = 0 then
	dw_1.reset()
	return
end if 
   id_row=1
	ld_cons = dw_2.getitemnumber(1,"cons_trans_diaria")
	if cbx_1.checked then
		ld_amount  = (dw_2.getitemnumber(1,"credit_trans_diaria")) * -1
		is_syntax2 = 'AND credit_trans_diaria = '+STRING(ld_amount)+' AND LINK_REFERENCE IS NULL;'

	else	
		is_syntax2 = 'AND LINK_REFERENCE = '+STRING(LD_CONS)+';'
	end if	
	dw_1.scrolltorow(1)
	dw_2.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(1, TRUE)
	dw_1.reset()
	dw_1.retrieve(is_payer)
	if cbx_1.checked then
		if dw_1.rowcount() = 0 then
			st_2.text = ' NO POSSIBLE MATCHES FOUND '
		elseif dw_1.rowcount() = 1 then
			st_2.text = ' 1 POSSIBLE MATCH FOUND '
		else	
			st_2.text = string(dw_1.rowcount()) + '  POSSIBLE MATCHES '
		end if 	
	end if 	
	return
end event

type gb_1 from groupbox within w_match_deposit
boolean visible = false
integer x = 27
integer y = 1492
integer width = 777
integer height = 136
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

