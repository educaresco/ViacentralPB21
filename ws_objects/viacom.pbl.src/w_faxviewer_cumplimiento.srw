$PBExportHeader$w_faxviewer_cumplimiento.srw
forward
global type w_faxviewer_cumplimiento from pfc_w_master
end type
type cb_separate from commandbutton within w_faxviewer_cumplimiento
end type
type st_7 from statictext within w_faxviewer_cumplimiento
end type
type sle_newname from singlelineedit within w_faxviewer_cumplimiento
end type
type cb_ok2 from commandbutton within w_faxviewer_cumplimiento
end type
type lb_faxes from listbox within w_faxviewer_cumplimiento
end type
type cb_ok from commandbutton within w_faxviewer_cumplimiento
end type
type ole_fax from olecustomcontrol within w_faxviewer_cumplimiento
end type
type lb_faxes1 from listbox within w_faxviewer_cumplimiento
end type
type cb_3 from commandbutton within w_faxviewer_cumplimiento
end type
type sle_zoom from singlelineedit within w_faxviewer_cumplimiento
end type
type cb_zoomout from commandbutton within w_faxviewer_cumplimiento
end type
type sle_selected from singlelineedit within w_faxviewer_cumplimiento
end type
type st_2 from statictext within w_faxviewer_cumplimiento
end type
type cb_cancel from commandbutton within w_faxviewer_cumplimiento
end type
type gb_2 from groupbox within w_faxviewer_cumplimiento
end type
type cb_1 from commandbutton within w_faxviewer_cumplimiento
end type
type st_branch from statictext within w_faxviewer_cumplimiento
end type
type cb_2 from commandbutton within w_faxviewer_cumplimiento
end type
type cb_rrr from commandbutton within w_faxviewer_cumplimiento
end type
type cb_4 from commandbutton within w_faxviewer_cumplimiento
end type
type em_branch from editmask within w_faxviewer_cumplimiento
end type
type cb_rotateright from commandbutton within w_faxviewer_cumplimiento
end type
type st_4 from statictext within w_faxviewer_cumplimiento
end type
type st_5 from statictext within w_faxviewer_cumplimiento
end type
type st_6 from statictext within w_faxviewer_cumplimiento
end type
type sle_pos from singlelineedit within w_faxviewer_cumplimiento
end type
type cb_refresh from commandbutton within w_faxviewer_cumplimiento
end type
type cb_printall from commandbutton within w_faxviewer_cumplimiento
end type
type cb_move from commandbutton within w_faxviewer_cumplimiento
end type
type lb_movetofolder from dropdownlistbox within w_faxviewer_cumplimiento
end type
type em_invoice from editmask within w_faxviewer_cumplimiento
end type
type st_folder from statictext within w_faxviewer_cumplimiento
end type
type st_1 from statictext within w_faxviewer_cumplimiento
end type
type st_invoice from statictext within w_faxviewer_cumplimiento
end type
type gb_1 from groupbox within w_faxviewer_cumplimiento
end type
type filetime from structure within w_faxviewer_cumplimiento
end type
type win32_find_dataa from structure within w_faxviewer_cumplimiento
end type
type systemtime from structure within w_faxviewer_cumplimiento
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

global type w_faxviewer_cumplimiento from pfc_w_master
integer width = 3621
integer height = 2024
long backcolor = 80269524
cb_separate cb_separate
st_7 st_7
sle_newname sle_newname
cb_ok2 cb_ok2
lb_faxes lb_faxes
cb_ok cb_ok
ole_fax ole_fax
lb_faxes1 lb_faxes1
cb_3 cb_3
sle_zoom sle_zoom
cb_zoomout cb_zoomout
sle_selected sle_selected
st_2 st_2
cb_cancel cb_cancel
gb_2 gb_2
cb_1 cb_1
st_branch st_branch
cb_2 cb_2
cb_rrr cb_rrr
cb_4 cb_4
em_branch em_branch
cb_rotateright cb_rotateright
st_4 st_4
st_5 st_5
st_6 st_6
sle_pos sle_pos
cb_refresh cb_refresh
cb_printall cb_printall
cb_move cb_move
lb_movetofolder lb_movetofolder
em_invoice em_invoice
st_folder st_folder
st_1 st_1
st_invoice st_invoice
gb_1 gb_1
end type
global w_faxviewer_cumplimiento w_faxviewer_cumplimiento

type prototypes
Function ulong FindFirstFile (string lpFileName, ref WIN32_FIND_DATAA lpFindFileData) Library "KERNEL32.DLL" Alias for "FindFirstFileA;Ansi"
Function boolean FileTimeToSystemTime (ref FILETIME lpFileTime, ref SYSTEMTIME lpSystemTime) Library "KERNEL32.DLL" alias for "FileTimeToSystemTime;Ansi"
Function boolean FileTimeToLocalFileTime (ref FILETIME lpFileTime, ref FILETIME lpLocalFileTime) Library "KERNEL32.DLL" alias for "FileTimeToLocalFileTime;Ansi"

end prototypes

type variables
String   is_faxpath
end variables

on w_faxviewer_cumplimiento.create
int iCurrent
call super::create
this.cb_separate=create cb_separate
this.st_7=create st_7
this.sle_newname=create sle_newname
this.cb_ok2=create cb_ok2
this.lb_faxes=create lb_faxes
this.cb_ok=create cb_ok
this.ole_fax=create ole_fax
this.lb_faxes1=create lb_faxes1
this.cb_3=create cb_3
this.sle_zoom=create sle_zoom
this.cb_zoomout=create cb_zoomout
this.sle_selected=create sle_selected
this.st_2=create st_2
this.cb_cancel=create cb_cancel
this.gb_2=create gb_2
this.cb_1=create cb_1
this.st_branch=create st_branch
this.cb_2=create cb_2
this.cb_rrr=create cb_rrr
this.cb_4=create cb_4
this.em_branch=create em_branch
this.cb_rotateright=create cb_rotateright
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.sle_pos=create sle_pos
this.cb_refresh=create cb_refresh
this.cb_printall=create cb_printall
this.cb_move=create cb_move
this.lb_movetofolder=create lb_movetofolder
this.em_invoice=create em_invoice
this.st_folder=create st_folder
this.st_1=create st_1
this.st_invoice=create st_invoice
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_separate
this.Control[iCurrent+2]=this.st_7
this.Control[iCurrent+3]=this.sle_newname
this.Control[iCurrent+4]=this.cb_ok2
this.Control[iCurrent+5]=this.lb_faxes
this.Control[iCurrent+6]=this.cb_ok
this.Control[iCurrent+7]=this.ole_fax
this.Control[iCurrent+8]=this.lb_faxes1
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.sle_zoom
this.Control[iCurrent+11]=this.cb_zoomout
this.Control[iCurrent+12]=this.sle_selected
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.cb_cancel
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.st_branch
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_rrr
this.Control[iCurrent+20]=this.cb_4
this.Control[iCurrent+21]=this.em_branch
this.Control[iCurrent+22]=this.cb_rotateright
this.Control[iCurrent+23]=this.st_4
this.Control[iCurrent+24]=this.st_5
this.Control[iCurrent+25]=this.st_6
this.Control[iCurrent+26]=this.sle_pos
this.Control[iCurrent+27]=this.cb_refresh
this.Control[iCurrent+28]=this.cb_printall
this.Control[iCurrent+29]=this.cb_move
this.Control[iCurrent+30]=this.lb_movetofolder
this.Control[iCurrent+31]=this.em_invoice
this.Control[iCurrent+32]=this.st_folder
this.Control[iCurrent+33]=this.st_1
this.Control[iCurrent+34]=this.st_invoice
this.Control[iCurrent+35]=this.gb_1
end on

on w_faxviewer_cumplimiento.destroy
call super::destroy
destroy(this.cb_separate)
destroy(this.st_7)
destroy(this.sle_newname)
destroy(this.cb_ok2)
destroy(this.lb_faxes)
destroy(this.cb_ok)
destroy(this.ole_fax)
destroy(this.lb_faxes1)
destroy(this.cb_3)
destroy(this.sle_zoom)
destroy(this.cb_zoomout)
destroy(this.sle_selected)
destroy(this.st_2)
destroy(this.cb_cancel)
destroy(this.gb_2)
destroy(this.cb_1)
destroy(this.st_branch)
destroy(this.cb_2)
destroy(this.cb_rrr)
destroy(this.cb_4)
destroy(this.em_branch)
destroy(this.cb_rotateright)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.sle_pos)
destroy(this.cb_refresh)
destroy(this.cb_printall)
destroy(this.cb_move)
destroy(this.lb_movetofolder)
destroy(this.em_invoice)
destroy(this.st_folder)
destroy(this.st_1)
destroy(this.st_invoice)
destroy(this.gb_1)
end on

event open;call super::open;String ls_faxserver

ls_faxserver = fn_busparameter("FAXSERVER")

if isnull(ls_faxserver) or len(trim(ls_faxserver)) < 1 then ls_faxserver = 'Faxserver01'

X=1
Y=1

lb_movetofolder.text = "Junk"

if not fileexists("u:\Compliance") then
	fn_mapnetworkdrive("u","\\"+ls_faxserver+"\Faxes")
end if

if not fileexists("u:\Compliance") then
	messagebox("Error","The fax' folder cannot be mapped.~nPlease map the network drive manually.",StopSign!)
	close(this)
	return	
end if

is_faxpath = "u:\Compliance\"

lb_faxes.DirList(is_faxpath + "*.TIF", 0)



end event

event resize;call super::resize;ole_fax.Height = this.Height - 344
ole_fax.Width = this.Width - 809

cb_ok2.x = this.Width - (3593 - 3045) - 520
cb_ok2.y = this.Height - (2280 - 2052)

cb_cancel.x = this.Width - (3593 - 3045) - 20
cb_cancel.y = this.Height - (2280 - 2052)
end event

type cb_separate from commandbutton within w_faxviewer_cumplimiento
integer x = 2542
integer y = 4
integer width = 329
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Separar Pag."
end type

event clicked;SetPointer(HourGlass!)

TRY

	double ld_current
	String ls_tempdrive, ls_temp_name
	Integer li_page, li_pages
	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	ole_fax.object.image = is_faxpath+lb_faxes.SelectedItem()

	li_pages= ole_fax.object.PageCount()

	if ole_fax.object.PageCount() = 1 then 
		Messagebox("Error!","El fax seleccionado solo tiene una pagina!")
		return
	end if
	
	if ole_fax.object.PageCount() > 10 then		
		Messagebox("Error!","Esta funcion solo funciona hasta 9 paginas!")
		return		
	end if

	
	ls_tempdrive = left(is_faxpath,1)+':\Temp\'


	for li_page = 1 to li_pages
		
		ls_temp_name = fn_replace(upper(lb_faxes.SelectedItem()),'.TIF','_PAGE'+string(li_page)+'.TIF')		
		
		FileCopy(is_faxpath+lb_faxes.SelectedItem(),ls_tempdrive+ls_temp_name)
		ole_fax.object.image = ls_tempdrive+ls_temp_name
		
		// Si no es la 1
		if li_page > 1 then
			// Antes de la 1
			ole_fax.object.DeletePages(1, li_page - 1)			
			// si no es la ultima
			if li_page < li_pages then
				ole_fax.object.DeletePages(2, (li_pages - li_page))			
			end if
		else			
			ole_fax.object.DeletePages(2, li_pages - 1)			
		end if
				
		// Ubica el archivo con la pagina separada en la carpeta original
		fn_FileMove(ls_tempdrive+ls_temp_name,is_faxpath+ls_temp_name)
		
	next				

	Messagebox("Process Complete","Las "+string(li_pages)+" han sido separadas, la lista de faxes sera actualizada!")
	cb_refresh.TriggerEvent(Clicked!)

CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","El fax seleccionado fue movido, la lista sera actualizada! "+er.text,Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   

	SetPointer(Arrow!)

	Return

END TRY 
end event

type st_7 from statictext within w_faxviewer_cumplimiento
integer x = 37
integer y = 1484
integer width = 160
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Name:"
boolean focusrectangle = false
end type

type sle_newname from singlelineedit within w_faxviewer_cumplimiento
integer x = 197
integer y = 1472
integer width = 407
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cb_ok2 from commandbutton within w_faxviewer_cumplimiento
integer x = 2542
integer y = 1792
integer width = 480
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ok"
boolean default = true
end type

event clicked;
Long ll_cont
String ls_selected, ls_branch, ls_invoice, ls_global_sender, ls_path
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

			 SELECT convert(varchar,id_sender_global)
			    INTO :ls_global_sender
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
		ls_newfaxname = "0_"+trim(ls_branch)+"_"+trim(ls_invoice)+"_"+string(today(),"mmddyyyyhhmmss")+".tif"
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
			
			fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+ls_newfaxname)										

		end if
	end if
	ole_fax.object.ClearDisplay
	lb_faxes.DirList(is_faxpath + "*.TIF", 0)
	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// Cleaning Screen
	sle_pos.TextColor	= RGB(0,0,0)
	sle_pos.text = "1/1"
	sle_zoom.text = '50'
	sle_selected.text = "[No Fax Selected]"
	sle_newname.text = ""
	ole_fax.object.ClearDisplay()
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	
	
end if

CloseWithReturn(parent,'-none-')
end event

type lb_faxes from listbox within w_faxviewer_cumplimiento
integer x = 32
integer y = 176
integer width = 581
integer height = 920
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String ls_faxname, ls_faxbranch

TRY

	double ld_current
	
	ole_fax.object.image = is_faxpath+lb_faxes.SelectedItem()
	sle_selected.text = lb_faxes.SelectedItem()
	sle_newname.text = sle_selected.text
	ld_current=double(sle_zoom.text)
	ole_fax.object.zoom = ld_current
	ole_fax.object.Page = 1

	ole_fax.object.display
	sle_pos.text = String(ole_fax.object.Page)+"/"+string(ole_fax.object.PageCount)
	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>
	// Color Number of pages
	sle_pos.TextColor	= RGB(0,0,0)	
	if ole_fax.object.PageCount > 1 then sle_pos.TextColor	= RGB(255,0,0)
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	ole_fax.object.zoom = 50
	sle_zoom.text = '50'
	ole_fax.object.display			
	

	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 

end event

type cb_ok from commandbutton within w_faxviewer_cumplimiento
boolean visible = false
integer x = 1431
integer y = 2032
integer width = 480
integer height = 148
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Ok"
boolean default = true
end type

event clicked;
long total, i
string ls_filename, ls_path,  ls_branch, ls_invoice

WIN32_Find_DataA	lfd_lpFindFileData, lfd_lpFindFileData_Local
SystemTime	lst_lpSystemTime
DateTime ldt_filedatetime


SetPointer(HourGlass!)



lb_faxes1.DirList("U:\Compliance\Processed\*.TIF",0)

Total = lb_faxes1.TotalItems()

FOR i = 1 TO Total
	
	lb_faxes1.SetState(i, TRUE)
	
	if i<>1 then
		lb_faxes1.SetState(i - 1,FALSE)
	end if
	
	lb_faxes1.selectitem(i)
	ls_filename = lb_faxes1.selecteditem()
	ls_path = "U:\Compliance\Processed\"+ls_filename
		
			// ----------------------------------------------------------------------------
			// Determina la fecha/hora de creacion del archivo

			ls_branch = fn_token(ls_filename,'_',2)
			ls_invoice = fn_token(ls_filename,'_',3)			
			
			FindFirstFile (ls_path, lfd_lpFindFileData)
			
			FileTimeToLocalFileTime(lfd_lpFindFileData.ftlastwritetime, lfd_lpFindFileData_Local.ftlastwritetime)
			if FileTimeToSystemTime (lfd_lpFindFileData_Local.ftlastwritetime, lst_lpSystemTime) then
				
				//Messagebox("", string (datetime(date(lst_lpSystemTime.wyear, &
				//	lst_lpSystemTime.wmonth, lst_lpSystemTime.wday),time(lst_lpSystemTime.whour, &
				//	lst_lpSystemTime.wminute, lst_lpSystemTime.wsecond)), "dd/mm/yyyy hh:mm:ss"))
				
					ldt_filedatetime = datetime(date(lst_lpSystemTime.wyear, &
					lst_lpSystemTime.wmonth, lst_lpSystemTime.wday),time(lst_lpSystemTime.whour, &
					lst_lpSystemTime.wminute, lst_lpSystemTime.wsecond))			
			end if
			
			insert into DBA.AUDIT_FAX_CATALOG(DATE_AUDIT,ID_BRANCH,ID_RECEIVER,FAXTIME,FAX_OLDNAME,FAX_NEWNAME,FAX_CATEGORY,DB_USER_NAME,DB_HOST_NAME)
			values(getdate(),:ls_branch,:ls_invoice,:ldt_filedatetime,:ls_path,:ls_path,'CO',UPPER(SYSTEM_USER),UPPER(HOST_NAME()));			
			// ----------------------------------------------------------------------------
		
	//fn_filemove(ls_path,"d:\faxes\processed\"+ls_filename)	

NEXT







////lb_faxes1
//
//
//
//Long ll_cont
//String ls_selected, ls_branch, ls_invoice
//ls_selected = sle_selected.text
//
//if isnull(ls_selected) or len(ls_selected) < 1 then
//	ls_selected = "-none-"
//else
//	if not FileExists(is_faxpath+ls_selected) then
//		ls_selected = "-none-"
//	end if
//end if
//
//if ls_selected <> "-none-" then
//	
//	ls_branch = em_branch.text
//	ls_invoice = em_invoice.text
//	if isnull(ls_branch) then ls_branch = ''
//	if isnull(ls_invoice) then ls_invoice = '0'
//	
//	select count(*) into :ll_cont
//	from dba.branch where id_branch = :ls_branch;
//	
//	if ll_cont < 1 then 
//		Messagebox("Branch not Found","The branch ["+ls_branch+"] was not found",StopSign!)
//		SetFocus(em_branch)
//		return
//	end if
//	
//	
//	// Moviendo el Fax a la carpeta deseada
//	if sle_selected.text <> "[No Fax Selected]" then
//	
//		String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname
//	
////		is_faxpath
//	
//		ls_faxpath = is_faxpath
//		ls_newfaxfolder = "u:\Compliance\Processed\"
//		ls_faxname = sle_selected.text
//		ls_newfaxname = "0_"+trim(ls_branch)+"_"+trim(ls_invoice)+"_"+string(today(),"mmddyyyyhhmmss")+".tif"
//		if messagebox("Confirm","Are you sure that your want to process this fax as "+ls_newfaxname+" ?",Question!,YesNo!) <> 1 Then
//			return
//		end if
//		if FileExists(ls_faxpath+ls_faxname) then					
//
//			// ----------------------------------------------------------------------------
//			// Determina la fecha/hora de creacion del archivo
//			WIN32_Find_DataA	lfd_lpFindFileData, lfd_lpFindFileData_Local
//			SystemTime	lst_lpSystemTime
//			DateTime ldt_filedatetime
//			
//			FindFirstFile (ls_faxpath+ls_faxname, lfd_lpFindFileData)
//			
//			FileTimeToLocalFileTime(lfd_lpFindFileData.ftcreationtime, lfd_lpFindFileData_Local.ftcreationtime)
//			if FileTimeToSystemTime (lfd_lpFindFileData_Local.ftcreationtime, lst_lpSystemTime) then
//				
//				//Messagebox("", string (datetime(date(lst_lpSystemTime.wyear, &
//				//	lst_lpSystemTime.wmonth, lst_lpSystemTime.wday),time(lst_lpSystemTime.whour, &
//				//	lst_lpSystemTime.wminute, lst_lpSystemTime.wsecond)), "dd/mm/yyyy hh:mm:ss"))
//				
//					ldt_filedatetime = datetime(date(lst_lpSystemTime.wyear, &
//					lst_lpSystemTime.wmonth, lst_lpSystemTime.wday),time(lst_lpSystemTime.whour, &
//					lst_lpSystemTime.wminute, lst_lpSystemTime.wsecond))			
//			end if
//			
//			insert into DBA.AUDIT_FAX_CATALOG(DATE_AUDIT,ID_BRANCH,ID_RECEIVER,FAXTIME,FAX_OLDNAME,FAX_NEWNAME,FAX_CATEGORY,DB_USER_NAME,DB_HOST_NAME)
//			values(getdate(),:ls_branch,:ls_invoice,:ldt_filedatetime,:ls_faxpath+:ls_faxname,:ls_newfaxfolder+:ls_newfaxname,'CO',UPPER(SYSTEM_USER),UPPER(HOST_NAME()));			
//			// ----------------------------------------------------------------------------
//			
//			fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+ls_newfaxname)										
//
//		end if
//	end if
//	ole_fax.object.ClearDisplay
//	lb_faxes.DirList(is_faxpath + "*.TIF", 0)
//	
//	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//	// Cleaning Screen
//	sle_pos.TextColor	= RGB(0,0,0)
//	sle_pos.text = "1/1"
//	sle_zoom.text = '50'
//	sle_selected.text = "[No Fax Selected]"
//	ole_fax.object.ClearDisplay()
//	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	
//	
//end if
//
//CloseWithReturn(parent,'-none-')
end event

type ole_fax from olecustomcontrol within w_faxviewer_cumplimiento
event keydown ( ref integer keycode,  integer shift )
event keyup ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event click ( )
event dblclick ( )
event ocx_error ( integer number,  ref string description,  long scode,  string source,  string helpfile,  long helpcontext,  ref boolean canceldisplay )
event ocx_close ( )
event markend ( long left,  long top,  long ocx_width,  long ocx_height,  integer marktype,  string groupname )
event toolselected ( integer toolid )
event selectionrectdrawn ( long left,  long top,  long ocx_width,  long ocx_height )
event tooltip ( integer index )
event toolpalettehidden ( long left,  long top )
event scroll ( )
event markselect ( integer button,  integer shift,  long left,  long top,  long ocx_width,  long ocx_height,  integer marktype,  string groupname )
event pastecompleted ( )
event load ( double zoom )
event markmove ( integer marktype,  string groupname )
event pagepropertiesclose ( )
event checkcontinueprinting ( long pagesprinted,  long currentpage,  integer status )
event hyperlinkgotopage ( long page )
event errorsavingundoinformation ( long ocx_error )
event hyperlinkgotodoc ( string link,  long page,  ref boolean handled )
event editingtextannotation ( boolean editing )
event pasteclip ( ref long mode )
event readystatechange ( long readystate )
integer x = 690
integer y = 88
integer width = 2834
integer height = 1684
boolean bringtotop = true
string binarykey = "w_faxviewer_cumplimiento.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event externalexception;

// Funciono pero no previno el system error

//Messagebox("Error - (ExternalException)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
//cb_refresh.TriggerEvent(Clicked!)
end event

type lb_faxes1 from listbox within w_faxviewer_cumplimiento
boolean visible = false
integer x = 837
integer y = 2024
integer width = 581
integer height = 156
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;double ld_current

ole_fax.object.image = is_faxpath+lb_faxes.SelectedItem()
sle_selected.text = lb_faxes.SelectedItem()
ld_current=double(sle_zoom.text)
ole_fax.object.zoom = ld_current
ole_fax.object.Page = 1
ole_fax.object.display

sle_pos.text = String(ole_fax.object.Page)+"/"+string(ole_fax.object.PageCount)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>
// Color Number of pages
sle_pos.TextColor	= RGB(0,0,0)	
if ole_fax.object.PageCount > 1 then sle_pos.TextColor	= RGB(255,0,0)
// >>>>>>>>>>>>>>>>>>>>>>>>>>>

ole_fax.object.zoom = 50
sle_zoom.text = '50'
ole_fax.object.display
end event

type cb_3 from commandbutton within w_faxviewer_cumplimiento
integer x = 1609
integer y = 8
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "+"
end type

event clicked;TRY

	double ld_current
	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
		return
	end if
	
	ld_current=double(sle_zoom.text)
	
	if ld_current < 300 then
		ole_fax.object.zoom = ld_current + 10
		sle_zoom.text = string(ld_current + 10)
		ole_fax.object.display
	end if
	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 
end event

type sle_zoom from singlelineedit within w_faxviewer_cumplimiento
integer x = 1723
integer y = 8
integer width = 142
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "100"
boolean autohscroll = false
boolean displayonly = true
end type

type cb_zoomout from commandbutton within w_faxviewer_cumplimiento
integer x = 1865
integer y = 8
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "-"
end type

event clicked;TRY

	double ld_current
	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
		return
	end if
	
	ld_current=double(sle_zoom.text)
	
	if ld_current > 10 then
		ole_fax.object.zoom = ld_current - 10
		sle_zoom.text = string(ld_current - 10)
		ole_fax.object.display
	end if
	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 	
end event

type sle_selected from singlelineedit within w_faxviewer_cumplimiento
integer x = 32
integer y = 1152
integer width = 581
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_faxviewer_cumplimiento
integer x = 55
integer y = 44
integer width = 411
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Faxes available:"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_faxviewer_cumplimiento
integer x = 3040
integer y = 1792
integer width = 480
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(parent,"-none-")
end event

type gb_2 from groupbox within w_faxviewer_cumplimiento
integer x = 9
integer y = 1412
integer width = 631
integer height = 368
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Move To"
end type

type cb_1 from commandbutton within w_faxviewer_cumplimiento
integer x = 1202
integer y = 8
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
string text = "<"
end type

event clicked;TRY 
	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
		return
	end if
	
	ole_fax.object.RotateLeft
	ole_fax.object.Save
	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 
end event

type st_branch from statictext within w_faxviewer_cumplimiento
integer x = 55
integer y = 1248
integer width = 169
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "Agent:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_faxviewer_cumplimiento
integer x = 2391
integer y = 8
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
string text = ">"
end type

event clicked;TRY

	integer li_current
	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
		return
	end if
	
	// ole_fax.object.PageCount
	li_current = ole_fax.object.Page
	
	if li_current < ole_fax.object.PageCount then
		li_current = li_current + 1
		ole_fax.object.Page = li_current
		ole_fax.object.display
	end if
	
	sle_pos.text = String(ole_fax.object.Page)+"/"+string(ole_fax.object.PageCount)
	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 
end event

type cb_rrr from commandbutton within w_faxviewer_cumplimiento
integer x = 2139
integer y = 8
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
string text = "<"
end type

event clicked;TRY

	integer li_current
	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
		return
	end if
	
	// ole_fax.object.PageCount
	li_current = ole_fax.object.Page
	
	if li_current > 1 then
		li_current = li_current - 1
		ole_fax.object.Page = li_current
		ole_fax.object.display
	end if
	
	sle_pos.text = String(ole_fax.object.Page)+"/"+string(ole_fax.object.PageCount)
	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 
end event

type cb_4 from commandbutton within w_faxviewer_cumplimiento
integer x = 2889
integer y = 4
integer width = 315
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print Page"
end type

event clicked;TRY

	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
		return
	end if
	ole_fax.object.PrintImage(ole_fax.object.Page,ole_fax.object.Page)

CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 


end event

type em_branch from editmask within w_faxviewer_cumplimiento
integer x = 32
integer y = 1304
integer width = 279
integer height = 76
integer taborder = 20
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

type cb_rotateright from commandbutton within w_faxviewer_cumplimiento
integer x = 1321
integer y = 8
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
string text = ">"
end type

event clicked;TRY

	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
		return
	end if
	
	ole_fax.object.RotateRight
	ole_fax.object.Save
	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 
end event

type st_4 from statictext within w_faxviewer_cumplimiento
integer x = 987
integer y = 12
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Rotation"
boolean focusrectangle = false
end type

type st_5 from statictext within w_faxviewer_cumplimiento
integer x = 1463
integer y = 12
integer width = 137
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Zoom"
boolean focusrectangle = false
end type

type st_6 from statictext within w_faxviewer_cumplimiento
integer x = 2011
integer y = 12
integer width = 119
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Page"
boolean focusrectangle = false
end type

type sle_pos from singlelineedit within w_faxviewer_cumplimiento
integer x = 2249
integer y = 8
integer width = 142
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "1/1"
boolean autohscroll = false
boolean displayonly = true
end type

type cb_refresh from commandbutton within w_faxviewer_cumplimiento
integer x = 690
integer y = 8
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Refresh"
end type

event clicked;lb_faxes.DirList(is_faxpath + "*.TIF", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
sle_newname.text = ""
ole_fax.object.ClearDisplay()
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type cb_printall from commandbutton within w_faxviewer_cumplimiento
integer x = 3218
integer y = 4
integer width = 306
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print All"
end type

event clicked;TRY

	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
		return
	end if
	ole_fax.object.PrintImage(1,ole_fax.object.PageCount)


CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 
end event

type cb_move from commandbutton within w_faxviewer_cumplimiento
integer x = 32
integer y = 1660
integer width = 581
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Move"
end type

event clicked;// Moviendo el Fax a la carpeta deseada
if sle_selected.text <> "[No Fax Selected]" then

	String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname

	ls_faxpath = is_faxpath
	ls_newfaxfolder = "u:\"+lb_movetofolder.text+"\"
	ls_faxname = sle_selected.text
	ls_newfaxname = sle_newname.text
	
	if messagebox("Confirm","Are you sure that your want to move the fax " + sle_selected.text + " to "+ls_newfaxfolder+"?",Question!,YesNo!) <> 1 Then
		return
	end if

	if FileExists(ls_faxpath+ls_faxname) then
		ls_newfaxname = fn_replace(ls_newfaxname,".tif","") + "_"+gs_login+'_'+ string(today(),'mmddyyhhmmss')+".tif"
		fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+ls_newfaxname)										
	end if	
	
end if
ole_fax.object.ClearDisplay
lb_faxes.DirList(is_faxpath + "*.TIF", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
sle_newname.text = ""
ole_fax.object.ClearDisplay()
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type lb_movetofolder from dropdownlistbox within w_faxviewer_cumplimiento
integer x = 32
integer y = 1564
integer width = 581
integer height = 492
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Ach","Applications","Compliance","Corporate","Corporate\Processed","Junk","RedPhone","Accounting","Inbox","Marketing"}
borderstyle borderstyle = stylelowered!
end type

type em_invoice from editmask within w_faxviewer_cumplimiento
integer x = 325
integer y = 1304
integer width = 288
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

type st_folder from statictext within w_faxviewer_cumplimiento
integer x = 55
integer y = 108
integer width = 411
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Compliance"
boolean focusrectangle = false
end type

type st_1 from statictext within w_faxviewer_cumplimiento
integer x = 55
integer y = 1100
integer width = 247
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Selected:"
boolean focusrectangle = false
end type

type st_invoice from statictext within w_faxviewer_cumplimiento
integer x = 325
integer y = 1248
integer width = 178
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "Invoice:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_faxviewer_cumplimiento
integer x = 9
integer width = 631
integer height = 1408
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
03w_faxviewer_cumplimiento.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13w_faxviewer_cumplimiento.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
