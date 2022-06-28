$PBExportHeader$w_currency_purchase.srw
forward
global type w_currency_purchase from pfc_w_sheet
end type
type dw_2 from pfc_u_dw within w_currency_purchase
end type
type gb_5 from groupbox within w_currency_purchase
end type
type cb_2 from commandbutton within w_currency_purchase
end type
type rb_5 from radiobutton within w_currency_purchase
end type
type rb_4 from radiobutton within w_currency_purchase
end type
type rb_3 from radiobutton within w_currency_purchase
end type
type rb_2 from radiobutton within w_currency_purchase
end type
type rb_1 from radiobutton within w_currency_purchase
end type
type dw_1 from u_dw within w_currency_purchase
end type
type gb_3 from groupbox within w_currency_purchase
end type
type gb_4 from groupbox within w_currency_purchase
end type
type gb_1 from groupbox within w_currency_purchase
end type
type cb_1 from commandbutton within w_currency_purchase
end type
type cb_save from commandbutton within w_currency_purchase
end type
type cb_cancel from commandbutton within w_currency_purchase
end type
end forward

global type w_currency_purchase from pfc_w_sheet
integer width = 3895
integer height = 1728
string title = "Currency Purchase"
dw_2 dw_2
gb_5 gb_5
cb_2 cb_2
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
dw_1 dw_1
gb_3 gb_3
gb_4 gb_4
gb_1 gb_1
cb_1 cb_1
cb_save cb_save
cb_cancel cb_cancel
end type
global w_currency_purchase w_currency_purchase

on w_currency_purchase.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.gb_5=create gb_5
this.cb_2=create cb_2
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_1=create dw_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_1=create gb_1
this.cb_1=create cb_1
this.cb_save=create cb_save
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.gb_5
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.rb_5
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_1
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.gb_3
this.Control[iCurrent+11]=this.gb_4
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_save
this.Control[iCurrent+15]=this.cb_cancel
end on

on w_currency_purchase.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.gb_5)
destroy(this.cb_2)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_1)
destroy(this.cb_1)
destroy(this.cb_save)
destroy(this.cb_cancel)
end on

event open;call super::open;dw_1.settransobject(sqlca)
dw_1.insertrow(0)

dw_2.settransobject(sqlca)
dw_2.retrieve()

dw_1.setitem(1,'purchase_date', datetime(today(), now()))
dw_1.setitem(1,'effective_date', datetime(today(), now()))
end event

event closequery;//
end event

event pfc_preopen;call super::pfc_preopen;//Initialize the Window Resize Functionality
this.of_SetResize(true)
this.inv_resize.of_SetMinSize(1884, 873)
this.inv_resize.of_SetOrigSize(1200, 1000)
this.inv_resize.of_Register(dw_2, inv_resize.SCALERIGHTBOTTOM)
end event

event resize;call super::resize;

dw_2.height = this.height - dw_2.y - 150
dw_2.width = this.width - dw_2.x - 80
end event

type dw_2 from pfc_u_dw within w_currency_purchase
integer x = 41
integer y = 808
integer width = 3781
integer height = 576
integer taborder = 60
string dataobject = "dw_purchase_available"
end type

event itemchanged;call super::itemchanged;
if dwo.name = 'validate' then
	
	if data = 'Y' then
	
		dw_2.setitem(row,'rec_delete','N')
	
	end if
	
end if

if dwo.name = 'rec_delete' then
	
	if data = 'Y' then
	
		dw_2.setitem(row,'validate','N')
	
	end if
	
end if
end event

type gb_5 from groupbox within w_currency_purchase
integer x = 2734
integer y = 296
integer width = 658
integer height = 224
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

type cb_2 from commandbutton within w_currency_purchase
integer x = 2363
integer y = 628
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Filter"
end type

event clicked;datetime ld_purchase_date, ld_date_tom, ld_date_spot

if rb_2.checked = true then
	
	dw_2.dataobject = 'dw_purchase_available_by_date'
	
	dw_2.settransobject(sqlca)
	
	ld_purchase_date = datetime(today(),time('00:00:00') )
	
	select dba.sfGetNextBusinessDay(:ld_purchase_date), dba.sfGetNextBusinessDay(dba.sfGetNextBusinessDay(:ld_purchase_date))
	into :ld_date_tom, :ld_date_spot
	from dba.dual;
	
	if rb_3.checked = false and rb_4.checked = false and rb_5.checked = false then
		
		messagebox('Alert','Please Select Cash, Tom or Spot', stopsign!)
		
	else 
		if rb_3.checked = true then
			
			dw_2.retrieve(ld_purchase_date)
			
		else
			
			if rb_4.checked = true then
				
				dw_2.retrieve(ld_date_tom)
				
			else
				
				if rb_5.checked = true then
					
					dw_2.retrieve(ld_date_spot)
					
				end if
				
			end if
			
		end if
		
	end if
	
else
	
	if rb_1.checked = true then
		
		dw_2.dataobject = 'dw_purchase_available'
		
		dw_2.settransobject(sqlca)
		
		dw_2.retrieve()
		
	end if
	
end if
end event

type rb_5 from radiobutton within w_currency_purchase
integer x = 1897
integer y = 656
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Spot"
end type

type rb_4 from radiobutton within w_currency_purchase
integer x = 1637
integer y = 656
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Tom"
end type

type rb_3 from radiobutton within w_currency_purchase
integer x = 1358
integer y = 656
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Cash"
boolean checked = true
end type

type rb_2 from radiobutton within w_currency_purchase
integer x = 768
integer y = 648
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "By Date"
end type

event clicked;if this.checked = true then
	
rb_3.enabled = true	

rb_4.enabled = true	

rb_5.enabled = true	
	
end if
end event

type rb_1 from radiobutton within w_currency_purchase
integer x = 187
integer y = 648
integer width = 466
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pending Validation"
boolean checked = true
end type

event clicked;if this.checked = true then
	
rb_3.enabled = false	

rb_4.enabled = false	

rb_5.enabled = false	
	
end if
end event

type dw_1 from u_dw within w_currency_purchase
integer x = 128
integer y = 100
integer width = 3040
integer height = 432
integer taborder = 20
string dataobject = "dw_currency_purchase"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;IF dwo.name = "b_purchase_date" THEN

       IF IsValid(iuo_calendar) THEN

               this.SetColumn("purchase_date")

               this.event pfc_ddcalendar()
					
	   END IF

  END IF
  
   IF dwo.name = "b_effective_date" THEN

       IF IsValid(iuo_calendar) THEN

               this.SetColumn("effective_date")

               this.event pfc_ddcalendar()
					
	   END IF

  END IF
  
end event

event constructor;call super::constructor;SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)

This.of_SetDropDownCalendar(TRUE)
This.iuo_calendar.of_SetInitialValue(FALSE)
This.iuo_calendar.of_SetAlwaysRedraw(FALSE)
This.iuo_calendar.of_SetCloseOnClick(TRUE)
This.iuo_calendar.of_SetCloseOnDClick(TRUE)
This.iuo_calendar.of_Register("purchase_date",iuo_calendar.NONE)
This.iuo_calendar.of_Register("effective_date",iuo_calendar.NONE)

end event

event itemchanged;call super::itemchanged;

// Si cambia la tasa
if dwo.name = 'rate'  then


	double ld_us_amt
	
	ld_us_amt = dw_1.getitemnumber(dw_1.getrow(),"bought_amount")


	if ld_us_amt <> 0  and dec(data) <> 0 then
		
		dw_1.setitem(dw_1.getrow(),"foreignamt",(dec(data) * ld_us_amt))
		
	end if
			
end if



// Si cambia una de las cantidades
if dwo.name = 'foreignamt' or dwo.name = 'bought_amount' then


	double ld_rate
	
	ld_rate = dw_1.getitemnumber(dw_1.getrow(),"rate")



	if dwo.name = 'bought_amount' then
		
		if ld_rate <> 0 then
			
			dw_1.setitem(dw_1.getrow(),"foreignamt",(dec(data) * ld_rate))
			
		end if
			
	end if



	if dwo.name = 'foreignamt' then
		
		if ld_rate <> 0 then
			
			dw_1.setitem(dw_1.getrow(),"bought_amount",(dec(data) / ld_rate))
			
		end if
				
	end if
	
	
end if


// Si modifican effective date, determina el tipo
if dwo.name = 'purchase_type' or  dwo.name = 'purchase_date' then

	dw_1.accepttext()
		
	datetime ld_date_tom, ld_date_spot, ld_dayafterpurchasedate, ld_purchase_date
	string ls_purchase_type
	
	ld_purchase_date = dw_1.getitemdatetime(dw_1.getrow(),"purchase_date")		
	ls_purchase_type = dw_1.getitemstring(dw_1.getrow(),"purchase_type")		
	
	select dba.sfGetNextBusinessDay(:ld_purchase_date), dba.sfGetNextBusinessDay(dba.sfGetNextBusinessDay(:ld_purchase_date))
	into :ld_date_tom, :ld_date_spot
	from dba.dual;
	
	if ls_purchase_type = 'CA' then
		dw_1.setitem(dw_1.getrow(),"effective_date",ld_purchase_date)
	elseif ls_purchase_type = 'TO' then
		dw_1.setitem(dw_1.getrow(),"effective_date",ld_date_tom)
	elseif ls_purchase_type = 'SP' then
		dw_1.setitem(dw_1.getrow(),"effective_date",ld_date_spot)
	else
		dw_1.setitem(dw_1.getrow(),"effective_date",ld_purchase_date)
	end if			
		

end if




//// Si modifican effective date, determina el tipo
//if dwo.name = 'effective_date' then
//
//	date ld_purchase_date
//
//	ld_purchase_date = date(dw_1.getitemstring(dw_1.getrow(),"purchase_date"))
//
//	
//	if isdate(data) then
//		
//		date ld_date_tom, ld_date_spot, ld_dayafterpurchasedate
//		
//		ld_dayafterpurchasedate = relativedate(ld_purchase_date,1)
//		
//		select dba.sfGetNextBusinessDay(:ld_purchase_date), dba.sfGetNextBusinessDay(:ld_dayafterpurchasedate)
//		into :ld_date_tom, :ld_date_spot
//		from dba.dual;
//		
//		if date(data) = ld_purchase_date then
//			dw_1.setitem(dw_1.getrow(),"purchase_type",'CA')
//		elseif date(data) = ld_date_tom then
//			dw_1.setitem(dw_1.getrow(),"purchase_type",'TO')
//		elseif date(data) = ld_date_spot then
//			dw_1.setitem(dw_1.getrow(),"purchase_type",'SP')
//		else
//			dw_1.setitem(dw_1.getrow(),"purchase_type",'')
//		end if			
//		
//	end if
//
//end if
//
//



end event

type gb_3 from groupbox within w_currency_purchase
integer x = 46
integer y = 568
integer width = 1088
integer height = 200
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

type gb_4 from groupbox within w_currency_purchase
integer x = 1221
integer y = 568
integer width = 1088
integer height = 200
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "By Date"
end type

type gb_1 from groupbox within w_currency_purchase
integer x = 41
integer y = 28
integer width = 3767
integer height = 536
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Currency Purchase"
end type

type cb_1 from commandbutton within w_currency_purchase
integer x = 2720
integer y = 628
integer width = 402
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save Validations"
end type

event clicked;datetime ld_purchase_date, ld_date_tom, ld_date_spot
integer i
double ld_id_purchase

dw_2.accepttext( )

for i  = 1 to dw_2.rowcount()

dw_2.setitem(i,'available_amount',dw_2.getitemnumber(i,'bought_amount'))

if dw_2.getitemstring( i,'rec_delete') = 'Y' then
	
	dw_2.deleterow( i )
		
END IF

next
dw_2.update()

if rb_2.checked = true then
	
	dw_2.dataobject = 'dw_purchase_available_by_date'
	
	dw_2.settransobject(sqlca)
	
	ld_purchase_date = datetime(today(),time('00:00:00') )
	
	select dba.sfGetNextBusinessDay(:ld_purchase_date), dba.sfGetNextBusinessDay(dba.sfGetNextBusinessDay(:ld_purchase_date))
	into :ld_date_tom, :ld_date_spot
	from dba.dual;
	
	if rb_3.checked = false and rb_4.checked = false and rb_5.checked = false then
		
		messagebox('Alert','Please Select Cash, Tom or Spot', stopsign!)
		
	else 
		if rb_3.checked = true then
			
			dw_2.retrieve(ld_purchase_date)
			
		else
			
			if rb_4.checked = true then
				
				dw_2.retrieve(ld_date_tom)
				
			else
				
				if rb_5.checked = true then
					
					dw_2.retrieve(ld_date_spot)
					
				end if
				
			end if
			
		end if
		
	end if
	
else
	
	if rb_1.checked = true then
		
		dw_2.dataobject = 'dw_purchase_available'
		
		dw_2.settransobject(sqlca)
		
		dw_2.retrieve()
		
	end if
	
end if
end event

type cb_save from commandbutton within w_currency_purchase
integer x = 2889
integer y = 372
integer width = 343
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Purchase"
end type

event clicked;double ld_bought_amount, ld_exchange_rate, ld_rate_allowance, ld_ave_rate
string ls_currency
datetime ld_date_inicio, ld_date_final



if isnull(dw_1.getitemdatetime(1,'purchase_date')) or dw_1.getitemdatetime(1,'purchase_date') = datetime('00/00/0000 00:00:00') then
	messagebox('Alert','The Purchase date is invalid, Please Check',stopsign!)
	return
end if	

if isnull(dw_1.getitemdatetime(1,'effective_date')) or dw_1.getitemdatetime(1,'effective_date') = datetime('00/00/0000 00:00:00') then
	messagebox('Alert','The Effective date is invalid, Please Check',stopsign!)
	return
end if	

if isnull(dw_1.getitemstring(1,'currency')) or dw_1.getitemstring(1,'currency') = '' then
	messagebox('Alert','The Currency is invalid, Please Check',stopsign!)
	return
end if	

if isnull(dw_1.getitemstring(1,'id_trader')) or dw_1.getitemstring(1,'id_trader') = '' then
	messagebox('Alert','The Trader is invalid, Please Check',stopsign!)
	return
end if	

SELECT min(dba.ACC_PARAMETERS.DATE_BLOCKER),   
		 min(dba.ACC_PARAMETERS.DATE_BLOCKER_POST),
		 min(RATE_ALLOWANCE)
  INTO :ld_date_inicio,   
		 :ld_date_final,
		 :ld_rate_allowance
  FROM dba.ACC_PARAMETERS;

if dw_1.getitemnumber(1,'bought_amount') = 0 or isnull(dw_1.getitemnumber(1,'bought_amount')) then
	
	messagebox('Alert','The bought Amount is invalid, Please Check',stopsign!)
	return
else
	
	ld_bought_amount = dw_1.getitemnumber(1,'bought_amount')
	
	dw_1.setitem(1,'available_amount',ld_bought_amount)
end if

ld_exchange_rate = double(dw_1.getitemnumber(dw_1.getrow(),'rate'))

if isnull(ld_exchange_rate) or ld_exchange_rate < 0 then
	Messagebox("Invalid Amount","Please enter a valid exchange rate",StopSign!)
	//setfocus(em_exchange_rate)
	return
end if

if ld_exchange_rate <> 1 then
	
	ls_currency = dw_1.getitemstring(1,'currency')
	
	SELECT AVG(RATE)
	INTO :ld_ave_rate
	FROM DBA.CURRENCY_PURCHASE A
	WHERE  A.PURCHASE_DATE > (GETDATE() - 30)
	AND CURRENCY = :ls_currency
	AND ISNULL( RATE , 0 ) > 1;
	
	if isnull(ld_ave_rate) then ld_ave_rate = 0
	
	if ld_ave_rate <> 0  and ld_exchange_rate <> 0 then
	
		// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
		if abs(((ld_exchange_rate - ld_ave_rate) / ld_exchange_rate)) > ld_rate_allowance then
			Messagebox("Invalid Amount","Please enter a valid exchange rate (±"+String(ld_rate_allowance * 100)+"%)",StopSign!)
			//setfocus(em_exchange_rate)
			return
		end if
	
	end if

end if



if dw_1.update() = 1 then
	
	messagebox('Saved','The purchase has been save')
	
	dw_1.reset()
	dw_1.insertrow(0)
	dw_2.update()
	dw_2.dataobject  = 'dw_purchase_available'
	dw_2.settransobject(sqlca)
	dw_2.retrieve()
	
	dw_1.setitem(1,'purchase_date', datetime(today(), now()))
	dw_1.setitem(1,'effective_date', datetime(today(), now()))	
	
end if


end event

type cb_cancel from commandbutton within w_currency_purchase
integer x = 3127
integer y = 628
integer width = 343
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;close(w_currency_purchase)
end event

