$PBExportHeader$w_seleccionar_multiple_country.srw
forward
global type w_seleccionar_multiple_country from wb_response
end type
type cb_1 from commandbutton within w_seleccionar_multiple_country
end type
type dw_1 from datawindow within w_seleccionar_multiple_country
end type
end forward

global type w_seleccionar_multiple_country from wb_response
integer x = 923
integer y = 212
integer width = 1815
integer height = 1808
cb_1 cb_1
dw_1 dw_1
end type
global w_seleccionar_multiple_country w_seleccionar_multiple_country

on w_seleccionar_multiple_country.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_1
end on

on w_seleccionar_multiple_country.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_seleccionar_multiple_country
integer x = 745
integer y = 1608
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
string ls_country

ld_rownum = dw_1.rowcount()

setnull(ls_country)

for ld_row = 1 to ld_rownum
	
 if dw_1.isselected(ld_row) = true then
	
	if isnull(ls_country) then
	
		ls_country = dw_1.getitemstring(ld_row,'id_country')
	
	else
		
		ls_country = ls_country +';'+ dw_1.getitemstring(ld_row,'id_country')
		
	end if
	
end if

next


closewithreturn(w_seleccionar_multiple_country,ls_country)
end event

type dw_1 from datawindow within w_seleccionar_multiple_country
integer x = 37
integer y = 8
integer width = 1746
integer height = 1568
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_country_selection"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.settransobject(sqlca)

dw_1.retrieve()
end event

event clicked;//if dw_1.GetClickedRow ( ) = 1 then
//	dw_1.SelectRow(0, FALSE)
//	This.SelectRow(1, TRUE)
//	SetRow(1)
//	return
//elseif dw_1.GetClickedRow ( ) = 0 then
//	dw_1.SelectRow(0, FALSE)
//	return
//else
//	This.SelectRow(0, FALSE)
//   This.SelectRow(row, TRUE)
//	SetRow(row)
//end 

boolean result

result = not this.IsSelected(Row)

if Row > 0 then this.SelectRow(Row, result)


end event

event doubleclicked;//long		ll_row
//string	ls_COUNTRY,id_COUNTRY
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
////	ls_state = dw_1.getitemstring(ll_row,"name_state")
//	id_COUNTRY = dw_1.getitemstring(ll_row,"id_COUNTRY")
//	closewithreturn(w_seleccionar_country,id_COUNTRY)
//end if
end event

