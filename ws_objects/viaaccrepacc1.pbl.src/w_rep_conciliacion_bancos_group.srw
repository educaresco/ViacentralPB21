$PBExportHeader$w_rep_conciliacion_bancos_group.srw
forward
global type w_rep_conciliacion_bancos_group from wb_report_fechas
end type
type cb_1 from commandbutton within w_rep_conciliacion_bancos_group
end type
type sle_grupo from singlelineedit within w_rep_conciliacion_bancos_group
end type
type st_grupo from statictext within w_rep_conciliacion_bancos_group
end type
end forward

global type w_rep_conciliacion_bancos_group from wb_report_fechas
integer width = 3305
integer height = 1872
string title = "Bank Conciliation"
cb_1 cb_1
sle_grupo sle_grupo
st_grupo st_grupo
end type
global w_rep_conciliacion_bancos_group w_rep_conciliacion_bancos_group

on w_rep_conciliacion_bancos_group.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_grupo=create sle_grupo
this.st_grupo=create st_grupo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_grupo
this.Control[iCurrent+3]=this.st_grupo
end on

on w_rep_conciliacion_bancos_group.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.sle_grupo)
destroy(this.st_grupo)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_conciliacion_bancos_group
integer y = 140
integer width = 3237
integer height = 1556
integer taborder = 50
string dataobject = "dw_rep_conciliacion_bancos_group"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_conciliacion_bancos_group
integer x = 663
integer y = 20
end type

type st_1 from wb_report_fechas`st_1 within w_rep_conciliacion_bancos_group
integer x = 297
integer y = 20
end type

type st_2 from wb_report_fechas`st_2 within w_rep_conciliacion_bancos_group
integer x = 1211
integer y = 20
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_conciliacion_bancos_group
integer x = 1577
integer y = 20
end type

event em_fecha2::modified;return 0
end event

type cb_1 from commandbutton within w_rep_conciliacion_bancos_group
integer x = 2569
integer y = 20
integer width = 242
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consult"
end type

event clicked;string 	ls_group


Open(w_seleccionar_grupo)

ls_group = message.stringparm

sle_grupo.text = ls_group

sle_grupo.setfocus()
end event

type sle_grupo from singlelineedit within w_rep_conciliacion_bancos_group
integer x = 2313
integer y = 20
integer width = 247
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

type st_grupo from statictext within w_rep_conciliacion_bancos_group
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
string text = "Group :"
alignment alignment = right!
boolean focusrectangle = false
end type

