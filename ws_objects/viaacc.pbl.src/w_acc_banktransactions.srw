$PBExportHeader$w_acc_banktransactions.srw
forward
global type w_acc_banktransactions from w2_master_report_dates
end type
type rb_system from radiobutton within w_acc_banktransactions
end type
type rb_bank from radiobutton within w_acc_banktransactions
end type
type cbx_dp from checkbox within w_acc_banktransactions
end type
type cbx_ach from checkbox within w_acc_banktransactions
end type
type cbx_da from checkbox within w_acc_banktransactions
end type
type cbx_others from checkbox within w_acc_banktransactions
end type
type lst_banks from my_ddlb within w_acc_banktransactions
end type
type st_1 from st_3 within w_acc_banktransactions
end type
type sle_selection from singlelineedit within w_acc_banktransactions
end type
type cb_move from commandbutton within w_acc_banktransactions
end type
type tab_move from tab within w_acc_banktransactions
end type
type tp from userobject within tab_move
end type
type pb_datechg from picturebutton within tp
end type
type st_2 from statictext within tp
end type
type lst_bankchg from my_ddlb within tp
end type
type em_datechg from pfc_u_em within tp
end type
type cbx_chgdate from checkbox within tp
end type
type cbx_chgbnk from checkbox within tp
end type
type cb_movecancel from commandbutton within tp
end type
type cb_moveok from commandbutton within tp
end type
type tp from userobject within tab_move
pb_datechg pb_datechg
st_2 st_2
lst_bankchg lst_bankchg
em_datechg em_datechg
cbx_chgdate cbx_chgdate
cbx_chgbnk cbx_chgbnk
cb_movecancel cb_movecancel
cb_moveok cb_moveok
end type
type tab_move from tab within w_acc_banktransactions
tp tp
end type
type cbx_cc from checkbox within w_acc_banktransactions
end type
type gb_2 from groupbox within w_acc_banktransactions
end type
type gb_3 from groupbox within w_acc_banktransactions
end type
type gb_4 from groupbox within w_acc_banktransactions
end type
type gb_5 from groupbox within w_acc_banktransactions
end type
type gb_6 from groupbox within w_acc_banktransactions
end type
type gb_7 from groupbox within w_acc_banktransactions
end type
end forward

global type w_acc_banktransactions from w2_master_report_dates
integer width = 3662
integer height = 1928
string title = "Bank Transactions"
rb_system rb_system
rb_bank rb_bank
cbx_dp cbx_dp
cbx_ach cbx_ach
cbx_da cbx_da
cbx_others cbx_others
lst_banks lst_banks
st_1 st_1
sle_selection sle_selection
cb_move cb_move
tab_move tab_move
cbx_cc cbx_cc
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
gb_7 gb_7
end type
global w_acc_banktransactions w_acc_banktransactions

forward prototypes
public subroutine fnupdateselection ()
public subroutine fnhideoptions ()
end prototypes

public subroutine fnupdateselection ();integer 	i
long 		ll_count
double 	ld_total_cr, ld_total_db

ld_total_cr = 0
ld_total_db = 0
ll_count = 0

fnHideOptions()

for i = 1 to dw_1.rowcount()
	if dw_1.IsSelected(i) then
		
		ll_count++
		ld_total_cr += dw_1.Object.Data[i,7]
		ld_total_db += dw_1.Object.Data[i,6]
		
		//messagebox("",string(dw_1.Object.Data[i,1]))
		
	end if
next

if ll_count > 0 then
	cb_move.enabled = true
else
	cb_move.enabled = false
end if

sle_selection.text = string(ll_count) + ' Transactions Selected.   Total Credits Selected: '+string(ld_total_cr,"$#######,###.00")+'   Total Debits Selected: '+string(ld_total_db,"$#######,###.00")
end subroutine

public subroutine fnhideoptions ();
tab_move.visible = false
tab_move.tp.lst_bankchg.SelectItem(1)
tab_move.tp.em_datechg.text = String(Today())
tab_move.tp.cbx_chgdate.checked = false
tab_move.tp.cbx_chgbnk.checked = false

tab_move.tp.lst_bankchg.enabled = false
tab_move.tp.em_datechg.enabled = false
tab_move.tp.pb_datechg.enabled = false



end subroutine

on w_acc_banktransactions.create
int iCurrent
call super::create
this.rb_system=create rb_system
this.rb_bank=create rb_bank
this.cbx_dp=create cbx_dp
this.cbx_ach=create cbx_ach
this.cbx_da=create cbx_da
this.cbx_others=create cbx_others
this.lst_banks=create lst_banks
this.st_1=create st_1
this.sle_selection=create sle_selection
this.cb_move=create cb_move
this.tab_move=create tab_move
this.cbx_cc=create cbx_cc
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
this.gb_7=create gb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_system
this.Control[iCurrent+2]=this.rb_bank
this.Control[iCurrent+3]=this.cbx_dp
this.Control[iCurrent+4]=this.cbx_ach
this.Control[iCurrent+5]=this.cbx_da
this.Control[iCurrent+6]=this.cbx_others
this.Control[iCurrent+7]=this.lst_banks
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.sle_selection
this.Control[iCurrent+10]=this.cb_move
this.Control[iCurrent+11]=this.tab_move
this.Control[iCurrent+12]=this.cbx_cc
this.Control[iCurrent+13]=this.gb_2
this.Control[iCurrent+14]=this.gb_3
this.Control[iCurrent+15]=this.gb_4
this.Control[iCurrent+16]=this.gb_5
this.Control[iCurrent+17]=this.gb_6
this.Control[iCurrent+18]=this.gb_7
end on

on w_acc_banktransactions.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_system)
destroy(this.rb_bank)
destroy(this.cbx_dp)
destroy(this.cbx_ach)
destroy(this.cbx_da)
destroy(this.cbx_others)
destroy(this.lst_banks)
destroy(this.st_1)
destroy(this.sle_selection)
destroy(this.cb_move)
destroy(this.tab_move)
destroy(this.cbx_cc)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.gb_7)
end on

event open;call super::open;lst_banks.addquery("SELECT '[ ALL BANKS ]', '-ALL-' UNION SELECT SHORTNAME_BANCO + ' (' + RIGHT(RTRIM(ID_CUENTA_BANCO),5) + ')',ID_CUENTA_BANCO FROM dba.BANCO, dba.CUENTA_BANCO WHERE dba.BANCO.ID_BANCO = dba.CUENTA_BANCO.ID_BANCO ORDER BY 1;")
tab_move.tp.lst_bankchg.addquery("SELECT '[ SELECT ONE ]', '-NONE-' UNION SELECT SHORTNAME_BANCO + ' (' + RIGHT(RTRIM(ID_CUENTA_BANCO),5) + ')',ID_CUENTA_BANCO FROM dba.BANCO, dba.CUENTA_BANCO WHERE dba.BANCO.ID_BANCO = dba.CUENTA_BANCO.ID_BANCO ORDER BY 1;")
tab_move.visible = false
end event

type st_4 from w2_master_report_dates`st_4 within w_acc_banktransactions
integer x = 549
integer y = 164
end type

type st_3 from w2_master_report_dates`st_3 within w_acc_banktransactions
integer x = 489
integer y = 72
integer width = 160
end type

type cb_query from w2_master_report_dates`cb_query within w_acc_banktransactions
integer x = 2953
integer y = 92
integer taborder = 40
end type

event cb_query::clicked;call super::clicked;fnupdateselection()
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_acc_banktransactions
integer x = 983
integer y = 52
end type

event pb_date1::clicked;call super::clicked;fnHideOptions()
end event

type em_date1 from w2_master_report_dates`em_date1 within w_acc_banktransactions
integer x = 658
integer y = 56
end type

event em_date1::modified;call super::modified;fnHideOptions()
end event

type pb_date2 from w2_master_report_dates`pb_date2 within w_acc_banktransactions
integer x = 983
integer y = 144
end type

event pb_date2::clicked;call super::clicked;fnHideOptions()
end event

type em_date2 from w2_master_report_dates`em_date2 within w_acc_banktransactions
integer x = 658
integer y = 148
end type

event em_date2::modified;call super::modified;fnHideOptions()
end event

type dw_1 from w2_master_report_dates`dw_1 within w_acc_banktransactions
integer y = 400
integer width = 3570
integer height = 1300
string dataobject = "dw_acc_banktransactions"
end type

event dw_1::sqlpreview;call super::sqlpreview;String ls_filter, ls_tipos

ls_filter = ""
ls_tipos = ""

if rb_system.checked then
		ls_filter += " AND dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= '"+String(date(em_date1.text),"yyyy-mm-dd")+" 00:00:00'"
		ls_filter += " AND dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= '"+String(date(em_date2.text),"yyyy-mm-dd")+" 23:59:59'"
else
		ls_filter += " AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE >= '"+String(date(em_date1.text),"yyyy-mm-dd")+" 00:00:00'"
		ls_filter += " AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.RECONCILIATIONDATE <= '"+String(date(em_date2.text),"yyyy-mm-dd")+" 23:59:59'"	
end if


if cbx_ach.checked then
	ls_tipos += "'ACH',"
end if

if cbx_da.checked then
	ls_tipos += "'DA',"
end if

if cbx_dp.checked then
	ls_tipos += "'DP',"
end if

if cbx_cc.checked then
	ls_tipos += "'CCC','CCD','CCK','CCL','CCM','CCR','CCW','CCY',"
end if

if cbx_others.checked then
	ls_tipos = "TODOS NO SE USA ESTA VAR"
end if


if ls_tipos = "" then
	ls_filter += " AND dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE = 'abcdefghi' "
else
	
	if not cbx_others.checked then
		ls_tipos = left(ls_tipos,len(ls_tipos)-1)
		ls_filter += " AND dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE IN ("+ls_tipos+") "	
	end if	
	
end if

if lst_banks.getdataid() <> '-ALL-' then
	ls_filter += " AND dba.TRANSACCION_DIARIA_BANCO_PAYEE.ID_CUENTA_BANCO = '"+lst_banks.getdataid()+"' "
end if

//Messagebox("",ls_filter)

dw_1.setsqlpreview(sqlsyntax+ls_filter)



end event

event dw_1::constructor;call super::constructor;//this.of_SetRowSelect(TRUE) -- funciona con seleccion simple
end event

event dw_1::clicked;call super::clicked;boolean result

result = not this.IsSelected(Row)

if Row > 0 then this.SelectRow(Row, result)

fnUpdateSelection()
end event

type gb_1 from w2_master_report_dates`gb_1 within w_acc_banktransactions
boolean visible = false
integer width = 3570
integer height = 264
end type

type rb_system from radiobutton within w_acc_banktransactions
integer x = 46
integer y = 156
integer width = 389
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "System Date"
end type

event clicked;fnHideOptions()
end event

type rb_bank from radiobutton within w_acc_banktransactions
integer x = 46
integer y = 76
integer width = 389
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Bank Date"
boolean checked = true
end type

event clicked;fnHideOptions()
end event

type cbx_dp from checkbox within w_acc_banktransactions
integer x = 1655
integer y = 56
integer width = 261
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Wires"
end type

event clicked;fnHideOptions()
end event

type cbx_ach from checkbox within w_acc_banktransactions
integer x = 1189
integer y = 116
integer width = 416
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "ACH - EChecks"
boolean checked = true
end type

event clicked;fnHideOptions()
end event

type cbx_da from checkbox within w_acc_banktransactions
integer x = 1189
integer y = 56
integer width = 416
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Deposits"
boolean checked = true
end type

event clicked;fnHideOptions()
end event

type cbx_others from checkbox within w_acc_banktransactions
integer x = 1189
integer width = 178
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "All"
end type

event clicked;cbx_dp.enabled = not this.checked
cbx_ach.enabled = not this.checked
cbx_da.enabled = not this.checked
cbx_cc.enabled = not this.checked
fnHideOptions()


end event

type lst_banks from my_ddlb within w_acc_banktransactions
integer x = 2272
integer y = 56
integer width = 530
integer height = 860
integer taborder = 30
boolean bringtotop = true
end type

event selectionchanged;call super::selectionchanged;fnHideOptions()
end event

type st_1 from st_3 within w_acc_banktransactions
integer x = 2007
integer y = 68
integer width = 242
boolean bringtotop = true
string text = "Bank/Acc:"
end type

type sle_selection from singlelineedit within w_acc_banktransactions
integer x = 50
integer y = 288
integer width = 2802
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type cb_move from commandbutton within w_acc_banktransactions
integer x = 2953
integer y = 276
integer width = 366
integer height = 92
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Move Selected"
end type

event clicked;tab_move.visible = not tab_move.visible
end event

type tab_move from tab within w_acc_banktransactions
integer x = 2208
integer y = 368
integer width = 1111
integer height = 524
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean focusonbuttondown = true
boolean showtext = false
boolean showpicture = false
integer selectedtab = 1
tp tp
end type

on tab_move.create
this.tp=create tp
this.Control[]={this.tp}
end on

on tab_move.destroy
destroy(this.tp)
end on

type tp from userobject within tab_move
integer x = 18
integer y = 48
integer width = 1074
integer height = 460
long backcolor = 79741120
string text = "none"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
pb_datechg pb_datechg
st_2 st_2
lst_bankchg lst_bankchg
em_datechg em_datechg
cbx_chgdate cbx_chgdate
cbx_chgbnk cbx_chgbnk
cb_movecancel cb_movecancel
cb_moveok cb_moveok
end type

on tp.create
this.pb_datechg=create pb_datechg
this.st_2=create st_2
this.lst_bankchg=create lst_bankchg
this.em_datechg=create em_datechg
this.cbx_chgdate=create cbx_chgdate
this.cbx_chgbnk=create cbx_chgbnk
this.cb_movecancel=create cb_movecancel
this.cb_moveok=create cb_moveok
this.Control[]={this.pb_datechg,&
this.st_2,&
this.lst_bankchg,&
this.em_datechg,&
this.cbx_chgdate,&
this.cbx_chgbnk,&
this.cb_movecancel,&
this.cb_moveok}
end on

on tp.destroy
destroy(this.pb_datechg)
destroy(this.st_2)
destroy(this.lst_bankchg)
destroy(this.em_datechg)
destroy(this.cbx_chgdate)
destroy(this.cbx_chgbnk)
destroy(this.cb_movecancel)
destroy(this.cb_moveok)
end on

type pb_datechg from picturebutton within tp
integer x = 823
integer y = 104
integer width = 110
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_datechg.Event pfc_DDCalendar( )
end event

type st_2 from statictext within tp
integer x = 59
integer y = 8
integer width = 873
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Move selected transactions to:"
boolean focusrectangle = false
end type

type lst_bankchg from my_ddlb within tp
integer x = 503
integer y = 216
integer width = 530
integer height = 860
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
end type

type em_datechg from pfc_u_em within tp
integer x = 503
integer y = 108
integer width = 320
integer height = 84
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))
end event

type cbx_chgdate from checkbox within tp
integer x = 69
integer y = 116
integer width = 416
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Bank Date To:"
end type

event clicked;
tab_move.tp.em_datechg.enabled = this.checked
tab_move.tp.pb_datechg.enabled = this.checked
end event

type cbx_chgbnk from checkbox within tp
integer x = 69
integer y = 228
integer width = 416
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Bank/Acc To:"
end type

event clicked;
tab_move.tp.lst_bankchg.enabled = this.checked

end event

type cb_movecancel from commandbutton within tp
integer x = 366
integer y = 348
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;fnHideOptions()
end event

type cb_moveok from commandbutton within tp
integer x = 713
integer y = 348
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Apply"
end type

event clicked;String 	ls_msg, ls_cuenta, ls_banco
datetime	ld_date_inicio, ld_date_final, ld_newdate	
integer 	i
long 		ll_count
double	ld_cons

SetPointer(HourGlass!)

ls_msg = 'Are you sure that you want to modify the '

// *********************************************************************************************
// Validaciones

if not tab_move.tp.cbx_chgdate.checked and not tab_move.tp.cbx_chgbnk.checked then
	messagebox("Error","Please select the modification",StopSign!)
	Return	
end if


if tab_move.tp.cbx_chgdate.checked then	

	//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	// Verificar si la fecha no esta bloqueada	
					
	SELECT dba.ACC_PARAMETERS.DATE_BLOCKER,   
		 	 dba.ACC_PARAMETERS.DATE_BLOCKER_POST  
	  INTO :ld_date_inicio,   
			 :ld_date_final  
	  FROM dba.ACC_PARAMETERS;
	
	ld_newdate = datetime(date(tab_move.tp.em_datechg.text),time('00:00:00'))
	
	if ( ld_date_inicio <= ld_newdate ) and ( ld_date_final >= ld_newdate ) then		
	else
		messagebox("Error","The date you are using was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
		Return
	end if
	//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	ls_msg += "BANK-DATE "
	if tab_move.tp.cbx_chgbnk.checked then ls_msg += "and "		

end if

if tab_move.tp.cbx_chgbnk.checked then
	
	if tab_move.tp.lst_bankchg.GetDataId() = '-NONE-' then
		messagebox("Error","You must select a destination bank/account.",StopSign!)
		Return				
	end if	

	ls_msg += "BANK-ACCOUNT "

	ls_cuenta = tab_move.tp.lst_bankchg.GetDataId()
	
	SELECT ID_BANCO
	INTO :ls_banco
	FROM dba.CUENTA_BANCO
	WHERE ID_CUENTA_BANCO = :ls_cuenta;	

end if

// *********************************************************************************************

for i = 1 to dw_1.rowcount()
	if dw_1.IsSelected(i) then		
		ll_count++	
	end if
next

ls_msg += "for "+TRIM(STRING(ll_count))+" transactions?"

if messagebox("Confirmation",ls_msg,Question!,yesno!) = 1 then

	// *********************************************************************************************
	// Actualizando Registros
	for i = 1 to dw_1.rowcount()
		if dw_1.IsSelected(i) then
			
			ld_cons = dw_1.Object.Data[i,1]
			
			if tab_move.tp.cbx_chgdate.checked then							
				
				UPDATE dba.TRANSACCION_DIARIA_BANCO_PAYEE 
				   SET RECONCILIATIONDATE = :ld_newdate
				 WHERE CONS_TRANS_DIARIA = :ld_cons;
				 
				if SQLCA.SQLCODE <> 0 then
					messagebox("Error Updating BANK-DATE","Error updating data please contact support.~n"+SQLCA.SQLErrText,StopSign!)
					Return	 
				end if							 
				 
			end if
			
			if tab_move.tp.cbx_chgbnk.checked then
				
				UPDATE dba.TRANSACCION_DIARIA_BANCO_PAYEE 
					SET ID_BANCO = :ls_banco,
					    ID_CUENTA_BANCO = :ls_cuenta
				 WHERE CONS_TRANS_DIARIA = :ld_cons;

				if SQLCA.SQLCODE <> 0 then
					messagebox("Error Updating BANK-ACCOUNT","Error updating data please contact support.~n"+SQLCA.SQLErrText,StopSign!)
					Return
				end if				 			
							 
			end if
			
		end if
	next	
	// *********************************************************************************************
	
	cb_query.triggerEvent(Clicked!)
	
	messagebox("Done","Process Completed")
	
end if

SetPointer(Arrow!)
end event

type cbx_cc from checkbox within w_acc_banktransactions
integer x = 1189
integer y = 172
integer width = 416
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "CC - Trans."
boolean checked = true
end type

event clicked;fnHideOptions()
end event

type gb_2 from groupbox within w_acc_banktransactions
integer x = 18
integer width = 443
integer height = 260
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type gb_3 from groupbox within w_acc_banktransactions
integer x = 453
integer width = 672
integer height = 260
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type gb_4 from groupbox within w_acc_banktransactions
integer x = 1115
integer width = 832
integer height = 260
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type gb_5 from groupbox within w_acc_banktransactions
integer x = 1938
integer width = 933
integer height = 260
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type gb_6 from groupbox within w_acc_banktransactions
integer x = 2866
integer width = 521
integer height = 260
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type gb_7 from groupbox within w_acc_banktransactions
integer x = 18
integer y = 228
integer width = 3369
integer height = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

