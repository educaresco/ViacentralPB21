$PBExportHeader$w_seleccionar_branch.srw
forward
global type w_seleccionar_branch from wb_response
end type
type dw_1 from datawindow within w_seleccionar_branch
end type
type em_1 from editmask within w_seleccionar_branch
end type
type em_cod from editmask within w_seleccionar_branch
end type
type st_1 from statictext within w_seleccionar_branch
end type
type st_2 from statictext within w_seleccionar_branch
end type
type cb_1 from commandbutton within w_seleccionar_branch
end type
type cb_2 from commandbutton within w_seleccionar_branch
end type
end forward

global type w_seleccionar_branch from wb_response
integer x = 923
integer y = 212
integer width = 1769
integer height = 1884
dw_1 dw_1
em_1 em_1
em_cod em_cod
st_1 st_1
st_2 st_2
cb_1 cb_1
cb_2 cb_2
end type
global w_seleccionar_branch w_seleccionar_branch

type variables
string	is_name
end variables

on w_seleccionar_branch.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.em_1=create em_1
this.em_cod=create em_cod
this.st_1=create st_1
this.st_2=create st_2
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_cod
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
end on

on w_seleccionar_branch.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.em_1)
destroy(this.em_cod)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_1)
destroy(this.cb_2)
end on

type dw_1 from datawindow within w_seleccionar_branch
integer x = 5
integer y = 184
integer width = 1751
integer height = 1624
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_seleccionar_branch"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.settransobject(sqlca)

is_name = '%%'

dw_1.retrieve(is_name)
end event

event clicked;if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
end if
end event

event doubleclicked;long		ll_row
string	ls_grupo

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_grupo = dw_1.getitemstring(ll_row,"id_branch")
	closewithreturn(w_seleccionar_branch,ls_grupo)
end if
end event

type em_1 from editmask within w_seleccionar_branch
integer x = 224
integer y = 92
integer width = 1317
integer height = 88
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event losefocus;//dw_1.dataobject = 'dw_seleccionar_branch'
//dw_1.settransobject(sqlca)
//
//is_name = '%'+em_1.text+ '%'
//
//
//
//
//dw_1.retrieve(is_name)
//dw_1.setfocus()
end event

type em_cod from editmask within w_seleccionar_branch
integer x = 224
integer width = 379
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type st_1 from statictext within w_seleccionar_branch
integer x = 27
integer y = 104
integer width = 178
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Name :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_seleccionar_branch
integer x = 27
integer y = 16
integer width = 178
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Code :"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_seleccionar_branch
integer x = 613
integer y = 4
integer width = 178
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;dw_1.dataobject = 'dw_seleccionar_branch_codigo'
dw_1.settransobject(sqlca)


is_name = '%'+em_cod.text+ '%'

em_1.text = ""

dw_1.retrieve(is_name)
dw_1.setfocus()
end event

type cb_2 from commandbutton within w_seleccionar_branch
integer x = 1554
integer y = 96
integer width = 178
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;dw_1.dataobject = 'dw_seleccionar_branch'
dw_1.settransobject(sqlca)

is_name = '%'+em_1.text+ '%'




dw_1.retrieve(is_name)
dw_1.setfocus()
end event

