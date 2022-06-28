$PBExportHeader$w_market_rates_prices.srw
forward
global type w_market_rates_prices from w_master
end type
type st_hide from statictext within w_market_rates_prices
end type
type cb_save from commandbutton within w_market_rates_prices
end type
type st_8 from statictext within w_market_rates_prices
end type
type lst_amount from my_ddlb within w_market_rates_prices
end type
type st_7 from statictext within w_market_rates_prices
end type
type st_6 from statictext within w_market_rates_prices
end type
type em_rate from editmask within w_market_rates_prices
end type
type em_pricepremium from editmask within w_market_rates_prices
end type
type st_5 from statictext within w_market_rates_prices
end type
type st_4 from statictext within w_market_rates_prices
end type
type st_3 from statictext within w_market_rates_prices
end type
type st_2 from statictext within w_market_rates_prices
end type
type em_pricestandard from editmask within w_market_rates_prices
end type
type lst_country from my_ddlb within w_market_rates_prices
end type
type lst_company from my_ddlb within w_market_rates_prices
end type
type em_date_new from editmask within w_market_rates_prices
end type
type cb_query from commandbutton within w_market_rates_prices
end type
type em_date from editmask within w_market_rates_prices
end type
type st_1 from statictext within w_market_rates_prices
end type
type dw_1 from datawindow within w_market_rates_prices
end type
type gb_1 from groupbox within w_market_rates_prices
end type
end forward

global type w_market_rates_prices from w_master
integer width = 4599
integer height = 2556
string title = "Market Rates / Prices"
st_hide st_hide
cb_save cb_save
st_8 st_8
lst_amount lst_amount
st_7 st_7
st_6 st_6
em_rate em_rate
em_pricepremium em_pricepremium
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
em_pricestandard em_pricestandard
lst_country lst_country
lst_company lst_company
em_date_new em_date_new
cb_query cb_query
em_date em_date
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_market_rates_prices w_market_rates_prices

forward prototypes
public subroutine fn_refresh ()
end prototypes

public subroutine fn_refresh ();return
end subroutine

on w_market_rates_prices.create
int iCurrent
call super::create
this.st_hide=create st_hide
this.cb_save=create cb_save
this.st_8=create st_8
this.lst_amount=create lst_amount
this.st_7=create st_7
this.st_6=create st_6
this.em_rate=create em_rate
this.em_pricepremium=create em_pricepremium
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.em_pricestandard=create em_pricestandard
this.lst_country=create lst_country
this.lst_company=create lst_company
this.em_date_new=create em_date_new
this.cb_query=create cb_query
this.em_date=create em_date
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_hide
this.Control[iCurrent+2]=this.cb_save
this.Control[iCurrent+3]=this.st_8
this.Control[iCurrent+4]=this.lst_amount
this.Control[iCurrent+5]=this.st_7
this.Control[iCurrent+6]=this.st_6
this.Control[iCurrent+7]=this.em_rate
this.Control[iCurrent+8]=this.em_pricepremium
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.em_pricestandard
this.Control[iCurrent+14]=this.lst_country
this.Control[iCurrent+15]=this.lst_company
this.Control[iCurrent+16]=this.em_date_new
this.Control[iCurrent+17]=this.cb_query
this.Control[iCurrent+18]=this.em_date
this.Control[iCurrent+19]=this.st_1
this.Control[iCurrent+20]=this.dw_1
this.Control[iCurrent+21]=this.gb_1
end on

on w_market_rates_prices.destroy
call super::destroy
destroy(this.st_hide)
destroy(this.cb_save)
destroy(this.st_8)
destroy(this.lst_amount)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.em_rate)
destroy(this.em_pricepremium)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_pricestandard)
destroy(this.lst_country)
destroy(this.lst_company)
destroy(this.em_date_new)
destroy(this.cb_query)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;
st_hide.visible = false	

em_date.text = String(today(),'mm/dd/yyyy')

em_date_new.text = String(today(),'mm/dd/yyyy')

cb_query.triggerevent(clicked!)
end event

type st_hide from statictext within w_market_rates_prices
boolean visible = false
integer x = 1097
integer y = 172
integer width = 1925
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_save from commandbutton within w_market_rates_prices
integer x = 3017
integer y = 244
integer width = 645
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save / Update"
end type

event clicked;

String ls_country, ls_company
Double ld_amount, ld_pricestandard, ld_pricepremium, ld_rate

ls_company = lst_company.getdataid()
ls_country = lst_country.getdataid()
ld_amount = double(lst_amount.getdataid())

ld_rate = double(em_rate.text)

em_pricestandard.getdata(ld_pricestandard)
em_pricepremium.getdata(ld_pricepremium)

if ls_company <> 'VIAMERICAS' then


	if ld_rate < 1 then
		Messagebox("Error", "Please Check the Rate!",StopSign!)		
		return
	end if


	if ld_amount > 0 then
	
	
		INSERT INTO dba.HISTORY_MARKET_PRICES
					  (DATE_HISTORY
					  ,ID_COMPANY
					  ,ID_COUNTRY
					  ,AMOUNT
					  ,RATE_VALUE
					  ,PRICE_STANDARD
					  ,PRICE_PREMIUM
					  ,COMMENTS)
			  VALUES
					  (:em_date_new.text
					  ,:ls_company
					  ,:ls_country
					  ,:ld_amount
					  ,:ld_rate
					  ,:ld_pricestandard
					  ,:ld_pricepremium
					  ,'SYSTEM');
	
	else
		
		INSERT INTO dba.HISTORY_MARKET_PRICES
		SELECT :em_date_new.text
		,ID_COMPANY
		,ID_COUNTRY
		,AMOUNT
		,:ld_rate
		,PRICE_STANDARD
		,PRICE_PREMIUM
		,'SYSTEM (C)'
		FROM Envio.dba.HISTORY_MARKET_PRICES
		WHERE DATE_HISTORY = (SELECT MAX(DATE_HISTORY) 
											FROM dba.HISTORY_MARKET_PRICES 
											WHERE DATE_HISTORY < :em_date_new.text 
											AND ID_COMPANY = :ls_company 
											AND ID_COUNTRY = :ls_country)
		AND ID_COMPANY = :ls_company
		AND ID_COUNTRY = :ls_country;
		
	
	end if
				  
	IF SQLCA.SQLCode = 0 then
		
		Messagebox("Complete", "Record Saved")		
		dw_1.retrieve(date(em_date_new.text))
			
	else
		
		// Try and update
					
		if ld_amount > 0 then		
			
			UPDATE dba.HISTORY_MARKET_PRICES
			set PRICE_STANDARD = :ld_pricestandard,
			PRICE_PREMIUM = :ld_pricepremium,
			RATE_VALUE = :ld_rate,
			COMMENTS = 'SYSTEM (U)'
			WHERE DATE_HISTORY = :em_date_new.text
			AND ID_COMPANY = :ls_company
			AND ID_COUNTRY = :ls_country
			AND AMOUNT= :ld_amount;
	
		else
			
			UPDATE dba.HISTORY_MARKET_PRICES
			set RATE_VALUE = :ld_rate,
			COMMENTS = 'SYSTEM (U)'
			WHERE DATE_HISTORY = :em_date_new.text
			AND ID_COMPANY = :ls_company
			AND ID_COUNTRY = :ls_country;		
		
		end if
					  
		IF SQLCA.SQLCode = 0 then
			
			Messagebox("Complete", "Record Saved")		
			dw_1.retrieve(date(em_date_new.text))
				
		else
			
			// Try and update
														
			Messagebox("Error", "An error occured when saving the data. ~n~r"+String(SQLCA.SQLCode)+' ' +SQLCA.SQLErrText,StopSign!)
					
		end if
					
	end if
	
else // if VIAMERICAS:
	
	DELETE from dba.HISTORY_MARKET_PRICES where DATE_HISTORY = :em_date_new.text and id_company = :ls_company;

	if SQLCA.sqlcode = 0 then	
	
		DECLARE spCalViaMarketPrices PROCEDURE FOR dba.spCalViaMarketPrices;
		
		EXECUTE spCalViaMarketPrices;
		
		if SQLCA.sqlcode = 100 or SQLCA.sqlcode = 0 then	
			Messagebox("Complete", "Record Saved")	
			dw_1.retrieve(date(em_date_new.text))		
		else
			Messagebox("Error", "An error occured when saving the data. ~n~r (EXECUTE STATEMENT)"+String(SQLCA.SQLCode)+' ' +SQLCA.SQLErrText,StopSign!)		
		end if
		
	else
		
		Messagebox("Error", "An error occured when saving the data. ~n~r (DELETE STATEMENT)"+String(SQLCA.SQLCode)+' ' +SQLCA.SQLErrText,StopSign!)		
		
	end if
	
		
end if


	
	
end event

type st_8 from statictext within w_market_rates_prices
integer x = 1595
integer y = 188
integer width = 215
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Amt"
boolean focusrectangle = false
end type

type lst_amount from my_ddlb within w_market_rates_prices
integer x = 1595
integer y = 252
integer width = 325
integer height = 492
integer taborder = 60
end type

event constructor;call super::constructor;this.addquery("select distinct '$ ' + convert(varchar, amount), amount from dba.HISTORY_MARKET_PRICES union select '-ALL-', 0 from dba.dual order by 2 asc;")
end event

event selectionchanged;call super::selectionchanged;IF index = 1 THEN

	em_pricestandard.enabled = false
	em_pricepremium.enabled = false
	
ELSE
	
	em_pricestandard.enabled = true
	em_pricepremium.enabled = true

END IF
end event

type st_7 from statictext within w_market_rates_prices
integer x = 1929
integer y = 188
integer width = 393
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rate"
boolean focusrectangle = false
end type

type st_6 from statictext within w_market_rates_prices
integer x = 2674
integer y = 188
integer width = 338
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Price Premium"
boolean focusrectangle = false
end type

type em_rate from editmask within w_market_rates_prices
integer x = 1929
integer y = 252
integer width = 393
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###.0000"
end type

type em_pricepremium from editmask within w_market_rates_prices
integer x = 2674
integer y = 252
integer width = 338
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "[currency(7)]"
end type

type st_5 from statictext within w_market_rates_prices
integer x = 2331
integer y = 188
integer width = 338
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Price Standard"
boolean focusrectangle = false
end type

type st_4 from statictext within w_market_rates_prices
integer x = 119
integer y = 188
integer width = 215
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date"
boolean focusrectangle = false
end type

type st_3 from statictext within w_market_rates_prices
integer x = 1097
integer y = 188
integer width = 215
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pais"
boolean focusrectangle = false
end type

type st_2 from statictext within w_market_rates_prices
integer x = 466
integer y = 188
integer width = 215
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Company"
boolean focusrectangle = false
end type

type em_pricestandard from editmask within w_market_rates_prices
integer x = 2331
integer y = 252
integer width = 338
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "[currency(7)]"
end type

type lst_country from my_ddlb within w_market_rates_prices
integer x = 1097
integer y = 252
integer width = 485
integer height = 492
integer taborder = 50
end type

event constructor;call super::constructor;this.addquery("select name_country, id_country from dba.country where id_country in (select id_country from dba.HISTORY_MARKET_PRICES) order by name_country;")
end event

type lst_company from my_ddlb within w_market_rates_prices
integer x = 466
integer y = 252
integer width = 622
integer height = 492
integer taborder = 40
end type

event constructor;call super::constructor;this.addquery("select distinct id_company, id_company from dba.HISTORY_MARKET_PRICES order by 1;")
end event

event selectionchanged;call super::selectionchanged;if index = 2 then
	st_hide.visible = true
else
	st_hide.visible = false	
end if
end event

type em_date_new from editmask within w_market_rates_prices
integer x = 119
integer y = 252
integer width = 343
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type cb_query from commandbutton within w_market_rates_prices
integer x = 626
integer y = 12
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;dw_1.retrieve(date(em_date.text))
end event

type em_date from editmask within w_market_rates_prices
integer x = 256
integer y = 16
integer width = 343
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type st_1 from statictext within w_market_rates_prices
integer x = 59
integer y = 24
integer width = 183
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_market_rates_prices
integer x = 27
integer y = 400
integer width = 4494
integer height = 2024
string dataobject = "dw_market_rates_prices_cross"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.SettransObject(SQLCA)
end event

type gb_1 from groupbox within w_market_rates_prices
integer x = 27
integer y = 124
integer width = 4494
integer height = 260
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "New"
end type

