$PBExportHeader$w_consolidado_payee.srw
forward
global type w_consolidado_payee from wb_report
end type
end forward

global type w_consolidado_payee from wb_report
int Width=3374
int Height=1716
boolean TitleBar=true
string Title="balance"
long BackColor=80269524
end type
global w_consolidado_payee w_consolidado_payee

on w_consolidado_payee.create
call super::create
end on

on w_consolidado_payee.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report`dw_1 within w_consolidado_payee
int Width=3301
boolean BringToTop=true
string DataObject="dw_estado_contable_consolidado_payee1"
end type

