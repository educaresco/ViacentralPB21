$PBExportHeader$w_agency_owner_info.srw
forward
global type w_agency_owner_info from w_sheet
end type
type cb_1 from commandbutton within w_agency_owner_info
end type
type tab_copy_owner from tab within w_agency_owner_info
end type
type tp from userobject within tab_copy_owner
end type
type cb_copy_owner from commandbutton within tp
end type
type cb_cancel_copy_owner from commandbutton within tp
end type
type sle_branch_name_copy_owner from singlelineedit within tp
end type
type sle_branch_id_copy_owner from singlelineedit within tp
end type
type st_copy_owner_branch from statictext within tp
end type
type tp from userobject within tab_copy_owner
cb_copy_owner cb_copy_owner
cb_cancel_copy_owner cb_cancel_copy_owner
sle_branch_name_copy_owner sle_branch_name_copy_owner
sle_branch_id_copy_owner sle_branch_id_copy_owner
st_copy_owner_branch st_copy_owner_branch
end type
type tab_copy_owner from tab within w_agency_owner_info
tp tp
end type
type cb_del from commandbutton within w_agency_owner_info
end type
type cb_add from commandbutton within w_agency_owner_info
end type
type shl_addmail from statichyperlink within w_agency_owner_info
end type
type dw_2 from datawindow within w_agency_owner_info
end type
type st_1 from statictext within w_agency_owner_info
end type
type sle_idbranch from singlelineedit within w_agency_owner_info
end type
type cb_query from commandbutton within w_agency_owner_info
end type
type gb_1 from groupbox within w_agency_owner_info
end type
type lst_agencies from my_ddlb within w_agency_owner_info
end type
type dw_1 from u_dw within w_agency_owner_info
end type
type gb_2 from groupbox within w_agency_owner_info
end type
end forward

global type w_agency_owner_info from w_sheet
boolean visible = false
integer width = 3168
integer height = 2696
string title = "Agency Owner Information"
string menuname = "m_agency_owner_information"
boolean resizable = false
event ue_delete ( )
event ue_insert ( )
event ue_update ( )
cb_1 cb_1
tab_copy_owner tab_copy_owner
cb_del cb_del
cb_add cb_add
shl_addmail shl_addmail
dw_2 dw_2
st_1 st_1
sle_idbranch sle_idbranch
cb_query cb_query
gb_1 gb_1
lst_agencies lst_agencies
dw_1 dw_1
gb_2 gb_2
end type
global w_agency_owner_info w_agency_owner_info

forward prototypes
public function boolean fn_validar_branch_copy ()
end prototypes

event ue_delete();if messagebox('ALERT', 'Do you want to delete this record?',question!,yesno!) = 1 then

dw_1.DeleteRow(0)
dw_1.update()
dw_1.settransobject(sqlca)
dw_1.insertrow(0)
dw_1.Object.DataWindow.ReadOnly="Yes"
end if
end event

event ue_insert();dw_1.INSERTROW(1)
	if 1 = messagebox('Warning', 'There is no information saved, do you want to enter it now?',question!, yesno!) then
	 	 dw_1.Object.DataWindow.ReadOnly="No"
		 
		 
	end if
end event

event ue_update();dw_1.ACCEPTTEXT()
if dw_1.update() = 1 then
	dw_1.Object.DataWindow.ReadOnly="Yes"
	
	else
	messagebox('WARNING', 'Unabled to save the record')
end  if 
end event

public function boolean fn_validar_branch_copy ();string  ls_name, ls_id_branch

tab_copy_owner.tp.sle_branch_name_copy_owner.text = ""

ls_id_branch = tab_copy_owner.tp.sle_branch_id_copy_owner.text

IF IsNull(ls_id_branch) OR len (ls_id_branch) = 0 THEN RETURN false
	
SELECT  name_branch
INTO :ls_name
FROM dba.branch 
WHERE id_branch = :ls_id_branch  AND id_type_branch IN ('A','R');

IF NOT IsNull(ls_name) AND len (ls_name) > 0 THEN
	tab_copy_owner.tp.sle_branch_name_copy_owner.text = ls_name
	return true
ELSE
	MessageBox("Alert", "Branch Id: " + ls_id_branch + " is not a valid Id.")
	tab_copy_owner.tp.sle_branch_name_copy_owner.text = ""
	return false
END IF
end function

on w_agency_owner_info.create
int iCurrent
call super::create
if this.MenuName = "m_agency_owner_information" then this.MenuID = create m_agency_owner_information
this.cb_1=create cb_1
this.tab_copy_owner=create tab_copy_owner
this.cb_del=create cb_del
this.cb_add=create cb_add
this.shl_addmail=create shl_addmail
this.dw_2=create dw_2
this.st_1=create st_1
this.sle_idbranch=create sle_idbranch
this.cb_query=create cb_query
this.gb_1=create gb_1
this.lst_agencies=create lst_agencies
this.dw_1=create dw_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.tab_copy_owner
this.Control[iCurrent+3]=this.cb_del
this.Control[iCurrent+4]=this.cb_add
this.Control[iCurrent+5]=this.shl_addmail
this.Control[iCurrent+6]=this.dw_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.sle_idbranch
this.Control[iCurrent+9]=this.cb_query
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.lst_agencies
this.Control[iCurrent+12]=this.dw_1
this.Control[iCurrent+13]=this.gb_2
end on

on w_agency_owner_info.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.tab_copy_owner)
destroy(this.cb_del)
destroy(this.cb_add)
destroy(this.shl_addmail)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.sle_idbranch)
destroy(this.cb_query)
destroy(this.gb_1)
destroy(this.lst_agencies)
destroy(this.dw_1)
destroy(this.gb_2)
end on

event pfc_saveas;dw_1.saveas()
end event

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Initialize the Window Resize Service.
//
//////////////////////////////////////////////////////////////////////////////

//Initialize the Window Resize Functionality
this.of_SetResize(true)
this.inv_resize.of_SetMinSize(1884, 873)
this.inv_resize.of_SetOrigSize(1200, 1000)
this.inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)
end event

event open;call super::open;X=1
Y=1
Show()

dw_1.settransobject(sqlca)
dw_1.insertrow(0)
dw_1.Object.DataWindow.ReadOnly="Yes"

tab_copy_owner.visible = false
end event

event pfc_print;
If Messagebox("Question","Do you want to print Now ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()




dw_1.print()



return 0
end event

event resize;call super::resize;dw_1.height = this.height - dw_1.y - 150
dw_1.width = this.width - dw_1.x - 80
end event

type cb_1 from commandbutton within w_agency_owner_info
integer x = 2661
integer y = 60
integer width = 366
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Owner"
boolean default = true
end type

event clicked;string ls_id_branch

ls_id_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")

if isNull(ls_id_branch) or len(ls_id_branch) = 0 then
	return
end if

IF dw_1.update() = 1 THEN
	commit;
ELSE
	messagebox('WARNING', 'Unabled to save the record')
	rollback;
	return
END IF

tab_copy_owner.tp.sle_branch_id_copy_owner.text = ''
tab_copy_owner.tp.sle_branch_name_copy_owner.text = ''

tab_copy_owner.visible = true

SetFocus(tab_copy_owner.tp.sle_branch_id_copy_owner)
end event

type tab_copy_owner from tab within w_agency_owner_info
integer x = 503
integer y = 876
integer width = 1975
integer height = 364
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean focusonbuttondown = true
boolean showtext = false
alignment alignment = right!
integer selectedtab = 1
tp tp
end type

on tab_copy_owner.create
this.tp=create tp
this.Control[]={this.tp}
end on

on tab_copy_owner.destroy
destroy(this.tp)
end on

type tp from userobject within tab_copy_owner
event create ( )
event destroy ( )
integer x = 18
integer y = 48
integer width = 1938
integer height = 300
long backcolor = 79741120
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_copy_owner cb_copy_owner
cb_cancel_copy_owner cb_cancel_copy_owner
sle_branch_name_copy_owner sle_branch_name_copy_owner
sle_branch_id_copy_owner sle_branch_id_copy_owner
st_copy_owner_branch st_copy_owner_branch
end type

on tp.create
this.cb_copy_owner=create cb_copy_owner
this.cb_cancel_copy_owner=create cb_cancel_copy_owner
this.sle_branch_name_copy_owner=create sle_branch_name_copy_owner
this.sle_branch_id_copy_owner=create sle_branch_id_copy_owner
this.st_copy_owner_branch=create st_copy_owner_branch
this.Control[]={this.cb_copy_owner,&
this.cb_cancel_copy_owner,&
this.sle_branch_name_copy_owner,&
this.sle_branch_id_copy_owner,&
this.st_copy_owner_branch}
end on

on tp.destroy
destroy(this.cb_copy_owner)
destroy(this.cb_cancel_copy_owner)
destroy(this.sle_branch_name_copy_owner)
destroy(this.sle_branch_id_copy_owner)
destroy(this.st_copy_owner_branch)
end on

type cb_copy_owner from commandbutton within tp
integer x = 1477
integer y = 152
integer width = 416
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copy Owner"
end type

event clicked;String ls_id_branch, ls_original_id_branch,ls_LEGAL_NAME, ls_COMPANY_TYPE, ls_OWNER_FNAME, ls_OWNER_MNAME
String ls_OWNER_LNAME, ls_OWNER_SLNAME, ls_OWNER_ADDRESS, ls_ID_TYPE,  ls_ID_NUMBER, ls_TAX_ID, ls_EIN
String ls_ZIP_CODE, ls_ZIP4_CODE, ls_ID_CITY, ls_NAME_CITY, ls_ID_STATE, ls_NAME_STATE, ls_PHONE_1, ls_PHONE_2
string ls_CELLULAR_NUMBER, ls_COSIGNER_NAME, ls_OWNER2_NAME, ls_OWNER3_NAME, ls_OWNER4_NAME, ls_OWNER_NICKNAME
string ls_ID_COMPANY_TYPE, ls_MAILADD_STREET, ls_MAILADD_NAME_CITY, ls_MAILADD_ID_STATE, ls_MAILADD_ZIPCODE, ls_MAILADD_ZIP4CODE
string ls_PRINTCHECKAS, ls_PREEXISTING_UCC, ls_PREEXISTING_UCC_COMMENTS, ls_FILE_UCC, ls_NUMBER_1099, ls_NAME_1099

integer li_SYNC_COMPASS, li_existe
decimal ld_OWNER_SSN, ld_OWNER_CREDITSCORE, ld_OWNER2_CREDITSCORE, ld_OWNER3_CREDITSCORE, ld_OWNER4_CREDITSCORE
decimal ld_SYNC_COMPASS_COD_IND
datetime ld_ID_EXP_DATE, ld_TIME_INBUSINESS, ld_CONTRACT_VER, ld_OWNER_CREDITSCORE_DATE, ld_UCC_CREATED_DATE, ld_UCC_EXPIRES_DATE

IF NOT fn_validar_branch_copy() THEN return

ls_id_branch = tab_copy_owner.tp.sle_branch_id_copy_owner.text

ls_original_id_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")

If messagebox("Confirmation","Do you want to copy information on Agency Owner "+trim(ls_original_id_branch)+" to a agency owner with ID "+ls_id_branch+"?",Question!,yesno!) = 1 then
	
 SELECT LEGAL_NAME
      ,COMPANY_TYPE
      ,OWNER_FNAME
      ,OWNER_MNAME
      ,OWNER_LNAME
      ,OWNER_SLNAME
      ,OWNER_SSN
      ,OWNER_ADDRESS
      ,ID_TYPE
      ,ID_NUMBER
      ,ID_EXP_DATE
      ,TAX_ID
      ,EIN
      ,ZIP_CODE
      ,ZIP4_CODE
      ,ID_CITY
      ,NAME_CITY
      ,ID_STATE
      ,NAME_STATE
      ,PHONE_1
      ,PHONE_2
      ,CELLULAR_NUMBER
      ,TIME_INBUSINESS
      ,COSIGNER_NAME
      ,OWNER2_NAME
      ,OWNER3_NAME
      ,OWNER4_NAME
      ,CONTRACT_VER
      ,OWNER_NICKNAME
      ,OWNER_CREDITSCORE
      ,OWNER2_CREDITSCORE
      ,OWNER3_CREDITSCORE
      ,OWNER4_CREDITSCORE
      ,ID_COMPANY_TYPE
      ,MAILADD_STREET
      ,MAILADD_NAME_CITY
      ,MAILADD_ID_STATE
      ,MAILADD_ZIPCODE
      ,MAILADD_ZIP4CODE
      ,PRINTCHECKAS
      ,SYNC_COMPASS
      ,SYNC_COMPASS_COD_IND
      ,OWNER_CREDITSCORE_DATE
      ,PREEXISTING_UCC
      ,PREEXISTING_UCC_COMMENTS
      ,FILE_UCC
      ,UCC_CREATED_DATE
      ,UCC_EXPIRES_DATE
      ,NUMBER_1099
      ,NAME_1099
	INTO :ls_LEGAL_NAME 
      ,:ls_COMPANY_TYPE
      ,:ls_OWNER_FNAME 
      ,:ls_OWNER_MNAME
      ,:ls_OWNER_LNAME
      ,:ls_OWNER_SLNAME
      ,:ld_OWNER_SSN
      ,:ls_OWNER_ADDRESS
      ,:ls_ID_TYPE
      ,:ls_ID_NUMBER
      ,:ld_ID_EXP_DATE
      , :ls_TAX_ID
      ,:ls_EIN
      ,:ls_ZIP_CODE
      ,:ls_ZIP4_CODE
      ,:ls_ID_CITY
      ,:ls_NAME_CITY
      ,:ls_ID_STATE
      ,:ls_NAME_STATE
      ,:ls_PHONE_1
      ,:ls_PHONE_2
      ,:ls_CELLULAR_NUMBER
      ,:ld_TIME_INBUSINESS
      ,:ls_COSIGNER_NAME
      ,:ls_OWNER2_NAME
      ,:ls_OWNER3_NAME
      ,:ls_OWNER4_NAME
      ,:ld_CONTRACT_VER
      ,:ls_OWNER_NICKNAME
      ,:ld_OWNER_CREDITSCORE
      ,:ld_OWNER2_CREDITSCORE
      ,:ld_OWNER3_CREDITSCORE
      ,:ld_OWNER4_CREDITSCORE
      ,:ls_ID_COMPANY_TYPE
      ,:ls_MAILADD_STREET
      ,:ls_MAILADD_NAME_CITY
      ,:ls_MAILADD_ID_STATE
      ,:ls_MAILADD_ZIPCODE
      ,:ls_MAILADD_ZIP4CODE
      ,:ls_PRINTCHECKAS
      ,:li_SYNC_COMPASS
      ,:ld_SYNC_COMPASS_COD_IND
      ,:ld_OWNER_CREDITSCORE_DATE
      ,:ls_PREEXISTING_UCC
      ,:ls_PREEXISTING_UCC_COMMENTS
      ,:ls_FILE_UCC
      ,:ld_UCC_CREATED_DATE
      ,:ld_UCC_EXPIRES_DATE
      ,:ls_NUMBER_1099
      ,:ls_NAME_1099
	FROM dba.BRANCH_OWNER_INFORMATION
	WHERE id_branch = :ls_original_id_branch;
	
	SELECT Count(id_branch)
	INTO  :li_existe
	FROM dba.BRANCH_OWNER_INFORMATION
	WHERE id_branch = :ls_id_branch;
	
	IF li_existe > 0 THEN
		UPDATE dba.BRANCH_OWNER_INFORMATION
			SET LEGAL_NAME  = :ls_LEGAL_NAME// varchar(100)//>
			,COMPANY_TYPE  = :ls_COMPANY_TYPE// varchar(20),>
			,OWNER_FNAME  = :ls_OWNER_FNAME// varchar(60),>
			,OWNER_MNAME  = :ls_OWNER_MNAME// varchar(60),>
			,OWNER_LNAME  = :ls_OWNER_LNAME// varchar(60),>
			,OWNER_SLNAME  = :ls_OWNER_SLNAME// varchar(60),>
			,OWNER_SSN  = :ld_OWNER_SSN// numeric(9,0),>
			,OWNER_ADDRESS  = :ls_OWNER_ADDRESS// varchar(100),>
			,ID_TYPE  = :ls_ID_TYPE// varchar(2),>
			,ID_NUMBER  = :ls_ID_NUMBER// varchar(40),>
			,ID_EXP_DATE  = :ld_ID_EXP_DATE// datetime,>
			,TAX_ID  = :ls_TAX_ID// varchar(30),>
			,EIN  = :ls_EIN// varchar(30),>
			,ZIP_CODE  = :ls_ZIP_CODE// char(5),>
			,ZIP4_CODE  = :ls_ZIP4_CODE// char(4),>
			,ID_CITY  = :ls_ID_CITY// varchar(5),>
			,NAME_CITY  = :ls_NAME_CITY// varchar(60),>
			,ID_STATE  = :ls_ID_STATE// varchar(5),>
			,NAME_STATE  = :ls_NAME_STATE// varchar(60),>
			,PHONE_1  = :ls_PHONE_1// varchar(15),>
			,PHONE_2  = :ls_PHONE_2// varchar(15),>
			,CELLULAR_NUMBER  = :ls_CELLULAR_NUMBER// varchar(15),>
			,TIME_INBUSINESS  = :ld_TIME_INBUSINESS// datetime,>
			,COSIGNER_NAME  = :ls_COSIGNER_NAME// varchar(150),>
			,OWNER2_NAME  = :ls_OWNER2_NAME// varchar(150),>
			,OWNER3_NAME  = :ls_OWNER3_NAME// varchar(150),>
			,OWNER4_NAME  = :ls_OWNER4_NAME// varchar(150),>
			,CONTRACT_VER  = : ld_CONTRACT_VER// datetime,>
			,OWNER_NICKNAME  = :ls_OWNER_NICKNAME// varchar(100),>
			,OWNER_CREDITSCORE  = :ld_OWNER_CREDITSCORE// numeric(4,0),>
			,OWNER2_CREDITSCORE  = :ld_OWNER2_CREDITSCORE// numeric(4,0),>
			,OWNER3_CREDITSCORE  = :ld_OWNER3_CREDITSCORE// numeric(4,0),>
			,OWNER4_CREDITSCORE  = :ld_OWNER4_CREDITSCORE// numeric(4,0),>
			,ID_COMPANY_TYPE  = :ls_ID_COMPANY_TYPE// char(5),>
			,MAILADD_STREET  = :ls_MAILADD_STREET// varchar(100),>
			,MAILADD_NAME_CITY  = :ls_MAILADD_NAME_CITY// varchar(60),>
			,MAILADD_ID_STATE  = :ls_MAILADD_ID_STATE// varchar(5),>
			,MAILADD_ZIPCODE  = :ls_MAILADD_ZIPCODE// varchar(5),>
			,MAILADD_ZIP4CODE  = :ls_MAILADD_ZIP4CODE// varchar(4),>
			,PRINTCHECKAS  = :ls_PRINTCHECKAS// varchar(80),>
			,SYNC_COMPASS  = :li_SYNC_COMPASS// smallint,>
			,SYNC_COMPASS_COD_IND  = :ld_SYNC_COMPASS_COD_IND// numeric(12,0),>
			,OWNER_CREDITSCORE_DATE  = :ld_OWNER_CREDITSCORE_DATE// datetime,>
			,PREEXISTING_UCC  = :ls_PREEXISTING_UCC// varchar(1),>
			,PREEXISTING_UCC_COMMENTS  = :ls_PREEXISTING_UCC_COMMENTS// varchar(100),>
			,FILE_UCC  = :ls_FILE_UCC// varchar(1),>
			,UCC_CREATED_DATE  = :ld_UCC_CREATED_DATE// datetime,>
			,UCC_EXPIRES_DATE  = :ld_UCC_EXPIRES_DATE// datetime,>
			,NUMBER_1099  = :ls_NUMBER_1099// varchar(20),>
			,NAME_1099  = :ls_NAME_1099// varchar(100),>
		WHERE id_branch = :ls_id_branch;
	ELSE
		INSERT INTO dba.BRANCH_OWNER_INFORMATION
           (ID_BRANCH
           	,LEGAL_NAME
			,COMPANY_TYPE
			,OWNER_FNAME
			,OWNER_MNAME
			,OWNER_LNAME
			,OWNER_SLNAME
			,OWNER_SSN
			,OWNER_ADDRESS
			,ID_TYPE
			,ID_NUMBER
			,ID_EXP_DATE
			,TAX_ID
			,EIN
			,ZIP_CODE
			,ZIP4_CODE
			,ID_CITY
			,NAME_CITY
			,ID_STATE
			,NAME_STATE
			,PHONE_1
			,PHONE_2
			,CELLULAR_NUMBER
			,TIME_INBUSINESS
			,COSIGNER_NAME
			,OWNER2_NAME
			,OWNER3_NAME
			,OWNER4_NAME
			,CONTRACT_VER
			,OWNER_NICKNAME
			,OWNER_CREDITSCORE
			,OWNER2_CREDITSCORE
			,OWNER3_CREDITSCORE
			,OWNER4_CREDITSCORE
			,ID_COMPANY_TYPE
			,MAILADD_STREET
			,MAILADD_NAME_CITY
			,MAILADD_ID_STATE
			,MAILADD_ZIPCODE
			,MAILADD_ZIP4CODE
			,PRINTCHECKAS
			,SYNC_COMPASS
			,SYNC_COMPASS_COD_IND
			,OWNER_CREDITSCORE_DATE
			,PREEXISTING_UCC
			,PREEXISTING_UCC_COMMENTS
			,FILE_UCC
			,UCC_CREATED_DATE
			,UCC_EXPIRES_DATE
			,NUMBER_1099
			,NAME_1099)
		  VALUES
           (:ls_id_branch
		  	,:ls_LEGAL_NAME 
			,:ls_COMPANY_TYPE
			,:ls_OWNER_FNAME 
			,:ls_OWNER_MNAME
			,:ls_OWNER_LNAME
			,:ls_OWNER_SLNAME
			,:ld_OWNER_SSN
			,:ls_OWNER_ADDRESS
			,:ls_ID_TYPE
			,:ls_ID_NUMBER
			,:ld_ID_EXP_DATE
			, :ls_TAX_ID
			,:ls_EIN
			,:ls_ZIP_CODE
			,:ls_ZIP4_CODE
			,:ls_ID_CITY
			,:ls_NAME_CITY
			,:ls_ID_STATE
			,:ls_NAME_STATE
			,:ls_PHONE_1
			,:ls_PHONE_2
			,:ls_CELLULAR_NUMBER
			,:ld_TIME_INBUSINESS
			,:ls_COSIGNER_NAME
			,:ls_OWNER2_NAME
			,:ls_OWNER3_NAME
			,:ls_OWNER4_NAME
			,:ld_CONTRACT_VER
			,:ls_OWNER_NICKNAME
			,:ld_OWNER_CREDITSCORE
			,:ld_OWNER2_CREDITSCORE
			,:ld_OWNER3_CREDITSCORE
			,:ld_OWNER4_CREDITSCORE
			,:ls_ID_COMPANY_TYPE
			,:ls_MAILADD_STREET
			,:ls_MAILADD_NAME_CITY
			,:ls_MAILADD_ID_STATE
			,:ls_MAILADD_ZIPCODE
			,:ls_MAILADD_ZIP4CODE
			,:ls_PRINTCHECKAS
			,:li_SYNC_COMPASS
			,:ld_SYNC_COMPASS_COD_IND
			,:ld_OWNER_CREDITSCORE_DATE
			,:ls_PREEXISTING_UCC
			,:ls_PREEXISTING_UCC_COMMENTS
			,:ls_FILE_UCC
			,:ld_UCC_CREATED_DATE
			,:ld_UCC_EXPIRES_DATE
			,:ls_NUMBER_1099
			,:ls_NAME_1099);
	END IF

	if SQLCA.SQLCODE <> 0 then
		Messagebox("Error","An error ocurred creating the copy ("+SQLCA.SQLErrText+")",StopSign!)
	else
		Messagebox("Completed","Agency Copy completed sucessfully.")
		tab_copy_owner.visible = false
	end if
else
	Messagebox("Canceled","Copy cancelled",Exclamation!)
	tab_copy_owner.visible = false
end if







end event

type cb_cancel_copy_owner from commandbutton within tp
integer x = 1042
integer y = 152
integer width = 416
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
end type

event clicked;
tab_copy_owner.tp.sle_branch_id_copy_owner.text = ''
tab_copy_owner.tp.sle_branch_name_copy_owner.text = ""

tab_copy_owner.visible = false

end event

type sle_branch_name_copy_owner from singlelineedit within tp
integer x = 777
integer y = 44
integer width = 1115
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

type sle_branch_id_copy_owner from singlelineedit within tp
integer x = 462
integer y = 44
integer width = 302
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;fn_validar_branch_copy()
end event

type st_copy_owner_branch from statictext within tp
integer x = 32
integer y = 52
integer width = 448
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Copy to Branch ID:"
boolean focusrectangle = false
end type

type cb_del from commandbutton within w_agency_owner_info
integer x = 1125
integer y = 1448
integer width = 201
integer height = 68
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Del"
end type

event clicked;
Long		ll_cont
String 	ls_id_branch
Double 	ld_id_mt

ls_id_branch = dw_1.getitemString(dw_1.getrow(),'id_branch')

n_cst_selection  lnv_selection

Any  		la_selected[ ]
String 	ls_columns[ ]
Integer  li_count

// Valores de Respuesta
ls_columns[1] = "id_mt"

lnv_selection.of_Open  &
   ("dddw_mts", la_selected, SQLCA, ls_columns)

// Recorre los elementos seleccionados
// (Aun no se como se puede seleccionar mas de uno)
for li_count = 1 to UpperBound(la_selected)
	
	ld_id_mt = Double(la_selected[li_count])
	
	SELECT Count(*) 
	  INTO :ll_cont
	  FROM dba.BRANCH_MONEY_TRANSMITTERS
	 WHERE id_branch = :ls_id_branch
	   AND id_mt = :ld_id_mt;
	
	if ll_cont > 0 then
		  DELETE FROM dba.BRANCH_MONEY_TRANSMITTERS
		   WHERE ID_BRANCH = :ls_id_branch
		     AND ID_MT = :ld_id_mt;
	end if	
	
next

dw_2.retrieve(ls_id_branch)
end event

type cb_add from commandbutton within w_agency_owner_info
integer x = 1125
integer y = 1372
integer width = 201
integer height = 68
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add"
end type

event clicked;
Long		ll_cont
String 	ls_id_branch
Double 	ld_id_mt

ls_id_branch = dw_1.getitemString(dw_1.getrow(),'id_branch')

n_cst_selection  lnv_selection

Any  		la_selected[ ]
String 	ls_columns[ ]
Integer  li_count

// Valores de Respuesta
ls_columns[1] = "id_mt"

lnv_selection.of_Open  &
   ("dddw_mts", la_selected, SQLCA, ls_columns)

// Recorre los elementos seleccionados
// (Aun no se como se puede seleccionar mas de uno)
for li_count = 1 to UpperBound(la_selected)
	
	ld_id_mt = Double(la_selected[li_count])
	
	SELECT Count(*) 
	  INTO :ll_cont
	  FROM dba.BRANCH_MONEY_TRANSMITTERS
	 WHERE id_branch = :ls_id_branch
	   AND id_mt = :ld_id_mt;
	
	if ll_cont < 1 then
		  INSERT INTO dba.BRANCH_MONEY_TRANSMITTERS(ID_BRANCH,ID_MT)  
		  VALUES (:ls_id_branch,:ld_id_mt);
	end if	

next

dw_2.retrieve(ls_id_branch)
end event

type shl_addmail from statichyperlink within w_agency_owner_info
integer x = 2446
integer y = 1520
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long backcolor = 67108864
string text = "Find Address"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_agency_owner_info
integer x = 480
integer y = 1376
integer width = 631
integer height = 336
integer taborder = 20
string dataobject = "dw_agency_owner_info_mts"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type st_1 from statictext within w_agency_owner_info
integer x = 526
integer y = 80
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Agency:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_idbranch from singlelineedit within w_agency_owner_info
integer x = 809
integer y = 64
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

type cb_query from commandbutton within w_agency_owner_info
integer x = 2258
integer y = 60
integer width = 366
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
boolean default = true
end type

event clicked;string ls_id_branch,ls_name_branch,ls_id_city, ls_id_state
ls_id_branch = sle_idbranch.text

//cb_mod.visible			= false
dw_1.Object.DataWindow.ReadOnly="No"
//cb_add.enabled = false
//cb_del.enabled = false
//w_agency_owner_info.event ue_insert_companies(false)

select id_branch, name_branch,id_city, id_state
into   :ls_id_branch,:ls_name_branch,:ls_id_city, :ls_id_state
from   dba.branch
where  id_branch = :ls_id_branch;

if isnull(ls_name_branch) or ls_name_branch='' then 
	messagebox('Error','Check Branch ID',StopSign!)
	RETURN
end if 	

// Quita el ' (A00123)'
if pos(ls_name_branch,'(',1) > 0 then
	ls_name_branch = mid(ls_name_branch,1, pos(ls_name_branch,'(',1)-2)
end if

dw_1.settransobject(sqlca)
if (dw_1.retrieve(sle_idbranch.text) = 0 ) then
	dw_1.INSERTROW(1)
	if 1 = messagebox('Warning', 'There is no information saved, do you want to enter it now?',question!, yesno!) then
	 	 dw_1.Object.DataWindow.ReadOnly="No"
		 dw_1.setitem(dw_1.getrow(),'id_branch',ls_id_branch)
		 dw_1.setitem(dw_1.getrow(),'legal_name',ls_name_branch)
		 dw_1.setitem(dw_1.getrow(),'id_city',ls_id_city)
		 dw_1.setitem(dw_1.getrow(),'id_state',ls_id_state)
	end if 	
//	cb_mod.visible = false
	//cb_add.enabled = true
	//cb_del.enabled = true
else
//	cb_mod.visible = true
//	dw_1.Object.DataWindow.ReadOnly="Yes"
	//cb_add.enabled = false
	//cb_del.enabled = false	
	dw_2.retrieve(ls_id_branch)
	
	// Link al mapa de la direccion alterna
	String ls_mailadd_street,ls_mailadd_name_city,ls_mailadd_id_state,ls_mailadd_zipcode	
	ls_mailadd_street = dw_1.getitemstring(dw_1.getrow(),'mailadd_street')
	ls_mailadd_name_city = dw_1.getitemstring(dw_1.getrow(),'mailadd_name_city')
	ls_mailadd_id_state = dw_1.getitemstring(dw_1.getrow(),'mailadd_id_state')
	ls_mailadd_zipcode = dw_1.getitemstring(dw_1.getrow(),'mailadd_zipcode')
		
	shl_addmail.url = "http://www.mapquest.com/maps/map.adp?address="+fn_replace(ls_mailadd_street," ","+")+"&city="+fn_replace(ls_mailadd_name_city," ","+")+"&state="+trim(ls_mailadd_id_state)+"&zipcode="+ls_mailadd_zipcode+"&country=US&cid=lfmaplink"		
	
end if 

end event

type gb_1 from groupbox within w_agency_owner_info
integer x = 23
integer width = 3099
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Agency Owner Information"
end type

type lst_agencies from my_ddlb within w_agency_owner_info
integer x = 1157
integer y = 64
integer width = 1079
integer height = 1504
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;sle_idbranch.text = lst_agencies.getdataid()
end event

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O' order by name_branch;")
end event

type dw_1 from u_dw within w_agency_owner_info
integer x = 32
integer y = 236
integer width = 3049
integer height = 2264
integer taborder = 0
string dataobject = "dw_agency_owner_info"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)

This.of_SetDropDownCalendar(TRUE)
This.iuo_calendar.of_SetInitialValue(FALSE)
This.iuo_calendar.of_SetAlwaysRedraw(FALSE)
This.iuo_calendar.of_SetCloseOnClick(TRUE)
This.iuo_calendar.of_SetCloseOnDClick(TRUE)
This.iuo_calendar.of_Register("owner_creditscore_date",iuo_calendar.NONE)
This.iuo_calendar.of_Register("ucc_created_date",iuo_calendar.NONE)
This.iuo_calendar.of_Register("ucc_expires_date",iuo_calendar.NONE)


end event

event clicked;call super::clicked;datetime ldt_expire_date

IF dwo.name = "b_calendar" THEN

       IF IsValid(iuo_calendar) THEN

               this.SetColumn("owner_creditscore_date")

               this.event pfc_ddcalendar()

       END IF

  END IF
  
  IF dwo.name = "b_calendar_1" THEN

       IF IsValid(iuo_calendar) THEN

               this.SetColumn("ucc_created_date")

               this.event pfc_ddcalendar()
					
		
		
		

       END IF

  END IF
  
  IF dwo.name = "b_calendar_2" THEN

       IF IsValid(iuo_calendar) THEN

               this.SetColumn("ucc_expires_date")

               this.event pfc_ddcalendar()

       END IF

  END IF


end event

event itemchanged;call super::itemchanged;date ld_date_expire
datetime ldt_date_expire
 IF dwo.name = "ucc_created_date" THEN
	
	ld_date_expire = date(data)
	
	
	
	ld_date_expire = date(string(month(ld_date_expire)) + '/' + string(day(ld_date_expire)) + '/' + string(year(ld_date_expire) + 5))
	
	ldt_date_expire =datetime( ld_date_expire , time('23:59:59'))
	
	this.setitem(this.getrow(),'ucc_expires_date' , ldt_date_expire)
	
	
end if
end event

type gb_2 from groupbox within w_agency_owner_info
integer x = 23
integer y = 196
integer width = 3099
integer height = 2332
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

