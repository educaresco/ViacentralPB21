$PBExportHeader$w_group_branch_topcredits.srw
forward
global type w_group_branch_topcredits from wb_single_tb
end type
type sle_branch from singlelineedit within w_group_branch_topcredits
end type
type lst_branch from my_ddlb within w_group_branch_topcredits
end type
type st_1 from statictext within w_group_branch_topcredits
end type
type st_2 from statictext within w_group_branch_topcredits
end type
type gb_1 from groupbox within w_group_branch_topcredits
end type
end forward

global type w_group_branch_topcredits from wb_single_tb
integer x = 214
integer y = 221
integer width = 4754
integer height = 2092
string title = "Group Branch - ViaCheck"
sle_branch sle_branch
lst_branch lst_branch
st_1 st_1
st_2 st_2
gb_1 gb_1
end type
global w_group_branch_topcredits w_group_branch_topcredits

forward prototypes
public subroutine fn_filter ()
end prototypes

public subroutine fn_filter ();String ls_filter, ls_main_branch, ls_branch
dw_1.Retrieve()

if lst_branch.getdataid() <> '--' then

	ls_branch = lst_branch.getdataid()

	SELECT RTRIM(ID_MAIN_BRANCH)
	INTO:ls_main_branch
	FROM DBA.BRANCH
	WHERE ID_BRANCH = :ls_branch;
	
	ls_filter = "id_main_branch = '"+ls_main_branch+"'"
else
	ls_filter = ''
end if		
dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end subroutine

on w_group_branch_topcredits.create
int iCurrent
call super::create
this.sle_branch=create sle_branch
this.lst_branch=create lst_branch
this.st_1=create st_1
this.st_2=create st_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_branch
this.Control[iCurrent+2]=this.lst_branch
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.gb_1
end on

on w_group_branch_topcredits.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_branch)
destroy(this.lst_branch)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.gb_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_group_branch_topcredits
integer y = 176
integer width = 4686
integer height = 1704
string dataobject = "dw_group_branch_topcredits"
end type

event dw_1::pfc_deleterow;return 0;
end event

event dw_1::pfc_insertrow;return 0;
end event

type sle_branch from singlelineedit within w_group_branch_topcredits
integer x = 261
integer y = 44
integer width = 343
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

event modified;lst_branch.setselectedid( sle_branch.text )

// Chequea que este en la lista
IF sle_branch.text <> lst_branch.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
	return
ELSE	
	this.TextColor	= RGB(0,0,0)	
END IF

fn_filter()
end event

type lst_branch from my_ddlb within w_group_branch_topcredits
integer x = 617
integer y = 44
integer width = 1317
integer height = 1448
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch in ('R','A') and id_status_branch = 'O' UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;
sle_branch.text = lst_branch.getdataid()

fn_filter()
end event

type st_1 from statictext within w_group_branch_topcredits
integer x = 55
integer y = 60
integer width = 197
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
string text = "Branch :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_group_branch_topcredits
integer x = 2958
integer y = 56
integer width = 690
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use TOP = 0 for No Limit."
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_group_branch_topcredits
integer width = 1979
integer height = 148
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

