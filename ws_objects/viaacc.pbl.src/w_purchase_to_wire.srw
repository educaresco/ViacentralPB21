$PBExportHeader$w_purchase_to_wire.srw
forward
global type w_purchase_to_wire from pfc_w_sheet
end type
type cb_1 from commandbutton within w_purchase_to_wire
end type
type lst_dest_bank from my_ddlb within w_purchase_to_wire
end type
type st_6 from statictext within w_purchase_to_wire
end type
type lst_payers from my_ddlb within w_purchase_to_wire
end type
type st_5 from statictext within w_purchase_to_wire
end type
type lst_account from my_ddlb within w_purchase_to_wire
end type
type lst_bank from my_ddlb within w_purchase_to_wire
end type
type st_4 from statictext within w_purchase_to_wire
end type
type st_3 from statictext within w_purchase_to_wire
end type
type st_2 from statictext within w_purchase_to_wire
end type
type dw_2 from datawindow within w_purchase_to_wire
end type
type dw_1 from datawindow within w_purchase_to_wire
end type
type gb_1 from groupbox within w_purchase_to_wire
end type
type gb_3 from groupbox within w_purchase_to_wire
end type
type gb_2 from groupbox within w_purchase_to_wire
end type
type st_1 from statictext within w_purchase_to_wire
end type
type cb_save from commandbutton within w_purchase_to_wire
end type
end forward

global type w_purchase_to_wire from pfc_w_sheet
integer x = 214
integer y = 221
integer width = 3611
integer height = 1396
cb_1 cb_1
lst_dest_bank lst_dest_bank
st_6 st_6
lst_payers lst_payers
st_5 st_5
lst_account lst_account
lst_bank lst_bank
st_4 st_4
st_3 st_3
st_2 st_2
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
st_1 st_1
cb_save cb_save
end type
global w_purchase_to_wire w_purchase_to_wire

on w_purchase_to_wire.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.lst_dest_bank=create lst_dest_bank
this.st_6=create st_6
this.lst_payers=create lst_payers
this.st_5=create st_5
this.lst_account=create lst_account
this.lst_bank=create lst_bank
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.st_1=create st_1
this.cb_save=create cb_save
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.lst_dest_bank
this.Control[iCurrent+3]=this.st_6
this.Control[iCurrent+4]=this.lst_payers
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.lst_account
this.Control[iCurrent+7]=this.lst_bank
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.dw_2
this.Control[iCurrent+12]=this.dw_1
this.Control[iCurrent+13]=this.gb_1
this.Control[iCurrent+14]=this.gb_3
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.cb_save
end on

on w_purchase_to_wire.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.lst_dest_bank)
destroy(this.st_6)
destroy(this.lst_payers)
destroy(this.st_5)
destroy(this.lst_account)
destroy(this.lst_bank)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.st_1)
destroy(this.cb_save)
end on

event open;call super::open;dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

lst_bank.addqueryad("SELECT NAME_BANCO, ID_BANCO FROM dba.BANCO WHERE DEP_BANCO = 'Y' ORDER BY 1")
lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+lst_bank.getdataid()+"' ORDER BY 1")
lst_payers.addqueryad("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE GROUP_TYPE IN ('P') AND FLAG_GRUPO = 'A' ORDER BY name_main_branch;")

dw_1.retrieve()

dw_2.insertrow(0)


end event

type cb_1 from commandbutton within w_purchase_to_wire
integer x = 3104
integer y = 1128
integer width = 402
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;close(w_purchase_to_wire)
end event

type lst_dest_bank from my_ddlb within w_purchase_to_wire
integer x = 594
integer y = 1092
integer width = 1042
integer height = 788
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type st_6 from statictext within w_purchase_to_wire
integer x = 165
integer y = 1108
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer Acc. :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_payers from my_ddlb within w_purchase_to_wire
integer x = 594
integer y = 976
integer width = 1042
integer height = 788
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;long 		ll_cont
String	ls_payer

ls_payer = lst_payers.getdataid()

SELECT count(*) 
  INTO :ll_cont
  FROM dba.WIREBANK
 WHERE ID_MAIN_BRANCH = :ls_payer;
 
if ll_cont>0 then
	lst_dest_bank.addquery("SELECT rtrim(bnkName) + ' ('+rtrim(bnkAccount)+')', bnkId FROM dba.WIREBANK WHERE id_main_branch = '"+ls_payer+"' ORDER BY 1")
else
	lst_dest_bank.addquery("SELECT 'PLEASE SELECT A PAYER WITH A DEST ACC.', '--'")
end if
end event

type st_5 from statictext within w_purchase_to_wire
integer x = 165
integer y = 984
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_account from my_ddlb within w_purchase_to_wire
integer x = 1637
integer y = 864
integer width = 750
integer height = 788
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type lst_bank from my_ddlb within w_purchase_to_wire
integer x = 594
integer y = 864
integer width = 1042
integer height = 788
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;long 		ll_cont
String	ls_bank

ls_bank = lst_bank.getdataid()

SELECT count(*) 
  INTO :ll_cont
  FROM dba.CUENTA_BANCO
 WHERE ID_BANCO = :ls_bank;
 
if ll_cont>0 then
	lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+ls_bank+"' ORDER BY 1")
else
	lst_account.addquery("SELECT 'PLEASE SELECT A BANK', '--'")
end if
end event

type st_4 from statictext within w_purchase_to_wire
integer x = 165
integer y = 872
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Viamericas Acc. :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_purchase_to_wire
integer x = 2272
integer y = 616
integer width = 1179
integer height = 224
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_purchase_to_wire
integer x = 2327
integer y = 724
integer width = 1083
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_purchase_to_wire
integer x = 105
integer y = 600
integer width = 1531
integer height = 240
integer taborder = 30
string title = "none"
string dataobject = "dw_purchase_to_wire"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if dw_1.rowcount() > 0 then
 
 IF dwo.name = "available_amount" THEN
	
if	double(data) > dw_1.getitemnumber(dw_1.getrow(),'available_amount') then
	
	st_1.text = 'AMOUNT IS NOT AVAILABLE'
	st_2.text = data + ' > '+ string(dw_1.getitemnumber(dw_1.getrow(),'available_amount'),"0.00")
	st_1.backcolor = RGB(255,0,0)
	st_2.backcolor = RGB(255,0,0)
	st_3.backcolor = RGB(255,0,0)
	cb_save.enabled = false
else
	st_1.backcolor = 78682240
	st_2.backcolor = 78682240
	st_3.backcolor = 78682240
	st_1.text = ''
	st_2.text ='' 
	cb_save.enabled = true
end if

end if

end if
end event

event losefocus;this.accepttext()
end event

type dw_1 from datawindow within w_purchase_to_wire
integer x = 87
integer y = 64
integer width = 3401
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_select_purchase"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;datetime dt_effective_date

double ld_amount, id_purchase
string id_payer, id_banco

if this.rowcount() > 0 then

This.SelectRow(0, false)
This.SelectRow(row, true)

st_3.backcolor = 78682240
st_1.backcolor = 78682240
st_2.backcolor = 78682240
st_1.text = ''
st_2.text = ''
cb_save.enabled = true

dt_effective_date = this.getitemdatetime(row,'effective_date')
ld_amount = this.getitemnumber(row,'available_amount')
dw_2.setitem(1,'effective_date',dt_effective_date)
dw_2.setitem(1,'available_amount',ld_amount)

end if
end event

type gb_1 from groupbox within w_purchase_to_wire
integer x = 32
integer width = 3497
integer height = 536
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Purchases"
borderstyle borderstyle = stylebox!
end type

type gb_3 from groupbox within w_purchase_to_wire
integer x = 2231
integer y = 568
integer width = 1257
integer height = 292
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_purchase_to_wire
integer x = 32
integer y = 540
integer width = 3497
integer height = 712
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

type st_1 from statictext within w_purchase_to_wire
integer x = 2327
integer y = 644
integer width = 1083
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_save from commandbutton within w_purchase_to_wire
integer x = 2683
integer y = 1128
integer width = 402
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Save"
end type

event clicked;string ls_payer, ls_dest_bank, ls_bank, ls_account
double ld_amount, ld_exchange_rate, ld_balance, ld_cons, d_purchase_id
datetime ld_date_inicio, ld_date_final
date  ld_date
ls_payer = lst_payers.getdataid()

if isnull(ls_payer) or ls_payer = '--' or ls_payer = '' then
	Messagebox("Missing Data","Please select a payer",StopSign!)
	setfocus(lst_payers)
	return
end if


ls_bank = lst_bank.getdataid()

if isnull(ls_bank) or ls_bank = '--' or ls_bank = '' then
	Messagebox("Missing Data","Please select a bank",StopSign!)
	setfocus(lst_bank)
	return
end if

ls_account = lst_account.getdataid()

if isnull(ls_account) or ls_account = '--' or ls_account = '' then
	Messagebox("Missing Data","Please select a bank account",StopSign!)
	setfocus(lst_account)
	return
end if

ls_dest_bank = lst_dest_bank.getdataid()

if isnull(ls_dest_bank) or ls_dest_bank = '--' or ls_dest_bank = '' then
	Messagebox("Missing Data","Please select the payer's account",StopSign!)
	setfocus(lst_dest_bank)
	return
end if



ld_amount = double(dw_2.getitemnumber(1,'available_amount'))

if isnull(ld_amount) or ld_amount < 0 then
	Messagebox("Invalid Amount","Please enter a valid amount",StopSign!)
	//setfocus(em_amount)
	return
end if

ld_date = date(dw_2.getitemdatetime(1,'effective_date'))

SELECT min(dba.ACC_PARAMETERS.DATE_BLOCKER),   
		 min(dba.ACC_PARAMETERS.DATE_BLOCKER_POST)
  INTO :ld_date_inicio,   
		 :ld_date_final
 FROM dba.ACC_PARAMETERS  ;

if SQLCA.SQLCode <> 0 then
	Messagebox("Error","Error checking Account Parameters, Block Date will not be checked!~n[Error: "+SQLCA.SQLErrText+"]",Stopsign!)
	return
end if

if not isnull(ld_date_inicio) and not isnull(ld_date_final) then

	if (ld_date <= date(ld_date_inicio)) or (ld_date >= date(ld_date_final)) then	
		messagebox("Error","The date you are using ("+string(ld_date,"mm/dd/yyyy")+") was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
		//setfocus(em_date)
		return
	end if

end if



ld_balance = fn_balance_escalable(ls_payer,String(Today(),'mm-dd-yyyy'))
ld_balance = round(ld_balance,2) + round(ld_amount,2)



If Messagebox("Confirmation","Are you sure that you want to save a Wire for $"+string(ld_amount,"######,##0.00")+" for "+lst_payers.getdatavalue()+"?",Question!,YesNo!) = 1 Then
	
	d_purchase_id = dw_1.getitemnumber(dw_1.getrow(),'id_purchase')

	SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
	  INTO :ld_cons  
	  FROM dba.transaccion_diaria_payee;
	
	INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
	VALUES(:ld_cons, :ls_payer, getdate(), getdate(), 'DP', '', :ld_amount, 0, :ld_balance, null, null, null, getdate(), :gs_cashier, null, :ls_dest_bank, null);
	
	If SQLCA.SQLCode <> 0 then
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
		Return	
	End if
	
	INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE,  ID_PURCHASE)
	VALUES(:ld_cons, :ls_bank, :ls_account, null, :ld_date, getdate(),:ld_exchange_rate,:d_purchase_id );
	
	If SQLCA.SQLCode <> 0 then
		DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons;
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
		Return	
		
	else
		
		
		
		UPDATE dba.currency_purchase
		SET available_amount = available_amount - :ld_amount
		WHERE id_purchase = :d_purchase_id;
		
		dw_1.retrieve()
		
	End if
	
end if

end event

