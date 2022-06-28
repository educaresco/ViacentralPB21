$PBExportHeader$w_location_new.srw
forward
global type w_location_new from pfc_w_response
end type
type cb_3 from commandbutton within w_location_new
end type
type cb_2 from commandbutton within w_location_new
end type
type cb_1 from commandbutton within w_location_new
end type
type dw_1 from datawindow within w_location_new
end type
type gb_1 from groupbox within w_location_new
end type
end forward

global type w_location_new from pfc_w_response
integer width = 2857
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_location_new w_location_new

event open;call super::open;string s_id_chain, s_id_location, s_parm

s_parm = Message.StringParm

s_id_chain = fn_token(s_parm,'/',1)
s_id_location = fn_token(s_parm,'/',2)
 
dw_1.settransobject(sqlca)





if s_id_location <> "" then
	
	dw_1.retrieve(s_id_chain, s_id_location)
	
	dw_1.modify("id_country.protect = 1")
	dw_1.modify("id_state.protect = 1")
	dw_1.modify("id_city.protect = 1")
		
else
	
	dw_1.insertrow(0)
	dw_1.setitem(1,'id_chain',s_id_chain)
	dw_1.setitem(1,'id_country','USA')
	dw_1.modify("id_country.protect = 1")
end if


end event

on w_location_new.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.gb_1
end on

on w_location_new.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_3 from commandbutton within w_location_new
integer x = 2427
integer y = 96
integer width = 293
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select"
end type

event clicked;string ls_id_branch, ls_name_branch, ls_address_branch, ls_id_state, ls_id_city, ls_phone, ls_fax,  ls_id_chain
double ld_zip

open(w_branch_selection)

ls_id_branch = Message.stringparm


if not isnull(ls_id_branch) then
	
	SELECT NAME_BRANCH,
			   ADDRESS_BRANCH,
			   ID_STATE,
			   ID_CITY,
			   PHONE1_BRANCH,
			   FAX_BRANCH,
			   ZIP_BRANCH,
			   isnull(ID_CHAIN,'N')
	INTO :ls_name_branch,
			:ls_address_branch,
			:ls_id_state,
			:ls_id_city,
			:ls_phone,
			:ls_fax,
			:ld_zip,
			:ls_id_chain
	FROM DBA.BRANCH
	WHERE ID_BRANCH = :ls_id_branch;
	
	
	IF SQLCA.SQLCODE <> 100 AND SQLCA.SQLCODE <> -1 THEN
		
		IF LS_ID_CHAIN <> 'N' THEN
		if	MESSAGEBOX('Alert','This Branch is assign to anothe chain, do you want to continue',question!, yesno!) = 1 then
		
		
		dw_1.setitem(1,'name_location',ls_name_branch)
		dw_1.setitem(1,'address',ls_address_branch)
		dw_1.setitem(1,'zip_code', ld_zip)
		dw_1.setitem(1,'phone_1', ls_phone)
		dw_1.setitem(1,'fax',ls_fax)
		
	end if
else
	
		dw_1.setitem(1,'name_location',ls_name_branch)
		dw_1.setitem(1,'address',ls_address_branch)
		dw_1.setitem(1,'zip_code', ld_zip)
		dw_1.setitem(1,'phone_1', ls_phone)
		dw_1.setitem(1,'fax',ls_fax)
	
end if
	
end if

end if
end event

type cb_2 from commandbutton within w_location_new
integer x = 2354
integer y = 1212
integer width = 343
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;close(w_location_new)
end event

type cb_1 from commandbutton within w_location_new
integer x = 2011
integer y = 1212
integer width = 343
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;if isnull(dw_1.getitemstring(1,'name_location')) then
	messagebox('Alert','The Location Name can no be empty',stopsign!)
	return
end if




if dw_1.update() = 1 then
	
	closewithreturn(w_location_new,1)
	
end if
end event

type dw_1 from datawindow within w_location_new
integer y = 24
integer width = 2811
integer height = 1244
integer taborder = 10
string title = "none"
string dataobject = "dw_agency_location_new"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string s_id_state, ls_id_city, ls_id_country, ls_id_state
DOUBLE d_max_location
DataWindowChild	ldw_dw


if dwo.name = 'state' then
	
	s_id_state = DATA
	
	SELECT MAX(CAST(RTRIM(RIGHT(ID_LOCATION,4))AS NUMERIC(4,0)))
	INTO :d_max_location
	FROM DBA.LOCATION
	WHERE LTRIM(LEFT(ID_LOCATION,2)) = :s_id_state;
	
	
end if

IF dwo.name = "id_state" THEN
	SetItem(GetRow(),"id_city","")
	GetChild("id_city",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetItemString(GetRow(),"id_country")+"' and id_state = '"+GetText()+"'")
	ldw_dw.Filter()
END IF

IF dwo.Name = "id_city" THEN

	ls_id_city = GetText()
	ls_id_country = GetItemString(GetRow(),"id_country")

  SELECT dba.city.id_state
    INTO :ls_id_state
    FROM dba.city
   WHERE dba.city.id_city = :ls_id_city  AND
	      dba.city.id_country = :ls_id_country ;


END IF
end event

event itemfocuschanged;string s_id_state, s_new_max_location
DOUBLE d_max_location, d_new_max_location

d_max_location = 0

IF DWO.NAME = 'currency_pay_branch' THEN
	
	s_id_state = dw_1.getitemstring(1,'id_state')
	
	SELECT MAX(CAST(RTRIM(RIGHT(ID_LOCATION,4))AS NUMERIC(4,0)))
	INTO :d_max_location
	FROM DBA.LOCATION
	WHERE LTRIM(LEFT(ID_LOCATION,2)) = :s_id_state;
	
	if isnull(d_max_location) then d_max_location = 0
	
	d_new_max_location = d_max_location + 1
	
	
	if d_new_max_location < 10 then
		
		s_new_max_location = s_id_state + '000' + string(d_new_max_location)
		
	elseif d_new_max_location > 9 and d_new_max_location < 100 then
		
		s_new_max_location = s_id_state + '00' + string(d_new_max_location)
		
	elseif d_new_max_location > 99 and d_new_max_location < 1000 then
		
		s_new_max_location = s_id_state + '0' + string(d_new_max_location)
		
	elseif d_new_max_location > 999 and d_new_max_location < 10000 then
		
		s_new_max_location = s_id_state + string(d_new_max_location)
		
	end if
	
	dw_1.setitem(1,'id_location', s_new_max_location)
	
END IF
end event

type gb_1 from groupbox within w_location_new
integer x = 46
integer y = 1144
integer width = 2743
integer height = 204
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

