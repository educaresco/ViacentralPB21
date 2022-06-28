$PBExportHeader$w_invoice_selectpayer.srw
forward
global type w_invoice_selectpayer from window
end type
type rb_dollar from radiobutton within w_invoice_selectpayer
end type
type rb_local from radiobutton within w_invoice_selectpayer
end type
type rb_zipcode from radiobutton within w_invoice_selectpayer
end type
type rb_phonearea from radiobutton within w_invoice_selectpayer
end type
type rb_bigcities from radiobutton within w_invoice_selectpayer
end type
type rb_cityname from radiobutton within w_invoice_selectpayer
end type
type lst_countries from my_ddlb within w_invoice_selectpayer
end type
type cb_closeselect from commandbutton within w_invoice_selectpayer
end type
type rb_d from radiobutton within w_invoice_selectpayer
end type
type rb_p from radiobutton within w_invoice_selectpayer
end type
type rb_c from radiobutton within w_invoice_selectpayer
end type
type dw_2 from datawindow within w_invoice_selectpayer
end type
type cb_closediscard from commandbutton within w_invoice_selectpayer
end type
type dw_1 from datawindow within w_invoice_selectpayer
end type
type cb_search from commandbutton within w_invoice_selectpayer
end type
type sle_city from singlelineedit within w_invoice_selectpayer
end type
type st_2 from statictext within w_invoice_selectpayer
end type
type st_1 from statictext within w_invoice_selectpayer
end type
type gb_1 from groupbox within w_invoice_selectpayer
end type
type gb_2 from groupbox within w_invoice_selectpayer
end type
type gb_3 from groupbox within w_invoice_selectpayer
end type
end forward

global type w_invoice_selectpayer from window
integer width = 2747
integer height = 1964
boolean titlebar = true
string title = "Seleccionar Destino"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "AppIcon!"
boolean center = true
rb_dollar rb_dollar
rb_local rb_local
rb_zipcode rb_zipcode
rb_phonearea rb_phonearea
rb_bigcities rb_bigcities
rb_cityname rb_cityname
lst_countries lst_countries
cb_closeselect cb_closeselect
rb_d rb_d
rb_p rb_p
rb_c rb_c
dw_2 dw_2
cb_closediscard cb_closediscard
dw_1 dw_1
cb_search cb_search
sle_city sle_city
st_2 st_2
st_1 st_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_invoice_selectpayer w_invoice_selectpayer

forward prototypes
public subroutine fn_radclick ()
public subroutine fn_cleansearch ()
end prototypes

public subroutine fn_radclick ();
sle_city.visible = false


if rb_cityname.checked then
	sle_city.visible = true	
elseif rb_bigcities.checked then
	
elseif rb_phonearea.checked then
	
elseif rb_zipcode.checked then
	
end if


end subroutine

public subroutine fn_cleansearch ();dw_1.reset()
dw_2.reset()
cb_closeselect.enabled = false
end subroutine

on w_invoice_selectpayer.create
this.rb_dollar=create rb_dollar
this.rb_local=create rb_local
this.rb_zipcode=create rb_zipcode
this.rb_phonearea=create rb_phonearea
this.rb_bigcities=create rb_bigcities
this.rb_cityname=create rb_cityname
this.lst_countries=create lst_countries
this.cb_closeselect=create cb_closeselect
this.rb_d=create rb_d
this.rb_p=create rb_p
this.rb_c=create rb_c
this.dw_2=create dw_2
this.cb_closediscard=create cb_closediscard
this.dw_1=create dw_1
this.cb_search=create cb_search
this.sle_city=create sle_city
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.rb_dollar,&
this.rb_local,&
this.rb_zipcode,&
this.rb_phonearea,&
this.rb_bigcities,&
this.rb_cityname,&
this.lst_countries,&
this.cb_closeselect,&
this.rb_d,&
this.rb_p,&
this.rb_c,&
this.dw_2,&
this.cb_closediscard,&
this.dw_1,&
this.cb_search,&
this.sle_city,&
this.st_2,&
this.st_1,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_invoice_selectpayer.destroy
destroy(this.rb_dollar)
destroy(this.rb_local)
destroy(this.rb_zipcode)
destroy(this.rb_phonearea)
destroy(this.rb_bigcities)
destroy(this.rb_cityname)
destroy(this.lst_countries)
destroy(this.cb_closeselect)
destroy(this.rb_d)
destroy(this.rb_p)
destroy(this.rb_c)
destroy(this.dw_2)
destroy(this.cb_closediscard)
destroy(this.dw_1)
destroy(this.cb_search)
destroy(this.sle_city)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;lst_countries.addquery("select distinct iso_name, iso_c3 from dba.country where flag_country = 'A' order by iso_name;")
end event

type rb_dollar from radiobutton within w_invoice_selectpayer
integer x = 421
integer y = 1716
integer width = 265
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Dollar"
end type

type rb_local from radiobutton within w_invoice_selectpayer
integer x = 91
integer y = 1716
integer width = 265
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Local"
boolean checked = true
end type

type rb_zipcode from radiobutton within w_invoice_selectpayer
integer x = 1408
integer y = 160
integer width = 251
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Por Zip"
end type

type rb_phonearea from radiobutton within w_invoice_selectpayer
integer x = 1001
integer y = 160
integer width = 375
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Por Telefono"
end type

type rb_bigcities from radiobutton within w_invoice_selectpayer
integer x = 466
integer y = 160
integer width = 503
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Ciudades Grandes"
end type

type rb_cityname from radiobutton within w_invoice_selectpayer
integer x = 91
integer y = 160
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Por Ciudad"
boolean checked = true
end type

type lst_countries from my_ddlb within w_invoice_selectpayer
integer x = 183
integer y = 32
integer width = 978
integer height = 1276
integer taborder = 10
end type

event selectionchanged;call super::selectionchanged;sle_city.text = ''
fn_cleansearch()
end event

type cb_closeselect from commandbutton within w_invoice_selectpayer
integer x = 2139
integer y = 1748
integer width = 530
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cerrar y &Seleccionar"
end type

event clicked;String ls_paymode, ls_currency

if rb_local.checked then
	ls_currency = 'N'
else
	ls_currency = 'D'
end if


if rb_p.checked then
	ls_paymode = 'P'
elseif rb_c.checked then
	ls_paymode = 'C'
else
	ls_paymode = 'D'
end if


closewithreturn(parent,dw_2.getitemstring(dw_2.getrow(),"branch_id_branch")+'*'+ls_currency+'*'+ls_paymode)
end event

type rb_d from radiobutton within w_invoice_selectpayer
integer x = 1403
integer y = 872
integer width = 521
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Domicilio (Delivery)"
end type

event clicked;dw_2.reset()
cb_closeselect.enabled = false

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

type rb_p from radiobutton within w_invoice_selectpayer
integer x = 91
integer y = 872
integer width = 480
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Ventanilla (Cash)"
boolean checked = true
end type

event clicked;dw_2.reset()
cb_closeselect.enabled = false

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

type rb_c from radiobutton within w_invoice_selectpayer
integer x = 667
integer y = 872
integer width = 640
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Deposito (Bank Deposit)"
end type

event clicked;dw_2.reset()
cb_closeselect.enabled = false

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

type dw_2 from datawindow within w_invoice_selectpayer
integer x = 50
integer y = 956
integer width = 2619
integer height = 724
integer taborder = 50
string dataobject = "dw_invoice_selectpayer_pay"
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
	
	if this.getitemstring(row,"branch_currency_pay_branch") = 'D' then
		rb_local.enabled = false
		rb_local.checked = false
		rb_dollar.enabled = true
		rb_dollar.checked = true
	elseif this.getitemstring(row,"branch_currency_pay_branch") = 'N' then
		rb_local.enabled = true
		rb_local.checked = true
		rb_dollar.enabled = false
		rb_dollar.checked = false
	else
		rb_local.enabled = true
		rb_local.checked = true
		rb_dollar.enabled = true
		rb_dollar.checked = false		
	end if
	
end if

cb_closeselect.enabled = true
end event

type cb_closediscard from commandbutton within w_invoice_selectpayer
integer x = 1595
integer y = 1748
integer width = 530
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cerrar y &Descartar"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_invoice_selectpayer
integer x = 50
integer y = 448
integer width = 2619
integer height = 392
integer taborder = 40
string dataobject = "dw_invoice_selectpayer_loc"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;dw_2.reset()
cb_closeselect.enabled = false

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

type cb_search from commandbutton within w_invoice_selectpayer
integer x = 1541
integer y = 280
integer width = 530
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Buscar"
end type

event clicked;fn_cleansearch()
dw_1.retrieve(lst_countries.getdataid(),trim(sle_city.text))

end event

type sle_city from singlelineedit within w_invoice_selectpayer
event ue_select ( )
integer x = 773
integer y = 280
integer width = 754
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

event losefocus;cb_search.TriggerEvent(Clicked!)
end event

type st_2 from statictext within w_invoice_selectpayer
integer x = 498
integer y = 292
integer width = 238
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Ciudad:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_invoice_selectpayer
integer x = 9
integer y = 40
integer width = 151
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "País:"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_invoice_selectpayer
integer x = 50
integer y = 160
integer width = 2610
integer height = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = stylebox!
end type

type gb_2 from groupbox within w_invoice_selectpayer
integer x = 50
integer y = 1672
integer width = 686
integer height = 120
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
end type

type gb_3 from groupbox within w_invoice_selectpayer
integer x = 50
integer y = 828
integer width = 2619
integer height = 120
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = stylebox!
end type

