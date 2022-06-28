$PBExportHeader$w_g_invoices_grupo_pagador.srw
forward
global type w_g_invoices_grupo_pagador from w_sheet
end type
type gr_1 from u_gr within w_g_invoices_grupo_pagador
end type
type dw_1 from datawindow within w_g_invoices_grupo_pagador
end type
end forward

global type w_g_invoices_grupo_pagador from w_sheet
int Width=2222
int Height=1375
boolean TitleBar=true
string Title="Invoices por Grupo Pagador"
string MenuName="mb_graph"
gr_1 gr_1
dw_1 dw_1
end type
global w_g_invoices_grupo_pagador w_g_invoices_grupo_pagador

on w_g_invoices_grupo_pagador.create
int iCurrent
call super::create
if this.MenuName = "mb_graph" then this.MenuID = create mb_graph
this.gr_1=create gr_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gr_1
this.Control[iCurrent+2]=this.dw_1
end on

on w_g_invoices_grupo_pagador.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.gr_1)
destroy(this.dw_1)
end on

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Initialize the Window Resize Service.
//
//////////////////////////////////////////////////////////////////////////////

//Initialize the Window Resize Functionality
of_SetResize(true)
inv_resize.of_SetMinSize(1884, 873)
inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)
end event

type gr_1 from u_gr within w_g_invoices_grupo_pagador
int X=24
int Y=38
int Width=1556
int Height=1107
boolean Visible=false
boolean BringToTop=true
long BackColor=16777215
end type

type dw_1 from datawindow within w_g_invoices_grupo_pagador
int X=28
int Y=21
int Width=2122
int Height=1142
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_g_invoices_grupo_pagador"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event constructor;dw_1.SetTransObject(sqlca)

dw_1.Retrieve()
end event

