$PBExportHeader$w_rep_closing_payees_fechas_detalle.srw
forward
global type w_rep_closing_payees_fechas_detalle from wb_report_fechas
end type
end forward

global type w_rep_closing_payees_fechas_detalle from wb_report_fechas
int Width=3497
int Height=2208
boolean TitleBar=true
string Title="Report Closing Payee detail"
long BackColor=80269524
end type
global w_rep_closing_payees_fechas_detalle w_rep_closing_payees_fechas_detalle

on w_rep_closing_payees_fechas_detalle.create
call super::create
end on

on w_rep_closing_payees_fechas_detalle.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_closing_payees_fechas_detalle
int Y=160
int Width=3429
int Height=1864
boolean BringToTop=true
string DataObject="dw_datos_closing_payee_fechas"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_closing_payees_fechas_detalle
int X=718
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_closing_payees_fechas_detalle
int X=352
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_closing_payees_fechas_detalle
int X=1778
int Y=36
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_closing_payees_fechas_detalle
int X=2144
int Y=36
boolean BringToTop=true
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

