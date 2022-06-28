$PBExportHeader$w_viatasa_split.srw
forward
global type w_viatasa_split from wb_single_tb
end type
type st_1 from statictext within w_viatasa_split
end type
type sle_idbranch from singlelineedit within w_viatasa_split
end type
type lst_branch from my_ddlb within w_viatasa_split
end type
type gb_1 from groupbox within w_viatasa_split
end type
end forward

global type w_viatasa_split from wb_single_tb
integer x = 214
integer y = 221
integer width = 3113
integer height = 2004
st_1 st_1
sle_idbranch sle_idbranch
lst_branch lst_branch
gb_1 gb_1
end type
global w_viatasa_split w_viatasa_split

forward prototypes
public subroutine fn_filterdatawindow ()
end prototypes

public subroutine fn_filterdatawindow ();String ls_filter
ls_filter = ''
dw_1.Retrieve()

if lst_branch.getdataid() <> '--' then
	ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
else
	ls_filter = "id_branch <> 'null'"
end if		
	
dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end subroutine

on w_viatasa_split.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_idbranch=create sle_idbranch
this.lst_branch=create lst_branch
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_idbranch
this.Control[iCurrent+3]=this.lst_branch
this.Control[iCurrent+4]=this.gb_1
end on

on w_viatasa_split.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.sle_idbranch)
destroy(this.lst_branch)
destroy(this.gb_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_viatasa_split
integer x = 14
integer y = 196
integer width = 2985
integer height = 1584
string dataobject = "dw_viatasa_split"
end type

event dw_1::pfc_insertrow;Messagebox("Error","Option not allowed",StopSign!)
return 0
end event

event dw_1::pfc_deleterow;Messagebox("Error","Option not allowed",StopSign!)
return 0
end event

event dw_1::itemchanged;call super::itemchanged;

if dwo.name = 'split' then
	
	if double(data) >=0 and double(data) <= 1 then
		
		return 0
	else
		
		Messagebox("Error","The SPLIT % must be between 0% and 100%",StopSign!)
		return 1
	end if
	
	
end if



if dwo.name = 'viatasa_split_limit_viatasa' then
	
	if double(data) >=0 and double(data) <= 0.1 then
		
		return 0
	else
		
		Messagebox("Error","The LIMIT % mus be between 0% and 10%",StopSign!)
		return 1
	end if
	
	
end if


//0  (Default) Accept the data value
//1  Reject the data value and do not allow focus to change
//2  Reject the data value but allow the focus to change
end event

type st_1 from statictext within w_viatasa_split
integer x = 233
integer y = 80
integer width = 201
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
string text = "Agency:"
boolean focusrectangle = false
end type

type sle_idbranch from singlelineedit within w_viatasa_split
integer x = 466
integer y = 64
integer width = 265
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_branch.setselectedid(sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_branch.getdataid() THEN
	this.TextColor	= RGB(255,0,0)	
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF

fn_filterdatawindow()

end event

type lst_branch from my_ddlb within w_viatasa_split
integer x = 736
integer y = 64
integer width = 1458
integer height = 1448
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, dba.viatasa_split.id_branch from dba.viatasa_split, dba.branch where dba.viatasa_split.id_branch = dba.branch.id_branch and dba.branch.id_status_branch = 'O' UNION select '-ALL-', '--' order by 1;")
end event

event modified;call super::modified;sle_idbranch.text = lst_branch.getdataid()
end event

event selectionchanged;call super::selectionchanged;fn_filterdatawindow()

end event

type gb_1 from groupbox within w_viatasa_split
integer x = 14
integer width = 2578
integer height = 180
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

