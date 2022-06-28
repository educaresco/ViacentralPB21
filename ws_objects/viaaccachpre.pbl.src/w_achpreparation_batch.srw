$PBExportHeader$w_achpreparation_batch.srw
forward
global type w_achpreparation_batch from window
end type
type lb_batch from dropdownlistbox within w_achpreparation_batch
end type
type em_amount from editmask within w_achpreparation_batch
end type
type st_amt from statictext within w_achpreparation_batch
end type
type sle_branch from singlelineedit within w_achpreparation_batch
end type
type st_3 from statictext within w_achpreparation_batch
end type
type st_2 from statictext within w_achpreparation_batch
end type
type sle_current from singlelineedit within w_achpreparation_batch
end type
type st_1 from statictext within w_achpreparation_batch
end type
type cb_2 from commandbutton within w_achpreparation_batch
end type
type cb_1 from commandbutton within w_achpreparation_batch
end type
type gb_1 from groupbox within w_achpreparation_batch
end type
end forward

global type w_achpreparation_batch from window
integer x = 1189
integer y = 556
integer width = 1833
integer height = 740
boolean titlebar = true
string title = "ACH Preparation - Change Batch"
windowtype windowtype = response!
long backcolor = 80269524
lb_batch lb_batch
em_amount em_amount
st_amt st_amt
sle_branch sle_branch
st_3 st_3
st_2 st_2
sle_current sle_current
st_1 st_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_achpreparation_batch w_achpreparation_batch

type variables
string is_batchid
string is_id_main_branch, is_id_branch

end variables

on w_achpreparation_batch.create
this.lb_batch=create lb_batch
this.em_amount=create em_amount
this.st_amt=create st_amt
this.sle_branch=create sle_branch
this.st_3=create st_3
this.st_2=create st_2
this.sle_current=create sle_current
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.lb_batch,&
this.em_amount,&
this.st_amt,&
this.sle_branch,&
this.st_3,&
this.st_2,&
this.sle_current,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_achpreparation_batch.destroy
destroy(this.lb_batch)
destroy(this.em_amount)
destroy(this.st_amt)
destroy(this.sle_branch)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_current)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;String ls_parameters, ls_name_main_branch
double ld_amount

ls_parameters = message.stringparm

is_batchid = fn_token(ls_parameters,"*",1)
is_id_main_branch = fn_token(ls_parameters,"*",2)
ld_amount = double(fn_token(ls_parameters,"*",3))

setnull(ls_name_main_branch)

select name_main_branch
  into :ls_name_main_branch
  from dba.group_branch
 where id_main_branch = :is_id_main_branch;

if isnull(ls_name_main_branch) or len(trim(ls_name_main_branch)) < 1 then
	closewithreturn(this,"-none-")
	return
end if

sle_branch.text = ls_name_main_branch
em_amount.text = string(ld_amount)
sle_current.text = is_batchid

double ld_batchid
string ls_dummy

ls_dummy = '-NEW-'

// ----------------------------------------
// Load Batch List
DECLARE CUR_BATCHES CURSOR FOR  
 SELECT dba.ACH_BATCH.BATCH_ID  
   FROM dba.ACH_BATCH  
  WHERE ( dba.ACH_BATCH.BATCH_TYPE = 'B' ) AND  
        ( dba.ACH_BATCH.BATCH_STATUS = 'IP' )   
ORDER BY dba.ACH_BATCH.BATCH_ID ASC  ;

OPEN CUR_BATCHES;
FETCH CUR_BATCHES INTO :ld_batchid;
lb_batch.reset()
do while SQLCA.SQLCode = 0 
	
	if string(ld_batchid) <> is_batchid then
		lb_batch.additem(string(ld_batchid))
		ls_dummy = string(ld_batchid)
	end if

	FETCH CUR_BATCHES INTO :ld_batchid;
loop
CLOSE CUR_BATCHES;
// ----------------------------------------

lb_batch.additem("-NEW-")

lb_batch.text = ls_dummy

end event

type lb_batch from dropdownlistbox within w_achpreparation_batch
integer x = 608
integer y = 352
integer width = 416
integer height = 504
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type em_amount from editmask within w_achpreparation_batch
integer x = 608
integer y = 168
integer width = 416
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

type st_amt from statictext within w_achpreparation_batch
integer x = 215
integer y = 180
integer width = 375
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

type sle_branch from singlelineedit within w_achpreparation_batch
integer x = 608
integer y = 76
integer width = 1106
integer height = 80
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

type st_3 from statictext within w_achpreparation_batch
integer x = 215
integer y = 88
integer width = 375
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

type st_2 from statictext within w_achpreparation_batch
integer x = 215
integer y = 272
integer width = 375
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
string text = "Current Batch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_current from singlelineedit within w_achpreparation_batch
integer x = 608
integer y = 260
integer width = 416
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
textcase textcase = upper!
integer limit = 6
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_achpreparation_batch
integer x = 215
integer y = 368
integer width = 375
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
string text = "Move To :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_achpreparation_batch
integer x = 1307
integer y = 528
integer width = 466
integer height = 84
integer taborder = 10
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

type cb_1 from commandbutton within w_achpreparation_batch
integer x = 823
integer y = 528
integer width = 466
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Move"
end type

event clicked;String	ls_base, ls_next, ls_addmsg
Long ll_cont, ld_next
String ls_last

ls_base = mid(sle_current.text,1,len(sle_current.text)-2)

//messagebox("",ls_base)

SELECT MAX(BATCH_ID)
  INTO :ls_last
  FROM dba.ACH_BATCH
 WHERE BATCH_ID like :ls_base+'%';

if lb_batch.text = '-NEW-' then
	ls_next = string(double(ls_last) + 1)
else
	ls_next = lb_batch.text
end if

if Messagebox("Confirmation","Are you sure that you want to move this transaction to the batch "+ls_next+"?",Question!,YesNo!) <> 1 Then
	return
end if

ld_next = double(ls_next) 

// verifica si es necesario crear el lote de destino (cuando escoge NEW)

SELECT COUNT(*)
INTO :ll_cont
FROM dba.ACH_BATCH
WHERE BATCH_ID = :ls_next;
 
if ll_cont < 1 then

	// The destination batch must be created	
	INSERT INTO dba.ACH_BATCH(BATCH_ID, BATCH_TYPE, PREPARATION_DATE, BATCH_STATUS, ID_BANCO, ID_CUENTA_BANCO, FILE_NAME, FILE_CRETIME, BANK_CONFIRMATION)
	VALUES(:ld_next, 'B', getdate(), 'IP', NULL, NULL, NULL, NULL, NULL);

	if sqlca.sqlcode<> 0 then
		Messagebox("Insert Into ACH_BATCH Failed","There is a error inserting data to ACH_BATCH.~n"+SqlCa.SQLErrText,StopSign!)
		return
	end if	
	
end if
 
// Verifica que la transaccion sea una sola, si es asi la mueve

SELECT COUNT(*)
INTO :ll_cont
FROM dba.ACH_BATCH_DETAIL_BRANCH
WHERE BATCH_ID = :sle_current.text
AND id_main_branch = :is_id_main_branch;
	
if ll_cont = 1 then
	
	UPDATE dba.ACH_BATCH_DETAIL_BRANCH
	SET BATCH_ID = :ld_next
	WHERE BATCH_ID = :sle_current.text
	AND id_main_branch = :is_id_main_branch;

	if sqlca.sqlcode<> 0 then
		Messagebox("Update ACH_BATCH_DETAIL_BRANCH Failed","There is a error updating data in ACH_BATCH_DETAIL_BRANCH.~n"+SqlCa.SQLErrText,StopSign!)
		return
	end if		
	
end if

// Verifica si no era la ultima transaccion en el archivo

ls_addmsg = ""

SELECT COUNT(*)
INTO :ll_cont
FROM dba.ACH_BATCH_DETAIL_BRANCH
WHERE BATCH_ID = :sle_current.text;
 
if ll_cont = 0 then
	
	DELETE FROM dba.ACH_BATCH
	 WHERE BATCH_ID = :sle_current.text;	
	
	if sqlca.sqlcode<> 0 then
		Messagebox("Delete From ACH_BATCH Failed","There is a error deleting data from ACH_BATCH.~n"+SqlCa.SQLErrText,StopSign!)
		return
	end if	
	
	ls_addmsg = "~nThe original batch was deleted because this was the last transaction on that batch."
	
end if

Messagebox("Complete","The transaction has been moved to the batch "+ls_next+"."+ls_addmsg,Information!)

close(parent)
end event

type gb_1 from groupbox within w_achpreparation_batch
integer x = 46
integer y = 8
integer width = 1733
integer height = 488
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

