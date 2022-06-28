$PBExportHeader$w_rep_ganancia_cambio.srw
forward
global type w_rep_ganancia_cambio from wb_report_fechas
end type
type sle_1 from singlelineedit within w_rep_ganancia_cambio
end type
type st_3 from statictext within w_rep_ganancia_cambio
end type
type cb_1 from commandbutton within w_rep_ganancia_cambio
end type
end forward

global type w_rep_ganancia_cambio from wb_report_fechas
int Width=3415
boolean TitleBar=true
string Title="Comisiones de Corresponsales"
sle_1 sle_1
st_3 st_3
cb_1 cb_1
end type
global w_rep_ganancia_cambio w_rep_ganancia_cambio

on w_rep_ganancia_cambio.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_3=create st_3
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.cb_1
end on

on w_rep_ganancia_cambio.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.cb_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_ganancia_cambio
int Width=3355
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_rep_ganancia_cambio"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_ganancia_cambio
int X=713
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_ganancia_cambio
int X=347
int Height=100
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_ganancia_cambio
int X=1262
int Height=100
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_ganancia_cambio
int X=1627
boolean BringToTop=true
end type

event em_fecha2::modified;//Nada
end event

type sle_1 from singlelineedit within w_rep_ganancia_cambio
int X=2395
int Y=32
int Width=247
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

event losefocus;Date		ld_fecha1, ld_fecha2
string	ls_grupo

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)
ls_grupo = sle_1.text


dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_grupo)
dw_1.setfocus()
end event

type st_3 from statictext within w_rep_ganancia_cambio
int X=2167
int Y=32
int Width=210
int Height=100
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

type cb_1 from commandbutton within w_rep_ganancia_cambio
int X=2651
int Y=32
int Width=329
int Height=100
int TabOrder=40
boolean BringToTop=true
string Text="Consultar"
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

sle_1.text = ls_group

sle_1.setfocus()
end event

