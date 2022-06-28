$PBExportHeader$w_rep_pagados_corresponsal_fecha_invoice.srw
forward
global type w_rep_pagados_corresponsal_fecha_invoice from wb_report_fechas
end type
end forward

global type w_rep_pagados_corresponsal_fecha_invoice from wb_report_fechas
int Width=3305
int Height=1872
boolean TitleBar=true
string Title="Invoices Paid"
end type
global w_rep_pagados_corresponsal_fecha_invoice w_rep_pagados_corresponsal_fecha_invoice

on w_rep_pagados_corresponsal_fecha_invoice.create
call super::create
end on

on w_rep_pagados_corresponsal_fecha_invoice.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_pagados_corresponsal_fecha_invoice
int Width=3237
boolean BringToTop=true
string DataObject="dw_rep_pagados_corresponsal_fecha_inv"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_pagados_corresponsal_fecha_invoice
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_pagados_corresponsal_fecha_invoice
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_pagados_corresponsal_fecha_invoice
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_pagados_corresponsal_fecha_invoice
boolean BringToTop=true
end type

