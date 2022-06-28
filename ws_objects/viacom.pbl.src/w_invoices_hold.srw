$PBExportHeader$w_invoices_hold.srw
forward
global type w_invoices_hold from window
end type
type st_12 from statictext within w_invoices_hold
end type
type lst_segmentation from my_ddlb within w_invoices_hold
end type
type st_11 from statictext within w_invoices_hold
end type
type lb_tipos_hold from listbox within w_invoices_hold
end type
type st_10 from statictext within w_invoices_hold
end type
type sle_branch from singlelineedit within w_invoices_hold
end type
type st_9 from statictext within w_invoices_hold
end type
type cb_sort from commandbutton within w_invoices_hold
end type
type cb_8 from commandbutton within w_invoices_hold
end type
type st_8 from statictext within w_invoices_hold
end type
type ddlb_sort from dropdownlistbox within w_invoices_hold
end type
type st_2 from statictext within w_invoices_hold
end type
type cb_add_hold from commandbutton within w_invoices_hold
end type
type cb_refresh from commandbutton within w_invoices_hold
end type
type cb_ofac_review from commandbutton within w_invoices_hold
end type
type pb_print from picturebutton within w_invoices_hold
end type
type cb_complaints from commandbutton within w_invoices_hold
end type
type cb_cancel from commandbutton within w_invoices_hold
end type
type cb_faxes from commandbutton within w_invoices_hold
end type
type cb_analysis from commandbutton within w_invoices_hold
end type
type cb_7 from commandbutton within w_invoices_hold
end type
type cb_5 from commandbutton within w_invoices_hold
end type
type cb_4 from commandbutton within w_invoices_hold
end type
type cb_3 from commandbutton within w_invoices_hold
end type
type cb_2 from commandbutton within w_invoices_hold
end type
type cb_liberar from commandbutton within w_invoices_hold
end type
type dw_3 from datawindow within w_invoices_hold
end type
type cb_saveas from commandbutton within w_invoices_hold
end type
type rb_suspicious from radiobutton within w_invoices_hold
end type
type rb_history from radiobutton within w_invoices_hold
end type
type cb_cancelados from commandbutton within w_invoices_hold
end type
type cb_anulados from commandbutton within w_invoices_hold
end type
type gb_1 from groupbox within w_invoices_hold
end type
type dw_4 from datawindow within w_invoices_hold
end type
type cb_senderid from commandbutton within w_invoices_hold
end type
type tab_add_hold from tab within w_invoices_hold
end type
type tp1 from userobject within tab_add_hold
end type
type st_7 from statictext within tp1
end type
type cb_6 from commandbutton within tp1
end type
type cb_add_hold_save from commandbutton within tp1
end type
type cb_1 from commandbutton within tp1
end type
type em_receiver from editmask within tp1
end type
type em_branch from editmask within tp1
end type
type st_status from statictext within tp1
end type
type st_amount from statictext within tp1
end type
type st_6 from statictext within tp1
end type
type st_5 from statictext within tp1
end type
type st_receiver_name from statictext within tp1
end type
type st_4 from statictext within tp1
end type
type st_3 from statictext within tp1
end type
type st_sender_name from statictext within tp1
end type
type st_1 from statictext within tp1
end type
type tp1 from userobject within tab_add_hold
st_7 st_7
cb_6 cb_6
cb_add_hold_save cb_add_hold_save
cb_1 cb_1
em_receiver em_receiver
em_branch em_branch
st_status st_status
st_amount st_amount
st_6 st_6
st_5 st_5
st_receiver_name st_receiver_name
st_4 st_4
st_3 st_3
st_sender_name st_sender_name
st_1 st_1
end type
type tab_add_hold from tab within w_invoices_hold
tp1 tp1
end type
type dw_2 from datawindow within w_invoices_hold
end type
type em_date_fin from u_em within w_invoices_hold
end type
type em_date_ini from u_em within w_invoices_hold
end type
end forward

global type w_invoices_hold from window
integer x = 923
integer y = 424
integer width = 4914
integer height = 2084
boolean titlebar = true
string title = "Invoices Hold"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
event ue_postopen ( )
st_12 st_12
lst_segmentation lst_segmentation
st_11 st_11
lb_tipos_hold lb_tipos_hold
st_10 st_10
sle_branch sle_branch
st_9 st_9
cb_sort cb_sort
cb_8 cb_8
st_8 st_8
ddlb_sort ddlb_sort
st_2 st_2
cb_add_hold cb_add_hold
cb_refresh cb_refresh
cb_ofac_review cb_ofac_review
pb_print pb_print
cb_complaints cb_complaints
cb_cancel cb_cancel
cb_faxes cb_faxes
cb_analysis cb_analysis
cb_7 cb_7
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_liberar cb_liberar
dw_3 dw_3
cb_saveas cb_saveas
rb_suspicious rb_suspicious
rb_history rb_history
cb_cancelados cb_cancelados
cb_anulados cb_anulados
gb_1 gb_1
dw_4 dw_4
cb_senderid cb_senderid
tab_add_hold tab_add_hold
dw_2 dw_2
em_date_fin em_date_fin
em_date_ini em_date_ini
end type
global w_invoices_hold w_invoices_hold

type variables
string is_orden
end variables

forward prototypes
public subroutine fn_refresh_screen ()
public subroutine fn_retrieve ()
public function string fn_get_holds_id ()
public function boolean fn_validate_status_transaction (string as_branch, double ad_receiver)
end prototypes

event ue_postopen();Show()

//fn_refresh_screen()
//dw_2.retrieve('-ALL-')

tab_add_hold.visible = false

//em_date_ini.text = (string(date('20/01/2017'),"mm/dd/yyyy"))
em_date_ini.text =  (string(RelativeDate(today(),  - 4),"mm/dd/yyyy"))
em_date_fin.text = (string(today(),"mm/dd/yyyy"))

fn_retrieve()

//Close(w_please_wait_rojo)
end event

public subroutine fn_refresh_screen ();
end subroutine

public subroutine fn_retrieve ();date ld_fecha_max, ld_fecha_min
string ls_branch, ls_lista_holds
//int li_vip_branches

dw_2.SetRedraw(false)

ls_branch = sle_branch.text

IF ls_branch = '' THEN setNull(ls_branch)

ld_fecha_min = date(em_date_ini.text)
ld_fecha_max = date(em_date_fin.text)

ls_lista_holds = fn_get_holds_id()

//li_vip_branches = 0
//IF cbx_vip_branches.checked THEN li_vip_branches = 1

//dw_2.retrieve( lst_holds.getdataid(), ls_branch, ld_fecha_max)

IF dw_2.retrieve(ls_lista_holds, ls_branch, ld_fecha_min, ld_fecha_max, trim(lst_segmentation.getdataid())) = 0 THEN 
	messagebox('No Data', 'No data was found with filter entered')
END IF

//if ddlb_sort.SelectedText() = "Branch / Transaction" then
//	dw_2.SetSort("#2 A, #3 A")
//elseif ddlb_sort.SelectedText() = "Date" then
//	dw_2.SetSort("#4 A")
//else
//	dw_2.SetSort("#18 A")
//end if
//
//dw_2.Sort()
dw_2.SetRedraw(true)
end subroutine

public function string fn_get_holds_id ();String ls_list = ''
String ls_delimiter = ''
Long ll_item, ll_items
string ls_item

ll_items = lb_tipos_hold.TotalItems()

FOR ll_item = 1 TO ll_items
	IF lb_tipos_hold.State(ll_item) = 1 THEN
		ls_item =  trim(fn_token(lb_tipos_hold.Text(ll_item),'*',2)) 
		ls_list += ls_delimiter + ls_item
		ls_delimiter = ","
		
		IF ls_item = '-ALL-' THEN EXIT
	END IF
NEXT

return ls_list
end function

public function boolean fn_validate_status_transaction (string as_branch, double ad_receiver);integer li_count


SELECT Count(DBA.BRANCH.id_state)
INTO :li_count
FROM DBA.RECEIVER WITH (NOLOCK)
	INNER JOIN	DBA.SENDER WITH (NOLOCK)ON	dba.SENDER.ID_SENDER = DBA.RECEIVER.ID_SENDER	
	INNER JOIN	DBA.BRANCH WITH (NOLOCK)ON	DBA.RECEIVER.ID_BRANCH = DBA.SENDER.ID_BRANCH	
												AND	DBA.RECEIVER.ID_BRANCH = DBA.BRANCH.ID_BRANCH 
	INNER JOIN	dba.MOTIVO_HOLD WITH(NOLOCK) ON	DBA.RECEIVER.ID_SENDER = DBA.MOTIVO_HOLD.ID_SENDER	
												AND DBA.RECEIVER.ID_BRANCH = DBA.MOTIVO_HOLD.ID_BRANCH
												AND DBA.RECEIVER.ID_RECEIVER = DBA.MOTIVO_HOLD.ID_RECEIVER
	JOIN DBA.DESC_HOLD DH (NOLOCK)ON DH.TIPO_HOLD = DBA.MOTIVO_HOLD.TYPE_MOTIVO_HOLD
	INNER JOIN DBA.GROUP_BRANCH (NOLOCK) ON DBA.RECEIVER.ID_MAIN_BRANCH_SENT = DBA.GROUP_BRANCH.ID_MAIN_BRANCH	
WHERE	DBA.RECEIVER.ID_FLAG_RECEIVER = 'H'
		AND isnull(DBA.RECEIVER.ID_MAIN_BRANCH_SENT,'') <>  'T026'
		AND DH.HOLD_CATEGORY = 'COM'		
		AND NOT EXISTS (SELECT 'X' FROM DBA.MOTIVO_HOLD WITH (NOLOCK)
					WHERE DBA.RECEIVER.ID_SENDER = DBA.MOTIVO_HOLD.ID_SENDER
					AND DBA.RECEIVER.ID_BRANCH = DBA.MOTIVO_HOLD.ID_BRANCH
					AND DBA.RECEIVER.ID_RECEIVER = DBA.MOTIVO_HOLD.ID_RECEIVER
					AND DBA.MOTIVO_HOLD.TYPE_MOTIVO_HOLD = 53 )
		AND DBA.RECEIVER.ID_BRANCH = :as_branch
		and DBA.RECEIVER.ID_RECEIVER = :ad_receiver;
		
IF li_count > 0 THEN RETURN TRUE

messagebox("Alert","The status of invoice "+trim(as_branch)+" - "+string(ad_receiver)+" already has been changed!")

RETURN FALSE
end function

on w_invoices_hold.create
this.st_12=create st_12
this.lst_segmentation=create lst_segmentation
this.st_11=create st_11
this.lb_tipos_hold=create lb_tipos_hold
this.st_10=create st_10
this.sle_branch=create sle_branch
this.st_9=create st_9
this.cb_sort=create cb_sort
this.cb_8=create cb_8
this.st_8=create st_8
this.ddlb_sort=create ddlb_sort
this.st_2=create st_2
this.cb_add_hold=create cb_add_hold
this.cb_refresh=create cb_refresh
this.cb_ofac_review=create cb_ofac_review
this.pb_print=create pb_print
this.cb_complaints=create cb_complaints
this.cb_cancel=create cb_cancel
this.cb_faxes=create cb_faxes
this.cb_analysis=create cb_analysis
this.cb_7=create cb_7
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_liberar=create cb_liberar
this.dw_3=create dw_3
this.cb_saveas=create cb_saveas
this.rb_suspicious=create rb_suspicious
this.rb_history=create rb_history
this.cb_cancelados=create cb_cancelados
this.cb_anulados=create cb_anulados
this.gb_1=create gb_1
this.dw_4=create dw_4
this.cb_senderid=create cb_senderid
this.tab_add_hold=create tab_add_hold
this.dw_2=create dw_2
this.em_date_fin=create em_date_fin
this.em_date_ini=create em_date_ini
this.Control[]={this.st_12,&
this.lst_segmentation,&
this.st_11,&
this.lb_tipos_hold,&
this.st_10,&
this.sle_branch,&
this.st_9,&
this.cb_sort,&
this.cb_8,&
this.st_8,&
this.ddlb_sort,&
this.st_2,&
this.cb_add_hold,&
this.cb_refresh,&
this.cb_ofac_review,&
this.pb_print,&
this.cb_complaints,&
this.cb_cancel,&
this.cb_faxes,&
this.cb_analysis,&
this.cb_7,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_liberar,&
this.dw_3,&
this.cb_saveas,&
this.rb_suspicious,&
this.rb_history,&
this.cb_cancelados,&
this.cb_anulados,&
this.gb_1,&
this.dw_4,&
this.cb_senderid,&
this.tab_add_hold,&
this.dw_2,&
this.em_date_fin,&
this.em_date_ini}
end on

on w_invoices_hold.destroy
destroy(this.st_12)
destroy(this.lst_segmentation)
destroy(this.st_11)
destroy(this.lb_tipos_hold)
destroy(this.st_10)
destroy(this.sle_branch)
destroy(this.st_9)
destroy(this.cb_sort)
destroy(this.cb_8)
destroy(this.st_8)
destroy(this.ddlb_sort)
destroy(this.st_2)
destroy(this.cb_add_hold)
destroy(this.cb_refresh)
destroy(this.cb_ofac_review)
destroy(this.pb_print)
destroy(this.cb_complaints)
destroy(this.cb_cancel)
destroy(this.cb_faxes)
destroy(this.cb_analysis)
destroy(this.cb_7)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_liberar)
destroy(this.dw_3)
destroy(this.cb_saveas)
destroy(this.rb_suspicious)
destroy(this.rb_history)
destroy(this.cb_cancelados)
destroy(this.cb_anulados)
destroy(this.gb_1)
destroy(this.dw_4)
destroy(this.cb_senderid)
destroy(this.tab_add_hold)
destroy(this.dw_2)
destroy(this.em_date_fin)
destroy(this.em_date_ini)
end on

event open;X=1
Y=1

//Open(w_please_wait_rojo)

ddlb_sort.text = "Branch-Transaction"

This.PostEvent("ue_postopen")




end event

event key;
if (key = KeyUpArrow! or key = KeyDownArrow!)then
		dw_2.setFocus()	
end if

IF dw_2.GetRow() > 0 THEN
	IF keyDown(KeyUpArrow!) then
		IF dw_2.GetRow() > 1 THEN
			dw_2.SelectRow(dw_2.GetRow(), FALSE)
			dw_2.SelectRow(dw_2.GetRow() - 1, TRUE)
			dw_2.SetRow(dw_2.GetRow() - 1)
			dw_2.ScrollToRow(dw_2.GetRow() - 1)

		END IF
	ELSEIF keydown(KeyDownArrow!) then
		IF dw_2.GetRow() < dw_2.RowCount() THEN
			dw_2.SelectRow(dw_2.GetRow() , FALSE)
			dw_2.SelectRow(dw_2.GetRow()+1, TRUE)
			dw_2.SetRow(dw_2.GetRow()+1)
			dw_2.ScrollToRow(dw_2.GetRow()+1)

		END IF
	END IF
	
END IF


end event

type st_12 from statictext within w_invoices_hold
integer x = 2971
integer y = 12
integer width = 407
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Segmentation:"
boolean focusrectangle = false
end type

type lst_segmentation from my_ddlb within w_invoices_hold
integer x = 2981
integer y = 72
integer width = 722
integer height = 452
integer taborder = 50
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
end type

event constructor;call super::constructor;this.addquery("SELECT RTRIM(S.SEGMENTATION_NAME) + ' ONLY', S.ID_SEGMENTATION	FROM dba.AGENCY_SEGMENTATION S UNION ALL SELECT 'ALL AGENCIES', '%' ORDER BY S.ID_SEGMENTATION;")
end event

type st_11 from statictext within w_invoices_hold
integer x = 2126
integer y = 4
integer width = 128
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "From:"
boolean focusrectangle = false
end type

type lb_tipos_hold from listbox within w_invoices_hold
integer x = 27
integer y = 72
integer width = 1481
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

event constructor;string ls_data, ls_id,ls_Query

this.reset()

ls_Query = "SELECT '-ALL-','-ALL-' UNION SELECT descripcion + ' ('+rtrim(tipo_hold)+')', tipo_hold FROM DBA.DESC_HOLD WHERE HOLD_CATEGORY = 'COM' order by 1 "

PREPARE sqlsa FROM :ls_Query;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;

OPEN DYNAMIC dyn_cursor;

if sqlca.sqlcode < 0 then
	MessageBox("Error de Base de datos!", sqlca.sqlerrtext)
	return sqlca.sqlcode
end if

Do While sqlca.sqlcode = 0
	FETCH dyn_cursor INTO :ls_data, :ls_id;
	if sqlca.sqlcode = 0 then
		this.additem(fn_completar_cadena(ls_data,'D',' ',100)+'*'+ls_id)
	elseif sqlca.sqlcode < 0 then
		MessageBox("Error de Base de datos", sqlca.sqlerrtext)
		return sqlca.sqlcode
	else
		exit
	end if
Loop
CLOSE dyn_cursor;

this.SetState(1,true)

end event

event getfocus;this.Height = 1144
end event

event losefocus;this.Height = 84
end event

type st_10 from statictext within w_invoices_hold
integer x = 2597
integer y = 8
integer width = 82
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "To:"
boolean focusrectangle = false
end type

type sle_branch from singlelineedit within w_invoices_hold
integer x = 1614
integer y = 72
integer width = 343
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_invoices_hold
integer x = 1614
integer y = 8
integer width = 178
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Branch:"
boolean focusrectangle = false
end type

type cb_sort from commandbutton within w_invoices_hold
boolean visible = false
integer x = 3653
integer y = 28
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Sort"
end type

event clicked;
dw_2.SetRedraw(false)

if ddlb_sort.SelectedText() = "Branch / Transaction" then
	dw_2.SetSort("#2 A, #3 A")
elseif ddlb_sort.SelectedText() = "Date" then
	dw_2.SetSort("#4 A")
else
	dw_2.SetSort("#18 A")
end if

dw_2.Sort()
dw_2.SetRedraw(true)
end event

type cb_8 from commandbutton within w_invoices_hold
integer x = 3977
integer y = 36
integer width = 402
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Query"
end type

event clicked;fn_retrieve()
end event

type st_8 from statictext within w_invoices_hold
boolean visible = false
integer x = 2162
integer y = 52
integer width = 229
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sort by:"
boolean focusrectangle = false
end type

type ddlb_sort from dropdownlistbox within w_invoices_hold
boolean visible = false
integer x = 2885
integer y = 36
integer width = 754
integer height = 612
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string item[] = {"Branch-Transaction","Transaction Date","Hold Type"}
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_invoices_hold
integer x = 27
integer y = 12
integer width = 210
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter:"
boolean focusrectangle = false
end type

type cb_add_hold from commandbutton within w_invoices_hold
integer x = 2455
integer y = 1720
integer width = 375
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add Hold"
end type

event clicked;

tab_add_hold.visible = not tab_add_hold.visible

tab_add_hold.tp1.cb_add_hold_save.enabled = false

tab_add_hold.tp1.em_branch.text = ""
tab_add_hold.tp1.em_receiver.text = ""
tab_add_hold.tp1.st_sender_name.text = ''
tab_add_hold.tp1.st_receiver_name.text = ''
tab_add_hold.tp1.st_amount.text = ''
tab_add_hold.tp1.st_status.text = ''
end event

type cb_refresh from commandbutton within w_invoices_hold
integer x = 3314
integer y = 1720
integer width = 439
integer height = 164
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Refresh List"
end type

event clicked;fn_retrieve()
end event

type cb_ofac_review from commandbutton within w_invoices_hold
integer x = 2834
integer y = 1720
integer width = 375
integer height = 164
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OFAC Review"
end type

event clicked;//string	ls_name_sender,ls_name_receiver,ls_branch, ls_address, ls_city, ls_country
//
//long 		ll_row,


string ls_branch, ls_type
double ld_receiver, ld_sender
long ll_row1, ll_cont_ofac_sender, ll_cont_ofac_receiver

ll_row1 = dw_2.GetSelectedRow(0)
if ll_row1 = 0 then
	dw_2.SelectRow(0, FALSE)
	return
end if

 ll_cont_ofac_sender = 0 
 ll_cont_ofac_receiver = 0

ld_receiver = dw_2.getitemnumber(ll_row1,"receiver_id_receiver")
ls_branch =  dw_2.getitemstring(ll_row1,"receiver_id_branch")
ld_sender = dw_2.getitemnumber(ll_row1,"sender_id_sender")


SELECT count(*)  
INTO :ll_cont_ofac_sender  
FROM dba.MOTIVO_HOLD  
WHERE dba.MOTIVO_HOLD.TYPE_MOTIVO_HOLD = '62'
AND dba.MOTIVO_HOLD.ID_BRANCH = :ls_branch
AND dba.MOTIVO_HOLD.ID_RECEIVER = :ld_receiver;

SELECT count(*)  
INTO :ll_cont_ofac_receiver  
FROM dba.MOTIVO_HOLD  
WHERE dba.MOTIVO_HOLD.TYPE_MOTIVO_HOLD = '65'
AND dba.MOTIVO_HOLD.ID_BRANCH = :ls_branch
AND dba.MOTIVO_HOLD.ID_RECEIVER = :ld_receiver;

if ll_cont_ofac_sender > 0 and ll_cont_ofac_receiver = 0 then
	ls_type = 'S'
elseif ll_cont_ofac_receiver > 0 and ll_cont_ofac_sender = 0 then
	ls_type = 'R'
elseif ll_cont_ofac_sender > 0 and ll_cont_ofac_receiver > 0 then
	ls_type = 'B'
else
	Messagebox("Notification","This order is not holded by OFAC",StopSign!)	
end if	

Openwithparm(w_ofac_review,ls_branch+"*"+string(ld_sender)+"*"+string(ld_receiver)+"*"+ls_type)
end event

type pb_print from picturebutton within w_invoices_hold
boolean visible = false
integer x = 4375
integer y = 1740
integer width = 169
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "C:\ViamericasMT\Graphics\Print1.bmp"
alignment htextalign = left!
end type

event clicked;//dw_3.settransobject(sqlca)

if dw_3.retrieve() = 0 then
	return
end if

printsetup()
dw_3.print()
end event

type cb_complaints from commandbutton within w_invoices_hold
integer x = 969
integer y = 1720
integer width = 466
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Comps./Msgs"
end type

event clicked;//long 		ll_cont = 0
//Double	ld_sender = 0
//string	ls_branch
//
//dw_2.accepttext()
//
//ld_sender 	=  dw_2.getitemnumber(dw_2.getrow(),"id_sender")
//ls_branch = dw_2.getitemstring(dw_2.getrow(),"id_branch")
//gs_branch_insta_cons = ls_branch
//
//if ld_sender = 0 then
//	return
//end if
//
//   SELECT Count(*)  
//    INTO :ll_cont  
//    FROM dba.sender 
//   WHERE ( dba.sender.id_sender = :ld_sender ) AND  
//         ( dba.sender.id_branch = :ls_branch )   ;
//
//if ll_cont = 0 then
//	return
//else
//	gl_receiver_cons = dw_2.getitemnumber(dw_2.getrow(),"receiver_id_receiver")
//	Openwithparm(w_consulta_reclamo,ld_sender)
//end if
//
//

Double ld_id_receiver
String ls_id_branch


ld_id_receiver = dw_2.getitemnumber(dw_2.getrow(),"receiver_id_receiver")	
ls_id_branch = dw_2.getitemstring(dw_2.getrow(),"receiver_id_branch")		

Openwithparm(w_receiver_ordernotes,trim(ls_id_branch)+'*'+string(ld_id_receiver))		
end event

type cb_cancel from commandbutton within w_invoices_hold
integer x = 1440
integer y = 1720
integer width = 466
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel Invoice"
end type

event clicked;String	ls_branch
Double	ld_receiver
Long		ll_row

ll_row = dw_2.GetSelectedRow(0)
if ll_row = 0 then
	dw_2.SelectRow(0, FALSE)
	return
end if

ls_branch =  trim(dw_2.getitemstring(ll_row,"receiver_id_branch"))
ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")

IF NOT fn_validate_status_transaction(ls_branch, ld_receiver) THEN 
	fn_retrieve()
	dw_2.scrolltorow(ll_row - 1)
	dw_2.SelectRow(0, FALSE)
	dw_2.SelectRow(ll_row - 1, TRUE)		
	RETURN
END IF

OpenWithParm(w_cancelar_invoice,ls_branch+'*'+string(ld_receiver))


//String	ls_branch, ls_flag, ls_date, ls_time,ls_filename
//Double	ld_receiver
//Long		ll_filenum, ll_row, ll_cont
//Datetime	ld_fecha_envio
//
//
//ll_row = dw_2.GetSelectedRow(0)
//if ll_row = 0 then
//	dw_2.SelectRow(0, FALSE)
//	return
//else
//	
//end if
//
//ls_branch =  trim(dw_2.getitemstring(ll_row,"receiver_id_branch"))
//ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
//
//SELECT count(*)  
//INTO :ll_cont  
//FROM dba.RELACION_INVOICES_PAYEE  
//WHERE ( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch) AND  
//	 ( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver );
//
//if ll_cont  > 0 then
//	Messagebox('Error','You have to Cancel , This Invoice is Closing')
//	return
//end if
//
////VALORAR QUE EL ENVIO TENGA LA MISMA FECHA DEL SISTEMA -- !!FALTA
//
//Datetime	ld_hoy
//
//select getdate()
//into :ld_hoy 
//from  dba.branch_instalacion;
//
//SELECT dba.RECEIVER.DATE_RECEIVER  
// INTO :ld_fecha_envio  
// FROM dba.RECEIVER  
//WHERE ( dba.RECEIVER.ID_BRANCH = :ls_branch ) AND  
//		( dba.RECEIVER.ID_RECEIVER = :ld_receiver );
//
//if date(ld_fecha_envio) <> Date(ld_hoy) then
//	Messagebox('Error','You have to Cancel - Diferent Date , This Invoice is Closing')
//	return
//end if
//
//if Messagebox("","Do you wat to Void the Invoice : "+ls_branch+'-'+string(ld_receiver),Question!,YesNo!) = 2 then 
//	return
//end if
//
//	ls_flag = ''
//	
//	  SELECT dba.receiver.id_flag_receiver  
//     INTO :ls_flag  
//     FROM dba.receiver  
//     WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
//         ( dba.receiver.id_receiver = :ld_receiver )   ;
//
//		if ls_flag <> 'H' then
//			Return
//		end if
//			
//	  INSERT INTO dba.history_invoice  
//         ( id_branch,   
//           id_receiver,   
//           id_flag_old,   
//           id_flag_new,   
//           id_cashier,   
//           date_change,   
//           time_change )  
//  VALUES ( :ls_branch,   
//           :ld_receiver,   
//           :ls_flag,   
//           'A',   
//           :gs_cashier,   
//           getdate(),   
//           getdate() )  ;
//
//
// 
//	  UPDATE dba.receiver  
//     SET dba.receiver.id_flag_receiver = 'A',   
//         dba.receiver.net_amount_receiver = 0,   
//         dba.receiver.rate_change_receiver = 0,   
//         dba.receiver.telex_receiver = 0,   
//         dba.receiver.exchange_receiver = 0,   
//         dba.receiver.handling_receiver = 0,   
//         dba.receiver.total_receiver = 0,   
//         dba.receiver.porc_comision_receiver = 0,   
//         dba.receiver.total_pay_receiver = 0,   
//         dba.receiver.exchange_company = 0,   
//         dba.receiver.telex_company = 0,   
//         dba.receiver.total_diference = 0, 
//			dba.receiver.fx_receiver = 0, 
//			dba.receiver.total_modo_pago = 0,
//			dba.receiver.total_modo_pago_comp = 0,
//			dba.receiver.fee_rate = 0
//		 WHERE ( dba.receiver.id_branch = :ls_branch) AND  
//   		    ( dba.receiver.id_receiver = :ld_receiver)   ;
//	
//	  
//	  		if sqlca.sqlcode < 0 then
//					Messagebox("Warning","Error of Fetch SQL ")
//					return
//			else
//					commit ; 
//	  
//				////////////////////// GENERAR UNA SENTENCIA SQL PARA LAS AGENCIAS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//						string	ls_output, ls_sqlsyntax
//					
//							SELECT DISTINCT dba.parametros.dir_output  
//    							INTO :ls_output
//    						FROM dba.parametros  ;
//							 
//							 
//							ls_output = trim(ls_output) 
//							
//							ls_date = String(Today(), "mmdd")
//							ls_time = string(Now(),"HHMM")
//		
//							ls_filename = ls_output+'ANL'+Fill('0',10 - Len(ls_branch))+ls_branch+".sql"
//							ll_filenum  = FileOpen(ls_filename, LineMode!, Write!, LockWrite!, Append!)
//							
//							ls_sqlsyntax= "UPDATE receiver SET id_flag_receiver = 'A', net_amount_receiver = 0, "+ &
//												"rate_change_receiver = 0, telex_receiver = 0, exchange_receiver = 0, "+ &
//												"handling_receiver = 0, total_receiver = 0, porc_comision_receiver = 0, total_pay_receiver = 0, "+&
//												"exchange_company = 0,  telex_company = 0, total_diference = 0, fee_rate = 0"
//												
//							
//							ls_sqlsyntax +=	" WHERE id_branch = '"+ ls_branch + "' AND " + &
//													"id_receiver = "+ String(ld_receiver) + " ;"
//		
//							FileWrite (ll_filenum,ls_sqlsyntax)
//							FileClose (ll_filenum)
//							
//					///////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//		END IF
//		
//		dw_2.retrieve()
//		dw_2.scrolltorow(ll_row - 1)
//		dw_2.SelectRow(0, FALSE)
//   	dw_2.SelectRow(ll_row - 1, TRUE)
//		
//		Messagebox('Information','Void Invoice')
end event

type cb_faxes from commandbutton within w_invoices_hold
integer x = 27
integer y = 1720
integer width = 466
integer height = 164
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Faxes"
end type

event clicked;//+++++++++++++++++++++++++++++++++++++++++++
// Abre el Fax Viewer y trae los parametros

String ls_return
//Openwithparm(w_faxviewer,em_agent.text)
//Openwithparm(w_faxviewer_cumplimiento,"")

//Openwithparm(w_faxcomponent_compliance,"Compliance")
OpenSheetWithParm(w_faxcomponent_compliance,"Compliance", w_principal, 1, Original!)

//ls_return = message.stringparm	
//
//if ls_return = "-none-" then
//	sle_selectedfax.text = "[No Fax Selected]"
//	cb_faxviewer.enabled = false
//else
//	sle_selectedfax.text = fn_token(ls_return,"*",1)
//	sle_completefaxpath.text = "u:\accounting\"+sle_selectedfax.text
//	cb_faxviewer.enabled = true
//end if
//
//String ls_branch
//Double ld_amount
//
//ls_branch = trim(fn_token(ls_return,"*",2))
//ld_amount = double(trim(fn_token(ls_return,"*",3)))
//
//em_agent.text = ls_branch
//em_agent.triggerevent(LoseFocus!)
//	
//dw_2.setitem(dw_2.getrow(),"credit",ld_amount)
//+++++++++++++++++++++++++++++++++++++++++++
end event

type cb_analysis from commandbutton within w_invoices_hold
boolean visible = false
integer x = 2729
integer y = 1524
integer width = 224
integer height = 164
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Analysis"
end type

event clicked;string	ls_name_sender,ls_name_receiver,ls_branch, ls_address, ls_city, ls_country
double	ld_receiver
long 		ll_row,ll_cont_ofac

ll_row = dw_2.GetSelectedRow(0)
if ll_row = 0 then
	dw_2.SelectRow(0, FALSE)
	return
end if

ls_branch 	=  dw_2.getitemstring(ll_row,"receiver_id_branch")
ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")

ll_cont_ofac	=	0


  SELECT count(*)  
    INTO :ll_cont_ofac  
    FROM dba.MOTIVO_HOLD  
   WHERE ( dba.MOTIVO_HOLD.TYPE_MOTIVO_HOLD in ('62','65') ) AND  
         ( dba.MOTIVO_HOLD.ID_BRANCH = :ls_branch ) AND  
         ( dba.MOTIVO_HOLD.ID_RECEIVER = :ld_receiver )   ;




if ll_cont_ofac = 0 then
	messagebox("Result","The OFAC search could not be completed!", Exclamation!)
	return
else
	ll_cont_ofac = 0

		select	dba.sender.name_sender,
					dba.receiver.name_receiver,
					dba.sender.addres_sender, dba.country.name_country, dba.city.name_city
		into		:ls_name_sender,:ls_name_receiver,
					:ls_address,:ls_city,:ls_country
		from 		dba.sender,dba.receiver,dba.country,dba.city
		where 	dba.receiver.id_branch 		= 	:ls_branch and
					dba.receiver.id_receiver		=	:ld_receiver and
					dba.sender.id_branch			=	dba.receiver.id_branch and
					dba.sender.id_sender			=	dba.receiver.id_sender and
					dba.sender.id_country			=	dba.country.id_country and
					dba.sender.id_country			=	dba.city.id_country    and
					dba.sender.id_city				=	dba.city.id_city;		
		
		gs_name_ofac_sender		=	ls_name_sender
		gs_name_ofac_receiver	=	ls_name_receiver
		gs_ofac_address			=	ls_address
		gs_ofac_country			=	ls_country
		gs_ofac_city				=	ls_city
	
end if

// open(w_hold_ofac_causa)

// ---------------------------------------->>

string ls_branch1
double ld_receiver1, ld_sender1
long ll_row1

ll_row1 = dw_2.GetSelectedRow(0)
if ll_row1 = 0 then
	dw_2.SelectRow(0, FALSE)
	return
end if

ld_receiver1 = dw_2.getitemnumber(ll_row1,"receiver_id_receiver")
ls_branch1 	=  dw_2.getitemstring(ll_row1,"receiver_id_branch")
ld_sender1 = dw_2.getitemnumber(ll_row1,"sender_id_sender")

Openwithparm(w_ofac_analysis,string(ld_receiver1)+"*"+ls_branch1+"*"+string(ld_sender1))
end event

type cb_7 from commandbutton within w_invoices_hold
boolean visible = false
integer x = 3968
integer y = 1304
integer width = 274
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;if dw_4.update() = 1 then
	commit ;
else
	rollback ;
end if
	

	

end event

type cb_5 from commandbutton within w_invoices_hold
integer x = 2075
integer y = 1720
integer width = 375
integer height = 164
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Search Details"
end type

event clicked;
string	ls_name_sender,ls_name_receiver,ls_branch, ls_address, ls_city, ls_country
double	ld_receiver, ld_phone_sender, ld_id_sender_global
long 		ll_row,ll_cont_ofac

ll_row = dw_2.GetSelectedRow(0)
if ll_row = 0 then
	dw_2.SelectRow(0, FALSE)
	return
end if

dw_2.accepttext()

ls_branch 	=  dw_2.getitemstring(dw_2.getrow(),"receiver_id_branch")
ld_receiver =  dw_2.getitemnumber(dw_2.getrow(),"receiver_id_receiver")

ll_cont_ofac = 0

//DON (03/31/2015) - PERFORMANCE TUNE.  ******************************
//select	dba.receiver.date_receiver, dba.sender.name_sender,dba.sender.phone1_sender,
//dba.receiver.name_receiver,
//dba.sender.addres_sender,dba.receiver.phone1_receiver,
//dba.sender.id_sender_global
//into :gd_ofac_datereceiver, :ls_name_sender,:ld_phone_sender,:ls_name_receiver,
//:ls_address,:gs_phone_receiver_ofac, :ld_id_sender_global
//from dba.sender,dba.receiver
//where dba.receiver.id_branch = 	:ls_branch 
//and dba.receiver.id_receiver =	:ld_receiver 
//and dba.sender.id_branch =	dba.receiver.id_branch 
//and dba.sender.id_sender =	dba.receiver.id_sender;
select	dba.receiver.date_receiver, dba.sender.name_sender,dba.sender.phone1_sender,
dba.receiver.name_receiver,
dba.sender.addres_sender,dba.receiver.phone1_receiver,
dba.sender.id_sender_global
into :gd_ofac_datereceiver, :ls_name_sender,:ld_phone_sender,:ls_name_receiver,
:ls_address,:gs_phone_receiver_ofac, :ld_id_sender_global
FROM		dba.receiver		WITH (NOLOCK)
INNER JOIN	dba.sender 	WITH (NOLOCK)
ON		dba.sender.id_branch 		=	dba.receiver.id_branch 
		AND dba.sender.id_sender 	=	dba.receiver.id_sender
where dba.receiver.id_branch = 	:ls_branch 
and dba.receiver.id_receiver =	:ld_receiver;	
//**************************************************************
			
		
gs_name_ofac_sender =	trim(ls_name_sender)
gs_name_ofac_receiver	=	trim(ls_name_receiver)
gs_ofac_address =	trim(ls_address)+'~~'+string(ld_id_sender_global)
gs_ofac_country =	''
gs_ofac_city =	''
gd_phone_sender =  ld_phone_sender

if isnull(gd_ofac_datereceiver) then
	gd_ofac_datereceiver = datetime(today(),time('00:00:00'))
end if

open(w_coincidencias_hold)

end event

type cb_4 from commandbutton within w_invoices_hold
boolean visible = false
integer x = 1568
integer y = 1576
integer width = 352
integer height = 72
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Search OFAC"
end type

event clicked;//string	ls_name_sender,ls_name_receiver,ls_branch, ls_address, ls_city, ls_country
//double	ld_receiver
//long 		ll_row,ll_cont_ofac
//
//ll_row = dw_2.GetSelectedRow(0)
//if ll_row = 0 then
//	dw_2.SelectRow(0, FALSE)
//	return
//end if
//
//ls_branch 	=  dw_2.getitemstring(ll_row,"receiver_id_branch")
//ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
//
//ll_cont_ofac	=	0
//
//
//  SELECT count(*)  
//    INTO :ll_cont_ofac  
//    FROM dba.MOTIVO_HOLD  
//   WHERE ( dba.MOTIVO_HOLD.TYPE_MOTIVO_HOLD in ('62','65') ) AND  
//         ( dba.MOTIVO_HOLD.ID_BRANCH = :ls_branch ) AND  
//         ( dba.MOTIVO_HOLD.ID_RECEIVER = :ld_receiver )   ;
//
//
//
//
//if ll_cont_ofac = 0 then
//	messagebox("Result","The OFAC search could not be completed!", Exclamation!)
//	return
//else
//	ll_cont_ofac = 0
//
//		select	dba.sender.name_sender,
//					dba.receiver.name_receiver,
//					dba.sender.addres_sender, dba.country.name_country, dba.city.name_city
//		into		:ls_name_sender,:ls_name_receiver,
//					:ls_address,:ls_city,:ls_country
//		from 		dba.sender,dba.receiver,dba.country,dba.city
//		where 	dba.receiver.id_branch 		= 	:ls_branch and
//					dba.receiver.id_receiver		=	:ld_receiver and
//					dba.sender.id_branch			=	dba.receiver.id_branch and
//					dba.sender.id_sender			=	dba.receiver.id_sender and
//					dba.sender.id_country			=	dba.country.id_country and
//					dba.sender.id_country			=	dba.city.id_country    and
//					dba.sender.id_city				=	dba.city.id_city;		
//		
//		gs_name_ofac_sender		=	ls_name_sender
//		gs_name_ofac_receiver	=	ls_name_receiver
//		gs_ofac_address			=	ls_address
//		gs_ofac_country			=	ls_country
//		gs_ofac_city				=	ls_city
//	
//end if
//
////open(w_hold_ofac_causa)
end event

type cb_3 from commandbutton within w_invoices_hold
boolean visible = false
integer x = 59
integer y = 2196
integer width = 361
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Reports"
end type

event clicked;Openwithparm(w_grupos_hold,'2')
end event

type cb_2 from commandbutton within w_invoices_hold
boolean visible = false
integer x = 1417
integer y = 1524
integer width = 247
integer height = 108
integer taborder = 170
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;Long		ll_rows, ll_i
string	ls_motivo,  ls_grupo

if gs_cashier = 'CH7' or gs_cashier = 'CH13' or  gs_cashier = 'CH15' Then
	ls_grupo = 'C'
elseif gs_cashier = 'CH3' Then
	ls_grupo = 'O'
elseif gs_cashier = 'CH18' or  gs_cashier = 'CH4' Then
	ls_grupo = 'S'		
elseif gs_cashier = 'ADM' Then
	ls_grupo = 'A'	
else
	Return
End if


//ll_rows = dw_1.rowcount()
//
//FOR ll_i = 1 TO ll_rows
//	ls_motivo = dw_1.getitemstring(ll_i,"type_motivo_hold")
//	messagebox("",ls_motivo)
//	
//	IF ls_grupo = 'C' and ls_motivo <> '50' Then
//		Messagebox("Error","Authorization")
//		Return
//	END IF
//	
//	IF ls_grupo = 'O' and (ls_motivo <> '20' or ls_motivo <> '60') Then
//		Messagebox("Error","Authorization")
//		Return
//	END IF
//	
//	IF ls_grupo = 'S' and ls_motivo = '20' Then
//		Messagebox("Error","Authorization")
//		Return
//	END IF
//	
//	IF ls_grupo = 'S' and ls_motivo = '50' Then
//		Messagebox("Error","Authorization")
//		Return
//	END IF
//	
//	IF ls_grupo = 'S' and ls_motivo = '60' Then
//		Messagebox("Error","Authorization")
//		Return
//	END IF
//	
//NEXT
//




end event

type cb_liberar from commandbutton within w_invoices_hold
integer x = 3758
integer y = 1720
integer width = 439
integer height = 164
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Change Status"
end type

event clicked;long		ll_row, ll_cont
double	ld_receiver
string	ls_branch
Date		ld_fecha
DateTime ld_fechahora
Time		lt_hora

ld_fecha = Today()
lt_hora  = Now()
ld_fechahora = Datetime(ld_fecha,lt_hora)

commit ;



Long		ll_rows, ll_i
string	ls_motivo,  ls_grupo

//ll_rows = dw_1.rowcount()


ll_row = dw_2.GetSelectedRow(0)
if ll_row = 0 then
	dw_2.SelectRow(0, FALSE)
	return
else
	
end if

ls_branch =  dw_2.getitemstring(ll_row,"receiver_id_branch")
ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")

IF NOT fn_validate_status_transaction(ls_branch, ld_receiver) THEN 
	fn_retrieve()
	dw_2.scrolltorow(ll_row - 1)
	dw_2.SelectRow(0, FALSE)
	dw_2.SelectRow(ll_row - 1, TRUE)		
	RETURN
END IF

If messagebox("Confirmation","Do you want to change the status of invoice "+trim(ls_branch)+" - "+string(ld_receiver)+"?",Question!,yesno!) = 1 then
	
	gs_branch_insta_cons = ls_branch
	gl_receiver_cons = ld_receiver
	
	
	open(w_liberar_por_motivos)
	
	SELECT Count(*)  
	INTO :ll_cont  
	FROM dba.motivo_hold  WITH (NOLOCK)
	WHERE dba.motivo_hold.id_branch = :ls_branch
	AND  dba.motivo_hold.id_receiver = :ld_receiver;

	
	if ll_cont = 0 then
		
		String ls_current_flag
		
		SELECT ID_FLAG_RECEIVER
		INTO :ls_current_flag
		FROM dba.receiver WITH (NOLOCK)
		WHERE dba.receiver.id_branch = :ls_branch
		AND dba.receiver.id_receiver = :ld_receiver;
		
		
		// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// 04/13/2012 --> Este bloque IF ya no debe ser necesario porque se esta usando el spReleaseInvoice en w_liberar_por_motivos
		IF ls_current_flag = 'H' THEN
		
			UPDATE dba.receiver  
			SET dba.receiver.id_flag_receiver = 'I',
			dba.receiver.trans_receiver = 'N'
			WHERE dba.receiver.id_branch = :ls_branch
			and dba.receiver.id_receiver = :ld_receiver;
				  
			if SQLCA.SQLCODE <> 0 THEN	
				Rollback ;
				return 
			else
				
				INSERT INTO dba.history_invoice  ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change )  
				VALUES ( :ls_branch,:ld_receiver,'H','I',:gs_cashier,:ld_fechahora,:ld_fechahora)  ;
	
				INSERT INTO dba.change_status_invoice ( id_branch,id_receiver,id_cashier,fecha,hora,id_flag_receiver_old,id_flag_receiver_new )  
				VALUES ( :ls_branch,:ld_receiver,:gs_cashier,:ld_fechahora,:ld_fechahora,'H','I' )  ;

				if SQLCA.SQLCODE <> 0 THEN	
					Rollback ;
					return 
				else
					commit ;	
				end if
				
			end if

		END IF
	end if		
	
	fn_retrieve()
	
	IF ll_row = 1 THEN
		ll_row = 1
	ELSE
		ll_row = ll_row - 1
	END IF

	dw_2.scrolltorow(ll_row )
	dw_2.SelectRow(0, FALSE)
	dw_2.SelectRow(ll_row, TRUE)		

End if









end event

type dw_3 from datawindow within w_invoices_hold
boolean visible = false
integer x = 1737
integer y = 1524
integer width = 1006
integer height = 748
integer taborder = 180
boolean enabled = false
string dataobject = "dw_printmotivo_hold"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

type cb_saveas from commandbutton within w_invoices_hold
boolean visible = false
integer x = 443
integer y = 2208
integer width = 498
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Save List As"
end type

event clicked;//dw_1.saveas()
end event

type rb_suspicious from radiobutton within w_invoices_hold
boolean visible = false
integer x = 407
integer y = 1536
integer width = 370
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Suspicious"
boolean checked = true
boolean righttoleft = true
end type

event clicked;//dw_1.dataobject = 'dw_motivo_hold'
//dw_1.settransobject(sqlca)
//dw_1.retrieve()
end event

type rb_history from radiobutton within w_invoices_hold
boolean visible = false
integer x = 59
integer y = 1532
integer width = 279
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "History"
boolean righttoleft = true
end type

event clicked;//dw_1.dataobject = 'dw_motivo_hold_historico'
//dw_1.settransobject(sqlca)
//dw_1.retrieve()
end event

type cb_cancelados from commandbutton within w_invoices_hold
boolean visible = false
integer x = 2839
integer y = 324
integer width = 480
integer height = 156
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cancel"
end type

event clicked;dw_2.dataobject = 'dw_invoices_cancelados'
dw_2.settransobject(sqlca)
dw_2.retrieve()
end event

type cb_anulados from commandbutton within w_invoices_hold
boolean visible = false
integer x = 2839
integer y = 168
integer width = 480
integer height = 156
integer taborder = 190
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Void"
end type

event clicked;dw_2.dataobject = 'dw_invoices_anulados'
dw_2.settransobject(sqlca)
dw_2.retrieve()
end event

type gb_1 from groupbox within w_invoices_hold
boolean visible = false
integer x = 27
integer y = 1492
integer width = 777
integer height = 136
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_4 from datawindow within w_invoices_hold
boolean visible = false
integer x = 2587
integer y = 1184
integer width = 1701
integer height = 336
string dataobject = "dw_insertar_cedula"
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

type cb_senderid from commandbutton within w_invoices_hold
integer x = 498
integer y = 1720
integer width = 466
integer height = 164
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Sender IDs."
end type

event clicked;String ls_branch
Double ld_sender, ld_receiver

ld_sender = dw_2.getitemnumber(dw_2.getrow(),"sender_id_sender")
ld_receiver = dw_2.getitemnumber(dw_2.getrow(),"receiver_id_receiver")
ls_branch 	=  dw_2.getitemstring(dw_2.getrow(),"receiver_id_branch")

//OpenWithParm(w_pfc_sender_compliancedata,ls_branch+'*'+string(ld_sender)+'*1*N')
//OpenSheetWithParm(w_pfc_sender_compliancedata,ls_branch+'*'+string(ld_sender)+'*'+string(ld_receiver)+'*0*N', w_principal, 1, Original!)

OpenWithParm(w_pfc_sender_compliancedata,ls_branch+'*'+string(ld_sender)+'*'+string(ld_receiver)+'*2*N')


end event

type tab_add_hold from tab within w_invoices_hold
boolean visible = false
integer x = 2208
integer y = 740
integer width = 1330
integer height = 720
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean focusonbuttondown = true
boolean showtext = false
boolean showpicture = false
integer selectedtab = 1
tp1 tp1
end type

on tab_add_hold.create
this.tp1=create tp1
this.Control[]={this.tp1}
end on

on tab_add_hold.destroy
destroy(this.tp1)
end on

type tp1 from userobject within tab_add_hold
integer x = 18
integer y = 48
integer width = 1294
integer height = 656
long backcolor = 80269524
string text = "none"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
st_7 st_7
cb_6 cb_6
cb_add_hold_save cb_add_hold_save
cb_1 cb_1
em_receiver em_receiver
em_branch em_branch
st_status st_status
st_amount st_amount
st_6 st_6
st_5 st_5
st_receiver_name st_receiver_name
st_4 st_4
st_3 st_3
st_sender_name st_sender_name
st_1 st_1
end type

on tp1.create
this.st_7=create st_7
this.cb_6=create cb_6
this.cb_add_hold_save=create cb_add_hold_save
this.cb_1=create cb_1
this.em_receiver=create em_receiver
this.em_branch=create em_branch
this.st_status=create st_status
this.st_amount=create st_amount
this.st_6=create st_6
this.st_5=create st_5
this.st_receiver_name=create st_receiver_name
this.st_4=create st_4
this.st_3=create st_3
this.st_sender_name=create st_sender_name
this.st_1=create st_1
this.Control[]={this.st_7,&
this.cb_6,&
this.cb_add_hold_save,&
this.cb_1,&
this.em_receiver,&
this.em_branch,&
this.st_status,&
this.st_amount,&
this.st_6,&
this.st_5,&
this.st_receiver_name,&
this.st_4,&
this.st_3,&
this.st_sender_name,&
this.st_1}
end on

on tp1.destroy
destroy(this.st_7)
destroy(this.cb_6)
destroy(this.cb_add_hold_save)
destroy(this.cb_1)
destroy(this.em_receiver)
destroy(this.em_branch)
destroy(this.st_status)
destroy(this.st_amount)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_receiver_name)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_sender_name)
destroy(this.st_1)
end on

type st_7 from statictext within tp1
integer x = 50
integer width = 1179
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Manual Copliance Hold"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_6 from commandbutton within tp1
integer x = 402
integer y = 520
integer width = 407
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;tab_add_hold.visible = false
end event

type cb_add_hold_save from commandbutton within tp1
integer x = 818
integer y = 520
integer width = 407
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Add Hold"
end type

event clicked;String ls_branch, ls_flag
Double ld_receiver

ls_branch = trim(tab_add_hold.tp1.em_branch.text)
ld_receiver = Double(tab_add_hold.tp1.em_receiver.text)

if messagebox("Confirmacion","Are you sure you want to add a Manual Compliance HOLD to transaction "+ls_branch + "-" + String(ld_receiver),Question!,YesNo!) <> 1 Then
	return
end if   

ls_flag = ''

SELECT R.ID_FLAG_RECEIVER
INTO :ls_flag
FROM DBA.RECEIVER R
WHERE R.ID_BRANCH = :ls_branch
AND R.ID_RECEIVER = :ld_receiver;

If ls_flag <> 'H' then	
	Messagebox("Error Grabando la información","No es posible Adicionar HOLD, la orden ya fue transferida o anulada.",StopSign!)
	return	
end if


// An order cannot have the same hold twice - deletes the previous release so the hold can be added again.
DELETE FROM dba.MOTIVO_HOLD_HISTORY WHERE ID_BRANCH = :ls_branch AND ID_RECEIVER = :ld_receiver AND TYPE_MOTIVO_HOLD = '23';


// Inserts the hold
INSERT INTO dba.MOTIVO_HOLD (ID_SENDER
											,ID_BRANCH
											,ID_RECEIVER
											,DATE_MOTIVO_HOLD
											,TIME_MOTIVO_HOLD
											,TYPE_MOTIVO_HOLD
											,DESC_MOTIVO_HOLD)
SELECT S.ID_SENDER
,R.ID_BRANCH
,R.ID_RECEIVER
,GETDATE()
,GETDATE()
,'23'
,'REQUIRED BY '+REPLACE(UPPER(SYSTEM_USER),'VIAMERICAS\','')
FROM DBA.RECEIVER R, 
DBA.SENDER S
WHERE R.ID_BRANCH = S.ID_BRANCH
AND R.ID_SENDER = S.ID_SENDER
AND R.ID_BRANCH = :ls_branch
AND R.ID_RECEIVER = :ld_receiver
AND R.ID_FLAG_RECEIVER = 'H';


if SQLCA.SQLCODE <> 0 then			
	Messagebox("Error Grabando la información","Error Grabando la información, Por favor intente de nuevo o consulte a soporte!~n~r"+SQLCA.SQLErrText,StopSign!)
	Return			
end if


Messagebox("Completed","Hold Inserted Successfully")
tab_add_hold.visible = false
end event

type cb_1 from commandbutton within tp1
integer x = 1010
integer y = 88
integer width = 215
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;String ls_branch, ls_flag
Double ld_receiver

ls_branch = tab_add_hold.tp1.em_branch.text
ld_receiver = Double(tab_add_hold.tp1.em_receiver.text)


tab_add_hold.tp1.st_sender_name.text = ''
tab_add_hold.tp1.st_receiver_name.text = ''
tab_add_hold.tp1.st_amount.text = ''
tab_add_hold.tp1.st_status.text = ''


SELECT R.NAME_RECEIVER, 
S.NAME_SENDER, 
'$ '+convert(varchar,CONVERT(money,R.NET_AMOUNT_RECEIVER)),
R.ID_FLAG_RECEIVER, 
F.NAME_FLAG_RECEIVER
INTO
:tab_add_hold.tp1.st_sender_name.text,
:tab_add_hold.tp1.st_receiver_name.text,
:tab_add_hold.tp1.st_amount.text,
:ls_flag,
:tab_add_hold.tp1.st_status.text
FROM DBA.RECEIVER R, 
DBA.SENDER S, 
DBA.FLAG_RECEIVER F
WHERE R.ID_BRANCH = S.ID_BRANCH
AND R.ID_SENDER = S.ID_SENDER
AND R.ID_FLAG_RECEIVER = F.id_flag_receiver 
AND R.ID_BRANCH = :ls_branch
AND R.ID_RECEIVER = :ld_receiver;


if ls_flag = 'H' then 
	tab_add_hold.tp1.cb_add_hold_save.enabled = true
end if
	





end event

type em_receiver from editmask within tp1
integer x = 617
integer y = 88
integer width = 375
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "########"
end type

event modified;tab_add_hold.tp1.cb_add_hold_save.enabled = false
end event

type em_branch from editmask within tp1
integer x = 288
integer y = 88
integer width = 274
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
maskdatatype maskdatatype = stringmask!
string mask = "!#####"
end type

event modified;tab_add_hold.tp1.cb_add_hold_save.enabled = false
end event

type st_status from statictext within tp1
integer x = 288
integer y = 432
integer width = 933
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "STATUS"
boolean focusrectangle = false
end type

type st_amount from statictext within tp1
integer x = 288
integer y = 352
integer width = 933
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "AMOUNT"
boolean focusrectangle = false
end type

type st_6 from statictext within tp1
integer x = 50
integer y = 432
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Status:"
boolean focusrectangle = false
end type

type st_5 from statictext within tp1
integer x = 50
integer y = 352
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Amount:"
boolean focusrectangle = false
end type

type st_receiver_name from statictext within tp1
integer x = 288
integer y = 272
integer width = 933
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TEST RECIPIENT"
boolean focusrectangle = false
end type

type st_4 from statictext within tp1
integer x = 50
integer y = 272
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Receiver:"
boolean focusrectangle = false
end type

type st_3 from statictext within tp1
integer x = 50
integer y = 192
integer width = 183
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sender:"
boolean focusrectangle = false
end type

type st_sender_name from statictext within tp1
integer x = 288
integer y = 192
integer width = 933
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TEST SENDER"
boolean focusrectangle = false
end type

type st_1 from statictext within tp1
integer x = 50
integer y = 104
integer width = 174
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Order:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_invoices_hold
integer x = 9
integer y = 176
integer width = 4873
integer height = 1544
integer taborder = 50
string dataobject = "dw_invoices_hold_compliance_sp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
long	ll_row, ll_node

String	ls_branch
Double	ld_receiver, ld_sender

ll_row = dw_2.GetClickedRow()

// Arreglo esteban, evita que se seleccione toda la lista
if row = 0 then row = ll_row

if ll_row =  1 then
	ls_branch 	= dw_2.getitemstring(1,"receiver_id_branch")
	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
	//dw_1.scrolltorow(row)
	dw_2.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
//	dw_1.SelectRow(0, FALSE)
//	dw_1.SelectRow(1, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(ls_branch,ld_receiver)
	//dw_4.retrieve(ld_sender,ls_branch)
	return
elseif ll_row = 0 then
	//dw_2.SelectRow(0, FALSE)	
	Return
else
	ls_branch   = dw_2.getitemstring(ll_row,"receiver_id_branch")
	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(ls_branch,ld_receiver)

//	dw_4.retrieve(ld_sender,ls_branch)
	//cb_6.TRIGGEREVENT(CLICKED!)
end if

//-----------------------------------------------
///// Codigo Original before arreglo esteban

//long	ll_row
//
//String	ls_branch
//Double	ld_receiver, ld_sender
//
//ll_row = dw_2.GetClickedRow ( )
//
//if dw_2.GetClickedRow ( ) = 1 then
//	ls_branch 	= dw_2.getitemstring(1,"receiver_id_branch")
//	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
//	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
//	dw_1.scrolltorow(row)
//	dw_2.SelectRow(0, FALSE)
//	This.SelectRow(1, TRUE)
//	dw_1.SelectRow(0, FALSE)
//	dw_1.SelectRow(1, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(ls_branch,ld_receiver)
//	dw_4.retrieve(ld_sender,ls_branch)
//	return
//elseif dw_2.GetClickedRow ( ) = 0 then
//	dw_2.SelectRow(0, FALSE)	
//	dw_1.SelectRow(0, FALSE)
//	Return
//else
//	ls_branch   = dw_2.getitemstring(ll_row,"receiver_id_branch")
//	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
//	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
//	This.SelectRow(0, FALSE)
//   This.SelectRow(row, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(ls_branch,ld_receiver)
//	dw_4.retrieve(ld_sender,ls_branch)
//	//cb_6.TRIGGEREVENT(CLICKED!)
//end if
end event

event doubleclicked;cb_liberar.triggerevent(clicked!)
end event

event rowfocuschanged;
long	ll_row

String	ls_branch
Double	ld_receiver, ld_sender

if currentrow <> 0 then
	SelectRow(0, FALSE)
	SelectRow(currentrow, TRUE)
	SetRow(currentrow)
	//display data 
	ll_row =  dw_2.GetRow()
	if ll_row =  1 then
		ls_branch 	= dw_2.getitemstring(1,"receiver_id_branch")
		ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
		ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
		//dw_1.reset()
		//dw_1.retrieve(ls_branch,ld_receiver)
//		dw_4.retrieve(ld_sender,ls_branch)
		return
	elseif ll_row = 0 then
		dw_2.SelectRow(0, FALSE)	
		//dw_1.SelectRow(0, FALSE)	
		Return
	else
		ls_branch   = dw_2.getitemstring(ll_row,"receiver_id_branch")
		ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
		ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
//		dw_1.reset()
//		dw_1.retrieve(ls_branch,ld_receiver)
//		dw_4.retrieve(ld_sender,ls_branch)
	end if
end if

end event

event buttonclicked;string ls_columna, ls_boton
Double ld_sender_global
Long ll_selected_row
integer li_cant_kyc

STRU_PARAMETROS stru_parametros


if dwo.name = 'b_open_transaction' then
	

	
	stru_parametros.String[1]= dw_2.getitemstring(row,"receiver_id_branch")
	stru_parametros.Long[1] = dw_2.getitemnumber(row,"receiver_id_receiver")
	
		
	OpenSheetWithParm(w_pfc_consultar_invoice_numero_central,stru_parametros,w_principal, 2, Original!)

	
	return
end if 


if dwo.name = 'b_ids' then
	ld_sender_global = dw_2.getitemnumber(row,"sender_id_sender_global")	
	//Messagebox("",String(ld_sender_global))
	
	SELECT Count(*)  
	INTO :li_cant_kyc
	FROM dba.KYC_SENDER 
	WHERE ID_SENDER_GLOBAL = :ld_sender_global;
	
	If fileExists("U:\Compliance\Processed\Senders\"+String(ld_sender_global)) OR li_cant_kyc > 0 then		
		//Openwithparm(w_idviewer,string(ld_sender_global))				
		Openwithparm(w_faxcomponent_senderids,"Compliance\Processed\Senders\"+string(ld_sender_global))		
	else		
		Messagebox("","No hay IDs asignados para este cliente!")
	end if
	
	return
end if

if is_orden = '' or is_orden = 'DESC' then 
	is_orden = 'ASC'
else
	is_orden = 'DESC'
end if

ls_boton = dwo.name

ls_columna = mid(ls_boton, 3, len(ls_boton))

dw_2.setSort(ls_columna + ' ' +  is_orden)
dw_2.sort()

end event

event constructor;this.SetTransObject(SQLCA)
end event

type em_date_fin from u_em within w_invoices_hold
integer x = 2597
integer y = 72
integer width = 306
integer height = 84
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "Tahoma"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type em_date_ini from u_em within w_invoices_hold
integer x = 2126
integer y = 72
integer width = 306
integer height = 84
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "Tahoma"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

