$PBExportHeader$w_acc_parameters.srw
forward
global type w_acc_parameters from window
end type
type cb_unlock from commandbutton within w_acc_parameters
end type
type st_pwd from statictext within w_acc_parameters
end type
type st_3 from statictext within w_acc_parameters
end type
type sle_password from singlelineedit within w_acc_parameters
end type
type cb_date2 from commandbutton within w_acc_parameters
end type
type em_dateblocker_end from u_em within w_acc_parameters
end type
type st_2 from statictext within w_acc_parameters
end type
type cb_cancel from commandbutton within w_acc_parameters
end type
type cb_ok from commandbutton within w_acc_parameters
end type
type cb_date1 from commandbutton within w_acc_parameters
end type
type em_dateblocker from u_em within w_acc_parameters
end type
type st_1 from statictext within w_acc_parameters
end type
type gb_1 from groupbox within w_acc_parameters
end type
end forward

global type w_acc_parameters from window
integer x = 1056
integer y = 484
integer width = 1440
integer height = 1060
boolean titlebar = true
string title = "Accounting Parameters"
boolean controlmenu = true
long backcolor = 80269524
cb_unlock cb_unlock
st_pwd st_pwd
st_3 st_3
sle_password sle_password
cb_date2 cb_date2
em_dateblocker_end em_dateblocker_end
st_2 st_2
cb_cancel cb_cancel
cb_ok cb_ok
cb_date1 cb_date1
em_dateblocker em_dateblocker
st_1 st_1
gb_1 gb_1
end type
global w_acc_parameters w_acc_parameters

event open;datetime ldt_dateblocker, ldt_dateblocker1
long ll_cont

select count(*)
into :ll_cont
from dba.acc_parameters;

if ll_cont < 1 then
	ldt_dateblocker 	= datetime(date('01/01/1901'),time("00:00"))
	ldt_dateblocker1  = datetime(date('01/01/1901'),time("00:00"))
	INSERT INTO dba.ACC_PARAMETERS ( DATE_BLOCKER, DATE_BLOCKER_POST ) VALUES ( :ldt_dateblocker, :ldt_dateblocker1 );
end if

SELECT DATE_BLOCKER, DATE_BLOCKER_POST
INTO :ldt_dateblocker,
	  :ldt_dateblocker1
FROM dba.acc_parameters;

em_dateblocker.text = string(date(ldt_dateblocker))
em_dateblocker_end.text = string(date(ldt_dateblocker1))
end event

on w_acc_parameters.create
this.cb_unlock=create cb_unlock
this.st_pwd=create st_pwd
this.st_3=create st_3
this.sle_password=create sle_password
this.cb_date2=create cb_date2
this.em_dateblocker_end=create em_dateblocker_end
this.st_2=create st_2
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_date1=create cb_date1
this.em_dateblocker=create em_dateblocker
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.cb_unlock,&
this.st_pwd,&
this.st_3,&
this.sle_password,&
this.cb_date2,&
this.em_dateblocker_end,&
this.st_2,&
this.cb_cancel,&
this.cb_ok,&
this.cb_date1,&
this.em_dateblocker,&
this.st_1,&
this.gb_1}
end on

on w_acc_parameters.destroy
destroy(this.cb_unlock)
destroy(this.st_pwd)
destroy(this.st_3)
destroy(this.sle_password)
destroy(this.cb_date2)
destroy(this.em_dateblocker_end)
destroy(this.st_2)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_date1)
destroy(this.em_dateblocker)
destroy(this.st_1)
destroy(this.gb_1)
end on

type cb_unlock from commandbutton within w_acc_parameters
integer x = 987
integer y = 148
integer width = 187
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Unlock"
end type

event clicked;String ls_pwd

select min(BLOCKER_PWD)
into :ls_pwd
from dba.acc_parameters;

if sle_password.text = ls_pwd then
	st_pwd.visible = false
	sle_password.visible = false
	cb_unlock.visible = false	
	
	em_dateblocker.enabled = true
	em_dateblocker_end.enabled = true
	cb_date1.enabled = true
	cb_date2.enabled = true
	sle_password.text = ""
	cb_ok.enabled = true	
else
	MessageBox("Invalid Password","Invalid Password "+gs_login+", Please try again!",StopSign!)
	setfocus(sle_password)
end if
end event

type st_pwd from statictext within w_acc_parameters
integer x = 192
integer y = 152
integer width = 448
integer height = 76
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
string text = "Password :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_acc_parameters
integer x = 201
integer y = 300
integer width = 448
integer height = 76
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
string text = "Date Blocker Begin :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_password from singlelineedit within w_acc_parameters
integer x = 654
integer y = 148
integer width = 325
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
textcase textcase = lower!
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type cb_date2 from commandbutton within w_acc_parameters
integer x = 987
integer y = 408
integer width = 119
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "..."
end type

event clicked;em_dateblocker_end.Event pfc_DDCalendar( )
end event

type em_dateblocker_end from u_em within w_acc_parameters
integer x = 654
integer y = 408
integer width = 325
integer height = 84
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type st_2 from statictext within w_acc_parameters
integer x = 192
integer y = 412
integer width = 448
integer height = 76
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
string text = "Date Blocker End :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_acc_parameters
integer x = 745
integer y = 784
integer width = 558
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_ok from commandbutton within w_acc_parameters
integer x = 137
integer y = 784
integer width = 558
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&OK"
boolean default = true
end type

event clicked;date ld_dateblocker, ld_dateblockerend

ld_dateblocker 	= date(em_dateblocker.text)
ld_dateblockerend	= date(em_dateblocker_end.text)


if ld_dateblocker >= ld_dateblockerend then
	Messagebox('Error','Verify then Information')
	return
end if


//delete from dba.acc_parameters;  
//INSERT INTO dba.ACC_PARAMETERS ( DATE_BLOCKER, DATE_BLOCKER_POST ) VALUES ( :ld_dateblocker, :ld_dateblockerend );
UPDATE dba.ACC_PARAMETERS
SET DATE_BLOCKER = :ld_dateblocker,
DATE_BLOCKER_POST = :ld_dateblockerend;
if sqlca.sqlcode <> 0 then
	messagebox("Error","Error Saving Data.~n["+SQLCA.SQLErrText+"]")	
end if 

commit;

close(parent)
end event

type cb_date1 from commandbutton within w_acc_parameters
integer x = 987
integer y = 296
integer width = 119
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "..."
end type

event clicked;em_dateblocker.Event pfc_DDCalendar( )
end event

type em_dateblocker from u_em within w_acc_parameters
integer x = 654
integer y = 296
integer width = 325
integer height = 84
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type st_1 from statictext within w_acc_parameters
integer x = 192
integer y = 300
integer width = 448
integer height = 76
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
string text = "Date Blocker Begin :"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_acc_parameters
integer x = 37
integer y = 20
integer width = 1353
integer height = 912
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Accounting Parameters"
end type

