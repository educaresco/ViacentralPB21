$PBExportHeader$w_agent_commission_report.srw
forward
global type w_agent_commission_report from wb_report
end type
type st_1 from statictext within w_agent_commission_report
end type
type st_2 from statictext within w_agent_commission_report
end type
type sle_year from singlelineedit within w_agent_commission_report
end type
type cbx_1 from checkbox within w_agent_commission_report
end type
type cbx_2 from checkbox within w_agent_commission_report
end type
type dw_2 from datawindow within w_agent_commission_report
end type
type cb_1 from commandbutton within w_agent_commission_report
end type
end forward

global type w_agent_commission_report from wb_report
int Width=3474
st_1 st_1
st_2 st_2
sle_year sle_year
cbx_1 cbx_1
cbx_2 cbx_2
dw_2 dw_2
cb_1 cb_1
end type
global w_agent_commission_report w_agent_commission_report

event open;call super::open;sle_year.text = string(YEAR(TODAY()))
end event

on w_agent_commission_report.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.sle_year=create sle_year
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.dw_2=create dw_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.sle_year
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.dw_2
this.Control[iCurrent+7]=this.cb_1
end on

on w_agent_commission_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_year)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.dw_2)
destroy(this.cb_1)
end on

type dw_1 from wb_report`dw_1 within w_agent_commission_report
int Y=204
int Width=3410
int Height=1300
boolean BringToTop=true
string DataObject="dw_agente_ventas"
end type

event dw_1::constructor;SetTransObject(SQLCA)

of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type st_1 from statictext within w_agent_commission_report
int X=37
int Y=24
int Width=1403
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="AGENT COMMISSION REPORT"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-14
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_agent_commission_report
int X=1975
int Y=32
int Width=247
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="YEAR"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_year from singlelineedit within w_agent_commission_report
int X=2249
int Y=32
int Width=247
int Height=88
int TabOrder=20
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;if cbx_2.checked = true then
	dw_1.retrieve(double(sle_year.text))
Else
	dw_2.retrieve(double(sle_year.text))
End If
end event

type cbx_1 from checkbox within w_agent_commission_report
int X=1481
int Y=24
int Width=425
int Height=76
boolean BringToTop=true
string Text="By Group"
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

event clicked;dw_1.visible = False
dw_2.visible = True
cbx_2.checked = false

end event

type cbx_2 from checkbox within w_agent_commission_report
int X=1481
int Y=112
int Width=425
int Height=76
boolean BringToTop=true
string Text="By Branch"
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

event clicked;dw_1.visible = True	
dw_2.visible = False
cbx_1.checked = false
end event

type dw_2 from datawindow within w_agent_commission_report
int Y=204
int Width=3410
int Height=1300
int TabOrder=30
boolean BringToTop=true
string DataObject="dw_agente_ventas_bygroup"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_1 from commandbutton within w_agent_commission_report
int X=2962
int Y=20
int Width=443
int Height=164
int TabOrder=30
boolean BringToTop=true
string Text="Print"
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;If Messagebox("Verificar","Esta seguro que desea Imprimir ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()

if cbx_1.checked = True Then
	dw_2.print()
Else
	dw_1.print()
End if

end event

