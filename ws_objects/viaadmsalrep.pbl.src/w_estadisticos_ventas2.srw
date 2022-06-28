$PBExportHeader$w_estadisticos_ventas2.srw
forward
global type w_estadisticos_ventas2 from w_sheet
end type
type dw_1 from u_dw within w_estadisticos_ventas2
end type
type em_fecha1 from u_em within w_estadisticos_ventas2
end type
type st_1 from statictext within w_estadisticos_ventas2
end type
type st_2 from statictext within w_estadisticos_ventas2
end type
type em_fecha2 from u_em within w_estadisticos_ventas2
end type
end forward

global type w_estadisticos_ventas2 from w_sheet
int Width=3515
int Height=2156
boolean Visible=false
string MenuName="mb_report"
dw_1 dw_1
em_fecha1 em_fecha1
st_1 st_1
st_2 st_2
em_fecha2 em_fecha2
end type
global w_estadisticos_ventas2 w_estadisticos_ventas2

on w_estadisticos_ventas2.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.dw_1=create dw_1
this.em_fecha1=create em_fecha1
this.st_1=create st_1
this.st_2=create st_2
this.em_fecha2=create em_fecha2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.em_fecha1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.em_fecha2
end on

on w_estadisticos_ventas2.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.em_fecha1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_fecha2)
end on

event pfc_saveas;dw_1.saveas()
end event

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

event open;call super::open;X=1
Y=1
Show()

em_fecha1.text = String(Today())
em_fecha2.text = String(Today())


end event

event pfc_print;
If Messagebox("Verificar","Esta seguro que desea Imprimir ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()




dw_1.print()



return 0
end event

type dw_1 from u_dw within w_estadisticos_ventas2
int X=0
int Y=156
int Width=3447
int Height=1780
int TabOrder=30
boolean BringToTop=true
string DataObject="dw_estadisticos_ventas2"
boolean HScrollBar=true
boolean HSplitScroll=true
end type

event constructor;SetTransObject(SQLCA)
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type em_fecha1 from u_em within w_estadisticos_ventas2
int X=951
int Y=32
int Width=366
int Height=100
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
boolean AutoSkip=true
boolean Spin=true
double Increment=0
string MinMax="01/01/1990~~01/01/2010"
FontCharSet FontCharSet=Ansi!
end type

type st_1 from statictext within w_estadisticos_ventas2
int X=585
int Y=32
int Width=366
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Date Begin :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_estadisticos_ventas2
int X=1499
int Y=32
int Width=366
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Date End :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_fecha2 from u_em within w_estadisticos_ventas2
int X=1865
int Y=32
int Width=366
int Height=100
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
boolean AutoSkip=true
boolean Spin=true
double Increment=0
string MinMax="01/01/1990~~01/01/2010"
FontCharSet FontCharSet=Ansi!
end type

event modified;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)

dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

