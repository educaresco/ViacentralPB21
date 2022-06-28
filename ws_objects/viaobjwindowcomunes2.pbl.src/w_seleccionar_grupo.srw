$PBExportHeader$w_seleccionar_grupo.srw
$PBExportComments$En esta ventana se selecciona el grupo por el cual se desea sacar determinado reporte.
forward
global type w_seleccionar_grupo from wb_response
end type
type dw_1 from datawindow within w_seleccionar_grupo
end type
end forward

global type w_seleccionar_grupo from wb_response
int X=923
int Y=212
int Width=2103
int Height=1676
dw_1 dw_1
end type
global w_seleccionar_grupo w_seleccionar_grupo

on w_seleccionar_grupo.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_seleccionar_grupo.destroy
call super::destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_seleccionar_grupo
int X=5
int Width=2062
int Height=1568
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_seleccionar_grupo"
boolean Border=false
boolean VScrollBar=true
boolean LiveScroll=true
end type

event constructor;dw_1.settransobject(sqlca)

dw_1.retrieve()
end event

event clicked;if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
end if
end event

event doubleclicked;long		ll_row
string	ls_grupo

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_grupo = dw_1.getitemstring(ll_row,"id_main_branch")
	closewithreturn(w_seleccionar_grupo,ls_grupo)
end if
end event

