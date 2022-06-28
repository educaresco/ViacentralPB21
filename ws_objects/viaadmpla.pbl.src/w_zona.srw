$PBExportHeader$w_zona.srw
forward
global type w_zona from wb_single_tb
end type
end forward

global type w_zona from wb_single_tb
int Width=1061
int Height=1264
boolean TitleBar=true
string Title="Zones"
end type
global w_zona w_zona

on w_zona.create
call super::create
end on

on w_zona.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_zona
int Width=981
int Height=1058
boolean BringToTop=true
string DataObject="dw_zona"
end type

