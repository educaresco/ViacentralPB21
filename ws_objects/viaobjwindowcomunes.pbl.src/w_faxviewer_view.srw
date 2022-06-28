$PBExportHeader$w_faxviewer_view.srw
forward
global type w_faxviewer_view from pfc_w_master
end type
type ole_fax from olecustomcontrol within w_faxviewer_view
end type
type cb_3 from commandbutton within w_faxviewer_view
end type
type sle_zoom from singlelineedit within w_faxviewer_view
end type
type cb_zoomout from commandbutton within w_faxviewer_view
end type
type sle_selected from singlelineedit within w_faxviewer_view
end type
type cb_close from commandbutton within w_faxviewer_view
end type
type cb_1 from commandbutton within w_faxviewer_view
end type
type cb_2 from commandbutton within w_faxviewer_view
end type
type cb_rrr from commandbutton within w_faxviewer_view
end type
type cb_rotateright from commandbutton within w_faxviewer_view
end type
type st_4 from statictext within w_faxviewer_view
end type
type st_5 from statictext within w_faxviewer_view
end type
type st_6 from statictext within w_faxviewer_view
end type
type sle_pos from singlelineedit within w_faxviewer_view
end type
type cb_printall from commandbutton within w_faxviewer_view
end type
end forward

global type w_faxviewer_view from pfc_w_master
integer width = 2551
integer height = 1756
boolean maxbox = false
windowtype windowtype = popup!
long backcolor = 80269524
ole_fax ole_fax
cb_3 cb_3
sle_zoom sle_zoom
cb_zoomout cb_zoomout
sle_selected sle_selected
cb_close cb_close
cb_1 cb_1
cb_2 cb_2
cb_rrr cb_rrr
cb_rotateright cb_rotateright
st_4 st_4
st_5 st_5
st_6 st_6
sle_pos sle_pos
cb_printall cb_printall
end type
global w_faxviewer_view w_faxviewer_view

type variables
String   is_faxpath
end variables

on w_faxviewer_view.create
int iCurrent
call super::create
this.ole_fax=create ole_fax
this.cb_3=create cb_3
this.sle_zoom=create sle_zoom
this.cb_zoomout=create cb_zoomout
this.sle_selected=create sle_selected
this.cb_close=create cb_close
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_rrr=create cb_rrr
this.cb_rotateright=create cb_rotateright
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.sle_pos=create sle_pos
this.cb_printall=create cb_printall
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_fax
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.sle_zoom
this.Control[iCurrent+4]=this.cb_zoomout
this.Control[iCurrent+5]=this.sle_selected
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_rrr
this.Control[iCurrent+10]=this.cb_rotateright
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.sle_pos
this.Control[iCurrent+15]=this.cb_printall
end on

on w_faxviewer_view.destroy
call super::destroy
destroy(this.ole_fax)
destroy(this.cb_3)
destroy(this.sle_zoom)
destroy(this.cb_zoomout)
destroy(this.sle_selected)
destroy(this.cb_close)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_rrr)
destroy(this.cb_rotateright)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.sle_pos)
destroy(this.cb_printall)
end on

event open;call super::open;double ld_current

is_faxpath = message.stringparm

if not FileExists(is_faxpath) then
	Messagebox("File not found","The file ["+is_faxpath+"] was not found",StopSign!)
	Close(this)
	return
end if

ole_fax.object.image = is_faxpath
sle_selected.text = "FILE NAME: "+is_faxpath
ld_current=double(sle_zoom.text)
ole_fax.object.zoom = ld_current
ole_fax.object.Page = 1
ole_fax.object.display

sle_pos.text = String(ole_fax.object.Page)+"/"+string(ole_fax.object.PageCount)



end event

event pfc_preopen;call super::pfc_preopen;this.of_SetResize(TRUE)
IF IsValid(this.inv_resize) THEN
   //Registering objects
   this.inv_resize.of_Register(ole_fax,"ScaleToRight&Bottom") 
	this.inv_resize.of_Register(sle_selected,"FixedToBottom&ScaleToRight") 	
END IF
end event

type ole_fax from olecustomcontrol within w_faxviewer_view
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
integer x = 32
integer y = 124
integer width = 2491
integer height = 1500
boolean bringtotop = true
string binarykey = "w_faxviewer_view.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_faxviewer_view
integer x = 745
integer y = 20
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

type sle_zoom from singlelineedit within w_faxviewer_view
integer x = 859
integer y = 16
integer width = 142
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "100"
boolean autohscroll = false
end type

type cb_zoomout from commandbutton within w_faxviewer_view
integer x = 1001
integer y = 20
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

type sle_selected from singlelineedit within w_faxviewer_view
integer x = 32
integer y = 1628
integer width = 2491
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 8421504
boolean autohscroll = false
boolean displayonly = true
end type

type cb_close from commandbutton within w_faxviewer_view
integer x = 2034
integer y = 12
integer width = 293
integer height = 80
integer taborder = 1
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
boolean cancel = true
boolean default = true
end type

event clicked;
Close(parent)
end event

type cb_1 from commandbutton within w_faxviewer_view
integer x = 274
integer y = 20
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
string text = "<"
end type

event clicked;if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if

ole_fax.object.RotateLeft
ole_fax.object.Save
end event

type cb_2 from commandbutton within w_faxviewer_view
integer x = 1573
integer y = 20
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
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

type cb_rrr from commandbutton within w_faxviewer_view
integer x = 1321
integer y = 20
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
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

type cb_rotateright from commandbutton within w_faxviewer_view
integer x = 393
integer y = 20
integer width = 114
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
string text = ">"
end type

event clicked;if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if

ole_fax.object.RotateRight
ole_fax.object.Save
end event

type st_4 from statictext within w_faxviewer_view
integer x = 59
integer y = 24
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

type st_5 from statictext within w_faxviewer_view
integer x = 599
integer y = 24
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

type st_6 from statictext within w_faxviewer_view
integer x = 1193
integer y = 24
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

type sle_pos from singlelineedit within w_faxviewer_view
integer x = 1431
integer y = 16
integer width = 142
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "1/1"
boolean autohscroll = false
end type

type cb_printall from commandbutton within w_faxviewer_view
integer x = 1714
integer y = 12
integer width = 293
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print"
end type

event clicked;if isnull(ole_fax.object.image) or len(trim(string(ole_fax.object.image))) < 1 then
	return
end if
ole_fax.object.PrintImage(1,ole_fax.object.PageCount)

end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
08w_faxviewer_view.bin 
2800000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000dab09d0001c6fed300000003000003c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000002f100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000036d94028011ce9f116002fd838ac03e8c00000000dab09d0001c6fed3dab09d0001c6fed3000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000c00000089000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000bfffffffe0000000d0000000efffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe000201056d94028011ce9f116002fd838ac03e8c00000001fb8f0821101b01640008ed8413c72e2b00000030000002c10000001300000100000000a000000101000000a800000102000000b000000103000000b800000104000000c000000105000000cc00000106000000d400000107000000dc00000108000000e400000109000000ec0000010a000000f40000010b000000fc0000010c000001040000010d0000010c0000010e000001140000010f0000011c0000011000000124000001110000012c00000000000001340000000300020002000000030000385400000003000026c200000003000000600000001e00000002000000490000000b000000000000000200000000000000030e2e8300000000020000e0e400000002000064c90000000b0000ffff00000002000064c9000000020000e0e4000000020000e0e4000000030012e23c000000030012e23c0000000b0000ffff0000000b0000ffff00000013000000000000000100010e0000000b0065726c007672657300316465000001100000000b73657262657672650f0031640b0000016c0000006573657264657672010c0032000b000072730000726573653164657600010b0000000e0067616d006966696e6f7a726509006d6f1200000161000000746f6e6e6f69746172636f6e657079740001050000001a006c6573006974636565726e6f6e61746365656c676c62616e110064650b000001620000006573657264657672010d0032000b00007273000072657365326465760001030000000c0074735f00706b636f73706f720001060000000c00726f620073726564656c79740001040000000d00616d69006f6365676f72746e0101006c00090000655f00006e65747802007874090000015f000000657478650079746e0000010a0000001363726f666c6966656e696c65676e696b08007831120000016f0000006f7a72636976656e696269737974696c0001070000000f00646e75006675626f7372656600657a6900000100000000097265765f6e6f6973000000000000000000000000000000000002000200003854000026c200000060ff010000ff00fffe0000fffeff0000004901fffe000000000000000142c8000000020000000000ff0000ffff00ff000000ff0000ff000000ff00fffe0000fffe00000000000100000101ff0000000000000000030e2e830064c9e198000100009864c90000e198e10000001049000010fffeff49fffeff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18w_faxviewer_view.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
