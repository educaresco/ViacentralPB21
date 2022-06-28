$PBExportHeader$w_rep_topoustandingdays.srw
forward
global type w_rep_topoustandingdays from w2_master_report_dates
end type
type sle_1 from singlelineedit within w_rep_topoustandingdays
end type
type cbx_1 from checkbox within w_rep_topoustandingdays
end type
type rb_s1 from radiobutton within w_rep_topoustandingdays
end type
type rb_s2 from radiobutton within w_rep_topoustandingdays
end type
end forward

global type w_rep_topoustandingdays from w2_master_report_dates
integer x = 214
integer y = 221
integer height = 1920
sle_1 sle_1
cbx_1 cbx_1
rb_s1 rb_s1
rb_s2 rb_s2
end type
global w_rep_topoustandingdays w_rep_topoustandingdays

forward prototypes
public subroutine fn_sortdw ()
end prototypes

public subroutine fn_sortdw ();String lsSortField
if rb_s1.checked then
	lsSortField = 'Orders D'
else
	lsSortField = 'Volume D'
end if
	
dw_1.SetRedraw(false)
dw_1.SetSort(lsSortField)
dw_1.Sort()
dw_1.SetRedraw(true)	
end subroutine

on w_rep_topoustandingdays.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.cbx_1=create cbx_1
this.rb_s1=create rb_s1
this.rb_s2=create rb_s2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.rb_s1
this.Control[iCurrent+4]=this.rb_s2
end on

on w_rep_topoustandingdays.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_1)
destroy(this.cbx_1)
destroy(this.rb_s1)
destroy(this.rb_s2)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_topoustandingdays
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_topoustandingdays
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_topoustandingdays
integer x = 2647
integer taborder = 40
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
string 		ls_state

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
if cbx_1.checked then 

	if len(sle_1.text) <> 2 then
		Messagebox("Error","Please enter the state code",StopSign!)
		return
	end if
	
	ls_state  = sle_1.text
else
	ls_state = '-ALL-'
	sle_1.text = ''
end if
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_state)
fn_sortdw()
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_topoustandingdays
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_topoustandingdays
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_topoustandingdays
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_topoustandingdays
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_topoustandingdays
integer x = 0
integer y = 204
string dataobject = "dw_rep_topoustandingdays"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_topoustandingdays
integer x = 0
integer width = 3122
integer height = 192
end type

type sle_1 from singlelineedit within w_rep_topoustandingdays
integer x = 1705
integer y = 64
integer width = 183
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_rep_topoustandingdays
integer x = 1335
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
boolean enabled = false
string text = "Filter State:"
boolean checked = true
end type

event clicked;sle_1.enabled = this.checked
end event

type rb_s1 from radiobutton within w_rep_topoustandingdays
integer x = 2057
integer y = 44
integer width = 471
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Sort by Orders"
boolean checked = true
end type

event clicked;fn_sortdw()
end event

type rb_s2 from radiobutton within w_rep_topoustandingdays
integer x = 2057
integer y = 108
integer width = 471
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Sort by Volume"
end type

event clicked;fn_sortdw()
end event

