$PBExportHeader$w_rep_transations.srw
forward
global type w_rep_transations from wb_report_fechas
end type
type dw_listbox from datawindow within w_rep_transations
end type
type lb_transaction from dropdownlistbox within w_rep_transations
end type
type st_3 from statictext within w_rep_transations
end type
type lb_bank from dropdownlistbox within w_rep_transations
end type
type st_4 from statictext within w_rep_transations
end type
type lb_group from dropdownlistbox within w_rep_transations
end type
type st_5 from statictext within w_rep_transations
end type
type cb_query from commandbutton within w_rep_transations
end type
type gb_1 from groupbox within w_rep_transations
end type
type rb_tradat from radiobutton within w_rep_transations
end type
type rb_recdat from radiobutton within w_rep_transations
end type
end forward

global type w_rep_transations from wb_report_fechas
integer height = 1916
string title = "Transactions Tracking"
long backcolor = 80269524
dw_listbox dw_listbox
lb_transaction lb_transaction
st_3 st_3
lb_bank lb_bank
st_4 st_4
lb_group lb_group
st_5 st_5
cb_query cb_query
gb_1 gb_1
rb_tradat rb_tradat
rb_recdat rb_recdat
end type
global w_rep_transations w_rep_transations

on w_rep_transations.create
int iCurrent
call super::create
this.dw_listbox=create dw_listbox
this.lb_transaction=create lb_transaction
this.st_3=create st_3
this.lb_bank=create lb_bank
this.st_4=create st_4
this.lb_group=create lb_group
this.st_5=create st_5
this.cb_query=create cb_query
this.gb_1=create gb_1
this.rb_tradat=create rb_tradat
this.rb_recdat=create rb_recdat
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_listbox
this.Control[iCurrent+2]=this.lb_transaction
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.lb_bank
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.lb_group
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.cb_query
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.rb_tradat
this.Control[iCurrent+11]=this.rb_recdat
end on

on w_rep_transations.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_listbox)
destroy(this.lb_transaction)
destroy(this.st_3)
destroy(this.lb_bank)
destroy(this.st_4)
destroy(this.lb_group)
destroy(this.st_5)
destroy(this.cb_query)
destroy(this.gb_1)
destroy(this.rb_tradat)
destroy(this.rb_recdat)
end on

event open;call super::open;int i,j


dw_listbox.DataObject = 'dddw_concepo_contable'
dw_listbox.SetTransObject(SQLCA)
dw_listbox.retrieve()
lb_transaction.reset()
lb_transaction.additem(fn_completar_cadena('..... ANY .....','D',' ',100)+"*"+'-ANY-')
j = 1
for i = 1 to dw_listbox.rowcount()
	lb_transaction.additem(fn_completar_cadena(trim(dw_listbox.Object.data[i,2])+' ('+trim(dw_listbox.Object.data[i,1])+')','D',' ',100)+"*"+dw_listbox.Object.data[i,1])
next
lb_transaction.selectitem(j)


dw_listbox.DataObject = 'dddw_banco'
dw_listbox.SetTransObject(SQLCA)
dw_listbox.retrieve()
lb_bank.reset()
lb_bank.additem(fn_completar_cadena('..... ANY.....','D',' ',100)+"*"+'-ANY-')
j = 1
for i = 1 to dw_listbox.rowcount()
	lb_bank.additem(fn_completar_cadena(trim(dw_listbox.Object.data[i,2])+' ('+trim(dw_listbox.Object.data[i,1])+')','D',' ',100)+"*"+dw_listbox.Object.data[i,1])
next
lb_bank.selectitem(j)



dw_listbox.DataObject = 'dddw_group_branch'
dw_listbox.SetTransObject(SQLCA)
dw_listbox.retrieve()
lb_group.reset()
lb_group.additem(fn_completar_cadena('..... ANY.....','D',' ',100)+"*"+'-ANY-')
j = 1
for i = 1 to dw_listbox.rowcount()
	lb_group.additem(fn_completar_cadena(trim(dw_listbox.Object.data[i,2])+' ('+trim(dw_listbox.Object.data[i,1])+')','D',' ',100)+"*"+dw_listbox.Object.data[i,1])
next
lb_group.selectitem(j)
end event

type dw_1 from wb_report_fechas`dw_1 within w_rep_transations
integer y = 300
integer width = 3131
integer height = 1396
integer taborder = 0
string dataobject = "dw_rep_transations"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_transations
integer x = 1573
integer y = 72
integer height = 72
end type

type st_1 from wb_report_fechas`st_1 within w_rep_transations
integer x = 1353
integer y = 76
integer width = 201
string text = "From :"
end type

type st_2 from wb_report_fechas`st_2 within w_rep_transations
integer x = 2048
integer y = 76
integer width = 96
string text = "To :"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_transations
integer x = 2162
integer y = 72
integer height = 72
end type

event em_fecha2::modified;return
end event

type dw_listbox from datawindow within w_rep_transations
boolean visible = false
integer x = 3296
integer y = 524
integer width = 494
integer height = 360
integer taborder = 60
boolean bringtotop = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_transaction from dropdownlistbox within w_rep_transations
integer x = 1573
integer y = 160
integer width = 955
integer height = 632
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_rep_transations
integer x = 1234
integer y = 168
integer width = 320
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Trans. Type :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lb_bank from dropdownlistbox within w_rep_transations
boolean visible = false
integer x = 4361
integer y = 32
integer width = 608
integer height = 632
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_rep_transations
boolean visible = false
integer x = 4183
integer y = 32
integer width = 174
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Bank :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lb_group from dropdownlistbox within w_rep_transations
integer x = 247
integer y = 160
integer width = 992
integer height = 632
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_rep_transations
integer x = 41
integer y = 168
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Group :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_query from commandbutton within w_rep_transations
integer x = 2624
integer y = 24
integer width = 507
integer height = 256
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Query"
end type

event clicked;Date		ld_fecha1, ld_fecha2
String ls_group, ls_concepto, ls_bank


Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)

ls_group = trim(fn_token(lb_group.text,"*",2))
ls_concepto = trim(fn_token(lb_transaction.text,"*",2))
//ls_bank = trim(fn_token(lb_bank.text,"*",2))

if rb_tradat.checked then
	dw_1.DataObject = 'dw_rep_transations'
else
	dw_1.DataObject = 'dw_rep_transations_byrecdate'
end if

dw_1.SetTransObject(SQLCA)
	
dw_1.Retrieve(datetime(date(em_fecha1.text),time('00:00:00')),datetime(date(em_fecha2.text),time("23:59:59")),ls_group,ls_concepto)

dw_1.setfocus()

Setpointer(Arrow!)
end event

type gb_1 from groupbox within w_rep_transations
integer x = 5
integer width = 2597
integer height = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_tradat from radiobutton within w_rep_transations
integer x = 165
integer y = 76
integer width = 535
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transaction Date"
boolean checked = true
end type

type rb_recdat from radiobutton within w_rep_transations
integer x = 722
integer y = 76
integer width = 535
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reconciliation Date"
end type

