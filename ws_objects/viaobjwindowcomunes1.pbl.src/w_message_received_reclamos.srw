$PBExportHeader$w_message_received_reclamos.srw
forward
global type w_message_received_reclamos from wb_response
end type
type p_1 from picture within w_message_received_reclamos
end type
type dw_1 from datawindow within w_message_received_reclamos
end type
type cb_1 from commandbutton within w_message_received_reclamos
end type
type cb_2 from commandbutton within w_message_received_reclamos
end type
end forward

global type w_message_received_reclamos from wb_response
int X=613
int Y=368
int Width=2903
int Height=1372
boolean TitleBar=true
string Title="Message Received"
long BackColor=80269524
boolean ControlMenu=false
p_1 p_1
dw_1 dw_1
cb_1 cb_1
cb_2 cb_2
end type
global w_message_received_reclamos w_message_received_reclamos

on w_message_received_reclamos.create
int iCurrent
call super::create
this.p_1=create p_1
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_2
end on

on w_message_received_reclamos.destroy
call super::destroy
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;long		ll_reclamos


//X=1
//Y=1
//Show()

Close(w_message_received)
dw_1.settransobject(sqlca)



if dw_1.retrieve() = 0 then
	Close(w_message_received_reclamos)
end if

end event

type p_1 from picture within w_message_received_reclamos
int Width=457
int Height=176
boolean BringToTop=true
string PictureName="c:\costamarmt\logo.bmp"
boolean FocusRectangle=false
end type

type dw_1 from datawindow within w_message_received_reclamos
int X=27
int Y=180
int Width=2811
int Height=1088
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_messages_received_reclamos"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event clicked;dw_1.setitem(row,"flag_costumer_service",'P')
end event

type cb_1 from commandbutton within w_message_received_reclamos
int X=2085
int Y=28
int Width=745
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="&Exit"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.update()

Close(w_message_received_reclamos)
end event

type cb_2 from commandbutton within w_message_received_reclamos
int X=1746
int Y=28
int Width=329
int Height=108
int TabOrder=30
boolean BringToTop=true
string Text="Print"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if dw_1.rowcount() = 0 then return

printsetup()



dw_1.print()
end event

