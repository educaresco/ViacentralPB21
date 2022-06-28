$PBExportHeader$w_branch_selection.srw
forward
global type w_branch_selection from window
end type
type cb_3 from commandbutton within w_branch_selection
end type
type cb_2 from commandbutton within w_branch_selection
end type
type dw_1 from datawindow within w_branch_selection
end type
type cb_1 from commandbutton within w_branch_selection
end type
type sle_1 from singlelineedit within w_branch_selection
end type
type st_1 from statictext within w_branch_selection
end type
type gb_1 from groupbox within w_branch_selection
end type
type gb_2 from groupbox within w_branch_selection
end type
end forward

global type w_branch_selection from window
integer width = 1609
integer height = 1964
boolean titlebar = true
string title = "Branch Selection"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
sle_1 sle_1
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_branch_selection w_branch_selection

on w_branch_selection.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.sle_1=create sle_1
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_1,&
this.cb_1,&
this.sle_1,&
this.st_1,&
this.gb_1,&
this.gb_2}
end on

on w_branch_selection.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dw_1.settransobject(sqlca)

dw_1.retrieve()
end event

type cb_3 from commandbutton within w_branch_selection
integer x = 1166
integer y = 1684
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;close(w_branch_selection)
end event

type cb_2 from commandbutton within w_branch_selection
integer x = 805
integer y = 1684
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select"
end type

event clicked;string ls_id_branch

ls_id_branch = dw_1.getitemstring(dw_1.getrow(), 'id_branch')

closewithreturn(w_branch_selection, ls_id_branch)
end event

type dw_1 from datawindow within w_branch_selection
integer x = 37
integer y = 312
integer width = 1522
integer height = 1272
integer taborder = 30
string title = "none"
string dataobject = "dw_branch_selection"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_1.selectedline()
end event

event doubleclicked;string ls_id_branch


ls_id_branch = dw_1.getitemstring(row,'id_branch')


closewithreturn(w_branch_selection, ls_id_branch)
end event

type cb_1 from commandbutton within w_branch_selection
integer x = 1056
integer y = 116
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Search"
end type

type sle_1 from singlelineedit within w_branch_selection
integer x = 411
integer y = 120
integer width = 475
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_branch_selection
integer x = 114
integer y = 132
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ID BRANCH:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_branch_selection
integer x = 32
integer y = 20
integer width = 1531
integer height = 260
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Search"
end type

type gb_2 from groupbox within w_branch_selection
integer x = 32
integer y = 1600
integer width = 1541
integer height = 244
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

