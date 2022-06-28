$PBExportHeader$w_busca_nombre.srw
forward
global type w_busca_nombre from window
end type
type cbx_hidden from checkbox within w_busca_nombre
end type
type cbx_all from checkbox within w_busca_nombre
end type
type st_3 from statictext within w_busca_nombre
end type
type sle_filter from singlelineedit within w_busca_nombre
end type
type st_1 from statictext within w_busca_nombre
end type
type cb_select from commandbutton within w_busca_nombre
end type
type cb_1 from commandbutton within w_busca_nombre
end type
type dw_1 from u_dw within w_busca_nombre
end type
type dw_2 from datawindow within w_busca_nombre
end type
end forward

global type w_busca_nombre from window
integer x = 763
integer y = 524
integer width = 2491
integer height = 1776
boolean titlebar = true
string title = "Select Sender"
windowtype windowtype = response!
long backcolor = 79741120
cbx_hidden cbx_hidden
cbx_all cbx_all
st_3 st_3
sle_filter sle_filter
st_1 st_1
cb_select cb_select
cb_1 cb_1
dw_1 dw_1
dw_2 dw_2
end type
global w_busca_nombre w_busca_nombre

type variables
string	is_name
decimal	ld_selected_window

datetime id_datestart, id_dateend
end variables

forward prototypes
public subroutine fn_retrieve ()
end prototypes

public subroutine fn_retrieve ();// ++++++++
// Stats Start
String ls_details
id_datestart = DateTime(Today(),Now())
ls_details = is_name
// ++++++++


String ls_hidden
Boolean ls_phone_search
if cbx_hidden.checked then
	ls_hidden = 'Y'
else
	ls_hidden = 'N'
end if

if IsNumber ( is_name ) and len(is_name) = 10 and (is_name <> '7070707070') then
	ls_phone_search = True
else
	ls_phone_search = False
end if

st_3.visible = false

if ls_phone_search then
	dw_1.retrieve('',gs_branch_insta,ls_hidden,Dec(is_name),'P')
	 ls_details = '(PH) '+ls_details
else
	dw_1.retrieve(is_name,gs_branch_insta,ls_hidden,0,'N')
end if



// Cuando no encontro locales automaticamente busca globales
if dw_1.rowcount() = 0 and len(is_name)>6 and ls_phone_search then
	cbx_all.checked = true
end if



if cbx_all.checked then
	if len(is_name)>6 and ((fn_tokens(is_name, '%') >= 3) or ls_phone_search) then
		if ls_phone_search then
			// Search by Phone Number
			dw_2.retrieve('',gs_branch_insta,Dec(is_name),'P')
		else
			// Search by Name
			dw_2.retrieve(is_name,gs_branch_insta,0,'N')
		end if
	else
		dw_2.reset()
		st_3.visible = true
	end if
else
	dw_2.reset()
end if
	
dw_1.SelectRow(0, FALSE)
dw_2.SelectRow(0, FALSE)
dw_1.setfocus()
cb_select.text = 'SELECT'
cb_select.enabled = false
ld_selected_window = -1



// ++++++++
// Stats End
if cbx_all.checked then ls_details = '(ALL) '+ls_details
id_dateend = DateTime(Today(),Now())

// Starts Collect
DECLARE spAddStatisticsDetails PROCEDURE FOR dba.spAddStatisticsDetails
 @ID_APPLICATION = 1
,@ID_STAT_TYPE = 1
,@START_STAT = :id_datestart
,@END_STAT = :id_dateend
,@ID_BRANCH = null
,@ID_SENDER = null
,@ID_RECEIVER = null
,@DETAILS = :ls_details; 

EXECUTE spAddStatisticsDetails;
// ++++++++


return
	

end subroutine

event open;
is_name = Message.StringParm	

sle_filter.text = trim(fn_replace(fn_replace(is_name,'%',' '),'  ',' '))

// Detects a phone number then removes the %
if IsNumber ( sle_filter.text ) and len(sle_filter.text) = 10 and (sle_filter.text <> '7070707070') then
	is_name = sle_filter.text
end if
	
	
// 2018/04/16: connect the query to RPT DB.
//dw_1.settransobject(SQLCARPT)
dw_2.settransobject(SQLCARPT)

fn_retrieve()
end event

on w_busca_nombre.create
this.cbx_hidden=create cbx_hidden
this.cbx_all=create cbx_all
this.st_3=create st_3
this.sle_filter=create sle_filter
this.st_1=create st_1
this.cb_select=create cb_select
this.cb_1=create cb_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.cbx_hidden,&
this.cbx_all,&
this.st_3,&
this.sle_filter,&
this.st_1,&
this.cb_select,&
this.cb_1,&
this.dw_1,&
this.dw_2}
end on

on w_busca_nombre.destroy
destroy(this.cbx_hidden)
destroy(this.cbx_all)
destroy(this.st_3)
destroy(this.sle_filter)
destroy(this.st_1)
destroy(this.cb_select)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.dw_2)
end on

event key;IF KeyDown(KeyUpArrow!) THEN 
//	MessageBox("UP","UP")
END IF

IF dw_1.GetRow() > 0 THEN
	IF KeyDown(KeyUpArrow!) then
		IF dw_1.GetRow() > 1 THEN
			dw_1.SelectRow(0, FALSE)
			dw_1.SelectRow(dw_1.GetRow() - 1, TRUE)
			dw_1.SetRow(dw_1.GetRow() - 1)
			dw_1.ScrollToRow(dw_1.GetRow() - 1)
			Return
		END IF
	ELSEIF KeyDown(KeyDownArrow!) then
		IF dw_1.GetRow() < dw_1.RowCount() THEN
			dw_1.SelectRow(0, FALSE)
			dw_1.SelectRow(dw_1.GetRow()+1, TRUE)
			dw_1.SetRow(dw_1.GetRow()+1)
			dw_1.ScrollToRow(dw_1.GetRow()+1)
			Return
		END IF
	END IF
END IF
end event

type cbx_hidden from checkbox within w_busca_nombre
integer x = 1902
integer y = 36
integer width = 539
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "View Hidden Records"
end type

event clicked;//dw_1.update()
fn_retrieve()
end event

type cbx_all from checkbox within w_busca_nombre
integer y = 740
integer width = 1097
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "View all Viamericas customers"
end type

event clicked;
if this.checked then 
	fn_retrieve()
else
	dw_2.reset()
	st_3.visible = false	
end if
end event

type st_3 from statictext within w_busca_nombre
integer x = 407
integer y = 1168
integer width = 1595
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
string text = "- Please use a longer filter and at least two words for names- "
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_filter from singlelineedit within w_busca_nombre
integer x = 1047
integer y = 24
integer width = 823
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
borderstyle borderstyle = stylelowered!
end type

event modified;
 this.text = trim( this.text)
 
if IsNumber ( this.text ) and len(this.text) = 10 and (this.text <> '7070707070') then
	is_name = this.text
else
	is_name = '%'+fn_replace(fn_replace(this.text,'  ',' '),' ','%')+'%'
end if
	
fn_retrieve()

end event

type st_1 from statictext within w_busca_nombre
integer x = 14
integer y = 36
integer width = 1024
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Customer Name or Phone Number (FASTER): "
boolean focusrectangle = false
end type

type cb_select from commandbutton within w_busca_nombre
integer x = 229
integer y = 1560
integer width = 1275
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "SELECT"
boolean default = true
end type

event clicked;long		ll_row
double	ld_sender
string 	ls_branch
Double	ld_sender_globar


//dw_1.update()

if ld_selected_window = -1 then
	messagebox("Error","Please select a sender from the list",StopSign!)
else

	if ld_selected_window = 1 then
		ls_branch = dw_1.getitemstring(dw_1.getrow(),'id_branch')
		ld_sender = dw_1.getitemnumber(dw_1.getrow(),'id_sender')
		ld_sender_globar = dw_1.getitemnumber(dw_1.getrow(),'id_sender_global')
	else
		ls_branch = dw_2.getitemstring(dw_2.getrow(),'id_branch')
		ld_sender = dw_2.getitemnumber(dw_2.getrow(),'id_sender')
		ld_sender_globar = dw_2.getitemnumber(dw_2.getrow(),'id_sender_global')		
	end if	
	
	closewithreturn(w_busca_nombre,ls_branch+'*'+string(ld_sender)+'*'+string(ld_sender_globar))

end if
end event

type cb_1 from commandbutton within w_busca_nombre
integer x = 1522
integer y = 1560
integer width = 562
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "NEW CUSTOMER"
boolean cancel = true
end type

event clicked;
//dw_1.update()

CloseWithReturn(w_busca_nombre,'-NONE-')
end event

type dw_1 from u_dw within w_busca_nombre
integer y = 132
integer width = 2441
integer height = 608
integer taborder = 20
string dataobject = "dw_name_sender"
end type

event clicked;call super::clicked;if this.GetClickedRow() >0 then
	
	dw_2.SelectRow(0, FALSE)
	this.SelectRow(0, FALSE)
	
	this.SelectRow(0, FALSE)
	this.SelectRow(row, TRUE)
	SetRow(row)
	
	ld_selected_window = 1
	cb_select.text = 'SELECT ' + this.getitemstring(row,"name_sender")
	cb_select.enabled = true

end if
end event

event doubleclicked;ld_selected_window = 1
cb_select.triggerevent(clicked!)
end event

event rowfocuschanged;call super::rowfocuschanged;dw_2.SelectRow(0, FALSE)
this.SelectRow(0, FALSE)
this.SelectRow(currentrow, TRUE)
this.SetRow(currentrow)

if currentrow > 0 then
	ld_selected_window = 1
	cb_select.text = 'SELECT ' + this.getitemstring(currentrow,"name_sender")
	cb_select.enabled = true
else
	ld_selected_window = -1
	cb_select.text = 'SELECT' 
	cb_select.enabled = false
end if
end event

event constructor;call super::constructor;this.SetTransObject(sqlca)
end event

event itemchanged;call super::itemchanged;// 2018/04/16 Disabled because it is read only now.
//dw_1.update()
end event

type dw_2 from datawindow within w_busca_nombre
integer y = 812
integer width = 2441
integer height = 704
integer taborder = 40
string dataobject = "dw_name_sender_cia"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if this.GetClickedRow() >0 then
	
	dw_1.SelectRow(0, FALSE)
	this.SelectRow(0, FALSE)


	this.SelectRow(0, FALSE)
   this.SelectRow(row, TRUE)
	SetRow(row)


	ld_selected_window = 2
	cb_select.text = 'SELECT ' + this.getitemstring(row,"name_sender")
	cb_select.enabled = true

end if
end event

event constructor;this.SetTransObject(sqlca)
end event

event doubleclicked;ld_selected_window = 2
cb_select.triggerevent(clicked!)
end event

event rowfocuschanged;dw_1.SelectRow(0, FALSE)
this.SelectRow(0, FALSE)
this.SelectRow(currentrow, TRUE)
this.SetRow(currentrow)

if currentrow > 0 then
	ld_selected_window = 2
	cb_select.text = 'SELECT ' + this.getitemstring(currentrow,"name_sender")
	cb_select.enabled = true
else
	ld_selected_window = -1
	cb_select.text = 'SELECT' 
	cb_select.enabled = false
end if
end event

