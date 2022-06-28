$PBExportHeader$w_query_general_branch_central.srw
forward
global type w_query_general_branch_central from w_base_query
end type
type pb_save from u_pb within w_query_general_branch_central
end type
type cb_manager from commandbutton within w_query_general_branch_central
end type
type cb_1 from commandbutton within w_query_general_branch_central
end type
type cb_2 from commandbutton within w_query_general_branch_central
end type
type cb_4 from commandbutton within w_query_general_branch_central
end type
type cb_notes from commandbutton within w_query_general_branch_central
end type
type p_1 from picture within w_query_general_branch_central
end type
end forward

global type w_query_general_branch_central from w_base_query
integer x = 214
integer y = 221
integer width = 3470
integer height = 1472
string title = "Search Branch"
pb_save pb_save
cb_manager cb_manager
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_notes cb_notes
p_1 p_1
end type
global w_query_general_branch_central w_query_general_branch_central

type variables
string	is_branch
end variables

on w_query_general_branch_central.create
int iCurrent
call super::create
this.pb_save=create pb_save
this.cb_manager=create cb_manager
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_notes=create cb_notes
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_save
this.Control[iCurrent+2]=this.cb_manager
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_4
this.Control[iCurrent+6]=this.cb_notes
this.Control[iCurrent+7]=this.p_1
end on

on w_query_general_branch_central.destroy
call super::destroy
destroy(this.pb_save)
destroy(this.cb_manager)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_notes)
destroy(this.p_1)
end on

type dw_1 from w_base_query`dw_1 within w_query_general_branch_central
integer width = 3401
integer height = 1200
string dataobject = "dw_query_branch_central"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::itemchanged;
long ll_row

ll_row = This.Rowcount()

SUPER::EVENT ITEMCHANGED( row, dwo, data )

end event

event dw_1::constructor;call super::constructor;long ll_row

ll_row = This.Rowcount()
end event

type pb_query from w_base_query`pb_query within w_query_general_branch_central
integer x = 421
integer y = 1212
end type

event pb_query::clicked;long	ll_row

ll_row = dw_1.rowcount()

SUPER::EVENT Clicked()
end event

type pb_exit from w_base_query`pb_exit within w_query_general_branch_central
integer x = 3008
integer y = 1212
string text = "&Close"
end type

type st_count from w_base_query`st_count within w_query_general_branch_central
integer x = 1842
integer y = 400
integer width = 1243
integer height = 68
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421504
long bordercolor = 8421504
borderstyle borderstyle = stylebox!
end type

type pb_clean from w_base_query`pb_clean within w_query_general_branch_central
integer x = 69
integer y = 1212
integer taborder = 110
end type

type pb_pick from w_base_query`pb_pick within w_query_general_branch_central
boolean visible = false
integer x = 736
integer taborder = 90
end type

type pb_sort from w_base_query`pb_sort within w_query_general_branch_central
integer x = 777
integer y = 1212
integer taborder = 100
end type

type pb_save from u_pb within w_query_general_branch_central
integer x = 1129
integer y = 1212
integer height = 100
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "&Save"
end type

event clicked;
//messagebox('',gs_cashier)

if trim(gs_cashier) <> 'CH10' and trim(gs_cashier) <> 'CH3' and trim(gs_cashier) <> 'CH4' and trim(gs_cashier) <> 'ADM' then
	Messagebox('Error','No Tiene Privilegios Para Cambiar Datos de la Agencia')
	Return
end if

dw_1.update()

commit ;
//
//YONELIS                                      CH10
//
//MARTHA CADAVID                    CH3
//
//ELIZABETH RAMIREZ                 CH4
//
//EDUARDO                                      EDU
//
//MARTHA HERRERA                     CH43
//
//SANDRA                                        CH17
//
//CIELO                                             CH5
//
//ADMIN                                           ADM
//
//
end event

type cb_manager from commandbutton within w_query_general_branch_central
boolean visible = false
integer x = 1486
integer y = 1212
integer width = 352
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Manager"
end type

event clicked;
//commit ;
//
//string	ls_manager
//
//IF dw_1.GetRow()<=0 THEN
//	MessageBox('Manager','Seleccione el Branch dando un click sobre ella ')
//	Return
//END IF
//
//IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
//	MessageBox('MANAGER','Debe consultar antes de realizar esta operación.')
//	Return
//END IF
//
//gs_branch_insta_cons = dw_1.Object.id_branch[dw_1.GetRow()]
//openwithparm(w_ingreso_manager,gs_branch_insta_cons)




end event

type cb_1 from commandbutton within w_query_general_branch_central
integer x = 1842
integer y = 1212
integer width = 352
integer height = 100
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Print"
end type

event clicked;

if dw_1.rowcount() = 1 then
	printsetup()
	dw_1.print()
else
	Return
end if
end event

type cb_2 from commandbutton within w_query_general_branch_central
boolean visible = false
integer x = 2162
integer y = 1224
integer width = 352
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Map"
end type

event clicked;commit ;

string	ls_manager

IF dw_1.GetRow()<=0 THEN
	MessageBox('Map','Seleccione el Branch dando un click sobre ella ')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('MAP','Debe consultar antes de realizar esta operación.')
	Return
END IF

gs_branch_insta_cons = dw_1.Object.id_branch[dw_1.GetRow()]
openwithparm(w_mapa_agencia,gs_branch_insta_cons)




end event

type cb_4 from commandbutton within w_query_general_branch_central
integer x = 2693
integer y = 1212
integer width = 306
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aplication"
end type

event clicked;string	ls_branch



IF dw_1.GetRow()<=0 THEN
	MessageBox('APLICATION','Seleccione la Agencia dando un click sobre la deseada e intente de nuevo.')
	Return
END IF

IF dw_1.Object.Datawindow.QueryMode = "yes" THEN
	MessageBox('APLICATION','Debe consultar antes de realizar esta operación.')
	Return
END IF

ls_branch=dw_1.Object.id_branch[dw_1.GetRow()]

Openwithparm(w_aplication_form,ls_branch)
	
dw_1.SetFocus()
end event

type cb_notes from commandbutton within w_query_general_branch_central
integer x = 2816
integer y = 212
integer width = 549
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "   Agency Notes"
end type

event clicked;string	ls_branch

if dw_1.GetRow()<=0 then
	MessageBox('No Data','You must retrieve some data first.',StopSign!)
	Return
end if

if dw_1.Object.Datawindow.QueryMode = "yes" then
	MessageBox('No Data','You must retrieve some data first.',StopSign!)
	Return
end if

if dw_1.Object.id_type_branch[dw_1.GetRow()] = 'P' then
	MessageBox('No Available','This opcion is not available for payer location.',StopSign!)
	Return
end if

ls_branch=dw_1.Object.id_branch[dw_1.GetRow()]

Openwithparm(w_branch_message,ls_branch)
	

end event

type p_1 from picture within w_query_general_branch_central
integer x = 2848
integer y = 228
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "DosEdit!"
boolean focusrectangle = false
end type

event clicked;cb_notes.triggerevent(Clicked!)
end event

