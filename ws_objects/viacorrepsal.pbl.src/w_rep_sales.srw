$PBExportHeader$w_rep_sales.srw
forward
global type w_rep_sales from wb_report_datetime
end type
type rb_agency from radiobutton within w_rep_sales
end type
type rb_country from radiobutton within w_rep_sales
end type
type cbx_redphone from checkbox within w_rep_sales
end type
type rb_payer from radiobutton within w_rep_sales
end type
type gb_1 from groupbox within w_rep_sales
end type
end forward

global type w_rep_sales from wb_report_datetime
integer width = 3406
integer height = 2080
rb_agency rb_agency
rb_country rb_country
cbx_redphone cbx_redphone
rb_payer rb_payer
gb_1 gb_1
end type
global w_rep_sales w_rep_sales

on w_rep_sales.create
int iCurrent
call super::create
this.rb_agency=create rb_agency
this.rb_country=create rb_country
this.cbx_redphone=create cbx_redphone
this.rb_payer=create rb_payer
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_agency
this.Control[iCurrent+2]=this.rb_country
this.Control[iCurrent+3]=this.cbx_redphone
this.Control[iCurrent+4]=this.rb_payer
this.Control[iCurrent+5]=this.gb_1
end on

on w_rep_sales.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_agency)
destroy(this.rb_country)
destroy(this.cbx_redphone)
destroy(this.rb_payer)
destroy(this.gb_1)
end on

type dw_1 from wb_report_datetime`dw_1 within w_rep_sales
integer y = 252
integer width = 3323
integer height = 1632
string dataobject = "dw_rep_sales_bycountry"
end type

type em_fecha1 from wb_report_datetime`em_fecha1 within w_rep_sales
integer x = 210
integer y = 60
string facename = "Tahoma"
end type

type st_1 from wb_report_datetime`st_1 within w_rep_sales
integer x = 27
integer y = 68
string facename = "Tahoma"
end type

type st_2 from wb_report_datetime`st_2 within w_rep_sales
integer x = 599
integer y = 68
string facename = "Tahoma"
end type

type em_fecha2 from wb_report_datetime`em_fecha2 within w_rep_sales
integer x = 741
integer y = 60
string facename = "Tahoma"
end type

type cb_query from wb_report_datetime`cb_query within w_rep_sales
integer x = 2917
integer y = 60
string facename = "Tahoma"
end type

event cb_query::clicked;Datetime ld_fecha1, ld_fecha2
String ls_redphone

Setpointer(Hourglass!)

if rb_agency.checked then
	dw_1.DataObject = 'dw_rep_sales_bycountryagency'
elseif rb_payer.checked then
	dw_1.DataObject = 'dw_rep_sales_bycountry_payer'	
else
	dw_1.DataObject = 'dw_rep_sales_bycountry'	
end if
	

if cbx_redphone.checked then
	ls_redphone = 'Y'
else	
	ls_redphone = 'N' 
end if


dw_1.SetTransObject(SQLCArpt)

ld_fecha1 = Datetime(Date(em_fecha1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_fecha2.text),time('23:59:59'))
dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_redphone)
dw_1.setfocus()

Setpointer(Arrow!)



//	if rb_agency.checked then
//		dw_1.DataObject = 'dw_rep_sales_bycountryagency_rp'
//	elseif rb_payer.checked then
//		dw_1.DataObject = 'dw_rep_sales_bycountry_payer_rp'	
//	else		
//		dw_1.DataObject = 'dw_rep_sales_bycountry_rp'	
//	end if	

end event

type rb_agency from radiobutton within w_rep_sales
integer x = 1202
integer y = 88
integer width = 846
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group by Agency"
end type

type rb_country from radiobutton within w_rep_sales
integer x = 1202
integer y = 28
integer width = 846
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group by Country"
boolean checked = true
end type

type cbx_redphone from checkbox within w_rep_sales
integer x = 2098
integer y = 60
integer width = 695
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Only Red Phone Agencies"
end type

type rb_payer from radiobutton within w_rep_sales
integer x = 1202
integer y = 152
integer width = 846
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group by Payer"
end type

type gb_1 from groupbox within w_rep_sales
integer x = 23
integer width = 3310
integer height = 236
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

