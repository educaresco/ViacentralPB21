$PBExportHeader$w2_master_report_dates_amt.srw
forward
global type w2_master_report_dates_amt from w2_master_report_dates
end type
type em_value from editmask within w2_master_report_dates_amt
end type
type st_1 from statictext within w2_master_report_dates_amt
end type
end forward

global type w2_master_report_dates_amt from w2_master_report_dates
integer x = 214
integer y = 221
em_value em_value
st_1 st_1
end type
global w2_master_report_dates_amt w2_master_report_dates_amt

on w2_master_report_dates_amt.create
int iCurrent
call super::create
this.em_value=create em_value
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_value
this.Control[iCurrent+2]=this.st_1
end on

on w2_master_report_dates_amt.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_value)
destroy(this.st_1)
end on

type st_4 from w2_master_report_dates`st_4 within w2_master_report_dates_amt
end type

type st_3 from w2_master_report_dates`st_3 within w2_master_report_dates_amt
end type

type cb_query from w2_master_report_dates`cb_query within w2_master_report_dates_amt
integer x = 2313
integer taborder = 40
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
Double 		ld_amount

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ld_amount = Double(em_value.text)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,ld_amount)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w2_master_report_dates_amt
end type

type em_date1 from w2_master_report_dates`em_date1 within w2_master_report_dates_amt
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w2_master_report_dates_amt
end type

type em_date2 from w2_master_report_dates`em_date2 within w2_master_report_dates_amt
end type

type dw_1 from w2_master_report_dates`dw_1 within w2_master_report_dates_amt
end type

type gb_1 from w2_master_report_dates`gb_1 within w2_master_report_dates_amt
integer width = 3109
end type

type em_value from editmask within w2_master_report_dates_amt
integer x = 1678
integer y = 64
integer width = 535
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0.00"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w2_master_report_dates_amt
integer x = 1307
integer y = 80
integer width = 343
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Amount:"
alignment alignment = right!
boolean focusrectangle = false
end type

