$PBExportHeader$w_collection_resumido.srw
forward
global type w_collection_resumido from wb_report_datetime
end type
end forward

global type w_collection_resumido from wb_report_datetime
int Width=3557
int Height=2136
end type
global w_collection_resumido w_collection_resumido

on w_collection_resumido.create
call super::create
end on

on w_collection_resumido.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_datetime`dw_1 within w_collection_resumido
int Y=148
int Width=3502
int Height=1772
boolean BringToTop=true
string DataObject="dw_collection_resumido"
end type

type em_fecha1 from wb_report_datetime`em_fecha1 within w_collection_resumido
boolean BringToTop=true
end type

type st_1 from wb_report_datetime`st_1 within w_collection_resumido
boolean BringToTop=true
end type

type st_2 from wb_report_datetime`st_2 within w_collection_resumido
boolean BringToTop=true
end type

type em_fecha2 from wb_report_datetime`em_fecha2 within w_collection_resumido
boolean BringToTop=true
end type

