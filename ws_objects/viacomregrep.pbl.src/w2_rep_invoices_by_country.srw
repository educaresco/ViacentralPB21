$PBExportHeader$w2_rep_invoices_by_country.srw
forward
global type w2_rep_invoices_by_country from w2_master_report_dates_country
end type
end forward

global type w2_rep_invoices_by_country from w2_master_report_dates_country
end type
global w2_rep_invoices_by_country w2_rep_invoices_by_country

on w2_rep_invoices_by_country.create
call super::create
end on

on w2_rep_invoices_by_country.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type st_4 from w2_master_report_dates_country`st_4 within w2_rep_invoices_by_country
end type

type st_3 from w2_master_report_dates_country`st_3 within w2_rep_invoices_by_country
end type

type cb_query from w2_master_report_dates_country`cb_query within w2_rep_invoices_by_country
end type

type pb_date1 from w2_master_report_dates_country`pb_date1 within w2_rep_invoices_by_country
end type

type em_date1 from w2_master_report_dates_country`em_date1 within w2_rep_invoices_by_country
end type

type pb_date2 from w2_master_report_dates_country`pb_date2 within w2_rep_invoices_by_country
end type

type em_date2 from w2_master_report_dates_country`em_date2 within w2_rep_invoices_by_country
end type

type dw_1 from w2_master_report_dates_country`dw_1 within w2_rep_invoices_by_country
string dataobject = "dw2_rep_invoices_by_country"
end type

type gb_1 from w2_master_report_dates_country`gb_1 within w2_rep_invoices_by_country
end type

type lst_countries from w2_master_report_dates_country`lst_countries within w2_rep_invoices_by_country
end type

event lst_countries::constructor;//[CLONDONO][2013-07-24]  Modified the ancestor's original query so that now it also includes the available companies in the list
this.addquery("select name_country, ISO_C3 from dba.country where flag_country = 'A'  UNION SELECT '- '+NAME_COMPANY, ID_COMPANY FROM DBA.COMPANY ORDER BY 1;")
//[CLONDONO][2013-07-24]  END
end event

type st_1 from w2_master_report_dates_country`st_1 within w2_rep_invoices_by_country
end type

