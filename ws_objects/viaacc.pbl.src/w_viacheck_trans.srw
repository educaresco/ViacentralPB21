$PBExportHeader$w_viacheck_trans.srw
forward
global type w_viacheck_trans from wb_report
end type
type cb_selectfile from commandbutton within w_viacheck_trans
end type
type sle_filepath from singlelineedit within w_viacheck_trans
end type
type cb_saveandprocess from commandbutton within w_viacheck_trans
end type
type sle_filename from singlelineedit within w_viacheck_trans
end type
type tab1 from tab within w_viacheck_trans
end type
type tp from userobject within tab1
end type
type cb_ok from commandbutton within tp
end type
type dw_2 from datawindow within tp
end type
type tp from userobject within tab1
cb_ok cb_ok
dw_2 dw_2
end type
type tab1 from tab within w_viacheck_trans
tp tp
end type
end forward

global type w_viacheck_trans from wb_report
integer width = 3767
integer height = 1944
string title = "ViaCheck Transactions"
long backcolor = 80269524
cb_selectfile cb_selectfile
sle_filepath sle_filepath
cb_saveandprocess cb_saveandprocess
sle_filename sle_filename
tab1 tab1
end type
global w_viacheck_trans w_viacheck_trans

type variables

end variables

forward prototypes
public subroutine fn_loadfile ()
public subroutine fn_processfile ()
end prototypes

public subroutine fn_loadfile ();String ls_filename, ls_cadena, ls_transmissiondepositid, ls_location, ls_status, ls_importedname
String ls_amount
Integer li_rtn, li_FileNum
Long ll_fileread, ll_row, ll_count
Boolean lb_ishistorical, lb_ishistoricalnewver
Datetime ld_date_trans, ld_received, ld_efectivedate
Double ld_amount, ld_batchcount, ld_itemcount, ld_cons_trans_credit, ld_cons_trans_debit
string ls_cutoff, ls_user, ls_received_tmp
int li_fileversion

li_fileversion = 1

SetPointer(HourGlass!)

SELECT min(dba.ACC_PARAMETERS.VIACHECK_CLOSETIME)
  INTO :ls_cutoff  
  FROM dba.ACC_PARAMETERS;
  
SELECT SYSTEM_USER
  INTO :ls_user
  FROM dba.DUAL;

dw_1.reset()
ll_row = 1

ls_filename = sle_filepath.text

ls_importedname = sle_filename.text

if trim(ls_importedname) = "" then
	Messagebox("Error","No File selected!.",StopSign!)
	return
end if


SELECT count(*)
  INTO :ll_count
  FROM DBA.VIACHECK_TRANS
 WHERE IMPORTEDNAME = :ls_importedname;

if ll_count > 0 then
	Messagebox("Error","This file was already processed, File name must be unique.",StopSign!)
	sle_filepath.text = ""
	sle_filename.text = ""
	return
end if

li_FileNum = FileOpen(ls_filename,LineMode!, Read!, LockRead!)

ll_fileread = FileRead(li_FileNum, ls_cadena)

if trim(ls_cadena) = "Date,TransmissionDepositID,Location,Type,Received,Amount,BatchCount,ItemCount,Status" then
	lb_ishistorical = true
	lb_ishistoricalnewver = false
	li_fileversion = 1
elseif trim(ls_cadena) = "Date,ReportGenerationTime,TransmissionDepositID,Location,Type,Amount,BatchCount,ItemCount,Status,Received" then
	lb_ishistorical = false
	lb_ishistoricalnewver = false
	li_fileversion = 2
elseif trim(ls_cadena) = "StartDate,EndDate,TransmissionDepositID,Location,Type,Received,Amount,BatchCount,ItemCount,Status" then
	lb_ishistorical = true
	lb_ishistoricalnewver = true	
	li_fileversion = 3
elseif trim(ls_cadena) = "StartDate,EndDate,TransmissionDepositID,Location,Type,Account,Serial,Received,Amount,BatchCount,ItemCount,Status" then		
	// Updated file 09/20/2010
	
	li_fileversion = 4
		
else 
	Messagebox("File Error","This file is not a valid transaction file",StopSign!)
	FileClose(li_FileNum)
	return	
end if

ll_fileread = FileRead(li_FileNum, ls_cadena)

DO WHILE ll_fileread > 0 and trim(ls_cadena) <> ''
	ls_cadena = upper(ls_cadena)


	// ????????????????????????????????????????????????????????????????????????????????????????????????????????????
	// Remueve las COMAS que se encuentren entre comillas, ejemplo "$5,200.00", queda como "$5200.00"
	// Puede mejorarse fn_token
	long pos1, pos2

	pos1 = pos(ls_cadena,char(34),1)
	pos2 = pos(ls_cadena,char(34),pos1+1)
	
	do while pos1 < pos2
		ls_cadena = fn_replace(ls_cadena,mid(ls_cadena,pos1,pos2 - pos1 + 1),fn_replace(mid(ls_cadena,pos1,pos2 - pos1 + 1),",",""))

		pos2 = pos(ls_cadena,char(34),pos1+1) // Encuentra el nuevo pos2 (re redujo por las comas menos)		
		pos1 = pos(ls_cadena,char(34),pos2+1)
		if pos1 = 0 then
			pos2 = 0
		else
			pos2 = pos(ls_cadena,char(34),pos1+1)	
		end if
		
	loop	
	// ????????????????????????????????????????????????????????????????????????????????????????????????????????????
		
		if li_fileversion < 4 then
			
		if lb_ishistorical then
			if lb_ishistoricalnewver  then
				//"StartDate,EndDate,TransmissionDepositID,Location,Type,Received,Amount,BatchCount,ItemCount,Status"
				
				ls_transmissiondepositid = fn_token(ls_cadena,",",3)
				ls_received_tmp = fn_token(ls_cadena,",",6)			
				ld_date_trans = datetime(date(left(ls_received_tmp,pos(ls_received_tmp," ") - 1)),time("00:00:00"))
				
				ls_location = fn_token(ls_cadena,",",4)
				ls_amount = fn_token(ls_cadena,",",7)
				ld_batchcount = double(fn_token(ls_cadena,",",8))
				ld_itemcount = double(fn_token(ls_cadena,",",9))
				ls_status = fn_token(ls_cadena,",",10)
							
				ld_received = datetime(date(ld_date_trans),time( mid(ls_received_tmp,pos(ls_received_tmp," "))   ))			
			else
				//"Date,TransmissionDepositID,Location,Type,Received,Amount,BatchCount,ItemCount,Status"
				ls_transmissiondepositid = fn_token(ls_cadena,",",2)
				ld_date_trans = datetime(date(fn_token(ls_cadena,",",1)),time("00:00:00"))
				ls_location = fn_token(ls_cadena,",",3)
				ls_amount = fn_token(ls_cadena,",",6)
				ld_batchcount = double(fn_token(ls_cadena,",",7))
				ld_itemcount = double(fn_token(ls_cadena,",",8))
				ls_status = fn_token(ls_cadena,",",9)
				ld_received = datetime(date(ld_date_trans),time(fn_token(ls_cadena,",",5)))
			end if
		else
			//"Date,ReportGenerationTime,TransmissionDepositID,Location,Type,Amount,BatchCount,ItemCount,Status,Received"
			ls_transmissiondepositid = fn_token(ls_cadena,",",3)
			ld_date_trans = datetime(date(fn_token(ls_cadena,",",1)),time("00:00:00"))
			ls_location = fn_token(ls_cadena,",",4)
			ls_amount = fn_token(ls_cadena,",",6)
			ld_batchcount = double(fn_token(ls_cadena,",",7))
			ld_itemcount = double(fn_token(ls_cadena,",",8))
			ls_status = fn_token(ls_cadena,",",9)
			ld_received = datetime(date(ld_date_trans),time(fn_token(ls_cadena,",",10)))	
		end if
		
	elseif li_fileversion = 4 then
		//1             2           3                                4           5       6          7        8            9          10              11             12
		//StartDate,EndDate,TransmissionDepositID,Location,Type,Account,Serial,Received,Amount,BatchCount,ItemCount,Status
		
			ls_transmissiondepositid = fn_token(ls_cadena,",",3)
			
			ls_received_tmp = fn_token(ls_cadena,",",8)			
			ld_date_trans = datetime(date(left(ls_received_tmp,pos(ls_received_tmp," ") - 1)),time("00:00:00"))
			
			ls_location = fn_token(ls_cadena,",",4)
			ls_amount = fn_token(ls_cadena,",",9)
			ld_batchcount = double(fn_token(ls_cadena,",",10))
			ld_itemcount = double(fn_token(ls_cadena,",",11))
			ls_status = fn_token(ls_cadena,",",12)

			ld_received = datetime(date(ld_date_trans),time( mid(ls_received_tmp,pos(ls_received_tmp," "))   ))	
		
	else
		
		Messagebox("File Error","This file is not a valid transaction file",StopSign!)
		FileClose(li_FileNum)
		return	
		
	end if
	

	ls_location = upper(ls_location)
	ls_location = fn_replace(ls_location,'A6','A0')
	ls_location = fn_replace(ls_location,'VIACASH-','')	
	
	ls_amount = fn_replace(ls_amount,char(34),"")
	ls_amount = fn_replace(ls_amount,"$","")
	ld_amount = double(ls_amount)

	///// revisar
	String ls_isbusinessday	

	SELECT dba.sfGetIsBusinessDay(:ld_date_trans)
	  INTO :ls_isbusinessday
	  FROM dba.DUAL;

	ld_efectivedate = datetime(date(ld_date_trans),time("00:00:00"))

	// Si es de un fin de semana la transacion aplica el lunes independiente de la hora
	IF ls_isbusinessday = 'N' THEN
		ld_efectivedate = datetime(date(fn_getnextbusinessdate(string(ld_efectivedate,'mm/dd/yyyy'))),time("00:00:00"))
	else			
		// Si entro despues de la hora de corte la adiciona un dia habil
		if time(ld_received) >= time(ls_cutoff) then		
			ld_efectivedate = datetime(date(fn_getnextbusinessdate(string(ld_efectivedate,'mm/dd/yyyy'))),time("00:00:00"))
		end if
	end if	

	dw_1.insertrow(ll_row)

	dw_1.setitem(ll_row,"transmissiondepositid",ls_transmissiondepositid)
	dw_1.setitem(ll_row,"date_trans",ld_date_trans)
	dw_1.setitem(ll_row,"location",ls_location)
	dw_1.setitem(ll_row,"amount",ld_amount)
	dw_1.setitem(ll_row,"batchcount",ld_batchcount)
	dw_1.setitem(ll_row,"itemcount",ld_itemcount)
	dw_1.setitem(ll_row,"status",ls_status)
	dw_1.setitem(ll_row,"received",ld_received)
	dw_1.setitem(ll_row,"efectivedate",ld_efectivedate)
	dw_1.setitem(ll_row,"importedname",ls_importedname)
	dw_1.setitem(ll_row,"importedby",upper(ls_user))
	dw_1.setitem(ll_row,"importedtime",datetime(today(),now()))
	
	dw_1.setitem(ll_row,"dummy2","N")	
	
	if ld_itemcount = 0 then
	
		dw_1.setitem(ll_row,"dummy1","-NO ITEMS-")

	else
	
		ll_count = 0
		SELECT COUNT(*)
		  INTO :ll_count
		  FROM DBA.VIACHECK_TRANS
		 WHERE TRANSMISSIONDEPOSITID = :ls_transmissiondepositid;		
		
		if ll_count <> 0 then
	
			dw_1.setitem(ll_row,"dummy1","-ALREADY LOADED-")	
			
		else
			
			ll_count = 0
			SELECT COUNT(*)
			  INTO :ll_count
			  FROM dba.branch, dba.group_branch
			 WHERE dba.branch.id_main_branch = dba.group_branch.id_main_branch
				AND dba.group_branch.FIN_COLLECTMETHOD = 'VC'
			 	AND id_branch = :ls_location
				AND id_status_branch = 'O';		
			
			if ll_count <> 1 then
	
				dw_1.setitem(ll_row,"dummy1","CHECK BRANCH")			
				
			else
				
				dw_1.setitem(ll_row,"dummy1","TRANSACTION OK")
				dw_1.setitem(ll_row,"dummy2","Y")
				
			end if
				
		end if

	end if
	
	ll_row++

	ll_fileread = FileRead(li_FileNum, ls_cadena) 

LOOP

FileClose(li_FileNum)

SetPointer(Arrow!)
end subroutine

public subroutine fn_processfile ();
String 	ls_importedname, ls_id_branch, ls_id_group, ls_desc, ls_desc1
Datetime ld_bankdate, ld_date_tran
Double 	ld_amount, ld_itemcharge, ld_itemcharges, ld_cons, ld_debit, ld_credit, ll_totalcredit
Long 		ll_items, ll_row

SetPointer(HourGlass!)

ll_row = 1
ll_totalcredit = 0

ls_importedname = sle_filename.text

 DECLARE cur_daily_trans CURSOR FOR  
  SELECT dba.VIACHECK_TRANS.LOCATION, 
		   dba.VIACHECK_TRANS.EFECTIVEDATE,
			dba.VIACHECK_TRANS.DATE_TRANS,
         sum(dba.VIACHECK_TRANS.AMOUNT),   
         sum(dba.VIACHECK_TRANS.ITEMCOUNT)
    FROM dba.VIACHECK_TRANS  
   WHERE dba.VIACHECK_TRANS.IMPORTEDNAME = :ls_importedname
GROUP BY dba.VIACHECK_TRANS.LOCATION, dba.VIACHECK_TRANS.EFECTIVEDATE, dba.VIACHECK_TRANS.DATE_TRANS;

OPEN cur_daily_trans;

FETCH cur_daily_trans INTO :ls_id_branch, :ld_bankdate, :ld_date_tran, :ld_amount, :ll_items;

DO WHILE sqlca.sqlcode = 0
	
	
	SELECT dba.branch.ID_MAIN_BRANCH,
			 FIN_VIACHECK_COMXCHK
	  INTO :ls_id_group,
	  		 :ld_itemcharge
	  FROM dba.BRANCH, DBA.GROUP_BRANCH
	 WHERE dba.branch.id_main_branch = dba.GROUP_BRANCH.id_main_branch
	   AND dba.branch.id_branch = :ls_id_branch;
	
	if isnull(ld_itemcharge) then ld_itemcharge = 0.35
	
	ld_itemcharges = ld_itemcharge * ll_items
	
	// ---------------------------------------------
	// Inserta el credito	
	tab1.tp.dw_2.insertrow(ll_row)
	
	ls_desc = "CP - DEPOSIT: VIACHECK DEP. "+string(ld_date_tran,'mm/dd/yyyy')
	
	tab1.tp.dw_2.setitem(ll_row,"dummy1",ls_id_branch)
	tab1.tp.dw_2.setitem(ll_row,"dummy2",ls_desc)
	tab1.tp.dw_2.setitem(ll_row,"dummy4",string(ld_amount))	

	ll_totalcredit=ll_totalcredit+ld_amount

	ld_debit = 0
	ld_credit = ld_amount
	ls_desc1 = 'CHECK CASHING DEPOSIT ON '+string(ld_date_tran,'mm/dd/yyyy')

	SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1
	  INTO :ld_cons
	  FROM dba.transaccion_diaria_payee;

	if isnull(ld_cons) then ld_cons = 1		

	ls_desc = left(ls_desc,50)
	ls_desc1 = left(ls_desc1,100)

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
			  :ls_id_group,   
			  getdate(),   
			  getdate(),   
			  'CCD',   
			  :ls_desc,   
			  :ld_debit,   
			  :ld_credit,   
			  0,   
			  NULL,   
			  NULL,   
			  :ls_desc1,   
			  getdate(),   
			  :gs_cashier,   
			  NULL,   
			  NULL,   
			  NULL );
	
	if sqlca.sqlcode <> 0 then
		Messagebox("Error Inserting Transaccion Diaria Payer",SQLCA.SQLErrText)			
		return
	end if
	
	UPDATE dba.VIACHECK_TRANS 
		SET CONS_TRANS_CREDIT = :ld_cons
	 WHERE dba.VIACHECK_TRANS.IMPORTEDNAME = :ls_importedname
	   AND location = :ls_id_branch
		AND EFECTIVEDATE = :ld_bankdate
		AND DATE_TRANS = :ld_date_tran;	 

	if sqlca.sqlcode <> 0 then
		Messagebox("Error Updating Viacheck Transaction File",SQLCA.SQLErrText)			
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
			  :ld_bankdate,
			  getdate() )  ;

//			  'USBANK',   
//			  '153910251062',   	

	if sqlca.sqlcode <> 0 then
		Messagebox("Error Inserting Transaccion Diaria Banco Payer",SQLCA.SQLErrText)			
		return
	end if

	ll_row++		
	// ---------------------------------------------

	
	// ---------------------------------------------
	// Inserta el debito (Solo cuando hay!)	
	if ld_itemcharges > 0 then
		
		tab1.tp.dw_2.insertrow(ll_row)
		
		ls_desc = "CP - COMISION: VIACHECK COM. "+string(ld_date_tran,'mm/dd/yyyy')+' ('+string(ll_items)+' @ '+String(ld_itemcharge)+")"
		
		tab1.tp.dw_2.setitem(ll_row,"dummy1",ls_id_branch)
		tab1.tp.dw_2.setitem(ll_row,"dummy2",ls_desc)
		tab1.tp.dw_2.setitem(ll_row,"dummy3",string(ld_itemcharges))	
	
		ld_debit = ld_itemcharges
		ld_credit = 0
		ls_desc1 = 'CHECK CASHING COMMISSIONS GENERATED ON '+string(ld_date_tran,'mm/dd/yyyy')+' ('+string(ll_items)+' ITEMS @ '+String(ld_itemcharge)+")"
	
		SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1
		  INTO :ld_cons
		  FROM dba.transaccion_diaria_payee;
		
		if isnull(ld_cons) then ld_cons = 1		

		ls_desc = left(ls_desc,50)
		ls_desc1 = left(ls_desc1,100)
	
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
				  :ls_id_group,   
				  getdate(),   
				  getdate(),   
				  'CCC',   
				  :ls_desc,   
				  :ld_debit,   
				  :ld_credit,   
				  0,   
				  NULL,   
				  NULL,   
				  :ls_desc1,   
				  getdate(),   
				  :gs_cashier,   
				  NULL,   
				  NULL,   
				  NULL );	
		
		if sqlca.sqlcode <> 0 then
			Messagebox("Error Inserting Transaccion Diaria Payer",SQLCA.SQLErrText)			
			return
		end if
	
		UPDATE dba.VIACHECK_TRANS 
			SET CONS_TRANS_DEBIT = :ld_cons
		 WHERE dba.VIACHECK_TRANS.IMPORTEDNAME = :ls_importedname
			AND location = :ls_id_branch
			AND EFECTIVEDATE = :ld_bankdate
			AND DATE_TRANS = :ld_date_tran;		 
	
		if sqlca.sqlcode <> 0 then
			Messagebox("Error Updating Viacheck Transaction File",SQLCA.SQLErrText)			
			return
		end if
	
		ll_row++
		
	end if
	// ---------------------------------------------
		
	FETCH cur_daily_trans INTO :ls_id_branch, :ld_bankdate, :ld_date_tran, :ld_amount, :ll_items;
	
LOOP

CLOSE cur_daily_trans;

tab1.visible = true
dw_1.reset()
cb_selectfile.enabled = false
cb_saveandprocess.enabled = false
sle_filename.text = ""
sle_filename.enabled = false
sle_filepath.text = ""
sle_filepath.enabled = false

SetPointer(Arrow!)

MessageBox("Process Complete","Transactions Applied Sucessfully, A total of $"+String(ll_totalcredit,"###,###.00")+" was credited to the agencies.")

end subroutine

on w_viacheck_trans.create
int iCurrent
call super::create
this.cb_selectfile=create cb_selectfile
this.sle_filepath=create sle_filepath
this.cb_saveandprocess=create cb_saveandprocess
this.sle_filename=create sle_filename
this.tab1=create tab1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_selectfile
this.Control[iCurrent+2]=this.sle_filepath
this.Control[iCurrent+3]=this.cb_saveandprocess
this.Control[iCurrent+4]=this.sle_filename
this.Control[iCurrent+5]=this.tab1
end on

on w_viacheck_trans.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_selectfile)
destroy(this.sle_filepath)
destroy(this.cb_saveandprocess)
destroy(this.sle_filename)
destroy(this.tab1)
end on

event resize;dw_1.height = this.height - 350
dw_1.width = this.width - 50

end event

event pfc_updatespending;return 0
end event

event open;call super::open;tab1.visible = false
end event

type dw_1 from wb_report`dw_1 within w_viacheck_trans
integer x = 9
integer y = 148
integer width = 3698
integer height = 1604
integer taborder = 0
string dataobject = "dw_viacheck_trans"
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

event dw_1::itemchanged;call super::itemchanged;long ll_count, ll_row
String	ls_branch

	
if dwo.name = 'location' then
		
	ls_branch = data
	
	ll_row = row
	
	ll_count = 0
	SELECT COUNT(*)
	  INTO :ll_count
	  FROM dba.branch, dba.group_branch
	 WHERE dba.branch.id_main_branch = dba.group_branch.id_main_branch
		AND dba.group_branch.FIN_COLLECTMETHOD = 'VC'
		AND id_branch = :ls_branch
		AND id_status_branch = 'O';
	
	if ll_count <> 1 then
	
		dw_1.setitem(ll_row,"dummy1","CHECK BRANCH")
		dw_1.setitem(ll_row,"dummy2","N")
		Messagebox("Error","The Branch "+ls_branch+" does not exits or it is not an ViaCheck branch",StopSign!)
		return 2
		
	else
		
		dw_1.setitem(ll_row,"dummy1","TRANSACTION OK")
		dw_1.setitem(ll_row,"dummy2","Y")
		return 0
		
	end if
	
end if
end event

event dw_1::sqlpreview;call super::sqlpreview;
// Procesa unicamente los marcados en el check mark
if dw_1.getitemstring(row,"dummy2") = 'Y' then	
	return 0	
else 
	return 2
end if
end event

type cb_selectfile from commandbutton within w_viacheck_trans
integer x = 1266
integer y = 36
integer width = 110
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;String ls_filepath, ls_filename
Integer li_rtn

li_rtn = GetFileOpenName("Select File", &
 								 ls_filepath, ls_filename, "CSV", &
								 + "Text Files (*.CSV),*.CSV," &
								 + "Doc Files (*.TXT),*.TXT", &
								 "U:\", 18)

IF li_rtn < 1 THEN
	cb_saveandprocess.enabled = false
	return
end if


cb_saveandprocess.enabled = true

sle_filepath.text = ls_filepath
sle_filename.text = ls_filename

fn_loadfile()

end event

type sle_filepath from singlelineedit within w_viacheck_trans
boolean visible = false
integer x = 37
integer y = 36
integer width = 1230
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_saveandprocess from commandbutton within w_viacheck_trans
integer x = 1431
integer y = 36
integer width = 626
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Save and Process File"
end type

event clicked;
if dw_1.update() < 0 then
	Messagebox("Error","Error Updating Data",StopSign!)
	return
end if

if sle_filename.text = "" then
	Messagebox("Error","No File Selected",StopSign!)
	return
end if 


if Messagebox("Confirmation","Are you sure you want to process the file "+sle_filename.text+" and credit the selected agencies?",Question!,YesNo!) <> 1 then
	Messagebox("Operation Canceled","File not processed",Exclamation!)
	return
end if


fn_processfile()





end event

type sle_filename from singlelineedit within w_viacheck_trans
integer x = 37
integer y = 36
integer width = 1230
integer height = 76
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
end type

type tab1 from tab within w_viacheck_trans
event create ( )
event destroy ( )
integer x = 645
integer y = 128
integer width = 2450
integer height = 1584
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean focusonbuttondown = true
integer selectedtab = 1
tp tp
end type

on tab1.create
this.tp=create tp
this.Control[]={this.tp}
end on

on tab1.destroy
destroy(this.tp)
end on

type tp from userobject within tab1
event create ( )
event destroy ( )
integer x = 18
integer y = 48
integer width = 2414
integer height = 1520
long backcolor = 80269524
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_ok cb_ok
dw_2 dw_2
end type

on tp.create
this.cb_ok=create cb_ok
this.dw_2=create dw_2
this.Control[]={this.cb_ok,&
this.dw_2}
end on

on tp.destroy
destroy(this.cb_ok)
destroy(this.dw_2)
end on

type cb_ok from commandbutton within tp
integer x = 1815
integer y = 1396
integer width = 567
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
end type

event clicked;tab1.visible = false
cb_selectfile.enabled = true
cb_saveandprocess.enabled = true
sle_filename.text = ""
sle_filename.enabled = true
sle_filepath.text = ""
sle_filepath.enabled = true
end event

type dw_2 from datawindow within tp
integer x = 32
integer y = 4
integer width = 2350
integer height = 1376
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_viacheck_trans_dummy"
boolean hscrollbar = true
boolean vscrollbar = true
end type

