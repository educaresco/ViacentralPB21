$PBExportHeader$w_bank_transactions.srw
$PBExportComments$bank_transactions
forward
global type w_bank_transactions from wb_single_tb
end type
type ddlb_bancos from my_ddlb within w_bank_transactions
end type
type st_1 from statictext within w_bank_transactions
end type
type gb_1 from groupbox within w_bank_transactions
end type
end forward

global type w_bank_transactions from wb_single_tb
integer x = 0
integer y = 0
integer width = 3305
integer height = 2432
string title = "Bank Transactions"
ddlb_bancos ddlb_bancos
st_1 st_1
gb_1 gb_1
end type
global w_bank_transactions w_bank_transactions

on w_bank_transactions.create
int iCurrent
call super::create
this.ddlb_bancos=create ddlb_bancos
this.st_1=create st_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_bancos
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.gb_1
end on

on w_bank_transactions.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.ddlb_bancos)
destroy(this.st_1)
destroy(this.gb_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_bank_transactions
integer x = 23
integer y = 212
integer width = 3205
integer height = 2200
string dataobject = "dtb_bank_transactions"
end type

event dw_1::constructor;SetTransObject(SQLCA)
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Event:
//////	constructor
//////
//////	Description:
//////	Start the resize service and register the controls.
////// Tab page three will be created on demand.  If the user resizes
////// the window before the tab page is created then the resize event
////// must be triggered.
//////
//////////////////////////////////////////////////////////////////////////////////
//////	
//////	Revision History
//////
//////	Version
//////	6.0   Initial version
//////
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//////	Any distribution of the PowerBuilder Foundation Classes (PFC)
//////	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////
//////////////////////////////////////////////////////////////////////////////////
////
////// Start the Resize Service.
//
datawindow	ddlb_filetypes

//this.retrieve()
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)
//
////Set the MinSize of the main object.
inv_resize.of_SetMinSize(1185, 509)
//
////Set the behavior of each object.
//inv_resize.of_Register(ddlb_filetypes, inv_resize.SCALERIGHTBOTTOM)
//inv_resize.of_Register(sle_text, inv_resize.SCALERIGHT)
//
//ddlb_filetypes.SelectItem(2)
//
////Trigger the resize event to be sure that the tab is sized appropriately.
event resize(1, this.width, this.height)
//






end event

event dw_1::pfc_preupdate;//DRT==>2008-Jun-9

Long 		ll_fila
String	ls_id_banco

ls_id_banco= ddlb_bancos.getdataid( )
ll_fila= This.GetNextModified( 0, Primary!)

do while ll_fila >0
	IF IsNull(GetItemString(ll_fila, "id_banco")) THEN
		SetItem(ll_fila, "id_banco", ls_id_banco )
	END IF
	ll_fila= This.GetNextModified(ll_fila, Primary!)
loop

Return Success
end event

type ddlb_bancos from my_ddlb within w_bank_transactions
integer x = 265
integer y = 64
integer width = 1463
integer height = 1024
integer taborder = 11
boolean bringtotop = true
end type

event constructor;call super::constructor;this.addquery(  "SELECT name_BANCO, "+&
   "      id_BANCO "+&
   " FROM dba.banco   "+&
	" ORDER BY 1;")
end event

event selectionchanged;call super::selectionchanged;String ls_filter

ls_filter = ddlb_bancos.getdataid()
dw_1.Retrieve(ls_filter)


end event

type st_1 from statictext within w_bank_transactions
integer x = 87
integer y = 72
integer width = 165
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Banco:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_bank_transactions
integer x = 23
integer y = 12
integer width = 3227
integer height = 176
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

