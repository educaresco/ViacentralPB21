$PBExportHeader$w_contact.srw
forward
global type w_contact from wb_single_tb
end type
type lst_payers from my_ddlb within w_contact
end type
type cbx_filter from checkbox within w_contact
end type
end forward

global type w_contact from wb_single_tb
integer x = 214
integer y = 221
integer width = 4091
integer height = 2092
lst_payers lst_payers
cbx_filter cbx_filter
end type
global w_contact w_contact

on w_contact.create
int iCurrent
call super::create
this.lst_payers=create lst_payers
this.cbx_filter=create cbx_filter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_payers
this.Control[iCurrent+2]=this.cbx_filter
end on

on w_contact.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_payers)
destroy(this.cbx_filter)
end on

type dw_1 from wb_single_tb`dw_1 within w_contact
integer y = 144
integer width = 4023
integer height = 1760
string dataobject = "dw_contact"
end type

type lst_payers from my_ddlb within w_contact
integer x = 489
integer y = 36
integer width = 1070
integer height = 1136
integer taborder = 0
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_payers.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type IN ('P','A') order by name_main_branch;")
end event

event selectionchanged;call super::selectionchanged;if cbx_filter.checked then
	dw_1.SetFilter(" id_main_branch = '"+lst_payers.getdataid()+"'")
	dw_1.Filter( )
else
	dw_1.SetFilter('')
	dw_1.Filter( )
end if
end event

type cbx_filter from checkbox within w_contact
integer x = 18
integer y = 40
integer width = 434
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter Payer:"
end type

event clicked;if this.checked then
	dw_1.SetFilter(" id_main_branch = '"+lst_payers.getdataid()+"'")
	dw_1.Filter( )
else
	dw_1.SetFilter('')
	dw_1.Filter( )
end if
end event

