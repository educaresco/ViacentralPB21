$PBExportHeader$w_achpreparation_addtrans.srw
forward
global type w_achpreparation_addtrans from window
end type
type st_file from statictext within w_achpreparation_addtrans
end type
type sle_account from singlelineedit within w_achpreparation_addtrans
end type
type st_3 from statictext within w_achpreparation_addtrans
end type
type st_2 from statictext within w_achpreparation_addtrans
end type
type sle_id_branch from singlelineedit within w_achpreparation_addtrans
end type
type em_amount from editmask within w_achpreparation_addtrans
end type
type st_amt from statictext within w_achpreparation_addtrans
end type
type st_1 from statictext within w_achpreparation_addtrans
end type
type sle_branch from singlelineedit within w_achpreparation_addtrans
end type
type cb_2 from commandbutton within w_achpreparation_addtrans
end type
type cb_1 from commandbutton within w_achpreparation_addtrans
end type
type gb_1 from groupbox within w_achpreparation_addtrans
end type
end forward

global type w_achpreparation_addtrans from window
integer x = 1189
integer y = 556
integer width = 1833
integer height = 776
boolean titlebar = true
string title = "ACH Preparation - New transaction"
windowtype windowtype = response!
long backcolor = 80269524
st_file st_file
sle_account sle_account
st_3 st_3
st_2 st_2
sle_id_branch sle_id_branch
em_amount em_amount
st_amt st_amt
st_1 st_1
sle_branch sle_branch
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_achpreparation_addtrans w_achpreparation_addtrans

type variables
string is_batchid
string is_id_main_branch, is_id_branch, is_acctypeid, is_accrouting, is_accnumber

end variables

forward prototypes
public function boolean fn_valbranch ()
end prototypes

public function boolean fn_valbranch ();long ll_cont 
string ls_name
boolean lb_result

lb_result = true

is_id_branch = trim(sle_id_branch.text)

SELECT count(*)
INTO :ll_cont
FROM dba.BRANCH,   
dba.GROUP_BRANCH  
WHERE ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  
AND ( dba.BRANCH.ID_BRANCH = :is_id_branch ) 
AND ( dba.GROUP_BRANCH.fin_collectmethod = 'AC' or  dba.GROUP_BRANCH.fin_collectmethod_2 = 'AC' )
AND ( fin_achaccrouting is not null )
AND ( len(rtrim(fin_achaccrouting)) = 9 )
AND ( fin_achaccnumber is not null )
//PBI 24625:ACH - Preparation must not allow to create an ACH for closed Agencies
AND dba.BRANCH.ID_STATUS_BRANCH = 'O'
//*********************************************
AND ( len(rtrim(fin_achaccnumber)) > 3 );

if ll_cont = 1 then

	SELECT dba.GROUP_BRANCH.id_main_branch,
	isnull(dba.GROUP_BRANCH.fin_achacctypeid,'C'),   
	dba.GROUP_BRANCH.fin_achaccrouting,   
	dba.GROUP_BRANCH.fin_achaccnumber,
	name_main_branch
	INTO :is_id_main_branch,
	:is_acctypeid,
	:is_accrouting,
	:is_accnumber,
	:ls_name
	FROM dba.BRANCH,   
	dba.GROUP_BRANCH  
	WHERE ( dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH )  
	AND ( dba.BRANCH.ID_BRANCH = :is_id_branch ) 
	AND ( dba.GROUP_BRANCH.fin_collectmethod = 'AC' or  dba.GROUP_BRANCH.fin_collectmethod_2 = 'AC' )
	AND ( fin_achaccrouting is not null )
	AND ( len(rtrim(fin_achaccrouting)) = 9 )
	AND ( fin_achaccnumber is not null )
	//PBI 24625:ACH - Preparation must not allow to create an ACH for closed Agencies
	AND dba.BRANCH.ID_STATUS_BRANCH = 'O'
//*********************************************
	AND ( len(rtrim(fin_achaccnumber)) > 3 );
		
	if trim(is_acctypeid) = 'S' then
		sle_account.text = 'SAVINGS  '
	else
		sle_account.text = 'CHECKING  '
	end if

	sle_account.text = sle_account.text + 'R/T '+ trim(is_accrouting) + '  Acc# '+ trim(is_accnumber) 
	sle_branch.text = trim(ls_name)

else
	Messagebox("Error","This Branch is not configured as ACH, its ACH Account Information is not completed or the Branch is disable.",StopSign!)	
	sle_id_branch.setfocus()
	lb_result = false
end if

return lb_result
end function

on w_achpreparation_addtrans.create
this.st_file=create st_file
this.sle_account=create sle_account
this.st_3=create st_3
this.st_2=create st_2
this.sle_id_branch=create sle_id_branch
this.em_amount=create em_amount
this.st_amt=create st_amt
this.st_1=create st_1
this.sle_branch=create sle_branch
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.st_file,&
this.sle_account,&
this.st_3,&
this.st_2,&
this.sle_id_branch,&
this.em_amount,&
this.st_amt,&
this.st_1,&
this.sle_branch,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_achpreparation_addtrans.destroy
destroy(this.st_file)
destroy(this.sle_account)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_id_branch)
destroy(this.em_amount)
destroy(this.st_amt)
destroy(this.st_1)
destroy(this.sle_branch)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;is_batchid = trim(message.stringparm)
st_file.text = "File :"+is_batchid
end event

type st_file from statictext within w_achpreparation_addtrans
integer x = 974
integer y = 56
integer width = 773
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_account from singlelineedit within w_achpreparation_addtrans
integer x = 608
integer y = 284
integer width = 1106
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_achpreparation_addtrans
integer x = 87
integer y = 296
integer width = 507
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Account :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_achpreparation_addtrans
integer x = 87
integer y = 96
integer width = 507
integer height = 56
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
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_id_branch from singlelineedit within w_achpreparation_addtrans
integer x = 608
integer y = 84
integer width = 325
integer height = 80
integer taborder = 10
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

event modified;boolean lb_dummy
lb_dummy = fn_valBranch()
end event

type em_amount from editmask within w_achpreparation_addtrans
integer x = 608
integer y = 384
integer width = 325
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

type st_amt from statictext within w_achpreparation_addtrans
integer x = 87
integer y = 396
integer width = 507
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Amount :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_achpreparation_addtrans
integer x = 87
integer y = 196
integer width = 507
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Name Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_branch from singlelineedit within w_achpreparation_addtrans
integer x = 608
integer y = 184
integer width = 1106
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_achpreparation_addtrans
integer x = 1307
integer y = 556
integer width = 466
integer height = 84
integer taborder = 30
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

type cb_1 from commandbutton within w_achpreparation_addtrans
integer x = 823
integer y = 556
integer width = 466
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Ok"
end type

event clicked;double ld_amount
String ls_previousACH 



ld_amount = double(em_amount.text)

if not fn_valBranch() then
	return	
end if



if isnull(ld_amount) or ld_amount = 0 then
	Messagebox("Error","Invalid Amount",StopSign!)
	em_amount.setfocus()
	return
end if

//*****************************************************
//pbi 26316

 SELECT  dba.fnValBranchReturnedAch ( :is_id_branch,:ld_amount )
     into  :ls_previousACH
    from  dba.dual;

if ( not isnull(ls_previousACH)  ) then
	ls_previousACH = "Balance ref num:" + ls_previousACH
     ls_previousACH = fn_replace ( ls_previousACH,"-", " - batch: ")
	Messagebox("Warning","The Branch your adding has a returned ACH, please verify the "+ls_previousACH+", and marked the ACH as RETRY, before sending the ACH",StopSign!)
end if
//******************************************************


INSERT INTO dba.ACH_BATCH_DETAIL_BRANCH
            (BATCH_ID,
             ID_MAIN_BRANCH, 
             ID_BRANCH, 
             ACCTYPEID, 
             ACCROUTING, 
             ACCNUMBER, 
             AMOUNT)
      VALUES(:is_batchid, 
             :is_id_main_branch, 
             :is_id_branch, 
             :is_acctypeid, 
             :is_accrouting, 
             :is_accnumber, 
             :ld_amount);

if sqlca.sqlcode<> 0 then
	Messagebox("Insert Into ACH_BATCH_DETAIL_BRANCH Failed","There is a error inserting data to ACH_BATCH_DETAIL_BRANCH.~n"+SqlCa.SQLErrText,StopSign!)
	return
end if

if isvalid(w_achpreparation) then
	w_achpreparation.dw_1.retrieve(double(w_achpreparation.lb_batch.text))
	w_achpreparation.dw_2.retrieve(double(w_achpreparation.lb_batch.text))
end if

close(parent)	
end event

type gb_1 from groupbox within w_achpreparation_addtrans
integer x = 46
integer y = 8
integer width = 1733
integer height = 516
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

