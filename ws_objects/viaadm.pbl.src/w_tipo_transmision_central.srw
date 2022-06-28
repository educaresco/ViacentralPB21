$PBExportHeader$w_tipo_transmision_central.srw
forward
global type w_tipo_transmision_central from wb_single_tb
end type
type sle_branch from singlelineedit within w_tipo_transmision_central
end type
type st_1 from statictext within w_tipo_transmision_central
end type
type lst_branch from my_ddlb within w_tipo_transmision_central
end type
type gb_1 from groupbox within w_tipo_transmision_central
end type
end forward

global type w_tipo_transmision_central from wb_single_tb
integer x = 214
integer y = 221
integer width = 2811
integer height = 1712
sle_branch sle_branch
st_1 st_1
lst_branch lst_branch
gb_1 gb_1
end type
global w_tipo_transmision_central w_tipo_transmision_central

forward prototypes
public subroutine fn_filter ()
end prototypes

public subroutine fn_filter ();String ls_filter, ls_main_branch, ls_branch
dw_1.Retrieve()

if lst_branch.getdataid() <> '--' then

	ls_branch = lst_branch.getdataid()

		
	ls_filter = "id_branch = '"+ls_branch+"'"
else
	ls_filter = ''
end if		
dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end subroutine

on w_tipo_transmision_central.create
int iCurrent
call super::create
this.sle_branch=create sle_branch
this.st_1=create st_1
this.lst_branch=create lst_branch
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_branch
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.lst_branch
this.Control[iCurrent+4]=this.gb_1
end on

on w_tipo_transmision_central.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_branch)
destroy(this.st_1)
destroy(this.lst_branch)
destroy(this.gb_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_tipo_transmision_central
integer y = 164
integer width = 2766
string dataobject = "dw_tipo_transmision_central"
end type

event dw_1::sqlpreview;call super::sqlpreview;string s
s = ''
end event

event dw_1::itemchanged;call super::itemchanged;

String ls_old, ls_new
Int li_old, li_new

// Validates that users have a specific rol to downgrade agencies.
// Downgrade means to change an agency from a transmision that does not requires fax release
// to a transmision that requires fax release
IF Dwo.name = "tipo_transmision" THEN        
	
	ls_old = dw_1.getitemstring(row,"tipo_transmision")
	ls_new = data
	
	select ALLOWS_FAX_RELEASE 
	into :li_old
	from dba.tipo_transmision
	where id_tipo_transmision = :ls_old;

	select ALLOWS_FAX_RELEASE 
	into :li_new
	from dba.tipo_transmision
	where id_tipo_transmision = :ls_new;
	
	IF (li_old = 0) and (li_new = 1) THEN           
		
		// check if the user has the role RED PHONE TRANSMISION DOWNGRADE
		if fn_check_user_role('RPD') <= 0 then 
			Messagebox("Permisos Insuficientes","Error: No tiene permisos suficientes para regresar esta agencia a una version antigua de Telefono Rojo.",StopSign!)
			RETURN 2       
		end if		
				
	END IF
END IF



 
end event

type sle_branch from singlelineedit within w_tipo_transmision_central
integer x = 261
integer y = 44
integer width = 343
integer height = 84
integer taborder = 20
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

type st_1 from statictext within w_tipo_transmision_central
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

type lst_branch from my_ddlb within w_tipo_transmision_central
integer x = 617
integer y = 44
integer width = 1317
integer height = 1448
integer taborder = 30
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

type gb_1 from groupbox within w_tipo_transmision_central
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

