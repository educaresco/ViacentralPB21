$PBExportHeader$w_callingcardreport.srw
forward
global type w_callingcardreport from wb_report
end type
end forward

global type w_callingcardreport from wb_report
integer width = 3168
end type
global w_callingcardreport w_callingcardreport

on w_callingcardreport.create
call super::create
end on

on w_callingcardreport.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report`dw_1 within w_callingcardreport
integer width = 3095
string dataobject = "dw_callingcard_report"
end type

