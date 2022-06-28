$PBExportHeader$w_sql_generator_rate.srw
forward
global type w_sql_generator_rate from w_sheet
end type
type em_lista_agencias from editmask within w_sql_generator_rate
end type
type hpb_1 from hprogressbar within w_sql_generator_rate
end type
type st_1 from statictext within w_sql_generator_rate
end type
type cb_close from commandbutton within w_sql_generator_rate
end type
type st_name from statictext within w_sql_generator_rate
end type
type dw_rate from datawindow within w_sql_generator_rate
end type
type rb_ins from radiobutton within w_sql_generator_rate
end type
type rb_upd from radiobutton within w_sql_generator_rate
end type
type gb_1 from groupbox within w_sql_generator_rate
end type
type cbx_state_rate from checkbox within w_sql_generator_rate
end type
type dw_state_rate from datawindow within w_sql_generator_rate
end type
type cbx_state_delivery from checkbox within w_sql_generator_rate
end type
type dw_rate_delivery from datawindow within w_sql_generator_rate
end type
type rb_2 from radiobutton within w_sql_generator_rate
end type
type dw_sql_rate_group_agent from datawindow within w_sql_generator_rate
end type
type dw_sql_rate_group_state_city from datawindow within w_sql_generator_rate
end type
type dw_sql_state_delivery from datawindow within w_sql_generator_rate
end type
type em_branch from editmask within w_sql_generator_rate
end type
type cb_all from u_cb within w_sql_generator_rate
end type
type cb_one from commandbutton within w_sql_generator_rate
end type
type st_path from statictext within w_sql_generator_rate
end type
type gb_3 from groupbox within w_sql_generator_rate
end type
type sle_status from singlelineedit within w_sql_generator_rate
end type
type rb_1 from radiobutton within w_sql_generator_rate
end type
type cbx_rate from checkbox within w_sql_generator_rate
end type
end forward

global type w_sql_generator_rate from w_sheet
integer x = 214
integer y = 221
integer width = 1819
integer height = 896
string title = "SQL Generator Rates"
boolean maxbox = false
boolean resizable = false
long backcolor = 80269524
boolean clientedge = true
event ue_ejecutar_automatico ( )
em_lista_agencias em_lista_agencias
hpb_1 hpb_1
st_1 st_1
cb_close cb_close
st_name st_name
dw_rate dw_rate
rb_ins rb_ins
rb_upd rb_upd
gb_1 gb_1
cbx_state_rate cbx_state_rate
dw_state_rate dw_state_rate
cbx_state_delivery cbx_state_delivery
dw_rate_delivery dw_rate_delivery
rb_2 rb_2
dw_sql_rate_group_agent dw_sql_rate_group_agent
dw_sql_rate_group_state_city dw_sql_rate_group_state_city
dw_sql_state_delivery dw_sql_state_delivery
em_branch em_branch
cb_all cb_all
cb_one cb_one
st_path st_path
gb_3 gb_3
sle_status sle_status
rb_1 rb_1
cbx_rate cbx_rate
end type
global w_sql_generator_rate w_sql_generator_rate

type variables
String	is_output1, is_output
int  ii_barx
STRU_PARAMETROS istru_parametros
end variables

forward prototypes
public function string fn_getgeneralrates1 (ref n_tr sqlca_rpt)
public function string fn_getgeneralrates2 (ref n_tr sqlca_rpt)
public function integer fn_progress ()
public subroutine fn_generate_files_agency (string pl_branch, n_tr sqlca_rpt, ref long pl_cont, string ps_rates1, string ps_rates2) throws n_exception
end prototypes

event ue_ejecutar_automatico();Long	   ll_cont, l_fila
String 	ls_branch,ls_badbranches, ls_rates1, ls_rates2

SetPointer(HourGlass!)
hpb_1.position=0


sle_status.text = ''

IF is_output = '' OR IsNull(is_output) THEN
	MessageBox('Atention','Please Check The OutPut.',Information!)
	Return
END IF


// ******************
// Validate U: Drive!
fn_map_output()
//if not fileexists('R:\Output') then
//	Messagebox("Error!","Network drive not ready, please try again!",StopSign!)
//	return
//end if
// ******************

ls_badbranches = ""

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Connection
n_tr SQLCA_RPT
SQLCA_RPT = Create n_tr
SQLCA_RPT.DBMS = "SNC SQL Native Client(OLE DB)"
SQLCA_RPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
SQLCA_RPT.ServerName = gs_servername_rpt
if SQLCA_RPT.of_connect() <> 0 then
	Messagebox("Error","Error trying connection to Reporting Database"+char(13)+char(10)+SQLCA_RPT.SQLErrText,StopSign!)
	return
end if
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


sle_status.text = 'Recuperando las tasas...'
hpb_1.setrange( 1, ll_cont)
hpb_1.setstep=1

Yield()
ls_rates1 = fn_getgeneralrates1(SQLCA_RPT)
ls_rates2 = fn_getgeneralrates2(SQLCA_RPT)

ll_cont = UpperBound(istru_parametros.String)


FOR l_fila = 1 TO UpperBound(istru_parametros.String)
	
	Yield()
	
	ls_branch = istru_parametros.String[l_fila]
		
	TRY
		fn_generate_files_agency(ls_branch,SQLCA_RPT,ll_cont,ls_rates1,ls_rates2)
		
	CATCH (n_exception ex)		
		ls_badbranches = ls_badbranches + trim(ls_branch) + ','
	END TRY
	

NEXT

sle_status.text = 'Proceso finalizado'

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SetPointer(Arrow!)

if len(ls_badbranches) > 1  then
	sle_status.text = 'Proceso terminado con excepciones.'
	hpb_1.setrange( 1, ll_cont)
	hpb_1.position=hpb_1.position+1
	MessageBox('Proceso Finalizado','ATENCION!!! Las tasas de cambio han sido publicadas a la mayoria de las agencias, pero hubo error en las siguientes agencias:~n~r'+left(ls_badbranches,len(ls_badbranches)-1)+'. Por favor publique de nuevo a esas agencias y consulte con soporte si el error persiste.',Exclamation!)	
	
else
	sle_status.text = 'Proceso terminado OK'
	hpb_1.setrange( 1, ll_cont)
	hpb_1.position=hpb_1.position+1
	MessageBox('Proceso Finalizado','Las tasas de cambio han sido publicadas a TODAS las agencias.',Information!)	
	
end if




	  

	
	
	

end event

public function string fn_getgeneralrates1 (ref n_tr sqlca_rpt);
String ls_return, ls_sqlsyntax, ls_enterkey
Long ll_ins

dw_rate.SetTransObject(SQLCA_RPT)
dw_state_rate.SetTransObject(SQLCA_RPT)
dw_rate_delivery.SetTransObject(SQLCA_RPT)

dw_rate.retrieve()
dw_state_rate.retrieve()
dw_rate_delivery.retrieve()

ls_enterkey = char(13) + char(10)
ls_return = ''

// ******************* RATE ******************************** //

ls_return = ls_return + "SET option on_error = CONTINUE;" + ls_enterkey

ls_return = ls_return + "DELETE FROM dba.nw_rate;" + ls_enterkey
ls_return = ls_return + "DELETE FROM dba.nw_rate_group_agent;" + ls_enterkey
ls_return = ls_return + "DELETE FROM dba.nw_rate_group_state;" + ls_enterkey
ls_return = ls_return + "DELETE FROM dba.nw_rate_group_state_city;" + ls_enterkey
ls_return = ls_return + "DELETE FROM dba.nw_rate_group_state_delivery;" + ls_enterkey
ls_return = ls_return + "DELETE FROM dba.nw_rate_state_delivery;" + ls_enterkey
ls_return = ls_return + "COMMIT;" + ls_enterkey

ls_return = ls_return +  'DELETE FROM rate ;' + ls_enterkey

rb_ins.checked = TRUE

FOR ll_ins=1 TO dw_rate.RowCount()

		ls_sqlsyntax="INSERT INTO rate VALUES ("
		
		IF NOT IsNull(dw_rate.GetItemString(ll_ins,"id_country")) THEN
			ls_sqlsyntax += "'" + trim(dw_rate.GetItemString(ll_ins,"id_country")) + "'"
		ELSE
			ls_sqlsyntax += "NULL"
		END IF
			
		ls_sqlsyntax += ","
		
		IF NOT IsNull(dw_rate.GetItemDatetime(ll_ins,"date_begin_rate")) THEN
			ls_sqlsyntax += "'" + String(date(dw_rate.GetItemDatetime(ll_ins,"date_begin_rate")),"yyyy-mm-dd") + "'"
		ELSE
			ls_sqlsyntax += "NULL"
		END IF
		
		ls_sqlsyntax += ","

		
		IF NOT IsNull(dw_rate.GetItemDatetime(ll_ins,"date_end_rate")) THEN
			ls_sqlsyntax += "'"+String(date(dw_rate.GetItemDatetime(ll_ins,"date_end_rate")),"yyyy-mm-dd") +"'"
		ELSE
			ls_sqlsyntax += "NULL"
		END IF
			
		ls_sqlsyntax += ","

	
		IF NOT IsNull(dw_rate.GetItemString(ll_ins,"id_curreny")) THEN
			ls_sqlsyntax += "'" + trim(dw_rate.GetItemString(ll_ins,"id_curreny"))+ "'"
		ELSE
			ls_sqlsyntax += "NULL"
		END IF
			
		ls_sqlsyntax += ","

					
		IF NOT IsNull(dw_rate.GetItemNumber(ll_ins,"rate")) THEN
			ls_sqlsyntax += String(dw_rate.GetItemNumber(ll_ins,"rate"))
		ELSE
			ls_sqlsyntax += "NULL"
		END IF
			
		ls_sqlsyntax += ","

	
			
		IF NOT IsNull(dw_rate.GetItemNumber(ll_ins,"limit_send_rate")) THEN
			ls_sqlsyntax += String(dw_rate.GetItemNumber(ll_ins,"limit_send_rate"))
		ELSE
			ls_sqlsyntax += "NULL"
		END IF
			
		ls_sqlsyntax += ","

					
		IF NOT IsNull(dw_rate.GetItemNumber(ll_ins,"limit_inf_rate")) THEN
			ls_sqlsyntax += String(dw_rate.GetItemNumber(ll_ins,"limit_inf_rate"))
		ELSE
			ls_sqlsyntax += "NULL"
		END IF
	
		ls_sqlsyntax += ","

	
		IF NOT IsNull(dw_rate.GetItemNumber(ll_ins,"limit_sup_rate")) THEN
			ls_sqlsyntax += String(dw_rate.GetItemNumber(ll_ins,"limit_sup_rate"))
		ELSE
			ls_sqlsyntax += "NULL"
		END IF
	
		ls_sqlsyntax += ");"			
		ls_return = ls_return + ls_sqlsyntax + ls_enterkey

NEXT


// ******************* RATE STATE ******************************** //

ls_return = ls_return +  'DELETE FROM rate_group_state ;' + ls_enterkey
rb_ins.checked = TRUE
FOR ll_ins=1 TO dw_state_rate.RowCount()

 ls_sqlsyntax="INSERT INTO rate_group_state VALUES ("

	IF NOT IsNull(dw_state_rate.GetItemString(ll_ins,"id_country_rate")) THEN
		ls_sqlsyntax += "'" + trim(dw_state_rate.GetItemString(ll_ins,"id_country_rate")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_state_rate.GetItemString(ll_ins,"id_main_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_state_rate.GetItemString(ll_ins,"id_main_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_state_rate.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_state_rate.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

			
	IF NOT IsNull(dw_state_rate.GetItemString(ll_ins,"id_state")) THEN
		ls_sqlsyntax += "'" + trim(dw_state_rate.GetItemString(ll_ins,"id_state")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","		

	
	IF NOT IsNull(dw_state_rate.GetItemString(ll_ins,"id_curreny")) THEN
		ls_sqlsyntax += "'" + trim(dw_state_rate.GetItemString(ll_ins,"id_curreny")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
					
	IF NOT IsNull(dw_state_rate.GetItemNumber(ll_ins,"rate")) THEN
		ls_sqlsyntax += String(dw_state_rate.GetItemNumber(ll_ins,"rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

			
	IF NOT IsNull(dw_state_rate.GetItemNumber(ll_ins,"limit_send_rate")) THEN
		ls_sqlsyntax += trim(String(dw_state_rate.GetItemNumber(ll_ins,"limit_send_rate")))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
			
	IF NOT IsNull(dw_state_rate.GetItemNumber(ll_ins,"limit_inf_rate")) THEN
		ls_sqlsyntax += trim(String(dw_state_rate.GetItemNumber(ll_ins,"limit_inf_rate")))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_state_rate.GetItemNumber(ll_ins,"limit_sup_rate")) THEN
		ls_sqlsyntax += trim(String(dw_state_rate.GetItemNumber(ll_ins,"limit_sup_rate")))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
					
	IF NOT IsNull(dw_state_rate.GetItemdatetime(ll_ins,"date_upgrade")) THEN
		ls_sqlsyntax += "'" + String(date(dw_state_rate.GetItemDatetime(ll_ins,"date_upgrade")),"yyyy-mm-dd") + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
		ls_sqlsyntax += ");"			
	

	ls_return = ls_return + ls_sqlsyntax + ls_enterkey
	
NEXT


// ******************* RATE DELIVERY ******************************** //

ls_return = ls_return +  'DELETE FROM rate_group_state_delivery ;' + ls_enterkey
FOR ll_ins=1 TO dw_rate_delivery.RowCount()

 ls_sqlsyntax="INSERT INTO rate_group_state_delivery VALUES ("

	IF NOT IsNull(dw_rate_delivery.GetItemString(ll_ins,"id_country_rate")) THEN
		ls_sqlsyntax += "'" + trim(dw_rate_delivery.GetItemString(ll_ins,"id_country_rate")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_rate_delivery.GetItemString(ll_ins,"id_main_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_rate_delivery.GetItemString(ll_ins,"id_main_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_rate_delivery.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_rate_delivery.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

			
	IF NOT IsNull(dw_rate_delivery.GetItemString(ll_ins,"id_state")) THEN
		ls_sqlsyntax += "'" + trim(dw_rate_delivery.GetItemString(ll_ins,"id_state")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","		

	IF NOT IsNull(dw_rate_delivery.GetItemString(ll_ins,"id_modo_pago")) THEN
		ls_sqlsyntax += "'" + trim(dw_rate_delivery.GetItemString(ll_ins,"id_modo_pago")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_rate_delivery.GetItemString(ll_ins,"id_curreny")) THEN
		ls_sqlsyntax += "'" + trim(dw_rate_delivery.GetItemString(ll_ins,"id_curreny")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
						
	IF NOT IsNull(dw_rate_delivery.GetItemNumber(ll_ins,"rate")) THEN
		ls_sqlsyntax += String(dw_rate_delivery.GetItemNumber(ll_ins,"rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
		
	IF NOT IsNull(dw_rate_delivery.GetItemNumber(ll_ins,"limit_send_rate")) THEN
		ls_sqlsyntax += String(dw_rate_delivery.GetItemNumber(ll_ins,"limit_send_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

			
	IF NOT IsNull(dw_rate_delivery.GetItemNumber(ll_ins,"limit_inf_rate")) THEN
		ls_sqlsyntax += String(dw_rate_delivery.GetItemNumber(ll_ins,"limit_inf_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_rate_delivery.GetItemNumber(ll_ins,"limit_sup_rate")) THEN
		ls_sqlsyntax += String(dw_rate_delivery.GetItemNumber(ll_ins,"limit_sup_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ");"			
	

	ls_return = ls_return + ls_sqlsyntax + ls_enterkey
	

NEXT


// do not return the last enter because the filewrite adds one
return left(ls_return,len(ls_return)-2)
end function

public function string fn_getgeneralrates2 (ref n_tr sqlca_rpt);String ls_return, ls_sqlsyntax, ls_enterkey
Long ll_ins

dw_sql_state_delivery.SetTransObject(SQLCA_RPT)
dw_sql_rate_group_state_city.SetTransObject(SQLCA_RPT)
  
dw_sql_state_delivery.retrieve()
dw_sql_rate_group_state_city.retrieve()

ls_enterkey = char(13) + char(10)
ls_return = ''

//////////////////////////RATE GROUP SATTE CITY \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//dw_sql_rate_group_state_city.retrieve()

ls_return = ls_return + 'DELETE FROM rate_group_state_city ;' + ls_enterkey
FOR ll_ins=1 TO dw_sql_rate_group_state_city.RowCount()

 ls_sqlsyntax="INSERT INTO rate_group_state_city VALUES ("

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country_rate")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_country_rate")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_city_rate")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_city_rate")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","  

	
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_main_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_main_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

			
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_state")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_state")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_curreny")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_state_city.GetItemString(ll_ins,"id_curreny")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
					
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemNumber(ll_ins,"rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_state_city.GetItemNumber(ll_ins,"rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	
			
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemNumber(ll_ins,"limit_send_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_state_city.GetItemNumber(ll_ins,"limit_send_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	
			
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemNumber(ll_ins,"limit_inf_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_state_city.GetItemNumber(ll_ins,"limit_inf_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_sql_rate_group_state_city.GetItemNumber(ll_ins,"limit_sup_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_state_city.GetItemNumber(ll_ins,"limit_sup_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	

	ls_sqlsyntax += ");"			
	
	ls_return = ls_return + ls_sqlsyntax + ls_enterkey
	
	
NEXT

//////////////////////////RATE STATE DELIVERY \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//dw_sql_state_delivery.retrieve()

ls_return = ls_return + 'DELETE FROM rate_state_delivery ;' + ls_enterkey
FOR ll_ins=1 TO dw_sql_state_delivery.RowCount()

 ls_sqlsyntax="INSERT INTO rate_group_state_city VALUES ("

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country_rate")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_state_delivery.GetItemString(ll_ins,"id_country_rate")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_sql_state_delivery.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_state_delivery.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

			
	IF NOT IsNull(dw_sql_state_delivery.GetItemString(ll_ins,"id_state")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_state_delivery.GetItemString(ll_ins,"id_state")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
			
	IF NOT IsNull(dw_sql_state_delivery.GetItemString(ll_ins,"id_modo_pago")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_state_delivery.GetItemString(ll_ins,"id_modo_pago")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	
	IF NOT IsNull(dw_sql_state_delivery.GetItemString(ll_ins,"id_curreny")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_state_delivery.GetItemString(ll_ins,"id_curreny")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
					
	IF NOT IsNull(dw_sql_state_delivery.GetItemNumber(ll_ins,"rate")) THEN
		ls_sqlsyntax += trim(String(dw_sql_state_delivery.GetItemNumber(ll_ins,"rate")))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
			
	IF NOT IsNull(dw_sql_state_delivery.GetItemNumber(ll_ins,"limit_send_rate")) THEN
		ls_sqlsyntax += String(dw_sql_state_delivery.GetItemNumber(ll_ins,"limit_send_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

					
	IF NOT IsNull(dw_sql_state_delivery.GetItemNumber(ll_ins,"limit_inf_rate")) THEN
		ls_sqlsyntax += trim(String(dw_sql_state_delivery.GetItemNumber(ll_ins,"limit_inf_rate")))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_sql_state_delivery.GetItemNumber(ll_ins,"limit_sup_rate")) THEN
		ls_sqlsyntax += String(dw_sql_state_delivery.GetItemNumber(ll_ins,"limit_sup_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF		

	ls_sqlsyntax += ");"			
	
	ls_return = ls_return + ls_sqlsyntax + ls_enterkey
	

NEXT


// do not return the last enter because the filewrite adds one
return left(ls_return,len(ls_return)-2)
end function

public function integer fn_progress ();return 0
end function

public subroutine fn_generate_files_agency (string pl_branch, n_tr sqlca_rpt, ref long pl_cont, string ps_rates1, string ps_rates2) throws n_exception;STRING ls_agencyfolder, ls_badbranches, ls_sqlsyntax
INTEGER li_filenum, ll_ins

n_exception n_exeption_local


n_exeption_local = CREATE n_exception



sle_status.text = 'Generando ' + trim(pl_branch) + " ("+string(pl_cont)+" restantes)..."
pl_cont = pl_cont - 1


ls_agencyfolder = ''

if fileexists(is_output+trim(pl_branch)) then ls_agencyfolder = trim(pl_branch) + '\'

is_output = trim(is_output)
pl_branch = trim(pl_branch)
is_output1 = is_output + ls_agencyfolder + "RAT"+FILL('0',10 - LEN(trim(pl_branch)))+trim(pl_branch)+".sql"
li_FileNum = FileOpen(is_output1, LineMode!, Write!, LockWrite!,Replace!)

if li_filenum < 0 Then

	//Messagebox("Error","Error creating files "+is_output1+", please ask technology to map the network drive")			
	//Return
				
	ls_badbranches = ls_badbranches + trim(pl_branch) + ', '			
	
	 FileClose(li_FileNum)			 
	 
	 THROW n_exeption_local
	// FETCH branch INTO :pl_branch ;			 
	 // Salta a la siguiente agencia!
	//CONTINUE
	 
end if


FileWriteEx(li_FileNum, ps_rates1)

//////////////////////////RATE GROUP AGENT \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

dw_sql_rate_group_agent.SetTransObject(SQLCA_RPT)
dw_sql_rate_group_agent.retrieve(pl_branch)

FileWrite (li_filenum, 'DELETE FROM rate_group_agent ;')
FOR ll_ins=1 TO dw_sql_rate_group_agent.RowCount()

 ls_sqlsyntax="INSERT INTO rate_group_agent VALUES ("

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country_rate")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country_rate")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
					
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_main_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_main_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

			
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_state")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_state")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","		

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_modo_pago")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_modo_pago")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_curreny")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_curreny")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
					
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
					
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_send_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_send_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
					
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_inf_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_inf_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ","

	
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_sup_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_sup_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ",'2003-01-01');"			
	
	FileWrite (li_FileNum,ls_sqlsyntax)
NEXT

////////////////////////////////////////////////////////////////////////////////


FileWriteEx(li_FileNum, ps_rates2)



FileWrite (li_FileNum,"COMMIT;")		

FileClose(li_FileNum)

			
if not fileexists(is_output1) then
	
	ls_badbranches = ls_badbranches + trim(pl_branch) + ', '			
	FileClose(li_FileNum)			 

	INSERT INTO DBA.AUDIT_PUBLICATIONS(DATE_AUDIT,ID_BRANCH,DESC_PUBLICATION,DB_USER_NAME,DB_HOST_NAME)
	VALUES(getdate(),:pl_branch,'PUBLISHED RATE WITH ERROR! (ALL)',upper(SYSTEM_USER),host_name());
	
	
	 THROW n_exeption_local
	
	//FETCH branch INTO :pl_branch ;			 
	// Salta a la siguiente agencia!
	//CONTINUE
	 
	//Messagebox("Error!","No se pudo gererar el archivo para la agencia "+trim(pl_branch)+", el proceso se ha interrumpido.~n~rPor favor contacte a soporte para que revisen el mapeo de la unidad R: y luego publique las tasas de nuevo.",StopSign!)
	//return
else
	INSERT INTO DBA.AUDIT_PUBLICATIONS(DATE_AUDIT,ID_BRANCH,DESC_PUBLICATION,DB_USER_NAME,DB_HOST_NAME)
	VALUES(getdate(),:pl_branch,'PUBLISHED RATE OK (ALL)',upper(SYSTEM_USER),host_name());
end if

hpb_1.position=hpb_1.position+1
	

end subroutine

on w_sql_generator_rate.create
int iCurrent
call super::create
this.em_lista_agencias=create em_lista_agencias
this.hpb_1=create hpb_1
this.st_1=create st_1
this.cb_close=create cb_close
this.st_name=create st_name
this.dw_rate=create dw_rate
this.rb_ins=create rb_ins
this.rb_upd=create rb_upd
this.gb_1=create gb_1
this.cbx_state_rate=create cbx_state_rate
this.dw_state_rate=create dw_state_rate
this.cbx_state_delivery=create cbx_state_delivery
this.dw_rate_delivery=create dw_rate_delivery
this.rb_2=create rb_2
this.dw_sql_rate_group_agent=create dw_sql_rate_group_agent
this.dw_sql_rate_group_state_city=create dw_sql_rate_group_state_city
this.dw_sql_state_delivery=create dw_sql_state_delivery
this.em_branch=create em_branch
this.cb_all=create cb_all
this.cb_one=create cb_one
this.st_path=create st_path
this.gb_3=create gb_3
this.sle_status=create sle_status
this.rb_1=create rb_1
this.cbx_rate=create cbx_rate
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_lista_agencias
this.Control[iCurrent+2]=this.hpb_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.st_name
this.Control[iCurrent+6]=this.dw_rate
this.Control[iCurrent+7]=this.rb_ins
this.Control[iCurrent+8]=this.rb_upd
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.cbx_state_rate
this.Control[iCurrent+11]=this.dw_state_rate
this.Control[iCurrent+12]=this.cbx_state_delivery
this.Control[iCurrent+13]=this.dw_rate_delivery
this.Control[iCurrent+14]=this.rb_2
this.Control[iCurrent+15]=this.dw_sql_rate_group_agent
this.Control[iCurrent+16]=this.dw_sql_rate_group_state_city
this.Control[iCurrent+17]=this.dw_sql_state_delivery
this.Control[iCurrent+18]=this.em_branch
this.Control[iCurrent+19]=this.cb_all
this.Control[iCurrent+20]=this.cb_one
this.Control[iCurrent+21]=this.st_path
this.Control[iCurrent+22]=this.gb_3
this.Control[iCurrent+23]=this.sle_status
this.Control[iCurrent+24]=this.rb_1
this.Control[iCurrent+25]=this.cbx_rate
end on

on w_sql_generator_rate.destroy
call super::destroy
destroy(this.em_lista_agencias)
destroy(this.hpb_1)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.st_name)
destroy(this.dw_rate)
destroy(this.rb_ins)
destroy(this.rb_upd)
destroy(this.gb_1)
destroy(this.cbx_state_rate)
destroy(this.dw_state_rate)
destroy(this.cbx_state_delivery)
destroy(this.dw_rate_delivery)
destroy(this.rb_2)
destroy(this.dw_sql_rate_group_agent)
destroy(this.dw_sql_rate_group_state_city)
destroy(this.dw_sql_state_delivery)
destroy(this.em_branch)
destroy(this.cb_all)
destroy(this.cb_one)
destroy(this.st_path)
destroy(this.gb_3)
destroy(this.sle_status)
destroy(this.rb_1)
destroy(this.cbx_rate)
end on

event open;call super::open;//dw_rate.retrieve()
//dw_state_rate.retrieve()
//dw_rate_delivery.retrieve()
//dw_sql_state_delivery.retrieve()
//dw_sql_rate_group_state_city.retrieve()
LONG l_fila

hpb_1.position=0
em_branch.visible = True

rb_1.checked = True
cb_one.visible = True
cb_all.visible = False

SELECT DISTINCT dba.parametros.dir_output  
INTO :is_output
FROM dba.parametros USING SQLCArpt;

is_output = TRIM(is_output)

st_path.text = is_output


istru_parametros = Message.powerObjectParm


IF UpperBound(istru_parametros.String) > 0 THEN	
	

	cb_all.enabled = False
	cb_one.enabled = False
	em_lista_agencias.Text = ''
	em_lista_agencias.Visible = True
	
	FOR l_fila = 1 TO UpperBound(istru_parametros.String)
		em_lista_agencias.Text = em_lista_agencias.Text + ',' + istru_parametros.String[l_fila]
	NEXT
	
	em_lista_agencias.Text = mid(em_lista_agencias.Text ,2)
	
	This.PostEvent("ue_ejecutar_automatico")   //fn_ejecutar_proceso_masivo(stru_parametros)
	
	
	
END IF
end event

type em_lista_agencias from editmask within w_sql_generator_rate
boolean visible = false
integer x = 526
integer y = 176
integer width = 1211
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type hpb_1 from hprogressbar within w_sql_generator_rate
integer x = 50
integer y = 700
integer width = 1701
integer height = 68
integer transparency = 50
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_1 from statictext within w_sql_generator_rate
integer x = 174
integer y = 392
integer width = 343
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Output Folder :"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_sql_generator_rate
integer x = 709
integer y = 540
integer width = 462
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(parent)
end event

type st_name from statictext within w_sql_generator_rate
integer x = 827
integer y = 184
integer width = 864
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_rate from datawindow within w_sql_generator_rate
integer x = 50
integer y = 988
integer width = 197
integer height = 144
boolean bringtotop = true
string dataobject = "dw_export_rate"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type rb_ins from radiobutton within w_sql_generator_rate
boolean visible = false
integer x = 663
integer y = 116
integer width = 215
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Insert"
boolean checked = true
boolean lefttext = true
end type

type rb_upd from radiobutton within w_sql_generator_rate
boolean visible = false
integer x = 663
integer y = 172
integer width = 215
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Update"
boolean lefttext = true
end type

type gb_1 from groupbox within w_sql_generator_rate
boolean visible = false
integer x = 649
integer y = 52
integer width = 306
integer height = 200
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "File"
end type

type cbx_state_rate from checkbox within w_sql_generator_rate
boolean visible = false
integer x = 146
integer y = 240
integer width = 421
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Stat&e Rate"
boolean checked = true
end type

event clicked;dw_state_rate.retrieve()
end event

type dw_state_rate from datawindow within w_sql_generator_rate
integer x = 251
integer y = 988
integer width = 197
integer height = 144
boolean bringtotop = true
string dataobject = "dw_export_rate_state"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type cbx_state_delivery from checkbox within w_sql_generator_rate
boolean visible = false
integer x = 146
integer y = 332
integer width = 421
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Rate Delivery"
boolean checked = true
end type

event clicked;dw_rate_delivery.retrieve()
end event

type dw_rate_delivery from datawindow within w_sql_generator_rate
integer x = 1056
integer y = 988
integer width = 197
integer height = 144
boolean bringtotop = true
string dataobject = "dw_export_rate_state_delivery"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type rb_2 from radiobutton within w_sql_generator_rate
integer x = 165
integer y = 280
integer width = 709
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "To All Agents"
end type

event clicked;em_branch.enabled = False
cb_one.visible = False
cb_all.visible = True
end event

type dw_sql_rate_group_agent from datawindow within w_sql_generator_rate
integer x = 855
integer y = 988
integer width = 197
integer height = 144
boolean bringtotop = true
string dataobject = "dw_sql_rate_group_agent"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_sql_rate_group_state_city from datawindow within w_sql_generator_rate
integer x = 453
integer y = 988
integer width = 197
integer height = 144
boolean bringtotop = true
string dataobject = "dw_sql_rate_group_state_city"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_sql_state_delivery from datawindow within w_sql_generator_rate
integer x = 654
integer y = 988
integer width = 197
integer height = 144
boolean bringtotop = true
string dataobject = "dw_sql_state_delivery"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type em_branch from editmask within w_sql_generator_rate
integer x = 526
integer y = 176
integer width = 274
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;string ls_branch, ls_name

ls_branch = em_branch.text

SELECT name_branch
INTO :ls_name  
FROM dba.branch  
WHERE dba.branch.id_branch = :ls_branch;

if isnull(ls_name) then ls_name = ''

st_name.text = ls_name
end event

type cb_all from u_cb within w_sql_generator_rate
integer x = 1198
integer y = 540
integer width = 462
integer height = 84
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Generate to &All"
end type

event clicked;Long	   ll_cont
String 	ls_branch,ls_badbranches, ls_rates1, ls_rates2

SetPointer(HourGlass!)
hpb_1.position=0

sle_status.text = ''

IF is_output = '' OR IsNull(is_output) THEN
	MessageBox('Atention','Please Check The OutPut.',Information!)
	Return
END IF


// ******************
// Validate U: Drive!
fn_map_output()
if not fileexists('R:\Output') then
	Messagebox("Error!","Network drive not ready, please try again!",StopSign!)
	return
end if
// ******************

ls_badbranches = ""

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Connection
n_tr SQLCA_RPT
SQLCA_RPT = Create n_tr
SQLCA_RPT.DBMS = "SNC SQL Native Client(OLE DB)"
SQLCA_RPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
SQLCA_RPT.ServerName = gs_servername_rpt
if SQLCA_RPT.of_connect() <> 0 then
	Messagebox("Error","Error trying connection to Reporting Database"+char(13)+char(10)+SQLCA_RPT.SQLErrText,StopSign!)
	return
end if
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ls_rates1 = fn_getgeneralrates1(SQLCA_RPT)
ls_rates2 = fn_getgeneralrates2(SQLCA_RPT)


SELECT count(id_branch)
into :ll_cont
FROM DBA.VW_AGENCIESPC USING SQLCA_RPT;

hpb_1.setrange( 1, ll_cont)
hpb_1.setstep=1

DECLARE branch CURSOR FOR  
SELECT id_branch  
FROM DBA.VW_AGENCIESPC USING SQLCA_RPT;

OPEN branch ;

FETCH branch INTO :ls_branch ;

DO WHILE SQLCA_RPT.SQLCODE = 0
	TRY
		fn_generate_files_agency(ls_branch,SQLCA_RPT,ll_cont,ls_rates1,ls_rates2)

	CATCH (n_exception ex)		
		ls_badbranches = ls_badbranches + trim(ls_branch) + ','
	END TRY

FETCH branch INTO :ls_branch ;

LOOP

CLOSE branch;


// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SetPointer(Arrow!)

if len(ls_badbranches) > 1  then
	MessageBox('Proceso Finalizado','ATENCION!!! Las tasas de cambio han sido publicadas a la mayoria de las agencias, pero hubo error en las siguientes agencias:~n~r'+left(ls_badbranches,len(ls_badbranches)-1)+'. Por favor publique de nuevo a esas agencias y consulte con soporte si el error persiste.',Exclamation!)	
	sle_status.text = 'Proceso terminado con excepciones.'
else
	MessageBox('Proceso Finalizado','Las tasas de cambio han sido publicadas a TODAS las agencias.',Information!)	
	sle_status.text = 'Proceso terminado OK'
end if



	  

	
	
	


end event

type cb_one from commandbutton within w_sql_generator_rate
integer x = 1198
integer y = 540
integer width = 462
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Generate"
end type

event clicked;Long		ll_ins, ll_cont, ll_cont1 = 0
String		ls_sqlsyntax
Integer	li_filenum, li_Filelog
String 	ls_agencyfolder
string		ls_branch, ls_rates1, ls_rates2

SetPointer(HourGlass!)

hpb_1.position=0

sle_status.text = ''

st_path.text = is_output

IF is_output = '' OR IsNull(is_output) THEN
	MessageBox('Error','Output Location is not specified.',StopSign!)
	Return
END IF

ls_branch = em_branch.text

If Isnull(ls_branch) then
	Messagebox("Error","You Must Enter the Branch ID",StopSign!)
	SetFocus(em_branch)
	return
end if

SELECT Count(*)  
INTO :ll_cont1  
FROM dba.branch  
WHERE dba.branch.id_branch = :ls_branch;
  
If ll_cont1  = 0 then
	Messagebox('Error','Branch not Found',StopSign!)
	SetFocus(em_branch)
	Return
end if

sle_status.text = 'Generando ' + trim(ls_branch) + '...'

hpb_1.setrange( 1, 1701)
hpb_1.setstep=300
hpb_1.position=300



// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Connection
n_tr SQLCA_RPT
SQLCA_RPT = Create n_tr
SQLCA_RPT.DBMS = "SNC SQL Native Client(OLE DB)"
SQLCA_RPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
SQLCA_RPT.ServerName = gs_servername_rpt
if SQLCA_RPT.of_connect() <> 0 then
	Messagebox("Error","Error trying connection to Reporting Database"+char(13)+char(10)+SQLCA_RPT.SQLErrText,StopSign!)
	return
end if
hpb_1.position=hpb_1.position+300
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ls_rates1 = fn_getgeneralrates1(SQLCA_RPT)

ls_rates2 = fn_getgeneralrates2(SQLCA_RPT)
hpb_1.position=hpb_1.position+300


//// --------------------------------------------------------------------------
//// Chequea si la agencia no tiene la nueva version
//// Si se le generan los nuevos archivos se dana la agencia con sistema viejo
//boolean lb_isold
//
//If fn_hasnewversion(ls_branch) = TRUE then
//	lb_isold = false
//else
//	lb_isold = true
//end if
// --------------------------------------------------------------------------

// --------------------------------------------------------------------------
// Chequea si la agencia no tiene la nueva version
// Si se le generan los nuevos archivos se dana la agencia con sistema viejo
//Long ll_hasoldversion
//
//SELECT count(*)  
//INTO :ll_hasoldversion  
//FROM dba.VERSION_PROGRAMA  
//WHERE dba.VERSION_PROGRAMA.IB_BRANCH = :ls_branch   ;

//If lb_isold = true then
//	Messagebox("Stop","This agency has an old version, the rate's file must be generated with the old program.",StopSign!)
//	return
//end if
// --------------------------------------------------------------------------

ls_agencyfolder = ''
if fileexists(is_output+trim(ls_branch)) then ls_agencyfolder = trim(ls_branch) + '\'


is_output = trim(is_output)
ls_branch = trim(ls_branch)

is_output1 = is_output + ls_agencyfolder + "RAT"+FILL('0',10 - LEN(ls_branch))+ls_branch+".sql"
li_FileNum = FileOpen(is_output1, LineMode!, Write!, LockWrite!,Replace!)

if li_filenum < 0 Then
	Messagebox("Error","You Have To Verificate the Table Parameters")
	Return
end if


FileWriteEx(li_FileNum, ls_rates1)
hpb_1.position=hpb_1.position+300

// ******************* RATE GROUP AGENT *******************

dw_sql_rate_group_agent.SetTransObject(SQLCA_RPT)
dw_sql_rate_group_agent.retrieve(ls_branch)
hpb_1.position=hpb_1.position+300

FileWrite (li_filenum, 'DELETE FROM rate_group_agent ;')
FOR ll_ins=1 TO dw_sql_rate_group_agent.RowCount()

 ls_sqlsyntax="INSERT INTO rate_group_agent VALUES ("

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country_rate")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country_rate")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_branch")) THEN
		ls_sqlsyntax += "'" +trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_main_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_main_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_state")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_state")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","		

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_modo_pago")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_modo_pago")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_curreny")) THEN
		ls_sqlsyntax += "'" + trim(dw_sql_rate_group_agent.GetItemString(ll_ins,"id_curreny")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
			
	IF NOT IsNull(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_send_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_send_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_inf_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_inf_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_sup_rate")) THEN
		ls_sqlsyntax += String(dw_sql_rate_group_agent.GetItemNumber(ll_ins,"limit_sup_rate"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	
	ls_sqlsyntax += ",'2003-01-01');"			

	FileWrite (li_FileNum,ls_sqlsyntax)
NEXT

FileWriteEx(li_FileNum, ls_rates2)

FileWrite(li_FileNum,'COMMIT;')
FileClose(li_FileNum)

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

hpb_1.position=1701


SetPointer(Arrow!)

if not fileexists(is_output1) then

	INSERT INTO DBA.AUDIT_PUBLICATIONS(DATE_AUDIT,ID_BRANCH,DESC_PUBLICATION,DB_USER_NAME,DB_HOST_NAME)
	VALUES(getdate(),:ls_branch,'PUBLISHED RATE WITH ERROR (INDIVIDUAL)',upper(SYSTEM_USER),host_name());	
	
	Messagebox("Error!","No se pudo gererar el archivo para la agencia "+trim(ls_branch)+", el proceso se ha interrumpido.~n~rPor favor contacte a soporte para que revisen el mapeo de la unidad R: y luego publique las tasas de nuevo.",StopSign!)
	sle_status.text = 'Proceso Terminado con errores'
	return
else

	INSERT INTO DBA.AUDIT_PUBLICATIONS(DATE_AUDIT,ID_BRANCH,DESC_PUBLICATION,DB_USER_NAME,DB_HOST_NAME)
	VALUES(getdate(),:ls_branch,'PUBLISHED RATE OK (INDIVIDUAL)',upper(SYSTEM_USER),host_name());
	MessageBox('Proceso Finalizado','Las tasas de cambio han sido publicadas a '+ trim(ls_branch) +'.',Information!)	
	sle_status.text = 'Proceso Terminado OK'
	
end if


end event

type st_path from statictext within w_sql_generator_rate
integer x = 558
integer y = 392
integer width = 1134
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

event clicked;close(parent)
end event

type gb_3 from groupbox within w_sql_generator_rate
integer x = 37
integer y = 24
integer width = 1714
integer height = 644
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 553648127
string text = "Generate Rates"
end type

type sle_status from singlelineedit within w_sql_generator_rate
integer x = 50
integer y = 696
integer width = 1701
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_sql_generator_rate
integer x = 165
integer y = 176
integer width = 329
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "To Agent :"
boolean checked = true
end type

event clicked;em_branch.enabled = True
cb_one.visible = True
cb_all.visible = False
end event

type cbx_rate from checkbox within w_sql_generator_rate
boolean visible = false
integer x = 146
integer y = 148
integer width = 421
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "&Rate"
boolean checked = true
end type

event clicked;dw_rate.retrieve()
end event

