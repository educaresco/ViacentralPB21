$PBExportHeader$w_rep_monthly_compliance.srw
forward
global type w_rep_monthly_compliance from w_sheet
end type
type gb_2 from groupbox within w_rep_monthly_compliance
end type
type cb_1 from u_cb within w_rep_monthly_compliance
end type
type lb_progress from listbox within w_rep_monthly_compliance
end type
type cb_generate from commandbutton within w_rep_monthly_compliance
end type
type em_date1 from u_em within w_rep_monthly_compliance
end type
type cb_2 from commandbutton within w_rep_monthly_compliance
end type
type em_date2 from u_em within w_rep_monthly_compliance
end type
type cb_3 from commandbutton within w_rep_monthly_compliance
end type
type st_1 from statictext within w_rep_monthly_compliance
end type
type st_2 from statictext within w_rep_monthly_compliance
end type
end forward

global type w_rep_monthly_compliance from w_sheet
integer x = 214
integer y = 221
integer width = 1440
integer height = 952
string title = "Monthly Compliance Reports"
boolean maxbox = false
boolean resizable = false
long backcolor = 80269524
gb_2 gb_2
cb_1 cb_1
lb_progress lb_progress
cb_generate cb_generate
em_date1 em_date1
cb_2 cb_2
em_date2 em_date2
cb_3 cb_3
st_1 st_1
st_2 st_2
end type
global w_rep_monthly_compliance w_rep_monthly_compliance

type variables

end variables

on w_rep_monthly_compliance.create
int iCurrent
call super::create
this.gb_2=create gb_2
this.cb_1=create cb_1
this.lb_progress=create lb_progress
this.cb_generate=create cb_generate
this.em_date1=create em_date1
this.cb_2=create cb_2
this.em_date2=create em_date2
this.cb_3=create cb_3
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.lb_progress
this.Control[iCurrent+4]=this.cb_generate
this.Control[iCurrent+5]=this.em_date1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.em_date2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.st_2
end on

on w_rep_monthly_compliance.destroy
call super::destroy
destroy(this.gb_2)
destroy(this.cb_1)
destroy(this.lb_progress)
destroy(this.cb_generate)
destroy(this.em_date1)
destroy(this.cb_2)
destroy(this.em_date2)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.st_2)
end on

event open;call super::open;em_date1.text = string(today())
em_date2.text = string(today())

end event

type gb_2 from groupbox within w_rep_monthly_compliance
integer x = 41
integer y = 28
integer width = 1326
integer height = 196
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Range"
end type

type cb_1 from u_cb within w_rep_monthly_compliance
integer x = 1033
integer y = 712
integer width = 334
integer height = 84
integer taborder = 80
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type lb_progress from listbox within w_rep_monthly_compliance
integer x = 41
integer y = 240
integer width = 1326
integer height = 452
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type cb_generate from commandbutton within w_rep_monthly_compliance
integer x = 686
integer y = 712
integer width = 334
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Generate"
boolean default = true
end type

event clicked;string ls_sql

SetPointer(Arrow!)
lb_progress.reset()

// ---------------------------------------------------------------------------
// Level A
// Monthly Acum between 1500-3000 (Colombia and Dom Rep)

ls_sql = "" + &
"select rtrim(dba.sender.id_branch)+','+" + &
"       convert(varchar,dba.sender.id_sender)+','+" + &
"		  rtrim(name_sender)+','+" + &
"       convert(varchar,sum(total_receiver)) " + &
"from dba.receiver, dba.sender, dba.country " + &
"where dba.sender.id_branch = dba.receiver.id_branch " + &
"and dba.sender.id_sender = dba.receiver.id_sender " + &
"and dba.receiver.id_country_receiver = dba.country.id_country " + &
"and dba.receiver.id_flag_receiver not in ('A','C') " + &
"and date_receiver between '"+em_date1.text+" 00:00:00' and '"+em_date2.text+" 23:59:59' " + &
"and total_receiver < 1000 " + &
"and dba.receiver.id_country_receiver in ('COL','RD','COG') " + &
"group by dba.sender.id_branch,dba.sender.id_sender, name_sender " + &
"having count(*) > 1 and sum(total_receiver) >= 1500 and sum(total_receiver) < 3000 " + &
";"

lb_progress.additem("Generating Level A...")
fn_querytofile(ls_sql,"C:\ViamericasMT\LevelA.csv","Branch,Sender Id,Sender Name,Total Amount")

// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Level B
// Single Trans between 2000-3000 (Not for Colombia and Dom Rep)

ls_sql = "" + &
"select rtrim(dba.sender.id_branch)+','+ " + &
"       convert(varchar,dba.sender.id_sender)+','+" + &
"		  rtrim(name_sender)+','+, " + &
"       convert(varchar,total_receiver)" + &
"from dba.receiver, dba.sender, dba.country " + &
"where dba.sender.id_branch = dba.receiver.id_branch " + &
"and dba.sender.id_sender = dba.receiver.id_sender " + &
"and dba.receiver.id_country_receiver = dba.country.id_country " + &
"and dba.receiver.id_flag_receiver not in ('A','C') " + &
"and date_receiver between '"+em_date1.text+" 00:00:00' and '"+em_date2.text+" 23:59:59' " + &
"and dba.receiver.total_receiver >= 2000  " + &
"and dba.receiver.total_receiver < 3000 " + &
"and dba.receiver.id_country_receiver not in ('COL','RD','COG');"

lb_progress.additem("Generating Level B...")
fn_querytofile(ls_sql,"C:\ViamericasMT\LevelB.csv","Branch,Sender Id,Sender Name,Total Amount")

// ---------------------------------------------------------------------------



lb_progress.additem("Process Completed!")
SetPointer(HourGlass!)
end event

type em_date1 from u_em within w_rep_monthly_compliance
integer x = 279
integer y = 100
integer width = 306
integer height = 84
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type cb_2 from commandbutton within w_rep_monthly_compliance
integer x = 594
integer y = 100
integer width = 91
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;em_date1.Event pfc_DDCalendar()
end event

type em_date2 from u_em within w_rep_monthly_compliance
integer x = 846
integer y = 100
integer width = 306
integer height = 84
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type cb_3 from commandbutton within w_rep_monthly_compliance
integer x = 1161
integer y = 100
integer width = 91
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;em_date2.Event pfc_DDCalendar()
end event

type st_1 from statictext within w_rep_monthly_compliance
integer x = 137
integer y = 104
integer width = 133
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_rep_monthly_compliance
integer x = 745
integer y = 104
integer width = 91
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

