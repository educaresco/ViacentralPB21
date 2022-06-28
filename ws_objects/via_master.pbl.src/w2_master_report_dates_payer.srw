$PBExportHeader$w2_master_report_dates_payer.srw
forward
global type w2_master_report_dates_payer from w2_master_report_dates
end type
type lst_payers from my_ddlb within w2_master_report_dates_payer
end type
type st_1 from st_4 within w2_master_report_dates_payer
end type
type sle_payer from singlelineedit within w2_master_report_dates_payer
end type
end forward

global type w2_master_report_dates_payer from w2_master_report_dates
integer width = 3223
integer height = 1920
lst_payers lst_payers
st_1 st_1
sle_payer sle_payer
end type
global w2_master_report_dates_payer w2_master_report_dates_payer

on w2_master_report_dates_payer.create
int iCurrent
call super::create
this.lst_payers=create lst_payers
this.st_1=create st_1
this.sle_payer=create sle_payer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_payers
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_payer
end on

on w2_master_report_dates_payer.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_payers)
destroy(this.st_1)
destroy(this.sle_payer)
end on

type st_4 from w2_master_report_dates`st_4 within w2_master_report_dates_payer
integer x = 681
end type

type st_3 from w2_master_report_dates`st_3 within w2_master_report_dates_payer
end type

type cb_query from w2_master_report_dates`cb_query within w2_master_report_dates_payer
integer x = 2711
integer taborder = 50
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_payer_id

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_payer_id = lst_payers.getdataid()
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_payer_id)
dw_1.setfocus()

Setpointer(Arrow!)

end event

type pb_date1 from w2_master_report_dates`pb_date1 within w2_master_report_dates_payer
end type

type em_date1 from w2_master_report_dates`em_date1 within w2_master_report_dates_payer
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w2_master_report_dates_payer
integer x = 1115
end type

type em_date2 from w2_master_report_dates`em_date2 within w2_master_report_dates_payer
integer x = 791
end type

type dw_1 from w2_master_report_dates`dw_1 within w2_master_report_dates_payer
end type

type gb_1 from w2_master_report_dates`gb_1 within w2_master_report_dates_payer
integer width = 3118
end type

type lst_payers from my_ddlb within w2_master_report_dates_payer
integer x = 1691
integer y = 68
integer width = 983
integer height = 1136
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_payers.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type IN ('P','A') order by name_main_branch;")
end event

event selectionchanged;call super::selectionchanged;sle_payer.text = lst_payers.getdataid()
end event

type st_1 from st_4 within w2_master_report_dates_payer
integer x = 1243
integer width = 155
boolean bringtotop = true
string text = "Payer:"
end type

type sle_payer from singlelineedit within w2_master_report_dates_payer
integer x = 1417
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

event modified;lst_payers.setselectedid( sle_payer.text )

// Chequea que este en la lista
IF sle_payer.text <> lst_payers.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF
end event

