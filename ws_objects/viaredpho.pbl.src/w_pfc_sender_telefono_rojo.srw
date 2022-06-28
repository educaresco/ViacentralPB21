$PBExportHeader$w_pfc_sender_telefono_rojo.srw
forward
global type w_pfc_sender_telefono_rojo from w_master
end type
type pb_show_folio from picturebutton within w_pfc_sender_telefono_rojo
end type
type uo_segment from uo_segmentation within w_pfc_sender_telefono_rojo
end type
type cbx_alerta_promociones from checkbox within w_pfc_sender_telefono_rojo
end type
type cbx_alerta_envio_sms from checkbox within w_pfc_sender_telefono_rojo
end type
type em_dep_method from editmask within w_pfc_sender_telefono_rojo
end type
type st_2 from statictext within w_pfc_sender_telefono_rojo
end type
type cb_new_receiver from commandbutton within w_pfc_sender_telefono_rojo
end type
type pb_payerlookup from picturebutton within w_pfc_sender_telefono_rojo
end type
type p_5 from picture within w_pfc_sender_telefono_rojo
end type
type cb_paypoint from commandbutton within w_pfc_sender_telefono_rojo
end type
type cb_3 from commandbutton within w_pfc_sender_telefono_rojo
end type
type dw_recibo from datawindow within w_pfc_sender_telefono_rojo
end type
type dw_recibo_matrix from datawindow within w_pfc_sender_telefono_rojo
end type
type cb_print from commandbutton within w_pfc_sender_telefono_rojo
end type
type st_1 from statictext within w_pfc_sender_telefono_rojo
end type
type cb_new from commandbutton within w_pfc_sender_telefono_rojo
end type
type st_3 from statictext within w_pfc_sender_telefono_rojo
end type
type cb_borrar from commandbutton within w_pfc_sender_telefono_rojo
end type
type p_1 from picture within w_pfc_sender_telefono_rojo
end type
type p_2 from picture within w_pfc_sender_telefono_rojo
end type
type dw_3 from datawindow within w_pfc_sender_telefono_rojo
end type
type cb_cost from commandbutton within w_pfc_sender_telefono_rojo
end type
type p_3 from picture within w_pfc_sender_telefono_rojo
end type
type cb_calcular from commandbutton within w_pfc_sender_telefono_rojo
end type
type cb_total from commandbutton within w_pfc_sender_telefono_rojo
end type
type cb_calculate from commandbutton within w_pfc_sender_telefono_rojo
end type
type st_4c from statictext within w_pfc_sender_telefono_rojo
end type
type p_6rc from picture within w_pfc_sender_telefono_rojo
end type
type st_4 from statictext within w_pfc_sender_telefono_rojo
end type
type em_balance from editmask within w_pfc_sender_telefono_rojo
end type
type st_7 from statictext within w_pfc_sender_telefono_rojo
end type
type em_ultimo_invoice from singlelineedit within w_pfc_sender_telefono_rojo
end type
type cb_paymode from commandbutton within w_pfc_sender_telefono_rojo
end type
type st_agency from statictext within w_pfc_sender_telefono_rojo
end type
type dw_network from datawindow within w_pfc_sender_telefono_rojo
end type
type dw_1 from datawindow within w_pfc_sender_telefono_rojo
end type
type dw_2 from datawindow within w_pfc_sender_telefono_rojo
end type
type dw_address from datawindow within w_pfc_sender_telefono_rojo
end type
end forward

global type w_pfc_sender_telefono_rojo from w_master
integer x = 32
integer y = 100
integer width = 3049
integer height = 2060
string title = "Adding an Invoice"
string menuname = "m_pfc_sender_central_telefono_rojo"
boolean maxbox = false
boolean resizable = false
long backcolor = 80269524
event ue_insertar pbm_custom66
event ue_update pbm_custom71
event ue_documento pbm_custom74
event ue_calcular pbm_custom43
event ue_calculadora pbm_custom75
event ue_telefono pbm_custom70
event ue_imprimir pbm_custom72
event ue_anulacion pbm_custom73
event ue_export pbm_custom69
event ue_cost pbm_custom31
event ue_hold pbm_custom28
event ue_total pbm_custom29
event ue_sender_id pbm_custom30
event ue_print_matrix pbm_custom32
event ue_postopen ( )
pb_show_folio pb_show_folio
uo_segment uo_segment
cbx_alerta_promociones cbx_alerta_promociones
cbx_alerta_envio_sms cbx_alerta_envio_sms
em_dep_method em_dep_method
st_2 st_2
cb_new_receiver cb_new_receiver
pb_payerlookup pb_payerlookup
p_5 p_5
cb_paypoint cb_paypoint
cb_3 cb_3
dw_recibo dw_recibo
dw_recibo_matrix dw_recibo_matrix
cb_print cb_print
st_1 st_1
cb_new cb_new
st_3 st_3
cb_borrar cb_borrar
p_1 p_1
p_2 p_2
dw_3 dw_3
cb_cost cb_cost
p_3 p_3
cb_calcular cb_calcular
cb_total cb_total
cb_calculate cb_calculate
st_4c st_4c
p_6rc p_6rc
st_4 st_4
em_balance em_balance
st_7 st_7
em_ultimo_invoice em_ultimo_invoice
cb_paymode cb_paymode
st_agency st_agency
dw_network dw_network
dw_1 dw_1
dw_2 dw_2
dw_address dw_address
end type
global w_pfc_sender_telefono_rojo w_pfc_sender_telefono_rojo

type variables
String	Is_branch_insta = "", is_currency

Double	il_long_phone,	&
	 		id_rate,		&
	 		id_inf,		&
	 		id_sup,		&
	 		id_limit_id,	&
	 		id_sender, id_receiver
			 
Double   id_availablebalance			 

String	is_city,is_state,is_country,is_mod_pay, is_mod_currency 

String	is_phone, is_estado

Boolean	ib_actualizado = False, ib_fallas = False

Date		id_fecha

String	is_path_envio, is_path_cliente, is_output, is_branch_ultimo

//Boolean	ib_isRedPhone = True
//Boolean  ib_isPOSTerminal = False
Int ii_sends_receipt = 1
String is_name_tipo

Boolean 	ib_haspayor = False

Int li_calculation_mode

// li_calculation_mode = 1 (net amount) DEFAULT
// li_calculation_mode = 2 (total)
// li_calculation_mode = 3 (totap to be pay)

// string validation class
n_my_string obj_string_tools

datetime id_datestart, id_dateend


end variables

forward prototypes
public subroutine fn_loadbranch ()
public subroutine fn_agencytype (string ls_id_branch)
public subroutine fn_choose_payor ()
public function boolean fn_valida_pagador (boolean pb_silent)
public subroutine fn_fillmodopago (string ls_modo_pago_previo)
public subroutine fn_valcurrency ()
public subroutine fn_refreshscreen (string updatedfield)
protected function boolean fn_validapayerlimit (double pd_orderfacevalue, double pd_ordertotalvalue, double pd_orderamounttopay, string ps_ordercurrencytopay, string ps_idpayer, string ps_idcountry, string ps_paymode, string ps_idsenderstate)
protected function boolean fn_validapoplimit (double pd_orderamounttopay, string ps_ordercurrencytopay, string ps_idbranchpay)
public subroutine fn_update_balance ()
public function decimal fn_getstatetax (string ps_id_branch, decimal pd_amount)
public subroutine fn_calhandling ()
public subroutine fn_displayaddressverification2 ()
public function stru_parametros wf_procesar_mensajes (string ps_respuesta)
public subroutine wf_sendcompasscompliance (string ps_branch, long pl_receiver) throws exception
public function string fn_get_branch_name (string as_branch_id)
public subroutine fn_habilitar_campos (string as_branch)
public subroutine fn_get_receiver ()
public subroutine fn_envio_alertas ()
end prototypes

event ue_insertar;DataWindowChild ldw_cdw
Double	ld_ultimo

// :::::::::::::::::::::::::::::::::::::::::::::::::
string ls_selected

gl_sender = 0

IF UPPER(fn_busparameter("RP_BYPHONE")) = 'ON' THEN
	OpenWithParm(w_selectbranch2, is_branch_insta)
ELSE
	OpenWithParm(w_selectbranch, is_branch_insta)
END IF

ls_selected = Message.StringParm
IF ls_selected = "NONE" THEN
	ls_selected = ''
	MessageBox("Agencia No Seleccionada","No ha seleccionado ninguna agencia, debe seleccionar una agencia antes de poner un envio.",Exclamation!)
	return
END IF

fn_habilitar_campos(ls_selected)

dw_network.setitem(1,"id_branch",ls_selected)
fn_agencytype(ls_selected)	
dw_network.accepttext()	
this.fn_loadbranch()
uo_segment.uof_query( ls_selected)
// :::::::::::::::::::::::::::::::::::::::::::::::::

is_estado =  'I'
ib_actualizado = False

//cb_borrar.visible = False

Commit;

dw_1.reset()
dw_2.reset()

dw_1.enabled = True
dw_2.enabled = True

dw_1.setfocus()

String	ls_city,ls_state,ls_country 

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT id_city,id_state,id_country  
 INTO :ls_city,:ls_state,:ls_country  
 FROM dba.branch  WITH (NOLOCK)
WHERE id_branch = :is_branch_insta   ;
//***********************************************************
	
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_1.setitem(dw_1.getrow(),"id_branch",is_branch_insta)
dw_1.setitem(dw_1.getrow(),"id_country",ls_country)

dw_1.setitem(w_pfc_sender_telefono_rojo.dw_1.getrow(),"SEN_PAYMENTTYPE","C")	

dw_1.setitem(dw_1.getrow(),"id_state",ls_state)

dw_1.GetChild('id_state',ldw_cdw)
ldw_cdw.SetFilter('')
ldw_cdw.Filter()
ldw_cdw.SetTransObject(SQLCA)
ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
ldw_cdw.Filter()

dw_1.GetChild('id_city',ldw_cdw)
ldw_cdw.SetFilter('')
ldw_cdw.Filter()
ldw_cdw.SetTransObject(SQLCA)
ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
ldw_cdw.Filter()

dw_1.setitem(dw_1.getrow(),"id_city",ls_city)

gs_branch_insta = is_branch_insta

ld_ultimo = fn_ultimo_invoice_agente(is_branch_insta)
em_ultimo_invoice.text = trim(is_branch_insta) +" - "+string(ld_ultimo)
	

dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)

dw_1.AcceptText()
dw_2.AcceptText()

dw_network.setfocus()

end event

event ue_update;SetPointer(HourGlass!)
	
String			ls_dot_pri, ls_grupo_receptor, ls_motivo_hold, ls_branch, ls_flag, ls_country1, ls_branch_pag, ls_grupo_pagador
String 		ls_valLicense
Double		ld_sender,ld_receiver

Double 		ld_amount, ld_acumulado, ld_total_final
Datetime 	ld_datetime
Long     		ll_dias_investigacion
Boolean 		lb_needs_kyc

//[CLONDONO][2013-09-11] The following variables are needed for the new stored procedure that calculates the date a remittance will be available in the destination country
string		ls_id_main_branch, ls_country_receiver, ls_datetime,ls_id_branch
date		ldt_date_receiver
time		lt_time_receiver
long		ll_iteration
decimal	ld_dest_country_tax,ld_id_receiver
//[CLONDONO][2013-09-11] END



if isNull(is_branch_insta) OR is_branch_insta = '' then
	messagebox("Alert", "Please select an Agency (CLICK NEW)")
	return
end if

lb_needs_kyc = false

SetPointer(HourGlass!)

ld_datetime = datetime(today(),now())

// """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
// Default Values
if isnull(dw_1.getitemstring(dw_1.getrow(),"passport_available")) then
	dw_1.setitem(dw_1.getrow(),"passport_available",'Y')
end if

if isnull(dw_1.getitemstring(dw_1.getrow(),"ssn_available")) then
	dw_1.setitem(dw_1.getrow(),"ssn_available",'Y')
end if
// """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

dw_1.accepttext()
dw_2.accepttext()




// Sender:
dw_1.setitem(dw_1.getrow(), "sen_fname",obj_string_tools.of_RemoveNonAlphaLeaveSpaces(dw_1.getitemstring(dw_1.getrow(),"sen_fname")))
dw_1.setitem(dw_1.getrow(), "sen_mname",obj_string_tools.of_RemoveNonAlphaLeaveSpaces(dw_1.getitemstring(dw_1.getrow(),"sen_mname")))
dw_1.setitem(dw_1.getrow(), "sen_lname",obj_string_tools.of_RemoveNonAlphaLeaveSpaces(dw_1.getitemstring(dw_1.getrow(),"sen_lname")))
dw_1.setitem(dw_1.getrow(), "sen_slname",obj_string_tools.of_RemoveNonAlphaLeaveSpaces(dw_1.getitemstring(dw_1.getrow(),"sen_slname")))

dw_1.setitem(dw_1.getrow(), "addres_sender",obj_string_tools.of_removenonprint(dw_1.getitemstring(dw_1.getrow(),"addres_sender")))
dw_1.setitem(dw_1.getrow(), "number_id_sender",obj_string_tools.of_removenonprint(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")))
dw_1.setitem(dw_1.getrow(), "email_sender",obj_string_tools.of_removenonprint(dw_1.getitemstring(dw_1.getrow(),"email_sender")))

// Recipient:
dw_2.setitem(dw_2.getrow(), "receiver_rec_fname",obj_string_tools.of_RemoveNonAlphaLeaveSpaces(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_fname")))
dw_2.setitem(dw_2.getrow(), "receiver_rec_mname",obj_string_tools.of_RemoveNonAlphaLeaveSpaces(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_mname")))
dw_2.setitem(dw_2.getrow(), "receiver_rec_lname",obj_string_tools.of_RemoveNonAlphaLeaveSpaces(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_lname")))
dw_2.setitem(dw_2.getrow(), "receiver_rec_slname",obj_string_tools.of_RemoveNonAlphaLeaveSpaces(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_slname")))

dw_2.setitem(dw_2.getrow(), "address_receiver",obj_string_tools.of_removenonprint(dw_2.getitemstring(dw_2.getrow(),"address_receiver")))
dw_2.setitem(dw_2.getrow(), "notes_receiver",obj_string_tools.of_removenonprint(dw_2.getitemstring(dw_2.getrow(),"notes_receiver")))



w_pfc_sender_telefono_rojo.TriggerEvent("ue_calcular")

// >>>>>>>>>>>>>>>>>>>>
// concatena el nombre
string ls_completename, ls_partial	
ls_completename = ""
ls_partial = trim(dw_1.getitemstring(dw_1.getrow(),"sen_fname"))
if not isnull(ls_partial) then ls_completename += ls_partial + " "
ls_partial = trim(dw_1.getitemstring(dw_1.getrow(),"sen_mname"))
if not isnull(ls_partial) then ls_completename += ls_partial + " "
ls_partial = trim(dw_1.getitemstring(dw_1.getrow(),"sen_lname"))
if not isnull(ls_partial) then ls_completename += ls_partial + " "
ls_partial = trim(dw_1.getitemstring(dw_1.getrow(),"sen_slname"))
if not isnull(ls_partial) then ls_completename += ls_partial
ls_completename = fn_replace(ls_completename,"  "," ")
ls_completename =  trim(ls_completename)
dw_1.setitem(dw_1.getrow(),"name_sender", left(ls_completename,40))	
dw_1.accepttext()
// >>>>>>>>>>>>>>>>>>>>	

// >>>>>>>>>>>>>>>>>>>>
// concatena el nombre	
ls_completename = ""
ls_partial = trim(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_fname"))
if not isnull(ls_partial) then ls_completename += ls_partial + " "
ls_partial = trim(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_mname"))
if not isnull(ls_partial) then ls_completename += ls_partial + " "
ls_partial = trim(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_lname"))
if not isnull(ls_partial) then ls_completename += ls_partial + " "
ls_partial = trim(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_slname"))
if not isnull(ls_partial) then ls_completename += ls_partial
ls_completename = fn_replace(ls_completename,"  "," ")
ls_completename =  trim(ls_completename)
dw_2.setitem(dw_2.getrow(),"name_receiver", left(ls_completename,40))	
dw_2.accepttext()
// >>>>>>>>>>>>>>>>>>>>	

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Sincroniza el modo de pago. (Lo que escogio en el sender
// se lo pone al receiver, el sender guarda el ultimo)

string ls_paymenttype, ls_accrouting, ls_accbank, ls_accnumber

ls_paymenttype = dw_1.getitemstring(dw_1.getrow(),"SEN_PAYMENTTYPE")
if (isnull(ls_paymenttype) or len(trim(ls_paymenttype)) < 1) then dw_1.setitem(dw_1.getrow(),"SEN_PAYMENTTYPE",'C')	
if ls_paymenttype <> 'E' then        // Acc/bank/number is only for E-Checks!!!
	dw_1.setitem(dw_1.getrow(),"SEN_ACCROUTING",'')
	dw_1.setitem(dw_1.getrow(),"SEN_ACCBANK",'')
	dw_1.setitem(dw_1.getrow(),"SEN_ACCNUMBER",'')				
end if
ls_accrouting = dw_1.getitemstring(dw_1.getrow(),"SEN_ACCROUTING")
ls_accbank = dw_1.getitemstring(dw_1.getrow(),"SEN_ACCBANK")	
ls_accnumber = dw_1.getitemstring(dw_1.getrow(),"SEN_ACCNUMBER")

dw_2.setitem(dw_2.getrow(),"RECEIVER_REC_PAYMENTTYPE",ls_paymenttype)
dw_2.setitem(dw_2.getrow(),"RECEIVER_REC_ACCROUTING",ls_accrouting)
dw_2.setitem(dw_2.getrow(),"RECEIVER_REC_ACCBANK",ls_accbank)
dw_2.setitem(dw_2.getrow(),"RECEIVER_REC_ACCNUMBER",ls_accnumber)		
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ---------------------------------------------------------------->
// FN, LN son obligatorios para sender/receiver
string ls_name_cur

ls_name_cur = trim(dw_1.getitemstring(dw_1.getrow(),"sen_fname"))
if isnull(ls_name_cur) or len(trim(ls_name_cur))<1 then
	//Messagebox("Incomplete Sender","You must fill the first name of the sender",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar el primer nombre del remitente.",Exclamation!)
	dw_1.setfocus()
	dw_1.setcolumn("sen_fname")
	return
end if
ls_name_cur = trim(dw_1.getitemstring(dw_1.getrow(),"sen_lname"))
if isnull(ls_name_cur) or len(trim(ls_name_cur))<1 then
	//Messagebox("Incomplete Sender","You must fill the last name of the sender",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar el primer apellido del remitente.",Exclamation!)
	dw_1.setfocus()
	dw_1.setcolumn("sen_lname")
	return
end if	
ls_name_cur = trim(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_fname"))
if isnull(ls_name_cur) or len(trim(ls_name_cur))<1 then
	//Messagebox("Incomplete Receiver","You must fill the first name of the receiver",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar el primer nombre del beneficiario.",Exclamation!)
	dw_2.setfocus()
	dw_2.setcolumn("receiver_rec_fname")
	return
end if
ls_name_cur = trim(dw_2.getitemstring(dw_2.getrow(),"receiver_rec_lname"))
if isnull(ls_name_cur) or len(trim(ls_name_cur))<1 then
	//Messagebox("Incomplete Receiver","You must fill the last name of the receiver",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar el primer apellido del beneficiario.",Exclamation!)
	dw_2.setfocus()
	dw_2.setcolumn("receiver_rec_lname")
	return
end if

//===================================================================
// Verifica el CPF para Brasil
// BRA-BRD
if dw_2.getitemstring(dw_2.getrow(),"id_country_receiver") = 'BRA' or &
	dw_2.getitemstring(dw_2.getrow(),"id_country_receiver") = 'BRD' then
	
	if isnull(dw_2.getitemstring(dw_2.getrow(),"receiver_typeid")) or &
		trim(dw_2.getitemstring(dw_2.getrow(),"receiver_typeid")) <> 'BF' then
		messagebox("Missing Information","You must enter the recipient's CPF.",StopSign!)
		dw_2.setfocus()
		dw_2.setcolumn("receiver_typeid")
		return
	end if

	if isnull(dw_2.getitemstring(dw_2.getrow(),"receiver_numid")) or &
		len(trim(dw_2.getitemstring(dw_2.getrow(),"receiver_numid"))) < 4 or &
		right(trim(dw_2.getitemstring(dw_2.getrow(),"receiver_numid")),4) = '0000' or &
		right(trim(dw_2.getitemstring(dw_2.getrow(),"receiver_numid")),4) = '1111' or &
		right(trim(dw_2.getitemstring(dw_2.getrow(),"receiver_numid")),4) = '9999'	then
		messagebox("Missing Information","You must enter the recipient's CPF.",StopSign!)
		dw_2.setfocus()
		dw_2.setcolumn("receiver_numid")
		return
	end if

	if fn_valcpf(trim(dw_2.getitemstring(dw_2.getrow(),"receiver_numid"))) = false then
		messagebox("Invalid CPF Check","The CPF number is invalid.~n~rEl numero CPF es invalido.",StopSign!)
		dw_2.setfocus()
		dw_2.setcolumn("receiver_numid")
		return
	end if


end if
//===================================================================

// """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
// Si aun no tiene Ciudad o Estado los busca en la tabla zipcode

string ls_state1, ls_city1, ls_zip_sender		
ls_zip_sender = string(dw_1.getitemnumber(dw_1.getrow(),"zip_sender"))

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Obtiene el estado de la tabla de ZIPCODES
ls_state1 = dw_1.getitemstring(dw_1.getrow(),"state_sender")
		
if isnull(ls_state1) or trim(ls_state1) = '' then
	SELECT MIN(IDSTATE)
	INTO :ls_state1
	FROM dba.zipcode
	where zipcode = :ls_zip_sender;
		
	if not isnull(ls_state1) then
		dw_1.setitem(dw_1.getrow(),"state_sender",ls_state1)
	end if				
end if 
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Obtiene la ciudad de la tabla de ZIPCODES
ls_city1 = dw_1.getitemstring(dw_1.getrow(),"city_sender")	
if isnull(ls_city1) or trim(ls_city1) = '' then
	SELECT MIN(CITY)
	INTO :ls_city1
	FROM dba.zipcode
	where zipcode = :ls_zip_sender;
	
	if not isnull(ls_city1) then
		dw_1.setitem(dw_1.getrow(),"city_sender",ls_city1)
	end if				
end if 
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++				
	
// """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
		
// ESTADO Y CIUDAD DEL SENDER SON OBLIGATORIAS
String ls_state_sender, ls_city_sender

ls_state_sender = dw_1.getitemstring(dw_1.getrow(),"state_sender")	
if isnull(ls_state_sender) or ls_state_sender = '' then
	//Messagebox("Incomplete Sender","You must fill the State of the Sender",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar el estado del remitente.",Exclamation!)
	dw_1.setfocus()
	dw_1.setcolumn("state_sender")
	return
end if

/*****************************************************
			csarmiento
			PBI 783 : dont allow tx from no license state when agency is A00788
			10/16/2014
*****************************************************/
			
ls_valLicense =''
	
//DON (03/24/2015) - ADDED NOLOCK.  ********************************
 SELECT  dba.sfValLicenseStateFroBranch(:Is_branch_insta, id_state	) 
     into  :ls_valLicense
    from  dba.state	WITH (NOLOCK)
where id_state = :ls_state_sender;
//***********************************************************

			
if (ls_valLicense = 'N') then
	Messagebox("Error","Viamericas don't have license to allow transactions in the given state for agency " + Is_branch_insta ,Exclamation!)
	return
end if
/****end PBI 783 ******************************************************/

ls_city_sender = dw_1.getitemstring(dw_1.getrow(),"city_sender")	
if isnull(ls_city_sender) or ls_city_sender = '' then
	//Messagebox("Incomplete Sender","You must fill the City of the Sender",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar la ciudad del remitente.",Exclamation!)
	dw_1.setfocus()
	dw_1.setcolumn("city_sender")
	return
end if

// Las direcciones son obligatorias!!!
string ls_address_rec, ls_address_sen

// replaces the '*' on the address
ls_address_sen = fn_replace(dw_1.getitemstring(dw_1.getrow(),"addres_sender"),'*','')
dw_1.setitem(dw_1.getrow(),"addres_sender",ls_address_sen)


ls_address_sen = dw_1.getitemstring(dw_1.getrow(),"addres_sender")	
if isnull(ls_address_sen) or len(trim(ls_address_sen))<1 then
	//Messagebox("Incomplete Sender","You must fill the address of the sender",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar la dirección del remitente.",Exclamation!)
	dw_1.setfocus()
	dw_1.setcolumn("addres_sender")
	return
end if






//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// Address validation!!!

// ############################################################
// Values for add_bitmap_sender are:
// AV:V?: Verified waiting selection 
// AV:VA: Verified accepted (by system or user)
// AV:KC: Keep current (Unverified)
// AV:NF: Not Similar Address Found (will ask before save and will change to AV:KC)
// AV:IA: Invalid Address (will ask before save the record)		
// OTHER: Address to be verified
// ############################################################
		
		
String ls_addvalidation
ls_addvalidation = dw_1.getitemstring(dw_1.getrow(),"add_bitmap_sender")

// si no ha ejecutado la validacion,
if left(ls_addvalidation,3) <> 'AV:' then	
	fn_displayaddressverification2()
	dw_1.accepttext()		
end if

// si hay sugerencias
ls_addvalidation = dw_1.getitemstring(dw_1.getrow(),"add_bitmap_sender")
if left(ls_addvalidation,5) = 'AV:V?'  then
	messagebox("Invalid Sender Address","Please select a valid address for the sender.",Exclamation!)
	dw_address.visible = true
	return
end if

// Si es invalida o no encontrada
ls_addvalidation = dw_1.getitemstring(dw_1.getrow(),"add_bitmap_sender")
if left(ls_addvalidation,5) = 'AV:IA' or left(ls_addvalidation,5) = 'AV:NF' then
	if messagebox("Invalid Sender Address","The SENDER ADDRESS is invalid, please confirm the address with the sender.~n~rIs the address OK?",Question!,YesNo!) <> 1 Then
		return
	end if
end if


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




ls_address_rec = dw_2.getitemstring(dw_2.getrow(),"address_receiver")	
if isnull(ls_address_rec) or len(trim(ls_address_rec))<1 then
	//Messagebox("Incomplete Receiver","You must fill the address of the receiver",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar la dirección del beneficiario.",Exclamation!)
	dw_2.setfocus()
	dw_2.setcolumn("address_receiver")
	return
end if



// Valida el EMail del sender (es opcional a menos que haya escogido entrega del recibo por EMail)
String ls_email_sender
Double ls_receiptto

ls_receiptto = dw_1.getitemnumber(dw_1.getrow(),"receiptto")	
ls_email_sender = dw_1.getitemstring(dw_1.getrow(),"email_sender")	

if isnull(ls_receiptto) then ls_receiptto = 0
if isnull(ls_email_sender) then ls_email_sender = ''

// 1 = EMail, 3 = EMail + Home
if trim(ls_email_sender) <> '' or (ls_receiptto = 1 or ls_receiptto = 3) then

	if not fn_valemailaddress(ls_email_sender) then
		//Messagebox("Incomplete Receiver","You must fill the address of the receiver",Exclamation!)
		messagebox("Correo Electrónico Inválido","Debe ingresar un correo electrónico válido para el remitente.~n~rSi no tiene un correo válido debe cambiar la opción de recibir el recibo por correo.",Exclamation!)
		dw_1.setfocus()
		dw_1.setcolumn("email_sender")
		return
	end if
	
end if


//	datetime ld_dob
//	ld_dob = datetime(dw_1.getitemdate(dw_1.getrow(),"dob_sender"),time('00:00:00'))
//	if ld_dob < datetime(date('1900-01-01'),time('00:00:00')) or ld_dob >= datetime(today(),now()) Then
//		//Messagebox("Invalid Date of Birth","The Date "+string(ld_dob)+" is not a valid date of birth",StopSign!)
//		messagebox("Informacion Invalida","Debe ingresar una fecha de nacimiento valida.",StopSign!)
//		dw_1.setfocus()
//		dw_1.setcolumn("dob_sender")	
//		return
//	end if

//Verifica el telefono del destinatario
if dw_2.getitemstring(dw_2.getrow(),"phone1_receiver") = '' or isnull(dw_2.getitemstring(dw_2.getrow(),"phone1_receiver")) then
	//IF Messagebox("Invalid Receiver Phone"," Phone is not valid, Do you want to Continue",StopSign!,YesNo!) = 2 then
	IF Messagebox("Informacion Invalida","El teléfono no es valido, esta seguro que desea continuar?",StopSign!,YesNo!) = 2 then
		return
	end if
end if


if isnull(dw_2.getitemstring(dw_2.getrow(),"receiver_mode_pay_receiver")	) or dw_2.getitemstring(dw_2.getrow(),"receiver_mode_pay_receiver")	 = '' then
	//Messagebox("Incomplete Sender","You must fill the State of the Sender",Exclamation!)
	messagebox("Información Incompleta","Debe ingresar el modo de pago (Oficina/Banco/Domicilio).",Exclamation!)
	dw_2.setfocus()
	dw_2.setcolumn("receiver_mode_pay_receiver")
	return
end if

string ls_branchpay	
ls_branchpay = dw_2.getitemstring(dw_2.getrow(),"branch_pay_receiver")

///////////////////////////////////////////ARMANDO///////////////////////////////////////////////////////////////////////



String ls_phone1_sender
//long ll_cont_phone_inv, ll_cont_phone_branch
ls_phone1_sender = Trim(String(dw_1.getitemnumber(dw_1.getrow(),"phone1_sender")))


ls_branch_pag = dw_2.getitemstring(dw_2.getrow(),"branch_pay_receiver")	

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT dba.branch.id_main_branch
INTO :ls_grupo_pagador
FROM dba.branch	WITH (NOLOCK)
WHERE dba.branch.id_branch = :ls_branch_pag;



// Check if sender phone required payer 
double ld_count_senderbene_payers, ld_count_bene_payers
string ls_phone1_bene
string ls_bene_country

/*select count(PropertyValue)
 into :ld_count_senderbene_payers
 from POS_Terminal_CFG
where PropertyName = 'Payers.SenderBenePhoneRequired'
	and PropertyValue = :ls_grupo_pagador;*/
	
DATASTORE dts_reglas

dts_reglas = CREATE DATASTORE

dts_reglas.dataobject = 'd_rules_configuration'

dts_reglas.SetTransObject(SQLCA)

ld_count_senderbene_payers = dts_reglas.Retrieve( 'Payers.SenderBenePhoneRequired', ls_grupo_pagador)

/*
SELECT COUNT(1)
 into :ld_count_senderbene_payers
FROM dba.[RULE],
	 DBA.PAYER_RULES PR
WHERE dba.[RULE].RULE_TYPE = 'Payers.SenderBenePhoneRequired'
  AND dba.[RULE].ID_RULE = PR.ID_RULE
  AND PR.ID_MAIN_BRANCH = :ls_grupo_pagador;*/

if (ld_count_senderbene_payers > 0 ) then 
	if (ls_phone1_sender = '' or ls_phone1_sender ='7070707070' or ls_phone1_sender = '0' ) then
		
		messagebox("Información Incompleta","Teléfono Requerido : Se requiere el número de teléfono del remitente para este pagador.",Exclamation!)
		RETURN
    end if
end if


//	Verifica el telefono del destinatario

ls_bene_country = dw_2.getitemstring(dw_2.getrow(),"id_country_receiver")
ls_phone1_bene = dw_2.getitemstring(dw_2.getrow(),"phone1_receiver")
ls_branch_pag = dw_2.getitemstring(dw_2.getrow(),"branch_pay_receiver")	 


ld_count_bene_payers = dts_reglas.Retrieve( 'Payers.BenePhoneRequired', ls_grupo_pagador)
/*
SELECT COUNT(1)
 into :ld_count_bene_payers
FROM dba.[RULE] R,
	 DBA.PAYER_RULES PR
WHERE R.RULE_TYPE = 'Payers.BenePhoneRequired'
  AND R.ID_RULE = PR.ID_RULE
  AND PR.ID_MAIN_BRANCH = :ls_grupo_pagador;*/
  
/*select count(PropertyValue)
 into :ld_count_bene_payers
 from POS_Terminal_CFG
where PropertyName = 'Payers.BenePhoneRequired'
	and PropertyValue = :ls_grupo_pagador;*/

if ld_count_bene_payers > 0 OR ld_count_senderbene_payers > 0  then
	if ls_phone1_bene = '' or ls_phone1_bene = '0' or isnull(ls_phone1_bene) then		
		messagebox("Información Incompleta",  "Teléfono Requerido : Se requiere el número de teléfono del beneficiario para este pagador.",Exclamation!)
		RETURN
	end if
end if

if ld_count_bene_payers > 0  then
	// check for US and 10 digit beneficiary number if HalCash (T247)
	if (ls_grupo_pagador = 'T247' ) then
		if ( len(ls_phone1_bene) <> 10 ) then		
			
			messagebox("Información Incompleta", "Teléfono de USA requerido: Número celular de 10 dígitos es requerido para el beneficiario.",Exclamation!)
			RETURN
		end if
	end if
end if





// Check for ATM payer and 'Amount to Send' value
long ld_count_payerCodeAtm
string ls_multiples
double ld_multiples

/*select count(PropertyValue)
into :ld_count_payerCodeAtm
from POS_Terminal_CFG
where PropertyName = 'Payers.ATMRestriction'
and PropertyValue = :ls_grupo_pagador;*/



ld_count_payerCodeAtm = dts_reglas.Retrieve( 'Payers.ATMRestriction', ls_grupo_pagador)
/*
 SELECT count(1)
 into :ld_count_payerCodeAtm
FROM dba.[RULE] R,
	 DBA.PAYER_RULES PR
WHERE R.RULE_TYPE = 'Payers.ATMRestriction'
  AND R.ID_RULE = PR.ID_RULE
  AND PR.ID_MAIN_BRANCH =:ls_grupo_pagador;*/



if ld_count_payerCodeAtm > 0 then
	LONG ll_count_reg
	
	// Obtains the multiples for the selected payer
	ll_count_reg = dts_reglas.Retrieve( 'Payers.ATMRestrictionMultiples', ls_grupo_pagador)
	
	IF ll_count_reg > 0 THEN
		ls_multiples = dts_reglas.GetItemString(1,'value')			
	END IF
	/*
	SELECT MIN(PR.VALUE)
	into :ls_multiples
	FROM dba.[RULE] R,
		 DBA.PAYER_RULES PR
	WHERE R.RULE_TYPE = 'Payers.ATMRestrictionMultiples'
	  AND R.ID_RULE = PR.ID_RULE
	  AND PR.ID_MAIN_BRANCH = :ls_grupo_pagador;*/
	/*
	select min(PropertyValue)
	into :ls_multiples
	from POS_Terminal_CFG
	where PropertyName = 'Payers.ATMRestrictionMultiples.'+rtrim(ltrim(:ls_grupo_pagador));
	*/
	
	if IsNumber(ls_multiples) then
		ld_multiples = Double(ls_multiples)
	end if

	
	// if there is not value uses $20 as the default (20 was the original value for HALCASH/PIN4)
	if isnull(ld_multiples) or ld_multiples = 0 then 
		ld_multiples = 20
		ls_multiples = '20'
	end if
	
	Double	ld_total_pay_receiver

	ld_total_pay_receiver = dw_2.getitemnumber(dw_2.getrow(),"total_pay_receiver")

  	// check that the payment amount is a multiple of the value in Payers.ATMRestrictionMultiples.Txxx
	if (MOD(ld_total_pay_receiver, ld_multiples) <> 0) then
		
		STRING s_id_curreny, s_name_currency
		
		s_id_curreny = dw_2.getitemstring(dw_2.getrow(),"id_curreny") 
		
		
		SELECT  C.NAME_CURRENCY   
		   INTO :s_name_currency
		 FROM dba.currency C  
		WHERE C.ID_CURRENY = :s_id_curreny;
		
		
	
		messagebox("Información Incompleta", "Monto Inválido : El monto a pagar debe ser múltiplo de $"+ls_multiples+" "+s_name_currency + " para este pagador.",Exclamation!)
		RETURN
		
			

   end if
end if















///////////////////////////////////////////ARMANDO///////////////////////////////////////////////////////////////////////







//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// CHEQUEA LA AGENCIA PAGADORA (POR SI NO ESCOGIO UNA)
long ll_cont1

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT COUNT(*)
INTO :ll_cont1
FROM dba.branch	WITH (NOLOCK)
WHERE dba.branch.id_branch = :ls_branchpay
AND id_flag_branch = 'A'
AND id_type_branch <> 'R';
//***********************************************************

if ll_cont1 <> 1 then
	//Messagebox("Payer Branch not Found","Payer Branch not found.~nPlease select a Payer location by clicking the amount field.",StopSign!)
	messagebox("Error","El punto de pago no ha sido encontrado, por favor revise el destino y punto de pago.",StopSign!)
	dw_2.setfocus()
	dw_2.setcolumn("mod_pay_currency")
	return
end if	
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Verifica Ciudad y Estado del Beneficiario, si no estan pone las del punto de pago
if isnull(dw_2.getitemstring(dw_2.getrow(),"id_state_receiver")	) or dw_2.getitemstring(dw_2.getrow(),"id_state_receiver")	 = '' or &
   isnull(dw_2.getitemstring(dw_2.getrow(),"id_city_receiver")	) or dw_2.getitemstring(dw_2.getrow(),"id_city_receiver") = '' then

	String ls_id_city, ls_id_state
	
	//DON (03/24/2015) - ADDED NOLOCK.  ********************************
	SELECT id_city, id_state
	 INTO :ls_id_city, :ls_id_state
	 FROM dba.branch		WITH (NOLOCK)
	WHERE dba.branch.id_branch = :ls_branchpay;
	//************************************************************
	
	dw_2.setitem(dw_2.getrow(),"id_state_receiver",ls_id_state)
	dw_2.setitem(dw_2.getrow(),"id_city_receiver",ls_id_city)
end if
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

dw_2.setitem(dw_2.getrow(),"receiver_source","C")

// ---------------------------------------------------------------->	

if ib_fallas then 
	return
end if

if ib_actualizado then 
	return
end if

// <><><><><><><>

// Clear talk limit
if gs_branch_insta = 'A00003' and dw_2.getitemnumber(1,"total_receiver") > fn_busparameter_numeric('CLEARTALK_MAXSEND') then
	Messagebox("Error","La cantidad excede el limite permitido para envios ClearTalk.", Exclamation!)
	dw_2.Setfocus()
	return
end if

// <><><><><><><>


if dw_2.getitemnumber(1,"net_amount_receiver") > id_sup then
	Messagebox("Error","La cantidad excede el limite permitido.", Exclamation!)
	dw_2.Setfocus()
	return
end if

if dw_2.getitemnumber(1,"net_amount_receiver") < id_inf then
	Messagebox("Error","La cantidad es menor al limite permitido.", Exclamation!)
	dw_2.Setfocus()
	return
end if

if dw_2.getitemnumber(1,"net_amount_receiver") > id_limit_id then

	if Isnull(dw_1.getitemstring(1,"Id_type_id_sender")) Then
		Messagebox("Información Incompleta","Debe seleccionar el tipo de identificación.",Exclamation!)
		return
	end if
	if Isnull(dw_1.getitemstring(1,"number_id_sender")) Then
		Messagebox("Información Incompleta","Debe ingresar el número de identificación.",Exclamation!)
		return
	end if

end if

if is_mod_pay = "C" or is_mod_pay = "N" or is_mod_pay = "T" Then
	if Isnull(dw_2.getitemstring(1,"acc_receiver")) or trim(dw_2.getitemstring(1,"acc_receiver")) = '' then
		Messagebox("Información Incompleta","Debe ingresar el número de la cuenta.",Exclamation!)
		return
	end if
end if






// KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK
// 10/12/2012, ID to Mexico!

String ls_pagador

ls_pagador = dw_2.getitemstring(dw_2.getrow(),"branch_pay_receiver")

long ll_count0

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT count(*)
INTO :ll_count0
FROM dba.branch WITH (NOLOCK)
	inner join  dba.group_branch   WITH (NOLOCK) on dba.branch.id_main_branch = group_branch.id_main_branch
WHERE dba.branch.id_branch = :ls_pagador
AND dba.group_branch.name_main_branch like '%BTS%';
//***********************************************************


//===================================================================
//===================================================================
// Verifica el ID Para MEXICO (and BTS)
// 10/08/2012

if (   ((dw_2.getitemstring(dw_2.getrow(),"id_country_receiver") = 'MEX') or (ll_count0 > 0) ) &
	and (dw_2.getitemnumber(1,"net_amount_receiver") > 999.99)) then
	
	if isnull(dw_1.getitemstring(dw_1.getrow(),"id_type_id_sender")) or &
		trim(dw_1.getitemstring(dw_1.getrow(),"id_type_id_sender")) = 'NN' then
		if fn_getlang() = 'EN' then
			messagebox("Missing Information","You must enter the senders ID Type.",StopSign!)
		else
			messagebox("Información Incompleta","Debe ingresar el Tipo de ID del remitente.",StopSign!)
		end if
		dw_1.setfocus()
		dw_1.setcolumn("id_type_id_sender")
		return
	end if

	if isnull(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")) or &
		len(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender"))) < 5 or &
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '00000' or &
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '11111' or &
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '22222' or &
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '33333' or &
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '44444' or &
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '55555' or &
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '66666' or &
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '77777' or &		
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '88888' or &				
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '12345' or &						
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '01234' or &								
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '56789' or &										
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '98765' or &												
		right(trim(dw_1.getitemstring(dw_1.getrow(),"number_id_sender")),5) = '99999'	then
		if fn_getlang() = 'EN' then
			messagebox("Missing Information","You must enter the senders ID Number.",StopSign!)
		else
			messagebox("Información Incompleta","Debe ingresar el Número de ID del remitente.",StopSign!)
		end if
		dw_1.setfocus()
		dw_1.setcolumn("number_id_sender")
		return
	end if

end if
//===================================================================
//===================================================================





// 10/12/2012, ID to Mexico!
// KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK






String ls_branch_state

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT min(id_state)
INTO :ls_branch_state
FROM dba.branch	WITH (NOLOCK)
WHERE dba.branch.id_branch = :gs_branch_insta;
//***********************************************************

String ls_typeidmsg

ls_typeidmsg = '-1'

//	// --------------------------------------------------------->
//	// --------------------------------------------------------->
// // Mensajes de solicitud de documentos de cumplimiento legal

  string ls_name_sender, ls_country, ls_name_recipient
  Date   ld_date_investigation
  double ld_dailyacum, ld_amtinvoice, ld_amount_cargos, ld_acumulado_rec, ld_dailyacum_rec

	SELECT DISTINCT dias_investigacion  
	INTO :ll_dias_investigacion  
	FROM dba.parametros;

  if Isnull(ll_dias_investigacion) or ll_dias_investigacion = 0 then ll_dias_investigacion  = 30

  ll_dias_investigacion = ll_dias_investigacion * -1

  ls_name_sender = dw_1.getitemstring(dw_1.getrow(),'name_sender')
  ls_name_recipient = dw_2.getitemstring(dw_2.getrow(),'name_receiver')
  ld_date_investigation = Relativedate(today(),ll_dias_investigacion)	
				

//	SELECT Sum(dba.receiver.net_amount_receiver + dba.receiver.exchange_receiver + dba.receiver.telex_receiver + dba.receiver.total_modo_pago)
// Correccion para incluir el handling en el chequeo Sum(total_receiver):

	//DON (03/24/2015) - PERFORMANCE TUNING.  **************************************
	SELECT Sum(total_receiver)
	INTO :ld_acumulado
	FROM dba.receiver with(nolock)
	INNER JOIN 	dba.sender with(nolock)
	ON 	dba.sender.id_sender = dba.receiver.id_sender	AND
			dba.sender.id_branch = dba.receiver.id_branch
	WHERE 	dba.sender.id_branch = :gs_branch_insta
				AND dba.sender.name_sender = :ls_name_sender
				AND dba.receiver.date_receiver >= :ld_date_investigation;
	//***********************************************************************
				
	ld_amount = dw_2.getitemnumber(dw_2.getrow(),"net_amount_receiver")
	ld_acumulado = ld_acumulado + ld_amount + dw_2.getitemnumber(1,"telex_receiver") + dw_2.getitemnumber(1,"exchange_receiver")  + dw_2.getitemnumber(1,"total_modo_pago")
	ld_amtinvoice = ld_amount + dw_2.getitemnumber(1,"telex_receiver") + dw_2.getitemnumber(1,"exchange_receiver")  + dw_2.getitemnumber(1,"total_modo_pago")
	ld_amount_cargos = dw_2.getitemnumber(1,"total_receiver")
	ls_country = dw_2.getitemstring(1,"id_country_receiver")

//	// Obtiene el acumulado de 30 dias del beneficiario
	SELECT Sum(total_receiver)  
	  INTO :ld_acumulado_rec
	  FROM dba.receiver with(nolock)
	 WHERE receiver.id_branch = :gs_branch_insta
		AND receiver.name_receiver = :ls_name_recipient
		AND receiver.date_receiver >= :ld_date_investigation;
		
	if isnull(ld_acumulado_rec) then ld_acumulado_rec = 0
	
	ld_acumulado_rec = ld_acumulado_rec + ld_amount + dw_2.getitemnumber(1,"telex_receiver") + dw_2.getitemnumber(1,"exchange_receiver")  + dw_2.getitemnumber(1,"total_modo_pago")	


	// --------------------------------------------------->	
	// --------------------------------------------------->	
	// Modificacion Mensajes de Acumulados!	

	datetime ld_today
	ld_today = datetime(today(),time('00:00:00'))

	//DON (03/24/2015) - PERFORMANCE TUNING.  **************************************
	SELECT Sum(total_receiver)  
	INTO :ld_dailyacum  
	FROM dba.receiver  with(nolock)
	INNER JOIN	dba.sender   with(nolock)
	ON		dba.sender.id_sender = dba.receiver.id_sender AND
			dba.sender.id_branch = dba.receiver.id_branch
	WHERE 	dba.sender.id_branch = :gs_branch_insta
				AND dba.sender.name_sender = :ls_name_sender
				AND dba.receiver.date_receiver > :ld_today;
	//**********************************************************************

	SELECT Sum(total_receiver)
	  INTO :ld_dailyacum_rec
	  FROM dba.receiver with(nolock)
	 WHERE id_branch = :gs_branch_insta
		AND name_receiver = :ls_name_recipient
		AND date_receiver = :ld_today;
	
	if isnull(ld_dailyacum_rec) then ld_dailyacum_rec = 0
	
	ld_dailyacum = ld_dailyacum + dw_2.getitemnumber(dw_2.getrow(),"total_receiver")
	ld_dailyacum_rec = ld_dailyacum_rec + dw_2.getitemnumber(dw_2.getrow(),"total_receiver")
		
	// Mensaje 4, monto supera los 8000
	if (ld_amtinvoice > 8000) then
		Openwithparm(w_custom_msg,"4")
		if gs_branch_insta <> 'A00898' then return
	end if

	// Mensaje 5, acumulado en 30 dias supera los 8000
	if (ld_acumulado > 8000) then
		Openwithparm(w_custom_msg,"5")
		if gs_branch_insta <> 'A00898' then return
	end if

//	// Mensaje 6, acumulado del benef en 30 dias supera los 8000
	if (ld_acumulado_rec > 8000) then
		Openwithparm(w_custom_msg,"6")
		if gs_branch_insta <> 'A00898' then return
	end if

//=============================================================================
//Don (12-10-2013) - To add new rule for invoices to Honduras.
IF dw_2.getitemstring(dw_2.getrow(),"id_country_receiver") = 'HON'		THEN
	IF ld_amount_cargos > 2000.00	THEN
		lb_needs_kyc = true
		ls_typeidmsg = '1'
	END IF
END IF
//=============================================================================


	// Mensaje 2, acumulado diario de 3000 a 8000
	if (ld_dailyacum > 2999.99 and ld_dailyacum < 8000.01) or (ld_amount_cargos > 2999.99 and ld_amount_cargos < 8000.01) then
			Openwithparm(w_custom_msg,"2")
			lb_needs_kyc = true
			// Permite continuar		
			//OpenWithParm(w_pfc_sender_compliancedata,dw_1.getitemstring(1,"id_branch")+'*'+string(dw_1.getitemnumber(1,"id_sender"))+'*1')
			ls_typeidmsg = '1'
	else
		// Mensaje 8, acumulado diario BENEFICIARIO de 3000 a 8000
		if (ld_dailyacum_rec > 2999.99 and ld_dailyacum_rec < 8000.01) then
			Openwithparm(w_custom_msg,"8")
			lb_needs_kyc = true
			ls_typeidmsg = '1'
			// Permite continuar
		else		
			// Mensaje 9, acumulado mensual de 4500 a 8000
			if (ld_acumulado > 4499.99 and ld_acumulado < 8000.01) then
				Openwithparm(w_custom_msg,"9")
				lb_needs_kyc = true
				ls_typeidmsg = '1'
				// Permite continuar		
			else
				// Mensaje 7, acumulado BENEFICIARIO mensual de 4500 a 8000
				if (ld_acumulado_rec > 4499.99 and ld_acumulado_rec < 8000.01) then
					Openwithparm(w_custom_msg,"7")
					lb_needs_kyc = true
					ls_typeidmsg = '1'
					// Permite continuar		
	
				else
					// Mensaje 3, acumulado de 30 dias entre 3000 y 4500
					if (ld_acumulado > 2999.99 and ld_acumulado < 4500.01) then
						Openwithparm(w_custom_msg,"3")
						//lb_needs_kyc = true
				
						// 05/23/2012 - Changed to 1 because it requires KYC, so the data should be completed!
						ls_typeidmsg = '0'					
						//ls_typeidmsg = '1'
						// Permite continuar
			
					else										
						// Mensaje 10, acumulado de 30 dias entre 3000 y 4500
						if (ld_acumulado_rec > 2999.99 and ld_acumulado_rec < 4500.01) then
								Openwithparm(w_custom_msg,"10")
								ls_typeidmsg = '0'
								// Permite continuar
		
								// Mensaje 11, orden entre 1000 y 3000 (Oklahoma)
								if (ld_amtinvoice > 999.99 and ld_amtinvoice < 3000.01) and (ls_branch_state = 'OK' or ls_branch_state = 'AZ' or ls_branch_state = 'NM') then						
									Openwithparm(w_custom_msg,"11")
									lb_needs_kyc = true
									// 05/23/2012 - Changed to 1 because it requires KYC, so the data should be completed!
									//ls_typeidmsg = '0'					
									ls_typeidmsg = '1'
									// Permite continuar
								end if	
								
						   else
								IF ld_dailyacum_rec >= 1000.00 AND (ls_branch_state= 'OK' or ls_branch_state = 'AZ'  or ls_branch_state = 'NM')		THEN
									Openwithparm(w_custom_msg,"8")
									lb_needs_kyc = true
									ls_typeidmsg = '1'
								END IF
								
								// Mensaje 2, acumulado diario de 1000 a 3000 para Colombia y Rep. Dominicana
								if ((ld_dailyacum > 999.99 and ld_dailyacum < 3000.01) or (ld_amount_cargos > 999.99 and ld_amount_cargos < 3000.01)) and (ls_country = 'COL' or ls_country = 'RD' or ls_country = 'COG')then
									Openwithparm(w_custom_msg,"1")
									// Permite continuar
									
									//OpenWithParm(w_pfc_sender_compliancedata,dw_1.getitemstring(1,"id_branch")+'*'+string(dw_1.getitemnumber(1,"id_sender"))+'*0')
									ls_typeidmsg = '0'
								end if
							end if
//						end if
					end if
				end if
			end if
		end if
	end if

	// --------------------------------------------------->	
	// --------------------------------------------------->	





//***********************************************************

// ****************************************************
// Verificacion de Limites por Pagador 
// 05/02/2006
// 04/23/2008 : Agrego Limite por Estado de Origen
// 03/23/2010 : Se agrego el limite por Punto de Pago
String	ls_mod_pay_currency, ls_paymode

ld_total_pay_receiver = dw_2.getitemnumber(dw_2.getrow(),"total_pay_receiver")
ls_mod_pay_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")
ls_paymode = dw_2.getitemstring(dw_2.getrow(),"receiver_mode_pay_receiver")

if not fn_validapayerlimit(ld_amount,ld_amtinvoice,ld_total_pay_receiver,trim(ls_mod_pay_currency),trim(ls_grupo_pagador),trim(ls_country),trim(ls_paymode),ls_branch_state) then
	return
end if

if not fn_validapoplimit(ld_total_pay_receiver,trim(ls_mod_pay_currency),trim(ls_branch_pag)) then
	return
end if
// ****************************************************


// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// Verifica el credito disponible!
ld_total_final = 0

ld_total_final =  dw_2.getitemnumber(dw_2.getrow(),"net_amount_receiver")  + &
						dw_2.getitemnumber(dw_2.getrow(),"exchange_company")     + &
						dw_2.getitemnumber(dw_2.getrow(),"telex_company")        + &
						dw_2.getitemnumber(dw_2.getrow(),"total_modo_pago_comp") 

if id_availablebalance - ld_total_final < 0 then
	messagebox("No Credito","Este envio sobrepasa el credito disponible, debe verificar con el departamento de contabilidad",StopSign!)
	Return
end if
// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&




//if messagebox("Atencion","Esta seguro que sus datos estan bien, despues de grabar no podra modificar la Informacion",Question!,YesNo!) <> 1 Then
string ls_msg

if ls_typeidmsg = '-1' then
	ls_msg = "Esta seguro que la información es correcta?"
else
	ls_msg = "Esta seguro que la información es correcta y el cliente tiene los IDs requeridos para el envio?"
end if

if messagebox("Confirmacion",ls_msg,Question!,YesNo!) <> 1 Then
	return
end if   

ld_sender = dw_1.getitemnumber(1,"id_sender")
dw_2.setitem(1,"id_branch",gs_branch_insta)

if Isnull(ld_sender) or (ld_sender = 0)then
	ld_sender   = fn_consecutivo_sender(gs_branch_insta)
end if

ld_receiver = fn_consecutivo_receiver(gs_branch_insta)

dw_1.setitem(1,"id_sender",ld_sender)
dw_2.setitem(1,"id_receiver",ld_receiver)
dw_2.setitem(1,"id_sender",ld_sender)
/////////dw_1.setitem(1,"add_bitmap_sender",'C:\VIAMERICASMT\DOCUMENT\ID'+gs_branch_insta+'-'+string(ld_sender)+'.BMP')

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Determina el id_receiver_unique	

double ld_id_receiver_unique
ld_id_receiver_unique = dw_2.getitemnumber(dw_2.getrow(),"receiver_id_receiver_unique")

// Si no le asigno id_receiver_unique es un nuevo destinatario
if (isnull(ld_id_receiver_unique)) or (ld_id_receiver_unique < 0) then
	dw_2.setitem(1,"receiver_id_receiver_unique",ld_receiver)
else
	// Si le asigno id_receiver_unique verifica que no haya cambiado el nombre
	string ls_db_name, ls_new_name
	
	ls_new_name = dw_2.getitemstring(dw_2.getrow(),"name_receiver")
	
	//DON (03/24/2015) - PERFORMANCE TUNING.  **************************************
	select name_receiver
	into :ls_db_name
	from dba.receiver	WITH (NOLOCK)
	where id_receiver = :ld_id_receiver_unique
	and id_branch = :gs_branch_insta;
	//***********************************************************************
			
	if (trim(ls_db_name) <> trim(ls_new_name)) then
		// Si cambio el nombre entonces es una persona diferente	
		dw_2.setitem(1,"receiver_id_receiver_unique",ld_receiver)
	end if
end if
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Asignacion del Pin Number y el Toll Free		
// Asigna el pin dependiendo del Pais/Pagador
string pinnumber, tollfree 

ls_country1 = TRIM(dw_2.getitemstring(1,"id_country_receiver"))

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT dba.branch.id_main_branch
INTO :ls_grupo_receptor
FROM  dba.branch  WITH (NOLOCK)
WHERE dba.branch.id_branch = :ls_branch;
//***********************************************************

if fn_asignpinnumber(ls_country1,ls_grupo_receptor,gs_branch_insta,pinnumber,tollfree) then
	dw_2.setitem(1,"receiver_toll_free",tollfree)
	dw_2.setitem(1,"receiver_pin_number",pinnumber)			
end if
		
dw_1.accepttext()
dw_2.accepttext()
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>			

///////////////////////////////////////////////////////////////////////////////////////////////////
		


dw_1.accepttext()
dw_2.accepttext()


// ++++++++
// Stats Start
String ls_details
id_datestart = DateTime(Today(),Now())
ls_details = '(UE_UPDATE)'
// ++++++++



if dw_1.UPDATE()  = 1 then

	if dw_2.UPDATE()  = 1 then



		ls_branch   = gs_branch_insta
		ld_sender   = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
		ld_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
		
				
		// ++++++++
		// Stats End
		id_dateend = DateTime(Today(),Now())
		
		// Starts Collect
		DECLARE spAddStatisticsDetails PROCEDURE FOR dba.spAddStatisticsDetails
		 @ID_APPLICATION = 1
		,@ID_STAT_TYPE = 3
		,@START_STAT = :id_datestart
		,@END_STAT = :id_dateend
		,@ID_BRANCH = :ls_branch
		,@ID_SENDER = :ld_sender
		,@ID_RECEIVER = :ld_receiver
		,@DETAILS = :ls_details; 
		
		EXECUTE spAddStatisticsDetails;
		// ++++++++



		dw_1.enabled = False
		dw_2.enabled = False

		commit ;

		// ************************************************
		// Pide los datos adicionales de cumplimiento legal
		if ls_typeidmsg <> '-1' then

			OpenWithParm(w_pfc_sender_compliancedata,dw_1.getitemstring(dw_1.getrow(),"id_branch")+'*'+string(dw_1.getitemnumber(dw_1.getrow(),"id_sender"))+'*'+string(dw_2.getitemnumber(dw_2.getrow(),"id_receiver"))+"*"+ls_typeidmsg+"*Y")
			dw_1.UPDATE()			
						
		end if
		// ************************************************		
		
		ls_branch   = gs_branch_insta
		ld_sender   = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
		ld_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")

		long ll_count
		
		SELECT count(*)
		INTO :ll_count
		FROM dba.POSTERMINAL_BRANCH p, dba.TIPO_TRANSMISION_AGENCIA t
		WHERE p.ID_BRANCH = t.ID_BRANCH
		AND TIPO_TRANSMISION = 'P'
		AND t.ID_BRANCH = :ls_branch;

		// En HOLD por POS Terminal
		if ll_count > 0 then
			ls_motivo_hold = '71'
		else
			ls_motivo_hold = '70'
		end if
		
		ls_flag = 'H'

		//DON (03/24/2015) - ADDED STORED PROCEDURE.  ***************************************
//		INSERT INTO dba.motivo_hold (id_sender,id_branch,id_receiver,date_motivo_hold,time_motivo_hold,type_motivo_hold,desc_motivo_hold)
//		VALUES (:ld_sender,:ls_branch,:ld_receiver,getdate(),getdate(),:ls_motivo_hold,'');
		
		DECLARE SP_ADD_MOTIVO_HOLD PROCEDURE FOR dba.spAddMotivoHold
				@errCode 	=	0,
				@errText 	=	'',
				@idSender 	=	:ld_sender,
				@idBranch 	=	:ls_branch,
				@idReceiver =	:ld_receiver,
				@motivoHoldCode =	:ls_motivo_hold,
				@motivoReason =	'';
 
 		EXECUTE SP_ADD_MOTIVO_HOLD;
		 //******************************************************************************
		 
		COMMIT;

	else
		rollback ;
		Messagebox("Error","Check the data, empty columns or wrong typing in the Receiver.", StopSign!)
		dw_1.setitem(1,"id_sender",ld_sender)
		dw_2.setitem(1,"id_receiver",0)
		dw_2.setitem(1,"id_sender",ld_sender)
		dw_1.Settaborder(3,0)
		
		dw_1.Settaborder(17,2)
		dw_1.Settaborder(18,4)
		dw_1.Settaborder(19,6)
		dw_1.Settaborder(20,8)		
		
		dw_1.Settaborder(4,20)
		dw_1.Settaborder(7,30)
		dw_1.Settaborder(5,40)
		dw_1.Settaborder(6,50)
		dw_1.Settaborder(11,60)
		dw_1.Settaborder(12,70)
		return
	end if
else
	rollback;
//	Messagebox("Error","Verifique los Datos, Campos Vacios o mal Digitados en el Sender.")
	Messagebox("Error","Check the data, empty columns or bad typing in the Receiver.", StopSign!)
	dw_1.setitem(1,"id_sender",ld_sender)
	dw_2.setitem(1,"id_receiver",0)
	dw_2.setitem(1,"id_sender",ld_sender)
	return
end if
	
ib_actualizado = True
is_estado =  'I'
	
INSERT INTO dba.history_invoice (id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change)
	  VALUES (:gs_branch_insta,:ld_receiver,'I','I',:gs_cashier,getdate(),getdate());
		
// Todas las de Telefono Rojo entran en HOLD
INSERT INTO dba.history_invoice (id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change) 
	  VALUES ( :gs_branch_insta,:ld_receiver,'I','H',:gs_cashier,getdate(),getdate() )  ;			 

string ls_fax
ls_fax = fn_getbranchfax(gs_branch_insta)

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Asigna la clave
string ls_clave, ls_pre

// 01/07/2007 : Se pone a asignar en el central las claves de la central para 
// acabar con los problemas de folios cuando se cambian agencias entre
// pc y tel rojo.	


//DON (03/24/2015) - PERFORMANCE TUNING.  **************************************
select GRO_COMPANYIDFOLIO 
into :ls_pre
from dba.group_branch  WITH (NOLOCK)
where id_main_branch = :ls_grupo_pagador;
//***********************************************************************

if isnull(ls_pre) then ls_pre = ''

ls_pre = trim(ls_pre)

//if ls_grupo_pagador = 'T057' or ls_grupo_pagador = 'T082' or ls_grupo_pagador = 'T049' then
//if ls_pre = 'PRE-ASSIGN' then
//
//	// Si el pagador pertenece a la RED BTS pero no es HSBC, le va a poner clave del pagador T057
//	long ll_count_bts_network
//
//	ll_count_bts_network = 0
//
//	SELECT count(*)
//	INTO :ll_count_bts_network
//	FROM DBA.BTS_NETWORK 
//	WHERE ID_MAIN_BRANCH = :ls_grupo_pagador
//	AND ID_MAIN_BRANCH <> 'U003';
//
//	// Las preassign de BTS se graban todas a 'T057'
//	if ll_count_bts_network > 0 then
//		ls_clave = fn_getfolio('A00001',ld_receiver,'T057')
//	else
//		ls_clave = fn_getfolio('A00001',ld_receiver,ls_grupo_pagador)
//	end if	
//		
//else
//	ls_clave = fn_getfolio(gs_branch_insta,ld_receiver,ls_grupo_pagador)
//end if


DECLARE spGetViaOneFolio PROCEDURE FOR dba.spGetViaOneFolio @pID_branch_Pay = :ls_branch_pag, @Clave = :ls_clave OUT;

EXECUTE spGetViaOneFolio;
IF sqlca.sqlcode = 0 THEN
	FETCH spGetViaOneFolio INTO :ls_clave;
END IF
CLOSE spGetViaOneFolio;


dw_2.update()

dw_2.setitem(1,"clave_receiver",'*****')	


ls_id_branch = dw_2.GetItemString(1,'id_branch') //dw_recibo.GetItemString(1,'receiver_id_branch')
ld_id_receiver = dw_2.GetItemDecimal(1,'id_receiver') //dw_recibo.GetItemDecimal(1,'receiver_id_receiver')

UPDATE 	DBA.RECEIVER
SET		clave_receiver = :ls_clave
WHERE	ID_BRANCH = :ls_id_branch AND
			ID_RECEIVER = :ld_id_receiver;



// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// Esto deberia funcionar en el trigger de update / pero esta por identificar porque no ocurre:


//02/25/2021  JAARBELAEZ Petición Esteban
// SI EL FOLIO ES 4072 MANDA LA ORDEN PARA BTS-HSBC
//if left(ls_clave,4) = '4072' and ls_grupo_pagador = 'T049' then
//	UPDATE DBA.RECEIVER 
//	SET id_main_branch_sent = 'U003'
//	WHERE id_branch = :gs_branch_insta 
//	AND ID_RECEIVER = :ld_receiver;
//end if
//
//if ls_grupo_pagador = 'T076' then
//	UPDATE DBA.RECEIVER 
//	SET id_main_branch_sent = 'T022'
//	WHERE id_branch = :gs_branch_insta 
//	AND ID_RECEIVER = :ld_receiver;
//end if
//
//if left(ls_clave,3) = 'VIA' and ls_grupo_pagador = 'T055' then
//	UPDATE DBA.RECEIVER 
//	SET id_main_branch_sent = 'T109'
//	WHERE id_branch = :gs_branch_insta 
//	AND ID_RECEIVER = :ld_receiver;
//end if
//
//if left(ls_clave,2) = '24' and ls_grupo_pagador = 'T109' and len(trim(ls_clave)) = 12 then
//	UPDATE DBA.RECEIVER 
//	SET id_main_branch_sent = 'T170'
//	WHERE id_branch = :gs_branch_insta 
//	AND ID_RECEIVER = :ld_receiver;
//end if



// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



//ls_receiptto = dw_1.getitemnumber(dw_1.getrow(),"receiptto")	
//ls_email_sender = dw_1.getitemstring(dw_1.getrow(),"email_sender")	
//
//if isnull(ls_receiptto) then ls_receiptto = 0
//if isnull(ls_email_sender) then ls_email_sender = ''
//
//// 1 = EMail, 3 = EMail + Home
//if trim(ls_email_sender) <> '' or (ls_receiptto = 1 or ls_receiptto = 3) then
//
//	if not fn_valemailaddress(ls_email_sender) then

Boolean lb_receipttoEMail
String ls_message, ls_emailcontingencia

fn_envio_alertas()

ls_emailcontingencia = ''

// Detects if the agency has a fax contingency an is getting the receipts by email!
SELECT isnull(CONTINGENCY_EMAIL,'')
INTO :ls_emailcontingencia
FROM dba.TIPO_TRANSMISION_AGENCIA with(nolock)
WHERE ID_BRANCH = :gs_branch_insta;


if gs_branch_insta = 'A00003' or gs_branch_insta = 'A00788' or trim(ls_emailcontingencia) <> '' then
	
	if ls_receiptto = 1 or ls_receiptto = 3 or trim(ls_emailcontingencia) <> '' then
		lb_receipttoEMail = true
	end if
	
end if


if lb_receipttoEMail then
	if trim(ls_emailcontingencia) <> '' then
		ls_email_sender = ls_emailcontingencia
		ls_message = "El envio ha sido grabado con exito!~r~n~nDesea enviar el recibo al correo de contingencia de la agencia ("+ls_email_sender+")?"
	else
		ls_message = "El envio ha sido grabado con exito!~r~n~nDesea enviar al correo electrónico del cliente ("+ls_email_sender+")?"
	end if
else
	ls_message = "El envio ha sido grabado con exito!~r~n~nDesea enviar el recibo al fax de la agencia ("+ls_fax+")?"
end if


		//[CLONDONO] [2013-09-11] Calls the stored procedure that calculates the estimated payment date and displays the resulting date in the receipt
				ls_id_main_branch = dw_2.GetItemString(1,'branch_id_main_branch') //dw_recibo.GetItemString(1,'branch_id_main_branch')
				ls_country_receiver = dw_2.GetItemString(1,'id_country_receiver') //dw_recibo.GetItemString(1,'receiver_id_country_receiver')
				ldt_date_receiver = Date(dw_2.GetItemDateTime(1,'date_receiver')) //Date(dw_recibo.GetItemDateTime(1,'receiver_date_receiver'))
				lt_time_receiver = Time( dw_2.GetItemDateTime(1,'time_receiver')) //Time( dw_recibo.GetItemDateTime(1,'receiver_time_receiver'))
				ll_iteration = 1
			//	ls_datetime = fn_get_payment_date_time(ls_id_main_branch,ls_country_receiver,ldt_date_receiver,lt_time_receiver,1)
				DECLARE sp_get_date_time PROCEDURE FOR dba.spGetPaymentDateTime
					@AS_ID_MAIN_BRANCH = :ls_id_main_branch, 
					@AS_ID_COUNTRY = :ls_country_receiver, 
					@ADT_TRANSACTION_DATE = :ldt_date_receiver,
					@AT_TRANSACTION_TIME = :lt_time_receiver, 
					@AN_ITERATION_NUMBER = :ll_iteration, 
					@AS_PAYMENT_DATETIME = :ls_datetime OUT;

				EXECUTE sp_get_date_time;
				IF sqlca.sqlcode = 0 THEN
					FETCH sp_get_date_time INTO :ls_datetime;
				END IF
				CLOSE sp_get_date_time;
				//[CLONDONO][2013-09-21] Updates the table dba.receiver with the destination country tax and the date the remittance will be available for payment
			//	ld_dest_country_tax = dw_recibo.GetItemDecimal(1,'tax_percentage')

				ls_id_branch = dw_2.GetItemString(1,'id_branch') //dw_recibo.GetItemString(1,'receiver_id_branch')
				ld_id_receiver = dw_2.GetItemDecimal(1,'id_receiver') //dw_recibo.GetItemDecimal(1,'receiver_id_receiver')
				
				//csarmiento, 11/05/2014
				//modify to show fixed fee for countries.
				//issue haiti
				
				
//				SELECT CASE WHEN DBA.RECEIVER.TOTAL_PAY_RECEIVER >= CT.AMOUNT_TAX_EXEMPTED THEN
//								CT.TAX_PERCENTAGE * (DBA.RECEIVER.TOTAL_PAY_RECEIVER - CT.AMOUNT_TAX_EXEMPTED)
//							ELSE
//								0
//							END TAX_PERCENTAGE
//				INTO 		:ld_dest_country_tax
//				FROM 	DBA.RECEIVER   LEFT JOIN
//							DBA.VCA_DEST_COUNTRY_TAX CT ON  (CT.ID_COUNTRY = RECEIVER.ID_COUNTRY_RECEIVER) AND
//																				(CT.ID_CURRENCY = RECEIVER.ID_CURRENY) AND
//																				(CT.ID_MODO_PAGO = RECEIVER.MODE_PAY_RECEIVER) 
//				WHERE	( DBA.RECEIVER.ID_BRANCH = :ls_id_branch )
//							AND ( DBA.RECEIVER.ID_RECEIVER =:ld_id_receiver);
						
			//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
			SELECT	CASE WHEN DBA.RECEIVER.TOTAL_PAY_RECEIVER >= CT.AMOUNT_TAX_EXEMPTED THEN
							(CT.TAX_PERCENTAGE * (DBA.RECEIVER.TOTAL_PAY_RECEIVER - CT.AMOUNT_TAX_EXEMPTED) ) + CT.Fixed_tax
						ELSE
							0
						END TAX_PERCENTAGE
			INTO 		:ld_dest_country_tax
			FROM 	DBA.RECEIVER  WITH (NOLOCK) 
			INNER JOIN	DBA.VCA_DEST_COUNTRY_TAX CT 
			ON  	(CT.ID_COUNTRY = RECEIVER.ID_COUNTRY_RECEIVER) AND
					(isnull(CT.ID_CURRENCY,RECEIVER.ID_CURRENY) = RECEIVER.ID_CURRENY) AND
					(isnull(CT.ID_MODO_PAGO,RECEIVER.MODE_PAY_RECEIVER) = RECEIVER.MODE_PAY_RECEIVER) 
			WHERE	( DBA.RECEIVER.ID_BRANCH = :ls_id_branch )
							AND ( DBA.RECEIVER.ID_RECEIVER =:ld_id_receiver);
			
				UPDATE 	DBA.RECEIVER
				SET		RECEIVER_DATE_AVAILABLE = :ls_datetime,
							DEST_COUNTRY_TAX = :ld_dest_country_tax
				WHERE	ID_BRANCH = :ls_id_branch AND
							ID_RECEIVER = :ld_id_receiver;
				//csarmiento, 11/05/2014
				
			//[CLONDONO] [2013-09-11] ********************************************************************/
			

string ls_faxparms
		
//if ib_isPOSTerminal then
if ii_sends_receipt = 0 then	
	Messagebox("Envio Grabado","El envio ha sido grabado y esta disponible en el sistema " + is_name_tipo + " de la agencia.")	
else

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		

	If Messagebox("Envio Grabado",ls_message,Question!,YesNo!) = 1 Then
	
		ls_dot_pri=ProfileString("c:\VIAMERICASMT\Envio.ini","Printer Setup","Dot Matrix","None")
		
		//	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		//	// Imprime en el Fax de la Agencia Escogiendo Printer
		//	dw_recibo.retrieve(gs_branch_insta,ld_receiver)
		//	dw_recibo.Object.DataWindow.Print.DocumentName	 = "@F201 . @ @F211 "+ls_fax+" @ @F301 VERY URGENT"
		//	printsetup()
		//	dw_recibo.print()	
		//	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
		
		// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		// Imprime en el Fax de la Agencia Escoge la printer automaticamente

		
		//ls_currentprinter = fn_printer('ActiveFax')		
		
		if ls_branch_state = 'CA' then
			dw_recibo.DataObject = 'dw_recibo_activefax_ca_new'
			if ls_grupo_pagador = 'T247' then dw_recibo.DataObject = "dw_recibo_activefax_ca_new_pin4"
		else
			dw_recibo.DataObject = 'dw_recibo_activefax_new'	
			if ls_grupo_pagador = 'T247' then dw_recibo.DataObject = 'dw_recibo_activefax_new_pin4'	
		end if
		
		dw_recibo.settransobject(SQLCA)
			
		/************************************
		** csarmiento, 6/3/2014
		** change made for new fax service
		*************************************/
		// When faxing thru OpenText
		if fn_busparameter("FAXMODE")="OT" then
			
			//st_printer.text = 'ViaFax'
			
			String ls_AutoFaxPath
			String ls_emailfilename
				
			ls_AutoFaxPath = fn_busparameter("FAXOPENTEXTPATH")		
			
			dw_recibo.retrieve(gs_branch_insta,ld_receiver,'')
						
			// Uses GhostScript			
			//// Saves the DW as PDF on the output fax/email folder
			//dw_recibo.Object.DataWindow.Export.PDF.Method = Distill! 
			//dw_recibo.Object.DataWindow.Printer = "Sybase DataWindow PS"
			//dw_recibo.Object.DataWindow.Export.PDF.Distill.CustomPostScript="1"
			//ls_emailfilename = ls_AutoFaxPath+"Viamericas Receipt "+trim(gs_branch_insta)+"-"+string(ld_receiver)+'.PDF'									
			//dw_recibo.SaveAs(ls_emailfilename, PDF!, TRUE)	
			
			// Uses the PDF Printer (ePrintDoc)
			String ls_currentprinter

			ls_emailfilename =  "FAX_RCPT_"+trim(gs_branch_insta)+"-"+string(ld_receiver)			
			dw_recibo.Object.DataWindow.Print.DocumentName = ls_emailfilename
			dw_recibo.Object.DataWindow.Printer = "ViaFax"
			ls_currentprinter = fn_printer('ViaFax')	
			PrintSetPrinter ("ViaFax")
			dw_recibo.print(false,false)			
			ls_emailfilename = ls_AutoFaxPath+ls_emailfilename+'.pdf'											
			
			// Writes the control file on the outpout fax/email folder
			if lb_receipttoEMail then	
				ls_fax=""
			else
				ls_email_sender =""
				ls_fax = fn_getbranchfax(trim(gs_branch_insta))
			end if
			
			fn_controlfile2(ls_emailfilename,"RED PHONE RCPT: "+trim(gs_branch_insta)+"-"+string(ld_receiver)+"",fn_replace(ls_email_sender,'@','\@'),ls_fax) 
			
		/************************************
		** END csarmiento, 6/3/2014
		** change made for new fax service
		*************************************/
		else
			
		//	st_printer.text = 'ActiveFax'
			
			// When faxing thru ActiveFax (default)
			if lb_receipttoEMail then			
				ls_faxparms = "@F212 "+fn_replace(ls_email_sender,'@','\@')+"@@F301 1@@F307 Viamericas Receipt ("+trim(gs_branch_insta)+"-"+string(ld_receiver)+")@"	
			else
				// Se cambio para obtener la version de metrofax en agencias con problemas de salida!
				//ls_faxparms = "@F211 "+ls_fax+"@@F301 1@@F313 2@F307 TEL.ROJO INVOICE: "+trim(gs_branch_insta)+"-"+string(ld_receiver)+"@"				
				ls_faxparms = fn_getbranchfaxcommand(trim(gs_branch_insta),"TEL.ROJO INVOICE: "+trim(gs_branch_insta)+"-"+string(ld_receiver)+"@F311 VC@F308 "+gs_cashier)									
				//messagebox("",ls_faxparms)			
			end if
			dw_recibo.retrieve(gs_branch_insta,ld_receiver,ls_faxparms)
			PrintSetPrinter ("ActiveFax")


			if Printsetup() = 1 then dw_recibo.print(false,false)
		
			//ls_currentprinter = fn_printer(ls_currentprinter)
			// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++			
		
		end if
	else
		commit ;
	end if	

end if

ld_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")


//	// Inserta un motivo de HOLD Temporal que se borra una vez el chequeo de HOLD ha completado.
//	// Aparentemente estaban cerrando el programa cuando la pantalla se demoraba en hacer la
//	// verificacion de HOLD.	
//	INSERT INTO dba.motivo_hold (id_sender,id_branch,id_receiver,date_motivo_hold,time_motivo_hold,type_motivo_hold,desc_motivo_hold)
//	VALUES (:ld_sender,:ls_branch,:ld_receiver,getdate(),getdate(),'26','HOLD TEMPORAL');
//
//	//+++++++++++++++++++++++++++++++++++++++++++
//	// Chequeo en la base de datos, lento.
//	fn_chkcompliance(gs_branch_insta,ld_receiver)
//	//+++++++++++++++++++++++++++++++++++++++++++
//
//	// Ya termino el chequeo, borra el HOLD temporal
//	DELETE FROM dba.motivo_hold 
//	WHERE id_sender = :ld_sender
//	AND id_branch = :ls_branch
//	AND id_receiver = :ld_receiver
//	AND type_motivo_hold = '26'
//	AND desc_motivo_hold = 'HOLD TEMPORAL';
	
	
// Cambio a chequeo en la aplicacion:
boolean lb_inhold
lb_inhold = fn_chkcompliancev2(ls_branch,ld_receiver,'N')

commit ;


TRY

	wf_sendcompasscompliance(ls_branch,ld_receiver)
	
CATCH (exception error)
	MessageBox('Warning',error.GetMessage() )
END TRY


//OpenWithParm(w_pfc_sender_motivoshold,ls_branch+'*'+string(ld_receiver))

if lb_needs_kyc then Openwithparm(w_kyc,ls_branch+"*"+string(ld_receiver)+"*"+ls_faxparms)


// Akos (ClearTalk) funding confirmation!
if ls_branch = 'A00003' then
	OpenWithParm(w_valakosfunding,ls_branch+'*'+string(ld_receiver))
end if

	
SetPointer(Arrow!)

end event

event ue_documento;//long ll_cont = 0
//
//gs_branch_insta = is_branch_insta
//
//  SELECT Count(*)  
//    INTO :ll_cont  
//    FROM dba.sender  
//   WHERE ( dba.sender.id_sender = :gl_sender ) AND  
//         ( dba.sender.id_branch = :gs_branch_insta )   ;
//
//
//if ll_cont = 0 then
//	return
//else
//	Open(w_documento_sender)
//end if

//////// Revisar porque el gl_sender ya no es id_sender sino id_sender_global

messagebox("","Esta opcion esta en revision")
end event

event ue_calcular;Long		ll_contagent_group

Double	ld_porcentaje, 					&
			ld_comision, 					&
			ld_feet,							&	
			ld_feet_comp, 					&
			ld_total_receiver, 				&
			ld_total_pay_receiver

Double	ld_rate,							&
			ld_amount,						&
			ld_handling,						&
			ld_porcentaje_comp,			&
			ld_comision_comp,			&
			ld_porc_modo_pago,   		&
			ld_telex_modo_pago=0,		&
			ld_vlr_modo_pago=0, 		&
			ld_limite_grupo = 0, 			&
			ld_vlr_modo_pago_comp=0,		&
			ld_porc_modo_pago_comp =0, 	&
			ld_telex_modo_pago_comp=0, 	&
			ld_porcentaje_comp_city = 0, 		&
			ld_feet_comp_city= 0, 		&
			ld_porcentaje_city= 0, 		&
			ld_feet_city= 0, 				&
			ld_comision_city= 0, 			&
			ld_comision_comp_city = 0
		
Boolean	lb_comision_delivery = False			
						
Long	   ll_row, ll_cont, ll_cont_cubrimiento,  ll_cont_delivery

String		ls_pagador, 					&
			ls_grupo,						&
			ls_propia,					&
			ls_use_cubrimiento,		&
			ls_country_source,			&
			ls_state_source ,			&
			ls_modo_pago1, 			&
			ls_standar_exclusion


// Actualiza el limite de credito de la agencia
fn_update_balance()	

ll_row = dw_2.getrow()

dw_2.accepttext()
dw_1.setfocus()

gs_branch_insta = is_branch_insta

id_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
is_city = dw_2.getitemstring(dw_2.getrow(),"id_city_receiver")
ls_pagador = dw_2.getitemstring(ll_row,"branch_pay_receiver")
is_mod_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")
ls_country_source = dw_1.getitemstring(dw_1.getrow(),"id_country")
ls_state_source = dw_1.getitemstring(dw_1.getrow(),"id_state")

// -------------------------------------------------------------------------------------------
// Selecciona como estado origen el estado de la agencia y no el del cliente
//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
select id_state
into :ls_state_source
from dba.branch WITH (NOLOCK)
where id_branch = :gs_branch_insta;
//***********************************************************************

if isnull(ls_state_source) then ls_state_source = dw_1.getitemstring(dw_1.getrow(),"id_state")
// -------------------------------------------------------------------------------------------

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Verifica que el pagador de la orden anterior aun es valido
// Si no es Valido blanquea los campos
boolean lb_result
lb_result = this.fn_valida_pagador(false)

if not lb_result then
	dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",'')
	dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",'')
	dw_2.setitem(dw_2.getrow(),"branch_name",'')
	ib_haspayor = false
	ib_fallas = True
	return 0		
end if	
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	

// Validates Citi and Country
//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
SELECT dba.city.id_state,dba.city.id_country,dba.city.long_phone_city 
INTO :is_state,:is_country,:il_long_phone
FROM dba.city  WITH (NOLOCK)
WHERE dba.city.id_city = :is_city   ;
//***********************************************************************

dw_2.setitem(ll_row,"id_state_receiver",is_state)
dw_2.setitem(ll_row,"id_country_receiver",is_country)
gs_country_receiver = is_country
		

// Validates payer coverage in the city
//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
SELECT dba.modo_pago.use_cubrimiento  
INTO :ls_use_cubrimiento  
FROM dba.modo_pago  WITH (NOLOCK)
WHERE dba.modo_pago.id_modo_pago = :gs_mod_pay   ;
//***********************************************************************

if ls_use_cubrimiento = 'S' then
	//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
	SELECT Count(*)  
	INTO :ll_cont_cubrimiento  
	FROM dba.cubrimiento_branch  WITH (NOLOCK)
	WHERE (dba.cubrimiento_branch.id_city = :is_city)  
	AND (dba.cubrimiento_branch.id_branch = :ls_pagador) ;
	//***********************************************************************
			
	if ll_cont_cubrimiento  <= 0 then		
		Messagebox("Error","No Relation Between City and Coverage City.",Exclamation!)
		ib_fallas = True
		return 0
	end if
end if	
	


// ::::::::::::::::::::::::::::::::::::::::::::::::::::
// Tasa de Cambio
//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
SELECT dba.branch.id_main_branch
INTO :ls_grupo  
FROM dba.branch  WITH (NOLOCK)
WHERE dba.branch.id_branch = :ls_pagador;
//**********************************************************************


// Get Agency Rate

ld_rate = 0

SELECT dba.rate_group_agent.rate,
dba.rate_group_agent.id_curreny,
dba.rate_group_agent.limit_send_rate,
dba.rate_group_agent.limit_inf_rate,
dba.rate_group_agent.limit_sup_rate
INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
FROM dba.rate_group_agent  
WHERE ( dba.rate_group_agent.id_country_rate = :is_country ) 
AND ( dba.rate_group_agent.id_branch = :gs_branch_insta ) 
AND ( dba.rate_group_agent.id_main_branch  = :ls_grupo )   
AND ( dba.rate_group_agent.id_country = :ls_country_source ) 
AND ( dba.rate_group_agent.id_state = :ls_state_source ) 
AND ( dba.rate_group_agent.id_modo_pago = :gs_mod_pay );

// Rate by City

if ld_rate = 0 or Isnull(ld_rate) Then 

	SELECT dba.rate_group_state_city.rate,
	dba.rate_group_state_city.id_curreny,
	dba.rate_group_state_city.limit_send_rate,
	dba.rate_group_state_city.limit_inf_rate,
	dba.rate_group_state_city.limit_sup_rate
	INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
	FROM dba.rate_group_state_city  
	WHERE ( dba.rate_group_state_city.id_country_rate = :is_country ) 
	AND ( dba.rate_group_state_city.id_city_rate = :is_city )
	AND ( dba.rate_group_state_city.id_main_branch  = :ls_grupo )  
	AND ( dba.rate_group_state_city.id_country = :ls_country_source )   
	AND ( dba.rate_group_state_city.id_state = :ls_state_source );

end if


if ld_rate = 0 or Isnull(ld_rate) Then

	SELECT dba.rate_group_state_delivery.rate,
	dba.rate_group_state_delivery.id_curreny,
	dba.rate_group_state_delivery.limit_send_rate,
	dba.rate_group_state_delivery.limit_inf_rate,
	dba.rate_group_state_delivery.limit_sup_rate
	INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
	FROM dba.rate_group_state_delivery  
	WHERE ( dba.rate_group_state_delivery.id_country_rate = :is_country ) 
	AND ( dba.rate_group_state_delivery.id_main_branch  = :ls_grupo ) 
	AND ( dba.rate_group_state_delivery.id_country = :ls_country_source )  
	AND ( dba.rate_group_state_delivery.id_state = :ls_state_source ) 
	AND ( dba.rate_group_state_delivery.id_modo_pago = :gs_mod_pay );

end if

// Rate by Mode Pay

if ld_rate = 0 or Isnull(ld_rate) Then
	ld_rate = 0
	
	SELECT dba.rate_state_delivery.rate,   
	dba.rate_state_delivery.id_curreny, 
	dba.rate_state_delivery.limit_send_rate,   
	dba.rate_state_delivery.limit_inf_rate,   
	dba.rate_state_delivery.limit_sup_rate  
	INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
	FROM dba.rate_state_delivery
	WHERE ( dba.rate_state_delivery.id_country_rate = :is_country )
	AND ( dba.rate_state_delivery.id_country = :ls_country_source )
	AND ( dba.rate_state_delivery.id_state = :ls_state_source )
	AND ( dba.rate_state_delivery.id_modo_pago = :gs_mod_pay );

end if

if ld_rate = 0 or Isnull(ld_rate) Then
	
SELECT dba.rate_group_state.rate,
dba.rate_group_state.id_curreny,
dba.rate_group_state.limit_send_rate,
dba.rate_group_state.limit_inf_rate,
dba.rate_group_state.limit_sup_rate
INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
FROM dba.rate_group_state  
WHERE ( dba.rate_group_state.id_country_rate = :is_country )
AND ( dba.rate_group_state.id_main_branch  = :ls_grupo )
AND ( dba.rate_group_state.id_country = :ls_country_source )
AND ( dba.rate_group_state.id_state = :ls_state_source );
		
end if

if ld_rate = 0 or Isnull(ld_rate) Then
	
	SELECT dba.rate.rate,
	dba.rate.id_curreny,
	dba.rate.limit_send_rate,
	dba.rate.limit_inf_rate,
	dba.rate.limit_sup_rate
	INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
	FROM dba.rate
	WHERE ( dba.rate.id_country = :is_country ) 
	AND ID_CURRENCY_SOURCE = 'D';
	  
end if
	
If sqlca.sqlcode <> 0 then
	Messagebox("Error","Country doesn't have an valid exchange rate.",Exclamation!)
	ld_rate = 0
	dw_2.setitem(ll_row,"rate_change_receiver",0)
	dw_2.setitem(ll_row,"id_curreny","NINGUNA")
	return 0
end if
	
Double 	ld_limite_inferior	= 0,	ld_limite_maximo = 0, ld_limite_id = 0

SELECT dba.exclusion_limit.limit_send_rate,   
dba.exclusion_limit.limit_inf_rate,   
dba.exclusion_limit.limit_sup_rate  
INTO :ld_limite_id,   
:ld_limite_inferior,   
:ld_limite_maximo  
FROM dba.exclusion_limit
WHERE ( dba.exclusion_limit.id_country_source = :ls_country_source)  
AND ( dba.exclusion_limit.id_state_source = :ls_state_source )  
AND ( dba.exclusion_limit.id_country_destination = :is_country);

If ld_limite_inferior <> 0 then id_inf = ld_limite_inferior
if ld_limite_maximo <> 0 then id_sup = ld_limite_maximo
if ld_limite_id <> 0 then id_limit_id = ld_limite_id 	
			
// Check Currency

If is_mod_currency = "D" Then 
	ld_rate = 1
	dw_2.setitem(ll_row,"rate_change_receiver",ld_rate)
	dw_2.setitem(ll_row,"id_curreny","D")
else
	dw_2.setitem(ll_row,"rate_change_receiver",ld_rate)
	dw_2.setitem(ll_row,"id_curreny",is_currency)
end if
	
	
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Calculates amount depending on calculation mode!
// li_calculation_mode = 1 (net amount) DEFAULT
// li_calculation_mode = 2 (total)
// li_calculation_mode = 3 (totap to be pay)
if li_calculation_mode = 2 then
	// Es un estimado para calcular la comision, se rebaja 1 para bajar de rango
	// si esta en un limite.
	ld_amount = dw_2.getitemnumber(dw_2.getrow(),"total_receiver")
	ld_amount = ld_amount -1
elseif li_calculation_mode = 3 then	
	// depende del rate
	ld_amount = dw_2.getitemnumber(dw_2.getrow(),"total_pay_receiver") / ld_rate	
else
	ld_amount = dw_2.getitemnumber(dw_2.getrow(),"net_amount_receiver")
end if
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		
	
	
	
// Check the Payment Network Limit

SELECT dba.pay_group_limit.amount_limit  
INTO :ld_limite_grupo  
FROM dba.pay_group_limit  
WHERE ( dba.pay_group_limit.id_main_branch = :ls_grupo )  
AND ( dba.pay_group_limit.mod_pay_currency = :is_mod_currency );

if isnull(ld_limite_grupo)  then
	ld_limite_grupo = 0
end if	

if ld_limite_grupo <> 0 then
	if ld_limite_grupo < ld_amount then
		messagebox("Warning","This amount exceeds the limit per payer")
		return
	End if
End if
		
	
	
// ++++++++++++++++++++++++++++++++++++++++++++++++
// COMMISSION 

ld_total_receiver 		= 0
ld_total_pay_receiver = 0
ll_cont_delivery	 		= 0
ld_feet            			= 0
ld_feet_comp       		= 0 
ld_porcentaje      		= 0
ld_porcentaje_comp 	= 0
ld_comision        		= 0
ld_comision_comp		= 0

ls_modo_pago1 = dw_2.getitemstring(dw_2.getrow(),"receiver_mode_pay_receiver")
ls_propia = fn_agencia_propia(gs_branch_insta)
ll_contagent_group = 0

SELECT Count(*)  
INTO :ll_contagent_group
FROM dba.comision_agent_modo_pago_grupo comision_agent_modo_pago_grupo  
WHERE ( comision_agent_modo_pago_grupo.id_branch = :gs_branch_insta )
AND ( comision_agent_modo_pago_grupo.id_main_branch = :ls_grupo )
AND ( comision_agent_modo_pago_grupo.id_country = :gs_country_receiver )  
AND ( comision_agent_modo_pago_grupo.mod_pay_currency = :is_mod_currency  )
AND ( comision_agent_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 )
AND ( comision_agent_modo_pago_grupo.range_begin_comision_pay <= :ld_amount )
AND ( comision_agent_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

IF ll_contagent_group > 0 then   // ANULA TODAS LAS TABLAS

	ld_vlr_modo_pago 		 = 0
	ld_vlr_modo_pago_comp = 0	
	
	SELECT comision_agent_modo_pago_grupo.porcent_comision_comp,   
	comision_agent_modo_pago_grupo.feet_comision_comp,   
	comision_agent_modo_pago_grupo.porcent_comision_agente,   
	comision_agent_modo_pago_grupo.feet_comision_agente  
	INTO :ld_porcentaje_comp,   
	:ld_feet_comp ,   
	:ld_porcentaje,   
	:ld_feet  
	FROM dba.comision_agent_modo_pago_grupo comision_agent_modo_pago_grupo  
	WHERE ( comision_agent_modo_pago_grupo.id_branch = :gs_branch_insta )  
	AND ( comision_agent_modo_pago_grupo.id_main_branch = :ls_grupo )  
	AND ( comision_agent_modo_pago_grupo.id_country = :gs_country_receiver )  
	AND ( comision_agent_modo_pago_grupo.mod_pay_currency = :is_mod_currency  )  
	AND ( comision_agent_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 )  
	AND ( comision_agent_modo_pago_grupo.range_begin_comision_pay <= :ld_amount )  
	AND ( comision_agent_modo_pago_grupo.range_end_comision_pay >= :ld_amount );
	
	ld_comision       = ( ld_amount * ld_porcentaje )   				
	ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
	
ELSE

	SELECT Count(*)  
	INTO :ll_cont
	FROM dba.comision  
	WHERE ( dba.comision.id_branch = :gs_branch_insta )
	AND ( dba.comision.id_country = :gs_country_receiver )
	AND ( dba.comision.range_begin_comision <= :ld_amount )
	AND ( dba.comision.range_end_comision >= :ld_amount )
	AND ( dba.comision.mod_pay_currency	= :is_mod_currency )  ;
	
	if ll_cont <> 0 then  ////////////// Verifica si esta en la tabla de Exclusion.
		ld_feet = fn_feet(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
		ld_feet_comp = fn_feet_company(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
		ld_porcentaje = fn_comision(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
		ld_porcentaje_comp = fn_comision_company(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
		ld_comision = ( ld_amount * ld_porcentaje )   				
		ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
	else
		ld_feet = fn_fee_standar(gs_country_receiver,ld_amount,is_mod_currency)
		ld_feet_comp = fn_fee_company_standar(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
		ld_porcentaje = fn_comision_standar(gs_country_receiver,ld_amount,is_mod_currency)
		ld_porcentaje_comp = fn_comision_company_standar(gs_country_receiver,ld_amount,is_mod_currency)
		ld_comision = ( ld_amount * ld_porcentaje )   				
		ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
	end if
		
	//SI ESTA EN LA TABLA COMISION_DELIVERY ANULAR LA STANDAR Y EXCLUSION
	
	ll_cont = 0
	lb_comision_delivery = False		
		
	SELECT Count(*)  
	INTO :ll_cont  
	FROM dba.comision_delivery comision_delivery  
	WHERE ( comision_delivery.id_country = :is_country )  
	AND ( comision_delivery.id_modo_pago = :ls_modo_pago1 )
	AND ( comision_delivery.range_begin <= :ld_amount )
	AND ( comision_delivery.range_end >= :ld_amount )
	AND ( comision_delivery.id_main_branch = :ls_grupo )
	AND ( comision_delivery.mod_pay_currency = :is_mod_currency  );
			
	if ll_cont > 0 then  
		lb_comision_delivery = True	
		
		SELECT comision_delivery.porcent_comp,   
		comision_delivery.feet_comp,   
		comision_delivery.porcent_agente,   
		comision_delivery.feet_agente  
		INTO :ld_porcentaje_comp,   
		:ld_feet_comp,   
		:ld_porcentaje,   
		:ld_feet  
		FROM dba.comision_delivery comision_delivery  
		WHERE ( comision_delivery.id_country = :is_country )  
		AND ( comision_delivery.id_modo_pago = :ls_modo_pago1 )  
		AND ( comision_delivery.range_begin <= :ld_amount )  
		AND ( comision_delivery.range_end >= :ld_amount )
		AND ( comision_delivery.id_main_branch = :ls_grupo )  
		AND ( comision_delivery.mod_pay_currency = :is_mod_currency  );
		
		ld_comision = ( ld_amount * ld_porcentaje )   				
		ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
	end if

	////////////////////////////  Costo dependiendo del Modo de Pago  ///////////////////////
		
	SELECT dba.comision_modo_pago_grupo.porcent_comision_agente,   
	dba.comision_modo_pago_grupo.feet_comision_agente, 
	dba.comision_modo_pago_grupo.porcent_comision_comp,   
	dba.comision_modo_pago_grupo.feet_comision_comp  
	INTO :ld_porc_modo_pago,   
	:ld_telex_modo_pago, 
	:ld_porc_modo_pago_comp,   
	:ld_telex_modo_pago_comp 
	FROM dba.comision_modo_pago_grupo  
	WHERE ( dba.comision_modo_pago_grupo.id_main_branch = :ls_grupo )
	AND ( dba.comision_modo_pago_grupo.id_country = :gs_country_receiver )
	AND ( dba.comision_modo_pago_grupo.mod_pay_currency = :is_mod_currency )
	AND ( dba.comision_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 )
	AND ( dba.comision_modo_pago_grupo.range_begin_comision_pay <= :ld_amount )
	AND ( dba.comision_modo_pago_grupo.range_end_comision_pay   >= :ld_amount );
	
	if isnull(ld_porc_modo_pago) then  ld_porc_modo_pago  = 0
	if isnull(ld_telex_modo_pago) then ld_telex_modo_pago = 0
	if isnull(ld_porc_modo_pago_comp) then  ld_porc_modo_pago_comp  = 0
	if isnull(ld_telex_modo_pago_comp) then ld_telex_modo_pago_comp = 0
	
	ld_vlr_modo_pago      = (ld_amount * ld_porc_modo_pago)      + ld_telex_modo_pago
	ld_vlr_modo_pago_comp = (ld_amount * ld_porc_modo_pago_comp) + ld_telex_modo_pago_comp	  

	//////////////////////////////////////////////////////////////////////////////////// 
	///// Verificar Nuevamente si al tomar el Delivery aplica la exclusion o la Standar 
	
	ls_standar_exclusion = ''
	
	SELECT standar_exclusion   
	INTO :ls_standar_exclusion   
	FROM dba.comision_modo_pago_grupo  
	WHERE ( dba.comision_modo_pago_grupo.id_main_branch = :ls_grupo )
	AND ( dba.comision_modo_pago_grupo.id_country = :gs_country_receiver )
	AND ( dba.comision_modo_pago_grupo.mod_pay_currency = :is_mod_currency )
	AND ( dba.comision_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 )
	AND ( dba.comision_modo_pago_grupo.range_begin_comision_pay <= :ld_amount )
	AND ( dba.comision_modo_pago_grupo.range_end_comision_pay   >= :ld_amount )   ;

	if lb_comision_delivery then
		ls_standar_exclusion = ''
	end if
	
	if ls_standar_exclusion = 'S' and Not(lb_comision_delivery) then
		ld_feet = fn_fee_standar(gs_country_receiver,ld_amount,is_mod_currency)
		ld_feet_comp = fn_fee_company_standar(gs_country_receiver,gs_branch_insta,ld_amount,is_mod_currency)
		ld_porcentaje = fn_comision_standar(gs_country_receiver,ld_amount,is_mod_currency)
		ld_porcentaje_comp = fn_comision_company_standar(gs_country_receiver,ld_amount,is_mod_currency)
		ld_comision = ( ld_amount * ld_porcentaje )   				
		ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
	end if
	 
END IF	


//LA TABLA COMISION_CITY ES UN ADICIONAL A LO QUE ESTE
ll_cont = 0 
ld_porcentaje_comp_city = 0
ld_feet_comp_city= 0
ld_porcentaje_city= 0
ld_feet_city = 0		
ld_comision_city = 0
ld_comision_comp_city = 0

SELECT Count(*)  
INTO :ll_cont  
FROM dba.comision_city comision_city  
WHERE ( comision_city.id_city = :is_city )
AND ( comision_city.id_modo_pago = :ls_modo_pago1 )
AND ( comision_city.range_begin <= :ld_amount )
AND ( comision_city.range_end >= :ld_amount );
			
if ll_cont > 0 then
	
	SELECT comision_city.porcent_comp,   
	comision_city.feet_comp,   
	comision_city.porcent_agente,   
	comision_city.feet_agente  
	INTO :ld_porcentaje_comp_city,   
	:ld_feet_comp_city,   
	:ld_porcentaje_city,   
	:ld_feet_city  
	FROM dba.comision_city comision_city
	WHERE ( comision_city.id_city = :is_city )
	AND ( comision_city.id_modo_pago = :ls_modo_pago1 )
	AND ( comision_city.range_begin <= :ld_amount )
	AND ( comision_city.range_end >= :ld_amount );
			
	ld_comision_city = ( ld_amount * ld_porcentaje_city )   				
	ld_comision_comp_city = ( ld_amount * ld_porcentaje_comp_city )			
			
else
	ld_porcentaje_comp_city = 0
	ld_feet_comp_city= 0
	ld_porcentaje_city= 0
	ld_feet_city = 0		
	ld_comision_city = 0
	ld_comision_comp_city = 0
end if
	
	
ld_comision        	= ld_comision        	+ ld_comision_city
ld_feet            		= ld_feet            		+ ld_feet_city
ld_comision_comp	= ld_comision_comp  + ld_comision_comp_city
ld_feet_comp       	= ld_feet_comp       	+ ld_feet_comp_city


// La agencia ClearTalk tiene comisiones fijas
if gs_branch_insta = 'A00003' then
	
	ld_comision        	= 0
	ld_feet            		= fn_busparameter_numeric('CLEARTALK_FIXFEE')
	ld_comision_comp	= 0
	ld_feet_comp       	= fn_busparameter_numeric('CLEARTALK_VIAFEE')
		
end if

////////////////////////////////////////////////////////////////////////////////////
	 
 if ls_propia = 'S' then   // si es una agencia propia iguala las comisiones
	ld_comision_comp      = ld_comision
	ld_porcentaje_comp 	 = ld_porcentaje
	ld_feet_comp 			 = ld_feet
	ld_vlr_modo_pago_comp = ld_vlr_modo_pago
end if


ld_handling = dw_2.getitemnumber(dw_2.getrow(),"handling_receiver")





// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// TAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAX

// Calculates State Taxes

double ld_tax

ld_tax = fn_getstatetax(gs_branch_insta,ld_amount)

// TAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAX
// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Calculates the fields (amount, total, total to be paid)
// li_calculation_mode = 1 (net amount) DEFAULT
// li_calculation_mode = 2 (total)
// li_calculation_mode = 3 (totap to be pay)
if li_calculation_mode = 2 then

	ld_total_receiver = dw_2.getitemnumber(dw_2.getrow(),"total_receiver")	
	ld_amount = ld_total_receiver - (ld_feet + ld_comision + ld_handling + ld_vlr_modo_pago + ld_tax) 
	ld_total_pay_receiver = Round((ld_amount * ld_rate),2)

elseif li_calculation_mode = 3 then	
	
	ld_total_pay_receiver = dw_2.getitemnumber(dw_2.getrow(),"total_pay_receiver")
	ld_amount = Round((ld_total_pay_receiver / ld_rate),2)
	
	// Ajusta el total a pagar, de acuerdo al valor redondeado en dolares
	ld_total_pay_receiver = (ld_amount * ld_rate)
	ld_total_receiver = (ld_amount + ld_feet + ld_comision + ld_handling + ld_vlr_modo_pago + ld_tax) 
	
else

	ld_total_pay_receiver = (ld_amount * ld_rate)
	ld_total_receiver = (ld_amount + ld_feet + ld_comision + ld_handling + ld_vlr_modo_pago + ld_tax) 

end if
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



// ###################################################
// When a payer o a country is setup with PayoutAmountsRoundedUp, then
// the amount to be paid is rounded up (to the next integer). 


long ld_count_PayoutAmountsRoundedUp
DATASTORE dts_reglas, dts_reglas_by_country

dts_reglas = CREATE DATASTORE
dts_reglas_by_country  = CREATE DATASTORE

dts_reglas.dataobject = 'd_rules_configuration'
dts_reglas_by_country.dataobject =  'd_rules_configuration_by_country'


dts_reglas.SetTransObject(SQLCA)
dts_reglas_by_country.SetTransObject(SQLCA)



ld_count_PayoutAmountsRoundedUp = 0
ld_count_PayoutAmountsRoundedUp = dts_reglas.Retrieve( 'Payers.PayoutAmountsRoundedUp', ls_grupo)

/*
select count(PropertyValue)
into :ld_count_PayoutAmountsRoundedUp
from POS_Terminal_CFG
where PropertyName = 'Payers.PayoutAmountsRoundedUp'
and PropertyValue = :ls_grupo;*/

if  ld_count_PayoutAmountsRoundedUp <= 0 then
	
	
	ld_count_PayoutAmountsRoundedUp = dts_reglas_by_country.Retrieve( 'Payers.PayoutAmountsRoundedUp', is_country)
/*	select count(PropertyValue)
	into :ld_count_PayoutAmountsRoundedUp
	from POS_Terminal_CFG
	where PropertyName = 'Countries.PayoutAmountsRoundedUp'
	and PropertyValue = :gs_country_receiver;*/
end if

// if configuration was found rounds UP to the next integer
if ld_count_PayoutAmountsRoundedUp > 0 then
	ld_total_pay_receiver = Round(ld_total_pay_receiver,0)
end if

// ##################################################






dw_2.setitem(ll_row,"net_amount_receiver",ld_amount)
dw_2.setitem(ll_row,"total_modo_pago",ld_vlr_modo_pago)
dw_2.setitem(ll_row,"total_modo_pago_comp",ld_vlr_modo_pago_comp)
dw_2.setitem(ll_row,"telex_receiver",ld_feet)
dw_2.setitem(ll_row,"telex_company", ld_feet_comp)
dw_2.setitem(ll_row,"porc_comision_receiver",ld_porcentaje)
dw_2.setitem(ll_row,"exchange_receiver",ld_comision)
dw_2.setitem(ll_row,"exchange_company",ld_comision_comp )																			 
dw_2.setitem(ll_row,"total_receiver",ld_total_receiver)
dw_2.setitem(ll_row,"total_pay_receiver",ld_total_pay_receiver)
dw_2.setitem(ll_row,"receiver_state_tax",ld_tax)	
dw_2.setitem(ll_row,"total_diference",0)
dw_2.setitem(ll_row,"ref_receiver",0)
	
ib_fallas = False
dw_2.accepttext()
dw_2.setfocus()

end event

event ue_calculadora;double	ld_valor_total
long		ll_row

ll_row = dw_2.getrow()

ld_valor_total = dw_2.getitemnumber(1,"total_receiver")

//Openwithparm(w_calcular,ld_valor_total)

Openwithparm(w_calcular_devolucion,ld_valor_total)
end event

event ue_cost;// // Reemplazado el 06/25/2009 
// // Se uso el ue_calcular


//string	ls_mode_pay
//long 		ll_cont
//
//double	ld_recibir,	&
//			ld_comision
//
//Double	ld_pagar,	&
//			ld_rate,		&
//			ld_telex,	&
//			ld_porc,		&
//			ld_fee,		&
//			ld_amount, 	&
//			ld_neto
//			
//string	ls_country,ls_branch_insta, ls_currency
//
////ls_branch_insta = fn_branch_instalacion()
//
//ls_branch_insta = dw_network.getitemstring(1,"id_branch")
//
//dw_2.ACCEPTTEXT()
//
//ld_recibir = dw_2.getitemnumber(1,"total_pay_receiver")
//ls_mode_pay = dw_2.getitemstring(1,"mod_pay_currency")
//ls_country = dw_2.getitemstring(1,"id_country_receiver")
//ld_neto = dw_2.getitemnumber(1,"total_receiver")
//
//if ld_recibir   = 0  then return
//if ls_mode_pay  = '' then return
//if ls_country  = '' then return
//
//IF ls_mode_pay = 'N' THEN
//	
//	SELECT dba.rate.rate,
//	dba.rate.id_curreny  
//	INTO :ld_rate,:ls_currency  
//	FROM dba.rate  
//	WHERE dba.rate.id_country = :ls_country ;
//
//	
//	If ld_rate = 0 then 
//		messagebox("warning","doesn't have rate")
//		return
//	end if
//
//	dw_2.setitem(1,"rate_change_receiver",ld_rate)
//	ld_amount   = (ld_recibir/ld_rate)
// 	dw_2.setitem(1,"net_amount_receiver",ld_amount)
//	dw_2.setitem(1,"id_curreny",ls_currency)
//	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
//	
//	if ll_cont  = 0 then
//		ld_fee  = fn_fee_standar(ls_country,ld_amount,"N")
//		ld_porc = fn_comision_standar(ls_country,ld_amount,"N")
//	else
//		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"N")
//		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"N")
//	end if
//	
//Else
//	
//	ld_rate = 1
//	dw_2.setitem(1,"rate_change_receiver",ld_rate)
//	ld_amount = ld_recibir 
// 	dw_2.setitem(1,"net_amount_receiver",ld_amount)
//	dw_2.setitem(1,"id_curreny","D")
//	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
//	
//	if ll_cont  = 0 then
//		ld_fee  = fn_fee_standar(ls_country,ld_amount,"D")
//		ld_porc = fn_comision_standar(ls_country,ld_amount,"D")
//
//	else
//		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"D")
//		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"D")
//	end if
//	
//END IF
//
//dw_2.setitem(1,"telex_receiver",ld_fee)
//dw_2.setitem(1,"exchange_receiver",(ld_amount * ld_porc))
//dw_2.setitem(1,"total_receiver",(ld_amount + ld_fee + (ld_porc * ld_amount)))
//

end event

event ue_hold;String		ls_flag
Double	ld_sender,ld_receiver

ld_sender	=	0

ld_sender   = dw_1.getitemnumber(dw_1.getrow(),"id_sender")
ld_receiver = dw_2.getitemnumber(dw_1.getrow(),"id_receiver")
ls_flag     = dw_2.getitemstring(dw_1.getrow(),"id_flag_receiver")

if ld_sender = 0 or isnull(ld_sender) then return

if ld_receiver = 0 or isnull(ld_receiver) then return

if ls_flag = "A" then
		Messagebox("Warning","Invoice Void")  
	return
end if

if ls_flag = "D" then
		Messagebox("Warning","Invoice without Pay")  
	return
end if


if is_estado = 'T' Then 
	messagebox("Warning","Invoice Transfered")
	return
end if

if is_estado = 'A' Then 
	messagebox("Warning","Invoice Void")
	return
end if


 	if Messagebox("Warning","Do you Want to Put this Invoice in Hold!",Question!,YesNo!) = 2 then 
		return
	end if

		UPDATE dba.receiver  
      SET    dba.receiver.id_flag_receiver = 'H' 
      WHERE ( dba.receiver.id_branch   = :gs_branch_insta) AND  
            ( dba.receiver.id_receiver = :ld_receiver )   ;
		Commit ;
		dw_2.setitem(1,"id_flag_receiver","H")
		is_estado = 'H'
end event

event ue_total;// // Reemplazado el 06/25/2009 
// // Se uso el ue_calcular
//
//
//string	ls_mode_pay
//long 		ll_cont
//
//double	ld_recibir,	&
//			ld_comision
//
//Double	ld_pagar,	&
//			ld_rate,		&
//			ld_telex,	&
//			ld_porc,		&
//			ld_fee,		&
//			ld_amount, 	&
//			ld_neto, ld_total
//			
//string	ls_country, ls_branch_insta, ls_currency
//
//ls_branch_insta = dw_network.getitemstring(1,"id_branch")
//
//dw_2.ACCEPTTEXT()
//
//ld_amount = dw_2.getitemnumber(1,"total_receiver")
//ld_recibir = dw_2.getitemnumber(1,"total_pay_receiver")
//ls_mode_pay = dw_2.getitemstring(1,"mod_pay_currency")
//ls_country = dw_2.getitemstring(1,"id_country_receiver")
//ld_neto = dw_2.getitemnumber(1,"total_receiver")
//
//if ld_neto = 0  then return
//if ls_mode_pay  = '' then return
//if ls_country = '' then return
//
//IF ls_mode_pay = 'N' THEN
//	
//	SELECT dba.rate.rate,dba.rate.id_curreny  
//	INTO :ld_rate,:ls_currency  
//	FROM dba.rate  
//	WHERE dba.rate.id_country = :ls_country ;
//
//	If ld_rate = 0 then 
//		messagebox("warning","doesn't have rate")
//		return
//	end if
//
//	dw_2.setitem(1,"rate_change_receiver",ld_rate)
//	
//	dw_2.setitem(1,"id_curreny",ls_currency)
//	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
//
//	if ll_cont  = 0 then
//		ld_fee  = fn_fee_standar(ls_country,ld_amount,"N")
//		ld_porc = fn_comision_standar(ls_country,ld_amount,"N")
//	else
//		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"N")
//		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"N")
//	end if
//		
//Else
//	
//	ld_rate = 1
//	dw_2.setitem(1,"rate_change_receiver",ld_rate)
//	dw_2.setitem(1,"id_curreny","D")
//	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
//	
//	if ll_cont  = 0 then
//		ld_fee  = fn_fee_standar(ls_country,ld_amount,"D")
//		ld_porc = fn_comision_standar(ls_country,ld_amount,"D")
//	else
//		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"D")
//		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"D")
//	end if
//	
//END IF
//
//	ld_amount = (ld_neto - ld_fee) - (ld_neto * ld_porc)
//		
//	IF ls_mode_pay = 'N' THEN
//		
//	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
//	
//	if ll_cont  = 0 then
//		ld_fee  = fn_fee_standar(ls_country,ld_amount,"N")
//		ld_porc = fn_comision_standar(ls_country,ld_amount,"N")
//	else
//		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"N")
//		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"N")
//	end if
//	
//Else
//	
//	ld_rate = 1
//	dw_2.setitem(1,"rate_change_receiver",ld_rate)
//	dw_2.setitem(1,"id_curreny","D")
//	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
//	
//	if ll_cont  = 0 then
//		ld_fee  = fn_fee_standar(ls_country,ld_amount,"D")
//		ld_porc = fn_comision_standar(ls_country,ld_amount,"D")
//	else
//		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"D")
//		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"D")
//	end if
//	
//END IF
//
//	
//	
//	
//	
//ld_amount = (ld_neto - ld_fee) /  (1 + ld_porc)
//
//ld_recibir = ld_amount * ld_rate
//
//dw_2.setitem(1,"total_pay_receiver",ld_recibir)
//dw_2.setitem(1,"net_amount_receiver",ld_amount)
//dw_2.setitem(1,"telex_receiver",ld_fee)
//dw_2.setitem(1,"exchange_receiver",(ld_amount * ld_porc))

end event

event ue_postopen();Double 	ld_ultimo, ld_diario

X=1
Y=1
Show()

is_estado =  'I'
ib_actualizado = False

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_network.settransobject(sqlca)
dw_recibo.settransobject(sqlca)
dw_recibo_matrix.settransobject(sqlca)

Commit;


if fn_check_user_role('QFO') <= 0 then
	pb_show_folio.visible = false
end if	

gs_mod_pay = ""
gs_mod_currency = ""
dw_1.insertrow(0)	
dw_1.accepttext()
dw_2.insertrow(0)

id_availablebalance = 0

ld_diario = 0
em_balance.text = ''
ld_ultimo = 0
em_ultimo_invoice.text = ''

fn_agencytype(is_branch_insta)	

if dw_network.retrieve() = 0 then
	close(this)
	Return
end if

dw_network.setitem(1,"id_branch",is_branch_insta)
dw_network.setitem(1,"branch_modem_branch",is_branch_insta)
dw_network.setfocus()



Close(w_please_wait_rojo)
end event

public subroutine fn_loadbranch ();//----------------------------------------------------------------------------->>
// Carga la agencia escogida en la pantalla
//----------------------------------------------------------------------------->>

Double 	ld_ultimo
String		ls_city,ls_state,ls_country, ls_dep_method

DataWindowChild ldw_cdw

dw_network.enabled = False

is_branch_insta = dw_network.getitemstring(1,"id_branch")

gs_branch_insta = is_branch_insta

if is_branch_insta = '' then
	Messagebox("Error","Program not Autorized, Please consult with the System Administrator.",StopSign!)
	Close(this)
	Return
end if

ld_ultimo = fn_ultimo_invoice_agente(gs_branch_insta)			

em_ultimo_invoice.text = string(trim(is_branch_insta) +"-"+string(ld_ultimo))

//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
SELECT dba.branch.id_city,dba.branch.id_state,dba.branch.id_country  
  INTO :ls_city,:ls_state,:ls_country  
  FROM dba.branch  WITH (NOLOCK)
 WHERE dba.branch.id_branch = :is_branch_insta;
 //************************************************

dw_1.reset()
dw_1.insertrow(0)	 
dw_1.setitem(dw_1.getrow(),"id_branch",is_branch_insta)
dw_1.setitem(dw_1.getrow(),"id_country",ls_country)
dw_1.setitem(dw_1.getrow(),"id_state",ls_state)
dw_1.setitem(dw_1.getrow(),"id_city",ls_city)
dw_2.setitem(dw_2.getrow(),"id_branch",is_branch_insta)
dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)
dw_1.setfocus()

dw_1.GetChild('id_state',ldw_cdw)
ldw_cdw.SetFilter('')
ldw_cdw.Filter()
ldw_cdw.SetTransObject(SQLCA)
ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
ldw_cdw.Filter()

dw_1.GetChild('id_city',ldw_cdw)
ldw_cdw.SetFilter('')
ldw_cdw.Filter()
ldw_cdw.SetTransObject(SQLCA)
ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
ldw_cdw.Filter()

dw_1.setitem(dw_1.getrow(),"id_city",ls_city)

// Actualiza el limite de credito de la agencia
fn_update_balance()

if is_branch_insta = 'A00788' OR is_branch_insta = 'A00765' OR is_branch_insta = 'A00898' then
	cb_paymode.enabled = true
else
	cb_paymode.enabled = false
end if

//----------------------------------------------------------------------------->>

li_calculation_mode = 1 // (net amount) DEFAULT

ls_dep_method=''
 DECLARE spGetDepMethod PROCEDURE FOR dba.spCalDepositMethodRedPhoneScreen  
         @p_id_branch = :is_branch_insta;
Execute spGetDepMethod;
if SQLCA.SQLCode <> 0 then			
	MessageBox("Alert","Error dba.spGetDepMethod: " + sqlca.SQLErrText, StopSign!)
else
		FETCH spGetDepMethod INTO :ls_dep_method;
end if
CLOSE spGetDepMethod;


em_dep_method.text = ls_dep_method



end subroutine

public subroutine fn_agencytype (string ls_id_branch);integer li_viaAgricola
String ls_agency_type, ls_name_branch

if isNull(ls_id_branch) OR ls_id_branch = '' then
	st_agency.text = 'PLEASE SELECT AN AGENCY (CLICK NEW)'
	st_agency.backcolor = RGB(0,180,0)
	//ib_isRedPhone = FALSE
	ii_sends_receipt = 0
	cb_print.enabled = FALSE
	p_1.enabled = FALSE
	st_1.enabled = FALSE
	st_1.textcolor = RGB(150,150,150)
	dw_1.enabled = false
	dw_2.enabled = false
	return
end if


SELECT dba.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION, NAME_TIPO_TRANSMISION, SENDS_RECEIPT
INTO :ls_agency_type, :is_name_tipo, :ii_sends_receipt
FROM dba.TIPO_TRANSMISION_AGENCIA WITH (NOLOCK) 
JOIN  dba.TIPO_TRANSMISION ON TIPO_TRANSMISION = ID_TIPO_TRANSMISION
WHERE dba.TIPO_TRANSMISION_AGENCIA.ID_BRANCH = :ls_id_branch;

//SELECT dba.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION,   
//  INTO :ls_agency_type  
//  FROM dba.TIPO_TRANSMISION_AGENCIA JOIN  
// WHERE dba.TIPO_TRANSMISION_AGENCIA.ID_BRANCH = :ls_id_branch;

// R: Red Phone
// D: Central

//Messagebox("",ls_id_branch)

//DON (03/24/2015) - ADD NOLOCK.  *************************
SELECT name_branch
  INTO :ls_name_branch
  FROM dba.BRANCH	WITH (NOLOCK)
 WHERE id_branch = :ls_id_branch;
 //**************************************************

//ib_isPOSTerminal = FALSE
//ib_isRedPhone = FALSE	
	
st_agency.text = is_name_tipo+ ': ' + TRIM(ls_name_branch)
	
if trim(upper(ls_agency_type)) = 'R' then
	//st_agency.text = 'RED PHONE: '+TRIM(ls_name_branch)
	st_agency.backcolor = RGB(180,0,0)
	//ib_isRedPhone = TRUE
elseif trim(upper(ls_agency_type)) = 'P' then
	//st_agency.text = 'POS TERMINAL: '+TRIM(ls_name_branch)
	st_agency.backcolor = RGB(0,200,0)
	//ib_isPOSTerminal = TRUE
else	
	//st_agency.text = 'CENTRAL AGENCY: '+TRIM(ls_name_branch)
	st_agency.backcolor = RGB(0,0,200)
end if

SELECT Count(*)
INTO  :li_viaAgricola 
FROM dba.branch 
WHERE id_branch = :ls_id_branch  AND name_branch LIKE '%FP)';

IF li_viaAgricola = 1 THEN
	st_agency.backcolor = RGB(255, 209, 0 )
END IF

cb_print.enabled = TRUE
p_1.enabled = TRUE
st_1.enabled = TRUE
st_1.textcolor = RGB(0,0,0)
end subroutine

public subroutine fn_choose_payor ();// Abre las ventanas de seleccion del pagador

String		ls_main_branch, ls_branch
String		ls_amount


	
is_city    = dw_2.getitemstring(dw_2.getrow(),"id_city_receiver")
is_state   = dw_2.getitemstring(dw_2.getrow(),"id_state_receiver")
is_country = dw_2.getitemstring(dw_2.getrow(),"id_country_receiver")

gs_country_receiver = is_country

is_mod_pay = dw_2.getitemstring(dw_2.getrow(),"receiver_mode_pay_receiver")
is_mod_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")		
gs_city_receiver = is_city
gs_mod_pay = is_mod_pay
gs_mod_currency = is_mod_currency

//gs_pagador_ultimo = is_branch_ultimo
gs_pagador_ultimo = dw_2.getitemstring(dw_2.getrow(),"branch_pay_receiver")
ls_amount = string(dw_2.getitemnumber(dw_2.getrow(),"net_amount_receiver") )  +'*' + string(dw_2.getitemnumber(dw_2.getrow(),"rate_change_receiver") )



If isnull(gs_pagador_ultimo)  then  gs_pagador_ultimo  = "" 
//ls_amount = ld_amount

//if is_mod_currency = "N" then
//	Openwithparm(w_busca_branch_nacional_unificada,gs_city_receiver)
//elseif is_mod_currency = "D" Then
//	Openwithparm(w_busca_branch_dolar_unificada,gs_city_receiver)
if is_mod_currency = 'N' or is_mod_currency = 'D' then
	OpenWithParm(w_pop_selection, ls_amount )
else
	Messagebox("Datos Incompletos","No se ha seleccionado la moneda, por favor seleccione la moneda antes de continuar.",StopSign!)
	dw_2.setfocus()
	dw_2.setcolumn("mod_pay_currency")
	ib_haspayor = false
	return
end if
ls_branch = Message.stringparm

if ls_branch <> '' then

	dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",ls_branch)
	dw_2.setitem(dw_2.getrow(),"branch_name",fn_get_branch_name(ls_branch))
	
	////////////////////////////////////////////////////////////////
	/////////////// Traer los Datos del punto de pago //////////////
	//DON (04/16/2015) - PERFORMANCE TUNING.  ***********************************
	SELECT id_main_branch
	INTO :ls_main_branch   
	FROM dba.branch	WITH (NOLOCK)
	WHERE id_branch = :ls_branch;
	//********************************************************************
	
	dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",ls_main_branch)

//	//============================================================>
//	// habilita la opcion de crear cuentas para el pagador conavi!
//	if ls_main_branch <> "T001" then
//		dw_2.setitem(dw_2.getrow(),"receiver_rec_createacc","N")
//	end if
//	//============================================================>	
	////////////////////////////////////////////////////////////////

	ib_haspayor = true	
else
	ib_haspayor = false
end if

if ls_branch = "" or isnull(ls_branch) then
	dw_2.SetColumn(27)
end if

dw_2.setfocus()
dw_2.accepttext()
dw_2.setfocus()


end subroutine

public function boolean fn_valida_pagador (boolean pb_silent);Long ll_row, ll_cont_cubrimiento, ll_cont
String ls_state_source, ls_use_cubrimiento, ls_pagador

ll_row = dw_2.getrow()	
dw_2.accepttext()
dw_1.setfocus()

ls_pagador = dw_2.getitemstring(ll_row,"branch_pay_receiver")
gs_branch_insta = is_branch_insta	
is_mod_pay = dw_2.getitemstring(dw_2.getrow(),"receiver_mode_pay_receiver")
is_mod_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")		
gs_mod_pay = is_mod_pay
gs_mod_currency = is_mod_currency

// -------------------------------------------------------------------------------------------
// Selecciona como estado origen el estado de la agencia y no el del cliente

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
select id_state
into :ls_state_source
from dba.branch WITH (NOLOCK)
where id_branch = :gs_branch_insta;
if isnull(ls_state_source) then ls_state_source = dw_1.getitemstring(dw_1.getrow(),"id_state")
// -------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------	
// Corregir Estado y Pais para la Ciudad

is_city = dw_2.getitemstring(dw_2.getrow(),"id_city_receiver")

//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
SELECT id_state,id_country,long_phone_city 
INTO :is_state,:is_country,:il_long_phone
FROM dba.city  WITH (NOLOCK)
WHERE id_city = :is_city   ;
//***********************************************************************

dw_2.setitem(ll_row,"id_state_receiver",is_state)
dw_2.setitem(ll_row,"id_country_receiver",is_country)
gs_country_receiver = is_country
// -------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------
// Verificar el punto

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT COUNT(*)
INTO :ll_cont
FROM dba.branch	WITH (NOLOCK)
WHERE id_branch = :ls_pagador
AND id_flag_branch = 'A';
//***********************************************************

if ll_cont <> 1 then
	if not pb_silent then
		messagebox("Pay Point Not Available","The selected Pay Point is not longer available.~nYou must use the 'Pay Point' button to select another pay point.",StopSign!)
		//messagebox("Punto de pago no disponible","El Punto de pago seleccionado no esta disponible en el destino.~nPuede usar el boton 'Punto de Pago' para seleccionar otro punto de pago.",StopSign!)
	end if
	ib_haspayor = false
	return false
end if
// -------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------
// Verificar la moneda
//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT COUNT(*)
INTO :ll_cont
FROM dba.branch	WITH (NOLOCK)
WHERE id_branch = :ls_pagador
AND (currency_pay_branch = 'A' or currency_pay_branch = :gs_mod_currency);
//***********************************************************

if ll_cont <> 1 then
	if not pb_silent then
		messagebox("Pay Point","The currency selected is not available in this Point.",StopSign!)
		//messagebox("Punto de pago no disponible","El Punto de pago seleccionado no esta disponible en el destino.~nPuede usar el boton 'Punto de Pago' para seleccionar otro punto de pago.",StopSign!)
	end if
	ib_haspayor = false
	return false
end if
// -------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------
// Verificar el modo de pago

//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
SELECT Count(*)  
 INTO :ll_cont  
 FROM dba.modo_pago_branch	WITH (NOLOCK)
WHERE (id_branch = :ls_pagador) 
  AND (modo_pago = :is_mod_pay);
//**********************************************************************

if ll_cont  <= 0 then	
	if not pb_silent then
		messagebox("Pay Point Not Available","The selected Pay Point is not longer available.~nYou must use the 'Pay Point' button to select another pay point.",StopSign!)
		//messagebox("Punto de pago no disponible","El Punto de pago seleccionado no esta disponible en el destino.~nPuede usar el boton 'Punto de Pago' para seleccionar otro punto de pago.",StopSign!)
	end if
	ib_haspayor = false
	return false
end if
// -------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------
// Verificar la cobertura
SELECT dba.modo_pago.use_cubrimiento  
INTO :ls_use_cubrimiento  
FROM dba.modo_pago  
WHERE dba.modo_pago.id_modo_pago = :gs_mod_pay   ;

if ls_use_cubrimiento = 'S' then
	//DON (04/16/2015) - PERFORMANCE TUNING.  **************************************
	SELECT Count(*)  
	 INTO :ll_cont_cubrimiento  
	 FROM dba.cubrimiento_branch  WITH (NOLOCK)
	WHERE (id_city = :is_city) AND  
			(id_branch = :ls_pagador) ;
	//***********************************************************************

	if ll_cont_cubrimiento  <= 0 then	
		if not pb_silent then
			messagebox("Punto de pago no disponible","El Punto de pago seleccionado no esta disponible en el destino.~nPuede usar el boton 'Punto de Pago' para seleccionar otro punto de pago.",StopSign!)
		end if
		ib_haspayor = false
		return false
	end if
end if	
// -------------------------------------------------------------------------------------------

return true
end function

public subroutine fn_fillmodopago (string ls_modo_pago_previo);// ------------------------------------------------------------------------->
// Popula el dw_modo de pago con los modos de pago disponibles en la ciudad
// del beneficiario

DataWindowChild ldw_dw
string 	ls_id_city, ls_mode_pay, ls_tmp, ls_modo_pago_default
integer 	li_tot

li_tot = 0
								 		
// Muestra los modos de pago que tienen cubrimiento en la ciudad seleccionada
// y los que no usan cubrimiento y tienen agencias con el modo de pago en el
// pais seleccionado.

ls_id_city = dw_2.GetItemString(dw_2.GetRow(),"id_city_receiver")

//DON (03/24/2015) - ADDED INNER JOIN  ***************************************
//DECLARE MODE_PAY_BRANCH_1 CURSOR FOR   
//SELECT DISTINCT dba.modo_pago_branch.modo_pago 
//FROM dba.branch, dba.cubrimiento_branch, dba.modo_pago_branch 
//WHERE ( dba.cubrimiento_branch.id_branch = dba.branch.id_branch ) 
//and   ( dba.modo_pago_branch.id_branch = dba.branch.id_branch ) and   
//		( dba.branch.id_flag_branch = 'A' ) AND   
//		( dba.cubrimiento_branch.id_city = :ls_id_city) AND   
//		( dba.branch.id_type_branch in ('P','A') ) 
//UNION 
//SELECT DISTINCT dba.modo_pago_branch.modo_pago 
//FROM dba.branch, dba.modo_pago_branch, dba.city, dba.modo_pago
//WHERE ( dba.modo_pago_branch.id_branch = dba.branch.id_branch ) and   
//		( dba.branch.id_flag_branch = 'A' ) AND   
//		( dba.city.id_city = :ls_id_city ) AND
//		( dba.city.id_country = dba.branch.id_country ) AND
//		( dba.branch.id_type_branch in ('P','A') ) AND
//		( dba.modo_pago_branch.modo_pago = dba.modo_pago.id_modo_pago )AND 
//		( dba.modo_pago.use_cubrimiento = 'N');	

DECLARE MODE_PAY_BRANCH_1 CURSOR FOR 	
SELECT DISTINCT dba.modo_pago_branch.modo_pago 
FROM dba.branch	WITH (NOLOCK)
INNER JOIN	dba.cubrimiento_branch WITH (NOLOCK)
ON	( dba.cubrimiento_branch.id_branch = dba.branch.id_branch )
JOIN dba.modo_pago_branch WITH (NOLOCK)
ON	( dba.modo_pago_branch.id_branch = dba.branch.id_branch )
WHERE  	( dba.branch.id_flag_branch = 'A' ) AND   
		( dba.cubrimiento_branch.id_city = :ls_id_city ) AND   
		( dba.branch.id_type_branch in ('P','A') ) 
UNION
SELECT DISTINCT dba.modo_pago_branch.modo_pago 
FROM dba.branch	WITH (NOLOCK)
INNER JOIN dba.modo_pago_branch	WITH (NOLOCK)
ON	( dba.modo_pago_branch.id_branch = dba.branch.id_branch )
JOIN	dba.city	WITH (NOLOCK)
ON	( dba.city.id_country = dba.branch.id_country ) 
JOIN	dba.modo_pago	WITH (NOLOCK)
ON	( dba.modo_pago_branch.modo_pago = dba.modo_pago.id_modo_pago )
WHERE   ( dba.branch.id_flag_branch = 'A' ) AND   
		( dba.city.id_city = :ls_id_city ) AND
		( dba.branch.id_type_branch in ('P','A') ) AND
		( dba.modo_pago.use_cubrimiento = 'N');
//*********************************************************
		
OPEN MODE_PAY_BRANCH_1 ; 

FETCH MODE_PAY_BRANCH_1 INTO :ls_mode_pay ; 

ls_tmp = '(' 

DO WHILE SQLCA.SQLCODE = 0 
	li_tot++ 
	ls_tmp +="'"+trim(ls_mode_pay)+"'"+"," 
	
	if ls_modo_pago_default = '' then
		ls_modo_pago_default = ls_mode_pay
	else
		if ls_mode_pay = 'P' then
			ls_modo_pago_default = 'P'
		end if
	end if	

	FETCH MODE_PAY_BRANCH_1 INTO :ls_mode_pay ; 
LOOP 

If Right(ls_tmp,1) = "," Then 
	ls_tmp=trim(Left(ls_tmp,Len(ls_tmp) - 1))
End If 

ls_tmp += ')' 

dw_2.GetChild('receiver_mode_pay_receiver',ldw_dw) 
ldw_dw.SetTransObject(SQLCA) 

IF li_tot>0 THEN 
	ldw_dw.SetFilter("id_modo_pago in "+ls_tmp) 
	// Aun esta habilitado el modo de pago que se mando por parametro
	if pos(ls_tmp,"'"+(ls_modo_pago_previo)+"'") > 0 then
		ls_modo_pago_default = ls_modo_pago_previo
	end if	
ELSE 
	ldw_dw.SetFilter("id_modo_pago = ''")			
END IF 

ldw_dw.Filter() 

CLOSE MODE_PAY_BRANCH_1; 

dw_2.Object.receiver_mode_pay_receiver[1]= ls_modo_pago_default
end subroutine

public subroutine fn_valcurrency ();// Verifica que el tipo de moneda escogido este disponible en el pais

String ls_current_currency, ls_country
Long ll_count_currency

dw_2.AcceptText()

ls_current_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")
ls_country = dw_2.getitemstring(dw_2.getrow(),"id_country_receiver")

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT COUNT(*)
  INTO :ll_count_currency
  FROM dba.branch	WITH (NOLOCK)
 WHERE dba.branch.id_country = :ls_country
	AND dba.branch.currency_pay_branch = :ls_current_currency
	AND id_type_branch <> 'R'
	AND id_flag_branch = 'A';
//***********************************************************

if ll_count_currency < 1 then

	// La moneda seleccionada no esta disponible,
	// se prueba la moneda inversa.
	if ls_current_currency = 'N' then 
		ls_current_currency = 'D'
	else
		ls_current_currency = 'N'
	end if

	//DON (03/24/2015) - ADDED NOLOCK.  ********************************
	SELECT COUNT(*)
	  INTO :ll_count_currency
	  FROM dba.branch	WITH (NOLOCK)
	 WHERE dba.branch.id_country = :ls_country
		AND dba.branch.currency_pay_branch = :ls_current_currency
		AND id_type_branch <> 'R'
		AND id_flag_branch = 'A';
	//***********************************************************

	if ll_count_currency > 0 then
		// La moneda inversa si esta disponible, se cambia el valor en pantalla
		dw_2.setitem(dw_2.getrow(),"mod_pay_currency",ls_current_currency)		
	end if		

end if
end subroutine

public subroutine fn_refreshscreen (string updatedfield);// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//
// fn_RefreshScreen
//
//	Se encarga de actualizar los dropdowns necesarios cuando la opcion enviada por parametro
// es actualizada. Ej. PAIS -> Refresca DD de Estados y Ciudades
//
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

DataWindowChild ldw_dw
Boolean lb_result
String ls_modo_pago_default, ls_null
String ls_id_country, ls_id_state, ls_id_city, ls_pay_mode

dw_2.AcceptText()

setNull(ls_null)

ls_id_country = dw_2.GetItemString(dw_2.GetRow(),"id_country_receiver")
ls_id_state = dw_2.GetItemString(dw_2.GetRow(),"id_state_receiver")
ls_id_city = dw_2.GetItemString(dw_2.GetRow(),"id_city_receiver")
ls_pay_mode = dw_2.GetItemString(dw_2.GetRow(),"mod_pay_currency")


IF updatedField = "COUNTRY" THEN

	// Limpia la moneda de pago!
	dw_2.setitem(dw_2.getrow(),"mod_pay_currency",'N')

	// Limpia el Pagador!
	dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",'')
	dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",'')
	dw_2.setitem(dw_2.getrow(),"branch_name",'')
	ib_haspayor = false	

	// Actualiza la Lista de Estados!
	dw_2.GetChild("id_state_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	dw_2.SetItem(dw_2.GetRow(),"id_state_receiver","")
	ldw_dw.Retrieve(trim(ls_id_country))
//	ldw_dw.SetFilter("id_country = '"+ls_id_country+"'")
//	ldw_dw.Filter()
	ldw_dw.SetSort("name_state")
	ldw_dw.Sort()

	// Actualiza la Lista de Ciudades!
	dw_2.SetItem(dw_2.GetRow(),"id_city_receiver","")
	dw_2.GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve(trim(ls_id_country), ls_null)	
//	IF dw_2.GetItemString(dw_2.GetRow(),"id_state_receiver") = '' OR IsNull(dw_2.GetItemString(dw_2.GetRow(),"id_state_receiver")) THEN
//		ldw_dw.SetFilter("id_country = '"+ls_id_country+"'")
//	ELSE
//		ldw_dw.SetFilter("id_country = '"+ls_id_country+"' and id_state = '"+dw_2.GetItemString(dw_2.GetRow(),"id_state_receiver")+"'")
//	END IF	
//	ldw_dw.Filter()
	ldw_dw.SetSort("name_city")
	ldw_dw.Sort()			
		
	// Verifica que la moneda selecciona este disponible
	fn_valcurrency()
	
	// .................................................
	// Actualiza el combo de modos de pago
	ls_modo_pago_default = dw_2.GetItemString(dw_2.GetRow(),"receiver_mode_pay_receiver")
	fn_fillmodopago(ls_modo_pago_default)
	// .................................................			
	
END IF


if updatedField = "STATE" then
	
	// Limpia el Pagador!
	dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",'')
	dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",'')
	dw_2.setitem(dw_2.getrow(),"branch_name",'')
	ib_haspayor = false	
	
	// Actualiza la Lista de Ciudades!
	dw_2.SetItem(dw_2.GetRow(),"id_city_receiver","")
	dw_2.GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve(trim(ls_id_country), trim(ls_id_state))
//	ldw_dw.SetFilter("id_country = '"+dw_2.GetItemString(dw_2.GetRow(),"id_country_receiver")+"' and id_state = '"+ls_id_state+"'")
//	ldw_dw.Filter()
	ldw_dw.SetSort("name_city")
	ldw_dw.Sort()
	
end if


if updatedField = "CITY" then

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// Verifica que el pagador de la orden anterior aun es valido
	// Si no es Valido blanquea los campos
	lb_result = fn_valida_pagador(true)
	
	if not lb_result then
		dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",'')
		dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",'')
		dw_2.setitem(dw_2.getrow(),"branch_name",'')
		ib_haspayor = false
	end if	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	
		
	// Selecciona el estado para la ciudad seleccionada
  	DECLARE sp_seleccionar_id_estado PROCEDURE FOR dba.sp_seleccionar_id_estado @codigo_country = :ls_id_country , @codigo_city = :ls_id_city;
		
	EXECUTE sp_seleccionar_id_estado; 

	if SQLCA.sqlcode = 0 then
		FETCH sp_seleccionar_id_estado  Into :ls_id_state;
		CLOSE sp_seleccionar_id_estado; 
	elseif SQLCA.sqlcode = -1 then
		messagebox("Error (sp_seleccionar_id_estado)","Error buscando el estado",StopSign!)
	end if

	dw_2.SetItem(dw_2.GetRow(),"id_state_receiver",ls_id_state)
	
	// .................................................
	// Actualiza el combo de modos de pago
	//ls_modo_pago_default = ''
	ls_modo_pago_default = dw_2.GetItemString(dw_2.GetRow(),"receiver_mode_pay_receiver")
	fn_fillmodopago(ls_modo_pago_default)
	// .................................................	

end if


if updatedField = "PAYMODE" then

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// Verifica que el pagador aun es valido
	// Si no es Valido blanquea los campos
	lb_result = fn_valida_pagador(true)
	
	if not lb_result then
		dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",'')
		dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",'')
		dw_2.setitem(dw_2.getrow(),"branch_name",'')
		ib_haspayor = false
	end if	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	if ls_pay_mode <> 'C' and ls_pay_mode <> 'N' and ls_pay_mode <> 'T' then			
		dw_2.setitem(dw_2.getrow(),"acc_receiver",'')
		dw_2.setitem(dw_2.getrow(),"bank_receiver",'')		
	end if
	
end if


if updatedField = "CURRENCY" then

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// Verifica que el pagador aun es valido
	// Si no es Valido blanquea los campos	
	lb_result = fn_valida_pagador(true)	
	if not lb_result then
		dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",'')
		dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",'')
		dw_2.setitem(dw_2.getrow(),"branch_name",'')
		ib_haspayor = false
	end if	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
end if
end subroutine

protected function boolean fn_validapayerlimit (double pd_orderfacevalue, double pd_ordertotalvalue, double pd_orderamounttopay, string ps_ordercurrencytopay, string ps_idpayer, string ps_idcountry, string ps_paymode, string ps_idsenderstate);// Returns 	TRUE if the order pass the PAYER-COUNTRY limits
// 			FALSE if the order does not pass the limits

Boolean	lb_result
String	ls_limit_id,ls_limit_payer,ls_limit_country,ls_limit_currency,ls_limit_paymode,ls_limit_message,ls_limit_message_tittle,ls_limit_block, ls_limit_source_state
Double	ld_limit_amount, ld_amountToCheck
Long 		ll_limit_field

///////Messagebox("",string(pd_orderfacevalue)+"/"+string(pd_ordertotalvalue)+"/"+string(pd_orderamounttopay)+"/"+ps_ordercurrencytopay+"/"+ps_idpayer+"/"+ps_idcountry)

lb_result = true

 DECLARE CUR_PAYER_LIMIT CURSOR FOR  
  SELECT dba.RECEIVER_LIMIT.LIMIT_ID,   
         dba.RECEIVER_LIMIT.LIMIT_PAYER,   
         dba.RECEIVER_LIMIT.LIMIT_COUNTRY,   
         dba.RECEIVER_LIMIT.LIMIT_FIELD,   
         dba.RECEIVER_LIMIT.LIMIT_AMOUNT,   
         dba.RECEIVER_LIMIT.LIMIT_CURRENCY,
			dba.RECEIVER_LIMIT.LIMIT_PAYMODE,
         dba.RECEIVER_LIMIT.LIMIT_MESSAGE,
			dba.RECEIVER_LIMIT.LIMIT_MESSAGE_TITTLE,
         dba.RECEIVER_LIMIT.LIMIT_BLOCK,
			dba.RECEIVER_LIMIT.LIMIT_SOURCE_STATE			
    FROM dba.RECEIVER_LIMIT  
ORDER BY dba.RECEIVER_LIMIT.LIMIT_BLOCK DESC, dba.RECEIVER_LIMIT.LIMIT_ID ASC;

OPEN CUR_PAYER_LIMIT;

FETCH CUR_PAYER_LIMIT INTO :ls_limit_id, :ls_limit_payer,:ls_limit_country, :ll_limit_field, :ld_limit_amount, :ls_limit_currency, :ls_limit_paymode, :ls_limit_message, :ls_limit_message_tittle, :ls_limit_block, :ls_limit_source_state;

DO WHILE SQLCA.SQLCODE = 0 AND lb_result
	
	// Si el pagador es el mismo o la restriccion es para todos los pagadores
	if ls_limit_payer = ps_idpayer or isnull(ls_limit_payer) then	
		
		// Si el pais es el mismo o la restriccion es para todos los paises
		if ls_limit_country = ps_idcountry or isnull(ls_limit_country) then
			
			// Si el estado Origen es el mismo o la restriccion es para todos los estados
			if ls_limit_source_state = ps_idsenderstate or isnull(ls_limit_source_state) then			
			
				// Si el modo de pago es el mismo
				if ps_paymode = ls_limit_paymode then
				
					// Si la moneda es la misma (NACIONAL/DOLLAR)
					if ps_ordercurrencytopay = ls_limit_currency then
				
						// Revisa por cual de los valores es el limite (1:OrderFace u$, 2:Order+Comm u$, 3:AmountToBePaid u$ or NAT)
						if ll_limit_field = 1 then						
							ld_amountToCheck = pd_orderfacevalue
						elseif ll_limit_field = 2 then
							ld_amountToCheck = pd_ordertotalvalue					
						elseif ll_limit_field = 3 then
							ld_amountToCheck = pd_orderamounttopay
						else
							// Error en el campo ll_limit_field 
							ld_amountToCheck = 0
						end if
										
						// Chequeo del Limite y Despliegue del Mensaje
						if ld_amountToCheck >= ld_limit_amount then
						
							// Si el Limite tiene bloqueo
							if ls_limit_block = 'Y' then
								MessageBox(ls_limit_message_tittle,ls_limit_message,StopSign!)
								lb_result = false						
							else
								MessageBox(ls_limit_message_tittle,ls_limit_message,Exclamation!)
							end if				
						
						end if	
						
					end if								

				end if

			end if

		end if				
		
	end if

	FETCH CUR_PAYER_LIMIT INTO :ls_limit_id, :ls_limit_payer,:ls_limit_country, :ll_limit_field, :ld_limit_amount, :ls_limit_currency, :ls_limit_paymode, :ls_limit_message, :ls_limit_message_tittle, :ls_limit_block, :ls_limit_source_state;
	
LOOP

CLOSE CUR_PAYER_LIMIT;

return lb_result
end function

protected function boolean fn_validapoplimit (double pd_orderamounttopay, string ps_ordercurrencytopay, string ps_idbranchpay);
// Returns 	TRUE if the order pass the POP limits
// 				FALSE if the order does not pass the limits

Boolean	lb_result
Double 	ld_limit
String 	ls_message

lb_result = true

ld_limit = -1

SELECT MIN(AMOUNT)
INTO :ld_limit
FROM dba.POP_LIMIT
WHERE ID_BRANCH = :ps_idbranchpay
AND MOD_PAY_CURRENCY = :ps_ordercurrencytopay;

IF ld_limit > 0 and pd_orderamounttopay > ld_limit THEN
	
	ls_message = 'Este envio supera el límite del punto de pago '
	if ps_ordercurrencytopay = 'D' then
		ls_message = ls_message+' en DOLARES: $'
	else
		ls_message = ls_message+' es MONEDA LOCAL: $'
	end if
		ls_message = ls_message+string(ld_limit,"###,##0.00")
	
	MessageBox('Limite Punto de Pago',ls_message,StopSign!)
	lb_result = false
END IF


return lb_result
end function

public subroutine fn_update_balance ();
Double ld_creditlimit, ld_balance, ld_oustanding, ld_last_invoice, ld_creditlimit_wknd, ld_intransit
STRING	ls_id_main_branch

ld_creditlimit = 0 
ld_creditlimit_wknd = 0
ld_balance = 0
ld_oustanding = 0
ld_last_invoice = 0
id_availablebalance = 0

//SELECT DBA.group_branch.debt_limit, DBA.group_branch.debt_limit_wknd, dba.sfGetSafeonTransit(dba.GROUP_BRANCH.ID_MAIN_BRANCH)
//  INTO :ld_creditlimit, :ld_creditlimit_wknd, :ld_intransit
//  FROM dba.group_branch, dba.branch 
// WHERE dba.branch.id_main_branch = dba.group_branch.id_main_branch 
//	AND dba.branch.id_branch = :Is_branch_insta;
//
//if isnull(ld_creditlimit) then  ld_creditlimit = 0
//if isnull(ld_creditlimit_wknd) then ld_creditlimit_wknd = ld_creditlimit
//if isnull(ld_intransit) then ld_intransit = 0
//
//
//// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Credito de fin de semana es de sabado medianoche a martes 1pm
//if upper(mid(DayName(today()),1,2)) = 'SA' or upper(mid(DayName(today()),1,2)) = 'SU' or upper(mid(DayName(today()),1,2)) = 'MO' then
//	ld_creditlimit = ld_creditlimit_wknd
//end if
//
//if upper(mid(DayName(today()),1,2)) = 'TU' and Now() < time('13:00:00') then
//	ld_creditlimit = ld_creditlimit_wknd
//end if
//// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//SELECT Sum(dba.transaccion_diaria_payee.credit_trans_diaria) - Sum(dba.transaccion_diaria_payee.debit_trans_diaria)  
//  INTO :ld_balance  
//  FROM dba.transaccion_diaria_payee,   
//		 dba.branch  
// WHERE id_group_trans_diaria = dba.branch.id_main_branch 	
//   AND dba.transaccion_diaria_payee.id_concepto_contable <> 'CPC'
//	AND dba.transaccion_diaria_payee.id_concepto_contable <> 'PB'
//	AND dba.branch.id_branch = :Is_branch_insta;
//
//if isnull(ld_balance) then  ld_balance = 0
//
//if ld_intransit > 0 then 
//	ld_balance = ld_balance + ld_intransit
//end if
//
//SELECT MAX(dba.relacion_invoices_payee.id_receiver)  
//  INTO :ld_last_invoice  
//  FROM dba.relacion_invoices_payee  
// WHERE dba.relacion_invoices_payee.id_branch_invoice = :Is_branch_insta;
//
//if isnull(ld_last_invoice) then ld_last_invoice = 0
//
//SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.exchange_company)  
//  INTO :ld_oustanding  
//  FROM dba.receiver  
// WHERE dba.receiver.id_branch = :Is_branch_insta 
//	AND dba.receiver.id_receiver > :ld_last_invoice;
//
//if isnull(ld_oustanding) then ld_oustanding = 0
//
//id_availablebalance = ld_creditlimit + ld_balance - ld_oustanding

//DON (03/24/2015) - PERFORMANCE TUNE.  ********************************************
SELECT id_main_branch INTO :ls_id_main_branch
FROM		dba.branch WITH (NOLOCK)
WHERE 	dba.branch.id_branch = :Is_branch_insta;

DECLARE  Avail_Credit_Cur CURSOR FOR
SELECT dba.sfCalAvailableCredit(:ls_id_main_branch);

OPEN Avail_Credit_Cur;

FETCH NEXT Avail_Credit_Cur INTO :id_availablebalance;

CLOSE Avail_Credit_Cur;
//**************************************************************************

em_balance.text = string(id_availablebalance)




end subroutine

public function decimal fn_getstatetax (string ps_id_branch, decimal pd_amount);// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// TAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAX

// Calculates State Taxes

decimal ld_tax

//DON (03/24/2015) - ADDED NOLOCK.  ********************************
SELECT ISNULL(:pd_amount * PERCENTAGE, 0) + ISNULL(FIX, 0)
INTO :ld_tax
FROM dba.state_tax
INNER JOIN	dba.branch	WITH (NOLOCK)
ON		dba.branch.id_state = dba.state_tax.id_state
WHERE 	dba.branch.id_branch = :ps_id_branch
			AND range_begin <= :pd_amount
			AND range_end >= :pd_amount;
//***********************************************************

if isnull(ld_tax) then 
	ld_tax = 0
else
	ld_tax = round(ld_tax,2)	
end if

return ld_tax

// TAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAXTAX
// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
end function

public subroutine fn_calhandling ();
double ld_handling
integer ld_receiptto


// Determines the HANDLING for special agencies as:
// A00788 : Viaemricas Call Center (Phone Orders) $1.50 Extra
// A00003 and A00788 : When Home Receipt - $1.00 Extra


gs_branch_insta = is_branch_insta


if gs_branch_insta = 'A00788' or gs_branch_insta = 'A00003' then

	ld_handling = dw_2.getitemnumber(dw_2.getrow(),"handling_receiver")
	
	if isnull(ld_handling) then ld_handling = 0
	
	if ld_handling <> 0 then
		// si ya tiene un handling dejamos el que tiene
		return
	end if
	
	// La A00788 tiene un cargo extra de 1.5 por el ACH
	if gs_branch_insta = 'A00788' then ld_handling = 1.5
	
	ld_receiptto =  dw_1.getitemnumber(dw_1.getrow(),"receiptto")
	
	// Cuando hay Home receipt se carga 1 extra.
	if ld_receiptto = 2 or ld_receiptto = 3 then
		ld_handling = ld_handling + 1
	end if

	dw_2.setitem(dw_2.getrow(),"handling_receiver",ld_handling)

end if


return

end subroutine

public subroutine fn_displayaddressverification2 ();
// reads a responsed from ggl geocoding V3
//http://code.google.com/apis/maps/documentation/geocoding/

String ls_address, ls_state, ls_city, ls_zip
String ls_cur_address, ls_cur_state, ls_cur_city, ls_cur_zip, ls_result
Boolean lb_isvalidaddress
Long ll_validresponses

ls_cur_address = dw_1.getitemstring(dw_1.getrow(),"addres_sender")
ls_cur_state = dw_1.getitemstring(dw_1.getrow(),"state_sender")
ls_cur_city = dw_1.getitemstring(dw_1.getrow(),"city_sender")
ls_cur_zip = string(dw_1.getitemnumber(dw_1.getrow(),"zip_sender"))	

if len(ls_cur_zip) = 4 then ls_cur_zip = '0' + ls_cur_zip



DECLARE spValAddressGOOGSender PROCEDURE FOR dba.spValAddressGOOGSender
 @street_address = :ls_cur_address,
 @city_name = :ls_cur_city,
 @state_sender = :ls_cur_state,
 @zip_sender = :ls_cur_zip;

Execute spValAddressGOOGSender; 

if SQLCA.sqlcode = 0 then	
	Fetch spValAddressGOOGSender INTO :ls_result;
else
	Messagebox("Error","Error Validating Address ["+String(SQLCA.sqlcode)+"-"+SQLCA.SQLerrtext+"]" ,StopSign!)
	return
end if

Close spValAddressGOOGSender;



//dw_address.ImportString  (ls_result) 

// http://code.google.com/apis/maps/documentation/services.html#Geocoding_Direct

dw_address.reset()

// Si la direccion fue interpretada correctamente la respuesta es OK
if fn_xmlgettag(ls_result,"STATUS",1) <> 'OK' then
		
// =====================================================================================
// The "status" field within the Geocoding response object contains the status of the request, 
// and may contain debugging information to help you track down why Geocoding is not working. 
// The "status" field may contain the following values:
//
//   - 	"OK" indicates that no errors occurred; the address was successfully parsed and at least one geocode was returned.
//   - 	"ZERO_RESULTS" 	indicates that the geocode was successful but returned no results. 
//								This may occur if the geocode was passed a non-existent address or a latlng in a remote location.
//   -	"OVER_QUERY_LIMIT" indicates that you are over your quota.
//   - 	"REQUEST_DENIED" 	indicates that your request was denied, 
//									generally because of lack of a sensor parameter.
//   - 	"INVALID_REQUEST" generally indicates that the query (address or latlng) is missing.		
//
// =====================================================================================


		// PARSING FAILED!!!
		
		// ############################################################
		// Values for add_bitmap_sender are:
		// AV:V?: Verified waiting selection 
		// AV:VA: Verified accepted (by system or user)
		// AV:KC: Keep current (Unverified)
		// AV:NF: Not Similar Address Found (will ask before save and will change to AV:KC)
		// AV:IA: Invalid Address (will ask before save the record)		
		// OTHER: Address to be verified
		// ############################################################
		dw_1.setitem(dw_1.getrow(),"add_bitmap_sender","AV:IA")		
		
else		

	long ll_responses, ll_i, ll_row, ll_address_componets, ll_j
	string ls_placemark, ls_responsetype
	string ls_sug_address_number, ls_sug_address, ls_sug_state, ls_sug_city, ls_sug_zip, ls_sug_formated_add, ls_component, ls_address_apt
	
	lb_isvalidaddress = false

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// inserta la direccion Actual
	ll_row = dw_address.insertrow(0)						
	
	dw_address.setitem(ll_row,"x","*CURRENT*")								
	dw_address.setitem(ll_row,"y","")
	
	dw_address.setitem(ll_row,"state",ls_cur_state)
	dw_address.setitem(ll_row,"city",ls_cur_city)
	dw_address.setitem(ll_row,"zipcode",ls_cur_zip)
	dw_address.setitem(ll_row,"street",ls_cur_address)	
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	ll_responses = fn_xmlcounttag(ls_result,"RESULT")
	
	
//fn_addlog("(DEBUG) pfc_sender, display address, result: "+ls_result)	

	ll_validresponses = 0

	
	for ll_i = 1 to ll_responses
		
		ls_placemark = fn_xmlgettag(ls_result,"RESULT",ll_i)		
		
//fn_addlog("(DEBUG) pfc_sender, display address, PLACEMARK: "+string(ll_i)+' '+ls_placemark)			

		//The following types are supported and returned by the HTTP Geocoder:
		//street_address indicates a precise street address.
		//route indicates a named route (such as "US 101").
		//intersection indicates a major intersection, usually of two major roads.
		//political indicates a political entity. Usually, this type indicates a polygon of some civil administration.
		//country indicates the national political entity, and is typically the highest order type returned by the Geocoder.
		//administrative_area_level_1 indicates a first-order civil entity below the country level. Within the United States, these administrative levels are states. Not all nations exhibit these administrative levels.
		//administrative_area_level_2 indicates a second-order civil entity below the country level. Within the United States, these administrative levels are counties. Not all nations exhibit these administrative levels.
		//administrative_area_level_3 indicates a third-order civil entity below the country level. This type indicates a minor civil division. Not all nations exhibit these administrative levels.
		//colloquial_area indicates a commonly-used alternative name for the entity.
		//locality indicates an incorporated city or town political entity.
		//sublocality indicates an first-order civil entity below a locality
		//neighborhood indicates a named neighborhood
		//premise indicates a named location, usually a building or collection of buildings with a common name
		//subpremise indicates a first-order entity below a named location, usually a singular building within a collection of buildings with a common name
		//postal_code indicates a postal code as used to address postal mail within the country.
		//natural_feature indicates a prominent natural feature.
		//airport indicates an airport.
		//park indicates a named park.
		//point_of_interest indicates a named point of interest. Typically, these "POI"s are prominent local entities that don't easily fit in another category such as "Empire State Building" or "Statue of Liberty."

		ls_responsetype = fn_xmlgettag(ls_placemark,"TYPE",1)
		
		
		// es una buena precision
		if ls_responsetype = 'STREET_ADDRESS' or ls_responsetype = 'SUBPREMISE' then
			

			// :":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":"
			// separates the result parts
			ls_sug_address_number = ""
			ls_sug_address = ""
			ls_sug_state = ""
			ls_sug_city = ""
			ls_sug_zip = ""
			ls_sug_formated_add = ""
			ls_address_apt = ""			
			
			ls_sug_formated_add = fn_xmlgettag(ls_placemark,"FORMATTED_ADDRESS",1)
			
			ll_address_componets = fn_xmlcounttag(ls_placemark,"ADDRESS_COMPONENT")
	

			for ll_j = 1 to ll_address_componets
			
				ls_component = fn_xmlgettag(ls_placemark,"ADDRESS_COMPONENT",ll_j)		

//fn_addlog("(DEBUG) pfc_sender, display address, COMPONENT: "+string(ll_j)+' '+ls_component)		

				// APT
				if (fn_xmlgettag(ls_component,"TYPE",1) = 'SUBPREMISE') or (fn_xmlgettag(ls_component,"TYPE",2)= 'SUBPREMISE') then
					ls_address_apt = fn_xmlgettag(ls_component,"LONG_NAME",1)
				end if

				// Address street number
				if (fn_xmlgettag(ls_component,"TYPE",1) = 'STREET_NUMBER') or (fn_xmlgettag(ls_component,"TYPE",2)= 'STREET_NUMBER') then
					ls_sug_address_number = fn_xmlgettag(ls_component,"LONG_NAME",1)
				end if
						
				// Address street
				if (fn_xmlgettag(ls_component,"TYPE",1) = 'ROUTE') or (fn_xmlgettag(ls_component,"type",2)= 'ROUTE') then
					ls_sug_address = fn_xmlgettag(ls_component,"LONG_NAME",1)
				end if			
							
				// State
				if (fn_xmlgettag(ls_component,"TYPE",1) = 'ADMINISTRATIVE_AREA_LEVEL_1') or (fn_xmlgettag(ls_component,"TYPE",2)= 'ADMINISTRATIVE_AREA_LEVEL_1') then
					ls_sug_state = fn_xmlgettag(ls_component,"SHORT_NAME",1)
				end if	

				// City
				if (fn_xmlgettag(ls_component,"TYPE",1) = 'LOCALITY') or (fn_xmlgettag(ls_component,"TYPE",2)= 'LOCALITY') then

					if ls_sug_city = "" then
						ls_sug_city = fn_xmlgettag(ls_component,"LONG_NAME",1)
					else // in case the address has more than one locality, replaces the first locality when the new locality is inlcuded in the formatted_address
						
						if POS(fn_xmlgettag(ls_component,"LONG_NAME",1),ls_sug_formated_add)> 1 then
							// if it is included replaces the old zipcode, if not, keep the old
							ls_sug_city = fn_xmlgettag(ls_component,"LONG_NAME",1)						
						end if						
						
					end if										
					
				end if	
				
				// Zip
				if (fn_xmlgettag(ls_component,"TYPE",1) = 'POSTAL_CODE') or (fn_xmlgettag(ls_component,"TYPE",2)= 'POSTAL_CODE') then

					
					if ls_sug_zip = "" then
						ls_sug_zip = fn_xmlgettag(ls_component,"SHORT_NAME",1)
					else // some address have more than 1 zipcode! why? not idea!
						
						// validates if the new postal_code is included on the formatted_address
						if POS(fn_xmlgettag(ls_component,"SHORT_NAME",1),ls_sug_formated_add)> 1 then
							// if it is included replaces the old zipcode, if not, keep the old
							ls_sug_zip = fn_xmlgettag(ls_component,"SHORT_NAME",1)							
						end if
						
						
					end if					
						
				end if								
						
			next 
			
			// concatenates the number to the street
			ls_sug_address = trim(ls_sug_address_number) +' '+ trim(ls_sug_address)
			
			if ls_address_apt <> '' then ls_sug_address = ls_sug_address + ' #' +ls_address_apt
			
			// separates the result parts			
			// :":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":":"
			
			
//fn_addlog("(DEBUG) pfc_sender, display address, ls_sug_address_number: "+ls_sug_address_number)				
//fn_addlog("(DEBUG) pfc_sender, display address, ls_sug_address: "+ls_sug_address)				
//fn_addlog("(DEBUG) pfc_sender, display address, ls_sug_state: "+ls_sug_state)				
//fn_addlog("(DEBUG) pfc_sender, display address, ls_sug_city: "+ls_sug_city)				
//fn_addlog("(DEBUG) pfc_sender, display address, ls_sug_zip: "+ls_sug_zip)				
			
			
			if ls_sug_address_number <> "" and ls_sug_address <> "" and ls_sug_state <> "" and ls_sug_city <> "" and	ls_sug_zip <> "" then

				ll_validresponses = ll_validresponses + 1				
	
				// Verifica si es igual a la actual
				if ls_sug_address = ls_cur_address AND &
					ls_sug_state = ls_cur_state  AND &
					ls_sug_city = ls_cur_city  AND &
					ls_sug_zip = ls_cur_zip then
					
					lb_isvalidaddress = true
					
				else
					// Si no es igual inserta la opcion
					
					ll_row = dw_address.insertrow(0)						
					
					dw_address.setitem(ll_row,"x",ls_sug_formated_add)								
					dw_address.setitem(ll_row,"y",ls_result)
					
					dw_address.setitem(ll_row,"state",ls_sug_state)
					dw_address.setitem(ll_row,"city",ls_sug_city)
					dw_address.setitem(ll_row,"zipcode",ls_sug_zip)
					dw_address.setitem(ll_row,"street",ls_sug_address)						
				
				end if			
			
			
			end if
		
		end if
		
	next 


//fn_addlog("(DEBUG) pfc_sender, display address, variables: "+String(ll_validresponses)+' ' + String(lb_isvalidaddress))	



	// Cuando hay almenos una sugerida y la actual no es valida:
	if ll_validresponses > 0 and not lb_isvalidaddress then	

		// ############################################################
		// Values for add_bitmap_sender are:
		// AV:V?: Verified waiting selection 
		// AV:VA: Verified accepted (by system or user)
		// AV:KC: Keep current (Unverified)
		// AV:NF: Not Similar Address Found (will ask before save and will change to AV:KC)
		// AV:IA: Invalid Address (will ask before save the record)		
		// OTHER: Address to be verified
		// ############################################################
		dw_1.setitem(dw_1.getrow(),"add_bitmap_sender","AV:V?")
		
	end if


	// Cuando no hay sugeridas y la actual no es valida:
	if ll_validresponses = 0 and not lb_isvalidaddress then	

//fn_addlog("(DEBUG) pfc_sender, display address, result: "+"[ll_validresponses = 0 and not lb_isvalidaddress]")

		dw_1.setitem(dw_1.getrow(),"add_bitmap_sender","AV:NF")
		
	end if
	

	if lb_isvalidaddress = true then
		
		// ############################################################
		// Values for add_bitmap_sender are:
		// AV:V?: Verified waiting selection 
		// AV:VA: Verified accepted (by system or user)
		// AV:KC: Keep current (Unverified)
		// AV:NF: Not Similar Address Found (will ask before save and will change to AV:KC)
		// AV:IA: Invalid Address (will ask before save the record)		
		// OTHER: Address to be verified
		// ############################################################
		dw_1.setitem(dw_1.getrow(),"add_bitmap_sender","AV:VA")
//p_isvalid.visible = true
			
		// The Window is not displayed
		dw_address.reset()
		
	end if
	
end if


//Retrieve the entire state of the DataStore, including the DataWindow object specification, 
//the data buffers, and the status flags.
//dw_address.getfullstate( lblb_data)

end subroutine

public function stru_parametros wf_procesar_mensajes (string ps_respuesta);STRU_PARAMETROS stru_parametros
LONG  l_fila = 1

stru_parametros.String[l_fila]  = fn_token(ps_respuesta,";",l_fila)
		
DO WHILE Len(stru_parametros.String[l_fila])> 0
	l_fila++
	stru_parametros.String[l_fila]  = fn_token(ps_respuesta,";",l_fila)	
LOOP

stru_parametros.String[1] = mid(stru_parametros.String[1] ,Pos(ps_respuesta,'|')+1)

RETURN stru_parametros
end function

public subroutine wf_sendcompasscompliance (string ps_branch, long pl_receiver) throws exception;STRU_PARAMETROS stru_parametros
STRING s_result, s_response, s_sn_compass =  'S'
BOOLEAN b_reintentar, b_resultado

LONG ll_status, l_reintentos = 1


n_exception dis_error
OLEObject PBObject 

//PBObject = Create OLEObject 
//dis_error = Create n_exception


//ll_status = PBObject.ConnectToNewObject ("SendCompassCompliance.CreateTxItem") 
//
//
//IF ll_status <> 0 THEN 
//	dis_error.SetMessage("There was not communication with the compliance service. Error:" +  String(ll_status))	
//ELSE 
//		
//
//
//	SELECT A.stringvalue
//	INTO :s_sn_compass
//	FROM dba.PARAMETERS A
//	WHERE A.idparameter = 'IsCompasRedPhone';
//	
//
//	IF s_sn_compass = 'N' THEN
//		
//							
//		b_resultado = PBObject.SendtoTempCompass(ps_branch, pl_receiver)   
//		
//	ELSE
//	
//	
//	
//		DO 
//			s_response = PBObject.SendInformationCompass (ps_branch, pl_receiver) 
//	//		s_response ="Error|There was not communication with the compliance service, please contact the compliance department."
//	//		s_response = "Success| Limit/Tx. - $950 or more to Culiacan. Review.;Destination City - $950 Or More Sent to Culiacan;Sanctions List Hit;OFAC (OSAMA BIN LADEN)"
//		
//			s_result  = fn_token(s_response,"|",1)
//			
//			IF s_result = "Success" THEN
//				
//				stru_parametros =wf_procesar_mensajes(s_response)		
//				b_reintentar = FALSE
//			
//			ELSE
//				
//				IF s_result = 'Error' THEN
//					
//					IF l_reintentos <3 THEN
//						b_reintentar = TRUE
//						l_reintentos ++
//					ELSE
//						b_reintentar = FALSE
//						stru_parametros =wf_procesar_mensajes(s_response)	
//						
//						b_resultado = PBObject.SendtoTempCompass(ps_branch, pl_receiver)   
//						
//					END IF
//					
//				END IF
//				
//			END IF	
//		
//		LOOP WHILE b_reintentar	
//		
//	END IF
//	
//	PBObject.DisconnectObject( ) 
//	DESTROY PBObject 
//
//END IF 

LONG l_position

l_position = UpperBound(stru_parametros.string)

IF  l_position = 0 THEN
	l_position = 1
END IF

stru_parametros.string[l_position ] = ps_branch+'*'+string(pl_receiver)
	
OpenWithParm(w_pfc_sender_motivoshold,stru_parametros)

end subroutine

public function string fn_get_branch_name (string as_branch_id);string ls_branch_name

SELECT name_branch
INTO  :ls_branch_name
FROM dba.branch
WHERE id_branch = :as_branch_id;

return ls_branch_name
end function

public subroutine fn_habilitar_campos (string as_branch);string ls_branch, ls_direct_agencies, ls_color, ls_protect
long ll_i, ll_len
integer li_nro
boolean lb_habilitar

SELECT stringlargevalue
INTO  :ls_direct_agencies
FROM dba.PARAMETERS
WHERE idparameter = 'DirectAgencies';

lb_habilitar = false

If right(ls_direct_agencies,1) <> "|" then ls_direct_agencies += "|"

for ll_i = 1 to len(ls_direct_agencies) + li_nro
	ls_branch = left(ls_direct_agencies,pos(ls_direct_agencies,"|") - 1)
	ls_direct_agencies = replace(ls_direct_agencies,1,len(ls_branch)+1,"")
	li_nro++
	
	IF ls_branch = as_branch THEN 
		lb_habilitar = true
		exit
	END IF
Next

dw_1.object.t_email_sender.visible = lb_habilitar
dw_1.object.email_sender.visible = lb_habilitar
dw_1.object.t_receip_to.visible = lb_habilitar
dw_1.object.receiptto.visible = lb_habilitar

dw_1.object.sen_paymenttype.visible = lb_habilitar
dw_1.object.t_pmt.visible = lb_habilitar
cb_paymode.visible = lb_habilitar

ls_protect = '1'
ls_color='12632256'

IF lb_habilitar THEN
	ls_protect = '0'
	ls_color='16777215'
END IF

dw_2.Modify("handling_receiver.Protect="+ls_protect)
dw_2.Modify("handling_receiver.background.color="+ls_color)


end subroutine

public subroutine fn_get_receiver ();String		ls_address, ls_flag_place, &
			ls_name_receiver, &
			ls_bank, &
			ls_account, &
			ls_modo_pago, &
			ls_corresponsal, &
			ls_main_branch, &
			ls_email_receiver,	&
			ls_currency_receiver

			
String	ls_phone1, ls_phone2, ls_zip, ls_country_rec, ls_city_rec, ls_state_rec

String 	ls_rec_fname, ls_rec_mname, ls_rec_lname, ls_rec_slname
String 	ls_typeid, ls_numid
String  ls_return_receiver, ls_sel_branch_receiver


Double		 ld_receiver, ld_receiver_unique

DataWindowChild	ldw_cdw


/////////////////////////////////////////////////////////////////////////////////////////
// Trae los Receiver del Sender Seleccionado
Openwithparm(w_busca_nombre_receiver,"%%")

ls_return_receiver = message.StringParm
	
ls_sel_branch_receiver = fn_token(ls_return_receiver,'*',1)
ld_receiver = double(fn_token(ls_return_receiver,'*',2))			
	
if ls_return_receiver <> '-NONE-' Then
	//DON (04/08/2015) - PERFORMANCE TUNE AND ADDED ID_MAIN_BRANCH_SENT AND REMOVED
	//BRANCH TABLE FROM JOIN.
	SELECT name_receiver,
			 address_receiver,
			 phone1_receiver,   
			 phone2_receiver,
			 zip_receiver,
			 bank_receiver,
			 acc_receiver,
			 mode_pay_receiver,
			 branch_pay_receiver, 
			 id_city_receiver, 
			 id_state_receiver, 
			 id_country_receiver,
			 ID_MAIN_BRANCH_SENT,
			 rec_fname,
			 rec_mname,
			 rec_lname,
			 rec_slname,
			 email_receiver,
			 typeid, 
			 numid,
			 id_receiver_unique,
			 mod_pay_currency
	INTO 	:ls_name_receiver,
			:ls_address,
			:ls_phone1,   
			:ls_phone2,
			:ls_zip,
			:ls_bank,
			:ls_account,
			:ls_modo_pago,
			:ls_corresponsal, 
			:ls_city_rec, 
			:ls_state_rec, 
			:ls_country_rec, 
			:ls_main_branch,
			:ls_rec_fname,
			:ls_rec_mname,
			:ls_rec_lname,
			:ls_rec_slname,
			:ls_email_receiver,
			:ls_typeid, 
			:ls_numid,
			:ld_receiver_unique,
			:ls_currency_receiver
	 FROM 	dba.receiver		WITH	(NOLOCK)
//INNER JOIN	dba.branch	WITH (NOLOCK)
//ON		dba.branch.id_branch   = branch_pay_receiver
	WHERE 	id_receiver = :ld_receiver
			AND dba.receiver.id_branch   = :ls_sel_branch_receiver;
//*************************************************************



	if isnull(ld_receiver_unique) or ld_receiver_unique = 0 then ld_receiver_unique = ld_receiver

	is_branch_ultimo = ls_corresponsal
				
	if sqlca.sqlcode < 0 then
		//messagebox("Error","Error Seleccionando Datos del Receiver")
		Messagebox("Error","Error Selecting Receiver Data",Exclamation!)
	else
		dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",ls_main_branch)
		dw_2.setitem(dw_2.getrow(),"name_receiver",ls_name_receiver)
		dw_2.setitem(dw_2.getrow(),"address_receiver",ls_address)
		dw_2.setitem(dw_2.getrow(),13,ls_phone1)
		dw_2.setitem(dw_2.getrow(),14,ls_phone2)
		dw_2.setitem(dw_2.getrow(),15,ls_zip)
		dw_2.setitem(dw_2.getrow(),"receiver_mode_pay_receiver",left(ls_modo_pago,1))
		dw_2.setitem(dw_2.getrow(),"acc_receiver",ls_account)
		dw_2.setitem(dw_2.getrow(),"bank_receiver",ls_bank)
		dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",ls_corresponsal)
		dw_2.setitem(dw_2.getrow(),"branch_name",fn_get_branch_name(ls_corresponsal))
		dw_2.setitem(dw_2.getrow(),"receiver_rec_fname",ls_rec_fname)
		dw_2.setitem(dw_2.getrow(),"receiver_rec_mname",ls_rec_mname)
		dw_2.setitem(dw_2.getrow(),"receiver_rec_lname",ls_rec_lname)
		dw_2.setitem(dw_2.getrow(),"receiver_rec_slname",ls_rec_slname)
		dw_2.setitem(dw_2.getrow(),"receiver_id_receiver_unique",ld_receiver_unique)
		dw_2.setitem(dw_2.getrow(),"receiver_email_receiver",ls_email_receiver)					
		dw_2.setitem(dw_2.getrow(),"receiver_typeid",ls_typeid)
		dw_2.setitem(dw_2.getrow(),"receiver_numid",ls_numid)
		dw_2.setitem(dw_2.getrow(),"mod_pay_currency",ls_currency_receiver)					

		ls_flag_place = ""
		ib_haspayor = true					
		
		//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
		SELECT country.flag_country  
		INTO :ls_flag_place  
		FROM  dba.country country WITH (NOLOCK)
		WHERE country.id_country = :ls_country_rec;
		//************************************************

		If ls_flag_place <> 'A' OR ISNULL(ls_flag_place) Then ls_country_rec = ""
		
		dw_2.setitem(dw_2.getrow(),"id_country_receiver",ls_country_rec)
		
		
		dw_2.GetChild("id_state_receiver",ldw_cdw)
		ldw_cdw.SetTransObject(SQLCA)
		ldw_cdw.Retrieve(ls_country_rec)
					
		ls_flag_place = ""	
		
		//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
		SELECT state.flag_state  
		INTO :ls_flag_place  
		FROM dba.state state WITH (NOLOCK)
		WHERE ( state.id_country = :ls_country_rec ) AND  
		( state.id_state = :ls_state_rec )   ;
		//************************************************

		If ls_flag_place <> 'A' OR ISNULL(ls_flag_place) Then ls_state_rec = ""			
					
		dw_2.setitem(dw_2.getrow(),"id_state_receiver",ls_state_rec)
			
		dw_2.GetChild("id_city_receiver",ldw_cdw)
		ldw_cdw.SetTransObject(SQLCA)
		ldw_cdw.Retrieve(ls_country_rec, ls_state_rec)
		
		ls_flag_place = ""	
		
		//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
		SELECT city.flag_city  
		INTO :ls_flag_place  
		FROM dba.city city WITH (NOLOCK)
		WHERE ( city.id_country = :ls_country_rec )
		AND ( city.id_state = :ls_state_rec )
		AND ( city.id_city = :ls_city_rec );
		//************************************************
					
		If ls_flag_place <> 'A' OR ISNULL(ls_flag_place) Then ls_city_rec = ""	

		dw_2.setitem(dw_2.getrow(),"id_city_receiver",ls_city_rec)
		dw_2.setfocus()
		
		
		// Verifica que el pagador de la orden anterior aun es valido
		boolean lb_result
		lb_result = fn_valida_pagador(true)
		
		if not lb_result then
			messagebox("Pay Point Not Available","The selected Pay Point is not longer available.~nYou must use the 'Pay Point' button to select another pay point.",StopSign!)					
			dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",'')
			dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",'')
			dw_2.setitem(dw_2.getrow(),"branch_name",'')
			ib_haspayor = false
		end if
		
		// Verifica que la moneda selecciona este disponible
		fn_valcurrency()					
		
		// .................................................
		// Actualiza el combo de modos de pago
		fn_fillmodopago(ls_modo_pago)					
		// .................................................					
							
	end if
end if


dw_2.setfocus()
end subroutine

public subroutine fn_envio_alertas ();Boolean lb_alerta_envio_sms, lb_alerta_promociones
string ls_phone1_sender, ls_sms_id

lb_alerta_envio_sms = cbx_alerta_envio_sms.checked
lb_alerta_promociones = cbx_alerta_promociones.checked

ls_phone1_sender = Trim(String(dw_1.getitemnumber(dw_1.getrow(),"phone1_sender")))
ls_sms_id = 'VIACENTRAL:'+ gs_cashier

IF lb_alerta_envio_sms THEN
	DECLARE spGetSMSEnroll1 PROCEDURE FOR dba.spGetSMSEnroll
 				@Mobile =  :ls_phone1_sender,
				 @Lang = 'SP',
				 @Category = 'N',
				 @SMSSid = :ls_sms_id,
				 @ClientType = 'S',
				 @IdCountry = 'USA';

	EXECUTE spGetSMSEnroll1;
	
	IF sqlca.SQLcode = -1 then	
		MessageBox("Alert","Error to send SMS (dba.spGetSMSEnroll): " + sqlca.SQLErrText, StopSign!)
	END IF
	
	CLOSE spGetSMSEnroll1;	
END IF

IF lb_alerta_promociones THEN
	DECLARE spGetSMSEnroll2 PROCEDURE FOR dba.spGetSMSEnroll
 				@Mobile =  :ls_phone1_sender,
				 @Lang = 'SP',
				 @Category = 'P',
				 @SMSSid =:ls_sms_id,
				 @ClientType = 'S',
				 @IdCountry = 'USA';

	EXECUTE spGetSMSEnroll2;
	
	IF sqlca.SQLcode = -1 then	
		MessageBox("Alert","Error to send SMS (dba.spGetSMSEnroll): " + sqlca.SQLErrText, StopSign!)
	END IF
	
	CLOSE spGetSMSEnroll2;	
END IF

end subroutine

on w_pfc_sender_telefono_rojo.create
int iCurrent
call super::create
if this.MenuName = "m_pfc_sender_central_telefono_rojo" then this.MenuID = create m_pfc_sender_central_telefono_rojo
this.pb_show_folio=create pb_show_folio
this.uo_segment=create uo_segment
this.cbx_alerta_promociones=create cbx_alerta_promociones
this.cbx_alerta_envio_sms=create cbx_alerta_envio_sms
this.em_dep_method=create em_dep_method
this.st_2=create st_2
this.cb_new_receiver=create cb_new_receiver
this.pb_payerlookup=create pb_payerlookup
this.p_5=create p_5
this.cb_paypoint=create cb_paypoint
this.cb_3=create cb_3
this.dw_recibo=create dw_recibo
this.dw_recibo_matrix=create dw_recibo_matrix
this.cb_print=create cb_print
this.st_1=create st_1
this.cb_new=create cb_new
this.st_3=create st_3
this.cb_borrar=create cb_borrar
this.p_1=create p_1
this.p_2=create p_2
this.dw_3=create dw_3
this.cb_cost=create cb_cost
this.p_3=create p_3
this.cb_calcular=create cb_calcular
this.cb_total=create cb_total
this.cb_calculate=create cb_calculate
this.st_4c=create st_4c
this.p_6rc=create p_6rc
this.st_4=create st_4
this.em_balance=create em_balance
this.st_7=create st_7
this.em_ultimo_invoice=create em_ultimo_invoice
this.cb_paymode=create cb_paymode
this.st_agency=create st_agency
this.dw_network=create dw_network
this.dw_1=create dw_1
this.dw_2=create dw_2
this.dw_address=create dw_address
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_show_folio
this.Control[iCurrent+2]=this.uo_segment
this.Control[iCurrent+3]=this.cbx_alerta_promociones
this.Control[iCurrent+4]=this.cbx_alerta_envio_sms
this.Control[iCurrent+5]=this.em_dep_method
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.cb_new_receiver
this.Control[iCurrent+8]=this.pb_payerlookup
this.Control[iCurrent+9]=this.p_5
this.Control[iCurrent+10]=this.cb_paypoint
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.dw_recibo
this.Control[iCurrent+13]=this.dw_recibo_matrix
this.Control[iCurrent+14]=this.cb_print
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.cb_new
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.cb_borrar
this.Control[iCurrent+19]=this.p_1
this.Control[iCurrent+20]=this.p_2
this.Control[iCurrent+21]=this.dw_3
this.Control[iCurrent+22]=this.cb_cost
this.Control[iCurrent+23]=this.p_3
this.Control[iCurrent+24]=this.cb_calcular
this.Control[iCurrent+25]=this.cb_total
this.Control[iCurrent+26]=this.cb_calculate
this.Control[iCurrent+27]=this.st_4c
this.Control[iCurrent+28]=this.p_6rc
this.Control[iCurrent+29]=this.st_4
this.Control[iCurrent+30]=this.em_balance
this.Control[iCurrent+31]=this.st_7
this.Control[iCurrent+32]=this.em_ultimo_invoice
this.Control[iCurrent+33]=this.cb_paymode
this.Control[iCurrent+34]=this.st_agency
this.Control[iCurrent+35]=this.dw_network
this.Control[iCurrent+36]=this.dw_1
this.Control[iCurrent+37]=this.dw_2
this.Control[iCurrent+38]=this.dw_address
end on

on w_pfc_sender_telefono_rojo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.pb_show_folio)
destroy(this.uo_segment)
destroy(this.cbx_alerta_promociones)
destroy(this.cbx_alerta_envio_sms)
destroy(this.em_dep_method)
destroy(this.st_2)
destroy(this.cb_new_receiver)
destroy(this.pb_payerlookup)
destroy(this.p_5)
destroy(this.cb_paypoint)
destroy(this.cb_3)
destroy(this.dw_recibo)
destroy(this.dw_recibo_matrix)
destroy(this.cb_print)
destroy(this.st_1)
destroy(this.cb_new)
destroy(this.st_3)
destroy(this.cb_borrar)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.dw_3)
destroy(this.cb_cost)
destroy(this.p_3)
destroy(this.cb_calcular)
destroy(this.cb_total)
destroy(this.cb_calculate)
destroy(this.st_4c)
destroy(this.p_6rc)
destroy(this.st_4)
destroy(this.em_balance)
destroy(this.st_7)
destroy(this.em_ultimo_invoice)
destroy(this.cb_paymode)
destroy(this.st_agency)
destroy(this.dw_network)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.dw_address)
end on

event open;//DON (04/08/2015) - PERFORMANCE TUNING.  **********************************
Open(w_please_wait_rojo)
This.PostEvent("ue_postopen")

//*******************************************************************

//SELECT dba.group_branch.debt_limit  
//  INTO :id_credito
//  FROM dba.group_branch,   
//		 dba.branch 
// WHERE ( dba.branch.id_main_branch = dba.group_branch.id_main_branch )
//   AND ( dba.branch.id_branch = :Is_branch_insta );
//
//if isnull(id_credito) then id_credito = 0

//SELECT Sum(dba.transaccion_diaria_payee.credit_trans_diaria) - Sum(dba.transaccion_diaria_payee.debit_trans_diaria)  
//  INTO :id_balance  
//  FROM dba.transaccion_diaria_payee,   
//		 dba.branch 
// WHERE ( dba.transaccion_diaria_payee.id_group_trans_diaria = dba.branch.id_main_branch ) 
//   AND ( dba.branch.id_branch = :Is_branch_insta );
//
//if isnull(Id_balance) then Id_balance = 0	
//
//SELECT SUM(dba.receiver.net_amount_receiver+dba.receiver.exchange_company+dba.receiver.telex_company+dba.receiver.total_modo_pago_comp)  
//  INTO :ld_diario
//  FROM dba.receiver 
// WHERE ( dba.receiver.id_branch = :is_branch_insta ) 
//   AND ( convert(char(12),dba.receiver.date_receiver,101) = convert(char(12),getdate(),101) );
//
//if isnull(ld_diario) then ld_diario = 0
//
//Id_balance = Id_balance - ld_diario
//em_balance.text = string(id_balance)
//
//if is_branch_insta = '' then
//	Messagebox("Error","Program not Autorized, Please consult with the System Administrator.",StopSign!)
//end if
  



//SELECT dba.branch.id_city,dba.branch.id_state,dba.branch.id_country  
//  INTO :ls_city,:ls_state,:ls_country  
//  FROM dba.branch  
// WHERE dba.branch.id_branch = :is_branch_insta;
//
//dw_1.setitem(dw_1.getrow(),"id_branch",is_branch_insta)
//dw_1.setitem(dw_1.getrow(),"id_country",ls_country)
//dw_1.setitem(dw_1.getrow(),"id_state",ls_state)
//dw_1.setitem(dw_1.getrow(),"id_city",ls_city)

//dw_1.GetChild('id_state',ldw_cdw)
//ldw_cdw.SetTransObject(SQLCA)
//ldw_cdw.SetFilter('')
//ldw_cdw.Filter()
//ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
//ldw_cdw.Filter()
//
//dw_1.GetChild('id_city',ldw_cdw)
//ldw_cdw.SetTransObject(SQLCA)
//ldw_cdw.SetFilter('')
//ldw_cdw.Filter()
//ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
//ldw_cdw.Filter()

end event

event pfc_print;return 0
end event

event activate;return 1
end event

event close;dw_1.setfocus()
dw_3.reset()
dw_recibo.reset()
dw_recibo_matrix.reset()
dw_network.reset()
dw_2.reset()
return dw_1.reset()
end event

event pfc_preclose;dw_1.setfocus()
dw_3.reset()
dw_recibo.reset()
dw_recibo_matrix.reset()
dw_network.reset()
dw_2.reset()
return dw_1.reset()
end event

type pb_show_folio from picturebutton within w_pfc_sender_telefono_rojo
integer x = 2254
integer y = 1680
integer width = 82
integer height = 72
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Graphics\eye_visible.png"
alignment htextalign = left!
end type

event clicked;string ls_folio, ls_branch
integer li_row
long li_receiver

li_row = dw_2.getrow( )
if not( li_row > 0 )  then return

ls_branch = dw_2.getitemstring( li_row, 'id_branch' )
li_receiver = dw_2.getitemnumber( li_row, 'id_receiver' )

if not( li_receiver > 0 )  then return

ls_folio = fn_show_folio(li_receiver, ls_branch)
messagebox('Folio / Clave ', 'Folio / Clave : ' + ls_folio )




end event

type uo_segment from uo_segmentation within w_pfc_sender_telefono_rojo
integer x = 2272
integer y = 772
integer width = 430
integer taborder = 100
end type

on uo_segment.destroy
call uo_segmentation::destroy
end on

type cbx_alerta_promociones from checkbox within w_pfc_sender_telefono_rojo
integer x = 37
integer y = 764
integer width = 1024
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Recibir promociones por SMS"
end type

type cbx_alerta_envio_sms from checkbox within w_pfc_sender_telefono_rojo
integer x = 37
integer y = 692
integer width = 1024
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Recibir alertas SMS sobre sus envíos"
end type

type em_dep_method from editmask within w_pfc_sender_telefono_rojo
integer x = 2277
integer y = 332
integer width = 411
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
end type

type st_2 from statictext within w_pfc_sender_telefono_rojo
integer x = 1998
integer y = 352
integer width = 270
integer height = 56
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Dep.Method:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_new_receiver from commandbutton within w_pfc_sender_telefono_rojo
integer x = 37
integer y = 844
integer width = 530
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New Receiver"
end type

event clicked;Double 	ld_ultimo

IF gl_sender = 0  THEN RETURN

dw_2.reset()
dw_2.insertrow(0)
dw_2.setfocus()

dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)
dw_2.setitem(dw_2.getrow(),"id_branch",is_branch_insta)
dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)

dw_2.AcceptText()

fn_get_receiver()

fn_update_balance()

ld_ultimo = fn_ultimo_invoice_agente(gs_branch_insta)			

em_ultimo_invoice.text = string(trim(is_branch_insta) +"-"+string(ld_ultimo))

dw_1.enabled = True
dw_2.enabled = True

ib_actualizado = False
is_estado =  'I'


end event

type pb_payerlookup from picturebutton within w_pfc_sender_telefono_rojo
integer x = 2720
integer y = 948
integer width = 110
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Help!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;
String ls_id_branch_pay, ls_id_pay_mode, ls_currency
String ls_id_country, ls_id_city, ls_id_state, ls_main_branch


Open(w_invoice_selectpayer)

ls_id_branch_pay = message.Stringparm

if isnull(ls_id_branch_pay) or trim(ls_id_branch_pay) = '' then 
	ls_id_branch_pay = '-NONE-'
	return
else
	ls_id_branch_pay = fn_token(message.Stringparm,'*',1)
	ls_currency = fn_token(message.Stringparm,'*',2)
	ls_id_pay_mode = fn_token(message.Stringparm,'*',3)
end if

//Messagebox("",ls_id_branch_pay)

//DON (04/16/2015) - PERFORMANCE TUNING.  ***********************************
SELECT id_country,
		 id_state,
		 id_city,
		 id_main_branch
  INTO :ls_id_country,
		 :ls_id_state, 
		 :ls_id_city,
		 :ls_main_branch 
  FROM dba.BRANCH	WITH (NOLOCK)
 WHERE id_branch = :ls_id_branch_pay;
 //********************************************************************


// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Populating Values

dw_2.SetItem(dw_2.GetRow(),"id_country_receiver",ls_id_country)
fn_RefreshScreen("COUNTRY")

dw_2.SetItem(dw_2.GetRow(),"id_state_receiver",ls_id_state)
fn_RefreshScreen("STATE")

dw_2.SetItem(dw_2.GetRow(),"id_city_receiver",ls_id_city)
fn_RefreshScreen("CITY")

dw_2.SetItem(dw_2.GetRow(),"receiver_mode_pay_receiver",ls_id_pay_mode)
fn_RefreshScreen("PAYMODE")

dw_2.SetItem(dw_2.GetRow(),"mod_pay_currency",ls_currency)

dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",ls_id_branch_pay)

dw_2.setitem(dw_2.getrow(),"branch_name",fn_get_branch_name(ls_id_branch_pay))

dw_2.setitem(dw_2.getrow(),"branch_id_main_branch",ls_main_branch)

ib_haspayor = true	

// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
end event

type p_5 from picture within w_pfc_sender_telefono_rojo
integer x = 750
integer y = 1432
integer width = 73
integer height = 64
boolean originalsize = true
string picturename = "Library!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

event clicked;cb_paypoint.TriggerEvent(clicked!)
end event

type cb_paypoint from commandbutton within w_pfc_sender_telefono_rojo
integer x = 722
integer y = 1392
integer width = 398
integer height = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "     Pay Point"
end type

event clicked;parent.fn_choose_payor()

li_calculation_mode = 1 // (net amount) DEFAULT

parent.Triggerevent("ue_calcular")
end event

type cb_3 from commandbutton within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 3191
integer y = 16
integer width = 96
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "..."
end type

event clicked;
String ls_id_branch_pay, ls_id_pay_mode
String ls_id_country, ls_id_city, ls_id_state


Open(w_searchlocation)
ls_id_branch_pay = message.Stringparm

if isnull(ls_id_branch_pay) or trim(ls_id_branch_pay) = '' then 
	ls_id_branch_pay = '-NONE-'
	return
else
	ls_id_branch_pay = fn_token(message.Stringparm,'*',1)
	ls_id_pay_mode = fn_token(message.Stringparm,'*',2)	
end if

Messagebox("",ls_id_branch_pay)

//DON (04/16/2015) - PERFORMANCE TUNING.  ***********************************
SELECT id_country,
		 id_state,
		 id_city
  INTO :ls_id_country,
		 :ls_id_state, 
		 :ls_id_city
  FROM dba.BRANCH	WITH (NOLOCK)
 WHERE id_branch = :ls_id_branch_pay;
 //********************************************************************



// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Populating Values

dw_2.SetItem(dw_2.GetRow(),"id_country_receiver",ls_id_country)

DataWindowChild ldw_dw

dw_2.GetChild("id_state_receiver",ldw_dw)
ldw_dw.SetTransObject(SQLCA)

ldw_dw.Retrieve(trim(ls_id_country))
//ldw_dw.SetFilter("id_country = '"+trim(ls_id_country)+"'")
//ldw_dw.Filter()
	
dw_2.GetChild("id_city_receiver",ldw_dw)
ldw_dw.SetTransObject(SQLCA)
ldw_dw.Retrieve(trim(ls_id_country), trim(ls_id_state))
//ldw_dw.SetFilter("id_country = '"+trim(ls_id_country)+"' and id_state = '"+trim(ls_id_state)+"'")
//ldw_dw.Filter()


dw_2.SetItem(dw_2.GetRow(),"id_state_receiver",ls_id_state)

dw_2.SetItem(dw_2.GetRow(),"id_city_receiver",ls_id_city)


// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
end event

type dw_recibo from datawindow within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 3451
integer y = 200
integer width = 1102
integer height = 1248
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_recibo_activefax"
borderstyle borderstyle = stylelowered!
end type

type dw_recibo_matrix from datawindow within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 128
integer y = 580
integer width = 494
integer height = 360
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_recibo_dot_matrix"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_pfc_sender_telefono_rojo
integer x = 2720
integer y = 476
integer width = 279
integer height = 220
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;parent.Triggerevent("ue_update")
end event

type st_1 from statictext within w_pfc_sender_telefono_rojo
integer x = 2729
integer y = 612
integer width = 261
integer height = 64
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
string text = "Print/&Save"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;parent.Triggerevent("ue_update")
end event

type cb_new from commandbutton within w_pfc_sender_telefono_rojo
integer x = 2720
integer y = 240
integer width = 279
integer height = 220
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;parent.Triggerevent("ue_insertar")
end event

type st_3 from statictext within w_pfc_sender_telefono_rojo
integer x = 2789
integer y = 380
integer width = 137
integer height = 64
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
string text = "&New"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;parent.Triggerevent("ue_insertar")
end event

type cb_borrar from commandbutton within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 2651
integer y = 876
integer width = 361
integer height = 140
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;parent.Triggerevent("ue_anulacion")
end event

type p_1 from picture within w_pfc_sender_telefono_rojo
integer x = 2807
integer y = 512
integer width = 105
integer height = 96
boolean bringtotop = true
boolean enabled = false
string picturename = "c:\viamericasmt\graphics\print1.bmp"
boolean focusrectangle = false
end type

event clicked;parent.Triggerevent("ue_update")
end event

type p_2 from picture within w_pfc_sender_telefono_rojo
integer x = 2811
integer y = 272
integer width = 96
integer height = 100
boolean bringtotop = true
boolean enabled = false
string picturename = "c:\viamericasmt\Graphics\lsdoc.bmp"
boolean focusrectangle = false
end type

event clicked;parent.Triggerevent("ue_insertar")
end event

type dw_3 from datawindow within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 3593
integer y = 44
integer width = 315
integer height = 280
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_export_invoice"
boolean border = false
end type

type cb_cost from commandbutton within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 2651
integer y = 1156
integer width = 183
integer height = 140
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;parent.Triggerevent("ue_cost")
end event

type p_3 from picture within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 2670
integer y = 896
integer width = 87
integer height = 72
boolean bringtotop = true
boolean enabled = false
string picturename = "c:\dinero\cust080.bmp"
boolean focusrectangle = false
end type

type cb_calcular from commandbutton within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 2651
integer y = 1296
integer width = 361
integer height = 140
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;parent.Triggerevent("ue_calcular")
end event

type cb_total from commandbutton within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 2839
integer y = 1156
integer width = 174
integer height = 140
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;parent.Triggerevent("ue_total")
end event

type cb_calculate from commandbutton within w_pfc_sender_telefono_rojo
integer x = 2720
integer y = 712
integer width = 279
integer height = 220
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&C"
end type

event clicked;
li_calculation_mode = 1 // (net amount) DEFAULT

parent.Triggerevent("ue_calcular")
end event

type st_4c from statictext within w_pfc_sender_telefono_rojo
integer x = 2738
integer y = 848
integer width = 242
integer height = 64
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
string text = "&Calculate"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;cb_calculate.triggerevent(clicked!)
end event

type p_6rc from picture within w_pfc_sender_telefono_rojo
integer x = 2811
integer y = 744
integer width = 96
integer height = 100
boolean bringtotop = true
boolean enabled = false
string picturename = "c:\viamericasmt\graphics\calcula.bmp"
boolean focusrectangle = false
end type

event clicked;cb_calculate.triggerevent(clicked!)
end event

type st_4 from statictext within w_pfc_sender_telefono_rojo
integer x = 2062
integer y = 624
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Last :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_balance from editmask within w_pfc_sender_telefono_rojo
integer x = 2277
integer y = 248
integer width = 411
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean displayonly = true
string mask = "$###,##0.00"
end type

type st_7 from statictext within w_pfc_sender_telefono_rojo
integer x = 2007
integer y = 268
integer width = 256
integer height = 56
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Avail.Credit:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_ultimo_invoice from singlelineedit within w_pfc_sender_telefono_rojo
integer x = 2277
integer y = 620
integer width = 411
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean autohscroll = false
boolean displayonly = true
end type

type cb_paymode from commandbutton within w_pfc_sender_telefono_rojo
integer x = 1842
integer y = 524
integer width = 133
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "..."
end type

event clicked;Open(w_pfc_sender_central_echeck)
end event

type st_agency from statictext within w_pfc_sender_telefono_rojo
integer width = 3040
integer height = 96
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Red Phone Agency"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type dw_network from datawindow within w_pfc_sender_telefono_rojo
integer x = 2025
integer y = 120
integer width = 978
integer height = 80
boolean enabled = false
string dataobject = "dw_branch_network_telefono_rojo1"
boolean border = false
boolean livescroll = true
end type

event losefocus;dw_network.accepttext()
//dw_network.setitem(1,"id_branch",dw_network.getitemString(1,"branch_modem_branch"))

parent.fn_loadbranch()

//Double	ld_sender,	ld_receiver, ld_ultimo, ld_diario
//string	ls_city,ls_state,ls_country 
//DataWindowChild ldw_cdw
//
//dw_network.enabled = False
//
//////////////////////////////// Cargar la Agencia Escogida  ////////////////////////////////
//
//is_branch_insta = dw_network.getitemstring(1,"id_branch")
//
//gs_branch_insta = is_branch_insta
//		
//if is_branch_insta = '' then
//	Messagebox("Error","Program not Autorized, Please consult with the System Administrator.",StopSign!)
//	Close(w_pfc_sender)
//	Return 0;
//end if
//
//ld_ultimo = fn_ultimo_invoice_agente(gs_branch_insta)			
//
//em_ultimo_invoice.text = string(trim(is_branch_insta) +"-"+string(ld_ultimo))
//
//SELECT dba.branch.id_city,dba.branch.id_state,dba.branch.id_country  
// INTO :ls_city,:ls_state,:ls_country  
// FROM dba.branch  
//WHERE dba.branch.id_branch = :is_branch_insta;
//	
//dw_1.reset()
//dw_1.insertrow(0)	 
//dw_1.setitem(dw_1.getrow(),"id_branch",is_branch_insta)
//dw_1.setitem(dw_1.getrow(),"id_country",ls_country)
//dw_1.setitem(dw_1.getrow(),"id_state",ls_state)
//dw_1.setitem(dw_1.getrow(),"id_city",ls_city)
//dw_2.setitem(dw_2.getrow(),"id_branch",is_branch_insta)
//dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)
//dw_1.setfocus()
//
//dw_1.GetChild('id_state',ldw_cdw)
//ldw_cdw.SetFilter('')
//ldw_cdw.Filter()
//ldw_cdw.SetTransObject(SQLCA)
//ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
//ldw_cdw.Filter()
//
//dw_1.GetChild('id_city',ldw_cdw)
//ldw_cdw.SetFilter('')
//ldw_cdw.Filter()
//ldw_cdw.SetTransObject(SQLCA)
//ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
//ldw_cdw.Filter()
//
//dw_1.setitem(dw_1.getrow(),"id_city",ls_city)
//
///////////////////////
//
//DataWindowChild ldw_dw
//
//dw_2.GetChild("id_country_receiver",ldw_dw)
//ldw_dw.SetTransObject(SQLCA)
//dw_2.SetItem(dw_2.GetRow(),"id_country_receiver","")
//ldw_dw.Retrieve()
//ldw_dw.SetFilter("")
//ldw_dw.Filter()
//
//dw_2.GetChild("id_state_receiver",ldw_dw)
//ldw_dw.SetTransObject(SQLCA)
//dw_2.SetItem(dw_2.GetRow(),"id_state_receiver","")
//ldw_dw.Retrieve()
//ldw_dw.SetFilter("id_country = ''")
//ldw_dw.Filter()
//	
//dw_2.SetItem(dw_2.GetRow(),"id_city_receiver","")
//dw_2.GetChild("id_city_receiver",ldw_dw)
//ldw_dw.SetTransObject(SQLCA)
//ldw_dw.Retrieve()
//ldw_dw.SetFilter("id_country = '' and id_state = ''")
//ldw_dw.Filter()
///////////////////////
//			
//SELECT group_branch.debt_limit  
//INTO :id_credito
//FROM dba.group_branch group_branch,   
//		dba.branch branch 
//WHERE ( branch.id_main_branch = group_branch.id_main_branch ) and  
//		( ( branch.id_branch = :Is_branch_insta ) )   ;
//
//	if isnull(id_credito) then id_credito = 0
//
//SELECT Sum(transaccion_diaria_payee.credit_trans_diaria) - Sum(transaccion_diaria_payee.debit_trans_diaria)  
//INTO :id_balance  
//FROM dba.transaccion_diaria_payee transaccion_diaria_payee,   
//		dba.branch  
//WHERE ( transaccion_diaria_payee.id_group_trans_diaria = dba.branch.id_main_branch ) and  
//		( ( dba.branch.id_branch = :Is_branch_insta ) )   ;
//
//if isnull(Id_balance) then Id_balance = 0	
//
//datetime ld_today
//ld_today = datetime(today(),time('00:00:00'))				
//
//SELECT SUM(receiver.net_amount_receiver+receiver.exchange_company+receiver.telex_company+receiver.total_modo_pago_comp)  
//INTO :ld_diario
//FROM  dba.receiver receiver 
//WHERE ( receiver.id_branch = :is_branch_insta ) AND  
//		( receiver.date_receiver >= :ld_today )   ;
//
//if isnull(ld_diario) then ld_diario = 0
//
//Id_balance = Id_balance - ld_diario
//em_balance.text = string(id_balance)
end event

event itemchanged;//IF dwo.Name = "branch_modem_branch" THEN
//	
//	string ls_id_branch
//	long ll_cont
//	
//	ls_id_branch = data
//	
//	  SELECT count(*)
//		INTO :ll_cont
//		 FROM DBA.BRANCH,   
//				DBA.TIPO_TRANSMISION_AGENCIA  
//		WHERE ( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH ) and  
//				(DBA.BRANCH.ID_TYPE_BRANCH = 'R' OR  
//				DBA.BRANCH.ID_TYPE_BRANCH = 'A' ) AND  
//				DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION = 'R' AND  
//				DBA.BRANCH.id_flag_branch = 'A' AND
//				DBA.BRANCH.ID_BRANCH = :ls_id_branch;
//	
//	if ll_cont = 1 then
//		dw_network.setitem(1,"id_branch",ls_id_branch)
//	else
//		Messagebox("Error Selecting Branch","This is not a red phone agency or it is inactive",StopSign!)
//		return 2
//	end if	
//	
//elseif dwo.Name = "id_branch" then
//	
//	dw_network.setitem(1,"branch_modem_branch",data)
//
//end if
//
//dw_network.accepttext()
//
//
////IF dwo.Name = "branch_modem_branch" THEN
////	
////	string ls_id_branch
////	long ll_cont
////	
////	ls_id_branch = data
////	
//////	messagebox("",data)
////	
////	  SELECT count(*)
////		INTO :ll_cont
////		 FROM DBA.BRANCH,   
////				DBA.TIPO_TRANSMISION_AGENCIA  
////		WHERE ( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH ) and  
////				(DBA.BRANCH.ID_TYPE_BRANCH = 'R' OR  
////				DBA.BRANCH.ID_TYPE_BRANCH = 'A' ) AND  
////				DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION = 'R' AND  
////				DBA.BRANCH.id_flag_branch = 'A' AND
////				DBA.BRANCH.ID_BRANCH = :ls_id_branch;
////	
////	if ll_cont = 1 then
////		dw_network.setitem(1,"id_branch",ls_id_branch)
////	else
////		Messagebox("Error Selecting Branch","This is not a red phone agency or it is inactive",StopSign!)
//////		dw_network.setitem(1,"branch_modem_branch",dw_network.getitemstring(1,"id_branch"))
////
////		data = dw_network.getitemstring(1,"id_branch")
////		
////	end if	
////	
//////elseif dwo.Name = "id_branch" and (trim(dw_network.getitemstring(1,"branch_modem_branch")) <> trim(data)) THEN
//////	
//////	dw_network.setitem(1,"branch_modem_branch",data)
////
////end if
////
////dw_network.accepttext()
end event

event itemfocuschanged;//IF dwo.Name = "branch_modem_branch" THEN
//	
//	string ls_id_branch
//	long ll_cont
//
//	ls_id_branch = dw_network.getitemstring(1,"branch_modem_branch")
//
//	//messagebox("",data)
//
//	  SELECT count(*)
//		INTO :ll_cont
//		 FROM DBA.BRANCH,   
//				DBA.TIPO_TRANSMISION_AGENCIA  
//		WHERE ( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH ) and  
//				(DBA.BRANCH.ID_TYPE_BRANCH = 'R' OR  
//				DBA.BRANCH.ID_TYPE_BRANCH = 'A' ) AND  
//				DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION = 'R' AND  
//				DBA.BRANCH.id_flag_branch = 'A' AND
//				DBA.BRANCH.ID_BRANCH = :ls_id_branch;
//
//	if ll_cont = 1 then
//		dw_network.setitem(1,"id_branch",ls_id_branch)
//	else
//		Messagebox("Error Selecting Branch","This is not a red phone agency or it is inactive",StopSign!)
////		dw_network.setitem(1,"branch_modem_branch",dw_network.getitemstring(1,"id_branch"))
//
//		//data = dw_network.getitemstring(1,"id_branch")
//
//	end if	
//	
////elseif dwo.Name = "id_branch" and (trim(dw_network.getitemstring(1,"branch_modem_branch")) <> trim(data)) THEN
////	
////	dw_network.setitem(1,"branch_modem_branch",data)
//
//end if
//
//dw_network.accepttext()
end event

type dw_1 from datawindow within w_pfc_sender_telefono_rojo
event ue_enter_key pbm_dwnprocessenter
integer x = 32
integer y = 104
integer width = 1970
integer height = 592
integer taborder = 10
string dataobject = "dw_pfc_sender_telefono_rojo"
boolean border = false
end type

event ue_enter_key;Send(Handle(This),256,9,Long(0,0))
Return 1
end event

event itemfocuschanged;String	   	ls_name , ls_city, ls_country_sender,ls_state_sender="",ls_city_sender="",	&
			ls_state, &
			ls_country, &
			ls_codcou, &
			ls_codsta, &
			ls_zip_sender, &
			ls_flag_place

String		ls_address, &
			ls_name_receiver, &
			ls_bank, &
			ls_account, &
			ls_modo_pago, &
			ls_corresponsal, &
			ls_main_branch, &
			ls_email_receiver,	&
			ls_currency_receiver
			

String	ls_phone1, ls_phone2, ls_zip, ls_country_rec, ls_city_rec, ls_state_rec
String ls_valLicense
String 	ls_rec_fname, ls_rec_mname, ls_rec_lname, ls_rec_slname
String 	ls_typeid, ls_numid

Double		ll_id_sender, ld_receiver, ld_receiver_unique

DataWindowChild	ldw_cdw


string ls_nombre_ciudad, ls_nombre_state

If dw_1.GetColumn() = 5 Then
		
	ls_country_sender = dw_1.getitemstring(row,"id_country")
	ls_zip_sender = string(dw_1.getitemnumber(row,"zip_sender"))
						
	If isnull(ls_zip_sender) then
		ls_zip_sender = ""
   	End If
	
	 If ls_zip_sender <> "" and ls_zip_sender <> "0" then
         //DON (04/08/2015) - PERFORMANCE TUNE.  *****************
		SELECT dba.city.id_state,   
		dba.city.id_city  
		INTO :ls_state_sender,   
		:ls_city_sender  
		FROM dba.city  WITH (NOLOCK)
		WHERE ( dba.city.id_country = :ls_country_sender )
		AND  ( dba.city.id_city = :ls_zip_sender )   ;
		//************************************************


       If ls_state_sender <> "" and ls_city_sender <> "" then
			
				//Seleccionar los nombres y ponerlos
				//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
				SELECT dba.city.name_city,   
				dba.state.name_state  
				INTO :ls_nombre_ciudad,   
				:ls_nombre_state  
				FROM dba.city 	WITH (NOLOCK)
				INNER JOIN	dba.state  WITH (NOLOCK)
				ON 	( dba.state.id_state = dba.city.id_state ) and  
						( dba.state.id_country = dba.city.id_country )
				WHERE  ( ( dba.city.id_city = :ls_city_sender ) )   ;
				//************************************************

			
				dw_1.setitem(dw_1.getrow(),"city_sender",ls_nombre_ciudad)
				dw_1.setitem(dw_1.getrow(),"state_sender",ls_nombre_state)
			
				dw_1.setitem(dw_1.getrow(),"id_city",ls_city_sender)
				dw_1.setitem(dw_1.getrow(),"id_state",ls_state_sender)
				
				dw_1.GetChild('id_state',ldw_cdw)
				ldw_cdw.SetFilter('')
				ldw_cdw.Filter()
				ldw_cdw.SetTransObject(SQLCA)
				ldw_cdw.SetFilter("id_country = '"+ls_country_sender +"'")
				ldw_cdw.Filter()

				dw_1.GetChild('id_city',ldw_cdw)
				ldw_cdw.SetFilter('')
				ldw_cdw.Filter()
				ldw_cdw.SetTransObject(SQLCA)
				ldw_cdw.SetFilter("id_country = '"+ls_country_sender +"' and id_state = '"+ ls_state_sender +"'")
				ldw_cdw.Filter()

				dw_1.setitem(dw_1.getrow(),"id_city",ls_city_sender)								
						
	    End If

		// """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
		// Si aun no tiene Ciudad o Estado los busca en la tabla zipcode
		
		string ls_state1, ls_city1			
		// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		// Obtiene el estado de la tabla de ZIPCODES
		ls_state1 = dw_1.getitemstring(dw_1.getrow(),"state_sender")
				
		//if isnull(ls_state1) or trim(ls_state1) = '' then
		//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
			SELECT MIN(idSTATE)
			INTO :ls_state1
			FROM dba.zipcode		WITH (NOLOCK)
			where zipcode = :ls_zip_sender;
				
			if not isnull(ls_state1) then
				dw_1.setitem(dw_1.getrow(),"state_sender",ls_state1)
			end if
		//************************************************
		//end if 
		// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		
		// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		// Obtiene la ciudad de la tabla de ZIPCODES
		ls_city1 = dw_1.getitemstring(dw_1.getrow(),"city_sender")	
		//if isnull(ls_city1) or trim(ls_city1) = '' then
		//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
			SELECT MIN(CITY)
			INTO :ls_city1
			FROM dba.zipcode		WITH (NOLOCK)
			where zipcode = :ls_zip_sender;
		//*************************************************
			
			if not isnull(ls_city1) then
				dw_1.setitem(dw_1.getrow(),"city_sender",ls_city1)
			end if				
		//end if 
		// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++				
		
		// """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	End if
		
		
	
	// address verification!
	fn_displayaddressverification2()
	

//	ls_address = dw_1.getitemstring(dw_1.getrow(),"addres_sender")
//	ls_city = dw_1.getitemstring(dw_1.getrow(),"city_sender")
//	ls_state = dw_1.getitemstring(dw_1.getrow(),"state_sender")
//	ls_zip = string(dw_1.getitemnumber(dw_1.getrow(),"zip_sender"))			
		
		
		
		
		
end if

//If dw_1.GetColumn() = 4 Then
If dw_1.GetColumn() = 18 Then	
	
	// >>>>>>>>>>>>>>>>>>>>
	// concatena el nombre
	string ls_completename, ls_partial	
	ls_completename = ""
	ls_partial = trim(dw_1.getitemstring(dw_1.getrow(),"sen_fname"))
	if not isnull(ls_partial) then ls_completename += ls_partial + " "
	ls_partial = trim(dw_1.getitemstring(dw_1.getrow(),"sen_mname"))
	if not isnull(ls_partial) then ls_completename += ls_partial + " "
	ls_partial = trim(dw_1.getitemstring(dw_1.getrow(),"sen_lname"))
	if not isnull(ls_partial) then ls_completename += ls_partial + " "
	ls_partial = trim(dw_1.getitemstring(dw_1.getrow(),"sen_slname"))
	if not isnull(ls_partial) then ls_completename += ls_partial
	ls_completename =  trim(ls_completename)
	dw_1.setitem(dw_1.getrow(),"name_sender", left(ls_completename,40))	
	dw_1.accepttext()
	// >>>>>>>>>>>>>>>>>>>>	
	
	ls_name = "%"+dw_1.getitemstring(row,3)+"%"
	gs_branch_insta = is_branch_insta
	
//	SELECT Count(*)  
//	  INTO :ll_cont  
//	  FROM dba.sender  
//	 WHERE dba.sender.name_sender like :ls_name
//		and dba.sender.id_branch = :gs_branch_insta;
//	if ll_cont > 0 Then

// YA NO TIENE QUE CONTAR PORQUE SE SACAN LOS DE TODAS LAS AGENCIAS

		ls_codsta=Object.id_state[row]
		ls_codcou=Object.id_country[row]
		Object.id_state[row]=''
		GetChild('id_state',ldw_cdw)
		ldw_cdw.SetFilter('')
		ldw_cdw.Filter()
		ldw_cdw.SetTransObject(SQLCA)
		ldw_cdw.SetFilter("id_country = '"+ls_codcou+"'")
		ldw_cdw.Filter()
	
		Object.id_city[row]=''
		GetChild('id_city',ldw_cdw)
		ldw_cdw.SetFilter('')
		ldw_cdw.Filter()

		ldw_cdw.SetTransObject(SQLCA)
		ldw_cdw.SetFilter("id_country = '"+ls_codcou+"' AND id_state = '"+ls_codsta+"'")
		ldw_cdw.Filter()


		gl_sender = 0
		Openwithparm(w_busca_nombre,ls_name)
		
		String ls_return, ls_return_receiver, ls_sel_branch, ls_sel_branch_receiver
		double ls_sel_sender
			
		ls_return = message.StringParm
				
		if ls_return <> '-NONE-' Then			
		
			ls_sel_branch = fn_token(ls_return,'*',1)
			ls_sel_sender = double(fn_token(ls_return,'*',2))
			gl_sender = double(fn_token(ls_return,'*',3))
		
			GetChild('id_state',ldw_cdw)
			ldw_cdw.SetFilter('')
			ldw_cdw.Filter()
			GetChild('id_city',ldw_cdw)
			ldw_cdw.SetFilter('')
			ldw_cdw.Filter()

			if gs_branch_insta = ls_sel_branch then			  

				ll_id_sender = ls_sel_sender
				dw_1.retrieve(ll_id_sender,gs_branch_insta)					
				dw_2.setitem(dw_2.getrow(),"id_sender",ll_id_sender)
									
			else // Escogio un man que existe en otra agencia y no en esta
				
				String ls_sen_fname, ls_sen_mname, ls_senlname, ls_senslname, ls_name_sender, ls_address_sender
				String ls_email_sender, ls_state_sender1, ls_city_sender1, ls_id_type_id_sender
				String ls_number_id_sender, ls_id_city_sender, ls_id_state_sender
				Datetime	 ld_dob_sender
				Double ld_phone1_sender, ld_phone2_sender, ls_zip_sender1
				
				//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
				SELECT sen_fname, sen_mname, sen_lname, sen_slname,
						 name_sender, addres_sender, phone1_sender, phone2_sender,
						 zip_sender, email_sender, state_sender, city_sender, id_type_id_sender,
						 number_id_sender, dob_sender, id_city, id_state
				  INTO :ls_sen_fname, :ls_sen_mname, :ls_senlname, :ls_senslname,
				  		 :ls_name_sender, :ls_address_sender, :ld_phone1_sender, :ld_phone2_sender,
						 :ls_zip_sender1, :ls_email_sender, :ls_state_sender1, :ls_city_sender1, :ls_id_type_id_sender,
						 :ls_number_id_sender, :ld_dob_sender, :ls_id_city_sender, :ls_id_state_sender
				  FROM dba.sender  WITH (NOLOCK)
				 WHERE id_branch = :ls_sel_branch
				   AND id_sender = :ls_sel_sender;
				//*************************************************
					
				
				dw_1.setitem(dw_2.getrow(),"sen_fname",ls_sen_fname)
				dw_1.setitem(dw_2.getrow(),"sen_mname",ls_sen_mname)
				dw_1.setitem(dw_2.getrow(),"sen_lname",ls_senlname)
				dw_1.setitem(dw_2.getrow(),"sen_slname",ls_senslname)						
				dw_1.setitem(dw_2.getrow(),"name_sender",ls_name_sender)		
				dw_1.setitem(dw_2.getrow(),"addres_sender",ls_address_sender)		
				dw_1.setitem(dw_2.getrow(),"phone1_sender",ld_phone1_sender)		
				dw_1.setitem(dw_2.getrow(),"phone2_sender",ld_phone2_sender)
				dw_1.setitem(dw_2.getrow(),"zip_sender",ls_zip_sender1)
				
				dw_1.setitem(dw_2.getrow(),"email_sender",ls_email_sender)
				dw_1.setitem(dw_2.getrow(),"state_sender",ls_state_sender1)
				dw_1.setitem(dw_2.getrow(),"city_sender",ls_city_sender1)
				dw_1.setitem(dw_2.getrow(),"id_type_id_sender",ls_id_type_id_sender)
				dw_1.setitem(dw_2.getrow(),"number_id_sender",ls_number_id_sender)
				dw_1.setitem(dw_2.getrow(),"dob_sender",ld_dob_sender)
				dw_1.setitem(dw_2.getrow(),"id_city",ls_id_city_sender)
				dw_1.setitem(dw_2.getrow(),"id_state",ls_id_state_sender)
				
			end if
					
			fn_get_receiver()

		else
			// Correccion new Sender
			//DON (04/08/2015) - PERFORMANCE TUNE.  *****************
			SELECT dba.branch.id_city,   
			dba.branch.id_state,   
			dba.branch.id_country  
			INTO :ls_city,   
			:ls_state,   
			:ls_country  
			FROM dba.branch  WITH (NOLOCK)
			WHERE dba.branch.id_branch = :gs_branch_insta   ;
			//************************************************
			
			dw_1.setitem(dw_1.getrow(),"id_city",ls_city)
			dw_1.setitem(dw_1.getrow(),"id_state",ls_state)
				

			////////////////////////////////
		end if
//	end if

end if


end event

event itemchanged;
string	   ls_codcou, ls_codsta
String ls_valLicense 
DataWindowChild	ldw_cdw

//IF dwo.Name = "sen_fname" or dwo.Name = "sen_mname" or dwo.Name = "sen_lname" or dwo.Name = "sen_slname" THEN
//	IF Pos(GetText(),"'") > 0 THEN
//		MessageBox("Atention","The name can't have (') symbols.")		
//	END IF
//	ls_completename = trim(dw_1.getitemstring(dw_1.getrow(),"sen_fname")) + " " + &
//							trim(dw_1.getitemstring(dw_1.getrow(),"sen_mname")) + " " + &
//							trim(dw_1.getitemstring(dw_1.getrow(),"sen_lname")) + " " + &
//							trim(dw_1.getitemstring(dw_1.getrow(),"sen_slname"))		
//	dw_1.setitem(dw_1.getrow(),"name_sender", ls_completename)	
//END IF


if data <> obj_string_tools.of_removenonprint(data) or pos(data,"'") > 0 then

		if fn_getlang() = 'EN' then
			Messagebox("Invalid Data","The value ["+data+"] contains an invalid character please correct the value.  ~nThe invalid character won't be saved.",Exclamation!)
		else
			Messagebox("Dato Inválido","El valor ["+data+"] contiene un caracter inválido, por favor remuévalo. ~nEl caracter inválido no será grabado.",Exclamation!)
		end if	
			
end if



IF dwo.Name = "name_sender" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The name can't have (') symbols.",StopSign!)
	END IF
END IF


IF dwo.Name = "addres_sender" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The address can't have (') symbols.",StopSign!)
	END IF
END IF


IF dwo.Name = "email_sender" THEN
	if fn_valemailaddress(data) or trim(data) = '' then
		if isnull(dw_1.getitemnumber(dw_1.getrow(),"receiptto")) then
			dw_1.setitem(dw_1.getrow(),"receiptto",1)
		end if
	else
		MessageBox("Atention","Please enter a valid EMail Address.",StopSign!)
		return 1 // Reject the data value and do not allow focus to change
	end if		
END IF


IF dwo.Name = "number_id_sender" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The id can't have (') symbols.",StopSign!)
	END IF
END IF


IF dwo.Name='id_state' THEN
	ls_codsta=GetText()
	ls_codcou=Object.id_country[row]
	Object.id_city[row]=''
	GetChild('id_city',ldw_cdw)
	ldw_cdw.SetFilter('')
	ldw_cdw.Filter()
	ldw_cdw.SetTransObject(SQLCA)
	ldw_cdw.SetFilter("id_country = '"+ls_codcou+"' AND id_state = '"+ls_codsta+"'")
	ldw_cdw.Filter()
	
			
END IF



// Si modifica alguna parte de la direccion, marca la direccion como no verificada.
IF dwo.Name = "addres_sender" &
	OR dwo.Name = "city_sender" &
	OR dwo.Name = "state_sender" &
	OR dwo.Name = "zip_sender" &
	THEN
	
	// Values for add_bitmap_sender are:
	// AV:VA: Verified accepted (by system or user)
	// AV:KC: Keep current (No verified)
	// AV:NV or OTHER VALUE: Address to be verified
	//dw_1.setitem(dw_1.getrow(),"add_bitmap_sender","AV:NV")	
	dw_1.setitem(dw_1.getrow(),"add_bitmap_sender","")	
	
	
	
			/*****************************************************
			csarmiento
			PBI 783 : dont allow tx from no license state when agency is A00788
			10/16/2014
			******************************************************/
			
			ls_valLicense =''
			
			 SELECT  dba.sfValLicenseStateFroBranch(:Is_branch_insta, id_state	) 
			   into  :ls_valLicense
 				 from  dba.state
			where id_state = :data;

			
			if (ls_valLicense = 'N') then
				Messagebox("Error","Viamericas don't have license to allow transactions in the given state for agency " + Is_branch_insta ,Exclamation!)
			end if
			
end if


end event

event clicked;
if dwo.name = 't_validate_address' then
	dw_address.visible = true
end if


end event

type dw_2 from datawindow within w_pfc_sender_telefono_rojo
event ue_enterkey pbm_dwnprocessenter
integer x = 27
integer y = 328
integer width = 2967
integer height = 1536
integer taborder = 20
string dataobject = "dw_pfc_receiver_telefono_rojo"
boolean border = false
end type

event ue_enterkey;Send(Handle(This),256,9,Long(0,0))
Return 1
end event

event itemfocuschanged;IF dw_2.GetColumn() = 18 and not ib_haspayor Then
	parent.fn_choose_payor()
end if

end event

event itemchanged;

if data <> obj_string_tools.of_removenonprint(data) or pos(data,"'") > 0 then

		if fn_getlang() = 'EN' then
			Messagebox("Invalid Data","The value ["+data+"] contains an invalid character please correct the value.  ~nThe invalid character won't be saved.",Exclamation!)
		else
			Messagebox("Dato Inválido","El valor ["+data+"] contiene un caracter inválido, por favor remuévalo. ~nEl caracter inválido no será grabado.",Exclamation!)
		end if	
			
end if



//Validacion de las Comillas

IF dwo.Name = "notes_receiver" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The message can't have (') symbols.")
	END IF
END IF

IF dwo.Name = "name_receiver" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The receiver's name can't have (') symbols.")
	END IF
END IF

IF dwo.Name = "address_receiver" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The receiver address can't have (') symbols.")
	END IF
END IF



if dwo.name = "total_receiver" then
	//parent.triggerevent("ue_total")
	
	fn_calhandling()
	
	li_calculation_mode = 2
	parent.triggerevent("ue_calcular")
	li_calculation_mode = 1
	
end if

if dwo.name = "total_pay_receiver" then
	//parent.triggerevent("ue_cost")
	
	fn_calhandling()
	
	li_calculation_mode = 3
	parent.triggerevent("ue_calcular")
	li_calculation_mode = 1	
	
end if

if dwo.name = "net_amount_receiver" or dwo.name = "branch_id_main_branch"  then
	//parent.triggerevent("ue_calcular")
	
	fn_calhandling()
	
	li_calculation_mode = 1
	parent.triggerevent("ue_calcular")
	li_calculation_mode = 1
	
end if

string dato
if dwo.name = "id_country_receiver" then
	
	dato = data
	
	fn_RefreshScreen("COUNTRY")
end if

if dwo.name = "id_state_receiver" then
	dato = data
	fn_RefreshScreen("STATE")
end if

if dwo.Name = "id_city_receiver" then
	fn_RefreshScreen("CITY")
end if

if dwo.name = "mod_pay_currency" then
	fn_RefreshScreen("PAYMODE")
end if





end event

type dw_address from datawindow within w_pfc_sender_telefono_rojo
boolean visible = false
integer x = 69
integer y = 440
integer width = 1897
integer height = 992
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Suggested Addresses"
string dataobject = "dw_address_validation"
boolean controlmenu = true
string icon = "UserObject5!"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;
// Si no escogio la escrita
if dw_address.getitemstring(row,"x") <> "*CURRENT*" then

	dw_1.setitem(dw_1.getrow(),"addres_sender",dw_address.getitemstring(row,"street"))
	dw_1.setitem(dw_1.getrow(),"city_sender",dw_address.getitemstring(row,"city"))
	dw_1.setitem(dw_1.getrow(),"state_sender",dw_address.getitemstring(row,"state"))
	dw_1.setitem(dw_1.getrow(),"zip_sender",double(dw_address.getitemstring(row,"zipcode")))
	
	// ############################################################
	// Values for add_bitmap_sender are:
	// AV:V?: Verified waiting selection 
	// AV:VA: Verified accepted (by system or user)
	// AV:KC: Keep current (Unverified)
	// AV:NF: Not Similar Address Found (will ask before save and will change to AV:KC)
	// AV:IA: Invalid Address (will ask before save the record)		
	// OTHER: Address to be verified
	// ############################################################
	
	dw_1.setitem(dw_1.getrow(),"add_bitmap_sender","AV:VA")


else
	
	dw_1.setitem(dw_1.getrow(),"add_bitmap_sender","AV:KC")
	
	
end if

dw_1.accepttext()

this.visible = false
end event

type st_printer from statictext within w_pfc_sender_telefono_rojo
integer x = 2354
integer y = 1580
integer width = 571
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Printer"
boolean focusrectangle = false
end type

