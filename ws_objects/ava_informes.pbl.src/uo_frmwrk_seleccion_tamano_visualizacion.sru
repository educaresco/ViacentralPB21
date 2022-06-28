$PBExportHeader$uo_frmwrk_seleccion_tamano_visualizacion.sru
forward
global type uo_frmwrk_seleccion_tamano_visualizacion from userobject
end type
type st_1 from statictext within uo_frmwrk_seleccion_tamano_visualizacion
end type
type em_tamano_vista_previa from editmask within uo_frmwrk_seleccion_tamano_visualizacion
end type
type hsb_tamano_vista_previa from hscrollbar within uo_frmwrk_seleccion_tamano_visualizacion
end type
end forward

global type uo_frmwrk_seleccion_tamano_visualizacion from userobject
integer width = 2331
integer height = 100
boolean border = true
long backcolor = 81324524
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_redimensionar_dw ( )
st_1 st_1
em_tamano_vista_previa em_tamano_vista_previa
hsb_tamano_vista_previa hsb_tamano_vista_previa
end type
global uo_frmwrk_seleccion_tamano_visualizacion uo_frmwrk_seleccion_tamano_visualizacion

type variables
DATAWINDOW	idw_datawindow
DECIMAL{2}	idc_unidad
INTEGER	ii_tamano, &
		ii_incremento
STRING		is_tamano
WINDOW	iw_ventana
end variables

forward prototypes
public subroutine uof_redimensionar_dw ()
public subroutine uof_em_modificado ()
end prototypes

public subroutine uof_redimensionar_dw ();SetPointer(HourGlass!)
iw_ventana.SetRedraw(False)
idw_datawindow.Modify("datawindow.print.preview.zoom = " + is_tamano)
iw_ventana.SetRedraw(True)
end subroutine

public subroutine uof_em_modificado ();is_tamano = em_tamano_vista_previa.Text
ii_tamano = Integer(is_tamano)
hsb_tamano_vista_previa.Position = ii_tamano 
uof_redimensionar_dw()
end subroutine

on uo_frmwrk_seleccion_tamano_visualizacion.create
this.st_1=create st_1
this.em_tamano_vista_previa=create em_tamano_vista_previa
this.hsb_tamano_vista_previa=create hsb_tamano_vista_previa
this.Control[]={this.st_1,&
this.em_tamano_vista_previa,&
this.hsb_tamano_vista_previa}
end on

on uo_frmwrk_seleccion_tamano_visualizacion.destroy
destroy(this.st_1)
destroy(this.em_tamano_vista_previa)
destroy(this.hsb_tamano_vista_previa)
end on

event constructor;STRU_FRMWRK_PARAMETROS	lstr_parametros

lstr_parametros = Message.PowerObjectParm

iw_ventana = lstr_parametros.Window[1]
idw_datawindow = lstr_parametros.Datawindow[1]
ii_tamano = lstr_parametros.Integer[1]
ii_incremento = 5

hsb_tamano_vista_previa.MinPosition = 0
hsb_tamano_vista_previa.MaxPosition = 999
hsb_tamano_vista_previa.Position = ii_tamano
em_tamano_vista_previa.Increment = ii_incremento
em_tamano_vista_previa.Text = String(ii_tamano)

end event

type st_1 from statictext within uo_frmwrk_seleccion_tamano_visualizacion
integer x = 18
integer y = 12
integer width = 955
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
boolean enabled = false
string text = "Tamaño de visualización del reporte"
boolean focusrectangle = false
end type

type em_tamano_vista_previa from editmask within uo_frmwrk_seleccion_tamano_visualizacion
integer x = 2039
integer y = 4
integer width = 206
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 50
string minmax = "1~~999"
end type

event modified;uof_em_modificado()
end event

event other;IF String(ii_tamano) <> em_tamano_vista_previa.Text THEN
	uof_em_modificado()
END IF
end event

type hsb_tamano_vista_previa from hscrollbar within uo_frmwrk_seleccion_tamano_visualizacion
event ue_postmoved ( )
integer x = 997
integer y = 12
integer width = 1001
integer height = 64
end type

event ue_postmoved;is_tamano = String(ii_tamano)
em_tamano_vista_previa.Text = is_tamano
uof_redimensionar_dw()

end event

event constructor;idc_unidad = This.Width / 999
end event

event moved;ii_tamano = scrollpos
This.PostEvent("ue_postmoved")
end event

event lineleft;IF (ii_tamano - ii_incremento) >= hsb_tamano_vista_previa.MinPosition THEN 
	ii_tamano = ii_tamano - ii_incremento
	This.Position = ii_tamano 
END IF
This.PostEvent("ue_postmoved")
end event

event lineright;IF (ii_tamano + ii_incremento) <= hsb_tamano_vista_previa.MaxPosition THEN 
	ii_tamano = ii_tamano + ii_incremento
	This.Position = ii_tamano 
END IF
This.PostEvent("ue_postmoved")
end event

