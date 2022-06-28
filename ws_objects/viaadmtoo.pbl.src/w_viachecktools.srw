$PBExportHeader$w_viachecktools.srw
forward
global type w_viachecktools from w_sheet
end type
type em_newstatus from editmask within w_viachecktools
end type
type mle_sql from multilineedit within w_viachecktools
end type
type cb_3 from commandbutton within w_viachecktools
end type
type cb_2 from commandbutton within w_viachecktools
end type
type st_3 from statictext within w_viachecktools
end type
type sle_checkidvcp from editmask within w_viachecktools
end type
type sle_checkid from editmask within w_viachecktools
end type
type dw_1 from datawindow within w_viachecktools
end type
type cb_1 from commandbutton within w_viachecktools
end type
type st_2 from statictext within w_viachecktools
end type
type st_1 from statictext within w_viachecktools
end type
type rb_resend from radiobutton within w_viachecktools
end type
type rb_endorsment from radiobutton within w_viachecktools
end type
type rb_status from radiobutton within w_viachecktools
end type
type rb_void from radiobutton within w_viachecktools
end type
type gb_1 from groupbox within w_viachecktools
end type
type gb_2 from groupbox within w_viachecktools
end type
end forward

global type w_viachecktools from w_sheet
integer width = 2715
integer height = 2532
string title = "ViaCheck Tools"
em_newstatus em_newstatus
mle_sql mle_sql
cb_3 cb_3
cb_2 cb_2
st_3 st_3
sle_checkidvcp sle_checkidvcp
sle_checkid sle_checkid
dw_1 dw_1
cb_1 cb_1
st_2 st_2
st_1 st_1
rb_resend rb_resend
rb_endorsment rb_endorsment
rb_status rb_status
rb_void rb_void
gb_1 gb_1
gb_2 gb_2
end type
global w_viachecktools w_viachecktools

type variables
n_tr		SQLVIACHECKS
String		is_sql1, is_sql2
end variables

on w_viachecktools.create
int iCurrent
call super::create
this.em_newstatus=create em_newstatus
this.mle_sql=create mle_sql
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_3=create st_3
this.sle_checkidvcp=create sle_checkidvcp
this.sle_checkid=create sle_checkid
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.rb_resend=create rb_resend
this.rb_endorsment=create rb_endorsment
this.rb_status=create rb_status
this.rb_void=create rb_void
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_newstatus
this.Control[iCurrent+2]=this.mle_sql
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.sle_checkidvcp
this.Control[iCurrent+7]=this.sle_checkid
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.rb_resend
this.Control[iCurrent+13]=this.rb_endorsment
this.Control[iCurrent+14]=this.rb_status
this.Control[iCurrent+15]=this.rb_void
this.Control[iCurrent+16]=this.gb_1
this.Control[iCurrent+17]=this.gb_2
end on

on w_viachecktools.destroy
call super::destroy
destroy(this.em_newstatus)
destroy(this.mle_sql)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.sle_checkidvcp)
destroy(this.sle_checkid)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_resend)
destroy(this.rb_endorsment)
destroy(this.rb_status)
destroy(this.rb_void)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;/*****csarmiento*******/
/***** mod: Oct/15/2013 
		get the database connection string from a file for Viachecks
**/
String  ls_servername, ls_id, ls_password, ls_db


ls_servername=ProfileString('ViaCentral.ini','VIACHECKS','ServerName','')
ls_id=ProfileString('ViaCentral.ini','VIACHECKS','LogId','')
ls_password=ProfileString('ViaCentral.ini','VIACHECKS','LogPass','')
ls_db=ProfileString('ViaCentral.ini','VIACHECKS','Database','')

/*****************/

// :::::::::::::::::::::::::::::::::::::::::
// LOGIN DB CONNECTION
n_tr		SQLVIACHECKS
SQLVIACHECKS 				= Create n_tr
SQLVIACHECKS.DBMS = "SNC SQL Native Client(OLE DB)"
SQLVIACHECKS.DBParm = "Database='"+ls_servername+"',TrimSpaces=1"
SQLVIACHECKS.LogPass 	=ls_password//  'r3mot3#@'
SQLVIACHECKS.ServerName = ls_servername //'192.168.11.100'
SQLVIACHECKS.LogId 		= ls_id  //'vcviacentral'
SQLVIACHECKS.AutoCommit = True
// :::::::::::::::::::::::::::::::::::::::::		


if SQLVIACHECKS.of_connect() <> 0 then
	MessageBox("Cannot Connect", "Cannot Connect to ViaChecks Database~n~r" + SQLVIACHECKS.sqlerrtext,stopsign!)
	return	
end if


dw_1.SetTransObject(SQLVIACHECKS)

end event

type em_newstatus from editmask within w_viachecktools
integer x = 754
integer y = 180
integer width = 155
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##"
end type

type mle_sql from multilineedit within w_viachecktools
integer x = 105
integer y = 1820
integer width = 2464
integer height = 252
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_viachecktools
integer x = 2030
integer y = 2260
integer width = 539
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_2 from commandbutton within w_viachecktools
integer x = 2030
integer y = 2096
integer width = 539
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Process"
end type

event clicked;



if is_sql1 <> '' then
		
	EXECUTE IMMEDIATE :is_sql1 USING SQLVIACHECKS;
	
	if SQLVIACHECKS.SQLCode <> 0 then	
		Messagebox("Error","SQLError (1): " + SQLVIACHECKS.SQLErrText,StopSign!)
		return
	end if
			
	if is_sql2 <> '' then
		
		EXECUTE IMMEDIATE :is_sql2 USING SQLVIACHECKS;

		if SQLVIACHECKS.SQLCode <> 0 then	
			Messagebox("Error","SQLError(2): " + SQLVIACHECKS.SQLErrText,StopSign!)
			return
		end if
			
	end if
	
else
	
	Messagebox("Error","Check the parameters",StopSign!)
	
end if
end event

type st_3 from statictext within w_viachecktools
integer x = 887
integer y = 524
integer width = 119
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "or"
boolean focusrectangle = false
end type

type sle_checkidvcp from editmask within w_viachecktools
integer x = 1280
integer y = 504
integer width = 370
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###########"
end type

type sle_checkid from editmask within w_viachecktools
integer x = 434
integer y = 504
integer width = 370
integer height = 92
integer taborder = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###########"
end type

type dw_1 from datawindow within w_viachecktools
integer x = 32
integer y = 804
integer width = 2587
integer height = 900
string title = "none"
string dataobject = "dw_viachecktools"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_viachecktools
integer x = 2030
integer y = 636
integer width = 539
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
boolean default = true
end type

event clicked;
double ld_checkid, ld_checkidvcp

if sle_checkid.text <> '' then
	
	dw_1.retrieve(double(sle_checkid.text),0,'VC')
	
elseif sle_checkidVCP.text <> '' then
	
	dw_1.retrieve(0,double(sle_checkidVCP.text),'VCP')

else
	
	Messagebox("Error","Please enter CheckID or VCP ID",StopSign!)
	return
				
end if



is_sql1 = ''
is_sql2 = ''
mle_SQL.text  = ""


ld_checkid = dw_1.getitemnumber(dw_1.getrow(),"checkid")
ld_checkidvcp = dw_1.getitemnumber(dw_1.getrow(),"cdcheckplus")


// determines the command to execute
if rb_void.checked then
	
	if not isnull(ld_checkidvcp) then
		is_sql2 = "UPDATE tvcp_cheques SET cdestado_cheque = 4, cdnumero_cheque = '11' + cdnumero_cheque WHERE cdcheque = "	+ String(ld_checkidvcp)
	end if		
	is_sql1 = "UPDATE checktable SET Check_ = '11' + Check_ WHERE checkid = "+String(ld_checkid)
		
elseif rb_status.checked then
		
	if double(em_newstatus.text) > -1 and double(em_newstatus.text) < 9 then
		is_sql1 = "UPDATE checktable SET checkstatus = " + String(em_newstatus.text) + " WHERE checkid = "+String(ld_checkid)
	end if
	
elseif rb_endorsment.checked then
	
	if not isnull(ld_checkidvcp) then
		is_sql1 = "UPDATE tvcp_cheques SET SNENDOSOVALIDO = 1 WHERE cdcheque = "	+ String(ld_checkidvcp)
	end if
		
elseif rb_resend.checked then
		
	is_sql1 = "UPDATE checktable SET cashletterid = null, checkstatus = 0 WHERE checkid = "+String(ld_checkid)
		
end if


// Shows the command in the screen
mle_SQL.text = is_sql1
if is_sql2 <> '' then mle_SQL.text = mle_SQL.text + char(10)+char(13)+char(10)+char(13) + is_sql2




end event

type st_2 from statictext within w_viachecktools
integer x = 1038
integer y = 524
integer width = 229
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "VCP ID:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_viachecktools
integer x = 128
integer y = 524
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check ID:"
boolean focusrectangle = false
end type

type rb_resend from radiobutton within w_viachecktools
integer x = 123
integer y = 372
integer width = 1723
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resend Check to the Bank (on the next cash letter)"
end type

type rb_endorsment from radiobutton within w_viachecktools
integer x = 123
integer y = 280
integer width = 1723
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Authorize check endorsment (when the MIRC recognition fails)"
end type

type rb_status from radiobutton within w_viachecktools
integer x = 123
integer y = 188
integer width = 1723
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Change Check Status to:"
end type

type rb_void from radiobutton within w_viachecktools
integer x = 123
integer y = 96
integer width = 1723
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Void Check for Reprocessing (Adds 11 to the begining of the check number)"
boolean checked = true
end type

type gb_1 from groupbox within w_viachecktools
integer x = 32
integer y = 20
integer width = 2587
integer height = 776
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_viachecktools
integer x = 55
integer y = 1736
integer width = 2565
integer height = 480
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Execution Task"
end type

