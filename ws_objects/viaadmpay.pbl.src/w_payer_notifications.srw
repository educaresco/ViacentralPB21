$PBExportHeader$w_payer_notifications.srw
forward
global type w_payer_notifications from wb_single_tb
end type
end forward

global type w_payer_notifications from wb_single_tb
integer x = 214
integer y = 221
integer width = 3712
integer height = 2052
string title = "Payer Notifications"
end type
global w_payer_notifications w_payer_notifications

on w_payer_notifications.create
call super::create
end on

on w_payer_notifications.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_payer_notifications
integer width = 3653
integer height = 1860
string dataobject = "dw_payer_notifications"
end type

