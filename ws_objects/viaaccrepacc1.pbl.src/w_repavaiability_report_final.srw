$PBExportHeader$w_repavaiability_report_final.srw
forward
global type w_repavaiability_report_final from wb_report_fechas
end type
type sle_grupo from singlelineedit within w_repavaiability_report_final
end type
type st_4 from statictext within w_repavaiability_report_final
end type
type cb_1 from commandbutton within w_repavaiability_report_final
end type
type st_3 from statictext within w_repavaiability_report_final
end type
type em_fecha from editmask within w_repavaiability_report_final
end type
end forward

global type w_repavaiability_report_final from wb_report_fechas
int Width=3319
boolean TitleBar=true
string Title="Payee Report"
sle_grupo sle_grupo
st_4 st_4
cb_1 cb_1
st_3 st_3
em_fecha em_fecha
end type
global w_repavaiability_report_final w_repavaiability_report_final

on w_repavaiability_report_final.create
int iCurrent
call super::create
this.sle_grupo=create sle_grupo
this.st_4=create st_4
this.cb_1=create cb_1
this.st_3=create st_3
this.em_fecha=create em_fecha
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_grupo
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.em_fecha
end on

on w_repavaiability_report_final.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_grupo)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.em_fecha)
end on

type dw_1 from wb_report_fechas`dw_1 within w_repavaiability_report_final
int X=9
int Y=144
int Width=3273
int Height=1592
int TabOrder=60
boolean BringToTop=true
string DataObject="dw_repavaiability_report_final"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_repavaiability_report_final
int X=750
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_repavaiability_report_final
int X=384
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_repavaiability_report_final
int X=1147
boolean Visible=false
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_repavaiability_report_final
int X=1518
int TabOrder=40
boolean Visible=false
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type sle_grupo from singlelineedit within w_repavaiability_report_final
int X=1874
int Y=24
int Width=261
int Height=92
int TabOrder=20
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

dw_1.retrieve(ls_grupo,Date(em_fecha.text))


end event

type st_4 from statictext within w_repavaiability_report_final
int X=1669
int Y=40
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

type cb_1 from commandbutton within w_repavaiability_report_final
int X=2139
int Y=28
int Width=178
int Height=84
int TabOrder=50
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

type st_3 from statictext within w_repavaiability_report_final
int X=750
int Y=32
int Width=411
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text=" Cutoff Date :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_fecha from editmask within w_repavaiability_report_final
int X=1189
int Y=24
int Width=434
int Height=100
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

