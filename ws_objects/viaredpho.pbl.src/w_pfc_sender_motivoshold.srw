$PBExportHeader$w_pfc_sender_motivoshold.srw
forward
global type w_pfc_sender_motivoshold from window
end type
type st_1 from statictext within w_pfc_sender_motivoshold
end type
type dw_1 from datawindow within w_pfc_sender_motivoshold
end type
type cb_select from commandbutton within w_pfc_sender_motivoshold
end type
type gb_1 from groupbox within w_pfc_sender_motivoshold
end type
end forward

global type w_pfc_sender_motivoshold from window
integer width = 1769
integer height = 1192
boolean titlebar = true
string title = "Motivos Hold"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_postopen ( )
st_1 st_1
dw_1 dw_1
cb_select cb_select
gb_1 gb_1
end type
global w_pfc_sender_motivoshold w_pfc_sender_motivoshold

type variables
string ls_loaded, ls_selected, is_modalidad
end variables

event ue_postopen();//DON (03/12/2015) - Move code from Open event.  ************************
String ls_id_branch
Decimal ld_id_receiver
LONG l_fila, l_fila_insertada
STRU_PARAMETROS stru_parametro

stru_parametro = Message.powerobjectparm


ls_id_branch = fn_token(stru_parametro.String[UpperBound(stru_parametro.String)],'*',1)
ld_id_receiver = double(fn_token(stru_parametro.String[UpperBound(stru_parametro.String)],'*',2))

dw_1.retrieve(ls_id_branch,ld_id_receiver)

FOR l_fila = 1 TO UpperBound(stru_parametro.String) - 1 	
	
	IF Len(Trim(stru_parametro.String[l_fila])) > 0 THEN
		l_fila_insertada = dw_1.InsertRow(0)
		dw_1.SetItem(l_fila_insertada, "desc_hold_descripcion",Trim(stru_parametro.String[l_fila]))
	END IF
	
NEXT


if dw_1.rowcount() = 0 then close(this)

end event

on w_pfc_sender_motivoshold.create
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_select=create cb_select
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.dw_1,&
this.cb_select,&
this.gb_1}
end on

on w_pfc_sender_motivoshold.destroy
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_select)
destroy(this.gb_1)
end on

event open;//DON (03/12/2015) - Moved code from Open event to ue_postopen event.  **************************
This.PostEvent("ue_postopen")

//String ls_id_branch
//Decimal ld_id_receiver
//
//ls_id_branch = fn_token(Message.StringParm,'*',1)
//ld_id_receiver = double(fn_token(Message.StringParm,'*',2))
//
//dw_1.retrieve(ls_id_branch,ld_id_receiver)
//
//if dw_1.rowcount() = 0 then close(this)

end event

type st_1 from statictext within w_pfc_sender_motivoshold
integer x = 73
integer y = 84
integer width = 1600
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "La orden ha quedado en HOLD por los siguientes motivos, asegurese de pedir la información necesaria para agilizar la liberación de la orden."
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_pfc_sender_motivoshold
integer x = 64
integer y = 224
integer width = 1586
integer height = 732
integer taborder = 30
string dataobject = "dw_pfc_sender_motivoshold"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_select from commandbutton within w_pfc_sender_motivoshold
integer x = 1253
integer y = 988
integer width = 457
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Ok"
boolean default = true
end type

event clicked;close(parent)

end event

type gb_1 from groupbox within w_pfc_sender_motivoshold
integer x = 27
integer y = 28
integer width = 1682
integer height = 948
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

