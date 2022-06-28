$PBExportHeader$w_rep_closing_payees_fechas.srw
forward
global type w_rep_closing_payees_fechas from wb_report_fechas
end type
end forward

global type w_rep_closing_payees_fechas from wb_report_fechas
int Width=3461
int Height=2004
boolean TitleBar=true
string Title="Report Closing All Payess"
long BackColor=80269524
end type
global w_rep_closing_payees_fechas w_rep_closing_payees_fechas

on w_rep_closing_payees_fechas.create
call super::create
end on

on w_rep_closing_payees_fechas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_closing_payees_fechas
int Width=3415
int Height=1664
boolean BringToTop=true
string DataObject="dw_rep_closing_payees_fechas"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_closing_payees_fechas
int X=1042
int Y=16
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_closing_payees_fechas
int X=677
int Y=16
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_closing_payees_fechas
int X=1591
int Y=16
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_closing_payees_fechas
int X=1957
int Y=16
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

