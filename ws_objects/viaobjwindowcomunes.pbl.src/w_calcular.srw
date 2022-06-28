$PBExportHeader$w_calcular.srw
forward
global type w_calcular from wb_response
end type
type em_1 from editmask within w_calcular
end type
type st_1 from statictext within w_calcular
end type
type em_devolution from editmask within w_calcular
end type
type em_total from editmask within w_calcular
end type
type st_2 from statictext within w_calcular
end type
type st_3 from statictext within w_calcular
end type
type ln_1 from line within w_calcular
end type
end forward

global type w_calcular from wb_response
int X=997
int Y=852
int Width=842
int Height=464
boolean TitleBar=true
string Title="Calculating Return Value"
em_1 em_1
st_1 st_1
em_devolution em_devolution
em_total em_total
st_2 st_2
st_3 st_3
ln_1 ln_1
end type
global w_calcular w_calcular

type variables
Double	id_total
end variables

on w_calcular.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.em_devolution=create em_devolution
this.em_total=create em_total
this.st_2=create st_2
this.st_3=create st_3
this.ln_1=create ln_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.em_devolution
this.Control[iCurrent+4]=this.em_total
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ln_1
end on

on w_calcular.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_devolution)
destroy(this.em_total)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ln_1)
end on

event open;call super::open;id_total = Message.Doubleparm

em_total.text = String(id_total)

em_1.setfocus()
em_1.selecttext(1,15)



end event

type em_1 from editmask within w_calcular
int X=431
int Y=17
int Width=359
int Height=101
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

ld_pagado = Double(em_1.text)

em_devolution.text = String(ld_pagado - id_total)
end event

event losefocus;Double	ld_pagado

ld_pagado = Double(em_1.text)

em_devolution.text = String(ld_pagado - id_total)
end event

type st_1 from statictext within w_calcular
int X=32
int Y=269
int Width=391
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

type em_devolution from editmask within w_calcular
int X=431
int Y=248
int Width=359
int Height=101
int TabOrder=20
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

type em_total from editmask within w_calcular
int X=431
int Y=126
int Width=359
int Height=101
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

type st_2 from statictext within w_calcular
int X=32
int Y=154
int Width=391
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

type st_3 from statictext within w_calcular
int X=32
int Y=38
int Width=391
int Height=77
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

type ln_1 from line within w_calcular
boolean Enabled=false
int BeginX=431
int BeginY=237
int EndX=778
int EndY=237
int LineThickness=7
long LineColor=8388608
end type

