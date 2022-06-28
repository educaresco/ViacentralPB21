$PBExportHeader$w_creditwatermarks.srw
forward
global type w_creditwatermarks from w2_master_report_dates_agency
end type
type cbx_filter from checkbox within w_creditwatermarks
end type
end forward

global type w_creditwatermarks from w2_master_report_dates_agency
integer width = 3465
string title = "Credit Watermarks"
cbx_filter cbx_filter
end type
global w_creditwatermarks w_creditwatermarks

on w_creditwatermarks.create
int iCurrent
call super::create
this.cbx_filter=create cbx_filter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_filter
end on

on w_creditwatermarks.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_filter)
end on

type st_4 from w2_master_report_dates_agency`st_4 within w_creditwatermarks
end type

type st_3 from w2_master_report_dates_agency`st_3 within w_creditwatermarks
end type

type cb_query from w2_master_report_dates_agency`cb_query within w_creditwatermarks
integer x = 2976
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_branch_id, ls_group

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

if cbx_filter.checked then
	ls_branch_id = lst_agencies.getdataid()
	
	SetNull (ls_group)
	
	select id_main_branch
	into :ls_group
	from dba.branch
	where id_branch = :ls_branch_id;
	
	if isnull(ls_group) then	
		Messagebox("Error","Please select a valid branch",StopSign!)
		return	
	end if		
	
else
	ls_group = '-ALL-'
end if

dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_group)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates_agency`pb_date1 within w_creditwatermarks
end type

type em_date1 from w2_master_report_dates_agency`em_date1 within w_creditwatermarks
end type

type pb_date2 from w2_master_report_dates_agency`pb_date2 within w_creditwatermarks
end type

type em_date2 from w2_master_report_dates_agency`em_date2 within w_creditwatermarks
end type

type dw_1 from w2_master_report_dates_agency`dw_1 within w_creditwatermarks
integer width = 3374
string dataobject = "dw_creditwatermarks"
end type

type gb_1 from w2_master_report_dates_agency`gb_1 within w_creditwatermarks
integer width = 3374
end type

type lst_agencies from w2_master_report_dates_agency`lst_agencies within w_creditwatermarks
integer x = 1943
boolean enabled = false
end type

type st_1 from w2_master_report_dates_agency`st_1 within w_creditwatermarks
integer x = 1458
end type

type sle_idbranch from w2_master_report_dates_agency`sle_idbranch within w_creditwatermarks
integer x = 1673
boolean enabled = false
end type

type cbx_filter from checkbox within w_creditwatermarks
integer x = 1371
integer y = 76
integer width = 69
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

event clicked;
sle_idbranch.enabled =  this.checked
lst_agencies.enabled =  this.checked
end event

