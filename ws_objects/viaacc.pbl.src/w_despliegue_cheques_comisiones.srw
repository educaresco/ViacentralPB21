$PBExportHeader$w_despliegue_cheques_comisiones.srw
forward
global type w_despliegue_cheques_comisiones from window
end type
type dw_3 from u_dw within w_despliegue_cheques_comisiones
end type
type cb_6 from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_4 from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_3 from commandbutton within w_despliegue_cheques_comisiones
end type
type dw_2 from datawindow within w_despliegue_cheques_comisiones
end type
type st_4 from statictext within w_despliegue_cheques_comisiones
end type
type st_3 from statictext within w_despliegue_cheques_comisiones
end type
type em_to from editmask within w_despliegue_cheques_comisiones
end type
type em_from from editmask within w_despliegue_cheques_comisiones
end type
type cb_2 from commandbutton within w_despliegue_cheques_comisiones
end type
type hpb_1 from hprogressbar within w_despliegue_cheques_comisiones
end type
type st_hint from statictext within w_despliegue_cheques_comisiones
end type
type st_current from statictext within w_despliegue_cheques_comisiones
end type
type cb_last from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_next from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_prior from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_first from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_5 from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_query from commandbutton within w_despliegue_cheques_comisiones
end type
type st_2 from statictext within w_despliegue_cheques_comisiones
end type
type cb_date from commandbutton within w_despliegue_cheques_comisiones
end type
type em_date from u_em within w_despliegue_cheques_comisiones
end type
type st_1 from statictext within w_despliegue_cheques_comisiones
end type
type sle_search from singlelineedit within w_despliegue_cheques_comisiones
end type
type cb_select_cpc from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_print_filter from commandbutton within w_despliegue_cheques_comisiones
end type
type cb_1 from commandbutton within w_despliegue_cheques_comisiones
end type
type lst_fechas_disponibles from my_ddlb within w_despliegue_cheques_comisiones
end type
type dw_1 from u_dw within w_despliegue_cheques_comisiones
end type
type gb_1 from groupbox within w_despliegue_cheques_comisiones
end type
end forward

global type w_despliegue_cheques_comisiones from window
boolean visible = false
integer x = 814
integer y = 424
integer width = 6199
integer height = 2364
boolean titlebar = true
string title = "Commission Check Printout"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
event ue_balanceprevio ( )
event ue_credit ( )
event ue_achs ( )
dw_3 dw_3
cb_6 cb_6
cb_4 cb_4
cb_3 cb_3
dw_2 dw_2
st_4 st_4
st_3 st_3
em_to em_to
em_from em_from
cb_2 cb_2
hpb_1 hpb_1
st_hint st_hint
st_current st_current
cb_last cb_last
cb_next cb_next
cb_prior cb_prior
cb_first cb_first
cb_5 cb_5
cb_query cb_query
st_2 st_2
cb_date cb_date
em_date em_date
st_1 st_1
sle_search sle_search
cb_select_cpc cb_select_cpc
cb_print_filter cb_print_filter
cb_1 cb_1
lst_fechas_disponibles lst_fechas_disponibles
dw_1 dw_1
gb_1 gb_1
end type
global w_despliegue_cheques_comisiones w_despliegue_cheques_comisiones

type variables
string		is_name, is_id_banco_checks, is_id_cuenta_banco_checks
boolean  	ib_asc1, ib_asc2, ib_asc3, ib_asc4, ib_asc5, ib_asc6, ib_printout = false
double   	id_row =0,id_checknumber = -9999
datetime id_date
end variables

forward prototypes
public function integer fn_initial_evaluation ()
public function integer fn_set_payment (string as_method, integer ai_row)
end prototypes

event ue_credit();string ls_group, ls_method, ls_description,ls_processed
double ld_cons, ld_amount, ld_balance, ld_rows, row, ld_credit_number, ld_total_credits, id_payment, ld_payid

setpointer(hourglass!)
ld_total_credits = 0
ld_rows = dw_1.rowcount()

for row =1 to ld_rows

	ls_method = dw_1.getitemstring(row,'paymentby')
	ld_credit_number =  0 //dw_1.getitemnumber(row,'credit_number')
	ld_payid = dw_1.getitemnumber(row,"id_commission_payment")
	ls_processed = dw_1.getitemstring(row,'processed')

	if isnull(ld_credit_number) then ld_credit_number = 0

	if ls_method = 'C' and ld_credit_number = 0 and  (ls_processed = '0' or isnull(ls_processed) ) then
		ls_group = dw_1.getitemstring(row,'paymentgroup')
		ld_amount = dw_1.getitemnumber(row,'amount')
		ls_description = 'AJUSTE: ' +  dw_1.getitemstring(row,'paymentdescription')
	 
	 
		ld_balance = fn_balance_escalable(ls_group,String(Today(),'mm-dd-yyyy'))
		ld_balance = round(ld_balance,2) - round(ld_amount,2)
	 
		SELECT Max(isnull(dba.transaccion_diaria_payee.cons_trans_diaria,0)) + 1  
		INTO :ld_cons  
		FROM dba.transaccion_diaria_payee;
		
		INSERT INTO dba.TRANSACCION_DIARIA_PAYEE(CONS_TRANS_DIARIA, ID_GROUP_TRANS_DIARIA, DATE_TRANS_DIARIA, HOUR_TRANS_DIARIA, ID_CONCEPTO_CONTABLE, DES_TRANS_DIARIA, DEBIT_TRANS_DIARIA, CREDIT_TRANS_DIARIA, BALANCE_TRANS_DIARIA, DESCRIPCION_SUSPENSE, LINK_REFERENCE, DESC_TRANS_DIARIA1, DATE_SYSTEM, ID_CASHIER, TOTAL_AMOUNT, BNKID, NUM_WIRETRANSFER)
		VALUES(:ld_cons, :ls_group, getdate(), getdate(), 'AJC',:ls_description, 0, :ld_amount, :ld_balance, null, null, null, getdate(), :gs_cashier, null, NULL, null);
		
		update  dba.COMMISSION_PAYMENT 
		set 	CREDITEDCONSTRANSDIARIA = :ld_cons ,
				processedbyuser = :gs_iduser,
				processeddate = getdate(),
				processed = '1',
				paymentby = 'C',
				accounttype = null,
				accountrouting = null,
				accountnumber = null,
				CHECKPAYABLETO = null, 
				CHECKADDRESS1  = null, 
				CHECKADDRESS2  = null, 
				CHECKNUMBER  = null
		where ID_COMMISSION_PAYMENT = :ld_payid ;
		
		
		If SQLCA.SQLCode <> 0 then
			setpointer(arrow!)
			Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria: "+SQLCA.SQLErrText,StopSign!)
			Return	
		End if
	
		INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE(CONS_TRANS_DIARIA, ID_BANCO, ID_CUENTA_BANCO, DEPOSIT_CODE, RECONCILIATIONDATE, DATE_TRANS_DIARIA,EXCHANGE_RATE,  ID_PURCHASE)
		VALUES(:ld_cons, 'MTSA', 'MTSA', null, getdate(), getdate(),NULL,NULL );
	
		If SQLCA.SQLCode <> 0 then
			setpointer(arrow!)
			DELETE FROM dba.transaccion_diaria_payee WHERE CONS_TRANS_DIARIA = :ld_cons;
			Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Banco: "+SQLCA.SQLErrText,StopSign!)	
			Return	
		else
			//dw_1.setitem(row,'credit_number',ld_cons)
			ld_total_credits = ld_total_credits +1
		END IF	
	end if

next
setpointer(arrow!)
messagebox('Credits',string(ld_total_credits) + ' Credits Apply',exclamation!)

end event

event ue_achs();string ls_group, ls_method, ls_description, ls_processed, ls_gb_accounttype, ls_gb_accountrouting, ls_gb_accountnumber
double ld_cons, ld_amount, ld_balance, ld_rows, row, ld_credit_number, ld_total_credits, id_payment, ld_payid


ld_total_credits = 0
ld_rows = dw_1.rowcount()
setpointer(hourglass!)
for row =1 to ld_rows

	ls_method = dw_1.getitemstring(row,'paymentby')
	ld_payid = dw_1.getitemnumber(row,"id_commission_payment")
	ls_processed = dw_1.getitemstring(row,'processed')

	if ls_method = 'A' and (ls_processed = '0' or isnull(ls_processed) ) then
		ls_group = dw_1.getitemstring(row,'paymentgroup')
		ld_amount = dw_1.getitemnumber(row,'amount')
		

		ls_gb_accounttype = dw_1.getitemstring(row,'gb_accounttype')
		ls_gb_accountrouting = dw_1.getitemstring(row,'gb_accountrouting')
		ls_gb_accountnumber = dw_1.getitemstring(row,'gb_accountnumber')
		
	
		
		update  dba.COMMISSION_PAYMENT 
		set 	processedbyuser = :gs_iduser,
				processeddate = getdate(),
				processed = '1',
				paymentby = 'A',
				accounttype = :ls_gb_accounttype,
				accountrouting = :ls_gb_accountrouting,
				accountnumber = :ls_gb_accountnumber,
				CHECKPAYABLETO = null, 
				CHECKADDRESS1  = null, 
				CHECKADDRESS2  = null, 
				CHECKNUMBER  = null, 
				CREDITEDCONSTRANSDIARIA  = null
		where ID_COMMISSION_PAYMENT = :ld_payid ;
		
		
		If SQLCA.SQLCode <> 0 then
			setpointer(arrow!)
			Messagebox("Error Data","Error in process Commission Payment: "+SQLCA.SQLErrText,StopSign!)
			rollback;
			Return	
		End if
	
			ld_total_credits = ld_total_credits +1
	end if

next

// execute send to bank
IF ld_total_credits > 0 THEN 
	DECLARE spGetCommissionACHs PROCEDURE FOR dba.spGetCommissionACHs
						@p_date =  :Id_date;
		
	EXECUTE spGetCommissionACHs;
	
	IF sqlca.SQLcode = -1 then	
		MessageBox("Alert","Error to execute (dba.spGetCommissionACHs): " + sqlca.SQLErrText, StopSign!)
	END IF
END IF

setpointer(arrow!)
messagebox('ACHs',string(ld_total_credits) + ' ACH Apply',exclamation!)
end event

public function integer fn_initial_evaluation ();integer li_row
string ls_method, ls_processed, ls_commissionmethod, ls_setmethod,ls_gb_accounttype,ls_gb_accountrouting,ls_gb_accountnumber, ls_paymentby
decimal ldec_amount

if ib_printout then return 1

For li_row = 1 to  dw_1.rowcount()
	ls_method = dw_1.getitemstring( li_row , 'processed' )
	if isnull(ls_method) or ls_method = '0' then 
		ldec_amount = dw_1.getitemnumber( li_row , 'amount' )
		ls_commissionmethod = dw_1.getitemstring( li_row , 'group_branch_fin_commissionmethod' ) 
		ls_paymentby = dw_1.getitemstring( li_row , 'paymentby' ) 
		if  ls_paymentby <> '-'  then continue
		
		if ldec_amount < 100 then 
			ls_setmethod = 'C'
		else
			ls_setmethod = 'T'
			choose case ls_commissionmethod
				Case 'A'
					ls_setmethod = 'A'
					ls_gb_accounttype = dw_1.getitemstring(li_row,'gb_accounttype')
					ls_gb_accountrouting = dw_1.getitemstring(li_row,'gb_accountrouting')
					ls_gb_accountnumber = dw_1.getitemstring(li_row,'gb_accountnumber')
					
					if isnull(ls_gb_accounttype) or isnull(ls_gb_accountrouting) or isnull(ls_gb_accountnumber) then
					ls_setmethod = 'H'
					end if
					
					if len(ls_gb_accounttype) = 0 or len(ls_gb_accountrouting) = 0 or len(ls_gb_accountnumber) = 0 then
					ls_setmethod = 'H'
					end if

				Case 'T'
					ls_setmethod = 'T'
				Case 'C'

					ls_setmethod = 'C'
			end choose
		end if
		dw_1.setitem(li_row, 'paymentby', ls_setmethod)
		fn_set_payment(ls_setmethod,li_row)
	end if
next

return 1
end function

public function integer fn_set_payment (string as_method, integer ai_row);string ls_payto ,ls_gb_address_branch, ls_gb_payableto, ls_gb_dategrom, ls_gb_dateto
string ls_gb_accounttype, ls_gb_accountrouting, ls_gb_accountnumber, ls_null

choose case as_method 
	case 'T'
		ls_gb_address_branch = dw_1.getitemstring(ai_row,'gb_address_branch')
		ls_gb_payableto = dw_1.getitemstring(ai_row,'gb_payableto')
		
		ls_gb_accounttype = ''
		ls_gb_accountrouting = ''
		ls_gb_accountnumber = ''
	case 'C'
		ls_gb_address_branch = ''
		ls_gb_payableto = ''
		
		ls_gb_accounttype = ''
		ls_gb_accountrouting = ''
		ls_gb_accountnumber = ''
	case 'A'
		ls_gb_address_branch = ''
		ls_gb_payableto = ''
		
		
		ls_gb_accounttype = dw_1.getitemstring(ai_row,'gb_accounttype')
		ls_gb_accountrouting = dw_1.getitemstring(ai_row,'gb_accountrouting')
		ls_gb_accountnumber = dw_1.getitemstring(ai_row,'gb_accountnumber')
		
		if isnull(ls_gb_accounttype) or isnull(ls_gb_accountrouting) or isnull(ls_gb_accountnumber) then
			return 0
		end if
		
		if len(ls_gb_accounttype) = 0 or len(ls_gb_accountrouting) = 0 or len(ls_gb_accountnumber) = 0 then
			return 0
		end if
		
	case 'H'
		ls_gb_address_branch = ''
		ls_gb_payableto = ''
		
		ls_gb_accounttype = ''
		ls_gb_accountrouting = ''
		ls_gb_accountnumber = ''
end choose	


dw_1.setitem(ai_row,'checkpayableto',ls_gb_payableto)
dw_1.setitem(ai_row,'checknumber',ls_null)
dw_1.setitem(ai_row,'checkaddress1',ls_gb_address_branch)
dw_1.setitem(ai_row,'checkaddress2',ls_null)

dw_1.setitem(ai_row,'creditedconstransdiaria',ls_null) 

dw_1.setitem(ai_row,'accounttype',ls_gb_accounttype)
dw_1.setitem(ai_row,'accountrouting',ls_gb_accountrouting)
dw_1.setitem(ai_row,'accountnumber',ls_gb_accountnumber)



return 1

end function

event open;X=1
Y=1
Show()

string	ls_name_cashier
datetime ld_date

//ld_date = datetime(date(today()),time('23:59:59'))
lst_fechas_disponibles.addqueryad("select distinct DATE_TRANS_DIARIA,convert(varchar,DATE_TRANS_DIARIA,101) from   dba.transaccion_diaria_payee_comm where  id_concepto_contable ='DAC'order by DATE_TRANS_DIARIA desc")
em_date.text 	=  lst_fechas_disponibles.getdataid()
ld_date 			= datetime(date(em_date.text),time('00:00:00'))
dw_1.settransobject(sqlca)

em_date.text 	= (string(today(),"mm/dd/yyyy"))



cb_first.visible 	= ib_printout
cb_prior.visible 	= ib_printout
cb_next.visible 	= ib_printout
cb_last.visible 	= ib_printout
st_current.visible= ib_printout
st_hint.visible	= ib_printout
hpb_1.visible 		= false

IF dw_1.retrieve(ld_date) > 0 THEN
	dw_1.Scrolltorow(1)
	dw_1.SetRow(1)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(1, TRUE)
	dw_1.SetFocus()
	return
END IF




end event

on w_despliegue_cheques_comisiones.create
this.dw_3=create dw_3
this.cb_6=create cb_6
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_2=create dw_2
this.st_4=create st_4
this.st_3=create st_3
this.em_to=create em_to
this.em_from=create em_from
this.cb_2=create cb_2
this.hpb_1=create hpb_1
this.st_hint=create st_hint
this.st_current=create st_current
this.cb_last=create cb_last
this.cb_next=create cb_next
this.cb_prior=create cb_prior
this.cb_first=create cb_first
this.cb_5=create cb_5
this.cb_query=create cb_query
this.st_2=create st_2
this.cb_date=create cb_date
this.em_date=create em_date
this.st_1=create st_1
this.sle_search=create sle_search
this.cb_select_cpc=create cb_select_cpc
this.cb_print_filter=create cb_print_filter
this.cb_1=create cb_1
this.lst_fechas_disponibles=create lst_fechas_disponibles
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.dw_3,&
this.cb_6,&
this.cb_4,&
this.cb_3,&
this.dw_2,&
this.st_4,&
this.st_3,&
this.em_to,&
this.em_from,&
this.cb_2,&
this.hpb_1,&
this.st_hint,&
this.st_current,&
this.cb_last,&
this.cb_next,&
this.cb_prior,&
this.cb_first,&
this.cb_5,&
this.cb_query,&
this.st_2,&
this.cb_date,&
this.em_date,&
this.st_1,&
this.sle_search,&
this.cb_select_cpc,&
this.cb_print_filter,&
this.cb_1,&
this.lst_fechas_disponibles,&
this.dw_1,&
this.gb_1}
end on

on w_despliegue_cheques_comisiones.destroy
destroy(this.dw_3)
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.em_to)
destroy(this.em_from)
destroy(this.cb_2)
destroy(this.hpb_1)
destroy(this.st_hint)
destroy(this.st_current)
destroy(this.cb_last)
destroy(this.cb_next)
destroy(this.cb_prior)
destroy(this.cb_first)
destroy(this.cb_5)
destroy(this.cb_query)
destroy(this.st_2)
destroy(this.cb_date)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.sle_search)
destroy(this.cb_select_cpc)
destroy(this.cb_print_filter)
destroy(this.cb_1)
destroy(this.lst_fechas_disponibles)
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

type dw_3 from u_dw within w_despliegue_cheques_comisiones
boolean visible = false
integer x = 718
integer y = 368
integer width = 4608
integer height = 1048
integer taborder = 50
boolean titlebar = true
string title = "Detail Chain"
string dataobject = "dw_despliegue_cheques_comisiones_det"
boolean controlmenu = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
end type

type cb_6 from commandbutton within w_despliegue_cheques_comisiones
integer x = 1861
integer y = 2128
integer width = 407
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Apply ACH~'s"
end type

event clicked;integer row //dw_1.update()

event ue_achs()
commit;
cb_query.event clicked( )


end event

type cb_4 from commandbutton within w_despliegue_cheques_comisiones
integer x = 1431
integer y = 2128
integer width = 407
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Apply Credits"
end type

event clicked;integer row //dw_1.update()

event ue_credit()

cb_query.event clicked( )


end event

type cb_3 from commandbutton within w_despliegue_cheques_comisiones
integer x = 1015
integer y = 2128
integer width = 407
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save Changes"
end type

event clicked;integer row

dw_1.update()
commit;

dw_1.retrieve(id_date) 

end event

type dw_2 from datawindow within w_despliegue_cheques_comisiones
boolean visible = false
integer x = 1701
integer y = 2320
integer width = 686
integer height = 400
integer taborder = 120
string dataobject = "dw_despliegue_cheques_comisiones_val"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type st_4 from statictext within w_despliegue_cheques_comisiones
integer x = 3141
integer y = 2160
integer width = 101
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
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_despliegue_cheques_comisiones
integer x = 2523
integer y = 2160
integer width = 247
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
string text = "From Chk:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_to from editmask within w_despliegue_cheques_comisiones
integer x = 3246
integer y = 2156
integer width = 311
integer height = 76
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "##########"
end type

type em_from from editmask within w_despliegue_cheques_comisiones
integer x = 2825
integer y = 2156
integer width = 315
integer height = 76
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "##########"
end type

type cb_2 from commandbutton within w_despliegue_cheques_comisiones
integer x = 3579
integer y = 2152
integer width = 366
integer height = 80
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Generate File"
end type

event clicked;
if double(em_from.text) > double(em_to.text) then
	Messagebox("Error","Please check the range",StopSign!)
	return
end if

if double(em_from.text) = 0 or double(em_to.text) = 0 then
	Messagebox("Error","Please check the range",StopSign!)
	return
end if

SetPointer(HourGlass!)

dw_2.retrieve(double(em_from.text),double(em_to.text))

string ls_path, ls_file
int li_rc

ls_path = ''
li_rc = GetFileSaveName("Select File", ls_path, ls_file, "CSV", "CSV Files (*.CSV),*.CSV")

if li_rc = 1 then
	dw_2.SaveAs(ls_path,CSV!, FALSE)
	Messagebox("Process Complete","File generated to "+ls_path+'  ('+string(dw_2.rowcount())+' records)')
else
	MessageBox("Error","Invalid File Location",StopSign!)
end if

SetPointer(Arrow!)
end event

type hpb_1 from hprogressbar within w_despliegue_cheques_comisiones
integer x = 2866
integer y = 2032
integer width = 928
integer height = 68
unsignedinteger maxposition = 100
integer setstep = 1
end type

type st_hint from statictext within w_despliegue_cheques_comisiones
integer x = 1710
integer y = 2040
integer width = 1143
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 16777215
string text = "Only records marked for print are shown"
boolean focusrectangle = false
end type

type st_current from statictext within w_despliegue_cheques_comisiones
integer x = 23
integer y = 40
integer width = 946
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_last from commandbutton within w_despliegue_cheques_comisiones
integer x = 4507
integer y = 2136
integer width = 160
integer height = 80
integer taborder = 70
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">|"
end type

event clicked;dw_1.setrow(dw_1.rowcount())
dw_1.ScrollToRow(dw_1.getrow())



end event

type cb_next from commandbutton within w_despliegue_cheques_comisiones
integer x = 4343
integer y = 2136
integer width = 160
integer height = 80
integer taborder = 80
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">"
end type

event clicked;dw_1.setrow(dw_1.getrow() + 1)
dw_1.ScrollToRow(dw_1.getrow())


end event

type cb_prior from commandbutton within w_despliegue_cheques_comisiones
integer x = 4178
integer y = 2136
integer width = 160
integer height = 80
integer taborder = 60
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<"
end type

event clicked;dw_1.setrow(dw_1.getrow() - 1)
dw_1.ScrollToRow(dw_1.getrow())

end event

type cb_first from commandbutton within w_despliegue_cheques_comisiones
integer x = 4014
integer y = 2136
integer width = 160
integer height = 80
integer taborder = 50
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "|<"
end type

event clicked;dw_1.setrow(1)
dw_1.ScrollToRow(dw_1.getrow())


end event

type cb_5 from commandbutton within w_despliegue_cheques_comisiones
integer x = 754
integer y = 2128
integer width = 256
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print "
boolean cancel = true
end type

event clicked;
IF dw_1.GetRow()<=0 THEN
	MessageBox('Attention','Must Query First ! ')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('Attention','Must Query First ! ')
	Return
END IF

if (ib_printout) then

	SetNull(id_checknumber)

	// 09/13/2010 ADDED THE JOIN WITH ACC PARAMETRS, TO HANDLE MULTIPLE ACCOUNTS (ONE AT THE TIME)
	SELECT COMM_CHKS_ID_BANCO, COMM_CHKS_ID_CUENTA_BANCO, max(convert(numeric,check_number))+1
	INTO :is_id_banco_checks, :is_id_cuenta_banco_checks, :id_checknumber
	FROM dba.transaccion_diaria_payee_comm, dba.ACC_PARAMETERS
	WHERE COMM_CHKS_ID_BANCO = ID_BANCO
	AND COMM_CHKS_ID_CUENTA_BANCO = ID_CUENTA_BANCO
	AND id_concepto_contable = 'DAC'
	AND CHECK_NUMBER IS NOT NULL
	GROUP BY COMM_CHKS_ID_BANCO, COMM_CHKS_ID_CUENTA_BANCO
	USING SQLCArpt;	


	IF isnull(id_checknumber) THEN
		
		id_checknumber = 1

		// El primer cheque de esa cuenta, debe seleccionar de nuevo porque la otra seleccion dio NULL
		SELECT TOP 1 COMM_CHKS_ID_BANCO, COMM_CHKS_ID_CUENTA_BANCO
		INTO :is_id_banco_checks, :is_id_cuenta_banco_checks
		FROM dba.ACC_PARAMETERS;
		
	END IF
	

	if 2 = messagebox('Atention', 'The next check would be check #  '+STRING(id_checknumber),question!,yesno!) then
		Openwithparm(w_cambio_cons_cheque,'')
		id_checknumber = message.doubleparm 
		if id_checknumber = -9999 then
			 return
		end if 
	end if

end if 	

printsetup()
dw_1.print(true)

	
end event

type cb_query from commandbutton within w_despliegue_cheques_comisiones
integer x = 3451
integer y = 36
integer width = 393
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;datetime ld_date
integer row
string dummy
//em_date.text 	=  string(datetime(date(lst_fechas_disponibles.getdataid()),time('00:00:00')))
em_date.text 	=  lst_fechas_disponibles.getdataid()
ld_date = datetime(date(em_date.text),time('00:00:00'))
id_date = ld_date
dw_1.SetTransObject(SQLCA)
IF dw_1.retrieve(ld_date) > 0 THEN
	fn_initial_evaluation()
	dw_1.Scrolltorow(1)
	dw_1.SetRow(1)
	dw_1.SelectRow(0, FALSE)
//	dw_1.SelectRow(1, TRUE)
	dw_1.SetFocus()
	
	return
else
	
	DECLARE spGenCommPayment PROCEDURE FOR dba.spGenCommPayment
					@p_date =  :id_date;
	
		EXECUTE spGenCommPayment;
		
		IF sqlca.SQLcode = -1 then	
			MessageBox("Alert","Error to execute (dba.spGenCommPayment): " + sqlca.SQLErrText, StopSign!)
		END IF
		
	IF dw_1.retrieve(ld_date) > 0 THEN
		fn_initial_evaluation()
		dw_1.Scrolltorow(1)
		dw_1.SetRow(1)
		dw_1.SelectRow(0, FALSE)
	//	dw_1.SelectRow(1, TRUE)
		dw_1.SetFocus()
		
		return
	end if
	
END IF


end event

type st_2 from statictext within w_despliegue_cheques_comisiones
integer x = 2203
integer y = 44
integer width = 475
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
string text = "Select Closing  Date :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_date from commandbutton within w_despliegue_cheques_comisiones
boolean visible = false
integer x = 4466
integer y = 2132
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

type em_date from u_em within w_despliegue_cheques_comisiones
boolean visible = false
integer x = 4155
integer y = 2132
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

type st_1 from statictext within w_despliegue_cheques_comisiones
integer x = 1083
integer y = 44
integer width = 320
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
string text = "Group Name :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_search from singlelineedit within w_despliegue_cheques_comisiones
event ue_keyup pbm_keyup
integer x = 1422
integer y = 36
integer width = 663
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

type cb_select_cpc from commandbutton within w_despliegue_cheques_comisiones
string tag = "qwqwrewqerqw"
integer x = 101
integer y = 2128
integer width = 389
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Show PrintOut"
end type

event clicked;datetime ld_date

string   ls_filter=''

IF dw_1.GetRow()<=0 and not(ib_printout) THEN
	MessageBox('Attention','Must Query First! ')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" and not(ib_printout) THEN
	MessageBox('Attention','Must Query First! ')
	Return
END IF

//id_row 			 = dw_1.GetSelectedRow(0)
//if id_row <> 0 then
//	ld_trans_diaria = dw_1.getitemnumber(id_row,'id_commission_payment')
//	//ls_filter="transaccion_diaria_payee_comm_cons_trans_diaria = "+string(ld_trans_diaria)
//end if 
////ls_filter=" transaccion_diaria_payee_comm_allow_print = 'T' "

if ib_printout then
	//ls_filter 	 =''
	ib_printout 	 = false
	dw_1.dataobject = 'dw_despliegue_cheques_comisiones_v2'	
	this.text 		 = 'Show PrintOut'
	dw_1.vscrollbar = true
	dw_1.hscrollbar = true
else	
	dw_1.update()
	ib_printout 		= true
	//dw_1.dataobject   = 'dw_print_cheques_comisiones'
	dw_1.dataobject   = 'dw_print_cheques_comisiones_sp'
	this.text 			= 'Close PrintOut'
	dw_1.vscrollbar   = false
	dw_1.hscrollbar   = false
end if

cb_first.visible 		= ib_printout
cb_prior.visible 		= ib_printout
cb_next.visible 		= ib_printout
cb_last.visible 		= ib_printout
st_current.visible	= ib_printout
st_hint.visible		= ib_printout

dw_1.settransobject(sqlca)
ld_date 					= datetime(date(em_date.text),time('00:00:00'))
dw_1.retrieve(ld_date)
	
//dw_1.SetRedraw(false)
//dw_1.SetFilter(ls_filter)
//dw_1.Filter()
//dw_1.SetRedraw(true)
st_current.text = string(dw_1.getrow())+ '   OF   '+ string(dw_1.rowcount())+ '   FOUND'

end event

type cb_print_filter from commandbutton within w_despliegue_cheques_comisiones
integer x = 494
integer y = 2128
integer width = 256
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

event clicked;IF dw_1.GetRow()<=0 THEN
	MessageBox('Attention','Must Query First ! ')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('Attention','Must Query First ! ')
	Return
END IF


dw_1.saveas()
end event

type cb_1 from commandbutton within w_despliegue_cheques_comisiones
integer x = 4736
integer y = 2136
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

event clicked;Close(PARENT)
end event

type lst_fechas_disponibles from my_ddlb within w_despliegue_cheques_comisiones
integer x = 2683
integer y = 36
integer width = 709
integer height = 1540
integer taborder = 90
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;//long 		ll_cont
//String	ls_bank
//
//ls_bank = lst_bank.getdataid()
//
//SELECT count(*) 
//  INTO :ll_cont
//  FROM dba.CUENTA_BANCO
// WHERE ID_BANCO = :ls_bank;
// 
//if ll_cont>0 then
//	lst_account.addquery("SELECT ID_CUENTA_BANCO, ID_CUENTA_BANCO FROM dba.CUENTA_BANCO WHERE ID_BANCO = '"+ls_bank+"' ORDER BY 1")
//else
//	lst_account.addquery("SELECT 'PLEASE SELECT A BANK', '--'")
//end if


end event

type dw_1 from u_dw within w_despliegue_cheques_comisiones
integer x = 14
integer y = 136
integer width = 6107
integer height = 1892
integer taborder = 40
string dataobject = "dw_despliegue_cheques_comisiones_V2"
boolean hscrollbar = true
boolean hsplitscroll = true
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

event rowfocuschanged;st_current.text = string(currentrow)+ '   OF   '+ string(dw_1.rowcount())+ '   FOUND'


end event

event doubleclicked;call super::doubleclicked;
if ib_printout then
 return
end if 

datetime ld_date
double   ld_trans_diaria
string   ls_filter=''
dw_1.accepttext()
IF dw_1.GetRow()<=0 THEN
	MessageBox('Attention','Must Query First ! ')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('Attention','Must Query First ! ')
	Return
END IF

id_row 			 = dw_1.GetSelectedRow(0)

if dw_1.getitemstring(id_row,"paymentby") <> 'T'  then
	messagebox('Atention','You should check this record for print first')
	return
end if 	

if id_row <> 0 then
	ld_trans_diaria = dw_1.getitemnumber(id_row,'id_commission_payment')
	ls_filter="id_commission_payment = "+string(ld_trans_diaria)
end if



if ib_printout then
	ls_filter 			=''
	ib_printout 		= false
	dw_1.dataobject   = 'dw_despliegue_cheques_comisiones_v2'
	cb_select_cpc.text 			= 'Show PrintOut'
	dw_1.vscrollbar   = true
else	
	dw_1.update()
	ib_printout 		= true
	//dw_1.dataobject   = 'dw_print_cheques_comisiones'
	dw_1.dataobject   = 'dw_print_cheques_comisiones_sp'
	
	cb_select_cpc.text 			= 'Close PrintOut'
	dw_1.vscrollbar   = false
end if

cb_first.visible 		= ib_printout
cb_prior.visible 		= ib_printout
cb_next.visible 		= ib_printout
cb_last.visible 		= ib_printout
st_current.visible	= ib_printout
st_hint.visible		= ib_printout

dw_1.settransobject(sqlca)
ld_date = datetime(date(em_date.text),time('00:00:00'))
dw_1.retrieve(ld_date)
	
dw_1.SetRedraw(false)
dw_1.SetFilter(ls_filter)
dw_1.Filter()
dw_1.SetRedraw(true)
st_current.text = string(dw_1.getrow())+ '   OF   '+ string(dw_1.rowcount())+ '   FOUND'

end event

event printstart;call super::printstart;if ib_printout then
	dw_1.object.p_check.visible = false
	
end if 	
	
end event

event printend;call super::printend;String ls_group, ls_desc, ls_paymentgroup
Double ld_next_cons
long ll_cont

if ib_printout then
	
	dw_1.object.p_check.visible = true
	int i 
	double ld_vlr,ld_payid ,ld_max
	ld_max =dw_1.rowcount()
	
	hpb_1.maxposition = ld_max
	hpb_1.visible = true
	for i = 1 to ld_max
		
		ld_payid = dw_1.getitemnumber(i,"id_commission_payment")

		select paymentgroup 
		into :ls_paymentgroup 
		from dba.COMMISSION_PAYMENT where id_commission_payment =:ld_payid;
		 
		SELECT max(cons_print )
		INTO :ld_vlr
		FROM DBA.TRANSACCION_DIARIA_PAYEE_COMM 
		WHERE id_commission_payment =:ld_payid;
		
		
		if isnull(ld_vlr) then ld_vlr = 0
		
		ld_vlr = ld_vlr + 1
		
		UPDATE DBA.TRANSACCION_DIARIA_PAYEE_COMM 
		SET cons_print = :ld_vlr 
		WHERE id_commission_payment =:ld_payid;
				
		// Actualiza la fecha de impresion
		datetime ldt_fecha_now
		
		update DBA.TRANSACCION_DIARIA_PAYEE_COMM 
		SET date_chk_printed = getdate() 
		WHERE id_commission_payment =:ld_payid
		AND date_chk_printed IS NULL;
		
		
		SELECT count(*)
		INTO :ll_cont
		FROM DBA.TRANSACCION_DIARIA_PAYEE_COMM 
		WHERE id_commission_payment =:ld_payid
		AND check_number IS NULL;
		
		if ll_cont > 0 then		
			
			UPDATE DBA.TRANSACCION_DIARIA_PAYEE_COMM 
			SET check_number = :id_checknumber,
			id_banco = :is_id_banco_checks, 
			id_cuenta_banco = :is_id_cuenta_banco_checks
			WHERE  id_commission_payment =:ld_payid
			AND check_number IS NULL;		
			
			
			update dba.COMMISSION_PAYMENT 
			set 	processedbyuser = :gs_iduser,
					processeddate = getdate(),
					processed = '1',
					paymentby = 'T',
					checknumber = :id_checknumber,
					accounttype = null,
					accountrouting = null,
					accountnumber = null,
					CHECKPAYABLETO = DBA.SFGETGROUPCHECKPAYABLETO(PAYMENTGROUP) , 
					CHECKADDRESS1  = DBA.SFGETGROUPCHECKADDRESS(PAYMENTGROUP) , 
					CHECKADDRESS2  = null,
					creditedconstransdiaria = null
			where  id_commission_payment =:ld_payid;
	
			
			
			
			id_checknumber = id_checknumber + 1						
			
			// Graba la transaccion que deja el registro de cheque impreso!
			
			SELECT Max(dba.transaccion_diaria_payee_comm.cons_trans_diaria) + 1  
			INTO   :ld_next_cons  
			FROM   dba.transaccion_diaria_payee_comm  ;
	 
			if sqlca.sqlcode < 0 then
				//FileWrite(FileNum,"Error: SQL Sentence CONSULTANDO EL CONSECUTIVO"+sqlca.sqlerrtext)
				rollback;
				return
		   end if
	
			if isnull(ld_next_cons) then ld_next_cons 		= 1			
			//ls_desc = "CHECK WAS PRINTED AND MAILED (VIA-"+String(id_checknumber - 1)+")"
			ls_desc = "CHECK WAS PRINTED AND MAILED"
			ls_group = ls_paymentgroup
			
			INSERT INTO dba.TRANSACCION_DIARIA_PAYEE_COMM (CONS_TRANS_DIARIA, 
			ID_GROUP_TRANS_DIARIA,
			DATE_TRANS_DIARIA, 
			HOUR_TRANS_DIARIA, 
			ID_CONCEPTO_CONTABLE, 
			DES_TRANS_DIARIA, 
			DEBIT_TRANS_DIARIA, 
			CREDIT_TRANS_DIARIA, 
			BALANCE_TRANS_DIARIA, 
			ID_CASHIER, 
			RTN_NUMBER, 
			CHECK_NUMBER, 
			ACC_NUMBER,
			CONS_BALANCE)
			VALUES(:ld_next_cons,
			:ls_group,
			GETDATE(),
			GETDATE(),
			'DAP',
			:ls_desc,
			0,
			0,
			0,
			'CH1',
			null,
			null,
			null,
			0);										
					
					
		end if
					
		hpb_1.position = hpb_1.position + 1
	next 
end if
commit;

hpb_1.visible = false
end event

event buttonclicked;call super::buttonclicked;String ls_Object
string ls_sort,ls_desc
double ld_cons,ld_return,ld_cons_comm,ld_debit, li_id_payment
ls_Object = String(dwo.name)

//
dw_1.SetRedraw(false)
if ib_asc1 then 
	ls_sort = 'D' 
	ib_asc1 = FALSE
else 
	ls_sort = 'A'
	ib_asc1 = TRUE
end if

choose case ls_object
		case 'b_1'
			dw_1.SetSort("#10 "+ls_sort)
		case 'b_2'
			dw_1.SetSort("#20 "+ls_sort)
		case 'b_3'
			dw_1.SetSort("#8 "+ls_sort)
		case 'b_4'
			dw_1.SetSort("#9 "+ls_sort)
		case 'b_5'
			dw_1.SetSort("#21 "+ls_sort)
		case 'b_6'
			dw_1.SetSort("#22 "+ls_sort)
		case 'b_7'
			dw_1.SetSort("#17 "+ls_sort)
		case 'b_8'
			dw_1.SetSort("#23 "+ls_sort)
		case 'b_9'
			dw_1.SetSort("#18 "+ls_sort)
		case 'b_10'
			dw_1.SetSort("#7 "+ls_sort)			
		case 'b_11'
			dw_1.SetSort("#5 "+ls_sort)			
		case 'b_12'
			dw_1.SetSort("#4 "+ls_sort)			
		case 'b_modify'
			
			Openwithparm(w_cambio_cons_cheque,'AMT')
			ld_return = message.doubleparm 
		case 'b_credit'
			event ue_credit()
		case 'b_pay_to'
			dw_3.settransobject(SQLCA)

			li_id_payment  = dw_1.getitemnumber(row,'ID_COMMISSION_PAYMENT')
			 dw_3.retrieve(id_date, li_id_payment)
			 dw_3.visible = true
// Es necesario poner esto en dba.TRANSACCION DIARIA PAYEE
		
//			if  ld_return <> -9999 then
//				 
//					ld_cons  = dw_1.getitemnumber(dw_1.getrow(),'transaccion_diaria_payee_comm_cons_trans_diaria')
//					ld_debit = dw_1.getitemnumber(dw_1.getrow(),'transaccion_diaria_payee_comm_debit_trans_diaria')
//					ls_desc  = 'ADJUST TRANS.#'+string(ld_cons)+' PRIOR AMT. $'+STRING(ld_debit)					
//					UPDATE DBA.TRANSACCION_DIARIA_PAYEE_COMM 
//					SET    ADJUST_AMOUNT 		= DEBIT_TRANS_DIARIA,
//							 DEBIT_TRANS_DIARIA  = :LD_RETURN
//					WHERE  CONS_TRANS_DIARIA 	= :LD_CONS;
//								
//					if SQLCA.SQLCODE= 0 then
//										
//						   SELECT Max(dba.transaccion_diaria_payee_comm.cons_trans_diaria) + 1  
//							INTO :ld_cons_comm  
//							FROM dba.transaccion_diaria_payee_comm;
//	
//							if sqlca.sqlcode < 0 then
//								messagebox('Error',"Error: SQL Sentence CONSULTANDO EL CONSECUTIVO COMISIONES"+sqlca.sqlerrtext)
//								rollback;
//								return
//							end if
//		
//							if isnull(ld_cons_comm) then ld_cons_comm = 1
//			
//								INSERT INTO dba.TRANSACCION_DIARIA_PAYEE_COMM (CONS_TRANS_DIARIA, 
//																							  ID_GROUP_TRANS_DIARIA,
//																							  DATE_TRANS_DIARIA, 
//																							  HOUR_TRANS_DIARIA, 
//																							  ID_CONCEPTO_CONTABLE, 
//																							  DES_TRANS_DIARIA, 
//																							  DEBIT_TRANS_DIARIA, 
//																							  CREDIT_TRANS_DIARIA, 
//																							  BALANCE_TRANS_DIARIA, 
//																							  ID_CASHIER, 
//																							  RTN_NUMBER, 
//																							  CHECK_NUMBER, 
//																							  ACC_NUMBER,
//																							  CONS_BALANCE)
//										select :ld_cons_comm,
//												 ID_GROUP_TRANS_DIARIA,
//												 getdate(),
//												 getdate(),
//												 'DAP',
//												 :ls_desc,
//												 0,
//												 0,
//												 0,
//												 :GS_CASHIER,
//												 null,
//												 null,
//												 null,
//												 :ld_cons
//									 from     dba.transaccion_diaria_payee_comm
//									 where    CONS_TRANS_DIARIA = :ld_cons;
//									if sqlca.sqlcode < 0 then
//										messagebox('Error',"Error: SQL Sentence INSERTANDO TRANSACCION EN CERO "+sqlca.sqlerrtext)
//										rollback;
//										return
//									end if		 
//							commit;
//
//
//						dw_1.reselectrow(dw_1.getrow())
//						dw_1.setrow(dw_1.getrow())
//						dw_1.ScrollToRow(dw_1.getrow())
//						messagebox('Message','Commission Updated Sucessfully')
//					else
//						messagebox('Error Updating',sqlca.sqlerrtext)
//						return;
//					end if 	
//			
//			end if 

end choose

dw_1.Sort()
dw_1.SetRedraw(true)

dw_1.setrow(dw_1.rowcount())
dw_1.ScrollToRow(dw_1.getrow())
dw_1.setrow(1)
dw_1.ScrollToRow(dw_1.getrow())

//

end event

event itemchanged;string ls_method,ls_gb_accounttype,ls_gb_accountnumber,ls_gb_accountrouting

if dwo.name = 'paymentby' then 
	ls_method = string(data)
	if ls_method = 'A' then 
		ls_gb_accounttype = dw_1.getitemstring(row,'gb_accounttype')
		ls_gb_accountrouting = dw_1.getitemstring(row,'gb_accountrouting')
		ls_gb_accountnumber = dw_1.getitemstring(row,'gb_accountnumber')
		
		if isnull(ls_gb_accounttype) or isnull(ls_gb_accountrouting) or isnull(ls_gb_accountnumber) then
			messagebox('Data Error',"This Group don't have ACH information!")
			return 2
		end if
		
		if len(ls_gb_accounttype) = 0 or len(ls_gb_accountrouting) = 0 or len(ls_gb_accountnumber) = 0 then
			messagebox('Data Error',"This Group don't have ACH information!")
			return 2
		end if
		
	end if
	fn_set_payment(ls_method, row) 
	
end if


end event

type gb_1 from groupbox within w_despliegue_cheques_comisiones
integer x = 2459
integer y = 2096
integer width = 1541
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "US Bank Validation File"
end type

