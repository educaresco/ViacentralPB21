$PBExportHeader$w_ofac_check.srw
forward
global type w_ofac_check from pfc_w_sheet
end type
type cb_save from commandbutton within w_ofac_check
end type
type dw_1 from datawindow within w_ofac_check
end type
type cb_2 from commandbutton within w_ofac_check
end type
type cb_1 from commandbutton within w_ofac_check
end type
type st_3 from statictext within w_ofac_check
end type
type st_1 from statictext within w_ofac_check
end type
type sle_slname from singlelineedit within w_ofac_check
end type
type sle_lname from singlelineedit within w_ofac_check
end type
type sle_mname from singlelineedit within w_ofac_check
end type
type sle_fname from singlelineedit within w_ofac_check
end type
type gb_1 from groupbox within w_ofac_check
end type
end forward

global type w_ofac_check from pfc_w_sheet
integer x = 214
integer y = 221
integer width = 3685
integer height = 2256
string title = "Ofac Check"
string menuname = "mb_report"
boolean resizable = false
cb_save cb_save
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
st_3 st_3
st_1 st_1
sle_slname sle_slname
sle_lname sle_lname
sle_mname sle_mname
sle_fname sle_fname
gb_1 gb_1
end type
global w_ofac_check w_ofac_check

type variables
 double  id_max_check_number
end variables

forward prototypes
public subroutine fn_cleansearch ()
end prototypes

public subroutine fn_cleansearch ();
cb_save.enabled = false


dw_1.reset()
end subroutine

on w_ofac_check.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.cb_save=create cb_save
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_3=create st_3
this.st_1=create st_1
this.sle_slname=create sle_slname
this.sle_lname=create sle_lname
this.sle_mname=create sle_mname
this.sle_fname=create sle_fname
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_save
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.sle_slname
this.Control[iCurrent+8]=this.sle_lname
this.Control[iCurrent+9]=this.sle_mname
this.Control[iCurrent+10]=this.sle_fname
this.Control[iCurrent+11]=this.gb_1
end on

on w_ofac_check.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_save)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.sle_slname)
destroy(this.sle_lname)
destroy(this.sle_mname)
destroy(this.sle_fname)
destroy(this.gb_1)
end on

event open;call super::open;dw_1.settransobject(sqlca)
cb_save.enabled = false




end event

event pfc_print;call super::pfc_print;dw_1.update()

If Messagebox("Question","Do you want to print Now ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()

dw_1.print()

return 0
end event

type cb_save from commandbutton within w_ofac_check
integer x = 1211
integer y = 332
integer width = 640
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print Report"
end type

event clicked;dw_1.update()
 
 Printsetup()

dw_1.print()
end event

type dw_1 from datawindow within w_ofac_check
integer x = 32
integer y = 476
integer width = 3607
integer height = 1588
integer taborder = 50
string dataobject = "dw_ofac_results"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_ofac_check
integer x = 1865
integer y = 332
integer width = 640
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close (parent)
end event

type cb_1 from commandbutton within w_ofac_check
integer x = 558
integer y = 332
integer width = 640
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Check Ofac"
end type

event clicked;string ls_fname, ls_mname, ls_lname, ls_slname, ls_fullname, ls_ofac_version
double  ld_nment_num

ls_fname = sle_fname.text
ls_mname = sle_mname.text
ls_lname = sle_lname.text
ls_slname = sle_slname.text

ls_fullname = ls_fname+ ' ' + ls_mname + ' ' + ls_lname + ' ' + ls_slname
ls_fullname = fn_replace(ls_fullname,'  ',' ')
ls_fullname = trim(ls_fullname)

SELECT isnull(max(check_number),0)+1, dba.sfGetOfacListUpdateInfo()
INTO :id_max_check_number, :ls_ofac_version
FROM dba.ofac_hit_check;

//IF ISNULL(id_max_check_number) OR id_max_check_number = 0  THEN id_max_check_number = 0
//
//id_max_check_number = id_max_check_number + 1


DECLARE sp_ofac_check PROCEDURE FOR dba.spCalOfacMatches @ls_id_branch = '1', 
                                    @ld_id_receiver = :id_max_check_number, 
							 @ld_id_sender = 1,
							 @ps_type = 'P',
							 @ps_fname = :ls_fname,
							 @ps_mname = :ls_mname,
							 @ps_lname = :ls_lname,
							 @ps_slname = :ls_slname ;
							 
	execute sp_ofac_check;

//	if SQLCA.SQLCode <> 0 then		
//		Messagebox("Error","Error calling OFAC Check procedure.~n"+SQLCA.SQLErrText + ' ' + string(SQLCA.SQLCode))		
//	end if

			
	dw_1.retrieve(id_max_check_number, ls_fullname, ls_ofac_version)
	
//	if dw_1.rowcount() > 0 then
		
cb_save.enabled = true
				
//	end if	
	






end event

type st_3 from statictext within w_ofac_check
integer x = 192
integer y = 212
integer width = 338
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last Names:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ofac_check
integer x = 192
integer y = 116
integer width = 338
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Names:"
boolean focusrectangle = false
end type

type sle_slname from singlelineedit within w_ofac_check
integer x = 1211
integer y = 204
integer width = 640
integer height = 84
integer taborder = 40
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

event modified;fn_cleansearch()
end event

type sle_lname from singlelineedit within w_ofac_check
integer x = 558
integer y = 204
integer width = 640
integer height = 84
integer taborder = 30
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

event modified;fn_cleansearch()
end event

type sle_mname from singlelineedit within w_ofac_check
integer x = 1211
integer y = 108
integer width = 640
integer height = 84
integer taborder = 20
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

event modified;fn_cleansearch()
end event

type sle_fname from singlelineedit within w_ofac_check
integer x = 558
integer y = 108
integer width = 640
integer height = 84
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

event modified;fn_cleansearch()
end event

type gb_1 from groupbox within w_ofac_check
integer x = 32
integer width = 3607
integer height = 460
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

