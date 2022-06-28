$PBExportHeader$w_rep_cancelados_por_agencia.srw
forward
global type w_rep_cancelados_por_agencia from wb_report_fechas
end type
type st_3 from statictext within w_rep_cancelados_por_agencia
end type
type sle_1 from singlelineedit within w_rep_cancelados_por_agencia
end type
end forward

global type w_rep_cancelados_por_agencia from wb_report_fechas
st_3 st_3
sle_1 sle_1
end type
global w_rep_cancelados_por_agencia w_rep_cancelados_por_agencia

on w_rep_cancelados_por_agencia.create
int iCurrent
call super::create
this.st_3=create st_3
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.sle_1
end on

on w_rep_cancelados_por_agencia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_3)
destroy(this.sle_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_cancelados_por_agencia
int TabOrder=40
string DataObject="dw_rep_cancelados"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_cancelados_por_agencia
int X=626
end type

type st_1 from wb_report_fechas`st_1 within w_rep_cancelados_por_agencia
int X=261
end type

type st_2 from wb_report_fechas`st_2 within w_rep_cancelados_por_agencia
int X=1175
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_cancelados_por_agencia
int X=1541
end type

event em_fecha2::modified;return
end event

type st_3 from statictext within w_rep_cancelados_por_agencia
int X=1989
int Y=36
int Width=247
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Branch :"
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

type sle_1 from singlelineedit within w_rep_cancelados_por_agencia
int X=2235
int Y=36
int Width=302
int Height=92
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

event losefocus;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,sle_1.text)
dw_1.setfocus()


Setpointer(Arrow!)
end event

