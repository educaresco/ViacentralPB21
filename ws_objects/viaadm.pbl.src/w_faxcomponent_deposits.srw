$PBExportHeader$w_faxcomponent_deposits.srw
forward
global type w_faxcomponent_deposits from w_faxcomponent
end type
type st_branch from statictext within w_faxcomponent_deposits
end type
type em_branch from editmask within w_faxcomponent_deposits
end type
type st_valor from statictext within w_faxcomponent_deposits
end type
type em_valor from editmask within w_faxcomponent_deposits
end type
end forward

global type w_faxcomponent_deposits from w_faxcomponent
integer width = 3753
integer height = 1856
string title = "Fax Viewer - Deposits"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_branch st_branch
em_branch em_branch
st_valor st_valor
em_valor em_valor
end type
global w_faxcomponent_deposits w_faxcomponent_deposits

on w_faxcomponent_deposits.create
int iCurrent
call super::create
this.st_branch=create st_branch
this.em_branch=create em_branch
this.st_valor=create st_valor
this.em_valor=create em_valor
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_branch
this.Control[iCurrent+2]=this.em_branch
this.Control[iCurrent+3]=this.st_valor
this.Control[iCurrent+4]=this.em_valor
end on

on w_faxcomponent_deposits.destroy
call super::destroy
destroy(this.st_branch)
destroy(this.em_branch)
destroy(this.st_valor)
destroy(this.em_valor)
end on

event open;call super::open;lb_movetofolder.text = "Junk"
end event

type cb_rotate180 from w_faxcomponent`cb_rotate180 within w_faxcomponent_deposits
end type

type pb_duplicate_page from w_faxcomponent`pb_duplicate_page within w_faxcomponent_deposits
end type

type st_res from w_faxcomponent`st_res within w_faxcomponent_deposits
end type

type sle_id_branch from w_faxcomponent`sle_id_branch within w_faxcomponent_deposits
end type

type st_5 from w_faxcomponent`st_5 within w_faxcomponent_deposits
end type

type pb_separate from w_faxcomponent`pb_separate within w_faxcomponent_deposits
end type

type pb_print from w_faxcomponent`pb_print within w_faxcomponent_deposits
end type

type cb_refresh from w_faxcomponent`cb_refresh within w_faxcomponent_deposits
end type

type pb_previous from w_faxcomponent`pb_previous within w_faxcomponent_deposits
end type

type pb_next from w_faxcomponent`pb_next within w_faxcomponent_deposits
end type

type ole_fax1 from w_faxcomponent`ole_fax1 within w_faxcomponent_deposits
integer taborder = 0
end type

type lb_faxes from w_faxcomponent`lb_faxes within w_faxcomponent_deposits
integer taborder = 10
end type

type st_2 from w_faxcomponent`st_2 within w_faxcomponent_deposits
end type

type cb_ok from w_faxcomponent`cb_ok within w_faxcomponent_deposits
end type

event cb_ok::clicked;Long ll_cont
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

type cb_rotateleft from w_faxcomponent`cb_rotateleft within w_faxcomponent_deposits
end type

type cb_rotateright from w_faxcomponent`cb_rotateright within w_faxcomponent_deposits
end type

type st_4 from w_faxcomponent`st_4 within w_faxcomponent_deposits
end type

type st_6 from w_faxcomponent`st_6 within w_faxcomponent_deposits
end type

type sle_pos from w_faxcomponent`sle_pos within w_faxcomponent_deposits
end type

type cb_move from w_faxcomponent`cb_move within w_faxcomponent_deposits
integer y = 1540
end type

type lb_folder from w_faxcomponent`lb_folder within w_faxcomponent_deposits
integer taborder = 0
end type

type st_3 from w_faxcomponent`st_3 within w_faxcomponent_deposits
end type

type sle_selected from w_faxcomponent`sle_selected within w_faxcomponent_deposits
end type

type lb_movetofolder from w_faxcomponent`lb_movetofolder within w_faxcomponent_deposits
integer y = 1540
end type

type gb_3 from w_faxcomponent`gb_3 within w_faxcomponent_deposits
boolean visible = false
end type

type gb_1 from w_faxcomponent`gb_1 within w_faxcomponent_deposits
integer y = 1472
end type

type st_1 from w_faxcomponent`st_1 within w_faxcomponent_deposits
end type

type sle_newname from w_faxcomponent`sle_newname within w_faxcomponent_deposits
boolean visible = false
end type

type st_7 from w_faxcomponent`st_7 within w_faxcomponent_deposits
boolean visible = false
end type

type sle_email from w_faxcomponent`sle_email within w_faxcomponent_deposits
boolean visible = false
end type

type cb_email from w_faxcomponent`cb_email within w_faxcomponent_deposits
boolean visible = false
end type

type gb_2 from w_faxcomponent`gb_2 within w_faxcomponent_deposits
integer height = 376
end type

type htb_zoom from w_faxcomponent`htb_zoom within w_faxcomponent_deposits
end type

type st_branch from statictext within w_faxcomponent_deposits
integer x = 41
integer y = 1212
integer width = 229
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

type em_branch from editmask within w_faxcomponent_deposits
integer x = 247
integer y = 1204
integer width = 512
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

type st_valor from statictext within w_faxcomponent_deposits
integer x = 41
integer y = 1304
integer width = 229
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
string text = "Amount:"
boolean focusrectangle = false
end type

type em_valor from editmask within w_faxcomponent_deposits
integer x = 247
integer y = 1296
integer width = 512
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

