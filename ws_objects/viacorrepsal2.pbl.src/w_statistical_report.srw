$PBExportHeader$w_statistical_report.srw
forward
global type w_statistical_report from wb_report
end type
type st_1 from statictext within w_statistical_report
end type
type st_2 from statictext within w_statistical_report
end type
type st_3 from statictext within w_statistical_report
end type
type sle_mes1 from singlelineedit within w_statistical_report
end type
type sle_ano from singlelineedit within w_statistical_report
end type
type cbx_1 from checkbox within w_statistical_report
end type
type cbx_2 from checkbox within w_statistical_report
end type
type dw_2 from datawindow within w_statistical_report
end type
end forward

global type w_statistical_report from wb_report
int Width=3534
int Height=2180
boolean TitleBar=true
string Title="Statistical Report"
long BackColor=80269524
st_1 st_1
st_2 st_2
st_3 st_3
sle_mes1 sle_mes1
sle_ano sle_ano
cbx_1 cbx_1
cbx_2 cbx_2
dw_2 dw_2
end type
global w_statistical_report w_statistical_report

on w_statistical_report.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.sle_mes1=create sle_mes1
this.sle_ano=create sle_ano
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.dw_2=create dw_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.sle_mes1
this.Control[iCurrent+5]=this.sle_ano
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.cbx_2
this.Control[iCurrent+8]=this.dw_2
end on

on w_statistical_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.sle_mes1)
destroy(this.sle_ano)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.dw_2)
end on

event pfc_print;
If Messagebox("Verificar","Esta seguro que desea Imprimir ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()


if cbx_1.checked = true then

dw_1.print()
else
	dw_2.print()
end if



return 0
end event

type dw_1 from wb_report`dw_1 within w_statistical_report
int Y=248
int Width=3461
int Height=884
int TabOrder=30
boolean BringToTop=true
string DataObject="dw_statistical_report"
end type

event dw_1::constructor;SetTransObject(SQLCA)

of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type st_1 from statictext within w_statistical_report
int X=37
int Y=32
int Width=1321
int Height=140
boolean Enabled=false
boolean BringToTop=true
string Text="STATISTICAL REPORT"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-18
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_statistical_report
int X=2469
int Y=32
int Width=562
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Month (two numbers)"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_statistical_report
int X=2459
int Y=148
int Width=517
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Year (two numbers)"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_mes1 from singlelineedit within w_statistical_report
int X=3058
int Y=32
int Width=201
int Height=92
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_ano from singlelineedit within w_statistical_report
int X=3058
int Y=128
int Width=201
int Height=92
int TabOrder=20
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;IF cbx_1.checked = true then
	dw_2.visible = false
	dw_1.visible = true
   dw_1.retrieve(double(sle_mes1.text),double(sle_ano.text))
ELSE
	IF cbx_2.checked = true then
		dw_1.visible = false
		dw_2.visible = true
		dw_2.settransobject(sqlca)
      dw_2.retrieve(double(sle_mes1.text),double(sle_ano.text))
	end if
end if
end event

type cbx_1 from checkbox within w_statistical_report
int X=1545
int Y=40
int Width=375
int Height=76
boolean BringToTop=true
string Text="All"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;cbx_2.checked = false
end event

type cbx_2 from checkbox within w_statistical_report
int X=1545
int Y=136
int Width=375
int Height=76
boolean BringToTop=true
string Text="Mexico DF"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;cbx_1.checked = false
end event

type dw_2 from datawindow within w_statistical_report
int X=5
int Y=1164
int Width=3461
int Height=808
int TabOrder=30
boolean BringToTop=true
string DataObject="dw_statistical_report_mexicodf"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

