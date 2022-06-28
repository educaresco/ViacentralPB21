$PBExportHeader$w_vctran_reconciliation.srw
forward
global type w_vctran_reconciliation from window
end type
type rb_sort_check_date from radiobutton within w_vctran_reconciliation
end type
type rb_sort_check_amount from radiobutton within w_vctran_reconciliation
end type
type sle_filter_desc from singlelineedit within w_vctran_reconciliation
end type
type sle_branch_filter from singlelineedit within w_vctran_reconciliation
end type
type rb_sort_date from radiobutton within w_vctran_reconciliation
end type
type rb_sort_amount from radiobutton within w_vctran_reconciliation
end type
type cb_clear_filterright from commandbutton within w_vctran_reconciliation
end type
type cb_clear_filterleft from commandbutton within w_vctran_reconciliation
end type
type cb_link from commandbutton within w_vctran_reconciliation
end type
type st_selection_right from statictext within w_vctran_reconciliation
end type
type st_selection_left from statictext within w_vctran_reconciliation
end type
type cbx_main_right from checkbox within w_vctran_reconciliation
end type
type cbx_main_left from checkbox within w_vctran_reconciliation
end type
type pb_date2 from picturebutton within w_vctran_reconciliation
end type
type cb_query from commandbutton within w_vctran_reconciliation
end type
type em_date2 from pfc_u_em within w_vctran_reconciliation
end type
type st_4 from statictext within w_vctran_reconciliation
end type
type pb_date1 from picturebutton within w_vctran_reconciliation
end type
type em_date1 from pfc_u_em within w_vctran_reconciliation
end type
type st_3 from statictext within w_vctran_reconciliation
end type
type dw_2 from datawindow within w_vctran_reconciliation
end type
type dw_1 from datawindow within w_vctran_reconciliation
end type
type gb_2 from groupbox within w_vctran_reconciliation
end type
type gb_1 from groupbox within w_vctran_reconciliation
end type
type gb_3 from groupbox within w_vctran_reconciliation
end type
type gb_4 from groupbox within w_vctran_reconciliation
end type
type gb_sort from groupbox within w_vctran_reconciliation
end type
end forward

global type w_vctran_reconciliation from window
boolean visible = false
integer x = 923
integer y = 424
integer width = 4946
integer height = 1976
boolean titlebar = true
string title = "Match Unidentified Funds"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
rb_sort_check_date rb_sort_check_date
rb_sort_check_amount rb_sort_check_amount
sle_filter_desc sle_filter_desc
sle_branch_filter sle_branch_filter
rb_sort_date rb_sort_date
rb_sort_amount rb_sort_amount
cb_clear_filterright cb_clear_filterright
cb_clear_filterleft cb_clear_filterleft
cb_link cb_link
st_selection_right st_selection_right
st_selection_left st_selection_left
cbx_main_right cbx_main_right
cbx_main_left cbx_main_left
pb_date2 pb_date2
cb_query cb_query
em_date2 em_date2
st_4 st_4
pb_date1 pb_date1
em_date1 em_date1
st_3 st_3
dw_2 dw_2
dw_1 dw_1
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
gb_sort gb_sort
end type
global w_vctran_reconciliation w_vctran_reconciliation

type variables
decimal ld_selected_right, ld_selected_left
String ls_filter_right
n_tr		SQLVIACHECKS

end variables

forward prototypes
public subroutine fn_clean_selection ()
public subroutine fn_filter_dw2 ()
end prototypes

public subroutine fn_clean_selection ();ld_selected_right = 0
ld_selected_left = 0

st_selection_left.text = String(ld_selected_left,"$#,###,##0.00")
st_selection_right.text = String(ld_selected_right,"$#,###,##0.00")

dw_1.SelectRow(0, FALSE)
dw_2.SelectRow(0, FALSE)


// Removes dw_1 filters
dw_1.SetFilter("")
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)	

// Removes dw_2 filters
dw_2.SetFilter("")
dw_2.SetRedraw(false)
dw_2.Filter()
dw_2.SetRedraw(true)	


cb_clear_filterright.enabled = false
cb_clear_filterleft.enabled = false

sle_branch_filter.text = ''
sle_filter_desc.text = ''
rb_sort_date.checked = true
ls_filter_right = ""

rb_sort_check_date.checked = true


end subroutine

public subroutine fn_filter_dw2 ();
string ls_DWfilter	

ls_DWfilter = ""

if len(ls_filter_right) > 1 then ls_DWfilter = ls_filter_right + " AND "
	
ls_DWfilter = ls_DWfilter + " (branches LIKE '%"+trim(sle_branch_filter.text) +"%') "  +  " AND ( (transaccion_diaria_payee_description_ LIKE '%"+trim(sle_filter_desc.text) +"%') OR (transaccion_diaria_payee_longdescription like '%"+trim(sle_filter_desc.text)+"%') )"	 

// for some reason the double % does not work!
ls_DWfilter = fn_replace(ls_DWfilter,'%%','%')

//messagebox("",ls_DWfilter)

dw_2.SetFilter(ls_DWfilter)
dw_2.SetRedraw(false)
dw_2.Filter()
dw_2.SetRedraw(true)
cb_clear_filterright.enabled = true
end subroutine

on w_vctran_reconciliation.create
this.rb_sort_check_date=create rb_sort_check_date
this.rb_sort_check_amount=create rb_sort_check_amount
this.sle_filter_desc=create sle_filter_desc
this.sle_branch_filter=create sle_branch_filter
this.rb_sort_date=create rb_sort_date
this.rb_sort_amount=create rb_sort_amount
this.cb_clear_filterright=create cb_clear_filterright
this.cb_clear_filterleft=create cb_clear_filterleft
this.cb_link=create cb_link
this.st_selection_right=create st_selection_right
this.st_selection_left=create st_selection_left
this.cbx_main_right=create cbx_main_right
this.cbx_main_left=create cbx_main_left
this.pb_date2=create pb_date2
this.cb_query=create cb_query
this.em_date2=create em_date2
this.st_4=create st_4
this.pb_date1=create pb_date1
this.em_date1=create em_date1
this.st_3=create st_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_sort=create gb_sort
this.Control[]={this.rb_sort_check_date,&
this.rb_sort_check_amount,&
this.sle_filter_desc,&
this.sle_branch_filter,&
this.rb_sort_date,&
this.rb_sort_amount,&
this.cb_clear_filterright,&
this.cb_clear_filterleft,&
this.cb_link,&
this.st_selection_right,&
this.st_selection_left,&
this.cbx_main_right,&
this.cbx_main_left,&
this.pb_date2,&
this.cb_query,&
this.em_date2,&
this.st_4,&
this.pb_date1,&
this.em_date1,&
this.st_3,&
this.dw_2,&
this.dw_1,&
this.gb_2,&
this.gb_1,&
this.gb_3,&
this.gb_4,&
this.gb_sort}
end on

on w_vctran_reconciliation.destroy
destroy(this.rb_sort_check_date)
destroy(this.rb_sort_check_amount)
destroy(this.sle_filter_desc)
destroy(this.sle_branch_filter)
destroy(this.rb_sort_date)
destroy(this.rb_sort_amount)
destroy(this.cb_clear_filterright)
destroy(this.cb_clear_filterleft)
destroy(this.cb_link)
destroy(this.st_selection_right)
destroy(this.st_selection_left)
destroy(this.cbx_main_right)
destroy(this.cbx_main_left)
destroy(this.pb_date2)
destroy(this.cb_query)
destroy(this.em_date2)
destroy(this.st_4)
destroy(this.pb_date1)
destroy(this.em_date1)
destroy(this.st_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_sort)
end on

event open;X=1
Y=1
Show()
//setfocus(lst_payers)




/*****csarmiento*******/
/***** mod: Oct/15/2013 
		get the database connection string from a file for Viachecks
**/
String  ls_servername, ls_id, ls_password, ls_db


ls_servername=ProfileString('ViaCentral.ini','VIACHECKS','ServerName','')
ls_id=ProfileString('ViaCentral.ini','VIACHECKS','LogId','')
ls_password=ProfileString('ViaCentral.ini','VIACHECKS','LogPass','')
ls_db=ProfileString('ViaCentral.ini','VIACHECKS','Database','')

/*****************/

// :::::::::::::::::::::::::::::::::::::::::
// LOGIN DB CONNECTION
n_tr		SQLVIACHECKS
SQLVIACHECKS 				= Create n_tr
SQLVIACHECKS.DBMS = "SNC SQL Native Client(OLE DB)"
SQLVIACHECKS.DBParm = "Database='"+ls_servername+"',TrimSpaces=1"
SQLVIACHECKS.LogPass 	=ls_password//  'r3mot3#@'
SQLVIACHECKS.ServerName = ls_servername //'192.168.11.100'
SQLVIACHECKS.LogId 		= ls_id  //'vcviacentral'
SQLVIACHECKS.AutoCommit = True
// :::::::::::::::::::::::::::::::::::::::::		



if SQLVIACHECKS.of_connect() <> 0 then
	MessageBox("Cannot Connect", "Cannot Connect to ViaChecks Database~n~r" + SQLVIACHECKS.sqlerrtext,stopsign!)
	return	
end if

fn_clean_selection()

dw_1.settransobject(SQLVIACHECKS)
dw_2.settransobject(SQLVIACHECKS)

end event

event key;//IF KeyDown(KeyUpArrow!) THEN 
//	MessageBox("UP","UP")
//END IF
//
//IF dw_2.GetRow() > 0 THEN
//	IF KeyDown(KeyUpArrow!) then
//		IF dw_2.GetRow() > 1 THEN
//			dw_2.SelectRow(0, FALSE)
//			dw_2.SelectRow(dw_2.GetRow() - 1, TRUE)
//			dw_2.SetRow(dw_2.GetRow() - 1)
//			dw_2.ScrollToRow(dw_2.GetRow() - 1)
//			Return
//		END IF
//	ELSEIF KeyDown(KeyDownArrow!) then
//		IF dw_2.GetRow() < dw_2.RowCount() THEN
//			dw_2.SelectRow(0, FALSE)
//			dw_2.SelectRow(dw_2.GetRow()+1, TRUE)
//			dw_2.SetRow(dw_2.GetRow()+1)
//			dw_2.ScrollToRow(dw_2.GetRow()+1)
//			Return
//		END IF
//	END IF
//END IF
end event

type rb_sort_check_date from radiobutton within w_vctran_reconciliation
integer x = 485
integer y = 276
integer width = 370
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check Date"
boolean checked = true
end type

event clicked;dw_1.SetRedraw(false)
dw_1.SetSort("checkdate A")
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type rb_sort_check_amount from radiobutton within w_vctran_reconciliation
integer x = 882
integer y = 276
integer width = 457
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check Amt (abs)"
end type

event clicked;dw_1.SetRedraw(false)
dw_1.SetSort("abs(checkamount) A")
dw_1.Sort()
dw_1.SetRedraw(true)
end event

type sle_filter_desc from singlelineedit within w_vctran_reconciliation
integer x = 3895
integer y = 220
integer width = 425
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;fn_filter_dw2()
end event

type sle_branch_filter from singlelineedit within w_vctran_reconciliation
integer x = 3342
integer y = 220
integer width = 425
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;fn_filter_dw2()
end event

type rb_sort_date from radiobutton within w_vctran_reconciliation
integer x = 2770
integer y = 184
integer width = 434
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date Bank"
boolean checked = true
end type

event clicked;dw_2.SetRedraw(false)
dw_2.SetSort("transaccion_diaria_banco_payee_datebank A")
dw_2.Sort()
dw_2.SetRedraw(true)
end event

type rb_sort_amount from radiobutton within w_vctran_reconciliation
integer x = 2770
integer y = 256
integer width = 434
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Amount (abs)"
end type

event clicked;dw_2.SetRedraw(false)
dw_2.SetSort("abs(transaccion_diaria_payee_amountcredit) A")
dw_2.Sort()
dw_2.SetRedraw(true)
end event

type cb_clear_filterright from commandbutton within w_vctran_reconciliation
integer x = 4393
integer y = 280
integer width = 439
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Clear Amt Filter"
end type

event clicked;
ls_filter_right = "" 

//dw_2.setfilter("")
//dw_2.filter()

fn_filter_dw2()

this.enabled = false

end event

type cb_clear_filterleft from commandbutton within w_vctran_reconciliation
integer x = 1906
integer y = 280
integer width = 434
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Clear Amt Filter"
end type

event clicked;dw_1.setfilter("")
dw_1.filter()
this.enabled = false

end event

type cb_link from commandbutton within w_vctran_reconciliation
integer x = 1925
integer y = 1728
integer width = 855
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Link (Reconcile)"
end type

event clicked;
double ld_checkid, ld_cons_trans_diaria
long ll_fix_row, ll_next_row

ll_fix_row = 0
ll_next_row = 0


///messagebox(string(dw_1.GetSelectedRow(0)),String(dw_2.GetSelectedRow(0)))

messagebox("Selected Records","Records: " + string(ld_selected_right) + " - " + String(ld_selected_left))


if (ld_selected_right = ld_selected_left) and (dw_1.GetSelectedRow(0)	> 0) and (dw_2.GetSelectedRow(0) > 0) then
//and ld_selected_right <> 0  then
	
	
	if cbx_main_left.checked then
		
		ld_checkid = 0
		ld_cons_trans_diaria = 0
		
		ll_fix_row = dw_1.GetSelectedRow(0)		
		ld_checkid = dw_1.getitemnumber(ll_fix_row,"checkid")
		ll_next_row = dw_2.GetSelectedRow(0)
				
		// until there is not more rows selected!
		do while ll_next_row <> 0
		
			ld_cons_trans_diaria = dw_2.getitemnumber(ll_next_row,"transaccion_diaria_payee_ref")
		
			if ld_checkid <> 0 and ld_cons_trans_diaria <> 0 then
				
				if ld_checkid <> 2356211 then dw_1.setitem(ll_fix_row,"flag_recon",1)
				dw_2.setitem(ll_next_row,"flag_recon",1)
						
						
				if ld_selected_left < 0 then					
					INSERT INTO ViaChecks.dbo.balanceCreditVoids (cons_trans_diaria,checkid)
					VALUES(:ld_cons_trans_diaria,:ld_checkid) USING SQLVIACHECKS;						
				else					
					INSERT INTO ViaChecks.dbo.balanceCreditExceptions (cons_trans_diaria,checkid)
					VALUES(:ld_cons_trans_diaria,:ld_checkid) USING SQLVIACHECKS;	
				end if


				if SQLVIACHECKS.SQLCode <> 0 then
					messagebox("Error Inserting Reconciliation Record","[Envie una imagen de este error a soporte@viamericas.com] chkId: "+String(ld_checkid)+"/ cons_trans_diaria: "+String(ld_cons_trans_diaria)+"~n~r"+SQLVIACHECKS.SQLErrText,StopSign!)					
					return
				end if									
						
						
			end if
			
			// search the next selected!
			ll_next_row = dw_2.GetSelectedRow(ll_next_row)	
		loop		
		
	elseif cbx_main_right.checked then
		
	
		ld_checkid = 0
		ld_cons_trans_diaria = 0
		
		ll_fix_row = dw_2.GetSelectedRow(0)	
		ld_cons_trans_diaria = dw_2.getitemnumber(ll_fix_row,"transaccion_diaria_payee_ref")
		ll_next_row = dw_1.GetSelectedRow(0)
				
		// until there is not more rows selected!
		do while ll_next_row <> 0
		
			ld_checkid = dw_1.getitemnumber(ll_next_row,"checkid")
		
			if ld_checkid <> 0 and ld_cons_trans_diaria <> 0 then

				if ld_checkid <> 2356211 then dw_1.setitem(ll_next_row,"flag_recon",1)
				dw_2.setitem(ll_fix_row,"flag_recon",1)				
				
				
				if ld_selected_left < 0 then	
					INSERT INTO ViaChecks.dbo.balanceCreditVoids (cons_trans_diaria,checkid)
					VALUES(:ld_cons_trans_diaria,:ld_checkid) USING SQLVIACHECKS;	
				else						
					INSERT INTO ViaChecks.dbo.balanceCreditExceptions (cons_trans_diaria,checkid)
					VALUES(:ld_cons_trans_diaria,:ld_checkid) USING SQLVIACHECKS;	
				end if

				if SQLVIACHECKS.SQLCode <> 0 then
					messagebox("Error Inserting Reconciliation Record","[Envie una imagen de este error a soporte@viamericas.com] chkId: "+String(ld_checkid)+"/ cons_trans_diaria: "+String(ld_cons_trans_diaria)+"~n~r"+SQLVIACHECKS.SQLErrText,StopSign!)					
					return
				end if				
												
			end if
			
			// search the next selected!
			ll_next_row = dw_1.GetSelectedRow(ll_next_row)	
		loop			
			
	else
		
		messagebox("Error","Unknown Operation (main dw error)",StopSign!)
		
	end if
	
	fn_clean_selection()
		
else
		
	messagebox("Error","Selected amounts do not balance!",StopSign!)					
		
end if


end event

type st_selection_right from statictext within w_vctran_reconciliation
integer x = 2423
integer y = 1636
integer width = 389
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "$1000"
boolean focusrectangle = false
end type

type st_selection_left from statictext within w_vctran_reconciliation
integer x = 1893
integer y = 1636
integer width = 389
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "$1000"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_main_right from checkbox within w_vctran_reconciliation
integer x = 2363
integer y = 292
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Main Table"
end type

event clicked;cbx_main_left.checked = not this.checked
fn_clean_selection()
end event

type cbx_main_left from checkbox within w_vctran_reconciliation
integer x = 23
integer y = 292
integer width = 379
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Main Table"
boolean checked = true
end type

event clicked;cbx_main_right.checked = not this.checked
fn_clean_selection()
end event

type pb_date2 from picturebutton within w_vctran_reconciliation
integer x = 1147
integer y = 60
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date2.Event pfc_DDCalendar( )
end event

type cb_query from commandbutton within w_vctran_reconciliation
integer x = 1326
integer y = 60
integer width = 366
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
boolean default = true
end type

event clicked;Datetime		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

dw_1.reset()
dw_2.reset()

dw_1.retrieve(ld_Fecha2)
dw_2.retrieve(ld_Fecha1,ld_Fecha2)

fn_clean_selection()

//dw_1.setfocus()

Setpointer(Arrow!)
end event

type em_date2 from pfc_u_em within w_vctran_reconciliation
integer x = 823
integer y = 64
integer width = 320
integer height = 84
integer taborder = 20
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

type st_4 from statictext within w_vctran_reconciliation
integer x = 713
integer y = 80
integer width = 101
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_date1 from picturebutton within w_vctran_reconciliation
integer x = 558
integer y = 60
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date1.Event pfc_DDCalendar( )
end event

type em_date1 from pfc_u_em within w_vctran_reconciliation
integer x = 233
integer y = 64
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

type st_3 from statictext within w_vctran_reconciliation
integer x = 59
integer y = 80
integer width = 165
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_vctran_reconciliation
integer x = 2363
integer y = 368
integer width = 2469
integer height = 1256
integer taborder = 50
string dataobject = "dw_vctrans_reconciliation_unmatchedcredits"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//if currentrow <> 0 then
//	SelectRow(0, FALSE)
//	SelectRow(currentrow, TRUE)
//	SetRow(currentrow)
//end if
end event

event sqlpreview;//string ls_sign =' '
//
//if not cbx_sign.checked then
//	ls_sign =   " AND   CREDIT_TRANS_DIARIA >= 0  "
//else
//	ls_sign =   " AND   CREDIT_TRANS_DIARIA <= 0  "
//end if
//
//is_syntax2  = ls_sign + is_syntax2
//sqlsyntax  += is_syntax2
//SetSQLPreview(sqlsyntax)
end event

event doubleclicked;//double ld_cons,ld_cons2, d_current_row
//
//if this.rowcount() >0  then
//	if id_row <> 0 then
//
//		ld_cons  = dw_2.getitemnumber(id_row,"cons_trans_diaria")
//		ld_cons2 = dw_1.getitemnumber(dw_1.getrow(),"cons_trans_diaria")
//		
//		if cbx_1.checked then // Esta creando un link
//			if 2 = messagebox('Warning','Do you want to link transaction # ('+STRING(ld_cons)+') with transaction # ('+string(ld_cons2)+')', question!,yesno!) then
//				return;
//			else
//				setpointer(hourglass!)
//				update dba.transaccion_diaria_payee set link_reference = :ld_cons  where cons_trans_diaria = :ld_cons2 and link_reference is null and id_group_trans_diaria = :is_payer;
//				if sqlca.sqlcode <> 0 then
//					setpointer(arrow!)
//					rollback;
//					messagebox('Error 1 ', sqlca.sqlerrtext)
//					return;
//				else 	
//					update dba.transaccion_diaria_payee set link_reference = :ld_cons2 where cons_trans_diaria = :ld_cons  and link_reference is null and id_group_trans_diaria = :is_payer;
//					if sqlca.sqlcode <> 0 then
//						setpointer(arrow!)
//						rollback;
//						messagebox('Error 1 ', sqlca.sqlerrtext)
//						return;
//					end if
//				end if 		
//				d_current_row = dw_2.getrow()
//				dw_2.retrieve(is_payer)
//				dw_2.scrolltorow(d_current_row)
//				dw_2.SelectRow(d_current_row, TRUE)
//				//cb_query.triggerevent(clicked!)
//				setpointer(arrow!)
//			end if 
//			
//		else // Esta removiendo un link
//			
//			messagebox('Pendiente', 'Opcion en desarrollo, consulte con tecnologia si requiere ayuda.',StopSign!)
//								
//		return
//		
//		end if			
//	end if 	
//end if 
end event

event clicked;long	ll_row

ll_row = this.GetClickedRow()

if row = 0 then 
	return
end if

if this.getitemnumber(ll_row,"flag_recon") = 1 then
	return
end if	

// If this is the main, it is only allow to select one!
if cbx_main_right.checked then
	this.SelectRow(0, false)
	dw_1.SelectRow(0, false)
	ld_selected_right = 0
	ld_selected_left = 0
end if

if (ll_row > 0) then
   	if (this.IsSelected(ll_row)) then
		this.SelectRow(ll_row, false)
		ld_selected_right = ld_selected_right - Truncate(this.getitemdecimal(ll_row,"transaccion_diaria_payee_amountcredit"),2)
   	else
		this.SelectRow(ll_row, true)		
		ld_selected_right = ld_selected_right + Truncate(this.getitemdecimal(ll_row,"transaccion_diaria_payee_amountcredit"),2)
	end if
end if

st_selection_right.text = String(ld_selected_right,"$#,###,##0.00")
st_selection_left.text = String(ld_selected_left,"$#,###,##0.00")

// Filters the other side by value
if cbx_main_right.checked then
	
	Double ld_amount
	ld_amount = this.getitemnumber(ll_row,"transaccion_diaria_payee_amountcredit")
		
	string ls_DWfilter
	ls_DWfilter = "checkamount = " + String(ld_amount)
	dw_1.SetFilter(ls_DWfilter)
	dw_1.SetRedraw(false)
	dw_1.Filter()
	dw_1.SetRedraw(true)
	cb_clear_filterleft.enabled = true
	
end if

end event

type dw_1 from datawindow within w_vctran_reconciliation
integer x = 23
integer y = 368
integer width = 2318
integer height = 1256
integer taborder = 40
string dataobject = "w_vctran_reconciliation_checks"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long	ll_row

ll_row = this.GetClickedRow()

if row = 0 then 
	return
end if

if this.getitemnumber(ll_row,"flag_recon") = 1 then
	return
end if	

// If this is the main, it is only allow to select one!
if cbx_main_left.checked then
	this.SelectRow(0, false)	
	dw_2.SelectRow(0, false)
	ld_selected_right = 0
	ld_selected_left = 0	
end if

if (ll_row > 0) then
   	if (this.IsSelected(ll_row)) then
		this.SelectRow(ll_row, false)
		ld_selected_left = ld_selected_left - Truncate(this.getitemdecimal(ll_row,"checkamount"),2)
   	else
		this.SelectRow(ll_row, true)
		ld_selected_left = ld_selected_left + Truncate(this.getitemdecimal(ll_row,"checkamount"),2)
	end if
end if

st_selection_left.text = String(ld_selected_left,"$#,###,##0.00")
st_selection_right.text = String(ld_selected_right,"$#,###,##0.00")





// Filters the other side by value
// The CheckID 2356211 is the dummy ($0) check id.
if cbx_main_left.checked and this.getitemnumber(ll_row,"checkid") <> 2356211 then
	
	Double ld_amount
	ld_amount = this.getitemnumber(ll_row,"checkamount")
		
	ls_filter_right = "transaccion_diaria_payee_amountcredit = " + String(ld_amount)
		
//	string ls_DWfilter	
//	ls_DWfilter = ls_filter_right + " and branches like '%"+trim(sle_branch_filter.text)+"%' and (transaccion_diaria_payee_description_ like '%"+trim(sle_filter_desc.text)+"%' or transaccion_diaria_payee_longdescription like '%"+trim(sle_filter_desc.text)+"%'"	
//	dw_2.SetFilter(ls_DWfilter)
//	dw_2.SetRedraw(false)
//	dw_2.Filter()
//	dw_2.SetRedraw(true)
	fn_filter_dw2()
	
	cb_clear_filterright.enabled = true
	
end if










//long	ll_row
//
//String	ls_branch
//Double	ld_amount, ld_cons
//dw_1.settransobject(sqlca)
//
//ll_row = dw_2.GetClickedRow ( )
//id_row = ll_row
//
//if row = 0 then row = ll_row
//
//if ll_row =  1 then
//	ld_cons = dw_2.getitemnumber(ll_row,"cons_trans_diaria")
//	if cbx_1.checked then
//		ld_amount  = (dw_2.getitemnumber(ll_row,"credit_trans_diaria")) * -1
//		is_syntax2 = 'AND credit_trans_diaria = '+STRING(ld_amount)+' AND LINK_REFERENCE IS NULL;'
//
//	else	
//		is_syntax2 = 'AND LINK_REFERENCE = '+STRING(LD_CONS)+';'
//	end if	
//	dw_1.scrolltorow(row)
//	dw_2.SelectRow(0, FALSE)
//	This.SelectRow(1, TRUE)
//	dw_1.SelectRow(0, FALSE)
//	dw_1.SelectRow(1, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(is_payer)
//	if cbx_1.checked then
//		if dw_1.rowcount() = 0 then
//			st_2.text = ' NO POSSIBLE MATCHES FOUND '
//		elseif dw_1.rowcount() = 1 then
//			st_2.text = ' 1 POSSIBLE MATCH FOUND '
//		else	
//			st_2.text = string(dw_1.rowcount()) + '  POSSIBLE MATCHES '
//		end if 	
//	end if 	
//	return
//elseif ll_row = 0 then
//	if CBX_1.checked then
//		st_1.text ='POSSIBLE MATCHES'
//	else
//		st_1.text ='LINKED TRANSACTIONS'
//	end if	
//	dw_2.SelectRow(0, FALSE)	
//	dw_1.SelectRow(0, FALSE)	
//	dw_1.reset()
//	Return
//else
//	ld_cons 		= dw_2.getitemnumber(ll_row,"cons_trans_diaria")
//	if cbx_1.checked then
//		ld_amount  = (dw_2.getitemnumber(ll_row,"credit_trans_diaria")) * -1
//		is_syntax2 = 'AND credit_trans_diaria = '+STRING(ld_amount)+' AND LINK_REFERENCE IS NULL;'
//
//	else
//		is_syntax2 	= 'AND LINK_REFERENCE = '+STRING(LD_CONS)+';'
//	end if	
//	This.SelectRow(0, FALSE)
//   This.SelectRow(row, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(is_payer)
//	if cbx_1.checked then
//		if dw_1.rowcount() = 0 then
//			st_2.text = ' NO POSSIBLE MATCHES FOUND '
//		elseif dw_1.rowcount() = 1 then
//			st_2.text = ' 1 POSSIBLE MATCH FOUND '
//		else	
//			st_2.text = string(dw_1.rowcount()) + '  POSSIBLE MATCHES '
//		end if 	
//	end if 	
//end if
//
end event

event doubleclicked;//
//String ls_Object
//string ls_sort,ls_desc
//double ld_cons,ld_return,ld_cons_comm,ld_debit
//ls_Object = String(dwo.name)
//
//dw_2.SetRedraw(false)
//if ib_asc1 then 
//	ls_sort = 'D' 
//	ib_asc1 = FALSE
//else 
//	ls_sort = 'A'
//	ib_asc1 = TRUE
//end if
//
//choose case ls_object
//		case 't_1'
//			dw_2.SetSort("#1 "+ls_sort)
//		case 't_2'
//			dw_2.SetSort("#2 "+ls_sort)
//		case 't_3'
//			dw_2.SetSort("#3 "+ls_sort)
//		case 't_4'
//			dw_2.SetSort("#4 "+ls_sort)
//		case 't_5'
//			dw_2.SetSort("#5 "+ls_sort)
//		case else 
//			dw_2.SetRedraw(true)
//			return
//end choose
//
//
//dw_1.reset()
//dw_2.Sort()
//dw_2.SetRedraw(true)
//if CBX_1.checked then
//	st_1.text ='POSSIBLE MATCHES'
//else
//	st_1.text ='LINKED TRANSACTIONS'
//end if	
//
//
end event

event rowfocuschanged;//if currentrow <> 0 then
//	SelectRow(0, FALSE)
//	SelectRow(currentrow, TRUE)
//	SetRow(currentrow)
//end if
end event

event sqlpreview;//string ls_add,ls_sign =''
//
//if cbx_sign.checked then
//	ls_sign =   " AND   CREDIT_TRANS_DIARIA >= 0  "
//else
//	ls_sign =   " AND   CREDIT_TRANS_DIARIA <= 0  "
//end if
//
//if cbx_1.checked then
//	ls_add = ls_sign + " AND link_reference IS NULL; "
//else
//	ls_add = ls_sign + " AND link_reference IS NOT NULL; "
//end if 
//
//sqlsyntax += ls_add
//SetSQLPreview(sqlsyntax)
end event

event retrieveend;//double ld_cons,ld_amount
//if this.rowcount() = 0 then
//	dw_1.reset()
//	return
//end if 
//   id_row=1
//	ld_cons = dw_2.getitemnumber(1,"cons_trans_diaria")
//	if cbx_1.checked then
//		ld_amount  = (dw_2.getitemnumber(1,"credit_trans_diaria")) * -1
//		is_syntax2 = 'AND credit_trans_diaria = '+STRING(ld_amount)+' AND LINK_REFERENCE IS NULL;'
//
//	else	
//		is_syntax2 = 'AND LINK_REFERENCE = '+STRING(LD_CONS)+';'
//	end if	
//	dw_1.scrolltorow(1)
//	dw_2.SelectRow(0, FALSE)
//	This.SelectRow(1, TRUE)
//	dw_1.SelectRow(0, FALSE)
//	dw_1.SelectRow(1, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(is_payer)
//	if cbx_1.checked then
//		if dw_1.rowcount() = 0 then
//			st_2.text = ' NO POSSIBLE MATCHES FOUND '
//		elseif dw_1.rowcount() = 1 then
//			st_2.text = ' 1 POSSIBLE MATCH FOUND '
//		else	
//			st_2.text = string(dw_1.rowcount()) + '  POSSIBLE MATCHES '
//		end if 	
//	end if 	
//	return
end event

type gb_2 from groupbox within w_vctran_reconciliation
integer x = 18
integer width = 1737
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Range"
end type

type gb_1 from groupbox within w_vctran_reconciliation
integer x = 3287
integer y = 112
integer width = 535
integer height = 244
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter Branches"
end type

type gb_3 from groupbox within w_vctran_reconciliation
integer x = 3840
integer y = 112
integer width = 535
integer height = 244
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter Desc"
end type

type gb_4 from groupbox within w_vctran_reconciliation
integer x = 439
integer y = 212
integer width = 928
integer height = 144
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sort"
end type

type gb_sort from groupbox within w_vctran_reconciliation
integer x = 2734
integer y = 112
integer width = 535
integer height = 244
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sort"
end type

