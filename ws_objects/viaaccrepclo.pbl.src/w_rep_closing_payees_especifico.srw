$PBExportHeader$w_rep_closing_payees_especifico.srw
forward
global type w_rep_closing_payees_especifico from wb_report
end type
end forward

global type w_rep_closing_payees_especifico from wb_report
int Width=3451
int Height=1968
end type
global w_rep_closing_payees_especifico w_rep_closing_payees_especifico

on w_rep_closing_payees_especifico.create
call super::create
end on

on w_rep_closing_payees_especifico.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report`dw_1 within w_rep_closing_payees_especifico
int Width=3392
int Height=1792
boolean BringToTop=true
string DataObject="dw_rep_closing_payees_especifico"
end type

