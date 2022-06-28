$PBExportHeader$w_closing_propias_other.srw
forward
global type w_closing_propias_other from wb_report_fechas
end type
end forward

global type w_closing_propias_other from wb_report_fechas
integer width = 3488
string title = "Closing"
end type
global w_closing_propias_other w_closing_propias_other

on w_closing_propias_other.create
call super::create
end on

on w_closing_propias_other.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_closing_propias_other
integer width = 3461
string dataobject = "dw_closing_propias_other"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_closing_propias_other
end type

type st_1 from wb_report_fechas`st_1 within w_closing_propias_other
end type

type st_2 from wb_report_fechas`st_2 within w_closing_propias_other
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_closing_propias_other
end type

event em_fecha2::modified;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = Date(em_fecha2.text)

dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

