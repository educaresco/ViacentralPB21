$PBExportHeader$uo_exportar_datawindow.sru
forward
global type uo_exportar_datawindow from userobject
end type
type rb_enviar_correo from radiobutton within uo_exportar_datawindow
end type
type rb_guardar_disco from radiobutton within uo_exportar_datawindow
end type
type p_3 from picture within uo_exportar_datawindow
end type
type p_2 from picture within uo_exportar_datawindow
end type
type p_1 from picture within uo_exportar_datawindow
end type
type pb_exportar from picturebutton within uo_exportar_datawindow
end type
type cbx_exportar from checkbox within uo_exportar_datawindow
end type
type cbx_solo_visibles from checkbox within uo_exportar_datawindow
end type
type cbx_email from checkbox within uo_exportar_datawindow
end type
type ddlb_exportar from dropdownpicturelistbox within uo_exportar_datawindow
end type
type gb_exportar from groupbox within uo_exportar_datawindow
end type
end forward

global type uo_exportar_datawindow from userobject
integer width = 942
integer height = 500
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
rb_enviar_correo rb_enviar_correo
rb_guardar_disco rb_guardar_disco
p_3 p_3
p_2 p_2
p_1 p_1
pb_exportar pb_exportar
cbx_exportar cbx_exportar
cbx_solo_visibles cbx_solo_visibles
cbx_email cbx_email
ddlb_exportar ddlb_exportar
gb_exportar gb_exportar
end type
global uo_exportar_datawindow uo_exportar_datawindow

type variables
DataWindow idw_dw
Integer ii_ddplb_index
Window	iw_parent
end variables

forward prototypes
public subroutine of_set_dw (datawindow adw_dw)
public subroutine of_set_parent (window aw_parent)
end prototypes

public subroutine of_set_dw (datawindow adw_dw);//Esta variable debe ser instanciada desde el objeto que invoca este user object para poder ejecutar los procesos

idw_dw= adw_dw

end subroutine

public subroutine of_set_parent (window aw_parent);//Esta variable debe ser instanciada desde el objeto que invoca este user object para poder ejecutar los procesos.
//Solo se debe instanciar siempre y cuando sea desde una ventana que se desee cerrar, luego
//de haber culminado el proceso de exportación de datos
iw_parent= aw_parent
end subroutine

on uo_exportar_datawindow.create
this.rb_enviar_correo=create rb_enviar_correo
this.rb_guardar_disco=create rb_guardar_disco
this.p_3=create p_3
this.p_2=create p_2
this.p_1=create p_1
this.pb_exportar=create pb_exportar
this.cbx_exportar=create cbx_exportar
this.cbx_solo_visibles=create cbx_solo_visibles
this.cbx_email=create cbx_email
this.ddlb_exportar=create ddlb_exportar
this.gb_exportar=create gb_exportar
this.Control[]={this.rb_enviar_correo,&
this.rb_guardar_disco,&
this.p_3,&
this.p_2,&
this.p_1,&
this.pb_exportar,&
this.cbx_exportar,&
this.cbx_solo_visibles,&
this.cbx_email,&
this.ddlb_exportar,&
this.gb_exportar}
end on

on uo_exportar_datawindow.destroy
destroy(this.rb_enviar_correo)
destroy(this.rb_guardar_disco)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.pb_exportar)
destroy(this.cbx_exportar)
destroy(this.cbx_solo_visibles)
destroy(this.cbx_email)
destroy(this.ddlb_exportar)
destroy(this.gb_exportar)
end on

event constructor;/* DRT==>2008-ago-26
Este objeto de usuario puede usarse de dos maneras:

1. Instanciando el user object:
	IF IsValid(uo_exportar_datawindow) THEN
		CloseUserObject(uo_exportar_datawindow)
	ELSE
		OpenUserObject ( uo_exportar_datawindow, 1934, 332 )
		uo_exportar_datawindow.BringTotop=true
		n_cst_exportar_dw.of_set_dw(dw_reporte)
	END IF
	
2. Colocandolo en una ventana: Se deben llenar las siguientes variables para poder realizar
	los procesos de exportar
	
	n_cst_exportar_dw.of_set_parent(this) Donde -this- es la ventana padre del UO. Esto servirá para 
	cerrar la ventana luego de exportar si se requiriese
	n_cst_exportar_dw.of_set_dw(dw_reporte)
	
3. También se puede instanciar invocando a la ventana w_exportar_dw a la cual se debe abrir de la 
	siguiente manera:
	OpenWithParm(dw_reporte)
*/
end event

type rb_enviar_correo from radiobutton within uo_exportar_datawindow
integer x = 123
integer y = 136
integer width = 590
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enviar por E-mail"
boolean lefttext = true
end type

event clicked;ddlb_exportar.Reset()

ddlb_exportar.InsertItem('Texto',1,1)
ddlb_exportar.InsertItem('Excel - Calc',2,2)
ddlb_exportar.InsertItem('CSV',3,3)
ddlb_exportar.InsertItem('Windows Metafile Format (WMF)',4,4)
ddlb_exportar.InsertItem(' HTML',5,5)
ddlb_exportar.InsertItem('PDF',6,6)		

ddlb_exportar.Height = 500
ddlb_exportar.enabled= true
end event

type rb_guardar_disco from radiobutton within uo_exportar_datawindow
integer x = 123
integer y = 48
integer width = 590
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Guardar en disco"
boolean checked = true
boolean lefttext = true
end type

event clicked;//Solo habilita la opción de los archivos cuando la opción exportar archivo está en check ON

STRING	ls_item_seleccionado

ddlb_exportar.Reset()
ddlb_exportar.SelectItem(1)	
ddlb_exportar.DirSelect(ls_item_seleccionado)
ddlb_exportar.enabled=False
end event

type p_3 from picture within uo_exportar_datawindow
integer x = 37
integer y = 352
integer width = 69
integer height = 52
boolean originalsize = true
string picturename = "imagenes\btn-columnasVisibles.gif"
boolean focusrectangle = false
end type

type p_2 from picture within uo_exportar_datawindow
integer x = 37
integer y = 136
integer width = 73
integer height = 56
boolean originalsize = true
string picturename = "imagenes\btn-enviarEmail.gif"
boolean focusrectangle = false
end type

type p_1 from picture within uo_exportar_datawindow
integer x = 37
integer y = 44
integer width = 64
integer height = 56
boolean originalsize = true
string picturename = "imagenes\btn-guardarDisco.gif"
boolean focusrectangle = false
end type

type pb_exportar from picturebutton within uo_exportar_datawindow
integer x = 754
integer y = 332
integer width = 119
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
string picturename = "imagenes\btn-exportColum.gif"
alignment htextalign = left!
end type

event clicked;String is_tipo_archivo
stru_frmwrk_parametros	lstru_frmwrk_parametros
n_cst_exportar_dw				ln_cst_exportar_dw

/*
EL datawindow a exportar tiene dos opciones:
1.Guardar solo en disco
2.Enviar por correo electrónico usando los objetos de envio de e-mail
*/


SetPointer(HourGlass!)

ln_cst_exportar_dw= CREATE  n_cst_exportar_dw


lstru_frmwrk_parametros.boolean[1]= rb_guardar_disco.Checked
lstru_frmwrk_parametros.boolean[2]= rb_enviar_correo.Checked
lstru_frmwrk_parametros.boolean[3]= cbx_solo_visibles.Checked

IF rb_enviar_correo.Checked THEN
	CHOOSE CASE ii_ddplb_index
		CASE 1
			is_tipo_archivo= 'txt'
		CASE 2
			is_tipo_archivo= 'xls'
		CASE 3
			is_tipo_archivo= 'csv'
		CASE 4
			is_tipo_archivo= 'wmf'
		CASE 5
			is_tipo_archivo= 'html'
		CASE 6
			is_tipo_archivo= 'pdf'
		CASE ELSE
			MessageBox("Error","Por favor seleccione un formato de archivo a exportar.",StopSign!)
			Return
	END CHOOSE
ELSE
	is_tipo_archivo='txt'
END IF

lstru_frmwrk_parametros.string[1]= is_tipo_archivo

ln_cst_exportar_dw.of_inicializar_parametros(lstru_frmwrk_parametros)

IF (gb_exportarlimitecredito)THEN
	ln_cst_exportar_dw.of_exportar_datos_crosstab(idw_dw)
ELSE
	ln_cst_exportar_dw.of_exportar_datos(idw_dw)
END IF
IF IsValid(iw_parent) THEN CLOSE(iw_parent)
end event

type cbx_exportar from checkbox within uo_exportar_datawindow
boolean visible = false
integer x = 960
integer y = 172
integer width = 590
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Guardar en disco"
boolean checked = true
boolean lefttext = true
end type

event clicked;//Solo habilita la opción de los archivos cuando la opción exportar archivo está en check ON
BOOLEAN	lb_estado, lb_estado2
STRING	ls_item_seleccionado

cbx_email.Checked = False
ddlb_exportar.Reset()

IF cbx_exportar.Checked THEN
//	st_1.Text = 'Archivo:'
//	ddlb_exportar.InsertItem(is_item_exportar,7,1)
	ddlb_exportar.SelectItem(1)	
	ddlb_exportar.DirSelect(ls_item_seleccionado)
//	st_impresora.Text = ls_item_seleccionado
	lb_estado = True	
//	lb_estado2 = False
	cbx_email.Checked		= False
	ddlb_exportar.enabled=False
ELSE
//	st_1.Text = 'Impresora:'
//	st_impresora.Text = gs_impresora
//	lb_estado = False	
//	lb_estado2 = True
END IF	
//ddlb_exportar.Enabled 			= lb_estado
//st_copias.DisabledLook 			= lb_estado
//st_imprimir.DisabledLook 		= lb_estado
//st_instruccion.Enabled 			= lb_estado2
//st_solo_visibles.DisabledLook = lb_estado2
//cbx_solo_visibles.Enabled 		= lb_estado
//cbx_email.Enabled 				= lb_estado
//cbx_ordenar_copias.Enabled 	= lb_estado2
//cb_configurar.Enabled 			= lb_estado2
//ddlb_rango.Enabled 				= lb_estado2
//gb_exportar.Enabled 				= lb_estado
//gb_impresion.Enabled 			= lb_estado2
//gb_rango_paginas.Enabled 		= lb_estado2
//rb_actual.Enabled 				= lb_estado2
//rb_rango_paginas.Enabled 		= lb_estado2
//rb_todas.Enabled 					= lb_estado2
//sle_rango_paginas.Enabled 		= lb_estado2
//em_copias.Enabled 				=lb_estado2
end event

type cbx_solo_visibles from checkbox within uo_exportar_datawindow
integer x = 123
integer y = 352
integer width = 590
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solo columnas visibles"
boolean lefttext = true
end type

type cbx_email from checkbox within uo_exportar_datawindow
boolean visible = false
integer x = 955
integer y = 248
integer width = 590
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enviar por E-mail"
boolean lefttext = true
end type

event clicked;ddlb_exportar.Reset()

IF cbx_email.Checked = True THEN
//	st_impresora.Text = 'Enviar por correo electrónico'
	ddlb_exportar.InsertItem('Archivo Texto',1,1)
	ddlb_exportar.InsertItem('Archivo Excel',2,2)
	ddlb_exportar.InsertItem('Archivo CSV',3,3)
	ddlb_exportar.InsertItem('Archivo WMF',4,4)
	ddlb_exportar.InsertItem('Archivo HTML',5,5)
	ddlb_exportar.InsertItem('Archivo PDF',6,6)		
	ddlb_exportar.SelectItem(5)
	ddlb_exportar.Height = 450
ELSE
//	st_impresora.Text = is_item_exportar
//	ddlb_exportar.InsertItem(is_item_exportar,7,1)
	ddlb_exportar.SelectItem(1)
END IF	

end event

type ddlb_exportar from dropdownpicturelistbox within uo_exportar_datawindow
string tag = "ddplb_1"
integer x = 27
integer y = 216
integer width = 695
integer height = 264
integer taborder = 40
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean vscrollbar = true
string item[] = {"Texto","Excel - Calc","CSV","Windows Metafile Format (WMF)"," HTML","PDF"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3,4,5,6}
string picturename[] = {"imagenes\texto.gif","imagenes\excel.gif","imagenes\csv.gif","imagenes\windows.gif","imagenes\html.gif","imagenes\pdf.gif","Save!"}
long picturemaskcolor = 536870912
end type

event selectionchanged;ii_ddplb_index= index
end event

type gb_exportar from groupbox within uo_exportar_datawindow
integer x = 9
integer width = 905
integer height = 484
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

