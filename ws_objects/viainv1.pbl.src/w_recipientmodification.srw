$PBExportHeader$w_recipientmodification.srw
forward
global type w_recipientmodification from window
end type
type lst_account_type from my_ddlb within w_recipientmodification
end type
type st_account_type from statictext within w_recipientmodification
end type
type st_bank from statictext within w_recipientmodification
end type
type sle_bank from singlelineedit within w_recipientmodification
end type
type sle_num_id_receiver from singlelineedit within w_recipientmodification
end type
type lst_type_id_receiver from my_ddlb within w_recipientmodification
end type
type st_7 from statictext within w_recipientmodification
end type
type st_account from statictext within w_recipientmodification
end type
type sle_account from singlelineedit within w_recipientmodification
end type
type sle_user from singlelineedit within w_recipientmodification
end type
type st_6 from statictext within w_recipientmodification
end type
type st_5 from statictext within w_recipientmodification
end type
type lst_reasons from my_ddlb within w_recipientmodification
end type
type st_payer_info from statictext within w_recipientmodification
end type
type sle_phone2 from singlelineedit within w_recipientmodification
end type
type st_4 from statictext within w_recipientmodification
end type
type sle_phone1 from singlelineedit within w_recipientmodification
end type
type st_3 from statictext within w_recipientmodification
end type
type sle_address from singlelineedit within w_recipientmodification
end type
type st_2 from statictext within w_recipientmodification
end type
type st_1 from statictext within w_recipientmodification
end type
type sle_slname from singlelineedit within w_recipientmodification
end type
type sle_lname from singlelineedit within w_recipientmodification
end type
type sle_mname from singlelineedit within w_recipientmodification
end type
type sle_fname from singlelineedit within w_recipientmodification
end type
type cb_cancel from commandbutton within w_recipientmodification
end type
type cb_ok from commandbutton within w_recipientmodification
end type
type gb_1 from groupbox within w_recipientmodification
end type
type gb_2 from groupbox within w_recipientmodification
end type
type gb_3 from groupbox within w_recipientmodification
end type
end forward

global type w_recipientmodification from window
integer width = 1792
integer height = 1608
boolean titlebar = true
string title = "Recipient Modification"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
lst_account_type lst_account_type
st_account_type st_account_type
st_bank st_bank
sle_bank sle_bank
sle_num_id_receiver sle_num_id_receiver
lst_type_id_receiver lst_type_id_receiver
st_7 st_7
st_account st_account
sle_account sle_account
sle_user sle_user
st_6 st_6
st_5 st_5
lst_reasons lst_reasons
st_payer_info st_payer_info
sle_phone2 sle_phone2
st_4 st_4
sle_phone1 sle_phone1
st_3 st_3
sle_address sle_address
st_2 st_2
st_1 st_1
sle_slname sle_slname
sle_lname sle_lname
sle_mname sle_mname
sle_fname sle_fname
cb_cancel cb_cancel
cb_ok cb_ok
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_recipientmodification w_recipientmodification

type variables
string is_fname_o, is_mname_o, is_lname_o, is_slname_o
string is_fname_n, is_mname_n, is_lname_n, is_slname_n

string is_address_o, is_phone1_o, is_phone2_o, is_account_o
string is_address_n, is_phone1_n, is_phone2_n, is_account_n

string is_type_id_receiver_o, is_type_id_receiver_n, is_num_id_receiver_o, is_num_id_receiver_n
string is_bank_receiver_o, is_bank_receiver_n, is_acc_type_o, is_acc_type_n

double id_id_receiver
string is_id_branch, is_payer, is_mod_interfase, is_id_payer

boolean ib_isdeposit


end variables

forward prototypes
public function boolean fn_valcompliance ()
public subroutine fn_getnewdata ()
public function boolean fn_verify_name ()
public function boolean fn_validacion_dinamica (string s_string_o, string s_string_n)
end prototypes

public function boolean fn_valcompliance ();SetPointer(HourGlass!)

fn_getNewData()

string ls_hold_reasons
boolean lb_result

select dba.sfChkCompliance ('M',
		 dba.receiver.id_branch,
		 dba.receiver.id_receiver,
		 dba.receiver.id_sender,
		 dba.receiver.date_receiver,
		 dba.receiver.branch_pay_receiver,
		 dba.sender.sen_fname,
		 dba.sender.sen_mname,
		 dba.sender.sen_lname,
		 dba.sender.sen_slname,
		 :is_fname_n,
		 :is_mname_n,
		 :is_lname_n,
		 :is_slname_n,
		 dba.sender.phone1_sender,
		 dba.sender.phone2_sender,
		 :is_phone1_n ,
		 :is_phone2_n,
		 dba.receiver.total_receiver,
		 dba.receiver.id_flag_receiver)
  into :ls_hold_reasons
  from dba.receiver, dba.sender
 where dba.receiver.id_branch = dba.sender.id_branch
   and dba.receiver.id_sender = dba.sender.id_sender
   and dba.receiver.id_receiver = :id_id_receiver 
   and dba.receiver.id_branch = :is_id_branch;

if trim(ls_hold_reasons) = '' then
	lb_result = true
else
	lb_result = false
end if

SetPointer(Arrow!)

return lb_result


end function

public subroutine fn_getnewdata ();
// Populate new data in variables '_n'

is_fname_n = trim(sle_fname.text)
is_mname_n = trim(sle_mname.text)
is_lname_n = trim(sle_lname.text)
is_slname_n = trim(sle_slname.text)
is_address_n = trim(sle_address.text)
is_phone1_n = trim(sle_phone1.text)
is_phone2_n = sle_phone2.text        // Para retransmitir sin modificar se pone ' ' al final de tel2
is_account_n = trim(sle_account.text)
is_type_id_receiver_n = trim(lst_type_id_receiver.getdataid())
is_num_id_receiver_n = trim(sle_num_id_receiver.text)
is_bank_receiver_n = trim(sle_bank.text)
is_acc_type_n = trim(lst_account_type.getdataid())

cb_ok.enabled = false

//if ib_isdeposit then
//	st_account.visible = true
//	sle_account.visible = true
//	//if is_id_payer = 'T056' then
//		st_bank.visible = true
//		sle_bank.visible = true
//	//else
//	//	st_bank.visible = false
//	//	sle_bank.visible = false		
//	//end if	
//else
//	st_account.visible = false
//	sle_account.visible = false
//	st_bank.visible = false
//	sle_bank.visible = false	
//end if

if ib_isdeposit then
	st_account.visible = true
	sle_account.visible = true
	st_bank.visible = true
	sle_bank.visible = true
	lst_account_type.visible = true
	st_account_type.visible = true			
else
	st_account.visible = false
	sle_account.visible = false
	st_bank.visible = false
	sle_bank.visible = false	
	lst_account_type.visible = false
	st_account_type.visible = false
end if	


// Change font color to RED for modified fields

if is_fname_n <> is_fname_o then
	sle_fname.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_fname.TextColor = RGB(0,0,0)	
end if

if is_mname_n <> is_mname_o then
	sle_mname.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_mname.TextColor = RGB(0,0,0)	
end if

if is_lname_n <> is_lname_o then
	sle_lname.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_lname.TextColor = RGB(0,0,0)	
end if

if is_slname_n <> is_slname_o then
	sle_slname.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_slname.TextColor = RGB(0,0,0)	
end if

if is_address_n <> is_address_o then
	sle_address.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_address.TextColor = RGB(0,0,0)	
end if

if is_phone1_n <> is_phone1_o then
	sle_phone1.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_phone1.TextColor = RGB(0,0,0)	
end if

if is_phone2_n <> is_phone2_o then
	sle_phone2.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_phone2.TextColor = RGB(0,0,0)	
end if

if is_type_id_receiver_n <> is_type_id_receiver_o then
	lst_type_id_receiver.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	lst_type_id_receiver.TextColor = RGB(0,0,0)	
end if

if is_acc_type_n <> is_acc_type_o then
	lst_account_type.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	lst_account_type.TextColor = RGB(0,0,0)	
end if

if is_num_id_receiver_n <> is_num_id_receiver_o then
	sle_num_id_receiver.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_num_id_receiver.TextColor = RGB(0,0,0)	
end if

if is_account_n <> is_account_o then
	sle_account.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_account.TextColor = RGB(0,0,0)	
end if
	
if is_bank_receiver_n <> is_bank_receiver_o then
	sle_bank.TextColor = RGB(255,0,0)
	cb_ok.enabled = true
else
	sle_bank.TextColor = RGB(0,0,0)	
end if
	

end subroutine

public function boolean fn_verify_name ();boolean resp

string s_fname_n,s_lname_n, s_mname_n, s_slname_n, s_prefi, s_separation, s_allow_changes
string  s_fname_older, s_lname_older, s_mname_older, s_slname_older, s_name_special_case
string s_char_n, s_char_o, s_user_validation, s_soundex1, s_soundex2, s_char_d1, s_char_d2

integer i_length_o, i_length_n, i_differences, n, i_length_big, l_diff_m, n2
double d_differences_number, d_start, d_pos


SELECT ALLOW_BEN_CHANGES
INTO :s_allow_changes
FROM DBA.BRANCH , DBA.GROUP_BRANCH
WHERE DBA.BRANCH.ID_MAIN_BRANCH = DBA.GROUP_BRANCH.ID_MAIN_BRANCH
AND DBA.BRANCH.ID_BRANCH = :is_id_branch;

if isnull(s_allow_changes) then s_allow_changes = 'N'

if s_allow_changes = 'Y' then
	return true
else


/// Verifica si el usuario pertenece o no al grupo de supervisores /////////////////////////

SELECT ID_USER
INTO :s_user_validation
FROM dba.SEC_USER_GROUP
WHERE ID_GROUP = 'REM' and
		  ID_USER = :gs_cashier ;
		  
if sqlca.sqlcode = 0 then
	return true
end if



//Toma el valor original para NOMBRE y APELLIDO ///////////////////////////////////////////////////

SELECT OLD_REC_FNAME, OLD_REC_MNAME, OLD_REC_LNAME, OLD_REC_SLNAME
INTO :s_fname_older, :s_mname_older, :s_lname_older, :s_slname_older
FROM dba.AUDIT_RECEIVER_INFO m
WHERE DATE_AUDIT = (SELECT MIN (DATE_AUDIT)
					FROM dba.AUDIT_RECEIVER_INFO
					WHERE ID_BRANCH = m.id_branch and
						 	  ID_RECEIVER = m.id_receiver and
						  	  ID_BRANCH = :is_id_branch and
						  	  ID_RECEIVER = :id_id_receiver)
ORDER BY DATE_AUDIT desc;



if isnull(s_fname_older) or s_fname_older = '' then
	s_fname_older = is_fname_o
end if

if isnull(s_lname_older) or s_lname_older = '' then
	s_lname_older = is_lname_o
end if

if isnull(s_mname_older) or s_mname_older = '' then
	s_mname_older = is_mname_o
end if

if isnull(s_slname_older) or s_slname_older = '' then
	s_slname_older = is_slname_o
end if

/////////////
//**************************Validacion de Cambios en el Nombre**********************************
// Calcula el numero de cambios en el NOMBRE del Receiver
// si los cambios exceden los 2 caracteres solo puede ser hecho por un supervisor
//**************************************************************************************

i_differences = 0

s_fname_n = trim(sle_fname.text)

if s_fname_n <> is_fname_o then
	

SELECT NOMBRE
INTO :s_name_special_case
FROM dba.NOMBRE_APOCOPE
WHERE DIMINUTIVO = :s_fname_older OR
		   APOCOPE = :s_fname_older;
			
if s_fname_n <> s_name_special_case then
	
	
	
i_length_n = len(s_fname_n)
i_length_o = len(s_fname_older)



if i_length_o <>  i_length_n then
	
	i_differences = i_differences + 1
	
end if



if i_length_o > i_length_n then
	
	i_length_big = i_length_o
	
else
	i_length_big = i_length_n
	
end if

if i_differences = 0 then
	for n = 1  to i_length_big
	
		s_char_n =	mid(s_fname_n,n,1)
		s_char_o  = mid(s_fname_older,n,1)
	

	if s_char_n <> s_char_o then
	
		i_differences = i_differences + 1
	
	end if
	next
	
else 
	n2 = 1
		for n = 1 to i_length_big
			s_char_n =	mid(s_fname_n,n2,1)
			s_char_o  = mid(s_fname_older,n,1)
			
			if s_char_n <> s_char_o then
				
				if mid(s_fname_n,n2+1,1) <> mid(s_fname_older,n+1,1) then
					if i_length_o > i_length_n then
						n++
					else 
						n2++
						s_char_n =	mid(s_fname_n,n2,1)
					     s_char_o  = mid(s_fname_older,n,1)
						  if s_char_n <> s_char_o then
							i_differences = i_differences + 1
						end if
					end if 
					
				end if 
				i_differences = i_differences + 1
	
			end if
			n2++
		next
	
end if




if i_differences > 2 then
	
	resp = false
	return resp
	
end if

end if 
end if

//**************************Validacion de Cambios en el Nombre**********************************
// Calcula el numero de cambios en el SEGUNDO NOMBRE del Receiver
// si los cambios exceden los 2 caracteres solo puede ser hecho por un supervisor
//**************************************************************************************

if s_mname_n <> is_mname_o then

	if isnull(sle_mname.text) or sle_mname.text = '' then
	

else
	
	
s_mname_n = trim(sle_mname.text)	
	
SELECT NOMBRE
INTO :s_name_special_case
FROM dba.NOMBRE_APOCOPE
WHERE DIMINUTIVO = :s_mname_older OR
		   APOCOPE = :s_mname_older;
			
if s_mname_n <> s_name_special_case then
	
	
	

	
	

i_length_n = len(s_mname_n )
i_length_o = len(s_mname_older)

	
i_differences = 0
n2 = 0




if i_length_o <>  i_length_n then
	
	i_differences = i_differences + 1
	
end if

if i_length_o > i_length_n then
	
	i_length_big = i_length_o
	
else
	i_length_big = i_length_n
	
end if

if i_differences = 0 then

for n =1 to i_length_big
	
	s_char_n =	mid(s_mname_n,n,1)
	s_char_o  = mid(s_mname_older,n,1)
	

if s_char_n <> s_char_o then
	
	i_differences = i_differences + 1
	
end if
next
else 
	// Comprobacion de Prefijo 'DE' en el segundo Nombre/////
	
	d_pos = POS(s_mname_n,' ')
	
	 if  upper(left(s_mname_n, d_pos -1 ))  = 'DE' or  upper(left(s_mname_n, d_pos -1 ))  = 'DEL'  then
			
		 if  mid(s_mname_n,d_pos,1) = ' ' then
		  	n2 = POS(s_mname_n,' ') + 1
		 end if
	end if
	
	if isnull(n2) or n2 = 0 then
		n2 = 1 
	end if
	
	 if upper(left(s_mname_older, d_pos -1 ))  = 'DE' or  upper(left(s_mname_older, d_pos -1 ))  = 'DEL'   then
				
		 if  mid(s_mname_older,d_pos,1) = ' ' then
		  	d_start = POS(s_mname_older,' ') + 1
		 end if
	end if
	
	if isnull(n2) or n2 = 0 then
		d_start = 1 
	end if
	

		for n = d_start to i_length_big
			s_char_n =	mid(s_mname_n,n2,1)
			s_char_o  = mid(s_mname_older,n,1)
			
			if s_char_n <> s_char_o then
				
				if mid(s_mname_n,n2+1,1) <> mid(s_mname_older,n+1,1) then
					if i_length_o > i_length_n then
						n++
					else 
						n2++
						s_char_n =	mid(s_mname_n,n2,1)
					     s_char_o  = mid(s_mname_older,n,1)
						  if s_char_n <> s_char_o then
							i_differences = i_differences + 1
						end if
					end if 
					
				end if 
				i_differences = i_differences + 1
	
			end if
			n2++
		next
	
end if

if i_differences > 2 then
	
	resp = false
	return resp
	
			end if	
		end if
	end if
end if
//**************************Validacion de Cambios en el Nombre**********************************
// Calcula el numero de cambios en el PRIMER APELLIDO del Receiver
// si los cambios exceden los 2 caracteres solo puede ser hecho por un supervisor
//**************************************************************************************

if s_lname_n <> is_lname_o then

i_differences = 0
n2 = 0
s_lname_n = trim(sle_lname.text)
i_length_n = len(s_lname_n)
i_length_o = len(s_lname_older)

if i_length_o <>  i_length_n then
	
	i_differences = i_differences + 1
	
end if

if i_length_o > i_length_n then
	
	i_length_big = i_length_o
	
else
	i_length_big = i_length_n
	
end if

if i_differences = 0 then

for n = 1 to i_length_o 
	
s_char_n =	mid(s_lname_n,n,1)
s_char_o  = mid(s_lname_older,n,1)

if s_char_n <> s_char_o then
	
	i_differences = i_differences + 1
	
end if
next
else 
	
	d_pos = POS(s_lname_n,' ')
	
	 if upper(left(s_lname_n, d_pos -1 ))  = 'DE' or  upper(left(s_lname_n, d_pos -1 ))  = 'DEL' then 
	 			
		 if  mid(s_lname_n,d_pos,1) = ' ' then
		  	n2 = POS(s_lname_n,' ' ) + 1
		 end if
	end if
	
	if isnull(n2) or n2 = 0 then
		n2 = 1 
	end if
	
	 if upper(left(s_lname_older, d_pos -1 ))  = 'DE' or  upper(left(s_lname_older, d_pos -1 ))  = 'DEL' then  
	 	
		 if  mid(s_lname_older,d_pos,1) = ' ' then
		  	d_start = POS(s_lname_older,' ' ) + 1
		 end if
	end if
	
	if isnull(n2) or n2 = 0 then
		d_start = 1 
	end if
	

		for n = 1 to i_length_big
			s_char_n =	mid(s_lname_n,n2,1)
			s_char_o  = mid(s_lname_older,n,1)
			
			if s_char_n <> s_char_o then
				
				if mid(s_lname_n,n2+1,1) <> mid(s_lname_older,n+1,1) then
					if i_length_o > i_length_n then
						n++
					else 
						n2++
						s_char_n =	mid(s_lname_n,n2,1)
					     s_char_o  = mid(s_lname_older,n,1)
						  if s_char_n <> s_char_o then
							i_differences = i_differences + 1
						end if
					end if 
					
				end if 
				i_differences = i_differences + 1
	
			end if
			n2++
		next
	
end if

if i_differences > 2 then
	
	resp = false

else
	
	resp = true

end if

end if 



return resp

end if
end function

public function boolean fn_validacion_dinamica (string s_string_o, string s_string_n);return true
//if s_string_n <> is_mname_o then
//
//	if isnull(sle_mname.text) or sle_mname.text = '' then
//	
//	return true
//	
//	end if
//	
//	
//s_string_n = trim(sle_mname.text)
//i_length_n = len(s_string_n )
//i_length_o = len(s_mname_older)
//
//	
//i_differences = 0
//
//
//
//
//
//if i_length_o <>  i_length_n then
//	
//	i_differences = i_differences + 1
//	
//end if
//
//if i_length_o > i_length_n then
//	
//	i_length_big = i_length_o
//	
//else
//	i_length_big = i_length_n
//	
//end if
//
//if i_differences = 0 then
//
//for n =1 to i_length_big
//	
//	s_char_n =	mid(s_string_n,n,1)
//	s_char_o  = mid(s_mname_older,n,1)
//	
//
//if s_char_n <> s_char_o then
//	
//	i_differences = i_differences + 1
//	
//end if
//next
//else 
//	n2 = 1
//		for n = 1 to i_length_n
//			s_char_n =	mid(s_string_n,n2,1)
//			s_char_o  = mid(s_mname_older,n,1)
//			
//			if s_char_n <> s_char_o then
//				
//				if mid(s_string_n,n2+1,1) <> mid(s_mname_older,n+1,1) then
//					if i_length_o > i_length_n then
//						n++
//					else 
//						n2++
//						s_char_n =	mid(s_string_n,n2,1)
//					     s_char_o  = mid(s_mname_older,n,1)
//						  if s_char_n <> s_char_o then
//							i_differences = i_differences + 1
//						end if
//					end if 
//					
//				end if 
//				i_differences = i_differences + 1
//	
//			end if
//			n2++
//		next
//	
//end if
//
//if i_differences > 2 then
//	
//	resp = false
//	return resp
//	
//end if
//
//end if
end function

on w_recipientmodification.create
this.lst_account_type=create lst_account_type
this.st_account_type=create st_account_type
this.st_bank=create st_bank
this.sle_bank=create sle_bank
this.sle_num_id_receiver=create sle_num_id_receiver
this.lst_type_id_receiver=create lst_type_id_receiver
this.st_7=create st_7
this.st_account=create st_account
this.sle_account=create sle_account
this.sle_user=create sle_user
this.st_6=create st_6
this.st_5=create st_5
this.lst_reasons=create lst_reasons
this.st_payer_info=create st_payer_info
this.sle_phone2=create sle_phone2
this.st_4=create st_4
this.sle_phone1=create sle_phone1
this.st_3=create st_3
this.sle_address=create sle_address
this.st_2=create st_2
this.st_1=create st_1
this.sle_slname=create sle_slname
this.sle_lname=create sle_lname
this.sle_mname=create sle_mname
this.sle_fname=create sle_fname
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.lst_account_type,&
this.st_account_type,&
this.st_bank,&
this.sle_bank,&
this.sle_num_id_receiver,&
this.lst_type_id_receiver,&
this.st_7,&
this.st_account,&
this.sle_account,&
this.sle_user,&
this.st_6,&
this.st_5,&
this.lst_reasons,&
this.st_payer_info,&
this.sle_phone2,&
this.st_4,&
this.sle_phone1,&
this.st_3,&
this.sle_address,&
this.st_2,&
this.st_1,&
this.sle_slname,&
this.sle_lname,&
this.sle_mname,&
this.sle_fname,&
this.cb_cancel,&
this.cb_ok,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_recipientmodification.destroy
destroy(this.lst_account_type)
destroy(this.st_account_type)
destroy(this.st_bank)
destroy(this.sle_bank)
destroy(this.sle_num_id_receiver)
destroy(this.lst_type_id_receiver)
destroy(this.st_7)
destroy(this.st_account)
destroy(this.sle_account)
destroy(this.sle_user)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.lst_reasons)
destroy(this.st_payer_info)
destroy(this.sle_phone2)
destroy(this.st_4)
destroy(this.sle_phone1)
destroy(this.st_3)
destroy(this.sle_address)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_slname)
destroy(this.sle_lname)
destroy(this.sle_mname)
destroy(this.sle_fname)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;Long ll_count
String ls_mode_pay_receiver

cb_ok.enabled = false

is_id_branch = fn_token(Message.StringParm,'*',1)
id_id_receiver = double(fn_token(Message.StringParm,'*',2))

SELECT count(*)
INTO :ll_count
FROM dba.receiver
WHERE id_branch = :is_id_branch
AND id_receiver = :id_id_receiver
AND id_flag_receiver in ('H','I','T');	

if ll_count < 1 and trim(gs_cashier) <> '1000' then
	close(this)
else


	lst_type_id_receiver.addquery("select NAME_TYPE_ID_SENDER, ID_TYPE_ID_SENDER from dba.TYPE_ID_SENDER order by NAME_TYPE_ID_SENDER;")	
	lst_account_type.addquery("select 'CHECKING', 'C' from dba.dual UNION select 'SAVINGS', 'S' from dba.dual;")
		

	SELECT name_cashier
	  INTO :sle_user.text
	  FROM dba.cashier
    WHERE id_cashier = :gs_cashier;	 
	
	SELECT rec_fname, rec_mname, rec_lname, rec_slname,
	address_receiver, phone1_receiver, phone2_receiver, acc_receiver,
	name_main_branch, payer_mod_interfase, mode_pay_receiver,
	typeid, numid, dba.group_branch.id_main_branch, bank_receiver, acc_typeid
	INTO :is_fname_o, :is_mname_o, :is_lname_o, :is_slname_o,
	:is_address_o, :is_phone1_o, :is_phone2_o, :is_account_o,
	:is_payer, :is_mod_interfase, :ls_mode_pay_receiver,
	:is_type_id_receiver_o, :is_num_id_receiver_o,
	:is_id_payer, :is_bank_receiver_o, :is_acc_type_o
	FROM dba.receiver, dba.branch, dba.group_branch
	WHERE dba.receiver.branch_pay_receiver = dba.branch.id_branch
	AND dba.branch.id_main_branch = dba.group_branch.id_main_branch
	AND dba.receiver.id_branch = :is_id_branch
	AND dba.receiver.id_receiver = :id_id_receiver;

	if isnull(is_type_id_receiver_o) or trim(is_type_id_receiver_o) = '' then is_type_id_receiver_o = 'NN'	
	
	sle_fname.text = trim(is_fname_o)
	sle_mname.text = trim(is_mname_o)
	sle_lname.text = trim(is_lname_o)
	sle_slname.text = trim(is_slname_o)
	sle_address.text = trim(is_address_o)
	sle_phone1.text = trim(is_phone1_o)
	sle_phone2.text = trim(is_phone2_o)
	sle_account.text = trim(is_account_o)		
	lst_type_id_receiver.setselectedid(is_type_id_receiver_o)
	sle_num_id_receiver.text = trim(is_num_id_receiver_o)
	sle_bank.text = trim(is_bank_receiver_o)
	lst_account_type.setselectedid(is_acc_type_o)
	
	
	if	ls_mode_pay_receiver = 'C' or ls_mode_pay_receiver = 'T' or ls_mode_pay_receiver = 'N'  then
		ib_isdeposit = true
	else
		ib_isdeposit = false
	end if
	
	if ib_isdeposit  then
		st_account.visible = true
		sle_account.visible = true
		st_bank.visible = true
		sle_bank.visible = true
		lst_account_type.visible = true
		st_account_type.visible = true			
	else
		st_account.visible = false
		sle_account.visible = false
		st_bank.visible = false
		sle_bank.visible = false	
		lst_account_type.visible = false
		st_account_type.visible = false
	end if	
	
	 if ls_mode_pay_receiver = 'O' then 
		st_account.text = 'Wallet # :'
		st_account.visible = true
		sle_account.visible = true
	end if

	if isnull(is_mod_interfase) or trim(is_mod_interfase)= '' then is_mod_interfase = 'N'
	is_payer = trim(is_payer)
	
	if is_id_payer = 'T056' then
		st_payer_info.TextColor = RGB(0,0,215)
		st_payer_info.text = 'EL PAGADOR '+is_payer+ ' (' +trim(is_id_payer)+ ') SOPORTA MODIFICACIONES EN LINEA, PERO SOLAMENTE CUANDO EL ENVIO ORIGINAL FUE RECHAZADO (CFP/BANCO).'	
	else	
		if is_mod_interfase = 'N' then
			st_payer_info.TextColor = RGB(255,0,0)
			st_payer_info.text = 'EL PAGADOR '+is_payer+ ' (' +trim(is_id_payer)+ ') NO SOPORTA MODIFICACIONES EN LINEA, LOS CAMBIOS HECHOS EN ESTA PANTALLA DEBEN SER CORDINADOS MANUALMENTE CON EL PAGADOR.'
		else
			st_payer_info.TextColor = RGB(0,0,0)
			st_payer_info.text = 'EL PAGADOR '+is_payer+ ' (' +trim(is_id_payer)+ ') SOPORTA MODIFICACIONES EN LINEA, LOS CAMBIOS HECHOS EN ESTA PANTALLA SERAN ENVIADOS EN LA INTERFASE DEL PAGADOR.'
		end if
	end if

	lst_reasons.addquery("select desc_modification_reason, id_modification_reason from dba.modification_reasons order by id_modification_reason;")	

end if

end event

type lst_account_type from my_ddlb within w_recipientmodification
integer x = 475
integer y = 972
integer width = 562
integer height = 556
integer taborder = 80
end type

event selectionchanged;call super::selectionchanged;fn_getNewData()
end event

type st_account_type from statictext within w_recipientmodification
integer x = 128
integer y = 984
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Account Type :"
boolean focusrectangle = false
end type

type st_bank from statictext within w_recipientmodification
integer x = 1061
integer y = 896
integer width = 210
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agenc. :"
boolean focusrectangle = false
end type

type sle_bank from singlelineedit within w_recipientmodification
integer x = 1271
integer y = 880
integer width = 338
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
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type sle_num_id_receiver from singlelineedit within w_recipientmodification
integer x = 1047
integer y = 792
integer width = 562
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type lst_type_id_receiver from my_ddlb within w_recipientmodification
integer x = 475
integer y = 792
integer width = 562
integer height = 556
integer taborder = 80
end type

event selectionchanged;call super::selectionchanged;fn_getNewData()
end event

type st_7 from statictext within w_recipientmodification
integer x = 128
integer y = 808
integer width = 329
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Identif. :"
boolean focusrectangle = false
end type

type st_account from statictext within w_recipientmodification
integer x = 128
integer y = 896
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Account # :"
boolean focusrectangle = false
end type

type sle_account from singlelineedit within w_recipientmodification
integer x = 475
integer y = 880
integer width = 562
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
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type sle_user from singlelineedit within w_recipientmodification
integer x = 475
integer y = 1148
integer width = 562
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
integer limit = 50
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type st_6 from statictext within w_recipientmodification
integer x = 128
integer y = 1160
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "User :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_recipientmodification
integer x = 128
integer y = 1252
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reason :"
boolean focusrectangle = false
end type

type lst_reasons from my_ddlb within w_recipientmodification
integer x = 475
integer y = 1240
integer width = 1134
integer height = 556
integer taborder = 110
end type

type st_payer_info from statictext within w_recipientmodification
integer x = 96
integer y = 76
integer width = 1595
integer height = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type sle_phone2 from singlelineedit within w_recipientmodification
integer x = 1047
integer y = 616
integer width = 562
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 12
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type st_4 from statictext within w_recipientmodification
integer x = 128
integer y = 632
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Phones :"
boolean focusrectangle = false
end type

type sle_phone1 from singlelineedit within w_recipientmodification
integer x = 475
integer y = 616
integer width = 562
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 12
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type st_3 from statictext within w_recipientmodification
integer x = 128
integer y = 720
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Address :"
boolean focusrectangle = false
end type

type sle_address from singlelineedit within w_recipientmodification
integer x = 475
integer y = 704
integer width = 1134
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
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type st_2 from statictext within w_recipientmodification
integer x = 128
integer y = 544
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last Names :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_recipientmodification
integer x = 128
integer y = 456
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Names :"
boolean focusrectangle = false
end type

type sle_slname from singlelineedit within w_recipientmodification
integer x = 1047
integer y = 528
integer width = 562
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type sle_lname from singlelineedit within w_recipientmodification
integer x = 475
integer y = 528
integer width = 562
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type sle_mname from singlelineedit within w_recipientmodification
integer x = 1047
integer y = 440
integer width = 562
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type sle_fname from singlelineedit within w_recipientmodification
integer x = 475
integer y = 440
integer width = 562
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;fn_getNewData()
end event

type cb_cancel from commandbutton within w_recipientmodification
integer x = 887
integer y = 1392
integer width = 402
integer height = 80
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_recipientmodification
integer x = 1317
integer y = 1392
integer width = 402
integer height = 80
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
boolean default = true
end type

event clicked;string ls_id_modification_reason, ls_completename, ls_partial, ls_sql, ls_acc_type
long ll_filenum

String ls_outputfolder
SELECT ISNULL(DIR_OUTPUT,'S:\OUTPUT\')
  INTO :ls_outputfolder
  FROM dba.PARAMETROS;	

ls_id_modification_reason = lst_reasons.getdataid()

ls_acc_type = lst_account_type.getdataid()

if isnull(sle_fname.text) or len(trim(sle_fname.text)) < 1 then
	messagebox('Missing Information',"The Recipient's First Name is required.",StopSign!)	
	sle_fname.setFocus()
	return
end if

if isnull(sle_lname.text) or len(trim(sle_lname.text)) < 1 then
	messagebox('Missing Information',"The Recipient's Last Name is required.",StopSign!)	
	sle_lname.setFocus()
	return
end if

if isnull(sle_address.text) or len(trim(sle_address.text)) < 1 then
	messagebox('Missing Information',"The Recipient's Address is required.",StopSign!)	
	sle_address.setFocus()
	return
end if

if ib_isdeposit and (isnull(sle_account.text) or len(trim(sle_account.text)) < 1) then
	messagebox('Missing Information',"The Recipient Account Number is required.",StopSign!)	
	sle_account.setFocus()
	return
end if

// Verificacion del Cambio de Nombre en el envio ///////////
if fn_verify_name() = false then
	messagebox('Alert','Esta modificacion debe ser hecha por un supervisor', stopsign!)
	return
end if
//////

if fn_valcompliance() then
//or gs_cashier = '1000' then

	// Determina el nombre completo
	ls_completename = ""
	ls_partial = trim(is_fname_n)
	if not isnull(ls_partial) then ls_completename += ls_partial + " "
	ls_partial = trim(is_mname_n)
	if not isnull(ls_partial) then ls_completename += ls_partial + " "
	ls_partial = trim(is_lname_n)
	if not isnull(ls_partial) then ls_completename += ls_partial + " "
	ls_partial = trim(is_slname_n)
	if not isnull(ls_partial) then ls_completename += ls_partial
	ls_completename =  trim(ls_completename)
	
	if isnull(is_num_id_receiver_o) or trim(is_num_id_receiver_o) = '' then
		is_type_id_receiver_o = ''
	end if

	// Actualiza el cliente
	UPDATE dba.receiver
	   SET name_receiver = :ls_completename,
			 rec_fname = :is_fname_n, 
			 rec_mname = :is_mname_n, 
			 rec_lname = :is_lname_n, 
			 rec_slname = :is_slname_n,
	      	 address_receiver = :is_address_n, 
			 phone1_receiver = :is_phone1_n, 
			 phone2_receiver = :is_phone2_n,
			 id_modification_reason = :ls_id_modification_reason,
			 acc_receiver = :is_account_n,
			 typeid = :is_type_id_receiver_n,
			 numid = :is_num_id_receiver_n,
			 bank_receiver = :is_bank_receiver_n,
			 acc_typeid = :is_acc_type_n
	 WHERE id_branch = :is_id_branch
		AND id_receiver = :id_id_receiver;

	// El pagador soporta modificaciones en linea! (Solo giros en Status T)
	if is_mod_interfase <> 'N' then		

		UPDATE dba.receiver
		   SET id_modification_req = 0,
		       trans_receiver = 'N'
		 WHERE id_branch = :is_id_branch
		   AND id_receiver = :id_id_receiver
			AND id_flag_receiver = 'T';					

	end if

	if isnull(ls_completename) then ls_completename = ''
	if isnull(is_fname_n) then is_fname_n = ''
	if isnull(is_mname_n) then is_mname_n = ''
	if isnull(is_lname_n) then is_lname_n = ''
	if isnull(is_slname_n) then is_slname_n = ''
	if isnull(is_address_n) then is_address_n = ''
	if isnull(is_phone1_n) then is_phone1_n = ''
	if isnull(is_phone2_n) then is_phone2_n = ''	
	if isnull(is_type_id_receiver_n) then is_type_id_receiver_n = ''
	if isnull(is_num_id_receiver_n) then is_num_id_receiver_n = ''
	if isnull(is_bank_receiver_n) then is_bank_receiver_n = ''		
	if isnull(is_acc_type_n) then is_acc_type_n = ''
		
	ls_sql =  "UPDATE receiver SET name_receiver = '"+ls_completename+"',"+ &
	          " rec_fname = '"+is_fname_n+"',"+ &
				 " rec_mname = '"+is_mname_n+"',"+ &
				 " rec_lname = '"+is_lname_n+"',"+ &
				 " rec_slname = '"+is_slname_n+"',"+ &
				 " address_receiver = '"+is_address_n+"',"+ &
				 " acc_receiver = '"+is_account_n+"',"+ &				 
				 " phone1_receiver = '"+is_phone1_n+"',"+ &
				 " phone2_receiver = '"+is_phone2_n+"',"+ &				 
				 " typeid = '"+is_type_id_receiver_n+"',"+ &
				 " numid = '"+is_num_id_receiver_n+"',"+ &
				 " bank_receiver = '"+is_bank_receiver_n+"',"+ &
				 " acc_typeid = '"+is_acc_type_n+"'"+ &
	          " WHERE (id_receiver = "+string(id_id_receiver)+") AND (id_branch = '"+is_id_branch+"');"


	ll_filenum = FileOpen(ls_outputfolder+"CLS"+FILL('0',10 - LEN(TRIM(is_id_branch)))+is_id_branch+".sql",LineMode!, Write!, LockWrite!,APPEND!)
	FileWrite (ll_filenum, "SET option on_error = CONTINUE;")
	FileWrite (ll_filenum, ls_sql) 
	FileWrite (ll_filenum, "COMMIT;")
	FileClose(ll_filenum)

	// --------------------------------------------
	// Hace la retransmision de RENDIMENTO!
	// si cambio el tipo de id, num id o agencia de pago (bank_receiver)
	if is_id_payer = 'T056' and &
		   (is_type_id_receiver_o <> is_type_id_receiver_n  or  &
		    is_num_id_receiver_o <> is_num_id_receiver_n  or  &
		    is_bank_receiver_o <> is_bank_receiver_n   &
		   ) then
	
		double ld_or_ref, ld_nw_ref
		
		SELECT REF_RECEIVER
		  INTO :ld_or_ref
		  FROM DBA.RECEIVER
		 WHERE id_branch = :is_id_branch
		   AND id_receiver = :id_id_receiver;	
	
		// retransmite a rendimento, verifica el rechazo y cambia la secuencia...
		DECLARE spRetransmitirRendimento PROCEDURE FOR dba.spRetransmitirRendimento @id_branch = :is_id_branch, @id_receiver = :id_id_receiver;
		Execute spRetransmitirRendimento;
	
		SELECT isnull(REF_RECEIVER,0)
		  INTO :ld_nw_ref
		  FROM DBA.RECEIVER
		 WHERE id_branch = :is_id_branch
		   AND id_receiver = :id_id_receiver;	
	
		if ld_nw_ref <> ld_or_ref then
			messagebox('Modificación Completa','El beneficiario ha sido modificado.')			
		else
			messagebox('Modificacion Rendimento','El beneficiario ha sido modificado pero no reenviado, El envio original no fue rechazado por rendimento.')
		end if

	else	
		messagebox('Modificación Completa','El beneficiario ha sido modificado.')
	end if
	// --------------------------------------------

	close(parent)

else
	//messagebox('Modification Not Completed','The recipient can not be modified because the new information does not meet compliance requeriments.',StopSign!)
	messagebox('Modificación no valida','El beneficiario no puede ser modificado porque el nuevo nombre no pasa los filtros de cumplimiento legal para la fecha original de la orden.~nSi desea continuar con esta modificación debe realizar el proceso de cancelación y pedir a la agencia que repita la orden.',StopSign!)
end if
end event

type gb_1 from groupbox within w_recipientmodification
integer x = 64
integer y = 324
integer width = 1659
integer height = 764
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "New Recipient Information"
end type

type gb_2 from groupbox within w_recipientmodification
integer x = 64
integer y = 1092
integer width = 1659
integer height = 264
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_recipientmodification
integer x = 64
integer y = 16
integer width = 1659
integer height = 300
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer Information"
end type

