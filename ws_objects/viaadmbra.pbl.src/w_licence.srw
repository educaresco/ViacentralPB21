$PBExportHeader$w_licence.srw
forward
global type w_licence from wb_single_tb
end type
end forward

global type w_licence from wb_single_tb
int Width=2203
boolean TitleBar=true
string Title="Licence"
long BackColor=80269524
end type
global w_licence w_licence

on w_licence.create
call super::create
end on

on w_licence.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_licence
int Y=24
int Width=2139
int Height=1316
boolean BringToTop=true
string DataObject="dw_licence"
end type

