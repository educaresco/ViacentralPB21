$PBExportHeader$w_market_rates_by_agency.srw
forward
global type w_market_rates_by_agency from w_master
end type
type st_8 from statictext within w_market_rates_by_agency
end type
type lst_payers from my_ddlb within w_market_rates_by_agency
end type
type sle_payer from singlelineedit within w_market_rates_by_agency
end type
type st_6 from statictext within w_market_rates_by_agency
end type
type cbx_filter from checkbox within w_market_rates_by_agency
end type
type st_5 from statictext within w_market_rates_by_agency
end type
type lst_agencies from my_ddlb within w_market_rates_by_agency
end type
type sle_idbranch from singlelineedit within w_market_rates_by_agency
end type
type cb_save from commandbutton within w_market_rates_by_agency
end type
type st_7 from statictext within w_market_rates_by_agency
end type
type em_rate from editmask within w_market_rates_by_agency
end type
type st_4 from statictext within w_market_rates_by_agency
end type
type st_3 from statictext within w_market_rates_by_agency
end type
type st_2 from statictext within w_market_rates_by_agency
end type
type lst_country from my_ddlb within w_market_rates_by_agency
end type
type lst_company from my_ddlb within w_market_rates_by_agency
end type
type em_date_new from editmask within w_market_rates_by_agency
end type
type cb_query from commandbutton within w_market_rates_by_agency
end type
type em_date from editmask within w_market_rates_by_agency
end type
type st_1 from statictext within w_market_rates_by_agency
end type
type dw_1 from datawindow within w_market_rates_by_agency
end type
type gb_1 from groupbox within w_market_rates_by_agency
end type
type gb_2 from groupbox within w_market_rates_by_agency
end type
end forward

global type w_market_rates_by_agency from w_master
integer width = 4599
integer height = 2556
string title = "Market Rates by Agency"
st_8 st_8
lst_payers lst_payers
sle_payer sle_payer
st_6 st_6
cbx_filter cbx_filter
st_5 st_5
lst_agencies lst_agencies
sle_idbranch sle_idbranch
cb_save cb_save
st_7 st_7
em_rate em_rate
st_4 st_4
st_3 st_3
st_2 st_2
lst_country lst_country
lst_company lst_company
em_date_new em_date_new
cb_query cb_query
em_date em_date
st_1 st_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_market_rates_by_agency w_market_rates_by_agency

forward prototypes
public subroutine fn_refresh ()
end prototypes

public subroutine fn_refresh ();return
end subroutine

on w_market_rates_by_agency.create
int iCurrent
call super::create
this.st_8=create st_8
this.lst_payers=create lst_payers
this.sle_payer=create sle_payer
this.st_6=create st_6
this.cbx_filter=create cbx_filter
this.st_5=create st_5
this.lst_agencies=create lst_agencies
this.sle_idbranch=create sle_idbranch
this.cb_save=create cb_save
this.st_7=create st_7
this.em_rate=create em_rate
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.lst_country=create lst_country
this.lst_company=create lst_company
this.em_date_new=create em_date_new
this.cb_query=create cb_query
this.em_date=create em_date
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_8
this.Control[iCurrent+2]=this.lst_payers
this.Control[iCurrent+3]=this.sle_payer
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.cbx_filter
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.lst_agencies
this.Control[iCurrent+8]=this.sle_idbranch
this.Control[iCurrent+9]=this.cb_save
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.em_rate
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.lst_country
this.Control[iCurrent+16]=this.lst_company
this.Control[iCurrent+17]=this.em_date_new
this.Control[iCurrent+18]=this.cb_query
this.Control[iCurrent+19]=this.em_date
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.dw_1
this.Control[iCurrent+22]=this.gb_1
this.Control[iCurrent+23]=this.gb_2
end on

on w_market_rates_by_agency.destroy
call super::destroy
destroy(this.st_8)
destroy(this.lst_payers)
destroy(this.sle_payer)
destroy(this.st_6)
destroy(this.cbx_filter)
destroy(this.st_5)
destroy(this.lst_agencies)
destroy(this.sle_idbranch)
destroy(this.cb_save)
destroy(this.st_7)
destroy(this.em_rate)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.lst_country)
destroy(this.lst_company)
destroy(this.em_date_new)
destroy(this.cb_query)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;em_date.text = String(today(),'mm/dd/yyyy')

em_date_new.text = String(today(),'mm/dd/yyyy')+ ' ' + String(now(),"hh:mm")

cb_query.triggerevent(clicked!)
end event

type st_8 from statictext within w_market_rates_by_agency
integer x = 3785
integer y = 132
integer width = 361
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "(Filter)"
boolean focusrectangle = false
end type

type lst_payers from my_ddlb within w_market_rates_by_agency
integer x = 1486
integer y = 236
integer width = 1088
integer height = 1136
integer taborder = 60
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Verdana"
end type

event constructor;call super::constructor;lst_payers.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type IN ('P','A') order by name_main_branch;")
end event

event selectionchanged;call super::selectionchanged;sle_payer.text = lst_payers.getdataid()
end event

type sle_payer from singlelineedit within w_market_rates_by_agency
integer x = 1216
integer y = 236
integer width = 265
integer height = 84
integer taborder = 50
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

type st_6 from statictext within w_market_rates_by_agency
integer x = 992
integer y = 232
integer width = 192
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer:"
boolean focusrectangle = false
end type

type cbx_filter from checkbox within w_market_rates_by_agency
integer x = 3703
integer y = 128
integer width = 78
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean checked = true
end type

event clicked;if cbx_filter.checked and len(sle_idbranch.text) > 3 then
	lst_company.addquery("SELECT NAME_MT, ID_MT FROM dba.MONEY_TRANSMITTERS WHERE ID_MT IN (SELECT ID_MT FROM dba.BRANCH_MONEY_TRANSMITTERS WHERE ID_BRANCH = '"+trim(sle_idbranch.text)+"') order by 1;")
else
	lst_company.addquery("SELECT NAME_MT, ID_MT FROM dba.MONEY_TRANSMITTERS order by 1;")
end if
end event

type st_5 from statictext within w_market_rates_by_agency
integer x = 992
integer y = 132
integer width = 192
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Branch:"
boolean focusrectangle = false
end type

type lst_agencies from my_ddlb within w_market_rates_by_agency
integer x = 1563
integer y = 128
integer width = 1010
integer height = 1504
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O' order by name_branch;")
end event

event selectionchanged;call super::selectionchanged;sle_idbranch.text = lst_agencies.getdataid()
end event

type sle_idbranch from singlelineedit within w_market_rates_by_agency
integer x = 1216
integer y = 128
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_agencies.setselectedid( sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_agencies.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF


end event

event losefocus;if cbx_filter.checked and len(sle_idbranch.text) > 3 then
	lst_company.addquery("SELECT NAME_MT, ID_MT FROM dba.MONEY_TRANSMITTERS WHERE ID_MT IN (SELECT ID_MT FROM dba.BRANCH_MONEY_TRANSMITTERS WHERE ID_BRANCH = '"+trim(sle_idbranch.text)+"') order by 1;")
else
	lst_company.addquery("SELECT NAME_MT, ID_MT FROM dba.MONEY_TRANSMITTERS order by 1;")
end if
end event

type cb_save from commandbutton within w_market_rates_by_agency
integer x = 3273
integer y = 228
integer width = 398
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;
String ls_country, ls_company, ls_id_branch, ls_id_payer
Double ld_rate

ls_company = lst_company.getdataid()
ls_country = lst_country.getdataid()
ls_id_branch = sle_idbranch.text
ls_id_payer = sle_payer.text

ld_rate = double(em_rate.text)



if ld_rate < 1 then
	Messagebox("Error", "Please Check the Rate!",StopSign!)		
	return
end if



	INSERT INTO dba.HISTORY_MARKET_PRICES_BRANCH
				  (DATE_HISTORY
				  ,ID_BRANCH
				  ,ID_MT
				  ,ID_COUNTRY
				  ,ID_PAYER
				  ,RATE_VALUE
				  ,DATE_INSERTED
				  ,DB_USER_NAME
)
		  VALUES
				  (:em_date_new.text
				  ,:ls_id_branch
				  ,:ls_company
				  ,:ls_country
				  ,:ls_id_payer
				  ,:ld_rate
				  ,getdate()
				  ,UPPER(system_user));
				  
				  
		  
 		IF SQLCA.SQLCode = 0 then
			
			Messagebox("Complete", "Record Saved")		
			em_date.text = left(em_date_new.text,10)
			dw_1.retrieve(date(em_date.text))
			
			// refresehs the time
			em_date_new.text = String(today(),'mm/dd/yyyy')+ ' ' + String(now(),"hh:mm")
				
		else
			
			// Try and update
														
			Messagebox("Error", "An error occured when saving the data. ~n~r"+String(SQLCA.SQLCode)+' ' +SQLCA.SQLErrText,StopSign!)
					
		end if

	
	
end event

type st_7 from statictext within w_market_rates_by_agency
integer x = 2601
integer y = 232
integer width = 233
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rate:"
boolean focusrectangle = false
end type

type em_rate from editmask within w_market_rates_by_agency
integer x = 2862
integer y = 236
integer width = 389
integer height = 76
integer taborder = 70
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

type st_4 from statictext within w_market_rates_by_agency
integer x = 119
integer y = 132
integer width = 293
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date / Time:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_market_rates_by_agency
integer x = 119
integer y = 232
integer width = 293
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Country:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_market_rates_by_agency
integer x = 2601
integer y = 132
integer width = 233
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Company:"
boolean focusrectangle = false
end type

type lst_country from my_ddlb within w_market_rates_by_agency
integer x = 430
integer y = 216
integer width = 462
integer height = 1700
integer taborder = 40
end type

event constructor;call super::constructor;this.addquery("SELECT NAME_COUNTRY, ID_COUNTRY FROM DBA.COUNTRY WHERE FLAG_COUNTRY = 'A';")
end event

type lst_company from my_ddlb within w_market_rates_by_agency
integer x = 2862
integer y = 128
integer width = 805
integer height = 2084
integer taborder = 30
end type

event constructor;call super::constructor;this.addquery("SELECT NAME_MT, ID_MT FROM dba.MONEY_TRANSMITTERS order by 1;")


//if cbx_filter.checked and len(sle_idbranch.text) > 3 then
//	lst_company.addquery("SELECT NAME_MT, ID_MT FROM dba.MONEY_TRANSMITTERS WHERE ID_MT IN (SELECT ID_MT FROM dba.BRANCH_MONEY_TRANSMITTERS WHERE ID_BRANCH = '"+"' order by 1;")
//else
//	lst_company.addquery("SELECT NAME_MT, ID_MT FROM dba.MONEY_TRANSMITTERS order by 1;")
//end if



end event

type em_date_new from editmask within w_market_rates_by_agency
integer x = 430
integer y = 128
integer width = 521
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "mm/dd/yyyy hh:mm"
end type

type cb_query from commandbutton within w_market_rates_by_agency
integer x = 626
integer y = 464
integer width = 343
integer height = 92
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

type em_date from editmask within w_market_rates_by_agency
integer x = 256
integer y = 468
integer width = 343
integer height = 76
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

type st_1 from statictext within w_market_rates_by_agency
integer x = 59
integer y = 476
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

type dw_1 from datawindow within w_market_rates_by_agency
integer x = 27
integer y = 624
integer width = 4494
integer height = 1800
string dataobject = "dw_market_rates_by_agency"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.SettransObject(SQLCA)
end event

type gb_1 from groupbox within w_market_rates_by_agency
integer x = 27
integer y = 376
integer width = 4494
integer height = 224
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Query"
end type

type gb_2 from groupbox within w_market_rates_by_agency
integer x = 27
integer width = 4494
integer height = 360
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

