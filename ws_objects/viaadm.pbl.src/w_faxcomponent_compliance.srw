$PBExportHeader$w_faxcomponent_compliance.srw
forward
global type w_faxcomponent_compliance from w_faxcomponent
end type
type st_branch from statictext within w_faxcomponent_compliance
end type
type em_branch from editmask within w_faxcomponent_compliance
end type
type em_invoice from editmask within w_faxcomponent_compliance
end type
type st_invoice from statictext within w_faxcomponent_compliance
end type
type cb_compliance from commandbutton within w_faxcomponent_compliance
end type
type cb_delete from commandbutton within w_faxcomponent_compliance
end type
type tab_rejection from tab within w_faxcomponent_compliance
end type
type tp from userobject within tab_rejection
end type
type ddlb_rej_codes from dropdownlistbox within tp
end type
type st_8 from statictext within tp
end type
type cb_rejcancel from commandbutton within tp
end type
type cb_reject from commandbutton within tp
end type
type tp from userobject within tab_rejection
ddlb_rej_codes ddlb_rej_codes
st_8 st_8
cb_rejcancel cb_rejcancel
cb_reject cb_reject
end type
type tab_rejection from tab within w_faxcomponent_compliance
tp tp
end type
type cb_rejpop from commandbutton within w_faxcomponent_compliance
end type
type st_tooltip_assign_sender from statictext within w_faxcomponent_compliance
end type
type gb_compliance from groupbox within w_faxcomponent_compliance
end type
type filetime from structure within w_faxcomponent_compliance
end type
type win32_find_dataa from structure within w_faxcomponent_compliance
end type
type systemtime from structure within w_faxcomponent_compliance
end type
end forward

type FileTime from structure
	ulong		dwLowDateTime
	ulong		dwHighDateTime
end type

type win32_find_dataa from structure
	unsignedlong		dwfileattributes
	filetime		ftcreationtime
	filetime		ftlastaccesstime
	filetime		ftlastwritetime
	unsignedlong		nfilesizehigh
	unsignedlong		nfilesizelow
	unsignedlong		dwreserved0
	unsignedlong		dwreserved1
	character		cfilename[260]
	character		calternatefilename[14]
end type

type SystemTime from structure
	uint		wYear
	uint		wMonth
	uint		wDayOfWeek
	uint		wDay
	uint		wHour
	uint		wMinute
	uint		wSecond
	uint		wMilliseconds
end type

global type w_faxcomponent_compliance from w_faxcomponent
integer height = 2144
string title = "Fax Viewer - Compliance"
st_branch st_branch
em_branch em_branch
em_invoice em_invoice
st_invoice st_invoice
cb_compliance cb_compliance
cb_delete cb_delete
tab_rejection tab_rejection
cb_rejpop cb_rejpop
st_tooltip_assign_sender st_tooltip_assign_sender
gb_compliance gb_compliance
end type
global w_faxcomponent_compliance w_faxcomponent_compliance

type prototypes
Function ulong FindFirstFile (string lpFileName, ref WIN32_FIND_DATAA lpFindFileData) Library "KERNEL32.DLL" Alias for "FindFirstFileA;Ansi"
Function boolean FileTimeToSystemTime (ref FILETIME lpFileTime, ref SYSTEMTIME lpSystemTime) Library "KERNEL32.DLL" alias for "FileTimeToSystemTime;Ansi"
Function boolean FileTimeToLocalFileTime (ref FILETIME lpFileTime, ref FILETIME lpLocalFileTime) Library "KERNEL32.DLL" alias for "FileTimeToLocalFileTime;Ansi"

end prototypes

forward prototypes
public subroutine fn_procesar (string as_tipo)
end prototypes

public subroutine fn_procesar (string as_tipo);Double ld_sender
Long ll_cont
String ls_selected, ls_branch, ls_invoice, ls_global_sender, ls_path, ls_rejection, ls_ext
ls_selected = sle_selected.text

if isnull(ls_selected) or len(ls_selected) < 1 then
	ls_selected = "-none-"
else
	if not FileExists(is_faxpath+ls_selected) then
		ls_selected = "-none-"
	end if
end if

if ls_selected <> "-none-" then
	
	ls_branch = em_branch.text
	ls_invoice = em_invoice.text
	if isnull(ls_branch) then ls_branch = ''
	if isnull(ls_invoice) then ls_invoice = '0'
	
	select count(*) into :ll_cont
	from dba.branch where id_branch = :ls_branch;
	
	if ll_cont < 1 then 
		Messagebox("Branch not Found","The branch ["+ls_branch+"] was not found",StopSign!)
		SetFocus(em_branch)
		return
	end if		
	
	// Moviendo el Fax a la carpeta deseada
	if sle_selected.text <> "[No Fax Selected]" then
		
		IF as_tipo = "REJECT" THEN			
			ls_rejection = tab_rejection.tp.ddlb_rej_codes.text
			
			IF ls_rejection = '' THEN 
				 messagebox("Error","Must choose a Rejection Type",StopSign!)
				 return
			END IF
		END IF
	
		String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname, ls_processed
	
		ls_faxpath = is_faxpath
		
		if ls_invoice = 'PC' then
			ls_processed = "ProcessedPC\"
		elseif ls_invoice = 'AC' then
			ls_processed = "ProcessedAC\"
		else			
			// se sobrescribe con lo de abajo (por cliente)
			ls_processed = "Processed\"
		end if
				
		ls_newfaxfolder = "u:\Compliance\"+ls_processed

		if directoryexists('U:\Compliance\'+ls_processed+'Agencia '+ls_branch) then
			ls_newfaxfolder = 'U:\Compliance\'+ls_processed+'Agencia '+ls_branch+"\"
		end if

		// ()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()
		// los clasifica por cliente!
		if ls_invoice <> 'PC' and ls_invoice <> 'AC' then

			SELECT convert(varchar,id_sender_global), dba.sender.id_sender
			INTO :ls_global_sender, :ld_sender
			FROM dba.receiver, dba.sender
			WHERE dba.receiver.ID_BRANCH = dba.sender.ID_BRANCH
			AND dba.receiver.id_sender = dba.sender.id_sender
			AND dba.receiver.id_branch = :ls_branch
			AND dba.receiver.id_receiver = :ls_invoice;
			
			if isnull(ls_global_sender) or ls_global_sender = '0' or ls_global_sender = '' then		
				Messagebox("Error","Error obteniendo ViaSender, por favor intente de nuevo o contacte a tecnologia",Stopsign!)
				return		
			end if
				
			ls_global_sender = trim(ls_global_sender)

			ls_path = "U:\Compliance\Processed\Senders\" + ls_global_sender	

			if not fileexists(ls_path) then CreateDirectory ( ls_path )			

			ls_newfaxfolder = ls_path+"\"
			
			//string  ls_path="my targets"
			//integer li_filenum
			//CreateDirectory ( ls_path )
			//li_filenum = ChangeDirectory( ls_path )

		end if
		// ()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()


		ls_faxname = sle_selected.text
		
		ls_ext = fn_get_file_ext(ls_faxname)
		
		// 06/19/2013 : do not renamed KYC files as Requested by compliance email
		if left(ls_faxname,3) <> 'KYC' then
			ls_newfaxname = "0_"+trim(ls_branch)+"_"+trim(ls_invoice)+"_"+string(today(),"mmddyyyyhhmmss")+ls_ext
		else
			ls_newfaxname = ls_faxname
		end if
		
		IF as_tipo = "REJECT" THEN
			ls_newfaxname = "REJECTED_" + ls_newfaxname
		END IF
		
		if messagebox("Confirm","Are you sure that your want to process this fax as "+ls_newfaxname+" ?",Question!,YesNo!) <> 1 Then
			return
		end if
		if FileExists(ls_faxpath+ls_faxname) then					

			// ----------------------------------------------------------------------------
			// Determina la fecha/hora de creacion del archivo
			WIN32_Find_DataA	lfd_lpFindFileData, lfd_lpFindFileData_Local
			SystemTime	lst_lpSystemTime
			DateTime ldt_filedatetime
			
			FindFirstFile (ls_faxpath+ls_faxname, lfd_lpFindFileData)
			
			FileTimeToLocalFileTime(lfd_lpFindFileData.ftcreationtime, lfd_lpFindFileData_Local.ftcreationtime)
			if FileTimeToSystemTime (lfd_lpFindFileData_Local.ftcreationtime, lst_lpSystemTime) then
				
				//Messagebox("", string (datetime(date(lst_lpSystemTime.wyear, &
				//	lst_lpSystemTime.wmonth, lst_lpSystemTime.wday),time(lst_lpSystemTime.whour, &
				//	lst_lpSystemTime.wminute, lst_lpSystemTime.wsecond)), "dd/mm/yyyy hh:mm:ss"))
				
					ldt_filedatetime = datetime(date(lst_lpSystemTime.wyear, &
					lst_lpSystemTime.wmonth, lst_lpSystemTime.wday),time(lst_lpSystemTime.whour, &
					lst_lpSystemTime.wminute, lst_lpSystemTime.wsecond))			
			end if
			
			insert into DBA.AUDIT_FAX_CATALOG(DATE_AUDIT,ID_BRANCH,ID_RECEIVER,FAXTIME,FAX_OLDNAME,FAX_NEWNAME,FAX_CATEGORY,DB_USER_NAME,DB_HOST_NAME)
			values(getdate(),:ls_branch,:ls_invoice,:ldt_filedatetime,:ls_faxpath+:ls_faxname,:ls_newfaxfolder+:ls_newfaxname,'CO',UPPER(SYSTEM_USER),UPPER(HOST_NAME()));			
			// ----------------------------------------------------------------------------
			
			ls_newfaxname = ls_newfaxfolder+ls_newfaxname
			
			IF as_tipo = "REJECT" THEN			
				INSERT INTO dba.COSTUMER_SERVICE (ID_SENDER, ID_BRANCH, ID_RECEIVER, DATE_COSTUMER_SERVICE, TIME_COSTUMER_SERVICE, 
																		ID_CASHIER, DES_COSTUMER_SERVICE, TRANS_COSTUMER_SERVICE, FLAG_COSTUMER_SERVICE, SOURCE, 
																		FLAG_WEB, ID_TYPE_MESSAGE, WEB_USER, ATTACHMENT_PATH)
																		VALUES (:ld_sender, :ls_branch, :ls_invoice, getdate(), getdate(), 
																		:gs_cashier, :ls_rejection, 'N', NULL, NULL, 
																		NULL, 'RM', NULL, :ls_newfaxname);
																		
				tab_rejection.visible = false
				tab_rejection.tp.ddlb_rej_codes.SelectItem(0)
			END IF
			
			fn_filemove(ls_faxpath+ls_faxname, ls_newfaxname)		
			
			if FileExists(ls_faxpath+ls_faxname) then
				ole_fax1.object.FileName = ""
				filedelete(ls_faxpath+ls_faxname)
			end if

		end if
	end if
	ole_fax1.object.FileName = ""
	lb_faxes.DirList(is_faxpath + "*.*", 0)
		
	em_branch.text = ""
	em_invoice.text = ""	
	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// Cleaning Screen
	sle_pos.TextColor	= RGB(0,0,0)
	sle_pos.text = "1/1"
	sle_selected.text = "[No Fax Selected]"
	sle_newname.text = ""
	ole_fax1.object.FileName = ""
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	
	
end if

//CloseWithReturn(parent,'-none-')
//Close(parent)
end subroutine

on w_faxcomponent_compliance.create
int iCurrent
call super::create
this.st_branch=create st_branch
this.em_branch=create em_branch
this.em_invoice=create em_invoice
this.st_invoice=create st_invoice
this.cb_compliance=create cb_compliance
this.cb_delete=create cb_delete
this.tab_rejection=create tab_rejection
this.cb_rejpop=create cb_rejpop
this.st_tooltip_assign_sender=create st_tooltip_assign_sender
this.gb_compliance=create gb_compliance
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_branch
this.Control[iCurrent+2]=this.em_branch
this.Control[iCurrent+3]=this.em_invoice
this.Control[iCurrent+4]=this.st_invoice
this.Control[iCurrent+5]=this.cb_compliance
this.Control[iCurrent+6]=this.cb_delete
this.Control[iCurrent+7]=this.tab_rejection
this.Control[iCurrent+8]=this.cb_rejpop
this.Control[iCurrent+9]=this.st_tooltip_assign_sender
this.Control[iCurrent+10]=this.gb_compliance
end on

on w_faxcomponent_compliance.destroy
call super::destroy
destroy(this.st_branch)
destroy(this.em_branch)
destroy(this.em_invoice)
destroy(this.st_invoice)
destroy(this.cb_compliance)
destroy(this.cb_delete)
destroy(this.tab_rejection)
destroy(this.cb_rejpop)
destroy(this.st_tooltip_assign_sender)
destroy(this.gb_compliance)
end on

event open;call super::open;tab_rejection.visible = false


end event

event mousemove;call super::mousemove;st_tooltip_assign_sender.text = ''
end event

type cb_rotate180 from w_faxcomponent`cb_rotate180 within w_faxcomponent_compliance
end type

type pb_duplicate_page from w_faxcomponent`pb_duplicate_page within w_faxcomponent_compliance
end type

type st_res from w_faxcomponent`st_res within w_faxcomponent_compliance
end type

type sle_id_branch from w_faxcomponent`sle_id_branch within w_faxcomponent_compliance
end type

type st_5 from w_faxcomponent`st_5 within w_faxcomponent_compliance
end type

type pb_separate from w_faxcomponent`pb_separate within w_faxcomponent_compliance
end type

type pb_print from w_faxcomponent`pb_print within w_faxcomponent_compliance
end type

type cb_refresh from w_faxcomponent`cb_refresh within w_faxcomponent_compliance
end type

type pb_previous from w_faxcomponent`pb_previous within w_faxcomponent_compliance
end type

type pb_next from w_faxcomponent`pb_next within w_faxcomponent_compliance
end type

type ole_fax1 from w_faxcomponent`ole_fax1 within w_faxcomponent_compliance
integer x = 1029
integer height = 1712
integer taborder = 0
end type

type lb_faxes from w_faxcomponent`lb_faxes within w_faxcomponent_compliance
integer x = 14
integer y = 260
integer height = 728
integer taborder = 20
end type

event lb_faxes::selectionchanged;call super::selectionchanged;em_branch.text  = sle_id_branch.text 
em_invoice.text  = ls_receiver
end event

type st_2 from w_faxcomponent`st_2 within w_faxcomponent_compliance
end type

type cb_ok from w_faxcomponent`cb_ok within w_faxcomponent_compliance
integer y = 1840
integer taborder = 80
string text = "&Cancel/Close"
end type

type cb_rotateleft from w_faxcomponent`cb_rotateleft within w_faxcomponent_compliance
end type

type cb_rotateright from w_faxcomponent`cb_rotateright within w_faxcomponent_compliance
end type

type st_4 from w_faxcomponent`st_4 within w_faxcomponent_compliance
end type

type st_6 from w_faxcomponent`st_6 within w_faxcomponent_compliance
end type

type sle_pos from w_faxcomponent`sle_pos within w_faxcomponent_compliance
end type

type cb_move from w_faxcomponent`cb_move within w_faxcomponent_compliance
integer y = 1272
end type

type lb_folder from w_faxcomponent`lb_folder within w_faxcomponent_compliance
end type

type st_3 from w_faxcomponent`st_3 within w_faxcomponent_compliance
end type

type sle_selected from w_faxcomponent`sle_selected within w_faxcomponent_compliance
integer y = 1028
end type

type lb_movetofolder from w_faxcomponent`lb_movetofolder within w_faxcomponent_compliance
integer y = 1272
end type

type gb_3 from w_faxcomponent`gb_3 within w_faxcomponent_compliance
integer y = 1384
end type

type gb_1 from w_faxcomponent`gb_1 within w_faxcomponent_compliance
integer y = 1204
end type

type st_1 from w_faxcomponent`st_1 within w_faxcomponent_compliance
integer y = 1036
end type

type sle_newname from w_faxcomponent`sle_newname within w_faxcomponent_compliance
integer y = 1112
end type

type st_7 from w_faxcomponent`st_7 within w_faxcomponent_compliance
integer y = 1120
end type

type sle_email from w_faxcomponent`sle_email within w_faxcomponent_compliance
integer y = 1460
end type

type cb_email from w_faxcomponent`cb_email within w_faxcomponent_compliance
integer y = 1460
end type

type gb_2 from w_faxcomponent`gb_2 within w_faxcomponent_compliance
integer y = 976
end type

type htb_zoom from w_faxcomponent`htb_zoom within w_faxcomponent_compliance
end type

type st_branch from statictext within w_faxcomponent_compliance
integer x = 46
integer y = 1636
integer width = 169
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "Agent:"
boolean focusrectangle = false
end type

type em_branch from editmask within w_faxcomponent_compliance
integer x = 46
integer y = 1692
integer width = 279
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event losefocus;long ll_cont
String ls_branch

ls_branch = em_branch.text

select count(*) into :ll_cont
from dba.branch where id_branch = :ls_branch;

if ll_cont < 1 then 
	st_branch.TextColor = RGB(255,0,0)
else
	st_branch.TextColor = RGB(0,0,0)
end if
end event

type em_invoice from editmask within w_faxcomponent_compliance
integer x = 352
integer y = 1692
integer width = 384
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
end type

event losefocus;long ll_cont
String ls_branch

ls_branch = em_branch.text

select count(*) into :ll_cont
from dba.branch where id_branch = :ls_branch;

if ll_cont < 1 then 
	st_branch.TextColor = RGB(255,0,0)
else
	st_branch.TextColor = RGB(0,0,0)
end if
end event

type st_invoice from statictext within w_faxcomponent_compliance
integer x = 352
integer y = 1636
integer width = 178
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "Invoice:"
boolean focusrectangle = false
end type

type cb_compliance from commandbutton within w_faxcomponent_compliance
event mousemove pbm_mousemove
string tag = "Marks as verified and send file to sender folder"
integer x = 41
integer y = 1784
integer width = 306
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Validate"
end type

event mousemove;st_tooltip_assign_sender.text = "Marks as verified and send file to sender folder"
end event

event clicked; fn_procesar("ASIGN")
end event

type cb_delete from commandbutton within w_faxcomponent_compliance
event mousemove pbm_mousemove
string tag = "Deletes the file"
integer x = 695
integer y = 1784
integer width = 293
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event mousemove;st_tooltip_assign_sender.text = "Deletes the file"
end event

event clicked;Long ll_cont
String ls_selected, ls_branch, ls_invoice, ls_global_sender, ls_path, ls_note, ls_ext
Double ld_sender

ls_selected = sle_selected.text

if isnull(ls_selected) or len(ls_selected) < 1 then
	ls_selected = "-none-"
else
	if not FileExists(is_faxpath+ls_selected) then
		ls_selected = "-none-"
	end if
end if

if ls_selected <> "-none-" then
	
	ls_branch = em_branch.text
	ls_invoice = em_invoice.text
	if isnull(ls_branch) then ls_branch = ''
	if isnull(ls_invoice) then ls_invoice = '0'
	
	select count(*) into :ll_cont
	from dba.branch where id_branch = :ls_branch;
	
	if ll_cont < 1 then 
		Messagebox("Branch not Found","The branch ["+ls_branch+"] was not found",StopSign!)
		SetFocus(em_branch)
		return
	end if		
	
	// Moviendo el Fax a la carpeta deseada
	if sle_selected.text <> "[No Fax Selected]" then
	
		String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname, ls_processed
	
		ls_faxpath = is_faxpath
		
		ls_processed = "Rejected\"
						
		ls_newfaxfolder = "U:\Compliance\"+ls_processed

		SELECT convert(varchar,id_sender_global), dba.sender.id_sender
		INTO :ls_global_sender, :ld_sender
		FROM dba.receiver, dba.sender
		WHERE dba.receiver.ID_BRANCH = dba.sender.ID_BRANCH
		AND dba.receiver.id_sender = dba.sender.id_sender
		AND dba.receiver.id_branch = :ls_branch
		AND dba.receiver.id_receiver = :ls_invoice;
		
		if isnull(ls_global_sender) or ls_global_sender = '0' or ls_global_sender = '' then		
			Messagebox("Error","Error obteniendo ViaSender, por favor intente de nuevo o contacte a tecnologia",Stopsign!)
			return		
		end if
			
		ls_global_sender = 'VIASEN_'+trim(ls_global_sender)

		ls_faxname = sle_selected.text
		ls_ext = fn_get_file_ext(ls_faxname)
		
		ls_newfaxname = "REJ_"+trim(ls_branch)+"_"+trim(ls_invoice)+"_"+ls_global_sender+ '_FAX_'+ls_faxname+'_'+ string(today(),"mmddyyyyhhmmss")+ls_ext
		
		if messagebox("Confirm","Are you sure that your want to DELETE the fax "+ls_faxname+" ?",Question!,YesNo!) <> 1 Then
			return
		end if
		
		if FileExists(ls_faxpath+ls_faxname) then				
			ls_newfaxname = ls_newfaxfolder+ls_newfaxname
			
			fn_filemove(ls_faxpath+ls_faxname,ls_newfaxname)		
			
			if FileExists(ls_faxpath+ls_faxname) then
				ole_fax1.object.FileName = ""
				filedelete(ls_faxpath+ls_faxname)
			end if
		end if
	end if
	
	ole_fax1.object.FileName = ""
	lb_faxes.DirList(is_faxpath + "*.*", 0)
				
	em_branch.text = ""
	em_invoice.text = ""
	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// Cleaning Screen
	sle_pos.TextColor	= RGB(0,0,0)
	sle_pos.text = "1/1"
	sle_selected.text = "[No Fax Selected]"
	sle_newname.text = ""
	ole_fax1.object.FileName = ""
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	
	
end if
end event

event losefocus;st_tooltip_assign_sender.text = ""
end event

type tab_rejection from tab within w_faxcomponent_compliance
integer x = 1029
integer y = 1536
integer width = 663
integer height = 356
integer taborder = 70
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
ddlb_rej_codes ddlb_rej_codes
st_8 st_8
cb_rejcancel cb_rejcancel
cb_reject cb_reject
end type

on tp.create
this.ddlb_rej_codes=create ddlb_rej_codes
this.st_8=create st_8
this.cb_rejcancel=create cb_rejcancel
this.cb_reject=create cb_reject
this.Control[]={this.ddlb_rej_codes,&
this.st_8,&
this.cb_rejcancel,&
this.cb_reject}
end on

on tp.destroy
destroy(this.ddlb_rej_codes)
destroy(this.st_8)
destroy(this.cb_rejcancel)
destroy(this.cb_reject)
end on

type ddlb_rej_codes from dropdownlistbox within tp
integer x = 23
integer y = 84
integer width = 553
integer height = 208
integer taborder = 20
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

type st_8 from statictext within tp
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

type cb_rejcancel from commandbutton within tp
integer x = 14
integer y = 192
integer width = 288
integer height = 84
integer taborder = 80
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

type cb_reject from commandbutton within tp
integer x = 329
integer y = 192
integer width = 261
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reject"
end type

event clicked;fn_procesar("REJECT")
end event

type cb_rejpop from commandbutton within w_faxcomponent_compliance
event mousemove pbm_mousemove
string tag = "Marks as rejected and send file to sender folder"
integer x = 366
integer y = 1784
integer width = 311
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reject"
end type

event mousemove;st_tooltip_assign_sender.text = "Marks as rejected and send file to sender folder"
end event

event clicked;tab_rejection.Visible = true
end event

event losefocus;st_tooltip_assign_sender.text = ""
end event

type st_tooltip_assign_sender from statictext within w_faxcomponent_compliance
integer x = 27
integer y = 1956
integer width = 1061
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

type gb_compliance from groupbox within w_faxcomponent_compliance
integer x = 9
integer y = 1572
integer width = 1006
integer height = 328
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Assign Fax To Sender"
end type

