$PBExportHeader$w_faxcomponent_senderids.srw
forward
global type w_faxcomponent_senderids from w_faxcomponent
end type
type sle_globalsender from singlelineedit within w_faxcomponent_senderids
end type
type sle_names from singlelineedit within w_faxcomponent_senderids
end type
type sle_lastnames from singlelineedit within w_faxcomponent_senderids
end type
type st_8 from statictext within w_faxcomponent_senderids
end type
type st_9 from statictext within w_faxcomponent_senderids
end type
type lst_id_type from my_ddlb within w_faxcomponent_senderids
end type
type st_10 from statictext within w_faxcomponent_senderids
end type
type txt_number_id from singlelineedit within w_faxcomponent_senderids
end type
type txt_expiration_date from editmask within w_faxcomponent_senderids
end type
type st_11 from statictext within w_faxcomponent_senderids
end type
type st_12 from statictext within w_faxcomponent_senderids
end type
type cb_copy_ocr from commandbutton within w_faxcomponent_senderids
end type
type dw_faxes from datawindow within w_faxcomponent_senderids
end type
type st_verified from statictext within w_faxcomponent_senderids
end type
type st_no_verified from statictext within w_faxcomponent_senderids
end type
type st_expired from statictext within w_faxcomponent_senderids
end type
type st_rejected from statictext within w_faxcomponent_senderids
end type
type cb_compliance from commandbutton within w_faxcomponent_senderids
end type
type cb_rejpop from commandbutton within w_faxcomponent_senderids
end type
type st_tooltip_assign_sender from statictext within w_faxcomponent_senderids
end type
type r_no_data from rectangle within w_faxcomponent_senderids
end type
type r_verified from rectangle within w_faxcomponent_senderids
end type
type r_no_verified from rectangle within w_faxcomponent_senderids
end type
type r_expired from rectangle within w_faxcomponent_senderids
end type
type r_rejected from rectangle within w_faxcomponent_senderids
end type
type cb_rename from commandbutton within w_faxcomponent_senderids
end type
type tab_rejection from tab within w_faxcomponent_senderids
end type
type tp from userobject within tab_rejection
end type
type cb_reject from commandbutton within tp
end type
type cb_rejcancel from commandbutton within tp
end type
type st_18 from statictext within tp
end type
type ddlb_rej_codes from dropdownlistbox within tp
end type
type tp from userobject within tab_rejection
cb_reject cb_reject
cb_rejcancel cb_rejcancel
st_18 st_18
ddlb_rej_codes ddlb_rej_codes
end type
type tab_rejection from tab within w_faxcomponent_senderids
tp tp
end type
type st_no_data from statictext within w_faxcomponent_senderids
end type
type dw_kyc_data from datawindow within w_faxcomponent_senderids
end type
type st_13 from statictext within w_faxcomponent_senderids
end type
type ddlb_kyc_documents from my_ddlb within w_faxcomponent_senderids
end type
type cb_edit_kyc from commandbutton within w_faxcomponent_senderids
end type
type cb_export_kyc from commandbutton within w_faxcomponent_senderids
end type
type cb_1 from commandbutton within w_faxcomponent_senderids
end type
type cbx_all_versions from checkbox within w_faxcomponent_senderids
end type
type st_14 from statictext within w_faxcomponent_senderids
end type
type st_15 from statictext within w_faxcomponent_senderids
end type
type ddlb_country from my_ddlb within w_faxcomponent_senderids
end type
type ddlb_state from my_ddlb within w_faxcomponent_senderids
end type
type pb_1 from picturebutton within w_faxcomponent_senderids
end type
type dw_documents from datawindow within w_faxcomponent_senderids
end type
end forward

global type w_faxcomponent_senderids from w_faxcomponent
integer width = 4105
integer height = 2596
string title = "Customer IDs & KYC"
boolean maxbox = false
boolean center = true
event pfc_copy ( )
sle_globalsender sle_globalsender
sle_names sle_names
sle_lastnames sle_lastnames
st_8 st_8
st_9 st_9
lst_id_type lst_id_type
st_10 st_10
txt_number_id txt_number_id
txt_expiration_date txt_expiration_date
st_11 st_11
st_12 st_12
cb_copy_ocr cb_copy_ocr
dw_faxes dw_faxes
st_verified st_verified
st_no_verified st_no_verified
st_expired st_expired
st_rejected st_rejected
cb_compliance cb_compliance
cb_rejpop cb_rejpop
st_tooltip_assign_sender st_tooltip_assign_sender
r_no_data r_no_data
r_verified r_verified
r_no_verified r_no_verified
r_expired r_expired
r_rejected r_rejected
cb_rename cb_rename
tab_rejection tab_rejection
st_no_data st_no_data
dw_kyc_data dw_kyc_data
st_13 st_13
ddlb_kyc_documents ddlb_kyc_documents
cb_edit_kyc cb_edit_kyc
cb_export_kyc cb_export_kyc
cb_1 cb_1
cbx_all_versions cbx_all_versions
st_14 st_14
st_15 st_15
ddlb_country ddlb_country
ddlb_state ddlb_state
pb_1 pb_1
dw_documents dw_documents
end type
global w_faxcomponent_senderids w_faxcomponent_senderids

type variables
 String is_id_sender_id, ls_data, is_kycfilepath, is_kycfile
m_oc im_popup
long il_txtleft , il_txttop , il_txtfilewidth, il_txtfileheight 



end variables

forward prototypes
public subroutine fn_ajustscreen ()
public subroutine fn_loadfax (string ls_filepath)
public subroutine fn_listar_faxes ()
public subroutine fn_procesar (string as_tipo)
public subroutine fn_save_id (string action)
public function boolean fn_validaciones ()
public function string fn_quitar_caracteres_especiales (string as_cadena)
public subroutine fn_load_kyc_form ()
public subroutine fn_habilitar_kyc (boolean ab_habilitar_kyc)
public subroutine fn_retrieve_kyc_docs ()
end prototypes

public subroutine fn_ajustscreen ();// Fore some reason EXTENT ANCESTOR SCRIPT IS DISABLED SO  THE ANCESTOR CODE IS HERE!

// after loading a fax, this ajust the screen

///ole_fax1.SetRedraw(false)
///ole_fax1.visible = false

sle_selected.text = lb_faxes.SelectedItem()
sle_newname.text = sle_selected.text
	
sle_pos.text = String(ll_curpage)+"/"+string(ole_fax1.object.GetTotalPage() )
	
// >>>>>>>>>>>>>>>>>>>>>>>>>>>
// Color Number of pages		
if ole_fax1.object.GetTotalPage() > 1 then 
	sle_pos.TextColor	= RGB(0,120,0)	
	pb_separate.enabled = true
	pb_previous.enabled = true
	pb_next.enabled = true
else
	sle_pos.TextColor	= RGB(0,0,0)	
	pb_separate.enabled = false
	pb_previous.enabled = false
	pb_next.enabled = false
end if

//	// >>>>>>>>>>>>>>>>>>>>>>>>>>>

htb_zoom.position = 50

// ole_fax1.object.View OPTIONS:
// 1  - 25% image size of original image
// 2  - 33% image size of original image
// 3  - 50% image size of original image
// 4  - 75% image size of original image
// 5  - 100% image size of original image
// 6  - 150% image size of original image
// 7  - 200% image size of original image
// 8  - User define view mode , After select this mode, use ViewSize property to define view size.
// 9  - Fit the image to current display area keep the aspect ratio
//10 - Fit the image to width of current display area.
//11 - Fit the image to height of current display area.
//12 - Center the Image, In this mode, you can't zoom in, zoom out or rotate the image.

if fn_get_file_ext(lb_faxes.SelectedItem()) <> ".pdf" then
	ole_fax1.object.View=9
end if

//ole_fax1.object.ViewSize=50 

///ole_fax1.SetRedraw(true)
///ole_fax1.visible = true



// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// THIS IS THE CHILD CODE


//table DBA.SENDER_ID (
//ID_SENDER_ID NUMERIC(10,0) IDENTITY NOT NULL PRIMARY KEY,
//ID_SENDER_GLOBAL NUMERIC(12,0) NOT NULL,
//FILE_NAME_ VARCHAR(100) NOT NULL,
//ID_TYPE_ID char(2) not null,
//NUMBER_ID varchar(15) not null,
//EXPIRATION_DATE datetime not null,
//FILE_PATH VARCHAR(500) NOT NULL,
//DB_USER_CREATED VARCHAR(40) NOT NULL,
//DB_USER_UPDATED  VARCHAR(40) NULL)


String ls_number_id, ls_expiration_date, ls_id_type, s_state, s_country
String ls_id_sender_global, ls_file_name

sle_selected.text = lb_faxes.SelectedItem()
sle_newname.text = sle_selected.text

ls_file_name = sle_selected.text
ls_id_sender_global = sle_globalsender.text

SetNull(is_id_sender_id)

SELECT TOP 1
 			ID_STATE_ISSUER_ID,
			ID_SENDER_ID,
			ID_TYPE_ID,
			NUMBER_ID,
			convert(varchar,EXPIRATION_DATE,101),
			ID_COUNTRY_ISSUER_ID
INTO :s_state, 
		:is_id_sender_id,
		:ls_id_type,
		:ls_number_id,
		:ls_expiration_date,		
		:s_country
FROM DBA.SENDER_ID
WHERE ID_SENDER_GLOBAL = :ls_id_sender_global
AND FILE_NAME_ = :ls_file_name;

//100: Success, but no rows found
if SQLCA.SQLCODE <> 0 and SQLCA.SQLCODE <> 100 then
		MessageBox("Error","Error Obtaining Document Data."+char(10)+'(Code: '+String(SQLCA.SQLCODE)+') - '+SQLCA.SQLErrText,StopSign!)
		Return
end if


// There is no ID METADATA
if IsNull(is_id_sender_id) or SQLCA.SQLCODE = 100  then
	
	lst_id_type.setselectedid("NN")	
	txt_number_id.text = ""
	txt_expiration_date.text = ""
	
	sle_newname.enabled = true
	cb_rename.text = 'Save ID'
	ddlb_country.setselectedid('' )
	ddlb_state.setselectedid('' )
	
	
else // There is ID METADATA
	
	
	lst_id_type.setselectedid(ls_id_type)	
	sle_newname.enabled = false
	sle_newname.text = ls_file_name
	txt_number_id.text = ls_number_id
	txt_expiration_date.text = ls_expiration_date
	ddlb_country.setselectedid(s_country)
	ddlb_state.setselectedid(s_state )
	
	// Set Red for the already expired, or the ones expiring soon
	if date(txt_expiration_date.text) < RelativeDate(today(),5) then
		txt_expiration_date.textColor = RGB(255,0,0)
	elseif date(txt_expiration_date.text) < RelativeDate(today(),30) then
		txt_expiration_date.textColor = RGB(255,200,0)
	else
		txt_expiration_date.textColor = RGB(0,0,0)
	end if
	
	cb_rename.text = 'Update ID'
	
end if

STRING s_type_document, s_country_populate, s_state_populate

ls_file_name = trim(ls_file_name)

IF ( IsNull(ls_id_type)  or Len(ls_id_type) = 0) THEN

	select TOP 1 id_type_id_sender 
	  INTO :s_type_document
	  from dba.type_id_sender 
	  where active = 1 
		 AND id_type_id_sender = substring(:ls_file_name,1,2 );
	
	IF  Len(s_type_document) > 0 THEN
		lst_id_type.setselectedid(s_type_document)		
		
	END IF
ELSE
	s_type_document = ls_id_type
END IF

IF s_type_document = 'DL' or   s_type_document = 'ID'    or   s_type_document = 'PR'    THEN
	
	
	IF  ( IsNull(s_country)  or Len(s_country) = 0) THEN
		s_country = 'USA'
		ddlb_country.setselectedid( 'USA')	
	END IF
	
	
	IF ( IsNull(s_state)  or Len(s_state) = 0) THEN
		
		select id_state
		INTO :s_state_populate
		 from dba.state 
		where id_country = 'USA' 
			and id_state = right(left(ltrim(:ls_file_name),5),2) 
		and is_isostate = 1;
		
		
		IF  Len(s_state_populate) > 0 THEN
			ddlb_state.setselectedid(s_state_populate)
		END IF
	END IF
	
ELSE

	IF  ( IsNull(s_country)  or Len(s_country) = 0) THEN
		SELECT DISTINCT TOP 1  ISO_C3
		  INTO :s_country_populate
				 FROM DBA.COUNTRY C
		 WHERE C.ID_COUNTRY in (RIGHT(substring(LTRIM(:ls_file_name),1,7 ),3), RIGHT(substring(LTRIM(:ls_file_name),1,6 ),3))
				 OR C.ISO_C2  in (RIGHT(substring(LTRIM(:ls_file_name),1,7 ),3), RIGHT(substring(LTRIM(:ls_file_name),1,6 ),3))
				 OR C.ISO_C3  in (RIGHT(substring(LTRIM(:ls_file_name),1,7 ),3), RIGHT(substring(LTRIM(:ls_file_name),1,6 ),3))  ;
			 
		IF   Len(s_country_populate) > 0 THEN
			ddlb_country.setselectedid(s_country_populate)	
			s_country = s_country_populate
		END IF
	END IF
END IF


if s_country = 'USA' THEN
	ddlb_state.enabled = true
ELSE
	ddlb_state.enabled = false
END IF

LONG l_filas
l_filas = dw_documents.Retrieve(ls_id_sender_global)

l_filas = l_filas


end subroutine

public subroutine fn_loadfax (string ls_filepath);// Loads the fax file!
ole_fax1.SetRedraw(false)

ll_curpage = 1

if (right(ls_filepath,3) = 'tif' or right(ls_filepath,3) = 'pdf' or right(ls_filepath,3) = 'iff' ) then  
	ole_fax1.object.LoadMultiPage(ls_filepath,1)
else
	ole_fax1.object.FileName = ls_filepath
end if

st_res.text = String(ole_fax1.object.Xdpi) + 'x'+String(ole_fax1.object.Ydpi)

ole_fax1.SetRedraw(true)

ole_fax1.object.MouseTrackMode = 1
end subroutine

public subroutine fn_listar_faxes ();integer li_items, li_row, li_i, li_review_status
Long ll_id_sender
string  ls_filename, ls_sender_global
DateTime ld_expiration

dw_faxes.SetRedraw(FALSE)

lb_faxes.DirList(is_faxpath + "*.*", 0)
sle_selected.text = "[No Fax Selected]"

ls_sender_global = sle_globalsender.text

dw_faxes.Reset()

li_items = lb_faxes.TotalItems()
For li_i = 1 To li_items
	li_row = dw_faxes.InsertRow(0)
	dw_faxes.object.file_name[li_row] = lb_faxes.Text( li_i ) 
	
	ls_filename = dw_faxes.object.file_name[li_row]
	
	setNull(ll_id_sender)
	setNull(ld_expiration)
	
	li_review_status = -2 //estado por defecto ID Sin registro en SENDER_ID
	
	SELECT ID_SENDER_ID, ID_REVIEW_STATUS, EXPIRATION_DATE
	INTO :ll_id_sender, :li_review_status, :ld_expiration
	FROM dba.SENDER_ID
	WHERE ID_SENDER_GLOBAL = :ls_sender_global
		AND FILE_NAME_ = :ls_filename;
		
	IF SQLCA.SQLCODE = 0 THEN
		IF li_review_status = 1 AND date(Today()) >= date(ld_expiration) THEN
			li_review_status = 2
		END IF 
	ELSEIF li_review_status = -2 AND Pos(ls_filename, "REJECT") = 1 THEN
		li_review_status = -1
	END IF

	dw_faxes.object.status[li_row] = li_review_status
Next

dw_faxes.SetRedraw(TRUE)
end subroutine

public subroutine fn_procesar (string as_tipo);
end subroutine

public subroutine fn_save_id (string action);string ls_ext, ls_rejection, ls_faxname, ls_newfaxname, ls_country, ls_state
int li_status, li_rejection, li_row
boolean lb_update_file, lb_insertar_sender_id

li_row = dw_faxes.GetSelectedRow(0)

// Moviendo el Fax a la carpeta deseada
if sle_selected.text = "[No Fax Selected]" then
	RETURN
end if

String ls_number_id, ls_expiration_date, ls_id_type
String ls_id_sender_global

ls_id_sender_global = sle_globalsender.text
ls_id_type = lst_id_type.getdataid()
ls_number_id = txt_number_id.text
ls_expiration_date = txt_expiration_date.text

ls_faxname = sle_selected.text
ls_newfaxname = sle_newname.text
ls_country =  ddlb_country.getdataid()
ls_state =  ddlb_state.getdataid()



IF ls_country = '' THEN
	ddlb_country.setselectedid('')
	messageBox('Advertencia','You must select a country')
	RETURN
END IF	

IF ls_country = 'USA' and  ls_state = '' and ls_id_type <> 'PA'  THEN
	ddlb_state.setselectedid('')
	messageBox('Advertencia','You must select a state')
	RETURN
END IF

ls_ext = fn_get_file_ext(ls_faxname)

if isnull(ls_newfaxname) or len(trim(ls_newfaxname)) < 1 then 
	ls_newfaxname = ls_faxname
	sle_newname.text = ls_newfaxname
end if

ls_newfaxname = upper(ls_newfaxname)		
ls_newfaxname = fn_replace(ls_newfaxname,upper(ls_ext),'')

If IsNull(is_id_sender_id) then		
	lb_insertar_sender_id = true
	
	IF action = "VALIDATE" THEN
		if NOT fn_validaciones() THEN return
		
		li_status = 1
		
		IF pos(ls_faxname, 'REJECTED') > 0 THEN
			ls_newfaxname = mid(ls_newfaxname, 10, len(ls_newfaxname))
		END IF
	ELSEIF action = "REJECT" THEN
		IF pos(ls_faxname, 'REJECTED') = 0 THEN
			ls_newfaxname = "REJECTED_" + ls_newfaxname
		END IF
		li_status = -1
		lb_insertar_sender_id = false
	ELSE
		if NOT fn_validaciones() THEN return
		
		li_status = 1
		IF pos(ls_faxname, 'REJECTED') > 0 THEN
			li_status = -1
		END IF
	END IF
	
	if messagebox("Confirm","Are you sure that your want to save this Document as "+sle_newname.text+"?",Question!,YesNo!) <> 1 Then
		return
	end if
	
	if FileExists(is_faxpath+ls_faxname) and (upper(trim(is_faxpath+ls_faxname)) <> upper(trim(is_faxpath+ls_newfaxname+ls_ext))) then
		
		if FileExists(is_faxpath+ls_newfaxname+ls_ext) then
			Messagebox("Error","The destination file already exists, please select a diferent name.",StopSign!)
			return
		end if
		
		ole_fax1.object.FileName = ""
					
		fn_filemove(is_faxpath+ls_faxname,is_faxpath+ls_newfaxname+ls_ext)										
		
		if fileexists(is_faxpath+ls_faxname) then
			filedelete(is_faxpath+ls_faxname)
		end if
	end if
	
	IF lb_insertar_sender_id THEN
		INSERT INTO DBA.SENDER_ID (
				ID_SENDER_GLOBAL,
				FILE_NAME_,
				ID_TYPE_ID,
				NUMBER_ID,
				EXPIRATION_DATE,
				FILE_PATH,
				DB_USER_CREATED,
				ID_REVIEW_STATUS	,
				ID_STATE_ISSUER_ID,
				ID_COUNTRY_ISSUER_ID
				) VALUES(		
				:ls_id_sender_global,
				:ls_newfaxname+:ls_ext,
				:ls_id_type,
				:ls_number_id,
				:ls_expiration_date,
				:is_faxpath+:ls_newfaxname+:ls_ext,
				upper(SYSTEM_USER),
				:li_status,
				:ls_state,
				:ls_country );
			
		if SQLCA.SQLCODE <> 0 then
			MessageBox("Error","Error Updating Document Data."+char(10)+SQLCA.SQLErrText,StopSign!)
			Return
		else
			MessageBox("Completed","Document Data Updated")
		end if
	end if
else
	setNull(li_status)
	setNull(li_rejection)
	lb_update_file = false
	
	IF action = 'VALIDATE' THEN
		li_status = 1
		
		IF pos(ls_faxname, 'REJECTED') > 0 THEN
			ls_newfaxname = mid(ls_faxname, 10, len(ls_faxname))
			
			ole_fax1.object.FileName = ""
			
			fn_filemove(is_faxpath+ls_faxname,is_faxpath+ls_newfaxname+ls_ext)										
			
			if fileexists(is_faxpath+ls_faxname) then
				filedelete(is_faxpath+ls_faxname)
			end if
			
			lb_update_file = true
		END IF
	ELSEIF action = 'REJECT' THEN	
		li_status = -1
		ls_rejection = tab_rejection.tp.ddlb_rej_codes.text
		
		IF ls_rejection = '' THEN 
			 messagebox("Error","Must choose a Rejection Type",StopSign!)
			 return
		END IF
		
		IF pos(ls_newfaxname, 'REJECTED') = 0 THEN
			ls_newfaxname = "REJECTED_" + ls_newfaxname
			
			ole_fax1.object.FileName = ""
			
			fn_filemove(is_faxpath+ls_faxname,is_faxpath+ls_newfaxname+ls_ext)										
			
			if fileexists(is_faxpath+ls_faxname) then
				filedelete(is_faxpath+ls_faxname)
			end if
			
			lb_update_file = true
		END IF
		
		li_rejection = integer(mid(ls_rejection, 1, 1))
	END IF
	
	DECLARE spUpdateSenderId PROCEDURE FOR dba.spUpdateSenderId
		@p_ID_SENDER_ID = :is_id_sender_id,
		@p_NEW_ID_TYPE_ID = :ls_id_type,
		@p_NEW_NUMBER_ID = :ls_number_id,
		@p_NEW_EXPIRATION_DATE = :ls_expiration_date,
		@p_NEW_STATUS_ID  = :li_status,
		@p_NEW_ID_REVIEW_REJECTION_CODE = :li_rejection,
		@P_ID_STATE_ISSUER_ID = :ls_state,
		@P_ID_COUNTRY_ISSUER_ID =:ls_country ;
		
		Execute spUpdateSenderId; 
		
		if SQLCA.SQLCODE <> 100 then
			MessageBox("Error","Error Updating Document Data."+char(10)+SQLCA.SQLErrText,StopSign!)
			Return
		else
			if lb_update_file then
				UPDATE DBA.SENDER_ID 
				SET FILE_NAME_ = :ls_newfaxname, FILE_PATH = :is_faxpath + :ls_newfaxname + :ls_ext
				WHERE ID_SENDER_ID = :is_id_sender_id;
				
				if SQLCA.SQLCODE <> 0 then
					MessageBox("Error","Error Updating Document Data."+char(10)+SQLCA.SQLErrText,StopSign!)
					Return
				end if
			end if
			
			MessageBox("Completed","Document Data Updated")			
		end if

	Close spUpdateSenderId;
	
	sle_newname.enabled = false
	
	tab_rejection.visible = false
	tab_rejection.tp.ddlb_rej_codes.SelectItem(0)

end if


// -------------------------------------------------------	
// Refresh maintianing the previously selected item
String ls_selected	
Integer li_pos
//ls_selected = lb_faxes.SelectedItem()
ls_selected = ls_newfaxname + ls_ext

cb_refresh.TriggerEvent(Clicked!)

if fileexists(is_faxpath+ls_selected) then
		
	li_pos = lb_faxes.SelectItem( ls_selected,0 ) 
	fn_selectitem()	
	ole_fax1.object.View=10	
	
	dw_faxes.SelectRow(0, false)
	dw_faxes.SelectRow(li_row, true)

end if
// Refresh maintianing the previously selected item
// -------------------------------------------------------


//ole_fax1.object.FileName = ""
//lb_faxes.DirList(is_faxpath + "*.TIF", 0)
	


//
//// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//// Cleaning Screen
//sle_pos.TextColor	= RGB(0,0,0)
//sle_pos.text = "1/1"
//sle_selected.text = "[No Fax Selected]"
//sle_newname.text = ""
//ole_fax1.object.FileName = ""
//// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end subroutine

public function boolean fn_validaciones ();String ls_number_id, ls_expiration_date, ls_id_type

ls_id_type = lst_id_type.getdataid()
ls_number_id = txt_number_id.text
ls_expiration_date = txt_expiration_date.text

if ls_id_type = "NN" then		
	Messagebox("Error","Please select and ID TYPE (None is not a valid ID Type).",StopSign!)
	return	 false	
end if

if ls_number_id = "" or len(ls_number_id) < 5 then		
	Messagebox("Error","Please Enter an ID Number (it has to be larger than 5 characters).",StopSign!)
	return	 false
end if

if ls_expiration_date = "" or ls_expiration_date = "00/00/0000" then		
	Messagebox("Error","Please Enter an Expiration Date.",StopSign!)
	return	 false
end if	

// Dont allow to store IDs that expired more than 20 years ago or more than 80 in the future
// Expired IDs are allowed to be saved for history

Date ls_from, ls_to
ls_from = relativedate(today(),(-365*20))
ls_to = relativedate(today(),(365*80))
	
if (date(ls_expiration_date) < ls_from or date(ls_expiration_date) > ls_to) then
	Messagebox("Error","Please enter a valid Expiration Date.",StopSign!)
	return	 false					
end if 

// Dont allow to store IDs that expired more than 20 years ago
// Expired IDs are allowed to be saved for history
if date(ls_expiration_date) < relativedate(today(),30) then
	Messagebox("Alert","You are storing an Document that already expire or will expire soon.",Exclamation!)						
end if 

return true
end function

public function string fn_quitar_caracteres_especiales (string as_cadena);long ll_i,ll_mid
string ls_char, ls_cad
ll_mid = len(as_cadena)
for ll_i = 1 to ll_mid
	ls_char = mid(as_cadena ,ll_i,1)
	if (Asc(ls_char) > 64 and Asc(ls_char) < 91) OR (Asc(ls_char) > 96 and Asc(ls_char) < 123) OR (Asc(ls_char) > 47 and Asc(ls_char) < 58 ) then
		ls_cad += ls_char
	end if
next
return ls_cad
end function

public subroutine fn_load_kyc_form ();//is_faxparms = fn_getbranchfaxcommand(is_id_branch,"KYC - "+is_id_branch+"-"+String(id_id_receiver))
string ls_kyc_version, ls_branch
long ll_len_ver, ll_len_branch
double ld_receiver, ld_sender_global
LONG li_kyc_id, li_version

ls_kyc_version = ddlb_kyc_documents.getdatavalue()

li_version = integer(mid(ls_kyc_version, pos(ls_kyc_version,"_v") + 2, len(ls_kyc_version)))
ll_len_ver = len(string(li_version)) + 2

ls_branch = mid(ls_kyc_version, 1, pos(ls_kyc_version,"_") - 1)
ll_len_branch = len(ls_branch)

ld_receiver = double(mid(ls_kyc_version, pos(ls_kyc_version,"_") + 1,  len(ls_kyc_version) - ll_len_ver - ll_len_branch - 1))

ld_sender_global = double(sle_globalsender.text)

SELECT  ID_KYC_SENDER
INTO :li_kyc_id
FROM dba.KYC_SENDER 
WHERE ID_SENDER_GLOBAL = :ld_sender_global
	 AND id_branch = :ls_branch AND  id_receiver = :ld_receiver AND KYC_VERSION = :li_version;

dw_kyc_data.retrieve(li_kyc_id)

if not fileexists(is_kycfilepath) then
	if fn_getlang() = 'EN' then
		Messagebox("Error Missing " +is_kycfile,"Missing KYC TIF file, please conduct a trasmission and try again. If you see the error again please contact customer support.",StopSign!)
	else
		Messagebox("Error Archivo" + is_kycfile,"No se ha encontrado el archivo TIF del KYC, por favor haga una transmisión e intente de nuevo. Si el problema persiste por favor contacte a soporte técnico.",StopSign!)
	end if
	close(this)
	return
	
end if

if fn_getlang() = 'EN' then
	this.title = "KYC Form ("+is_kycfile+")"
else
	this.title = "Forma KYC ("+is_kycfile+")"
end if

ole_fax1.object.LoadMultiPage(is_kycfilepath,1)

ole_fax1.object.TextFontSize = 12

// TextFontStyle
//0 - regular
//1 - bold 
//2 - italic
//3 - bolditalic
//4 - underline
ole_fax1.object.TextFontStyle = 1

if not fileexists(is_kycfilepath) then
	return
end if

String ls_name_cashier

SELECT rtrim(add_cashier)
into :ls_name_cashier
FROM dba.cashier
WHERE id_cashier = :gs_cashier;

ls_name_cashier = ls_name_cashier + " (VIAMERICAS)"

String ls_fieldname, ls_dw, ls_dwcolumn, ls_value
Double ld_x, ld_y

DECLARE cur_formfields CURSOR FOR  
SELECT FIELDNAME, DW, DW_COLUMN, X_POS, Y_POS
FROM dba.FORM_MAPPING  
WHERE FORMNAME = :is_kycfile;

open cur_formfields;

FETCH cur_formfields INTO :ls_fieldname, :ls_dw, :ls_dwcolumn, :ld_x, :ld_y;

DO WHILE SQLCA.SQLCODE = 0
	
	ls_value = ""
	ole_fax1.object.TextColor = RGB(0,0,80)
	
	if ls_dwcolumn = "name_sender" then ls_dwcolumn = "kyc_sender_name_sender"
	
	if ls_dwcolumn = "num_id_sender" then ls_dwcolumn = "kyc_sender_num_id_sender"
	
	if ls_dw = "dw_kyc_data" then
		ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),ls_dwcolumn)	
	elseif ls_dw = "variable" then
		if ls_dwcolumn = "agent_signature" or ls_dwcolumn = "cashier_name" then
			ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),'receiver_branch_name_cashier' )
			
			if isnull(ls_value) or ls_value = '' then
				ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),'receiver_branch_cashier' )
			end if
		end if
	
		if ls_dwcolumn = "sender_signature" then
			ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),'kyc_sender_name_sender' )
		end if
	elseif ls_dw = "static" then
		ole_fax1.object.TextColor = RGB(100,0,0)
		
		if ls_fieldname = 'legend1' then
			ls_value = '- KYC COMPLETED USING VIACASH -'
		else
			ls_value = ls_dwcolumn;
		end if
	end if
	
	if ls_value <> "" then
		ole_fax1.object.DrawText(ld_x,ld_y,ls_value,true)
	end if
	
				
	FETCH cur_formfields INTO :ls_fieldname, :ls_dw, :ls_dwcolumn, :ld_x, :ld_y;
LOOP;

close cur_formfields;



end subroutine

public subroutine fn_habilitar_kyc (boolean ab_habilitar_kyc);boolean lb_habilitar_ids

lb_habilitar_ids = NOT ab_habilitar_kyc

cb_export_kyc.Enabled = ab_habilitar_kyc
cbx_all_versions.Enabled = ab_habilitar_kyc

IF ab_habilitar_kyc THEN
	ole_fax1.object.FileName = ""
	dw_faxes.SelectRow(0, false)
	fn_load_kyc_form()
	
	if cbx_all_versions.checked then
		cb_edit_kyc.Enabled = false 
	else
		cb_edit_kyc.Enabled = true 
	end if
ELSE
	ddlb_kyc_documents.setselectedid("--")
END IF

lst_id_type.Enabled = lb_habilitar_ids
txt_number_id.Enabled = lb_habilitar_ids
txt_expiration_date.Enabled = lb_habilitar_ids
sle_newname.Enabled = lb_habilitar_ids

cb_rename.Enabled = lb_habilitar_ids
cb_compliance.Enabled = lb_habilitar_ids
cb_rejpop.Enabled = lb_habilitar_ids



end subroutine

public subroutine fn_retrieve_kyc_docs ();string ls_query, ls_sender_global

ls_sender_global = sle_globalsender.text

if cbx_all_versions.checked then
	ls_query = "SELECT  rtrim(id_branch) + '_' + convert(varchar,id_receiver) + '_v' + convert(varchar,kyc_version), " +&
				   " rtrim(id_branch) + '_' + convert(varchar,id_receiver) + '_v' + convert(varchar,kyc_version) " +&
	 			   " FROM dba.KYC_SENDER WHERE ID_SENDER_GLOBAL = "+ls_sender_global+" ORDER BY id_receiver, kyc_version desc;"
	cb_edit_kyc.Enabled = false 
else
	ls_query = "SELECT  rtrim(id_branch) + '_' + convert(varchar,id_receiver) + '_v' + convert(varchar,MAX(KYC_VERSION)), " +&  
				   "  rtrim(id_branch) + '_' + convert(varchar,id_receiver) + '_v' + convert(varchar,MAX(KYC_VERSION)) " +&  
				  "FROM dba.KYC_SENDER WHERE ID_SENDER_GLOBAL = "+ls_sender_global+" GROUP BY id_branch, id_receiver"
end if

ddlb_kyc_documents.addqueryad(ls_query)

ole_fax1.object.FileName = ""


end subroutine

on w_faxcomponent_senderids.create
int iCurrent
call super::create
this.sle_globalsender=create sle_globalsender
this.sle_names=create sle_names
this.sle_lastnames=create sle_lastnames
this.st_8=create st_8
this.st_9=create st_9
this.lst_id_type=create lst_id_type
this.st_10=create st_10
this.txt_number_id=create txt_number_id
this.txt_expiration_date=create txt_expiration_date
this.st_11=create st_11
this.st_12=create st_12
this.cb_copy_ocr=create cb_copy_ocr
this.dw_faxes=create dw_faxes
this.st_verified=create st_verified
this.st_no_verified=create st_no_verified
this.st_expired=create st_expired
this.st_rejected=create st_rejected
this.cb_compliance=create cb_compliance
this.cb_rejpop=create cb_rejpop
this.st_tooltip_assign_sender=create st_tooltip_assign_sender
this.r_no_data=create r_no_data
this.r_verified=create r_verified
this.r_no_verified=create r_no_verified
this.r_expired=create r_expired
this.r_rejected=create r_rejected
this.cb_rename=create cb_rename
this.tab_rejection=create tab_rejection
this.st_no_data=create st_no_data
this.dw_kyc_data=create dw_kyc_data
this.st_13=create st_13
this.ddlb_kyc_documents=create ddlb_kyc_documents
this.cb_edit_kyc=create cb_edit_kyc
this.cb_export_kyc=create cb_export_kyc
this.cb_1=create cb_1
this.cbx_all_versions=create cbx_all_versions
this.st_14=create st_14
this.st_15=create st_15
this.ddlb_country=create ddlb_country
this.ddlb_state=create ddlb_state
this.pb_1=create pb_1
this.dw_documents=create dw_documents
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_globalsender
this.Control[iCurrent+2]=this.sle_names
this.Control[iCurrent+3]=this.sle_lastnames
this.Control[iCurrent+4]=this.st_8
this.Control[iCurrent+5]=this.st_9
this.Control[iCurrent+6]=this.lst_id_type
this.Control[iCurrent+7]=this.st_10
this.Control[iCurrent+8]=this.txt_number_id
this.Control[iCurrent+9]=this.txt_expiration_date
this.Control[iCurrent+10]=this.st_11
this.Control[iCurrent+11]=this.st_12
this.Control[iCurrent+12]=this.cb_copy_ocr
this.Control[iCurrent+13]=this.dw_faxes
this.Control[iCurrent+14]=this.st_verified
this.Control[iCurrent+15]=this.st_no_verified
this.Control[iCurrent+16]=this.st_expired
this.Control[iCurrent+17]=this.st_rejected
this.Control[iCurrent+18]=this.cb_compliance
this.Control[iCurrent+19]=this.cb_rejpop
this.Control[iCurrent+20]=this.st_tooltip_assign_sender
this.Control[iCurrent+21]=this.r_no_data
this.Control[iCurrent+22]=this.r_verified
this.Control[iCurrent+23]=this.r_no_verified
this.Control[iCurrent+24]=this.r_expired
this.Control[iCurrent+25]=this.r_rejected
this.Control[iCurrent+26]=this.cb_rename
this.Control[iCurrent+27]=this.tab_rejection
this.Control[iCurrent+28]=this.st_no_data
this.Control[iCurrent+29]=this.dw_kyc_data
this.Control[iCurrent+30]=this.st_13
this.Control[iCurrent+31]=this.ddlb_kyc_documents
this.Control[iCurrent+32]=this.cb_edit_kyc
this.Control[iCurrent+33]=this.cb_export_kyc
this.Control[iCurrent+34]=this.cb_1
this.Control[iCurrent+35]=this.cbx_all_versions
this.Control[iCurrent+36]=this.st_14
this.Control[iCurrent+37]=this.st_15
this.Control[iCurrent+38]=this.ddlb_country
this.Control[iCurrent+39]=this.ddlb_state
this.Control[iCurrent+40]=this.pb_1
this.Control[iCurrent+41]=this.dw_documents
end on

on w_faxcomponent_senderids.destroy
call super::destroy
destroy(this.sle_globalsender)
destroy(this.sle_names)
destroy(this.sle_lastnames)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.lst_id_type)
destroy(this.st_10)
destroy(this.txt_number_id)
destroy(this.txt_expiration_date)
destroy(this.st_11)
destroy(this.st_12)
destroy(this.cb_copy_ocr)
destroy(this.dw_faxes)
destroy(this.st_verified)
destroy(this.st_no_verified)
destroy(this.st_expired)
destroy(this.st_rejected)
destroy(this.cb_compliance)
destroy(this.cb_rejpop)
destroy(this.st_tooltip_assign_sender)
destroy(this.r_no_data)
destroy(this.r_verified)
destroy(this.r_no_verified)
destroy(this.r_expired)
destroy(this.r_rejected)
destroy(this.cb_rename)
destroy(this.tab_rejection)
destroy(this.st_no_data)
destroy(this.dw_kyc_data)
destroy(this.st_13)
destroy(this.ddlb_kyc_documents)
destroy(this.cb_edit_kyc)
destroy(this.cb_export_kyc)
destroy(this.cb_1)
destroy(this.cbx_all_versions)
destroy(this.st_14)
destroy(this.st_15)
destroy(this.ddlb_country)
destroy(this.ddlb_state)
destroy(this.pb_1)
destroy(this.dw_documents)
end on

event open;call super::open;String  ls_sender_global, ls_names, ls_lastnames
Double ld_sender_global

ls_sender_global = message.stringparm


//Messagebox("open",ls_sender_global)


ls_sender_global = mid(ls_sender_global, lastpos(ls_sender_global,'\')+1)

sle_globalsender.text = ls_sender_global

ld_sender_global = double(ls_sender_global)

SELECT TOP 1 rtrim(rtrim(sen_fname) + ' ' +isnull(sen_mname,'')),
rtrim(rtrim(sen_lname) + ' ' +isnull(sen_slname,''))
INTO  :ls_names, 
:ls_lastnames
FROM dba.sender WITH (NOLOCK)
WHERE id_sender_global = :ld_sender_global;

sle_names.text = ls_names
sle_lastnames.text = ls_lastnames

is_faxpath = "U:\Compliance\Processed\Senders\"+ls_sender_global+"\"

fn_listar_faxes()

tab_rejection.visible = false

SELECT stringvalue
INTO :is_kycfile
FROM dba.PARAMETERS
WHERE idparameter = 'KYC_VERSION'; 

is_kycfilepath = "C:\ViamericasMT\Forms\"+is_kycfile+"exp.tif"

fn_retrieve_kyc_docs()

cb_edit_kyc.Enabled = false
cb_export_kyc.Enabled = false
dw_documents.SetTransObject(SQLCA)
end event

event resize;call super::resize;ole_fax1.Height = this.Height - 360
ole_fax1.Width = this.Width - 1300

cb_ok.x = this.Width - (3593 - 3045) - 10
cb_ok.y = this.Height - (2280 - 2052) - 13

r_no_data.y = this.Height -  230
st_no_data.y = this.Height - 230

r_verified.y = this.Height -  230
st_verified.y = this.Height -  230

r_no_verified.y = this.Height -  230
st_no_verified.y = this.Height - 230

r_expired.y = this.Height - 230
st_expired.y = this.Height - 230

r_rejected.y = this.Height - 230
st_rejected.y = this.Height - 230
end event

event mousemove;call super::mousemove;st_tooltip_assign_sender.text = ''
end event

type cb_rotate180 from w_faxcomponent`cb_rotate180 within w_faxcomponent_senderids
integer x = 1655
end type

type pb_duplicate_page from w_faxcomponent`pb_duplicate_page within w_faxcomponent_senderids
integer x = 3653
end type

type st_res from w_faxcomponent`st_res within w_faxcomponent_senderids
integer x = 3319
end type

type sle_id_branch from w_faxcomponent`sle_id_branch within w_faxcomponent_senderids
boolean visible = false
integer x = 846
integer y = 204
integer taborder = 0
end type

type st_5 from w_faxcomponent`st_5 within w_faxcomponent_senderids
integer x = 2176
end type

type pb_separate from w_faxcomponent`pb_separate within w_faxcomponent_senderids
integer x = 3776
end type

type pb_print from w_faxcomponent`pb_print within w_faxcomponent_senderids
integer x = 3899
end type

event pb_print::clicked;IF ddlb_kyc_documents.getdataid() = "--" THEN 
	TRY
	
		if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
			MessageBox("Error","The file was already moved",StopSign!)
			cb_refresh.triggerEvent(Clicked!)
			return
		end if
	
		ole_fax1.object.PrintImage(true)
	
	CATCH (runtimeerror er)   
	
		Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
		cb_refresh.TriggerEvent(Clicked!)
	
	FINALLY   
			
		Return
		
	END TRY 
ELSE
	Messagebox("Alert","Para imprimir debe exportar el archivo primero.",Exclamation!)
END IF
end event

type cb_refresh from w_faxcomponent`cb_refresh within w_faxcomponent_senderids
integer x = 1042
end type

event cb_refresh::clicked;call super::clicked;
lst_id_type.setselectedid("NN")	
txt_number_id.text = ""
txt_expiration_date.text = ""

sle_newname.enabled = true
cb_rename.text = 'Save ID'
txt_expiration_date.textColor = RGB(0,0,0)

fn_listar_faxes()



end event

type pb_previous from w_faxcomponent`pb_previous within w_faxcomponent_senderids
integer x = 2921
integer y = 12
end type

type pb_next from w_faxcomponent`pb_next within w_faxcomponent_senderids
integer x = 3200
integer y = 12
end type

type ole_fax1 from w_faxcomponent`ole_fax1 within w_faxcomponent_senderids
event pfc_copy ( )
integer x = 1193
integer y = 108
integer width = 2825
integer height = 1624
end type

event ole_fax1::selectionrectdrawn;call super::selectionrectdrawn;il_txtleft = iLeft
il_txttop = iTop
il_txtfilewidth= iWidth
il_txtfileheight = iHeight

cb_copy_ocr.enabled = true

end event

event ole_fax1::mouseup;call super::mouseup;//cb_copy_ocr.post event clicked( )

long ll_val, ll_tval
boolean lbl_valor

//TRY
	if ole_fax1.object.MouseTrackMode <> 1 then return
	
	lbl_valor = false
	ls_data = ''
	setpointer(hourglass!)
	ole_fax1.object.OCRRecognizeMode=1
	ole_fax1.object.OCRCharFilter = ""
	ole_fax1.object.OCRSetRect(il_txtleft, il_txttop, il_txtfilewidth, il_txtfileheight)
	ole_fax1.object.OCRScanTextAsync (lbl_valor)
	
	try 
		ll_val = long(ole_fax1.object.OCRStartScan(0, "dictfiles"))
	CATCH (OLERuntimeError oe)   
		setpointer(arrow!)
		MessageBox("Runtime Error", oe.GetMessage())
//		MessageBox("Runtime Error1","")
		return
	END TRY 	
	
	
	If ll_val = -3 Then
		MessageBox('',"Please select image first")
		setpointer(arrow!)
		return 
	Else
		If ll_val <> 1 Then
			setpointer(arrow!)
			 return
		End If
		ls_data = trim(string(ole_fax1.object.OCRGetRecognizedText()),true)
	end if
		
	ll_tval = long(ole_fax1.object.OCRGetRecognizedCharCount())
	ole_fax1.object.OCRStopScan()
	
	setpointer(arrow!)	
	
	if  ll_tval  > 0 then 	
		txt_number_id.text = fn_quitar_caracteres_especiales(ls_data)
	//	im_popup = create m_oc
	//	im_popup.m_object.m_cut.visible = false
	//	im_popup.m_object.m_edit.visible = false
	//	im_popup.m_object.m_open.visible = false
	//	im_popup.m_object.m_paste.visible = false
	//	im_popup.m_object.m_copy.visible = false
	//	im_popup.m_object.m_dash11.text = '&Copy ---> '+ls_data
	//	im_popup.m_object.PopMenu(parent.PointerX(), parent.PointerY()) 
	//	clipboard(ls_data)
	//	destroy im_popup   	
	end if 
//CATCH (runtimeerror er)   
//	setpointer(arrow!)
////	MessageBox("Runtime Error", er.GetMessage())
//	MessageBox("Runtime Error2","")
//	return
//END TRY 	

end event

event ole_fax1::error;call super::error;action = ExceptionIgnore!

messagebox('error', errortext)
end event

type lb_faxes from w_faxcomponent`lb_faxes within w_faxcomponent_senderids
boolean visible = false
integer x = 1225
integer y = 520
integer width = 955
integer height = 532
integer taborder = 10
end type

type st_2 from w_faxcomponent`st_2 within w_faxcomponent_senderids
integer y = 708
string text = "IDs"
end type

type cb_ok from w_faxcomponent`cb_ok within w_faxcomponent_senderids
integer x = 3538
integer y = 1740
end type

type cb_rotateleft from w_faxcomponent`cb_rotateleft within w_faxcomponent_senderids
integer x = 1541
end type

type cb_rotateright from w_faxcomponent`cb_rotateright within w_faxcomponent_senderids
integer x = 1769
end type

type st_4 from w_faxcomponent`st_4 within w_faxcomponent_senderids
integer x = 1312
end type

type st_6 from w_faxcomponent`st_6 within w_faxcomponent_senderids
integer x = 2798
integer y = 32
end type

type sle_pos from w_faxcomponent`sle_pos within w_faxcomponent_senderids
integer x = 3026
integer y = 16
end type

type cb_move from w_faxcomponent`cb_move within w_faxcomponent_senderids
boolean visible = false
integer y = 1716
end type

type lb_folder from w_faxcomponent`lb_folder within w_faxcomponent_senderids
boolean visible = false
integer y = 172
integer taborder = 30
end type

type st_3 from w_faxcomponent`st_3 within w_faxcomponent_senderids
boolean visible = false
end type

type sle_selected from w_faxcomponent`sle_selected within w_faxcomponent_senderids
integer x = 270
integer y = 1496
integer width = 846
end type

type lb_movetofolder from w_faxcomponent`lb_movetofolder within w_faxcomponent_senderids
boolean visible = false
integer y = 1716
end type

type gb_3 from w_faxcomponent`gb_3 within w_faxcomponent_senderids
boolean visible = false
integer y = 1828
end type

type gb_1 from w_faxcomponent`gb_1 within w_faxcomponent_senderids
boolean visible = false
integer y = 1648
end type

type st_1 from w_faxcomponent`st_1 within w_faxcomponent_senderids
integer y = 1508
end type

type sle_newname from w_faxcomponent`sle_newname within w_faxcomponent_senderids
integer x = 270
integer y = 2020
integer width = 846
end type

type st_7 from w_faxcomponent`st_7 within w_faxcomponent_senderids
integer y = 2028
integer width = 238
string text = "File Name:"
end type

type sle_email from w_faxcomponent`sle_email within w_faxcomponent_senderids
boolean visible = false
integer y = 1904
end type

type cb_email from w_faxcomponent`cb_email within w_faxcomponent_senderids
boolean visible = false
integer y = 1904
end type

type gb_2 from w_faxcomponent`gb_2 within w_faxcomponent_senderids
integer x = 23
integer y = 1420
integer width = 1134
integer height = 828
string text = "Document Data"
end type

type htb_zoom from w_faxcomponent`htb_zoom within w_faxcomponent_senderids
integer x = 2313
end type

type sle_globalsender from singlelineedit within w_faxcomponent_senderids
integer x = 18
integer y = 112
integer width = 1134
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_names from singlelineedit within w_faxcomponent_senderids
integer x = 18
integer y = 264
integer width = 1134
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_lastnames from singlelineedit within w_faxcomponent_senderids
integer x = 18
integer y = 352
integer width = 1134
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_faxcomponent_senderids
string tag = "ole_fax1.object.FileName = ~"~""
integer x = 27
integer y = 56
integer width = 343
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
string text = "ViaSender"
boolean focusrectangle = false
end type

type st_9 from statictext within w_faxcomponent_senderids
string tag = "ole_fax1.object.FileName = ~"~""
integer x = 27
integer y = 208
integer width = 562
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
string text = "Sender Name / LastName"
boolean focusrectangle = false
end type

type lst_id_type from my_ddlb within w_faxcomponent_senderids
integer x = 270
integer y = 1584
integer width = 846
integer height = 1004
integer taborder = 0
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;lst_id_type.addquery("select name_type_id_sender, id_type_id_sender from dba.type_id_sender where active = 1 order by name_type_id_sender;")
end event

type st_10 from statictext within w_faxcomponent_senderids
integer x = 41
integer y = 1596
integer width = 219
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
string text = "ID Type:"
boolean focusrectangle = false
end type

type txt_number_id from singlelineedit within w_faxcomponent_senderids
integer x = 270
integer y = 1672
integer width = 846
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type txt_expiration_date from editmask within w_faxcomponent_senderids
integer x = 270
integer y = 1756
integer width = 315
integer height = 80
boolean bringtotop = true
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

event modified;
if date(this.text) < RelativeDate(today(),5) then
	this.textColor = RGB(255,0,0)
elseif date(this.text) < RelativeDate(today(),30) then
	this.textColor = RGB(255,200,0)
else
	this.textColor = RGB(0,0,0)
end if

end event

type st_11 from statictext within w_faxcomponent_senderids
integer x = 41
integer y = 1688
integer width = 215
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
string text = "ID #:"
boolean focusrectangle = false
end type

type st_12 from statictext within w_faxcomponent_senderids
integer x = 41
integer y = 1772
integer width = 229
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
string text = "Exp Date:"
boolean focusrectangle = false
end type

type cb_copy_ocr from commandbutton within w_faxcomponent_senderids
boolean visible = false
integer x = 1902
integer y = 8
integer width = 238
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copy txt"
end type

type dw_faxes from datawindow within w_faxcomponent_senderids
integer x = 18
integer y = 764
integer width = 1134
integer height = 532
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "de_faxes"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event clicked;long ll_row

ll_row = this.GetClickedRow()

if ll_row <> 0 then
	SelectRow(0, FALSE)
	SelectRow(ll_row, TRUE)
	SetRow(ll_row)
	
	lb_faxes.SelectItem(ll_row)
	lb_faxes.EVENT SelectionChanged(ll_row)
	
	fn_habilitar_kyc(false)
end if
end event

type st_verified from statictext within w_faxcomponent_senderids
integer x = 695
integer y = 2336
integer width = 201
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Verified"
boolean focusrectangle = false
end type

type st_no_verified from statictext within w_faxcomponent_senderids
integer x = 1056
integer y = 2336
integer width = 471
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Verified (ViaOne)"
boolean focusrectangle = false
end type

type st_expired from statictext within w_faxcomponent_senderids
integer x = 1714
integer y = 2336
integer width = 242
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Expired"
boolean focusrectangle = false
end type

type st_rejected from statictext within w_faxcomponent_senderids
integer x = 2075
integer y = 2336
integer width = 425
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rejected"
boolean focusrectangle = false
end type

type cb_compliance from commandbutton within w_faxcomponent_senderids
event mousemove pbm_mousemove
string tag = "Marks as verified and send file to sender folder"
integer x = 402
integer y = 2152
integer width = 343
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Validate"
end type

event mousemove;st_tooltip_assign_sender.text = "Marks file as verified"
end event

event clicked;fn_save_id("VALIDATE")
end event

type cb_rejpop from commandbutton within w_faxcomponent_senderids
event mousemove pbm_mousemove
string tag = "Marks as rejected and send file to sender folder"
integer x = 763
integer y = 2152
integer width = 352
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reject"
end type

event mousemove;st_tooltip_assign_sender.text = "Marks file as rejected"
end event

event losefocus;st_tooltip_assign_sender.text = ""
end event

event clicked; If IsNull(is_id_sender_id) then
	tab_rejection.Visible = false
	fn_save_id("REJECT")
else
	tab_rejection.Visible = true
end if
end event

type st_tooltip_assign_sender from statictext within w_faxcomponent_senderids
integer x = 37
integer y = 2248
integer width = 1102
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type r_no_data from rectangle within w_faxcomponent_senderids
integer linethickness = 4
long fillcolor = 16777215
integer x = 50
integer y = 2336
integer width = 55
integer height = 48
end type

type r_verified from rectangle within w_faxcomponent_senderids
integer linethickness = 4
long fillcolor = 32768
integer x = 622
integer y = 2336
integer width = 55
integer height = 48
end type

type r_no_verified from rectangle within w_faxcomponent_senderids
integer linethickness = 4
long fillcolor = 65535
integer x = 987
integer y = 2336
integer width = 55
integer height = 48
end type

type r_expired from rectangle within w_faxcomponent_senderids
integer linethickness = 4
long fillcolor = 16810239
integer x = 1641
integer y = 2336
integer width = 55
integer height = 48
end type

type r_rejected from rectangle within w_faxcomponent_senderids
integer linethickness = 4
long fillcolor = 255
integer x = 2007
integer y = 2336
integer width = 55
integer height = 48
end type

type cb_rename from commandbutton within w_faxcomponent_senderids
event mousemove pbm_mousemove
integer x = 32
integer y = 2152
integer width = 352
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save ID"
end type

event mousemove;st_tooltip_assign_sender.text = "Saves the Id information"
end event

event clicked;fn_save_id("SAVE")
end event

type tab_rejection from tab within w_faxcomponent_senderids
integer x = 1198
integer y = 1348
integer width = 663
integer height = 356
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean focusonbuttondown = true
boolean showtext = false
integer selectedtab = 1
tp tp
end type

on tab_rejection.create
this.tp=create tp
this.Control[]={this.tp}
end on

on tab_rejection.destroy
destroy(this.tp)
end on

type tp from userobject within tab_rejection
integer x = 18
integer y = 48
integer width = 626
integer height = 292
long backcolor = 80269524
string text = "none"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_reject cb_reject
cb_rejcancel cb_rejcancel
st_18 st_18
ddlb_rej_codes ddlb_rej_codes
end type

on tp.create
this.cb_reject=create cb_reject
this.cb_rejcancel=create cb_rejcancel
this.st_18=create st_18
this.ddlb_rej_codes=create ddlb_rej_codes
this.Control[]={this.cb_reject,&
this.cb_rejcancel,&
this.st_18,&
this.ddlb_rej_codes}
end on

on tp.destroy
destroy(this.cb_reject)
destroy(this.cb_rejcancel)
destroy(this.st_18)
destroy(this.ddlb_rej_codes)
end on

type cb_reject from commandbutton within tp
integer x = 329
integer y = 192
integer width = 261
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reject"
end type

event clicked;fn_save_id("REJECT")
end event

type cb_rejcancel from commandbutton within tp
integer x = 14
integer y = 192
integer width = 288
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;tab_rejection.visible = false
tab_rejection.tp.ddlb_rej_codes.SelectItem(0)
end event

type st_18 from statictext within tp
integer x = 14
integer y = 12
integer width = 416
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rejection Type"
boolean focusrectangle = false
end type

type ddlb_rej_codes from dropdownlistbox within tp
integer x = 23
integer y = 84
integer width = 553
integer height = 208
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
string item[] = {"1. FAKE ID","2. BAD QUALITY"}
end type

type st_no_data from statictext within w_faxcomponent_senderids
integer x = 110
integer y = 2336
integer width = 416
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Document Data"
boolean focusrectangle = false
end type

type dw_kyc_data from datawindow within w_faxcomponent_senderids
boolean visible = false
integer x = 2322
integer y = 484
integer width = 1394
integer height = 932
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_kyc_sender_version"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type st_13 from statictext within w_faxcomponent_senderids
integer x = 23
integer y = 484
integer width = 352
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
string text = "KYC Documents"
boolean focusrectangle = false
end type

type ddlb_kyc_documents from my_ddlb within w_faxcomponent_senderids
integer x = 18
integer y = 548
integer width = 1134
integer height = 760
integer taborder = 11
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;IF ddlb_kyc_documents.getdataid() <> "--" THEN 
	fn_habilitar_kyc(true)
END IF


end event

type cb_edit_kyc from commandbutton within w_faxcomponent_senderids
event mousemove pbm_mousemove
string tag = "Marks as rejected and send file to sender folder"
integer x = 439
integer y = 644
integer width = 352
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Edit"
end type

event clicked;Double ld_receiver, ld_sender, ld_sender_global
string ls_branch, ls_kyc_version
integer li_max_kyc_version, li_version
long ll_len_ver, ll_len_branch

ld_sender_global = double(sle_globalsender.text)

ls_kyc_version = ddlb_kyc_documents.getdatavalue()

li_version = integer(mid(ls_kyc_version, pos(ls_kyc_version,"_v") + 2, len(ls_kyc_version)))
ll_len_ver = len(string(li_version)) + 2

ls_branch = mid(ls_kyc_version, 1, pos(ls_kyc_version,"_") - 1)
ll_len_branch = len(ls_branch)

ld_receiver = double(mid(ls_kyc_version, pos(ls_kyc_version,"_") + 1,  len(ls_kyc_version) - ll_len_ver - ll_len_branch - 1))

SELECT TOP 1 r.ID_SENDER
INTO :ld_sender
FROM dba.KYC_SENDER k
INNER JOIN dba.RECEIVER r WITH (NOLOCK) ON k.ID_BRANCH = r.ID_BRANCH 
	AND k.ID_RECEIVER = r.ID_RECEIVER
WHERE k.ID_SENDER_GLOBAL = :ld_sender_global 
	AND k.ID_BRANCH = :ls_branch AND k.ID_RECEIVER = :ld_receiver;

Openwithparm(w_pfc_sender_compliancedata,"-IDS-"+ls_branch+"*"+string(ld_sender)+"*"+string(ld_receiver)+"*2*N")

fn_retrieve_kyc_docs()

SELECT  MAX(KYC_VERSION)
INTO :li_max_kyc_version
FROM dba.KYC_SENDER 
WHERE ID_SENDER_GLOBAL =  :ld_sender_global
	 AND id_branch = :ls_branch AND  id_receiver = :ld_receiver;

ddlb_kyc_documents.setselectedid(trim(ls_branch) + "_" + string(ld_receiver)  + "_v" + string(li_max_kyc_version))

fn_load_kyc_form()



	

end event

type cb_export_kyc from commandbutton within w_faxcomponent_senderids
integer x = 800
integer y = 644
integer width = 352
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Export"
end type

event clicked;string ls_item, ls_file_path
integer li_save

ls_item = ddlb_kyc_documents.getdatavalue()

if not fileexists(is_faxpath) then CreateDirectory (is_faxpath)

ls_file_path =  is_faxpath + 'KYC_' + ls_item + "_" + string(today(),"mmddyyyyhhmmss")

li_save = ole_fax1.object.Save(ls_file_path, "pdf")

if li_save = 1 then 
	ole_fax1.object.FileName = ""
	fn_listar_faxes()
	if fn_getlang() = 'EN' then
		Messagebox("Information","File was saved succesfully at sender's folder.")
	else
		Messagebox("Información","Se ha guardado el archivo en la carpeta del sender.")
	end if
else
	if fn_getlang() = 'EN' then
		Messagebox("Error","An error has ocurred, please try again or contact IT support.",StopSign!)
	else
		Messagebox("Error","Ha ocurrido un error inesperado, intente de nuevo o comuniquese con el area de tecnología.",StopSign!)
	end if
end if



end event

type cb_1 from commandbutton within w_faxcomponent_senderids
integer x = 805
integer y = 1308
integer width = 352
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Folder"
end type

event clicked;string ls_file_bat, ls_cmd, ls_sender_global
integer li_file, li_ret

ls_file_bat =  is_app_dir + "\OpenIdsFolder.bat"

ls_cmd = "start %windir%\explorer.exe " + is_faxpath

IF FileExists(ls_file_bat) THEN FileDelete(ls_file_bat)

li_file = FileOpen(ls_file_bat ,LineMode!,Write!,lockwrite!)
FileWrite(li_file, ls_cmd)
FileClose(li_file)

li_ret = Run(ls_file_bat)

IF li_ret = -1 THEN MEssagebox("Error", "Error al abrir la carpeta del sender.", StopSign!)

end event

type cbx_all_versions from checkbox within w_faxcomponent_senderids
integer x = 827
integer y = 472
integer width = 343
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
string text = "All Versions"
end type

event clicked;fn_retrieve_kyc_docs()
end event

type st_14 from statictext within w_faxcomponent_senderids
integer x = 37
integer y = 1856
integer width = 343
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
string text = "Country:"
boolean focusrectangle = false
end type

type st_15 from statictext within w_faxcomponent_senderids
integer x = 41
integer y = 1936
integer width = 343
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
string text = "State:"
boolean focusrectangle = false
end type

type ddlb_country from my_ddlb within w_faxcomponent_senderids
integer x = 270
integer y = 1840
integer width = 846
integer height = 1004
integer taborder = 90
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;//this.addquery("select Name_country, iso_c3 , 	  case  ID_COUNTRY 	  WHEN 'MEX' THEN 1 	  WHEN 'GUA' THEN 2 	  WHEN  'BRA' THEN 3 	  WHEN  'SLV' THEN 4	  WHEN  'RD' THEN 5	  ELSE 99	  END from dba.Country where is_isocountry = 1 ORDER BY 3;")



string ls_data_ini, ls_id
long l_order

this.reset()

DECLARE cur_datos CURSOR FOR 
select Name_country, iso_c3 ,
	  case  ID_COUNTRY 	  
	  WHEN 'USA' THEN 1 
	  WHEN 'MEX' THEN 2 
	  WHEN 'GUA' THEN 3 
	  WHEN  'ELS' THEN 4
	  WHEN  'HON' THEN 5
	  WHEN  'RD' THEN 6	  
	  WHEN  'BRA' THEN 7 	  
	  WHEN  'PHL' THEN 8
	  WHEN  'COL' THEN 9
	  WHEN  'ECU' THEN 10
	  WHEN  'NIC' THEN 11
	  WHEN  'CRI' THEN 12
	  WHEN  'PER' THEN 13
	  WHEN  'BOL' THEN 14
	  WHEN  'GHA' THEN 15
	  WHEN  'HTI' THEN 16	  
	  ELSE 99
	  END 
from dba.Country 
where is_isocountry = 1 
ORDER BY 3,1;

OPEN cur_datos;
FETCH cur_datos INTO :ls_data_ini, :ls_id, :l_order;

DO WHILE SQLCA.SQLCODE = 0	
	
	this.additem(fn_completar_cadena(ls_data_ini,'D',' ',100)+'*'+ls_id)
	FETCH cur_datos INTO :ls_data_ini, :ls_id, :l_order;
	
LOOP
CLOSE cur_datos;


end event

event modified;call super::modified;STRING s_country

s_country = this.getdataid()


IF s_country = '' THEN
	ddlb_country.setselectedid('')
	ddlb_country.Text =''
END IF	

IF s_country = 'USA' THEN
	s_country = s_country
	ddlb_state.enabled = True
ELSE
	ddlb_state.setselectedid('')
	ddlb_state.enabled = false
END IF
end event

event doubleclicked;call super::doubleclicked;STRING s_country

s_country = this.getdataid()

IF s_country = '' THEN
	ddlb_country.setselectedid('')
	ddlb_country.Text =''
END IF
end event

event selectionchanged;call super::selectionchanged;STRING s_country

s_country = this.getdataid()

IF s_country = '' THEN
	ddlb_country.Text =''
END IF	
end event

type ddlb_state from my_ddlb within w_faxcomponent_senderids
integer x = 270
integer y = 1932
integer width = 846
integer height = 1004
integer taborder = 100
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_state,id_state from dba.state where id_country = 'USA' and is_isostate = 1 UNION  select '', '' ORDER BY name_state;")
end event

event modified;call super::modified;STRING s_state

s_state = this.getdataid()


IF s_state = '' THEN
	ddlb_state.Text =''
END IF	
end event

event selectionchanged;call super::selectionchanged;STRING s_state

s_state = this.getdataid()


IF s_state = '' THEN
	ddlb_state.Text =''
END IF	
end event

type pb_1 from picturebutton within w_faxcomponent_senderids
string tag = "Load from transactions"
integer x = 960
integer y = 1392
integer width = 114
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
boolean originalsize = true
string powertiptext = "Load from transactions"
end type

event clicked;dw_documents.visible= True
end event

type dw_documents from datawindow within w_faxcomponent_senderids
boolean visible = false
integer x = 485
integer y = 1096
integer width = 2025
integer height = 460
integer taborder = 100
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_documents_senders"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;STRING s_id_type, s_number_id,s_country,s_state

DATE d_expiration_date

if row = 0 THEN
	RETURN
END IF

s_id_type = this.GetItemString(row,'id_type_id_sender')
s_number_id = this.GetItemString(row,'number_id_sender')
s_country = this.GetItemString(row,'id_country_issuer_id')
s_state = this.GetItemString(row,'id_state_issuer_id')

d_expiration_date = Date(this.GetItemDateTime(row,'expiration_date_id'))


lst_id_type.setselectedid(s_id_type)	
ddlb_state.setselectedid(s_state)	
ddlb_country.setselectedid(s_country)	

txt_expiration_date.text = String(d_expiration_date)
txt_number_id.text = s_number_id

this.visible = false
end event

