$PBExportHeader$uo_frmwrk_menu_botones_reportes.sru
forward
global type uo_frmwrk_menu_botones_reportes from userobject
end type
type pb_opcion4 from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_opcion3 from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_opcion2 from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_opcion1 from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_zoom from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_parametros from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_imprimir from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_exportar from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_ir_a_ultimo from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_ir_a_siguiente from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_ir_a_anterior from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_ir_a_primero from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_filtrar from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_ordenar from picturebutton within uo_frmwrk_menu_botones_reportes
end type
type pb_recuperar from picturebutton within uo_frmwrk_menu_botones_reportes
end type
end forward

global type uo_frmwrk_menu_botones_reportes from userobject
integer width = 4558
integer height = 260
boolean hscrollbar = true
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_opcion4 pb_opcion4
pb_opcion3 pb_opcion3
pb_opcion2 pb_opcion2
pb_opcion1 pb_opcion1
pb_zoom pb_zoom
pb_parametros pb_parametros
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_ir_a_ultimo pb_ir_a_ultimo
pb_ir_a_siguiente pb_ir_a_siguiente
pb_ir_a_anterior pb_ir_a_anterior
pb_ir_a_primero pb_ir_a_primero
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_recuperar pb_recuperar
end type
global uo_frmwrk_menu_botones_reportes uo_frmwrk_menu_botones_reportes

type variables
Window idw_ventana_padre
end variables

on uo_frmwrk_menu_botones_reportes.create
this.pb_opcion4=create pb_opcion4
this.pb_opcion3=create pb_opcion3
this.pb_opcion2=create pb_opcion2
this.pb_opcion1=create pb_opcion1
this.pb_zoom=create pb_zoom
this.pb_parametros=create pb_parametros
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_ir_a_ultimo=create pb_ir_a_ultimo
this.pb_ir_a_siguiente=create pb_ir_a_siguiente
this.pb_ir_a_anterior=create pb_ir_a_anterior
this.pb_ir_a_primero=create pb_ir_a_primero
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_recuperar=create pb_recuperar
this.Control[]={this.pb_opcion4,&
this.pb_opcion3,&
this.pb_opcion2,&
this.pb_opcion1,&
this.pb_zoom,&
this.pb_parametros,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_ir_a_ultimo,&
this.pb_ir_a_siguiente,&
this.pb_ir_a_anterior,&
this.pb_ir_a_primero,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_recuperar}
end on

on uo_frmwrk_menu_botones_reportes.destroy
destroy(this.pb_opcion4)
destroy(this.pb_opcion3)
destroy(this.pb_opcion2)
destroy(this.pb_opcion1)
destroy(this.pb_zoom)
destroy(this.pb_parametros)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_ir_a_ultimo)
destroy(this.pb_ir_a_siguiente)
destroy(this.pb_ir_a_anterior)
destroy(this.pb_ir_a_primero)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_recuperar)
end on

type pb_opcion4 from picturebutton within uo_frmwrk_menu_botones_reportes
boolean visible = false
integer x = 3794
integer y = 4
integer width = 265
integer height = 184
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "NotFound!"
end type

event clicked;idw_ventana_padre.PostEvent("ue_opcion4")



end event

type pb_opcion3 from picturebutton within uo_frmwrk_menu_botones_reportes
boolean visible = false
integer x = 3529
integer y = 4
integer width = 265
integer height = 184
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "NotFound!"
end type

event clicked;idw_ventana_padre.PostEvent("ue_opcion3")



end event

type pb_opcion2 from picturebutton within uo_frmwrk_menu_botones_reportes
boolean visible = false
integer x = 3264
integer y = 4
integer width = 265
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "NotFound!"
end type

event clicked;idw_ventana_padre.PostEvent("ue_opcion2")



end event

type pb_opcion1 from picturebutton within uo_frmwrk_menu_botones_reportes
boolean visible = false
integer x = 2999
integer y = 4
integer width = 265
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "NotFound!"
end type

event clicked;idw_ventana_padre.PostEvent("ue_opcion1")



end event

type pb_zoom from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 2697
integer y = 4
integer width = 265
integer height = 184
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "imagenes\btn-visualizacion.gif"
string powertiptext = "Zoom (Shift + Z)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_seleccionar_tamano_visualizacion_dw")



end event

type pb_parametros from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 2432
integer y = 4
integer width = 265
integer height = 184
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "imagenes\btn-parametros.gif"
string powertiptext = "Parámetros (Shift + M)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_parametros")



end event

type pb_imprimir from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 2167
integer y = 4
integer width = 265
integer height = 184
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\btn-imprimir.gif"
string powertiptext = "Impresión (Shift + I)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_imprimir")
end event

type pb_exportar from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 1902
integer y = 4
integer width = 265
integer height = 184
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\btn-exportar.gif"
string powertiptext = "Exportar (Shift + E)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_exportar")

end event

type pb_ir_a_ultimo from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 1600
integer y = 4
integer width = 265
integer height = 184
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "imagenes\btn-ultimo.gif"
string powertiptext = "Ir al último (Shift + U)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_ultima")
end event

type pb_ir_a_siguiente from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 1335
integer y = 4
integer width = 265
integer height = 184
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\btn-siguiente.gif"
string powertiptext = "Posterior (Shift + S)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_siguiente")
end event

type pb_ir_a_anterior from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 1070
integer y = 4
integer width = 265
integer height = 184
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\btn-anterior.gif"
string powertiptext = "Anterior (Shift + A)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_anterior")
end event

type pb_ir_a_primero from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 805
integer y = 4
integer width = 265
integer height = 184
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "imagenes\btn-primero.gif"
string powertiptext = "Ir al primer registro (Shift + P)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_primera")
end event

type pb_filtrar from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 521
integer y = 4
integer width = 265
integer height = 184
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "imagenes\btn-filtrar.gif"
string powertiptext = "Filtrar (Shift + F)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_filtrar")

end event

type pb_ordenar from picturebutton within uo_frmwrk_menu_botones_reportes
integer x = 261
integer y = 4
integer width = 265
integer height = 184
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\btn-ordenar_dw.gif"
string powertiptext = "Ordenar (Shift + O)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_ordenar")
end event

type pb_recuperar from picturebutton within uo_frmwrk_menu_botones_reportes
integer y = 4
integer width = 265
integer height = 184
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "imagenes\btn-recuperar.gif"
string powertiptext = "Recuperar (Shift + R)"
end type

event clicked;idw_ventana_padre.PostEvent("ue_recuperar")

end event

