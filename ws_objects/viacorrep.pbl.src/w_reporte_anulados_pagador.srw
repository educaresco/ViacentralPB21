$PBExportHeader$w_reporte_anulados_pagador.srw
forward
global type w_reporte_anulados_pagador from wb_report_fechas
end type
end forward

global type w_reporte_anulados_pagador from wb_report_fechas
end type
global w_reporte_anulados_pagador w_reporte_anulados_pagador

on w_reporte_anulados_pagador.create
call super::create
end on

on w_reporte_anulados_pagador.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_reporte_anulados_pagador
boolean BringToTop=true
string DataObject="dw_reporte_anulados_pagador"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_reporte_anulados_pagador
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_reporte_anulados_pagador
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_reporte_anulados_pagador
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_reporte_anulados_pagador
boolean BringToTop=true
end type

