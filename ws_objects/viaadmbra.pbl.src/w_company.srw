$PBExportHeader$w_company.srw
forward
global type w_company from wb_single_tb
end type
end forward

global type w_company from wb_single_tb
int Width=2784
int Height=1028
boolean TitleBar=true
string Title="Company"
end type
global w_company w_company

on w_company.create
call super::create
end on

on w_company.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_company
int X=32
int Y=24
int Width=2670
int Height=792
boolean BringToTop=true
string DataObject="dw_company"
end type

