$PBExportHeader$w_g_escala_ventas.srw
forward
global type w_g_escala_ventas from w_sheet
end type
type gr_1 from u_gr within w_g_escala_ventas
end type
type dw_1 from datawindow within w_g_escala_ventas
end type
type em_fecha1 from u_em within w_g_escala_ventas
end type
type em_fecha2 from u_em within w_g_escala_ventas
end type
type st_1 from statictext within w_g_escala_ventas
end type
type st_2 from statictext within w_g_escala_ventas
end type
end forward

global type w_g_escala_ventas from w_sheet
int Width=2454
int Height=1588
boolean TitleBar=true
string Title="Sales' Porcentage"
string MenuName="mb_graph"
gr_1 gr_1
dw_1 dw_1
em_fecha1 em_fecha1
em_fecha2 em_fecha2
st_1 st_1
st_2 st_2
end type
global w_g_escala_ventas w_g_escala_ventas

on w_g_escala_ventas.create
int iCurrent
call super::create
if this.MenuName = "mb_graph" then this.MenuID = create mb_graph
this.gr_1=create gr_1
this.dw_1=create dw_1
this.em_fecha1=create em_fecha1
this.em_fecha2=create em_fecha2
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gr_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.em_fecha1
this.Control[iCurrent+4]=this.em_fecha2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
end on

on w_g_escala_ventas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.gr_1)
destroy(this.dw_1)
destroy(this.em_fecha1)
destroy(this.em_fecha2)
destroy(this.st_1)
destroy(this.st_2)
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

type gr_1 from u_gr within w_g_escala_ventas
int X=24
int Y=38
int Width=1556
int Height=1107
boolean Visible=false
boolean BringToTop=true
long BackColor=16777215
end type

type dw_1 from datawindow within w_g_escala_ventas
int X=28
int Y=147
int Width=2358
int Height=1236
boolean BringToTop=true
string DataObject="dw_g_invoices_por_agente"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event constructor;dw_1.SetTransObject(sqlca)

//dw_1.Retrieve()
end event

type em_fecha1 from u_em within w_g_escala_ventas
int X=626
int Y=38
int Width=359
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
double Increment=0
string MinMax=""
end type

type em_fecha2 from u_em within w_g_escala_ventas
int X=1512
int Y=38
int Width=359
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
double Increment=0
string MinMax=""
end type

event modified;Date		ld_fecha1, ld_fecha2


ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = Date(em_fecha2.text)

dw_1.retrieve(ld_Fecha1,ld_Fecha2)
end event

type st_1 from statictext within w_g_escala_ventas
int X=383
int Y=52
int Width=231
int Height=52
boolean Enabled=false
boolean BringToTop=true
string Text="Initial Date :"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_g_escala_ventas
int X=1285
int Y=49
int Width=215
int Height=59
boolean Enabled=false
boolean BringToTop=true
string Text="Final Date :"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

