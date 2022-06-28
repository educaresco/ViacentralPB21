$PBExportHeader$w2_master_report_dates_country.srw
forward
global type w2_master_report_dates_country from w2_master_report_dates
end type
type lst_countries from my_ddlb within w2_master_report_dates_country
end type
type st_1 from st_4 within w2_master_report_dates_country
end type
end forward

global type w2_master_report_dates_country from w2_master_report_dates
integer x = 214
integer y = 221
integer width = 3223
integer height = 1920
lst_countries lst_countries
st_1 st_1
end type
global w2_master_report_dates_country w2_master_report_dates_country

on w2_master_report_dates_country.create
int iCurrent
call super::create
this.lst_countries=create lst_countries
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_countries
this.Control[iCurrent+2]=this.st_1
end on

on w2_master_report_dates_country.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_countries)
destroy(this.st_1)
end on

type st_4 from w2_master_report_dates`st_4 within w2_master_report_dates_country
end type

type st_3 from w2_master_report_dates`st_3 within w2_master_report_dates_country
end type

type cb_query from w2_master_report_dates`cb_query within w2_master_report_dates_country
integer x = 2711
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_country_id

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_country_id = lst_countries.getdataid()
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_country_id)
dw_1.setfocus()

Setpointer(Arrow!)

end event

type pb_date1 from w2_master_report_dates`pb_date1 within w2_master_report_dates_country
end type

type em_date1 from w2_master_report_dates`em_date1 within w2_master_report_dates_country
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w2_master_report_dates_country
end type

type em_date2 from w2_master_report_dates`em_date2 within w2_master_report_dates_country
end type

type dw_1 from w2_master_report_dates`dw_1 within w2_master_report_dates_country
end type

type gb_1 from w2_master_report_dates`gb_1 within w2_master_report_dates_country
integer width = 3118
end type

type lst_countries from my_ddlb within w2_master_report_dates_country
integer x = 1527
integer y = 68
integer width = 1070
integer height = 1136
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;this.addquery("select name_country, ISO_C3 from dba.country where flag_country = 'A' order by name_country;")
end event

type st_1 from st_4 within w2_master_report_dates_country
integer x = 1307
integer width = 206
boolean bringtotop = true
string text = "Country:"
end type

