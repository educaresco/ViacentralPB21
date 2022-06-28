$PBExportHeader$w_emida_parameters.srw
forward
global type w_emida_parameters from pfc_w_response
end type
type cb_1 from commandbutton within w_emida_parameters
end type
type cb_cancel from commandbutton within w_emida_parameters
end type
type cb_save from commandbutton within w_emida_parameters
end type
type dw_1 from datawindow within w_emida_parameters
end type
type dw_2 from datawindow within w_emida_parameters
end type
type gb_1 from groupbox within w_emida_parameters
end type
type gb_2 from groupbox within w_emida_parameters
end type
end forward

global type w_emida_parameters from pfc_w_response
integer x = 214
integer y = 221
integer width = 2377
integer height = 1204
event ue_update ( )
cb_1 cb_1
cb_cancel cb_cancel
cb_save cb_save
dw_1 dw_1
dw_2 dw_2
gb_1 gb_1
gb_2 gb_2
end type
global w_emida_parameters w_emida_parameters

type variables
string is_id_location, is_id_chain, is_id_branch
end variables

event ue_update();if messagebox('Product','Are you sure you want to save this Product',question!,okcancel!) = 1 then

if dw_2.update() = 1 then
	
	
dw_1.update()

closewithreturn(w_emida_parameters,1)

end if

end if
end event

event open;call super::open;string s_parm, s_id_branch, s_id_chain, s_id_location,s_name_location, s_address, s_id_city, s_id_state, s_id_country, s_id_flag_location, s_currency_pay_branch, s_id_status_branch
double d_max_branch, d_zip_code

dw_1.settransobject( sqlca)
dw_1.insertrow(0)

dw_2.settransobject( sqlca)


s_parm = message.stringparm




s_id_chain = fn_token(s_parm,'/',1)
s_id_location = fn_token(s_parm,'/',2)
s_id_branch = fn_token(s_parm,'/',3)

is_id_location = s_id_location
is_id_chain = s_id_chain

SELECT NAME_LOCATION, ADDRESS, ID_CITY, ID_STATE, ID_COUNTRY, ZIP_CODE, ID_FLAG_LOCATION, CURRENCY_PAY_BRANCH, ID_STATUS_BRANCH
INTO  :s_name_location, 
:s_address, 
:s_id_city, 
:s_id_state, 
:s_id_country, 
:d_zip_code, 
:s_id_flag_location, 
:s_currency_pay_branch, 
:s_id_status_branch
FROM DBA.LOCATION
WHERE ID_CHAIN = :s_id_chain
AND ID_LOCATION = :s_id_location;

//s_id_branch = mid(s_parm, 2)
//
//s_id_branch = 'R' + s_id_branch

dw_2.retrieve(s_id_branch)

if dw_2.rowcount() < 1 then
	
	
	dw_2.insertrow(0)
	
	dw_2.setitem(1,'id_chain',s_id_chain)
	dw_2.setitem(1,'id_location', s_id_location)
	dw_2.setitem(1,'name_branch', s_name_location)
	dw_2.setitem(1,'address_branch', s_address)
	dw_2.setitem(1,'id_city', s_id_city)
	dw_2.setitem(1,'id_state', s_id_state)
	dw_2.setitem(1,'id_country', s_id_country)
	dw_2.setitem(1,'id_main_branch','1111')
	dw_2.setitem(1,'id_flag_branch', s_id_flag_location)
	dw_2.setitem(1,'id_type_branch', 'A')
	dw_2.setitem(1,'currency_pay_branch',s_currency_pay_branch)
	dw_2.setitem(1,'id_status_branch', s_id_status_branch)
	
	SELECT MAX(CAST(RIGHT(ID_BRANCH,9) as NUMERIC)) 
	INTO :d_max_branch
	FROM DBA.BRANCH
	WHERE LEFT(ID_BRANCH,1) = 'A'
	AND id_type_branch IN ('A','R')
	AND ID_BRANCH NOT IN ('A09999','A99986','A99987','A99988','A99989','A99990','A99982', 'A99980',
	'A99981', 'A99991','A99992','A99993','A99994','A99996','A99997','A99999','AB0106','AB0107',    
	'AB0110','AB0111','AC0001' );
	
	
	s_id_Branch = string(d_max_branch + 1)
	
	if  d_max_branch >= 1 and d_max_branch < 10 then
		
		s_id_branch = 'A0000' + s_id_branch
	
	elseif d_max_branch > 9 and d_max_branch < 100 then
	
		s_id_branch ='A000' + s_id_branch
		
	elseif d_max_branch >= 100 and d_max_branch < 1000 then
		
		s_id_branch = 'A00' + s_id_branch
		
	elseif d_max_branch >= 1000 and d_max_branch < 10000 then
		
		s_id_branch = 'A0' + s_id_branch
		
	elseif d_max_branch >= 10000 and d_max_branch < 100000 then
		
		s_id_branch = 'A' + s_id_branch
		
	end if
	
	dw_2.setitem(1,'id_branch', s_id_branch)
	dw_2.setitem(1,'id_company','VIA')
	
end if


end event

on w_emida_parameters.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_cancel=create cb_cancel
this.cb_save=create cb_save
this.dw_1=create dw_1
this.dw_2=create dw_2
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_save
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.dw_2
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
end on

on w_emida_parameters.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_cancel)
destroy(this.cb_save)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_1 from commandbutton within w_emida_parameters
integer x = 1920
integer y = 164
integer width = 361
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select Existing"
end type

event clicked;string ls_id_branch, id_flag_branch, id_chain


 

open(w_branch_selection)

ls_id_branch = Message.stringparm

if not isnull(ls_id_branch) then

	SELECT ID_FLAG_BRANCH, ID_CHAIN
	INTO :id_flag_branch, :id_chain
	FROM DBA.BRANCH
	WHERE ID_BRANCH = :ls_id_branch;
	
	IF NOT ISNULL(id_chain) THEN
		
		IF MESSAGEBOX('Alert','This product is Assing to another Chain are you sure you want to change it?',question!,yesno!) = 1 then
			
			dw_2.retrieve(ls_id_branch)
			dw_2.setitem(1,'id_chain',is_id_chain)
			dw_2.setitem(1,'id_location', is_id_location)
			//dw_2.setitem(1,"id_branch",ls_id_branch)
			//dw_2.setitem(1,"id_flag_branch",id_flag_branch)
			
		end if
		
	else
		dw_2.retrieve(ls_id_branch)
		dw_2.setitem(1,'id_chain',is_id_chain)
		dw_2.setitem(1,'id_location', is_id_location)
		//dw_2.setitem(1,"id_branch",ls_id_branch)
		//dw_2.setitem(1,"id_flag_branch",id_flag_branch)
		
	end if

end if
end event

type cb_cancel from commandbutton within w_emida_parameters
integer x = 1952
integer y = 948
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;close(w_emida_parameters)
end event

type cb_save from commandbutton within w_emida_parameters
integer x = 1605
integer y = 948
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;w_emida_parameters.triggerevent("ue_update")
end event

type dw_1 from datawindow within w_emida_parameters
integer x = 64
integer y = 568
integer width = 2181
integer height = 268
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_emida_parameters"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type dw_2 from datawindow within w_emida_parameters
integer x = 37
integer y = 32
integer width = 2304
integer height = 452
integer taborder = 10
string title = "none"
string dataobject = "dw_new_branch"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string s_product_type, s_id_branch
double d_id_branch

if dwo.name = "product_type" then
	
	s_product_type = data
	
	if s_product_type = 'REC' then
		
		dw_1.enabled = true
		
		s_id_branch = dw_2.getitemstring(1,'id_branch')
		
		SELECT MAX(CAST(RIGHT(ID_BRANCH,9) as NUMERIC)) 
		INTO :d_id_branch
		FROM DBA.BRANCH
		WHERE LEFT(ID_BRANCH,1) = 'R'
		AND id_type_branch IN ('A','R');
		
		if isnull(d_id_branch) then d_id_branch = 0
		
		
		d_id_branch = d_id_branch + 1
		s_id_branch = string(d_id_branch)
		
		if  d_id_branch >= 1 and d_id_branch < 10 then
		
		s_id_branch = 'R0000' + s_id_branch
	
	elseif d_id_branch > 9 and d_id_branch < 100 then
	
		s_id_branch ='R000' + s_id_branch
		
	elseif d_id_branch >= 100 and d_id_branch < 1000 then
		
		s_id_branch = 'R00' + s_id_branch
		
	elseif d_id_branch >= 1000 and d_id_branch < 10000 then
		
		s_id_branch = 'R0' + s_id_branch
		
	elseif d_id_branch >= 10000 and d_id_branch < 100000 then
		
		s_id_branch = 'R' + s_id_branch
		
	end if
		
		dw_2.setitem(1,"id_branch",s_id_branch)
		
		dw_1.setitem(1,"id_branch",s_id_branch)
	
	end if
	
end if
end event

type gb_1 from groupbox within w_emida_parameters
integer x = 14
integer y = 492
integer width = 2322
integer height = 364
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pin Number Recharge"
end type

type gb_2 from groupbox within w_emida_parameters
integer x = 914
integer y = 864
integer width = 1422
integer height = 236
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

