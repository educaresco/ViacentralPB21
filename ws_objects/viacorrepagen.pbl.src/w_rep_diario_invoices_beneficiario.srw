$PBExportHeader$w_rep_diario_invoices_beneficiario.srw
forward
global type w_rep_diario_invoices_beneficiario from wb_report_fechas
end type
end forward

global type w_rep_diario_invoices_beneficiario from wb_report_fechas
int Width=3342
int Height=1988
end type
global w_rep_diario_invoices_beneficiario w_rep_diario_invoices_beneficiario

on w_rep_diario_invoices_beneficiario.create
call super::create
end on

on w_rep_diario_invoices_beneficiario.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_diario_invoices_beneficiario
int Width=3310
int Height=1640
boolean BringToTop=true
string DataObject="dw_rep_diario_invoices_beneficiario"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_diario_invoices_beneficiario
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_diario_invoices_beneficiario
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_diario_invoices_beneficiario
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_diario_invoices_beneficiario
boolean BringToTop=true
end type

