$PBExportHeader$w_currency.srw
forward
global type w_currency from wb_single_tb
end type
end forward

global type w_currency from wb_single_tb
int Width=1207
int Height=1780
boolean TitleBar=true
string Title="Currency"
end type
global w_currency w_currency

on w_currency.create
call super::create
end on

on w_currency.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_currency
int Y=4
int Width=1134
int Height=1592
boolean BringToTop=true
string DataObject="dw_currency"
end type

