$PBExportHeader$w_city.srw
forward
global type w_city from wb_single_tb
end type
type tab_new from tab within w_city
end type
type tabp_new from userobject within tab_new
end type
type st_2 from statictext within tabp_new
end type
type lst_countries from my_ddlb within tabp_new
end type
type st_5 from statictext within tabp_new
end type
type lst_states from my_ddlb within tabp_new
end type
type st_1 from statictext within tabp_new
end type
type sle_id from singlelineedit within tabp_new
end type
type st_3 from statictext within tabp_new
end type
type st_4 from statictext within tabp_new
end type
type sle_name from singlelineedit within tabp_new
end type
type rb_active from radiobutton within tabp_new
end type
type rb_inactive from radiobutton within tabp_new
end type
type cb_2 from commandbutton within tabp_new
end type
type cb_1 from commandbutton within tabp_new
end type
type gb_1 from groupbox within tabp_new
end type
type tabp_new from userobject within tab_new
st_2 st_2
lst_countries lst_countries
st_5 st_5
lst_states lst_states
st_1 st_1
sle_id sle_id
st_3 st_3
st_4 st_4
sle_name sle_name
rb_active rb_active
rb_inactive rb_inactive
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
type tab_new from tab within w_city
tabp_new tabp_new
end type
type cb_3 from commandbutton within w_city
end type
type st_6 from statictext within w_city
end type
type sle_country from singlelineedit within w_city
end type
type st_7 from statictext within w_city
end type
type sle_city from singlelineedit within w_city
end type
type gb_2 from groupbox within w_city
end type
end forward

global type w_city from wb_single_tb
integer width = 3209
integer height = 2024
string title = "City"
tab_new tab_new
cb_3 cb_3
st_6 st_6
sle_country sle_country
st_7 st_7
sle_city sle_city
gb_2 gb_2
end type
global w_city w_city

on w_city.create
int iCurrent
call super::create
this.tab_new=create tab_new
this.cb_3=create cb_3
this.st_6=create st_6
this.sle_country=create sle_country
this.st_7=create st_7
this.sle_city=create sle_city
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_new
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.st_6
this.Control[iCurrent+4]=this.sle_country
this.Control[iCurrent+5]=this.st_7
this.Control[iCurrent+6]=this.sle_city
this.Control[iCurrent+7]=this.gb_2
end on

on w_city.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_new)
destroy(this.cb_3)
destroy(this.st_6)
destroy(this.sle_country)
destroy(this.st_7)
destroy(this.sle_city)
destroy(this.gb_2)
end on

event open;call super::open;tab_new.visible = false
end event

type dw_1 from wb_single_tb`dw_1 within w_city
integer y = 188
integer width = 3159
integer height = 1640
string dataobject = "dw_city"
end type

type tab_new from tab within w_city
boolean visible = false
integer x = 9
integer y = 84
integer width = 1504
integer height = 848
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean focusonbuttondown = true
integer selectedtab = 1
tabp_new tabp_new
end type

on tab_new.create
this.tabp_new=create tabp_new
this.Control[]={this.tabp_new}
end on

on tab_new.destroy
destroy(this.tabp_new)
end on

type tabp_new from userobject within tab_new
integer x = 18
integer y = 100
integer width = 1467
integer height = 732
long backcolor = 80269524
string text = "New City"
long tabtextcolor = 8388608
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
st_2 st_2
lst_countries lst_countries
st_5 st_5
lst_states lst_states
st_1 st_1
sle_id sle_id
st_3 st_3
st_4 st_4
sle_name sle_name
rb_active rb_active
rb_inactive rb_inactive
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type

on tabp_new.create
this.st_2=create st_2
this.lst_countries=create lst_countries
this.st_5=create st_5
this.lst_states=create lst_states
this.st_1=create st_1
this.sle_id=create sle_id
this.st_3=create st_3
this.st_4=create st_4
this.sle_name=create sle_name
this.rb_active=create rb_active
this.rb_inactive=create rb_inactive
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.lst_countries,&
this.st_5,&
this.lst_states,&
this.st_1,&
this.sle_id,&
this.st_3,&
this.st_4,&
this.sle_name,&
this.rb_active,&
this.rb_inactive,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on tabp_new.destroy
destroy(this.st_2)
destroy(this.lst_countries)
destroy(this.st_5)
destroy(this.lst_states)
destroy(this.st_1)
destroy(this.sle_id)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.sle_name)
destroy(this.rb_active)
destroy(this.rb_inactive)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

type st_2 from statictext within tabp_new
integer x = 123
integer y = 64
integer width = 229
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Country :"
boolean focusrectangle = false
end type

type lst_countries from my_ddlb within tabp_new
integer x = 361
integer y = 52
integer width = 992
integer height = 684
integer taborder = 31
boolean bringtotop = true
end type

event constructor;call super::constructor;this.addqueryad("SELECT RTRIM(NAME_COUNTRY) + CASE FLAG_COUNTRY WHEN 'I' THEN ' (INACTIVE)' ELSE '' END , ID_COUNTRY FROM DBA.COUNTRY ORDER BY NAME_COUNTRY;")
end event

event selectionchanged;call super::selectionchanged;String ls_next, ls_country

ls_country = trim(lst_countries.getdataid())

lst_states.addqueryad("SELECT RTRIM(NAME_STATE) + CASE FLAG_STATE WHEN 'I' THEN ' (INACTIVE)' ELSE '' END , ID_STATE FROM DBA.STATE WHERE ID_COUNTRY = '"+ls_country+"' ORDER BY NAME_STATE;")

SELECT dba.sfGetNextCityId(:ls_country)
  INTO :ls_next
  FROM dba.DUAL;

sle_id.text = ls_next
end event

type st_5 from statictext within tabp_new
integer x = 123
integer y = 168
integer width = 229
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "State :"
boolean focusrectangle = false
end type

type lst_states from my_ddlb within tabp_new
integer x = 361
integer y = 152
integer width = 992
integer height = 580
integer taborder = 31
boolean bringtotop = true
end type

type st_1 from statictext within tabp_new
integer x = 123
integer y = 272
integer width = 229
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Id :"
boolean focusrectangle = false
end type

type sle_id from singlelineedit within tabp_new
integer x = 361
integer y = 256
integer width = 343
integer height = 80
integer taborder = 41
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tabp_new
integer x = 123
integer y = 376
integer width = 229
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Name :"
boolean focusrectangle = false
end type

type st_4 from statictext within tabp_new
integer x = 123
integer y = 480
integer width = 229
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Flag :"
boolean focusrectangle = false
end type

type sle_name from singlelineedit within tabp_new
integer x = 361
integer y = 360
integer width = 992
integer height = 80
integer taborder = 61
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type rb_active from radiobutton within tabp_new
integer x = 357
integer y = 484
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
string text = "Active"
boolean checked = true
end type

type rb_inactive from radiobutton within tabp_new
integer x = 727
integer y = 484
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
string text = "Inactive"
end type

type cb_2 from commandbutton within tabp_new
integer x = 1079
integer y = 608
integer width = 343
integer height = 92
integer taborder = 31
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;
String ls_id_city, ls_id_state, ls_id_country, ls_name_city, ls_flag_city
 
ls_id_city = sle_id.text
ls_id_state = lst_states.getdataid()
ls_id_country = lst_countries.getdataid()
ls_name_city = trim(sle_name.text)
ls_flag_city = 'A'

if ls_id_city = '' then
	Messagebox('Invalid Id','Please enter the city id',StopSign!)
	SetFocus(sle_id)
	Return
end if

if ls_name_city = '' then
	Messagebox('Invalid Name','Please enter the city name',StopSign!)
	SetFocus(sle_name)
	Return
end if

if rb_inactive.checked then
	ls_flag_city = 'I'
end if
 
INSERT INTO dba.CITY  
				( ID_CITY,   
			   ID_STATE,   
			   ID_COUNTRY,   
			   NAME_CITY,   
			   LONG_PHONE_CITY,   
			   FLAG_CITY )  
	  VALUES ( :ls_id_city,   
			   :ls_id_state,   
			   :ls_id_country,   
			   :ls_name_city,   
			   0,   
			   :ls_flag_city)  ;

If SQLCA.SQLCode <> 0 then
	Messagebox('Error','Error Saving Data.~n'+SQLCA.SQLErrText,StopSign!)
	Return
end if

tab_new.visible = false

lst_states.reset()
lst_countries.setselectedid('--')
sle_name.text = ''
sle_id.text = ''
rb_active.checked = true

dw_1.retrieve()



end event

type cb_1 from commandbutton within tabp_new
integer x = 727
integer y = 608
integer width = 343
integer height = 92
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;tab_new.visible = false
end event

type gb_1 from groupbox within tabp_new
integer x = 41
integer width = 1381
integer height = 588
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
end type

type cb_3 from commandbutton within w_city
integer x = 14
integer y = 16
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New..."
end type

event clicked;tab_new.visible = not tab_new.visible
end event

type st_6 from statictext within w_city
integer x = 974
integer y = 76
integer width = 265
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Country Id:"
boolean focusrectangle = false
end type

type sle_country from singlelineedit within w_city
integer x = 1253
integer y = 68
integer width = 165
integer height = 76
integer taborder = 41
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;String ls_filter

sle_country.text = trim(sle_country.text)
sle_city.text = trim(sle_city.text)

ls_filter = ""

if len(sle_country.text) > 0 then
	ls_filter = " (id_country = '"+trim(sle_country.text)+"')"

	if len(sle_city.text) > 0 then ls_filter = ls_filter + " and "	
end if
	
if len(sle_city.text) > 0 then
	ls_filter = ls_filter + " (name_city like '%"+trim(sle_city.text)+"%') "
end if	

dw_1.setFilter('')
dw_1.setFilter(ls_filter)
dw_1.filter()
end event

type st_7 from statictext within w_city
integer x = 1518
integer y = 80
integer width = 119
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "City:"
boolean focusrectangle = false
end type

type sle_city from singlelineedit within w_city
integer x = 1650
integer y = 68
integer width = 942
integer height = 76
integer taborder = 51
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;String ls_filter

sle_country.text = trim(sle_country.text)
sle_city.text = trim(sle_city.text)

ls_filter = ""

if len(sle_country.text) > 0 then
	ls_filter = " (id_country = '"+trim(sle_country.text)+"')"

	if len(sle_city.text) > 0 then ls_filter = ls_filter + " and "	
end if
	
if len(sle_city.text) > 0 then
	ls_filter = ls_filter + " (name_city like '%"+trim(sle_city.text)+"%') "
end if	

dw_1.setFilter('')
dw_1.setFilter(ls_filter)
dw_1.filter()
end event

type gb_2 from groupbox within w_city
integer x = 256
integer y = 4
integer width = 2903
integer height = 172
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

