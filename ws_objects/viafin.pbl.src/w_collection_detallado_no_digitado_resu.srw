﻿$PBExportHeader$w_collection_detallado_no_digitado_resu.srw
forward
global type w_collection_detallado_no_digitado_resu from wb_report_datetime
end type
end forward

global type w_collection_detallado_no_digitado_resu from wb_report_datetime
int Width=3579
int Height=2136
end type
global w_collection_detallado_no_digitado_resu w_collection_detallado_no_digitado_resu

on w_collection_detallado_no_digitado_resu.create
call super::create
end on

on w_collection_detallado_no_digitado_resu.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_datetime`dw_1 within w_collection_detallado_no_digitado_resu
int Y=148
int Width=3506
int Height=1772
boolean BringToTop=true
string DataObject="dw_collection_detallado_no_digitado_resu"
end type

type em_fecha1 from wb_report_datetime`em_fecha1 within w_collection_detallado_no_digitado_resu
boolean BringToTop=true
end type

type st_1 from wb_report_datetime`st_1 within w_collection_detallado_no_digitado_resu
boolean BringToTop=true
end type

type st_2 from wb_report_datetime`st_2 within w_collection_detallado_no_digitado_resu
boolean BringToTop=true
end type

type em_fecha2 from wb_report_datetime`em_fecha2 within w_collection_detallado_no_digitado_resu
boolean BringToTop=true
end type

