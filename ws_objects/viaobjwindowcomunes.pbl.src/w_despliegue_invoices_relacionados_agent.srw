$PBExportHeader$w_despliegue_invoices_relacionados_agent.srw
forward
global type w_despliegue_invoices_relacionados_agent from Window
end type
type cb_print from commandbutton within w_despliegue_invoices_relacionados_agent
end type
type cb_1 from commandbutton within w_despliegue_invoices_relacionados_agent
end type
type dw_1 from u_dw within w_despliegue_invoices_relacionados_agent
end type
end forward

global type w_despliegue_invoices_relacionados_agent from Window
int X=73
int Y=48
int Width=3721
int Height=1920
boolean Visible=false
boolean TitleBar=true
string Title="Selecting Type "
long BackColor=80269524
boolean ControlMenu=true
WindowState WindowState=maximized!
WindowType WindowType=response!
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
end type
global w_despliegue_invoices_relacionados_agent w_despliegue_invoices_relacionados_agent

type variables
Double  	id_reference
end variables

event open;X=1
Y=1
Show()

dw_1.settransobject(sqlca)
id_reference = Message.DoubleParm	

dw_1.retrieve(id_reference)



end event

on w_despliegue_invoices_relacionados_agent.create
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_print,&
this.cb_1,&
this.dw_1}
end on

on w_despliegue_invoices_relacionados_agent.destroy
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_print from commandbutton within w_despliegue_invoices_relacionados_agent
int X=1349
int Y=1724
int Width=466
int Height=60
int TabOrder=20
string Text="&Print"
boolean Cancel=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Printsetup()
dw_1.print()
end event

type cb_1 from commandbutton within w_despliegue_invoices_relacionados_agent
int X=1947
int Y=1724
int Width=466
int Height=60
int TabOrder=30
string Text="Close"
boolean Cancel=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close(w_despliegue_invoices_relacionados_agent)
end event

type dw_1 from u_dw within w_despliegue_invoices_relacionados_agent
int X=9
int Y=0
int Width=3680
int Height=1672
int TabOrder=10
string DataObject="dw_despliegue_invoices_pagados_agente"
boolean HScrollBar=true
end type

event clicked;return 0
end event

