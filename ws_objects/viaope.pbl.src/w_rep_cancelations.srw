$PBExportHeader$w_rep_cancelations.srw
forward
global type w_rep_cancelations from w2_master_report_dates
end type
type rb_detailed from radiobutton within w_rep_cancelations
end type
type rb_summarized from radiobutton within w_rep_cancelations
end type
end forward

global type w_rep_cancelations from w2_master_report_dates
integer x = 214
integer y = 221
string title = "Cancelations Report"
rb_detailed rb_detailed
rb_summarized rb_summarized
end type
global w_rep_cancelations w_rep_cancelations

on w_rep_cancelations.create
int iCurrent
call super::create
this.rb_detailed=create rb_detailed
this.rb_summarized=create rb_summarized
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_detailed
this.Control[iCurrent+2]=this.rb_summarized
end on

on w_rep_cancelations.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_detailed)
destroy(this.rb_summarized)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_cancelations
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_cancelations
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_cancelations
integer x = 2322
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

DECLARE spGenReceiverStatistics PROCEDURE FOR dba.spGenReceiverStatistics @pd_date1 = :ld_fecha1, @pd_date2 = :ld_fecha2;
Execute spGenReceiverStatistics;

//if sqlca.sqlcode <> 0 then
//	Messagebox("",Sqlca.SqlErrText)
//end if

//commit;

if rb_detailed.checked then
	dw_1.DataObject = 'dw_rep_cancelations'
else
	dw_1.DataObject = 'dw_rep_cancelations_sum'	
end if

dw_1.SetTransObject(SQLCA)	

dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()

Setpointer(Arrow!)

end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_cancelations
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_cancelations
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_cancelations
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_cancelations
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_cancelations
string title = "Cancelations Report"
string dataobject = "dw_rep_cancelations"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_cancelations
integer width = 2734
end type

type rb_detailed from radiobutton within w_rep_cancelations
integer x = 1408
integer y = 72
integer width = 343
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Detailed"
boolean checked = true
end type

type rb_summarized from radiobutton within w_rep_cancelations
integer x = 1742
integer y = 72
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Summarized"
end type

