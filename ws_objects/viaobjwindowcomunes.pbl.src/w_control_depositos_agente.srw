$PBExportHeader$w_control_depositos_agente.srw
forward
global type w_control_depositos_agente from wb_report_fechas
end type
end forward

global type w_control_depositos_agente from wb_report_fechas
int Width=2857
int Height=1704
boolean TitleBar=true
string Title="Deposit Control"
long BackColor=80269524
end type
global w_control_depositos_agente w_control_depositos_agente

on w_control_depositos_agente.create
call super::create
end on

on w_control_depositos_agente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_control_depositos_agente
int Y=144
int Width=2816
int Height=1368
boolean BringToTop=true
string DataObject="dw_control_deposito_agent"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_control_depositos_agente
int X=704
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_control_depositos_agente
int X=338
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_control_depositos_agente
int X=1253
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_control_depositos_agente
int X=1618
boolean BringToTop=true
end type

