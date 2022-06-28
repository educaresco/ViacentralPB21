$PBExportHeader$w_rpt_invoices_por_sender_por_receptora.srw
forward
global type w_rpt_invoices_por_sender_por_receptora from wb_report_fechas
end type
end forward

global type w_rpt_invoices_por_sender_por_receptora from wb_report_fechas
boolean TitleBar=true
string Title="Reporte de ZInvoices por Sender por Agencia Receptora"
end type
global w_rpt_invoices_por_sender_por_receptora w_rpt_invoices_por_sender_por_receptora

on w_rpt_invoices_por_sender_por_receptora.create
call super::create
end on

on w_rpt_invoices_por_sender_por_receptora.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rpt_invoices_por_sender_por_receptora
string DataObject="d_rpt_invoices_por_sender_por_receptora"
end type

