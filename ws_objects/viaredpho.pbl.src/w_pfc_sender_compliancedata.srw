$PBExportHeader$w_pfc_sender_compliancedata.srw
forward
global type w_pfc_sender_compliancedata from window
end type
type cb_kyc from commandbutton within w_pfc_sender_compliancedata
end type
type st_verified from statictext within w_pfc_sender_compliancedata
end type
type txt_address_sender from singlelineedit within w_pfc_sender_compliancedata
end type
type st_1 from statictext within w_pfc_sender_compliancedata
end type
type cb_ok2 from commandbutton within w_pfc_sender_compliancedata
end type
type cbx_confirm from checkbox within w_pfc_sender_compliancedata
end type
type st_msg2 from statictext within w_pfc_sender_compliancedata
end type
type txt_occupation_sender from singlelineedit within w_pfc_sender_compliancedata
end type
type st_occupation_sender from statictext within w_pfc_sender_compliancedata
end type
type txt_kyc_employer_phone from editmask within w_pfc_sender_compliancedata
end type
type txt_kyc_employer_address_zip from singlelineedit within w_pfc_sender_compliancedata
end type
type lst_kyc_employer_address_state from my_ddlb within w_pfc_sender_compliancedata
end type
type st_kyc_employer_address from statictext within w_pfc_sender_compliancedata
end type
type txt_kyc_employer_address_city from singlelineedit within w_pfc_sender_compliancedata
end type
type st_kyc_employer_phone from statictext within w_pfc_sender_compliancedata
end type
type txt_kyc_employer from singlelineedit within w_pfc_sender_compliancedata
end type
type st_kyc_employer_address_street from statictext within w_pfc_sender_compliancedata
end type
type st_id_country_issuer_id from statictext within w_pfc_sender_compliancedata
end type
type txt_kyc_fundswillbeusedfor from singlelineedit within w_pfc_sender_compliancedata
end type
type st_kyc_fundswillbeusedfor from statictext within w_pfc_sender_compliancedata
end type
type txt_kyc_sourceoffunds from singlelineedit within w_pfc_sender_compliancedata
end type
type st_kyc_sourceoffunds from statictext within w_pfc_sender_compliancedata
end type
type txt_kyc_relationship from singlelineedit within w_pfc_sender_compliancedata
end type
type st_kyc_relationship from statictext within w_pfc_sender_compliancedata
end type
type cb_cancel from commandbutton within w_pfc_sender_compliancedata
end type
type lst_id_country_issuer_passport from my_ddlb within w_pfc_sender_compliancedata
end type
type lst_id_state_issuer_id from my_ddlb within w_pfc_sender_compliancedata
end type
type lst_id_type_id_sender from my_ddlb within w_pfc_sender_compliancedata
end type
type lst_id_country_issuer_id from my_ddlb within w_pfc_sender_compliancedata
end type
type cb_ok from commandbutton within w_pfc_sender_compliancedata
end type
type st_12 from statictext within w_pfc_sender_compliancedata
end type
type chk_passport_available from checkbox within w_pfc_sender_compliancedata
end type
type chk_ssn_available from checkbox within w_pfc_sender_compliancedata
end type
type txt_kyc_employer_address_street from singlelineedit within w_pfc_sender_compliancedata
end type
type txt_passport_sender from singlelineedit within w_pfc_sender_compliancedata
end type
type txt_ssn_sender from singlelineedit within w_pfc_sender_compliancedata
end type
type txt_expiration_date_id from editmask within w_pfc_sender_compliancedata
end type
type txt_number_id_sender from singlelineedit within w_pfc_sender_compliancedata
end type
type txt_dob_sender from editmask within w_pfc_sender_compliancedata
end type
type txt_name_sender from singlelineedit within w_pfc_sender_compliancedata
end type
type st_kyc_employer from statictext within w_pfc_sender_compliancedata
end type
type st_id_country_issuer_passport from statictext within w_pfc_sender_compliancedata
end type
type st_passport_sender from statictext within w_pfc_sender_compliancedata
end type
type st_ssn_sender from statictext within w_pfc_sender_compliancedata
end type
type st_expiration_date_id from statictext within w_pfc_sender_compliancedata
end type
type lbl0_6 from statictext within w_pfc_sender_compliancedata
end type
type lbl0_3 from statictext within w_pfc_sender_compliancedata
end type
type lbl0_2 from statictext within w_pfc_sender_compliancedata
end type
type lbl0_1 from statictext within w_pfc_sender_compliancedata
end type
type gb_identification from groupbox within w_pfc_sender_compliancedata
end type
type txt_dummy_passport1 from singlelineedit within w_pfc_sender_compliancedata
end type
type txt_dummy_passport2 from singlelineedit within w_pfc_sender_compliancedata
end type
type gb_passport from groupbox within w_pfc_sender_compliancedata
end type
type txt_dummy_ssn from singlelineedit within w_pfc_sender_compliancedata
end type
type gb_social from groupbox within w_pfc_sender_compliancedata
end type
type gb_addinfo from groupbox within w_pfc_sender_compliancedata
end type
type gb_2 from groupbox within w_pfc_sender_compliancedata
end type
type gb_1 from groupbox within w_pfc_sender_compliancedata
end type
end forward

global type w_pfc_sender_compliancedata from window
integer width = 2715
integer height = 2212
boolean titlebar = true
string title = "Informacion para la forma KYC"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_kyc cb_kyc
st_verified st_verified
txt_address_sender txt_address_sender
st_1 st_1
cb_ok2 cb_ok2
cbx_confirm cbx_confirm
st_msg2 st_msg2
txt_occupation_sender txt_occupation_sender
st_occupation_sender st_occupation_sender
txt_kyc_employer_phone txt_kyc_employer_phone
txt_kyc_employer_address_zip txt_kyc_employer_address_zip
lst_kyc_employer_address_state lst_kyc_employer_address_state
st_kyc_employer_address st_kyc_employer_address
txt_kyc_employer_address_city txt_kyc_employer_address_city
st_kyc_employer_phone st_kyc_employer_phone
txt_kyc_employer txt_kyc_employer
st_kyc_employer_address_street st_kyc_employer_address_street
st_id_country_issuer_id st_id_country_issuer_id
txt_kyc_fundswillbeusedfor txt_kyc_fundswillbeusedfor
st_kyc_fundswillbeusedfor st_kyc_fundswillbeusedfor
txt_kyc_sourceoffunds txt_kyc_sourceoffunds
st_kyc_sourceoffunds st_kyc_sourceoffunds
txt_kyc_relationship txt_kyc_relationship
st_kyc_relationship st_kyc_relationship
cb_cancel cb_cancel
lst_id_country_issuer_passport lst_id_country_issuer_passport
lst_id_state_issuer_id lst_id_state_issuer_id
lst_id_type_id_sender lst_id_type_id_sender
lst_id_country_issuer_id lst_id_country_issuer_id
cb_ok cb_ok
st_12 st_12
chk_passport_available chk_passport_available
chk_ssn_available chk_ssn_available
txt_kyc_employer_address_street txt_kyc_employer_address_street
txt_passport_sender txt_passport_sender
txt_ssn_sender txt_ssn_sender
txt_expiration_date_id txt_expiration_date_id
txt_number_id_sender txt_number_id_sender
txt_dob_sender txt_dob_sender
txt_name_sender txt_name_sender
st_kyc_employer st_kyc_employer
st_id_country_issuer_passport st_id_country_issuer_passport
st_passport_sender st_passport_sender
st_ssn_sender st_ssn_sender
st_expiration_date_id st_expiration_date_id
lbl0_6 lbl0_6
lbl0_3 lbl0_3
lbl0_2 lbl0_2
lbl0_1 lbl0_1
gb_identification gb_identification
txt_dummy_passport1 txt_dummy_passport1
txt_dummy_passport2 txt_dummy_passport2
gb_passport gb_passport
txt_dummy_ssn txt_dummy_ssn
gb_social gb_social
gb_addinfo gb_addinfo
gb_2 gb_2
gb_1 gb_1
end type
global w_pfc_sender_compliancedata w_pfc_sender_compliancedata

type variables
String	is_modalidad, is_kycfile, is_kycfilepath, is_id_branch, is_fromorderwindow
Decimal id_id_sender, is_id_receiver
boolean ib_from_ids_fax
end variables

forward prototypes
public subroutine fn_refreshdisplay ()
end prototypes

public subroutine fn_refreshdisplay ();// Modalidad -1 es cuando la abre voluntariamente
//messagebox("",is_modalidad)

if is_modalidad = '-1' then
	cb_ok.text = '&Ok'
end if

//if is_modalidad = '1' then
//	txt_dummy_ssn.visible = chk_ssn_available.checked
//	txt_ssn_sender.visible = not chk_ssn_available.checked
//
//	// If primary ID is a passport or has a SSN then hides the passport fields
//	if fn_token(lst_id_type_id_sender.text,'*',2) <> 'PA' and chk_ssn_available.checked then
//		gb_4.visible = true
//		lbl1_2.visible = true
//		lbl1_3.visible = true
//		chk_passport_available.visible = true	
//		txt_dummy_passport1.visible = chk_passport_available.checked
//		txt_dummy_passport2.visible = chk_passport_available.checked
//		txt_passport_sender.visible = not chk_passport_available.checked
//		lst_id_country_issuer_passport.visible = not chk_passport_available.checked	
//	else
//		gb_4.visible = false
//		lbl1_2.visible = false
//		lbl1_3.visible = false
//		txt_passport_sender.visible = false
//		lst_id_country_issuer_passport.visible = false
//		chk_passport_available.visible = false	
//		txt_dummy_passport1.visible = false
//		txt_dummy_passport2.visible = false
//	end if
//
//else
//
//	gb_3.visible = false
//	gb_4.visible = false
//
//	lbl1_1.visible = false
//	lbl1_2.visible = false
//	lbl1_3.visible = false
//
//	txt_dummy_ssn.visible = false
//	txt_dummy_passport1.visible = false
//	txt_dummy_passport2.visible = false
//
//	txt_ssn_sender.visible = false
//	chk_ssn_available.visible = false
//	txt_passport_sender.visible = false
//	lst_id_country_issuer_passport.visible = false
//	chk_passport_available.visible = false
//
//end if
//
//
// State Issuer is Only for USA
//if fn_token(lst_id_country_issuer_id.text,'*',2) = 'USA' then
//	lst_id_state_issuer_id.visible = true
//else
//	lst_id_state_issuer_id.visible = false
//end if


	// If primary ID is a passport or has a SSN then hides the passport fields
if fn_token(lst_id_type_id_sender.text,'*',2) <> 'PA' and chk_ssn_available.checked then
	gb_passport.visible = true
	st_id_country_issuer_passport.visible = true
	st_passport_sender.visible = true
	chk_passport_available.visible = true	
	txt_dummy_passport1.visible = chk_passport_available.checked
	txt_dummy_passport2.visible = chk_passport_available.checked
	txt_passport_sender.visible = not chk_passport_available.checked
	lst_id_country_issuer_passport.visible = not chk_passport_available.checked	
else
	gb_passport.visible = false
	st_id_country_issuer_passport.visible = false
	st_passport_sender.visible = false
	txt_passport_sender.visible = false
	lst_id_country_issuer_passport.visible = false
	chk_passport_available.visible = false	
	txt_dummy_passport1.visible = false
	txt_dummy_passport2.visible = false
end if
	

txt_dummy_ssn.visible = chk_ssn_available.checked
txt_ssn_sender.visible = not chk_ssn_available.checked

// State Issuer is Only for USA
if fn_token(lst_id_country_issuer_id.text,'*',2) = 'USA' then
	lst_id_state_issuer_id.visible = true
else
	lst_id_state_issuer_id.visible = false
end if


end subroutine

on w_pfc_sender_compliancedata.create
this.cb_kyc=create cb_kyc
this.st_verified=create st_verified
this.txt_address_sender=create txt_address_sender
this.st_1=create st_1
this.cb_ok2=create cb_ok2
this.cbx_confirm=create cbx_confirm
this.st_msg2=create st_msg2
this.txt_occupation_sender=create txt_occupation_sender
this.st_occupation_sender=create st_occupation_sender
this.txt_kyc_employer_phone=create txt_kyc_employer_phone
this.txt_kyc_employer_address_zip=create txt_kyc_employer_address_zip
this.lst_kyc_employer_address_state=create lst_kyc_employer_address_state
this.st_kyc_employer_address=create st_kyc_employer_address
this.txt_kyc_employer_address_city=create txt_kyc_employer_address_city
this.st_kyc_employer_phone=create st_kyc_employer_phone
this.txt_kyc_employer=create txt_kyc_employer
this.st_kyc_employer_address_street=create st_kyc_employer_address_street
this.st_id_country_issuer_id=create st_id_country_issuer_id
this.txt_kyc_fundswillbeusedfor=create txt_kyc_fundswillbeusedfor
this.st_kyc_fundswillbeusedfor=create st_kyc_fundswillbeusedfor
this.txt_kyc_sourceoffunds=create txt_kyc_sourceoffunds
this.st_kyc_sourceoffunds=create st_kyc_sourceoffunds
this.txt_kyc_relationship=create txt_kyc_relationship
this.st_kyc_relationship=create st_kyc_relationship
this.cb_cancel=create cb_cancel
this.lst_id_country_issuer_passport=create lst_id_country_issuer_passport
this.lst_id_state_issuer_id=create lst_id_state_issuer_id
this.lst_id_type_id_sender=create lst_id_type_id_sender
this.lst_id_country_issuer_id=create lst_id_country_issuer_id
this.cb_ok=create cb_ok
this.st_12=create st_12
this.chk_passport_available=create chk_passport_available
this.chk_ssn_available=create chk_ssn_available
this.txt_kyc_employer_address_street=create txt_kyc_employer_address_street
this.txt_passport_sender=create txt_passport_sender
this.txt_ssn_sender=create txt_ssn_sender
this.txt_expiration_date_id=create txt_expiration_date_id
this.txt_number_id_sender=create txt_number_id_sender
this.txt_dob_sender=create txt_dob_sender
this.txt_name_sender=create txt_name_sender
this.st_kyc_employer=create st_kyc_employer
this.st_id_country_issuer_passport=create st_id_country_issuer_passport
this.st_passport_sender=create st_passport_sender
this.st_ssn_sender=create st_ssn_sender
this.st_expiration_date_id=create st_expiration_date_id
this.lbl0_6=create lbl0_6
this.lbl0_3=create lbl0_3
this.lbl0_2=create lbl0_2
this.lbl0_1=create lbl0_1
this.gb_identification=create gb_identification
this.txt_dummy_passport1=create txt_dummy_passport1
this.txt_dummy_passport2=create txt_dummy_passport2
this.gb_passport=create gb_passport
this.txt_dummy_ssn=create txt_dummy_ssn
this.gb_social=create gb_social
this.gb_addinfo=create gb_addinfo
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_kyc,&
this.st_verified,&
this.txt_address_sender,&
this.st_1,&
this.cb_ok2,&
this.cbx_confirm,&
this.st_msg2,&
this.txt_occupation_sender,&
this.st_occupation_sender,&
this.txt_kyc_employer_phone,&
this.txt_kyc_employer_address_zip,&
this.lst_kyc_employer_address_state,&
this.st_kyc_employer_address,&
this.txt_kyc_employer_address_city,&
this.st_kyc_employer_phone,&
this.txt_kyc_employer,&
this.st_kyc_employer_address_street,&
this.st_id_country_issuer_id,&
this.txt_kyc_fundswillbeusedfor,&
this.st_kyc_fundswillbeusedfor,&
this.txt_kyc_sourceoffunds,&
this.st_kyc_sourceoffunds,&
this.txt_kyc_relationship,&
this.st_kyc_relationship,&
this.cb_cancel,&
this.lst_id_country_issuer_passport,&
this.lst_id_state_issuer_id,&
this.lst_id_type_id_sender,&
this.lst_id_country_issuer_id,&
this.cb_ok,&
this.st_12,&
this.chk_passport_available,&
this.chk_ssn_available,&
this.txt_kyc_employer_address_street,&
this.txt_passport_sender,&
this.txt_ssn_sender,&
this.txt_expiration_date_id,&
this.txt_number_id_sender,&
this.txt_dob_sender,&
this.txt_name_sender,&
this.st_kyc_employer,&
this.st_id_country_issuer_passport,&
this.st_passport_sender,&
this.st_ssn_sender,&
this.st_expiration_date_id,&
this.lbl0_6,&
this.lbl0_3,&
this.lbl0_2,&
this.lbl0_1,&
this.gb_identification,&
this.txt_dummy_passport1,&
this.txt_dummy_passport2,&
this.gb_passport,&
this.txt_dummy_ssn,&
this.gb_social,&
this.gb_addinfo,&
this.gb_2,&
this.gb_1}
end on

on w_pfc_sender_compliancedata.destroy
destroy(this.cb_kyc)
destroy(this.st_verified)
destroy(this.txt_address_sender)
destroy(this.st_1)
destroy(this.cb_ok2)
destroy(this.cbx_confirm)
destroy(this.st_msg2)
destroy(this.txt_occupation_sender)
destroy(this.st_occupation_sender)
destroy(this.txt_kyc_employer_phone)
destroy(this.txt_kyc_employer_address_zip)
destroy(this.lst_kyc_employer_address_state)
destroy(this.st_kyc_employer_address)
destroy(this.txt_kyc_employer_address_city)
destroy(this.st_kyc_employer_phone)
destroy(this.txt_kyc_employer)
destroy(this.st_kyc_employer_address_street)
destroy(this.st_id_country_issuer_id)
destroy(this.txt_kyc_fundswillbeusedfor)
destroy(this.st_kyc_fundswillbeusedfor)
destroy(this.txt_kyc_sourceoffunds)
destroy(this.st_kyc_sourceoffunds)
destroy(this.txt_kyc_relationship)
destroy(this.st_kyc_relationship)
destroy(this.cb_cancel)
destroy(this.lst_id_country_issuer_passport)
destroy(this.lst_id_state_issuer_id)
destroy(this.lst_id_type_id_sender)
destroy(this.lst_id_country_issuer_id)
destroy(this.cb_ok)
destroy(this.st_12)
destroy(this.chk_passport_available)
destroy(this.chk_ssn_available)
destroy(this.txt_kyc_employer_address_street)
destroy(this.txt_passport_sender)
destroy(this.txt_ssn_sender)
destroy(this.txt_expiration_date_id)
destroy(this.txt_number_id_sender)
destroy(this.txt_dob_sender)
destroy(this.txt_name_sender)
destroy(this.st_kyc_employer)
destroy(this.st_id_country_issuer_passport)
destroy(this.st_passport_sender)
destroy(this.st_ssn_sender)
destroy(this.st_expiration_date_id)
destroy(this.lbl0_6)
destroy(this.lbl0_3)
destroy(this.lbl0_2)
destroy(this.lbl0_1)
destroy(this.gb_identification)
destroy(this.txt_dummy_passport1)
destroy(this.txt_dummy_passport2)
destroy(this.gb_passport)
destroy(this.txt_dummy_ssn)
destroy(this.gb_social)
destroy(this.gb_addinfo)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;string ls_name_sender 
string ls_passport_available, ls_passport_sender, ls_id_country_issuer_passport
string ls_ssn_available, ls_ssn_sender, ls_occupation_sender
date ld_dob_sender, ld_expiration_date_id
string ls_id_type_id_sender, ls_number_id_sender, ls_id_country_issuer_id, ls_id_state_issuer_id, &
		ls_kyc_relationship, ls_kyc_sourceoffunds, ls_kyc_fundswillbeusedfor, ls_kyc_employer, &
		ls_kyc_employer_address_street, ls_kyc_employer_address_city, ls_kyc_employer_address_state, &
		ls_kyc_employer_address_zip, ls_kyc_employer_phone
string ls_address_sender, ls_city_sender, ls_state_sender, ls_zip_sender, ls_address_verified	

if fn_getlang() = 'EN' then this.title = 'KYC Form Information'

is_id_branch = fn_token(Message.StringParm,'*',1)

//si esta ventana es invocada desde w_faxcomponent_senderids se recibe *IDS* para inhabilitar los botones de kyc
if pos(is_id_branch, "-IDS-") = 1 then
	is_id_branch = mid(is_id_branch, 6, len(is_id_branch))
	cb_ok.Enabled = false
	cb_kyc.Enabled = false
	ib_from_ids_fax = true
end if 

id_id_sender = double(fn_token(Message.StringParm,'*',2))
is_id_receiver = double(fn_token(Message.StringParm,'*',3))
is_modalidad = fn_token(Message.StringParm,'*',4)
is_fromorderwindow = fn_token(Message.StringParm,'*',5)

// is_fromorderwindow = 'Y' when called from the w_pfc_sender_telefono_rojo otherwise 'N'

if isnull(is_modalidad) then is_modalidad = '-1'

if is_modalidad = '2' then cb_ok2.enabled = true

// Populating list boxes
lst_id_type_id_sender.addquery("select name_type_id_sender, id_type_id_sender from dba.type_id_sender order by name_type_id_sender;")
lst_id_state_issuer_id.addquery("SELECT DISTINCT NAME_STATE, ID_STATE FROM dba.STATE WHERE ID_COUNTRY = 'USA' AND len(ID_STATE) < 3 ORDER BY NAME_STATE;")
lst_id_country_issuer_id.addquery("SELECT NAME_COUNTRY, ISO_C3 FROM DBA.COUNTRY UNION SELECT '[SELECCIONAR PAIS]', '--' ORDER BY 1;")
lst_id_country_issuer_passport.addquery("SELECT NAME_COUNTRY, ISO_C3 FROM DBA.COUNTRY UNION SELECT '[SELECCIONAR PAIS]', '--' ORDER BY 1;")
lst_kyc_employer_address_state.addquery("SELECT DISTINCT NAME_STATE, ID_STATE FROM dba.STATE WHERE ID_COUNTRY = 'USA' AND len(ID_STATE) < 3 ORDER BY NAME_STATE;")


// Getting previous values

if is_fromorderwindow = 'Y' then
	
	st_verified.visible = false
	
	if isvalid(w_pfc_sender_telefono_rojo) then
		
		w_pfc_sender_telefono_rojo.dw_1.accepttext()
		
		txt_name_sender.text 							= w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"name_sender")
		txt_dob_sender.text 								= string(w_pfc_sender_telefono_rojo.dw_1.getitemdatetime(w_pfc_sender_telefono_rojo.dw_1.getrow(),"dob_sender"),"mm/dd/yyyy")
		lst_id_type_id_sender.setselectedid(w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_type_id_sender"))
		txt_number_id_sender.text 						= w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"number_id_sender")
		lst_id_state_issuer_id.setselectedid(w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_state_issuer_id"))
		lst_id_country_issuer_id.setselectedid(w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_country_issuer_id"))
		txt_expiration_date_id.text 						= string(w_pfc_sender_telefono_rojo.dw_1.getitemdatetime(w_pfc_sender_telefono_rojo.dw_1.getrow(),"expiration_date_id"),"mm/dd/yyyy")
		txt_occupation_sender.text 						= w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"occupation_sender")
		txt_ssn_sender.text 								= w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"ssn_sender")
		txt_passport_sender.text 						= w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"passport_sender")
		lst_id_country_issuer_passport.setselectedid(w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_country_issuer_passport"))
		ls_ssn_available 									= w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"ssn_available")
		ls_passport_available 							= w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"passport_available")
						
		txt_kyc_relationship.text  						=	w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_RELATIONSHIP")				
		txt_kyc_sourceoffunds.text  					=	w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_SOURCEOFFUNDS")		
		txt_kyc_fundswillbeusedfor.text  				=	w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_FUNDSWILLBEUSEDFOR")		
		txt_kyc_employer.text  							=	w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_NAME")		
//		txt_kyc_employer_address_street.text  		=	w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ADDR")		
//		txt_kyc_employer_address_city.text  		=	w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_CITY")		
//		lst_kyc_employer_address_state.setselectedid(w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ID_STATE"))
//		txt_kyc_employer_address_zip.text  			=	w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ZIP_CODE_V")				
		txt_kyc_employer_phone.text 					=	w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_PHONE_V")					


		ls_address_sender = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"addres_sender")		
		ls_city_sender = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"city_sender")		
		ls_state_sender = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"state_sender")		
		ls_zip_sender = w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"zip_sender")
		ls_address_verified =  w_pfc_sender_telefono_rojo.dw_1.getitemstring(w_pfc_sender_telefono_rojo.dw_1.getrow(),"add_bitmap_sender")

	end if

else
	
	st_verified.visible = true
	
	SELECT 
	name_sender,
	dob_sender,
	id_type_id_sender,
	number_id_sender,
	id_state_issuer_id,
	id_country_issuer_id,
	expiration_date_id,
	occupation_sender,
	ssn_sender,
	passport_sender,
	id_country_issuer_passport,
	ssn_available,
	passport_available,
	SEN_RELATIONSHIP,
	SEN_SOURCEOFFUNDS,
	SEN_FUNDSWILLBEUSEDFOR,
	SEN_EMPLOYER_NAME,
	SEN_EMPLOYER_ADDR,
	SEN_EMPLOYER_CITY,
	SEN_EMPLOYER_ID_STATE,
	SEN_EMPLOYER_ZIP_CODE_V,
	SEN_EMPLOYER_PHONE_V,
	addres_sender,
	city_sender,
	state_sender,
	zip_sender,
	add_bitmap_sender
	INTO
	:ls_name_sender,
	:ld_dob_sender,
	:ls_id_type_id_sender,
	:ls_number_id_sender,
	:ls_id_state_issuer_id,
	:ls_id_country_issuer_id,
	:ld_expiration_date_id,
	:ls_occupation_sender,
	:ls_ssn_sender,
	:ls_passport_sender,
	:ls_id_country_issuer_passport,
	:ls_ssn_available,
	:ls_passport_available,
	:ls_kyc_relationship,
	:ls_kyc_sourceoffunds,
	:ls_kyc_fundswillbeusedfor,
	:ls_kyc_employer,
	:ls_kyc_employer_address_street,
	:ls_kyc_employer_address_city,
	:ls_kyc_employer_address_state,
	:ls_kyc_employer_address_zip,
	:ls_kyc_employer_phone,
	:ls_address_sender,
	:ls_city_sender,
	:ls_state_sender,
	:ls_zip_sender,
	:ls_address_verified
	FROM dba.SENDER
	WHERE ID_BRANCH = :is_id_branch
	AND ID_SENDER = :id_id_sender;

	txt_name_sender.text = ls_name_sender
	txt_dob_sender.text = string(ld_dob_sender,"mm/dd/yyyy")
	lst_id_type_id_sender.setselectedid(ls_id_type_id_sender)
	txt_number_id_sender.text = ls_number_id_sender
	lst_id_state_issuer_id.setselectedid(ls_id_state_issuer_id)
	lst_id_country_issuer_id.setselectedid(ls_id_country_issuer_id)
	txt_expiration_date_id.text = string(ld_expiration_date_id,"mm/dd/yyyy")
	txt_occupation_sender.text = ls_occupation_sender
	txt_ssn_sender.text = ls_ssn_sender
	txt_passport_sender.text = ls_passport_sender
	lst_id_country_issuer_passport.setselectedid(ls_id_country_issuer_passport)						
	txt_kyc_relationship.text =	ls_kyc_relationship
	txt_kyc_sourceoffunds.text =	ls_kyc_sourceoffunds
	txt_kyc_fundswillbeusedfor.text =	ls_kyc_fundswillbeusedfor
	txt_kyc_employer.text =	ls_kyc_employer
//	txt_kyc_employer_address_street.text =	ls_kyc_employer_address_street
//	txt_kyc_employer_address_city.text =	ls_kyc_employer_address_city
//	lst_kyc_employer_address_state.setselectedid(ls_kyc_employer_address_state)
//	txt_kyc_employer_address_zip.text =	ls_kyc_employer_address_zip
	txt_kyc_employer_phone.text =	ls_kyc_employer_phone
	
end if


if trim(txt_name_sender.text) = '' then	
	close(this)	
end if

if len(ls_zip_sender) = 4 then ls_zip_sender = '0' + ls_zip_sender

txt_address_sender.text = trim(ls_address_sender) + ' ' + trim(ls_city_sender) + ' ' + trim(ls_state_sender) + ' ' + trim(ls_zip_sender)

// ############################################################
// Values for add_bitmap_sender are:
// AV:V?: Verified waiting selection 
// AV:VA: Verified accepted (by system or user)
// AV:KC: Keep current (Unverified)
// AV:NF: Not Similar Address Found (will ask before save and will change to AV:KC)
// AV:IA: Invalid Address (will ask before save the record)		
// OTHER: Address to be verified
// ############################################################
if left(ls_address_verified,5) = 'AV:V?' then
	st_verified.text = '[Suggested Matches Available]'
	// activar link!
elseif left(ls_address_verified,5) = 'AV:VA' then
	st_verified.text = 'Address Verified'	
elseif left(ls_address_verified,5) = 'AV:KC' then
	st_verified.text = 'Address Confirmed by Customer'	
elseif left(ls_address_verified,5) = 'AV:NF' then
	st_verified.text = 'Address Not Found'		
elseif left(ls_address_verified,5) = 'AV:IA' then
	st_verified.text = 'Invalid Address'
else
	st_verified.text = '[Click to Verify Address]'
	// activar verificacion!!
end if	


if isnull(ls_ssn_available) then ls_ssn_available = 'Y'
if isnull(ls_passport_available) then ls_passport_available = 'Y'

if ls_ssn_available = 'Y' then
	chk_ssn_available.checked = false
else
	chk_ssn_available.checked = true
end if

if ls_passport_available = 'Y' then
	chk_passport_available.checked = false
else
	chk_passport_available.checked = true
end if


// When a KYC is required, fields are mandatory!
if is_modalidad = '1' then
		
	st_kyc_relationship.textcolor = RGB(0,0,0)
	st_kyc_sourceoffunds.textcolor = RGB(0,0,0)
	st_kyc_fundswillbeusedfor.textcolor = RGB(0,0,0)
	st_kyc_employer.textcolor = RGB(0,0,0)
	st_kyc_employer_address_street.textcolor = RGB(0,0,0)
	st_kyc_employer_address.textcolor = RGB(0,0,0)
	st_kyc_employer_phone.textcolor = RGB(0,0,0)
	st_occupation_sender.textcolor = RGB(0,0,0)
	st_ssn_sender.textcolor = RGB(0,0,0)
	chk_ssn_available.textcolor = RGB(0,0,0)
	st_passport_sender.textcolor = RGB(0,0,0)
	st_id_country_issuer_passport.textcolor = RGB(0,0,0)
	chk_passport_available.textcolor = RGB(0,0,0)	
	st_id_country_issuer_id.textcolor = RGB(0,0,0)
	st_expiration_date_id.textcolor = RGB(0,0,0)
	gb_addinfo.textcolor = RGB(0,0,0)
	gb_social.textcolor = RGB(0,0,0)
	gb_passport.textcolor = RGB(0,0,0)
	gb_identification.textcolor = RGB(0,0,0)
	
end if
	
	
fn_refreshdisplay()
end event

type cb_kyc from commandbutton within w_pfc_sender_compliancedata
integer x = 2025
integer y = 1980
integer width = 640
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Exportar KYC"
boolean default = true
end type

event clicked;string ls_passport_available, ls_passport_sender, ls_id_country_issuer_passport
string ls_ssn_available, ls_ssn_sender, ls_occupation_sender
date ld_dob_sender, ld_expiration_date_id
string ls_id_type_id_sender, ls_number_id_sender, ls_id_country_issuer_id, ls_id_state_issuer_id, &
		ls_kyc_relationship, ls_kyc_sourceoffunds, ls_kyc_fundswillbeusedfor, ls_kyc_employer, &
		ls_kyc_employer_address_street, ls_kyc_employer_address_city, ls_kyc_employer_address_state, &
		ls_kyc_employer_address_zip, ls_kyc_employer_phone

string ls_message

ls_message = ''

// #################################################################################
// Getting values from screen!

ls_id_country_issuer_id = lst_id_country_issuer_id.getdataid()

if ls_id_country_issuer_id <> 'USA' then
	ls_id_state_issuer_id = '--'
else
	ls_id_state_issuer_id = lst_id_state_issuer_id.getdataid()
end if

if chk_passport_available.checked then
	ls_passport_available = 'N'
else
	ls_passport_available = 'Y'
end if

ls_passport_sender = txt_passport_sender.text
ls_id_country_issuer_passport = lst_id_country_issuer_passport.getdataid()

if chk_ssn_available.checked then
	ls_ssn_available = 'N'
else
	ls_ssn_available = 'Y'
end if

ls_ssn_sender = txt_ssn_sender.text
ls_occupation_sender = txt_occupation_sender.text
ld_dob_sender = date(txt_dob_sender.text)
ld_expiration_date_id = date(txt_expiration_date_id.text)
ls_id_type_id_sender = lst_id_type_id_sender.getdataid()
ls_number_id_sender = txt_number_id_sender.text

ls_kyc_relationship = txt_kyc_relationship.text
ls_kyc_sourceoffunds = txt_kyc_sourceoffunds.text
ls_kyc_fundswillbeusedfor = txt_kyc_fundswillbeusedfor.text
ls_kyc_employer = txt_kyc_employer.text
//ls_kyc_employer_address_street = txt_kyc_employer_address_street.text
//ls_kyc_employer_address_city = txt_kyc_employer_address_city.text
//ls_kyc_employer_address_state = lst_kyc_employer_address_state.getdataid()
//ls_kyc_employer_address_zip = txt_kyc_employer_address_zip.text
txt_kyc_employer_phone.getdata(ls_kyc_employer_phone)


// #################################################################################
// Compliance Information Validations!

if is_modalidad = '0' or is_modalidad = '1'  or is_modalidad = '2'  then

	
	if isnull(ls_id_type_id_sender) or len(trim(ls_id_type_id_sender)) < 1 or ls_id_type_id_sender = 'NN' then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Type Id must be selected~n"
		else
			ls_message = ls_message + "- Debe seleccionar tipo de ID~n"
		end if
	end if
	
	if isnull(ls_number_id_sender) or len(trim(ls_number_id_sender)) < 1 then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Number Id must be typed~n"
		else
			ls_message = ls_message + "- Debe ingresar el número del ID~n"
		end if
	end if

end if

if is_modalidad = '0' or is_modalidad = '1' then

	if isnull(ld_dob_sender) or ld_dob_sender < date('1910/12/31') or ld_dob_sender > relativedate(today(),-3650) then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Date of birth is not valid~n"
		else
			ls_message = ls_message + "- Debe ingresar una fecha de nacimiento valida~n" 		
		end if
	end if

	
	
	// Added 09/28/2012 - After version 23 (so it will be in version 24)
	if isnull(ld_expiration_date_id) or ld_expiration_date_id < relativedate(today(),1) then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Expiration Date is not valid~n"
		else
			ls_message = ls_message + "- Debe ingresar una fecha de expiración valida~n" 		
		end if
	end if
	
	
	
	if isnull(ls_id_country_issuer_id) or len(trim(ls_id_country_issuer_id)) < 1 or ls_id_country_issuer_id = '--' then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Country Issuer Id must be selected~n"
		else
			ls_message = ls_message + "- Debe seleccionar el país de expedicion del ID~n"
		end if
	else
		if ls_id_country_issuer_id = 'USA' then
			if isnull(ls_id_state_issuer_id) or len(trim(ls_id_state_issuer_id)) < 1 then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- State Issuer Id must be selected~n"
				else				
					ls_message = ls_message + "- Debe seleccionar el estado de expedicion del ID~n"
				end if
				
			end if
		end if
	end if			
	
	if is_modalidad = '1' then
		
		// Valida el ssn
		if (isnull(ls_ssn_available) or ls_ssn_available = 'Y') then 
			if isnull(ls_ssn_sender) or len(trim(ls_ssn_sender)) < 1 or not isnumber(ls_ssn_sender) then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- Social Security Number must be typed~n"
				else				
					ls_message = ls_message + "- Debe ingresar el número de seguro social~n"
				end if
			elseif len(trim(ls_ssn_sender)) <> 9 then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- Social Security Number must be typed completed~n"
				else				
					ls_message = ls_message + "- Debe ingresar un número de seguro social completo (9 caracteres)~n"
				end if
			end if
			
		// Sino tiene ssn valida el passport
		else
			
			if (isnull(ls_passport_available) or ls_passport_available = 'Y') and (ls_id_type_id_sender <> 'PA') then 
				if isnull(ls_passport_sender) or len(trim(ls_passport_sender)) < 1 then
					if fn_getlang() = 'EN' then 
						ls_message = ls_message + "- Passport Number must be typed~n"
					else					
						ls_message = ls_message + "- Debe ingresar el número de pasaporte~n"
					end if
				end if
				if isnull(ls_id_country_issuer_passport) or len(trim(ls_id_country_issuer_passport)) < 1 or ls_id_country_issuer_passport = '--' then
					if fn_getlang() = 'EN' then 
						ls_message = ls_message + "- Passport Issuer Country must be selected~n"
					else
						ls_message = ls_message + "- Debe seleccionar el país de expedición del pasaporte~n"
					end if
				end if					
			end if			
			
		end if

		if isnull(ls_occupation_sender) or len(trim(ls_occupation_sender)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- The sender's Occupation must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar la ocupación del remitente~n"
			end if
		end if
	
		
	
		// Campos adicionales KYC
	
		if isnull(ls_kyc_relationship) or len(trim(ls_kyc_relationship)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Relationship between Sender and Beneficiary must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar la Relación del Remitente con el Beneficiario~n"
			end if
		end if
		
		if isnull(ls_kyc_sourceoffunds) or len(trim(ls_kyc_sourceoffunds)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Source of Funds must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el origen de los fondos~n"
			end if
		end if
	
		if isnull(ls_kyc_fundswillbeusedfor) or len(trim(ls_kyc_fundswillbeusedfor)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- 'Funds will be used for' must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el uso de los fondos~n"
			end if
		end if
		
		if isnull(ls_kyc_employer) or len(trim(ls_kyc_employer)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Sender's Employer must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el empleador del remitente~n"
			end if
		end if
		
//		if isnull(ls_kyc_employer_address_street) or len(trim(ls_kyc_employer_address_street)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address must be typed~n"
//			else
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (calle)~n"
//			end if
//		end if
//		
//		if isnull(ls_kyc_employer_address_city) or len(trim(ls_kyc_employer_address_city)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (City) must be typed~n"
//			else
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (ciudad)~n"
//			end if
//		end if
//		
//		if isnull(ls_kyc_employer_address_state) or len(trim(ls_kyc_employer_address_state)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (State) must be typed~n"
//			else			
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (estado)~n"
//			end if
//		end if
//		
//		if isnull(ls_kyc_employer_address_zip) or len(trim(ls_kyc_employer_address_zip)) <> 5 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (Zip) must be typed~n"
//			else			
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (codigo postal)~n"
//			end if
//		end if
		
		if isnull(ls_kyc_employer_phone) or len(trim(ls_kyc_employer_phone)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Sender's Work Phone~n"
			else			
				ls_message = ls_message + "- Debe ingresar el número de teléfono del empleador del remitente~n"
			end if
		end if	

		
	end if			
	
	
	
end if
// #################################################################################
	
	
if ls_message = '' then

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Sends values back to DW (when it was called from red_phone screen
	if is_fromorderwindow = 'Y' then
			
		if isvalid(w_pfc_sender_telefono_rojo) then
	
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_country_issuer_id",ls_id_country_issuer_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_state_issuer_id",ls_id_state_issuer_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"passport_available",ls_passport_available)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"passport_sender",ls_passport_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_country_issuer_passport",ls_id_country_issuer_passport)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"ssn_available",ls_ssn_available)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"ssn_sender",ls_ssn_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"occupation_sender",ls_occupation_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"dob_sender",ld_dob_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"expiration_date_id",ld_expiration_date_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_type_id_sender",ls_id_type_id_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"number_id_sender",ls_number_id_sender)
			
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_RELATIONSHIP",ls_kyc_relationship)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_SOURCEOFFUNDS",ls_kyc_sourceoffunds)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_FUNDSWILLBEUSEDFOR",ls_kyc_fundswillbeusedfor)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_NAME",ls_kyc_employer)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ADDR",ls_kyc_employer_address_street)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_CITY",ls_kyc_employer_address_city)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ID_STATE",ls_kyc_employer_address_state)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ZIP_CODE_V",ls_kyc_employer_address_zip)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_PHONE_V",ls_kyc_employer_phone)						
						
			w_pfc_sender_telefono_rojo.dw_1.accepttext()
		
		end if
		
	else // It was not invoked from the redphone screen!
		
		UPDATE DBA.SENDER
		SET
		id_country_issuer_id = :ls_id_country_issuer_id,
		id_state_issuer_id = :ls_id_state_issuer_id,
		passport_available = :ls_passport_available,
		passport_sender = :ls_passport_sender,
		id_country_issuer_passport = :ls_id_country_issuer_passport,
		ssn_available = :ls_ssn_available,
		ssn_sender = :ls_ssn_sender,
		occupation_sender = :ls_occupation_sender,
		dob_sender = :ld_dob_sender,
		expiration_date_id = :ld_expiration_date_id,
		id_type_id_sender = :ls_id_type_id_sender,
		number_id_sender = :ls_number_id_sender,		
		SEN_RELATIONSHIP = :ls_kyc_relationship,				
		SEN_SOURCEOFFUNDS = :ls_kyc_sourceoffunds,		
		SEN_FUNDSWILLBEUSEDFOR = :ls_kyc_fundswillbeusedfor,		
		SEN_EMPLOYER_NAME = :ls_kyc_employer,		
		SEN_EMPLOYER_ADDR = :ls_kyc_employer_address_street,		
		SEN_EMPLOYER_CITY = :ls_kyc_employer_address_city,		
		SEN_EMPLOYER_ID_STATE = :ls_kyc_employer_address_state,				
		SEN_EMPLOYER_ZIP_CODE_V = :ls_kyc_employer_address_zip,				
		SEN_EMPLOYER_PHONE_V = :ls_kyc_employer_phone		
		WHERE ID_BRANCH = :is_id_branch
		AND ID_SENDER = :id_id_sender;
		

		if SQLCA.SQLCODE <> 0 then
			
			Messagebox("Error Grabando la información","Error Grabando la información, Por favor intente de nuevo o consulte a soporte!~n~r"+SQLCA.SQLErrText,StopSign!)
			Return
			
		end if
		

	end if	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~			
		
if cbx_confirm.checked then		
	
	if is_fromorderwindow = 'N' then
		Openwithparm(w_kyc2,is_id_branch+"*"+string(is_id_receiver)+"")				
	end if
				
	CloseWithReturn(Parent, "SAVE")
	
else
	cbx_confirm.textcolor = RGB(255,0,0)
	if fn_getlang() = 'EN' then 
		Messagebox("Missing Conformation","Please certify that the information is correct and was reviewed.",Exclamation!)
	else
		Messagebox("Confirmación Incompleta","Debe certificar que la informacion suministrada es correcta y fue revisada antes de continuar.",Exclamation!)
	end if
end if
	
else
	if fn_getlang() = 'EN' then 
		Messagebox("Missing Information","Please fill the information below to continue with this order.~nThis information will be used for the KYC form.~n~nMissing/Invalid Information:~n"+ls_message,stopsign!)
	else
		Messagebox("Información Incompleta","Por favor ingrese la siguiente información para continuar con la orden.~nEsta informacion se usará para la forma KYC.~n~nInformación Incompleta o Inválida:.~n"+ls_message,stopsign!)
	end if
	
end if
end event

event constructor;if fn_getlang() = 'EN' then this.text = '&Export KYC'
end event

type st_verified from statictext within w_pfc_sender_compliancedata
integer x = 1870
integer y = 392
integer width = 718
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type txt_address_sender from singlelineedit within w_pfc_sender_compliancedata
integer x = 567
integer y = 376
integer width = 1312
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_pfc_sender_compliancedata
integer x = 73
integer y = 388
integer width = 485
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Direccion Remitente:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Name Sender:'
end event

type cb_ok2 from commandbutton within w_pfc_sender_compliancedata
integer x = 699
integer y = 1976
integer width = 658
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&Grabar"
boolean default = true
end type

event clicked;string ls_passport_available, ls_passport_sender, ls_id_country_issuer_passport
string ls_ssn_available, ls_ssn_sender, ls_occupation_sender
date ld_dob_sender, ld_expiration_date_id
string ls_id_type_id_sender, ls_number_id_sender, ls_id_country_issuer_id, ls_id_state_issuer_id, &
		ls_kyc_relationship, ls_kyc_sourceoffunds, ls_kyc_fundswillbeusedfor, ls_kyc_employer, &
		ls_kyc_employer_address_street, ls_kyc_employer_address_city, ls_kyc_employer_address_state, &
		ls_kyc_employer_address_zip, ls_kyc_employer_phone

string ls_message

ls_message = ''

// #################################################################################
// Getting values from screen!

ls_id_country_issuer_id = lst_id_country_issuer_id.getdataid()

if ls_id_country_issuer_id <> 'USA' then
	ls_id_state_issuer_id = '--'
else
	ls_id_state_issuer_id = lst_id_state_issuer_id.getdataid()
end if

if chk_passport_available.checked then
	ls_passport_available = 'N'
else
	ls_passport_available = 'Y'
end if

ls_passport_sender = txt_passport_sender.text
ls_id_country_issuer_passport = lst_id_country_issuer_passport.getdataid()

if chk_ssn_available.checked then
	ls_ssn_available = 'N'
else
	ls_ssn_available = 'Y'
end if

ls_ssn_sender = txt_ssn_sender.text
ls_occupation_sender = txt_occupation_sender.text
ld_dob_sender = date(txt_dob_sender.text)
ld_expiration_date_id = date(txt_expiration_date_id.text)
ls_id_type_id_sender = lst_id_type_id_sender.getdataid()
ls_number_id_sender = txt_number_id_sender.text

ls_kyc_relationship = txt_kyc_relationship.text
ls_kyc_sourceoffunds = txt_kyc_sourceoffunds.text
ls_kyc_fundswillbeusedfor = txt_kyc_fundswillbeusedfor.text
ls_kyc_employer = txt_kyc_employer.text
//ls_kyc_employer_address_street = txt_kyc_employer_address_street.text
//ls_kyc_employer_address_city = txt_kyc_employer_address_city.text
//ls_kyc_employer_address_state = lst_kyc_employer_address_state.getdataid()
//ls_kyc_employer_address_zip = txt_kyc_employer_address_zip.text
txt_kyc_employer_phone.getdata(ls_kyc_employer_phone)


// #################################################################################
// Compliance Information Validations!

if is_modalidad = '0' or is_modalidad = '1'  or is_modalidad = '2'  then

	
	if isnull(ls_id_type_id_sender) or len(trim(ls_id_type_id_sender)) < 1 or ls_id_type_id_sender = 'NN' then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Type Id must be selected~n"
		else
			ls_message = ls_message + "- Debe seleccionar tipo de ID~n"
		end if
	end if
	
	if isnull(ls_number_id_sender) or len(trim(ls_number_id_sender)) < 1 then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Number Id must be typed~n"
		else
			ls_message = ls_message + "- Debe ingresar el número del ID~n"
		end if
	end if

end if

if is_modalidad = '0' or is_modalidad = '1' or ib_from_ids_fax then

	if isnull(ld_dob_sender) or ld_dob_sender < date('1910/12/31') or ld_dob_sender > relativedate(today(),-3650) then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Date of birth is not valid~n"
		else
			ls_message = ls_message + "- Debe ingresar una fecha de nacimiento valida~n" 		
		end if
	end if

	
	
	// Added 09/28/2012 - After version 23 (so it will be in version 24)
	if isnull(ld_expiration_date_id) or ld_expiration_date_id < relativedate(today(),1) then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Expiration Date is not valid~n"
		else
			ls_message = ls_message + "- Debe ingresar una fecha de expiración valida~n" 		
		end if
	end if
	
	
	
	if isnull(ls_id_country_issuer_id) or len(trim(ls_id_country_issuer_id)) < 1 or ls_id_country_issuer_id = '--' then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Country Issuer Id must be selected~n"
		else
			ls_message = ls_message + "- Debe seleccionar el país de expedicion del ID~n"
		end if
	else
		if ls_id_country_issuer_id = 'USA' then
			if isnull(ls_id_state_issuer_id) or len(trim(ls_id_state_issuer_id)) < 1 then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- State Issuer Id must be selected~n"
				else				
					ls_message = ls_message + "- Debe seleccionar el estado de expedicion del ID~n"
				end if
				
			end if
		end if
	end if			
	
	if is_modalidad = '1' or ib_from_ids_fax then
		
		// Valida el ssn
		if (isnull(ls_ssn_available) or ls_ssn_available = 'Y') then 
			if isnull(ls_ssn_sender) or len(trim(ls_ssn_sender)) < 1 or not isnumber(ls_ssn_sender) then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- Social Security Number must be typed~n"
				else				
					ls_message = ls_message + "- Debe ingresar el número de seguro social~n"
				end if
			elseif len(trim(ls_ssn_sender)) <> 9 then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- Social Security Number must be typed completed~n"
				else				
					ls_message = ls_message + "- Debe ingresar un número de seguro social completo (9 caracteres)~n"
				end if
			end if
			
		// Sino tiene ssn valida el passport
		else
			
			if (isnull(ls_passport_available) or ls_passport_available = 'Y') and (ls_id_type_id_sender <> 'PA') then 
				if isnull(ls_passport_sender) or len(trim(ls_passport_sender)) < 1 then
					if fn_getlang() = 'EN' then 
						ls_message = ls_message + "- Passport Number must be typed~n"
					else					
						ls_message = ls_message + "- Debe ingresar el número de pasaporte~n"
					end if
				end if
				if isnull(ls_id_country_issuer_passport) or len(trim(ls_id_country_issuer_passport)) < 1 or ls_id_country_issuer_passport = '--' then
					if fn_getlang() = 'EN' then 
						ls_message = ls_message + "- Passport Issuer Country must be selected~n"
					else
						ls_message = ls_message + "- Debe seleccionar el país de expedición del pasaporte~n"
					end if
				end if					
			end if			
			
		end if

		if isnull(ls_occupation_sender) or len(trim(ls_occupation_sender)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- The sender's Occupation must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar la ocupación del remitente~n"
			end if
		end if
	
		
	
		// Campos adicionales KYC
	
		if isnull(ls_kyc_relationship) or len(trim(ls_kyc_relationship)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Relationship between Sender and Beneficiary must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar la Relación del Remitente con el Beneficiario~n"
			end if
		end if
		
		if isnull(ls_kyc_sourceoffunds) or len(trim(ls_kyc_sourceoffunds)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Source of Funds must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el origen de los fondos~n"
			end if
		end if
	
		if isnull(ls_kyc_fundswillbeusedfor) or len(trim(ls_kyc_fundswillbeusedfor)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- 'Funds will be used for' must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el uso de los fondos~n"
			end if
		end if
		
		if isnull(ls_kyc_employer) or len(trim(ls_kyc_employer)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Sender's Employer must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el empleador del remitente~n"
			end if
		end if
		
//		if isnull(ls_kyc_employer_address_street) or len(trim(ls_kyc_employer_address_street)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address must be typed~n"
//			else
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (calle)~n"
//			end if
//		end if
		
//		if isnull(ls_kyc_employer_address_city) or len(trim(ls_kyc_employer_address_city)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (City) must be typed~n"
//			else
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (ciudad)~n"
//			end if
//		end if
//		
//		if isnull(ls_kyc_employer_address_state) or len(trim(ls_kyc_employer_address_state)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (State) must be typed~n"
//			else			
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (estado)~n"
//			end if
//		end if
//		
//		if isnull(ls_kyc_employer_address_zip) or len(trim(ls_kyc_employer_address_zip)) <> 5 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (Zip) must be typed~n"
//			else			
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (codigo postal)~n"
//			end if
//		end if
		
		if isnull(ls_kyc_employer_phone) or len(trim(ls_kyc_employer_phone)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Sender's Work Phone~n"
			else			
				ls_message = ls_message + "- Debe ingresar el número de teléfono del empleador del remitente~n"
			end if
		end if	

		
	end if			
	
	
	
end if
// #################################################################################
	
	
if ls_message = '' then
	if NOT cbx_confirm.checked then		
		cbx_confirm.textcolor = RGB(255,0,0)
		if fn_getlang() = 'EN' then 
			Messagebox("Missing Conformation","Please certify that the information is correct and was reviewed.",Exclamation!)
		else
			Messagebox("Confirmación Incompleta","Debe certificar que la informacion suministrada es correcta y fue revisada antes de continuar.",Exclamation!)
		end if
		
		return
	end if
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Sends values back to DW (when it was called from red_phone screen
	if is_fromorderwindow = 'Y' then
			
		if isvalid(w_pfc_sender_telefono_rojo) then
	
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_country_issuer_id",ls_id_country_issuer_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_state_issuer_id",ls_id_state_issuer_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"passport_available",ls_passport_available)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"passport_sender",ls_passport_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_country_issuer_passport",ls_id_country_issuer_passport)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"ssn_available",ls_ssn_available)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"ssn_sender",ls_ssn_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"occupation_sender",ls_occupation_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"dob_sender",ld_dob_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"expiration_date_id",ld_expiration_date_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_type_id_sender",ls_id_type_id_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"number_id_sender",ls_number_id_sender)
			
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_RELATIONSHIP",ls_kyc_relationship)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_SOURCEOFFUNDS",ls_kyc_sourceoffunds)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_FUNDSWILLBEUSEDFOR",ls_kyc_fundswillbeusedfor)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_NAME",ls_kyc_employer)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ADDR",ls_kyc_employer_address_street)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_CITY",ls_kyc_employer_address_city)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ID_STATE",ls_kyc_employer_address_state)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ZIP_CODE_V",ls_kyc_employer_address_zip)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_PHONE_V",ls_kyc_employer_phone)						
						
			w_pfc_sender_telefono_rojo.dw_1.accepttext()
		
		end if
		
	else // It was not invoked from the redphone screen!
		
		UPDATE DBA.SENDER
		SET
		id_country_issuer_id = :ls_id_country_issuer_id,
		id_state_issuer_id = :ls_id_state_issuer_id,
		passport_available = :ls_passport_available,
		passport_sender = :ls_passport_sender,
		id_country_issuer_passport = :ls_id_country_issuer_passport,
		ssn_available = :ls_ssn_available,
		ssn_sender = :ls_ssn_sender,
		occupation_sender = :ls_occupation_sender,
		dob_sender = :ld_dob_sender,
		expiration_date_id = :ld_expiration_date_id,
		id_type_id_sender = :ls_id_type_id_sender,
		number_id_sender = :ls_number_id_sender,		
		SEN_RELATIONSHIP = :ls_kyc_relationship,				
		SEN_SOURCEOFFUNDS = :ls_kyc_sourceoffunds,		
		SEN_FUNDSWILLBEUSEDFOR = :ls_kyc_fundswillbeusedfor,		
		SEN_EMPLOYER_NAME = :ls_kyc_employer,		
		SEN_EMPLOYER_ADDR = :ls_kyc_employer_address_street,		
		SEN_EMPLOYER_CITY = :ls_kyc_employer_address_city,		
		SEN_EMPLOYER_ID_STATE = :ls_kyc_employer_address_state,				
		SEN_EMPLOYER_ZIP_CODE_V = :ls_kyc_employer_address_zip,				
		SEN_EMPLOYER_PHONE_V = :ls_kyc_employer_phone		
		WHERE ID_BRANCH = :is_id_branch
		AND ID_SENDER = :id_id_sender;
		

		if SQLCA.SQLCODE <> 0 then
			
			Messagebox("Error Grabando la información","Error Grabando la información, Por favor intente de nuevo o consulte a soporte!~n~r"+SQLCA.SQLErrText,StopSign!)
			Return
			
		end if
		
		int li_success
		
		DECLARE SpAddComplianceKYCForTransaction PROCEDURE FOR dba.SpAddComplianceKYCForTransaction  
			@PS_ID_BRANCH = :is_id_branch, 
			@PN_ID_RECEIVER = :is_id_receiver,
			@PB_MAKENEWVERSION = 1;
		Execute SpAddComplianceKYCForTransaction;
		if SQLCA.SQLCode < 0 then			
			ROLLBACK;
			MessageBox("Alert","Error dba.SpAddComplianceKYCForTransaction: " + sqlca.SQLErrText, StopSign!)
		else
				FETCH SpAddComplianceKYCForTransaction INTO :li_success;
		end if
		CLOSE SpAddComplianceKYCForTransaction;
		
//		IF li_success <> 1  then			
//			ROLLBACK;
//			Messagebox("Error Grabando la información","Error Grabando la información, Por favor intente de nuevo o consulte a soporte!~n~r"+SQLCA.SQLErrText,StopSign!)
//			Return
//		END IF
		
		COMMIT;
	end if	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
	
	if is_fromorderwindow = 'N' and is_modalidad <> '2' then
		Openwithparm(w_kyc,is_id_branch+"*"+string(is_id_receiver)+"")				
	end if
				
	CloseWithReturn(Parent, "SAVE")
else
	if fn_getlang() = 'EN' then 
		Messagebox("Missing Information","Please fill the information below to continue with this order.~nThis information will be used for the KYC form.~n~nMissing/Invalid Information:~n"+ls_message,stopsign!)
	else
		Messagebox("Información Incompleta","Por favor ingrese la siguiente información para continuar con la orden.~nEsta informacion se usará para la forma KYC.~n~nInformación Incompleta o Inválida:.~n"+ls_message,stopsign!)
	end if
	
end if
end event

event constructor;if fn_getlang() = 'EN' then this.text = '&Ok (Save Order)'
end event

type cbx_confirm from checkbox within w_pfc_sender_compliancedata
integer x = 46
integer y = 1884
integer width = 2606
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Yo certifico que la información en esta forma fue suministrada por el remitente y fue verificada en este envio."
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'I certify that the information on this screen was provided by the sender and was reviewed with this order.'
end event

type st_msg2 from statictext within w_pfc_sender_compliancedata
integer x = 82
integer y = 156
integer width = 2546
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Campos con etiqueta negra son obligatorios, esta informacion será utilizada para generar la forma KYC."
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Fields with black label are mandatory, the information on this screen will be used for the KYC Form.'

end event

type txt_occupation_sender from singlelineedit within w_pfc_sender_compliancedata
integer x = 722
integer y = 1684
integer width = 1829
integer height = 80
integer taborder = 190
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

type st_occupation_sender from statictext within w_pfc_sender_compliancedata
integer x = 133
integer y = 1696
integer width = 549
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Ocupación:"
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Occupation:'
end event

type txt_kyc_employer_phone from editmask within w_pfc_sender_compliancedata
integer x = 722
integer y = 1584
integer width = 562
integer height = 80
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

type txt_kyc_employer_address_zip from singlelineedit within w_pfc_sender_compliancedata
integer x = 2130
integer y = 2348
integer width = 343
integer height = 80
integer taborder = 170
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

type lst_kyc_employer_address_state from my_ddlb within w_pfc_sender_compliancedata
integer x = 1458
integer y = 2348
integer width = 654
integer height = 1004
integer taborder = 160
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string item[] = {"VIRGINIA*VA","MARYLAND*MD"}
end type

type st_kyc_employer_address from statictext within w_pfc_sender_compliancedata
integer x = 55
integer y = 2360
integer width = 544
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "(Ciudad/Estado/Zip)"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = '(City/State/Zip)'
end event

type txt_kyc_employer_address_city from singlelineedit within w_pfc_sender_compliancedata
integer x = 645
integer y = 2348
integer width = 800
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type st_kyc_employer_phone from statictext within w_pfc_sender_compliancedata
integer x = 133
integer y = 1596
integer width = 571
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Telefono del Trabajo:"
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Work Phone:'
end event

type txt_kyc_employer from singlelineedit within w_pfc_sender_compliancedata
integer x = 722
integer y = 1488
integer width = 1829
integer height = 80
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type st_kyc_employer_address_street from statictext within w_pfc_sender_compliancedata
integer x = 55
integer y = 2260
integer width = 571
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Dirección del Trabajo:"
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Employer Address:'
end event

type st_id_country_issuer_id from statictext within w_pfc_sender_compliancedata
integer x = 105
integer y = 684
integer width = 361
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Lugar Exped.:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Exped. Place:'
end event

type txt_kyc_fundswillbeusedfor from singlelineedit within w_pfc_sender_compliancedata
integer x = 722
integer y = 1388
integer width = 1829
integer height = 80
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type st_kyc_fundswillbeusedfor from statictext within w_pfc_sender_compliancedata
integer x = 133
integer y = 1400
integer width = 549
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Uso de los Fondos:"
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Funds will be used for:'
end event

type txt_kyc_sourceoffunds from singlelineedit within w_pfc_sender_compliancedata
integer x = 722
integer y = 1288
integer width = 1829
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type st_kyc_sourceoffunds from statictext within w_pfc_sender_compliancedata
integer x = 133
integer y = 1300
integer width = 549
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Origen de los Fondos:"
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Source of Funds:'
end event

type txt_kyc_relationship from singlelineedit within w_pfc_sender_compliancedata
integer x = 1184
integer y = 1188
integer width = 1367
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type st_kyc_relationship from statictext within w_pfc_sender_compliancedata
integer x = 133
integer y = 1200
integer width = 1125
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Relación Remitente con el Beneficiario:"
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Relationship between Sender and Beneficiary:'
end event

type cb_cancel from commandbutton within w_pfc_sender_compliancedata
integer x = 41
integer y = 1976
integer width = 658
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent, "CANCEL")

end event

event constructor;if fn_getlang() = 'EN' then this.text = '&Cancel'
end event

type lst_id_country_issuer_passport from my_ddlb within w_pfc_sender_compliancedata
integer x = 1920
integer y = 900
integer width = 635
integer height = 1136
integer taborder = 90
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type lst_id_state_issuer_id from my_ddlb within w_pfc_sender_compliancedata
integer x = 1143
integer y = 672
integer width = 736
integer height = 1004
integer taborder = 60
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string item[] = {"VIRGINIA*VA","MARYLAND*MD"}
end type

type lst_id_type_id_sender from my_ddlb within w_pfc_sender_compliancedata
integer x = 480
integer y = 572
integer width = 549
integer height = 1004
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;parent.fn_refreshdisplay()
end event

event losefocus;call super::losefocus;parent.fn_refreshdisplay()
end event

type lst_id_country_issuer_id from my_ddlb within w_pfc_sender_compliancedata
integer x = 485
integer y = 672
integer width = 640
integer height = 1004
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string item[] = {"COLOMBIA*COL","MEXICO*MEX","USA*USA"}
end type

event selectionchanged;call super::selectionchanged;parent.fn_refreshdisplay()
end event

event losefocus;call super::losefocus;parent.fn_refreshdisplay()
end event

type cb_ok from commandbutton within w_pfc_sender_compliancedata
integer x = 1358
integer y = 1980
integer width = 658
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Grabar y KYC"
boolean default = true
end type

event clicked;string ls_passport_available, ls_passport_sender, ls_id_country_issuer_passport
string ls_ssn_available, ls_ssn_sender, ls_occupation_sender
date ld_dob_sender, ld_expiration_date_id
string ls_id_type_id_sender, ls_number_id_sender, ls_id_country_issuer_id, ls_id_state_issuer_id, &
		ls_kyc_relationship, ls_kyc_sourceoffunds, ls_kyc_fundswillbeusedfor, ls_kyc_employer, &
		ls_kyc_employer_address_street, ls_kyc_employer_address_city, ls_kyc_employer_address_state, &
		ls_kyc_employer_address_zip, ls_kyc_employer_phone

string ls_message

ls_message = ''

// #################################################################################
// Getting values from screen!

ls_id_country_issuer_id = lst_id_country_issuer_id.getdataid()

if ls_id_country_issuer_id <> 'USA' then
	ls_id_state_issuer_id = '--'
else
	ls_id_state_issuer_id = lst_id_state_issuer_id.getdataid()
end if

if chk_passport_available.checked then
	ls_passport_available = 'N'
else
	ls_passport_available = 'Y'
end if

ls_passport_sender = txt_passport_sender.text
ls_id_country_issuer_passport = lst_id_country_issuer_passport.getdataid()

if chk_ssn_available.checked then
	ls_ssn_available = 'N'
else
	ls_ssn_available = 'Y'
end if

ls_ssn_sender = txt_ssn_sender.text
ls_occupation_sender = txt_occupation_sender.text
ld_dob_sender = date(txt_dob_sender.text)
ld_expiration_date_id = date(txt_expiration_date_id.text)
ls_id_type_id_sender = lst_id_type_id_sender.getdataid()
ls_number_id_sender = txt_number_id_sender.text

ls_kyc_relationship = txt_kyc_relationship.text
ls_kyc_sourceoffunds = txt_kyc_sourceoffunds.text
ls_kyc_fundswillbeusedfor = txt_kyc_fundswillbeusedfor.text
ls_kyc_employer = txt_kyc_employer.text
//ls_kyc_employer_address_street = txt_kyc_employer_address_street.text
//ls_kyc_employer_address_city = txt_kyc_employer_address_city.text
//ls_kyc_employer_address_state = lst_kyc_employer_address_state.getdataid()
//ls_kyc_employer_address_zip = txt_kyc_employer_address_zip.text
txt_kyc_employer_phone.getdata(ls_kyc_employer_phone)


// #################################################################################
// Compliance Information Validations!

if is_modalidad = '0' or is_modalidad = '1'  or is_modalidad = '2'  then

	
	if isnull(ls_id_type_id_sender) or len(trim(ls_id_type_id_sender)) < 1 or ls_id_type_id_sender = 'NN' then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Type Id must be selected~n"
		else
			ls_message = ls_message + "- Debe seleccionar tipo de ID~n"
		end if
	end if
	
	if isnull(ls_number_id_sender) or len(trim(ls_number_id_sender)) < 1 then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Number Id must be typed~n"
		else
			ls_message = ls_message + "- Debe ingresar el número del ID~n"
		end if
	end if

end if

if is_modalidad = '0' or is_modalidad = '1' then

	if isnull(ld_dob_sender) or ld_dob_sender < date('1910/12/31') or ld_dob_sender > relativedate(today(),-3650) then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Date of birth is not valid~n"
		else
			ls_message = ls_message + "- Debe ingresar una fecha de nacimiento valida~n" 		
		end if
	end if

	
	
	// Added 09/28/2012 - After version 23 (so it will be in version 24)
	if isnull(ld_expiration_date_id) or ld_expiration_date_id < relativedate(today(),1) then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Expiration Date is not valid~n"
		else
			ls_message = ls_message + "- Debe ingresar una fecha de expiración valida~n" 		
		end if
	end if
	
	
	
	if isnull(ls_id_country_issuer_id) or len(trim(ls_id_country_issuer_id)) < 1 or ls_id_country_issuer_id = '--' then
		if fn_getlang() = 'EN' then 
			ls_message = ls_message + "- Country Issuer Id must be selected~n"
		else
			ls_message = ls_message + "- Debe seleccionar el país de expedicion del ID~n"
		end if
	else
		if ls_id_country_issuer_id = 'USA' then
			if isnull(ls_id_state_issuer_id) or len(trim(ls_id_state_issuer_id)) < 1 then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- State Issuer Id must be selected~n"
				else				
					ls_message = ls_message + "- Debe seleccionar el estado de expedicion del ID~n"
				end if
				
			end if
		end if
	end if			
	
	if is_modalidad = '1' then
		
		// Valida el ssn
		if (isnull(ls_ssn_available) or ls_ssn_available = 'Y') then 
			if isnull(ls_ssn_sender) or len(trim(ls_ssn_sender)) < 1 or not isnumber(ls_ssn_sender) then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- Social Security Number must be typed~n"
				else				
					ls_message = ls_message + "- Debe ingresar el número de seguro social~n"
				end if
			elseif len(trim(ls_ssn_sender)) <> 9 then
				if fn_getlang() = 'EN' then 
					ls_message = ls_message + "- Social Security Number must be typed completed~n"
				else				
					ls_message = ls_message + "- Debe ingresar un número de seguro social completo (9 caracteres)~n"
				end if
			end if
			
		// Sino tiene ssn valida el passport
		else
			
			if (isnull(ls_passport_available) or ls_passport_available = 'Y') and (ls_id_type_id_sender <> 'PA') then 
				if isnull(ls_passport_sender) or len(trim(ls_passport_sender)) < 1 then
					if fn_getlang() = 'EN' then 
						ls_message = ls_message + "- Passport Number must be typed~n"
					else					
						ls_message = ls_message + "- Debe ingresar el número de pasaporte~n"
					end if
				end if
				if isnull(ls_id_country_issuer_passport) or len(trim(ls_id_country_issuer_passport)) < 1 or ls_id_country_issuer_passport = '--' then
					if fn_getlang() = 'EN' then 
						ls_message = ls_message + "- Passport Issuer Country must be selected~n"
					else
						ls_message = ls_message + "- Debe seleccionar el país de expedición del pasaporte~n"
					end if
				end if					
			end if			
			
		end if

		if isnull(ls_occupation_sender) or len(trim(ls_occupation_sender)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- The sender's Occupation must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar la ocupación del remitente~n"
			end if
		end if
	
		
	
		// Campos adicionales KYC
	
		if isnull(ls_kyc_relationship) or len(trim(ls_kyc_relationship)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Relationship between Sender and Beneficiary must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar la Relación del Remitente con el Beneficiario~n"
			end if
		end if
		
		if isnull(ls_kyc_sourceoffunds) or len(trim(ls_kyc_sourceoffunds)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Source of Funds must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el origen de los fondos~n"
			end if
		end if
	
		if isnull(ls_kyc_fundswillbeusedfor) or len(trim(ls_kyc_fundswillbeusedfor)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- 'Funds will be used for' must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el uso de los fondos~n"
			end if
		end if
		
		if isnull(ls_kyc_employer) or len(trim(ls_kyc_employer)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Sender's Employer must be typed~n"
			else			
				ls_message = ls_message + "- Debe ingresar el empleador del remitente~n"
			end if
		end if
		
//		if isnull(ls_kyc_employer_address_street) or len(trim(ls_kyc_employer_address_street)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address must be typed~n"
//			else
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (calle)~n"
//			end if
//		end if
//		
//		if isnull(ls_kyc_employer_address_city) or len(trim(ls_kyc_employer_address_city)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (City) must be typed~n"
//			else
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (ciudad)~n"
//			end if
//		end if
//		
//		if isnull(ls_kyc_employer_address_state) or len(trim(ls_kyc_employer_address_state)) < 1 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (State) must be typed~n"
//			else			
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (estado)~n"
//			end if
//		end if
//		
//		if isnull(ls_kyc_employer_address_zip) or len(trim(ls_kyc_employer_address_zip)) <> 5 then
//			if fn_getlang() = 'EN' then 
//				ls_message = ls_message + "- Sender's Employer Address (Zip) must be typed~n"
//			else			
//				ls_message = ls_message + "- Debe ingresar la dirección del empleador del remitente (codigo postal)~n"
//			end if
//		end if
		
		if isnull(ls_kyc_employer_phone) or len(trim(ls_kyc_employer_phone)) < 1 then
			if fn_getlang() = 'EN' then 
				ls_message = ls_message + "- Sender's Work Phone~n"
			else			
				ls_message = ls_message + "- Debe ingresar el número de teléfono del empleador del remitente~n"
			end if
		end if	

		
	end if			
	
	
	
end if
// #################################################################################
	
	
if ls_message = '' then

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Sends values back to DW (when it was called from red_phone screen
	if is_fromorderwindow = 'Y' then
			
		if isvalid(w_pfc_sender_telefono_rojo) then
	
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_country_issuer_id",ls_id_country_issuer_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_state_issuer_id",ls_id_state_issuer_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"passport_available",ls_passport_available)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"passport_sender",ls_passport_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_country_issuer_passport",ls_id_country_issuer_passport)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"ssn_available",ls_ssn_available)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"ssn_sender",ls_ssn_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"occupation_sender",ls_occupation_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"dob_sender",ld_dob_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"expiration_date_id",ld_expiration_date_id)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"id_type_id_sender",ls_id_type_id_sender)
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"number_id_sender",ls_number_id_sender)
			
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_RELATIONSHIP",ls_kyc_relationship)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_SOURCEOFFUNDS",ls_kyc_sourceoffunds)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_FUNDSWILLBEUSEDFOR",ls_kyc_fundswillbeusedfor)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_NAME",ls_kyc_employer)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ADDR",ls_kyc_employer_address_street)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_CITY",ls_kyc_employer_address_city)		
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ID_STATE",ls_kyc_employer_address_state)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_ZIP_CODE_V",ls_kyc_employer_address_zip)				
			w_pfc_sender_telefono_rojo.dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_EMPLOYER_PHONE_V",ls_kyc_employer_phone)						
						
			w_pfc_sender_telefono_rojo.dw_1.accepttext()
		
		end if
		
	else // It was not invoked from the redphone screen!
		
		UPDATE DBA.SENDER
		SET
		id_country_issuer_id = :ls_id_country_issuer_id,
		id_state_issuer_id = :ls_id_state_issuer_id,
		passport_available = :ls_passport_available,
		passport_sender = :ls_passport_sender,
		id_country_issuer_passport = :ls_id_country_issuer_passport,
		ssn_available = :ls_ssn_available,
		ssn_sender = :ls_ssn_sender,
		occupation_sender = :ls_occupation_sender,
		dob_sender = :ld_dob_sender,
		expiration_date_id = :ld_expiration_date_id,
		id_type_id_sender = :ls_id_type_id_sender,
		number_id_sender = :ls_number_id_sender,		
		SEN_RELATIONSHIP = :ls_kyc_relationship,				
		SEN_SOURCEOFFUNDS = :ls_kyc_sourceoffunds,		
		SEN_FUNDSWILLBEUSEDFOR = :ls_kyc_fundswillbeusedfor,		
		SEN_EMPLOYER_NAME = :ls_kyc_employer,		
		SEN_EMPLOYER_ADDR = :ls_kyc_employer_address_street,		
		SEN_EMPLOYER_CITY = :ls_kyc_employer_address_city,		
		SEN_EMPLOYER_ID_STATE = :ls_kyc_employer_address_state,				
		SEN_EMPLOYER_ZIP_CODE_V = :ls_kyc_employer_address_zip,				
		SEN_EMPLOYER_PHONE_V = :ls_kyc_employer_phone		
		WHERE ID_BRANCH = :is_id_branch
		AND ID_SENDER = :id_id_sender;
		

		if SQLCA.SQLCODE <> 0 then
			
			Messagebox("Error Grabando la información","Error Grabando la información, Por favor intente de nuevo o consulte a soporte!~n~r"+SQLCA.SQLErrText,StopSign!)
			Return
			
		end if
		

	end if	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~			
		
if cbx_confirm.checked then		
	
	if is_fromorderwindow = 'N' then
		Openwithparm(w_kyc,is_id_branch+"*"+string(is_id_receiver)+"")				
	end if
				
	CloseWithReturn(Parent, "SAVE")
	
else
	cbx_confirm.textcolor = RGB(255,0,0)
	if fn_getlang() = 'EN' then 
		Messagebox("Missing Conformation","Please certify that the information is correct and was reviewed.",Exclamation!)
	else
		Messagebox("Confirmación Incompleta","Debe certificar que la informacion suministrada es correcta y fue revisada antes de continuar.",Exclamation!)
	end if
end if
	
else
	if fn_getlang() = 'EN' then 
		Messagebox("Missing Information","Please fill the information below to continue with this order.~nThis information will be used for the KYC form.~n~nMissing/Invalid Information:~n"+ls_message,stopsign!)
	else
		Messagebox("Información Incompleta","Por favor ingrese la siguiente información para continuar con la orden.~nEsta informacion se usará para la forma KYC.~n~nInformación Incompleta o Inválida:.~n"+ls_message,stopsign!)
	end if
	
end if
end event

event constructor;if fn_getlang() = 'EN' then this.text = '&Ok (Save Order)'
end event

type st_12 from statictext within w_pfc_sender_compliancedata
integer x = 82
integer y = 44
integer width = 2546
integer height = 116
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Debido al monto y/o acumulado generado por esta transaccion para este remitente y/o beneficiario, es necesario completar la siguiente información para continuar."
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'According to the accumulated amounts sent by this sender and/or received by this recipient including this transaction, it is necesary to complete the following information to place the order.'

end event

type chk_passport_available from checkbox within w_pfc_sender_compliancedata
integer x = 1120
integer y = 988
integer width = 635
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "No Disponible"
end type

event clicked;parent.fn_refreshdisplay()
end event

event constructor;if fn_getlang() = 'EN' then this.text = 'Not Available'
end event

type chk_ssn_available from checkbox within w_pfc_sender_compliancedata
integer x = 343
integer y = 988
integer width = 439
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "No Disponible"
end type

event clicked;parent.fn_refreshdisplay()
end event

event constructor;if fn_getlang() = 'EN' then this.text = 'Not Available'
end event

type txt_kyc_employer_address_street from singlelineedit within w_pfc_sender_compliancedata
integer x = 645
integer y = 2248
integer width = 1829
integer height = 80
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type txt_passport_sender from singlelineedit within w_pfc_sender_compliancedata
integer x = 1120
integer y = 900
integer width = 571
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 15
borderstyle borderstyle = stylelowered!
end type

type txt_ssn_sender from singlelineedit within w_pfc_sender_compliancedata
integer x = 343
integer y = 900
integer width = 439
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 9
borderstyle borderstyle = stylelowered!
end type

type txt_expiration_date_id from editmask within w_pfc_sender_compliancedata
integer x = 2272
integer y = 572
integer width = 315
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type txt_number_id_sender from singlelineedit within w_pfc_sender_compliancedata
integer x = 1143
integer y = 572
integer width = 736
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 15
borderstyle borderstyle = stylelowered!
end type

type txt_dob_sender from editmask within w_pfc_sender_compliancedata
integer x = 2272
integer y = 284
integer width = 315
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type txt_name_sender from singlelineedit within w_pfc_sender_compliancedata
integer x = 567
integer y = 284
integer width = 1312
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_kyc_employer from statictext within w_pfc_sender_compliancedata
integer x = 133
integer y = 1500
integer width = 571
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Empleador del Remitente:"
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = "Sender's Employer:"
end event

type st_id_country_issuer_passport from statictext within w_pfc_sender_compliancedata
integer x = 1696
integer y = 912
integer width = 224
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "País:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Country:'
end event

type st_passport_sender from statictext within w_pfc_sender_compliancedata
integer x = 882
integer y = 912
integer width = 224
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Número:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Number:'
end event

type st_ssn_sender from statictext within w_pfc_sender_compliancedata
integer x = 110
integer y = 912
integer width = 224
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Número:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'SSN/TIN #:'
end event

type st_expiration_date_id from statictext within w_pfc_sender_compliancedata
integer x = 1870
integer y = 584
integer width = 398
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Fec. Expiración:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Exp. Date:'
end event

type lbl0_6 from statictext within w_pfc_sender_compliancedata
integer x = 1047
integer y = 584
integer width = 69
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#:"
alignment alignment = right!
boolean focusrectangle = false
end type

type lbl0_3 from statictext within w_pfc_sender_compliancedata
integer x = 105
integer y = 584
integer width = 361
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Identificación:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Identification:'
end event

type lbl0_2 from statictext within w_pfc_sender_compliancedata
integer x = 1870
integer y = 296
integer width = 398
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fec. Nacimiento:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Date of Birth:'
end event

type lbl0_1 from statictext within w_pfc_sender_compliancedata
integer x = 73
integer y = 296
integer width = 485
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre Remitente:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Name Sender:'
end event

type gb_identification from groupbox within w_pfc_sender_compliancedata
integer x = 96
integer y = 500
integer width = 2510
integer height = 296
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Identificación"
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Identification'
end event

type txt_dummy_passport1 from singlelineedit within w_pfc_sender_compliancedata
integer x = 1120
integer y = 900
integer width = 571
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "N/A"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type txt_dummy_passport2 from singlelineedit within w_pfc_sender_compliancedata
integer x = 1920
integer y = 900
integer width = 635
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "N/A"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_passport from groupbox within w_pfc_sender_compliancedata
integer x = 855
integer y = 816
integer width = 1751
integer height = 276
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Pasaporte"
end type

event constructor;if fn_getlang() = 'EN' then this.text = 'Passport'
end event

type txt_dummy_ssn from singlelineedit within w_pfc_sender_compliancedata
integer x = 343
integer y = 900
integer width = 439
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "N/A"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_social from groupbox within w_pfc_sender_compliancedata
integer x = 101
integer y = 816
integer width = 722
integer height = 276
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Social/Tax Id"
end type

type gb_addinfo from groupbox within w_pfc_sender_compliancedata
integer x = 101
integer y = 1120
integer width = 2501
integer height = 692
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Información Adicional"
end type

type gb_2 from groupbox within w_pfc_sender_compliancedata
integer x = 46
integer width = 2610
integer height = 236
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_pfc_sender_compliancedata
integer x = 46
integer y = 200
integer width = 2610
integer height = 1660
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

