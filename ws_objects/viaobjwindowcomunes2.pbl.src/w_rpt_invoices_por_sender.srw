$PBExportHeader$w_rpt_invoices_por_sender.srw
forward
global type w_rpt_invoices_por_sender from wb_report_fechas
end type
end forward

global type w_rpt_invoices_por_sender from wb_report_fechas
boolean TitleBar=true
string Title="Invoices por Sender"
end type
global w_rpt_invoices_por_sender w_rpt_invoices_por_sender

on w_rpt_invoices_por_sender.create
call super::create
end on

on w_rpt_invoices_por_sender.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rpt_invoices_por_sender
string DataObject="d_rpt_invoices_por_sender"
end type

