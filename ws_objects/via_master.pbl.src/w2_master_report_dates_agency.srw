$PBExportHeader$w2_master_report_dates_agency.srw
forward
global type w2_master_report_dates_agency from w2_master_report_dates
end type
type lst_agencies from my_ddlb within w2_master_report_dates_agency
end type
type st_1 from st_4 within w2_master_report_dates_agency
end type
type sle_idbranch from singlelineedit within w2_master_report_dates_agency
end type
end forward

global type w2_master_report_dates_agency from w2_master_report_dates
lst_agencies lst_agencies
st_1 st_1
sle_idbranch sle_idbranch
end type
global w2_master_report_dates_agency w2_master_report_dates_agency

on w2_master_report_dates_agency.create
int iCurrent
call super::create
this.lst_agencies=create lst_agencies
this.st_1=create st_1
this.sle_idbranch=create sle_idbranch
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_agencies
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_idbranch
end on

on w2_master_report_dates_agency.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_agencies)
destroy(this.st_1)
destroy(this.sle_idbranch)
end on

type st_4 from w2_master_report_dates`st_4 within w2_master_report_dates_agency
integer x = 663
integer width = 91
end type

type st_3 from w2_master_report_dates`st_3 within w2_master_report_dates_agency
end type

type cb_query from w2_master_report_dates`cb_query within w2_master_report_dates_agency
integer x = 2725
integer taborder = 50
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_branch_id

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_branch_id = lst_agencies.getdataid()
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_branch_id)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w2_master_report_dates_agency
end type

type em_date1 from w2_master_report_dates`em_date1 within w2_master_report_dates_agency
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w2_master_report_dates_agency
integer x = 1088
end type

type em_date2 from w2_master_report_dates`em_date2 within w2_master_report_dates_agency
integer x = 763
end type

type dw_1 from w2_master_report_dates`dw_1 within w2_master_report_dates_agency
end type

type gb_1 from w2_master_report_dates`gb_1 within w2_master_report_dates_agency
integer width = 3118
end type

type lst_agencies from my_ddlb within w2_master_report_dates_agency
integer x = 1691
integer y = 68
integer width = 1010
integer height = 1504
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O' order by name_branch;")
end event

event modified;call super::modified;sle_idbranch.text = lst_agencies.getdataid()
sle_idbranch.TextColor	= RGB(0,0,0)
end event

type st_1 from st_4 within w2_master_report_dates_agency
integer x = 1207
integer width = 206
boolean bringtotop = true
string text = "Agency:"
end type

type sle_idbranch from singlelineedit within w2_master_report_dates_agency
integer x = 1422
integer y = 68
integer width = 265
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
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_agencies.setselectedid( sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_agencies.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF
end event

