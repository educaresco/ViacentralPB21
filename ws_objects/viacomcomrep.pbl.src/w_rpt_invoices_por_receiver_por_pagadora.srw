﻿$PBExportHeader$w_rpt_invoices_por_receiver_por_pagadora.srw
forward
global type w_rpt_invoices_por_receiver_por_pagadora from wb_report_fechas
end type
end forward

global type w_rpt_invoices_por_receiver_por_pagadora from wb_report_fechas
int Width=3461
end type
global w_rpt_invoices_por_receiver_por_pagadora w_rpt_invoices_por_receiver_por_pagadora

on w_rpt_invoices_por_receiver_por_pagadora.create
call super::create
end on

on w_rpt_invoices_por_receiver_por_pagadora.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rpt_invoices_por_receiver_por_pagadora
int Width=3401
boolean BringToTop=true
string DataObject="dw_rpt_receiver_agencia_pagadora"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rpt_invoices_por_receiver_por_pagadora
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rpt_invoices_por_receiver_por_pagadora
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rpt_invoices_por_receiver_por_pagadora
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rpt_invoices_por_receiver_por_pagadora
boolean BringToTop=true
end type

