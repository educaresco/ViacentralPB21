$PBExportHeader$w_rep_history_invoice.srw
forward
global type w_rep_history_invoice from window
end type
type dw_1 from datawindow within w_rep_history_invoice
end type
end forward

global type w_rep_history_invoice from window
integer x = 823
integer y = 360
integer width = 2153
integer height = 988
boolean titlebar = true
string title = "History Invoice"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
end type
global w_rep_history_invoice w_rep_history_invoice

on w_rep_history_invoice.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_rep_history_invoice.destroy
destroy(this.dw_1)
end on

event open;dw_1.settransobject(SQLCARPT)
dw_1.retrieve(gs_branch_insta_cons,gl_receiver_cons)
end event

type dw_1 from datawindow within w_rep_history_invoice
integer width = 2135
integer height = 884
integer taborder = 10
string dataobject = "dw_rep_history_invoice"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

