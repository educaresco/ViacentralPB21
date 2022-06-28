$PBExportHeader$w_agency_owner_list.srw
forward
global type w_agency_owner_list from w2_master_report_dates
end type
end forward

global type w_agency_owner_list from w2_master_report_dates
integer width = 3223
integer height = 1880
end type
global w_agency_owner_list w_agency_owner_list

on w_agency_owner_list.create
call super::create
end on

on w_agency_owner_list.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;string s_user_validation


SELECT ID_USER
INTO :s_user_validation
FROM dba.SEC_USER_GROUP
WHERE ID_GROUP = 'AOF' and
		  ID_USER = :gs_cashier ;
		  		  		  
		  
IF SQLCA.SQLCODE = 0  THEN
	
	dw_1.dataobject = 'dw_agency_owner_list_ssn'
	
END IF
		  
		  

end event

type st_4 from w2_master_report_dates`st_4 within w_agency_owner_list
boolean visible = false
end type

type st_3 from w2_master_report_dates`st_3 within w_agency_owner_list
boolean visible = false
end type

type cb_query from w2_master_report_dates`cb_query within w_agency_owner_list
integer x = 18
integer y = 32
end type

event cb_query::clicked;
Setpointer(Hourglass!)

dw_1.settransobject(sqlca)

dw_1.retrieve()
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_agency_owner_list
boolean visible = false
end type

type em_date1 from w2_master_report_dates`em_date1 within w_agency_owner_list
boolean visible = false
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_agency_owner_list
boolean visible = false
end type

type em_date2 from w2_master_report_dates`em_date2 within w_agency_owner_list
boolean visible = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_agency_owner_list
integer y = 148
string dataobject = "dw_agency_owner_list"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_agency_owner_list
boolean visible = false
end type

