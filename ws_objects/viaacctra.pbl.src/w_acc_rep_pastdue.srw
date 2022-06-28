$PBExportHeader$w_acc_rep_pastdue.srw
forward
global type w_acc_rep_pastdue from w2_master_report_dates
end type
type dw_past_due_filter from datawindow within w_acc_rep_pastdue
end type
end forward

global type w_acc_rep_pastdue from w2_master_report_dates
integer x = 214
integer y = 221
windowstate windowstate = maximized!
dw_past_due_filter dw_past_due_filter
end type
global w_acc_rep_pastdue w_acc_rep_pastdue

on w_acc_rep_pastdue.create
int iCurrent
call super::create
this.dw_past_due_filter=create dw_past_due_filter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_past_due_filter
end on

on w_acc_rep_pastdue.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_past_due_filter)
end on

event open;call super::open;boolean  lb_collector 

dw_past_due_filter.insertrow(0)

SELECT IS_COLLECTOR
INTO: lb_collector
FROM dba.CASHIER
WHERE ID_CASHIER = :gs_cashier;

IF lb_collector THEN
	dw_past_due_filter.SetItem(1, "Collector", gs_cashier)
END IF



end event

type st_4 from w2_master_report_dates`st_4 within w_acc_rep_pastdue
boolean visible = false
end type

type st_3 from w2_master_report_dates`st_3 within w_acc_rep_pastdue
boolean visible = false
end type

type cb_query from w2_master_report_dates`cb_query within w_acc_rep_pastdue
integer x = 1253
integer y = 56
end type

event cb_query::clicked;string ls_collector_id
boolean lb_viasafe
integer li_rows

ls_collector_id = dw_past_due_filter.GetItemString(1, "Collector")

IF IsNull(ls_collector_id) THEN 
	RETURN
END IF

Setpointer(Hourglass!)

dw_1.dataobject = "dw_rep_past_due_by_collector"
dw_1.settransobject(SQLCArpt)

IF ls_collector_id <> "ALL" THEN 
	SELECT VIASAFE
	INTO: lb_viasafe
	FROM dba.CASHIER
	WHERE ID_CASHIER = :ls_collector_id;
	
	IF lb_viasafe THEN
		dw_1.dataobject = "dw_rep_past_due_viasafe_branches"
		dw_1.settransobject(SQLCArpt)
		li_rows = dw_1.retrieve()
	ELSE
		li_rows = dw_1.retrieve(ls_collector_id)
	END IF
ELSE
	li_rows = dw_1.retrieve(ls_collector_id)
END IF

dw_1.setfocus()

Setpointer(Arrow!)

IF li_rows = 0 THEN
	MessageBox("Alert","No Data was found")
END IF

end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_acc_rep_pastdue
boolean visible = false
end type

type em_date1 from w2_master_report_dates`em_date1 within w_acc_rep_pastdue
boolean visible = false
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_acc_rep_pastdue
boolean visible = false
end type

type em_date2 from w2_master_report_dates`em_date2 within w_acc_rep_pastdue
boolean visible = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_acc_rep_pastdue
string dataobject = "dw_rep_pastdue"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_acc_rep_pastdue
integer width = 1650
string text = ""
end type

type dw_past_due_filter from datawindow within w_acc_rep_pastdue
integer x = 73
integer y = 60
integer width = 1143
integer height = 84
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_past_due_filter"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransobject(SQLCA)
end event

