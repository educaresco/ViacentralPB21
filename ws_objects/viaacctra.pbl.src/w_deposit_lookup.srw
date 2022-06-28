$PBExportHeader$w_deposit_lookup.srw
forward
global type w_deposit_lookup from w_master
end type
type em_depositcode from editmask within w_deposit_lookup
end type
type em_idbranch from editmask within w_deposit_lookup
end type
type st_2 from statictext within w_deposit_lookup
end type
type em_namebranch from editmask within w_deposit_lookup
end type
type st_3 from statictext within w_deposit_lookup
end type
type gb_1 from groupbox within w_deposit_lookup
end type
type st_1 from statictext within w_deposit_lookup
end type
type dw_1 from datawindow within w_deposit_lookup
end type
type cb_1 from commandbutton within w_deposit_lookup
end type
type cb_select from commandbutton within w_deposit_lookup
end type
type cb_cancel from commandbutton within w_deposit_lookup
end type
end forward

global type w_deposit_lookup from w_master
integer width = 2313
integer height = 1772
string title = "Deposit Codes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 80269524
em_depositcode em_depositcode
em_idbranch em_idbranch
st_2 st_2
em_namebranch em_namebranch
st_3 st_3
gb_1 gb_1
st_1 st_1
dw_1 dw_1
cb_1 cb_1
cb_select cb_select
cb_cancel cb_cancel
end type
global w_deposit_lookup w_deposit_lookup

type variables
string is_selected
end variables

on w_deposit_lookup.create
int iCurrent
call super::create
this.em_depositcode=create em_depositcode
this.em_idbranch=create em_idbranch
this.st_2=create st_2
this.em_namebranch=create em_namebranch
this.st_3=create st_3
this.gb_1=create gb_1
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_select=create cb_select
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_depositcode
this.Control[iCurrent+2]=this.em_idbranch
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_namebranch
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_select
this.Control[iCurrent+11]=this.cb_cancel
end on

on w_deposit_lookup.destroy
call super::destroy
destroy(this.em_depositcode)
destroy(this.em_idbranch)
destroy(this.st_2)
destroy(this.em_namebranch)
destroy(this.st_3)
destroy(this.gb_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_select)
destroy(this.cb_cancel)
end on

event open;call super::open;
string ls_depositcode, ls_idbranch, ls_namebranch

ls_depositcode = '%' 
ls_idbranch = '%' 
ls_namebranch = '%' 

if len(trim(em_depositcode.text)) > 0 then ls_depositcode = trim(em_depositcode.text)
if len(trim(em_idbranch.text)) > 0 then ls_idbranch = trim(em_idbranch.text)
if len(trim(em_namebranch.text)) > 0 then ls_namebranch = trim(em_namebranch.text)

dw_1.retrieve(ls_depositcode,ls_idbranch,ls_namebranch)
end event

type em_depositcode from editmask within w_deposit_lookup
integer x = 78
integer y = 140
integer width = 398
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
maskdatatype maskdatatype = stringmask!
string mask = "##########"
end type

event modified;
string ls_depositcode, ls_idbranch, ls_namebranch

ls_depositcode = '%' 
ls_idbranch = '%' 
ls_namebranch = '%' 

if len(trim(em_depositcode.text)) > 0 then ls_depositcode = trim(em_depositcode.text)
if len(trim(em_idbranch.text)) > 0 then ls_idbranch = trim(em_idbranch.text)
if len(trim(em_namebranch.text)) > 0 then ls_namebranch = trim(em_namebranch.text)

dw_1.retrieve(ls_depositcode,ls_idbranch,ls_namebranch)
end event

type em_idbranch from editmask within w_deposit_lookup
integer x = 480
integer y = 140
integer width = 370
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;string ls_depositcode, ls_idbranch, ls_namebranch

ls_depositcode = '%' 
ls_idbranch = '%' 
ls_namebranch = '%' 

if len(trim(em_depositcode.text)) > 0 then ls_depositcode = trim(em_depositcode.text)
if len(trim(em_idbranch.text)) > 0 then ls_idbranch = trim(em_idbranch.text)
if len(trim(em_namebranch.text)) > 0 then ls_namebranch = trim(em_namebranch.text)

dw_1.retrieve(ls_depositcode,ls_idbranch,ls_namebranch)
end event

type st_2 from statictext within w_deposit_lookup
integer x = 480
integer y = 68
integer width = 370
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Branch Code"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_namebranch from editmask within w_deposit_lookup
integer x = 855
integer y = 140
integer width = 1239
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;string ls_depositcode, ls_idbranch, ls_namebranch

ls_depositcode = '%' 
ls_idbranch = '%' 
ls_namebranch = '%' 

if len(trim(em_depositcode.text)) > 0 then ls_depositcode = trim(em_depositcode.text)
if len(trim(em_idbranch.text)) > 0 then ls_idbranch = trim(em_idbranch.text)
if len(trim(em_namebranch.text)) > 0 then ls_namebranch = trim(em_namebranch.text)

dw_1.retrieve(ls_depositcode,ls_idbranch,ls_namebranch)
end event

type st_3 from statictext within w_deposit_lookup
integer x = 965
integer y = 68
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Branch Name"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_deposit_lookup
integer x = 23
integer width = 2249
integer height = 268
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_1 from statictext within w_deposit_lookup
integer x = 78
integer y = 68
integer width = 398
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Deposit Code"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_deposit_lookup
integer x = 23
integer y = 288
integer width = 2245
integer height = 1264
boolean bringtotop = true
string dataobject = "dw_deposit_lookup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;long ll_row

ll_row = dw_1.GetClickedRow ( )

dw_1.SelectRow(0, FALSE)

if ll_row > 0 then
	dw_1.scrolltorow(ll_row)
	dw_1.SelectRow(ll_row, TRUE)
	is_selected = dw_1.getitemstring(ll_row,"deposit_codes_deposit_code")
else
	is_selected = 'none'
end if
end event

event doubleclicked;long ll_row

ll_row = dw_1.GetClickedRow ( )

dw_1.SelectRow(0, FALSE)

if ll_row > 0 then
	dw_1.scrolltorow(ll_row)
	dw_1.SelectRow(ll_row, TRUE)
	is_selected = dw_1.getitemstring(ll_row,"deposit_codes_deposit_code")
else
	is_selected = 'none'
end if

closewithreturn(parent,is_selected)
end event

type cb_1 from commandbutton within w_deposit_lookup
integer x = 2112
integer y = 140
integer width = 123
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;
string ls_depositcode, ls_idbranch, ls_namebranch

ls_depositcode = '%' 
ls_idbranch = '%' 
ls_namebranch = '%' 

if len(trim(em_depositcode.text)) > 0 then ls_depositcode = trim(em_depositcode.text)
if len(trim(em_idbranch.text)) > 0 then ls_idbranch = trim(em_idbranch.text)
if len(trim(em_namebranch.text)) > 0 then ls_namebranch = trim(em_namebranch.text)

dw_1.retrieve(ls_depositcode,ls_idbranch,ls_namebranch)
end event

type cb_select from commandbutton within w_deposit_lookup
integer x = 1138
integer y = 1576
integer width = 603
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
boolean default = true
end type

event clicked;closewithreturn(parent,is_selected)
end event

type cb_cancel from commandbutton within w_deposit_lookup
integer x = 480
integer y = 1576
integer width = 603
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
end type

event clicked;closewithreturn(parent,'none')
end event

