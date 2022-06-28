$PBExportHeader$w_viacheckweb_ack.srw
forward
global type w_viacheckweb_ack from w_master
end type
type sle_new2 from singlelineedit within w_viacheckweb_ack
end type
type sle_existing2 from singlelineedit within w_viacheckweb_ack
end type
type sle_errors2 from singlelineedit within w_viacheckweb_ack
end type
type st_9 from statictext within w_viacheckweb_ack
end type
type st_8 from statictext within w_viacheckweb_ack
end type
type st_7 from statictext within w_viacheckweb_ack
end type
type st_6 from statictext within w_viacheckweb_ack
end type
type st_5 from statictext within w_viacheckweb_ack
end type
type em_dateto from editmask within w_viacheckweb_ack
end type
type em_datefrom from editmask within w_viacheckweb_ack
end type
type pb_updatedates from picturebutton within w_viacheckweb_ack
end type
type sle_errors from singlelineedit within w_viacheckweb_ack
end type
type sle_existing from singlelineedit within w_viacheckweb_ack
end type
type sle_new from singlelineedit within w_viacheckweb_ack
end type
type st_4 from statictext within w_viacheckweb_ack
end type
type st_3 from statictext within w_viacheckweb_ack
end type
type st_2 from statictext within w_viacheckweb_ack
end type
type dw_load from datawindow within w_viacheckweb_ack
end type
type pb_processfile from picturebutton within w_viacheckweb_ack
end type
type st_1 from statictext within w_viacheckweb_ack
end type
type pb_select from picturebutton within w_viacheckweb_ack
end type
type sle_filename from singlelineedit within w_viacheckweb_ack
end type
type gb_1 from groupbox within w_viacheckweb_ack
end type
type gb_2 from groupbox within w_viacheckweb_ack
end type
type gb_3 from groupbox within w_viacheckweb_ack
end type
type gb_4 from groupbox within w_viacheckweb_ack
end type
end forward

global type w_viacheckweb_ack from w_master
integer width = 2331
integer height = 1668
string title = "Viacheck"
sle_new2 sle_new2
sle_existing2 sle_existing2
sle_errors2 sle_errors2
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
em_dateto em_dateto
em_datefrom em_datefrom
pb_updatedates pb_updatedates
sle_errors sle_errors
sle_existing sle_existing
sle_new sle_new
st_4 st_4
st_3 st_3
st_2 st_2
dw_load dw_load
pb_processfile pb_processfile
st_1 st_1
pb_select pb_select
sle_filename sle_filename
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_viacheckweb_ack w_viacheckweb_ack

type variables
String is_filepath
end variables

on w_viacheckweb_ack.create
int iCurrent
call super::create
this.sle_new2=create sle_new2
this.sle_existing2=create sle_existing2
this.sle_errors2=create sle_errors2
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.em_dateto=create em_dateto
this.em_datefrom=create em_datefrom
this.pb_updatedates=create pb_updatedates
this.sle_errors=create sle_errors
this.sle_existing=create sle_existing
this.sle_new=create sle_new
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.dw_load=create dw_load
this.pb_processfile=create pb_processfile
this.st_1=create st_1
this.pb_select=create pb_select
this.sle_filename=create sle_filename
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_new2
this.Control[iCurrent+2]=this.sle_existing2
this.Control[iCurrent+3]=this.sle_errors2
this.Control[iCurrent+4]=this.st_9
this.Control[iCurrent+5]=this.st_8
this.Control[iCurrent+6]=this.st_7
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.em_dateto
this.Control[iCurrent+10]=this.em_datefrom
this.Control[iCurrent+11]=this.pb_updatedates
this.Control[iCurrent+12]=this.sle_errors
this.Control[iCurrent+13]=this.sle_existing
this.Control[iCurrent+14]=this.sle_new
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.dw_load
this.Control[iCurrent+19]=this.pb_processfile
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.pb_select
this.Control[iCurrent+22]=this.sle_filename
this.Control[iCurrent+23]=this.gb_1
this.Control[iCurrent+24]=this.gb_2
this.Control[iCurrent+25]=this.gb_3
this.Control[iCurrent+26]=this.gb_4
end on

on w_viacheckweb_ack.destroy
call super::destroy
destroy(this.sle_new2)
destroy(this.sle_existing2)
destroy(this.sle_errors2)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.em_dateto)
destroy(this.em_datefrom)
destroy(this.pb_updatedates)
destroy(this.sle_errors)
destroy(this.sle_existing)
destroy(this.sle_new)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_load)
destroy(this.pb_processfile)
destroy(this.st_1)
destroy(this.pb_select)
destroy(this.sle_filename)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

type sle_new2 from singlelineedit within w_viacheckweb_ack
integer x = 635
integer y = 1212
integer width = 402
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217747
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_existing2 from singlelineedit within w_viacheckweb_ack
integer x = 635
integer y = 1288
integer width = 402
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217747
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_errors2 from singlelineedit within w_viacheckweb_ack
integer x = 635
integer y = 1364
integer width = 402
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217747
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_viacheckweb_ack
integer x = 91
integer y = 1376
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros Con Error:"
boolean focusrectangle = false
end type

type st_8 from statictext within w_viacheckweb_ack
integer x = 91
integer y = 1300
integer width = 576
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fechas Buenas:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_viacheckweb_ack
integer x = 91
integer y = 1224
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fechas Corregidas:"
boolean focusrectangle = false
end type

type st_6 from statictext within w_viacheckweb_ack
integer x = 1266
integer y = 956
integer width = 50
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "y"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_viacheckweb_ack
integer x = 91
integer y = 960
integer width = 795
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Revisar Fechas en el Sistema Entre:"
boolean focusrectangle = false
end type

type em_dateto from editmask within w_viacheckweb_ack
integer x = 1335
integer y = 948
integer width = 329
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type em_datefrom from editmask within w_viacheckweb_ack
integer x = 910
integer y = 948
integer width = 329
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type pb_updatedates from picturebutton within w_viacheckweb_ack
integer x = 1883
integer y = 924
integer width = 128
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\ViamericasMT\Imagenes\tit-reconciliacion.gif"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;
// Recorre los ACKs del US Bank entre las fechas seleccionadas,
// Obtiene los codigos de transaccione en el sistema (ViaCentral)
// revisa que la cuenta, tipo de transaccion y amount correspondan
// y les arregla la fecha de banco si es necesario.

long ll_new, ll_existing, ll_errors
DateTime ld_datefrom, ld_dateto

if em_datefrom.text = '00/00/0000' or date(em_datefrom.text) < date('2000-00-00') then
	Messagebox("Error","Por favor revise la fecha inicial.",StopSign!)
	return
end if

if em_dateto.text = '00/00/0000' or date(em_dateto.text) < date(em_datefrom.text) then
	Messagebox("Error","Por favor revise la fecha final.",StopSign!)
	return
end if


if Messagebox("Confirmación","Esta seguro que desea revisar las fechas del sistema para los datos importados entre "+em_datefrom.text+ ' y '+ em_dateto.text +"?",Question!,YesNo!) <> 1 then
	Messagebox("Operación Cancelada","No se proceso el archivo, el proceso fue cancelado.",Exclamation!)
	return
end if


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

ll_new = 0
ll_existing = 0
ll_errors = 0


ld_datefrom = datetime(date(em_datefrom.text),time('00:00:00'))
ld_dateto = datetime(date(em_dateto.text),time('23:59:59'))

Double ld_cons_trans
Decimal ld_bank_amt, ld_system_amt
DateTime ld_bank_date, ld_system_date
String ls_batchid, ls_id_concepto, ls_system_acc


// Recorre los totales por codigo de transaccion (cons_trans_diaria) y la 
// con la fecha obtenida de la importacion de US Bank.
DECLARE cur_banktrans CURSOR FOR
 SELECT d.creditTransactionId, 
 		  a.datedeposit,
        b.batchid, 
		  sum(b.amount) as ValorAcreditadoUsBank 
   FROM ViaChecks.dbo.ackFromBank as a, 
	     ViaChecks.dbo.checktable as b, 
	     ViaChecks.dbo.balancecredititems as c, 
	     ViaChecks.dbo.balancecredit as d
  WHERE a.irn=b.irn
    AND b.checkid = c.checkid
    AND c.creditid = d.creditId
    AND a.DATEDEPOSIT between :ld_datefrom and :ld_dateto
  GROUP BY d.creditTransactionId, 
 		  a.datedeposit,
        b.batchid
  ORDER BY 1
  USING SQLVIACHECKS;

OPEN cur_banktrans;

FETCH cur_banktrans INTO :ld_cons_trans, :ld_bank_date, :ls_batchid, :ld_bank_amt;

DO WHILE SQLVIACHECKS.sqlcode = 0
  
	SELECT t.id_concepto_contable,
			 t.credit_trans_diaria, 
			 b.reconciliationdate,
			 rtrim(b.id_cuenta_banco)
	  INTO :ls_id_concepto,
		    :ld_system_amt,
  	       :ld_system_date,
			 :ls_system_acc
	  FROM dba.TRANSACCION_DIARIA_PAYEE t, dba.TRANSACCION_DIARIA_BANCO_PAYEE b
	 WHERE t.cons_trans_diaria = b.cons_trans_diaria
		AND t.cons_trans_diaria = :ld_cons_trans;

	if ls_id_concepto = 'CCD' then		
		if ls_system_acc = '153910251062' then
			if abs(ld_bank_amt - ld_system_amt) < 0.02 then
				if string(ld_bank_date,"mm/dd/yyyy") = String(ld_system_date,"mm/dd/yyyy") then
					// El registro era correcto								
					ll_existing += 1	
				else
					// Se arregla la fecha bancaria en el sistema
										
					UPDATE dba.TRANSACCION_DIARIA_BANCO_PAYEE
					   SET reconciliationdate = :ld_bank_date
					 WHERE cons_trans_diaria = :ld_cons_trans;
										
					if SQLCA.SQLCODE = 0 then
						ll_new += 1			
					else
						// Fallo el update
						ll_errors += 1											
					end if
					
				end if
			else
				// El Amount No Corresponde
				ll_errors += 1					
			end if			
		else
			// Cuenta Bancaria del sistema no es US Bank
			ll_errors += 1		
		end if
	else
		// Concepto contable del credito no corresponde!
		ll_errors += 1
	end if

	FETCH cur_banktrans INTO :ld_cons_trans, :ld_bank_date, :ls_batchid, :ld_bank_amt;
	
LOOP

close cur_banktrans;

sle_new2.text = String(ll_new)
sle_existing2.text = String(ll_existing)
sle_errors2.text = String(ll_errors)


SQLVIACHECKS.of_disconnect()

destroy SQLVIACHECKS

SetPointer(Arrow!)





end event

type sle_errors from singlelineedit within w_viacheckweb_ack
integer x = 640
integer y = 556
integer width = 402
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217747
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_existing from singlelineedit within w_viacheckweb_ack
integer x = 640
integer y = 480
integer width = 402
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217747
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_new from singlelineedit within w_viacheckweb_ack
integer x = 640
integer y = 404
integer width = 402
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217747
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_viacheckweb_ack
integer x = 96
integer y = 568
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros Con Error:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_viacheckweb_ack
integer x = 96
integer y = 492
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registros Existentes:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_viacheckweb_ack
integer x = 96
integer y = 416
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nuevos Registros:"
boolean focusrectangle = false
end type

type dw_load from datawindow within w_viacheckweb_ack
boolean visible = false
integer x = 2441
integer y = 1052
integer width = 1403
integer height = 592
boolean enabled = false
string dataobject = "dw_viacheck_ack"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

type pb_processfile from picturebutton within w_viacheckweb_ack
integer x = 2034
integer y = 92
integer width = 128
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "C:\ViamericasMT\Imagenes\tit-reconciliacion.gif"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Procesar Archivo"
end type

event clicked;
// Carga en la tabla de ACK el detalle de IRS obtenido de la pagina de US Bank
// desde el reporte de historico (export a excel, luego SAVE AS csv)
// La datawindow se usa de manera temporal para leer los datos del csv y recorrerlos


long ll_retun, ll_row, ll_new, ll_existing, ll_errors, ll_cont
String ls_cadena
String ls_IRN,ls_BANKNUMBER,ls_ACCOUNTNUMBER,ls_CHECKNUMBER,ls_AMOUNT,ls_CAPTUREDATE,ls_CAPTURETIME
DateTime	ldt_DateDeposit

if Messagebox("Confirmación","Esta seguro que desea procesar el archivo "+sle_filename.text+"?",Question!,YesNo!) <> 1 then
	Messagebox("Operación Cancelada","No se proceso el archivo, el proceso fue cancelado.",Exclamation!)
	return
end if

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

ll_new = 0
ll_existing = 0
ll_errors = 0


dw_load.reset()

ll_retun = dw_load.ImportFile(is_filepath)

if ll_retun < 0 then
	Messagebox("Error","Error abriendo el archivo "+is_filepath+ " asegurese que el archivo no este siendo utilizado y que sea el formato correcto.",StopSign!)
	Return
end if


for ll_row = 1 to dw_load.rowcount()

		ls_IRN = dw_load.getitemstring(ll_row,"IRN")
		ls_BANKNUMBER = dw_load.getitemstring(ll_row,"BANKNUMBER")
		ls_ACCOUNTNUMBER = dw_load.getitemstring(ll_row,"ACCOUNTNUMBER")
		ls_CHECKNUMBER = dw_load.getitemstring(ll_row,"CHECKNUMBER")
		ls_AMOUNT = dw_load.getitemstring(ll_row,"AMOUNT")
		ls_CAPTUREDATE = dw_load.getitemstring(ll_row,"CAPTUREDATE")
		ls_CAPTURETIME = dw_load.getitemstring(ll_row,"CAPTURETIME")

//    Other available fields:
//    TRDEPOSITID
//		LOCATION
//		ENDPOINT
//		ACHTYPE
//		STATUS

	if upper(ls_IRN) = "ITEMIRN" then
		// skip-header-row
	else		
		
		
		// Actualiza los campos de fechas de la pantalla con la primera
		// y ultima fecha de los archivos importados
		if date(ls_CAPTUREDATE) < date(em_datefrom.text) or em_datefrom.text = '' then em_datefrom.text = ls_CAPTUREDATE								
		if date(ls_CAPTUREDATE) > date(em_dateto.text) or em_dateto.text = '' then em_dateto.text = ls_CAPTUREDATE	

		
		SELECT count(*) 
		  INTO :ll_cont
		  FROM ViaChecks.dbo.ackFromBank
		 WHERE IRN = :ls_IRN
  	    USING SQLVIACHECKS;
	
		if ll_cont = 0 then
	
			ldt_DateDeposit = datetime(date(ls_CAPTUREDATE),time(ls_CAPTURETIME))
				
			INSERT INTO ViaChecks.dbo.ackFromBank
						  (IRN
						  ,DATEDEPOSIT
						  ,ACCOUNT
						  ,CHECK_
						  ,TRANSIT)
				  VALUES
						  (:ls_IRN
						  ,:ldt_DateDeposit
						  ,:ls_ACCOUNTNUMBER
						  ,:ls_CHECKNUMBER
						  ,:ls_BANKNUMBER) 
				  USING SQLVIACHECKS;
		
			IF SQLVIACHECKS.SQLCODE <> 0 then
				ll_errors += 1
			else
				ll_new += 1
			end if

		else // Count > 0
			
			// revisa si el existente es igual (bank/check/acc)
			SELECT count(*) 
			  INTO :ll_cont
			  FROM ViaChecks.dbo.ackFromBank
			 WHERE IRN = :ls_IRN
			   AND ACCOUNT = :ls_ACCOUNTNUMBER
				AND CHECK_ = :ls_CHECKNUMBER
				AND TRANSIT = :ls_BANKNUMBER
			 USING SQLVIACHECKS;

			if ll_cont > 0 then
				ll_existing += 1
			else
				ll_errors += 1
			end if

		end if

	end if

next

dw_load.reset()

sle_new.text = String(ll_new)
sle_existing.text = String(ll_existing)
sle_errors.text = String(ll_errors)

sle_new2.text = ''
sle_existing2.text = ''
sle_errors2.text = ''

SQLVIACHECKS.of_disconnect()

destroy SQLVIACHECKS

SetPointer(Arrow!)

Messagebox("Proceso Terminado","El Archivo ha sido importado a la base de datos")

end event

type st_1 from statictext within w_viacheckweb_ack
integer x = 87
integer y = 116
integer width = 722
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo Historico US Bank (CSV):"
boolean focusrectangle = false
end type

type pb_select from picturebutton within w_viacheckweb_ack
integer x = 1883
integer y = 92
integer width = 128
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\ViamericasMT\Imagenes\btnImportar.gif"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Cargar Archivo"
end type

event clicked;String ls_filepath, ls_filename
Integer li_rtn

li_rtn = GetFileOpenName("Select File", &
 								 ls_filepath, ls_filename, "CSV", &
								 + "Text Files (*.CSV),*.CSV,", &
								 "U:\", 18)

IF li_rtn < 1 THEN return

is_filepath = ls_filepath
sle_filename.text = ls_filename

sle_new.text = ''
sle_existing.text = ''
sle_errors.text = ''

//em_datefrom.text = ''
//em_dateto.text = ''
end event

type sle_filename from singlelineedit within w_viacheckweb_ack
integer x = 841
integer y = 104
integer width = 1019
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_viacheckweb_ack
integer x = 27
integer y = 1112
integer width = 2203
integer height = 396
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resultado Revision"
end type

type gb_2 from groupbox within w_viacheckweb_ack
integer x = 37
integer y = 840
integer width = 2203
integer height = 248
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Revision Fechas Sistema"
end type

type gb_3 from groupbox within w_viacheckweb_ack
integer x = 37
integer y = 20
integer width = 2203
integer height = 248
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Importacion Datos US Bank"
end type

type gb_4 from groupbox within w_viacheckweb_ack
integer x = 37
integer y = 292
integer width = 2203
integer height = 396
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resultado Importacion"
end type

