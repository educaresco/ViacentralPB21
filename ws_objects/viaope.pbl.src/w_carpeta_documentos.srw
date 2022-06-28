$PBExportHeader$w_carpeta_documentos.srw
forward
global type w_carpeta_documentos from wb_report
end type
end forward

global type w_carpeta_documentos from wb_report
int X=503
int Y=60
int Width=2757
int Height=1912
boolean TitleBar=true
string Title="Documents Folder"
end type
global w_carpeta_documentos w_carpeta_documentos

on w_carpeta_documentos.create
call super::create
end on

on w_carpeta_documentos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report`dw_1 within w_carpeta_documentos
int Width=2706
int Height=1696
boolean BringToTop=true
string DataObject="dw_documento_sender"
end type

