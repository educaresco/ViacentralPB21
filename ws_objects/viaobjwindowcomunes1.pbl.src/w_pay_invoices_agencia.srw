$PBExportHeader$w_pay_invoices_agencia.srw
forward
global type w_pay_invoices_agencia from Window
end type
type cb_2 from commandbutton within w_pay_invoices_agencia
end type
type dw_2 from datawindow within w_pay_invoices_agencia
end type
type cb_1 from commandbutton within w_pay_invoices_agencia
end type
type dw_1 from datawindow within w_pay_invoices_agencia
end type
end forward

global type w_pay_invoices_agencia from Window
int X=329
int Y=260
int Width=3081
int Height=1636
boolean TitleBar=true
string Title="Pay Invoices"
long BackColor=80269524
boolean ControlMenu=true
WindowType WindowType=response!
cb_2 cb_2
dw_2 dw_2
cb_1 cb_1
dw_1 dw_1
end type
global w_pay_invoices_agencia w_pay_invoices_agencia

on w_pay_invoices_agencia.create
this.cb_2=create cb_2
this.dw_2=create dw_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.dw_2,&
this.cb_1,&
this.dw_1}
end on

on w_pay_invoices_agencia.destroy
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;Double	ld_sender

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

dw_1.retrieve(gs_branch,gl_receiver_cons)


if dw_2.retrieve(gs_branch,gl_receiver_cons) = 0 then
	ld_sender = dw_1.getitemnumber(dw_1.getrow(),"id_sender")	
	
	
	dw_2.insertrow(0)
	dw_2.setitem(1,"id_branch",gs_branch)
	dw_2.setitem(1,"id_receiver",gl_receiver_cons)
	dw_2.setitem(1,"id_sender",ld_sender)

	
end if
end event

type cb_2 from commandbutton within w_pay_invoices_agencia
int X=2789
int Y=1392
int Width=247
int Height=108
int TabOrder=30
string Text="Print"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
printsetup()

dw_1.print()
end event

type dw_2 from datawindow within w_pay_invoices_agencia
int X=1294
int Y=1328
int Width=1266
int Height=204
int TabOrder=30
string DataObject="dw_pago_invoice_por_agencia"
boolean Border=false
boolean LiveScroll=true
end type

type cb_1 from commandbutton within w_pay_invoices_agencia
int X=2569
int Y=1392
int Width=215
int Height=108
int TabOrder=20
string Text="Pay "
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_2.Accepttext()

if dw_2.update() = 1 THEN
	
	 UPDATE dba.receiver  
     SET dba.receiver.id_flag_receiver = 'P'  
   WHERE ( dba.receiver.id_branch = :gs_branch ) AND  
         ( dba.receiver.id_receiver = :gl_receiver_cons )   ;

	
	
end if
commit ;
end event

type dw_1 from datawindow within w_pay_invoices_agencia
int X=9
int Width=2999
int Height=1304
int TabOrder=10
string DataObject="dw_pay_invoices_agencia"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

