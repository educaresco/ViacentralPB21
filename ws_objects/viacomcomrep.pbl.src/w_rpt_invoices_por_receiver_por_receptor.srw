$PBExportHeader$w_rpt_invoices_por_receiver_por_receptor.srw
forward
global type w_rpt_invoices_por_receiver_por_receptor from wb_report_fechas
end type
end forward

global type w_rpt_invoices_por_receiver_por_receptor from wb_report_fechas
int Width=3461
boolean TitleBar=true
string Title="Reporte de Beneficiarios por Agencia Receptora"
end type
global w_rpt_invoices_por_receiver_por_receptor w_rpt_invoices_por_receiver_por_receptor

on w_rpt_invoices_por_receiver_por_receptor.create
call super::create
end on

on w_rpt_invoices_por_receiver_por_receptor.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rpt_invoices_por_receiver_por_receptor
int Width=3401
string DataObject="dw_rpt_receiver_agencia_receptora"
end type

