$PBExportHeader$w_control_pines.srw
forward
global type w_control_pines from Window
end type
type cb_1 from commandbutton within w_control_pines
end type
type sle_3 from singlelineedit within w_control_pines
end type
type st_6 from statictext within w_control_pines
end type
type st_5 from statictext within w_control_pines
end type
type st_4 from statictext within w_control_pines
end type
type sle_2 from singlelineedit within w_control_pines
end type
type sle_1 from singlelineedit within w_control_pines
end type
type em_2 from editmask within w_control_pines
end type
type em_1 from editmask within w_control_pines
end type
type st_3 from statictext within w_control_pines
end type
type st_2 from statictext within w_control_pines
end type
type st_1 from statictext within w_control_pines
end type
type dw_1 from datawindow within w_control_pines
end type
end forward

global type w_control_pines from Window
int X=823
int Y=360
int Width=2039
int Height=1336
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cb_1 cb_1
sle_3 sle_3
st_6 st_6
st_5 st_5
st_4 st_4
sle_2 sle_2
sle_1 sle_1
em_2 em_2
em_1 em_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_1 dw_1
end type
global w_control_pines w_control_pines

event open;em_1.text = string(today())
em_2.text = string(today())
end event

on w_control_pines.create
this.cb_1=create cb_1
this.sle_3=create sle_3
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.sle_2=create sle_2
this.sle_1=create sle_1
this.em_2=create em_2
this.em_1=create em_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.sle_3,&
this.st_6,&
this.st_5,&
this.st_4,&
this.sle_2,&
this.sle_1,&
this.em_2,&
this.em_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_1}
end on

on w_control_pines.destroy
destroy(this.cb_1)
destroy(this.sle_3)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_control_pines
int X=37
int Y=1084
int Width=992
int Height=76
int TabOrder=40
string Text="Save As"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.saveas()
end event

type sle_3 from singlelineedit within w_control_pines
int X=1518
int Y=892
int Width=439
int Height=76
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
long BackColor=80269524
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_6 from statictext within w_control_pines
int X=1074
int Y=892
int Width=247
int Height=76
boolean Enabled=false
string Text="Total"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_5 from statictext within w_control_pines
int X=1079
int Y=732
int Width=334
int Height=76
boolean Enabled=false
string Text="Cost Per Pin"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_control_pines
int X=1074
int Y=564
int Width=384
int Height=76
boolean Enabled=false
string Text="Total Pin Used"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_2 from singlelineedit within w_control_pines
int X=1518
int Y=732
int Width=247
int Height=76
int TabOrder=30
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

event losefocus;sle_3.text = string(double(sle_1.text) * double(sle_2.text))
end event

type sle_1 from singlelineedit within w_control_pines
int X=1522
int Y=564
int Width=247
int Height=76
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
long BackColor=80269524
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_2 from editmask within w_control_pines
int X=1454
int Y=364
int Width=352
int Height=76
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;dw_1.SetTransObject(SQLCA)

sle_1.text = string(dw_1.retrieve(date(em_1.text),RelativeDate(date(em_2.text),1)))
end event

type em_1 from editmask within w_control_pines
int X=1454
int Y=244
int Width=352
int Height=76
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_control_pines
int X=1097
int Y=364
int Width=247
int Height=76
boolean Enabled=false
string Text="To"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_control_pines
int X=1097
int Y=244
int Width=247
int Height=76
boolean Enabled=false
string Text="From"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_control_pines
int X=1294
int Y=28
int Width=407
int Height=100
boolean Enabled=false
string Text="Pin Used"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-14
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_1 from datawindow within w_control_pines
int X=37
int Y=28
int Width=992
int Height=1036
string DataObject="dw_control_pines"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

