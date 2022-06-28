$PBExportHeader$w_agents_by_collector.srw
forward
global type w_agents_by_collector from window
end type
type cb_3 from commandbutton within w_agents_by_collector
end type
type cb_add from commandbutton within w_agents_by_collector
end type
type cb_delete from commandbutton within w_agents_by_collector
end type
type st_4 from statictext within w_agents_by_collector
end type
type st_3 from statictext within w_agents_by_collector
end type
type dw_agents_without_collector from datawindow within w_agents_by_collector
end type
type dw_agents_by_collector from datawindow within w_agents_by_collector
end type
type st_collector_name from statictext within w_agents_by_collector
end type
type st_1 from statictext within w_agents_by_collector
end type
type gb_1 from groupbox within w_agents_by_collector
end type
end forward

global type w_agents_by_collector from window
integer width = 2053
integer height = 1184
boolean titlebar = true
string title = "A/R Representative Agents"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_add cb_add
cb_delete cb_delete
st_4 st_4
st_3 st_3
dw_agents_without_collector dw_agents_without_collector
dw_agents_by_collector dw_agents_by_collector
st_collector_name st_collector_name
st_1 st_1
gb_1 gb_1
end type
global w_agents_by_collector w_agents_by_collector

type variables
string is_collector_id
end variables

forward prototypes
public subroutine fn_retrieve ()
public subroutine fn_unselect (integer ai_row)
public subroutine fn_select (integer ai_row)
end prototypes

public subroutine fn_retrieve ();dw_agents_by_collector.retrieve(is_collector_id)
dw_agents_without_collector.retrieve()
end subroutine

public subroutine fn_unselect (integer ai_row);string ls_agent_id

ls_agent_id = dw_agents_by_collector.getitemstring(ai_row, "id_agent")

UPDATE dba.AGENT SET COLLECTOR_ID = null WHERE ID_AGENT = :ls_agent_id;

fn_retrieve()
end subroutine

public subroutine fn_select (integer ai_row);string ls_agent_id

ls_agent_id = dw_agents_without_collector.getitemstring(ai_row, "id_agent")

UPDATE dba.AGENT SET COLLECTOR_ID = :is_collector_id WHERE ID_AGENT = :ls_agent_id;

fn_retrieve()
end subroutine

on w_agents_by_collector.create
this.cb_3=create cb_3
this.cb_add=create cb_add
this.cb_delete=create cb_delete
this.st_4=create st_4
this.st_3=create st_3
this.dw_agents_without_collector=create dw_agents_without_collector
this.dw_agents_by_collector=create dw_agents_by_collector
this.st_collector_name=create st_collector_name
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.cb_add,&
this.cb_delete,&
this.st_4,&
this.st_3,&
this.dw_agents_without_collector,&
this.dw_agents_by_collector,&
this.st_collector_name,&
this.st_1,&
this.gb_1}
end on

on w_agents_by_collector.destroy
destroy(this.cb_3)
destroy(this.cb_add)
destroy(this.cb_delete)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_agents_without_collector)
destroy(this.dw_agents_by_collector)
destroy(this.st_collector_name)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;string ls_cashier_name

is_collector_id = Message.StringParm

SELECT NAME_CASHIER
INTO :ls_cashier_name
FROM dba.CASHIER
WHERE ID_CASHIER = :is_collector_id;

st_collector_name.text = ls_cashier_name

fn_retrieve()


end event

type cb_3 from commandbutton within w_agents_by_collector
integer x = 1609
integer y = 948
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(w_agents_by_collector)
end event

type cb_add from commandbutton within w_agents_by_collector
integer x = 933
integer y = 624
integer width = 160
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<"
end type

event clicked;fn_select(dw_agents_without_collector.getrow())


end event

type cb_delete from commandbutton within w_agents_by_collector
integer x = 937
integer y = 488
integer width = 160
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">"
end type

event clicked;fn_unselect(dw_agents_by_collector.getrow())
end event

type st_4 from statictext within w_agents_by_collector
integer x = 1335
integer y = 232
integer width = 430
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Unassigned Agents"
boolean focusrectangle = false
end type

type st_3 from statictext within w_agents_by_collector
integer x = 379
integer y = 232
integer width = 183
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agents"
boolean focusrectangle = false
end type

type dw_agents_without_collector from datawindow within w_agents_by_collector
integer x = 1152
integer y = 316
integer width = 805
integer height = 580
integer taborder = 20
string title = "none"
string dataobject = "dw_agents_without_collector"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event doubleclicked;fn_select(dw_agents_without_collector.getrow())
end event

type dw_agents_by_collector from datawindow within w_agents_by_collector
integer x = 82
integer y = 308
integer width = 805
integer height = 580
integer taborder = 20
string title = "none"
string dataobject = "dw_agents_by_collector"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event doubleclicked;fn_unselect(dw_agents_by_collector.getrow())
end event

type st_collector_name from statictext within w_agents_by_collector
integer x = 562
integer y = 80
integer width = 741
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean border = true
boolean focusrectangle = false
end type

type st_1 from statictext within w_agents_by_collector
integer x = 91
integer y = 84
integer width = 462
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "A/R Representative:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_agents_by_collector
integer x = 64
integer y = 28
integer width = 1285
integer height = 148
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

