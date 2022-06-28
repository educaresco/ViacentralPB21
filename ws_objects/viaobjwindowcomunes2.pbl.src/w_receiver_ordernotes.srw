$PBExportHeader$w_receiver_ordernotes.srw
forward
global type w_receiver_ordernotes from w_response
end type
type st_order from statictext within w_receiver_ordernotes
end type
type st_1 from statictext within w_receiver_ordernotes
end type
type st_2 from statictext within w_receiver_ordernotes
end type
type dw_1 from datawindow within w_receiver_ordernotes
end type
type dw_2 from datawindow within w_receiver_ordernotes
end type
type cb_ok from commandbutton within w_receiver_ordernotes
end type
end forward

global type w_receiver_ordernotes from w_response
integer width = 3858
integer height = 2012
st_order st_order
st_1 st_1
st_2 st_2
dw_1 dw_1
dw_2 dw_2
cb_ok cb_ok
end type
global w_receiver_ordernotes w_receiver_ordernotes

type variables
String is_id_branch
Double il_id_receiver
end variables

event open;call super::open;long 	 ll_count

is_id_branch = fn_token(Message.StringParm,'*',1)
il_id_receiver = double(fn_token(Message.StringParm,'*',2))

SELECT count(*)
INTO :ll_count
FROM dba.receiver
WHERE id_branch = :is_id_branch
AND id_receiver = :il_id_receiver;	

if ll_count < 1 then
	close(this)
	return
end if

st_order.text = "Order: " + trim(is_id_branch) + "-" + String(il_id_receiver)

dw_1.retrieve(is_id_branch,il_id_receiver)
dw_2.retrieve(is_id_branch,il_id_receiver)

end event

on w_receiver_ordernotes.create
int iCurrent
call super::create
this.st_order=create st_order
this.st_1=create st_1
this.st_2=create st_2
this.dw_1=create dw_1
this.dw_2=create dw_2
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_order
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.dw_2
this.Control[iCurrent+6]=this.cb_ok
end on

on w_receiver_ordernotes.destroy
call super::destroy
destroy(this.st_order)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.cb_ok)
end on

type st_order from statictext within w_receiver_ordernotes
integer x = 9
integer y = 4
integer width = 3675
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within w_receiver_ordernotes
integer x = 9
integer y = 108
integer width = 3675
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Internal Notes"
boolean focusrectangle = false
end type

type st_2 from statictext within w_receiver_ordernotes
integer x = 9
integer y = 1052
integer width = 3675
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agency Notes"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_receiver_ordernotes
integer x = 9
integer y = 168
integer width = 3776
integer height = 832
integer taborder = 10
string title = "Internal Notes"
string dataobject = "dw_receiver_ordernotes_internal"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event buttonclicked;
if dwo.name = "b_new" then
	if dw_1.update() = 1 then
		dw_1.insertrow(0)	
		dw_1.ScrollToRow(dw_1.rowcount())
		

		STRING ls_user
		
		SELECT upper(SYSTEM_USER)
		INTO :ls_user
		FROM DBA.DUAL;
		
		dw_1.setitem(dw_1.getrow(),"message_by",ls_user)
		dw_1.setitem(dw_1.getrow(),"id_branch",is_id_branch)
		dw_1.setitem(dw_1.getrow(),"id_receiver",il_id_receiver)		
		
	end if
end if
end event

type dw_2 from datawindow within w_receiver_ordernotes
integer x = 9
integer y = 1116
integer width = 3776
integer height = 640
integer taborder = 10
string title = "Agency Notes"
string dataobject = "dw_receiver_ordernotes_agency"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event buttonclicked;if dwo.name = "b_new" then
	if dw_2.update() = 1 then
		dw_2.insertrow(0)	
		dw_2.ScrollToRow(dw_2.rowcount())
		
		Double ld_id_sender
		
		SELECT id_sender
		INTO :ld_id_sender
		FROM DBA.RECEIVER
		WHERE ID_BRANCH = :is_id_branch
		AND ID_RECEIVER = :il_id_receiver;
		
		dw_2.setitem(dw_2.getrow(),"id_sender",ld_id_sender)
		dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)
		dw_2.setitem(dw_2.getrow(),"id_branch",is_id_branch)
		dw_2.setitem(dw_2.getrow(),"id_receiver",il_id_receiver)
		dw_2.setitem(dw_2.getrow(),"id_type_message","RM")
	end if
	
	
elseif dwo.name = "b_attachment" then

	
	String ls_attachment_path
	ls_attachment_path = dw_2.getitemstring(dw_2.getrow(),"attachment_path")
	
	openwithparm(w_faxcomponent_singlefaxviewer,ls_attachment_path)	
	
	
	
end if
end event

type cb_ok from commandbutton within w_receiver_ordernotes
integer x = 3342
integer y = 1784
integer width = 443
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
end type

event clicked;close(parent)
end event

