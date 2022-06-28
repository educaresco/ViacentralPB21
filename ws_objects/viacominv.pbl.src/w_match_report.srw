$PBExportHeader$w_match_report.srw
forward
global type w_match_report from wb_report
end type
type st_1 from statictext within w_match_report
end type
type sle_1 from singlelineedit within w_match_report
end type
end forward

global type w_match_report from wb_report
int Width=2853
int Height=1632
st_1 st_1
sle_1 sle_1
end type
global w_match_report w_match_report

on w_match_report.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_1
end on

on w_match_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.sle_1)
end on

type dw_1 from wb_report`dw_1 within w_match_report
int Y=136
int Width=2779
int Height=1292
boolean BringToTop=true
string DataObject="dw_match_report"
boolean HScrollBar=false
boolean HSplitScroll=false
end type

event dw_1::constructor;SetTransObject(SQLCA)
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type st_1 from statictext within w_match_report
int X=14
int Y=36
int Width=283
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Name :"
Alignment Alignment=Right!
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

type sle_1 from singlelineedit within w_match_report
int X=306
int Y=32
int Width=2469
int Height=92
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;dw_1.retrieve('%'+sle_1.text+'%')
end event

