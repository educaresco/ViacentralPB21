$PBExportHeader$w_message_received.srw
forward
global type w_message_received from wb_response
end type
type st_1 from statictext within w_message_received
end type
type st_2 from statictext within w_message_received
end type
type st_3 from statictext within w_message_received
end type
type gb_1 from groupbox within w_message_received
end type
type em_porpagar from editmask within w_message_received
end type
type em_pagados from editmask within w_message_received
end type
type cb_reclamos from commandbutton within w_message_received
end type
type cb_pagos from commandbutton within w_message_received
end type
type cb_porpagar from commandbutton within w_message_received
end type
end forward

global type w_message_received from wb_response
int Width=1138
int Height=548
boolean Visible=false
boolean TitleBar=true
string Title="Message Received"
long BackColor=80269524
st_1 st_1
st_2 st_2
st_3 st_3
gb_1 gb_1
em_porpagar em_porpagar
em_pagados em_pagados
cb_reclamos cb_reclamos
cb_pagos cb_pagos
cb_porpagar cb_porpagar
end type
global w_message_received w_message_received

on w_message_received.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.gb_1=create gb_1
this.em_porpagar=create em_porpagar
this.em_pagados=create em_pagados
this.cb_reclamos=create cb_reclamos
this.cb_pagos=create cb_pagos
this.cb_porpagar=create cb_porpagar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.em_porpagar
this.Control[iCurrent+6]=this.em_pagados
this.Control[iCurrent+7]=this.cb_reclamos
this.Control[iCurrent+8]=this.cb_pagos
this.Control[iCurrent+9]=this.cb_porpagar
end on

on w_message_received.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.gb_1)
destroy(this.em_porpagar)
destroy(this.em_pagados)
destroy(this.cb_reclamos)
destroy(this.cb_pagos)
destroy(this.cb_porpagar)
end on

event open;call super::open;long		ll_reclamos, ll_porpagar ,ll_pagados 
string	ls_branch

X=1
Y=1
Show()


  SELECT Count(*)  
    INTO :ll_reclamos  
    FROM dba.costumer_service costumer_service 
   WHERE costumer_service.flag_costumer_service <> 'P'   ;


//	ls_branch = fn_branch_instalacion()

  SELECT Count(*)  
    INTO :ll_porpagar  
    FROM dba.receiver receiver,   
         dba.branch_instalacion branch_instalacion 
   WHERE ( receiver.id_branch <> branch_instalacion.id_branch ) and 
			( receiver.branch_pay_receiver = branch_instalacion.id_branch ) and 
         ( ( receiver.id_flag_receiver = 'T' ) )   ;
			
			
			
	SELECT Count(*)  
    INTO :ll_pagados  
    FROM dba.pago_invoice pago_invoice 
   WHERE pago_invoice.date_pago_invoice = today()   ;
		
			

cb_reclamos.text = string(ll_reclamos)
cb_porpagar.text = string(ll_porpagar)
em_pagados.text = string(ll_pagados)
cb_pagos.text = string(ll_pagados)


end event

type st_1 from statictext within w_message_received
int X=91
int Y=92
int Width=594
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Investigations  :"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_message_received
int X=91
int Y=200
int Width=599
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Invoices to Pay  :"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_message_received
int X=91
int Y=312
int Width=599
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Invoices Paid  :"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_message_received
int X=32
int Y=24
int Width=1051
int Height=404
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_porpagar from editmask within w_message_received
int X=1102
int Y=296
int Width=247
int Height=100
int TabOrder=50
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_pagados from editmask within w_message_received
int X=1102
int Y=400
int Width=247
int Height=100
int TabOrder=60
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_reclamos from commandbutton within w_message_received
int X=736
int Y=80
int Width=247
int Height=100
int TabOrder=40
boolean BringToTop=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Open(w_message_received_reclamos)
end event

type cb_pagos from commandbutton within w_message_received
int X=736
int Y=300
int Width=247
int Height=100
int TabOrder=20
boolean BringToTop=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Open(w_message_received_pagos)
end event

type cb_porpagar from commandbutton within w_message_received
int X=736
int Y=188
int Width=247
int Height=100
int TabOrder=30
boolean BringToTop=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Open(w_message_porpagar)
end event

