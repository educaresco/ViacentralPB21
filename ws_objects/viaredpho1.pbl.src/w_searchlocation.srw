$PBExportHeader$w_searchlocation.srw
forward
global type w_searchlocation from window
end type
type cb_closeselect from commandbutton within w_searchlocation
end type
type rb_d from radiobutton within w_searchlocation
end type
type rb_p from radiobutton within w_searchlocation
end type
type rb_c from radiobutton within w_searchlocation
end type
type dw_2 from datawindow within w_searchlocation
end type
type cb_closediscard from commandbutton within w_searchlocation
end type
type dw_1 from datawindow within w_searchlocation
end type
type cb_1 from commandbutton within w_searchlocation
end type
type sle_city from singlelineedit within w_searchlocation
end type
type sle_country from singlelineedit within w_searchlocation
end type
type st_2 from statictext within w_searchlocation
end type
type st_1 from statictext within w_searchlocation
end type
end forward

global type w_searchlocation from window
integer width = 2350
integer height = 1840
boolean titlebar = true
string title = "Search Location"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_closeselect cb_closeselect
rb_d rb_d
rb_p rb_p
rb_c rb_c
dw_2 dw_2
cb_closediscard cb_closediscard
dw_1 dw_1
cb_1 cb_1
sle_city sle_city
sle_country sle_country
st_2 st_2
st_1 st_1
end type
global w_searchlocation w_searchlocation

on w_searchlocation.create
this.cb_closeselect=create cb_closeselect
this.rb_d=create rb_d
this.rb_p=create rb_p
this.rb_c=create rb_c
this.dw_2=create dw_2
this.cb_closediscard=create cb_closediscard
this.dw_1=create dw_1
this.cb_1=create cb_1
this.sle_city=create sle_city
this.sle_country=create sle_country
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_closeselect,&
this.rb_d,&
this.rb_p,&
this.rb_c,&
this.dw_2,&
this.cb_closediscard,&
this.dw_1,&
this.cb_1,&
this.sle_city,&
this.sle_country,&
this.st_2,&
this.st_1}
end on

on w_searchlocation.destroy
destroy(this.cb_closeselect)
destroy(this.rb_d)
destroy(this.rb_p)
destroy(this.rb_c)
destroy(this.dw_2)
destroy(this.cb_closediscard)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.sle_city)
destroy(this.sle_country)
destroy(this.st_2)
destroy(this.st_1)
end on

type cb_closeselect from commandbutton within w_searchlocation
integer x = 1166
integer y = 1640
integer width = 1120
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&Close and Select Point"
end type

event clicked;closewithreturn(parent,dw_2.getitemstring(dw_2.getrow(),"branch_id_branch"))
end event

type rb_d from radiobutton within w_searchlocation
integer x = 1019
integer y = 792
integer width = 430
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Delivery"
end type

event clicked;string ls_modopago, ls_cubrimiento

if rb_c.checked then
	ls_modopago = 'C'
elseif rb_p.checked then
	ls_modopago = 'P'
elseif rb_d.checked then
	ls_modopago = 'D'
end if

SELECT dba.modo_pago.use_cubrimiento  
  INTO :ls_cubrimiento  
  FROM dba.modo_pago  
 WHERE dba.modo_pago.id_modo_pago = :ls_modopago;

dw_2.retrieve(dw_1.getitemstring(dw_1.getrow(),"city_id_city"),ls_modopago,ls_cubrimiento)
end event

type rb_p from radiobutton within w_searchlocation
integer x = 50
integer y = 792
integer width = 430
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cash (Office)"
boolean checked = true
end type

event clicked;string ls_modopago, ls_cubrimiento

if rb_c.checked then
	ls_modopago = 'C'
elseif rb_p.checked then
	ls_modopago = 'P'
elseif rb_d.checked then
	ls_modopago = 'D'
end if

SELECT dba.modo_pago.use_cubrimiento  
  INTO :ls_cubrimiento  
  FROM dba.modo_pago  
 WHERE dba.modo_pago.id_modo_pago = :ls_modopago;

dw_2.retrieve(dw_1.getitemstring(dw_1.getrow(),"city_id_city"),ls_modopago,ls_cubrimiento)
end event

type rb_c from radiobutton within w_searchlocation
integer x = 535
integer y = 792
integer width = 430
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Deposit (Bank)"
end type

event clicked;string ls_modopago, ls_cubrimiento

if rb_c.checked then
	ls_modopago = 'C'
elseif rb_p.checked then
	ls_modopago = 'P'
elseif rb_d.checked then
	ls_modopago = 'D'
end if

SELECT dba.modo_pago.use_cubrimiento  
  INTO :ls_cubrimiento  
  FROM dba.modo_pago  
 WHERE dba.modo_pago.id_modo_pago = :ls_modopago;

dw_2.retrieve(dw_1.getitemstring(dw_1.getrow(),"city_id_city"),ls_modopago,ls_cubrimiento)
end event

type dw_2 from datawindow within w_searchlocation
integer x = 32
integer y = 868
integer width = 2254
integer height = 736
integer taborder = 50
string dataobject = "dw_searchlocation_branch"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;if dw_2.GetClickedRow() = 0 then
	dw_2.SelectRow(0, FALSE)
	cb_closeselect.enabled = false
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
end if

cb_closeselect.enabled = true
end event

type cb_closediscard from commandbutton within w_searchlocation
integer x = 32
integer y = 1640
integer width = 1120
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Close and Discard"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_searchlocation
integer x = 32
integer y = 224
integer width = 2254
integer height = 556
integer taborder = 40
string dataobject = "dw_searchlocation"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;dw_2.reset()

if dw_1.GetClickedRow() = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
end if

string ls_modopago, ls_cubrimiento

if rb_c.checked then
	ls_modopago = 'C'
elseif rb_p.checked then
	ls_modopago = 'P'
elseif rb_d.checked then
	ls_modopago = 'D'
end if

SELECT dba.modo_pago.use_cubrimiento  
  INTO :ls_cubrimiento  
  FROM dba.modo_pago  
 WHERE dba.modo_pago.id_modo_pago = :ls_modopago;

dw_2.retrieve(dw_1.getitemstring(dw_1.getrow(),"city_id_city"),ls_modopago,ls_cubrimiento)


end event

type cb_1 from commandbutton within w_searchlocation
integer x = 1851
integer y = 32
integer width = 434
integer height = 164
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Search"
end type

event clicked;dw_1.retrieve(trim(sle_country.text),trim(sle_city.text))
end event

type sle_city from singlelineedit within w_searchlocation
event ue_select ( )
integer x = 485
integer y = 116
integer width = 1303
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event ue_select();this.SelectText(1, Len(this.Text))
end event

event getfocus;This. EVENT POST ue_select( )

end event

type sle_country from singlelineedit within w_searchlocation
event ue_select ( )
integer x = 485
integer y = 32
integer width = 1303
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event ue_select();this.SelectText(1, Len(this.Text))
end event

event getfocus;This. EVENT POST ue_select( )
end event

type st_2 from statictext within w_searchlocation
integer x = 169
integer y = 128
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "City Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_searchlocation
integer x = 114
integer y = 44
integer width = 347
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Country Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

