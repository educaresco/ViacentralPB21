$PBExportHeader$w_rep_cobro_agentes_resumido1.srw
forward
global type w_rep_cobro_agentes_resumido1 from wb_report_fechas
end type
end forward

global type w_rep_cobro_agentes_resumido1 from wb_report_fechas
int Width=3296
end type
global w_rep_cobro_agentes_resumido1 w_rep_cobro_agentes_resumido1

on w_rep_cobro_agentes_resumido1.create
call super::create
end on

on w_rep_cobro_agentes_resumido1.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_cobro_agentes_resumido1
int Width=3246
boolean BringToTop=true
string DataObject="dw_rep_cobro_agentes_resumido1"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_cobro_agentes_resumido1
boolean Visible=false
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_cobro_agentes_resumido1
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_cobro_agentes_resumido1
int X=1079
int Y=28
boolean BringToTop=true
string Text="Date  :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_cobro_agentes_resumido1
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

