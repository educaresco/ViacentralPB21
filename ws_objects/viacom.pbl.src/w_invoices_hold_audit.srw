$PBExportHeader$w_invoices_hold_audit.srw
forward
global type w_invoices_hold_audit from window
end type
type st_2 from statictext within w_invoices_hold_audit
end type
type tab_add_hold from tab within w_invoices_hold_audit
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
type tab_add_hold from tab within w_invoices_hold_audit
tp1 tp1
end type
type cb_add_hold from commandbutton within w_invoices_hold_audit
end type
type cb_refresh from commandbutton within w_invoices_hold_audit
end type
type cb_ofac_review from commandbutton within w_invoices_hold_audit
end type
type pb_print from picturebutton within w_invoices_hold_audit
end type
type cb_senderid from commandbutton within w_invoices_hold_audit
end type
type cb_complaints from commandbutton within w_invoices_hold_audit
end type
type cb_cancel from commandbutton within w_invoices_hold_audit
end type
type cb_faxes from commandbutton within w_invoices_hold_audit
end type
type cb_analysis from commandbutton within w_invoices_hold_audit
end type
type cb_7 from commandbutton within w_invoices_hold_audit
end type
type cb_5 from commandbutton within w_invoices_hold_audit
end type
type cb_4 from commandbutton within w_invoices_hold_audit
end type
type cb_3 from commandbutton within w_invoices_hold_audit
end type
type cb_2 from commandbutton within w_invoices_hold_audit
end type
type cb_liberar from commandbutton within w_invoices_hold_audit
end type
type dw_3 from datawindow within w_invoices_hold_audit
end type
type cb_saveas from commandbutton within w_invoices_hold_audit
end type
type cb_cancelados from commandbutton within w_invoices_hold_audit
end type
type cb_anulados from commandbutton within w_invoices_hold_audit
end type
type dw_2 from datawindow within w_invoices_hold_audit
end type
type dw_1 from datawindow within w_invoices_hold_audit
end type
type gb_1 from groupbox within w_invoices_hold_audit
end type
type dw_4 from datawindow within w_invoices_hold_audit
end type
end forward

global type w_invoices_hold_audit from window
integer x = 923
integer y = 424
integer width = 4389
integer height = 1804
boolean titlebar = true
string title = "Audit Invoices Hold"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
st_2 st_2
tab_add_hold tab_add_hold
cb_add_hold cb_add_hold
cb_refresh cb_refresh
cb_ofac_review cb_ofac_review
pb_print pb_print
cb_senderid cb_senderid
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
cb_cancelados cb_cancelados
cb_anulados cb_anulados
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
dw_4 dw_4
end type
global w_invoices_hold_audit w_invoices_hold_audit

forward prototypes
public subroutine fn_refresh_screen ()
end prototypes

public subroutine fn_refresh_screen ();dw_2.dataobject = 'dw_invoices_hold_compliance_audit'
dw_2.settransobject(sqlca)
dw_2.retrieve()

dw_1.dataobject = 'dw_motivo_hold_filtrado_audit'
dw_1.settransobject(sqlca)
//dw_1.retrieve()
end subroutine

on w_invoices_hold_audit.create
this.st_2=create st_2
this.tab_add_hold=create tab_add_hold
this.cb_add_hold=create cb_add_hold
this.cb_refresh=create cb_refresh
this.cb_ofac_review=create cb_ofac_review
this.pb_print=create pb_print
this.cb_senderid=create cb_senderid
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
this.cb_cancelados=create cb_cancelados
this.cb_anulados=create cb_anulados
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_4=create dw_4
this.Control[]={this.st_2,&
this.tab_add_hold,&
this.cb_add_hold,&
this.cb_refresh,&
this.cb_ofac_review,&
this.pb_print,&
this.cb_senderid,&
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
this.cb_cancelados,&
this.cb_anulados,&
this.dw_2,&
this.dw_1,&
this.gb_1,&
this.dw_4}
end on

on w_invoices_hold_audit.destroy
destroy(this.st_2)
destroy(this.tab_add_hold)
destroy(this.cb_add_hold)
destroy(this.cb_refresh)
destroy(this.cb_ofac_review)
destroy(this.pb_print)
destroy(this.cb_senderid)
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
destroy(this.cb_cancelados)
destroy(this.cb_anulados)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_4)
end on

event open;X=1
Y=1
Show()
dw_2.dataobject = 'dw_invoices_hold_compliance_audit'
dw_2.settransobject(sqlca)
dw_2.retrieve()

dw_1.dataobject = 'dw_motivo_hold_filtrado_audit'
dw_1.settransobject(sqlca)


tab_add_hold.visible = false
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

type st_2 from statictext within w_invoices_hold_audit
integer x = 2825
integer y = 108
integer width = 46
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "-"
boolean focusrectangle = false
end type

type tab_add_hold from tab within w_invoices_hold_audit
boolean visible = false
integer x = 2071
integer y = 528
integer width = 1330
integer height = 716
integer taborder = 80
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
integer height = 652
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


// An order cannot have the same hold twice - deletes the previous release so the hold can be added again.
DELETE FROM dba.MOTIVO_HOLD_HISTORY WHERE ID_BRANCH = :ls_branch AND ID_RECEIVER = :ld_receiver AND TYPE_MOTIVO_HOLD = '23';


// Inserts the hold
INSERT INTO dba.AUDIT_MOTIVO_HOLD (ID_SENDER
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
AND R.ID_RECEIVER = :ld_receiver;


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

type cb_add_hold from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 2935
integer y = 1468
integer width = 603
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
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

type cb_refresh from commandbutton within w_invoices_hold_audit
integer x = 3721
integer y = 1520
integer width = 439
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Refresh List"
end type

event clicked;fn_refresh_screen()
end event

type cb_ofac_review from commandbutton within w_invoices_hold_audit
integer x = 2423
integer y = 1520
integer width = 603
integer height = 164
integer taborder = 60
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
FROM dba.AUDIT_MOTIVO_HOLD  
WHERE dba.AUDIT_MOTIVO_HOLD.TYPE_MOTIVO_HOLD = '62'
AND dba.AUDIT_MOTIVO_HOLD.ID_BRANCH = :ls_branch
AND dba.AUDIT_MOTIVO_HOLD.ID_RECEIVER = :ld_receiver;

SELECT count(*)  
INTO :ll_cont_ofac_receiver  
FROM dba.AUDIT_MOTIVO_HOLD  
WHERE dba.AUDIT_MOTIVO_HOLD.TYPE_MOTIVO_HOLD = '65'
AND dba.AUDIT_MOTIVO_HOLD.ID_BRANCH = :ls_branch
AND dba.AUDIT_MOTIVO_HOLD.ID_RECEIVER = :ld_receiver;

if ll_cont_ofac_sender > 0 and ll_cont_ofac_receiver = 0 then
	ls_type = 'S'
elseif ll_cont_ofac_receiver > 0 and ll_cont_ofac_sender = 0 then
	ls_type = 'R'
elseif ll_cont_ofac_sender > 0 and ll_cont_ofac_receiver > 0 then
	ls_type = 'B'
else
	Messagebox("Notification","This order is not holded by OFAC",StopSign!)	
end if	

Openwithparm(w_ofac_review_audit,ls_branch+"*"+string(ld_sender)+"*"+string(ld_receiver)+"*"+ls_type)
end event

type pb_print from picturebutton within w_invoices_hold_audit
integer x = 4201
integer y = 1556
integer width = 142
integer height = 128
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\ViamericasMT\Graphics\Print1.bmp"
alignment htextalign = left!
end type

event clicked;dw_3.settransobject(sqlca)

if dw_3.retrieve() = 0 then
	return
end if

printsetup()
dw_3.print()
end event

type cb_senderid from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 2135
integer y = 1356
integer width = 603
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Sender Identification"
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

type cb_complaints from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 1527
integer y = 1524
integer width = 603
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Complains/Messages"
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
ls_id_branch = dw_2.getitemstring(dw_2.getrow(),"id_branch")		

Openwithparm(w_receiver_ordernotes,trim(ls_id_branch)+'*'+string(ld_id_receiver))		
end event

type cb_cancel from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 2135
integer y = 1524
integer width = 603
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
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

type cb_faxes from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 1527
integer y = 1356
integer width = 603
integer height = 164
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
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

type cb_analysis from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 2729
integer y = 1524
integer width = 224
integer height = 164
integer taborder = 90
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
    FROM dba.AUDIT_MOTIVO_HOLD  
   WHERE ( dba.AUDIT_MOTIVO_HOLD.TYPE_MOTIVO_HOLD in ('62','65') ) AND  
         ( dba.AUDIT_MOTIVO_HOLD.ID_BRANCH = :ls_branch ) AND  
         ( dba.AUDIT_MOTIVO_HOLD.ID_RECEIVER = :ld_receiver )   ;




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

type cb_7 from commandbutton within w_invoices_hold_audit
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

type cb_5 from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 2935
integer y = 1352
integer width = 603
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
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

select	dba.receiver.date_receiver, dba.sender.name_sender,dba.sender.phone1_sender,
		dba.receiver.name_receiver,
		dba.sender.addres_sender,dba.receiver.phone1_receiver,
		dba.sender.id_sender_global
into :gd_ofac_datereceiver, :ls_name_sender,:ld_phone_sender,:ls_name_receiver,
		:ls_address,:gs_phone_receiver_ofac, :ld_id_sender_global
from dba.sender,dba.receiver
where dba.receiver.id_branch = 	:ls_branch 
and dba.receiver.id_receiver =	:ld_receiver 
and dba.sender.id_branch =	dba.receiver.id_branch 
and dba.sender.id_sender =	dba.receiver.id_sender;			
			
		
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

type cb_4 from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 1568
integer y = 1576
integer width = 352
integer height = 72
integer taborder = 120
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

type cb_3 from commandbutton within w_invoices_hold_audit
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

type cb_2 from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 1417
integer y = 1524
integer width = 247
integer height = 108
integer taborder = 130
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


ll_rows = dw_1.rowcount()

FOR ll_i = 1 TO ll_rows
	ls_motivo = dw_1.getitemstring(ll_i,"type_motivo_hold")
	messagebox("",ls_motivo)
	
	IF ls_grupo = 'C' and ls_motivo <> '50' Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
	IF ls_grupo = 'O' and (ls_motivo <> '20' or ls_motivo <> '60') Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
	IF ls_grupo = 'S' and ls_motivo = '20' Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
	IF ls_grupo = 'S' and ls_motivo = '50' Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
	IF ls_grupo = 'S' and ls_motivo = '60' Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
NEXT





end event

type cb_liberar from commandbutton within w_invoices_hold_audit
integer x = 3072
integer y = 1520
integer width = 603
integer height = 164
integer taborder = 70
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

ll_rows = dw_1.rowcount()


ll_row = dw_2.GetSelectedRow(0)
if ll_row = 0 then
	dw_2.SelectRow(0, FALSE)
	return
else
	
end if

ls_branch =  dw_2.getitemstring(ll_row,"receiver_id_branch")
ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")

If messagebox("Confirmation","Do you want to change the status of invoice "+trim(ls_branch)+" - "+string(ld_receiver)+"?",Question!,yesno!) = 1 then
	
	gs_branch_insta_cons = ls_branch
	gl_receiver_cons     = ld_receiver
	
	
	open(w_liberar_por_motivos_audit)
		 

End if









end event

type dw_3 from datawindow within w_invoices_hold_audit
boolean visible = false
integer x = 1737
integer y = 1524
integer width = 1006
integer height = 748
integer taborder = 140
boolean enabled = false
string dataobject = "dw_printmotivo_hold"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_saveas from commandbutton within w_invoices_hold_audit
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

event clicked;dw_1.saveas()
end event

type cb_cancelados from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 2839
integer y = 324
integer width = 480
integer height = 156
integer taborder = 100
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

type cb_anulados from commandbutton within w_invoices_hold_audit
boolean visible = false
integer x = 2839
integer y = 168
integer width = 480
integer height = 156
integer taborder = 150
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

type dw_2 from datawindow within w_invoices_hold_audit
integer x = 23
integer y = 12
integer width = 4320
integer height = 1332
integer taborder = 10
string dataobject = "dw_invoices_hold_compliance"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
long	ll_row

String	ls_branch
Double	ld_receiver, ld_sender

ll_row = dw_2.GetClickedRow()

// Arreglo esteban, evita que se seleccione toda la lista
if row = 0 then row = ll_row

if ll_row =  1 then
	ls_branch 	= dw_2.getitemstring(1,"receiver_id_branch")
	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
	dw_1.scrolltorow(row)
	dw_2.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(1, TRUE)
	dw_1.reset()
	dw_1.retrieve(ls_branch,ld_receiver)
	dw_4.retrieve(ld_sender,ls_branch)
	return
elseif ll_row = 0 then
	dw_2.SelectRow(0, FALSE)	
	dw_1.SelectRow(0, FALSE)	
	Return
else
	ls_branch   = dw_2.getitemstring(ll_row,"receiver_id_branch")
	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	dw_1.reset()
	dw_1.retrieve(ls_branch,ld_receiver)

	dw_4.retrieve(ld_sender,ls_branch)
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
		dw_1.reset()
		dw_1.retrieve(ls_branch,ld_receiver)
		dw_4.retrieve(ld_sender,ls_branch)
		return
	elseif ll_row = 0 then
		dw_2.SelectRow(0, FALSE)	
		dw_1.SelectRow(0, FALSE)	
		Return
	else
		ls_branch   = dw_2.getitemstring(ll_row,"receiver_id_branch")
		ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
		ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
		dw_1.reset()
		dw_1.retrieve(ls_branch,ld_receiver)
		dw_4.retrieve(ld_sender,ls_branch)
	end if
end if

end event

event buttonclicked;
Double ld_sender_global
INT li_cant_kyc

if dwo.name = 'b_ids' then
	
	
	SELECT Count(*)  
	INTO :li_cant_kyc
	FROM dba.KYC_SENDER 
	WHERE ID_SENDER_GLOBAL = :ld_sender_global;
	
		

	ld_sender_global = dw_2.getitemnumber(row,"sender_id_sender_global")	
	//Messagebox("",String(ld_sender_global))
	
	If fileExists("U:\Compliance\Processed\Senders\"+String(ld_sender_global)) OR li_cant_kyc > 0 then
						
		//Openwithparm(w_idviewer,string(ld_sender_global))				
		
		Openwithparm(w_faxcomponent_senderids,"Compliance\Processed\Senders\"+string(ld_sender_global))		
		
	else		
		Messagebox("","No hay IDs asignados para este cliente!")
	end if
		
	
end if

end event

type dw_1 from datawindow within w_invoices_hold_audit
integer x = 23
integer y = 1360
integer width = 1477
integer height = 320
integer taborder = 20
string dataobject = "dw_motivo_hold_filtrado_audit"
boolean vscrollbar = true
boolean livescroll = true
end type

type gb_1 from groupbox within w_invoices_hold_audit
boolean visible = false
integer x = 27
integer y = 1492
integer width = 777
integer height = 136
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_4 from datawindow within w_invoices_hold_audit
boolean visible = false
integer x = 2587
integer y = 1184
integer width = 1701
integer height = 336
string dataobject = "dw_insertar_cedula"
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

