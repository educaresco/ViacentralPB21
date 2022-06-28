$PBExportHeader$w_customerprofile.srw
forward
global type w_customerprofile from w_response
end type
type cb_4 from commandbutton within w_customerprofile
end type
type cb_1 from commandbutton within w_customerprofile
end type
type cb_select_crm from commandbutton within w_customerprofile
end type
type cb_select_trans from commandbutton within w_customerprofile
end type
type cb_close from commandbutton within w_customerprofile
end type
type dw_customer from datawindow within w_customerprofile
end type
type st_1 from statictext within w_customerprofile
end type
type cb_new_account_note from commandbutton within w_customerprofile
end type
type tab_newnote from tab within w_customerprofile
end type
type tp1 from userobject within tab_newnote
end type
type cb_3 from commandbutton within tp1
end type
type cb_2 from commandbutton within tp1
end type
type sle_note from singlelineedit within tp1
end type
type lst_grade from dropdownlistbox within tp1
end type
type lst_notetype from dropdownlistbox within tp1
end type
type st_4 from statictext within tp1
end type
type st_3 from statictext within tp1
end type
type st_2 from statictext within tp1
end type
type st_paymentid from statictext within tp1
end type
type tp1 from userobject within tab_newnote
cb_3 cb_3
cb_2 cb_2
sle_note sle_note
lst_grade lst_grade
lst_notetype lst_notetype
st_4 st_4
st_3 st_3
st_2 st_2
st_paymentid st_paymentid
end type
type tab_newnote from tab within w_customerprofile
tp1 tp1
end type
type dw_customerprofile_crm from datawindow within w_customerprofile
end type
type dw_history from datawindow within w_customerprofile
end type
type dw_customerprofile_ips from datawindow within w_customerprofile
end type
type dw_customerprofile_ips_crosscheck from datawindow within w_customerprofile
end type
type dw_customerprofile_account_notes from datawindow within w_customerprofile
end type
type dw_customerprofile_accounts from datawindow within w_customerprofile
end type
end forward

global type w_customerprofile from w_response
integer width = 3657
integer height = 2172
string title = "Customer Profile"
cb_4 cb_4
cb_1 cb_1
cb_select_crm cb_select_crm
cb_select_trans cb_select_trans
cb_close cb_close
dw_customer dw_customer
st_1 st_1
cb_new_account_note cb_new_account_note
tab_newnote tab_newnote
dw_customerprofile_crm dw_customerprofile_crm
dw_history dw_history
dw_customerprofile_ips dw_customerprofile_ips
dw_customerprofile_ips_crosscheck dw_customerprofile_ips_crosscheck
dw_customerprofile_account_notes dw_customerprofile_account_notes
dw_customerprofile_accounts dw_customerprofile_accounts
end type
global w_customerprofile w_customerprofile

type variables
Double ld_id_sender_global
end variables

forward prototypes
public subroutine fn_clean_newnote ()
end prototypes

public subroutine fn_clean_newnote ();tab_newnote.tp1.lst_notetype.text = "NOTE"
tab_newnote.tp1.lst_grade.text = "NEUTRAL"
tab_newnote.tp1.st_paymentid.text = ''		
tab_newnote.tp1.sle_note.text = ""
tab_newnote.visible = false	

end subroutine

on w_customerprofile.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_1=create cb_1
this.cb_select_crm=create cb_select_crm
this.cb_select_trans=create cb_select_trans
this.cb_close=create cb_close
this.dw_customer=create dw_customer
this.st_1=create st_1
this.cb_new_account_note=create cb_new_account_note
this.tab_newnote=create tab_newnote
this.dw_customerprofile_crm=create dw_customerprofile_crm
this.dw_history=create dw_history
this.dw_customerprofile_ips=create dw_customerprofile_ips
this.dw_customerprofile_ips_crosscheck=create dw_customerprofile_ips_crosscheck
this.dw_customerprofile_account_notes=create dw_customerprofile_account_notes
this.dw_customerprofile_accounts=create dw_customerprofile_accounts
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_select_crm
this.Control[iCurrent+4]=this.cb_select_trans
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.dw_customer
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.cb_new_account_note
this.Control[iCurrent+9]=this.tab_newnote
this.Control[iCurrent+10]=this.dw_customerprofile_crm
this.Control[iCurrent+11]=this.dw_history
this.Control[iCurrent+12]=this.dw_customerprofile_ips
this.Control[iCurrent+13]=this.dw_customerprofile_ips_crosscheck
this.Control[iCurrent+14]=this.dw_customerprofile_account_notes
this.Control[iCurrent+15]=this.dw_customerprofile_accounts
end on

on w_customerprofile.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.cb_select_crm)
destroy(this.cb_select_trans)
destroy(this.cb_close)
destroy(this.dw_customer)
destroy(this.st_1)
destroy(this.cb_new_account_note)
destroy(this.tab_newnote)
destroy(this.dw_customerprofile_crm)
destroy(this.dw_history)
destroy(this.dw_customerprofile_ips)
destroy(this.dw_customerprofile_ips_crosscheck)
destroy(this.dw_customerprofile_account_notes)
destroy(this.dw_customerprofile_accounts)
end on

event open;call super::open;int ll_cont


SELECT count(*)
INTO :ll_cont
FROM dba.SEC_USER_GROUP
WHERE ID_GROUP = 'CPR' 
AND ID_USER = :gs_cashier;
	  
if ll_cont = 0 then 
	messagebox("No Denied","Access Denied, please contact the tech support if you require access to this screen!",StopSign!)
	close(this)	
	return
end if

tab_newnote.visible = false

ld_id_sender_global = Message.DoubleParm	

dw_customer.retrieve(ld_id_sender_global)
dw_history.retrieve(ld_id_sender_global)
dw_customerprofile_crm.retrieve(ld_id_sender_global)
dw_customerprofile_accounts.retrieve(ld_id_sender_global)
dw_customerprofile_ips.retrieve(ld_id_sender_global)
dw_customerprofile_ips_crosscheck.reset()

cb_select_trans.triggerevent(clicked!)


end event

type cb_4 from commandbutton within w_customerprofile
integer x = 1669
integer y = 752
integer width = 539
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "IP Addresses"
boolean flatstyle = true
end type

event clicked;dw_customerprofile_crm.visible = false
dw_customerprofile_accounts.visible = false
dw_customerprofile_account_notes.visible = false
cb_new_account_note.visible = false
dw_history.visible = false
dw_customerprofile_ips.visible = true
dw_customerprofile_ips_crosscheck.visible = true
end event

type cb_1 from commandbutton within w_customerprofile
integer x = 1115
integer y = 752
integer width = 558
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Customer Accounts"
boolean flatstyle = true
end type

event clicked;dw_customerprofile_crm.visible = false
dw_history.visible = false
dw_customerprofile_accounts.visible = true
dw_customerprofile_account_notes.visible = true
dw_customerprofile_ips.visible = false
dw_customerprofile_ips_crosscheck.visible = false
cb_new_account_note.visible = true
end event

type cb_select_crm from commandbutton within w_customerprofile
integer x = 581
integer y = 752
integer width = 539
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Customer CRM"
boolean flatstyle = true
end type

event clicked;dw_customerprofile_accounts.visible = false
dw_customerprofile_account_notes.visible = false
dw_customerprofile_ips.visible = false
dw_customerprofile_ips_crosscheck.visible = false
cb_new_account_note.visible = false
dw_history.visible = false
dw_customerprofile_crm.visible = true
end event

type cb_select_trans from commandbutton within w_customerprofile
integer x = 46
integer y = 752
integer width = 539
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Trans. History"
boolean flatstyle = true
end type

event clicked;dw_customerprofile_crm.visible = false
dw_customerprofile_accounts.visible = false
dw_customerprofile_account_notes.visible = false
dw_customerprofile_ips.visible = false
dw_customerprofile_ips_crosscheck.visible = false
cb_new_account_note.visible = false
dw_history.visible = true
end event

type cb_close from commandbutton within w_customerprofile
integer x = 2990
integer y = 1952
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;Close(parent)
end event

type dw_customer from datawindow within w_customerprofile
integer x = 46
integer y = 72
integer width = 2624
integer height = 656
integer taborder = 30
string dataobject = "dw_customerprofile_customer"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)

end event

type st_1 from statictext within w_customerprofile
integer x = 46
integer y = 8
integer width = 2574
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Customer Profile"
boolean focusrectangle = false
end type

type cb_new_account_note from commandbutton within w_customerprofile
integer x = 2277
integer y = 1256
integer width = 375
integer height = 68
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New Note"
end type

event clicked;
Double ld_id_senderpayment

ld_id_senderpayment = dw_customerprofile_accounts.getitemnumber(dw_customerprofile_accounts.getrow(),"id_senderpayment")		
dw_customerprofile_account_notes.retrieve(ld_id_senderpayment)		

fn_clean_newnote()

tab_newnote.visible = true			
tab_newnote.tp1.st_paymentid.text = string(ld_id_senderpayment)

end event

type tab_newnote from tab within w_customerprofile
string tag = "New Account Note"
integer x = 457
integer y = 1324
integer width = 2199
integer height = 580
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean focusonbuttondown = true
boolean showpicture = false
integer selectedtab = 1
tp1 tp1
end type

on tab_newnote.create
this.tp1=create tp1
this.Control[]={this.tp1}
end on

on tab_newnote.destroy
destroy(this.tp1)
end on

type tp1 from userobject within tab_newnote
string tag = "New Note"
integer x = 18
integer y = 100
integer width = 2162
integer height = 464
long backcolor = 79741120
string text = "New Account Note"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_3 cb_3
cb_2 cb_2
sle_note sle_note
lst_grade lst_grade
lst_notetype lst_notetype
st_4 st_4
st_3 st_3
st_2 st_2
st_paymentid st_paymentid
end type

on tp1.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_note=create sle_note
this.lst_grade=create lst_grade
this.lst_notetype=create lst_notetype
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_paymentid=create st_paymentid
this.Control[]={this.cb_3,&
this.cb_2,&
this.sle_note,&
this.lst_grade,&
this.lst_notetype,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_paymentid}
end on

on tp1.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_note)
destroy(this.lst_grade)
destroy(this.lst_notetype)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_paymentid)
end on

type cb_3 from commandbutton within tp1
integer x = 1253
integer y = 320
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;fn_clean_newnote()
end event

type cb_2 from commandbutton within tp1
integer x = 1659
integer y = 320
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;

Double ld_id_senderpayment
String ls_notetext
Integer li_notegrade, li_isvalidation

ld_id_senderpayment = dw_customerprofile_accounts.getitemnumber(dw_customerprofile_accounts.getrow(),"id_senderpayment")		


li_isvalidation = 0
if tab_newnote.tp1.lst_notetype.text = "ACC. VALIDATION" then
	li_isvalidation = 1
end if

li_notegrade = 0
if tab_newnote.tp1.lst_grade.text = "NEGATIVE" then
	li_notegrade = -1
elseif tab_newnote.tp1.lst_grade.text = "POSITIVE" then
	li_notegrade = 1
else
	li_notegrade = 0
end if
		
ls_notetext = upper(sle_note.text)

if trim(sle_note.text) = "" or trim(tab_newnote.tp1.lst_notetype.text) = "" or trim(tab_newnote.tp1.lst_grade.text) = "" then
	Messagebox("Error","Please enter a value for all the items",Stopsign!)
	return
end if

INSERT INTO dbo.MV_SENDERPAYMENT_NOTES
           (ID_SENDERPAYMENT
           ,DATE_NOTE
           ,IS_VALIDATION
           ,IS_POSITIVE
           ,NOTE_TEXT
           ,DB_USER_NAME)
     VALUES
           (:ld_id_senderpayment
           ,getdate()
           ,:li_isvalidation
           ,:li_notegrade
           ,:ls_notetext
           ,upper(SYSTEM_USER));			  


fn_clean_newnote()
tab_newnote.visible = false			  
dw_customerprofile_account_notes.retrieve(ld_id_senderpayment)
end event

type sle_note from singlelineedit within tp1
integer x = 306
integer y = 216
integer width = 1751
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 100
end type

type lst_grade from dropdownlistbox within tp1
integer x = 306
integer y = 124
integer width = 951
integer height = 324
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"NEGATIVE","NEUTRAL","POSITIVE"}
end type

type lst_notetype from dropdownlistbox within tp1
integer x = 306
integer y = 32
integer width = 951
integer height = 348
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"ACC. VALIDATION","NOTE"}
end type

type st_4 from statictext within tp1
integer x = 18
integer y = 228
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Note Text:"
boolean focusrectangle = false
end type

type st_3 from statictext within tp1
integer x = 18
integer y = 136
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grade:"
boolean focusrectangle = false
end type

type st_2 from statictext within tp1
integer x = 18
integer y = 48
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Note Type:"
boolean focusrectangle = false
end type

type st_paymentid from statictext within tp1
integer x = 1714
integer y = 20
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_customerprofile_crm from datawindow within w_customerprofile
integer x = 46
integer y = 840
integer width = 3579
integer height = 1100
integer taborder = 60
string dataobject = "dw_customerprofile_crm"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event updatestart;dw_customerprofile_crm.setitem(dw_customerprofile_crm.getrow(),"id_sender_global",ld_id_sender_global)
end event

type dw_history from datawindow within w_customerprofile
integer x = 46
integer y = 840
integer width = 3579
integer height = 1100
integer taborder = 10
string title = "Last Year Transactions"
string dataobject = "dw_customerprofile_history"
boolean vscrollbar = true
boolean livescroll = true
end type

event itemchanged;SetTransObject(SQLCA)

end event

event constructor;SetTransObject(SQLCA)
end event

type dw_customerprofile_ips from datawindow within w_customerprofile
integer x = 46
integer y = 840
integer width = 3579
integer height = 648
integer taborder = 120
string dataobject = "dw_customerprofile_ips"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event buttonclicked;

inet linet_base
String ls_ipaddress
String ls_latitude, ls_longitude

ls_latitude = ""
ls_longitude = ""

GetContextService("Internet", linet_base)
ls_ipaddress = dw_customerprofile_ips.getitemstring(row,"ip_address")
	
if dwo.name = "b_link" then

	linet_base.HyperlinkToURL("https://www.maxmind.com/en/geoip2-precision-demo?ip="+trim(ls_ipaddress))

elseif dwo.name = "b_map" then

	ls_latitude = dw_customerprofile_ips.getitemstring(row,"latitude")
	ls_longitude = dw_customerprofile_ips.getitemstring(row,"longitude")
	linet_base.HyperlinkToURL("https://www.google.com/maps/search/?api=1&query="+ls_latitude+","+ls_longitude)


elseif dwo.name = "b_ip_map" then

	ls_latitude = dw_customerprofile_ips.getitemstring(row,"ip_lat")
	ls_longitude = dw_customerprofile_ips.getitemstring(row,"ip_lon")
	linet_base.HyperlinkToURL("https://www.google.com/maps/search/?api=1&query="+ls_latitude+","+ls_longitude)

else

	dw_customerprofile_ips_crosscheck.reset()
	dw_customerprofile_ips_crosscheck.retrieve(ls_ipaddress)

end if



//if dwo.name = "b_link" then
//	run("start https://www.maxmind.com/en/geoip2-precision-demo?ip=66.139.139.69", Maximized!)
//end if

end event

event rowfocuschanged;//if currentrow <> 0 then
//	SelectRow(0, FALSE)
//	SelectRow(currentrow, TRUE)
//	SetRow(currentrow)
//end if
end event

event clicked;//long	ll_row
//String		ls_ipadddress
//
//ll_row = This.GetClickedRow ( )
//
//// Arreglo esteban, evita que se seleccione toda la lista
//if row = 0 then row = ll_row
//
//if ll_row > 0 then
//	ls_ipadddress   = This.getitemstring(ll_row,"ip_address")
//	
//	//This.SelectRow(0, FALSE)
//	//This.SelectRow(row, TRUE)
//	
//	dw_customerprofile_ips_crosscheck.reset()
//	dw_customerprofile_ips_crosscheck.retrieve(ls_ipadddress)
//	
//end if	
//
end event

type dw_customerprofile_ips_crosscheck from datawindow within w_customerprofile
integer x = 46
integer y = 1488
integer width = 3579
integer height = 456
integer taborder = 90
string dataobject = "dw_customerprofile_ips_crosscheck"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event buttonclicked;

inet linet_base
String ls_ipaddress
String ls_latitude, ls_longitude

GetContextService("Internet", linet_base)

if dwo.name = "b_link" then

	ls_ipaddress = dw_customerprofile_ips.getitemstring(row,"ip_address")
	linet_base.HyperlinkToURL("https://www.maxmind.com/en/geoip2-precision-demo?ip="+trim(ls_ipaddress))

elseif dwo.name = "b_map" then

	ls_latitude = dw_customerprofile_ips.getitemstring(row,"latitude")
	ls_longitude = dw_customerprofile_ips.getitemstring(row,"longitude")
	//linet_base.HyperlinkToURL("https://www.google.com/maps/preview/@-"+ls_latitude+","+ls_longitude+",8z"+trim(ls_ipaddress))
	linet_base.HyperlinkToURL("https://www.google.com/maps/search/?api=1&query="+ls_latitude+","+ls_longitude+""+trim(ls_ipaddress))

end if



//if dwo.name = "b_link" then
//	run("start https://www.maxmind.com/en/geoip2-precision-demo?ip=66.139.139.69", Maximized!)
//end if

end event

event constructor;SetTransObject(SQLCA)
end event

type dw_customerprofile_account_notes from datawindow within w_customerprofile
integer x = 46
integer y = 1244
integer width = 3579
integer height = 700
integer taborder = 100
string dataobject = "dw_customerprofile_account_notes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;Settransobject(SQLCA)
end event

type dw_customerprofile_accounts from datawindow within w_customerprofile
integer x = 46
integer y = 840
integer width = 3579
integer height = 408
integer taborder = 80
string dataobject = "dw_customerprofile_accounts"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;if currentrow <> 0 then
	SelectRow(0, FALSE)
	SelectRow(currentrow, TRUE)
	SetRow(currentrow)
	
	Double ld_id_senderpayment
	ld_id_senderpayment = dw_customerprofile_accounts.getitemnumber(currentrow,"id_senderpayment")		
	dw_customerprofile_account_notes.retrieve(ld_id_senderpayment)		

end if



end event

