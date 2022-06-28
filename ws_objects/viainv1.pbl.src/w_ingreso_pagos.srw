$PBExportHeader$w_ingreso_pagos.srw
forward
global type w_ingreso_pagos from wb_response
end type
type dw_1 from datawindow within w_ingreso_pagos
end type
type st_1 from statictext within w_ingreso_pagos
end type
type rb_pay from radiobutton within w_ingreso_pagos
end type
type rb_complain from radiobutton within w_ingreso_pagos
end type
type gb_1 from groupbox within w_ingreso_pagos
end type
type cb_1 from commandbutton within w_ingreso_pagos
end type
type sle_grupo from singlelineedit within w_ingreso_pagos
end type
type st_ref from statictext within w_ingreso_pagos
end type
type em_referencia from editmask within w_ingreso_pagos
end type
end forward

global type w_ingreso_pagos from wb_response
int Width=2944
int Height=1844
boolean Visible=false
dw_1 dw_1
st_1 st_1
rb_pay rb_pay
rb_complain rb_complain
gb_1 gb_1
cb_1 cb_1
sle_grupo sle_grupo
st_ref st_ref
em_referencia em_referencia
end type
global w_ingreso_pagos w_ingreso_pagos

on w_ingreso_pagos.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_1=create st_1
this.rb_pay=create rb_pay
this.rb_complain=create rb_complain
this.gb_1=create gb_1
this.cb_1=create cb_1
this.sle_grupo=create sle_grupo
this.st_ref=create st_ref
this.em_referencia=create em_referencia
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.rb_pay
this.Control[iCurrent+4]=this.rb_complain
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.sle_grupo
this.Control[iCurrent+8]=this.st_ref
this.Control[iCurrent+9]=this.em_referencia
end on

on w_ingreso_pagos.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.rb_pay)
destroy(this.rb_complain)
destroy(this.gb_1)
destroy(this.cb_1)
destroy(this.sle_grupo)
destroy(this.st_ref)
destroy(this.em_referencia)
end on

event open;call super::open;
X=1
Y=1
Show()


end event

type dw_1 from datawindow within w_ingreso_pagos
int X=14
int Y=152
int Width=2912
int Height=1600
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_ingreso_pagos"
boolean Border=false
boolean VScrollBar=true
boolean LiveScroll=true
end type

event clicked;if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
end if

end event

event rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, TRUE)
SetRow(currentrow)

string	ls_grupo
long		ll_row = 0

if currentrow = 0 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	ll_row = 1
end if	



end event

event buttonclicked;double	ld_sender 


ld_sender = dw_1.getitemnumber(row,"id_sender")

gl_receiver_cons = dw_1.getitemnumber(row,"id_receiver")

gs_branch_insta_cons = dw_1.getitemstring(row,"id_branch")


if rb_pay.checked then
	Openwithparm(w_pagar_invoice_or_consultar,ld_sender)
else
	Openwithparm(w_consulta_reclamo,ld_sender)
end if
end event

event doubleclicked;//This.triggerevent("buttonclicKed!")
end event

type st_1 from statictext within w_ingreso_pagos
int X=882
int Y=32
int Width=210
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Group :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_pay from radiobutton within w_ingreso_pagos
int X=1829
int Y=36
int Width=247
int Height=76
boolean BringToTop=true
string Text="Pay"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.reset()
sle_grupo.setfocus()
end event

type rb_complain from radiobutton within w_ingreso_pagos
int X=2094
int Y=36
int Width=366
int Height=76
boolean BringToTop=true
string Text="Complain"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.reset()
sle_grupo.setfocus()
end event

type gb_1 from groupbox within w_ingreso_pagos
int X=1787
int Width=731
int Height=124
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_ingreso_pagos
int X=1435
int Y=32
int Width=247
int Height=96
int TabOrder=30
boolean BringToTop=true
string Text="..."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_group


Open(w_seleccionar_grupo)

ls_group = message.stringparm

sle_grupo.text = ls_group

sle_grupo.setfocus()
end event

type sle_grupo from singlelineedit within w_ingreso_pagos
int X=1115
int Y=32
int Width=315
int Height=92
int TabOrder=20
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;


if rb_pay.checked then
	dw_1.dataobject = 'dw_ingreso_pagos'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(sle_grupo.text,Double(em_referencia.text))
else
	dw_1.dataobject = 'dw_ingreso_complains'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(sle_grupo.text,Double(em_referencia.text))
end if

if dw_1.rowcount() > 0 then
	dw_1.SetRow(1)
	dw_1.SelectRow(0,FALSE)
	dw_1.SelectRow(1,TRUE)
	dw_1.setfocus()
	
end if
end event

type st_ref from statictext within w_ingreso_pagos
int X=123
int Y=32
int Width=297
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Reference :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_referencia from editmask within w_ingreso_pagos
int X=439
int Y=32
int Width=265
int Height=100
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="######"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

