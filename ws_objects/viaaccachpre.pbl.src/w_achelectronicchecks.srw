$PBExportHeader$w_achelectronicchecks.srw
forward
global type w_achelectronicchecks from wb_report
end type
type cb_query from commandbutton within w_achelectronicchecks
end type
type em_date from editmask within w_achelectronicchecks
end type
type st_1 from statictext within w_achelectronicchecks
end type
type cb_1 from commandbutton within w_achelectronicchecks
end type
type ta from tab within w_achelectronicchecks
end type
type tp from userobject within ta
end type
type cb_3 from commandbutton within tp
end type
type cb_2 from commandbutton within tp
end type
type dw_2 from datawindow within tp
end type
type tp from userobject within ta
cb_3 cb_3
cb_2 cb_2
dw_2 dw_2
end type
type ta from tab within w_achelectronicchecks
tp tp
end type
type gb_1 from groupbox within w_achelectronicchecks
end type
end forward

global type w_achelectronicchecks from wb_report
integer width = 3790
integer height = 1972
string title = "Electronic Checks"
long backcolor = 80269524
cb_query cb_query
em_date em_date
st_1 st_1
cb_1 cb_1
ta ta
gb_1 gb_1
end type
global w_achelectronicchecks w_achelectronicchecks

on w_achelectronicchecks.create
int iCurrent
call super::create
this.cb_query=create cb_query
this.em_date=create em_date
this.st_1=create st_1
this.cb_1=create cb_1
this.ta=create ta
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_query
this.Control[iCurrent+2]=this.em_date
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.ta
this.Control[iCurrent+6]=this.gb_1
end on

on w_achelectronicchecks.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_query)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.ta)
destroy(this.gb_1)
end on

event open;call super::open;em_date.text = string(today())
cb_query.triggerevent(Clicked!)
ta.visible = false
end event

type dw_1 from wb_report`dw_1 within w_achelectronicchecks
integer x = 18
integer y = 216
integer width = 3712
integer height = 1564
integer taborder = 0
string dataobject = "dw_achelectronicchecks"
end type

event dw_1::constructor;SetTransObject(SQLCA)
//this.retrieve()
//of_setfilter(true)
//of_setsort(true)
//of_SetResize(true)
//of_setprintpreview(true)
//of_SetFind(true)
//inv_resize.of_SetOrigSize(1592, 537)
end event

event dw_1::clicked;call super::clicked;long ll_row
ll_row = dw_1.GetClickedRow()
dw_1.SelectRow(0,FALSE)
if ll_row > 0 then
	 dw_1.Scrolltorow(ll_row)
end if
end event

event dw_1::resize;this.width = parent.width - (3785 - 3712 - 10)
this.height = parent.height - (1964 - 1564 - 60)
end event

type cb_query from commandbutton within w_achelectronicchecks
string tag = "Query"
integer x = 617
integer y = 84
integer width = 297
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
boolean default = true
end type

event clicked;dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
end event

type em_date from editmask within w_achelectronicchecks
integer x = 274
integer y = 84
integer width = 311
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type st_1 from statictext within w_achelectronicchecks
integer x = 105
integer y = 92
integer width = 160
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_achelectronicchecks
integer x = 1691
integer y = 76
integer width = 750
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Red Phone Confirmations"
end type

event clicked;
if date(em_date.text) < today() then
	
	MessageBox("Error","This option is only available for the current date",StopSign!)
	
else
	
	
	if ta.visible then
		ta.tp.dw_2.reset()
	else
		ta.tp.dw_2.retrieve(datetime(date(em_date.text),time('00:00:00')))
	end if
	
	ta.visible = not ta.visible
	
end if
end event

type ta from tab within w_achelectronicchecks
event create ( )
event destroy ( )
integer x = 1691
integer y = 176
integer width = 1417
integer height = 1116
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean focusonbuttondown = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tp tp
end type

on ta.create
this.tp=create tp
this.Control[]={this.tp}
end on

on ta.destroy
destroy(this.tp)
end on

type tp from userobject within ta
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 1381
integer height = 1052
long backcolor = 80269524
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_3 cb_3
cb_2 cb_2
dw_2 dw_2
end type

on tp.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_2=create dw_2
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_2}
end on

on tp.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_2)
end on

type cb_3 from commandbutton within tp
integer x = 969
integer y = 952
integer width = 393
integer height = 100
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;If Messagebox("Confirmation","Are you sure you want to save the confirmations?",Question!,YesNo!) = 1 Then

	ta.tp.dw_2.update()	
	dw_1.retrieve(datetime(date(em_date.text),time('00:00:00')))
	ta.visible = false

end if


end event

type cb_2 from commandbutton within tp
integer x = 567
integer y = 952
integer width = 393
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
end type

event clicked;ta.tp.dw_2.reset()
ta.visible = false
end event

type dw_2 from datawindow within tp
integer x = 14
integer y = 16
integer width = 1344
integer height = 916
integer taborder = 20
string dataobject = "dw_achelectronicchecks_redphoneconf"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event itemchanged;
if dwo.name = 'ach_electronic_deposit_confirmed_amt' then

	if double(data) > 0 then
		ta.tp.dw_2.setitem(row,"ach_electronic_deposit_confirmed_by","FAX - "+gs_login)
		ta.tp.dw_2.setitem(row,"ach_electronic_deposit_received_time",datetime(today(),now()))
		ta.tp.dw_2.setitem(row,"ach_electronic_deposit_confirmed_time",datetime(today(),now()))
		ta.tp.dw_2.setitem(row,"ach_electronic_deposit_transmitted_time",datetime(today(),now()))
	else
		Messagebox("Error","You Must Confirm a positive Amount",StopSign!)
		return 2
	end if
	
end if
end event

type gb_1 from groupbox within w_achelectronicchecks
integer x = 18
integer y = 16
integer width = 1266
integer height = 184
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

