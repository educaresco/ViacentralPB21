$PBExportHeader$w_pipeline_database.srw
forward
global type w_pipeline_database from window
end type
type st_7 from statictext within w_pipeline_database
end type
type lb_errors from listbox within w_pipeline_database
end type
type sle_1 from singlelineedit within w_pipeline_database
end type
type cb_2 from commandbutton within w_pipeline_database
end type
type st_6 from statictext within w_pipeline_database
end type
type cb_1 from commandbutton within w_pipeline_database
end type
type cbx_1 from checkbox within w_pipeline_database
end type
type cb_copydb from commandbutton within w_pipeline_database
end type
type lb_mensajes from listbox within w_pipeline_database
end type
type uo_progress from u_progressbar within w_pipeline_database
end type
type st_2 from statictext within w_pipeline_database
end type
type st_1 from statictext within w_pipeline_database
end type
type em_branch from editmask within w_pipeline_database
end type
type dw_1 from datawindow within w_pipeline_database
end type
type cb_execute from commandbutton within w_pipeline_database
end type
type st_4 from statictext within w_pipeline_database
end type
type sle_intentos from singlelineedit within w_pipeline_database
end type
type st_3 from statictext within w_pipeline_database
end type
type st_5 from statictext within w_pipeline_database
end type
end forward

global type w_pipeline_database from window
boolean visible = false
integer x = 5
integer y = 224
integer width = 2930
integer height = 1264
boolean titlebar = true
string title = "Create Database"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_7 st_7
lb_errors lb_errors
sle_1 sle_1
cb_2 cb_2
st_6 st_6
cb_1 cb_1
cbx_1 cbx_1
cb_copydb cb_copydb
lb_mensajes lb_mensajes
uo_progress uo_progress
st_2 st_2
st_1 st_1
em_branch em_branch
dw_1 dw_1
cb_execute cb_execute
st_4 st_4
sle_intentos sle_intentos
st_3 st_3
st_5 st_5
end type
global w_pipeline_database w_pipeline_database

type variables
long	il_intento = 0
Boolean	ib_actualizado=False
end variables

on w_pipeline_database.create
this.st_7=create st_7
this.lb_errors=create lb_errors
this.sle_1=create sle_1
this.cb_2=create cb_2
this.st_6=create st_6
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.cb_copydb=create cb_copydb
this.lb_mensajes=create lb_mensajes
this.uo_progress=create uo_progress
this.st_2=create st_2
this.st_1=create st_1
this.em_branch=create em_branch
this.dw_1=create dw_1
this.cb_execute=create cb_execute
this.st_4=create st_4
this.sle_intentos=create sle_intentos
this.st_3=create st_3
this.st_5=create st_5
this.Control[]={this.st_7,&
this.lb_errors,&
this.sle_1,&
this.cb_2,&
this.st_6,&
this.cb_1,&
this.cbx_1,&
this.cb_copydb,&
this.lb_mensajes,&
this.uo_progress,&
this.st_2,&
this.st_1,&
this.em_branch,&
this.dw_1,&
this.cb_execute,&
this.st_4,&
this.sle_intentos,&
this.st_3,&
this.st_5}
end on

on w_pipeline_database.destroy
destroy(this.st_7)
destroy(this.lb_errors)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.st_6)
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.cb_copydb)
destroy(this.lb_mensajes)
destroy(this.uo_progress)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_branch)
destroy(this.dw_1)
destroy(this.cb_execute)
destroy(this.st_4)
destroy(this.sle_intentos)
destroy(this.st_3)
destroy(this.st_5)
end on

event open;run("dtsrunui.exe")

Close(this)
//X=1
//Y=1
//Show()
//
end event

event close;//FileDelete("c:\DINERO\vaciado\emptydb\copydb.bat")
end event

type st_7 from statictext within w_pipeline_database
integer x = 1659
integer y = 12
integer width = 247
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
string text = "Errors:"
boolean focusrectangle = false
end type

type lb_errors from listbox within w_pipeline_database
integer x = 1646
integer y = 72
integer width = 1234
integer height = 1072
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_pipeline_database
integer x = 3337
integer y = 796
integer width = 1189
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_pipeline_database
integer x = 27
integer y = 328
integer width = 1591
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear Data"
end type

event clicked;Setpointer(hourglass!)

lb_errors.reset()

STRING	ls_branch_INSTA,ls_zona, ls_prefijo

Date	ld_fecha1
Time	ld_hora1

double	ld_telex,ld_urgency,ld_exchange,ld_handling,ld_total,ld_porc_comm,ld_total_pay,ld_exchange_comp,ld_telex_comp,ld_ref,		&
			ld_diference,ld_total_modo_pago,ld_comm_payee,ld_total_modo_pago_comp,ld_fee_rate, ld_nombres_vacios
string	ls_recom, ls_mod_pay,ls_acc_rec,ls_mod_pay_currency,ls_trans,ls_bank,ls_clave,ls_toll_free

Double		ld_rate,ld_amount
Datetime		ld_fecha,ld_hora
string		ls_payment,ls_branch_pay,ls_cashier,ls_name_rec,ls_phone1_rec,ls_phone2_rec,ls_notes,ls_modo_pago

ls_branch_INSTA = em_branch.text
long	ll_cont = 0

datetime ld_typed_date
string ls_email_sender, ls_sen_accrouting , ls_sen_accbank , ls_sen_accnumber , ls_sen_paymenttype
string ls_email_receiver, ls_typeid , ls_numid , ls_rec_accrouting , ls_rec_accbank, ls_rec_accnumber, ls_rec_paymenttype

string ls_date

ls_date = string(today(),'yyyy-mm-dd')

  SELECT Count(*)  
    INTO :ll_cont  
    FROM dba.branch  
   WHERE dba.branch.id_branch = :ls_branch_INSTA  USING SQLCA ;

if ll_cont = 0 then
	Messagebox("Error","Branch Inexistente")
	return
end if


  SELECT Count(*)  
    INTO :ld_nombres_vacios  
    FROM dba.RECEIVER  
   WHERE ( dba.RECEIVER.ID_BRANCH = :ls_branch_INSTA ) AND  
         ( dba.RECEIVER.rec_fname is null ) and id_receiver > 0
USING SQLCA ;

if  ld_nombres_vacios > 0 then
	Messagebox("Error","Tiene Nombres Vacios. Realice una actualizacion con SQL Server Primero"+ls_branch_INSTA)
	return
end if


n_tr		X1
X1 = Create n_tr

uo_progress.of_SetMaximum(30) //ojo colocar cuantos pipeline
uo_progress.of_SetPosition(0)
uo_progress.of_Reset()

string  ls_country , ls_name,  ls_flag,  ls_new_rate  , ls_state, ls_city, ls_main
string	ls_branch, ls_concepto
Double	ld_cons,  ld_receiver
Date	 ld_date

	X1.DBMS = "ODBC"
	X1.AUTOCOMMIT = FALSE
	X1.DBParm = "ConnectString='DSN=Vaciado;UID="+'dba'+";"+"PWD="+'"'+'viadatabase2004'+'"'+"'"

	if X1.of_connect() <> 0 then
		MessageBox("Cannot Connect to Database", SQLCA.sqlerrtext,stopsign!)
		halt close
		return
	end if
	 
	/// COUNTRY
	
	 DECLARE COUNTRY CURSOR FOR  
    SELECT dba.COUNTRY.ID_COUNTRY,   
           dba.COUNTRY.NAME_COUNTRY,   
           dba.COUNTRY.FLAG_COUNTRY,   
           dba.COUNTRY.NEW_RATE  
     FROM  dba.COUNTRY USING SQLCA ;

open COUNTRY ;
Fetch COUNTRY into :ls_country, :ls_name, :ls_flag, :ls_new_rate ;
DO WHILE SQLCA.sqlcode = 0
	sle_1.text 	= ls_country
	ls_country 	= Trim(ls_country)
	ls_name 		= upper(Trim(ls_name))
	ls_flag 		= Trim(ls_flag)
	ls_new_rate = Trim(ls_new_rate)
			
		  INSERT INTO dba.COUNTRY  
         ( ID_COUNTRY,   
           NAME_COUNTRY,   
           FLAG_COUNTRY,   
           NEW_RATE )  
  			VALUES ( :ls_country,   
           :ls_name,   
           :ls_flag,   
           :ls_new_rate )  USING X1 ;
		IF x1.sqlcode <> 0 Then			
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF
	
	Fetch COUNTRY into :ls_country, :ls_name, :ls_flag, :ls_new_rate ;
LOOP

close COUNTRY ;

lb_mensajes.additem("Table: Country ------------------->              ")
st_2.Text = 'Table Country...'
uo_progress.of_Increment(1) 


	
/////////////////////////////////////

 DECLARE STATE CURSOR FOR  
  SELECT dba.STATE.ID_STATE,   
         dba.STATE.ID_COUNTRY,   
         dba.STATE.NAME_STATE,   
         dba.STATE.FLAG_STATE  
    FROM dba.STATE USING SQLCA ;


OPEN STATE ;
Fetch STATE into :ls_state, :ls_country, :ls_name, :ls_flag ;
DO WHILE SQLCA.sqlcode = 0
	sle_1.text 	= ls_country
	ls_state    = Trim(ls_state)
	ls_country 	= upper(Trim(ls_country))
	ls_name 		= upper(Trim(ls_name))
	ls_flag 		= Trim(ls_flag)
	
		    INSERT INTO dba.STATE  
         ( ID_STATE,   
           ID_COUNTRY,   
           NAME_STATE,   
           FLAG_STATE )  
          VALUES ( :ls_state,   
           :ls_country,   
           :ls_name,   
           :ls_flag )  USING X1 ;
		IF x1.sqlcode <> 0 Then			
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF

	
	Fetch STATE into :ls_state, :ls_country, :ls_name, :ls_flag ;
LOOP
CLOSE STATE ;

lb_mensajes.additem("Table: State ------------------->              ")
st_2.Text = 'Table Country...'
uo_progress.of_Increment(1) 
	

	
/////////////////////////////////////

  DECLARE CITY CURSOR FOR  
  SELECT dba.CITY.ID_CITY,   
         dba.CITY.ID_STATE,   
         dba.CITY.ID_COUNTRY,   
         dba.CITY.NAME_CITY,   
         dba.CITY.FLAG_CITY  
    FROM dba.CITY   USING SQLCA ;



OPEN CITY ;
Fetch CITY into :ls_city, :ls_state, :ls_country, :ls_name, :ls_flag ;
DO WHILE SQLCA.sqlcode = 0
	sle_1.text 	= ls_country
	ls_city     = Trim(ls_city)
	ls_state    = upper(Trim(ls_state))
	ls_country 	= upper(Trim(ls_country))
	ls_name 		= Trim(ls_name)
	ls_flag 		= Trim(ls_flag)
	
		     INSERT INTO dba.CITY  
         ( ID_CITY,   
           ID_STATE,   
           ID_COUNTRY,   
           NAME_CITY,   
           LONG_PHONE_CITY,   
           FLAG_CITY )  
  VALUES ( :ls_city,   
           :ls_state,   
           :ls_country,   
           :ls_name,   
           0,   
           :ls_flag )   USING X1 ;

		IF x1.sqlcode <> 0 Then			
			//Messagebox('',x1.sqlerrtext + "  " + ls_city + "  " +ls_name)
			lb_errors.additem(x1.sqlerrtext)
		End IF

	
	Fetch CITY into :ls_city, :ls_state, :ls_country, :ls_name, :ls_flag ;
LOOP
CLOSE CITY ;

lb_mensajes.additem("Table: City ------------------->              ")
st_2.Text = 'Table City...'
uo_progress.of_Increment(1) 
	
//TYPE_BRANCH

INSERT INTO dba.TYPE_BRANCH VALUES ('A','BOTH') USING X1 ;
INSERT INTO dba.TYPE_BRANCH VALUES ('P','PAYEE') USING X1 ;
INSERT INTO dba.TYPE_BRANCH VALUES ('R','AGENT') USING X1 ;
	
lb_mensajes.additem("Table: Type Branch ------------------->              ")
st_2.Text = 'Table Type Branch...'
uo_progress.of_Increment(1) 

//FLAG_BRANCH	

INSERT INTO dba.FLAG_BRANCH VALUES ('A','ACTIVA') USING X1 ;
INSERT INTO dba.FLAG_BRANCH VALUES ('H','HOLD') USING X1 ;
INSERT INTO dba.FLAG_BRANCH VALUES ('I','INACTIVA') USING X1 ;
	
lb_mensajes.additem("Table: Flag Branch ------------------->              ")
st_2.Text = 'Table Flag Branch...'
uo_progress.of_Increment(1) 	

//COMPANY
 INSERT INTO dba.COMPANY VALUES (
	'VIA',
	'VIAMERICAS',
	'02609',
	'MD',
	'USA',
	NULL,
	'4641 MONTGOMERY AVE SUITE 400',
	'8004017626',
	'8004908147',
	'81',
	NULL,
	20814) USING X1;

	
lb_mensajes.additem("Table: Company ------------------->              ")
st_2.Text = 'Table Company...'
uo_progress.of_Increment(1) 	


////// type id sender \\\\\\\\\

INSERT INTO dba.type_id_sender VALUES ('BF','CPF/CNPJ') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('CC','CEDULA CIUDADANIA') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('DN','DOCUMENTO NACIONAL') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('EA','EMPLOYMENT AUTORIZAT') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('GC','GREEN CARD') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('ID','IDENTIFICATION CARD') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('LD','DRIVERS LICENSE') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('LE','LIBRETA ELECTORAL') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('LP','LEARNER PERMIT') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('NN','NONE') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('OT','OTROS') USING X1 ;
INSERT INTO dba.type_id_sender VALUES ('PA','PASSPORT') USING X1 ;

lb_mensajes.additem("Table: Type Id Sender ------------------->              ")
st_2.Text = 'Table Type Id Sender...'
uo_progress.of_Increment(1) 


///// GROUP BRANCH

 DECLARE GROUP_BRANCH CURSOR FOR  
  SELECT dba.GROUP_BRANCH.ID_MAIN_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH,
			dba.GROUP_BRANCH.GRO_COMPANYIDFOLIO
    FROM dba.GROUP_BRANCH  USING SQLCA ;

OPEN GROUP_BRANCH ;
FETCH GROUP_BRANCH INTO :ls_main, :ls_name,:ls_prefijo ;
DO WHILE SQLCA.sqlcode = 0
	ls_prefijo = TRIM(ls_prefijo)
	ls_main = TRIM(ls_main)
	ls_name = upper(TRIM(ls_name))
	
	  INSERT INTO dba.GROUP_BRANCH  
         ( ID_MAIN_BRANCH,   
           NAME_MAIN_BRANCH,   
           DATE_CREA_MAIN_BRANCH,   
           DIFERENCE_EXCHANGE,   
           PRIORIDAD_GROUP_BRANCH,   
           MODE_TRANS_GROUP,   
           MODEM_GROUP,   
           TYPE_GROUP,   
           DEBT_LIMIT,   
           CREDIT_GROUP,   
           DEBIT_GROUP,
			  GRO_COMPANYIDFOLIO)  
  VALUES ( :ls_main,   
           :ls_name,   
           :ls_date,   
           0,   
           0,   
           '00',   
           '0',   
           '0',   
           0,   
           0,   
           0,
			  :ls_prefijo)  USING X1 ;
			  
		IF x1.sqlcode <> 0 Then			
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF
		
			  FETCH GROUP_BRANCH INTO :ls_main, :ls_name,:ls_prefijo ;
LOOP
CLOSE GROUP_BRANCH ;

COMMIT USING X1 ;

lb_mensajes.additem("Table: Groups ------------------->              ")
st_2.Text = 'Table GROUP_BRANCH...'
uo_progress.of_Increment(1) 

//// BRANCH
string	ls_comp, ls_address, ls_type, ls_phone1, ls_phone2, ls_fax, ls_modem, ls_zip, ls_currency,ls_pin ;

 DECLARE BRANCH CURSOR FOR  
  SELECT dba.BRANCH.ID_BRANCH,   
         dba.BRANCH.ID_COMPANY,   
         dba.BRANCH.NAME_BRANCH,   
         dba.BRANCH.ADDRESS_BRANCH,   
         dba.BRANCH.ID_CITY,   
         dba.BRANCH.ID_STATE,   
         dba.BRANCH.ID_COUNTRY,   
         dba.BRANCH.ID_MAIN_BRANCH,   
         dba.BRANCH.id_flag_branch,   
         dba.BRANCH.ID_TYPE_BRANCH,   
         dba.BRANCH.PHONE1_BRANCH,   
         dba.BRANCH.PHONE2_BRANCH,   
         dba.BRANCH.FAX_BRANCH,   
         dba.BRANCH.MODEM_BRANCH,   
         dba.BRANCH.ZIP_BRANCH,   
         dba.BRANCH.CURRENCY_PAY_BRANCH,   
         dba.BRANCH.PREPARE_PIN  
    FROM dba.BRANCH USING SQLCA ;

OPEN BRANCH ;
FETCH BRANCH INTO :ls_branch,:ls_comp,:ls_name,:ls_address,:ls_city,:ls_state,:ls_country,:ls_main,:ls_flag,:ls_type,:ls_phone1,:ls_phone2,:ls_fax,:ls_modem,:ls_zip,:ls_currency, :ls_pin ;
DO WHILE SQLCA.SQLCODE = 0
	ls_branch  		= Trim(ls_branch)
	ls_comp 			= Trim(ls_comp)
	ls_name 			= upper(Trim(ls_name))
	ls_address 		= upper(Trim(ls_address))
	ls_city 			= Trim(ls_city)
	ls_state 		= Trim(ls_state)
	ls_country 		= Trim(ls_country)
	ls_main 			= Trim(ls_main)
	ls_flag 			= Trim(ls_flag)
	ls_type 			= Trim(ls_type)
	ls_phone1 		= Trim(ls_phone1)
	ls_phone2 		= Trim(ls_phone2)
	ls_fax 			= Trim(ls_fax)
	ls_modem 		= Trim(ls_modem)
	ls_zip 			= Trim(ls_zip)
	ls_currency 	= Trim(ls_currency)
	ls_pin  			= Trim(ls_pin)

	
	  INSERT INTO dba.BRANCH  
         ( ID_BRANCH,   
           ID_COMPANY,   
           NAME_BRANCH,   
           ADDRESS_BRANCH,   
           ID_CITY,   
           ID_STATE,   
           ID_COUNTRY,   
           ID_MAIN_BRANCH,   
           id_flag_branch,   
           ID_TYPE_BRANCH,   
           PHONE1_BRANCH,   
           PHONE2_BRANCH,   
           FAX_BRANCH,   
           MODEM_BRANCH,   
           DATE_CRE_BRANCH,   
           ZIP_BRANCH,   
           CURRENCY_PAY_BRANCH,   
           PREPARE_PIN )  
  VALUES ( :ls_branch,   
           :ls_comp,   
           :ls_name,   
           :ls_address,   
           :ls_city,   
           :ls_state,   
           :ls_country,
			  :ls_main,
           :ls_flag,   
           :ls_type,   
           :ls_phone1,   
           :ls_phone2,   
           :ls_fax,   
           :ls_modem,   
           :ls_date,   
           :ls_zip,   
           :ls_currency,   
           :ls_pin  )   USING X1 ;

		IF x1.sqlcode <> 0 Then			
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF	
	//Messagebox('',x1.sqlerrtext)	
	
	FETCH BRANCH INTO :ls_branch,:ls_comp,:ls_name,:ls_address,:ls_city,:ls_state,:ls_country,:ls_main,:ls_flag,:ls_type,:ls_phone1,:ls_phone2,:ls_fax,:ls_modem,:ls_zip,:ls_currency, :ls_pin ;

LOOP
CLOSE BRANCH ;

lb_mensajes.additem("Table: Branch ------------------->              ")
st_2.Text = 'Table Branch...'
uo_progress.of_Increment(1) 


//SENDER
Double		ld_sender, ls_phone1_sender, ls_phone2_sender, ls_zip_sender
string		ls_ADD_BITMAP_SENDER, ls_STATE_SENDER, ls_CITY_SENDER, ls_sen_fname, ls_sen_mname, ls_sen_lname, ls_sen_slname
Datetime    ld_DOB_SENDER 
Date			ld_DOB_SENDER1


 DECLARE SENDER CURSOR FOR  
  SELECT dba.SENDER.ID_SENDER,   
         dba.SENDER.ID_BRANCH,   
         dba.SENDER.NAME_SENDER,   
         dba.SENDER.ADDRES_SENDER,   
         dba.SENDER.PHONE1_SENDER,   
         dba.SENDER.PHONE2_SENDER,   
         dba.SENDER.ZIP_SENDER,   
         dba.SENDER.ID_CITY,   
         dba.SENDER.ID_STATE,   
         dba.SENDER.ID_COUNTRY,   
         dba.SENDER.ID_TYPE_ID_SENDER,   
         dba.SENDER.NUMBER_ID_SENDER,
			dba.SENDER.ADD_BITMAP_SENDER,   
         dba.SENDER.STATE_SENDER,   
         dba.SENDER.CITY_SENDER,   
         dba.SENDER.DOB_SENDER,   
         dba.SENDER.sen_fname,   
         dba.SENDER.sen_mname,   
         dba.SENDER.sen_lname,   
         dba.SENDER.sen_slname,
			dba.sender.email_sender, 
			dba.sender.sen_accrouting, 
			dba.sender.sen_accbank, 
			dba.sender.sen_accnumber, 
			dba.sender.sen_paymenttype
    FROM dba.SENDER  
	 WHERE dba.SENDER.ID_BRANCH = :ls_branch_insta  USING SQLCA ;

OPEN SENDER ;
FETCH SENDER INTO :ld_sender, :ls_branch, :ls_name,:ls_address,:ls_phone1_sender,:ls_phone2_sender,:ls_zip_sender,:ls_city,:ls_state,:ls_country,:ls_type,:ls_numid,:ls_ADD_BITMAP_SENDER,:ls_STATE_SENDER,:ls_CITY_SENDER,:ld_DOB_SENDER,:ls_sen_fname,:ls_sen_mname,:ls_sen_lname,:ls_sen_slname,:ls_email_sender, :ls_sen_accrouting, :ls_sen_accbank, :ls_sen_accnumber, :ls_sen_paymenttype;

DO WHILE SQLCA.SQLCODE = 0
	
	sle_1.text 		= string(ld_sender)
	ls_branch     	= Trim(ls_branch)
	ls_name     	= Trim(ls_name)
	ls_address     = Trim(ls_address)
	ls_city     	= Trim(ls_city)
	ls_state    	= Trim(ls_state)
	ls_country     = Trim(ls_country)    
	ls_type     	= Trim(ls_type)
	ls_numid     	= Trim(ls_numid)
	ld_DOB_SENDER1	= Date(ld_DOB_SENDER)
	
	  INSERT INTO dba.SENDER  
         ( ID_SENDER,   
           ID_BRANCH,   
           NAME_SENDER,   
           ADDRES_SENDER,   
           PHONE1_SENDER,   
           PHONE2_SENDER,   
           ZIP_SENDER,   
           ID_CITY,   
           ID_STATE,   
           ID_COUNTRY,   
           ID_TYPE_ID_SENDER,   
           NUMBER_ID_SENDER,   
           ADD_BITMAP_SENDER,   
           STATE_SENDER,   
           CITY_SENDER,   
           DOB_SENDER,
			  sen_fname,   
           sen_mname,   
           sen_lname,   
           sen_slname,
			  email_sender, 
			  sen_accrouting,
			  sen_accbank, 
			  sen_accnumber,
			  sen_paymenttype )  
  VALUES ( :ld_sender,   
           :ls_branch,   
           :ls_name,   
           :ls_address,   
           :ls_phone1_sender,   
           :ls_phone2_sender,   
           :ls_zip_sender,   
           :ls_city,   
           :ls_state,   
           :ls_country,   
           :ls_type,   
           :ls_numid,   
           :ls_ADD_BITMAP_SENDER,   
           :ls_STATE_SENDER,   
           :ls_CITY_SENDER,   
           :ld_DOB_SENDER1,
			  :ls_sen_fname,   
           :ls_sen_mname,   
           :ls_sen_lname,   
           :ls_sen_slname,
			  :ls_email_sender, 
			  :ls_sen_accrouting, :ls_sen_accbank, 
			  :ls_sen_accnumber, :ls_sen_paymenttype)   USING X1 ;
		
		IF x1.sqlcode <> 0 Then			
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
			Messagebox('',"Proceso Cancelado en sender"+string(ld_sender))			
			return
		End IF

	
	FETCH SENDER INTO :ld_sender, :ls_branch, :ls_name,:ls_address,:ls_phone1_sender,:ls_phone2_sender,:ls_zip_sender,:ls_city,:ls_state,:ls_country,:ls_type,:ls_numid,:ls_ADD_BITMAP_SENDER,:ls_STATE_SENDER,:ls_CITY_SENDER,:ld_DOB_SENDER,:ls_sen_fname,:ls_sen_mname,:ls_sen_lname,:ls_sen_slname,:ls_email_sender, :ls_sen_accrouting, :ls_sen_accbank, :ls_sen_accnumber, :ls_sen_paymenttype;
LOOP
CLOSE SENDER ;

lb_mensajes.additem("Table: Sender ------------------->              ")
st_2.Text = 'Table Sender...'
uo_progress.of_Increment(1) 

///////////  CASHIER
INSERT INTO dba.CASHIER (ID_CASHIER,NAME_CASHIER,ADD_CASHIER,DATE_CREATE_CASHIER,PASS_CASHIER) VALUES ('CH1','CASHIER1','TEMPORAL',:ls_date,'temp' ) USING X1 ;
INSERT INTO dba.CASHIER (ID_CASHIER,NAME_CASHIER,ADD_CASHIER,DATE_CREATE_CASHIER,PASS_CASHIER) VALUES ('ADM','ADMIN','ADMIN',:ls_date,'VIA1234' ) USING X1 ;
	
lb_mensajes.additem("Table: Cashier ------------------->              ")
st_2.Text = 'Table Cashier...'
uo_progress.of_Increment(1) 	

/////////CURRENCY \\\\
INSERT INTO dba.currency VALUES ('B','BOLIVARES') USING X1;
INSERT INTO dba.currency VALUES ('BL','BOLIVIANOS') USING X1;
INSERT INTO dba.currency VALUES ('CL','PESO') USING X1;
INSERT INTO dba.currency VALUES ('CN','COLON') USING X1;
INSERT INTO dba.currency VALUES ('D','DOLLAR') USING X1;
INSERT INTO dba.currency VALUES ('L','LEMPIRA') USING X1;
INSERT INTO dba.currency VALUES ('Q','QUETZAL') USING X1;
INSERT INTO dba.currency VALUES ('R','REAL') USING X1;

lb_mensajes.additem("Table: Currency ------------------->              ")
st_2.Text = 'Table Currency...'
uo_progress.of_Increment(1) 	



//////// MOD PAY CURRENCY \\\
INSERT INTO dba.MOD_PAY_CURRENCY VALUES ('N') USING X1 ;
INSERT INTO dba.MOD_PAY_CURRENCY VALUES ('D') USING X1 ;
	
lb_mensajes.additem("Table: Mode Pay Currency ------------------->              ")
st_2.Text = 'Table Mode Pay Currency...'
uo_progress.of_Increment(1) 
	
	
// FLAG RECEIVER \\
INSERT INTO dba.FLAG_RECEIVER VALUES ('A','VOID') USING X1 ;
INSERT INTO dba.FLAG_RECEIVER VALUES ('C','CANCEL') USING X1 ;
INSERT INTO dba.FLAG_RECEIVER VALUES ('H','HOLD') USING X1 ;
INSERT INTO dba.FLAG_RECEIVER VALUES ('I','DONE') USING X1 ;
INSERT INTO dba.FLAG_RECEIVER VALUES ('P','PAID') USING X1 ;
INSERT INTO dba.FLAG_RECEIVER VALUES ('T','TRANSFERED') USING X1 ;
	
	
lb_mensajes.additem("Table: Flag Receiver ------------------->              ")
st_2.Text = 'Table Flag Receiver...'
uo_progress.of_Increment(1) 	

// PAYMENT
INSERT INTO dba.PAYMENT VALUES ('C','CASH') USING X1 ;
	
lb_mensajes.additem("Table: Payment ------------------->              ")
st_2.Text = 'Table Payment...'
uo_progress.of_Increment(1) 

  INSERT INTO dba.BRANCH_INSTALACION  
         ( ID_BRANCH )  
  VALUES ( :ls_branch_insta )  USING X1 ;



lb_mensajes.additem("Table: Branch Installation ------------------->              ")
st_2.Text = 'Table Branch Installation...'
uo_progress.of_Increment(1) 

//ZONA
INSERT INTO dba.zona VALUES ('C','CENTRO') USING X1;
INSERT INTO dba.zona VALUES ('N','NORTE') USING X1;
INSERT INTO dba.zona VALUES ('NC','NORTEOCCIDENTE') USING X1;
INSERT INTO dba.zona VALUES ('NO','NOR ORIENTE') USING X1;
INSERT INTO dba.zona VALUES ('S','SUR') USING X1;
INSERT INTO dba.zona VALUES ('SO','SUR ORIENTE') USING X1;
INSERT INTO dba.zona VALUES ('A','TODA') USING X1;

COMMIT USING X1;

lb_mensajes.additem("Table: Zone ------------------->              ")
st_2.Text = 'Table Zone...'
uo_progress.of_Increment(1) 


 DECLARE CUBRIMIENTO CURSOR FOR  
  SELECT dba.CUBRIMIENTO_BRANCH.ID_CITY,   
         dba.CUBRIMIENTO_BRANCH.ID_STATE,   
         dba.CUBRIMIENTO_BRANCH.ID_COUNTRY,   
         dba.CUBRIMIENTO_BRANCH.ID_BRANCH,   
         dba.CUBRIMIENTO_BRANCH.ID_ZONA  
    FROM dba.CUBRIMIENTO_BRANCH  USING SQLCA ;
	 
 OPEN CUBRIMIENTO ;
 FETCH CUBRIMIENTO INTO :ls_city, :ls_state,:ls_country,:ls_branch,:ls_zona ;
 
 DO WHILE SQLCA.SQLCODE = 0
	ls_city			= Trim(ls_city)
	ls_state			= Trim(ls_state)
	ls_country		= Trim(ls_country)
	ls_branch		= Trim(ls_branch)
	ls_zona			= Trim(ls_zona)
	
	  INSERT INTO dba.CUBRIMIENTO_BRANCH  
         ( ID_CITY,   
           ID_STATE,   
           ID_COUNTRY,   
           ID_BRANCH,   
           COMENTARIO_CUBRIMIENTO,   
           ID_ZONA )  
  VALUES ( :ls_city,   
           :ls_state,   
           :ls_country,   
           :ls_branch,   
           '',   
           :ls_zona )  USING X1 ;
		
		IF x1.sqlcode <> 0 Then			
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF
	
	 FETCH CUBRIMIENTO INTO :ls_city, :ls_state,:ls_country,:ls_branch,:ls_zona ;
LOOP
CLOSE CUBRIMIENTO ;

COMMIT USING X1;


lb_mensajes.additem("Table: Branch Coverage ------------------->              ")
st_2.Text = 'Table Branch Coverage...'
uo_progress.of_Increment(1) 

/// MODO PAGO \\
INSERT INTO dba.modo_pago VALUES ('C','BANK','N') USING X1;
INSERT INTO dba.modo_pago VALUES ('D','DELIVERY','S') USING X1;
INSERT INTO dba.modo_pago VALUES ('P','OFFICE','S') USING X1;

// PARAMETROS
INSERT INTO dba.PARAMETROS ( DIR_INPUT,DIR_OUTPUT,DIAS_INVESTIGACION,PORCENT_RATE,TIME_CONNECT,DATE_CONNECT,HOUR_CONNECT )
VALUES ('C:\ViamericasAG\INPUT\','C:\ViamericasAG\OUTPUT\',30,0.10000000,520,'2004-01-01','11:11:11') USING X1;
	
lb_mensajes.additem("Table: Parameters ------------------->              ")
st_2.Text = 'Table Parameters...'
uo_progress.of_Increment(1) 	

//// FTP PARAMETROS

INSERT INTO dba.FTP_PARAMETROS 
( IP_ADDRESS_FTP,   
           USER_ID_FTP,   
           PASSWORD_FTP,   
           UPLOAD_FTP,   
           DOWNLOAD_FTP,   
           INPUT_FTP,   
           OUTPUT_FTP,   
           ID_MAIN_BRANCH )
	VALUES (
		'65.85.97.146',
		'viaftp',
		'viaftp',
		'Input',
		'Output',
		'C:\ViamericasAG\INPUT\',
		'C:\ViamericasAG\OUTPUT\',
		'0000') USING X1;
	
update dba.ftp_parametros set vtu='mtsanew@viamericas.com', vtp='newaccount' USING X1;	

lb_mensajes.additem("Table: Parameters FTP ------------------->              ")
st_2.Text = 'Table Parameters FTP...'
uo_progress.of_Increment(1) 	


//MODO_PAGO_BRANCH

  DECLARE MODO_PAGO CURSOR FOR  
  SELECT dba.MODO_PAGO_BRANCH.ID_BRANCH,   
         dba.MODO_PAGO_BRANCH.MODO_PAGO  
  FROM dba.MODO_PAGO_BRANCH  USING SQLCA;

OPEN MODO_PAGO ;
FETCH MODO_PAGO INTO :ls_branch,:ls_modo_pago ;
DO WHILE SQLCA.SQLCODE = 0
	ls_branch       = Trim(ls_branch)
	ls_modo_pago    = Trim(ls_modo_pago)
	
	  INSERT INTO dba.MODO_PAGO_BRANCH  
         ( ID_BRANCH,   
           MODO_PAGO,   
           PORC_MODO_PAGO_BRANCH,   
           TELEX_MODO_PAGO_BRANCH )  
  VALUES ( :ls_branch,   
           :ls_modo_pago,   
           0,   
           0 )  USING X1;

		IF x1.sqlcode <> 0 Then			
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF
	
	
	FETCH MODO_PAGO INTO :ls_branch,:ls_modo_pago ;
LOOP	
CLOSE MODO_PAGO ;
COMMIT USING X1;



lb_mensajes.additem("Table: Modo Pago Branch ------------------->              ")
st_2.Text = 'Table Modo Pago Branch...'
uo_progress.of_Increment(1) 

string ls_rec_fname, ls_rec_mname, ls_rec_lname, ls_rec_slname, ls_rec_createacc, ls_acc_typeid

///// RECEIVER \\\\\\

 DECLARE RECEIVER CURSOR FOR  
  SELECT dba.RECEIVER.ID_SENDER,   
         dba.RECEIVER.ID_BRANCH,   
         dba.RECEIVER.ID_RECEIVER,   
         dba.RECEIVER.ID_PAYMENT,   
         dba.RECEIVER.ID_CURRENY,   
         dba.RECEIVER.id_flag_receiver,   
         dba.RECEIVER.ID_CITY_RECEIVER,   
         dba.RECEIVER.ID_STATE_RECEIVER,   
         dba.RECEIVER.ID_COUNTRY_RECEIVER,   
         dba.RECEIVER.BRANCH_PAY_RECEIVER,   
         dba.RECEIVER.ID_CASHIER,   
         dba.RECEIVER.NAME_RECEIVER,   
         dba.RECEIVER.ADDRESS_RECEIVER,   
         dba.RECEIVER.PHONE1_RECEIVER,   
         dba.RECEIVER.PHONE2_RECEIVER,   
         dba.RECEIVER.ZIP_RECEIVER,   
         dba.RECEIVER.NOTES_RECEIVER,   
         dba.RECEIVER.DATE_RECEIVER,   
         dba.RECEIVER.TIME_RECEIVER,   
         dba.RECEIVER.NET_AMOUNT_RECEIVER,   
         dba.RECEIVER.RATE_CHANGE_RECEIVER,   
         dba.RECEIVER.TELEX_RECEIVER,   
         dba.RECEIVER.URGENCY_RECEIVER,   
         dba.RECEIVER.RECOMEND_RECEIVER,   
         dba.RECEIVER.MODE_PAY_RECEIVER,   
         dba.RECEIVER.ACC_RECEIVER,   
         dba.RECEIVER.EXCHANGE_RECEIVER,   
         dba.RECEIVER.HANDLING_RECEIVER,   
         dba.RECEIVER.TOTAL_RECEIVER,   
         dba.RECEIVER.MOD_PAY_CURRENCY,   
         dba.RECEIVER.PORC_COMISION_RECEIVER,   
         dba.RECEIVER.TOTAL_PAY_RECEIVER,   
         dba.RECEIVER.TRANS_RECEIVER,   
         dba.RECEIVER.EXCHANGE_COMPANY,   
         dba.RECEIVER.TELEX_COMPANY,   
         dba.RECEIVER.REF_RECEIVER,   
         dba.RECEIVER.BANK_RECEIVER,   
         dba.RECEIVER.TOTAL_DIFERENCE,   
         dba.RECEIVER.TOTAL_MODO_PAGO,   
         dba.RECEIVER.COMMISSION_PAYEE,   
         dba.RECEIVER.TOTAL_MODO_PAGO_COMP,   
         dba.RECEIVER.TOLL_FREE,   
         dba.RECEIVER.PIN_NUMBER,   
         dba.RECEIVER.CLAVE_RECEIVER,   
         dba.RECEIVER.FEE_RATE,
         dba.RECEIVER.rec_fname,   
         dba.RECEIVER.rec_mname,   
         dba.RECEIVER.rec_lname,   
         dba.RECEIVER.rec_slname,   
         dba.RECEIVER.rec_createacc,   
         dba.RECEIVER.acc_typeid,
			dba.receiver.typed_date, dba.receiver.email_receiver, 
			dba.receiver.typeid , dba.receiver.numid , 
			dba.receiver.rec_accrouting , dba.receiver.rec_accbank, 
			dba.receiver.rec_accnumber, dba.receiver.rec_paymenttype			
    FROM dba.RECEIVER  
    WHERE dba.RECEIVER.ID_BRANCH = :ls_branch_insta USING SQLCA  ;

OPEN RECEIVER ;
FETCH RECEIVER INTO :ld_sender, :ls_branch, :ld_receiver, :ls_payment, :ls_currency, :ls_flag, :ls_city, :ls_state, :ls_country, :ls_branch_pay, :ls_cashier, :ls_name_rec,		   &
						  :ls_address, :ls_phone1_rec, :ls_phone2_rec, :ls_zip, :ls_notes, :ld_fecha, :ld_hora, :ld_amount, :ld_rate, :ld_telex, :ld_urgency,:ls_recom,:ls_mod_pay,			&
						  :ls_acc_rec, :ld_exchange, :ld_handling, :ld_total, :ls_mod_pay_currency, :ld_porc_comm, :ld_total_pay, :ls_trans, :ld_exchange_comp, :ld_telex_comp,				&
						  :ld_ref, :ls_bank, :ld_diference, :ld_total_modo_pago, :ld_comm_payee, :ld_total_modo_pago_comp, :ls_toll_free, :ls_pin, :ls_clave, :ld_fee_rate, &
						  :ls_rec_fname, :ls_rec_mname, :ls_rec_lname, :ls_rec_slname, :ls_rec_createacc, :ls_acc_typeid,
						  :ld_typed_date, :ls_email_receiver, :ls_typeid , :ls_numid , :ls_rec_accrouting , :ls_rec_accbank, :ls_rec_accnumber, :ls_rec_paymenttype;
						  
	

	
DO WHILE SQLCA.SQLCODE = 0
	
	ls_branch				=	Trim(ls_branch)
	ls_payment				=	Trim(ls_payment)
	ls_currency				=	Trim(ls_currency)
	ls_flag					=	Trim(ls_flag)
	ls_city					=	Trim(ls_city)
	ls_state					=	Trim(ls_state)
	ls_country				=	Trim(ls_country)
	ls_branch_pay			=	Trim(ls_branch_pay)
	ls_cashier				=	'CH1'
	ls_name_rec				=	Trim(ls_name_rec)
	ls_address				=	Trim(ls_address)
	ls_phone1_rec			=	Trim(ls_phone1_rec)
	ls_phone2_rec			=	Trim(ls_phone2_rec)
	ls_zip					=	Trim(ls_zip)
	ls_notes					=	Trim(ls_notes)
	ld_fecha1				=	Date(ld_fecha)
	ld_hora1					=	Time(ld_fecha)
	ls_recom					=	Trim(ls_recom)
	ls_mod_pay				=	Trim(ls_mod_pay)
	ls_acc_rec				=	Trim(ls_acc_rec)
	ls_mod_pay_currency	=	Trim(ls_mod_pay_currency)
	ls_trans					=	'T'
	ls_bank					=	Trim(ls_bank)
	ls_toll_free			=	Trim(ls_toll_free)
	ls_pin					=	Trim(ls_pin)
	ls_clave					=	Trim(ls_clave)
	ls_rec_fname			=	Trim(ls_rec_fname)
	ls_rec_mname			=	Trim(ls_rec_mname)
	ls_rec_lname			=	Trim(ls_rec_lname)
	ls_rec_slname			=	Trim(ls_rec_slname)
	ls_rec_createacc		=	Trim(ls_rec_createacc)
	ls_acc_typeid			=	Trim(ls_acc_typeid)
	
	
	  INSERT INTO dba.RECEIVER  
         ( ID_SENDER,   
           ID_BRANCH,   
           ID_RECEIVER,   
           ID_PAYMENT,   
           ID_CURRENY,   
           id_flag_receiver,   
           ID_CITY_RECEIVER,   
           ID_STATE_RECEIVER,   
           ID_COUNTRY_RECEIVER,   
           BRANCH_PAY_RECEIVER,   
           ID_CASHIER,   
           NAME_RECEIVER,   
           ADDRESS_RECEIVER,   
           PHONE1_RECEIVER,   
           PHONE2_RECEIVER,   
           ZIP_RECEIVER,   
           NOTES_RECEIVER,   
           DATE_RECEIVER,   
           TIME_RECEIVER,   
           NET_AMOUNT_RECEIVER,   
           RATE_CHANGE_RECEIVER,   
           TELEX_RECEIVER,   
           URGENCY_RECEIVER,   
           RECOMEND_RECEIVER,   
           MODE_PAY_RECEIVER,   
           ACC_RECEIVER,   
           EXCHANGE_RECEIVER,   
           HANDLING_RECEIVER,   
           TOTAL_RECEIVER,   
           MOD_PAY_CURRENCY,   
           PORC_COMISION_RECEIVER,   
           TOTAL_PAY_RECEIVER,   
           TRANS_RECEIVER,   
           EXCHANGE_COMPANY,   
           TELEX_COMPANY,   
           REF_RECEIVER,   
           BANK_RECEIVER,   
           TOTAL_DIFERENCE,   
           TOTAL_MODO_PAGO,   
           COMMISSION_PAYEE,   
           TOTAL_MODO_PAGO_COMP,   
           TOLL_FREE,   
           PIN_NUMBER,   
           STATUS_PAGO_PAYEE,   
           STATUS_PAGO_AGENT,   
           DATE_TRANS_PAYEE,   
           CLAVE_RECEIVER,   
           FEE_RATE,   
           CLOSING_AGENT,   
           CLOSING_PAYEE,   
           PAYMENT_DATE,
			  rec_fname, 
			  rec_mname, 
			  rec_lname, 
			  rec_slname, 
			  rec_createacc, 
			  acc_typeid,
			  typed_date, email_receiver, 
			  typeid , numid , 
			  rec_accrouting , rec_accbank, 
			  rec_accnumber, rec_paymenttype			  )  
  VALUES ( :ld_sender,   
           :ls_branch,   
           :ld_receiver,   
           :ls_payment,   
           :ls_currency,   
           :ls_flag,   
           :ls_city,   
           :ls_state,   
           :ls_country,   
           :ls_branch_pay,   
           'CH1',   
           :ls_name_rec,   
           :ls_address,   
           :ls_phone1_rec,   
           :ls_phone2_rec,   
           :ls_zip,   
           :ls_notes,   
           :ld_fecha1,   
           :ld_hora1,   
           :ld_amount,   
           :ld_rate,   
           :ld_telex,   
           :ld_urgency,   
           :ls_recom,   
           :ls_mod_pay,   
           :ls_acc_rec,   
           :ld_exchange,   
           :ld_handling,   
           :ld_total,   
           :ls_mod_pay_currency,   
           :ld_porc_comm,   
           :ld_total_pay,   
           'T',   
           :ld_exchange_comp,   
           :ld_telex_comp,   
           :ld_ref,   
           :ls_bank,   
           :ld_diference,   
           :ld_total_modo_pago,   
           0,   
           :ld_total_modo_pago_comp,   
           '',   
           '',   
           'U',   
           'U',   
           null,   
           :ls_clave,   
           :ld_fee_rate,   
           'U',   
           'U',   
           null,
				:ls_rec_fname, 
				:ls_rec_mname, 
				:ls_rec_lname, 
				:ls_rec_slname, 
				:ls_rec_createacc, 
				:ls_acc_typeid,
				:ld_typed_date, :ls_email_receiver, 
				:ls_typeid , :ls_numid , 
				:ls_rec_accrouting , :ls_rec_accbank, 
				:ls_rec_accnumber, :ls_rec_paymenttype)  USING X1 ;

		IF x1.sqlcode <> 0 Then
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
			Messagebox('',"Proceso Cancelado en receiver "+string(ld_receiver)+"  State:"+ls_state)			
			return			
		End IF
	
	
FETCH RECEIVER INTO :ld_sender, :ls_branch, :ld_receiver, :ls_payment, :ls_currency, :ls_flag, :ls_city, :ls_state, :ls_country, :ls_branch_pay, :ls_cashier, :ls_name_rec,		   &
						  :ls_address, :ls_phone1_rec, :ls_phone2_rec, :ls_zip, :ls_notes, :ld_fecha, :ld_hora, :ld_amount, :ld_rate, :ld_telex, :ld_urgency,:ls_recom,:ls_mod_pay,			&
						  :ls_acc_rec, :ld_exchange, :ld_handling, :ld_total, :ls_mod_pay_currency, :ld_porc_comm, :ld_total_pay, :ls_trans, :ld_exchange_comp, :ld_telex_comp,				&
						  :ld_ref, :ls_bank, :ld_diference, :ld_total_modo_pago, :ld_comm_payee, :ld_total_modo_pago_comp, :ls_toll_free, :ls_pin, :ls_clave, :ld_fee_rate, &
						  :ls_rec_fname, :ls_rec_mname, :ls_rec_lname, :ls_rec_slname, :ls_rec_createacc, :ls_acc_typeid,
						  :ld_typed_date, :ls_email_receiver, :ls_typeid , :ls_numid , :ls_rec_accrouting , :ls_rec_accbank, :ls_rec_accnumber, :ls_rec_paymenttype;						  

LOOP

CLOSE RECEIVER ;
COMMIT USING X1;

lb_mensajes.additem("Table: Receiver ------------------->              ")
st_2.Text = 'Table Receiver...'
uo_progress.of_Increment(1) 

//RATE
Datetime	ld_date1, ld_date2
Double	ld_limit_send,ld_limit_inf,ld_limit_sup
date		ld_date11,ld_date22

 DECLARE RATE CURSOR FOR  
  SELECT dba.RATE.ID_COUNTRY,   
         dba.RATE.DATE_BEGIN_RATE,   
         dba.RATE.DATE_END_RATE,   
         dba.RATE.ID_CURRENY,   
         dba.RATE.RATE,   
         dba.RATE.LIMIT_SEND_RATE,   
         dba.RATE.LIMIT_INF_RATE,   
         dba.RATE.LIMIT_SUP_RATE  
    FROM dba.RATE  USING SQLCA;

OPEN RATE ;
FETCH RATE INTO :ls_country,:ld_date1,:ld_date2,:ls_currency,:ld_rate,:ld_limit_send,:ld_limit_inf,:ld_limit_sup ;

DO WHILE SQLCA.SQLCODE = 0
	ls_country  = Trim(ls_country)
	ls_currency = Trim(ls_currency)
	ld_date11   = Date(ld_date1) 
	ld_date22   = Date(ld_date2) 
	
	  INSERT INTO dba.RATE  
         ( ID_COUNTRY,   
           DATE_BEGIN_RATE,   
           DATE_END_RATE,   
           ID_CURRENY,   
           RATE,   
           LIMIT_SEND_RATE,   
           LIMIT_INF_RATE,   
           LIMIT_SUP_RATE )  
  VALUES ( :ls_country,   
           :ld_date11,   
           :ld_date22,   
           :ls_currency,   
           :ld_rate,   
           :ld_limit_send,   
           :ld_limit_inf,   
           :ld_limit_sup ) USING X1 ;

		IF x1.sqlcode <> 0 Then
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF
	
	FETCH RATE INTO :ls_country,:ld_date1,:ld_date2,:ls_currency,:ld_rate,:ld_limit_send,:ld_limit_inf,:ld_limit_sup ;
LOOP

CLOSE RATE ;

COMMIT USING X1;

lb_mensajes.additem("Table: Rate ------------------->              ")
st_2.Text = 'Table Rate...'
uo_progress.of_Increment(1) 

/// RATE GROUP STATE \\\\\\
String	ls_country_rate, ls_grupo

 DECLARE RATE_GROUP_STATE CURSOR FOR  
  SELECT dba.RATE_GROUP_STATE.ID_COUNTRY_RATE,   
         dba.RATE_GROUP_STATE.ID_MAIN_BRANCH,   
         dba.RATE_GROUP_STATE.ID_COUNTRY,   
         dba.RATE_GROUP_STATE.ID_STATE,   
         dba.RATE_GROUP_STATE.ID_CURRENY,   
         dba.RATE_GROUP_STATE.RATE,   
         dba.RATE_GROUP_STATE.LIMIT_SEND_RATE,   
         dba.RATE_GROUP_STATE.LIMIT_INF_RATE,   
         dba.RATE_GROUP_STATE.LIMIT_SUP_RATE,   
         dba.RATE_GROUP_STATE.DATE_UPGRADE  
    FROM dba.RATE_GROUP_STATE USING SQLCA;

OPEN RATE_GROUP_STATE ;
FETCH RATE_GROUP_STATE INTO :ls_country_rate, :ls_grupo,:ls_country,:ls_state,:ls_currency,:ld_rate,:ld_limit_send,:ld_limit_inf,:ld_limit_sup,:ld_date1 ;
DO WHILE SQLCA.SQLCODE = 0
	
	ls_country_rate  	= TRIM(ls_country_rate)
	ls_grupo  			= TRIM(ls_grupo)
	ls_country  		= TRIM(ls_country)
	ls_state  			= TRIM(ls_state)
	ls_currency  		= TRIM(ls_currency)
	ld_date11   		= DATE(ld_date1)
	
	  INSERT INTO dba.RATE_GROUP_STATE  
         ( ID_COUNTRY_RATE,   
           ID_MAIN_BRANCH,   
           ID_COUNTRY,   
           ID_STATE,   
           ID_CURRENY,   
           RATE,   
           LIMIT_SEND_RATE,   
           LIMIT_INF_RATE,   
           LIMIT_SUP_RATE,   
           DATE_UPGRADE )  
  VALUES ( :ls_country_rate,   
           :ls_grupo,   
           :ls_country,   
           :ls_state,   
           :ls_currency,   
           :ld_rate,   
           :ld_limit_send,   
           :ld_limit_inf,   
           :ld_limit_sup,   
           :ld_date11 ) USING X1 ;
		IF x1.sqlcode <> 0 Then
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF
	
	FETCH RATE_GROUP_STATE INTO :ls_country_rate, :ls_grupo,:ls_country,:ls_state,:ls_currency,:ld_rate,:ld_limit_send,:ld_limit_inf,:ld_limit_sup,:ld_date1 ;

LOOP
CLOSE RATE_GROUP_STATE ;

COMMIT USING X1 ;

lb_mensajes.additem("Table: Rate Group State ------------------->              ")
st_2.Text = 'Table Rate Group State...'
uo_progress.of_Increment(1) 

//STANDAR
Datetime	ld_date_comision
Date		ld_date_comision1
Double	ld_rango,			&
			ld_rango2,			&
			ld_fee_agent,		&
			ld_exc_agent,		&
			ld_exc_comp,		&
			ld_fee_comp

 DECLARE STANDAR CURSOR FOR  
  SELECT dba.STANDAR.ID_COUNTRY,   
         dba.STANDAR.MOD_PAY_CURRENCY,   
         dba.STANDAR.RANGE_BEGIN_COMISION,   
         dba.STANDAR.RANGE_END_COMISION,   
         dba.STANDAR.FEET_COMISION,   
         dba.STANDAR.PORCENT_COSTUMER_COMISION,   
         dba.STANDAR.PORCENT_COMPANY_COMISION,   
         dba.STANDAR.FEET_COMISION_COMP,   
         dba.STANDAR.DATE_UPGRADE  
    FROM dba.STANDAR USING SQLCA ;

OPEN STANDAR ;
FETCH STANDAR INTO :ls_country,:ls_mod_pay_currency,:ld_rango,:ld_rango2,:ld_fee_agent,:ld_exc_agent,:ld_exc_comp,:ld_fee_comp,:ld_date_comision ;

DO WHILE SQLCA.SQLCODE = 0
	ls_country  = Trim(ls_country)
	ls_currency = Trim(ls_currency)
	ld_date_comision1   = Date(ld_date_comision) 

	   INSERT INTO dba.STANDAR  
         ( ID_COUNTRY,   
           MOD_PAY_CURRENCY,   
           RANGE_BEGIN_COMISION,   
           RANGE_END_COMISION,   
           FEET_COMISION,   
           PORCENT_COSTUMER_COMISION,   
           PORCENT_COMPANY_COMISION,   
           FEET_COMISION_COMP,   
           DATE_UPGRADE )  
  		VALUES ( :ls_country,   
           :ls_mod_pay_currency,   
           :ld_rango,   
           :ld_rango2,   
           :ld_fee_agent,   
           :ld_exc_agent,   
           :ld_exc_comp,   
           :ld_fee_comp,   
           :ld_date_comision )  USING X1 ;

		IF x1.sqlcode <> 0 Then
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF

	FETCH STANDAR INTO :ls_country,:ls_mod_pay_currency,:ld_rango,:ld_rango2,:ld_fee_agent,:ld_exc_agent,:ld_exc_comp,:ld_fee_comp,:ld_date_comision ;
LOOP

CLOSE STANDAR ;

COMMIT USING X1;

lb_mensajes.additem("Table: Standar ------------------->              ")
st_2.Text = 'Table Standar...'
uo_progress.of_Increment(1) 

//COMISION EXCLUSION

  DECLARE COMISION CURSOR FOR  
  SELECT dba.COMISION.ID_COUNTRY,   
         dba.COMISION.ID_BRANCH,   
         dba.COMISION.MOD_PAY_CURRENCY,   
         dba.COMISION.RANGE_BEGIN_COMISION,   
         dba.COMISION.RANGE_END_COMISION,   
         dba.COMISION.FEET_COMISION,   
         dba.COMISION.PORCENT_COSTUMER_COMISION,   
         dba.COMISION.PORCENT_COMPANY_COMISION,   
         dba.COMISION.FEET_COMISION_COMP,   
         dba.COMISION.DATE_UPGRADE  
    FROM dba.COMISION  
   WHERE dba.COMISION.ID_BRANCH = :ls_branch_INSTA  USING SQLCA ;

OPEN COMISION ;
FETCH COMISION INTO :ls_country,:ls_mod_pay_currency,:ld_rango,:ld_rango2,:ld_fee_agent,:ld_exc_agent,:ld_exc_comp,:ld_fee_comp,:ld_date_comision ;

DO WHILE SQLCA.SQLCODE = 0
	ls_country  = Trim(ls_country)
	ls_currency = Trim(ls_currency)
	ld_date_comision1   = Date(ld_date_comision) 

	    INSERT INTO dba.COMISION  
         ( ID_COUNTRY,   
           ID_BRANCH,   
           MOD_PAY_CURRENCY,   
           RANGE_BEGIN_COMISION,   
           RANGE_END_COMISION,   
           FEET_COMISION,   
           PORCENT_COSTUMER_COMISION,   
           PORCENT_COMPANY_COMISION,   
           FEET_COMISION_COMP,   
           DATE_UPGRADE )  
  VALUES ( :ls_country,   
           :ls_branch_insta,   
           :ls_mod_pay_currency,   
           :ld_rango,   
           :ld_rango2,   
           :ld_fee_agent,   
           :ld_exc_agent,   
           :ld_exc_comp,   
           :ld_fee_comp,   
           :ld_date_comision )  USING X1 ;

		IF x1.sqlcode <> 0 Then
			//Messagebox('',x1.sqlerrtext)
			lb_errors.additem(x1.sqlerrtext)
		End IF

	FETCH COMISION INTO :ls_country,:ls_mod_pay_currency,:ld_rango,:ld_rango2,:ld_fee_agent,:ld_exc_agent,:ld_exc_comp,:ld_fee_comp,:ld_date_comision ;
LOOP

CLOSE COMISION ;

COMMIT USING X1;
X1.of_disconnect()

lb_mensajes.additem("Table: Exclusion ------------------->              ")
st_2.Text = 'Table Exclusion...'
uo_progress.of_Increment(1) 
uo_progress.of_SetPosition(0)
uo_progress.of_Reset()

lb_errors.additem("Database Complete")
Messagebox('Done','Process Complete')





end event

type st_6 from statictext within w_pipeline_database
integer x = 3351
integer y = 632
integer width = 681
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
boolean enabled = false
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_pipeline_database
boolean visible = false
integer x = 745
integer y = 172
integer width = 485
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Receiver"
end type

event clicked;String	ls_branch, ls_input, ls_output

ls_input  = "C:\DINERO\INPUT\"
ls_output = "C:\DINERO\OUTPUT\"


Setpointer(hourglass!)
ls_branch = em_branch.text
long	ll_cont = 0

  SELECT Count(*)  
    INTO :ll_cont  
    FROM branch  
   WHERE branch.id_branch = :ls_branch   ;

if ll_cont = 0 then
	Messagebox("Error","Branch Inexistente")
	return
end if


//n_tr		X2
//X2 = Create n_tr
//X2.of_Init("C:\Dinero\Envioini.INI","Envio")
//CONNECT USING X2;


//IF X2.SQLCode <> 0 THEN
//	MessageBox("Connect Failed SOURCE","Cannot connect to database"+ X2.SQLErrText)
//	RETURN
//Else
//	Messagebox("Connect Succesfull","Connect ")
//END IF


n_tr		X1
X1 = Create n_tr
X1.of_Init("C:\Dinero\Vaciado\Vaciado.INI","Vaciado")




CONNECT USING X1;

IF X1.SQLCode <> 0 THEN
	MessageBox("Connect Failed","Cannot connect to database"+ X1.SQLErrText)
	RETURN
Else
	Messagebox("Connect Succesfull","Connect ")
END IF

st_2.Text = 'Creating Data Base ...'
uo_progress.of_SetMaximum(37)
uo_progress.of_SetPosition(0)
uo_progress.of_Reset()

long	ll_error, ll_rows
Pipeline	i_upipe

i_upipe = CREATE Pipeline



////Pipeline receiver
i_upipe.DataObject = "pl_receiver"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_branch)
ll_rows = i_upipe.RowsWritten
Messagebox("receiver this year","El Error es :"+string(ll_error)+"       Filas Escritas :"+string(ll_rows))
uo_progress.of_Increment(1) 
COMMIT ;







Messagebox("Finish","Proceso Terminado")
st_2.Text = 'Tha Database was Create Sucessfully ...'
Commit ;

Setpointer(Arrow!)






end event

type cbx_1 from checkbox within w_pipeline_database
integer x = 4059
integer y = 116
integer width = 352
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
long backcolor = 67108864
string text = "Virginea"
boolean lefttext = true
end type

type cb_copydb from commandbutton within w_pipeline_database
string tag = "Make a copy of the empty DB in the apropiate directory..."
integer x = 731
integer y = 24
integer width = 887
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copy DB"
end type

event clicked;integer li_FileNum

if not FileExists ( "C:\VIAMERICASMT\vaciado\envio.log" ) then
	filedelete ( "C:\VIAMERICASMT\vaciado\envio.log" )
end if

if not FileExists ( "C:\VIAMERICASMT\vaciado\Vaciado.db" ) then
	filedelete ( "C:\VIAMERICASMT\vaciado\Vaciado.db" )
end if





// Chequea la existencia de Vaciado original (el que esta en EmptyDB)
if not FileExists ( "C:\VIAMERICASMT\vaciado\emptydb\vaciado.db" ) then
	Messagebox("Error","Empty DB not found")
	return
end if;

// Chequea si existe vaciado.db en la carpeta vaciado
if FileExists ( "C:\VIAMERICASMT\vaciado\vaciado.db" ) then
	if Messagebox("Warning","There's a DB in c:\VIAMERICASMT\vaciado\ "+char(10)+ &
	              char(13)+"Do you want to replace this DB with a new one?",Question!,YesNo!) <> 1 Then
		return
	end if;
end if;

li_FileNum = FileOpen("c:\VIAMERICASMT\vaciado\emptydb\copydb.bat",LineMode!, Write!, LockWrite!, Replace!)	
FileWrite(li_FileNum,"echo off")
if FileExists ( "C:\VIAMERICASMT\vaciado\envio.log" ) then
	FileWrite(li_FileNum,"attrib C:\VIAMERICASMT\vaciado\envio.log -R")
	FileWrite(li_FileNum,"del C:\VIAMERICASMT\vaciado\envio.log")
end if
if FileExists ( "C:\VIAMERICASMT\vaciado\vaciado.db" ) then
	FileWrite(li_FileNum,"attrib C:\VIAMERICASMT\vaciado\vaciado.db -R")
	FileWrite(li_FileNum,"del C:\VIAMERICASMT\vaciado\vaciado.db")
end if
FileWrite(li_FileNum,"copy c:\VIAMERICASMT\vaciado\emptydb\vaciado.db c:\VIAMERICASMT\vaciado")
FileWrite(li_FileNum,"exit")
FileClose(li_FileNum)

Run("c:\VIAMERICASMT\vaciado\emptydb\copydb.bat",Minimized!)
end event

type lb_mensajes from listbox within w_pipeline_database
integer x = 27
integer y = 480
integer width = 1591
integer height = 664
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type uo_progress from u_progressbar within w_pipeline_database
integer x = 27
integer y = 128
integer width = 1591
integer height = 76
boolean border = true
long backcolor = 80269524
borderstyle borderstyle = stylelowered!
end type

on uo_progress.destroy
call u_progressbar::destroy
end on

type st_2 from statictext within w_pipeline_database
integer x = 27
integer y = 220
integer width = 1591
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 32768
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_1 from statictext within w_pipeline_database
integer x = 41
integer y = 28
integer width = 357
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Code Branch :"
boolean focusrectangle = false
end type

type em_branch from editmask within w_pipeline_database
integer x = 411
integer y = 24
integer width = 293
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

type dw_1 from datawindow within w_pipeline_database
integer x = 4357
integer y = 476
integer width = 475
integer height = 1072
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_execute from commandbutton within w_pipeline_database
integer x = 4055
integer y = 612
integer width = 480
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Execute"
end type

event clicked;String	ls_branch, ls_input, ls_output

ls_input  = "C:\DINERO\INPUT\"
ls_output = "C:\DINERO\OUTPUT\"


Setpointer(hourglass!)
ls_branch = em_branch.text
long	ll_cont = 0

  SELECT Count(*)  
    INTO :ll_cont  
    FROM dba.branch  
   WHERE dba.branch.id_branch = :ls_branch   ;

if ll_cont = 0 then
	Messagebox("Error","Branch Inexistente")
	return
end if


n_tr		X1
X1 = Create n_tr
X1.of_Init("C:\Dinero\Vaciado\Vaciado.INI","Vaciado")




CONNECT USING X1;

IF X1.SQLCode <> 0 THEN
	MessageBox("Connect Failed","Cannot connect to database"+ X1.SQLErrText)
	RETURN
Else
	Messagebox("Connect Succesfull","Connect ")
END IF

st_2.Text = 'Creating Data Base ...'
uo_progress.of_SetMaximum(30) //ojo colocar cuantos pipeline
uo_progress.of_SetPosition(0)
uo_progress.of_Reset()

long	ll_error, ll_rows
Pipeline	i_upipe

i_upipe = CREATE Pipeline



////Pipeline payment
i_upipe.DataObject = "pl_ftp_parametros"
ll_error = i_upipe.Start(sqlca , X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Parametros FTP ------------>              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Parametros FTP...'
uo_progress.of_Increment(1) 



////Pipeline payment
i_upipe.DataObject = "pl_payment"
ll_error = i_upipe.Start(sqlca , X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Payment ------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Payment...'
uo_progress.of_Increment(1) 

//calling pl_tollfree
i_upipe.DataObject = "pl_tollfree"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Tollfree ------------------>              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table TollFree...'
uo_progress.of_Increment(1) 

///Pipeline currency
i_upipe.DataObject = "pl_mod_pay_currency"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Mod Pay Currency ---------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Mod Pay Currency...'
uo_progress.of_Increment(1) 


///Pipeline Cashier
i_upipe.DataObject = "pl_cashier"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Cashier ------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Cashier...'
uo_progress.of_Increment(1) 


//Pipeline Parametros
i_upipe.DataObject = "pl_parametros"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_input,ls_output)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Parametros ---------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Parametros...'
uo_progress.of_Increment(1) 


///Pipeline flag_branch
i_upipe.DataObject = "pl_flag_branch"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Flag Branch --------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Flag Branch...'
uo_progress.of_Increment(1) 


///Pipeline type_branch
i_upipe.DataObject = "pl_type_branch"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Type Branch --------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Type Branch...'
uo_progress.of_Increment(1) 



///Pipeline Currency
i_upipe.DataObject = "pl_currency"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Currency ------------------>              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Currency...'
uo_progress.of_Increment(1) 


///Pipeline zona
i_upipe.DataObject = "pl_zona"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Zona ---------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Zona...'
uo_progress.of_Increment(1) 


///Pipeline modo_pago
i_upipe.DataObject = "pl_modo_pago"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Modo de Pago -------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Modo de Pago...'
uo_progress.of_Increment(1) 


///// Motivo anulacion
i_upipe.DataObject = "pl_motivo_anulacion"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Motivo de Anulación ------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Motivo de Anulación...'
uo_progress.of_Increment(1) 



///Pipeline Country
i_upipe.DataObject = "pl_country"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Country ------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Country...'
uo_progress.of_Increment(1) 


/////Pipeline State
i_upipe.DataObject = "pl_state"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: State --------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table State...'
uo_progress.of_Increment(1) 



///Pipeline City
i_upipe.DataObject = "pl_city"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: City ---------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table City...'
uo_progress.of_Increment(1) 



///Pipeline company
i_upipe.DataObject = "pl_company"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Company ------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Company...'
uo_progress.of_Increment(1) 



///Pipeline Group_branch
i_upipe.DataObject = "pl_group_branch"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Group Branch -------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Group Branch...'
uo_progress.of_Increment(1) 



//if cbx_1.checked then
//	///Pipeline Branch virginea
//	i_upipe.DataObject = "pl_branch_virginea"
//	ll_error = i_upipe.Start(sqlca, X1, dw_1)
//	ll_rows = i_upipe.RowsWritten
//	lb_mensajes.additem("Table: Branch Virginea ---------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
//st_2.Text = 'Table Branch Virginea...'
//uo_progress.of_Increment(1) 
//


//else
	///Pipeline Branch
	i_upipe.DataObject = "pl_branch"
	ll_error = i_upipe.Start(sqlca, X1, dw_1)
	ll_rows = i_upipe.RowsWritten
	lb_mensajes.additem("Table: Branch ------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
	st_2.Text = 'Table Branch...'
	uo_progress.of_Increment(1) 
//end if


/////Pipeline Rate_group_state
i_upipe.DataObject = "pl_rate_group_state"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Group State --------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Group State...'
uo_progress.of_Increment(1) 



/////Pipeline Rate_state-delivery
i_upipe.DataObject = "pl_rate_state_delivery"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Rate State Delivery ------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Rate State Delivery...'
uo_progress.of_Increment(1) 




///Pipeline Rate_group_state_delivery
i_upipe.DataObject = "pl_rate_group_state_delivery"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Rate Group State Delivery ->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Rate Group State Delivery...'
uo_progress.of_Increment(1) 



//
///Pipeline Rate
i_upipe.DataObject = "pl_rate"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Rate ---------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Rate...'
uo_progress.of_Increment(1) 




///Pipeline Group Clave
i_upipe.DataObject = "pl_group_clave"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_branch)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Group Clave --------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Group Clave...'
uo_progress.of_Increment(1) 





///Pipeline Rate Group State City
i_upipe.DataObject = "pl_rate_group_state_city"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_branch)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Rate Group State City ----->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Rate Group State City...'
uo_progress.of_Increment(1) 




/////Pipeline comision exclusion
//
i_upipe.DataObject = "pl_comision"
ll_error = i_upipe.Start(sqlca, X1, dw_1, ls_branch)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Comision ------------------>              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Comision...'
uo_progress.of_Increment(1) 


////Pipeline comision delivery
i_upipe.DataObject = "pl_comision_delivery"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Comision Delivery --------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Comision Delivery...'
uo_progress.of_Increment(1) 



////Pipeline comision city
i_upipe.DataObject = "pl_comision_city"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Comision City ------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Comision City...'
uo_progress.of_Increment(1) 


////Pipeline Comision Group State
i_upipe.DataObject = "pl_comision_group_state"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Comision Group State ------>              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Comision Group State...'
uo_progress.of_Increment(1) 



////Pipeline Comision Group City
i_upipe.DataObject = "pl_comision_group_city"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Comision Group City ------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Comision Group City...'
uo_progress.of_Increment(1) 



////Pipeline Comision Pay
i_upipe.DataObject = "pl_comision_pay"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Comision Pay -------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Comision Pay...'
uo_progress.of_Increment(1) 




///Pipeline comision standar
i_upipe.DataObject = "pl_standar"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Standar ------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Standar...'
uo_progress.of_Increment(1) 


///Pipeline Comision Modo Pago Grupo
i_upipe.DataObject = "pl_comision_modo_pago_grupo"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Comision Modo Pago Grupo -->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Comision Modo Pago Grupo...'
uo_progress.of_Increment(1) 


///Pipeline modo_pago_branch
i_upipe.DataObject = "pl_modo_pago_branch"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Modo Pago Branch ---------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Modo Pago Branch...'
uo_progress.of_Increment(1) 


///Pipeline cubrimiento_branch
i_upipe.DataObject = "pl_cubrimiento_branch"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Cubrimiento Branch -------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Cubrimiento Branch...'
uo_progress.of_Increment(1) 


///Pipeline type_id_sender
i_upipe.DataObject = "pl_type_id_sender"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Type Id Sender ------------>              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Type Id Sender...'
uo_progress.of_Increment(1) 


//Pipeline sender
i_upipe.DataObject = "pl_sender"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_branch)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Sender -------------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Pl Sender...'
uo_progress.of_Increment(1) 



///Pipeline flag_receiver
i_upipe.DataObject = "pl_flag_receiver"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Flag Receiver ------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Flag Receiver...'
uo_progress.of_Increment(1) 



////Branch Instalacion
i_upipe.DataObject = "pl_branch_instalacion"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_branch)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Branch Instalacion -------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Branch Instalacion...'
uo_progress.of_Increment(1) 


//Directorio Bancomer
i_upipe.DataObject = "pl_directorio_bancomer"
ll_error = i_upipe.Start(sqlca, X1, dw_1)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Directorio Bancomer ------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Directorio Bancomer...'
uo_progress.of_Increment(1) 


//tipo_comision_comision_agent_modo_pago_grupo
i_upipe.DataObject = "pl_comision_agent_modo_pago_grupo"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_branch)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Comision Agent Modo Pago Grupo ->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Comision Agent Modo Pago Grupo...'
uo_progress.of_Increment(1) 


//Pipeline Group Clave
i_upipe.DataObject = "pl_group_clave"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_branch)
ll_rows = i_upipe.RowsWritten
lb_mensajes.additem("Table: Group Clave --------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Group Clave...'
uo_progress.of_Increment(1) 



////Pipeline receiver
i_upipe.DataObject = "pl_receiver"
ll_error = i_upipe.Start(sqlca, X1, dw_1,ls_branch)
ll_rows = i_upipe.RowsWritten
Messagebox("receiver this year","El Error es :"+string(ll_error)+"       Filas Escritas :"+string(ll_rows))
lb_mensajes.additem("Table: Receiver   --------------->              Generation Code: "+string(ll_error)+",  Records: "+string(ll_rows))
st_2.Text = 'Table Receiver...'
uo_progress.of_Increment(1) 
COMMIT ;


//DELETE FROM BRANCH_INSTALACION USING X1 ;
//
//
//  INSERT INTO dba.BRANCH_INSTALACION  
//         ( ID_BRANCH )  
//  VALUES ( :ls_branch )  USING X1 ;


lb_mensajes.additem("Process Complete")
st_2.Text = 'Process Complete...'
Messagebox("Finish","Process Complete")

Commit ;

Setpointer(Arrow!)






end event

type st_4 from statictext within w_pipeline_database
boolean visible = false
integer x = 1682
integer y = 376
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Intentos :"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_intentos from singlelineedit within w_pipeline_database
boolean visible = false
integer x = 1943
integer y = 364
integer width = 73
integer height = 92
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean autohscroll = false
borderstyle borderstyle = styleraised!
end type

type st_3 from statictext within w_pipeline_database
integer x = 3342
integer y = 712
integer width = 576
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Tables pipeline:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_pipeline_database
integer x = 3776
integer y = 260
integer width = 411
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Errors:"
boolean focusrectangle = false
end type

