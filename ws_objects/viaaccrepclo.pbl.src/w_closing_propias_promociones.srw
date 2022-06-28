$PBExportHeader$w_closing_propias_promociones.srw
forward
global type w_closing_propias_promociones from wb_report_fechas
end type
type em_1 from editmask within w_closing_propias_promociones
end type
type st_3 from statictext within w_closing_propias_promociones
end type
end forward

global type w_closing_propias_promociones from wb_report_fechas
int Width=3488
em_1 em_1
st_3 st_3
end type
global w_closing_propias_promociones w_closing_propias_promociones

on w_closing_propias_promociones.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_3
end on

on w_closing_propias_promociones.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_1)
destroy(this.st_3)
end on

type dw_1 from wb_report_fechas`dw_1 within w_closing_propias_promociones
int Width=3461
boolean BringToTop=true
string DataObject="dw_closing_propias_promociones"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_closing_propias_promociones
int X=571
int Y=20
int Width=434
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_closing_propias_promociones
int X=206
int Y=20
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_closing_propias_promociones
int X=1120
int Y=20
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_closing_propias_promociones
int X=1486
int Y=20
int Width=471
boolean BringToTop=true
end type

event em_fecha2::modified;//Date		ld_fecha1, ld_fecha2
//
//Setpointer(Hourglass!)
//
//ld_fecha1 = Date(em_fecha1.text)
//
//ld_fecha2 = Date(em_fecha2.text)
//
//dw_1.retrieve(ld_Fecha1,ld_Fecha2)
//dw_1.setfocus()
//
//
//Setpointer(Hourglass!)
//
//
//Setpointer(Arrow!)
end event

type em_1 from editmask within w_closing_propias_promociones
int X=2336
int Y=20
int Width=425
int Height=100
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="!!!!!!!!!!"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,em_1.text)
dw_1.setfocus()


Setpointer(Arrow!)
end event

type st_3 from statictext within w_closing_propias_promociones
int X=2080
int Y=32
int Width=247
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Branch :"
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

