$PBExportHeader$w_rep_closing_payees.srw
forward
global type w_rep_closing_payees from wb_report_fechas
end type
type cb_1 from commandbutton within w_rep_closing_payees
end type
type sle_grupo from singlelineedit within w_rep_closing_payees
end type
type st_grupo from statictext within w_rep_closing_payees
end type
end forward

global type w_rep_closing_payees from wb_report_fechas
int Width=3803
int Height=1904
boolean TitleBar=true
string Title="Report Closing One Payee"
long BackColor=80269524
cb_1 cb_1
sle_grupo sle_grupo
st_grupo st_grupo
end type
global w_rep_closing_payees w_rep_closing_payees

on w_rep_closing_payees.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_grupo=create sle_grupo
this.st_grupo=create st_grupo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_grupo
this.Control[iCurrent+3]=this.st_grupo
end on

on w_rep_closing_payees.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.sle_grupo)
destroy(this.st_grupo)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_closing_payees
int Y=140
int Width=3739
int Height=1556
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_rep_closing_payees"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_closing_payees
int X=663
int Y=20
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_closing_payees
int X=297
int Y=20
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_closing_payees
int X=1211
int Y=20
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_closing_payees
int X=1577
int Y=20
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type cb_1 from commandbutton within w_rep_closing_payees
int X=2569
int Y=20
int Width=293
int Height=92
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


Open(w_seleccionar_grupo_pagador)

ls_group = message.stringparm

sle_grupo.text = ls_group

sle_grupo.setfocus()
end event

type sle_grupo from singlelineedit within w_rep_closing_payees
int X=2313
int Y=20
int Width=247
int Height=100
int TabOrder=30
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = Date(em_fecha2.text)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,'%'+sle_grupo.text+'%')

dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

type st_grupo from statictext within w_rep_closing_payees
int X=2094
int Y=20
int Width=210
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

