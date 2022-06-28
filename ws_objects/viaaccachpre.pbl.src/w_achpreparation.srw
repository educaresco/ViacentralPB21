$PBExportHeader$w_achpreparation.srw
forward
global type w_achpreparation from wb_report
end type
type cb_query from commandbutton within w_achpreparation
end type
type lb_batch from dropdownlistbox within w_achpreparation
end type
type dw_2 from datawindow within w_achpreparation
end type
type pb_newtrans from picturebutton within w_achpreparation
end type
type rb_ub from radiobutton within w_achpreparation
end type
type rb_ad from radiobutton within w_achpreparation
end type
type rb_ip from radiobutton within w_achpreparation
end type
type rb_bone from radiobutton within w_achpreparation
end type
type rb_snet from radiobutton within w_achpreparation
end type
type gb_1 from groupbox within w_achpreparation
end type
type gb_2 from groupbox within w_achpreparation
end type
type gb_3 from groupbox within w_achpreparation
end type
type rb_usbank from radiobutton within w_achpreparation
end type
type rb_mitchell from radiobutton within w_achpreparation
end type
type cb_creditrcc from commandbutton within w_achpreparation
end type
type dw_checks from datawindow within w_achpreparation
end type
type cb_printrcc from commandbutton within w_achpreparation
end type
type rb_ach from radiobutton within w_achpreparation
end type
type rb_rcc from radiobutton within w_achpreparation
end type
type st_type from statictext within w_achpreparation
end type
type st_achtype from statictext within w_achpreparation
end type
type gb_4 from groupbox within w_achpreparation
end type
type gb_5 from groupbox within w_achpreparation
end type
type gb_6 from groupbox within w_achpreparation
end type
type ddlb_typeach from dropdownlistbox within w_achpreparation
end type
type cb_generate from commandbutton within w_achpreparation
end type
end forward

global type w_achpreparation from wb_report
integer x = 214
integer y = 221
integer width = 4594
integer height = 2000
string title = "ACH Preparation"
long backcolor = 80269524
cb_query cb_query
lb_batch lb_batch
dw_2 dw_2
pb_newtrans pb_newtrans
rb_ub rb_ub
rb_ad rb_ad
rb_ip rb_ip
rb_bone rb_bone
rb_snet rb_snet
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
rb_usbank rb_usbank
rb_mitchell rb_mitchell
cb_creditrcc cb_creditrcc
dw_checks dw_checks
cb_printrcc cb_printrcc
rb_ach rb_ach
rb_rcc rb_rcc
st_type st_type
st_achtype st_achtype
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
ddlb_typeach ddlb_typeach
cb_generate cb_generate
end type
global w_achpreparation w_achpreparation

forward prototypes
public subroutine wf_refreshscreen ()
public subroutine fn_refreshbatches (string ls_toshow)
public subroutine fn_getachstotreasury (string ps_idbanco, double pd_batchid)
end prototypes

public subroutine wf_refreshscreen ();double ld_batchid
string ls_status

if rb_ip.checked then
	ls_status = 'IP'
	cb_generate.text = "Generate File"
elseif rb_ad.checked then
	ls_status = 'AD'	
	cb_generate.text = "Generate File Again"
elseif rb_ub.checked then
	ls_status = 'UB'	
	cb_generate.text = "Close"
end if

// ----------------------------------------
// Load Batch List
DECLARE CUR_BATCHES CURSOR FOR  
SELECT dba.ACH_BATCH.BATCH_ID  
FROM dba.ACH_BATCH  
WHERE ( dba.ACH_BATCH.BATCH_TYPE IN ('B','C') ) 
AND ( dba.ACH_BATCH.BATCH_STATUS = :ls_status )   
ORDER BY dba.ACH_BATCH.BATCH_ID ASC  ;

OPEN CUR_BATCHES;
FETCH CUR_BATCHES INTO :ld_batchid;
lb_batch.reset()
do while SQLCA.SQLCode = 0 
	lb_batch.additem(string(ld_batchid))
	FETCH CUR_BATCHES INTO :ld_batchid;
loop
CLOSE CUR_BATCHES;
// ----------------------------------------


lb_batch.text = String(ld_batchid)
dw_1.reset()
dw_2.reset()
cb_query.triggerevent(Clicked!)


// <><><><><><><><><><><><><><><><><><><><><><><><><><><><>
// Updates the batch type
String ls_batctype

SELECT dba.ACH_BATCH.BATCH_TYPE
INTO :ls_batctype
FROM dba.ACH_BATCH  
WHERE batch_id = :lb_batch.text;

st_type.text = "ACH"

if ls_batctype = 'C' then st_type.text = "RCC"
// <><><><><><><><><><><><><><><><><><><><><><><><><><><><>


end subroutine

public subroutine fn_refreshbatches (string ls_toshow);

double ld_batchid

// ----------------------------------------
// Load Batch List
DECLARE CUR_BATCHES CURSOR FOR  
SELECT dba.ACH_BATCH.BATCH_ID  
FROM dba.ACH_BATCH  
WHERE ( dba.ACH_BATCH.BATCH_TYPE IN ('B','C') ) AND  
( dba.ACH_BATCH.BATCH_STATUS = 'IP' )   
ORDER BY dba.ACH_BATCH.BATCH_ID ASC  ;

OPEN CUR_BATCHES;
FETCH CUR_BATCHES INTO :ld_batchid;
lb_batch.reset()
do while SQLCA.SQLCode = 0 
	lb_batch.additem(string(ld_batchid))
	FETCH CUR_BATCHES INTO :ld_batchid;
loop
CLOSE CUR_BATCHES;
// ----------------------------------------

if ls_toshow = 'LAST' then
	lb_batch.text = String(ld_batchid)
else
	lb_batch.text = ls_toshow
end if




end subroutine

public subroutine fn_getachstotreasury (string ps_idbanco, double pd_batchid);//Calls the SP to load the data into treasury software table.
//Uses the ViaCheck connection because the SQLCA connection uses a role that cannot reach other DBs (unless objects have public access).


Double ld_batchid
ld_batchid =  pd_batchid

String ls_idbanco
ls_idbanco = ps_idbanco


String  ls_servername, ls_id, ls_password, ls_db


ls_servername=ProfileString('ViaCentral.ini','VIACHECKS','ServerName','')
ls_id=ProfileString('ViaCentral.ini','VIACHECKS','LogId','')
ls_password=ProfileString('ViaCentral.ini','VIACHECKS','LogPass','')
ls_db=ProfileString('ViaCentral.ini','VIACHECKS','Database','')

/*****************/

// :::::::::::::::::::::::::::::::::::::::::
// LOGIN DB CONNECTION
SQLVIACHECKS 				= Create n_tr
SQLVIACHECKS.DBMS = "SNC SQL Native Client(OLE DB)"
SQLVIACHECKS.DBParm = "Database='"+ls_db+"',TrimSpaces=1"
SQLVIACHECKS.LogPass 	=ls_password//  'r3mot3#@'
SQLVIACHECKS.ServerName = ls_servername //'192.168.11.100'
SQLVIACHECKS.LogId 		= ls_id  //'vcviacentral'
SQLVIACHECKS.AutoCommit = True
// :::::::::::::::::::::::::::::::::::::::::			


if SQLVIACHECKS.of_connect() <> 0 then
	MessageBox("Cannot Connect", "Cannot Connect to ViaChecks Database~n~r" + SQLVIACHECKS.sqlerrtext,stopsign!)
	return	
end if


DECLARE spGetACHsToTreasury1 PROCEDURE FOR Envio.dba.spGetACHsToTreasury :ld_batchid,  :ls_idbanco USING SQLVIACHECKS;
		
if SQLVIACHECKS.sqlcode <> 0 then	
	Messagebox("Error Declaring spGetACHsToTreasury",String(SQLVIACHECKS.sqlcode) + ":" + SQLVIACHECKS.SQLErrText)
end if

execute spGetACHsToTreasury1;
if SQLVIACHECKS.sqlcode <> 0 and SQLVIACHECKS.sqlcode <> 100 then	
	Messagebox("Error Executing spGetACHsToTreasury",String(SQLVIACHECKS.sqlcode) + ":" + SQLVIACHECKS.SQLErrText)
else
	Messagebox("Data Processed","Data has been imported into TREASURY SOFTWARE please process the file there.")
end if
 

SQLVIACHECKS.of_disconnect()
end subroutine

on w_achpreparation.create
int iCurrent
call super::create
this.cb_query=create cb_query
this.lb_batch=create lb_batch
this.dw_2=create dw_2
this.pb_newtrans=create pb_newtrans
this.rb_ub=create rb_ub
this.rb_ad=create rb_ad
this.rb_ip=create rb_ip
this.rb_bone=create rb_bone
this.rb_snet=create rb_snet
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.rb_usbank=create rb_usbank
this.rb_mitchell=create rb_mitchell
this.cb_creditrcc=create cb_creditrcc
this.dw_checks=create dw_checks
this.cb_printrcc=create cb_printrcc
this.rb_ach=create rb_ach
this.rb_rcc=create rb_rcc
this.st_type=create st_type
this.st_achtype=create st_achtype
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
this.ddlb_typeach=create ddlb_typeach
this.cb_generate=create cb_generate
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_query
this.Control[iCurrent+2]=this.lb_batch
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.pb_newtrans
this.Control[iCurrent+5]=this.rb_ub
this.Control[iCurrent+6]=this.rb_ad
this.Control[iCurrent+7]=this.rb_ip
this.Control[iCurrent+8]=this.rb_bone
this.Control[iCurrent+9]=this.rb_snet
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.gb_3
this.Control[iCurrent+13]=this.rb_usbank
this.Control[iCurrent+14]=this.rb_mitchell
this.Control[iCurrent+15]=this.cb_creditrcc
this.Control[iCurrent+16]=this.dw_checks
this.Control[iCurrent+17]=this.cb_printrcc
this.Control[iCurrent+18]=this.rb_ach
this.Control[iCurrent+19]=this.rb_rcc
this.Control[iCurrent+20]=this.st_type
this.Control[iCurrent+21]=this.st_achtype
this.Control[iCurrent+22]=this.gb_4
this.Control[iCurrent+23]=this.gb_5
this.Control[iCurrent+24]=this.gb_6
this.Control[iCurrent+25]=this.ddlb_typeach
this.Control[iCurrent+26]=this.cb_generate
end on

on w_achpreparation.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_query)
destroy(this.lb_batch)
destroy(this.dw_2)
destroy(this.pb_newtrans)
destroy(this.rb_ub)
destroy(this.rb_ad)
destroy(this.rb_ip)
destroy(this.rb_bone)
destroy(this.rb_snet)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.rb_usbank)
destroy(this.rb_mitchell)
destroy(this.cb_creditrcc)
destroy(this.dw_checks)
destroy(this.cb_printrcc)
destroy(this.rb_ach)
destroy(this.rb_rcc)
destroy(this.st_type)
destroy(this.st_achtype)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.ddlb_typeach)
destroy(this.cb_generate)
end on

event open;call super::open;fn_refreshbatches("LAST")

cb_query.triggerevent(Clicked!)

rb_ach.triggerevent(Clicked!)
end event

event pfc_preclose;call super::pfc_preclose;dw_2.reset()
return 1
end event

event resize;dw_1.height = this.height - 370
dw_1.width = this.width - 80

if dw_1.width < 3419 then
	pb_newtrans.visible = false
else
	pb_newtrans.visible = true
end if
end event

type dw_1 from wb_report`dw_1 within w_achpreparation
integer x = 9
integer y = 324
integer width = 4526
integer height = 1456
integer taborder = 0
string dataobject = "dw_achpreparation"
end type

event dw_1::constructor;SetTransObject(SQLCA)
//this.retrieve()
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)
end event

event dw_1::buttonclicked;string ls_id_main_branch, ls_parameter
double ld_amount, ld_newamount, ld_batchid

if rb_ad.checked or rb_ub.checked then
	messagebox("Operation Not Allowed","It is not possible to change information for Exported Files",Exclamation!)
	return
end if

ls_id_main_branch = dw_1.getitemstring(dw_1.getrow(),"id_main_branch")
ld_amount = dw_1.getitemnumber(dw_1.getrow(),"amount")


if dwo.name = "cb_change" then
		
	openwithparm(w_achpreparation_changeamt,ls_id_main_branch+"*"+string(ld_amount))
	ls_parameter = message.stringparm
	if ls_parameter <> "-none-" then	
		ld_newamount = double(ls_parameter)		
		if ld_newamount = 0 then
			If Messagebox("Confirmation","Using a zero amount will remove this Branch from the ACH file~r~nDo you want to remove "+ls_id_main_branch+" from the file?",Question!,YesNo!) = 1 Then
				dw_1.deleterow(dw_1.getrow())
				dw_1.update()
			end if	
		else
			dw_1.setitem(dw_1.getrow(),"amount",ld_newamount)
			dw_1.update()
		end if
	end if

elseif dwo.name = "cb_batch" then
	
	openwithparm(w_achpreparation_batch,lb_batch.text+"*"+ls_id_main_branch+"*"+string(ld_amount))	
	fn_refreshbatches(lb_batch.text)
	cb_query.triggerevent(Clicked!)

end if

end event

event dw_1::clicked;call super::clicked;long ll_row
ll_row = dw_1.GetClickedRow()
dw_1.SelectRow(0,FALSE)
if ll_row > 0 then
	 dw_1.Scrolltorow(ll_row)
end if
end event

type cb_query from commandbutton within w_achpreparation
string tag = "Query"
integer x = 681
integer y = 164
integer width = 635
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
boolean default = true
end type

event clicked;dw_1.retrieve(double(lb_batch.text))
dw_2.retrieve(double(lb_batch.text))

	
end event

type lb_batch from dropdownlistbox within w_achpreparation
integer x = 681
integer y = 68
integer width = 485
integer height = 504
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.retrieve(double(lb_batch.text))
dw_2.retrieve(double(lb_batch.text))

String ls_batctype

SELECT dba.ACH_BATCH.BATCH_TYPE
INTO :ls_batctype
FROM dba.ACH_BATCH  
WHERE batch_id = :lb_batch.text;

st_type.text = "ACH"

if ls_batctype = 'C' then st_type.text = "RCC"

end event

type dw_2 from datawindow within w_achpreparation
integer x = 1893
integer y = 48
integer width = 1650
integer height = 96
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_achpreparation_batch"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event itemchanged;DataWindowChild	ldw_dw

IF dwo.Name = 'id_banco' THEN
	GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("id_banco = '"+GetText()+"'")
	ldw_dw.Filter()
	dw_2.setitem(dw_2.getrow(),"id_cuenta_banco",'')
END IF	


end event

type pb_newtrans from picturebutton within w_achpreparation
string tag = "NewTransaction"
integer x = 3835
integer y = 344
integer width = 110
integer height = 96
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "SelectScript!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;openwithparm(w_achpreparation_addtrans,lb_batch.text)
end event

type rb_ub from radiobutton within w_achpreparation
boolean visible = false
integer x = 32
integer y = 140
integer width = 434
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Uploaded Bank"
end type

event clicked;//double ld_batchid
//string ls_status
//
//ls_status = 'IP'
//if this.checked then
//	ls_status = 'AD'
//	cb_generate.text = "Save Confirmation"
//end if
//
//// ----------------------------------------
//// Load Batch List
//DECLARE CUR_BATCHES CURSOR FOR  
// SELECT dba.ACH_BATCH.BATCH_ID  
//   FROM dba.ACH_BATCH  
//  WHERE ( dba.ACH_BATCH.BATCH_TYPE = 'B' ) AND  
//        ( dba.ACH_BATCH.BATCH_STATUS = :ls_status )   
//ORDER BY dba.ACH_BATCH.BATCH_ID ASC  ;
//
//OPEN CUR_BATCHES;
//FETCH CUR_BATCHES INTO :ld_batchid;
//lb_batch.reset()
//do while SQLCA.SQLCode = 0 
//	lb_batch.additem(string(ld_batchid))
//	FETCH CUR_BATCHES INTO :ld_batchid;
//loop
//CLOSE CUR_BATCHES;
//// ----------------------------------------
//
//lb_batch.text = String(ld_batchid)
//
//cb_query.triggerevent(Clicked!)

parent.wf_refreshscreen()
end event

type rb_ad from radiobutton within w_achpreparation
integer x = 73
integer y = 184
integer width = 494
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Exported To Bank"
end type

event clicked;//double ld_batchid
//string ls_status
//
//ls_status = 'IP'
//if this.checked then
//	ls_status = 'AD'
//	cb_generate.text = "Save Confirmation"
//end if
//
//// ----------------------------------------
//// Load Batch List
//DECLARE CUR_BATCHES CURSOR FOR  
// SELECT dba.ACH_BATCH.BATCH_ID  
//   FROM dba.ACH_BATCH  
//  WHERE ( dba.ACH_BATCH.BATCH_TYPE = 'B' ) AND  
//        ( dba.ACH_BATCH.BATCH_STATUS = :ls_status )   
//ORDER BY dba.ACH_BATCH.BATCH_ID ASC  ;
//
//OPEN CUR_BATCHES;
//FETCH CUR_BATCHES INTO :ld_batchid;
//lb_batch.reset()
//do while SQLCA.SQLCode = 0 
//	lb_batch.additem(string(ld_batchid))
//	FETCH CUR_BATCHES INTO :ld_batchid;
//loop
//CLOSE CUR_BATCHES;
//// ----------------------------------------
//
//lb_batch.text = String(ld_batchid)
//
//cb_query.triggerevent(Clicked!)

pb_newtrans.enabled = rb_ip.checked

cb_creditrcc.enabled = not this.enabled
rb_rcc.enabled = not this.enabled
rb_rcc.checked = not this.enabled

parent.wf_refreshscreen()


end event

type rb_ip from radiobutton within w_achpreparation
integer x = 73
integer y = 84
integer width = 425
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "In Preparation"
boolean checked = true
end type

event clicked;cb_creditrcc.enabled = this.enabled
rb_rcc.enabled = this.enabled

parent.wf_refreshscreen()
pb_newtrans.enabled = rb_ip.checked

end event

type rb_bone from radiobutton within w_achpreparation
boolean visible = false
integer x = 3639
integer y = 256
integer width = 352
integer height = 48
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
string text = "Bank One"
end type

type rb_snet from radiobutton within w_achpreparation
boolean visible = false
integer x = 2930
integer y = 280
integer width = 352
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
boolean enabled = false
string text = "SecureNet"
end type

type gb_1 from groupbox within w_achpreparation
integer x = 14
integer width = 585
integer height = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_achpreparation
boolean visible = false
integer x = 2898
integer width = 411
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Process for"
end type

type gb_3 from groupbox within w_achpreparation
integer x = 617
integer width = 763
integer height = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Batch"
end type

type rb_usbank from radiobutton within w_achpreparation
boolean visible = false
integer x = 3639
integer y = 208
integer width = 352
integer height = 48
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
string text = "Us Bank"
boolean checked = true
end type

type rb_mitchell from radiobutton within w_achpreparation
boolean visible = false
integer x = 2930
integer y = 284
integer width = 352
integer height = 48
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
string text = "Mitchell"
end type

type cb_creditrcc from commandbutton within w_achpreparation
integer x = 1911
integer y = 192
integer width = 2578
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Store and Credit Checks"
end type

event clicked;double ld_batchid, ld_amount,ld_positiveamount
long ll_i
boolean lb_onlyfile
string ls_group, ls_branch

Setpointer(HourGlass!)

lb_onlyfile = false


ld_batchid =  Double(trim(lb_batch.text))


For ll_i = 1 to dw_1.rowcount() 

	ld_amount = dw_1.Object.data[ll_i,7]
	ld_positiveamount = abs(ld_amount)
	ls_group = dw_1.Object.data[ll_i,2]
	ls_branch = dw_1.Object.data[ll_i,3]

	// --------------------------------------------------------------------------
	// Grabar las transacciones a la agencia
	if ld_amount <> 0 AND lb_onlyfile = FALSE then
		
		Double ld_cons, ld_debit, ld_credit
		Datetime ld_now
		String ls_desc, ls_desc1
			
			
		// updates the check number
		UPDATE dba.ACH_BATCH_DETAIL_BRANCH
		SET ID_ED = dba.sfGetBranchNextRCCCheckNumber(id_branch)
		WHERE batch_id = :ld_batchid
		AND id_branch = :ls_branch
		AND  ID_ED is null;
			
						
			
		SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1
		INTO :ld_cons
		FROM dba.transaccion_diaria_payee;
			
		if isnull(ld_cons) then ld_cons = 1		
			
		ld_now = datetime(today(),now())
		
		if ld_amount >= 0 then
			// Credit
			ls_desc = "ACH CREDIT (RCC) " + string(today(),'mm/dd/yyyy')
			ld_debit = 0
			ld_credit = ld_positiveamount
					
			ls_desc1 = "ACH (RCC)" + string(ld_batchid)
				
		  INSERT INTO dba.TRANSACCION_DIARIA_PAYEE  
					( CONS_TRANS_DIARIA,   
					  ID_GROUP_TRANS_DIARIA,   
					  DATE_TRANS_DIARIA,   
					  HOUR_TRANS_DIARIA,   
					  ID_CONCEPTO_CONTABLE,   
					  DES_TRANS_DIARIA,   
					  DEBIT_TRANS_DIARIA,   
					  CREDIT_TRANS_DIARIA,   
					  BALANCE_TRANS_DIARIA,   
					  DESCRIPCION_SUSPENSE,   
					  LINK_REFERENCE,   
					  DESC_TRANS_DIARIA1,   
					  DATE_SYSTEM,   
					  ID_CASHIER,   
					  TOTAL_AMOUNT,   
					  BNKID,   
					  NUM_WIRETRANSFER)
		  VALUES ( :ld_cons,   
					  :ls_group,   
					  :ld_now,   
					  :ld_now,   
					  'ACH',   
					  :ls_desc,   
					  :ld_debit,   
					  :ld_credit,   
					  0,   
					  NULL,   
					  NULL,   
					  :ls_desc1,   
					  :ld_now,   
					  :gs_cashier,   
					  NULL,   
					  NULL,   
					  NULL )  ;	
		
			if sqlca.sqlcode <> 0 then
				Messagebox("Error Inserting Transaccion Diaria Payer",SQLCA.SQLErrText)			
				return
			end if
				
		  INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE  
					( CONS_TRANS_DIARIA,   
					  ID_BANCO,   
					  ID_CUENTA_BANCO,   
					  DEPOSIT_CODE,   
					  RECONCILIATIONDATE,   
					  DATE_TRANS_DIARIA )  
		  VALUES ( :ld_cons,   
					  'VCTRAN',   
					  '123456789',   
					  NULL,   
					  :ld_now,
					  :ld_now )  ;
			
			if sqlca.sqlcode <> 0 then
				Messagebox("Error Inserting Transaccion Diaria Banco Payer",SQLCA.SQLErrText)			
				return
			end if

	end if

	end if
	// --------------------------------------------------------------------------

next

IF lb_onlyfile = FALSE THEN
	// Actualiza el Status del batch
	UPDATE DBA.ACH_BATCH SET BATCH_STATUS = 'AD', BATCH_TYPE = 'C' WHERE BATCH_ID = :ld_batchid;
END IF


commit;

Messagebox("Process Complete","Checks has been credited and prepared - Please notify Bethesda for printing!")

parent.wf_refreshscreen()


end event

type dw_checks from datawindow within w_achpreparation
boolean visible = false
integer x = 421
integer y = 400
integer width = 2926
integer height = 1320
integer taborder = 70
boolean bringtotop = true
string title = "Checks"
string dataobject = "dw_achpreparation_print_rcc_checks"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

type cb_printrcc from commandbutton within w_achpreparation
boolean visible = false
integer x = 2199
integer y = 192
integer width = 585
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print Checks"
end type

event clicked;//
//
//
//
//Double ld_batchid
//Long ll_return
//
//ld_batchid =  Double(trim(lb_batch.text))
//
//
//// updates the next check for all the cheks on the batch
//UPDATE dba.ACH_BATCH_DETAIL_BRANCH
//SET ID_ED = dba.sfGetBranchNextRCCCheckNumber(id_branch)
//WHERE batch_id = :ld_batchid
//AND  ID_ED is null;
//
//
//dw_checks.retrieve(String(ld_batchid))
//
//if Printsetup() = 1 then dw_checks.print()
//

end event

type rb_ach from radiobutton within w_achpreparation
integer x = 1408
integer y = 84
integer width = 238
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ACH"
boolean checked = true
end type

event clicked;dw_2.enabled = this.checked
cb_generate.enabled = this.checked
cb_printrcc.enabled = not this.checked
cb_creditrcc.enabled = not this.checked
ddlb_typeach.enabled = this.checked
end event

type rb_rcc from radiobutton within w_achpreparation
integer x = 1403
integer y = 164
integer width = 379
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "RC-Checks"
end type

event clicked;dw_2.enabled = not this.checked
cb_generate.enabled = not this.checked
cb_printrcc.enabled = this.checked
cb_creditrcc.enabled = this.checked
ddlb_typeach.enabled = not this.checked
end event

type st_type from statictext within w_achpreparation
integer x = 1193
integer y = 76
integer width = 151
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ACH"
boolean focusrectangle = false
end type

type st_achtype from statictext within w_achpreparation
integer x = 3566
integer y = 56
integer width = 270
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "As"
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_achpreparation
integer x = 1870
integer width = 2651
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_achpreparation
integer x = 1870
integer y = 152
integer width = 2656
integer height = 148
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_6 from groupbox within w_achpreparation
integer x = 1381
integer width = 485
integer height = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type ddlb_typeach from dropdownlistbox within w_achpreparation
integer x = 3643
integer y = 48
integer width = 334
integer height = 248
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"DEPOSIT   ","RETRY PYMT"}
borderstyle borderstyle = stylelowered!
end type

type cb_generate from commandbutton within w_achpreparation
integer x = 4005
integer y = 40
integer width = 485
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generate ACH File"
end type

event clicked;string 	ls_filepath, ls_filename, ls_namebranch, ls_id_branch, ls_transactioncode, ls_transactionname
string 	ls_customerline, ls_transactionline, ls_idbanco, ls_idcuenta, ls_emailtext, ls_email, ls_group
string 	ls_csvline, ls_csvacctype, ls_csvtrantype, ls_type_ach
Long 		ll_i, ll_csvfile
Double 	ld_batchid, ld_amount, ld_positiveamount, ld_totalamount
Datetime ld_tomorrow
boolean 	lb_onlyfile
Long 		ll_rows
Double	ld_hash, ld_totaldebits, ld_totalcredits
Long		ll_countdebits, ll_countcredits
String 	ls_nashamount, ls_checkDigit

String ls_batch_id

lb_onlyfile = false

ls_checkDigit = ''

Setpointer(HourGlass!)

ls_filepath = 'U:\ACHFiles\'
//ls_filepath = 'C:\Temp\Input\'

//*******************************************************************
//pbi 26316
if (ddlb_typeACH.text = '' ) then
	Messagebox("Error","Please select a generation type for the ACH.  DEPOSIT for all agencies first try, RETRY PYMT for all agencies retries",StopSign!)	
	return	
end if

//*******************************************************************

ld_batchid =  Double(trim(lb_batch.text))
ls_filename = trim(lb_batch.text)

ld_tomorrow = datetime(relativedate(today(),1),time('00:00:00'))

if upper(DayName(date(ld_tomorrow))) = 'SATURDAY' then
	ld_tomorrow = datetime(relativedate(today(),3),time('00:00:00'))	
end if

if isnull(ls_filename) or len(ls_filename) < 1 then
	Messagebox("Error","You must select a batch",StopSign!)	
	return
end if

dw_2.accepttext()

if cb_generate.text = "Close" then
	close(parent)
	return	
end if

ls_idbanco = dw_2.getitemstring(dw_2.getrow(),"id_banco")
ls_idcuenta = dw_2.getitemstring(dw_2.getrow(),"id_cuenta_banco")

if isnull(ls_idbanco) or len(ls_idbanco) < 1 then
	Messagebox("Error","You must select a bank",StopSign!)	
	return
end if

if isnull(ls_idcuenta) or len(ls_idcuenta) < 1 then
	Messagebox("Error","You must select an account",StopSign!)	
	return
end if

String ls_is_ach_bank, ls_bank_name
Boolean ld_uses_treasury

ld_uses_treasury = false

SELECT ISNULL(ach_banco,'N'), rtrim(name_banco), USES_TREASURY
  INTO :ls_is_ach_bank, :ls_bank_name, :ld_uses_treasury
  FROM dba.banco
 WHERE ID_BANCO = :ls_idbanco;




//// Temp - testing
//
//	if ld_uses_treasury then
//
//		DECLARE spGetACHsToTreasury PROCEDURE FOR dba.spGetACHsToTreasury :ld_batchid,  :ls_idbanco;
//
//		execute spGetACHsToTreasury;
//		if SQLCA.sqlcode <> 0 then	
//			Messagebox("Error Calling spGetACHsToTreasury",String(SQLCA.sqlcode) + ":" + SQLCA.SQLErrText)
//		end if
//			
//	end if	
//
//messagebox("ld_uses_treasury","Completed")
//return
//
//// Testing



if ls_is_ach_bank <> 'Y' then
	Messagebox("Error","This bank is not setup to receive ACH files",StopSign!)	
	return
end if


if cb_generate.text = "Generate File Again" then

	if Messagebox("Confirmation","This file was already exported to a bank, Exporting the file again will not affect credits already applied.~nDo you want to generate the file again?",Question!,YesNo!) <> 1 then
		Messagebox("Operation Canceled","File not generated",Exclamation!)
		return
	end if

	lb_onlyfile = true

elseif cb_generate.text = "Generate File" then
	
	//// Pendiente validar que no saquen el archivo yyyymmdd10 antes de la hora de conf. de cheques
	
	if Messagebox("Confirmation","Do you want to process the batch "+ls_filename+" for the bank "+ls_bank_name+"?",Question!,YesNo!) <> 1 then
		Messagebox("Operation Canceled","Batch not processed",Exclamation!)
		return		
	end if

end if


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// INICIA EL PROCESO
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

dw_2.update()



//()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()
// remove the checknumbers (checknumbers are used on RCC checks)
UPDATE dba.ACH_BATCH_DETAIL_BRANCH
SET ID_ED = null
WHERE batch_id = :ld_batchid
AND  ID_ED is not null;
//()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()



string ls_prefix, ls_fileext

ls_fileext = 'CSV'

ls_idbanco = trim(ls_idbanco)

if ld_uses_treasury then
	// no file should be generated!
	ls_prefix = "DO_NOT_USE_DATA_FOR_"+ls_idbanco+"EXPORTED_TO_TREASURY_SOFTWARE"
	ls_fileext = 'TXT'		
elseif ls_idbanco = 'BANKONE' then
	ls_prefix = "BANKONE_"
elseif left(ls_idbanco,2) = 'US' then
	ls_prefix = "USBANK_NACHA_"
	ls_fileext = 'ACH'	
//	add Midwest bank, csarmiento, 03/11/2014
elseif ls_idbanco = 'FIRST MIDWEST BANK' then
	ls_prefix = "FMWB_NACHA_"
	ls_fileext = 'ACH'	
elseif ls_idbanco = 'FIRST-VFS' then
	ls_prefix = "FMWB_FS_NACHA_"
	ls_fileext = 'ACH'	
elseif ls_idbanco = 'FIRST-VMSC' then
	ls_prefix = "FMW_MS_NACHA_"
	ls_fileext = 'ACH'	
//	add Midwest bank, csarmiento, 03/11/2014	
elseif ls_idbanco = 'MITCH' then
	ls_prefix = "MITCHELL_"
	ls_fileext = 'WRK'	
elseif ls_idbanco = 'BB&T' then
	ls_prefix = "BBT"	
	ls_fileext = 'ACH'	
elseif ls_idbanco = 'CHEVY' then
	ls_prefix = "SNET_"		
elseif ls_idbanco = 'B OF A' then
	ls_prefix = "BOA"	
	ls_fileext = 'ACH'
elseif Pos(ls_idbanco, 'ACTOR') > 0 then
	ls_prefix = ls_idbanco + "_"	
else
	Messagebox("Error","This bank is not setup to receive ACH files",StopSign!)	
	return	
end if

if lb_onlyfile = true then
	ls_prefix = '_DUP_'+ls_prefix
end if	
	
ll_csvfile = FileOpen(ls_filepath+ls_prefix+ls_filename+'.'+ls_fileext, LineMode!, Write!, LockWrite!, Replace!)

ld_totalamount = 0
ld_hash = 0
ld_totaldebits = 0
ld_totalcredits = 0

datetime ld_nextbusinessday

select dba.sfGetNextBusinessDay(getdate())
  into :ld_nextbusinessday
  from dba.dual;


String ls_fileseq	
ls_fileseq = char(double(right(trim(lb_batch.text),1)) + 65)	

// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// NACHA PARAMETERS
// ls_nachaimmediatedest: Immediate Destination
// ls_nachaimmediateorigin: Immediate Origin - The routing number of the sending point that is sending the file. The 10 character field begins with a blank followed by the 9 digit Routing number.

String ls_nachaimmediatedest, ls_nachaimmediateorigin, ls_nachadestinationname, ls_nachaoriginname
String ls_nachacompanyname, ls_nachafederaltaxid, ls_nachaentryclasscode, ls_nachaoriginatingdfi
String ls_nacheentrydesc
Long 	 ll_nachalines, ll_nachablocks

ll_nachalines = 0
ll_nachablocks = 0

SELECT SUM(convert(numeric(14,2),AMOUNT)), COUNT(*)
  INTO :ld_totaldebits, :ll_countdebits
  FROM DBA.ACH_BATCH_DETAIL_BRANCH
 WHERE AMOUNT >= 0
   AND BATCH_ID = :lb_batch.text;

SELECT SUM(convert(numeric(14,2),AMOUNT)), COUNT(*)
  INTO :ld_totalcredits, :ll_countcredits
  FROM DBA.ACH_BATCH_DETAIL_BRANCH
 WHERE AMOUNT < 0
   AND BATCH_ID = :lb_batch.text;

if ls_idbanco = 'USBANK' or ls_idbanco = 'US BANK FINANCIAL' or ls_idbanco = 'US ACH VFS' then
	
	ls_nachaimmediatedest   = " 042000013"						// Tamano = 10  Comenzando con ' '
	ls_nachaimmediateorigin = " 123000848"						// Tamano = 10  Comenzando con ' '
	ls_nachadestinationname = "US Bank                "   // Tamano = 23
	ls_nachaoriginname      = "Viamericas             "   // Tamano = 23
	ls_nachacompanyname     = "Viamericas Corp."          // Tamano = 16
	ls_nachafederaltaxid		= "1522225680"						// Tamano = 10  Comenzando con un '1'
	ls_nachaentryclasscode	= "PPD"								// Tamano = 3
	ls_nachaoriginatingdfi	= "04200001"						// Tamano = 8
	ls_nacheentrydesc			= "Deposit   "						// Tamano = 10
//	add Midwest bank, csarmiento, 03/11/2014
elseif ( ls_idbanco = 'FIRST MIDWEST BANK' ) then
	
	ls_nachaimmediatedest   = " 071901604"						// Tamano = 10  Comenzando con ' '
	ls_nachaimmediateorigin = " 071901604"						// Tamano = 10  Comenzando con ' '
	ls_nachadestinationname = "FIRST MIDWEST BANK     "   // Tamano = 23
	ls_nachaoriginname      = "Viamericas             "   // Tamano = 23
	ls_nachaentryclasscode	= "CCD"								// Tamano = 3
	ls_nachaoriginatingdfi	= "07190160"						// Tamano = 8
	ls_nacheentrydesc			= "Deposit   "						// Tamano = 10
	ls_nachacompanyname     = "Viamericas Corp."          // Tamano = 16
	ls_nachafederaltaxid		= "1522225680"						// Tamano = 10  Comenzando con un '1'			
	ls_checkDigit				= '4'				//this check digit is related to ls_nachaimmediatedest, so if change the need to create new functio  for FMWB
		
		
elseif ( ls_idbanco = 'FIRST-VFS' ) then
	ls_nachaimmediatedest   = " 071901604"						// Tamano = 10  Comenzando con ' '
	ls_nachaimmediateorigin = " 071901604"						// Tamano = 10  Comenzando con ' '
	ls_nachadestinationname = "FIRST MIDWEST BANK     "   // Tamano = 23
	ls_nachaoriginname      =  "Viamericas Financial   "   // Tamano = 23
	ls_nachaentryclasscode	= "CCD"								// Tamano = 3
	ls_nachaoriginatingdfi	= "07190160"						// Tamano = 8
	ls_nacheentrydesc			= "Deposit   "						// Tamano = 10
	ls_nachacompanyname     = "Via Financial S "          // Tamano = 16
	ls_nachafederaltaxid		= "1264026513"						// Tamano = 10  Comenzando con un '1'	
	ls_checkDigit				= '4'				//this check digit is related to ls_nachaimmediatedest, so if change the need to create new functio  for FMWB

elseif ( ls_idbanco = 'FIRST-VMSC' ) then
	ls_nachaimmediatedest   = " 071901604"						// Tamano = 10  Comenzando con ' '
	ls_nachaimmediateorigin = " 071901604"						// Tamano = 10  Comenzando con ' '
	ls_nachadestinationname = "FIRST MIDWEST BANK     "   // Tamano = 23
	ls_nachaoriginname      = "Viamericas Money Serv  "  // Tamano = 23
	ls_nachaentryclasscode	= "CCD"								// Tamano = 3
	ls_nachaoriginatingdfi	= "07190160"						// Tamano = 8
	ls_nacheentrydesc			= "Deposit   "						// Tamano = 10	
	ls_nachacompanyname     = "Via Money Serv  "          // Tamano = 16
	ls_nachafederaltaxid		= "1462269870"						// Tamano = 10  Comenzando con un '1'		
	ls_checkDigit				= '4'				//this check digit is related to ls_nachaimmediatedest, so if change the need to create new functio  for FMWB
	
//	add Midwest bank, csarmiento, 03/11/2014
	
	//specific info for accoutn
elseif ls_idbanco = 'BB&T' then

	ls_nachaimmediatedest   = " 053101121"						// Tamano = 10  Comenzando con ' '
	ls_nachaimmediateorigin = " 053101121"						// Tamano = 10  Comenzando con ' '
	ls_nachadestinationname = "BRANCH BANKING & TRUST "   // Tamano = 23
	ls_nachaoriginname      = "BRANCH BANKING & TRUST "   // Tamano = 23
	ls_nachacompanyname     = "VIAMERICAS CORP."          // Tamano = 16
	ls_nachafederaltaxid		= "1522225680"						// Tamano = 10
	ls_nachaentryclasscode	= "CCD"								// Tamano = 3
	ls_nachaoriginatingdfi	= "05310112"						// Tamano = 8
	ls_nacheentrydesc			= "DEPOSIT   "						// Tamano = 10
	
elseif ls_idbanco = 'B OF A' then
	
	ls_nachaimmediatedest   = " 121108250"						// Tamano = 9  
	ls_nachaimmediateorigin = "1522225680"						// Tamano = 10  
	ls_nachadestinationname = "BANK OF AMERICA        "   // Tamano = 23
	ls_nachacompanyname     = "VIAMERICAS CORP."          // Tamano = 16
	ls_nachaoriginname      = "VIAMERICAS CORP        "   // Tamano = 23
	ls_nachafederaltaxid		= "1522225680"						// Tamano = 10
	ls_nachaentryclasscode	= "CCD"								// Tamano = 3
	ls_nachaoriginatingdfi	= "12110825"						// Tamano = 8
	ls_nacheentrydesc			= "DEPOSIT   "						// Tamano = 10
	
	
end if
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

//*******************************************************************
//pbi 26316
if (ddlb_typeACH.text = '' ) then
	Messagebox("Error","Please select a generation type for the ACH.  DEPOSIT for all agencies first try, RETRY PYMT for all agencies retries",StopSign!)	
	return	
else
	ls_nacheentrydesc = ddlb_typeACH.text
end if

//*******************************************************************
//Product Backlog Item 27982:Actors Federal Credit Union - Create ACH CSV file format
if  Pos(ls_idbanco, 'ACTOR') > 0 Then
							
	String  receiver_name, receiver_id,routing,account, amount, eff_date, D_C, stype, addenda, ls_batchid, ls_company;
	
	ls_company = dw_1.getitemstring(1,"company")
	
	ls_batchid = trim(lb_batch.text);
	DECLARE spGetActorsReimbursement PROCEDURE FOR dba.spGetActorsReimbursement :ld_batchid,  :ls_idbanco, :ls_company;

	execute spGetActorsReimbursement;
	if SQLCA.sqlcode = 0 then	
		ls_csvline = 'RECEIVER_NAME,RECEIVER_ID,ROUTING_NUMBER,ACCOUNT_NUMBER,AMOUNT,EFF_DATE,D_C,TYPE,ADDENDA,'
		FileWrite(ll_csvfile,ls_csvline)
		fetch spGetActorsReimbursement into :receiver_name, :receiver_id, :routing, :account, :amount, :eff_date, :D_C, :stype, :addenda;
		DO WHILE sqlca.sqlcode = 0 
				ls_csvline = fn_completar_cadena(receiver_name,'D',' ',22) + ','
				ls_csvline = ls_csvline + fn_completar_cadena(receiver_id,'D',' ',15) + ','
				ls_csvline = ls_csvline + fn_completar_cadena(routing,'D',' ',9) + ','
				ls_csvline = ls_csvline + fn_completar_cadena(account,'D',' ',17) + ','
				ls_csvline = ls_csvline + fn_completar_cadena(amount,'D',' ',10) + ','
				ls_csvline = ls_csvline + fn_completar_cadena(eff_date,'D',' ',10) + ','
				ls_csvline = ls_csvline + fn_completar_cadena(D_C,'D',' ',6) + ','
				ls_csvline = ls_csvline + fn_completar_cadena(stype,'D',' ',3) + ','
				ls_csvline = ls_csvline + fn_completar_cadena(addenda,'D',' ',99) + ','

				FileWrite(ll_csvfile,ls_csvline)
		fetch spGetActorsReimbursement into :receiver_name, :receiver_id, :routing, :account, :amount, :eff_date, :D_C, :stype, :addenda;
		LOOP
	end if
				//cerramos el cursor
	close spGetActorsReimbursement;
	//FileClose(ll_csvfile)
	
	//Messagebox("File Generation Complete!","The file was generated again, CREDITS were not applied to the agencies.",Exclamation!)
	
	//return 
end if
//END: Product Backlog Item 27982:Actors Federal Credit Union - Create ACH CSV file format


// Encabezado del Archivo NACHA (GENERICO)
if ls_idbanco = 'USBANK' or ls_idbanco = 'US BANK FINANCIAL' or ls_idbanco = 'US ACH VFS'  or ls_idbanco = 'BB&T' or  ls_idbanco = 'FIRST MIDWEST BANK' or ls_idbanco = 'FIRST-VFS'  or  ls_idbanco = 'FIRST-VMSC' then	
	FileWrite(ll_csvfile,"101"+ls_nachaimmediatedest+ls_nachaimmediateorigin+string(today(),"YYMMDD")+string(now(),"HHMM")+ls_fileseq+"094101"+ls_nachadestinationname+ls_nachaoriginname+"00000000")
	FileWrite(ll_csvfile,"5200"+ls_nachacompanyname+"                    "+ls_nachafederaltaxid+ls_nachaentryclasscode+ls_nacheentrydesc+string(today(),"YYMMDD")+string(ld_nextbusinessday,"YYMMDD")+"   1"+ls_nachaoriginatingdfi+"0000001")	
	ll_nachalines = ll_nachalines + 2
elseif ls_idbanco = 'MITCH' then	

	if isnull(ld_totaldebits) then ld_totaldebits = 0
	if isnull(ld_totalcredits) then ld_totalcredits = 0
	
	if ld_totaldebits < ld_totalcredits then
		Messagebox("Cuidado","Los Creditos son mas altos que los debitos, es necesario corregir el ultimo registro de Viamericas y los totales!",Exclamation!)		
	end if

	FileWrite(ll_csvfile,"<ACHEditor>")
	FileWrite(ll_csvfile,"	<FileSpecs>")
	FileWrite(ll_csvfile,"		<Entry_x0020_Class>1</Entry_x0020_Class>")
	FileWrite(ll_csvfile,"		<Immediate_x0020_Destination_x0020_Name>Fed Chicago</Immediate_x0020_Destination_x0020_Name>")
	FileWrite(ll_csvfile,"		<Originating_x0020_DFI_x0020_Identification>07500056</Originating_x0020_DFI_x0020_Identification>")
	FileWrite(ll_csvfile,"		<Company_x0020_Entry_x0020_Description>Via-ACH</Company_x0020_Entry_x0020_Description>")
	FileWrite(ll_csvfile,"		<Company_x0020_Identification>143968</Company_x0020_Identification>")
	FileWrite(ll_csvfile,"		<Company_x0020_Name>Viamericas</Company_x0020_Name>")
	FileWrite(ll_csvfile,"		<Immediate_x0020_Origin>075000569</Immediate_x0020_Origin>")
	FileWrite(ll_csvfile,"		<Immediate_x0020_Destination>075000129</Immediate_x0020_Destination>")
	FileWrite(ll_csvfile,"		<Reference_x0020_Code />")
	FileWrite(ll_csvfile,"		<Immediate_x0020_Origin_x0020_Name>Mitchell Bank</Immediate_x0020_Origin_x0020_Name>")
	FileWrite(ll_csvfile,"	</FileSpecs>")
	FileWrite(ll_csvfile,"	<Batch_x0020_Totals>")
	FileWrite(ll_csvfile,"		<Batch>"+lb_batch.text+"</Batch>")
	FileWrite(ll_csvfile,"		<Credit_x0020_Count>"+string(ll_countcredits + 1)+"</Credit_x0020_Count>")
	FileWrite(ll_csvfile,"		<Credit_x0020_Total>"+string(abs(ld_totaldebits - ld_totalcredits),"###,###.00")+"</Credit_x0020_Total>")
	FileWrite(ll_csvfile," 		<Debit_x0020_Count>"+string(ll_countdebits)+"</Debit_x0020_Count>")
	FileWrite(ll_csvfile,"		<Debit_x0020_Total>"+string(ld_totaldebits,"###,###.00")+"</Debit_x0020_Total>")
	FileWrite(ll_csvfile,"	</Batch_x0020_Totals>")	
	
elseif ls_idbanco = 'B OF A' then
	FileWrite(ll_csvfile,"101"+ls_nachaimmediatedest+ls_nachaimmediateorigin+string(today(),"YYMMDD")+string(now(),"HHMM")+ls_fileseq+"094101"+ls_nachadestinationname+ls_nachaoriginname+"00000000")
	FileWrite(ll_csvfile,"5200"+ls_nachacompanyname+"                    "+ls_nachafederaltaxid+ls_nachaentryclasscode+ls_nacheentrydesc+string(today(),"YYMMDD")+string(ld_nextbusinessday,"YYMMDD")+"   1"+ls_nachaoriginatingdfi+"0000001")	
	
end if

ll_rows = dw_1.rowcount() 

//*****************************************************
//pbi 26316
if (ls_nacheentrydesc			= "DEPOSIT   " ) then
		String ls_message_previousACH =""
		For ll_i = 1 to dw_1.rowcount() 
			String ls_previousACH 
			ls_id_branch = dw_1.Object.data[ll_i,3]
			ld_amount = dw_1.Object.data[ll_i,7]
			
			 SELECT  dba.fnValBranchReturnedAch ( :ls_id_branch,:ld_amount )
				  into  :ls_previousACH
				 from  dba.dual;
		
			if ( not isnull(ls_previousACH)  ) then
				ls_previousACH = "Branch: "+ls_id_branch +" - Balance ref num:" +  fn_replace ( ls_previousACH,"-", " ; batch: ") + "~n"
				ls_message_previousACH = ls_message_previousACH + ls_previousACH
			end if
		next 
		if (ls_message_previousACH <> "") then
			if( Messagebox("Warning","The following branch's have returned ACH, please verify if they should be on the file to be generated ~n " + ls_message_previousACH + char(13)+"Do you want to continue?",Question!,YesNo!) <> 1 ) Then
				FileClose(ll_csvfile)
				return
			end if
		end if
end if
//******************************************************
	
For ll_i = 1 to dw_1.rowcount() 
	//actors already created the file at this point 
		
			ls_id_branch = dw_1.Object.data[ll_i,3]
			ls_group = dw_1.Object.data[ll_i,2]
			ls_type_ach = dw_1.Object.data[ll_i,9]
		
			SELECT NAME_BRANCH
			  INTO :ls_namebranch
			  FROM DBA.BRANCH
			 WHERE id_branch = :ls_id_branch;
		
			ld_amount = dw_1.Object.data[ll_i,7]
			
			
			if ld_amount >= 0 then
				// Debits
				ls_transactioncode = "27"
				ls_csvtrantype = 'D'		
				ls_transactionname = "Demand Auto Payment"
			else
				// Credits
				ls_transactioncode = "22"
				ls_csvtrantype = 'C'
				ls_transactionname = "Demand Auto Deposit"		
			end if
		
		
			// General Ledger accounts los transactions code son 42 y 47 en lugar de 22 y 27		
			if string(dw_1.Object.data[ll_i,4]) = 'G' then
				ls_transactioncode = string(double(ls_transactioncode) + 20 )
			end if
		
			ls_transactionname = ls_transactioncode + ' ' + ls_transactionname
		
			// Savings accounts los transactions code son 32 y 37 en lugar de 22 y 27
			if string(dw_1.Object.data[ll_i,4]) = 'S' then
				ls_transactioncode = string(double(ls_transactioncode) + 10 )
			end if		
		
			ld_positiveamount = abs(ld_amount)
			
			ld_totalamount += ld_positiveamount
			
			// Archivo CSV BONE
			// ID_BRANCH,NAME_BRANCH,ROUTING,ACCOUNT,AMOUNT,ACCTYPE(C/S),TRANTYPE(C/D)
		if	Pos(ls_idbanco, 'ACTOR') <= 0  then	
			
			ls_namebranch = fn_replace(ls_namebranch,",","")
			ls_namebranch = fn_replace(ls_namebranch,"("," ")
			ls_namebranch = fn_replace(ls_namebranch,")"," ")
			ls_namebranch = fn_replace(ls_namebranch,"/"," ")
			ls_namebranch = fn_replace(ls_namebranch,"."," ")
			ls_namebranch = fn_replace(ls_namebranch,"-"," ")
			ls_namebranch = fn_replace(ls_namebranch,"'"," ")
			ls_namebranch = fn_replace(ls_namebranch,"  "," ")
			ls_namebranch = fn_replace(ls_namebranch,"  "," ")
			
			ls_namebranch = trim(left(ls_namebranch,22))
			
			ls_csvline = trim(string(dw_1.Object.data[ll_i,3]))+","+ & 
							 trim(ls_namebranch)+","+ & 
							 trim(string(dw_1.Object.data[ll_i,5]))+","+ & 
							 trim(string(dw_1.Object.data[ll_i,6]))+","+ & 
							 trim(string(ld_positiveamount,"#########.00"))+","+ & 
							 trim(string(dw_1.Object.data[ll_i,4]))+","+ & 
							 ls_csvtrantype
		
			// SECURENET usa el mismo CSV pero lleva el nombre del banco al final
			if ls_idbanco = 'CHEVY' then
		
				String ls_bankname
				String ls_routing
				
				ls_routing = trim(string(dw_1.Object.data[ll_i,5]))
				
				SELECT isnull(BANK_NAME,"UNKNOWN")
				  INTO :ls_bankname
				  FROM dba.BANK_ROUTINGS
				 WHERE BANK_ROUTING = :ls_routing;
				
				ls_bankname = fn_replace(ls_bankname,",","")
				ls_bankname = fn_replace(ls_bankname,"("," ")
				ls_bankname = fn_replace(ls_bankname,")"," ")
				ls_bankname = fn_replace(ls_bankname,"/"," ")
				ls_bankname = fn_replace(ls_bankname,"."," ")
				ls_bankname = fn_replace(ls_bankname,"-"," ")
				ls_bankname = fn_replace(ls_bankname,"'"," ")
				ls_bankname = fn_replace(ls_bankname,"  "," ")
				ls_bankname = fn_replace(ls_bankname,"  "," ")		
				
				ls_csvline = ls_csvline + "," + ls_bankname
				
			end if		
			
			if ls_idbanco = 'USBANK' or ls_idbanco = 'US BANK FINANCIAL' or ls_idbanco = 'US ACH VFS' or ls_idbanco = 'BB&T' or ls_idbanco =  'B OF A'  or ls_idbanco = 'FIRST MIDWEST BANK' or ls_idbanco = 'FIRST-VFS'  or  ls_idbanco = 'FIRST-VMSC'  then	
				
				ls_nashamount	=	string(( ld_positiveamount*100 ),"##########")
		
				ls_csvline = '6' + &
								 fn_completar_cadena(ls_transactioncode,'D','0',2) + &
								 fn_completar_cadena(trim( fn_replace(string(dw_1.Object.data[ll_i,5]), '~r','')),'I','0',9) + &
								 fn_completar_cadena(trim(string(dw_1.Object.data[ll_i,6])),'D',' ',17) + &
								 fn_completar_cadena(trim(ls_nashamount),'I','0',10) + &
								 fn_completar_cadena(trim(string(dw_1.Object.data[ll_i,3])),'D',' ',15) + &
								 fn_completar_cadena(trim(ls_namebranch),'D',' ',22) + &
								 '  0'+ls_nachaoriginatingdfi+ &
								 fn_completar_cadena(string(ll_i),'I','0',7)		
			
				ld_hash = ld_hash + double(left(string(dw_1.Object.data[ll_i,5]),8))
					
			end if	
			
			
			if ls_idbanco = 'MITCH' then
		
				//Mitchell se refleja el mismo dia que se corre
				ld_tomorrow = datetime(today(),time('00:00:00'))
		
				ls_namebranch = fn_getbranchname(dw_1.Object.data[ll_i,3])
				
				ls_namebranch = fn_replace(ls_namebranch,"&",'')
				ls_namebranch = fn_replace(ls_namebranch,"'",'')
				ls_namebranch = fn_replace(ls_namebranch,"-",'')
				ls_namebranch = fn_replace(ls_namebranch,"#",'')		
				ls_namebranch = fn_replace(ls_namebranch,"@",'')
				ls_namebranch = fn_replace(ls_namebranch,"@",'')
				ls_namebranch = fn_replace(ls_namebranch,"  ",' ')
		
				FileWrite(ll_csvfile,"	<ACHEditorTable>")
				FileWrite(ll_csvfile,"		<Hold/>")
				FileWrite(ll_csvfile,"		<Batch>"+lb_batch.text+"</Batch>")
				FileWrite(ll_csvfile,"		<Company_x0020_Name>"+ls_namebranch+"</Company_x0020_Name>")
				FileWrite(ll_csvfile,"		<Account>"+trim(string(dw_1.Object.data[ll_i,6]))+"</Account>")
				FileWrite(ll_csvfile,"		<Identification>"+trim(string(dw_1.Object.data[ll_i,3]))+"</Identification>")
				FileWrite(ll_csvfile,"		<Discretionary/>")
				FileWrite(ll_csvfile,"		<Amount>"+String(ld_positiveamount,"###,##0.00")+"</Amount>")
				FileWrite(ll_csvfile,"		<Routing_x002F_Transit>"+trim(string(dw_1.Object.data[ll_i,5]))+"</Routing_x002F_Transit>")
				FileWrite(ll_csvfile,"		<Effective_x0020_Date>"+String(today(),"mm/dd/yyyy")+"</Effective_x0020_Date>")
				FileWrite(ll_csvfile,"		<Transaction_x0020_Code>"+ls_transactionname+"</Transaction_x0020_Code>")
				FileWrite(ll_csvfile,"		<Free_x0020_Form_x0020_Addenda/>")
				FileWrite(ll_csvfile,"		<Sequence>"+String(ll_i)+"</Sequence>")
				FileWrite(ll_csvfile,"	</ACHEditorTable>")
		
			end if
			
			if not ls_idbanco = 'MITCH' then
				FileWrite(ll_csvfile,ls_csvline)
				ll_nachalines++				
			end if
			
		end if
		
	// --------------------------------------------------------------------------
	// Grabar las transacciones a la agencia
	if ld_amount <> 0 AND lb_onlyfile = FALSE then
		
		Double ld_cons, ld_debit, ld_credit
		Datetime ld_now
		String ls_desc, ls_desc1
			
		SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1
		INTO :ld_cons
		FROM dba.transaccion_diaria_payee;
			
		if isnull(ld_cons) then ld_cons = 1		
			
		ld_now = datetime(today(),now())
		
		if ld_amount >= 0 then
			// Credit
			ls_desc = "ACH CREDIT " + string(today(),'mm/dd/yyyy')
			ld_debit = 0
			ld_credit = ld_positiveamount
		else
			// Debits
			ls_desc = "ACH DEBIT " + string(today(),'mm/dd/yyyy')
			ld_debit = ld_positiveamount
			ld_credit = 0
		end if
					
		ls_desc1 = "ACH FROM BATCH " + string(ld_batchid)
		
		if ls_type_ach = "E" then
			ls_desc = fn_replace(ls_desc,"ACH","E-CHECK")
			ls_desc1 = fn_replace(ls_desc1,"ACH","E-CHECK")
		end if		
		
		  INSERT INTO dba.TRANSACCION_DIARIA_PAYEE  
					( CONS_TRANS_DIARIA,   
					  ID_GROUP_TRANS_DIARIA,   
					  DATE_TRANS_DIARIA,   
					  HOUR_TRANS_DIARIA,   
					  ID_CONCEPTO_CONTABLE,   
					  DES_TRANS_DIARIA,   
					  DEBIT_TRANS_DIARIA,   
					  CREDIT_TRANS_DIARIA,   
					  BALANCE_TRANS_DIARIA,   
					  DESCRIPCION_SUSPENSE,   
					  LINK_REFERENCE,   
					  DESC_TRANS_DIARIA1,   
					  DATE_SYSTEM,   
					  ID_CASHIER,   
					  TOTAL_AMOUNT,   
					  BNKID,   
					  NUM_WIRETRANSFER)
		  VALUES ( :ld_cons,   
					  :ls_group,   
					  :ld_now,   
					  :ld_now,   
					  'ACH',   
					  :ls_desc,   
					  :ld_debit,   
					  :ld_credit,   
					  0,   
					  NULL,   
					  NULL,   
					  :ls_desc1,   
					  :ld_now,   
					  :gs_cashier,   
					  NULL,   
					  NULL,   
					  NULL )  ;	
		
			if sqlca.sqlcode <> 0 then
				Messagebox("Error Inserting Transaccion Diaria Payer",SQLCA.SQLErrText)			
				return
			end if
		
		
		  INSERT INTO dba.TRANSACCION_DIARIA_BANCO_PAYEE  
					( CONS_TRANS_DIARIA,   
					  ID_BANCO,   
					  ID_CUENTA_BANCO,   
					  DEPOSIT_CODE,   
					  RECONCILIATIONDATE,   
					  DATE_TRANS_DIARIA )  
		  VALUES ( :ld_cons,   
					  :ls_idbanco,   
					  :ls_idcuenta,   
					  NULL,   
					  :ld_tomorrow,
					  :ld_now )  ;
			
			if sqlca.sqlcode <> 0 then
				Messagebox("Error Inserting Transaccion Diaria Banco Payer",SQLCA.SQLErrText)			
				return
			end if

	end if
	// --------------------------------------------------------------------------

next


IF lb_onlyfile = FALSE THEN
	// Actualiza el Status del batch
	UPDATE DBA.ACH_BATCH SET BATCH_STATUS = 'AD' WHERE BATCH_ID = :ld_batchid;
	
	if ld_uses_treasury then

		// Loads the data into Treasury Software Table
		fn_GetACHsToTreasury(ls_idbanco,ld_batchid)

	end if	

END IF

//SELECT SUM(convert(numeric(14,2),AMOUNT)), COUNT(*)
//INTO :ld_totaldebits, :ll_countdebits
//FROM DBA.ACH_BATCH_DETAIL_BRANCH
//WHERE AMOUNT >= 0
//AND BATCH_ID = :lb_batch.text;
//
//SELECT SUM(convert(numeric(14,2),AMOUNT)), COUNT(*)
//INTO :ld_totalcredits, :ll_countcredits
//FROM DBA.ACH_BATCH_DETAIL_BRANCH
//WHERE AMOUNT < 0
//AND BATCH_ID = :lb_batch.text;

//convert(numeric(14,2),dba.ACH_BATCH_DETAIL_BRANCH.AMOUNT)

// Final del Archivo NACHA


//csarmiento: 04/14/2014
//added this becuase FMWB request balance files 
//fn_completar_cadena(trim(string(( ld_totalcredits*100 ),"##########")),'I','0',12)
if ls_idbanco = 'FIRST MIDWEST BANK' or ls_idbanco = 'FIRST-VFS'  or  ls_idbanco = 'FIRST-VMSC'  then	
	
		if isnull(ld_totaldebits) then ld_totaldebits = 0
		if isnull(ld_totalcredits) then ld_totalcredits = 0
		
		
		if (abs(ld_totalcredits ) > 0 ) then
			ls_csvline = '6' + &
								 fn_completar_cadena('27','D','0',2) + &
								 fn_completar_cadena(trim(string(ls_nachaoriginatingdfi)),'I','0',8) + &
								 fn_completar_cadena(trim(ls_checkDigit) ,'I','0',1) + &
								 fn_completar_cadena(trim(ls_idcuenta) ,'I','0',17) + &
								 fn_completar_cadena(trim(string(( abs(ld_totalcredits ) *100 ),"##########")),'I','0',10) + &
								 fn_completar_cadena(trim(''),'D',' ',15) + &
								 fn_completar_cadena(trim(ls_nachaoriginname),'D',' ',22) + &
								 fn_completar_cadena(trim(''),'D',' ',2) + &						 
								 '0'+ &
								  fn_completar_cadena(trim(string(ls_nachaoriginatingdfi)),'I','0',8) + &
								 fn_completar_cadena(( + string(ll_i)),'I','0',7)		
				
				ld_hash = ld_hash + double(left(string(ls_nachaoriginatingdfi),8))
				FileWrite(ll_csvfile,ls_csvline)
				//ll_i = ll_i +1 
			end if 
			//fn_completar_cadena(trim(string(( ld_totaldebits*100 ),"##########")),'I','0',12)
			if (ld_totaldebits > 0 ) then
				
				ls_csvline = '6' + &
								 fn_completar_cadena('22','D','0',2) + &
								 fn_completar_cadena(trim(string(ls_nachaoriginatingdfi)),'I','0',8) + &
								 fn_completar_cadena(trim(ls_checkDigit) ,'I','0',1) + &
								 fn_completar_cadena(trim(ls_idcuenta) ,'I','0',17) + &
								 fn_completar_cadena(trim(string(( ld_totaldebits*100 ),"##########")),'I','0',10) + &
								 fn_completar_cadena(trim(''),'D',' ',15) + &
								 fn_completar_cadena(trim(ls_nachaoriginname),'D',' ',22) + &
								 fn_completar_cadena(trim(''),'D',' ',2) + &						 
								 '0'+ &
								  fn_completar_cadena(trim(string(ls_nachaoriginatingdfi)),'I','0',8) + &
								 fn_completar_cadena(( + string(ll_i)),'I','0',7)		
				ld_hash = ld_hash + double(left(string(ls_nachaoriginatingdfi),8))
				FileWrite(ll_csvfile,ls_csvline)
			end if	
	     
end if



//end csarmiento: 04/14/2014


if ls_idbanco = 'USBANK' or ls_idbanco = 'US BANK FINANCIAL' or ls_idbanco = 'US ACH VFS' or ls_idbanco = 'BB&T' or  ls_idbanco =  'B OF A' or  ls_idbanco = 'FIRST MIDWEST BANK' or ls_idbanco = 'FIRST-VFS'  or  ls_idbanco = 'FIRST-VMSC'  then	

	// las dos que faltan!
	ll_nachalines = ll_nachalines + 2

	ll_nachablocks = truncate(ll_nachalines/10,0)
	
	if Mod(ll_nachalines, 10) <> 0 then 	// Evita aumentar el bloque cuando el archivo es preciso (ej: 60 lineas)
		ll_nachablocks++
	end if
	
	//csarmiento
	if  ls_idbanco = 'FIRST MIDWEST BANK' or ls_idbanco = 'FIRST-VFS'  or  ls_idbanco = 'FIRST-VMSC'  then	
		ll_rows = ll_i
		//the received ionly balance files
		long ld_initial_totaldebits 
		
		ld_initial_totaldebits = ld_totaldebits
		ld_totaldebits = ld_totaldebits + ld_totalcredits
		ld_totalcredits = ld_totalcredits + ld_initial_totaldebits 
	end if
	//	end csarmiento: 04/14/2014
	 ld_totaldebits = abs(ld_totaldebits)
	 ld_totalcredits =abs(ld_totalcredits)		
		
	FileWrite(ll_csvfile,"8200"+fn_completar_cadena(trim(string(ll_rows)),'I','0',6)+fn_completar_cadena(right(string(ld_hash),10),'I','0',10)+fn_completar_cadena(trim(string(( ld_totaldebits*100 ),"##########")),'I','0',12)+fn_completar_cadena(trim(string(( ld_totalcredits*100 ),"##########")),'I','0',12)+ls_nachafederaltaxid+"                         "+ls_nachaoriginatingdfi+"0000001")
	FileWrite(ll_csvfile,"9000001"+fn_completar_cadena(trim(string(ll_nachablocks)),'I','0',6)+fn_completar_cadena(trim(string(ll_rows)),'I','0',8)+fn_completar_cadena(right(string(ld_hash),10),'I','0',10)+fn_completar_cadena(trim(string(( ld_totaldebits*100 ),"##########")),'I','0',12)+fn_completar_cadena(trim(string(( ld_totalcredits*100 ),"##########")),'I','0',12)+"                                       ")		

	
	DO UNTIL Mod(ll_nachalines, 10) = 0
		FileWrite(ll_csvfile,"9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999")	
		ll_nachalines++
	LOOP
	
end if

// Generacion del archivo Mitchell
if ls_idbanco = 'MITCH' then
	
//	if isnull(ld_totaldebits) then ld_totaldebits = 0
//	if isnull(ld_totalcredits) then ld_totalcredits = 0
//	
//	if ld_totaldebits < ld_totalcredits then
//		Messagebox("Cuidado","Los Creditos son mas altos que los debitos, es necesario corregir el ultimo registro de Viamericas y los totales!",Exclamation!)		
//	end if	
	
//	String ls_reading, ls_writting
//	Long ll_reading, ll_filereading
//	
//	FileDelete("U:\ACHFiles\Temp_Mitchell.tmp")	
//	dw_1.saveas("U:\ACHFiles\Temp_Mitchell.tmp", XML!, FALSE)
//	ll_filereading = FileOpen("U:\ACHFiles\Temp_Mitchell.tmp",LineMode!, Read!, LockRead!)
//	
//	// La primera linea (!XML) se elimina
//	ll_reading  = FileRead(ll_filereading, ls_reading)
//
//	// Escribe la primera linea (<ACHEditor>)
//	ll_reading  = FileRead(ll_filereading, ls_reading)
//	FileWrite(ll_csvfile,ls_reading)	
//
//	// Escribe el header y los totales	
//	FileWrite(ll_csvfile,"	<FileSpecs>")
//	FileWrite(ll_csvfile,"		<Entry_x0020_Class>1</Entry_x0020_Class>")
//	FileWrite(ll_csvfile,"		<Immediate_x0020_Destination_x0020_Name>Fed Chicago</Immediate_x0020_Destination_x0020_Name>")
//	FileWrite(ll_csvfile,"		<Originating_x0020_DFI_x0020_Identification>07500056</Originating_x0020_DFI_x0020_Identification>")
//	FileWrite(ll_csvfile,"		<Company_x0020_Entry_x0020_Description>Via-ACH</Company_x0020_Entry_x0020_Description>")
//	FileWrite(ll_csvfile,"		<Company_x0020_Identification>143968</Company_x0020_Identification>")
//	FileWrite(ll_csvfile,"		<Company_x0020_Name>Viamericas</Company_x0020_Name>")
//	FileWrite(ll_csvfile,"		<Immediate_x0020_Origin>075000569</Immediate_x0020_Origin>")
//	FileWrite(ll_csvfile,"		<Immediate_x0020_Destination>075000129</Immediate_x0020_Destination>")
//	FileWrite(ll_csvfile,"		<Reference_x0020_Code />")
//	FileWrite(ll_csvfile,"		<Immediate_x0020_Origin_x0020_Name>Mitchell Bank</Immediate_x0020_Origin_x0020_Name>")
//	FileWrite(ll_csvfile,"	</FileSpecs>")
//	FileWrite(ll_csvfile,"	<Batch_x0020_Totals>")
//	FileWrite(ll_csvfile,"		<Batch>"+lb_batch.text+"</Batch>")
//	FileWrite(ll_csvfile,"		<Credit_x0020_Count>"+string(ll_countcredits + 1)+"</Credit_x0020_Count>")
//	FileWrite(ll_csvfile,"		<Credit_x0020_Total>"+string(abs(ld_totaldebits - ld_totalcredits),"###,###.00")+"</Credit_x0020_Total>")
//	FileWrite(ll_csvfile," 		<Debit_x0020_Count>"+string(ll_countdebits)+"</Debit_x0020_Count>")
//	FileWrite(ll_csvfile,"		<Debit_x0020_Total>"+string(ld_totaldebits,"###,###.00")+"</Debit_x0020_Total>")
//	FileWrite(ll_csvfile,"	</Batch_x0020_Totals>")
//
//	// Escribe las demas lineas
//	ll_reading  = FileRead(ll_filereading, ls_reading)	
//	DO WHILE ll_reading > 0 and trim(ls_reading) <> '</ACHEditor>'	
//		FileWrite(ll_csvfile,ls_reading)		
//		ll_reading  = FileRead(ll_filereading, ls_reading)
//	LOOP
//	
//	// Escribe el Credito Viamericas	
//	FileWrite(ll_csvfile,"	<ACHEditorTable>")
//	FileWrite(ll_csvfile,"		<Hold />")
//	FileWrite(ll_csvfile,"		<Batch>"+lb_batch.text+"</Batch>")
//	FileWrite(ll_csvfile,"		<Company_x0020_Name>VIAMERICAS CORP</Company_x0020_Name>")
//	FileWrite(ll_csvfile,"		<Account>143968</Account>")
//	FileWrite(ll_csvfile,"		<Identification>522225680</Identification>")
//	FileWrite(ll_csvfile,"		<Discretionary />")
//	FileWrite(ll_csvfile,"		<Amount>"+string(abs(ld_totaldebits - ld_totalcredits),"###,###.00")+"</Amount>")
//	FileWrite(ll_csvfile,"		<Routing_x002F_Transit>075000569</Routing_x002F_Transit>")
//	//FileWrite(ll_csvfile,"		<Effective_x0020_Date>"+string(ld_nextbusinessday,"MM/DD/YYYY")+"</Effective_x0020_Date>")
//	FileWrite(ll_csvfile,"		<Effective_x0020_Date>"+string(today(),"MM/DD/YYYY")+"</Effective_x0020_Date>")	
//	FileWrite(ll_csvfile,"		<Transaction_x0020_Code>22 Demand Auto Deposit</Transaction_x0020_Code>")
//	FileWrite(ll_csvfile,"		<Free_x0020_Form_x0020_Addenda />")
//	FileWrite(ll_csvfile,"		<Sequence>"+string(ll_countcredits + ll_countdebits + 1)+"</Sequence>")
//	FileWrite(ll_csvfile,"	</ACHEditorTable>")	
//	
//	// Escribe la Ultima Linea
//	FileWrite(ll_csvfile,'</ACHEditor>')		
//	FileClose(ll_filereading)	
//
//	FileDelete("U:\ACHFiles\Temp_Mitchell.tmp")


// NUEVO:

	// Escribe el Credito Viamericas	
	FileWrite(ll_csvfile,"	<ACHEditorTable>")
	FileWrite(ll_csvfile,"		<Hold />")
	FileWrite(ll_csvfile,"		<Batch>"+lb_batch.text+"</Batch>")
	FileWrite(ll_csvfile,"		<Company_x0020_Name>VIAMERICAS CORP</Company_x0020_Name>")
	FileWrite(ll_csvfile,"		<Account>143968</Account>")
	FileWrite(ll_csvfile,"		<Identification>522225680</Identification>")
	FileWrite(ll_csvfile,"		<Discretionary />")
	FileWrite(ll_csvfile,"		<Amount>"+string(abs(ld_totaldebits - ld_totalcredits),"###,###.00")+"</Amount>")
	FileWrite(ll_csvfile,"		<Routing_x002F_Transit>075000569</Routing_x002F_Transit>")
	FileWrite(ll_csvfile,"		<Effective_x0020_Date>"+string(today(),"MM/DD/YYYY")+"</Effective_x0020_Date>")	
	FileWrite(ll_csvfile,"		<Transaction_x0020_Code>22 Demand Auto Deposit</Transaction_x0020_Code>")
	FileWrite(ll_csvfile,"		<Free_x0020_Form_x0020_Addenda />")
	FileWrite(ll_csvfile,"		<Sequence>"+string(ll_countcredits + ll_countdebits + 1)+"</Sequence>")
	FileWrite(ll_csvfile,"	</ACHEditorTable>")	

	FileWrite(ll_csvfile,"</ACHEditor>")	

end if

commit;

FileClose(ll_csvfile)

IF lb_onlyfile = FALSE THEN
	Messagebox("Process Complete","The Files had been generated to the Public Folder, The total amount is $"+String(ld_totalamount,"######,###.00"))
ELSE
	Messagebox("File Generation Complete!","The file was generated again, CREDITS were not applied to the agencies.",Exclamation!)
END IF
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

IF lb_onlyfile = FALSE THEN
	parent.wf_refreshscreen()
end if


Setpointer(Arrow!)
end event

