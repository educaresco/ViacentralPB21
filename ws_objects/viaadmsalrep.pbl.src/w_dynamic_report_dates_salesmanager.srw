$PBExportHeader$w_dynamic_report_dates_salesmanager.srw
forward
global type w_dynamic_report_dates_salesmanager from w2_master_report_dates
end type
type lst_manager from my_ddlb within w_dynamic_report_dates_salesmanager
end type
type st_1 from st_4 within w_dynamic_report_dates_salesmanager
end type
type sle_idbranch from singlelineedit within w_dynamic_report_dates_salesmanager
end type
end forward

global type w_dynamic_report_dates_salesmanager from w2_master_report_dates
integer width = 3241
integer height = 1992
lst_manager lst_manager
st_1 st_1
sle_idbranch sle_idbranch
end type
global w_dynamic_report_dates_salesmanager w_dynamic_report_dates_salesmanager

type variables
datetime idt_first_day_of_the_month, idt_last_day_of_the_month
end variables

on w_dynamic_report_dates_salesmanager.create
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

on w_dynamic_report_dates_salesmanager.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_manager)
destroy(this.st_1)
destroy(this.sle_idbranch)
end on

event open;call super::open;string s_id_Agent
date ld_today

ld_today = today()

select (dateadd(dd,-(day(dateadd(mm,1,GETDATE()))-1),dateadd(mm,-1,GETDATE()))) as firts_day,
		DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0)) as last_day
into :idt_first_day_of_the_month, 
	  :idt_last_day_of_the_month
from dba.DUAL;


em_date1.text = string(date(idt_first_day_of_the_month))
em_date2.text = string(date(idt_last_day_of_the_month))


string s_parm

s_parm = Message.StringParm
dw_1.dataobject = fn_token(s_parm,'/',1)
this.title = fn_token(s_parm,'/',2)


if dw_1.dataobject = 'dw_progress_report_bymanager' then
lst_manager.insertitem('ALL',1 )
lst_manager.text = 'ALL'
end if
end event

type st_4 from w2_master_report_dates`st_4 within w_dynamic_report_dates_salesmanager
integer x = 672
integer width = 91
end type

type st_3 from w2_master_report_dates`st_3 within w_dynamic_report_dates_salesmanager
end type

type cb_query from w2_master_report_dates`cb_query within w_dynamic_report_dates_salesmanager
integer x = 2725
integer y = 64
integer taborder = 50
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_agent_id, s_filter, ls_id_agent_sec, ls_id_sales_rep[ ]
double ld_pos

Setpointer(Hourglass!)

ls_agent_id = lst_manager.getdataid()

//if ls_agent_id <> '' then
//	s_filter ="branch.id_agent = '" + ls_agent_id + " '"
//else
//	s_filter = ls_agent_id
//end if

DECLARE CR_ID_AGENT CURSOR FOR
SELECT ID_AGENT
FROM DBA.AGENT
WHERE ID_MANAGER = :ls_agent_id;

OPEN CR_ID_AGENT;

FETCH CR_ID_AGENT INTO :ls_id_agent_sec;

ld_pos = 1

DO WHILE SQLCA.SQLCODE <> 100 
	
	ls_id_sales_rep[ld_pos]= ls_id_agent_sec
	
	ld_pos = ld_pos + 1
	
	
	
	
FETCH CR_ID_AGENT INTO :ls_id_agent_sec;

LOOP

CLOSE CR_ID_AGENT;



	

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

dw_1.settransobject(sqlca)
dw_1.retrieve(ld_fecha1,ld_fecha2, ls_id_sales_rep,ls_agent_id )
//dw_1.setfilter( s_filter )
//dw_1.filter()
dw_1.SetRedraw(true )



Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_dynamic_report_dates_salesmanager
end type

type em_date1 from w2_master_report_dates`em_date1 within w_dynamic_report_dates_salesmanager
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_dynamic_report_dates_salesmanager
integer x = 1115
integer width = 110
end type

type em_date2 from w2_master_report_dates`em_date2 within w_dynamic_report_dates_salesmanager
integer x = 773
end type

type dw_1 from w2_master_report_dates`dw_1 within w_dynamic_report_dates_salesmanager
integer width = 3154
integer height = 1584
string dataobject = "dw_progress_report_filtering_by_agent"
end type

event dw_1::sqlpreview;call super::sqlpreview;string s

s =''
end event

type gb_1 from w2_master_report_dates`gb_1 within w_dynamic_report_dates_salesmanager
integer width = 3150
end type

type lst_manager from my_ddlb within w_dynamic_report_dates_salesmanager
integer x = 1691
integer y = 68
integer width = 1010
integer height = 652
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("SELECT dba.AGENT.NAME_AGENT,   dba.AGENT.ID_AGENT   FROM dba.AGENT   WHERE dba.AGENT.STATUS_AGENT = 'A'  AND DBA.AGENT.MANAGER = 'Y'  ;")
end event

event modified;call super::modified;sle_idbranch.text = lst_manager.getdataid()
end event

type st_1 from st_4 within w_dynamic_report_dates_salesmanager
integer x = 1207
integer width = 206
boolean bringtotop = true
string text = "Agent:"
end type

type sle_idbranch from singlelineedit within w_dynamic_report_dates_salesmanager
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

