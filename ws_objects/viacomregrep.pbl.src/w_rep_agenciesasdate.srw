$PBExportHeader$w_rep_agenciesasdate.srw
forward
global type w_rep_agenciesasdate from w2_master_report_dates
end type
type cbx_filterdummies from checkbox within w_rep_agenciesasdate
end type
end forward

global type w_rep_agenciesasdate from w2_master_report_dates
cbx_filterdummies cbx_filterdummies
end type
global w_rep_agenciesasdate w_rep_agenciesasdate

on w_rep_agenciesasdate.create
int iCurrent
call super::create
this.cbx_filterdummies=create cbx_filterdummies
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_filterdummies
end on

on w_rep_agenciesasdate.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_filterdummies)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_agenciesasdate
boolean visible = false
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_agenciesasdate
integer x = 96
string text = "Date:"
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_agenciesasdate
integer x = 2254
end type

event cb_query::clicked;Datetime		ld_fecha1
String ls_filter


Setpointer(Hourglass!)

if cbx_filterdummies.checked then
	ls_filter = 'Y'
else
	ls_filter = 'N'
end if

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
dw_1.retrieve(ld_fecha1,ls_filter)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_agenciesasdate
integer x = 594
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_agenciesasdate
integer x = 270
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_agenciesasdate
boolean visible = false
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_agenciesasdate
boolean visible = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_agenciesasdate
string dataobject = "dw_rep_agenciesasdate"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_agenciesasdate
integer x = 37
integer width = 2697
integer height = 192
string text = ""
end type

type cbx_filterdummies from checkbox within w_rep_agenciesasdate
integer x = 759
integer y = 72
integer width = 1280
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Do not Include Administrative Accounts"
boolean checked = true
end type

