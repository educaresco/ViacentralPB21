$PBExportHeader$w_rep_closing_agent_fechas_balance_doble.srw
forward
global type w_rep_closing_agent_fechas_balance_doble from wb_report_fechas
end type
type sle_grupo from singlelineedit within w_rep_closing_agent_fechas_balance_doble
end type
type st_4 from statictext within w_rep_closing_agent_fechas_balance_doble
end type
type cb_1 from commandbutton within w_rep_closing_agent_fechas_balance_doble
end type
type rb_agent from radiobutton within w_rep_closing_agent_fechas_balance_doble
end type
type rb_all from radiobutton within w_rep_closing_agent_fechas_balance_doble
end type
type gb_1 from groupbox within w_rep_closing_agent_fechas_balance_doble
end type
type st_3 from statictext within w_rep_closing_agent_fechas_balance_doble
end type
end forward

global type w_rep_closing_agent_fechas_balance_doble from wb_report_fechas
int Width=3936
int Height=1904
boolean TitleBar=true
string Title="Agent Closing Report"
sle_grupo sle_grupo
st_4 st_4
cb_1 cb_1
rb_agent rb_agent
rb_all rb_all
gb_1 gb_1
st_3 st_3
end type
global w_rep_closing_agent_fechas_balance_doble w_rep_closing_agent_fechas_balance_doble

on w_rep_closing_agent_fechas_balance_doble.create
int iCurrent
call super::create
this.sle_grupo=create sle_grupo
this.st_4=create st_4
this.cb_1=create cb_1
this.rb_agent=create rb_agent
this.rb_all=create rb_all
this.gb_1=create gb_1
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_grupo
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.rb_agent
this.Control[iCurrent+5]=this.rb_all
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.st_3
end on

on w_rep_closing_agent_fechas_balance_doble.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_grupo)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.rb_agent)
destroy(this.rb_all)
destroy(this.gb_1)
destroy(this.st_3)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_closing_agent_fechas_balance_doble
int X=59
int Y=208
int Width=3813
int Height=1444
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_rep_closing_agent_fechas_balance_dobl"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_closing_agent_fechas_balance_doble
int X=663
int Y=44
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_closing_agent_fechas_balance_doble
int X=384
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_closing_agent_fechas_balance_doble
int X=1029
int Y=44
int Width=384
int Height=100
boolean BringToTop=true
string Text="Date Final :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_closing_agent_fechas_balance_doble
int X=1440
int Y=44
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type sle_grupo from singlelineedit within w_rep_closing_agent_fechas_balance_doble
int X=2075
int Y=44
int Width=261
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
string	ls_grupo, ls_branch


ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = Date(em_fecha2.text)


ls_grupo = sle_grupo.text

dw_1.retrieve(ls_grupo,ld_Fecha1,ld_Fecha2)


end event

type st_4 from statictext within w_rep_closing_agent_fechas_balance_doble
int X=1879
int Y=44
int Width=197
int Height=100
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

type cb_1 from commandbutton within w_rep_closing_agent_fechas_balance_doble
int X=2341
int Y=44
int Width=366
int Height=100
int TabOrder=40
boolean BringToTop=true
string Text="Seleccione"
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

type rb_agent from radiobutton within w_rep_closing_agent_fechas_balance_doble
int X=2898
int Y=40
int Width=325
int Height=76
boolean BringToTop=true
string Text="By Agent"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
boolean RightToLeft=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;sle_grupo.visible = True
st_4.visible = True
cb_1.visible = True
	
	dw_1.dataobject = 'dw_rep_closing_agent_fechas_balance_dobl'
	dw_1.settransobject(sqlca)
end event

type rb_all from radiobutton within w_rep_closing_agent_fechas_balance_doble
int X=2903
int Y=96
int Width=174
int Height=76
boolean BringToTop=true
string Text="All"
BorderStyle BorderStyle=StyleLowered!
boolean RightToLeft=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;sle_grupo.visible = False
st_4.visible = False
cb_1.visible = False

Date ld_fecha1, ld_fecha2
	
ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)
	
	dw_1.dataobject = 'dw_rep_closing_agent_fechas_balance_all_'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(ld_Fecha1,ld_Fecha2)
end event

type gb_1 from groupbox within w_rep_closing_agent_fechas_balance_doble
int X=2875
int Width=402
int Height=180
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_rep_closing_agent_fechas_balance_doble
int X=251
int Y=44
int Width=384
int Height=100
boolean Enabled=false
boolean BringToTop=true
string Text="Date Initial :"
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

