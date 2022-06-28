$PBExportHeader$w_transsacciones_pagador_rango_fechas.srw
forward
global type w_transsacciones_pagador_rango_fechas from wb_report_fechas
end type
type st_22 from statictext within w_transsacciones_pagador_rango_fechas
end type
type sle_1 from singlelineedit within w_transsacciones_pagador_rango_fechas
end type
end forward

global type w_transsacciones_pagador_rango_fechas from wb_report_fechas
int Width=3346
st_22 st_22
sle_1 sle_1
end type
global w_transsacciones_pagador_rango_fechas w_transsacciones_pagador_rango_fechas

on w_transsacciones_pagador_rango_fechas.create
int iCurrent
call super::create
this.st_22=create st_22
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_22
this.Control[iCurrent+2]=this.sle_1
end on

on w_transsacciones_pagador_rango_fechas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_22)
destroy(this.sle_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_transsacciones_pagador_rango_fechas
int Width=3282
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_transsacciones_pagador_rango_fechas"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_transsacciones_pagador_rango_fechas
int X=695
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_transsacciones_pagador_rango_fechas
int X=329
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_transsacciones_pagador_rango_fechas
int X=1120
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_transsacciones_pagador_rango_fechas
int X=1486
boolean BringToTop=true
end type

event em_fecha2::modified;return
end event

type st_22 from statictext within w_transsacciones_pagador_rango_fechas
int X=1865
int Y=36
int Width=366
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Payee :"
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

type sle_1 from singlelineedit within w_transsacciones_pagador_rango_fechas
int X=2235
int Y=28
int Width=343
int Height=100
int TabOrder=30
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,sle_1.text)
dw_1.setfocus()



Setpointer(Arrow!)
end event

