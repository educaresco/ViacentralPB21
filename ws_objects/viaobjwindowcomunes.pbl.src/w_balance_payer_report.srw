$PBExportHeader$w_balance_payer_report.srw
forward
global type w_balance_payer_report from w2_master_report_dates
end type
type lst_payers from my_ddlb within w_balance_payer_report
end type
type st_1 from st_4 within w_balance_payer_report
end type
type sle_payer from singlelineedit within w_balance_payer_report
end type
type st_2 from st_4 within w_balance_payer_report
end type
type lst_currency from my_ddlb within w_balance_payer_report
end type
type rb_trans from radiobutton within w_balance_payer_report
end type
type rb_conf from radiobutton within w_balance_payer_report
end type
end forward

global type w_balance_payer_report from w2_master_report_dates
integer x = 214
integer y = 221
integer width = 3749
integer height = 1940
lst_payers lst_payers
st_1 st_1
sle_payer sle_payer
st_2 st_2
lst_currency lst_currency
rb_trans rb_trans
rb_conf rb_conf
end type
global w_balance_payer_report w_balance_payer_report

on w_balance_payer_report.create
int iCurrent
call super::create
this.lst_payers=create lst_payers
this.st_1=create st_1
this.sle_payer=create sle_payer
this.st_2=create st_2
this.lst_currency=create lst_currency
this.rb_trans=create rb_trans
this.rb_conf=create rb_conf
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_payers
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_payer
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.lst_currency
this.Control[iCurrent+6]=this.rb_trans
this.Control[iCurrent+7]=this.rb_conf
end on

on w_balance_payer_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_payers)
destroy(this.st_1)
destroy(this.sle_payer)
destroy(this.st_2)
destroy(this.lst_currency)
destroy(this.rb_trans)
destroy(this.rb_conf)
end on

event open;call super::open;DATETIME dt_first_day_month

//lst_currency.insertitem('ALL',1 )
//	lst_currency.text = 'ALL'

SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(getdate())-1),getdate()),101)
INTO :dt_first_day_month
FROM DBA.DUAL;


EM_DATE1.TEXT = STRING(DATE(dt_first_day_month))



end event

event closequery;// COMMENT TO AVOID THE QUESTION FOR SAVE AT CLOSING
end event

type st_4 from w2_master_report_dates`st_4 within w_balance_payer_report
integer x = 681
end type

type st_3 from w2_master_report_dates`st_3 within w_balance_payer_report
end type

type cb_query from w2_master_report_dates`cb_query within w_balance_payer_report
integer x = 3227
integer y = 52
integer taborder = 50
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2, ld_date_from, ld_date_to
String		ls_payer_id, ls_currency_id, ls_filter, ls_validate
double ld_validate, ld_day, ld_month, ld_year, ld_total_2, ld_dollar_value, ld_exchange_rate, ld_national_value, ld_balance_day_before
double ld_balance_nat_day_before


Setpointer(Hourglass!)

IF rb_trans.checked = TRUE THEN
	
	dw_1.dataobject = 'dw_payer_balance_report'

	
else
	
	dw_1.dataobject = 'dw_payer_balance_report_cpc'
	
	
END IF
	
	
	
dw_1.settransobject(sqlca)


ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

ls_payer_id = lst_payers.getdataid()
ls_currency_id = lst_currency.getdataid()
if ls_currency_id <> '' then
ls_filter = " group_balance_id_currency = '" + ls_currency_id + " '"
else
ls_filter = ls_currency_id
end if

SELECT DATEADD(DD, 0, DATEDIFF(DD, 0,:ld_fecha1 )) - 1 
INTO :ld_date_from
FROM DBA.DUAL;	

ls_validate = '' 

SELECT ID_CONCEPTO_CONTABLE
INTO :ls_validate
FROM DBA.GROUP_BALANCE
WHERE ID_CONCEPTO_CONTABLE = 'BI'
AND DATE_GROUP_BALANCE = :ld_fecha1;

IF SQLCA.SQLCODE = 100 THEN

	if dw_1.dataobject = 'dw_payer_balance_report_cpc' then
	

		SELECT (sum(debit)- sum(credit)),(sum(debit_foreign_amount) - sum(credit_foreign_amount))
		INTO :ld_balance_day_before, :ld_balance_nat_day_before
		FROM dba.group_balance
		WHERE date_group_balance BETWEEN '01-01-2010 00:00:00' AND :ld_fecha1
		AND id_currency = :ls_currency_id
		AND (ID_CONCEPTO_CONTABLE not in ('TP', 'CP','CPE') )      
		AND id_main_branch = :ls_payer_id;
	
	else
	
		SELECT (sum(debit)- sum(credit)),(sum(debit_foreign_amount) - sum(credit_foreign_amount))
		INTO :ld_balance_day_before, :ld_balance_nat_day_before
		FROM dba.group_balance
		WHERE date_group_balance BETWEEN '01-01-2010 00:00:00' AND :ld_fecha1
		AND id_currency = :ls_currency_id
		AND (ID_CONCEPTO_CONTABLE not in ('CPC','PB' ) )      
		AND id_main_branch = :ls_payer_id;
	
	END IF

END IF

dw_1.retrieve(ls_payer_id, ld_Fecha1,ld_Fecha2)

dw_1.setfilter( ls_filter )
dw_1.filter()
dw_1.SetRedraw(true )

IF ls_validate <> 'BI' THEN

	dw_1.insertrow(1)
	dw_1.setitem(1,'group_balance_date_group_balance',ld_fecha1)
	dw_1.setitem(1,'group_balance_description','INITIAL BALANCE')
	dw_1.setitem(1,'group_balance_debit',ld_balance_day_before)
	dw_1.setitem(1,'group_balance_credit',0)
	dw_1.setitem(1,'group_balance_debit_foreign_amount',ld_balance_nat_day_before)
	dw_1.setitem(1,'group_balance_credit_foreign_amount',0)
	dw_1.setfocus()

END IF




Setpointer(Arrow!)

end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_balance_payer_report
end type

type em_date1 from w2_master_report_dates`em_date1 within w_balance_payer_report
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_balance_payer_report
integer x = 1115
end type

type em_date2 from w2_master_report_dates`em_date2 within w_balance_payer_report
integer x = 791
end type

type dw_1 from w2_master_report_dates`dw_1 within w_balance_payer_report
integer y = 328
integer width = 3653
integer height = 1372
string dataobject = "dw_payer_balance_report"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_balance_payer_report
integer x = 23
integer y = 4
integer width = 3639
integer height = 300
end type

type lst_payers from my_ddlb within w_balance_payer_report
integer x = 1691
integer y = 68
integer width = 983
integer height = 1136
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_payers.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type IN ('P','A') order by name_main_branch;")
end event

event selectionchanged;call super::selectionchanged;string  ls_payer, ls_currency

sle_payer.text = lst_payers.getdataid()

ls_payer =  lst_payers.getdataid()

select distinct id_currency
into :ls_currency
from dba.group_balance a , dba.currency b
where a.id_currency = b.id_curreny
and a.date_group_balance > (SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(getdate())-1),getdate()),101) )
and a.id_main_branch = :ls_payer
and isnull(id_currency,'') <> '';


if not isnull(ls_currency) and ls_currency <> '' then


	lst_currency.addquery("select distinct name_currency, id_currency from dba.group_balance a , dba.currency b where  a.id_currency = b.id_curreny and a.date_group_balance > (SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(getdate())-1),getdate()),101) ) and a.id_main_branch = '"+ ls_payer + "' and isnull(id_currency,'') <> '';")

else
	
	lst_currency.addquery("select name_currency, id_curreny from dba.currency  order by name_currency;")


end if
end event

type st_1 from st_4 within w_balance_payer_report
integer x = 1243
integer width = 155
boolean bringtotop = true
string text = "Payer:"
end type

type sle_payer from singlelineedit within w_balance_payer_report
integer x = 1417
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

event modified;lst_payers.setselectedid( sle_payer.text )

// Chequea que este en la lista
IF sle_payer.text <> lst_payers.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF
end event

type st_2 from st_4 within w_balance_payer_report
integer x = 1170
integer y = 200
integer width = 229
boolean bringtotop = true
string text = "Currency:"
end type

type lst_currency from my_ddlb within w_balance_payer_report
integer x = 1417
integer y = 196
integer width = 1262
integer height = 1136
integer taborder = 50
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_currency.addquery("select name_currency, id_curreny from dba.currency  order by name_currency;")
end event

type rb_trans from radiobutton within w_balance_payer_report
integer x = 2706
integer y = 80
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Trans."
boolean checked = true
end type

type rb_conf from radiobutton within w_balance_payer_report
integer x = 2971
integer y = 80
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Conf."
end type

