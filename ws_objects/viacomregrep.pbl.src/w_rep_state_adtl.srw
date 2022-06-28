$PBExportHeader$w_rep_state_adtl.srw
forward
global type w_rep_state_adtl from w2_master_report_dates_state
end type
end forward

global type w_rep_state_adtl from w2_master_report_dates_state
integer width = 3794
end type
global w_rep_state_adtl w_rep_state_adtl

type variables
n_tr		SQLCADEV
end variables

on w_rep_state_adtl.create
call super::create
end on

on w_rep_state_adtl.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates_state`st_4 within w_rep_state_adtl
end type

type st_3 from w2_master_report_dates_state`st_3 within w_rep_state_adtl
end type

type cb_query from w2_master_report_dates_state`cb_query within w_rep_state_adtl
integer x = 3022
end type

type pb_date1 from w2_master_report_dates_state`pb_date1 within w_rep_state_adtl
end type

type em_date1 from w2_master_report_dates_state`em_date1 within w_rep_state_adtl
end type

type pb_date2 from w2_master_report_dates_state`pb_date2 within w_rep_state_adtl
end type

type em_date2 from w2_master_report_dates_state`em_date2 within w_rep_state_adtl
end type

type dw_1 from w2_master_report_dates_state`dw_1 within w_rep_state_adtl
integer width = 3694
string dataobject = "dw_rep_state_adtl"
end type

event dw_1::constructor;

//// :::::::::::::::::::::::::::::::::::::::::
//// LOGIN DB CONNECTION
//SQLCADEV 				= Create n_tr
//SQLCADEV.DBMS = "SNC SQL Native Client(OLE DB)"
//SQLCADEV.DBParm = "Database='EnvioRep',TrimSpaces=1"
//SQLCADEV.LogPass 	= 'Xr3nrg101dbT.0p'
//SQLCADEV.ServerName = '192.168.11.120\VIASQLDEV'
//SQLCADEV.LogId 		= 'sa'
//SQLCADEV.AutoCommit = True
//// :::::::::::::::::::::::::::::::::::::::::		
//	
//
//if SQLCADEV.of_connect() <> 0 then
//	MessageBox("Cannot Connect", "Cannot Connect to ViaChecks Database~n~r" + SQLCADEV.sqlerrtext,stopsign!)
//	return	
//end if
//

//SetTransObject(SQLCADEV)

SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)

end event

type gb_1 from w2_master_report_dates_state`gb_1 within w_rep_state_adtl
integer width = 3557
end type

type lst_states from w2_master_report_dates_state`lst_states within w_rep_state_adtl
integer width = 1403
end type

event lst_states::constructor;lst_states.addquery("SELECT DISTINCT S.NAME_STATE, S.ID_STATE FROM DBA.BRANCH B, DBA.STATE S WHERE S.ID_STATE = B.ID_STATE AND B.ID_TYPE_BRANCH IN ('A','R') AND S.ID_COUNTRY = 'USA' UNION SELECT '- '+NAME_COMPANY, ID_COMPANY FROM DBA.COMPANY ORDER BY 1;")
end event

type st_1 from w2_master_report_dates_state`st_1 within w_rep_state_adtl
end type

