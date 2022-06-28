$PBExportHeader$w_acc_forexcalculation.srw
forward
global type w_acc_forexcalculation from w_sheet
end type
type st_4 from statictext within w_acc_forexcalculation
end type
type em_forexdate from editmask within w_acc_forexcalculation
end type
type cb_forex from commandbutton within w_acc_forexcalculation
end type
type dw_stock from datawindow within w_acc_forexcalculation
end type
type st_3 from statictext within w_acc_forexcalculation
end type
type cb_query from commandbutton within w_acc_forexcalculation
end type
type st_dwtitle from statictext within w_acc_forexcalculation
end type
type dw_orders from datawindow within w_acc_forexcalculation
end type
type st_1 from statictext within w_acc_forexcalculation
end type
type lst_payers from my_ddlb within w_acc_forexcalculation
end type
type gb_1 from groupbox within w_acc_forexcalculation
end type
type gb_2 from groupbox within w_acc_forexcalculation
end type
type dw_wires from datawindow within w_acc_forexcalculation
end type
type dw_ratehistory from datawindow within w_acc_forexcalculation
end type
end forward

global type w_acc_forexcalculation from w_sheet
integer width = 4155
integer height = 2008
string title = "Forex Calculation"
st_4 st_4
em_forexdate em_forexdate
cb_forex cb_forex
dw_stock dw_stock
st_3 st_3
cb_query cb_query
st_dwtitle st_dwtitle
dw_orders dw_orders
st_1 st_1
lst_payers lst_payers
gb_1 gb_1
gb_2 gb_2
dw_wires dw_wires
dw_ratehistory dw_ratehistory
end type
global w_acc_forexcalculation w_acc_forexcalculation

type variables
String is_id_payer, is_id_country
end variables

on w_acc_forexcalculation.create
int iCurrent
call super::create
this.st_4=create st_4
this.em_forexdate=create em_forexdate
this.cb_forex=create cb_forex
this.dw_stock=create dw_stock
this.st_3=create st_3
this.cb_query=create cb_query
this.st_dwtitle=create st_dwtitle
this.dw_orders=create dw_orders
this.st_1=create st_1
this.lst_payers=create lst_payers
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_wires=create dw_wires
this.dw_ratehistory=create dw_ratehistory
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.em_forexdate
this.Control[iCurrent+3]=this.cb_forex
this.Control[iCurrent+4]=this.dw_stock
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.cb_query
this.Control[iCurrent+7]=this.st_dwtitle
this.Control[iCurrent+8]=this.dw_orders
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.lst_payers
this.Control[iCurrent+11]=this.gb_1
this.Control[iCurrent+12]=this.gb_2
this.Control[iCurrent+13]=this.dw_wires
this.Control[iCurrent+14]=this.dw_ratehistory
end on

on w_acc_forexcalculation.destroy
call super::destroy
destroy(this.st_4)
destroy(this.em_forexdate)
destroy(this.cb_forex)
destroy(this.dw_stock)
destroy(this.st_3)
destroy(this.cb_query)
destroy(this.st_dwtitle)
destroy(this.dw_orders)
destroy(this.st_1)
destroy(this.lst_payers)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_wires)
destroy(this.dw_ratehistory)
end on

type st_4 from statictext within w_acc_forexcalculation
integer x = 101
integer y = 100
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Payer:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_forexdate from editmask within w_acc_forexcalculation
integer x = 2958
integer y = 88
integer width = 352
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type cb_forex from commandbutton within w_acc_forexcalculation
integer x = 3401
integer y = 88
integer width = 402
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Calculate Forex"
end type

event clicked;
String ls_calculationagainst
Date	 ld_dateto

SetPointer(HourGlass!)

cb_query.triggerevent(clicked!)


if dw_stock.rowcount() = 1 then
	ls_calculationagainst = dw_stock.getitemstring(dw_stock.getrow(),"calculation_against")
else
	Messagebox("Error","Revise la configuracion FOREX del pagador",StopSign!)
end if
		
if is_id_payer <> '--' then
	
	ld_dateto = date(em_forexdate.text)
	
	if ls_calculationagainst = 'W' then
	
		DECLARE spCalOrdersForex PROCEDURE FOR dba.spCalOrdersForex @p_id_payer = :is_id_payer, @p_id_country = :is_id_country, @p_dateto = :ld_dateto;	
		Execute spCalOrdersForex;

	elseif ls_calculationagainst = 'D' then
	
		DECLARE spCalOrdersForexDailyRate PROCEDURE FOR dba.spCalOrdersForexDailyRate @p_id_payer = :is_id_payer, @p_id_country = :is_id_country, @p_dateto = :ld_dateto;	
		Execute spCalOrdersForexDailyRate;

	else
	
		Messagebox("Process Cancelled","El forex de este pagador no necesita ser calculado en esta pantalla!",StopSign!)	

	end if
		
	//Messagebox(String(SQLCA.SQLCode),SQLCA.SQLErrText)

else	
	Messagebox("Selccionar Pagador","Debe Seleccionar un Pagador",StopSign!)	
end if

cb_query.triggerevent(clicked!)

SetPointer(Arrow!)
end event

type dw_stock from datawindow within w_acc_forexcalculation
integer x = 55
integer y = 260
integer width = 1783
integer height = 380
string title = "none"
string dataobject = "dw_acc_forexcalculation_stock"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type st_3 from statictext within w_acc_forexcalculation
integer x = 2075
integer y = 676
integer width = 1408
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Un-Applied Transactions"
boolean focusrectangle = false
end type

type cb_query from commandbutton within w_acc_forexcalculation
integer x = 1723
integer y = 88
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Query"
end type

event clicked;String ls_mode
Datetime ld_datelaststock, ld_datelastorder, ld_datenextorder


is_id_payer = fn_token(lst_payers.getdataid(),'^',1)
is_id_country = fn_token(lst_payers.getdataid(),'^',2)

if is_id_payer <> '--' then

	dw_stock.retrieve(is_id_payer)
	
	if dw_stock.rowcount() = 1 then
		
		ls_mode = dw_stock.getitemstring(dw_stock.getrow(),"calculation_mode")
		ld_datelaststock = dw_stock.getitemdatetime(dw_stock.getrow(),"last_day_stock_used")
		ld_datelastorder = dw_stock.getitemdatetime(dw_stock.getrow(),"last_order_calculated")
							
		ld_datenextorder = datetime(RelativeDate(date(ld_datelastorder),1),time(ld_datelastorder))
							
		dw_orders.retrieve(ls_mode,ld_datenextorder, is_id_payer,is_id_country)
		
		if dw_stock.getitemstring(dw_stock.getrow(),"calculation_against") = 'W' then
			dw_ratehistory.visible = false
			dw_wires.visible = true
			dw_wires.retrieve(ld_datelaststock, is_id_payer)
			st_dwtitle.text = 'Un-Used Wires'
		else
			dw_ratehistory.visible = true
			dw_wires.visible = false
			dw_ratehistory.retrieve(is_id_payer,is_id_country)
			st_dwtitle.text = 'Daily rates'
		end if					
		
		em_forexdate.enabled = true
		cb_forex.enabled = true
		
	else		
		em_forexdate.enabled = false
		cb_forex.enabled = false				
	end if
	
else
	is_id_payer = '--'
	is_id_country = '--'
	Messagebox("Selccionar Pagador","Debe Seleccionar un Pagador",StopSign!)	
end if
end event

type st_dwtitle from statictext within w_acc_forexcalculation
integer x = 41
integer y = 676
integer width = 1303
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Un-Used Wires"
boolean focusrectangle = false
end type

type dw_orders from datawindow within w_acc_forexcalculation
integer x = 2075
integer y = 736
integer width = 1993
integer height = 1108
string title = "none"
string dataobject = "dw_acc_forexcalculation_orders"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type st_1 from statictext within w_acc_forexcalculation
integer x = 2597
integer y = 100
integer width = 325
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Up to date:"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_payers from my_ddlb within w_acc_forexcalculation
integer x = 361
integer y = 92
integer width = 1303
integer height = 1136
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_payers.addquery("select rtrim(name_main_branch) + ' (' + rtrim(id_country) + ')', dba.group_branch.id_main_branch+'^'+id_country from dba.group_branch, dba.FOREX_STOCK where dba.group_branch.ID_MAIN_BRANCH = dba.FOREX_STOCK.ID_MAIN_BRANCH order by name_main_branch;")
end event

type gb_1 from groupbox within w_acc_forexcalculation
integer x = 27
integer y = 4
integer width = 2464
integer height = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_acc_forexcalculation
integer x = 2537
integer y = 4
integer width = 1353
integer height = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calculate Forex"
end type

type dw_wires from datawindow within w_acc_forexcalculation
integer x = 41
integer y = 736
integer width = 2034
integer height = 1108
string title = "none"
string dataobject = "dw_acc_forexcalculation_wires"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_ratehistory from datawindow within w_acc_forexcalculation
integer x = 41
integer y = 736
integer width = 2034
integer height = 1108
integer taborder = 20
string dataobject = "dw_acc_forexcalculation_ratehistory"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

