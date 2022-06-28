$PBExportHeader$w_payer_retransmission.srw
forward
global type w_payer_retransmission from w2_master_report_dates_payer
end type
type cbx_retrensmmitall from checkbox within w_payer_retransmission
end type
type pb_1 from picturebutton within w_payer_retransmission
end type
type st_2 from statictext within w_payer_retransmission
end type
type sle_selectedorders from singlelineedit within w_payer_retransmission
end type
type st_5 from statictext within w_payer_retransmission
end type
type sle_selectedamount from singlelineedit within w_payer_retransmission
end type
end forward

global type w_payer_retransmission from w2_master_report_dates_payer
integer width = 3488
cbx_retrensmmitall cbx_retrensmmitall
pb_1 pb_1
st_2 st_2
sle_selectedorders sle_selectedorders
st_5 st_5
sle_selectedamount sle_selectedamount
end type
global w_payer_retransmission w_payer_retransmission

on w_payer_retransmission.create
int iCurrent
call super::create
this.cbx_retrensmmitall=create cbx_retrensmmitall
this.pb_1=create pb_1
this.st_2=create st_2
this.sle_selectedorders=create sle_selectedorders
this.st_5=create st_5
this.sle_selectedamount=create sle_selectedamount
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_retrensmmitall
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.sle_selectedorders
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.sle_selectedamount
end on

on w_payer_retransmission.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_retrensmmitall)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.sle_selectedorders)
destroy(this.st_5)
destroy(this.sle_selectedamount)
end on

type st_4 from w2_master_report_dates_payer`st_4 within w_payer_retransmission
end type

type st_3 from w2_master_report_dates_payer`st_3 within w_payer_retransmission
end type

type cb_query from w2_master_report_dates_payer`cb_query within w_payer_retransmission
end type

event cb_query::clicked;call super::clicked;cbx_retrensmmitall.checked = false
sle_selectedamount.text = "0"
sle_selectedorders.text = "0"
end event

type pb_date1 from w2_master_report_dates_payer`pb_date1 within w_payer_retransmission
end type

type em_date1 from w2_master_report_dates_payer`em_date1 within w_payer_retransmission
end type

type pb_date2 from w2_master_report_dates_payer`pb_date2 within w_payer_retransmission
end type

type em_date2 from w2_master_report_dates_payer`em_date2 within w_payer_retransmission
end type

type dw_1 from w2_master_report_dates_payer`dw_1 within w_payer_retransmission
integer y = 288
integer width = 3401
integer height = 1412
string dataobject = "dw_payer_retransmission"
end type

event dw_1::itemchanged;call super::itemchanged;
if sle_selectedamount.text = '' then sle_selectedamount.text = "0"
if sle_selectedorders.text = '' then sle_selectedorders.text = "0"

if data = 'N' then
	sle_selectedamount.text = String(double(sle_selectedamount.text) + dw_1.getitemnumber(row,"total_receiver"),"###,###.00")
	sle_selectedorders.text = String(double(sle_selectedorders.text) + 1	)
else
	sle_selectedamount.text = String(double(sle_selectedamount.text) - dw_1.getitemnumber(row,"total_receiver"),"###,###.00")
	sle_selectedorders.text = String(double(sle_selectedorders.text) - 1 )
end if


end event

event dw_1::constructor;
// 04/23/2018: connects to readonly DB
//SetTransObject(SQLCArpt)

SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)
end event

type gb_1 from w2_master_report_dates_payer`gb_1 within w_payer_retransmission
end type

type lst_payers from w2_master_report_dates_payer`lst_payers within w_payer_retransmission
end type

type st_1 from w2_master_report_dates_payer`st_1 within w_payer_retransmission
end type

type sle_payer from w2_master_report_dates_payer`sle_payer within w_payer_retransmission
end type

type cbx_retrensmmitall from checkbox within w_payer_retransmission
integer x = 18
integer y = 200
integer width = 517
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Re-transmmit All"
end type

event clicked;
Long ll_row, ll_i
String	ls_trans, ls_newflag

if this.checked then
	ls_newflag = 'N'
else
	ls_newflag = 'T'
end if

ll_i = 1

ll_row = dw_1.rowcount()

DO WHILE ll_i <= ll_row
	ls_trans = dw_1.GetItemString(ll_i,"trans_receiver")
	if ls_trans <> ls_newflag then
	   dw_1.setitem(ll_i,"trans_receiver",ls_newflag)
   end if
	ll_i = ll_i + 1
LOOP

dw_1.accepttext()

end event

type pb_1 from picturebutton within w_payer_retransmission
integer x = 558
integer y = 192
integer width = 101
integer height = 88
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "Save!"
alignment htextalign = left!
end type

event clicked;dw_1.update()
end event

type st_2 from statictext within w_payer_retransmission
integer x = 832
integer y = 212
integer width = 398
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Orders:"
boolean focusrectangle = false
end type

type sle_selectedorders from singlelineedit within w_payer_retransmission
integer x = 1239
integer y = 196
integer width = 178
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "0"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_payer_retransmission
integer x = 1499
integer y = 208
integer width = 398
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Amount:"
boolean focusrectangle = false
end type

type sle_selectedamount from singlelineedit within w_payer_retransmission
integer x = 1920
integer y = 192
integer width = 352
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "0"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

