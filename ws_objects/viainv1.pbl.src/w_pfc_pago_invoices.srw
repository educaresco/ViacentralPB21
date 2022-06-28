$PBExportHeader$w_pfc_pago_invoices.srw
forward
global type w_pfc_pago_invoices from wb_response
end type
type dw_busca_invoice from datawindow within w_pfc_pago_invoices
end type
type sle_nombre_beneficiario from u_sle within w_pfc_pago_invoices
end type
type dw_datos_invoice from datawindow within w_pfc_pago_invoices
end type
type dw_pago_invoice from datawindow within w_pfc_pago_invoices
end type
type cb_seleccionar from commandbutton within w_pfc_pago_invoices
end type
end forward

global type w_pfc_pago_invoices from wb_response
int X=160
int Y=100
int Width=2981
int Height=1928
WindowType WindowType=main!
boolean Visible=false
boolean TitleBar=true
string Title="Confirmation"
string MenuName="m_pfc_pago_invoices"
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
event ue_nueva pbm_custom01
event ue_procesar pbm_custom02
event ue_comision pbm_custom03
event ue_registrar pbm_custom04
dw_busca_invoice dw_busca_invoice
sle_nombre_beneficiario sle_nombre_beneficiario
dw_datos_invoice dw_datos_invoice
dw_pago_invoice dw_pago_invoice
cb_seleccionar cb_seleccionar
end type
global w_pfc_pago_invoices w_pfc_pago_invoices

type variables
string	is_branch
double	id_sender, id_receiver

end variables

event ue_procesar;Commit ;
long		ll_row
dw_pago_invoice.reset()
dw_datos_invoice.reset()
sle_nombre_beneficiario.text = ""

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
		dw_pago_invoice.visible = True
		dw_datos_invoice.visible = True
		ll_row = dw_pago_invoice.insertrow(0)
		dw_pago_invoice.setitem(ll_row,"id_sender_pago_inv",id_sender)
		dw_pago_invoice.setitem(ll_row,"id_branch_pago_inv",is_branch)
		dw_pago_invoice.setitem(ll_row,"id_receiver_pago_inv",id_receiver)
		dw_pago_invoice.setitem(ll_row,"id_cashier_pago_inv",gs_cashier)
		dw_pago_invoice.accepttext()
		dw_pago_invoice.setfocus()
	else
		dw_datos_invoice.reset()
	end if
else
	
end if

end event

event ue_registrar;
if dw_busca_invoice.rowcount() = 0 then
//	Messagebox("Atencion","No tiene el listado de Beneficiarios para Pago Desplegado")
	Messagebox("Atention","You haven't displayed the receivers list.",Exclamation!)
	return
end if
if dw_datos_invoice.rowcount() = 0 then
//	Messagebox("Atencion","No tiene seleccionado el Beneficiario")
	Messagebox("Atention","You haven't selected the receiver.",Exclamation!)
	return
end if


//if Messagebox("Atencion","Esta seguro que desea registrar el Pago de Este Invoice ",Question!,YesNo!) = 2 then
if Messagebox("Atention","Are you sure of register the invoice payment?",Question!,YesNo!) = 2 then
	return
end if



dw_pago_invoice.accepttext()
dw_pago_invoice.update()

if  sqlca.sqlcode <> 0 Then
//	Messagebox("Error","Error de Actualizacion")
	Messagebox("Error","Error Updating.  The error is : "+SQLCA.SQLERRTEXT,StopSign!)
else
	UPDATE dba.receiver 
     SET dba.receiver.id_flag_receiver = 'P'  
   WHERE ( dba.receiver.id_sender = :id_sender ) AND  
         ( dba.receiver.id_branch = :is_branch ) AND  
         ( dba.receiver.id_receiver = :id_receiver )   ;

	If Sqlca.sqlcode <> 0 Then
//		Messagebox("Error Catastrofico","Avisar a Sistemas")
		Messagebox("Grave Error","Please, inform to the system administrator.  The error is : "+SQLCA.SQLERRTEXT,StopSign!)
		Rollback ;
		return
	end if

	dw_datos_invoice.reset()
	dw_datos_invoice.visible = False
	dw_busca_invoice.reset()
	dw_pago_invoice.reset()
	dw_pago_invoice.visible = False
end if
end event

on w_pfc_pago_invoices.create
int iCurrent
call super::create
if this.MenuName = "m_pfc_pago_invoices" then this.MenuID = create m_pfc_pago_invoices
this.dw_busca_invoice=create dw_busca_invoice
this.sle_nombre_beneficiario=create sle_nombre_beneficiario
this.dw_datos_invoice=create dw_datos_invoice
this.dw_pago_invoice=create dw_pago_invoice
this.cb_seleccionar=create cb_seleccionar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_busca_invoice
this.Control[iCurrent+2]=this.sle_nombre_beneficiario
this.Control[iCurrent+3]=this.dw_datos_invoice
this.Control[iCurrent+4]=this.dw_pago_invoice
this.Control[iCurrent+5]=this.cb_seleccionar
end on

on w_pfc_pago_invoices.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_busca_invoice)
destroy(this.sle_nombre_beneficiario)
destroy(this.dw_datos_invoice)
destroy(this.dw_pago_invoice)
destroy(this.cb_seleccionar)
end on

event open;call super::open;
X=1
Y=1
Show()

dw_busca_invoice.settransobject(Sqlca)
dw_datos_invoice.settransobject(Sqlca)
dw_pago_invoice.settransobject(Sqlca)
dw_pago_invoice.visible = False
sle_nombre_beneficiario.setfocus()



end event

event pfc_saveas;dw_pago_invoice.saveas()

end event

type dw_busca_invoice from datawindow within w_pfc_pago_invoices
int X=5
int Y=156
int Width=2926
int Height=512
int TabOrder=30
boolean BringToTop=true
string DataObject="dw_seleccionar_invoice_para_pago"
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

event doubleclicked;w_pfc_pago_invoices.Triggerevent("ue_procesar")
end event

type sle_nombre_beneficiario from u_sle within w_pfc_pago_invoices
int X=695
int Y=32
int Width=983
int Height=100
int TabOrder=10
boolean BringToTop=true
TextCase TextCase=Upper!
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
end type

type dw_datos_invoice from datawindow within w_pfc_pago_invoices
int X=288
int Y=676
int Width=2272
int Height=812
boolean BringToTop=true
string DataObject="dw_display_invoice"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type dw_pago_invoice from datawindow within w_pfc_pago_invoices
int X=50
int Y=1508
int Width=2843
int Height=224
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_pago_invoice"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type cb_seleccionar from commandbutton within w_pfc_pago_invoices
int X=1682
int Y=32
int Width=329
int Height=100
int TabOrder=20
boolean BringToTop=true
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

dw_busca_invoice.reset()
dw_pago_invoice.reset()
dw_datos_invoice.reset()



ls_nombre = "%"+sle_nombre_beneficiario.text+"%"

if dw_busca_invoice.retrieve(ls_nombre) = 0 Then
//	messagebox("","El Beneficiario no tiene invoices pendientes para pago")
	messagebox("","Receiver doesn't have pending invoices to payment.")
	Return
end if

sle_nombre_beneficiario.text = ""



end event

