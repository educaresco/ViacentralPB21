$PBExportHeader$w_message_received_pagos.srw
forward
global type w_message_received_pagos from wb_response
end type
type p_1 from picture within w_message_received_pagos
end type
type dw_1 from datawindow within w_message_received_pagos
end type
type cb_1 from commandbutton within w_message_received_pagos
end type
end forward

global type w_message_received_pagos from wb_response
int X=613
int Y=368
int Width=2505
int Height=1372
boolean TitleBar=true
string Title="Invoices Paid"
long BackColor=80269528
boolean ControlMenu=false
p_1 p_1
dw_1 dw_1
cb_1 cb_1
end type
global w_message_received_pagos w_message_received_pagos

on w_message_received_pagos.create
int iCurrent
call super::create
this.p_1=create p_1
this.dw_1=create dw_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_1
end on

on w_message_received_pagos.destroy
call super::destroy
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;call super::open;long		ll_reclamos


//X=1
//Y=1
//Show()

Close(w_message_received)
dw_1.settransobject(sqlca)



if dw_1.retrieve(today()) = 0 then
	close(w_message_received_pagos)
end if



end event

type p_1 from picture within w_message_received_pagos
int Width=430
int Height=180
boolean BringToTop=true
string PictureName="c:\costamarmt\logo.bmp"
boolean FocusRectangle=false
end type

type dw_1 from datawindow within w_message_received_pagos
int X=27
int Y=180
int Width=2441
int Height=1088
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_messages_received_pagos"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event clicked;//dw_1.setitem(row,"flag_costumer_service",'P')
end event

type cb_1 from commandbutton within w_message_received_pagos
int X=1765
int Y=28
int Width=686
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="&Salir"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close(w_message_received_pagos)
end event

