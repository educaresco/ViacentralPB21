$PBExportHeader$w_achpreparationcustomers.srw
forward
global type w_achpreparationcustomers from wb_report
end type
type st_1 from statictext within w_achpreparationcustomers
end type
type rb_ub from radiobutton within w_achpreparationcustomers
end type
type rb_bone from radiobutton within w_achpreparationcustomers
end type
type rb_snet from radiobutton within w_achpreparationcustomers
end type
type gb_2 from groupbox within w_achpreparationcustomers
end type
type gb_3 from groupbox within w_achpreparationcustomers
end type
type rb_usbank from radiobutton within w_achpreparationcustomers
end type
type rb_mitchell from radiobutton within w_achpreparationcustomers
end type
type lb_status from dropdownlistbox within w_achpreparationcustomers
end type
type cb_generate from commandbutton within w_achpreparationcustomers
end type
type p_generate from picture within w_achpreparationcustomers
end type
type rb_csv from radiobutton within w_achpreparationcustomers
end type
type cb_check from commandbutton within w_achpreparationcustomers
end type
end forward

global type w_achpreparationcustomers from wb_report
integer width = 4544
integer height = 2004
string title = "ACH Preparation"
long backcolor = 80269524
st_1 st_1
rb_ub rb_ub
rb_bone rb_bone
rb_snet rb_snet
gb_2 gb_2
gb_3 gb_3
rb_usbank rb_usbank
rb_mitchell rb_mitchell
lb_status lb_status
cb_generate cb_generate
p_generate p_generate
rb_csv rb_csv
cb_check cb_check
end type
global w_achpreparationcustomers w_achpreparationcustomers

type variables
String is_filepath
double id_amount_to_change
end variables

forward prototypes
public subroutine wf_refreshscreen ()
public subroutine wf_generatefile ()
end prototypes

public subroutine wf_refreshscreen ();//double ld_batchid
//string ls_status
//
//if rb_ip.checked then
//	ls_status = 'IP'
//	cb_generate.text = "Generate File"
//elseif rb_ad.checked then
//	ls_status = 'AD'	
//	cb_generate.text = "Generate File Again"
//elseif rb_ub.checked then
//	ls_status = 'UB'	
//	cb_generate.text = "Close"
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
//dw_1.reset()
//dw_2.reset()
//cb_query.triggerevent(Clicked!)
end subroutine

public subroutine wf_generatefile ();Long ll_rows, ll_i, ll_csvfile, ll_csvfile_CR
String ls_line, ls_acc_type, ls_id_branch, ls_accrouting, ls_accnumber, ls_reqverification, ls_sendername, ls_filename, ls_prefix,	ls_fileext
Double ld_total, ld_ver_deposit, ld_id_receiver, ld_amount, ld_reqverification


datetime ld_nextbusinessday

select dba.sfGetNextBusinessDay(getdate())
  into :ld_nextbusinessday
  from dba.dual;

//Messagebox("",ls_filename)

if fileexists(is_filepath) then
	Messagebox("Existing File!","The selected File Name already Exists!",StopSign!)		
	return
end if

//datetime ld_nextbusinessday

SetPointer(Hourglass!)


if rb_usbank.checked then //USBANK
	ls_prefix = "USBANK_NACHA_"
	ls_fileext = 'ACH'		
elseif rb_mitchell.checked then  //MITCHELL
	ls_prefix = "MITCHELL_"
	ls_fileext = 'WRK'	
elseif rb_csv.checked then  //Standard CSV			
	ls_prefix = "STANDARD_"
	ls_fileext = 'CSV'		
else	
	Messagebox("Fily Type Error!","Unknown file type selected!",StopSign!)		
	return
end if
	

is_filepath = 'U:\ACHFiles\CD\'
ls_filename = "ACH_CD_"+String(today(),"YYYYMMDD")+"_"+String(now(),"hhmmss")

if rb_csv.checked then // crea un archivo adicional para los creditos
	//ll_csvfile_CR = FileOpen(is_filepath+ls_prefix+ls_filename+'_CREDITS.'+ls_fileext, LineMode!, Write!, LockWrite!, Replace!)
	ll_csvfile       = FileOpen(is_filepath+ls_prefix+ls_filename+'_DEBITS.'+ls_fileext, LineMode!, Write!, LockWrite!, Replace!)
else
	ll_csvfile = FileOpen(is_filepath+ls_prefix+ls_filename+'.'+ls_fileext, LineMode!, Write!, LockWrite!, Replace!)	
end if

	
	
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

//SELECT SUM(convert(numeric(14,2),AMOUNT)), COUNT(*)
//  INTO :ld_totaldebits, :ll_countdebits
//  FROM DBA.ACH_BATCH_DETAIL_BRANCH
// WHERE AMOUNT >= 0
//   AND BATCH_ID = :lb_batch.text;
//
//SELECT SUM(convert(numeric(14,2),AMOUNT)), COUNT(*)
//  INTO :ld_totalcredits, :ll_countcredits
//  FROM DBA.ACH_BATCH_DETAIL_BRANCH
// WHERE AMOUNT < 0
//   AND BATCH_ID = :lb_batch.text;

if rb_usbank.checked then
	
	
	//'BB&T' 
	//
	//	ls_nachaimmediatedest   = " 053101121"						// Tamano = 10  Comenzando con ' '
	//	ls_nachaimmediateorigin = " 053101121"						// Tamano = 10  Comenzando con ' '
	//	ls_nachadestinationname = "BRANCH BANKING & TRUST "   // Tamano = 23
	//	ls_nachaoriginname      = "BRANCH BANKING & TRUST "   // Tamano = 23
	//	ls_nachacompanyname     = "VIAMERICAS CORP."          // Tamano = 16
	//	ls_nachafederaltaxid		= "1522225680"						// Tamano = 10
	//	ls_nachaentryclasscode	= "CCD"								// Tamano = 3
	//	ls_nachaoriginatingdfi	= "05310112"						// Tamano = 8
	//	ls_nacheentrydesc			= "DEPOSIT   "						// Tamano = 10
	//	
	// 'B OF A' 
	//	
	//	ls_nachaimmediatedest   = " 121108250"						// Tamano = 9  
	//	ls_nachaimmediateorigin = "1522225680"						// Tamano = 10  
	//	ls_nachadestinationname = "BANK OF AMERICA        "   // Tamano = 23
	//	ls_nachacompanyname     = "VIAMERICAS CORP."          // Tamano = 16
	//	ls_nachaoriginname      = "VIAMERICAS CORP        "   // Tamano = 23
	//	ls_nachafederaltaxid		= "1522225680"						// Tamano = 10
	//	ls_nachaentryclasscode	= "CCD"								// Tamano = 3
	//	ls_nachaoriginatingdfi	= "12110825"						// Tamano = 8
	//	ls_nacheentrydesc			= "DEPOSIT   "						// Tamano = 10
			
	// USBANK
	ls_nachaimmediatedest   	= " 042000013"						// Tamano = 10  Comenzando con ' '
	ls_nachaimmediateorigin 	= " 123000848"						// Tamano = 10  Comenzando con ' '
	ls_nachadestinationname 	= "US Bank                "   			// Tamano = 23
	ls_nachaoriginname      		= "Viamericas             "  				// Tamano = 23
	ls_nachacompanyname     	= "Viamericas Corp."          		// Tamano = 16
	ls_nachafederaltaxid			= "1522225680"						// Tamano = 10  Comenzando con un '1'
	ls_nachaentryclasscode		= "PPD"									// Tamano = 3
	ls_nachaoriginatingdfi			= "04200001"								// Tamano = 8
	ls_nacheentrydesc				= "Deposit   "							// Tamano = 10



//
//
//
//
//
// La implementacion NACHA no se ha completado!!!
//
//
//
//
//
//
//
//






//	// Encabezado del Archivo NACHA (GENERICO)
//	FileWrite(ll_csvfile,"101"+ls_nachaimmediatedest+ls_nachaimmediateorigin+string(today(),"YYMMDD")+string(now(),"HHMM")+ls_fileseq+"094101"+ls_nachadestinationname+ls_nachaoriginname+"00000000")
//	FileWrite(ll_csvfile,"5200"+ls_nachacompanyname+"                    "+ls_nachafederaltaxid+ls_nachaentryclasscode+ls_nacheentrydesc+string(today(),"YYMMDD")+string(ld_nextbusinessday,"YYMMDD")+"   1"+ls_nachaoriginatingdfi+"0000001")	
//	ll_nachalines = ll_nachalines + 2
//	
//

end if
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	
//
//if rb_usbank.checked then //USBANK
//
//elseif rb_mitchell.checked then  //MITCHELL
//
//elseif rb_csv.checked then  //Standard CSV		
//
//end if

	

//ll_csvfile = FileOpen(is_filepath, LineMode!, Write!, LockWrite!, Replace!)



ll_rows = dw_1.rowcount() 

dw_1.update()

dw_1.accepttext()

ls_line = ""
ld_total = 0

For ll_i = 1 to dw_1.rowcount() 

	// *&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	// Process the record selected
	if dw_1.getitemstring(ll_i,"processrecord") = 'Y' then


		
		ld_ver_deposit = 0
		ls_id_branch = String(dw_1.Object.data[ll_i,1])
		ld_id_receiver = Double(dw_1.Object.data[ll_i,2])
		ls_accrouting = String(dw_1.Object.data[ll_i,8]) 
		ls_accnumber = String(dw_1.Object.data[ll_i,10])
		ld_amount = Double(dw_1.Object.data[ll_i,12])
		ls_reqverification = String(dw_1.getitemstring(ll_i,"checkaccount"))
		ld_reqverification = 0
		ls_sendername = trim(left(String(dw_1.Object.data[ll_i,5]),22))
		

		 // 22 Credit To Checking
		 // 32 Credit To Savings
		 // 27 Debit To Checking
		 // 27 Debit To Savings
		// General Ledger accounts los transactions code son 42 y 47 

		if String(dw_1.Object.data[ll_i,24]) = 'S' then 
			ls_acc_type = '37'
		else
			ls_acc_type = '27'
		end if


		if rb_usbank.checked then //USBANK
		
			
//			ls_nashamount	=	string(( ld_positiveamount*100 ),"##########")

// ls_acc_type

			
			// REVISAR!!! usar las variables!!!
			
//			ls_line = '6' + &
//						 fn_completar_cadena(ls_acc_type,'D','0',2) + &
//						 fn_completar_cadena(trim(string(dw_1.Object.data[ll_i,5])),'I','0',9) + &
//						 fn_completar_cadena(trim(string(dw_1.Object.data[ll_i,6])),'D',' ',17) + &
//						 fn_completar_cadena(trim( String((abs(ld_amount)*100),"##########") ),'I','0',10) + &
//						 fn_completar_cadena(trim(string(dw_1.Object.data[ll_i,3])),'D',' ',15) + &
//						 fn_completar_cadena(trim(ls_sendername),'D',' ',22) + &
//						 '  0'+ls_nachaoriginatingdfi+ &
//						 fn_completar_cadena(string(ll_i),'I','0',7)		
//			
//			ld_hash = ld_hash + double(left(string(dw_1.Object.data[ll_i,5]),8))
		
		
		
		elseif rb_mitchell.checked then  //MITCHELL

				
			ls_line = ""
			ls_line += ls_sendername +  ","
			ls_line += ls_accnumber + ","
			ls_line += ls_id_branch + ",,"
			ls_line += String(ld_amount,"#######0.00") + ","	
			ls_line += ls_accrouting + ","
			ls_line += String(today(),"mm/dd/yyyy") + ","	
			ls_line += ls_acc_type + ""			

		
		elseif rb_csv.checked then  //Standard CSV				
		
		
			ls_line = ""
			ls_line += ls_sendername +  ","
			ls_line += ls_accnumber + ","
			ls_line += ls_id_branch +'-'+ string(ld_id_receiver) + ","
			ls_line += String(ld_amount,"#######0.00") + ","	
			ls_line += ls_accrouting + ""
		
			
		end if

		
		ld_total += double(dw_1.Object.data[ll_i,12])

		
		Filewrite(ll_csvfile,ls_line)
				
		
		
//		// Deposito de Verificacion
//		if ls_reqverification = 'Y' then
//	
//			ld_reqverification = 1
//			
//			
//			ld_ver_deposit = Rand(49)
//			if ld_ver_deposit = 0 then ld_ver_deposit = 13
//			
//			ld_ver_deposit = ld_ver_deposit / 100
//			
//			
//			if rb_usbank.checked then //USBANK
//			
//				// ToDo (Nacha)
//			
//			elseif rb_mitchell.checked then  //MITCHELL			
//				
//				ls_line = ""
//				ls_line += ls_sendername +  ","
//				ls_line += ls_accnumber + ","
//				ls_line += ls_id_branch + ",,"
//				ls_line += String(ld_ver_deposit,"#######0.00") + ","	
//				ls_line += ls_accrouting + ","
//				ls_line += String(today(),"mm/dd/yyyy") + ","	
//				ls_line += String(double(ls_acc_type) - 5) + ""			
//				
//										
//			elseif rb_csv.checked then  //Standard CSV			
//								
//				ls_line = ""
//				ls_line += ls_sendername +  ","
//				ls_line += ls_accnumber + ","
//				ls_line += ls_id_branch +'-'+ string(ld_id_receiver) + ","
//				ls_line += String(ld_ver_deposit,"#######0.00") + ","	
//				ls_line += ls_accrouting + ""							
//				
//			end if
//						
//			
//			ld_total -= ld_ver_deposit
//						
//			
//			//if rb_csv.checked then  //Standard CSV		
//				//Filewrite(ll_csvfile_CR,ls_line)					
//			//else						
//			if not rb_csv.checked then  //Standard CSV		
//				Filewrite(ll_csvfile,ls_line)		
//			end if
//			
//										
//		end if
				
				
					
	//////// ------------------------------------------------------------------------------------------------------------------------------------------------------------------		
	//Uses the ViaCheck connection because the SQLCA connection uses a role that cannot reach other DBs (unless objects have public access).
	
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
	//////// ------------------------------------------------------------------------------------------------------------------------------------------------------------------				
					
				
				
				
				
		// Stores the ACH record history
		INSERT INTO envio.dba.ACH_DETAIL_RECEIVER
				  (ID_BRANCH
				  ,ID_RECEIVER
				  ,DATE_GENERATED
				  ,ACCTYPEID
				  ,ACCROUTING
				  ,ACCNUMBER
				  ,AMOUNT
				  ,BANK_FILENAME
				  ,REQ_VERIFICATION
				  ,VERIFICATION_AMT
				  ,FLAG_RECONCILIATION)
		  VALUES
				  (:ls_id_branch
				  ,:ld_id_receiver
				  ,getdate()
				  ,:ls_acc_type
				  ,:ls_accrouting
				  ,:ls_accnumber
				  ,:ld_amount
				  ,:ls_filename
				  ,:ld_reqverification
				  ,:ld_ver_deposit
				  ,'N') using SQLVIACHECKS;

			if SQLVIACHECKS.sqlcode <> 0 then
				Messagebox("ERROR","Ha ocurrido un error registro de la orden "+String(ld_id_receiver) +" no pudo ser grabado en ACH_DETAIL_RECEIVER.~n~rPor favor mande una copia de esta imagen a Technology.~n~r" + SQLVIACHECKS.SQLErrText)
				return
			end if				  
			
			SQLVIACHECKS.of_disconnect()
			
	end if
	// Process the record selected
	// *&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&

next




//// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//// Viamericas.com - VERIFICATION DEPOSITS (2 PER ACCOUNT)
//
//String ls_acc_type1, ls_accrouting1, ls_accountnumber1, ls_nameholder1
//Double ls_payment_id1, ls_deposit1, ls_deposit2
//
//
//DECLARE CUR_VERIFICATIONS CURSOR FOR  
//SELECT ID_SenderPayment,
//ACCOUNT_TYPE, 
//dbo.DecryptTripleDES(ROUTING_NUMBER), 
//dbo.DecryptTripleDES(ACCOUNT_NUMBER), 
//NAME_HOLDER, 
//AMOUNT_DEPOSIT1, 
//AMOUNT_DEPOSIT2
//FROM dbo.MV_SENDERPAYMENT
//WHERE ID_FLAG_ACTIVATE = 'R'
//AND NICK_NAME NOT LIKE 'ITMATICA%';
//
//OPEN CUR_VERIFICATIONS;
//FETCH CUR_VERIFICATIONS INTO :ls_payment_id1, :ls_acc_type1, :ls_accrouting1, :ls_accountnumber1, :ls_nameholder1, :ls_deposit1, :ls_deposit2 ;
//
//do while SQLCA.SQLCode = 0 
//
//
//			// Verificacion 1
//	
//			if ls_acc_type1 = 'S' then 
//				ls_acc_type = '37'
//			else
//				ls_acc_type = '27'
//			end if
//	
//	
//			if rb_usbank.checked then //USBANK
//			
//				// ToDo (Nacha)
//			
//			elseif rb_mitchell.checked then  //MITCHELL		
//					
//				ls_line = ""					
//				ls_line += ls_nameholder1 +  ","
//				ls_line += ls_accountnumber1 + ","
//				ls_line += "A00010" + ",,"
//				ls_line += String(ls_deposit2,"#######0.00") + ","	
//				ls_line += ls_accrouting1 + ","
//				ls_line += String(today(),"mm/dd/yyyy") + ","	
//				ls_line += String(double(ls_acc_type) - 5) + ""			
//		
//			elseif rb_csv.checked then  //Standard CSV			
//								
//				ls_line = ""
//				ls_line += ls_nameholder1 +  ","
//				ls_line += ls_accountnumber1 + ","
//				ls_line += "A000010,"
//				ls_line += String(ls_deposit2,"#######0.00") + ","	
//				ls_line += ls_accrouting1 + ""							
//				
//			end if
//
//
//	
//			ld_total -= ls_deposit1
//
//			
//			if rb_csv.checked then  //Standard CSV		
//				Filewrite(ll_csvfile_CR,ls_line)					
//			else						
//				Filewrite(ll_csvfile,ls_line)		
//			end if						
//	
//	
//			// Verificacion 2
//	
//			if ls_acc_type1 = 'S' then 
//				ls_acc_type = '37'
//			else
//				ls_acc_type = '27'
//			end if
//	
//	
//			if rb_usbank.checked then //USBANK
//		
//			// ToDo (Nacha)
//			
//			elseif rb_mitchell.checked then  //MITCHELL	
//				ls_line = ""					
//				ls_line += ls_nameholder1 +  ","
//				ls_line += ls_accountnumber1 + ","
//				ls_line += "A00010" + ",,"
//				ls_line += String(ls_deposit1,"#######0.00") + ","	
//				ls_line += ls_accrouting1 + ","
//				ls_line += String(today(),"mm/dd/yyyy") + ","	
//				ls_line += String(double(ls_acc_type) - 5) + ""			
//			
//			elseif rb_csv.checked then  //Standard CSV			
//								
//				ls_line = ""
//				ls_line += ls_nameholder1 +  ","
//				ls_line += ls_accountnumber1 + ","
//				ls_line += "A000010,"
//				ls_line += String(ls_deposit1,"#######0.00") + ","	
//				ls_line += ls_accrouting1 + ""							
//				
//			end if						
//						
//			
//			ld_total -= ls_deposit2
//			
//			
//			if rb_csv.checked then  //Standard CSV		
//				Filewrite(ll_csvfile_CR,ls_line)					
//			else						
//				Filewrite(ll_csvfile,ls_line)		
//			end if
//	
//	
//	
//	
//			// FLAG THE ACCOUNT AS VERIFICATION SENT
//			UPDATE dbo.MV_SENDERPAYMENT
//			SET ID_FLAG_ACTIVATE = 'S'
//			WHERE ID_SenderPayment = :ls_payment_id1;
//					
//	
//	FETCH CUR_VERIFICATIONS INTO :ls_payment_id1, :ls_acc_type1, :ls_accrouting1, :ls_accountnumber1, :ls_nameholder1, :ls_deposit1, :ls_deposit2 ;
//loop
//CLOSE CUR_VERIFICATIONS;


// Viamericas.com VERIFICATION DEPOSITS
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



if rb_mitchell.checked then  //MITCHELL
	ls_line = "Viamericas,143968,522225680,,"+String(ld_total,"########.00")+",075000569,"+String(today(),"mm/dd/yyyy")+",22"
	Filewrite(ll_csvfile,ls_line)
end if	
	
FileClose(ll_csvfile)

//if rb_csv.checked then  //Standard CSV		
//	FileClose(ll_csvfile_CR)	
//end if				



Messagebox("Process Completed!","File was generated sucessfully")

dw_1.retrieve();



int i
cb_check.text = "Check All"

FOR  i = 1 TO dw_1.rowcount()
	dw_1.Object.data[i,15] = 'N'
NEXT



SetPointer(Arrow!)


//String ls_receiver_acc_number, ld_receiver_DFI_id, ls_reasonforpayment, ls_receivingbank, ls_FX_arrangements, ls_transaction_type_code, ls_transaction_code


//ls_receiver_acc_number = "143968"
//ld_receiver_DFI_id = "07500056"
//ls_reasonforpayment = "REMITTANCE"
//ls_receivingbank = "MITCHELL BANK"
//ls_FX_arrangements = "N/A"
//ls_transaction_code = "AAA"
//ls_transaction_type_code = "CIE"



// ESTE ERA EL IAT:

//		ls_line += char(34) + ls_receiver_acc_number + char(34) + ","	
//		ls_line += String(dw_1.Object.data[ll_i,12]) + ","	
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,8]) + char(34) + ","
//		ls_line += String(today(),"mm/dd/yyyy") + ","		
//		ls_line += char(34) + ls_transaction_code + char(34) + ","
//		ls_line += char(34) + ls_transaction_type_code + char(34) + ","
//		ls_line += String(dw_1.Object.data[ll_i,12]) + ","
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,21]) + char(34) + ","	
//		ls_line += char(34) + left(String(dw_1.Object.data[ll_i,18]),22) + char(34) + ","
//		ls_line += char(34) + left(String(dw_1.Object.data[ll_i,5]),22) + char(34) + ","
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,16]) + char(34) + ","
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,17]) + char(34) + ","	
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,23]) + char(34) + ","
//		ls_line += char(34) + "VIAMERICAS" + char(34) + "," 	
//		ls_line += char(34) + ld_receiver_DFI_id + char(34) + ","
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,22]) + char(34) + ","	
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,19]) + char(34) + ","
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,20]) + char(34) + ","
//		ls_line += char(34) + String(dw_1.Object.data[ll_i,11]) + char(34) 
end subroutine

on w_achpreparationcustomers.create
int iCurrent
call super::create
this.st_1=create st_1
this.rb_ub=create rb_ub
this.rb_bone=create rb_bone
this.rb_snet=create rb_snet
this.gb_2=create gb_2
this.gb_3=create gb_3
this.rb_usbank=create rb_usbank
this.rb_mitchell=create rb_mitchell
this.lb_status=create lb_status
this.cb_generate=create cb_generate
this.p_generate=create p_generate
this.rb_csv=create rb_csv
this.cb_check=create cb_check
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.rb_ub
this.Control[iCurrent+3]=this.rb_bone
this.Control[iCurrent+4]=this.rb_snet
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.gb_3
this.Control[iCurrent+7]=this.rb_usbank
this.Control[iCurrent+8]=this.rb_mitchell
this.Control[iCurrent+9]=this.lb_status
this.Control[iCurrent+10]=this.cb_generate
this.Control[iCurrent+11]=this.p_generate
this.Control[iCurrent+12]=this.rb_csv
this.Control[iCurrent+13]=this.cb_check
end on

on w_achpreparationcustomers.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.rb_ub)
destroy(this.rb_bone)
destroy(this.rb_snet)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.rb_usbank)
destroy(this.rb_mitchell)
destroy(this.lb_status)
destroy(this.cb_generate)
destroy(this.p_generate)
destroy(this.rb_csv)
destroy(this.cb_check)
end on

event open;call super::open;//cb_query.triggerevent(Clicked!)
end event

event resize;dw_1.height = this.height - 390
dw_1.width = this.width - 110

end event

type dw_1 from wb_report`dw_1 within w_achpreparationcustomers
integer x = 32
integer y = 244
integer width = 4434
integer height = 1556
integer taborder = 0
string dataobject = "dw_achpreparationcustomers"
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

event dw_1::buttonclicked;//string ls_id_main_branch, ls_parameter
//double ld_amount, ld_newamount, ld_batchid
//
//if rb_ad.checked or rb_ub.checked then
//	messagebox("Operation Not Allowed","It is not possible to change information for Exported Files",Exclamation!)
//	return
//end if
//
//ls_id_main_branch = dw_1.getitemstring(dw_1.getrow(),"id_main_branch")
//ld_amount = dw_1.getitemnumber(dw_1.getrow(),"amount")
//
//
//if dwo.name = "cb_change" then
//		
//	openwithparm(w_achpreparation_changeamt,ls_id_main_branch+"*"+string(ld_amount))
//	ls_parameter = message.stringparm
//	if ls_parameter <> "-none-" then	
//		ld_newamount = double(ls_parameter)		
//		if ld_newamount = 0 then
//			If Messagebox("Confirmation","Using a zero amount will remove this Branch from the ACH file~r~nDo you want to remove "+ls_id_main_branch+" from the file?",Question!,YesNo!) = 1 Then
//				dw_1.deleterow(dw_1.getrow())
//				dw_1.update()
//			end if	
//		else
//			dw_1.setitem(dw_1.getrow(),"amount",ld_newamount)
//			dw_1.update()
//		end if
//	end if
//
//elseif dwo.name = "cb_batch" then
//	
//	openwithparm(w_achpreparation_batch,lb_batch.text+"*"+ls_id_main_branch+"*"+string(ld_amount))	
//	fn_refreshbatches(lb_batch.text)
//	cb_query.triggerevent(Clicked!)
//
//end if
//

double d_amount_to_verify, ld_total, ld_receiver, d_type_motivo_hold
string ls_branch, s_desc_motivo_hold
long ll_cont
date ld_fecha
time lt_hora
datetime ld_fechahora
/////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.DataObject = 'dw_achpreparationcustomers_exported' then
	dw_1.accepttext()
	
	IF dwo.name = "b_verification" then
		
		d_amount_to_verify = dw_1.getitemnumber(row,'dummy1')
		
		if d_amount_to_verify = dw_1.getitemnumber(row,'verification_amt') then
			
			
			dw_1.setitem(row,'req_verification', 0)
			
			dw_1.update()
			dw_1.retrieve()
			
		else
			
			messagebox('Alert', 'The amount do not match the Verification amount', stopsign!)
			
		end if
		
	end if
	
	IF dwo.name = "b_release" then
		
		ld_fecha = Today()
		lt_hora  = Now()
		ld_fechahora = Datetime(ld_fecha,lt_hora)
		ls_branch = dw_1.getitemstring(row,'receiver_id_branch')
		ld_receiver = dw_1.getitemnumber(row,'receiver_id_receiver')
		
		ld_total = dw_1.getitemnumber(row,'receiver_totalamount')
		
	if ld_total > 1000 then
		if Messagebox('Verificar','Este envio exede los 1000 Dolares, desea liberarlo',Question!,YesNo!) = 2 then
			return
		end if
	end if


If messagebox("Warning","Do you want to change the status of Invoice : "+ls_branch+" - "+string(ld_receiver),Question!,yesno!) = 1 then
	
	// 06/20/2011: Only motivo hold 85! ACH Funding
	
	SELECT TYPE_MOTIVO_HOLD, DESC_MOTIVO_HOLD
	INTO :d_type_motivo_hold, :s_desc_motivo_hold
	FROM DBA.MOTIVO_HOLD
	WHERE ID_BRANCH = :ls_branch
	AND ID_RECEIVER = :ld_receiver
	and type_motivo_hold in ('85','89');
		
	DECLARE sp_release PROCEDURE FOR dba.spReleaseInvoice @id_branch = :ls_branch, 
	@id_receiver = :ld_receiver, 
	@type_motivo_hold = :d_type_motivo_hold,
	@desc_motivo_hold = :s_desc_motivo_hold,
	@id_cashier = :gs_cashier;
							 
	execute sp_release;
                                 	
	dw_1.retrieve()
	
	
	
end if
	
end if
end if
			
end event

event dw_1::clicked;call super::clicked;long ll_row
ll_row = dw_1.GetClickedRow()
dw_1.SelectRow(0,FALSE)
if ll_row > 0 then
	 dw_1.Scrolltorow(ll_row)
end if
end event

type st_1 from statictext within w_achpreparationcustomers
integer x = 87
integer y = 84
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Transactions:"
boolean focusrectangle = false
end type

type rb_ub from radiobutton within w_achpreparationcustomers
boolean visible = false
integer x = 1934
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

type rb_bone from radiobutton within w_achpreparationcustomers
boolean visible = false
integer x = 2930
integer y = 100
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

type rb_snet from radiobutton within w_achpreparationcustomers
boolean visible = false
integer x = 2930
integer y = 148
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

type gb_2 from groupbox within w_achpreparationcustomers
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

type gb_3 from groupbox within w_achpreparationcustomers
integer x = 32
integer width = 4430
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_usbank from radiobutton within w_achpreparationcustomers
integer x = 1495
integer y = 52
integer width = 352
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
boolean enabled = false
string text = "Us Bank"
end type

type rb_mitchell from radiobutton within w_achpreparationcustomers
integer x = 1495
integer y = 124
integer width = 352
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
boolean enabled = false
string text = "Mitchell"
end type

type lb_status from dropdownlistbox within w_achpreparationcustomers
integer x = 453
integer y = 72
integer width = 887
integer height = 644
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"New Orders","Exported to Bank"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
dw_1.reset()

if lb_status.text = "New Orders" then
	dw_1.DataObject = 'dw_achpreparationcustomers'
	cb_generate.enabled = true
else
	dw_1.DataObject = 'dw_achpreparationcustomers_exported'
	cb_generate.enabled = false
end if

dw_1.SetTransObject(SQLCA)	
dw_1.retrieve()
cb_check.text = "Uncheck All"
end event

type cb_generate from commandbutton within w_achpreparationcustomers
integer x = 2450
integer y = 72
integer width = 558
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
boolean enabled = false
string text = "Generate File"
end type

event clicked;//string ls_path, ls_file
//int li_rc
//
//is_filepath = ""
//
//// ls_path = "" // aqui se puede poner el path default para abrir el dialogo
//
//li_rc = GetFileSaveName ( "Select File",  ls_path, ls_file, "CSV", "Comma Separated Files (*.csv),*.csv" , "", 32770)
//
//IF li_rc = 1 Then
//   is_filepath = ls_path
//End If
//
//
//if is_filepath = "" then	
//	Messagebox("No File Selected","Operation Canceled",StopSign!)
//else
//	
//	if Messagebox("Confirmation","Do you want to generate the file "+is_filepath+" with the selected customers?",Question!,YesNo!) <> 1 then
//		Messagebox("Operation Canceled","Operation Canceled by the user",Exclamation!)
//		return
//	end if
//	
//	wf_generatefile()
//	
//end if

string ls_bank


if rb_usbank.checked then
	ls_bank = 'US BANK'
elseif rb_mitchell.checked then //MITCHELL
	ls_bank = 'MITCHELL BANK'
elseif rb_csv.checked then
	ls_bank = 'CSV - STANDARD'	
end if


if Messagebox("Confirmation","Do you want to generate the file with format "+ls_bank+" with the selected customers?",Question!,YesNo!) <> 1 then
		Messagebox("Operation Canceled","Operation Canceled by the user",Exclamation!)
		return
end if

wf_generatefile()	
end event

type p_generate from picture within w_achpreparationcustomers
integer x = 2482
integer y = 88
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "ApplicationIcon!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type rb_csv from radiobutton within w_achpreparationcustomers
integer x = 1810
integer y = 52
integer width = 480
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
string text = "Standard CSV"
boolean checked = true
end type

type cb_check from commandbutton within w_achpreparationcustomers
integer x = 32
integer y = 172
integer width = 375
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Uncheck All"
end type

event clicked;String ls_check
int i

if this.text = "Uncheck All" then
	ls_check = 'N'
	this.text = "Check All"
else
	ls_check = 'Y'
	this.text = "Uncheck All"
end if

FOR  i = 1 TO dw_1.rowcount()
	dw_1.Object.data[i,15] = ls_check
NEXT
end event

