$PBExportHeader$w_faxcomponent.srw
forward
global type w_faxcomponent from pfc_w_master
end type
type cb_rotate180 from commandbutton within w_faxcomponent
end type
type pb_duplicate_page from picturebutton within w_faxcomponent
end type
type st_res from statictext within w_faxcomponent
end type
type sle_id_branch from singlelineedit within w_faxcomponent
end type
type st_5 from statictext within w_faxcomponent
end type
type pb_separate from picturebutton within w_faxcomponent
end type
type pb_print from picturebutton within w_faxcomponent
end type
type cb_refresh from picturebutton within w_faxcomponent
end type
type pb_previous from picturebutton within w_faxcomponent
end type
type pb_next from picturebutton within w_faxcomponent
end type
type ole_fax1 from olecustomcontrol within w_faxcomponent
end type
type lb_faxes from listbox within w_faxcomponent
end type
type st_2 from statictext within w_faxcomponent
end type
type cb_ok from commandbutton within w_faxcomponent
end type
type cb_rotateleft from commandbutton within w_faxcomponent
end type
type cb_rotateright from commandbutton within w_faxcomponent
end type
type st_4 from statictext within w_faxcomponent
end type
type st_6 from statictext within w_faxcomponent
end type
type sle_pos from singlelineedit within w_faxcomponent
end type
type cb_move from commandbutton within w_faxcomponent
end type
type lb_folder from dropdownlistbox within w_faxcomponent
end type
type st_3 from statictext within w_faxcomponent
end type
type sle_selected from singlelineedit within w_faxcomponent
end type
type lb_movetofolder from dropdownlistbox within w_faxcomponent
end type
type gb_3 from groupbox within w_faxcomponent
end type
type gb_1 from groupbox within w_faxcomponent
end type
type st_1 from statictext within w_faxcomponent
end type
type sle_newname from singlelineedit within w_faxcomponent
end type
type st_7 from statictext within w_faxcomponent
end type
type sle_email from singlelineedit within w_faxcomponent
end type
type cb_email from commandbutton within w_faxcomponent
end type
type gb_2 from groupbox within w_faxcomponent
end type
type htb_zoom from htrackbar within w_faxcomponent
end type
end forward

global type w_faxcomponent from pfc_w_master
integer width = 3776
integer height = 1880
string title = "Fax Viewer"
long backcolor = 80269524
cb_rotate180 cb_rotate180
pb_duplicate_page pb_duplicate_page
st_res st_res
sle_id_branch sle_id_branch
st_5 st_5
pb_separate pb_separate
pb_print pb_print
cb_refresh cb_refresh
pb_previous pb_previous
pb_next pb_next
ole_fax1 ole_fax1
lb_faxes lb_faxes
st_2 st_2
cb_ok cb_ok
cb_rotateleft cb_rotateleft
cb_rotateright cb_rotateright
st_4 st_4
st_6 st_6
sle_pos sle_pos
cb_move cb_move
lb_folder lb_folder
st_3 st_3
sle_selected sle_selected
lb_movetofolder lb_movetofolder
gb_3 gb_3
gb_1 gb_1
st_1 st_1
sle_newname sle_newname
st_7 st_7
sle_email sle_email
cb_email cb_email
gb_2 gb_2
htb_zoom htb_zoom
end type
global w_faxcomponent w_faxcomponent

type variables
String   is_faxpath, is_idbranch
Long 	ll_curpage
String ls_receiver, is_app_dir
end variables

forward prototypes
public subroutine fn_rotatefax (string ls_faxpath, string ls_faxname, integer li_grades)
public subroutine fn_loadfax (string ls_filepath)
public subroutine fn_ajustscreen ()
public subroutine fn_loadfaxatpage (string ls_filepath, integer li_page)
public subroutine fn_selectitem ()
public function string fn_get_file_ext (string as_file_name)
end prototypes

public subroutine fn_rotatefax (string ls_faxpath, string ls_faxname, integer li_grades);// USA LA NUEVA FUNCION DE ROTAR UNA SOLA PAGINA, pero por alguna razon aun no funciona!

//integer li_pagetorotate
//
//TRY
//	
//	SetPointer(Hourglass!)
//	
//	//ole_fax1.SetRedraw(false)
//
//
//	if ole_fax1.object.GetTotalPage() > 1 then
//
//		//messagebox("",string(ll_curpage))
//
//		li_pagetorotate = ll_curpage - 1
//
//		if li_grades = 90 then
//			 ole_fax1.object.RotateMultiPageOnly(li_pagetorotate,1)
//		elseif li_grades = 180 then
//			 ole_fax1.object.RotateMultiPageOnly(li_pagetorotate,2)
//		elseif li_grades = 270 then
//			 ole_fax1.object.RotateMultiPageOnly(li_pagetorotate,3)
//		else
//			return
//		end if				
//		 
//	else
//		
//		if li_grades = 90 then
//			ole_fax1.object.Rotate90
//		elseif li_grades = 180 then
//			ole_fax1.object.Rotate180
//		elseif li_grades = 270 then
//			ole_fax1.object.Rotate270
//		else
//			return
//		end if		
//		
////		ole_fax1.object.TIFCompression = 2	
////		ole_fax1.object.Save(ls_originalfile,"TIF")		
//		
//	end if
//
//
//	//ole_fax1.SetRedraw(true)
//	
//	SetPointer(Arrow!)
//	
//	
//CATCH (runtimeerror er)   
//
//   //MessageBox("Runtime Error", er.GetMessage())
//	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!~n~r"+er.GetMessage(),Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//FINALLY   
//   	
//	Return
//	
//END TRY 
//

TRY
	
	SetPointer(Hourglass!)
	
	ole_fax1.SetRedraw(false)
			
	Integer li_originalpage, li_totalpages
	
	li_originalpage = ll_curpage
	li_totalpages =  ole_fax1.object.GetTotalPage()
	
	
	// [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
	// 10/07/2014: Obtains original DPIs
	if ole_fax1.object.Xdpi <> ole_fax1.object.Ydpi then				
								
		ole_fax1.object.FileName = ""
		fn_resample_tif(ls_faxpath + ls_faxname)		
		
		Messagebox("Ajuste de Imagen","La imagen esta siendo redimensionada, por favor intente de nuevo la rotacion",Exclamation!)
		
		// -------------------------------------------------------	
		// Refresh maintianing the previously selected item
		String ls_selected	
		ls_selected = lb_faxes.SelectedItem()
		
		cb_refresh.TriggerEvent(Clicked!)
		
		if fileexists(is_faxpath+ls_selected) then
			lb_faxes.SelectItem( ls_selected,0 ) 						
//			fn_loadfax(ls_selected)
			fn_selectitem()
			ole_fax1.object.View=10	
		end if
		// Refresh maintianing the previously selected item
		// -------------------------------------------------------
		
		ole_fax1.SetRedraw(true)

		st_res.text = String(ole_fax1.object.Xdpi) + 'x'+String(ole_fax1.object.Ydpi)										
		
		return
				
	end if
	// [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
	
		
	// Rotates a Fax:
	if li_grades = 90 then
		ole_fax1.object.Rotate90
	elseif li_grades = 180 then
		ole_fax1.object.Rotate180
	elseif li_grades = 270 then
		ole_fax1.object.Rotate270
	else
		return
	end if
	

	// Save the rorate page as JPG in a temp directory
	String ls_newfilename, ls_originalfile, ls_mergedfile, ls_ext, ls_temp_path
	ls_newfilename = left(ls_faxpath,3) + 'Temp\' + ls_faxname 	
	ls_newfilename = mid(ls_newfilename,1,len(ls_newfilename)-4)
	
	ls_ext = fn_get_file_ext(lb_faxes.SelectedItem())
	ls_ext= mid(ls_ext,2,len(ls_ext))

//	IF lower(ls_ext) = 'tif' THEN ls_ext = 'jpg'

	ls_originalfile = ls_faxpath + lb_faxes.SelectedItem()
//	ls_mergedfile = ls_newfilename +  '_mer_' + string(now(),'hhmmss')
//	ls_newfilename = ls_newfilename +  '_rot_' + string(now(),'hhmmss')	
	
//	ole_fax1.object.TIFCompression = 2	
	//ole_fax1.object.ImageViewer1.JPEGQuality=90
	
//	ole_fax1.object.Save(ls_originalfile,"TIF")
//	ole_fax1.object.Save(ls_newfilename,"JPG")
	ole_fax1.object.Save(ls_newfilename,ls_ext)
	
	ls_temp_path = ls_newfilename + '.' + ls_ext
	

	// Limpia el objeto
	ole_fax1.object.filename = ''
		
	//	// converts the JGP to TIF!
//	ole_fax1.object.RemoveAllTIF()
//	ole_fax1.object.AddTIF(ls_newfilename+'.jpg')	
//	ole_fax1.object.SaveTIF(ls_newfilename+'.TIF')
//	FileDelete(ls_newfilename+'.jpg')
	
//	ole_fax1.object.filename = ''
	
//	Integer li_return
	
//	li_return = ole_fax1.object.TIFMergeMultiFiles(ls_originalfile + '.TIF' + ';' + ls_newfilename+'.TIF', ls_mergedfile+'.TIF',";")
//	
    FileDelete(ls_originalfile)
//	FileDelete(ls_newfilename+'.TIF')
//	
//	if li_return <> 1 then	
//		return
//	end if
	
//	ole_fax1.object.TIFSwap(ls_mergedfile+'.TIF',li_originalpage,li_totalpages+1)
//	ole_fax1.object.TIFDeletePage (ls_mergedfile+'.TIF', li_totalpages+1)
	
	// keep a copy of the original FAX (before rotation)
	if FileExists(left(ls_faxpath,3)+'Junk\Rotated\' + ls_faxname ) then
		FileDelete(ls_faxpath + ls_faxname)
	else
		fn_FileMove(ls_faxpath + ls_faxname,  left(ls_faxpath,3)+'Junk\Rotated\' + ls_faxname )
	end if
	
	fn_FileMove(ls_temp_path,ls_faxpath + ls_faxname)
	
	ole_fax1.object.filename = ls_faxpath + ls_faxname
	
	// Loads original multi tiff
	fn_loadfaxatpage(ls_temp_path,ll_curpage)	
	
	fn_ajustscreen()
	
	fn_selectitem()
	
	ole_fax1.SetRedraw(true)
	
	SetPointer(Arrow!)
	
	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!~n~r"+er.GetMessage(),Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 


	
end subroutine

public subroutine fn_loadfax (string ls_filepath);string ls_ext

// Loads the fax file!
ole_fax1.SetRedraw(false)

ll_curpage = 1

ls_ext = fn_get_file_ext(ls_filepath)

IF upper(ls_ext) = ".TIF" OR upper(ls_ext) = ".TIFF" OR upper(ls_ext) = ".PDF"  THEN
	ole_fax1.object.LoadMultiPage(ls_filepath,1)
	
	// Si tiene usa sola pagina lo lee como imagen (mejor resolucion!)
	if ole_fax1.object.GetTotalPage() = 1 then
		ole_fax1.object.FileName = ls_filepath
	end if	
ELSE
	ole_fax1.object.FileName = ls_filepath
END IF

st_res.text = String(ole_fax1.object.Xdpi) + 'x'+String(ole_fax1.object.Ydpi)

ole_fax1.SetRedraw(true)

end subroutine

public subroutine fn_ajustscreen ();string ls_ext
// after loading a fax, this ajust the screen

///ole_fax1.SetRedraw(false)
///ole_fax1.visible = false

sle_selected.text = lb_faxes.SelectedItem()
sle_newname.text = sle_selected.text

ls_ext = fn_get_file_ext(lb_faxes.SelectedItem())

IF upper(ls_ext) = ".TIF" OR upper(ls_ext) = ".TIFF" OR upper(ls_ext) = ".PDF"  THEN
	sle_pos.text = String(ll_curpage)+"/"+string(ole_fax1.object.GetTotalPage() )
ELSE
	sle_pos.text = "1/1"
END IF
	
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

ole_fax1.object.View=10
//ole_fax1.object.ViewSize=50 

///ole_fax1.SetRedraw(true)
///ole_fax1.visible = true



end subroutine

public subroutine fn_loadfaxatpage (string ls_filepath, integer li_page);// Loads the fax file!

ole_fax1.object.LoadMultiPage(ls_filepath,1)

// Si tiene usa sola pagina lo lee como imagen (mejor resolucion!)
if ole_fax1.object.GetTotalPage() = 1 then
	ole_fax1.object.FileName = ls_filepath
elseif ole_fax1.object.GetTotalPage() >= li_page then
	ole_fax1.object.LoadMultiPage(ls_filepath,li_page)
end if	

st_res.text = String(ole_fax1.object.Xdpi) + 'x'+String(ole_fax1.object.Ydpi)
end subroutine

public subroutine fn_selectitem ();String ls_faxbranch, ls_faxname, ls_faxnumber,ls_ext

TRY

	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if	
	
	
	ole_fax1.object.FileName = ''
	
	ole_fax1.SetRedraw(false)
	fn_loadfax(is_faxpath+lb_faxes.SelectedItem())	
	fn_ajustscreen()
	ole_fax1.SetRedraw(true)	

	// <><><><><><><><><><><><><><><><><><><><><><><><><><><><>
	// 05/24/2013 -> filter the orders base on the fax caller id
	
	ls_ext = fn_get_file_ext(ls_faxname)
	
	ls_faxbranch = ""
	ls_receiver = ""
	ls_faxname = lb_faxes.SelectedItem()
	ls_faxname = fn_replace(upper(ls_faxname),ls_ext,'')
	ls_faxname = fn_replace(upper(ls_faxname),'KYC_','')


	// Si es un KYC o un Archivo TIF renombrado con el codigo de la agencia
	if left(ls_faxname,1)='A' then
		
		ls_faxbranch = left(ls_faxname,pos(ls_faxname,"_")-1)
		ls_faxbranch = left(ls_faxname,pos(ls_faxname,"-")-1)		
		ls_receiver = fn_token(ls_faxname,'-',2)


	else // Si es un fax exportado por active fax
	
	
		// :::::::::::::::::::::
		// 09/22/2014
		SetNull(ls_faxbranch)
		
		// OpenText Lookup
		
		SetNull(ls_faxnumber)
		
		ls_faxnumber = fn_token(ls_faxname,"_",2)
		
		if len(ls_faxnumber)>9 then
	
			select b.id_branch
			into :ls_faxbranch 
			from dba.BRANCH b, dba.TIPO_TRANSMISION_AGENCIA x
			where x.ID_BRANCH = b.ID_BRANCH 
			and id_status_branch = 'O'
			and (right(:ls_faxnumber,10) = b.FAX_BRANCH or right(:ls_faxnumber,10) = b.PHONE2_BRANCH or right(:ls_faxnumber,10) = b.PHONE1_BRANCH )
			order by id_flag_branch;
		
		end if
		// :::::::::::::::::::::
		
		
				
		// ActiveFax Lookup
		if isnull(ls_faxbranch) then			
		
			if pos(ls_faxname,"_")>0 then
				ls_faxname = left(ls_faxname,pos(ls_faxname,"_")-1)
				//messagebox("",ls_faxname)
			end if
	
			SetNull(ls_faxbranch)
			
			select b.id_branch
			into :ls_faxbranch 
			from dba.faxprotocol f, dba.BRANCH b, dba.TIPO_TRANSMISION_AGENCIA x
			where x.ID_BRANCH = b.ID_BRANCH 
			and right(f.faxnumber,10) = b.FAX_BRANCH 
			and FaxId = :ls_faxname
			and id_status_branch = 'O'
			order by id_flag_branch;
			
			if not isnull(ls_faxbranch) then
				ls_faxbranch = ls_faxbranch
			else
		
				// busca si llego desde phone2
				select b.id_branch
				into :ls_faxbranch 
				from dba.faxprotocol f, dba.BRANCH b, dba.TIPO_TRANSMISION_AGENCIA x
				where x.ID_BRANCH = b.ID_BRANCH 
				and right(f.faxnumber,10) = b.PHONE2_BRANCH 
				and FaxId = :ls_faxname
				and id_status_branch = 'O'
				order by id_flag_branch;
					
				if not isnull(ls_faxbranch) then
					ls_faxbranch = ls_faxbranch
				else
			
					// busca si llego desde phone1
					select b.id_branch
					into :ls_faxbranch 
					from dba.faxprotocol f, dba.BRANCH b, dba.TIPO_TRANSMISION_AGENCIA x
					where x.ID_BRANCH = b.ID_BRANCH 
					and right(f.faxnumber,10) = b.PHONE1_BRANCH 
					and FaxId = :ls_faxname
					and id_status_branch = 'O'
					order by id_flag_branch;
						
					if not isnull(ls_faxbranch) then
						ls_faxbranch = ls_faxbranch
					else
						ls_faxbranch = ""
					end if
					
				end if
			
			end if
		
		
		end if
		
	end if
	
	sle_id_branch.text = ls_faxbranch
	//messagebox("",ls_receiver+"--")
	
	// <><><><><><><><><><><><><><><><><><><><><><><><><><><><>
	
	
	
	SetFocus(lb_faxes)
	
CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!~n~r"+er.GetMessage(),Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 
end subroutine

public function string fn_get_file_ext (string as_file_name);String ls_file_ext, ls_sec_string
integer li_ext_pos, li_file_len
    
li_ext_pos = POS(as_file_name, '.')

li_file_len = len(as_file_name)

ls_file_ext = Mid(as_file_name, li_ext_pos, li_file_len)

ls_sec_string = mid(ls_file_ext,2,len(ls_file_ext))

li_ext_pos = POS(ls_sec_string, '.')

IF li_ext_pos > 0 THEN 
	ls_file_ext =  fn_get_file_ext(ls_sec_string)
END IF

return ls_file_ext

end function

on w_faxcomponent.create
int iCurrent
call super::create
this.cb_rotate180=create cb_rotate180
this.pb_duplicate_page=create pb_duplicate_page
this.st_res=create st_res
this.sle_id_branch=create sle_id_branch
this.st_5=create st_5
this.pb_separate=create pb_separate
this.pb_print=create pb_print
this.cb_refresh=create cb_refresh
this.pb_previous=create pb_previous
this.pb_next=create pb_next
this.ole_fax1=create ole_fax1
this.lb_faxes=create lb_faxes
this.st_2=create st_2
this.cb_ok=create cb_ok
this.cb_rotateleft=create cb_rotateleft
this.cb_rotateright=create cb_rotateright
this.st_4=create st_4
this.st_6=create st_6
this.sle_pos=create sle_pos
this.cb_move=create cb_move
this.lb_folder=create lb_folder
this.st_3=create st_3
this.sle_selected=create sle_selected
this.lb_movetofolder=create lb_movetofolder
this.gb_3=create gb_3
this.gb_1=create gb_1
this.st_1=create st_1
this.sle_newname=create sle_newname
this.st_7=create st_7
this.sle_email=create sle_email
this.cb_email=create cb_email
this.gb_2=create gb_2
this.htb_zoom=create htb_zoom
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_rotate180
this.Control[iCurrent+2]=this.pb_duplicate_page
this.Control[iCurrent+3]=this.st_res
this.Control[iCurrent+4]=this.sle_id_branch
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.pb_separate
this.Control[iCurrent+7]=this.pb_print
this.Control[iCurrent+8]=this.cb_refresh
this.Control[iCurrent+9]=this.pb_previous
this.Control[iCurrent+10]=this.pb_next
this.Control[iCurrent+11]=this.ole_fax1
this.Control[iCurrent+12]=this.lb_faxes
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.cb_ok
this.Control[iCurrent+15]=this.cb_rotateleft
this.Control[iCurrent+16]=this.cb_rotateright
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.st_6
this.Control[iCurrent+19]=this.sle_pos
this.Control[iCurrent+20]=this.cb_move
this.Control[iCurrent+21]=this.lb_folder
this.Control[iCurrent+22]=this.st_3
this.Control[iCurrent+23]=this.sle_selected
this.Control[iCurrent+24]=this.lb_movetofolder
this.Control[iCurrent+25]=this.gb_3
this.Control[iCurrent+26]=this.gb_1
this.Control[iCurrent+27]=this.st_1
this.Control[iCurrent+28]=this.sle_newname
this.Control[iCurrent+29]=this.st_7
this.Control[iCurrent+30]=this.sle_email
this.Control[iCurrent+31]=this.cb_email
this.Control[iCurrent+32]=this.gb_2
this.Control[iCurrent+33]=this.htb_zoom
end on

on w_faxcomponent.destroy
call super::destroy
destroy(this.cb_rotate180)
destroy(this.pb_duplicate_page)
destroy(this.st_res)
destroy(this.sle_id_branch)
destroy(this.st_5)
destroy(this.pb_separate)
destroy(this.pb_print)
destroy(this.cb_refresh)
destroy(this.pb_previous)
destroy(this.pb_next)
destroy(this.ole_fax1)
destroy(this.lb_faxes)
destroy(this.st_2)
destroy(this.cb_ok)
destroy(this.cb_rotateleft)
destroy(this.cb_rotateright)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.sle_pos)
destroy(this.cb_move)
destroy(this.lb_folder)
destroy(this.st_3)
destroy(this.sle_selected)
destroy(this.lb_movetofolder)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.st_1)
destroy(this.sle_newname)
destroy(this.st_7)
destroy(this.sle_email)
destroy(this.cb_email)
destroy(this.gb_2)
destroy(this.htb_zoom)
end on

event open;call super::open;String ls_faxserver, ls_imageviewerlicense

//ole_fax1.object.LicenseKey ="10580" 

is_app_dir = GetCurrentDirectory()

ls_imageviewerlicense = fn_busparameter("IVP_LICENSE_OCR")

ole_fax1.object.LicenseKey = ls_imageviewerlicense

//MESSAGEBOX("","|"+ls_imageviewerlicense+"|")

ls_faxserver = fn_busparameter("FAXSERVER")

if isnull(ls_faxserver) or len(trim(ls_faxserver)) < 1 then ls_faxserver = 'Faxserver01'

X=1
Y=1

if not fileexists("U:\Corporate") then
	fn_mapnetworkdrive("u","\\"+ls_faxserver+"\Faxes")
end if

if not fileexists("U:\Corporate") then
	messagebox("Error","The fax' folder cannot be mapped.~nPlease map the network drive manually.",StopSign!)
	close(this)
	return	
end if


// __________________________
// Si la llaman con parametro!
// Selecciona el folder y bloquea el combo!
String ls_fixed_path
ls_fixed_path = Message.StringParm
if not isnull(ls_fixed_path) and len(trim(ls_fixed_path)) > 3 then
	lb_folder.text = ls_fixed_path
	lb_folder.enabled = false
else
	lb_folder.text = "Accounting"
end if
// __________________________


lb_movetofolder.text = "Accounting"
is_faxpath = "U:\" + lb_folder.text+"\"
lb_faxes.DirList(is_faxpath + is_idbranch + "*.*", 0)
lb_faxes.DirList(is_faxpath + "*.*", 0)
sle_selected.text = "[No Fax Selected]"



end event

event resize;call super::resize;ole_fax1.Height = this.Height - 360
ole_fax1.Width = this.Width - 1140

cb_ok.x = this.Width - (3593 - 3045) - 10
cb_ok.y = this.Height - (2280 - 2052) - 15
end event

type cb_rotate180 from commandbutton within w_faxcomponent
integer x = 1477
integer y = 8
integer width = 110
integer height = 96
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "[]"
end type

event clicked;TRY
	if upper(fn_get_file_ext(lb_faxes.SelectedItem())) = ".PDF" THEN return
	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
		
	fn_rotatefax(is_faxpath,lb_faxes.SelectedItem(),180)	
	
//	ole_fax1.object.Rotate90
//	
//	String ls_newfilename	
//	ls_newfilename = is_faxpath + 'temp\' + lb_faxes.SelectedItem()
//	ls_newfilename = mid(ls_newfilename,1,len(ls_newfilename)-4)	
//	//ole_fax1.object.TIFCompression = 2	
//	//ole_fax1.object.ImageViewer1.JPEGQuality=90
//	ole_fax1.object.Save(ls_newfilename,"JPG")
//	
//	//ole_fax1.object.SaveTIF(ls_newfilename)
//	
//	//fn_loadfax(ls_newfilename)
	
CATCH (runtimeerror er)   

	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 




//TRY
//
//	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
//		MessageBox("Error","The file was already moved",StopSign!)
//		cb_refresh.triggerEvent(Clicked!)
//		return
//	end if
//	
//	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
//		return
//	end if
//	
//	ole_fax.object.RotateRight
//	ole_fax.object.Save
//	
//CATCH (runtimeerror er)   
//
//   //MessageBox("Runtime Error", er.GetMessage())
//	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//FINALLY   
//   	
//	Return
//	
//END TRY 
end event

type pb_duplicate_page from picturebutton within w_faxcomponent
string tag = "Duplicar"
integer x = 3337
integer y = 4
integer width = 110
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "New!"
string disabledname = "New!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Duplicar"
end type

event clicked;string ls_ext

SetPointer(HourGlass!)

TRY


	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	ls_ext = fn_get_file_ext(lb_faxes.SelectedItem())
	
	
	//ole_fax1.object.Save(is_faxpath + fn_replace(upper(lb_faxes.SelectedItem()),".TIF","_DP"),"TIF")	
	FileCopy(is_faxpath + lb_faxes.SelectedItem(),is_faxpath + fn_replace(upper(lb_faxes.SelectedItem()),upper(ls_ext),"_DP"+upper(ls_ext)))	
	
	// -------------------------------------------------------	
	// Refresh maintianing the previously selected item
	String ls_selected	
	Integer li_pos
	ls_selected = lb_faxes.SelectedItem()
	
	cb_refresh.TriggerEvent(Clicked!)
	
	if fileexists(is_faxpath+ls_selected) then

		
		li_pos = lb_faxes.SelectItem( ls_selected,0 ) 
		fn_selectitem()	
//		fn_loadfax(ls_selected)

		ole_fax1.object.View=10	

	end if
	// Refresh maintianing the previously selected item
	// -------------------------------------------------------
	
	
	Messagebox("Process Complete","El Fax ha sido duplicado")


CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","El fax seleccionado fue movido, la lista sera actualizada! "+er.text,Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   

	SetPointer(Arrow!)

	Return

END TRY 







//SetPointer(HourGlass!)
//
//TRY
//
//	double ld_current
//	String ls_temp_name, ls_temp_name_base, ls_temp_out1, ls_temp_out2
//	Integer li_page, li_pages
//	
//	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
//		MessageBox("Error","The file was already moved",StopSign!)
//		cb_refresh.triggerEvent(Clicked!)
//		return
//	end if
//	
//	ole_fax1.object.LoadMultiPage( is_faxpath+lb_faxes.SelectedItem(),1)
//	
//	// Si tiene usa sola pagina lo lee como imagen (mejor resolucion!)
//	if ole_fax1.object.GetTotalPage() = 1 then
//		ole_fax1.object.FileName = is_faxpath+lb_faxes.SelectedItem()
//		Messagebox("Error!","El fax seleccionado solo tiene una pagina!")
//		return		
//	end if	
//
//	li_pages= ole_fax1.object.GetTotalPage() 
//
//	if li_pages > 19 then		
//		Messagebox("Error!","Esta funcion solo funciona hasta 19 paginas!")
//		return		
//	end if
//
//	ls_temp_name_base = fn_replace(upper(lb_faxes.SelectedItem()),'.TIF','_P'+String(li_pages)+'x')
//
//	fn_FileMove(is_faxpath+lb_faxes.SelectedItem(),is_faxpath+ls_temp_name_base+'.TIF')
//	
//	for li_page = 1 to (li_pages - 1)
//		
//		// Quita el ultimo digito
//		ls_temp_name = mid(ls_temp_name_base,1,len(ls_temp_name_base) - 2)
//		//ls_temp_name_new_base = mid(ls_temp_name_base,1,len(ls_temp_name_base) - 2)
//		
//		if (li_pages - li_page) = 1 then
//			ls_temp_out1 = is_faxpath + ls_temp_name + String(li_pages - li_page) + '.TIF'
//		else 
//			ls_temp_out1 = is_faxpath + ls_temp_name + String(li_pages - li_page) + 'x.TIF'	
//		end if		
//		ls_temp_out2 = is_faxpath + ls_temp_name + String(li_pages + 1 - li_page) + '.TIF'
//				
//		ole_fax1.object.TIFSplit (is_faxpath + ls_temp_name_base+'.TIF',(li_pages + 1 - li_page),ls_temp_out1,ls_temp_out2)
//
//		FileDelete(is_faxpath + ls_temp_name_base+'.TIF')
//
//		ls_temp_name_base = ls_temp_name+String(li_pages - li_page)+'x'
//			
//	next				
//
//	Messagebox("Process Complete","Las "+string(li_pages)+" han sido separadas, la lista de faxes sera actualizada!")
//	cb_refresh.TriggerEvent(Clicked!)
//
//CATCH (runtimeerror er)   
//
//   //MessageBox("Runtime Error", er.GetMessage())
//	Messagebox("Error (try block)","El fax seleccionado fue movido, la lista sera actualizada! "+er.text,Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//FINALLY   
//
//	SetPointer(Arrow!)
//
//	Return
//
//END TRY 
end event

type st_res from statictext within w_faxcomponent
integer x = 2985
integer y = 40
integer width = 288
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;// [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
// 10/07/2014: Obtains original DPIs
if ole_fax1.object.Xdpi <> ole_fax1.object.Ydpi then				

	ole_fax1.object.FileName = ""
	fn_resample_tif(is_faxpath + lb_faxes.SelectedItem())		

	Messagebox("Ajuste de Imagen","La imagen sera redimensionada",StopSign!)

	// -------------------------------------------------------	
	// Refresh maintianing the previously selected item
	String ls_selected	
	ls_selected = lb_faxes.SelectedItem()
	
	cb_refresh.TriggerEvent(Clicked!)
	
	if fileexists(is_faxpath+ls_selected) then
		lb_faxes.SelectItem( ls_selected,0 ) 
		fn_loadfax(ls_selected)
		ole_fax1.object.View=10	
	end if
	// Refresh maintianing the previously selected item
	// -------------------------------------------------------	

	st_res.text = String(ole_fax1.object.Xdpi) + 'x'+String(ole_fax1.object.Ydpi)				
			
	return
		
else
		
	Messagebox("Ajuste de Imagen","La imagen no necesita ser redimensionada",Information!)
	
end if
end event

type sle_id_branch from singlelineedit within w_faxcomponent
integer x = 709
integer y = 188
integer width = 311
integer height = 64
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
boolean border = false
boolean displayonly = true
end type

type st_5 from statictext within w_faxcomponent
integer x = 1783
integer y = 28
integer width = 151
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Zoom"
boolean focusrectangle = false
end type

type pb_separate from picturebutton within w_faxcomponent
string tag = "Separar Paginas"
integer x = 3456
integer y = 8
integer width = 110
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "Cascade!"
string disabledname = "Cascade!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Separar Paginas"
end type

event clicked;string ls_file_split, ls_base_file, ls_base_name
int ls_pg_split
SetPointer(HourGlass!)

TRY

	double ld_current
	String ls_temp_name, ls_temp_name_base, ls_temp_out1, ls_temp_out2, ls_ext, ls_prefix
	Integer li_page, li_pages
	
	ls_base_file = is_faxpath+lb_faxes.SelectedItem()
	ls_base_name = lb_faxes.SelectedItem()
	
	if not fileexists(ls_base_file) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	ole_fax1.object.LoadMultiPage(ls_base_file,1)
	
	// Si tiene usa sola pagina lo lee como imagen (mejor resolucion!)
	if ole_fax1.object.GetTotalPage() = 1 then
		ole_fax1.object.FileName = ls_base_file
		Messagebox("Error!","El fax seleccionado solo tiene una pagina!")
		return		
	end if	

	li_pages= ole_fax1.object.GetTotalPage() 

	if li_pages > 99 then		
		Messagebox("Error!","Esta funcion solo funciona hasta 99 paginas!")
		return		
	end if
	
	ls_ext = fn_get_file_ext(lb_faxes.SelectedItem())

	ls_temp_name = mid(lb_faxes.SelectedItem(),1, len(lb_faxes.SelectedItem()) - len(ls_ext))
	
	ole_fax1.object.FileName = ""

	ls_temp_name_base = ls_temp_name + ls_ext
	
	for li_page = 1 to (li_pages - 1)
		if (li_pages - li_page) = 1 then
			ls_temp_out1 = is_faxpath + ls_temp_name + "_P_" + String(li_pages - li_page) + ls_ext
		else 
			ls_temp_out1 = is_faxpath + ls_temp_name + "_P_" + String(li_pages - li_page) + 'x' + ls_ext
		end if		
		ls_temp_out2 = is_faxpath + ls_temp_name + "_P_" + String(li_pages + 1 - li_page) +ls_ext
		
		Choose Case upper(ls_ext)
			case '.TIF', '.TIFF'
				ls_pg_split = li_pages - li_page + 1
				ole_fax1.object.TIFSplit(is_faxpath + ls_temp_name_base, ls_pg_split,ls_temp_out1, ls_temp_out2)
			case '.PDF'
				ls_pg_split = li_pages - li_page
				ole_fax1.object.PDFEditSplit(is_faxpath + ls_temp_name_base, ls_pg_split,ls_temp_out1, ls_temp_out2)
		end Choose

		FileDelete(is_faxpath + ls_temp_name_base)

		ls_temp_name_base = ls_temp_name + "_P_" + String(li_pages - li_page)+ 'x' + ls_ext
			
	next		
	
	IF FileExists(ls_base_file) THEN 
		FileDelete(ls_base_file)
	END IF

	Messagebox("Process Complete","Las "+string(li_pages)+" han sido separadas, la lista de faxes sera actualizada!")

	// -------------------------------------------------------	
	// Refresh maintianing the previously selected item
	String ls_selected	
	ls_selected = lb_faxes.SelectedItem()
	
	cb_refresh.TriggerEvent(Clicked!)
	
	if fileexists(is_faxpath+'P_1_'+ls_selected) then
		lb_faxes.SelectItem('P_1_'+ls_selected,0) 
		fn_selectitem()
		ole_fax1.object.View=10	
	end if
	// Refresh maintianing the previously selected item
	// -------------------------------------------------------

CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","El fax seleccionado fue movido, la lista sera actualizada! "+er.text,Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   

	SetPointer(Arrow!)

	Return

END TRY 
end event

type pb_print from picturebutton within w_faxcomponent
string tag = "Imprimir"
integer x = 3579
integer y = 8
integer width = 110
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Imprimir"
end type

event clicked;TRY

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

end event

type cb_refresh from picturebutton within w_faxcomponent
string tag = "Refrescar"
integer x = 919
integer y = 8
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Update5!"
string disabledname = "Update5!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Refrescar"
end type

event clicked;lb_faxes.DirList(is_faxpath + is_idbranch + "*.*", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
//sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
sle_newname.text = ""
ole_fax1.object.FileName = ""
st_res.text = ''
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type pb_previous from picturebutton within w_faxcomponent
integer x = 2560
integer y = 8
integer width = 110
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
boolean originalsize = true
string picturename = "VCRPrior!"
string disabledname = "VCRPrior!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;TRY

	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	if ll_curpage > 1 then
		ll_curpage = ll_curpage - 1
		ole_fax1.object.LoadMultiPage( is_faxpath+lb_faxes.SelectedItem(),ll_curpage)		
	end if
	
	// 10/13/2014
	ole_fax1.object.View=10
	
	sle_pos.text = String(ll_curpage)+"/"+string(ole_fax1.object.GetTotalPage)
	
CATCH (runtimeerror er)   

	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 



//TRY
//
//	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
//		MessageBox("Error","The file was already moved",StopSign!)
//		cb_refresh.triggerEvent(Clicked!)
//		return
//	end if
//	
////	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
////		return
////	end if
//	
//	if ll_curpage > 1 then
//		ll_curpage = ll_curpage - 1
//		ole_fax1.object.LoadMultiPage( is_faxpath+lb_faxes.SelectedItem(),ll_curpage)		
//	end if
//	
//	sle_pos.text = String(ll_curpage)+"/"+string(ole_fax1.object.GetTotalPage)
//	
//CATCH (runtimeerror er)   
//
//   //MessageBox("Runtime Error", er.GetMessage())
//	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//FINALLY   
//   	
//	Return
//	
//END TRY 
end event

type pb_next from picturebutton within w_faxcomponent
integer x = 2839
integer y = 8
integer width = 110
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
boolean originalsize = true
string picturename = "VCRNext!"
string disabledname = "VCRNext!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;TRY

	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
	
	if ll_curpage < ole_fax1.object.GetTotalPage then
		ll_curpage = ll_curpage + 1
		ole_fax1.object.LoadMultiPage( is_faxpath+lb_faxes.SelectedItem(),ll_curpage)		
	end if
	
	// 10/13/2014
	ole_fax1.object.View=10	
	
	sle_pos.text = String(ll_curpage)+"/"+string(ole_fax1.object.GetTotalPage)
	
CATCH (runtimeerror er)   

	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 



//TRY
//
//	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
//		MessageBox("Error","The file was already moved",StopSign!)
//		cb_refresh.triggerEvent(Clicked!)
//		return
//	end if
//	
////	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
////		return
////	end if
//	
//	if ll_curpage < ole_fax1.object.GetTotalPage then
//		ll_curpage = ll_curpage + 1
//		ole_fax1.object.LoadMultiPage( is_faxpath+lb_faxes.SelectedItem(),ll_curpage)		
//	end if
//	
//	sle_pos.text = String(ll_curpage)+"/"+string(ole_fax1.object.GetTotalPage)
//	
//CATCH (runtimeerror er)   
//
//   //MessageBox("Runtime Error", er.GetMessage())
//	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//FINALLY   
//   	
//	Return
//	
//END TRY 
end event

type ole_fax1 from olecustomcontrol within w_faxcomponent
event click ( )
event dblclick ( )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event keydown ( integer keycode,  integer shift )
event keyup ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event selectionrectdrawn ( long ileft,  long itop,  long iwidth,  long iheight )
event ocrrecognized ( boolean bsuccess )
integer x = 1047
integer y = 112
integer width = 2651
integer height = 1552
integer taborder = 20
boolean border = false
long backcolor = 16777215
boolean focusrectangle = false
string binarykey = "w_faxcomponent.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
end type

type lb_faxes from listbox within w_faxcomponent
integer x = 9
integer y = 252
integer width = 1010
integer height = 816
integer taborder = 30
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;fn_selectitem()



//
//
//
//TRY
//
//	double ld_current
//	
//	ole_fax1.SetRedraw(false)
//	
//	ole_fax1.object.LoadMultiPage( is_faxpath+lb_faxes.SelectedItem(),1)
//	
//	// Si tiene usa sola pagina lo lee como imagen (mejor resolucion!)
//	if ole_fax1.object.GetTotalPage() = 1 then
//		ole_fax1.object.FileName = is_faxpath+lb_faxes.SelectedItem()
//	end if	
//	
//	sle_selected.text = lb_faxes.SelectedItem()
//	
//	sle_newname.text = sle_selected.text
//	ld_current=double(sle_zoom.text)
//		
//	ll_curpage = 1
//		
//	sle_pos.text = String(ll_curpage)+"/"+string(ole_fax1.object.GetTotalPage() )
//		
//	// >>>>>>>>>>>>>>>>>>>>>>>>>>>
//	// Color Number of pages		
//	if ole_fax1.object.GetTotalPage() > 1 then 
//		sle_pos.TextColor	= RGB(255,0,0)	
//		cb_separate.enabled = true
//	else
//		sle_pos.TextColor	= RGB(0,0,0)	
//		cb_separate.enabled = false
//	end if
//	
//	//	// >>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//	// Lo pone en el zoom inicial!
//
//	ole_fax1.object.zoomout
//	ole_fax1.object.zoomout
//	ole_fax1.object.zoomout
//	ole_fax1.object.zoomout
//	ole_fax1.object.zoomout
//	ole_fax1.object.zoomout	
//	
//	ole_fax1.SetRedraw(true)
//
//	sle_zoom.text = '50'		
//	
//CATCH (runtimeerror er)   
//
//   //MessageBox("Runtime Error", er.GetMessage())
//	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!~n~r"+er.GetMessage(),Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//FINALLY   
//   	
//	Return
//	
//END TRY 








//if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
//
//	Messagebox("Error","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//else	
//	
//	double ld_current
//	
//	ole_fax.object.image = is_faxpath+lb_faxes.SelectedItem()
//	sle_selected.text = lb_faxes.SelectedItem()
//	sle_newname.text = sle_selected.text
//	ld_current=double(sle_zoom.text)
//	ole_fax.object.zoom = ld_current
//	ole_fax.object.Page = 1
//	ole_fax.object.display
//	
//	sle_pos.text = String(ole_fax.object.Page)+"/"+string(ole_fax.object.PageCount)
//	
//	// >>>>>>>>>>>>>>>>>>>>>>>>>>>
//	// Color Number of pages
//	sle_pos.TextColor	= RGB(0,0,0)	
//	if ole_fax.object.PageCount > 1 then sle_pos.TextColor	= RGB(255,0,0)
//	// >>>>>>>>>>>>>>>>>>>>>>>>>>>
//	
//	ole_fax.object.zoom = 50
//	sle_zoom.text = '50'
//	ole_fax.object.display
//	
//end if


end event

type st_2 from statictext within w_faxcomponent
integer x = 27
integer y = 192
integer width = 411
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
boolean enabled = false
string text = "Faxes available"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_faxcomponent
integer x = 3218
integer y = 1664
integer width = 480
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Ok"
boolean default = true
end type

event clicked;Close(parent)
end event

type cb_rotateleft from commandbutton within w_faxcomponent
integer x = 1367
integer y = 8
integer width = 110
integer height = 96
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
string text = "<"
end type

event clicked;//if sle_pos.text <> '1/1' then
//	Messagebox("Notificacion","Aun no es posible rotar faxes de multiples paginas... Separe las paginas y luego rote el fax!",Exclamation!)
//	return
//end if
//


TRY
	if upper(fn_get_file_ext(lb_faxes.SelectedItem())) = ".PDF" THEN return

	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
		
	fn_rotatefax(is_faxpath,lb_faxes.SelectedItem(),270)	

	// 10/13/2014
	ole_fax1.object.View=10
	
CATCH (runtimeerror er)   

	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 



//TRY
//
//	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
//		MessageBox("Error","The file was already moved",StopSign!)
//		cb_refresh.triggerEvent(Clicked!)
//		return
//	end if
////	
////	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
////		return
////	end if
//	
//	ole_fax1.object.Rotate270
//	
//	String ls_newfilename
//	
//	ls_newfilename = is_faxpath+lb_faxes.SelectedItem()
//	
//	ls_newfilename = mid(ls_newfilename,1,len(ls_newfilename)-4)
//	
//	ole_fax1.object.TIFCompression = 2
//	
//	ole_fax1.object.Save(ls_newfilename,"TIF")
//	
//CATCH (runtimeerror er)   
//
//   //MessageBox("Runtime Error", er.GetMessage())
//	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//FINALLY   
//   	
//	Return
//	
//END TRY 
end event

type cb_rotateright from commandbutton within w_faxcomponent
integer x = 1586
integer y = 8
integer width = 110
integer height = 96
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
string text = ">"
end type

event clicked;//
//if sle_pos.text <> '1/1' then
//	Messagebox("Notificacion","Aun no es posible rotar faxes de multiples paginas... Separe las paginas y luego rote el fax!",Exclamation!)
//	return
//end if


TRY
	if upper(fn_get_file_ext(lb_faxes.SelectedItem())) = ".PDF" THEN return

	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if
		
	fn_rotatefax(is_faxpath,lb_faxes.SelectedItem(),90)	
	
	// 10/13/2014
	ole_fax1.object.View=10
	
CATCH (runtimeerror er)   

	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 





//TRY
//
//	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
//		MessageBox("Error","The file was already moved",StopSign!)
//		cb_refresh.triggerEvent(Clicked!)
//		return
//	end if
////	
////	if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
////		return
////	end if
//	
//	ole_fax1.object.Rotate90
//	
//	String ls_newfilename
//	
//	ls_newfilename = is_faxpath+lb_faxes.SelectedItem()
//	
//	ls_newfilename = mid(ls_newfilename,1,len(ls_newfilename)-4)
//	
//	ole_fax1.object.TIFCompression = 2
//		
//	ole_fax1.object.Save(ls_newfilename,"TIF")
//	
//CATCH (runtimeerror er)   
//
//   //MessageBox("Runtime Error", er.GetMessage())
//	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
//	cb_refresh.TriggerEvent(Clicked!)
//
//FINALLY   
//   	
//	Return
//	
//END TRY 
end event

type st_4 from statictext within w_faxcomponent
integer x = 1138
integer y = 28
integer width = 219
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Rotation"
boolean focusrectangle = false
end type

type st_6 from statictext within w_faxcomponent
integer x = 2437
integer y = 28
integer width = 119
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Page"
boolean focusrectangle = false
end type

type sle_pos from singlelineedit within w_faxcomponent
integer x = 2665
integer y = 12
integer width = 178
integer height = 88
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "1/1"
boolean autohscroll = false
boolean displayonly = true
end type

type cb_move from commandbutton within w_faxcomponent
integer x = 823
integer y = 1356
integer width = 165
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Move"
end type

event clicked;string ls_ext

// Moviendo el Fax a la carpeta deseada
if sle_selected.text <> "[No Fax Selected]" then

	if	lb_folder.text = lb_movetofolder.text then
		Messagebox("","You must specify a diffrent Folder to Move the fax",StopSign!)
		return
	end if	

	String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname

	ls_faxpath = is_faxpath
	ls_newfaxfolder = "u:\"+lb_movetofolder.text+"\"
	ls_faxname = sle_selected.text
	ls_newfaxname = sle_newname.text

	if isnull(ls_newfaxname) or len(trim(ls_newfaxname)) < 1 then 
		ls_newfaxname = ls_faxname
		sle_newname.text = ls_newfaxname
	end if

	if messagebox("Confirm","Are you sure that your want to move the fax " + sle_selected.text + " to "+ls_newfaxfolder+"?",Question!,YesNo!) <> 1 Then
		return
	end if
	
	ole_fax1.object.FileName = ""
	
	if FileExists(ls_faxpath+ls_faxname) then
		ls_ext = fn_get_file_ext(ls_faxname)
		//if FileExists(ls_newfaxfolder+ls_newfaxname) then
			//ls_newfaxname = fn_replace(ls_newfaxname,".tif","") + "_" + string(today(),'mmddyyhhmmss')+".tif"			
		//end if
		//ls_newfaxname = string(today(),'mmddyyhhmmss')+'_'+gs_login+'_'+ls_newfaxname
		ls_newfaxname = fn_replace(upper(ls_newfaxname),ls_ext,"") + "_"+gs_login+'_'+ string(today(),'mmddyyhhmmss')+ls_ext
		fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+ls_newfaxname)										
	end if
end if

lb_faxes.DirList(is_faxpath + is_idbranch + "*.*", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
//sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
sle_newname.text = ""
ole_fax1.object.FileName = ""
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type lb_folder from dropdownlistbox within w_faxcomponent
integer x = 9
integer y = 88
integer width = 1010
integer height = 848
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
boolean vscrollbar = true
string item[] = {"Accounting","Ach","Applications","Compliance","Corporate","Corporate\Processed","Junk","RedPhone","AccountTemp","Operations\Anulaciones","Operations\Correciones","Inbox","Marketing","ViaCheck"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_faxpath = "U:\" + lb_folder.text + "\"
lb_faxes.DirList(is_faxpath + "*.*", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
//sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
sle_newname.text = ""
ole_fax1.object.FileName = ""
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

end event

type st_3 from statictext within w_faxcomponent
integer x = 27
integer y = 28
integer width = 411
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
boolean enabled = false
string text = "Folder"
boolean focusrectangle = false
end type

type sle_selected from singlelineedit within w_faxcomponent
integer x = 247
integer y = 1112
integer width = 741
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
integer limit = 400
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type lb_movetofolder from dropdownlistbox within w_faxcomponent
integer x = 32
integer y = 1356
integer width = 754
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
string item[] = {"Accounting","Ach","Applications","Compliance","Corporate","Corporate\Processed","Junk","RedPhone","AccountTemp","Operations\Anulaciones","Operations\Correciones","Inbox","Marketing","ViaCheck","ViaMobi"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//is_faxpath = "U:\" + lb_folder.text + "\"
//lb_faxes.DirList(is_faxpath + "*.TIF", 0)
end event

type gb_3 from groupbox within w_faxcomponent
integer x = 9
integer y = 1468
integer width = 1010
integer height = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "EMail To"
end type

type gb_1 from groupbox within w_faxcomponent
integer x = 9
integer y = 1288
integer width = 1010
integer height = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Move To"
end type

type st_1 from statictext within w_faxcomponent
integer x = 41
integer y = 1120
integer width = 229
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Selected:"
boolean focusrectangle = false
end type

type sle_newname from singlelineedit within w_faxcomponent
integer x = 247
integer y = 1196
integer width = 741
integer height = 76
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

type st_7 from statictext within w_faxcomponent
integer x = 41
integer y = 1204
integer width = 229
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Name:"
boolean focusrectangle = false
end type

type sle_email from singlelineedit within w_faxcomponent
integer x = 32
integer y = 1544
integer width = 754
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
end type

type cb_email from commandbutton within w_faxcomponent
integer x = 823
integer y = 1544
integer width = 165
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&EMail"
end type

event clicked;String ls_email, ls_ext

ls_email = trim(sle_email.text)

// Enviando el Fax al EMail
if sle_selected.text <> "[No Fax Selected]" then

	if	isnull(ls_email) or len(ls_email)<5 then
		Messagebox("Invalid EMail","Please type a valid EMail to send the fax",StopSign!)
		return
	end if

	if pos(ls_email,"@",1) < 1 then
		ls_email = ls_email + "@viamericas.com"
	end if

	String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname


	ls_faxpath = is_faxpath
	ls_newfaxfolder = "u:\EMailed\"
	ls_faxname = sle_selected.text
	ls_newfaxname = sle_newname.text

	if isnull(ls_newfaxname) or len(trim(ls_newfaxname)) < 1 then 
		ls_newfaxname = ls_faxname
		sle_newname.text = ls_newfaxname
	end if

	ls_newfaxname = ls_email+"_BY_"+trim(gs_login)+'_'+ls_newfaxname

	if messagebox("Confirm","Are you sure that your want to send the fax " + ls_faxname + " to "+ls_email+"?",Question!,YesNo!) <> 1 Then
		return
	end if
	
	ole_fax1.object.FileName = ""
	
	if FileExists(ls_faxpath+ls_faxname) then
		if FileExists(ls_newfaxfolder+ls_newfaxname) then
			ls_ext = fn_get_file_ext(ls_faxname)
			ls_newfaxname = fn_replace(upper(ls_newfaxname),ls_ext,"") + "_" + string(today(),'mmddyyhhmmss')+ls_ext
		end if
		fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+ls_newfaxname)		
		
		fn_email_notification( trim(ls_email),"FaxCenter: YOU GOT A FAX!", "This Fax was received in Viamericas Corporate Fax and was sent to you by "+trim(gs_login), ls_newfaxfolder+ls_newfaxname, "N")
		
		//run("c:\viamericasMT\MTSMail.exe "+trim(ls_email)+"#*#FaxCenter: YOU GOT A FAX!#*#"+ls_newfaxfolder+ls_newfaxname+"#*#This Fax was received in Viamericas Corporate Fax and was sent to you by "+trim(gs_login)+".#*#N")		
	end if
end if

lb_faxes.DirList(is_faxpath + is_idbranch + "*.*", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
//sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
sle_newname.text = ""
ole_fax1.object.FileName = ""
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type gb_2 from groupbox within w_faxcomponent
integer x = 9
integer y = 1060
integer width = 1010
integer height = 228
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type htb_zoom from htrackbar within w_faxcomponent
integer x = 1920
integer y = 16
integer width = 457
integer height = 108
integer minposition = 10
integer maxposition = 200
integer position = 50
integer tickfrequency = 10
htickmarks tickmarks = hticksonneither!
end type

event moved;TRY

	double ld_current
	
	if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if	
		
	ole_fax1.object.ViewSize = htb_zoom.position
	
CATCH (runtimeerror er)   

	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!",Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY      	
	Return	
END TRY 

end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fw_faxcomponent.bin 
2D00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000038117d8001d6c90800000003000001800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000002c0000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000000d400000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004e589da784fc5ad4c479eb9b69e6710b10000000038117d8001d6c90838117d8001d6c908000000000000000000000000fffffffe000000020000000300000004fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0065004400650076006f006c00650070002000720069006c006500630073006e003a0065003600350033003700000000000000000000000000000000000000000000fffe00020206e589da784fc5ad4c479eb9b69e6710b100000001fb8f0821101b01640008ed8413c72e2b00000030000000a4000000050000010000000030000001010000003800000102000000400000010300000048000000000000005000000003000100000000000300003bf2000000030000281a00000003000000000000000500000000000000010001030000000c0074735f00706b636f73706f72000101000000090078655f00746e65740102007800090000655f00006e65747800007974090000015f00000073726576006e6f6900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000003bf20000281a00000000000001010000000000000000000000006564040000646f6d0000000000000000000001006000600050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000050000003e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fw_faxcomponent.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
