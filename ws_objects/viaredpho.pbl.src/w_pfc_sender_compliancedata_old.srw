$PBExportHeader$w_pfc_sender_compliancedata_old.srw
forward
global type w_pfc_sender_compliancedata_old from window
end type
type st_2 from statictext within w_pfc_sender_compliancedata_old
end type
type st_1 from statictext within w_pfc_sender_compliancedata_old
end type
type dw_1 from datawindow within w_pfc_sender_compliancedata_old
end type
type cb_select from commandbutton within w_pfc_sender_compliancedata_old
end type
type gb_1 from groupbox within w_pfc_sender_compliancedata_old
end type
end forward

global type w_pfc_sender_compliancedata_old from window
integer width = 1774
integer height = 1460
boolean titlebar = true
string title = "Sender Identification"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
st_1 st_1
dw_1 dw_1
cb_select cb_select
gb_1 gb_1
end type
global w_pfc_sender_compliancedata_old w_pfc_sender_compliancedata_old

type variables
string ls_loaded, ls_selected, is_modalidad, is_typecall
end variables

on w_pfc_sender_compliancedata_old.create
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_select=create cb_select
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.st_1,&
this.dw_1,&
this.cb_select,&
this.gb_1}
end on

on w_pfc_sender_compliancedata_old.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_select)
destroy(this.gb_1)
end on

event open;String ls_id_branch
Decimal ld_id_sender
Long ll_count

//is_typecall = N: No valida ni muestra el mensaje superior (cuando llaman desde invoices en hold)


ls_id_branch = fn_token(Message.StringParm,'*',1)
ld_id_sender = double(fn_token(Message.StringParm,'*',2))
is_modalidad = fn_token(Message.StringParm,'*',3)
is_typecall = fn_token(Message.StringParm,'*',4)

if isnull(is_typecall) then is_typecall = 'Y'

if is_typecall = 'N' then
	st_1.visible = false
	st_2.visible = false
end if

select count(*)
into :ll_count
from dba.sender
where id_branch = :ls_id_branch
and id_sender = :ld_id_sender;

if ll_count < 1 then
	close(this)
end if

dw_1.retrieve(ls_id_branch,ld_id_sender,is_modalidad)
end event

type st_2 from statictext within w_pfc_sender_compliancedata_old
integer x = 46
integer y = 84
integer width = 1701
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "completar la siguiente información para continuar."
boolean focusrectangle = false
end type

type st_1 from statictext within w_pfc_sender_compliancedata_old
integer x = 46
integer y = 28
integer width = 1701
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Debido al monto y/o acumulado generado por esta transaccion, es necesario"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_pfc_sender_compliancedata_old
integer x = 41
integer y = 180
integer width = 1650
integer height = 1040
integer taborder = 10
string dataobject = "dw_pfc_sender_compliancedata"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_select from commandbutton within w_pfc_sender_compliancedata_old
integer x = 1253
integer y = 1260
integer width = 457
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Ok"
boolean default = true
end type

event clicked;// VALIDACION DE DATOS,  SE PUEDE USAR SI SE QUIERE QUE EL CUADRO DE IDS NO SALGA CUANDO
// LOS DATOS ESTAN BIEN.

string ls_passport_available, ls_passport_sender, ls_id_country_issuer_passport
string ls_ssn_available, ls_ssn_sender, ls_occupation_sender
datetime ld_dob_sender, ld_expiration_date_id
string ls_id_type_id_sender, ls_number_id_sender, ls_id_country_issuer_id, ls_id_state_issuer_id

string ls_message

ls_message = ''

ls_id_country_issuer_id = dw_1.getitemstring(dw_1.getrow(),"id_country_issuer_id")

if ls_id_country_issuer_id <> 'USA' then
	dw_1.setitem(dw_1.getrow(),"id_state_issuer_id","--")
end if

dw_1.update()


// No valida!
if is_typecall = 'N' then
	close(parent)
	return
end if


ls_passport_available = dw_1.getitemstring(dw_1.getrow(),"passport_available")
ls_passport_sender = dw_1.getitemstring(dw_1.getrow(),"passport_sender")
ls_id_country_issuer_passport = dw_1.getitemstring(dw_1.getrow(),"id_country_issuer_passport")
ls_ssn_available = dw_1.getitemstring(dw_1.getrow(),"ssn_available")
ls_ssn_sender = dw_1.getitemstring(dw_1.getrow(),"ssn_sender")
ls_occupation_sender = dw_1.getitemstring(dw_1.getrow(),"occupation_sender")
ld_dob_sender = dw_1.getitemdatetime(dw_1.getrow(),"dob_sender")
ld_expiration_date_id = dw_1.getitemdatetime(dw_1.getrow(),"expiration_date_id")
ls_id_type_id_sender = dw_1.getitemstring(dw_1.getrow(),"id_type_id_sender")
ls_number_id_sender = dw_1.getitemstring(dw_1.getrow(),"number_id_sender")
ls_id_country_issuer_id = dw_1.getitemstring(dw_1.getrow(),"id_country_issuer_id")
ls_id_state_issuer_id = dw_1.getitemstring(dw_1.getrow(),"id_state_issuer_id")			

// #################################################################################
// Compliance Information Validations!

if is_modalidad = '0' or is_modalidad = '1' then

	if isnull(ld_dob_sender) or ld_dob_sender < datetime(date('1899/12/31'),time('00:00:00')) or ld_dob_sender > datetime(relativedate(today(),-3650),now()) then
		//ls_message = ls_message + "- Date of birth is not valid~n"
		ls_message = ls_message + "- Debe ingresar una fecha de nacimiento valida~n" 		
	end if
	
	if isnull(ls_id_type_id_sender) or len(trim(ls_id_type_id_sender)) < 1 then
		//ls_message = ls_message + "- Type Id must be selected~n"
		ls_message = ls_message + "- Debe seleccionar tipo de ID~n"
	end if
	
	if isnull(ls_number_id_sender) or len(trim(ls_number_id_sender)) < 1 then
		//ls_message = ls_message + "- Number Id must be typed~n"
		ls_message = ls_message + "- Debe ingresar el número del ID~n"
	end if
	
	if isnull(ls_id_country_issuer_id) or len(trim(ls_id_country_issuer_id)) < 1 then
		//ls_message = ls_message + "- Country Issuer Id must be selected~n"
		ls_message = ls_message + "- Debe seleccionar el país de expedicion del ID~n"
	else
		if ls_id_country_issuer_id = 'USA' and ls_id_type_id_sender <> 'PA' then
			if isnull(ls_id_state_issuer_id) or len(trim(ls_id_state_issuer_id)) < 1 then
				//ls_message = ls_message + "- State Issuer Id must be selected~n"
				ls_message = ls_message + "- Debe seleccionar el estado de expedicion del ID~n"
			end if
		end if
	end if			
	
	if is_modalidad = '1' then
		
		// Valida el ssn
		if (isnull(ls_ssn_available) or ls_ssn_available = 'Y') then 
			if isnull(ls_ssn_sender) or len(trim(ls_ssn_sender)) < 1 then
				//ls_message = ls_message + "- Social Security Number must be typed~n"
				ls_message = ls_message + "- Debe ingresar el número de seguro social~n"
			elseif len(trim(ls_ssn_sender)) <> 9 then
				//ls_message = ls_message + "- Social Security Number must be typed completed~n"
				ls_message = ls_message + "- Debe ingresar el número un número de seguro social completo (9 caracteres)~n"
			end if
			
		// Sino tiene ssn valida el passport
		else
			
			if (isnull(ls_passport_available) or ls_passport_available = 'Y') and (ls_id_type_id_sender <> 'PA') then 
				if isnull(ls_passport_sender) or len(trim(ls_passport_sender)) < 1 then
					//ls_message = ls_message + "- Passport Number must be typed~n"
					ls_message = ls_message + "- Debe ingresar el número de pasaporte~n"
				end if
				if isnull(ls_id_country_issuer_passport) or len(trim(ls_id_country_issuer_passport)) < 1 then
					//ls_message = ls_message + "- Passport Issuer Country must be selected~n"
					ls_message = ls_message + "- Debe seleccionar el país de expedición del pasaporte~n"
				end if					
			end if			
			
		end if
		
		if isnull(ls_occupation_sender) or len(trim(ls_occupation_sender)) < 1 then
			//ls_message = ls_message + "- The sender's Occupation must be typed~n"
			ls_message = ls_message + "- Debe ingresar la ocupación del remitente~n"
		end if

	end if			
	
	// #################################################################################		

end if

if ls_message = '' then
	close(parent)
else
	Messagebox("Información Incompleta","Por favor revise la siguiente información:~n~n"+ls_message)
end if
end event

type gb_1 from groupbox within w_pfc_sender_compliancedata_old
integer x = 27
integer y = 144
integer width = 1682
integer height = 1096
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

