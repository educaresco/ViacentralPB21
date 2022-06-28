$PBExportHeader$w_group_branch_transactions.srw
forward
global type w_group_branch_transactions from window
end type
type cb_1 from commandbutton within w_group_branch_transactions
end type
type st_10 from statictext within w_group_branch_transactions
end type
type st_9 from statictext within w_group_branch_transactions
end type
type st_8 from statictext within w_group_branch_transactions
end type
type st_7 from statictext within w_group_branch_transactions
end type
type st_6 from statictext within w_group_branch_transactions
end type
type st_3 from statictext within w_group_branch_transactions
end type
type st_main_branch from statictext within w_group_branch_transactions
end type
type st_1 from statictext within w_group_branch_transactions
end type
type dw_branches from datawindow within w_group_branch_transactions
end type
type st_2 from statictext within w_group_branch_transactions
end type
type gb_3 from groupbox within w_group_branch_transactions
end type
type st_4 from statictext within w_group_branch_transactions
end type
type st_5 from statictext within w_group_branch_transactions
end type
type gb_4 from groupbox within w_group_branch_transactions
end type
type st_11 from statictext within w_group_branch_transactions
end type
type gb_5 from groupbox within w_group_branch_transactions
end type
type st_12 from statictext within w_group_branch_transactions
end type
type gb_6 from groupbox within w_group_branch_transactions
end type
type st_13 from statictext within w_group_branch_transactions
end type
type gb_8 from groupbox within w_group_branch_transactions
end type
type st_14 from statictext within w_group_branch_transactions
end type
type gb_1 from groupbox within w_group_branch_transactions
end type
type st_15 from statictext within w_group_branch_transactions
end type
type gb_2 from groupbox within w_group_branch_transactions
end type
type gb_9 from groupbox within w_group_branch_transactions
end type
type gb_7 from groupbox within w_group_branch_transactions
end type
type dw_top_countries from datawindow within w_group_branch_transactions
end type
type dw_top_payers from datawindow within w_group_branch_transactions
end type
type dw_money_transfers from datawindow within w_group_branch_transactions
end type
type dw_viacheck from datawindow within w_group_branch_transactions
end type
type dw_bill_payment from datawindow within w_group_branch_transactions
end type
type dw_via_recargas from datawindow within w_group_branch_transactions
end type
type dw_money_orders from datawindow within w_group_branch_transactions
end type
end forward

global type w_group_branch_transactions from window
integer width = 4430
integer height = 2224
boolean titlebar = true
string title = "Group Branch Transactions"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_3 st_3
st_main_branch st_main_branch
st_1 st_1
dw_branches dw_branches
st_2 st_2
gb_3 gb_3
st_4 st_4
st_5 st_5
gb_4 gb_4
st_11 st_11
gb_5 gb_5
st_12 st_12
gb_6 gb_6
st_13 st_13
gb_8 gb_8
st_14 st_14
gb_1 gb_1
st_15 st_15
gb_2 gb_2
gb_9 gb_9
gb_7 gb_7
dw_top_countries dw_top_countries
dw_top_payers dw_top_payers
dw_money_transfers dw_money_transfers
dw_viacheck dw_viacheck
dw_bill_payment dw_bill_payment
dw_via_recargas dw_via_recargas
dw_money_orders dw_money_orders
end type
global w_group_branch_transactions w_group_branch_transactions

forward prototypes
public subroutine fn_retrieve_data (integer ai_row)
end prototypes

public subroutine fn_retrieve_data (integer ai_row);string ls_branch

IF ai_row > 0 THEN
	ls_branch = dw_branches.Object.id_branch[ai_row]
	
	dw_branches.SelectRow( 0, FALSE)
	dw_branches.SelectRow(ai_row, TRUE)
	
	IF dw_top_countries.Retrieve(ls_branch, "TC") = 0 THEN
		dw_top_countries.Visible = FALSE	
	ELSE 
		dw_top_countries.Visible = TRUE	
	END IF
	
	IF dw_top_payers.Retrieve(ls_branch, "TP") = 0 THEN
		dw_top_payers.Visible = FALSE		
	ELSE 
		dw_top_payers.Visible = TRUE	
	END IF
	
	IF dw_money_transfers.Retrieve(ls_branch, "OR") = 0 THEN
		dw_money_transfers.Visible = FALSE		
	ELSE 
		dw_money_transfers.Visible = TRUE	
	END IF
	
	IF dw_viacheck.Retrieve(ls_branch, "VC") = 0 THEN
		dw_viacheck.Visible = FALSE		
	ELSE 
		dw_viacheck.Visible = TRUE	
	END IF
	
	IF dw_bill_payment.Retrieve(ls_branch, "BP") = 0 THEN
		dw_bill_payment.Visible = FALSE		
	ELSE 
		dw_bill_payment.Visible = TRUE	
	END IF
	
	IF dw_via_recargas.Retrieve(ls_branch, "TO") = 0 THEN
		dw_via_recargas.Visible = FALSE		
	ELSE 
		dw_via_recargas.Visible = TRUE	
	END IF
	
	IF dw_money_orders.Retrieve(ls_branch, "MO") = 0 THEN
		dw_money_orders.Visible = FALSE		
	ELSE 
		dw_money_orders.Visible = TRUE	
	END IF
END IF
end subroutine

on w_group_branch_transactions.create
this.cb_1=create cb_1
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_3=create st_3
this.st_main_branch=create st_main_branch
this.st_1=create st_1
this.dw_branches=create dw_branches
this.st_2=create st_2
this.gb_3=create gb_3
this.st_4=create st_4
this.st_5=create st_5
this.gb_4=create gb_4
this.st_11=create st_11
this.gb_5=create gb_5
this.st_12=create st_12
this.gb_6=create gb_6
this.st_13=create st_13
this.gb_8=create gb_8
this.st_14=create st_14
this.gb_1=create gb_1
this.st_15=create st_15
this.gb_2=create gb_2
this.gb_9=create gb_9
this.gb_7=create gb_7
this.dw_top_countries=create dw_top_countries
this.dw_top_payers=create dw_top_payers
this.dw_money_transfers=create dw_money_transfers
this.dw_viacheck=create dw_viacheck
this.dw_bill_payment=create dw_bill_payment
this.dw_via_recargas=create dw_via_recargas
this.dw_money_orders=create dw_money_orders
this.Control[]={this.cb_1,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_3,&
this.st_main_branch,&
this.st_1,&
this.dw_branches,&
this.st_2,&
this.gb_3,&
this.st_4,&
this.st_5,&
this.gb_4,&
this.st_11,&
this.gb_5,&
this.st_12,&
this.gb_6,&
this.st_13,&
this.gb_8,&
this.st_14,&
this.gb_1,&
this.st_15,&
this.gb_2,&
this.gb_9,&
this.gb_7,&
this.dw_top_countries,&
this.dw_top_payers,&
this.dw_money_transfers,&
this.dw_viacheck,&
this.dw_bill_payment,&
this.dw_via_recargas,&
this.dw_money_orders}
end on

on w_group_branch_transactions.destroy
destroy(this.cb_1)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_3)
destroy(this.st_main_branch)
destroy(this.st_1)
destroy(this.dw_branches)
destroy(this.st_2)
destroy(this.gb_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.gb_4)
destroy(this.st_11)
destroy(this.gb_5)
destroy(this.st_12)
destroy(this.gb_6)
destroy(this.st_13)
destroy(this.gb_8)
destroy(this.st_14)
destroy(this.gb_1)
destroy(this.st_15)
destroy(this.gb_2)
destroy(this.gb_9)
destroy(this.gb_7)
destroy(this.dw_top_countries)
destroy(this.dw_top_payers)
destroy(this.dw_money_transfers)
destroy(this.dw_viacheck)
destroy(this.dw_bill_payment)
destroy(this.dw_via_recargas)
destroy(this.dw_money_orders)
end on

event open;string ls_branch, ls_main_branch, ls_name_main_branch

ls_branch = message.stringparm

SELECT ID_MAIN_BRANCH
INTO :ls_main_branch
FROM dba.BRANCH 
WHERE ID_BRANCH = :ls_branch;

SELECT NAME_MAIN_BRANCH
INTO :ls_name_main_branch
FROM dba.GROUP_BRANCH 
WHERE ID_MAIN_BRANCH = :ls_main_branch;

st_main_branch.text = ls_main_branch + " - " + ls_name_main_branch


dw_branches.Retrieve(ls_main_branch)

dw_branches.SelectRow(1, TRUE)

fn_retrieve_data(1)



end event

type cb_1 from commandbutton within w_group_branch_transactions
integer x = 3922
integer y = 2016
integer width = 402
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;Close(w_group_branch_transactions)
end event

type st_10 from statictext within w_group_branch_transactions
integer x = 3639
integer y = 768
integer width = 448
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Money Orders"
boolean focusrectangle = false
end type

type st_9 from statictext within w_group_branch_transactions
integer x = 311
integer y = 756
integer width = 448
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Money Transfers"
boolean focusrectangle = false
end type

type st_8 from statictext within w_group_branch_transactions
integer x = 2839
integer y = 764
integer width = 375
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ViaRecargas"
boolean focusrectangle = false
end type

type st_7 from statictext within w_group_branch_transactions
integer x = 2034
integer y = 760
integer width = 384
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bill Payment"
boolean focusrectangle = false
end type

type st_6 from statictext within w_group_branch_transactions
integer x = 1221
integer y = 760
integer width = 251
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ViaCheck"
boolean focusrectangle = false
end type

type st_3 from statictext within w_group_branch_transactions
integer x = 2542
integer y = 1356
integer width = 434
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Top Payers"
boolean focusrectangle = false
end type

type st_main_branch from statictext within w_group_branch_transactions
integer x = 521
integer y = 112
integer width = 1147
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

type st_1 from statictext within w_group_branch_transactions
integer x = 206
integer y = 116
integer width = 320
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Main Branch:"
boolean focusrectangle = false
end type

type dw_branches from datawindow within w_group_branch_transactions
integer x = 178
integer y = 204
integer width = 1495
integer height = 328
integer taborder = 10
string title = "none"
string dataobject = "dw_branches_group_branch"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;fn_retrieve_data(row)
end event

type st_2 from statictext within w_group_branch_transactions
integer x = 1367
integer y = 1352
integer width = 434
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Top Countries"
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_group_branch_transactions
integer x = 160
integer y = 720
integer width = 741
integer height = 508
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

type st_4 from statictext within w_group_branch_transactions
integer x = 439
integer y = 928
integer width = 192
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Data"
boolean focusrectangle = false
end type

type st_5 from statictext within w_group_branch_transactions
integer x = 1266
integer y = 932
integer width = 192
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Data"
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_group_branch_transactions
integer x = 965
integer y = 720
integer width = 786
integer height = 508
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_11 from statictext within w_group_branch_transactions
integer x = 2089
integer y = 916
integer width = 192
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Data"
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_group_branch_transactions
integer x = 1815
integer y = 720
integer width = 754
integer height = 508
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_12 from statictext within w_group_branch_transactions
integer x = 2907
integer y = 908
integer width = 192
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Data"
boolean focusrectangle = false
end type

type gb_6 from groupbox within w_group_branch_transactions
integer x = 2629
integer y = 720
integer width = 741
integer height = 508
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_13 from statictext within w_group_branch_transactions
integer x = 3735
integer y = 908
integer width = 192
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Data"
boolean focusrectangle = false
end type

type gb_8 from groupbox within w_group_branch_transactions
integer x = 3424
integer y = 724
integer width = 777
integer height = 508
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_14 from statictext within w_group_branch_transactions
integer x = 1454
integer y = 1540
integer width = 192
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Data"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_group_branch_transactions
integer x = 1070
integer y = 1312
integer width = 960
integer height = 572
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_15 from statictext within w_group_branch_transactions
integer x = 2601
integer y = 1540
integer width = 192
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Data"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_group_branch_transactions
integer x = 2085
integer y = 1308
integer width = 1239
integer height = 604
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_9 from groupbox within w_group_branch_transactions
integer x = 55
integer y = 36
integer width = 1746
integer height = 552
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group Branch"
end type

type gb_7 from groupbox within w_group_branch_transactions
integer x = 50
integer y = 648
integer width = 4274
integer height = 1324
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transactions"
end type

type dw_top_countries from datawindow within w_group_branch_transactions
integer x = 1074
integer y = 1420
integer width = 951
integer height = 480
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_top_countries"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_top_payers from datawindow within w_group_branch_transactions
integer x = 2089
integer y = 1420
integer width = 1230
integer height = 484
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_top_payers"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_money_transfers from datawindow within w_group_branch_transactions
integer x = 165
integer y = 824
integer width = 731
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_money_transfers"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_viacheck from datawindow within w_group_branch_transactions
integer x = 969
integer y = 824
integer width = 777
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_viacheck"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_bill_payment from datawindow within w_group_branch_transactions
integer x = 1819
integer y = 824
integer width = 745
integer height = 400
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_bill_payment"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_via_recargas from datawindow within w_group_branch_transactions
integer x = 2633
integer y = 824
integer width = 731
integer height = 404
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_viarecargas"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_money_orders from datawindow within w_group_branch_transactions
integer x = 3429
integer y = 824
integer width = 768
integer height = 408
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_money_orders"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

