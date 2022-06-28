$PBExportHeader$w_payment.srw
forward
global type w_payment from wb_single_tb
end type
end forward

global type w_payment from wb_single_tb
int Width=977
int Height=747
boolean TitleBar=true
string Title="Payment"
end type
global w_payment w_payment

on w_payment.create
call super::create
end on

on w_payment.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_payment
int Y=10
int Width=906
int Height=527
boolean BringToTop=true
string DataObject="dw_payment"
end type

