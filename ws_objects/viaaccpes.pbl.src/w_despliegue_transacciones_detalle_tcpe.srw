$PBExportHeader$w_despliegue_transacciones_detalle_tcpe.srw
forward
global type w_despliegue_transacciones_detalle_tcpe from window
end type
type cb_4 from commandbutton within w_despliegue_transacciones_detalle_tcpe
end type
type cb_print from commandbutton within w_despliegue_transacciones_detalle_tcpe
end type
type cb_1 from commandbutton within w_despliegue_transacciones_detalle_tcpe
end type
type dw_1 from u_dw within w_despliegue_transacciones_detalle_tcpe
end type
end forward

global type w_despliegue_transacciones_detalle_tcpe from window
integer x = 9
integer y = 4
integer width = 3630
integer height = 2272
boolean titlebar = true
string title = "CLOSING PAYEE"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_4 cb_4
cb_print cb_print
cb_1 cb_1
dw_1 dw_1
end type
global w_despliegue_transacciones_detalle_tcpe w_despliegue_transacciones_detalle_tcpe

type variables
Double  	id_reference
end variables

event open;//X=1
//Y=1
//Show()
string	ls_grupo

dw_1.settransobject(sqlca)
id_reference = Message.DoubleParm	


  SELECT transaccion_diaria_payee.id_group_trans_diaria  
    INTO :ls_grupo  
    FROM transaccion_diaria_payee  
   WHERE transaccion_diaria_payee.cons_trans_diaria = :id_reference   ;

//
//if ls_grupo = '6022' then
//	dw_1.dataobject = 'dw_despliegue_transsacciones_espec_banc'
//	dw_1.settransobject(sqlca)
//	
//end if


dw_1.retrieve(id_reference) 

end event

on w_despliegue_transacciones_detalle_tcpe.create
this.cb_4=create cb_4
this.cb_print=create cb_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.cb_print,&
this.cb_1,&
this.dw_1}
end on

on w_despliegue_transacciones_detalle_tcpe.destroy
destroy(this.cb_4)
destroy(this.cb_print)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_4 from commandbutton within w_despliegue_transacciones_detalle_tcpe
integer x = 1842
integer y = 2088
integer width = 306
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Export"
boolean cancel = true
end type

event clicked;dw_1.saveas()
end event

type cb_print from commandbutton within w_despliegue_transacciones_detalle_tcpe
integer x = 1522
integer y = 2088
integer width = 306
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Print"
boolean cancel = true
end type

event clicked;Printsetup()
dw_1.print()
end event

type cb_1 from commandbutton within w_despliegue_transacciones_detalle_tcpe
integer x = 2162
integer y = 2088
integer width = 306
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(PARENT)
end event

type dw_1 from u_dw within w_despliegue_transacciones_detalle_tcpe
integer width = 3598
integer height = 2056
integer taborder = 10
string dataobject = "dw_despliegue_transacciones_detalle_tcpe"
boolean hscrollbar = true
end type

event clicked;return 0
end event

