$PBExportHeader$w_viacheckweb_trans.srw
forward
global type w_viacheckweb_trans from wb_report
end type
type sle_filepath from singlelineedit within w_viacheckweb_trans
end type
type cb_saveandprocess from commandbutton within w_viacheckweb_trans
end type
type st_1 from statictext within w_viacheckweb_trans
end type
type cb_1 from commandbutton within w_viacheckweb_trans
end type
end forward

global type w_viacheckweb_trans from wb_report
integer width = 3771
integer height = 1964
string title = "ViaCheck Transactions"
long backcolor = 80269524
sle_filepath sle_filepath
cb_saveandprocess cb_saveandprocess
st_1 st_1
cb_1 cb_1
end type
global w_viacheckweb_trans w_viacheckweb_trans

type variables

end variables

forward prototypes
public subroutine fn_loadfile ()
end prototypes

public subroutine fn_loadfile ();String ls_transmissiondepositid, ls_location, ls_status, ls_importedname, ls_prelocation
Long ll_row, ll_count
Datetime ld_date_trans, ld_received, ld_efectivedate
Double ld_amount, ld_batchcount, ld_itemcount, ld_preamount, ld_preitemcount
string ls_cutoff, ls_user, ls_received_tmp

SetPointer(HourGlass!)

SELECT min(dba.ACC_PARAMETERS.VIACHECK_CLOSETIME)
  INTO :ls_cutoff  
  FROM dba.ACC_PARAMETERS;
  
SELECT SYSTEM_USER
  INTO :ls_user
  FROM dba.DUAL;

dw_1.reset()
ll_row = 1

/*****csarmiento*******/
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
	
String ls_id_branch, batchid
DateTime ld_date_tran 
Long ll_items
Double ld_totalamount

ls_prelocation = '-1'
ld_preamount = -1
ld_preitemcount = -1

	
DECLARE cur_daily_trans1 CURSOR FOR
 SELECT o.name, created, b.batchid, count(*), sum(AMOUNT)
   FROM viachecks.dbo.batchTable b, viachecks.dbo.checkTable c, viachecks.dbo.customer_location o
  WHERE b.batchID = c.batchID
    AND o.id = b.locationID
    AND NOT EXISTS (SELECT 'x' FROM viachecks.dbo.exportedBatches e WHERE b.batchid = e.batchID )
	AND NOT EXISTS (SELECT 'x' FROM viachecks.dbo.balanceCreditItems e WHERE b.batchid = e.batchID )
  GROUP BY o.name, created, b.batchid 
  ORDER BY sum(AMOUNT) DESC
  USING SQLVIACHECKS;

OPEN cur_daily_trans1;

FETCH cur_daily_trans1 INTO :ls_id_branch, :ld_date_tran, :batchid, :ll_items, :ld_totalamount;

DO WHILE SQLVIACHECKS.sqlcode = 0

	ls_transmissiondepositid = 'VCWEB-' + batchid
	ld_date_trans = ld_date_tran
	ls_location = ls_id_branch
	ld_amount = ld_totalamount
	ld_batchcount = 1
	ld_itemcount = ll_items
	ls_status = 'SCANNED'
	ld_received = ld_date_tran
	
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

				dw_1.setitem(ll_row,"dummy3","N")

				if ls_prelocation = ls_location and ld_preamount = ld_amount and ld_preitemcount = ld_itemcount then
					dw_1.setitem(ll_row,"dummy1","CHECK FOR DUPLICATED")
					dw_1.setitem(ll_row,"dummy2","N")					
				else				
//					dw_1.setitem(ll_row,"dummy1","TRANSACTION OK")
//					dw_1.setitem(ll_row,"dummy2","Y")
					
					dw_1.setitem(ll_row,"dummy1","AUTORUN")
					dw_1.setitem(ll_row,"dummy2","N")
					
				end if

			end if
				
		end if

	end if
	
	ls_prelocation = ls_location
	ld_preamount = ld_amount
	ld_preitemcount = ld_itemcount
	
	ll_row++

	FETCH cur_daily_trans1 INTO :ls_id_branch, :ld_date_tran, :batchid, :ll_items, :ld_totalamount;

LOOP

CLOSE cur_daily_trans1;

SQLVIACHECKS.of_disconnect()

destroy SQLVIACHECKS

SetPointer(Arrow!)
end subroutine

on w_viacheckweb_trans.create
int iCurrent
call super::create
this.sle_filepath=create sle_filepath
this.cb_saveandprocess=create cb_saveandprocess
this.st_1=create st_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_filepath
this.Control[iCurrent+2]=this.cb_saveandprocess
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_1
end on

on w_viacheckweb_trans.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_filepath)
destroy(this.cb_saveandprocess)
destroy(this.st_1)
destroy(this.cb_1)
end on

event resize;dw_1.height = this.height - 350
dw_1.width = this.width - 50

end event

event pfc_updatespending;return 0
end event

event open;call super::open;//tab1.visible = false
fn_loadfile()
end event

type dw_1 from wb_report`dw_1 within w_viacheckweb_trans
integer x = 9
integer y = 148
integer width = 3698
integer height = 1604
integer taborder = 0
string dataobject = "dw_viacheckweb_trans"
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

type sle_filepath from singlelineedit within w_viacheckweb_trans
boolean visible = false
integer x = 37
integer y = 36
integer width = 1230
integer height = 76
integer taborder = 20
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

type cb_saveandprocess from commandbutton within w_viacheckweb_trans
integer x = 613
integer y = 40
integer width = 626
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save and Process"
end type

event clicked;
if Messagebox("Confirmation","Are you sure you want to process the batches and credit the selected agencies?",Question!,YesNo!) <> 1 then
	Messagebox("Operation Canceled","Batches not processed",Exclamation!)
	return
end if


SetPointer(HourGlass!)

/*****csarmiento*******/
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



if dw_1.update() < 0 then
	Messagebox("Error","Error Updating Data",StopSign!)
	return
end if

Long		ll_i
String 	ls_IDBRANCH
Datetime ld_DATETRAN
Double 	ld_BATCHNUMBER
Long 		ll_ITEMCOUNT
Double 	ld_BATCHTOTAL
String 	ls_process
String   ls_user, ls_desc
String 	ls_remove


For ll_i = 1 to dw_1.rowcount() 
	
	
	ls_IDBRANCH = dw_1.Object.data[ll_i,3]
	ld_DATETRAN = datetime(date(dw_1.Object.data[ll_i,2]),time(dw_1.Object.data[ll_i,2]))
	ld_BATCHNUMBER = double(fn_replace(dw_1.Object.data[ll_i,1],'VCWEB-',''))
	ll_ITEMCOUNT = double(dw_1.Object.data[ll_i,6])
	ld_BATCHTOTAL = double(dw_1.Object.data[ll_i,4])	
	
	ls_process = dw_1.Object.data[ll_i,16]	
	ls_remove = dw_1.Object.data[ll_i,17]
	
	
	if ls_remove = 'Y' then
			
		ls_user = upper(gs_login)
		ls_desc = 'AUTO PROCESSED FROM VIACENTRAL (REMOVED)'
		
		DECLARE spFlagExportedBatch2 PROCEDURE FOR ViaChecks.dbo.spFlagExportedBatch :ld_BATCHNUMBER, :ls_user, :ls_desc  USING SQLVIACHECKS;
		Execute spFlagExportedBatch2;
		
		if SQLVIACHECKS.SQLCode <> 100 then			
			Messagebox("Error","Error Grabando Creditos. Contacte a Soporte.~r~n"+SQLVIACHECKS.SQLErrText)
			return
		else
		
		end if	
			
	elseif ls_process = 'Y' then

		DECLARE spAddViaCheckCredit PROCEDURE FOR dba.spAddViaCheckCredit @IDBRANCH = :ls_IDBRANCH, @DATETRAN = :ld_DATETRAN, @BATCHNUMBER = :ld_BATCHNUMBER, @ITEMCOUNT = :ll_ITEMCOUNT, @BATCHTOTAL = :ld_BATCHTOTAL;
		Execute spAddViaCheckCredit;

		if SQLCA.SQLCode <> 100 then			
			Messagebox("Error","Error Grabando Creditos. Contacte a Soporte.~n~r"+SQLCA.SQLErrText)
			return
		else
			
			ls_user = upper(gs_login)
			ls_desc = 'AUTO PROCESSED FROM VIACENTRAL'
			
			DECLARE spFlagExportedBatch PROCEDURE FOR ViaChecks.dbo.spFlagExportedBatch :ld_BATCHNUMBER, :ls_user, :ls_desc  USING SQLVIACHECKS;
			Execute spFlagExportedBatch;
			
			if SQLVIACHECKS.SQLCode <> 100 then			
				Messagebox("Error","Error Grabando Creditos. Contacte a Soporte.~r~n"+SQLVIACHECKS.SQLErrText)
				return
			else
				
			end if
			
		end if

	end if
	
next

SQLVIACHECKS.of_disconnect()

destroy SQLVIACHECKS

Messagebox("Completed","Process Completed Successfully")

fn_loadfile()

SetPointer(Arrow!)

end event

type st_1 from statictext within w_viacheckweb_trans
integer x = 18
integer y = 44
integer width = 553
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pending Batches"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_viacheckweb_trans
integer x = 3360
integer y = 40
integer width = 343
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Refresh"
end type

event clicked;fn_loadfile()
end event

