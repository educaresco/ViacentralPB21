$PBExportHeader$w_report_sales_rep_detail.srw
forward
global type w_report_sales_rep_detail from w2_master_report_dates
end type
type lst_manager from my_ddlb within w_report_sales_rep_detail
end type
type st_1 from st_4 within w_report_sales_rep_detail
end type
type sle_idbranch from singlelineedit within w_report_sales_rep_detail
end type
end forward

global type w_report_sales_rep_detail from w2_master_report_dates
integer width = 3209
integer height = 1924
string title = "Commission Detail"
lst_manager lst_manager
st_1 st_1
sle_idbranch sle_idbranch
end type
global w_report_sales_rep_detail w_report_sales_rep_detail

type variables
datetime idt_first_day_of_the_month, idt_last_day_of_the_month
end variables

on w_report_sales_rep_detail.create
int iCurrent
call super::create
this.lst_manager=create lst_manager
this.st_1=create st_1
this.sle_idbranch=create sle_idbranch
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_manager
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_idbranch
end on

on w_report_sales_rep_detail.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_manager)
destroy(this.st_1)
destroy(this.sle_idbranch)
end on

event open;call super::open;string s_id_Agent
date ld_today

ld_today = today()

select (dateadd(dd,-(day(dateadd(mm,1,:ld_today))-1),dateadd(mm,-1,:ld_today))) as firts_day,
		DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0)) as last_day,
		id_agent
into :idt_first_day_of_the_month, 
	  :idt_last_day_of_the_month, 
	  :s_id_Agent
from dba.agent
where id_agent = '35';


em_date1.text = string(date(idt_first_day_of_the_month))
em_date2.text = string(date(idt_last_day_of_the_month))


lst_manager.insertitem('ALL',1 )
lst_manager.text = 'ALL'
end event

type st_4 from w2_master_report_dates`st_4 within w_report_sales_rep_detail
integer x = 635
integer width = 91
end type

type st_3 from w2_master_report_dates`st_3 within w_report_sales_rep_detail
end type

type cb_query from w2_master_report_dates`cb_query within w_report_sales_rep_detail
integer x = 2725
integer y = 64
integer taborder = 50
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_agent_id, s_filter, ls_path, ls_id_agent, ls_name_agent
date  ld_repdate

Setpointer(Hourglass!)

ls_agent_id = lst_manager.getdataid()

//if ls_agent_id <> '' then
//	s_filter ="agent_id_agent = '" + ls_agent_id + " '"
//else
//	s_filter = ls_agent_id
//end if

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

//ld_repdate = today()

 dw_1.retrieve(ls_agent_id)
//dw_1.setfilter( s_filter )
//dw_1.filter()
dw_1.SetRedraw(true )



Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_report_sales_rep_detail
boolean visible = false
end type

type em_date1 from w2_master_report_dates`em_date1 within w_report_sales_rep_detail
boolean enabled = false
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_report_sales_rep_detail
boolean visible = false
integer x = 1088
end type

type em_date2 from w2_master_report_dates`em_date2 within w_report_sales_rep_detail
integer x = 736
boolean enabled = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_report_sales_rep_detail
string dataobject = "dw_commission_paid_to_agent_detail"
string is_updatesallowed = ""
end type

type gb_1 from w2_master_report_dates`gb_1 within w_report_sales_rep_detail
integer width = 3118
end type

type lst_manager from my_ddlb within w_report_sales_rep_detail
integer x = 1691
integer y = 68
integer width = 1010
integer height = 652
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("SELECT dba.AGENT.NAME_AGENT,   dba.AGENT.ID_AGENT   FROM dba.AGENT   WHERE dba.AGENT.STATUS_AGENT = 'A'    ;")
end event

event modified;call super::modified;sle_idbranch.text = lst_manager.getdataid()
end event

type st_1 from st_4 within w_report_sales_rep_detail
integer x = 1207
integer width = 206
boolean bringtotop = true
string text = "Agent:"
end type

type sle_idbranch from singlelineedit within w_report_sales_rep_detail
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

event modified;lst_manager.setselectedid( sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_manager.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF
end event

