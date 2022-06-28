$PBExportHeader$w_idviewer.srw
forward
global type w_idviewer from pfc_w_master
end type
type sle_lastnames from singlelineedit within w_idviewer
end type
type sle_names from singlelineedit within w_idviewer
end type
type st_8 from statictext within w_idviewer
end type
type st_3 from statictext within w_idviewer
end type
type sle_globalsender from singlelineedit within w_idviewer
end type
type ole_fax from olecustomcontrol within w_idviewer
end type
type lb_faxes from listbox within w_idviewer
end type
type cb_3 from commandbutton within w_idviewer
end type
type sle_zoom from singlelineedit within w_idviewer
end type
type cb_zoomout from commandbutton within w_idviewer
end type
type st_2 from statictext within w_idviewer
end type
type cb_ok from commandbutton within w_idviewer
end type
type cb_1 from commandbutton within w_idviewer
end type
type cb_2 from commandbutton within w_idviewer
end type
type cb_rrr from commandbutton within w_idviewer
end type
type cb_4 from commandbutton within w_idviewer
end type
type cb_rotateright from commandbutton within w_idviewer
end type
type st_5 from statictext within w_idviewer
end type
type st_6 from statictext within w_idviewer
end type
type sle_pos from singlelineedit within w_idviewer
end type
type cb_rename from commandbutton within w_idviewer
end type
type cb_printall from commandbutton within w_idviewer
end type
type sle_selected from singlelineedit within w_idviewer
end type
type gb_3 from groupbox within w_idviewer
end type
type cb_refresh from commandbutton within w_idviewer
end type
type st_1 from statictext within w_idviewer
end type
type sle_newname from singlelineedit within w_idviewer
end type
type st_7 from statictext within w_idviewer
end type
type sle_email from singlelineedit within w_idviewer
end type
type cb_email from commandbutton within w_idviewer
end type
type gb_2 from groupbox within w_idviewer
end type
type st_4 from statictext within w_idviewer
end type
end forward

global type w_idviewer from pfc_w_master
integer width = 3611
integer height = 1896
windowtype windowtype = popup!
long backcolor = 80269524
sle_lastnames sle_lastnames
sle_names sle_names
st_8 st_8
st_3 st_3
sle_globalsender sle_globalsender
ole_fax ole_fax
lb_faxes lb_faxes
cb_3 cb_3
sle_zoom sle_zoom
cb_zoomout cb_zoomout
st_2 st_2
cb_ok cb_ok
cb_1 cb_1
cb_2 cb_2
cb_rrr cb_rrr
cb_4 cb_4
cb_rotateright cb_rotateright
st_5 st_5
st_6 st_6
sle_pos sle_pos
cb_rename cb_rename
cb_printall cb_printall
sle_selected sle_selected
gb_3 gb_3
cb_refresh cb_refresh
st_1 st_1
sle_newname sle_newname
st_7 st_7
sle_email sle_email
cb_email cb_email
gb_2 gb_2
st_4 st_4
end type
global w_idviewer w_idviewer

type variables
String   is_faxpath
end variables

on w_idviewer.create
int iCurrent
call super::create
this.sle_lastnames=create sle_lastnames
this.sle_names=create sle_names
this.st_8=create st_8
this.st_3=create st_3
this.sle_globalsender=create sle_globalsender
this.ole_fax=create ole_fax
this.lb_faxes=create lb_faxes
this.cb_3=create cb_3
this.sle_zoom=create sle_zoom
this.cb_zoomout=create cb_zoomout
this.st_2=create st_2
this.cb_ok=create cb_ok
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_rrr=create cb_rrr
this.cb_4=create cb_4
this.cb_rotateright=create cb_rotateright
this.st_5=create st_5
this.st_6=create st_6
this.sle_pos=create sle_pos
this.cb_rename=create cb_rename
this.cb_printall=create cb_printall
this.sle_selected=create sle_selected
this.gb_3=create gb_3
this.cb_refresh=create cb_refresh
this.st_1=create st_1
this.sle_newname=create sle_newname
this.st_7=create st_7
this.sle_email=create sle_email
this.cb_email=create cb_email
this.gb_2=create gb_2
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_lastnames
this.Control[iCurrent+2]=this.sle_names
this.Control[iCurrent+3]=this.st_8
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.sle_globalsender
this.Control[iCurrent+6]=this.ole_fax
this.Control[iCurrent+7]=this.lb_faxes
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.sle_zoom
this.Control[iCurrent+10]=this.cb_zoomout
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.cb_ok
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_rrr
this.Control[iCurrent+16]=this.cb_4
this.Control[iCurrent+17]=this.cb_rotateright
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.st_6
this.Control[iCurrent+20]=this.sle_pos
this.Control[iCurrent+21]=this.cb_rename
this.Control[iCurrent+22]=this.cb_printall
this.Control[iCurrent+23]=this.sle_selected
this.Control[iCurrent+24]=this.gb_3
this.Control[iCurrent+25]=this.cb_refresh
this.Control[iCurrent+26]=this.st_1
this.Control[iCurrent+27]=this.sle_newname
this.Control[iCurrent+28]=this.st_7
this.Control[iCurrent+29]=this.sle_email
this.Control[iCurrent+30]=this.cb_email
this.Control[iCurrent+31]=this.gb_2
this.Control[iCurrent+32]=this.st_4
end on

on w_idviewer.destroy
call super::destroy
destroy(this.sle_lastnames)
destroy(this.sle_names)
destroy(this.st_8)
destroy(this.st_3)
destroy(this.sle_globalsender)
destroy(this.ole_fax)
destroy(this.lb_faxes)
destroy(this.cb_3)
destroy(this.sle_zoom)
destroy(this.cb_zoomout)
destroy(this.st_2)
destroy(this.cb_ok)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_rrr)
destroy(this.cb_4)
destroy(this.cb_rotateright)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.sle_pos)
destroy(this.cb_rename)
destroy(this.cb_printall)
destroy(this.sle_selected)
destroy(this.gb_3)
destroy(this.cb_refresh)
destroy(this.st_1)
destroy(this.sle_newname)
destroy(this.st_7)
destroy(this.sle_email)
destroy(this.cb_email)
destroy(this.gb_2)
destroy(this.st_4)
end on

event open;call super::open;String ls_faxserver, ls_sender_global, ls_names, ls_lastnames
Double ld_sender_global

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

ls_sender_global = message.stringparm

sle_globalsender.text = ls_sender_global

ld_sender_global = double(ls_sender_global)

SELECT TOP 1 rtrim(rtrim(sen_fname) + ' ' +isnull(sen_mname,'')),
			rtrim(rtrim(sen_lname) + ' ' +isnull(sen_slname,''))
INTO  :ls_names, 
		:ls_lastnames
FROM dba.sender
WHERE id_sender_global = :ld_sender_global;

sle_names.text = ls_names
sle_lastnames.text = ls_lastnames


is_faxpath = "U:\Compliance\Processed\Senders\"+ls_sender_global+"\"

lb_faxes.DirList(is_faxpath + "*.TIF", 0)
sle_selected.text = "[No Fax Selected]"



end event

event resize;call super::resize;ole_fax.Height = this.Height - 344
ole_fax.Width = this.Width - 980

cb_ok.x = this.Width - 548
cb_ok.y = this.Height - 228


end event

type sle_lastnames from singlelineedit within w_idviewer
integer y = 388
integer width = 910
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_names from singlelineedit within w_idviewer
integer y = 296
integer width = 910
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_idviewer
integer x = 27
integer y = 228
integer width = 238
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sender"
boolean focusrectangle = false
end type

type st_3 from statictext within w_idviewer
integer x = 27
integer y = 520
integer width = 411
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "IDs"
boolean focusrectangle = false
end type

type sle_globalsender from singlelineedit within w_idviewer
integer y = 88
integer width = 910
integer height = 100
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type ole_fax from olecustomcontrol within w_idviewer
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
integer x = 933
integer y = 88
integer width = 2592
integer height = 1556
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_idviewer.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type lb_faxes from listbox within w_idviewer
integer y = 584
integer width = 910
integer height = 728
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
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

event selectionchanged;//if not fileexists(is_faxpath+lb_faxes.SelectedItem()) then
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

type cb_3 from commandbutton within w_idviewer
integer x = 1829
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

type sle_zoom from singlelineedit within w_idviewer
integer x = 1943
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
string text = "100"
boolean autohscroll = false
boolean displayonly = true
end type

type cb_zoomout from commandbutton within w_idviewer
integer x = 2085
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

type st_2 from statictext within w_idviewer
integer x = 27
integer y = 28
integer width = 411
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "ViaSender"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_idviewer
integer x = 3045
integer y = 1664
integer width = 480
integer height = 84
integer taborder = 30
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

event clicked;Close(parent)
end event

type cb_1 from commandbutton within w_idviewer
integer x = 1417
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

type cb_2 from commandbutton within w_idviewer
integer x = 2656
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

type cb_rrr from commandbutton within w_idviewer
integer x = 2405
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

type cb_4 from commandbutton within w_idviewer
integer x = 2798
integer y = 8
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

type cb_rotateright from commandbutton within w_idviewer
integer x = 1536
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

type st_5 from statictext within w_idviewer
integer x = 1682
integer y = 16
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

type st_6 from statictext within w_idviewer
integer x = 2277
integer y = 16
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

type sle_pos from singlelineedit within w_idviewer
integer x = 2514
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
string text = "1/1"
boolean autohscroll = false
boolean displayonly = true
end type

type cb_rename from commandbutton within w_idviewer
integer x = 526
integer y = 1548
integer width = 338
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rename"
end type

event clicked;// Moviendo el Fax a la carpeta deseada
if sle_selected.text <> "[No Fax Selected]" then


	String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname

	ls_faxpath = is_faxpath
	ls_newfaxfolder = is_faxpath
	ls_faxname = sle_selected.text
	ls_newfaxname = sle_newname.text

	if isnull(ls_newfaxname) or len(trim(ls_newfaxname)) < 1 then 
		ls_newfaxname = ls_faxname
		sle_newname.text = ls_newfaxname
	end if

	if messagebox("Confirm","Are you sure that your want to rename the fax " + sle_selected.text + " to "+sle_newname.text+"?",Question!,YesNo!) <> 1 Then
		return
	end if
	
	ls_newfaxname = upper(ls_newfaxname)		
	ls_newfaxname = fn_replace(ls_newfaxname,'.TIFF','')
	ls_newfaxname = fn_replace(ls_newfaxname,'.TIF','')
		
	if FileExists(ls_faxpath+ls_faxname) then
		if FileExists(ls_newfaxfolder+ls_newfaxname+".TIF") then
			Messagebox("Error","El archivo ya existe, por favor ingrese otro nombre",StopSign!)
			return
		end if
		
		fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+ls_newfaxname+".TIF")										
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

type cb_printall from commandbutton within w_idviewer
integer x = 3127
integer y = 8
integer width = 398
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print All Pages"
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

type sle_selected from singlelineedit within w_idviewer
integer x = 247
integer y = 1376
integer width = 617
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

type gb_3 from groupbox within w_idviewer
boolean visible = false
integer x = 9
integer y = 1468
integer width = 782
integer height = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EMail To"
end type

type cb_refresh from commandbutton within w_idviewer
integer x = 933
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

type st_1 from statictext within w_idviewer
integer x = 41
integer y = 1384
integer width = 229
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

type sle_newname from singlelineedit within w_idviewer
integer x = 247
integer y = 1460
integer width = 617
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

type st_7 from statictext within w_idviewer
integer x = 41
integer y = 1468
integer width = 229
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

type sle_email from singlelineedit within w_idviewer
boolean visible = false
integer x = 32
integer y = 1544
integer width = 562
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

type cb_email from commandbutton within w_idviewer
boolean visible = false
integer x = 608
integer y = 1544
integer width = 165
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&EMail"
end type

event clicked;//String ls_email
//
//ls_email = trim(sle_email.text)
//
//// Enviando el Fax al EMail
//if sle_selected.text <> "[No Fax Selected]" then
//
//	if	isnull(ls_email) or len(ls_email)<5 then
//		Messagebox("Invalid EMail","Please type a valid EMail to send the fax",StopSign!)
//		return
//	end if
//
//	if pos(ls_email,"@",1) < 1 then
//		ls_email = ls_email + "@viamericas.com"
//	end if
//
//	String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname
//
//	ls_faxpath = is_faxpath
//	ls_newfaxfolder = "u:\EMailed\"
//	ls_faxname = sle_selected.text
//	ls_newfaxname = sle_newname.text
//
//	if isnull(ls_newfaxname) or len(trim(ls_newfaxname)) < 1 then 
//		ls_newfaxname = ls_faxname
//		sle_newname.text = ls_newfaxname
//	end if
//
//	ls_newfaxname = ls_email+"_BY_"+trim(gs_login)+'_'+ls_newfaxname
//
//	if messagebox("Confirm","Are you sure that your want to send the fax " + ls_faxname + " to "+ls_email+"?",Question!,YesNo!) <> 1 Then
//		return
//	end if
//	if FileExists(ls_faxpath+ls_faxname) then
//		if FileExists(ls_newfaxfolder+ls_newfaxname) then
//			ls_newfaxname = fn_replace(ls_newfaxname,".tif","") + "_" + string(today(),'mmddyyhhmmss')+".tif"
//		end if
//		fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+ls_newfaxname)		
//		run("c:\viamericasMT\MTSMail.exe "+trim(ls_email)+"#*#FaxCenter: YOU GOT A FAX!#*#"+ls_newfaxfolder+ls_newfaxname+"#*#This Fax was received in Viamericas Corporate Fax and was sent to you by "+trim(gs_login)+".#*#N")		
//	end if
//end if
//ole_fax.object.ClearDisplay
//lb_faxes.DirList(is_faxpath + is_idbranch + "*.TIF", 0)
//
//// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//// Cleaning Screen
//sle_pos.TextColor	= RGB(0,0,0)
//sle_pos.text = "1/1"
//sle_zoom.text = '50'
//sle_selected.text = "[No Fax Selected]"
//sle_newname.text = ""
//ole_fax.object.ClearDisplay()
//// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type gb_2 from groupbox within w_idviewer
integer y = 1304
integer width = 910
integer height = 340
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_4 from statictext within w_idviewer
integer x = 1221
integer y = 16
integer width = 215
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
string text = "Rotation"
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_idviewer.bin 
2400001000e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe000000040000000500000006fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000729f5df001c95f0200000003000006400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000055700000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000036d94028011ce9f116002fd838ac03e8c00000000729f5df001c95f02729f5df001c95f02000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000016000000a8000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012000000130000001400000015fffffffe0000001700000018fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe000201056d94028011ce9f116002fd838ac03e8c00000001fb8f0821101b01640008ed8413c72e2b00000030000005270000001a00000100000000d800000101000000e000000102000000e800000103000000f000000104000000f80000010500000104000001060000010c0000010700000114000001080000011c00000109000001240000010a0000012c0000010b000001340000010c000002780000010d000002800000010e000002880000010f00000290000001100000029800000111000002a000000112000002a800000113000002b000000114000002b800000115000002c000000116000002c800000117000002d000000118000002d800000000000002e000000003000200020000000300003a9a000000030000283400000003000000600000001e00000002000000490000000b000000000000000200000001000000020000000100000003008080800000000300ffffff0000000300ffffff0000004b000001390000fffe000101050be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c00000003008000000000000200000000000000031f85a3ff000000020000bce400000002000064c90000000b0000ffff00000002000064c9000000020000bce4000000020000bce4000000030012be38000000030012be380000000b0000ffff0000000b0000ffff0000001a00000000000000010001150000000b0065726c007672657300316465000001170000000b7365726265767265160031640b0000016c000000657365726465767201130032000b00007273000072657365316465760001120000000e0067616d006966696e6f7a726510006d6f1200000161000000746f6e6e6f69746172636f6e6570797400010b0000000f006e6e61007461746f666e6f6900746e6f000001050000001a656c65736f6974636365726e676e61746e65656c656c626101180064000b00007262000072657365326465760001140000000b0065727300767265730032646500000109000000146f6e6e616974617461626e6f6f636b6300726f6c0000010c000000146f6e6e61697461746f666e6f6f63746e00726f6c000001030000000c6f74735f72706b630073706f0000010d0000000c64726f627473726500656c790000010a000000146f6e6e616974617469666e6f6f636c6c00726f6c000001040000000d67616d696e6f63656c6f7274000101000000090078655f00746e657401070078001400006e61000061746f6e6e6f6974656e696c6c7974730102006500090000655f00006e657478080079741400000161000000746f6e6e6f6974616e696c6e6c6f63651100726f13000001660000006563726f656c69666b6e696c31676e69010f007800120000636f00006e6f7a72736976656c696269007974690000010e0000000f6f646e7566667562697372650600657a0f00000161000000746f6e6e6f6974617079746e0100006500090000765f00006973726500006e6f000000000000000000000000000000000000000000000000000000000000000000000000000000000002000200003a9a0000283400000060ff010000ff00fffe0000fffeff0000004901fffe000100000000000142c80000000200010080808000ffffffffff0000030000ff910be3529d11ce8f00aa00e30151b84b9000000001d4c001654804000000766cfeff0080feff00ff000000ff0000000000000100000101ff03000000ff000000b81f85a30064c9bd00000100bdb864c91000bdb8100000002e2e000000fffeff00fffeff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_idviewer.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
