$PBExportHeader$w_achpreparation_changeamt.srw
forward
global type w_achpreparation_changeamt from window
end type
type em_amttoberec from editmask within w_achpreparation_changeamt
end type
type em_amount from editmask within w_achpreparation_changeamt
end type
type st_amttoberecnotes from statictext within w_achpreparation_changeamt
end type
type st_amttobe from statictext within w_achpreparation_changeamt
end type
type sle_amttobereconcilednotes from singlelineedit within w_achpreparation_changeamt
end type
type st_amt from statictext within w_achpreparation_changeamt
end type
type st_1 from statictext within w_achpreparation_changeamt
end type
type sle_branch from singlelineedit within w_achpreparation_changeamt
end type
type cb_2 from commandbutton within w_achpreparation_changeamt
end type
type cb_1 from commandbutton within w_achpreparation_changeamt
end type
type gb_1 from groupbox within w_achpreparation_changeamt
end type
end forward

global type w_achpreparation_changeamt from window
integer x = 1189
integer y = 556
integer width = 1833
integer height = 716
boolean titlebar = true
string title = "ACH Preparation - Change Amount"
windowtype windowtype = response!
long backcolor = 80269524
em_amttoberec em_amttoberec
em_amount em_amount
st_amttoberecnotes st_amttoberecnotes
st_amttobe st_amttobe
sle_amttobereconcilednotes sle_amttobereconcilednotes
st_amt st_amt
st_1 st_1
sle_branch sle_branch
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_achpreparation_changeamt w_achpreparation_changeamt

type variables
string is_id_main_branch
end variables

on w_achpreparation_changeamt.create
this.em_amttoberec=create em_amttoberec
this.em_amount=create em_amount
this.st_amttoberecnotes=create st_amttoberecnotes
this.st_amttobe=create st_amttobe
this.sle_amttobereconcilednotes=create sle_amttobereconcilednotes
this.st_amt=create st_amt
this.st_1=create st_1
this.sle_branch=create sle_branch
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.em_amttoberec,&
this.em_amount,&
this.st_amttoberecnotes,&
this.st_amttobe,&
this.sle_amttobereconcilednotes,&
this.st_amt,&
this.st_1,&
this.sle_branch,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_achpreparation_changeamt.destroy
destroy(this.em_amttoberec)
destroy(this.em_amount)
destroy(this.st_amttoberecnotes)
destroy(this.st_amttobe)
destroy(this.sle_amttobereconcilednotes)
destroy(this.st_amt)
destroy(this.st_1)
destroy(this.sle_branch)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;String ls_parameters, ls_name_main_branch, ls_notes
double ld_amttobereconciled, ld_amount

ls_parameters = message.stringparm

is_id_main_branch = fn_token(ls_parameters,"*",1)
ld_amount = double(fn_token(ls_parameters,"*",2))

setnull(ls_name_main_branch)

select name_main_branch,
  fin_amttobereconciled,
  fin_amttobereconcilednotes
into :ls_name_main_branch,
:ld_amttobereconciled,
:ls_notes
from dba.group_branch
where id_main_branch = :is_id_main_branch;

if isnull(ls_name_main_branch) or len(trim(ls_name_main_branch)) < 1 then
	closewithreturn(this,"-none-")
	return
end if

if isnull(ld_amttobereconciled) then ld_amttobereconciled = 0

sle_branch.text = ls_name_main_branch
em_amttoberec.text = string(ld_amttobereconciled)
sle_amttobereconcilednotes.text = ls_notes
em_amount.text = string(ld_amount)

end event

type em_amttoberec from editmask within w_achpreparation_changeamt
integer x = 608
integer y = 268
integer width = 325
integer height = 80
integer taborder = 30
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

type em_amount from editmask within w_achpreparation_changeamt
integer x = 608
integer y = 172
integer width = 325
integer height = 80
integer taborder = 20
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

type st_amttoberecnotes from statictext within w_achpreparation_changeamt
integer x = 82
integer y = 376
integer width = 507
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Amt to be Rec. Notes :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_amttobe from statictext within w_achpreparation_changeamt
integer x = 82
integer y = 280
integer width = 507
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Amt to be Reconciled :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_amttobereconcilednotes from singlelineedit within w_achpreparation_changeamt
integer x = 608
integer y = 364
integer width = 1106
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_amt from statictext within w_achpreparation_changeamt
integer x = 82
integer y = 184
integer width = 507
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Amount :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_achpreparation_changeamt
integer x = 82
integer y = 88
integer width = 507
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Agency :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_branch from singlelineedit within w_achpreparation_changeamt
integer x = 608
integer y = 76
integer width = 1106
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_achpreparation_changeamt
integer x = 1307
integer y = 508
integer width = 466
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancel"
end type

event clicked;closewithreturn(parent,"-none-")
end event

type cb_1 from commandbutton within w_achpreparation_changeamt
integer x = 823
integer y = 508
integer width = 466
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ok"
boolean default = true
end type

event clicked;Double ld_amttobereconciled
String ls_notes

// -----------------------------------------------------
// Update Amt to be reconciled

ld_amttobereconciled = double(em_amttoberec.text)
ls_notes = mid(sle_amttobereconcilednotes.text,1,250)

update dba.group_branch
set fin_amttobereconciled = :ld_amttobereconciled,
fin_amttobereconcilednotes = :ls_notes
where id_main_branch = :is_id_main_branch;

// -----------------------------------------------------

closewithreturn(parent,em_amount.text)
end event

type gb_1 from groupbox within w_achpreparation_changeamt
integer x = 46
integer y = 8
integer width = 1733
integer height = 480
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

