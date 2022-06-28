$PBExportHeader$w2_master_report_dates_state.srw
forward
global type w2_master_report_dates_state from w2_master_report_dates
end type
type lst_states from my_ddlb within w2_master_report_dates_state
end type
type st_1 from st_4 within w2_master_report_dates_state
end type
end forward

global type w2_master_report_dates_state from w2_master_report_dates
integer x = 214
integer y = 221
integer width = 3223
integer height = 1920
lst_states lst_states
st_1 st_1
end type
global w2_master_report_dates_state w2_master_report_dates_state

on w2_master_report_dates_state.create
int iCurrent
call super::create
this.lst_states=create lst_states
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_states
this.Control[iCurrent+2]=this.st_1
end on

on w2_master_report_dates_state.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_states)
destroy(this.st_1)
end on

type st_4 from w2_master_report_dates`st_4 within w2_master_report_dates_state
end type

type st_3 from w2_master_report_dates`st_3 within w2_master_report_dates_state
end type

type cb_query from w2_master_report_dates`cb_query within w2_master_report_dates_state
integer x = 2711
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_state_id

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_state_id = lst_states.getdataid()
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_state_id)
dw_1.setfocus()

Setpointer(Arrow!)

end event

type pb_date1 from w2_master_report_dates`pb_date1 within w2_master_report_dates_state
end type

type em_date1 from w2_master_report_dates`em_date1 within w2_master_report_dates_state
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w2_master_report_dates_state
end type

type em_date2 from w2_master_report_dates`em_date2 within w2_master_report_dates_state
end type

type dw_1 from w2_master_report_dates`dw_1 within w2_master_report_dates_state
end type

type gb_1 from w2_master_report_dates`gb_1 within w2_master_report_dates_state
integer width = 3118
end type

type lst_states from my_ddlb within w2_master_report_dates_state
integer x = 1527
integer y = 68
integer width = 1070
integer height = 1136
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_states.addquery("SELECT DISTINCT S.NAME_STATE, S.ID_STATE FROM DBA.BRANCH B, DBA.STATE S WHERE S.ID_STATE = B.ID_STATE AND B.ID_TYPE_BRANCH IN ('A','R') AND S.ID_COUNTRY = 'USA' ORDER BY NAME_STATE;")
end event

type st_1 from st_4 within w2_master_report_dates_state
integer x = 1358
integer width = 155
boolean bringtotop = true
string text = "State:"
end type

