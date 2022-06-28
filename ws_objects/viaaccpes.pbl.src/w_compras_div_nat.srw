$PBExportHeader$w_compras_div_nat.srw
forward
global type w_compras_div_nat from w_master
end type
type sle_desc from singlelineedit within w_compras_div_nat
end type
type st_3 from statictext within w_compras_div_nat
end type
type cb_temporal from commandbutton within w_compras_div_nat
end type
type em_date_for from editmask within w_compras_div_nat
end type
type st_2 from statictext within w_compras_div_nat
end type
type st_8 from statictext within w_compras_div_nat
end type
type em_foreing_amt from editmask within w_compras_div_nat
end type
type st_4 from statictext within w_compras_div_nat
end type
type em_exchange_rate from editmask within w_compras_div_nat
end type
type dw_1 from datawindow within w_compras_div_nat
end type
type cb_save from commandbutton within w_compras_div_nat
end type
type cb_clear from commandbutton within w_compras_div_nat
end type
type st_7 from statictext within w_compras_div_nat
end type
type em_date from editmask within w_compras_div_nat
end type
type st_6 from statictext within w_compras_div_nat
end type
type sle_note from singlelineedit within w_compras_div_nat
end type
type st_5 from statictext within w_compras_div_nat
end type
type em_amount from editmask within w_compras_div_nat
end type
type st_1 from statictext within w_compras_div_nat
end type
type lst_payers from my_ddlb within w_compras_div_nat
end type
type gb_1 from groupbox within w_compras_div_nat
end type
end forward

global type w_compras_div_nat from w_master
integer width = 2386
integer height = 1892
string title = "National Currency Purchase"
boolean maxbox = false
boolean resizable = false
sle_desc sle_desc
st_3 st_3
cb_temporal cb_temporal
em_date_for em_date_for
st_2 st_2
st_8 st_8
em_foreing_amt em_foreing_amt
st_4 st_4
em_exchange_rate em_exchange_rate
dw_1 dw_1
cb_save cb_save
cb_clear cb_clear
st_7 st_7
em_date em_date
st_6 st_6
sle_note sle_note
st_5 st_5
em_amount em_amount
st_1 st_1
lst_payers lst_payers
gb_1 gb_1
end type
global w_compras_div_nat w_compras_div_nat

on w_compras_div_nat.create
int iCurrent
call super::create
this.sle_desc=create sle_desc
this.st_3=create st_3
this.cb_temporal=create cb_temporal
this.em_date_for=create em_date_for
this.st_2=create st_2
this.st_8=create st_8
this.em_foreing_amt=create em_foreing_amt
this.st_4=create st_4
this.em_exchange_rate=create em_exchange_rate
this.dw_1=create dw_1
this.cb_save=create cb_save
this.cb_clear=create cb_clear
this.st_7=create st_7
this.em_date=create em_date
this.st_6=create st_6
this.sle_note=create sle_note
this.st_5=create st_5
this.em_amount=create em_amount
this.st_1=create st_1
this.lst_payers=create lst_payers
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_desc
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.cb_temporal
this.Control[iCurrent+4]=this.em_date_for
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_8
this.Control[iCurrent+7]=this.em_foreing_amt
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.em_exchange_rate
this.Control[iCurrent+10]=this.dw_1
this.Control[iCurrent+11]=this.cb_save
this.Control[iCurrent+12]=this.cb_clear
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.em_date
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.sle_note
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.em_amount
this.Control[iCurrent+19]=this.st_1
this.Control[iCurrent+20]=this.lst_payers
this.Control[iCurrent+21]=this.gb_1
end on

on w_compras_div_nat.destroy
call super::destroy
destroy(this.sle_desc)
destroy(this.st_3)
destroy(this.cb_temporal)
destroy(this.em_date_for)
destroy(this.st_2)
destroy(this.st_8)
destroy(this.em_foreing_amt)
destroy(this.st_4)
destroy(this.em_exchange_rate)
destroy(this.dw_1)
destroy(this.cb_save)
destroy(this.cb_clear)
destroy(this.st_7)
destroy(this.em_date)
destroy(this.st_6)
destroy(this.sle_note)
destroy(this.st_5)
destroy(this.em_amount)
destroy(this.st_1)
destroy(this.lst_payers)
destroy(this.gb_1)
end on

event open;call super::open;em_date.text 		= string(today(),"mm/dd/yyyy")
lst_payers.addqueryad("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE GROUP_TYPE IN ('P') AND FLAG_GRUPO = 'A' ORDER BY name_main_branch;")
dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
setfocus(lst_payers)
end event

type sle_desc from singlelineedit within w_compras_div_nat
integer x = 485
integer y = 568
integer width = 1783
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_compras_div_nat
integer x = 69
integer y = 584
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
string text = "Purchase Desc :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_temporal from commandbutton within w_compras_div_nat
boolean visible = false
integer x = 2656
integer y = 380
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "none"
end type

event clicked;//int 			li_filenum ,li_read
//string   	ls_cadena,ls_date,	ls_dollar,	ls_tasa,	ls_pesos ,ls_desc  
//double      ld_cons,ld_amount,ld_foreing,ld_exchange_rate
//datetime    ld_fecha 
//
//li_FileNum = FileOpen("c:\compras.txt",LineMode!, Read!, LockRead!)
//li_read = fileread(li_filenum,ls_Cadena) 
//do while li_read > 0
//	
//	ls_date 		= fn_token(ls_cadena,'|',1)
//	ls_dollar	= fn_token(ls_cadena,'|',2)
//	ls_tasa		= fn_token(ls_cadena,'|',3)
//	ls_pesos		= fn_token(ls_cadena,'|',4)
//	
//	ld_amount   		= double(ls_dollar)
//	ld_foreing  		= double(ls_pesos)
//	ld_exchange_rate  = double(ls_tasa)
//	ld_fecha				= datetime(date(ls_date),time('00:00:00'))
//	
//	ls_desc = 'PURCHASE '+ ls_dollar+ ' @ '+ls_tasa
//	
//	SELECT Max(isnull(dba.transaccion_diaria_payee_nat.cons_trans_diaria,0)) + 1  
//	INTO 	 :ld_cons  
//	FROM 	 dba.transaccion_diaria_payee_nat;
//	
//	if isnull(ld_cons) then ld_cons = 1
//	
//  INSERT INTO dba.TRANSACCION_DIARIA_PAYEE_NAT  
//         ( CONS_TRANS_DIARIA,   
//           ID_GROUP_TRANS_DIARIA,   
//           DATE_TRANS_DIARIA,   
//           HOUR_TRANS_DIARIA,   
//           ID_CONCEPTO_CONTABLE,   
//           DES_TRANS_DIARIA,   
//           DEBIT_TRANS_DIARIA,   
//           CREDIT_TRANS_DIARIA,   
//           BALANCE_TRANS_DIARIA,   
//           DESCRIPCION_SUSPENSE,   
//           LINK_REFERENCE,   
//           DESC_TRANS_DIARIA1,   
//           DATE_SYSTEM,   
//           ID_CASHIER,   
//           TOTAL_AMOUNT,   
//           BNKID,   
//           NUM_WIRETRANSFER,   
//           EXCHANGE_RATE,
//			  EXPECTED_DATE)  
//  VALUES ( :ld_cons,   
//           'T057',   
//           :ld_fecha, 
//			  getdate(),   
//           'DPN', 
//			  :ls_desc ,
//           :ld_foreing,   
//           0,   
//           0,   
//            null,   
//           null,   
//           null,   
//           getdate(), 
//			  '1002',    
//           :ld_amount,   
//           null,   
//           null,   
//           :ld_exchange_rate,
//			  :ld_fecha)  ;	
//	
//		
//	li_read = fileread(li_filenum,ls_Cadena) 
//loop
//commit;
//fileclose(li_filenum)
//messagebox('','done')
//
//
//
end event

type em_date_for from editmask within w_compras_div_nat
boolean visible = false
integer x = 2112
integer y = 88
integer width = 302
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

event losefocus;dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
end event

type st_2 from statictext within w_compras_div_nat
boolean visible = false
integer x = 1682
integer y = 100
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
string text = "Purchasing For :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_compras_div_nat
integer x = 59
integer y = 488
integer width = 407
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Foreing Amount :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_foreing_amt from editmask within w_compras_div_nat
integer x = 485
integer y = 472
integer width = 512
integer height = 84
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
string mask = "###########.00"
end type

event modified;em_amount.text = string(double(em_foreing_amt.text) / double(em_exchange_rate.text))
sle_desc.text = 'PURCHASE '+string(double(em_amount.text),"#######,##0.00")+' @ '+string(double(em_exchange_rate.text),"#####,##0.0000")
end event

type st_4 from statictext within w_compras_div_nat
integer x = 87
integer y = 392
integer width = 379
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Exchange Rate :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_exchange_rate from editmask within w_compras_div_nat
integer x = 485
integer y = 376
integer width = 512
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "1"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###########.0000"
end type

event modified;em_foreing_amt.text = string(double(em_amount.text) * double(em_exchange_rate.text))
sle_desc.text = 'PURCHASE '+string(double(em_amount.text),"#######,##0.00")+' @ '+string(double(em_exchange_rate.text),"#####,##0.0000")
end event

type dw_1 from datawindow within w_compras_div_nat
integer x = 37
integer y = 924
integer width = 2313
integer height = 852
integer taborder = 80
string dataobject = "dw_view_purchase_date"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_save from commandbutton within w_compras_div_nat
integer x = 1829
integer y = 768
integer width = 439
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Submit Purchase"
end type

event clicked;

Double 	ld_cons, ld_amount, ld_exchange_rate,ld_foreing
String	ls_payer,ls_desc
Date		ld_date
Datetime ld_date_for

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ld_date 		= date(em_date.text)
ld_date_for = datetime(date(em_date.text),time('00:00:00'))

IF Abs(DaysAfter(today(),ld_date)) > 200 Then
	Messagebox("Invalid Date","Please check the date",StopSign!)
	setfocus(em_date)
	return
end if

ls_payer = lst_payers.getdataid()
if isnull(ls_payer) or ls_payer = '--' or ls_payer = '' then
	Messagebox("Missing Data","Please select a payer",StopSign!)
	setfocus(lst_payers)
	return
end if
ld_amount = double(em_amount.text)
if isnull(ld_amount) or ld_amount < 0 then
	Messagebox("Invalid Amount","Please enter a valid amount",StopSign!)
	setfocus(em_amount)
	return
end if
ld_exchange_rate = double(em_exchange_rate.text)
if isnull(ld_exchange_rate) or ld_exchange_rate < 0 then
	Messagebox("Invalid Amount","Please enter a valid exchange rate",StopSign!)
	setfocus(em_exchange_rate)
	return
end if

ld_foreing  			= double(em_amount.text) * double(em_exchange_rate.text)
em_foreing_amt.text 	= string(ld_foreing)
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
If Messagebox("Confirmation","Are you sure that you want to submit a purchase for $"+string(ld_amount,"######,##0.00")+" for "+lst_payers.getdatavalue()+"?",Question!,YesNo!) = 1 Then

	SELECT Max(isnull(dba.transaccion_diaria_payee_nat.cons_trans_diaria,0)) + 1  
	INTO 	 :ld_cons  
	FROM 	 dba.transaccion_diaria_payee_nat;
	
	if isnull(ld_cons) then ld_cons = 1
	ls_desc = 'PURCHASE '+ string(ld_amount)+ ' @ '+ string(ld_exchange_rate)
  INSERT INTO dba.TRANSACCION_DIARIA_PAYEE_NAT  
         ( CONS_TRANS_DIARIA,   
           ID_GROUP_TRANS_DIARIA,   
           DATE_TRANS_DIARIA,   
           HOUR_TRANS_DIARIA,   
           ID_CONCEPTO_CONTABLE,   
           DES_TRANS_DIARIA,   
           DEBIT_TRANS_DIARIA,   
           CREDIT_TRANS_DIARIA,   
           BALANCE_TRANS_DIARIA,   
           DESCRIPCION_SUSPENSE,   
           LINK_REFERENCE,   
           DESC_TRANS_DIARIA1,   
           DATE_SYSTEM,   
           ID_CASHIER,   
           TOTAL_AMOUNT,   
           BNKID,   
           NUM_WIRETRANSFER,   
           EXCHANGE_RATE,
			  EXPECTED_DATE)  
  VALUES ( :ld_cons,   
           :ls_payer,   
           :ld_date_for, 
			  getdate(),   
           'DPN', 
			  :sle_desc.text,
           :ld_foreing,   
           0,   
           0,   
           null,   
           null,   
           :sle_note.text,   
           getdate(), 
			  :gs_cashier,    
           :ld_amount,   
           null,   
           null,   
           :ld_exchange_rate,
			  :ld_date_for)  ;

	
	If SQLCA.SQLCode <> 0 then
		Messagebox("Error Inserting Data","Error Inserting Transaccion_Diaria_Nat: "+SQLCA.SQLErrText,StopSign!)
		Return	
	End if
	
	lst_payers.addqueryad("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE GROUP_TYPE IN ('P') AND FLAG_GRUPO = 'A' ORDER BY name_main_branch;")
	em_amount.text 			= '0.00'
	em_exchange_rate.text 	= '1.00'
	em_foreing_amt.text 		= '0.00'
	sle_note.text 				= ''
	
	dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
	
	MessageBox("Data Saved","The purchase has been successfully submitted",Information!)
	
	setfocus(em_date)
else
	Messagebox("Canceled","The purchase was not submitted",Exclamation!)
end if
end event

type cb_clear from commandbutton within w_compras_div_nat
integer x = 1385
integer y = 768
integer width = 439
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear"
end type

event clicked;lst_payers.addqueryad("SELECT name_main_branch, id_main_branch FROM dba.group_branch WHERE GROUP_TYPE IN ('P') AND FLAG_GRUPO = 'A' ORDER BY name_main_branch;")
em_amount.text 			= '0.00'
em_exchange_rate.text 	= '1.00'
em_foreing_amt.text 		= '0.00'
sle_note.text 				= ''
em_date.text 				= string(today(),"mm/dd/yyyy")
em_date_for.text 			= string(today(),"mm/dd/yyyy")
dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
setfocus(lst_payers)
end event

type st_7 from statictext within w_compras_div_nat
integer x = 69
integer y = 100
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
string text = "Purchase Date :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date from editmask within w_compras_div_nat
integer x = 485
integer y = 88
integer width = 302
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

event losefocus;dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
end event

type st_6 from statictext within w_compras_div_nat
integer x = 69
integer y = 680
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
string text = "Purchase Notes :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_note from singlelineedit within w_compras_div_nat
integer x = 485
integer y = 664
integer width = 1783
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_compras_div_nat
integer x = 69
integer y = 296
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
string text = "Dollar Amount :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_amount from editmask within w_compras_div_nat
integer x = 485
integer y = 280
integer width = 512
integer height = 84
integer taborder = 40
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
string mask = "###########.00"
end type

event modified;em_foreing_amt.text = string(double(em_amount.text) * double(em_exchange_rate.text))
sle_desc.text = 'PURCHASE '+string(double(em_amount.text),"#######,##0.00")+' @ '+string(double(em_exchange_rate.text),"#####,##0.0000")
end event

type st_1 from statictext within w_compras_div_nat
integer x = 69
integer y = 192
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

type lst_payers from my_ddlb within w_compras_div_nat
integer x = 485
integer y = 184
integer width = 1042
integer height = 788
integer taborder = 30
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
//	lst_dest_bank.addquery("SELECT rtrim(bnkName) + ' ('+rtrim(bnkAccount)+')', bnkId FROM dba.WIREBANK WHERE id_main_branch = '"+ls_payer+"' ORDER BY 1")
else
//	lst_dest_bank.addquery("SELECT 'PLEASE SELECT A PAYER WITH A DEST ACC.', '--'")
end if
end event

type gb_1 from groupbox within w_compras_div_nat
integer x = 37
integer y = 20
integer width = 2313
integer height = 884
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

