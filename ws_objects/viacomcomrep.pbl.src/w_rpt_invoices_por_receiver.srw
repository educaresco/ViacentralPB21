$PBExportHeader$w_rpt_invoices_por_receiver.srw
forward
global type w_rpt_invoices_por_receiver from wb_report_fechas
end type
end forward

global type w_rpt_invoices_por_receiver from wb_report_fechas
boolean TitleBar=true
string Title="Invoices por Receiver "
end type
global w_rpt_invoices_por_receiver w_rpt_invoices_por_receiver

on w_rpt_invoices_por_receiver.create
call super::create
end on

on w_rpt_invoices_por_receiver.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rpt_invoices_por_receiver
boolean BringToTop=true
string DataObject="dw_rpt_receiver"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rpt_invoices_por_receiver
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rpt_invoices_por_receiver
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rpt_invoices_por_receiver
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rpt_invoices_por_receiver
boolean BringToTop=true
end type

