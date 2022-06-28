$PBExportHeader$w_rep_closing_agent_fechas.srw
forward
global type w_rep_closing_agent_fechas from wb_report_fechas
end type
type sle_grupo from singlelineedit within w_rep_closing_agent_fechas
end type
type st_4 from statictext within w_rep_closing_agent_fechas
end type
type cb_1 from commandbutton within w_rep_closing_agent_fechas
end type
end forward

global type w_rep_closing_agent_fechas from wb_report_fechas
int Width=3744
int Height=2324
boolean TitleBar=true
string Title="Report Closing Agent"
long BackColor=80269524
sle_grupo sle_grupo
st_4 st_4
cb_1 cb_1
end type
global w_rep_closing_agent_fechas w_rep_closing_agent_fechas

on w_rep_closing_agent_fechas.create
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

on w_rep_closing_agent_fechas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_grupo)
destroy(this.st_4)
destroy(this.cb_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_closing_agent_fechas
int X=9
int Y=168
int Width=3657
int Height=1924
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_rep_closing_agent_fechas"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_closing_agent_fechas
int X=750
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_closing_agent_fechas
int X=384
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_closing_agent_fechas
int X=1147
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_closing_agent_fechas
int X=1518
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type sle_grupo from singlelineedit within w_rep_closing_agent_fechas
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

ld_fecha2 = Date(em_fecha2.text)


ls_grupo = sle_grupo.text

dw_1.retrieve(ls_grupo,ld_Fecha1,ld_Fecha2)


end event

type st_4 from statictext within w_rep_closing_agent_fechas
int X=2016
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

type cb_1 from commandbutton within w_rep_closing_agent_fechas
int X=2478
int Y=32
int Width=329
int Height=84
int TabOrder=40
boolean BringToTop=true
string Text="Seleccionar"
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

