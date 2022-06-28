$PBExportHeader$w_mapa_agencia.srw
forward
global type w_mapa_agencia from wb_response
end type
type dw_1 from datawindow within w_mapa_agencia
end type
end forward

global type w_mapa_agencia from wb_response
int X=5
int Y=4
int Width=3657
int Height=2400
boolean Visible=false
boolean TitleBar=true
string Title="Map Agency"
long BackColor=80269524
WindowState WindowState=maximized!
dw_1 dw_1
end type
global w_mapa_agencia w_mapa_agencia

on w_mapa_agencia.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_mapa_agencia.destroy
call super::destroy
destroy(this.dw_1)
end on

event open;call super::open;X=1
Y=1
Show()




dw_1.settransobject(sqlca)

string 	ls_branch

ls_branch = message.stringparm

dw_1.retrieve(ls_branch)
end event

type dw_1 from datawindow within w_mapa_agencia
int Width=3621
int Height=2276
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_mapa_agencia"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

