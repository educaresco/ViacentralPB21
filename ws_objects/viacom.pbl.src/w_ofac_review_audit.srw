$PBExportHeader$w_ofac_review_audit.srw
forward
global type w_ofac_review_audit from window
end type
type dw_ofac_review_matches_pob from datawindow within w_ofac_review_audit
end type
type dw_ofac_review_matches_addresses from datawindow within w_ofac_review_audit
end type
type dw_ofac_review_matches_docs from datawindow within w_ofac_review_audit
end type
type dw_ofac_review_matches_dot from datawindow within w_ofac_review_audit
end type
type dw_ofac_review_matches_akas from datawindow within w_ofac_review_audit
end type
type rb_recipient from radiobutton within w_ofac_review_audit
end type
type rb_sender from radiobutton within w_ofac_review_audit
end type
type dw_customer from datawindow within w_ofac_review_audit
end type
type dw_matches from datawindow within w_ofac_review_audit
end type
end forward

global type w_ofac_review_audit from window
integer x = 1056
integer y = 456
integer width = 3173
integer height = 2532
boolean titlebar = true
string title = "Ofac Audit Review"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 82042848
dw_ofac_review_matches_pob dw_ofac_review_matches_pob
dw_ofac_review_matches_addresses dw_ofac_review_matches_addresses
dw_ofac_review_matches_docs dw_ofac_review_matches_docs
dw_ofac_review_matches_dot dw_ofac_review_matches_dot
dw_ofac_review_matches_akas dw_ofac_review_matches_akas
rb_recipient rb_recipient
rb_sender rb_sender
dw_customer dw_customer
dw_matches dw_matches
end type
global w_ofac_review_audit w_ofac_review_audit

type variables
String is_type, is_id_branch
Double id_id_receiver, id_id_sender
end variables

on w_ofac_review_audit.create
this.dw_ofac_review_matches_pob=create dw_ofac_review_matches_pob
this.dw_ofac_review_matches_addresses=create dw_ofac_review_matches_addresses
this.dw_ofac_review_matches_docs=create dw_ofac_review_matches_docs
this.dw_ofac_review_matches_dot=create dw_ofac_review_matches_dot
this.dw_ofac_review_matches_akas=create dw_ofac_review_matches_akas
this.rb_recipient=create rb_recipient
this.rb_sender=create rb_sender
this.dw_customer=create dw_customer
this.dw_matches=create dw_matches
this.Control[]={this.dw_ofac_review_matches_pob,&
this.dw_ofac_review_matches_addresses,&
this.dw_ofac_review_matches_docs,&
this.dw_ofac_review_matches_dot,&
this.dw_ofac_review_matches_akas,&
this.rb_recipient,&
this.rb_sender,&
this.dw_customer,&
this.dw_matches}
end on

on w_ofac_review_audit.destroy
destroy(this.dw_ofac_review_matches_pob)
destroy(this.dw_ofac_review_matches_addresses)
destroy(this.dw_ofac_review_matches_docs)
destroy(this.dw_ofac_review_matches_dot)
destroy(this.dw_ofac_review_matches_akas)
destroy(this.rb_recipient)
destroy(this.rb_sender)
destroy(this.dw_customer)
destroy(this.dw_matches)
end on

event open;String ls_type


is_id_branch = fn_token(Message.StringParm,'*',1)
id_id_sender = double(fn_token(Message.StringParm,'*',2))
id_id_receiver = double(fn_token(Message.StringParm,'*',3))
ls_type = fn_token(Message.StringParm,'*',4)

rb_sender.enabled = true
rb_recipient.enabled = true
is_type = 'S' 

if ls_type = 'S' then
	rb_recipient.enabled = false
	rb_sender.checked = true	
elseif ls_type = 'R' then
	rb_sender.enabled = false
	rb_recipient.checked = true
	is_type = 'R'
end if
	
//if not isnull(is_id_branch) and len(trim(is_id_branch)) > 3 and &
//	not isnull(id_id_sender) and id_id_sender > 0 and &
//	not isnull(id_id_receiver) and id_id_receiver > 0 then
	
dw_customer.retrieve(is_id_branch,id_id_sender,id_id_receiver,is_type)
dw_matches.retrieve(is_id_branch,id_id_receiver,is_type)
	
//else
//	messagebox("Error","Invalid Parms",StopSign!)	
//	close(this)
//end if
end event

type dw_ofac_review_matches_pob from datawindow within w_ofac_review_audit
integer x = 1641
integer y = 2064
integer width = 1358
integer height = 336
integer taborder = 40
string title = "none"
string dataobject = "dw_ofac_review_matches_pob"
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

type dw_ofac_review_matches_addresses from datawindow within w_ofac_review_audit
integer x = 1641
integer y = 852
integer width = 1358
integer height = 444
integer taborder = 20
string dataobject = "dw_ofac_review_matches_addresses"
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

type dw_ofac_review_matches_docs from datawindow within w_ofac_review_audit
integer x = 1641
integer y = 1292
integer width = 1358
integer height = 360
integer taborder = 20
string title = "none"
string dataobject = "dw_ofac_review_matches_docs"
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

type dw_ofac_review_matches_dot from datawindow within w_ofac_review_audit
integer x = 1641
integer y = 1648
integer width = 1358
integer height = 420
integer taborder = 30
string title = "none"
string dataobject = "dw_ofac_review_matches_dot"
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

type dw_ofac_review_matches_akas from datawindow within w_ofac_review_audit
integer x = 37
integer y = 1840
integer width = 1609
integer height = 560
integer taborder = 20
string title = "none"
string dataobject = "dw_ofac_review_matches_akas"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

type rb_recipient from radiobutton within w_ofac_review_audit
integer x = 393
integer y = 16
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recipient"
end type

event clicked;
if this.checked then
	is_type = 'R' 
end if

dw_customer.retrieve(is_id_branch,id_id_sender,id_id_receiver,is_type)
dw_matches.retrieve(is_id_branch,id_id_receiver,is_type)
end event

type rb_sender from radiobutton within w_ofac_review_audit
integer x = 37
integer y = 16
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sender"
end type

event clicked;
if this.checked then
	is_type = 'S' 
end if

dw_customer.retrieve(is_id_branch,id_id_sender,id_id_receiver,is_type)
dw_matches.retrieve(is_id_branch,id_id_receiver,is_type)
end event

type dw_customer from datawindow within w_ofac_review_audit
integer x = 37
integer y = 96
integer width = 3067
integer height = 524
integer taborder = 10
string dataobject = "dw_ofac_review_customer"
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

type dw_matches from datawindow within w_ofac_review_audit
integer x = 37
integer y = 696
integer width = 3067
integer height = 1704
integer taborder = 10
string dataobject = "dw_ofac_review_matches_audit"
boolean livescroll = true
end type

event constructor;this.SetTransObject(SQLCA)
end event

event rowfocuschanged;
dw_ofac_review_matches_akas.retrieve(dw_matches.getitemnumber(currentrow,"ofac_hit_nment_num"),dw_matches.getitemnumber(currentrow,"ofac_hit_nment_alt"), dw_matches.getitemstring(currentrow,"ofac_hit_dslist"))
dw_ofac_review_matches_pob.retrieve(dw_matches.getitemnumber(currentrow,"ofac_hit_nment_num"), dw_matches.getitemstring(currentrow,"ofac_hit_dslist"))
dw_ofac_review_matches_dot.retrieve(dw_matches.getitemnumber(currentrow,"ofac_hit_nment_num"), dw_matches.getitemstring(currentrow,"ofac_hit_dslist"))
dw_ofac_review_matches_docs.retrieve(dw_matches.getitemnumber(currentrow,"ofac_hit_nment_num"), dw_matches.getitemstring(currentrow,"ofac_hit_dslist"))
dw_ofac_review_matches_addresses.retrieve(dw_matches.getitemnumber(currentrow,"ofac_hit_nment_num"), dw_matches.getitemstring(currentrow,"ofac_hit_dslist"))
end event

