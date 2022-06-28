$PBExportHeader$w_expired_orders.srw
forward
global type w_expired_orders from pfc_w_sheet
end type
type p_1 from picture within w_expired_orders
end type
type em_days from editmask within w_expired_orders
end type
type st_2 from statictext within w_expired_orders
end type
type cb_expire from commandbutton within w_expired_orders
end type
type cb_3 from commandbutton within w_expired_orders
end type
type lst_agencies from my_ddlb within w_expired_orders
end type
type sle_idbranch from singlelineedit within w_expired_orders
end type
type st_1 from statictext within w_expired_orders
end type
type cb_1 from commandbutton within w_expired_orders
end type
type cb_2 from commandbutton within w_expired_orders
end type
type dw_1 from datawindow within w_expired_orders
end type
type gb_1 from groupbox within w_expired_orders
end type
type gb_2 from groupbox within w_expired_orders
end type
end forward

global type w_expired_orders from pfc_w_sheet
integer x = 214
integer y = 221
integer width = 4123
integer height = 1948
string title = "Expired Orders"
boolean resizable = false
event ue_update ( )
event ue_retrieve ( )
p_1 p_1
em_days em_days
st_2 st_2
cb_expire cb_expire
cb_3 cb_3
lst_agencies lst_agencies
sle_idbranch sle_idbranch
st_1 st_1
cb_1 cb_1
cb_2 cb_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_expired_orders w_expired_orders

type variables
integer li_count
end variables

event ue_update();dw_1.update()
end event

event ue_retrieve();string ls_branch_id, s_filter
double ld_days


dw_1.settransobject(SQLCArpt)

ls_branch_id = lst_agencies.getdataid()

//if ls_branch_id <> '' then
//	s_filter =" id_main_branch_sent = '" + ls_branch_id + " '"
//else
//	s_filter = ls_branch_id
//end if

ld_days = double(em_days.text)

dw_1.retrieve(ld_days, ls_branch_id)
//dw_1.setfilter( s_filter )
//dw_1.filter()
dw_1.SetRedraw(true )


if dw_1.rowcount() <= 0 then
	
	messagebox('ALERT', 'NO RECORDS FOUND', STOPSIGN!)
	
END IF

end event

event open;call super::open;	
	
	
	
	lst_agencies.insertitem('ALL',1 )
	lst_agencies.text = 'ALL'
	
	em_days.text = string(30)
end event

on w_expired_orders.create
int iCurrent
call super::create
this.p_1=create p_1
this.em_days=create em_days
this.st_2=create st_2
this.cb_expire=create cb_expire
this.cb_3=create cb_3
this.lst_agencies=create lst_agencies
this.sle_idbranch=create sle_idbranch
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_1
this.Control[iCurrent+2]=this.em_days
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.cb_expire
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.lst_agencies
this.Control[iCurrent+7]=this.sle_idbranch
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.dw_1
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.gb_2
end on

on w_expired_orders.destroy
call super::destroy
destroy(this.p_1)
destroy(this.em_days)
destroy(this.st_2)
destroy(this.cb_expire)
destroy(this.cb_3)
destroy(this.lst_agencies)
destroy(this.sle_idbranch)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event closequery;Constant Integer	ALLOW_CLOSE = 0

// NO - Allow the window to be closed without saving changes
ib_closestatus = False
Return ALLOW_CLOSE
end event

type p_1 from picture within w_expired_orders
integer x = 3141
integer y = 96
integer width = 73
integer height = 64
boolean originalsize = true
string picturename = "OutputStop!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type em_days from editmask within w_expired_orders
integer x = 2066
integer y = 88
integer width = 151
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type st_2 from statictext within w_expired_orders
integer x = 1929
integer y = 104
integer width = 146
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Days:"
boolean focusrectangle = false
end type

type cb_expire from commandbutton within w_expired_orders
integer x = 3095
integer y = 68
integer width = 873
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Expire Selected Orders"
end type

event clicked;double d_rown, row, ld_idreceiver, ld_cancelation_req, ld_return, ld_count
string  ls_idbranch, ls_desc_cancelation_req, ls_group, ls_branch_pay, ls_can_interfase
dw_1.accepttext()
//event ue_update()
d_rown = dw_1.rowcount( )
ld_count = 0

for row = 1 to d_rown
	if dw_1.getitemstring(row,"order_expired") = 'Y' then
		ld_count = ld_count + 1	
		ls_group = dw_1.getitemstring(row,"id_main_branch_sent")
		ls_idbranch = dw_1.getitemstring(row,"id_branch")
		ld_idreceiver = dw_1.getitemnumber(row,"id_receiver")

		update dba.receiver
			set order_expired = 'Y'
		 where id_branch = :ls_idbranch
			and id_receiver =: ld_idreceiver;	
		
		SELECT BRANCH_PAY_RECEIVER
		INTO :ls_branch_pay
		FROM dba.receiver
		WHERE id_branch = :ls_idbranch
					and id_receiver =:ld_idreceiver;

		SELECT payer_can_interfase
		INTO :ls_can_interfase
		FROM dba.group_branch
		WHERE dba.group_branch.id_main_branch = :ls_group;

		if isnull(ls_can_interfase) or ls_can_interfase <> 'Y' then ls_can_interfase = 'N'

		if (ls_can_interfase = 'Y')  then
			select id_cancelation_req
			into :ld_cancelation_req
			from dba.receiver
			where id_branch = :ls_idbranch
				and id_receiver =:ld_idreceiver;
			
			if isnull(ld_cancelation_req) or ld_cancelation_req = 9 then
				update dba.receiver
				  set id_cancelation_req = 0
				  where id_branch = :ls_idbranch
					and id_receiver =: ld_idreceiver;
			
				// La CANCELACION se envia en una retransmision a excepcion de Agricola
				if ls_group <> 'T053' then
					update dba.receiver
						set trans_receiver = 'N'
					 where id_branch = :ls_idbranch
						and id_receiver =: ld_idreceiver;			
				end if				
		
				commit;
			else
				select desc_cancelation_req
				  into :ls_desc_cancelation_req
				  from dba.cancelation_requests
				 where id_cancelation_req = :ld_cancelation_req;				
			
				if isnull(ls_desc_cancelation_req) then ls_desc_cancelation_req =''
			end if
		else
			ld_return = fn_cancel_invoice(ls_idbranch,ld_idreceiver,'N')
			if ld_return > -1 then
				Messagebox("Expiration Complete in MTSA","Order has been canceled in MTSA.~nPlease be sure to confirm the Cancelation with the payer.")	
			else
				Messagebox("Process Cancelled","Process cancelled by user, the order was not cancelled.")	
			end if
		end if
	end if
next

if ld_count = 0 then
	messagebox('ALERT','No Record Selected',stopsign!)
else
	messagebox('Expiration Request', 'Expiration Request was send to the Payer',exclamation!)
	event ue_retrieve()
end if

//event ue_update()

event ue_retrieve()

end event

type cb_3 from commandbutton within w_expired_orders
integer x = 2304
integer y = 84
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;event ue_retrieve()
li_count = 0
end event

type lst_agencies from my_ddlb within w_expired_orders
integer x = 809
integer y = 88
integer width = 1010
integer height = 1504
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type = 'P' and flag_grupo = 'A'  order by name_main_branch;")
end event

event selectionchanged;call super::selectionchanged;sle_idbranch.text = lst_agencies.getdataid()
end event

type sle_idbranch from singlelineedit within w_expired_orders
integer x = 462
integer y = 88
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_agencies.setselectedid( sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_agencies.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF


end event

type st_1 from statictext within w_expired_orders
integer x = 178
integer y = 104
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Payer:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_expired_orders
boolean visible = false
integer x = 4466
integer y = 84
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
boolean enabled = false
string text = "Deselect All"
boolean cancel = true
end type

event clicked;//***** Procces to Select ALL records *********//
//*                                                                        //
//*                                                                       //
//************************************//
double d_rownum, d_num

d_rownum = dw_1.rowcount()

if d_rownum > 0 then
	
	for d_num = 1 to d_rownum
		
		dw_1.setitem(d_num,'order_expired','N' )
		
	next
else
	messagebox('Alert','No Records found',stopsign!)
end if
end event

type cb_2 from commandbutton within w_expired_orders
boolean visible = false
integer x = 4114
integer y = 84
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
boolean enabled = false
string text = "Select All"
boolean cancel = true
end type

event clicked;//***** Procces to Select ALL records *********//
//*                                                                        //
//*                                                                       //
//************************************//
double d_rownum, d_num

d_rownum = dw_1.rowcount()

if d_rownum > 0 then
	
	for d_num = 1 to d_rownum
		
		dw_1.setitem(d_num,'order_expired','Y')
		
	next
else
	messagebox('Alert','No Records found',stopsign!)
end if
end event

type dw_1 from datawindow within w_expired_orders
integer x = 27
integer y = 232
integer width = 4041
integer height = 1588
integer taborder = 10
string title = "none"
string dataobject = "dw_expired_orders"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;string s
s =''
end event

event itemchanged;

if dwo.name = 'order_expired' then

	if data = 'Y' then
		li_count ++
	else
		li_count -- 
	end if

	if li_count > 0 then
		cb_expire.enabled = true
	else
		cb_expire.enabled = false
	end if

end if
end event

type gb_1 from groupbox within w_expired_orders
integer x = 2990
integer y = 8
integer width = 1079
integer height = 220
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_expired_orders
integer x = 32
integer y = 8
integer width = 2930
integer height = 220
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer"
end type

