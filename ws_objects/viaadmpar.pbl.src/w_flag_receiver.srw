$PBExportHeader$w_flag_receiver.srw
forward
global type w_flag_receiver from wb_single_tb
end type
end forward

global type w_flag_receiver from wb_single_tb
int Width=1181
int Height=869
boolean TitleBar=true
string Title="Flag Receiver"
end type
global w_flag_receiver w_flag_receiver

on w_flag_receiver.create
call super::create
end on

on w_flag_receiver.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_flag_receiver
int Width=1109
int Height=656
boolean BringToTop=true
string DataObject="dw_flag_receiver"
end type

