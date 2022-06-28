$PBExportHeader$w_pendientes_pago.srw
forward
global type w_pendientes_pago from wb_report_fechas
end type
end forward

global type w_pendientes_pago from wb_report_fechas
int Width=2414
end type
global w_pendientes_pago w_pendientes_pago

on w_pendientes_pago.create
call super::create
end on

on w_pendientes_pago.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_pendientes_pago
int Width=2331
boolean BringToTop=true
string DataObject="dw_sp_pendientes_pago"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_pendientes_pago
int X=649
int Y=36
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_pendientes_pago
int X=283
int Y=36
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_pendientes_pago
int X=1198
int Y=36
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_pendientes_pago
int X=1563
int Y=36
boolean BringToTop=true
end type

event em_fecha2::losefocus;Datetime		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = datetime(Date(em_fecha1.text),time("01:01:01"))

ld_fecha2 = datetime(Date(em_fecha2.text),time("23:59:59"))
dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()


Setpointer(Arrow!)
end event

event em_fecha2::modified;return
end event

