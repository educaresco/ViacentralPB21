$PBExportHeader$w_closingfax.srw
forward
global type w_closingfax from w_sheet
end type
type cbx_oldlayout from checkbox within w_closingfax
end type
type em_idbranch from editmask within w_closingfax
end type
type st_1 from statictext within w_closingfax
end type
type gb_1 from groupbox within w_closingfax
end type
type em_date1 from u_em within w_closingfax
end type
type em_date2 from u_em within w_closingfax
end type
type st_2 from statictext within w_closingfax
end type
type st_3 from statictext within w_closingfax
end type
type rb_fax from radiobutton within w_closingfax
end type
type rb_email from radiobutton within w_closingfax
end type
type st_4 from statictext within w_closingfax
end type
type cb_generate from commandbutton within w_closingfax
end type
type cb_cancel from commandbutton within w_closingfax
end type
type cb_2 from commandbutton within w_closingfax
end type
type cb_3 from commandbutton within w_closingfax
end type
type cb_preview from commandbutton within w_closingfax
end type
type st_namebranch from statictext within w_closingfax
end type
type rb_semail from radiobutton within w_closingfax
end type
type em_email from editmask within w_closingfax
end type
type cb_generatereport from commandbutton within w_closingfax
end type
type cb_send from commandbutton within w_closingfax
end type
type rb_printer from radiobutton within w_closingfax
end type
type cb_generarmultiples from commandbutton within w_closingfax
end type
type dw_account_statement from datawindow within w_closingfax
end type
type dw_report from datawindow within w_closingfax
end type
end forward

global type w_closingfax from w_sheet
integer x = 214
integer y = 221
integer width = 3845
integer height = 2584
long backcolor = 80269524
cbx_oldlayout cbx_oldlayout
em_idbranch em_idbranch
st_1 st_1
gb_1 gb_1
em_date1 em_date1
em_date2 em_date2
st_2 st_2
st_3 st_3
rb_fax rb_fax
rb_email rb_email
st_4 st_4
cb_generate cb_generate
cb_cancel cb_cancel
cb_2 cb_2
cb_3 cb_3
cb_preview cb_preview
st_namebranch st_namebranch
rb_semail rb_semail
em_email em_email
cb_generatereport cb_generatereport
cb_send cb_send
rb_printer rb_printer
cb_generarmultiples cb_generarmultiples
dw_account_statement dw_account_statement
dw_report dw_report
end type
global w_closingfax w_closingfax

type variables
integer ii_MaxRangeDaysClosingFax
end variables

forward prototypes
public subroutine fn_generate_report ()
public function boolean fn_validate_dates ()
end prototypes

public subroutine fn_generate_report ();long ll_cont
string ls_idbranch


dw_account_statement.Reset()

ls_idbranch = em_idbranch.text

SELECT count(*)
INTO :ll_cont
FROM dba.BRANCH  
WHERE dba.BRANCH.ID_BRANCH = :ls_idbranch   ;

if ll_cont < 1 then
	MessageBox("Branch Not Found","Branch Not Found, Check the Branch Id",StopSign!)
	return
end if

IF NOT fn_validate_dates() THEN
	Return
END IF

ls_idbranch = fn_getgrouptop(ls_idbranch)

//if cbx_oldlayout.checked then

	//fn_generateclosingdynamic(ls_idbranch,date(em_date1.text),date(em_date2.text))	
//	fn_generateclosingdynamic_v3(ls_idbranch,date(em_date1.text),date(em_date2.text))	
//	dw_report.retrieve(ls_idbranch,"")

//else
	
	dw_account_statement.retrieve(ls_idbranch,datetime(date(em_date1.text),time("00:00:00")),datetime(date(em_date2.text),time("23:59:59")),"")
	
//end if
end subroutine

public function boolean fn_validate_dates ();date ld_fecha_inicio, ld_fecha_fin
integer li_datediff

ld_fecha_inicio = date(em_date1.text)
ld_fecha_fin = date(em_date2.text)

li_datediff = DaysAfter(ld_fecha_inicio, ld_fecha_fin)

IF li_datediff < 0 THEN
	messagebox("Error", "Date From cannot be greater than Date To.")
	return false
END IF

IF li_datediff > ii_MaxRangeDaysClosingFax THEN
	messagebox("Error", "Days between Range Dates cannot be greater than " + string(ii_MaxRangeDaysClosingFax) + " days")
	return false
END IF 

return true
end function

on w_closingfax.create
int iCurrent
call super::create
this.cbx_oldlayout=create cbx_oldlayout
this.em_idbranch=create em_idbranch
this.st_1=create st_1
this.gb_1=create gb_1
this.em_date1=create em_date1
this.em_date2=create em_date2
this.st_2=create st_2
this.st_3=create st_3
this.rb_fax=create rb_fax
this.rb_email=create rb_email
this.st_4=create st_4
this.cb_generate=create cb_generate
this.cb_cancel=create cb_cancel
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_preview=create cb_preview
this.st_namebranch=create st_namebranch
this.rb_semail=create rb_semail
this.em_email=create em_email
this.cb_generatereport=create cb_generatereport
this.cb_send=create cb_send
this.rb_printer=create rb_printer
this.cb_generarmultiples=create cb_generarmultiples
this.dw_account_statement=create dw_account_statement
this.dw_report=create dw_report
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_oldlayout
this.Control[iCurrent+2]=this.em_idbranch
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.em_date1
this.Control[iCurrent+6]=this.em_date2
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.rb_fax
this.Control[iCurrent+10]=this.rb_email
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.cb_generate
this.Control[iCurrent+13]=this.cb_cancel
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_preview
this.Control[iCurrent+17]=this.st_namebranch
this.Control[iCurrent+18]=this.rb_semail
this.Control[iCurrent+19]=this.em_email
this.Control[iCurrent+20]=this.cb_generatereport
this.Control[iCurrent+21]=this.cb_send
this.Control[iCurrent+22]=this.rb_printer
this.Control[iCurrent+23]=this.cb_generarmultiples
this.Control[iCurrent+24]=this.dw_account_statement
this.Control[iCurrent+25]=this.dw_report
end on

on w_closingfax.destroy
call super::destroy
destroy(this.cbx_oldlayout)
destroy(this.em_idbranch)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.em_date1)
destroy(this.em_date2)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_fax)
destroy(this.rb_email)
destroy(this.st_4)
destroy(this.cb_generate)
destroy(this.cb_cancel)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_preview)
destroy(this.st_namebranch)
destroy(this.rb_semail)
destroy(this.em_email)
destroy(this.cb_generatereport)
destroy(this.cb_send)
destroy(this.rb_printer)
destroy(this.cb_generarmultiples)
destroy(this.dw_account_statement)
destroy(this.dw_report)
end on

event open;call super::open;string ls_branchId

st_namebranch.text = ""
em_date1.text = string(today())
em_date2.text = string(today())
em_email.enabled = rb_semail.checked

ls_branchId = Message.StringParm

SELECT numericvalue
INTO :ii_MaxRangeDaysClosingFax
FROM dba.PARAMETERS
WHERE idparameter = "MaxRanDaysClosingFax";

IF len(ls_branchId) > 0 THEN
	em_idbranch.text = ls_branchId
	fn_generate_report()
END IF

end event

event resize;call super::resize;dw_report.width = newwidth - (4005 - 3950)
dw_report.height = newheight - (400)

dw_account_statement.width = newwidth - (4005 - 3950)
dw_account_statement.height = newheight - (400)
end event

type cbx_oldlayout from checkbox within w_closingfax
boolean visible = false
integer x = 599
integer y = 8
integer width = 384
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Old Layout"
boolean checked = true
end type

event clicked;dw_account_statement.visible = not this.checked
dw_report.visible = this.checked
end event

type em_idbranch from editmask within w_closingfax
integer x = 421
integer y = 116
integer width = 306
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event losefocus;string ls_idbranch, ls_branchname

ls_idbranch = em_idbranch.text

  SELECT dba.BRANCH.NAME_BRANCH  
    INTO :ls_branchname  
    FROM dba.BRANCH  
   WHERE dba.BRANCH.ID_BRANCH = :ls_idbranch   ;

if not isnull(ls_branchname) and len(ls_branchname) > 0 then
	st_namebranch.text = ls_branchname
else
	st_namebranch.text = ""
end if
end event

type st_1 from statictext within w_closingfax
integer x = 78
integer y = 116
integer width = 306
integer height = 84
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
string text = "Id Branch :"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_closingfax
integer x = 32
integer y = 12
integer width = 3712
integer height = 324
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Resend Fax/E-Mail"
end type

type em_date1 from u_em within w_closingfax
integer x = 1070
integer y = 116
integer width = 297
integer height = 84
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)


end event

event modified;call super::modified;fn_validate_dates()
end event

type em_date2 from u_em within w_closingfax
integer x = 1070
integer y = 204
integer width = 297
integer height = 84
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

event modified;call super::modified;fn_validate_dates()
end event

type st_2 from statictext within w_closingfax
integer x = 910
integer y = 116
integer width = 146
integer height = 84
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
string text = "From :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_closingfax
integer x = 910
integer y = 204
integer width = 146
integer height = 84
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
string text = "To :"
boolean focusrectangle = false
end type

type rb_fax from radiobutton within w_closingfax
integer x = 2537
integer y = 120
integer width = 654
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agent Fax"
end type

event clicked;em_email.enabled = rb_semail.checked
em_email.text = ''
cb_generate.enabled=true
end event

type rb_email from radiobutton within w_closingfax
integer x = 2066
integer y = 176
integer width = 466
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agent E-Mail"
end type

event clicked;em_email.enabled = rb_semail.checked

if this.checked then
	
	String ls_email, ls_grupo, ls_idbranch
	
	ls_idbranch = em_idbranch.text
	
	SELECT dba.BRANCH.ID_MAIN_BRANCH
	INTO :LS_GRUPO
	FROM dba.BRANCH  
	WHERE dba.BRANCH.ID_BRANCH = :ls_idbranch   ;	
	
	SELECT dba.GROUP_BRANCH.EMAIL_GROUP  
	INTO :ls_email  
	FROM dba.GROUP_BRANCH  
	WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :LS_GRUPO   ;
	
	ls_email = trim(ls_email)

	if (isnull(ls_email) or len(ls_email) < 1) then
		messagebox("No EMail Specified","You have to specified an EMail for the Agency's Group",StopSign!)
		cb_generate.enabled=false
		em_email.text = ''
	else
		em_email.text = ls_email		
		cb_generate.enabled=true
	end if
	
end if
end event

type st_4 from statictext within w_closingfax
integer x = 2066
integer y = 52
integer width = 306
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Send To :"
boolean focusrectangle = false
end type

type cb_generate from commandbutton within w_closingfax
boolean visible = false
integer x = 3145
integer y = 996
integer width = 1138
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Generate (Old - FaxMaker-HTML)"
boolean default = true
end type

event clicked;
long ll_cont
string ls_idbranch

ls_idbranch = em_idbranch.text

SELECT count(*)
INTO :ll_cont
FROM dba.BRANCH  
WHERE dba.BRANCH.ID_BRANCH = :ls_idbranch   ;

if ll_cont < 1 then
	MessageBox("Branch Not Found","Branch Not Found, Check the Branch Id",StopSign!)
	return
end if

if rb_fax.checked then
	
	if not fileexists("V:\") then
		fn_mapnetworkdrive("V","\\"+fn_busparameter("FAXSERVER")+"\SendFaxFile")
	end if
	
	if not fileexists("V:\") then
		messagebox("Error","The fax' folder cannot be mapped.~nPlease map the network drive manually.",StopSign!)
		return	
	end if
	
	fn_generateclosinghtml(ls_idbranch,date(em_date1.text),date(em_date2.text),"V:\",'F')
	messagebox("Complete","The Fax was generated sucessfuly",Information!)
	
elseif rb_email.checked then
	fn_generateclosinghtml(ls_idbranch,date(em_date1.text),date(em_date2.text),"C:\VIAMERICASMT\",'E')
elseif rb_semail.checked then

	string ls_semail
	ls_semail = trim(em_email.text)

	if isnull(ls_semail) or len(ls_semail) < 1 then
		MessageBox("Not EMail","You must fill the E-Mail field",StopSign!)
		setfocus(em_email)
		return
	else
		fn_generateclosinghtml(ls_idbranch,date(em_date1.text),date(em_date2.text),"C:\VIAMERICASMT\",'C:'+ls_semail)			
	end if

end if


end event

type cb_cancel from commandbutton within w_closingfax
integer x = 3237
integer y = 208
integer width = 443
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_2 from commandbutton within w_closingfax
integer x = 1376
integer y = 116
integer width = 91
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;em_date1.Event pfc_DDCalendar()
end event

type cb_3 from commandbutton within w_closingfax
integer x = 1376
integer y = 204
integer width = 91
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;em_date2.Event pfc_DDCalendar()
end event

type cb_preview from commandbutton within w_closingfax
boolean visible = false
integer x = 169
integer y = 892
integer width = 1138
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Preview"
end type

event clicked;
long ll_cont
string ls_idbranch

ls_idbranch = em_idbranch.text

SELECT count(*)
INTO :ll_cont
FROM dba.BRANCH  
WHERE dba.BRANCH.ID_BRANCH = :ls_idbranch   ;

if ll_cont < 1 then
	MessageBox("Branch Not Found","Branch Not Found, Check the Branch Id",StopSign!)
	return
end if

if rb_fax.checked then
	
	if not fileexists("V:\") then
		fn_mapnetworkdrive("V","\\"+fn_busparameter("FAXSERVER")+"\SendFaxFile")
	end if
	
	if not fileexists("V:\") then
		messagebox("Error","The fax' folder cannot be mapped.~nPlease map the network drive manually.",StopSign!)
		return	
	end if
	
	fn_generateclosinghtml(ls_idbranch,date(em_date1.text),date(em_date2.text),"V:\",'F')
	messagebox("Complete","The Fax was generated sucessfuly",Information!)
	
elseif rb_email.checked then
	fn_generateclosinghtml(ls_idbranch,date(em_date1.text),date(em_date2.text),"C:\",'E')
end if


end event

type st_namebranch from statictext within w_closingfax
integer x = 78
integer y = 224
integer width = 786
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Name Branch"
boolean focusrectangle = false
end type

type rb_semail from radiobutton within w_closingfax
integer x = 2066
integer y = 232
integer width = 466
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Custom E-Mail"
end type

event clicked;em_email.enabled = rb_semail.checked
cb_generate.enabled=true
end event

type em_email from editmask within w_closingfax
integer x = 2537
integer y = 188
integer width = 649
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
end type

type cb_generatereport from commandbutton within w_closingfax
integer x = 1490
integer y = 112
integer width = 517
integer height = 180
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Generate/Preview"
boolean default = true
end type

event clicked;
fn_generate_report()
end event

type cb_send from commandbutton within w_closingfax
integer x = 3237
integer y = 108
integer width = 443
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Send"
end type

event clicked;long ll_cont
string ls_idbranch

ls_idbranch = em_idbranch.text

ls_idbranch = fn_getgrouptop(ls_idbranch)

SELECT count(*)
INTO :ll_cont
FROM dba.BRANCH  
WHERE dba.BRANCH.ID_BRANCH = :ls_idbranch;

if ll_cont < 1 then
	MessageBox("Branch Not Found","Branch Not Found, Check the Branch Id",StopSign!)
	return
end if

//fn_generateclosingdynamic_v3(ls_idbranch,date(em_date1.text),date(em_date2.text))	
STRING ls_grupo, ls_email, ls_fax_branch, ls_currentprinter, ls_activefax, ls_sendto

SELECT dba.BRANCH.ID_MAIN_BRANCH, dba.BRANCH.FAX_BRANCH
INTO :LS_GRUPO, :ls_fax_branch
FROM dba.BRANCH  
WHERE dba.BRANCH.ID_BRANCH = :ls_idbranch;

ls_activefax = ""

ls_fax_branch = fn_getbranchfax(ls_idbranch)

//if mid(ls_fax_branch,1,3) <> '301' then
//	ls_fax_branch = '1'+trim(ls_fax_branch)
//end if
ls_email = trim(em_email.text)

if not rb_printer.checked then
	// Guarda la impresora que esta por default
	ls_currentprinter = fn_printer('ActiveFax')
	if rb_fax.checked then			
		//Para Pruebas //ls_fax_branch = '3016340060'		
		ls_activefax = "@F201 "+ls_idbranch+"@@F211 "+ls_fax_branch+"@@F307 Daily Invoice@"	
		ls_sendto = " fax "+ls_fax_branch
	elseif rb_email.checked or rb_semail.checked then
	
		if isnull(ls_email) or len(ls_email) < 1 then
			MessageBox("Not EMail","You must specify and E-Mail for the agency or use the custom E-Mail option",StopSign!)
			setfocus(em_email)
			return
		end if
		ls_activefax = "@F201 "+ls_idbranch+"@@F212 "+ls_email+"@@F307 Daily Invoice@"
		ls_sendto = " E-Mail "+ls_email
	end if	
	
	If Messagebox("Confirmation","Do you really want to send the DAILY INVOICE for "+trim(ls_idbranch)+" to the"+ls_sendto+"?",Question!,YesNo!) <> 1 Then
		return
	end if
	
end if



//if cbx_oldlayout.checked then
//
//	fn_generateclosingdynamic_v3(ls_idbranch,date(em_date1.text),date(em_date2.text))	
//	dw_report.retrieve(ls_idbranch,ls_activefax)
//	dw_report.print()
//	
//else
	
	dw_account_statement.retrieve(ls_idbranch,datetime(date(em_date1.text),time("00:00:00")),datetime(date(em_date2.text),time("23:59:59")),ls_activefax)
	dw_account_statement.print()

//end if


//dw_report.retrieve(ls_idbranch,ls_activefax)


// Retorna la impresora que estaba por default
if not rb_printer.checked then
	ls_currentprinter = fn_printer(ls_currentprinter)
end if
end event

type rb_printer from radiobutton within w_closingfax
integer x = 2066
integer y = 120
integer width = 466
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Printer (Default)"
boolean checked = true
end type

event clicked;em_email.enabled = rb_semail.checked
em_email.text = ''
cb_generate.enabled=true
end event

type cb_generarmultiples from commandbutton within w_closingfax
boolean visible = false
integer x = 37
integer y = 2296
integer width = 1211
integer height = 124
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "GenerarMultiples"
end type

event clicked;




date ld_date1

ld_date1 = date('12-01-2005')

do while ld_date1 < date('11-10-2007' )


	fn_generateclosingdynamic_v2('A01198',ld_date1,RelativeDate(ld_date1,1))	
	dw_report.retrieve('A01198',"")

	dw_report.SaveAs ("C:\Reports\A01198_"+String(ld_date1,"yyyymmdd")+".pdf", PDF!, false)

	ld_date1 = RelativeDate(ld_date1,1)

loop
end event

type dw_account_statement from datawindow within w_closingfax
integer x = 32
integer y = 352
integer width = 3703
integer height = 2084
integer taborder = 80
string title = "none"
string dataobject = "dw_account_statement"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(SQLCArpt)
end event

type dw_report from datawindow within w_closingfax
integer x = 32
integer y = 356
integer width = 3712
integer height = 2084
string dataobject = "dw_daily_invoice_v2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCArpt)
end event

