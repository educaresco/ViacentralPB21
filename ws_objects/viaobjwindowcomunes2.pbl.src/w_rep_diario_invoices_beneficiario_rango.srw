$PBExportHeader$w_rep_diario_invoices_beneficiario_rango.srw
forward
global type w_rep_diario_invoices_beneficiario_rango from wb_report_fechas
end type
type st_3 from statictext within w_rep_diario_invoices_beneficiario_rango
end type
type st_4 from statictext within w_rep_diario_invoices_beneficiario_rango
end type
type em_range1 from editmask within w_rep_diario_invoices_beneficiario_rango
end type
type em_range2 from editmask within w_rep_diario_invoices_beneficiario_rango
end type
type st_5 from statictext within w_rep_diario_invoices_beneficiario_rango
end type
type em_branch from editmask within w_rep_diario_invoices_beneficiario_rango
end type
end forward

global type w_rep_diario_invoices_beneficiario_rango from wb_report_fechas
int Width=3534
int Height=2072
st_3 st_3
st_4 st_4
em_range1 em_range1
em_range2 em_range2
st_5 st_5
em_branch em_branch
end type
global w_rep_diario_invoices_beneficiario_rango w_rep_diario_invoices_beneficiario_rango

on w_rep_diario_invoices_beneficiario_rango.create
int iCurrent
call super::create
this.st_3=create st_3
this.st_4=create st_4
this.em_range1=create em_range1
this.em_range2=create em_range2
this.st_5=create st_5
this.em_branch=create em_branch
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.em_range1
this.Control[iCurrent+4]=this.em_range2
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.em_branch
end on

on w_rep_diario_invoices_beneficiario_rango.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_range1)
destroy(this.em_range2)
destroy(this.st_5)
destroy(this.em_branch)
end on

event open;call super::open;em_branch.text = fn_branch_instalacion()
end event

type dw_1 from wb_report_fechas`dw_1 within w_rep_diario_invoices_beneficiario_rango
int Width=3511
int Height=1708
int TabOrder=60
boolean BringToTop=true
string DataObject="dw_rep_diario_invoices_beneficiario_rang"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_diario_invoices_beneficiario_rango
int X=393
int TabOrder=40
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_diario_invoices_beneficiario_rango
int X=27
boolean Visible=false
boolean BringToTop=true
long TextColor=12632256
end type

type st_2 from wb_report_fechas`st_2 within w_rep_diario_invoices_beneficiario_rango
int X=896
boolean Visible=false
boolean BringToTop=true
long TextColor=12632256
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_diario_invoices_beneficiario_rango
int X=1262
int TabOrder=50
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type st_3 from statictext within w_rep_diario_invoices_beneficiario_rango
int X=658
int Y=40
int Width=407
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Range Begin :"
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

type st_4 from statictext within w_rep_diario_invoices_beneficiario_rango
int X=1518
int Y=36
int Width=334
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Range End :"
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

type em_range1 from editmask within w_rep_diario_invoices_beneficiario_rango
int X=1070
int Y=24
int Width=439
int Height=100
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="######"
boolean Spin=true
double Increment=1
string MinMax="0~~99999"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_range2 from editmask within w_rep_diario_invoices_beneficiario_rango
int X=1838
int Y=24
int Width=393
int Height=100
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="######"
boolean Spin=true
double Increment=1
string MinMax="0~~99999"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;return
end event

type st_5 from statictext within w_rep_diario_invoices_beneficiario_rango
int X=2245
int Y=40
int Width=233
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Agent :"
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

type em_branch from editmask within w_rep_diario_invoices_beneficiario_rango
int X=2478
int Y=24
int Width=398
int Height=100
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="!!!!!!!!!!!!!!!!!"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Date		ld_fecha1, ld_fecha2


ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)


dw_1.reset()

dw_1.retrieve(Double(em_range1.text),Double(em_range2.text),em_branch.text)

dw_1.setfocus()
end event

