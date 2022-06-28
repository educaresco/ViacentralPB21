$PBExportHeader$w_type_id.srw
forward
global type w_type_id from wb_single_tb
end type
end forward

global type w_type_id from wb_single_tb
int Width=1326
int Height=1464
boolean Visible=true
boolean TitleBar=true
string Title="Type ID"
end type
global w_type_id w_type_id

on w_type_id.create
call super::create
end on

on w_type_id.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_type_id
int Y=4
int Width=1243
int Height=1240
boolean BringToTop=true
string DataObject="dw_type_id"
end type

