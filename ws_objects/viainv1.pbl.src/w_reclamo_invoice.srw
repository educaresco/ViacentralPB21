$PBExportHeader$w_reclamo_invoice.srw
forward
global type w_reclamo_invoice from Window
end type
type sle_nombre_beneficiario from u_sle within w_reclamo_invoice
end type
type cb_1 from commandbutton within w_reclamo_invoice
end type
type dw_1 from datawindow within w_reclamo_invoice
end type
type cb_seleccionar from commandbutton within w_reclamo_invoice
end type
type cb_registrar from commandbutton within w_reclamo_invoice
end type
type cb_procesar from commandbutton within w_reclamo_invoice
end type
type dw_busca_invoice from datawindow within w_reclamo_invoice
end type
type st_1 from statictext within w_reclamo_invoice
end type
type dw_datos_invoice from datawindow within w_reclamo_invoice
end type
type gb_1 from groupbox within w_reclamo_invoice
end type
end forward

global type w_reclamo_invoice from Window
int X=379
int Y=84
int Width=2958
int Height=1688
boolean Visible=false
boolean TitleBar=true
string Title="Investigation"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
sle_nombre_beneficiario sle_nombre_beneficiario
cb_1 cb_1
dw_1 dw_1
cb_seleccionar cb_seleccionar
cb_registrar cb_registrar
cb_procesar cb_procesar
dw_busca_invoice dw_busca_invoice
st_1 st_1
dw_datos_invoice dw_datos_invoice
gb_1 gb_1
end type
global w_reclamo_invoice w_reclamo_invoice

type variables
string	is_branch
double	id_sender, id_receiver

end variables

on w_reclamo_invoice.create
this.sle_nombre_beneficiario=create sle_nombre_beneficiario
this.cb_1=create cb_1
this.dw_1=create dw_1
this.cb_seleccionar=create cb_seleccionar
this.cb_registrar=create cb_registrar
this.cb_procesar=create cb_procesar
this.dw_busca_invoice=create dw_busca_invoice
this.st_1=create st_1
this.dw_datos_invoice=create dw_datos_invoice
this.gb_1=create gb_1
this.Control[]={this.sle_nombre_beneficiario,&
this.cb_1,&
this.dw_1,&
this.cb_seleccionar,&
this.cb_registrar,&
this.cb_procesar,&
this.dw_busca_invoice,&
this.st_1,&
this.dw_datos_invoice,&
this.gb_1}
end on

on w_reclamo_invoice.destroy
destroy(this.sle_nombre_beneficiario)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.cb_seleccionar)
destroy(this.cb_registrar)
destroy(this.cb_procesar)
destroy(this.dw_busca_invoice)
destroy(this.st_1)
destroy(this.dw_datos_invoice)
destroy(this.gb_1)
end on

event open;X=1
Y=1
Show()


dw_busca_invoice.settransobject(Sqlca)
dw_datos_invoice.settransobject(Sqlca)
dw_1.settransobject(Sqlca)
sle_nombre_beneficiario.setfocus()



end event

type sle_nombre_beneficiario from u_sle within w_reclamo_invoice
int X=800
int Y=12
int Width=1079
int Height=92
int TabOrder=10
TextCase TextCase=Upper!
end type

event modified;string	ls_nombre

ls_nombre = "%"+sle_nombre_beneficiario.text+"%"

dw_busca_invoice.retrieve(ls_nombre) 
end event

type cb_1 from commandbutton within w_reclamo_invoice
int X=2318
int Y=988
int Width=343
int Height=84
int TabOrder=50
string Text="&Add"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long		ll_row

ll_row = dw_busca_invoice.GetSelectedRow(0)
if ll_row = 0 then
	dw_busca_invoice.SelectRow(0, FALSE)
	return
else
	
end if
id_sender = dw_busca_invoice.getitemnumber(ll_row,"id_sender")
is_branch = dw_busca_invoice.getitemstring(ll_row,"id_branch")
id_receiver = dw_busca_invoice.getitemnumber(ll_row,"id_receiver")


If ((id_sender <> 0) And (id_receiver <> 0)) Then
	If dw_datos_invoice.retrieve(id_sender,is_branch,id_receiver) <> 0 Then
		dw_1.retrieve(id_sender,is_branch,id_receiver)
		ll_row = dw_1.insertrow(0)
		dw_1.setitem(ll_row,"id_sender",id_sender)
		dw_1.setitem(ll_row,"id_branch",is_branch)
		dw_1.setitem(ll_row,"id_receiver",id_receiver)
		dw_1.setitem(ll_row,"id_cashier",gs_cashier)
		dw_1.ScrollToRow(ll_row)
		dw_1.setfocus()
		
	else
		dw_datos_invoice.reset()
	end if
else
	
end if
end event

type dw_1 from datawindow within w_reclamo_invoice
int X=18
int Y=1208
int Width=2738
int Height=348
string DataObject="dw_ingreso_reclamos_vertical"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_seleccionar from commandbutton within w_reclamo_invoice
int X=2318
int Y=896
int Width=343
int Height=84
int TabOrder=60
string Text="&Select"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long		ll_row

ll_row = dw_busca_invoice.GetSelectedRow(0)
if ll_row = 0 then
	dw_busca_invoice.SelectRow(0, FALSE)
	return
else
	
end if
id_sender = dw_busca_invoice.getitemnumber(ll_row,"id_sender")
is_branch = dw_busca_invoice.getitemstring(ll_row,"id_branch")
id_receiver = dw_busca_invoice.getitemnumber(ll_row,"id_receiver")


If ((id_sender <> 0) And (id_receiver <> 0)) Then
	If dw_datos_invoice.retrieve(id_sender,is_branch,id_receiver) <> 0 Then
		dw_1.retrieve(id_sender,is_branch,id_receiver)
		dw_1.setfocus()
		
	else
		dw_datos_invoice.reset()
	end if
else
	
end if

end event

type cb_registrar from commandbutton within w_reclamo_invoice
int X=2318
int Y=1080
int Width=343
int Height=84
int TabOrder=40
string Text="&Register"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//if Messagebox("Atencion","Esta seguro que desea registrar el Reclamo de Este Invoice ",Question!,YesNo!) = 2 then
If Messagebox("Atention","Are you sure of register the Complain of this invoice?",Question!,YesNo!) = 2 then
	return
end if

dw_1.accepttext()
dw_1.update()

if  sqlca.sqlcode <> 0 Then
//	Messagebox("Error","Error de Actualizacion")
	Messagebox("Error","Updating Error",StopSign!)
else

end if
end event

type cb_procesar from commandbutton within w_reclamo_invoice
int X=1888
int Y=12
int Width=311
int Height=92
int TabOrder=20
string Text="&Process"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string	ls_nombre

dw_datos_invoice.reset()

ls_nombre = "%"+sle_nombre_beneficiario.text+"%"

if dw_busca_invoice.retrieve(ls_nombre) = 0 Then
//	messagebox("","El Beneficiario no tiene invoices pendientes")
	messagebox("Atention","Receiver doesn't have pending invoices.")
	Return
end if
end event

type dw_busca_invoice from datawindow within w_reclamo_invoice
int X=14
int Y=108
int Width=2880
int Height=320
int TabOrder=30
string DataObject="dw_seleccionar_invoice_para_reclamo1"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event clicked;if dw_busca_invoice.GetClickedRow ( ) = 1 then
	dw_busca_invoice.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	return
elseif dw_busca_invoice.GetClickedRow ( ) = 0 then
	dw_busca_invoice.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
end if

end event

event doubleclicked;cb_seleccionar.triggerevent(clicked!)
end event

type st_1 from statictext within w_reclamo_invoice
int X=370
int Y=28
int Width=421
int Height=56
boolean Enabled=false
string Text="Receiver Name :"
Alignment Alignment=Right!
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

type dw_datos_invoice from datawindow within w_reclamo_invoice
int Y=444
int Width=2272
int Height=768
string DataObject="dw_display_invoice"
boolean Border=false
boolean LiveScroll=true
end type

type gb_1 from groupbox within w_reclamo_invoice
int X=2281
int Y=844
int Width=416
int Height=348
BorderStyle BorderStyle=StyleRaised!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

