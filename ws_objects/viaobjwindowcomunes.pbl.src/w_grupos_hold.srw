$PBExportHeader$w_grupos_hold.srw
forward
global type w_grupos_hold from wb_response
end type
type dw_1 from datawindow within w_grupos_hold
end type
type cb_1 from commandbutton within w_grupos_hold
end type
type cb_2 from commandbutton within w_grupos_hold
end type
type cb_3 from commandbutton within w_grupos_hold
end type
type cb_4 from commandbutton within w_grupos_hold
end type
type cb_5 from commandbutton within w_grupos_hold
end type
end forward

global type w_grupos_hold from wb_response
int X=206
int Y=12
int Width=3310
int Height=1812
long BackColor=80269524
dw_1 dw_1
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
end type
global w_grupos_hold w_grupos_hold

on w_grupos_hold.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_4
this.Control[iCurrent+6]=this.cb_5
end on

on w_grupos_hold.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
end on

event open;call super::open;dw_1.settransobject(sqlca)

dw_1.retrieve()
end event

type dw_1 from datawindow within w_grupos_hold
int Width=3282
int Height=1568
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_grupos_hold"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type cb_1 from commandbutton within w_grupos_hold
int X=50
int Y=1592
int Width=462
int Height=88
int TabOrder=20
boolean BringToTop=true
string Text="Oparation"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
string DWfilter2

DWfilter2 = "type_motivo_hold = '20' or type_motivo_hold = '60' "
dw_1.SetFilter(DWfilter2)
dw_1.Filter( )

 
 

end event

type cb_2 from commandbutton within w_grupos_hold
int X=521
int Y=1592
int Width=393
int Height=88
int TabOrder=30
boolean BringToTop=true
string Text="Account"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
string DWfilter2

DWfilter2 = "type_motivo_hold = '50'"
dw_1.SetFilter(DWfilter2)
dw_1.Filter( )

 
 

end event

type cb_3 from commandbutton within w_grupos_hold
int X=933
int Y=1592
int Width=393
int Height=88
int TabOrder=50
boolean BringToTop=true
string Text="All"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
string DWfilter2

DWfilter2 = "type_motivo_hold <> '99999'"
dw_1.SetFilter(DWfilter2)
dw_1.Filter( )

 
 

end event

type cb_4 from commandbutton within w_grupos_hold
int X=1330
int Y=1592
int Width=462
int Height=88
int TabOrder=40
boolean BringToTop=true
string Text="Com"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
string DWfilter2

DWfilter2 = "type_motivo_hold <> '20' and type_motivo_hold <> '60' and type_motivo_hold <> '50'"
dw_1.SetFilter(DWfilter2)
dw_1.Filter( )

 
 

end event

type cb_5 from commandbutton within w_grupos_hold
int X=1952
int Y=1592
int Width=434
int Height=88
int TabOrder=40
boolean BringToTop=true
string Text="&Print"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Printsetup()

dw_1.print()
end event

