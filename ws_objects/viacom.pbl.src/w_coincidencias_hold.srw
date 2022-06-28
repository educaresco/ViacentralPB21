$PBExportHeader$w_coincidencias_hold.srw
forward
global type w_coincidencias_hold from window
end type
type rb_360days from radiobutton within w_coincidencias_hold
end type
type rb_60days from radiobutton within w_coincidencias_hold
end type
type rb_180days from radiobutton within w_coincidencias_hold
end type
type rb_90days from radiobutton within w_coincidencias_hold
end type
type rb_via_sender_num from radiobutton within w_coincidencias_hold
end type
type rb_30days from radiobutton within w_coincidencias_hold
end type
type cb_1 from commandbutton within w_coincidencias_hold
end type
type rb_nombrereceiver from radiobutton within w_coincidencias_hold
end type
type st_1 from statictext within w_coincidencias_hold
end type
type rb_sender_phone from radiobutton within w_coincidencias_hold
end type
type rb_sender_name from radiobutton within w_coincidencias_hold
end type
type dw_1 from datawindow within w_coincidencias_hold
end type
type gb_2 from groupbox within w_coincidencias_hold
end type
type rb_phone from radiobutton within w_coincidencias_hold
end type
type gb_1 from groupbox within w_coincidencias_hold
end type
end forward

global type w_coincidencias_hold from window
integer x = 1056
integer y = 456
integer width = 3264
integer height = 1540
boolean titlebar = true
string title = "Coincidencias"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 82042848
rb_360days rb_360days
rb_60days rb_60days
rb_180days rb_180days
rb_90days rb_90days
rb_via_sender_num rb_via_sender_num
rb_30days rb_30days
cb_1 cb_1
rb_nombrereceiver rb_nombrereceiver
st_1 st_1
rb_sender_phone rb_sender_phone
rb_sender_name rb_sender_name
dw_1 dw_1
gb_2 gb_2
rb_phone rb_phone
gb_1 gb_1
end type
global w_coincidencias_hold w_coincidencias_hold

on w_coincidencias_hold.create
this.rb_360days=create rb_360days
this.rb_60days=create rb_60days
this.rb_180days=create rb_180days
this.rb_90days=create rb_90days
this.rb_via_sender_num=create rb_via_sender_num
this.rb_30days=create rb_30days
this.cb_1=create cb_1
this.rb_nombrereceiver=create rb_nombrereceiver
this.st_1=create st_1
this.rb_sender_phone=create rb_sender_phone
this.rb_sender_name=create rb_sender_name
this.dw_1=create dw_1
this.gb_2=create gb_2
this.rb_phone=create rb_phone
this.gb_1=create gb_1
this.Control[]={this.rb_360days,&
this.rb_60days,&
this.rb_180days,&
this.rb_90days,&
this.rb_via_sender_num,&
this.rb_30days,&
this.cb_1,&
this.rb_nombrereceiver,&
this.st_1,&
this.rb_sender_phone,&
this.rb_sender_name,&
this.dw_1,&
this.gb_2,&
this.rb_phone,&
this.gb_1}
end on

on w_coincidencias_hold.destroy
destroy(this.rb_360days)
destroy(this.rb_60days)
destroy(this.rb_180days)
destroy(this.rb_90days)
destroy(this.rb_via_sender_num)
destroy(this.rb_30days)
destroy(this.cb_1)
destroy(this.rb_nombrereceiver)
destroy(this.st_1)
destroy(this.rb_sender_phone)
destroy(this.rb_sender_name)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.rb_phone)
destroy(this.gb_1)
end on

event open;st_1.text = gs_name_ofac_sender
end event

type rb_360days from radiobutton within w_coincidencias_hold
integer x = 1371
integer y = 1348
integer width = 283
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "360 Days"
end type

event clicked;Datetime ld_fecha
Double ll_id_sender_global

dw_1.reset()

ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-360),time('00:00:00'))

if rb_via_sender_num.checked then
	ll_id_sender_global = double(fn_token(gs_ofac_address,'~~',2))
	st_1.text = gs_name_ofac_sender +' (' + string(ll_id_sender_global)+')'
	dw_1.dataobject='dw_coincidencia_id_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(ll_id_sender_global,ld_fecha)
	
elseif rb_sender_name.checked then
	st_1.text = gs_name_ofac_sender
	dw_1.dataobject='dw_coincidencia_nombre_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_sender,ld_fecha)
	
elseif rb_sender_phone.checked then
	st_1.text = string(gd_phone_sender)
	IF len(string(gd_phone_sender))<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gd_phone_sender,ld_fecha)
	
elseif rb_nombrereceiver.checked then
	st_1.text = trim(gs_name_ofac_receiver)
	dw_1.dataobject='dw_coincidencia_nombre_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_receiver,ld_fecha)
	
elseif rb_phone.checked then
	st_1.text = gs_phone_receiver_ofac
	IF len(gs_phone_receiver_ofac)<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_phone_receiver_ofac,ld_fecha)
	
end if
end event

type rb_60days from radiobutton within w_coincidencias_hold
integer x = 398
integer y = 1348
integer width = 283
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "60 Days"
end type

event clicked;Datetime ld_fecha
Double ll_id_sender_global

dw_1.reset()

ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-60),time('00:00:00'))

if rb_via_sender_num.checked then
	ll_id_sender_global = double(fn_token(gs_ofac_address,'~~',2))
	st_1.text = gs_name_ofac_sender +' (' + string(ll_id_sender_global)+')'
	dw_1.dataobject='dw_coincidencia_id_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(ll_id_sender_global,ld_fecha)
	
elseif rb_sender_name.checked then
	st_1.text = gs_name_ofac_sender
	dw_1.dataobject='dw_coincidencia_nombre_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_sender,ld_fecha)
	
elseif rb_sender_phone.checked then
	st_1.text = string(gd_phone_sender)
	IF len(string(gd_phone_sender))<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gd_phone_sender,ld_fecha)
	
elseif rb_nombrereceiver.checked then
	st_1.text = trim(gs_name_ofac_receiver)
	dw_1.dataobject='dw_coincidencia_nombre_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_receiver,ld_fecha)
	
elseif rb_phone.checked then
	st_1.text = gs_phone_receiver_ofac
	IF len(gs_phone_receiver_ofac)<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_phone_receiver_ofac,ld_fecha)
	
end if
end event

type rb_180days from radiobutton within w_coincidencias_hold
integer x = 1029
integer y = 1348
integer width = 283
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "180 Days"
end type

event clicked;Datetime ld_fecha
Double ll_id_sender_global

dw_1.reset()

ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-180),time('00:00:00'))

if rb_via_sender_num.checked then
	ll_id_sender_global = double(fn_token(gs_ofac_address,'~~',2))
	st_1.text = gs_name_ofac_sender +' (' + string(ll_id_sender_global)+')'
	dw_1.dataobject='dw_coincidencia_id_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(ll_id_sender_global,ld_fecha)
	
elseif rb_sender_name.checked then
	st_1.text = gs_name_ofac_sender
	dw_1.dataobject='dw_coincidencia_nombre_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_sender,ld_fecha)
	
elseif rb_sender_phone.checked then
	st_1.text = string(gd_phone_sender)
	IF len(string(gd_phone_sender))<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gd_phone_sender,ld_fecha)
	
elseif rb_nombrereceiver.checked then
	st_1.text = trim(gs_name_ofac_receiver)
	dw_1.dataobject='dw_coincidencia_nombre_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_receiver,ld_fecha)
	
elseif rb_phone.checked then
	st_1.text = gs_phone_receiver_ofac
	IF len(gs_phone_receiver_ofac)<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_phone_receiver_ofac,ld_fecha)
	
end if
end event

type rb_90days from radiobutton within w_coincidencias_hold
integer x = 709
integer y = 1348
integer width = 283
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "90 Days"
end type

event clicked;Datetime ld_fecha
Double ll_id_sender_global

dw_1.reset()

ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-90),time('00:00:00'))

if rb_via_sender_num.checked then
	ll_id_sender_global = double(fn_token(gs_ofac_address,'~~',2))
	st_1.text = gs_name_ofac_sender +' (' + string(ll_id_sender_global)+')'
	dw_1.dataobject='dw_coincidencia_id_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(ll_id_sender_global,ld_fecha)
	
elseif rb_sender_name.checked then
	st_1.text = gs_name_ofac_sender
	dw_1.dataobject='dw_coincidencia_nombre_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_sender,ld_fecha)
	
elseif rb_sender_phone.checked then
	st_1.text = string(gd_phone_sender)
	IF len(string(gd_phone_sender))<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gd_phone_sender,ld_fecha)
	
elseif rb_nombrereceiver.checked then
	st_1.text = trim(gs_name_ofac_receiver)
	dw_1.dataobject='dw_coincidencia_nombre_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_receiver,ld_fecha)
	
elseif rb_phone.checked then
	st_1.text = gs_phone_receiver_ofac
	IF len(gs_phone_receiver_ofac)<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_phone_receiver_ofac,ld_fecha)
	
end if
end event

type rb_via_sender_num from radiobutton within w_coincidencias_hold
integer x = 55
integer y = 44
integer width = 489
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Via. Sender Num."
end type

event clicked;Datetime ld_fecha
long		ll_pos
Double ll_id_sender_global

dw_1.reset()

if rb_30days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-30),time('00:00:00'))
elseif rb_60days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-60),time('00:00:00'))
elseif rb_90days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-90),time('00:00:00'))
elseif rb_180days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-180),time('00:00:00'))
elseif rb_360days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-360),time('00:00:00'))
else	
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-500),time('00:00:00'))
end if

//ll_pos = pos(gs_name_ofac_sender,'%')

//if ll_pos = 0 then
//	gs_name_ofac_sender = '%'+trim(gs_name_ofac_sender)+'%'
//end if

ll_id_sender_global = double(fn_token(gs_ofac_address,'~~',2))

st_1.text = gs_name_ofac_sender +' (' + string(ll_id_sender_global)+')'

dw_1.dataobject='dw_coincidencia_id_sender'
dw_1.settransobject(sqlcarpt)
dw_1.retrieve(ll_id_sender_global,ld_fecha)
end event

type rb_30days from radiobutton within w_coincidencias_hold
integer x = 87
integer y = 1348
integer width = 283
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "30 Days"
boolean checked = true
end type

event clicked;Datetime ld_fecha
Double ll_id_sender_global

dw_1.reset()

ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-30),time('00:00:00'))

if rb_via_sender_num.checked then
	ll_id_sender_global = double(fn_token(gs_ofac_address,'~~',2))
	st_1.text = gs_name_ofac_sender +' (' + string(ll_id_sender_global)+')'
	dw_1.dataobject='dw_coincidencia_id_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(ll_id_sender_global,ld_fecha)
	
elseif rb_sender_name.checked then
	st_1.text = gs_name_ofac_sender
	dw_1.dataobject='dw_coincidencia_nombre_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_sender,ld_fecha)
	
elseif rb_sender_phone.checked then
	st_1.text = string(gd_phone_sender)
	IF len(string(gd_phone_sender))<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_sender'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gd_phone_sender,ld_fecha)
	
elseif rb_nombrereceiver.checked then
	st_1.text = trim(gs_name_ofac_receiver)
	dw_1.dataobject='dw_coincidencia_nombre_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_name_ofac_receiver,ld_fecha)
	
elseif rb_phone.checked then
	st_1.text = gs_phone_receiver_ofac
	IF len(gs_phone_receiver_ofac)<=5 THEN
		messagebox('Alert', 'Phone number must have more than 5 digits')
		return
	END IF
	dw_1.dataobject='dw_coincidencia_phone_receiver'
	dw_1.settransobject(sqlcarpt)
	dw_1.retrieve(gs_phone_receiver_ofac,ld_fecha)
	
end if
end event

type cb_1 from commandbutton within w_coincidencias_hold
boolean visible = false
integer x = 2555
integer y = 28
integer width = 635
integer height = 168
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Print"
end type

event clicked;
printsetup()
dw_1.print()
end event

type rb_nombrereceiver from radiobutton within w_coincidencias_hold
integer x = 1536
integer y = 44
integer width = 521
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Receiver~'s Name"
end type

event clicked;Datetime ld_fecha
long		ll_pos

//if rb_3.checked then
//	ld_fecha = Datetime(relativedate(today(),-30),time('00:00:00'))
//else	
//	ld_fecha = Datetime(relativedate(today(),-500),time('00:00:00'))
//end if

dw_1.reset()

if rb_30days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-30),time('00:00:00'))
elseif rb_60days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-60),time('00:00:00'))
elseif rb_90days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-90),time('00:00:00'))
elseif rb_180days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-180),time('00:00:00'))
elseif rb_360days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-360),time('00:00:00'))
else	
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-500),time('00:00:00'))
end if

st_1.text = trim(gs_name_ofac_receiver)
//ll_pos = pos(gs_name_ofac_receiver,'%')

//if ll_pos = 0 then
//	gs_name_ofac_receiver = '%'+trim(gs_name_ofac_receiver)+'%'
//end if

dw_1.dataobject='dw_coincidencia_nombre_receiver'
dw_1.settransobject(sqlcarpt)
dw_1.retrieve(gs_name_ofac_receiver,ld_fecha)
end event

type st_1 from statictext within w_coincidencias_hold
integer x = 27
integer y = 128
integer width = 2505
integer height = 76
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12639424
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type rb_sender_phone from radiobutton within w_coincidencias_hold
integer x = 1065
integer y = 44
integer width = 471
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sender Phone"
end type

event clicked;dw_1.settransobject(sqlca)

Datetime ld_fecha


if rb_30days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-30),time('00:00:00'))
elseif rb_60days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-60),time('00:00:00'))
elseif rb_90days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-90),time('00:00:00'))
elseif rb_180days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-180),time('00:00:00'))
elseif rb_360days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-360),time('00:00:00'))
else	
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-500),time('00:00:00'))
end if

st_1.text = string(gd_phone_sender)

IF len(string(gd_phone_sender))<=5 THEN
	messagebox('Alert', 'Phone number must have more than 5 digits')
	return
END IF

dw_1.dataobject='dw_coincidencia_phone_sender'
dw_1.settransobject(sqlcarpt)

dw_1.retrieve(gd_phone_sender,ld_fecha)
end event

type rb_sender_name from radiobutton within w_coincidencias_hold
integer x = 590
integer y = 44
integer width = 471
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sender Name"
end type

event clicked;Datetime ld_fecha
long		ll_pos

dw_1.reset()

if rb_30days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-30),time('00:00:00'))
elseif rb_60days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-60),time('00:00:00'))
elseif rb_90days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-90),time('00:00:00'))
elseif rb_180days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-180),time('00:00:00'))
elseif rb_360days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-360),time('00:00:00'))
else	
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-500),time('00:00:00'))
end if

st_1.text = gs_name_ofac_sender
//ll_pos = pos(gs_name_ofac_sender,'%')

//if ll_pos = 0 then
//	gs_name_ofac_sender = '%'+trim(gs_name_ofac_sender)+'%'
//end if

dw_1.dataobject='dw_coincidencia_nombre_sender'
dw_1.settransobject(sqlcarpt)
dw_1.retrieve(gs_name_ofac_sender,ld_fecha)
end event

type dw_1 from datawindow within w_coincidencias_hold
integer x = 27
integer y = 212
integer width = 3173
integer height = 1092
integer taborder = 10
string dataobject = "dw_coincidencia_nombre_sender"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.settransobject(sqlcarpt)
end event

type gb_2 from groupbox within w_coincidencias_hold
integer x = 32
integer y = 1300
integer width = 1664
integer height = 136
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_phone from radiobutton within w_coincidencias_hold
integer x = 2094
integer y = 44
integer width = 434
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Receiver Phone"
end type

event clicked;Datetime ld_fecha
long		ll_pos
integer li_invalid_phone

dw_1.reset()

if rb_30days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-30),time('00:00:00'))
elseif rb_60days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-60),time('00:00:00'))
elseif rb_90days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-90),time('00:00:00'))
elseif rb_180days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-180),time('00:00:00'))
elseif rb_360days.checked then
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-360),time('00:00:00'))
else	
	ld_fecha = Datetime(relativedate(date(gd_ofac_datereceiver),-500),time('00:00:00'))
end if

st_1.text = gs_phone_receiver_ofac

IF len(gs_phone_receiver_ofac)<=5 THEN
	messagebox('Alert', 'Phone number must have more than 5 digits.')
	return
END IF

SELECT Count(*)
INTO: li_invalid_phone
FROM dba.INVALID_PHONES
WHERE PHONE_NUMBER = :gs_phone_receiver_ofac;

IF li_invalid_phone > 0 THEN
	messagebox('Alert', 'Invalid phone. Aggregation is not shown.')
	return
END IF

//ll_pos = pos(gs_phone_receiver_ofac,'%')
//
//if ll_pos = 0 then
//	gs_phone_receiver_ofac = '%'+gs_phone_receiver_ofac+'%'
//end if

dw_1.dataobject='dw_coincidencia_phone_receiver'
dw_1.settransobject(sqlcarpt)
dw_1.retrieve(gs_phone_receiver_ofac,ld_fecha)

end event

type gb_1 from groupbox within w_coincidencias_hold
integer x = 27
integer width = 2510
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

