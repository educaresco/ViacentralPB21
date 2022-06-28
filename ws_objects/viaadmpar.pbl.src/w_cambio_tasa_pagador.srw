$PBExportHeader$w_cambio_tasa_pagador.srw
forward
global type w_cambio_tasa_pagador from wb_response
end type
type em_1 from editmask within w_cambio_tasa_pagador
end type
type cb_close from commandbutton within w_cambio_tasa_pagador
end type
type cb_aplicar from commandbutton within w_cambio_tasa_pagador
end type
type st_1 from statictext within w_cambio_tasa_pagador
end type
type st_2 from statictext within w_cambio_tasa_pagador
end type
type em_2 from editmask within w_cambio_tasa_pagador
end type
end forward

global type w_cambio_tasa_pagador from wb_response
int X=951
int Y=524
int Width=1179
int Height=464
boolean TitleBar=true
string Title="Change Rate by Payee"
long BackColor=80269524
boolean ControlMenu=false
em_1 em_1
cb_close cb_close
cb_aplicar cb_aplicar
st_1 st_1
st_2 st_2
em_2 em_2
end type
global w_cambio_tasa_pagador w_cambio_tasa_pagador

type variables
string	is_group
end variables

on w_cambio_tasa_pagador.create
int iCurrent
call super::create
this.em_1=create em_1
this.cb_close=create cb_close
this.cb_aplicar=create cb_aplicar
this.st_1=create st_1
this.st_2=create st_2
this.em_2=create em_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_aplicar
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.em_2
end on

on w_cambio_tasa_pagador.destroy
call super::destroy
destroy(this.em_1)
destroy(this.cb_close)
destroy(this.cb_aplicar)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_2)
end on

event open;call super::open;string	ls_grupo, ls_name


ls_grupo = message.stringparm
is_group = ls_grupo


  SELECT dba.group_branch.name_main_branch  
    INTO :ls_name  
    FROM dba.group_branch  
   WHERE dba.group_branch.id_main_branch = :ls_grupo   ;
	
	st_1.text = "New rate of "+ls_name



end event

type em_1 from editmask within w_cambio_tasa_pagador
int X=855
int Y=12
int Width=270
int Height=88
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_close from commandbutton within w_cambio_tasa_pagador
int X=599
int Y=228
int Width=425
int Height=108
int TabOrder=40
boolean BringToTop=true
string Text="&Close"
boolean Cancel=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;closewithreturn(w_cambio_tasa_pagador,0)
end event

type cb_aplicar from commandbutton within w_cambio_tasa_pagador
int X=155
int Y=228
int Width=425
int Height=108
int TabOrder=30
boolean BringToTop=true
string Text="&Apply"
boolean Default=true
boolean Cancel=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;double	ld_rate = 0	,		&
			ld_internal_rate = 0

ld_rate = Double(em_1.text)

if ld_rate <> 0 then
	
	ld_internal_rate = Double(em_2.text)
	
	if ld_internal_rate <> 0 then
			
//			messagebox("Internal Rate",string(ld_internal_rate))
		
		  	UPDATE dba.group_branch  
     		SET dba.group_branch.diference_exchange = :ld_internal_rate  
   		WHERE dba.group_branch.id_main_branch = :is_group   ;
			
			if sqlca.sqlcode = 0 then
				commit ;
			else
				Messagebox("Error","Error actualizando el rate Interno")
				ld_rate = 0
			end if
	end if
end if


closewithreturn(w_cambio_tasa_pagador,ld_rate)
end event

type st_1 from statictext within w_cambio_tasa_pagador
int Y=4
int Width=855
int Height=116
boolean Enabled=false
boolean BringToTop=true
boolean FocusRectangle=false
long TextColor=255
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_cambio_tasa_pagador
int X=526
int Y=132
int Width=311
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Internal Rate :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=255
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_2 from editmask within w_cambio_tasa_pagador
int X=855
int Y=116
int Width=270
int Height=88
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="###,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

