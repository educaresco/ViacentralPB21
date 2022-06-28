$PBExportHeader$w_rep_conciliacion_bancos.srw
forward
global type w_rep_conciliacion_bancos from wb_report_fechas
end type
type sle_grupo from singlelineedit within w_rep_conciliacion_bancos
end type
type st_grupo from statictext within w_rep_conciliacion_bancos
end type
end forward

global type w_rep_conciliacion_bancos from wb_report_fechas
integer width = 3305
integer height = 1872
string title = "Bank Transactions"
sle_grupo sle_grupo
st_grupo st_grupo
end type
global w_rep_conciliacion_bancos w_rep_conciliacion_bancos

on w_rep_conciliacion_bancos.create
int iCurrent
call super::create
this.sle_grupo=create sle_grupo
this.st_grupo=create st_grupo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_grupo
this.Control[iCurrent+2]=this.st_grupo
end on

on w_rep_conciliacion_bancos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_grupo)
destroy(this.st_grupo)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_conciliacion_bancos
integer y = 140
integer width = 3259
integer height = 1556
integer taborder = 40
string dataobject = "dw_rep_conciliacion_bancos"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_conciliacion_bancos
integer x = 567
integer y = 20
end type

type st_1 from wb_report_fechas`st_1 within w_rep_conciliacion_bancos
integer x = 201
integer y = 20
end type

type st_2 from wb_report_fechas`st_2 within w_rep_conciliacion_bancos
integer x = 1115
integer y = 20
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_conciliacion_bancos
integer x = 1481
integer y = 20
end type

event em_fecha2::modified;return 0
end event

type sle_grupo from singlelineedit within w_rep_conciliacion_bancos
integer x = 2318
integer y = 20
integer width = 869
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event losefocus;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,'%'+sle_grupo.text+'%')

dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

type st_grupo from statictext within w_rep_conciliacion_bancos
integer x = 2094
integer y = 20
integer width = 210
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Bank :"
alignment alignment = right!
boolean focusrectangle = false
end type

