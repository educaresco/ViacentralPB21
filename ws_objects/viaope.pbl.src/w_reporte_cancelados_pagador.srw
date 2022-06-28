$PBExportHeader$w_reporte_cancelados_pagador.srw
forward
global type w_reporte_cancelados_pagador from wb_report_fechas
end type
type cb_query from commandbutton within w_reporte_cancelados_pagador
end type
end forward

global type w_reporte_cancelados_pagador from wb_report_fechas
cb_query cb_query
end type
global w_reporte_cancelados_pagador w_reporte_cancelados_pagador

on w_reporte_cancelados_pagador.create
int iCurrent
call super::create
this.cb_query=create cb_query
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_query
end on

on w_reporte_cancelados_pagador.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_query)
end on

type dw_1 from wb_report_fechas`dw_1 within w_reporte_cancelados_pagador
integer taborder = 0
string dataobject = "dw_reporte_cancelados_pagador"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_reporte_cancelados_pagador
integer x = 233
integer y = 48
integer width = 398
integer height = 72
end type

type st_1 from wb_report_fechas`st_1 within w_reporte_cancelados_pagador
integer x = 69
integer y = 52
integer width = 155
string text = "From :"
end type

type st_2 from wb_report_fechas`st_2 within w_reporte_cancelados_pagador
integer x = 649
integer y = 52
integer width = 123
string text = "To :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_reporte_cancelados_pagador
integer x = 782
integer y = 48
integer width = 398
integer height = 72
end type

event em_fecha2::modified;return
end event

type cb_query from commandbutton within w_reporte_cancelados_pagador
integer x = 1221
integer y = 48
integer width = 293
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Query"
boolean default = true
end type

event clicked;Datetime	ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Datetime(date(em_fecha1.text),time('00:00:00'))
ld_fecha2 = Datetime(date(em_fecha2.text),time('23:59:59'))
dw_1.Retrieve(ld_fecha1,ld_fecha2)
dw_1.setfocus()

Setpointer(Arrow!)
end event

