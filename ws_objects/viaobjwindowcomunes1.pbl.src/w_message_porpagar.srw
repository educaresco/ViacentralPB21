$PBExportHeader$w_message_porpagar.srw
forward
global type w_message_porpagar from wb_response
end type
type dw_1 from datawindow within w_message_porpagar
end type
type cb_1 from commandbutton within w_message_porpagar
end type
end forward

global type w_message_porpagar from wb_response
int X=613
int Y=368
int Width=2565
int Height=1372
boolean TitleBar=true
string Title="Message Received"
long BackColor=80269524
boolean ControlMenu=false
dw_1 dw_1
cb_1 cb_1
end type
global w_message_porpagar w_message_porpagar

on w_message_porpagar.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
end on

on w_message_porpagar.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;call super::open;long		ll_reclamos
string	ls_branch

//X=1
//Y=1
//Show()

ls_branch = fn_branch_instalacion()


Close(w_message_received)
dw_1.settransobject(sqlca)


if dw_1.retrieve(ls_branch) = 0 then
	Close(w_message_porpagar)
end if

end event

type dw_1 from datawindow within w_message_porpagar
int X=27
int Y=180
int Width=2487
int Height=1088
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_messages_porpagar"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event clicked;//dw_1.setitem(row,"flag_costumer_service",'P')
end event

event buttonclicked;gs_branch          = dw_1.getitemstring(row,"id_branch")
gl_receiver_cons   = dw_1.getitemnumber(row,"id_receiver")


Open(w_pay_invoices_agencia)
end event

type cb_1 from commandbutton within w_message_porpagar
int X=1751
int Y=28
int Width=745
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="&Exit"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.update()

Close(w_message_porpagar)
end event

