$PBExportHeader$w_faxviewer.srw
forward
global type w_faxviewer from pfc_w_master
end type
type ole_fax from olecustomcontrol within w_faxviewer
end type
type lb_faxes from listbox within w_faxviewer
end type
type cb_3 from commandbutton within w_faxviewer
end type
type sle_zoom from singlelineedit within w_faxviewer
end type
type cb_zoomout from commandbutton within w_faxviewer
end type
type sle_selected from singlelineedit within w_faxviewer
end type
type st_2 from statictext within w_faxviewer
end type
type st_agency from statictext within w_faxviewer
end type
type cb_ok from commandbutton within w_faxviewer
end type
type cb_cancel from commandbutton within w_faxviewer
end type
type gb_2 from groupbox within w_faxviewer
end type
type cb_1 from commandbutton within w_faxviewer
end type
type st_branch from statictext within w_faxviewer
end type
type cb_2 from commandbutton within w_faxviewer
end type
type cb_rrr from commandbutton within w_faxviewer
end type
type cb_4 from commandbutton within w_faxviewer
end type
type em_branch from editmask within w_faxviewer
end type
type st_valor from statictext within w_faxviewer
end type
type em_valor from editmask within w_faxviewer
end type
type cb_rotateright from commandbutton within w_faxviewer
end type
type st_4 from statictext within w_faxviewer
end type
type st_5 from statictext within w_faxviewer
end type
type st_6 from statictext within w_faxviewer
end type
type sle_pos from singlelineedit within w_faxviewer
end type
type cb_refresh from commandbutton within w_faxviewer
end type
type cb_printall from commandbutton within w_faxviewer
end type
type cb_move from commandbutton within w_faxviewer
end type
type lb_movetofolder from dropdownlistbox within w_faxviewer
end type
type st_1 from statictext within w_faxviewer
end type
type gb_1 from groupbox within w_faxviewer
end type
end forward

global type w_faxviewer from pfc_w_master
integer width = 3579
integer height = 1848
string title = "Fax Selection"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 80269524
ole_fax ole_fax
lb_faxes lb_faxes
cb_3 cb_3
sle_zoom sle_zoom
cb_zoomout cb_zoomout
sle_selected sle_selected
st_2 st_2
st_agency st_agency
cb_ok cb_ok
cb_cancel cb_cancel
gb_2 gb_2
cb_1 cb_1
st_branch st_branch
cb_2 cb_2
cb_rrr cb_rrr
cb_4 cb_4
em_branch em_branch
st_valor st_valor
em_valor em_valor
cb_rotateright cb_rotateright
st_4 st_4
st_5 st_5
st_6 st_6
sle_pos sle_pos
cb_refresh cb_refresh
cb_printall cb_printall
cb_move cb_move
lb_movetofolder lb_movetofolder
st_1 st_1
gb_1 gb_1
end type
global w_faxviewer w_faxviewer

type variables
String   is_faxpath, is_idbranch
end variables

on w_faxviewer.create
int iCurrent
call super::create
this.ole_fax=create ole_fax
this.lb_faxes=create lb_faxes
this.cb_3=create cb_3
this.sle_zoom=create sle_zoom
this.cb_zoomout=create cb_zoomout
this.sle_selected=create sle_selected
this.st_2=create st_2
this.st_agency=create st_agency
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.gb_2=create gb_2
this.cb_1=create cb_1
this.st_branch=create st_branch
this.cb_2=create cb_2
this.cb_rrr=create cb_rrr
this.cb_4=create cb_4
this.em_branch=create em_branch
this.st_valor=create st_valor
this.em_valor=create em_valor
this.cb_rotateright=create cb_rotateright
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.sle_pos=create sle_pos
this.cb_refresh=create cb_refresh
this.cb_printall=create cb_printall
this.cb_move=create cb_move
this.lb_movetofolder=create lb_movetofolder
this.st_1=create st_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_fax
this.Control[iCurrent+2]=this.lb_faxes
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.sle_zoom
this.Control[iCurrent+5]=this.cb_zoomout
this.Control[iCurrent+6]=this.sle_selected
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_agency
this.Control[iCurrent+9]=this.cb_ok
this.Control[iCurrent+10]=this.cb_cancel
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.st_branch
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_rrr
this.Control[iCurrent+16]=this.cb_4
this.Control[iCurrent+17]=this.em_branch
this.Control[iCurrent+18]=this.st_valor
this.Control[iCurrent+19]=this.em_valor
this.Control[iCurrent+20]=this.cb_rotateright
this.Control[iCurrent+21]=this.st_4
this.Control[iCurrent+22]=this.st_5
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.sle_pos
this.Control[iCurrent+25]=this.cb_refresh
this.Control[iCurrent+26]=this.cb_printall
this.Control[iCurrent+27]=this.cb_move
this.Control[iCurrent+28]=this.lb_movetofolder
this.Control[iCurrent+29]=this.st_1
this.Control[iCurrent+30]=this.gb_1
end on

on w_faxviewer.destroy
call super::destroy
destroy(this.ole_fax)
destroy(this.lb_faxes)
destroy(this.cb_3)
destroy(this.sle_zoom)
destroy(this.cb_zoomout)
destroy(this.sle_selected)
destroy(this.st_2)
destroy(this.st_agency)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.gb_2)
destroy(this.cb_1)
destroy(this.st_branch)
destroy(this.cb_2)
destroy(this.cb_rrr)
destroy(this.cb_4)
destroy(this.em_branch)
destroy(this.st_valor)
destroy(this.em_valor)
destroy(this.cb_rotateright)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.sle_pos)
destroy(this.cb_refresh)
destroy(this.cb_printall)
destroy(this.cb_move)
destroy(this.lb_movetofolder)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;call super::open;String ls_faxserver

ls_faxserver = fn_busparameter("FAXSERVER")

if isnull(ls_faxserver) or len(trim(ls_faxserver)) < 1 then ls_faxserver = 'Faxserver01'
X=1
Y=1

lb_movetofolder.text = "Junk"

is_idbranch = message.stringparm

//if isnull(is_idbranch) or len(is_idbranch) < 1 then 
	is_idbranch = ''
	st_agency.text = "ALL AGENCIES"
//else
//	st_agency.text = is_idbranch
//end if

if not fileexists("u:\accounting") then
	fn_mapnetworkdrive("u","\\"+ls_faxserver+"\Faxes")
end if

if not fileexists("u:\accounting") then
	messagebox("Error","The fax' folder cannot be mapped.~nPlease map the network drive manually.",StopSign!)
	close(this)
	return	
end if

is_faxpath = "u:\accounting\"

lb_faxes.DirList(is_faxpath + is_idbranch + "*.TIF", 0)



end event

type ole_fax from olecustomcontrol within w_faxviewer
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
integer height = 1560
boolean bringtotop = true
string binarykey = "w_faxviewer.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type lb_faxes from listbox within w_faxviewer
integer x = 32
integer y = 184
integer width = 581
integer height = 844
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

type cb_3 from commandbutton within w_faxviewer
integer x = 1742
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

event clicked;double ld_current

if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if

ld_current=double(sle_zoom.text)

if ld_current < 300 then
	ole_fax.object.zoom = ld_current + 10
	sle_zoom.text = string(ld_current + 10)
	ole_fax.object.display
end if
end event

type sle_zoom from singlelineedit within w_faxviewer
integer x = 1856
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

type cb_zoomout from commandbutton within w_faxviewer
integer x = 1998
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

event clicked;double ld_current

if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if

ld_current=double(sle_zoom.text)

if ld_current > 10 then
	ole_fax.object.zoom = ld_current - 10
	sle_zoom.text = string(ld_current - 10)
	ole_fax.object.display
end if
end event

type sle_selected from singlelineedit within w_faxviewer
integer x = 32
integer y = 1084
integer width = 581
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_faxviewer
integer x = 27
integer y = 44
integer width = 411
integer height = 76
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
string text = "Faxes available"
boolean focusrectangle = false
end type

type st_agency from statictext within w_faxviewer
integer x = 27
integer y = 112
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
string text = "ALL AGENCIES"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_faxviewer
integer x = 2542
integer y = 1656
integer width = 480
integer height = 84
integer taborder = 40
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
String ls_selected, ls_branch, ls_amount
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
	ls_amount = em_valor.text
	if isnull(ls_branch) then ls_branch = ''
	if isnull(ls_amount) then ls_amount = '0'
	
	select count(*) into :ll_cont
	from dba.branch where id_branch = :ls_branch;
	
	if ll_cont < 1 then 
		Messagebox("Branch not Found","The branch ["+ls_branch+"] was not found",StopSign!)
		SetFocus(em_branch)
		return
	end if
	
	ls_selected = ls_selected+"*"+ls_branch+"*"+ls_amount

end if

CloseWithReturn(parent,ls_selected)
end event

type cb_cancel from commandbutton within w_faxviewer
integer x = 3040
integer y = 1656
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

type gb_2 from groupbox within w_faxviewer
integer x = 9
integer y = 1464
integer width = 631
integer height = 272
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

type cb_1 from commandbutton within w_faxviewer
integer x = 1271
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

event clicked;if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if

ole_fax.object.RotateLeft
ole_fax.object.Save
end event

type st_branch from statictext within w_faxviewer
integer x = 55
integer y = 1160
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

type cb_2 from commandbutton within w_faxviewer
integer x = 2569
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

event clicked;integer li_current

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
end event

type cb_rrr from commandbutton within w_faxviewer
integer x = 2318
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

event clicked;integer li_current

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
end event

type cb_4 from commandbutton within w_faxviewer
integer x = 2802
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

event clicked;if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if
ole_fax.object.PrintImage(ole_fax.object.Page,ole_fax.object.Page)


//double ld_curzoom

//ld_curzoom = ole_fax.object.zoom
//ole_fax.object.zoom = 100
//ole_fax.object.display	
////ole_fax.object.PrintImage(ole_fax.object.Page,ole_fax.object.Page,0)

//ole_fax.object.PrintImage(ole_fax.object.Page,ole_fax.object.Page)
//ole_fax.object.zoom = ld_curzoom
end event

type em_branch from editmask within w_faxviewer
integer x = 32
integer y = 1220
integer width = 581
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

type st_valor from statictext within w_faxviewer
integer x = 50
integer y = 1300
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
long backcolor = 67108864
boolean enabled = false
string text = "Valor :"
boolean focusrectangle = false
end type

type em_valor from editmask within w_faxviewer
integer x = 32
integer y = 1356
integer width = 581
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
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

type cb_rotateright from commandbutton within w_faxviewer
integer x = 1390
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

event clicked;if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if

ole_fax.object.RotateRight
ole_fax.object.Save
end event

type st_4 from statictext within w_faxviewer
integer x = 1056
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

type st_5 from statictext within w_faxviewer
integer x = 1595
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

type st_6 from statictext within w_faxviewer
integer x = 2190
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

type sle_pos from singlelineedit within w_faxviewer
integer x = 2427
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

type cb_refresh from commandbutton within w_faxviewer
integer x = 695
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

event clicked;lb_faxes.DirList(is_faxpath + is_idbranch + "*.TIF", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
ole_fax.object.ClearDisplay()
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type cb_printall from commandbutton within w_faxviewer
integer x = 3131
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

event clicked;if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if
ole_fax.object.PrintImage(1,ole_fax.object.PageCount)

end event

type cb_move from commandbutton within w_faxviewer
integer x = 32
integer y = 1628
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

	String ls_faxpath, ls_faxname, ls_newfaxfolder

	ls_faxpath = is_faxpath
	ls_newfaxfolder = "u:\"+lb_movetofolder.text+"\"
	ls_faxname = sle_selected.text
	if messagebox("Confirm","Are you sure that your want to move the fax " + sle_selected.text + " to "+ls_newfaxfolder+"?",Question!,YesNo!) <> 1 Then
		return
	end if
	if FileExists(ls_faxpath+ls_faxname) then
		fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+string(today(),'mmddyyhhmmss')+'_'+gs_login+'_'+ls_faxname)										
	end if
	
end if
ole_fax.object.ClearDisplay
lb_faxes.DirList(is_faxpath + is_idbranch + "*.TIF", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
ole_fax.object.ClearDisplay()
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type lb_movetofolder from dropdownlistbox within w_faxviewer
integer x = 32
integer y = 1532
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
string item[] = {"Ach","Applications","Compliance","Corporate","Corporate\Processed","Junk","RedPhone","AccountTemp","Inbox","Marketing"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_faxviewer
integer x = 55
integer y = 1028
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

type gb_1 from groupbox within w_faxviewer
integer x = 9
integer width = 631
integer height = 1452
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
0Ew_faxviewer.bin 
2000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000dda36c9001c97ccb00000003000003c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000002f100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000036d94028011ce9f116002fd838ac03e8c00000000dda36c9001c97ccbdda36c9001c97ccb000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000c00000089000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000bfffffffe0000000d0000000efffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe000201056d94028011ce9f116002fd838ac03e8c00000001fb8f0821101b01640008ed8413c72e2b00000030000002c10000001300000100000000a000000101000000a800000102000000b000000103000000b800000104000000c000000105000000cc00000106000000d400000107000000dc00000108000000e400000109000000ec0000010a000000f40000010b000000fc0000010c000001040000010d0000010c0000010e000001140000010f0000011c0000011000000124000001110000012c000000000000013400000003000200020000000300004014000000030000284f00000003000000600000001e00000002000000490000000b000000000000000200000000000000031cd433ff000000020000cbc400000002000064c90000000b0000ffff00000002000064c9000000020000cbc4000000020000cbc4000000030012cd18000000030012cd180000000b0000ffff0000000b0000ffff00000013000000000000000100010e0000000b0065726c007672657300316465000001100000000b73657262657672650f0031640b0000016c0000006573657264657672010c0032000b000072730000726573653164657600010b0000000e0067616d006966696e6f7a726509006d6f1200000161000000746f6e6e6f69746172636f6e657079740001050000001a006c6573006974636565726e6f6e61746365656c676c62616e110064650b000001620000006573657264657672010d0032000b00007273000072657365326465760001030000000c0074735f00706b636f73706f720001060000000c00726f620073726564656c79740001040000000d00616d69006f6365676f72746e0101006c00090000655f00006e65747802007874090000015f000000657478650079746e0000010a0000001363726f666c6966656e696c65676e696b08007831120000016f0000006f7a72636976656e696269737974696c0001070000000f00646e75006675626f7372656600657a6900000100000000097265765f6e6f69730000000000000000000000000000000000020002000040140000284f00000060ff010000ff00fffe0000fffeff0000004901fffe000000000000000142c8000000020000000000ff0000ffff00ff000000ff0000ff000000ff00fffe0000fffe00000000000100000101ff0000000000000000031cd433ff64c9cc98000100009864c90000cc98cc000000102e000010fffeff2efffeff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Ew_faxviewer.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
