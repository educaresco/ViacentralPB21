$PBExportHeader$w_despliegue_transacciones_detalle_td_ag.srw
forward
global type w_despliegue_transacciones_detalle_td_ag from Window
end type
type cb_print from commandbutton within w_despliegue_transacciones_detalle_td_ag
end type
type cb_1 from commandbutton within w_despliegue_transacciones_detalle_td_ag
end type
type dw_1 from u_dw within w_despliegue_transacciones_detalle_td_ag
end type
end forward

global type w_despliegue_transacciones_detalle_td_ag from Window
int X=37
int Y=4
int Width=3593
int Height=2272
boolean TitleBar=true
string Title="AGENT ACCOUNT"
long BackColor=80269524
boolean ControlMenu=true
WindowType WindowType=response!
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
end type
global w_despliegue_transacciones_detalle_td_ag w_despliegue_transacciones_detalle_td_ag

type variables
Double  	id_reference
end variables

event open;X=1
Y=1
Show()

dw_1.settransobject(sqlca)
dw_1.retrieve(gd_contable) 

end event

on w_despliegue_transacciones_detalle_td_ag.create
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_print,&
this.cb_1,&
this.dw_1}
end on

on w_despliegue_transacciones_detalle_td_ag.destroy
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_print from commandbutton within w_despliegue_transacciones_detalle_td_ag
int X=1349
int Y=2076
int Width=347
int Height=72
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

type cb_1 from commandbutton within w_despliegue_transacciones_detalle_td_ag
int X=1829
int Y=2076
int Width=347
int Height=72
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

event clicked;Close(PARENT)
end event

type dw_1 from u_dw within w_despliegue_transacciones_detalle_td_ag
int X=0
int Y=0
int Width=3598
int Height=2032
int TabOrder=10
string DataObject="dw_despliegue_transsacciones_esp_agente1"
boolean HScrollBar=true
end type

event clicked;return 0
end event

