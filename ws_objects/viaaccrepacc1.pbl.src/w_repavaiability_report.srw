$PBExportHeader$w_repavaiability_report.srw
forward
global type w_repavaiability_report from wb_report_fechas
end type
type sle_grupo from singlelineedit within w_repavaiability_report
end type
type st_4 from statictext within w_repavaiability_report
end type
type cb_1 from commandbutton within w_repavaiability_report
end type
end forward

global type w_repavaiability_report from wb_report_fechas
int Width=3319
boolean TitleBar=true
string Title="Payee Report"
sle_grupo sle_grupo
st_4 st_4
cb_1 cb_1
end type
global w_repavaiability_report w_repavaiability_report

on w_repavaiability_report.create
int iCurrent
call super::create
this.sle_grupo=create sle_grupo
this.st_4=create st_4
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_grupo
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cb_1
end on

on w_repavaiability_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_grupo)
destroy(this.st_4)
destroy(this.cb_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_repavaiability_report
int X=9
int Y=144
int Width=3273
int Height=1592
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_repavaiability_report"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_repavaiability_report
int X=750
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_repavaiability_report
int X=384
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_repavaiability_report
int X=1147
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_repavaiability_report
int X=1518
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type sle_grupo from singlelineedit within w_repavaiability_report
int X=2213
int Y=28
int Width=261
int Height=92
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
string	ls_grupo, ls_branch


ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)


ls_grupo = sle_grupo.text

dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_grupo)


end event

type st_4 from statictext within w_repavaiability_report
int X=2007
int Y=44
int Width=197
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Grupo :"
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

type cb_1 from commandbutton within w_repavaiability_report
int X=2478
int Y=32
int Width=178
int Height=84
int TabOrder=40
boolean BringToTop=true
string Text="..."
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
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

