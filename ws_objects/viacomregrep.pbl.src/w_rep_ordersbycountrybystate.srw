$PBExportHeader$w_rep_ordersbycountrybystate.srw
forward
global type w_rep_ordersbycountrybystate from w2_master_report_dates
end type
type sle_1 from singlelineedit within w_rep_ordersbycountrybystate
end type
type cbx_1 from checkbox within w_rep_ordersbycountrybystate
end type
type lst_states from my_ddlb within w_rep_ordersbycountrybystate
end type
type st_1 from statictext within w_rep_ordersbycountrybystate
end type
end forward

global type w_rep_ordersbycountrybystate from w2_master_report_dates
integer x = 214
integer y = 221
integer width = 3602
integer height = 1920
sle_1 sle_1
cbx_1 cbx_1
lst_states lst_states
st_1 st_1
end type
global w_rep_ordersbycountrybystate w_rep_ordersbycountrybystate

on w_rep_ordersbycountrybystate.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.cbx_1=create cbx_1
this.lst_states=create lst_states
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.lst_states
this.Control[iCurrent+4]=this.st_1
end on

on w_rep_ordersbycountrybystate.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_1)
destroy(this.cbx_1)
destroy(this.lst_states)
destroy(this.st_1)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_ordersbycountrybystate
integer y = 96
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_ordersbycountrybystate
integer y = 96
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_ordersbycountrybystate
integer x = 3131
integer y = 80
integer taborder = 40
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
string 		ls_state

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
//[CLONDONO][2013-07-25] Modified the way the state parameter is achieved, because now it's also necessary to retrieve the available companies
//if cbx_1.checked then 
//
//	if len(sle_1.text) <> 2 then
//		Messagebox("Error","Please enter the state code",StopSign!)
//		return
//	end if
//	
//	ls_state  = sle_1.text
//else
//	ls_state = '-ALL-'
//	sle_1.text = ''
//end if
ls_state = lst_states.getdataid()
//[CLONDONO][2013-07-25]  END
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_state)
dw_1.setfocus()

Setpointer(Arrow!)

/*
--Datetime		ld_fecha1, ld_fecha2
String		ls_state_id

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_state_id = lst_states.getdataid()
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_state_id)
dw_1.setfocus()

Setpointer(Arrow!)

*/
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_ordersbycountrybystate
integer y = 76
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_ordersbycountrybystate
integer y = 80
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_ordersbycountrybystate
integer y = 76
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_ordersbycountrybystate
integer y = 80
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_ordersbycountrybystate
integer x = 0
integer y = 204
integer width = 3547
string dataobject = "dw_rep_ordersbycountrybystate"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_ordersbycountrybystate
integer x = 0
integer width = 3538
integer height = 192
end type

type sle_1 from singlelineedit within w_rep_ordersbycountrybystate
boolean visible = false
integer x = 1518
integer y = 56
integer width = 183
integer height = 84
integer taborder = 50
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

type cbx_1 from checkbox within w_rep_ordersbycountrybystate
boolean visible = false
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
string text = "Filter State:"
boolean checked = true
end type

event clicked;sle_1.enabled = this.checked
end event

type lst_states from my_ddlb within w_rep_ordersbycountrybystate
integer x = 1664
integer y = 80
integer width = 1349
integer height = 532
integer taborder = 30
boolean bringtotop = true
end type

event constructor;call super::constructor;//[CLONDONO][2013-07-25]  This query retrieves the states and the available companies
lst_states.addquery("SELECT DISTINCT S.NAME_STATE, S.ID_STATE FROM DBA.BRANCH B, DBA.STATE S WHERE S.ID_STATE = B.ID_STATE AND B.ID_TYPE_BRANCH IN ('A','R') AND S.ID_COUNTRY = 'USA' UNION SELECT '- '+NAME_COMPANY, ID_COMPANY FROM DBA.COMPANY ORDER BY 1;")
//[CLONDONO][2013-07-25]  END
end event

type st_1 from statictext within w_rep_ordersbycountrybystate
integer x = 1417
integer y = 96
integer width = 201
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "State:"
boolean focusrectangle = false
end type

