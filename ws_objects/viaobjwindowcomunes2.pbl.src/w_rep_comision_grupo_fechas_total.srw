$PBExportHeader$w_rep_comision_grupo_fechas_total.srw
forward
global type w_rep_comision_grupo_fechas_total from wb_report_fechas
end type
type sle_1 from singlelineedit within w_rep_comision_grupo_fechas_total
end type
type st_3 from statictext within w_rep_comision_grupo_fechas_total
end type
end forward

global type w_rep_comision_grupo_fechas_total from wb_report_fechas
int Width=3415
boolean TitleBar=true
string Title="Comisiones de Corresponsales"
sle_1 sle_1
st_3 st_3
end type
global w_rep_comision_grupo_fechas_total w_rep_comision_grupo_fechas_total

on w_rep_comision_grupo_fechas_total.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_3
end on

on w_rep_comision_grupo_fechas_total.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_1)
destroy(this.st_3)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_comision_grupo_fechas_total
int Width=3355
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_comision_grupo_fechas_total"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_comision_grupo_fechas_total
int X=809
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_comision_grupo_fechas_total
int X=443
int Height=100
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_comision_grupo_fechas_total
int X=1358
int Height=100
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_comision_grupo_fechas_total
int X=1723
boolean BringToTop=true
end type

event em_fecha2::modified;//Nada
end event

type sle_1 from singlelineedit within w_rep_comision_grupo_fechas_total
int X=2400
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

type st_3 from statictext within w_rep_comision_grupo_fechas_total
int X=2167
int Y=32
int Width=201
int Height=100
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

