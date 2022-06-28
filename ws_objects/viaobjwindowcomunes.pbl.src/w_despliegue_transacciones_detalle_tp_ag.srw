$PBExportHeader$w_despliegue_transacciones_detalle_tp_ag.srw
forward
global type w_despliegue_transacciones_detalle_tp_ag from Window
end type
type cb_print from commandbutton within w_despliegue_transacciones_detalle_tp_ag
end type
type cb_1 from commandbutton within w_despliegue_transacciones_detalle_tp_ag
end type
type dw_1 from u_dw within w_despliegue_transacciones_detalle_tp_ag
end type
end forward

global type w_despliegue_transacciones_detalle_tp_ag from Window
int X=27
int Y=112
int Width=3630
int Height=2280
boolean TitleBar=true
string Title="CLOSING PAYEE"
long BackColor=82042848
boolean ControlMenu=true
WindowType WindowType=response!
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
end type
global w_despliegue_transacciones_detalle_tp_ag w_despliegue_transacciones_detalle_tp_ag

type variables
Double  	id_reference
end variables

event open;X=1
Y=1
Show()

dw_1.settransobject(sqlca)
dw_1.retrieve(gd_contable) 

end event

on w_despliegue_transacciones_detalle_tp_ag.create
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_print,&
this.cb_1,&
this.dw_1}
end on

on w_despliegue_transacciones_detalle_tp_ag.destroy
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_print from commandbutton within w_despliegue_transacciones_detalle_tp_ag
int X=1362
int Y=2096
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

type cb_1 from commandbutton within w_despliegue_transacciones_detalle_tp_ag
int X=1842
int Y=2096
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

type dw_1 from u_dw within w_despliegue_transacciones_detalle_tp_ag
int X=0
int Y=0
int Width=3598
int Height=2056
int TabOrder=10
string DataObject="dw_despliegue_transsacciones_especifico1"
boolean HScrollBar=true
end type

event clicked;return 0
end event

