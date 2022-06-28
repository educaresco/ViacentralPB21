$PBExportHeader$w_despliegue_balance.srw
forward
global type w_despliegue_balance from window
end type
type rb_payersdue from radiobutton within w_despliegue_balance
end type
type cb_comm_balance from commandbutton within w_despliegue_balance
end type
type cb_5 from commandbutton within w_despliegue_balance
end type
type cb_4 from commandbutton within w_despliegue_balance
end type
type sle_fixgroup from singlelineedit within w_despliegue_balance
end type
type cb_3 from commandbutton within w_despliegue_balance
end type
type cb_query from commandbutton within w_despliegue_balance
end type
type st_2 from statictext within w_despliegue_balance
end type
type cb_date from commandbutton within w_despliegue_balance
end type
type em_date from u_em within w_despliegue_balance
end type
type cb_id from commandbutton within w_despliegue_balance
end type
type cb_name from commandbutton within w_despliegue_balance
end type
type cb_credit from commandbutton within w_despliegue_balance
end type
type cb_debit from commandbutton within w_despliegue_balance
end type
type cb_balance from commandbutton within w_despliegue_balance
end type
type cb_2 from commandbutton within w_despliegue_balance
end type
type rb_both from radiobutton within w_despliegue_balance
end type
type rb_payees from radiobutton within w_despliegue_balance
end type
type rb_agencies from radiobutton within w_despliegue_balance
end type
type st_1 from statictext within w_despliegue_balance
end type
type dw_1 from u_dw within w_despliegue_balance
end type
type sle_search from singlelineedit within w_despliegue_balance
end type
type cb_recalcular_datedeposit from commandbutton within w_despliegue_balance
end type
type cb_recalcular_state from commandbutton within w_despliegue_balance
end type
type cb_recalcular_balance_poner_en_group from commandbutton within w_despliegue_balance
end type
type cb_select_cpc from commandbutton within w_despliegue_balance
end type
type cb_print_filter from commandbutton within w_despliegue_balance
end type
type cb_select from commandbutton within w_despliegue_balance
end type
type cb_1 from commandbutton within w_despliegue_balance
end type
type gb_1 from groupbox within w_despliegue_balance
end type
type gb_3 from groupbox within w_despliegue_balance
end type
type r_1 from rectangle within w_despliegue_balance
end type
end forward

global type w_despliegue_balance from window
boolean visible = false
integer x = 814
integer y = 424
integer width = 3173
integer height = 1696
boolean titlebar = true
string title = "Balance"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
event ue_balanceprevio ( )
rb_payersdue rb_payersdue
cb_comm_balance cb_comm_balance
cb_5 cb_5
cb_4 cb_4
sle_fixgroup sle_fixgroup
cb_3 cb_3
cb_query cb_query
st_2 st_2
cb_date cb_date
em_date em_date
cb_id cb_id
cb_name cb_name
cb_credit cb_credit
cb_debit cb_debit
cb_balance cb_balance
cb_2 cb_2
rb_both rb_both
rb_payees rb_payees
rb_agencies rb_agencies
st_1 st_1
dw_1 dw_1
sle_search sle_search
cb_recalcular_datedeposit cb_recalcular_datedeposit
cb_recalcular_state cb_recalcular_state
cb_recalcular_balance_poner_en_group cb_recalcular_balance_poner_en_group
cb_select_cpc cb_select_cpc
cb_print_filter cb_print_filter
cb_select cb_select
cb_1 cb_1
gb_1 gb_1
gb_3 gb_3
r_1 r_1
end type
global w_despliegue_balance w_despliegue_balance

type variables
string	is_name
boolean   ib_asc1, ib_asc2, ib_asc3, ib_asc4, ib_asc5, ib_asc6
end variables

event ue_balanceprevio();
SetPointer(HourGlass!)

String ls_type, ls_namebranch, ls_idmainbranch, ls_state, ls_date, ls_payertypeclosing
Long ll_row
Double ld_credit, ld_debit, ld_balance
Boolean lb_custom

lb_custom = false

if rb_both.checked then
	ls_type = "B"
elseif rb_payees.checked then
	ls_type = "P"
elseif rb_payersdue.checked then
	ls_type = "P"
	lb_custom = true
else
	ls_type = "R"
end if


dw_1.reset()

ls_date = em_date.text

DECLARE cur_groups CURSOR FOR
SELECT DISTINCT dba.GROUP_BRANCH.ID_MAIN_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
         dba.GROUP_BRANCH.state_group_branch,
			isnull(dba.group_branch.payer_type_closing,'S')
    FROM dba.GROUP_BRANCH,
         dba.BRANCH
   WHERE ( dba.BRANCH.ID_MAIN_BRANCH = dba.GROUP_BRANCH.ID_MAIN_BRANCH ) and  
         (dba.BRANCH.ID_TYPE_BRANCH = 'A' OR  
          dba.BRANCH.ID_TYPE_BRANCH = :ls_type) OR  
         :ls_type = 'B'   
ORDER BY dba.GROUP_BRANCH.NAME_MAIN_BRANCH ASC;

OPEN cur_groups;
FETCH cur_groups INTO :ls_idmainbranch, :ls_namebranch, :ls_state, :ls_payertypeclosing;
DO WHILE SQLCA.SQLCODE = 0

	ll_row = dw_1.insertrow(0)
	dw_1.SetItem(ll_row,"id_group_trans_diaria",ls_idmainbranch)
	dw_1.SetItem(ll_row,"group_branch_name_main_branch",ls_namebranch)
	dw_1.SetItem(ll_row,"state",ls_state)
	
	if lb_custom then		
		ld_debit = fn_previousbalance_custompayer(ls_idmainbranch,ls_date,"D",ls_payertypeclosing)
		ld_credit = fn_previousbalance_custompayer(ls_idmainbranch,ls_date,"C",ls_payertypeclosing)
		ld_balance = fn_previousbalance_custompayer(ls_idmainbranch,ls_date,"B",ls_payertypeclosing)
		dw_1.SetItem(ll_row,"payer_type_closing",ls_payertypeclosing)	
	else
		ld_debit = fn_previousbalance(ls_idmainbranch,ls_date,"D")
		ld_credit = fn_previousbalance(ls_idmainbranch,ls_date,"C")
		ld_balance = fn_previousbalance(ls_idmainbranch,ls_date,"B")
		dw_1.SetItem(ll_row,"payer_type_closing",'')
	end if	

	dw_1.SetItem(ll_row,"debito_group",ld_debit)	
	dw_1.SetItem(ll_row,"credito_group",ld_credit)	
	dw_1.SetItem(ll_row,"balance_group",ld_balance)		
		
	FETCH cur_groups INTO :ls_idmainbranch, :ls_namebranch, :ls_state, :ls_payertypeclosing;
LOOP
end event

event open;X=1
Y=1
Show()

 string	ls_name_cashier

dw_1.settransobject(sqlca)

em_date.text = (string(today(),"mm/dd/yyyy"))

IF dw_1.retrieve("B") > 0 THEN
	dw_1.Scrolltorow(1)
	dw_1.SetRow(1)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(1, TRUE)
	dw_1.SetFocus()
	return
END IF




end event

on w_despliegue_balance.create
this.rb_payersdue=create rb_payersdue
this.cb_comm_balance=create cb_comm_balance
this.cb_5=create cb_5
this.cb_4=create cb_4
this.sle_fixgroup=create sle_fixgroup
this.cb_3=create cb_3
this.cb_query=create cb_query
this.st_2=create st_2
this.cb_date=create cb_date
this.em_date=create em_date
this.cb_id=create cb_id
this.cb_name=create cb_name
this.cb_credit=create cb_credit
this.cb_debit=create cb_debit
this.cb_balance=create cb_balance
this.cb_2=create cb_2
this.rb_both=create rb_both
this.rb_payees=create rb_payees
this.rb_agencies=create rb_agencies
this.st_1=create st_1
this.dw_1=create dw_1
this.sle_search=create sle_search
this.cb_recalcular_datedeposit=create cb_recalcular_datedeposit
this.cb_recalcular_state=create cb_recalcular_state
this.cb_recalcular_balance_poner_en_group=create cb_recalcular_balance_poner_en_group
this.cb_select_cpc=create cb_select_cpc
this.cb_print_filter=create cb_print_filter
this.cb_select=create cb_select
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_3=create gb_3
this.r_1=create r_1
this.Control[]={this.rb_payersdue,&
this.cb_comm_balance,&
this.cb_5,&
this.cb_4,&
this.sle_fixgroup,&
this.cb_3,&
this.cb_query,&
this.st_2,&
this.cb_date,&
this.em_date,&
this.cb_id,&
this.cb_name,&
this.cb_credit,&
this.cb_debit,&
this.cb_balance,&
this.cb_2,&
this.rb_both,&
this.rb_payees,&
this.rb_agencies,&
this.st_1,&
this.dw_1,&
this.sle_search,&
this.cb_recalcular_datedeposit,&
this.cb_recalcular_state,&
this.cb_recalcular_balance_poner_en_group,&
this.cb_select_cpc,&
this.cb_print_filter,&
this.cb_select,&
this.cb_1,&
this.gb_1,&
this.gb_3,&
this.r_1}
end on

on w_despliegue_balance.destroy
destroy(this.rb_payersdue)
destroy(this.cb_comm_balance)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.sle_fixgroup)
destroy(this.cb_3)
destroy(this.cb_query)
destroy(this.st_2)
destroy(this.cb_date)
destroy(this.em_date)
destroy(this.cb_id)
destroy(this.cb_name)
destroy(this.cb_credit)
destroy(this.cb_debit)
destroy(this.cb_balance)
destroy(this.cb_2)
destroy(this.rb_both)
destroy(this.rb_payees)
destroy(this.rb_agencies)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.sle_search)
destroy(this.cb_recalcular_datedeposit)
destroy(this.cb_recalcular_state)
destroy(this.cb_recalcular_balance_poner_en_group)
destroy(this.cb_select_cpc)
destroy(this.cb_print_filter)
destroy(this.cb_select)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.r_1)
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

type rb_payersdue from radiobutton within w_despliegue_balance
integer x = 869
integer y = 40
integer width = 375
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payers (Due)"
end type

event clicked;////if this.checked then
////	IF dw_1.retrieve("P") > 0 THEN
////		dw_1.Scrolltorow(1)
////		dw_1.SetRow(1)
////		dw_1.SelectRow(0, FALSE)
////		dw_1.SelectRow(1, TRUE)
////		dw_1.SetFocus()
////	END IF
////end if	
//
//if this.checked then
//	datetime ld_date
//	
//	ld_date = datetime(date(em_date.text),time('23:59:59'))
//	
//	if date(em_date.text) >= today() then
//		
//		if date(em_date.text) > today() then
//			Messagebox("Date Error","Future dates are not allowed, Today's balance will be showed",Information!)
//		end if
//
//		dw_1.DataObject = 'dw_despliegue_balance_rapido'
//		dw_1.SetTransObject(SQLCA)
//		IF dw_1.retrieve("P") > 0 THEN
//			dw_1.Scrolltorow(1)
//			dw_1.SetRow(1)
//			dw_1.SelectRow(0, FALSE)
//			dw_1.SelectRow(1, TRUE)
//			dw_1.SetFocus()
//			return
//		END IF	
//				
//	else
//		
////		fn_generatepreviousbalances(string(ld_date,"mm/dd/yyyy"))
////		dw_1.DataObject = 'dw_despliegue_balance_previo_rap'
////		dw_1.SetTransObject(SQLCA)
////		IF dw_1.retrieve("P",ld_date) > 0 THEN
////			dw_1.Scrolltorow(1)
////			dw_1.SetRow(1)
////			dw_1.SelectRow(0, FALSE)
////			dw_1.SelectRow(1, TRUE)
////			dw_1.SetFocus()
////			return
////		END IF	
//			
//	end if
//end if
end event

type cb_comm_balance from commandbutton within w_despliegue_balance
integer x = 1691
integer y = 1472
integer width = 347
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Agent Comm."
end type

event clicked;long		ll_row
double	ld_sender
string	ls_group

setPointer(HourGlass!)

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_group = dw_1.getitemstring(ll_row,"id_group_trans_diaria")
	Openwithparm(w_despliegue_transacciones_comm,ls_group)
end if
end event

type cb_5 from commandbutton within w_despliegue_balance
integer x = 974
integer y = 1472
integer width = 347
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print"
boolean cancel = true
end type

event clicked;printsetup()
dw_1.print()
end event

type cb_4 from commandbutton within w_despliegue_balance
boolean visible = false
integer x = 1673
integer y = 2144
integer width = 539
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&x All Balances"
end type

event clicked;string ls_curr_group, ls_oldtext
 
double ld_debit, ld_credit, ld_balance
string ls_group

If Messagebox("Confirmation","Do you want to recalculate the balances?",Question!,YesNo!) <> 1 Then
	return
end if

SetPointer(HourGlass!)
 
ls_oldtext = this.text 
 
 DECLARE cur_groups CURSOR FOR  
  SELECT ID_MAIN_BRANCH
    FROM dba.GROUP_BRANCH  
   WHERE dba.GROUP_BRANCH.group_type in ('A','R')
	ORDER BY ID_MAIN_BRANCH;

open cur_groups;

fetch cur_groups into :ls_curr_group;

do while SQLCA.SQLCode = 0 
		
	this.text = "Calculating Group "+ls_curr_group
	
		// ----------------------------------------
		// CALCULATING BALANCE
		ls_group = ls_curr_group
				
//		// ++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		// Determina el tipo de closing que lleva el pagador
//		string ls_typeclosing, ls_exclude
//		
//		SELECT PAYER_TYPE_CLOSING 
//		INTO :ls_typeclosing
//		FROM DBA.GROUP_BRANCH
//		WHERE ID_MAIN_BRANCH = :ls_group;
//		
//		IF isnull(ls_typeclosing) or ls_typeclosing = '' then ls_typeclosing = 'S'
//		
//		if  ls_typeclosing = 'S' then
//			ls_exclude = 'CPC' // Closing por pagadas
//		else
//			ls_exclude = 'TP'  // Closing por enviadas
//		end if
//		// ++++++++++++++++++++++++++++++++++++++++++++++++++++++		
		
		SELECT SUM(DBA.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA), 
				 SUM(DBA.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA), 
				 SUM(DBA.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA - DBA.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA) 
		INTO   :ld_debit, :ld_credit, :ld_balance
		FROM   DBA.TRANSACCION_DIARIA_PAYEE
		WHERE  DBA.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA = :ls_group
		AND    DBA.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'PB'
		AND    DBA.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'CPC';
		
		If SQLCA.SQLCode <> 0 then
			//Messagebox("SQL Error "+String(SQLCA.SQLCode),SQLCA.SQLErrText)
		end if
		
		UPDATE DBA.GROUP_BRANCH SET DEBITO_GROUP  = :ld_debit, 
											 CREDITO_GROUP = :ld_credit, 
											 BALANCE_GROUP = :ld_balance 
		FROM   DBA.GROUP_BRANCH GROUP_BRANCH 
		WHERE  GROUP_BRANCH.ID_MAIN_BRANCH = :ls_group;
		
		
		If SQLCA.SQLCode <> 0 then
			//Messagebox("SQL Error "+String(SQLCA.SQLCode),SQLCA.SQLErrText)
		end if
		// ----------------------------------------
	
	
	fetch cur_groups into :ls_curr_group;
loop

close cur_groups;

commit;

this.text = ls_oldtext

SetPointer(Arrow!)

cb_query.triggerevent(Clicked!)


////
//// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
////  CURSOR PARA RECORRER GRUPOS


//string ls_group, ls_oldtext
// 
//ls_oldtext = this.text 
// 
// DECLARE cur_groups CURSOR FOR  
//  SELECT ID_MAIN_BRANCH
//    FROM dba.GROUP_BRANCH  
//   WHERE dba.GROUP_BRANCH.group_type in ('A','R')
//	ORDER BY ID_MAIN_BRANCH;
//
//open cur_groups;
//
//fetch cur_groups into :ls_group;
//
//do while SQLCA.SQLCode = 0 
//		
//	this.text = "Calculating Group "+ls_group
//	
//
//	
//	
//	
//	
//	fetch cur_groups into :ls_group;
//loop
//
//close cur_groups;
//
//commit;	
//
//this.text = ls_oldtext
end event

type sle_fixgroup from singlelineedit within w_despliegue_balance
boolean visible = false
integer x = 731
integer y = 2148
integer width = 210
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_despliegue_balance
boolean visible = false
integer x = 978
integer y = 2144
integer width = 667
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fix Balance in Group Table"
end type

event clicked;double ld_debit, ld_credit, ld_balance
string ls_group


ls_group = sle_fixgroup.text

//// ++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Determina el tipo de closing que lleva el pagador
//string ls_typeclosing, ls_exclude
//
//SELECT PAYER_TYPE_CLOSING 
//INTO :ls_typeclosing
//FROM DBA.GROUP_BRANCH
//WHERE ID_MAIN_BRANCH = :ls_group;
//
//IF isnull(ls_typeclosing) or ls_typeclosing = '' then ls_typeclosing = 'S'
//
//if  ls_typeclosing = 'S' then
//	ls_exclude = 'CPC' // Closing por pagadas
//else
//	ls_exclude = 'TP'  // Closing por enviadas
//end if
//// ++++++++++++++++++++++++++++++++++++++++++++++++++++++

SELECT SUM(DBA.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA), 
       SUM(DBA.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA), 
       SUM(DBA.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA - DBA.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA) 
INTO   :ld_debit, :ld_credit, :ld_balance
FROM   DBA.TRANSACCION_DIARIA_PAYEE
WHERE  DBA.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA = :ls_group
AND    DBA.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'PB'
AND    DBA.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'CPC';

If SQLCA.SQLCode <> 0 then
	Messagebox("SQL Error "+String(SQLCA.SQLCode),SQLCA.SQLErrText)
end if

UPDATE DBA.GROUP_BRANCH SET DEBITO_GROUP  = :ld_debit, 
                            CREDITO_GROUP = :ld_credit, 
                            BALANCE_GROUP = :ld_balance 
FROM   DBA.GROUP_BRANCH GROUP_BRANCH 
WHERE  GROUP_BRANCH.ID_MAIN_BRANCH = :ls_group;


If SQLCA.SQLCode <> 0 then
	Messagebox("SQL Error "+String(SQLCA.SQLCode),SQLCA.SQLErrText)
end if


commit;


If SQLCA.SQLCode <> 0 then
	Messagebox("SQL Error "+String(SQLCA.SQLCode),SQLCA.SQLErrText)
end if
end event

type cb_query from commandbutton within w_despliegue_balance
integer x = 2853
integer y = 36
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;string ls_type

if rb_both.checked then
	ls_type = "B"
elseif rb_payees.checked then
	ls_type = "P"
elseif rb_payersdue.checked then
	ls_type = "D"
else
	ls_type = "R"
end if

datetime ld_date

ld_date = datetime(date(em_date.text),time('23:59:59'))

if date(em_date.text) >= today() and ls_type <> "D" then
	
	if date(em_date.text) > today() then
		Messagebox("Date Error","Future dates are not allowed, Today's balance will be showed",Information!)
	end if

	dw_1.DataObject = 'dw_despliegue_balance_rapido'
	dw_1.SetTransObject(SQLCA)
	IF dw_1.retrieve(ls_type) > 0 THEN
		dw_1.Scrolltorow(1)
		dw_1.SetRow(1)
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(1, TRUE)
		dw_1.SetFocus()
		return
	END IF

else
	
	dw_1.DataObject = 'dw_despliegue_balance_previo_runtm'
	dw_1.SetTransObject(SQLCA)	
	parent.triggerevent("ue_balanceprevio")
	IF dw_1.rowcount() > 0 THEN
		dw_1.Scrolltorow(1)
		dw_1.SetRow(1)
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(1, TRUE)
		dw_1.SetFocus()
		return
	END IF

		
end if

end event

type st_2 from statictext within w_despliegue_balance
integer x = 2162
integer y = 48
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "As Date :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_date from commandbutton within w_despliegue_balance
integer x = 2725
integer y = 36
integer width = 91
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;em_date.Event pfc_DDCalendar()
end event

type em_date from u_em within w_despliegue_balance
integer x = 2414
integer y = 36
integer width = 306
integer height = 84
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type cb_id from commandbutton within w_despliegue_balance
integer x = 91
integer y = 156
integer width = 229
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Id"
end type

event clicked;string ls_sort
dw_1.SetRedraw(false)
if ib_asc1 then 
	ls_sort = 'D' 
	ib_asc1 = FALSE
else 
	ls_sort = 'A'
	ib_asc1 = TRUE
end if
dw_1.SetSort("#1 "+ls_sort)
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type cb_name from commandbutton within w_despliegue_balance
integer x = 329
integer y = 156
integer width = 946
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Name Group"
end type

event clicked;string ls_sort
dw_1.SetRedraw(false)
if ib_asc2 then 
	ls_sort = 'D' 
	ib_asc2 = FALSE
else 
	ls_sort = 'A'
	ib_asc2 = TRUE
end if
dw_1.SetSort("#2 "+ls_sort)
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type cb_credit from commandbutton within w_despliegue_balance
integer x = 1755
integer y = 156
integer width = 457
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Credit"
end type

event clicked;string ls_sort
dw_1.SetRedraw(false)
if ib_asc4 then 
	ls_sort = 'D' 
	ib_asc4 = FALSE
else 
	ls_sort = 'A'
	ib_asc4 = TRUE
end if
dw_1.SetSort("#4 "+ls_sort)
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type cb_debit from commandbutton within w_despliegue_balance
integer x = 1285
integer y = 156
integer width = 462
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Debit"
end type

event clicked;string ls_sort
dw_1.SetRedraw(false)
if ib_asc3 then 
	ls_sort = 'D' 
	ib_asc3 = FALSE
else 
	ls_sort = 'A'
	ib_asc3 = TRUE
end if
dw_1.SetSort("#3 "+ls_sort)
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type cb_balance from commandbutton within w_despliegue_balance
integer x = 2222
integer y = 156
integer width = 411
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Balance"
end type

event clicked;string ls_sort
dw_1.SetRedraw(false)
if ib_asc5 then 
	ls_sort = 'D' 
	ib_asc5 = FALSE
else 
	ls_sort = 'A'
	ib_asc5 = TRUE
end if
dw_1.SetSort("#5 "+ls_sort)
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type cb_2 from commandbutton within w_despliegue_balance
integer x = 2642
integer y = 156
integer width = 201
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "State"
end type

event clicked;string ls_sort
dw_1.SetRedraw(false)
if ib_asc6 then 
	ls_sort = 'D' 
	ib_asc6 = FALSE
else 
	ls_sort = 'A'
	ib_asc6 = TRUE
end if
dw_1.SetSort("#6 "+ls_sort)
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type rb_both from radiobutton within w_despliegue_balance
integer x = 69
integer y = 40
integer width = 210
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Both"
boolean checked = true
end type

event clicked;////if this.checked then
////	IF dw_1.retrieve("A") > 0 THEN
////		dw_1.Scrolltorow(1)
////		dw_1.SetRow(1)
////		dw_1.SelectRow(0, FALSE)
////		dw_1.SelectRow(1, TRUE)
////		dw_1.SetFocus()
////	END IF
////end if	
//
//if this.checked then
//	datetime ld_date
//	
//	ld_date = datetime(date(em_date.text),time('23:59:59'))
//	
//	if date(em_date.text) >= today() then
//		
//		if date(em_date.text) > today() then
//			Messagebox("Date Error","Future dates are not allowed, Today's balance will be showed",Information!)
//		end if
//
//		dw_1.DataObject = 'dw_despliegue_balance_rapido'
//		dw_1.SetTransObject(SQLCA)
//		IF dw_1.retrieve("B") > 0 THEN
//			dw_1.Scrolltorow(1)
//			dw_1.SetRow(1)
//			dw_1.SelectRow(0, FALSE)
//			dw_1.SelectRow(1, TRUE)
//			dw_1.SetFocus()
//			return
//		END IF	
//				
//	else
//		
////		fn_generatepreviousbalances(string(ld_date,"mm/dd/yyyy"))
////		dw_1.DataObject = 'dw_despliegue_balance_previo_rap'
////		dw_1.SetTransObject(SQLCA)
////		IF dw_1.retrieve("B",ld_date) > 0 THEN
////			dw_1.Scrolltorow(1)
////			dw_1.SetRow(1)
////			dw_1.SelectRow(0, FALSE)
////			dw_1.SelectRow(1, TRUE)
////			dw_1.SetFocus()
////			return
////		END IF	
//			
//	end if
//end if
end event

type rb_payees from radiobutton within w_despliegue_balance
integer x = 603
integer y = 40
integer width = 265
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payers"
end type

event clicked;////if this.checked then
////	IF dw_1.retrieve("P") > 0 THEN
////		dw_1.Scrolltorow(1)
////		dw_1.SetRow(1)
////		dw_1.SelectRow(0, FALSE)
////		dw_1.SelectRow(1, TRUE)
////		dw_1.SetFocus()
////	END IF
////end if	
//
//if this.checked then
//	datetime ld_date
//	
//	ld_date = datetime(date(em_date.text),time('23:59:59'))
//	
//	if date(em_date.text) >= today() then
//		
//		if date(em_date.text) > today() then
//			Messagebox("Date Error","Future dates are not allowed, Today's balance will be showed",Information!)
//		end if
//
//		dw_1.DataObject = 'dw_despliegue_balance_rapido'
//		dw_1.SetTransObject(SQLCA)
//		IF dw_1.retrieve("P") > 0 THEN
//			dw_1.Scrolltorow(1)
//			dw_1.SetRow(1)
//			dw_1.SelectRow(0, FALSE)
//			dw_1.SelectRow(1, TRUE)
//			dw_1.SetFocus()
//			return
//		END IF	
//				
//	else
//		
////		fn_generatepreviousbalances(string(ld_date,"mm/dd/yyyy"))
////		dw_1.DataObject = 'dw_despliegue_balance_previo_rap'
////		dw_1.SetTransObject(SQLCA)
////		IF dw_1.retrieve("P",ld_date) > 0 THEN
////			dw_1.Scrolltorow(1)
////			dw_1.SetRow(1)
////			dw_1.SelectRow(0, FALSE)
////			dw_1.SelectRow(1, TRUE)
////			dw_1.SetFocus()
////			return
////		END IF	
//			
//	end if
//end if
end event

type rb_agencies from radiobutton within w_despliegue_balance
integer x = 297
integer y = 40
integer width = 306
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agencies"
end type

event clicked;////if this.checked then
////	IF dw_1.retrieve("R") > 0 THEN
////		dw_1.Scrolltorow(1)
////		dw_1.SetRow(1)
////		dw_1.SelectRow(0, FALSE)
////		dw_1.SelectRow(1, TRUE)
////		dw_1.SetFocus()
////	END IF
////end if	
//
//if this.checked then
//	datetime ld_date
//	
//	ld_date = datetime(date(em_date.text),time('23:59:59'))
//	
//	if date(em_date.text) >= today() then
//		
//		if date(em_date.text) > today() then
//			Messagebox("Date Error","Future dates are not allowed, Today's balance will be showed",Information!)
//		end if
//
//		dw_1.DataObject = 'dw_despliegue_balance_rapido'
//		dw_1.SetTransObject(SQLCA)
//		IF dw_1.retrieve("R") > 0 THEN
//			dw_1.Scrolltorow(1)
//			dw_1.SetRow(1)
//			dw_1.SelectRow(0, FALSE)
//			dw_1.SelectRow(1, TRUE)
//			dw_1.SetFocus()
//			return
//		END IF	
//				
//	else
//		
////		fn_generatepreviousbalances(string(ld_date,"mm/dd/yyyy"))
////		dw_1.DataObject = 'dw_despliegue_balance_previo_rap'
////		dw_1.SetTransObject(SQLCA)
////		IF dw_1.retrieve("R",ld_date) > 0 THEN
////			dw_1.Scrolltorow(1)
////			dw_1.SetRow(1)
////			dw_1.SelectRow(0, FALSE)
////			dw_1.SelectRow(1, TRUE)
////			dw_1.SetFocus()
////			return
////		END IF	
//			
//	end if
//end if
end event

type st_1 from statictext within w_despliegue_balance
integer x = 1285
integer y = 48
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Group Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_1 from u_dw within w_despliegue_balance
integer x = 46
integer y = 220
integer width = 3054
integer height = 1232
integer taborder = 40
string dataobject = "dw_despliegue_balance_rapido"
borderstyle borderstyle = stylebox!
end type

event clicked;if dw_1.GetClickedRow ( ) = 1 then
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
end if

end event

event doubleclicked;cb_select.triggerevent(clicked!)
end event

event rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, TRUE)
SetRow(currentrow)
end event

type sle_search from singlelineedit within w_despliegue_balance
event ue_keyup pbm_keyup
integer x = 1595
integer y = 36
integer width = 553
integer height = 84
integer taborder = 10
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

event ue_keyup;string ls_search_string
long ll_found_row

ls_search_string = 'Match(String(group_branch_name_main_branch), "^' + This.text + '")'

ll_found_row = dw_1.Find(ls_search_string, 1, dw_1.RowCount())

If ll_found_row > 0 Then
dw_1.ScrollToRow(ll_found_row)
dw_1.SelectRow(0, False)
dw_1.SelectRow(ll_found_row, True)
End If

This.SetFocus()

end event

type cb_recalcular_datedeposit from commandbutton within w_despliegue_balance
boolean visible = false
integer x = 55
integer y = 2168
integer width = 517
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "date deposit"
end type

event clicked;//SetPointer(HourGlass!)
//
// Double		ld_receiver
// String		ls_branch
// Datetime	ld_fecha
// 
// 
// DECLARE balance CURSOR FOR  
//  SELECT dba.RECEIVER.ID_BRANCH,   
//         dba.RECEIVER.ID_RECEIVER  
//    FROM dba.RECEIVER  
//   WHERE dba.RECEIVER.STATUS_PAGO_AGENT = 'P' AND
//			dba.RECEIVER.DATE_DEPOSIT IS NULL ;
//
//
//
//open balance ;
//fetch balance into :ls_branch, :ld_receiver ;
//DO WHILE sqlca.sqlcode = 0 
//	
//	  SELECT dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA  
//    INTO :ld_fecha  
//    FROM dba.RELACION_PAGO_AGENTE,   
//         dba.TRANSACCION_DIARIA_PAYEE  
//   WHERE ( dba.RELACION_PAGO_AGENTE.CONS_TRANS_DIARIA = dba.TRANSACCION_DIARIA_PAYEE.CONS_TRANS_DIARIA ) and  
//         ( ( dba.RELACION_PAGO_AGENTE.ID_BRANCH = :ls_branch ) AND  
//         ( dba.RELACION_PAGO_AGENTE.ID_RECEIVER = :ld_receiver ) )   ;
//
//	   UPDATE dba.RECEIVER  
//      SET DATE_DEPOSIT = :ld_fecha  
//   	WHERE ( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
//         	( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;
//
//	
//		
//	
//	fetch balance into :ls_branch, :ld_receiver ;
//LOOP
//
//close balance ;
//
//commit ;
//
//messagebox('Done','Process Completed')
//
////messagebox('','')
//
end event

type cb_recalcular_state from commandbutton within w_despliegue_balance
boolean visible = false
integer x = 55
integer y = 2080
integer width = 517
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Redefinir S&tate"
end type

event clicked;SetPointer(HourGlass!)

 String	ls_grupo, ls_state
 

 DECLARE state CURSOR FOR  
  SELECT dba.GROUP_BRANCH.ID_MAIN_BRANCH 
    FROM dba.GROUP_BRANCH  
   WHERE dba.GROUP_BRANCH.state_group_branch is null   ;


open state ;
fetch state into :ls_grupo ;

DO WHILE sqlca.sqlcode = 0 
	
	 SELECT dba.BRANCH.ID_STATE  
    INTO :ls_state 
    FROM dba.BRANCH  
    WHERE dba.BRANCH.ID_MAIN_BRANCH = :ls_grupo   ;

	  UPDATE dba.GROUP_BRANCH  
     SET state_group_branch = :ls_state 
     WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :ls_grupo   ;

	fetch state into :ls_grupo ;
LOOP

close state ;

commit ;

messagebox('Done','Process Completed')

end event

type cb_recalcular_balance_poner_en_group from commandbutton within w_despliegue_balance
integer x = 1902
integer y = 1664
integer width = 517
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Temporal"
end type

event clicked;
 Double	ld_debito,ld_credito,ld_balance 
 String	ls_grupo
 
 
 DECLARE balance CURSOR FOR  
  SELECT dba.GROUP_BRANCH.ID_MAIN_BRANCH  
    FROM dba.GROUP_BRANCH    ;


open balance ;
fetch balance into :ls_grupo ;
DO WHILE sqlca.sqlcode = 0 
	
	ld_debito 	= 0  
   ld_credito	= 0   
   ld_balance 	= 0  
	
	   SELECT SUM(dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA),   
         SUM(dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA),   
         SUM(dba.TRANSACCION_DIARIA_PAYEE.DEBIT_TRANS_DIARIA) - SUM(dba.TRANSACCION_DIARIA_PAYEE.CREDIT_TRANS_DIARIA)  
    	INTO :ld_debito,   
         :ld_credito,   
         :ld_balance  
    	FROM dba.TRANSACCION_DIARIA_PAYEE  
   	WHERE dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA = :ls_grupo AND
				dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'CPC'	AND
				dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE <> 'PB' ;

		if isnull(ld_debito)  then ld_debito  = 0
		if isnull(ld_credito) then ld_credito = 0
		if isnull(ld_balance) then ld_balance = 0
		
		  UPDATE dba.GROUP_BRANCH  
        SET DEBITO_GROUP = :ld_debito,   
            CREDITO_GROUP = :ld_credito,   
            BALANCE_GROUP = :ld_balance  
        WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :ls_grupo   ;				
	
	fetch balance into :ls_grupo ;
LOOP

close balance ;

commit ;

messagebox('','')

end event

type cb_select_cpc from commandbutton within w_despliegue_balance
integer x = 46
integer y = 1472
integer width = 553
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select Confirmations"
end type

event clicked;long		ll_row
double	ld_sender
string	ls_group


ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_group = dw_1.getitemstring(ll_row,"id_group_trans_diaria")
	Openwithparm(w_despliegue_transacciones_cpc,ls_group)
end if
end event

type cb_print_filter from commandbutton within w_despliegue_balance
integer x = 613
integer y = 1472
integer width = 347
integer height = 80
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

type cb_select from commandbutton within w_despliegue_balance
integer x = 1335
integer y = 1472
integer width = 347
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select"
boolean default = true
end type

event clicked;long		ll_row
double	ld_sender
string	ls_group

setPointer(HourGlass!)

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_group = dw_1.getitemstring(ll_row,"id_group_trans_diaria")
	Openwithparm(w_despliegue_transacciones,ls_group)
end if
end event

type cb_1 from commandbutton within w_despliegue_balance
integer x = 2053
integer y = 1472
integer width = 347
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(w_despliegue_balance)
end event

type gb_1 from groupbox within w_despliegue_balance
boolean visible = false
integer x = 631
integer y = 2040
integer width = 1650
integer height = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fix group values - SA Only"
end type

type gb_3 from groupbox within w_despliegue_balance
integer x = 41
integer y = 4
integer width = 1234
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type r_1 from rectangle within w_despliegue_balance
integer linethickness = 4
long fillcolor = 80269524
integer x = 46
integer y = 144
integer width = 3054
integer height = 76
end type

