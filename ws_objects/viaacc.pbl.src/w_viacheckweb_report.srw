$PBExportHeader$w_viacheckweb_report.srw
forward
global type w_viacheckweb_report from w2_master_report_dates
end type
end forward

global type w_viacheckweb_report from w2_master_report_dates
string title = "Viacheck Web Report"
end type
global w_viacheckweb_report w_viacheckweb_report

on w_viacheckweb_report.create
call super::create
end on

on w_viacheckweb_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event closequery;return 0
end event

type st_4 from w2_master_report_dates`st_4 within w_viacheckweb_report
end type

type st_3 from w2_master_report_dates`st_3 within w_viacheckweb_report
end type

type cb_query from w2_master_report_dates`cb_query within w_viacheckweb_report
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String ls_bank_date, ls_system_date, ls_branch, ls_batchid, ls_cons_trans_diaria
Double ld_system_amt, ld_bank_amt
long ll_row


Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
//dw_1.retrieve(ld_Fecha1,ld_Fecha2)

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


dw_1.reset()
dw_1.retrieve(ld_Fecha1,ld_Fecha2)


// *****************************************************************************

// Part1 - Transacciones que estan en el banco y en el sistema!

// Recorre los totales por codigo de transaccion (cons_trans_diaria) y la 
// con la fecha obtenida de la importacion de US Bank.
DECLARE cur_matchtrans CURSOR FOR
 select convert(varchar,a.datedeposit,101),
 	     convert(varchar,eb.RECONCILIATIONDATE,101),
	     f.name, 
        b.batchid, 
        d.creditTransactionId, 
        ea.credit_trans_diaria,
		  sum(b.amount) 
   from ViaChecks.dbo.ackFromBank as a, 
	     ViaChecks.dbo.checktable as b, 
	     ViaChecks.dbo.balancecredititems as c, 
	     ViaChecks.dbo.balancecredit as d, 
	     ViaChecks.dbo.batchtable as e, 
	     ViaChecks.dbo.customer_location as f,
	     Envio.dba.transaccion_diaria_payee as ea, 
        Envio.dba.TRANSACCION_DIARIA_BANCO_PAYEE as eb
  where ea.cons_trans_diaria = eb.cons_trans_diaria
    and d.creditTransactionId = ea.cons_trans_diaria
    and a.irn=b.irn
    and e.batchid = b.batchid
    and upper(e.locationid) = upper(f.id)
    and b.checkid = c.checkid
    and c.creditid = d.creditId
    and a.DATEDEPOSIT between :ld_fecha1 and :ld_fecha2
  group by convert(varchar,a.datedeposit,101),
			  convert(varchar,eb.RECONCILIATIONDATE,101),
			  f.name, 
			  b.batchid, 
			  d.creditTransactionId, 
			  ea.credit_trans_diaria
  order by 1, 5
  USING SQLVIACHECKS;

OPEN cur_matchtrans;

FETCH cur_matchtrans INTO :ls_bank_date, :ls_system_date, :ls_branch, :ls_batchid, :ls_cons_trans_diaria, :ld_system_amt, :ld_bank_amt;

DO WHILE SQLVIACHECKS.sqlcode = 0
	

	ll_row = dw_1.insertrow(0)
	
	dw_1.setitem(ll_row,"TypeMatch","Registros Banco y Sistema")
	dw_1.setitem(ll_row,"FechaEnUSBank",ls_bank_date)
	dw_1.setitem(ll_row,"FechaBancoEnCentral",ls_system_date)
	dw_1.setitem(ll_row,"batchid",ls_batchid)
	dw_1.setitem(ll_row,"creditTransactionId",ls_cons_trans_diaria)
	dw_1.setitem(ll_row,"name",upper(ls_branch))
	dw_1.setitem(ll_row,"ValorAcreditadoCentral",ld_system_amt)
	dw_1.setitem(ll_row,"ValorAcreditadoUsBank",ld_bank_amt)	


	FETCH cur_matchtrans INTO :ls_bank_date, :ls_system_date, :ls_branch, :ls_batchid, :ls_cons_trans_diaria, :ld_system_amt, :ld_bank_amt;
	
LOOP

CLOSE cur_matchtrans;



// *****************************************************************************


// Part2 - Transacciones que estan en el sistema pero no en el banco!
DECLARE cur_systemtrans CURSOR FOR
select convert(varchar,eb.RECONCILIATIONDATE,101), 
	    dba.sfGetGroupTop(ea.id_group_trans_diaria),
	    ea.cons_trans_diaria, 
	    ea.credit_trans_diaria
  from Envio.dba.transaccion_diaria_payee as ea, 
       Envio.dba.TRANSACCION_DIARIA_BANCO_PAYEE as eb
 where ea.cons_trans_diaria = eb.cons_trans_diaria
   and eb.id_cuenta_banco = '153910251062'
   and eb.RECONCILIATIONDATE between :ld_fecha1 and :ld_fecha2
   and ea.id_concepto_contable = 'CCD'
   and not exists ( select 'x'
					       from ViaChecks.dbo.balancecredit as d
					      where d.creditTransactionId = ea.cons_trans_diaria);


OPEN cur_systemtrans;

FETCH cur_systemtrans INTO :ls_system_date, :ls_branch, :ls_cons_trans_diaria, :ld_system_amt;

DO WHILE SQLCA.sqlcode = 0

	ll_row = dw_1.insertrow(0)
	
	dw_1.setitem(ll_row,"TypeMatch","Registros Solo En Sistema")
	
	dw_1.setitem(ll_row,"FechaBancoEnCentral",ls_system_date)
	dw_1.setitem(ll_row,"batchid","N/A")
	dw_1.setitem(ll_row,"creditTransactionId",ls_cons_trans_diaria)
	dw_1.setitem(ll_row,"name",ls_branch)
	dw_1.setitem(ll_row,"ValorAcreditadoCentral",ld_system_amt)

	FETCH cur_systemtrans INTO :ls_system_date, :ls_branch, :ls_cons_trans_diaria, :ld_system_amt;
	
LOOP

CLOSE cur_systemtrans;


// *****************************************************************************


// Part3 - Transacciones que estan en el banco pero no en el sistema!
DECLARE cur_banktrans CURSOR FOR
select convert(varchar,a.datedeposit,101), 
		 f.name, 
		 ltrim(str(b.batchid)) + '-' +  ltrim(str(b.checkid)), 
		 b.amount
  from ViaChecks.dbo.ackFromBank as a,
	   ViaChecks.dbo.checktable as b, 
	   ViaChecks.dbo.batchtable as e, 
	   ViaChecks.dbo.customer_location as f
 where a.irn=b.irn
   and e.batchid = b.batchid
   and e.locationid = f.id   
   and a.DATEDEPOSIT between :ld_fecha1 and :ld_fecha2
   and not exists ( select 'x' 
                    from ViaChecks.dbo.balancecredititems as c
					where c.checkid = b.checkid)
  USING SQLVIACHECKS;					
					



OPEN cur_banktrans;

FETCH cur_banktrans INTO :ls_bank_date, :ls_branch, :ls_batchid, :ld_bank_amt;

DO WHILE SQLVIACHECKS.sqlcode = 0

	ll_row = dw_1.insertrow(0)
	
	dw_1.setitem(ll_row,"TypeMatch","Registros Solo En Banco")
	
	dw_1.setitem(ll_row,"FechaEnUSBank",ls_bank_date)
	dw_1.setitem(ll_row,"batchid",ls_batchid)
	dw_1.setitem(ll_row,"name",upper(ls_branch))
	dw_1.setitem(ll_row,"ValorAcreditadoUsBank",ld_bank_amt)	

	FETCH cur_banktrans INTO :ls_bank_date, :ls_branch, :ls_batchid, :ld_bank_amt;
	
LOOP

CLOSE cur_banktrans;


// *****************************************************************************


SQLVIACHECKS.of_disconnect()

destroy SQLVIACHECKS

dw_1.setfocus()

Setpointer(Arrow!)


end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_viacheckweb_report
end type

type em_date1 from w2_master_report_dates`em_date1 within w_viacheckweb_report
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_viacheckweb_report
end type

type em_date2 from w2_master_report_dates`em_date2 within w_viacheckweb_report
end type

type dw_1 from w2_master_report_dates`dw_1 within w_viacheckweb_report
string dataobject = "dw_viacheckweb_report"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_viacheckweb_report
end type

