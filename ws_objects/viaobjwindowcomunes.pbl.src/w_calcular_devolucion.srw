$PBExportHeader$w_calcular_devolucion.srw
$PBExportComments$Se digita el numero de billetes por nominacion
forward
global type w_calcular_devolucion from wb_response
end type
type em_pagado from editmask within w_calcular_devolucion
end type
type st_1 from statictext within w_calcular_devolucion
end type
type em_devolution from editmask within w_calcular_devolucion
end type
type em_total from editmask within w_calcular_devolucion
end type
type st_2 from statictext within w_calcular_devolucion
end type
type st_3 from statictext within w_calcular_devolucion
end type
type ln_1 from line within w_calcular_devolucion
end type
type em_100 from editmask within w_calcular_devolucion
end type
type em_de_100 from editmask within w_calcular_devolucion
end type
type st_4 from statictext within w_calcular_devolucion
end type
type em_de_50 from editmask within w_calcular_devolucion
end type
type em_50 from editmask within w_calcular_devolucion
end type
type st_5 from statictext within w_calcular_devolucion
end type
type em_de_20 from editmask within w_calcular_devolucion
end type
type em_20 from editmask within w_calcular_devolucion
end type
type st_6 from statictext within w_calcular_devolucion
end type
type em_de_10 from editmask within w_calcular_devolucion
end type
type em_10 from editmask within w_calcular_devolucion
end type
type st_7 from statictext within w_calcular_devolucion
end type
type em_de_5 from editmask within w_calcular_devolucion
end type
type em_5 from editmask within w_calcular_devolucion
end type
type st_8 from statictext within w_calcular_devolucion
end type
type em_de_1 from editmask within w_calcular_devolucion
end type
type em_1 from editmask within w_calcular_devolucion
end type
type st_9 from statictext within w_calcular_devolucion
end type
type ln_2 from line within w_calcular_devolucion
end type
end forward

global type w_calcular_devolucion from wb_response
int X=1207
int Y=716
int Width=873
int Height=1016
boolean TitleBar=true
string Title="Calculating Return Value"
em_pagado em_pagado
st_1 st_1
em_devolution em_devolution
em_total em_total
st_2 st_2
st_3 st_3
ln_1 ln_1
em_100 em_100
em_de_100 em_de_100
st_4 st_4
em_de_50 em_de_50
em_50 em_50
st_5 st_5
em_de_20 em_de_20
em_20 em_20
st_6 st_6
em_de_10 em_de_10
em_10 em_10
st_7 st_7
em_de_5 em_de_5
em_5 em_5
st_8 st_8
em_de_1 em_de_1
em_1 em_1
st_9 st_9
ln_2 ln_2
end type
global w_calcular_devolucion w_calcular_devolucion

type variables
Double	id_total
end variables

on w_calcular_devolucion.create
int iCurrent
call super::create
this.em_pagado=create em_pagado
this.st_1=create st_1
this.em_devolution=create em_devolution
this.em_total=create em_total
this.st_2=create st_2
this.st_3=create st_3
this.ln_1=create ln_1
this.em_100=create em_100
this.em_de_100=create em_de_100
this.st_4=create st_4
this.em_de_50=create em_de_50
this.em_50=create em_50
this.st_5=create st_5
this.em_de_20=create em_de_20
this.em_20=create em_20
this.st_6=create st_6
this.em_de_10=create em_de_10
this.em_10=create em_10
this.st_7=create st_7
this.em_de_5=create em_de_5
this.em_5=create em_5
this.st_8=create st_8
this.em_de_1=create em_de_1
this.em_1=create em_1
this.st_9=create st_9
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_pagado
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.em_devolution
this.Control[iCurrent+4]=this.em_total
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ln_1
this.Control[iCurrent+8]=this.em_100
this.Control[iCurrent+9]=this.em_de_100
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.em_de_50
this.Control[iCurrent+12]=this.em_50
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.em_de_20
this.Control[iCurrent+15]=this.em_20
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.em_de_10
this.Control[iCurrent+18]=this.em_10
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.em_de_5
this.Control[iCurrent+21]=this.em_5
this.Control[iCurrent+22]=this.st_8
this.Control[iCurrent+23]=this.em_de_1
this.Control[iCurrent+24]=this.em_1
this.Control[iCurrent+25]=this.st_9
this.Control[iCurrent+26]=this.ln_2
end on

on w_calcular_devolucion.destroy
call super::destroy
destroy(this.em_pagado)
destroy(this.st_1)
destroy(this.em_devolution)
destroy(this.em_total)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ln_1)
destroy(this.em_100)
destroy(this.em_de_100)
destroy(this.st_4)
destroy(this.em_de_50)
destroy(this.em_50)
destroy(this.st_5)
destroy(this.em_de_20)
destroy(this.em_20)
destroy(this.st_6)
destroy(this.em_de_10)
destroy(this.em_10)
destroy(this.st_7)
destroy(this.em_de_5)
destroy(this.em_5)
destroy(this.st_8)
destroy(this.em_de_1)
destroy(this.em_1)
destroy(this.st_9)
destroy(this.ln_2)
end on

event open;call super::open;id_total = Message.Doubleparm

em_total.text = String(id_total)

em_de_100.setfocus()
em_de_100.selecttext(1,15)



end event

type em_pagado from editmask within w_calcular_devolucion
int X=485
int Y=612
int Width=361
int Height=84
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event losefocus;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

type st_1 from statictext within w_calcular_devolucion
int X=32
int Y=848
int Width=393
int Height=52
boolean Enabled=false
boolean BringToTop=true
string Text="Return Value :"
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

type em_devolution from editmask within w_calcular_devolucion
int X=485
int Y=828
int Width=361
int Height=84
int TabOrder=80
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_total from editmask within w_calcular_devolucion
int X=485
int Y=708
int Width=361
int Height=84
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_calcular_devolucion
int X=32
int Y=736
int Width=393
int Height=56
boolean Enabled=false
boolean BringToTop=true
string Text="Total Value :"
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

type st_3 from statictext within w_calcular_devolucion
int X=32
int Y=620
int Width=393
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Payed Value :"
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

type ln_1 from line within w_calcular_devolucion
boolean Enabled=false
int BeginX=485
int BeginY=812
int EndX=832
int EndY=812
int LineThickness=8
long LineColor=8388608
end type

type em_100 from editmask within w_calcular_devolucion
int X=485
int Y=32
int Width=361
int Height=84
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

type em_de_100 from editmask within w_calcular_devolucion
int X=23
int Y=32
int Width=96
int Height=84
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)




em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))


Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)

em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))



end event

type st_4 from statictext within w_calcular_devolucion
int X=142
int Y=40
int Width=315
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="of 100 Dollars"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_de_50 from editmask within w_calcular_devolucion
int X=23
int Y=132
int Width=96
int Height=84
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)




em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))


Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)

em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))



end event

type em_50 from editmask within w_calcular_devolucion
int X=485
int Y=132
int Width=361
int Height=84
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

type st_5 from statictext within w_calcular_devolucion
int X=142
int Y=132
int Width=315
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="of  50 Dollars"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_de_20 from editmask within w_calcular_devolucion
int X=23
int Y=228
int Width=96
int Height=84
int TabOrder=40
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)




em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))


Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)

em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))



end event

type em_20 from editmask within w_calcular_devolucion
int X=485
int Y=228
int Width=361
int Height=84
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

type st_6 from statictext within w_calcular_devolucion
int X=142
int Y=228
int Width=315
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="of  20 Dollars"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_de_10 from editmask within w_calcular_devolucion
int X=23
int Y=324
int Width=96
int Height=84
int TabOrder=50
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)




em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))


Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)

em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))



end event

type em_10 from editmask within w_calcular_devolucion
int X=485
int Y=324
int Width=361
int Height=84
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

type st_7 from statictext within w_calcular_devolucion
int X=142
int Y=324
int Width=315
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="of  10 Dollars"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_de_5 from editmask within w_calcular_devolucion
int X=23
int Y=412
int Width=96
int Height=84
int TabOrder=60
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)




em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))


Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)

em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))



end event

type em_5 from editmask within w_calcular_devolucion
int X=485
int Y=412
int Width=361
int Height=84
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

type st_8 from statictext within w_calcular_devolucion
int X=142
int Y=412
int Width=315
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="of    5 Dollars"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_de_1 from editmask within w_calcular_devolucion
int X=23
int Y=500
int Width=96
int Height=84
int TabOrder=70
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)




em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))


Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;
em_1.text=string(double(em_de_1.text) * 1)
em_5.text=string(double(em_de_5.text) * 5)
em_10.text=string(double(em_de_10.text) * 10)
em_20.text=string(double(em_de_20.text) * 20)
em_50.text=string(double(em_de_50.text) * 50)
em_100.text=string(double(em_de_100.text) * 100)

em_pagado.text = string(double(em_1.text)+double(em_5.text)+double(em_10.text)+double(em_20.text)+double(em_50.text)+double(em_100.text))



end event

type em_1 from editmask within w_calcular_devolucion
int X=485
int Y=500
int Width=361
int Height=84
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event modified;Double	ld_pagado

ld_pagado = Double(em_pagado.text)

em_devolution.text = String(ld_pagado - id_total)
end event

type st_9 from statictext within w_calcular_devolucion
int X=142
int Y=504
int Width=315
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="of    1 Dollars"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type ln_2 from line within w_calcular_devolucion
boolean Enabled=false
int BeginX=485
int BeginY=604
int EndX=832
int EndY=604
int LineThickness=8
long LineColor=8388608
end type

