$PBExportHeader$w_modo_pago.srw
forward
global type w_modo_pago from wb_single_tb
end type
end forward

global type w_modo_pago from wb_single_tb
int Width=1550
int Height=1208
boolean TitleBar=true
string Title="Delivery"
end type
global w_modo_pago w_modo_pago

on w_modo_pago.create
call super::create
end on

on w_modo_pago.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_modo_pago
int Width=1486
int Height=1024
boolean BringToTop=true
string DataObject="dw_modo_pago"
end type

