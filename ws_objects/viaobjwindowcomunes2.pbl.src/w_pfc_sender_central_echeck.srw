$PBExportHeader$w_pfc_sender_central_echeck.srw
forward
global type w_pfc_sender_central_echeck from pfc_w_master
end type
type st_last4 from statictext within w_pfc_sender_central_echeck
end type
type sle_accountmasked2 from singlelineedit within w_pfc_sender_central_echeck
end type
type st_repeat from statictext within w_pfc_sender_central_echeck
end type
type em_references from editmask within w_pfc_sender_central_echeck
end type
type st_4 from statictext within w_pfc_sender_central_echeck
end type
type gb_2 from groupbox within w_pfc_sender_central_echeck
end type
type cb_1 from commandbutton within w_pfc_sender_central_echeck
end type
type em_accrouting from editmask within w_pfc_sender_central_echeck
end type
type st_1 from statictext within w_pfc_sender_central_echeck
end type
type em_accnumber from editmask within w_pfc_sender_central_echeck
end type
type st_2 from statictext within w_pfc_sender_central_echeck
end type
type em_accbank from editmask within w_pfc_sender_central_echeck
end type
type st_3 from statictext within w_pfc_sender_central_echeck
end type
type cb_noecheck from commandbutton within w_pfc_sender_central_echeck
end type
type rb_cash from radiobutton within w_pfc_sender_central_echeck
end type
type rb_moneyorder from radiobutton within w_pfc_sender_central_echeck
end type
type rb_cc from radiobutton within w_pfc_sender_central_echeck
end type
type rb_echeck from radiobutton within w_pfc_sender_central_echeck
end type
type rb_papper from radiobutton within w_pfc_sender_central_echeck
end type
type rb_wire from radiobutton within w_pfc_sender_central_echeck
end type
type sle_accountmasked1 from singlelineedit within w_pfc_sender_central_echeck
end type
type gb_1 from groupbox within w_pfc_sender_central_echeck
end type
end forward

global type w_pfc_sender_central_echeck from pfc_w_master
integer width = 2181
integer height = 800
string title = "Payment Method"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 80269524
st_last4 st_last4
sle_accountmasked2 sle_accountmasked2
st_repeat st_repeat
em_references em_references
st_4 st_4
gb_2 gb_2
cb_1 cb_1
em_accrouting em_accrouting
st_1 st_1
em_accnumber em_accnumber
st_2 st_2
em_accbank em_accbank
st_3 st_3
cb_noecheck cb_noecheck
rb_cash rb_cash
rb_moneyorder rb_moneyorder
rb_cc rb_cc
rb_echeck rb_echeck
rb_papper rb_papper
rb_wire rb_wire
sle_accountmasked1 sle_accountmasked1
gb_1 gb_1
end type
global w_pfc_sender_central_echeck w_pfc_sender_central_echeck

on w_pfc_sender_central_echeck.create
int iCurrent
call super::create
this.st_last4=create st_last4
this.sle_accountmasked2=create sle_accountmasked2
this.st_repeat=create st_repeat
this.em_references=create em_references
this.st_4=create st_4
this.gb_2=create gb_2
this.cb_1=create cb_1
this.em_accrouting=create em_accrouting
this.st_1=create st_1
this.em_accnumber=create em_accnumber
this.st_2=create st_2
this.em_accbank=create em_accbank
this.st_3=create st_3
this.cb_noecheck=create cb_noecheck
this.rb_cash=create rb_cash
this.rb_moneyorder=create rb_moneyorder
this.rb_cc=create rb_cc
this.rb_echeck=create rb_echeck
this.rb_papper=create rb_papper
this.rb_wire=create rb_wire
this.sle_accountmasked1=create sle_accountmasked1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_last4
this.Control[iCurrent+2]=this.sle_accountmasked2
this.Control[iCurrent+3]=this.st_repeat
this.Control[iCurrent+4]=this.em_references
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.gb_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.em_accrouting
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.em_accnumber
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.em_accbank
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.cb_noecheck
this.Control[iCurrent+15]=this.rb_cash
this.Control[iCurrent+16]=this.rb_moneyorder
this.Control[iCurrent+17]=this.rb_cc
this.Control[iCurrent+18]=this.rb_echeck
this.Control[iCurrent+19]=this.rb_papper
this.Control[iCurrent+20]=this.rb_wire
this.Control[iCurrent+21]=this.sle_accountmasked1
this.Control[iCurrent+22]=this.gb_1
end on

on w_pfc_sender_central_echeck.destroy
call super::destroy
destroy(this.st_last4)
destroy(this.sle_accountmasked2)
destroy(this.st_repeat)
destroy(this.em_references)
destroy(this.st_4)
destroy(this.gb_2)
destroy(this.cb_1)
destroy(this.em_accrouting)
destroy(this.st_1)
destroy(this.em_accnumber)
destroy(this.st_2)
destroy(this.em_accbank)
destroy(this.st_3)
destroy(this.cb_noecheck)
destroy(this.rb_cash)
destroy(this.rb_moneyorder)
destroy(this.rb_cc)
destroy(this.rb_echeck)
destroy(this.rb_papper)
destroy(this.rb_wire)
destroy(this.sle_accountmasked1)
destroy(this.gb_1)
end on

event open;call super::open;string ls_paymenttype

if not isvalid(w_pfc_sender_telefono_rojo) then
	close(this)
	return
end if

em_accrouting.text = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCROUTING")
em_accbank.text = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCBANK")					
em_accnumber.text = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCNUMBER")	
ls_paymenttype = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_PAYMENTTYPE")	
em_references.text = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCREFERENCIAS")	

sle_accountmasked1.text = em_accnumber.text
sle_accountmasked2.text = em_accnumber.text
st_last4.text = right(em_accnumber.text,4)

if ls_paymenttype = 'E' then
	rb_echeck.checked = TRUE
elseif ls_paymenttype = 'M' then
	rb_moneyorder.checked = TRUE
elseif ls_paymenttype = 'K' then
	rb_cc.checked = TRUE
elseif ls_paymenttype = 'P' then
	rb_papper.checked = TRUE
elseif ls_paymenttype = 'W' then
	rb_wire.checked = TRUE	
else
	rb_cash.checked = TRUE	
end if

em_accbank.enabled = rb_echeck.checked
em_accnumber.enabled = rb_echeck.checked
em_accrouting.enabled = rb_echeck.checked
em_references.enabled = rb_echeck.checked
end event

type st_last4 from statictext within w_pfc_sender_central_echeck
integer x = 1449
integer y = 204
integer width = 119
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_accountmasked2 from singlelineedit within w_pfc_sender_central_echeck
integer x = 1070
integer y = 276
integer width = 517
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
textcase textcase = upper!
integer limit = 17
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event modified;
if sle_accountmasked2.text <> sle_accountmasked1.text then
	st_repeat.TextColor = RGB(255,0,0)
else
	st_repeat.TextColor = RGB(0,0,0)
end if

end event

type st_repeat from statictext within w_pfc_sender_central_echeck
integer x = 626
integer y = 276
integer width = 443
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Repeat Account #: "
alignment alignment = right!
boolean focusrectangle = false
end type

type em_references from editmask within w_pfc_sender_central_echeck
integer x = 1070
integer y = 436
integer width = 1010
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

type st_4 from statictext within w_pfc_sender_central_echeck
integer x = 626
integer y = 436
integer width = 443
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "References : "
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_pfc_sender_central_echeck
integer x = 37
integer y = 24
integer width = 521
integer height = 540
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payment"
end type

type cb_1 from commandbutton within w_pfc_sender_central_echeck
integer x = 1609
integer y = 596
integer width = 517
integer height = 88
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&OK"
boolean default = true
end type

event clicked;w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCROUTING","")
w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCBANK","")			
w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCNUMBER","")
w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCREFERENCIAS","")

if rb_echeck.checked then

	if len(em_accrouting.text) <> 9 then		
		messagebox("Error","El número de ruta debe ser de 9 digitos.",StopSign!)
		return		
	end if

	if not isnumber(sle_accountmasked1.text) then
		messagebox("Error","El número de cuenta solo debe contener números.",StopSign!)
		return	
	end if
	
	if (sle_accountmasked1.text <> sle_accountmasked2.text) then
		messagebox("Error","La validación de la cuenta no coincide, por favor reingresa la cuenta.",StopSign!)
		return	
	end if	
	
	em_accnumber.text = sle_accountmasked1.text

	if len(em_accnumber.text) < 3 then		
		messagebox("Error","El número de cuenta es obligatorio.",StopSign!)
		return		
	end if		
		
	// """""""""""""""""""""""""""""""""""""""""""""""""""""""
	// Recupera el nombre del banco
	String ls_bankrouting, ls_bankname
	
	ls_bankrouting = em_accrouting.text
	
	select bank_name
	into :ls_bankname
	from dba.bank_routings
	where bank_routing = :ls_bankrouting;
	
	if isnull(ls_bankname) or len(trim(ls_bankname)) < 1 then		
	else
		em_accbank.text = left(ls_bankname,20)
	end if				
	// """""""""""""""""""""""""""""""""""""""""""""""""""""""		
	
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_PAYMENTTYPE","E")
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCROUTING",em_accrouting.text)
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCBANK",em_accbank.text)			
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCNUMBER",em_accnumber.text)
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCREFERENCIAS",em_references.text)

	
elseif rb_moneyorder.checked then
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_PAYMENTTYPE","M")	
elseif rb_cc.checked then
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_PAYMENTTYPE","K")	
elseif rb_papper.checked then
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_PAYMENTTYPE","P")	
elseif rb_wire.checked then
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_PAYMENTTYPE","W")	
else
	w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_PAYMENTTYPE","C")	
end if

Close(parent)
end event

type em_accrouting from editmask within w_pfc_sender_central_echeck
integer x = 1070
integer y = 116
integer width = 352
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "#########"
end type

event modified;string ls_bankname, ls_bankrouting

ls_bankname = ''
ls_bankrouting = em_accrouting.text

select bank_name
into :ls_bankname
from dba.bank_routings
where bank_routing = :ls_bankrouting;

if isnull(ls_bankname) or len(trim(ls_bankname)) < 1 then
	messagebox("Warning","The routing number was not found in the Federal Reserve List.~nPlease double-check the number before continue.",Exclamation!)
	em_accbank.text = ''
	em_accbank.displayonly = false
else
	em_accbank.displayonly = true
	em_accbank.text = left(ls_bankname,20)
end if


end event

type st_1 from statictext within w_pfc_sender_central_echeck
integer x = 626
integer y = 116
integer width = 443
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Routing Number: "
alignment alignment = right!
boolean focusrectangle = false
end type

type em_accnumber from editmask within w_pfc_sender_central_echeck
boolean visible = false
integer x = 46
integer y = 608
integer width = 704
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "#################"
end type

type st_2 from statictext within w_pfc_sender_central_echeck
integer x = 626
integer y = 196
integer width = 443
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Account #: "
alignment alignment = right!
boolean focusrectangle = false
end type

type em_accbank from editmask within w_pfc_sender_central_echeck
integer x = 1070
integer y = 356
integer width = 1010
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

type st_3 from statictext within w_pfc_sender_central_echeck
integer x = 626
integer y = 356
integer width = 443
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Account Bank : "
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_noecheck from commandbutton within w_pfc_sender_central_echeck
integer x = 1083
integer y = 596
integer width = 517
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cancel"
end type

event clicked;//w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCROUTING","")
//w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCBANK","")					
//w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_ACCNUMBER","")	

Close(parent)
end event

type rb_cash from radiobutton within w_pfc_sender_central_echeck
integer x = 59
integer y = 92
integer width = 430
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cash"
boolean checked = true
end type

event clicked;em_accbank.enabled = rb_echeck.checked
em_accnumber.enabled = rb_echeck.checked
em_accrouting.enabled = rb_echeck.checked
end event

type rb_moneyorder from radiobutton within w_pfc_sender_central_echeck
integer x = 59
integer y = 164
integer width = 430
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Money Order"
end type

event clicked;em_accbank.enabled = rb_echeck.checked
em_accnumber.enabled = rb_echeck.checked
em_accrouting.enabled = rb_echeck.checked
end event

type rb_cc from radiobutton within w_pfc_sender_central_echeck
integer x = 59
integer y = 236
integer width = 453
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Debit/Credit Card"
end type

event clicked;em_accbank.enabled = rb_echeck.checked
em_accnumber.enabled = rb_echeck.checked
em_accrouting.enabled = rb_echeck.checked
end event

type rb_echeck from radiobutton within w_pfc_sender_central_echeck
integer x = 59
integer y = 308
integer width = 430
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "E-Check"
end type

event clicked;em_accbank.enabled = rb_echeck.checked
em_accnumber.enabled = rb_echeck.checked
em_accrouting.enabled = rb_echeck.checked
end event

type rb_papper from radiobutton within w_pfc_sender_central_echeck
integer x = 59
integer y = 380
integer width = 430
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Paper"
end type

event clicked;em_accbank.enabled = rb_echeck.checked
em_accnumber.enabled = rb_echeck.checked
em_accrouting.enabled = rb_echeck.checked
end event

type rb_wire from radiobutton within w_pfc_sender_central_echeck
integer x = 59
integer y = 452
integer width = 430
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Wire Trans."
end type

event clicked;em_accbank.enabled = rb_echeck.checked
em_accnumber.enabled = rb_echeck.checked
em_accrouting.enabled = rb_echeck.checked
end event

type sle_accountmasked1 from singlelineedit within w_pfc_sender_central_echeck
integer x = 1070
integer y = 196
integer width = 517
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
textcase textcase = upper!
integer limit = 17
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event modified;em_accnumber.text = sle_accountmasked1.text
st_last4.text = right(em_accnumber.text,4)
sle_accountmasked2.text = ''
st_repeat.TextColor = RGB(255,0,0)

end event

event getfocus;st_last4.visible = false
end event

event losefocus;st_last4.visible = true
end event

type gb_1 from groupbox within w_pfc_sender_central_echeck
integer x = 581
integer y = 24
integer width = 1545
integer height = 540
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "E-Check Details"
end type

