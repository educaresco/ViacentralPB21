$PBExportHeader$w_rpt_invoices_por_receiver_agrupado.srw
forward
global type w_rpt_invoices_por_receiver_agrupado from wb_report_fechas
end type
end forward

global type w_rpt_invoices_por_receiver_agrupado from wb_report_fechas
boolean TitleBar=true
string Title="Invoices por Receiver Agrupado"
end type
global w_rpt_invoices_por_receiver_agrupado w_rpt_invoices_por_receiver_agrupado

on w_rpt_invoices_por_receiver_agrupado.create
call super::create
end on

on w_rpt_invoices_por_receiver_agrupado.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rpt_invoices_por_receiver_agrupado
string DataObject="dw_rpt_receiver_agrupado"
end type

