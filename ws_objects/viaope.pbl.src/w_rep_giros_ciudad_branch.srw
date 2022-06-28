$PBExportHeader$w_rep_giros_ciudad_branch.srw
forward
global type w_rep_giros_ciudad_branch from wb_report
end type
end forward

global type w_rep_giros_ciudad_branch from wb_report
int Width=3120
boolean TitleBar=true
string Title="Invoices Report by City and by Branch"
end type
global w_rep_giros_ciudad_branch w_rep_giros_ciudad_branch

on w_rep_giros_ciudad_branch.create
call super::create
end on

on w_rep_giros_ciudad_branch.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report`dw_1 within w_rep_giros_ciudad_branch
int Width=3048
boolean BringToTop=true
string DataObject="dw_rep_giros"
end type

event dw_1::constructor;call super::constructor;SetTransObject(SQLCA)
of_SetPrintPreview(TRUE)
end event

