$PBExportHeader$w_select_payer_group.srw
forward
global type w_select_payer_group from wb_response
end type
type cb_1 from commandbutton within w_select_payer_group
end type
type dw_1 from datawindow within w_select_payer_group
end type
end forward

global type w_select_payer_group from wb_response
integer x = 923
integer y = 212
integer width = 1696
integer height = 1684
cb_1 cb_1
dw_1 dw_1
end type
global w_select_payer_group w_select_payer_group

type variables
string is_countries
end variables

on w_select_payer_group.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_1
end on

on w_select_payer_group.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_select_payer_group
integer x = 658
integer y = 1476
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select"
end type

event clicked;double  ld_row, ld_rownum
string ls_branch

ld_rownum = dw_1.rowcount()

setnull(ls_branch)

for ld_row = 1 to ld_rownum
	
 if dw_1.isselected(ld_row) = true then
	
	if isnull(ls_branch) then
	
		ls_branch = dw_1.getitemstring(ld_row,'branch_id_main_branch')
	
	else
		
		ls_branch = ls_branch +';'+ dw_1.getitemstring(ld_row,'branch_id_main_branch')
		
	end if
	
end if

next


closewithreturn(w_select_payer_group,ls_branch)
end event

type dw_1 from datawindow within w_select_payer_group
integer x = 5
integer width = 1664
integer height = 1432
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_payer_group_select"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;dw_1.settransobject(sqlca)




dw_1.retrieve()
end event

event doubleclicked;//long		ll_row
//string	ls_grupo
//
//ll_row = dw_1.GetRow()
//if ll_row = 0 then
//	dw_1.SelectRow(0, FALSE)
//	return
//else
//	
//end if
//
//if ll_row <> 0 then
//	ls_grupo = dw_1.getitemstring(ll_row,"id_main_branch")
//	closewithreturn(w_seleccionar_grupo_pagador,ls_grupo)
//end if
end event

event clicked;boolean result

result = not this.IsSelected(Row)

if Row > 0 then this.SelectRow(Row, result)
end event

