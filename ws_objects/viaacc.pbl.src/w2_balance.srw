$PBExportHeader$w2_balance.srw
forward
global type w2_balance from pfc_w_master
end type
type cbx_inc_closed from checkbox within w2_balance
end type
type cb_recalcular_balance_poner_en_group from commandbutton within w2_balance
end type
type st_3 from statictext within w2_balance
end type
type rb_payersdue from radiobutton within w2_balance
end type
type cb_1 from commandbutton within w2_balance
end type
type cb_comm_balance from commandbutton within w2_balance
end type
type cb_select from commandbutton within w2_balance
end type
type cb_5 from commandbutton within w2_balance
end type
type cb_print_filter from commandbutton within w2_balance
end type
type cb_select_cpc from commandbutton within w2_balance
end type
type cb_2 from commandbutton within w2_balance
end type
type cb_balance from commandbutton within w2_balance
end type
type cb_credit from commandbutton within w2_balance
end type
type cb_debit from commandbutton within w2_balance
end type
type cb_name from commandbutton within w2_balance
end type
type cb_id from commandbutton within w2_balance
end type
type dw_1 from u_dw within w2_balance
end type
type cb_query from commandbutton within w2_balance
end type
type cb_date from commandbutton within w2_balance
end type
type em_date from u_em within w2_balance
end type
type st_2 from statictext within w2_balance
end type
type sle_search from singlelineedit within w2_balance
end type
type st_1 from statictext within w2_balance
end type
type rb_payees from radiobutton within w2_balance
end type
type rb_agencies from radiobutton within w2_balance
end type
type rb_both from radiobutton within w2_balance
end type
type gb_3 from groupbox within w2_balance
end type
type gb_1 from groupbox within w2_balance
end type
type r_1 from rectangle within w2_balance
end type
end forward

global type w2_balance from pfc_w_master
integer width = 4320
integer height = 2072
string title = "Balance"
cbx_inc_closed cbx_inc_closed
cb_recalcular_balance_poner_en_group cb_recalcular_balance_poner_en_group
st_3 st_3
rb_payersdue rb_payersdue
cb_1 cb_1
cb_comm_balance cb_comm_balance
cb_select cb_select
cb_5 cb_5
cb_print_filter cb_print_filter
cb_select_cpc cb_select_cpc
cb_2 cb_2
cb_balance cb_balance
cb_credit cb_credit
cb_debit cb_debit
cb_name cb_name
cb_id cb_id
dw_1 dw_1
cb_query cb_query
cb_date cb_date
em_date em_date
st_2 st_2
sle_search sle_search
st_1 st_1
rb_payees rb_payees
rb_agencies rb_agencies
rb_both rb_both
gb_3 gb_3
gb_1 gb_1
r_1 r_1
end type
global w2_balance w2_balance

type variables
string	is_name
boolean   ib_asc1, ib_asc2, ib_asc3, ib_asc4, ib_asc5, ib_asc6
end variables

forward prototypes
public subroutine fn_balanceprevio ()
end prototypes

public subroutine fn_balanceprevio ();
SetPointer(HourGlass!)

String ls_type, ls_namebranch, ls_idmainbranch, ls_state, ls_date, ls_payertypeclosing
Long ll_row
Double ld_credit, ld_debit, ld_balance
Boolean lb_custom

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
	
	if lb_custom then		
		ld_debit = fn_previousbalance_custompayer(ls_idmainbranch,ls_date,"D",ls_payertypeclosing)
		ld_credit = fn_previousbalance_custompayer(ls_idmainbranch,ls_date,"C",ls_payertypeclosing)
		ld_balance = fn_previousbalance_custompayer(ls_idmainbranch,ls_date,"B",ls_payertypeclosing)
		if ls_payertypeclosing = 'P' then
			ls_payertypeclosing = 'PAID'
		else
			ls_payertypeclosing = 'SENT'
		end if
		
		dw_1.SetItem(ll_row,"state",ls_payertypeclosing)
	else
		ld_debit = fn_previousbalance(ls_idmainbranch,ls_date,"D")
		ld_credit = fn_previousbalance(ls_idmainbranch,ls_date,"C")
		ld_balance = fn_previousbalance(ls_idmainbranch,ls_date,"B")
		dw_1.SetItem(ll_row,"state",'')
	end if	

	dw_1.SetItem(ll_row,"debito_group",ld_debit)	
	dw_1.SetItem(ll_row,"credito_group",ld_credit)	
	dw_1.SetItem(ll_row,"balance_group",ld_balance)		
		
	FETCH cur_groups INTO :ls_idmainbranch, :ls_namebranch, :ls_state, :ls_payertypeclosing;
LOOP
end subroutine

on w2_balance.create
int iCurrent
call super::create
this.cbx_inc_closed=create cbx_inc_closed
this.cb_recalcular_balance_poner_en_group=create cb_recalcular_balance_poner_en_group
this.st_3=create st_3
this.rb_payersdue=create rb_payersdue
this.cb_1=create cb_1
this.cb_comm_balance=create cb_comm_balance
this.cb_select=create cb_select
this.cb_5=create cb_5
this.cb_print_filter=create cb_print_filter
this.cb_select_cpc=create cb_select_cpc
this.cb_2=create cb_2
this.cb_balance=create cb_balance
this.cb_credit=create cb_credit
this.cb_debit=create cb_debit
this.cb_name=create cb_name
this.cb_id=create cb_id
this.dw_1=create dw_1
this.cb_query=create cb_query
this.cb_date=create cb_date
this.em_date=create em_date
this.st_2=create st_2
this.sle_search=create sle_search
this.st_1=create st_1
this.rb_payees=create rb_payees
this.rb_agencies=create rb_agencies
this.rb_both=create rb_both
this.gb_3=create gb_3
this.gb_1=create gb_1
this.r_1=create r_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_inc_closed
this.Control[iCurrent+2]=this.cb_recalcular_balance_poner_en_group
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.rb_payersdue
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_comm_balance
this.Control[iCurrent+7]=this.cb_select
this.Control[iCurrent+8]=this.cb_5
this.Control[iCurrent+9]=this.cb_print_filter
this.Control[iCurrent+10]=this.cb_select_cpc
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_balance
this.Control[iCurrent+13]=this.cb_credit
this.Control[iCurrent+14]=this.cb_debit
this.Control[iCurrent+15]=this.cb_name
this.Control[iCurrent+16]=this.cb_id
this.Control[iCurrent+17]=this.dw_1
this.Control[iCurrent+18]=this.cb_query
this.Control[iCurrent+19]=this.cb_date
this.Control[iCurrent+20]=this.em_date
this.Control[iCurrent+21]=this.st_2
this.Control[iCurrent+22]=this.sle_search
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.rb_payees
this.Control[iCurrent+25]=this.rb_agencies
this.Control[iCurrent+26]=this.rb_both
this.Control[iCurrent+27]=this.gb_3
this.Control[iCurrent+28]=this.gb_1
this.Control[iCurrent+29]=this.r_1
end on

on w2_balance.destroy
call super::destroy
destroy(this.cbx_inc_closed)
destroy(this.cb_recalcular_balance_poner_en_group)
destroy(this.st_3)
destroy(this.rb_payersdue)
destroy(this.cb_1)
destroy(this.cb_comm_balance)
destroy(this.cb_select)
destroy(this.cb_5)
destroy(this.cb_print_filter)
destroy(this.cb_select_cpc)
destroy(this.cb_2)
destroy(this.cb_balance)
destroy(this.cb_credit)
destroy(this.cb_debit)
destroy(this.cb_name)
destroy(this.cb_id)
destroy(this.dw_1)
destroy(this.cb_query)
destroy(this.cb_date)
destroy(this.em_date)
destroy(this.st_2)
destroy(this.sle_search)
destroy(this.st_1)
destroy(this.rb_payees)
destroy(this.rb_agencies)
destroy(this.rb_both)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.r_1)
end on

event key;call super::key;IF KeyDown(KeyUpArrow!) THEN 
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

event open;call super::open;X=1
Y=1
Show()

em_date.text = (string(today(),"mm/dd/yyyy"))

cb_query.triggerevent("clicked")
end event

event pfc_preopen;call super::pfc_preopen;this.of_SetResize(TRUE)
IF IsValid(this.inv_resize) THEN
   //Registering objects
   this.inv_resize.of_Register(dw_1,"ScaleToRight&Bottom") 
	//this.inv_resize.of_Register(sle_selected,"FixedToBottom&ScaleToRight") 	
	this.inv_resize.of_Register(cb_select_cpc,"FixedToBottom")
	this.inv_resize.of_Register(cb_print_filter,"FixedToBottom")
	this.inv_resize.of_Register(cb_5,"FixedToBottom")
	this.inv_resize.of_Register(cb_select,"FixedToBottom")
	this.inv_resize.of_Register(cb_comm_balance,"FixedToBottom")
	this.inv_resize.of_Register(cb_1,"FixedToBottom")
END IF
end event

type cbx_inc_closed from checkbox within w2_balance
integer x = 2587
integer y = 72
integer width = 613
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Include Closed Agents"
boolean checked = true
end type

type cb_recalcular_balance_poner_en_group from commandbutton within w2_balance
boolean visible = false
integer x = 2322
integer y = 2052
integer width = 517
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
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

type st_3 from statictext within w2_balance
integer x = 3323
integer y = 200
integer width = 279
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Branch(es)"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_payersdue from radiobutton within w2_balance
integer x = 859
integer y = 68
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

type cb_1 from commandbutton within w2_balance
integer x = 2057
integer y = 1756
integer width = 347
integer height = 140
integer taborder = 120
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

type cb_comm_balance from commandbutton within w2_balance
integer x = 1696
integer y = 1756
integer width = 347
integer height = 140
integer taborder = 110
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

type cb_select from commandbutton within w2_balance
integer x = 1335
integer y = 1756
integer width = 347
integer height = 140
integer taborder = 100
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

type cb_5 from commandbutton within w2_balance
integer x = 974
integer y = 1756
integer width = 347
integer height = 140
integer taborder = 90
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

type cb_print_filter from commandbutton within w2_balance
integer x = 613
integer y = 1756
integer width = 347
integer height = 140
integer taborder = 80
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

type cb_select_cpc from commandbutton within w2_balance
integer x = 46
integer y = 1756
integer width = 553
integer height = 140
integer taborder = 70
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

type cb_2 from commandbutton within w2_balance
integer x = 3177
integer y = 200
integer width = 128
integer height = 60
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "St"
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

type cb_balance from commandbutton within w2_balance
integer x = 2647
integer y = 200
integer width = 530
integer height = 60
integer taborder = 100
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

type cb_credit from commandbutton within w2_balance
integer x = 2107
integer y = 200
integer width = 535
integer height = 60
integer taborder = 90
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

type cb_debit from commandbutton within w2_balance
integer x = 1627
integer y = 200
integer width = 475
integer height = 60
integer taborder = 80
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

type cb_name from commandbutton within w2_balance
integer x = 677
integer y = 200
integer width = 946
integer height = 60
integer taborder = 70
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

type cb_id from commandbutton within w2_balance
integer x = 475
integer y = 200
integer width = 197
integer height = 60
integer taborder = 60
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

type dw_1 from u_dw within w2_balance
integer x = 46
integer y = 264
integer width = 4197
integer height = 1468
integer taborder = 60
string dataobject = "dw_balances"
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

event buttonclicked;call super::buttonclicked;
String ls_id_group, ls_id_branch

if dwo.name = 'b_credit' then
	
	ls_id_group = dw_1.getitemstring(row,"id_group_trans_diaria")
	
	SELECT ID_BRANCH 
	INTO :ls_id_branch
	FROM dba.BRANCH
	WHERE id_main_branch = :ls_id_group;
	
	//Messagebox("",ls_id_branch)

	Openwithparm(w_acc_credit,ls_id_branch,w_principal)

end if

end event

event constructor;call super::constructor;//SetTransObject(SQLCA)
// 7/3/2018: connects to readonly DB
SetTransObject(SQLCArpt)

end event

type cb_query from commandbutton within w2_balance
integer x = 3895
integer y = 64
integer width = 283
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;string ls_type,  ls_inc_closed

if rb_both.checked then
	ls_type = "B"
elseif rb_payees.checked then
	ls_type = "P"
elseif rb_payersdue.checked then
	ls_type = "D"
else
	ls_type = "R"
end if

ls_inc_closed = 'N'

if cbx_inc_closed.checked then ls_inc_closed = 'Y'

if date(em_date.text) >= today() and ls_type <> "D" then
	
	if date(em_date.text) > today() then
		Messagebox("Date Error","Future dates are not allowed, Today's balance will be showed",Information!)
	end if

	dw_1.DataObject = 'dw_balances'
	dw_1.SetTransObject(SQLCArpt)
	IF dw_1.retrieve(ls_type,ls_inc_closed) > 0 THEN
		dw_1.Scrolltorow(1)
		dw_1.SetRow(1)
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(1, TRUE)
		dw_1.SetFocus()
		return
	END IF

else

	dw_1.DataObject = 'dw_despliegue_balance_previo_runtm'
	dw_1.SetTransObject(SQLCArpt)	
	fn_balanceprevio()
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

type cb_date from commandbutton within w2_balance
integer x = 3767
integer y = 64
integer width = 91
integer height = 84
integer taborder = 40
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

type em_date from u_em within w2_balance
integer x = 3456
integer y = 64
integer width = 311
integer height = 84
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type st_2 from statictext within w2_balance
integer x = 3209
integer y = 72
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
string text = "As Date:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_search from singlelineedit within w2_balance
event ue_keyup pbm_keyup
integer x = 1765
integer y = 64
integer width = 786
integer height = 84
integer taborder = 20
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

//ls_search_string = 'Match(String(group_branch_name_main_branch), "^' + This.text + '")'

ls_search_string = 'Match(String(GroupBranches), "' + This.text + '")'

ll_found_row = dw_1.Find(ls_search_string, 1, dw_1.RowCount())

If ll_found_row > 0 Then
	dw_1.ScrollToRow(ll_found_row)
	dw_1.SelectRow(0, False)
	dw_1.SelectRow(ll_found_row, True)
else
	
	ls_search_string = 'Match(String(group_branch_name_main_branch), "^' + This.text + '")'

	ll_found_row = dw_1.Find(ls_search_string, 1, dw_1.RowCount())
	
	If ll_found_row > 0 Then
		dw_1.ScrollToRow(ll_found_row)
		dw_1.SelectRow(0, False)
		dw_1.SelectRow(ll_found_row, True)
	End If
	
End If

This.SetFocus()

end event

type st_1 from statictext within w2_balance
integer x = 1312
integer y = 72
integer width = 434
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
string text = "Branch Id or Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_payees from radiobutton within w2_balance
integer x = 576
integer y = 68
integer width = 283
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payees"
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

type rb_agencies from radiobutton within w2_balance
integer x = 270
integer y = 68
integer width = 297
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
boolean checked = true
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

type rb_both from radiobutton within w2_balance
integer x = 50
integer y = 68
integer width = 206
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

type gb_3 from groupbox within w2_balance
integer x = 41
integer y = 12
integer width = 1221
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w2_balance
integer x = 1275
integer y = 12
integer width = 2962
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type r_1 from rectangle within w2_balance
integer linethickness = 4
long fillcolor = 80269524
integer x = 46
integer y = 188
integer width = 4192
integer height = 76
end type

