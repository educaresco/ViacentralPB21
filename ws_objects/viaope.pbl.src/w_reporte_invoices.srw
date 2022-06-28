$PBExportHeader$w_reporte_invoices.srw
forward
global type w_reporte_invoices from wb_report
end type
end forward

global type w_reporte_invoices from wb_report
int Width=3575
int Height=1860
boolean TitleBar=true
string Title="Reporte Invoices"
end type
global w_reporte_invoices w_reporte_invoices

on w_reporte_invoices.create
call super::create
end on

on w_reporte_invoices.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report`dw_1 within w_reporte_invoices
int Width=3511
int Height=1632
boolean BringToTop=true
string DataObject="dw_comprobacion_invoice"
end type

