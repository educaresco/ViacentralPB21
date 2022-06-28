$PBExportHeader$w_agent_invoices_report.srw
forward
global type w_agent_invoices_report from wb_report_fechas
end type
type em_hora from u_em within w_agent_invoices_report
end type
type st_3 from statictext within w_agent_invoices_report
end type
type sle_grupo from singlelineedit within w_agent_invoices_report
end type
type st_4 from statictext within w_agent_invoices_report
end type
type cb_1 from commandbutton within w_agent_invoices_report
end type
end forward

global type w_agent_invoices_report from wb_report_fechas
em_hora em_hora
st_3 st_3
sle_grupo sle_grupo
st_4 st_4
cb_1 cb_1
end type
global w_agent_invoices_report w_agent_invoices_report

on w_agent_invoices_report.create
int iCurrent
call super::create
this.em_hora=create em_hora
this.st_3=create st_3
this.sle_grupo=create sle_grupo
this.st_4=create st_4
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_hora
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.sle_grupo
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.cb_1
end on

on w_agent_invoices_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_hora)
destroy(this.st_3)
destroy(this.sle_grupo)
destroy(this.st_4)
destroy(this.cb_1)
end on

event open;call super::open;em_hora.text = String(Now())
end event

type dw_1 from wb_report_fechas`dw_1 within w_agent_invoices_report
int X=9
int Y=164
int Height=1572
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_agent_invoices_report"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_agent_invoices_report
int X=759
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_agent_invoices_report
int X=393
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_agent_invoices_report
int X=1157
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_agent_invoices_report
int X=1527
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type em_hora from u_em within w_agent_invoices_report
int X=1792
int Y=32
int Width=366
int Height=100
int TabOrder=30
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="hh:mm:ss"
MaskDataType MaskDataType=TimeMask!
boolean AutoSkip=true
boolean Spin=true
string MinMax=""
FontCharSet FontCharSet=Ansi!
end type

type st_3 from statictext within w_agent_invoices_report
int X=1614
int Y=32
int Width=178
int Height=64
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string Text="Hora :"
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

type sle_grupo from singlelineedit within w_agent_invoices_report
int X=2464
int Y=28
int Width=261
int Height=92
int TabOrder=40
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
long		ll_rows, ll_i, ll_ref
Double	ld_referencia, ld_receiver

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)


ls_grupo = sle_grupo.text

ll_rows = dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_grupo)


end event

type st_4 from statictext within w_agent_invoices_report
int X=2272
int Y=44
int Width=197
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Grupo :"
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

type cb_1 from commandbutton within w_agent_invoices_report
int X=2729
int Y=32
int Width=302
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

