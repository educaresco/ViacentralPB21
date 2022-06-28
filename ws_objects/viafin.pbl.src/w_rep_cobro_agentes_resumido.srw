$PBExportHeader$w_rep_cobro_agentes_resumido.srw
forward
global type w_rep_cobro_agentes_resumido from wb_report_fechas
end type
end forward

global type w_rep_cobro_agentes_resumido from wb_report_fechas
int Width=3543
int Height=2268
boolean TitleBar=true
string Title="Cobro Agentes"
long BackColor=80269524
end type
global w_rep_cobro_agentes_resumido w_rep_cobro_agentes_resumido

on w_rep_cobro_agentes_resumido.create
call super::create
end on

on w_rep_cobro_agentes_resumido.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_cobro_agentes_resumido
int Y=124
int Width=3479
int Height=1944
boolean BringToTop=true
string DataObject="dw_distribucion_para_post_balance"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_cobro_agentes_resumido
boolean Visible=false
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_cobro_agentes_resumido
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_cobro_agentes_resumido
int X=1221
int Y=28
int Width=224
boolean BringToTop=true
string Text="Date  :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_cobro_agentes_resumido
int X=1445
int Y=16
boolean BringToTop=true
end type

event em_fecha2::modified;return ;
end event

event em_fecha2::losefocus;Datetime		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_fecha2.text),time('00:00:00'))

ld_fecha2 = Datetime(Date(em_fecha2.text),time('23:59:59'))

dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()


Setpointer(Arrow!)
end event

