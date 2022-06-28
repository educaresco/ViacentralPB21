$PBExportHeader$w_exportar_dw.srw
forward
global type w_exportar_dw from window
end type
type uo_exportar_dw from uo_exportar_datawindow within w_exportar_dw
end type
end forward

global type w_exportar_dw from window
integer width = 942
integer height = 584
boolean titlebar = true
string title = "Exportar datos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
uo_exportar_dw uo_exportar_dw
end type
global w_exportar_dw w_exportar_dw

event open;uo_exportar_dw.of_set_dw(Message.PowerObjectParm)
end event

on w_exportar_dw.create
this.uo_exportar_dw=create uo_exportar_dw
this.Control[]={this.uo_exportar_dw}
end on

on w_exportar_dw.destroy
destroy(this.uo_exportar_dw)
end on

type uo_exportar_dw from uo_exportar_datawindow within w_exportar_dw
integer taborder = 10
end type

on uo_exportar_dw.destroy
call uo_exportar_datawindow::destroy
end on

