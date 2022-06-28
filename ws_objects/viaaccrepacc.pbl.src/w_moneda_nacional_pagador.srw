$PBExportHeader$w_moneda_nacional_pagador.srw
forward
global type w_moneda_nacional_pagador from wb_report_fechas
end type
type st_3 from statictext within w_moneda_nacional_pagador
end type
type sle_univisa from singlelineedit within w_moneda_nacional_pagador
end type
end forward

global type w_moneda_nacional_pagador from wb_report_fechas
boolean TitleBar=true
string Title="File to Univisa"
st_3 st_3
sle_univisa sle_univisa
end type
global w_moneda_nacional_pagador w_moneda_nacional_pagador

on w_moneda_nacional_pagador.create
int iCurrent
call super::create
this.st_3=create st_3
this.sle_univisa=create sle_univisa
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.sle_univisa
end on

on w_moneda_nacional_pagador.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_3)
destroy(this.sle_univisa)
end on

type dw_1 from wb_report_fechas`dw_1 within w_moneda_nacional_pagador
int Height=1536
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_moneda_nacional_pagador"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_moneda_nacional_pagador
int X=411
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_moneda_nacional_pagador
int X=46
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_moneda_nacional_pagador
int X=960
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_moneda_nacional_pagador
int X=1326
int Y=24
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

event em_fecha2::losefocus;return 0
end event

type st_3 from statictext within w_moneda_nacional_pagador
int X=1778
int Y=36
int Width=366
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Group :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_univisa from singlelineedit within w_moneda_nacional_pagador
int X=2144
int Y=20
int Width=256
int Height=100
int TabOrder=30
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;dw_1.retrieve(date(em_fecha1.text),date(em_fecha2.text),sle_univisa.text)
end event

