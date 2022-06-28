$PBExportHeader$w_cambio_cons_cheque.srw
forward
global type w_cambio_cons_cheque from wb_response
end type
type em_1 from editmask within w_cambio_cons_cheque
end type
type cb_close from commandbutton within w_cambio_cons_cheque
end type
type cb_aplicar from commandbutton within w_cambio_cons_cheque
end type
type st_1 from statictext within w_cambio_cons_cheque
end type
type gb_1 from groupbox within w_cambio_cons_cheque
end type
end forward

global type w_cambio_cons_cheque from wb_response
integer x = 951
integer y = 524
integer width = 1303
integer height = 488
boolean controlmenu = false
long backcolor = 80269524
em_1 em_1
cb_close cb_close
cb_aplicar cb_aplicar
st_1 st_1
gb_1 gb_1
end type
global w_cambio_cons_cheque w_cambio_cons_cheque

type variables
string	is_group
end variables

on w_cambio_cons_cheque.create
int iCurrent
call super::create
this.em_1=create em_1
this.cb_close=create cb_close
this.cb_aplicar=create cb_aplicar
this.st_1=create st_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_aplicar
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.gb_1
end on

on w_cambio_cons_cheque.destroy
call super::destroy
destroy(this.em_1)
destroy(this.cb_close)
destroy(this.cb_aplicar)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;call super::open;
IF 'AMT'= message.stringparm  then
	st_1.text ='Type the correct Commission Amount:'
	em_1.SetMask(NumericMask!, '##,####,###.00')
ELSE	
	em_1.SetMask(StringMask!, '##########')
END IF 
end event

type em_1 from editmask within w_cambio_cons_cheque
integer x = 750
integer y = 100
integer width = 485
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##########"
end type

type cb_close from commandbutton within w_cambio_cons_cheque
integer x = 640
integer y = 228
integer width = 393
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
boolean cancel = true
end type

event clicked;closewithreturn(parent,-9999)
end event

type cb_aplicar from commandbutton within w_cambio_cons_cheque
integer x = 229
integer y = 228
integer width = 393
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Save"
boolean cancel = true
boolean default = true
end type

event clicked;double ld_number
string ls_message
boolean lb_show = false

ld_number =double(em_1.text) 
if isnull(ld_number ) then ld_number  = -1

IF 'AMT'= message.stringparm  then

	if ld_number 	= 0  then
		lb_show 		= true
		ls_message  = 'Please verify the new commission amount'
	end if
ELSE
	if ld_number 	<= 0  then
		lb_show 		= true
		ls_message 	= 'Please verify the check number'
	end if
END IF 	

if lb_show then
	messagebox('Attention',ls_message,stopsign!)
	return
end if 

closewithreturn(parent,double(em_1.text))
end event

type st_1 from statictext within w_cambio_cons_cheque
integer x = 27
integer y = 108
integer width = 704
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Type the next check~'s number:"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_cambio_cons_cheque
integer x = 27
integer y = 4
integer width = 1225
integer height = 356
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

