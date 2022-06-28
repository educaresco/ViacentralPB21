$PBExportHeader$w_estado_contable_diario_payee.srw
forward
global type w_estado_contable_diario_payee from wb_report
end type
end forward

global type w_estado_contable_diario_payee from wb_report
int Width=3666
int Height=1780
end type
global w_estado_contable_diario_payee w_estado_contable_diario_payee

on w_estado_contable_diario_payee.create
call super::create
end on

on w_estado_contable_diario_payee.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report`dw_1 within w_estado_contable_diario_payee
int Width=3607
int Height=1568
boolean BringToTop=true
string DataObject="dw_estado_contable_diario_payee"
end type

