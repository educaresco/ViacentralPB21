$PBExportHeader$w_rpt_invoices_por_sender_por_pagadora.srw
forward
global type w_rpt_invoices_por_sender_por_pagadora from wb_report_fechas
end type
end forward

global type w_rpt_invoices_por_sender_por_pagadora from wb_report_fechas
boolean TitleBar=true
string Title="Reporte de ZInvoices por Sender por Agencia Pagadora"
end type
global w_rpt_invoices_por_sender_por_pagadora w_rpt_invoices_por_sender_por_pagadora

on w_rpt_invoices_por_sender_por_pagadora.create
call super::create
end on

on w_rpt_invoices_por_sender_por_pagadora.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rpt_invoices_por_sender_por_pagadora
string DataObject="d_rpt_invoices_por_sender_por_pagadora"
end type

