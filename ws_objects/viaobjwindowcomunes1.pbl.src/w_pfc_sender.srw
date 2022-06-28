$PBExportHeader$w_pfc_sender.srw
forward
global type w_pfc_sender from w_master
end type
type dw_recibo from datawindow within w_pfc_sender
end type
type dw_network from datawindow within w_pfc_sender
end type
type dw_recibo_matrix from datawindow within w_pfc_sender
end type
type dw_1 from datawindow within w_pfc_sender
end type
type cb_print from commandbutton within w_pfc_sender
end type
type st_1 from statictext within w_pfc_sender
end type
type st_2 from statictext within w_pfc_sender
end type
type cb_new from commandbutton within w_pfc_sender
end type
type st_3 from statictext within w_pfc_sender
end type
type cb_borrar from commandbutton within w_pfc_sender
end type
type gb_2 from groupbox within w_pfc_sender
end type
type p_1 from picture within w_pfc_sender
end type
type p_2 from picture within w_pfc_sender
end type
type cb_trans from commandbutton within w_pfc_sender
end type
type dw_2 from datawindow within w_pfc_sender
end type
type dw_3 from datawindow within w_pfc_sender
end type
type cb_cost from commandbutton within w_pfc_sender
end type
type st_5 from statictext within w_pfc_sender
end type
type cb_hold from commandbutton within w_pfc_sender
end type
type st_6 from statictext within w_pfc_sender
end type
type p_3 from picture within w_pfc_sender
end type
type cb_calcular from commandbutton within w_pfc_sender
end type
type st_calcular from statictext within w_pfc_sender
end type
type cb_total from commandbutton within w_pfc_sender
end type
type st_total from statictext within w_pfc_sender
end type
type cb_1 from commandbutton within w_pfc_sender
end type
type st_4c from statictext within w_pfc_sender
end type
type p_6rc from picture within w_pfc_sender
end type
type lb_borrar from listbox within w_pfc_sender
end type
type em_balance from editmask within w_pfc_sender
end type
type st_7 from statictext within w_pfc_sender
end type
type cb_new_rate from commandbutton within w_pfc_sender
end type
type p_4 from picture within w_pfc_sender
end type
type st_333 from statictext within w_pfc_sender
end type
type cb_adjust_rate from commandbutton within w_pfc_sender
end type
type p_5 from picture within w_pfc_sender
end type
type st_3334 from statictext within w_pfc_sender
end type
end forward

global type w_pfc_sender from w_master
boolean visible = false
integer x = 32
integer y = 100
integer width = 2821
integer height = 1572
string title = "Adding an Invoice"
string menuname = "m_pfc_sender"
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
event ue_new_rate ( )
event ue_modifrate ( )
event ue_print_exp ( )
dw_recibo dw_recibo
dw_network dw_network
dw_recibo_matrix dw_recibo_matrix
dw_1 dw_1
cb_print cb_print
st_1 st_1
st_2 st_2
cb_new cb_new
st_3 st_3
cb_borrar cb_borrar
gb_2 gb_2
p_1 p_1
p_2 p_2
cb_trans cb_trans
dw_2 dw_2
dw_3 dw_3
cb_cost cb_cost
st_5 st_5
cb_hold cb_hold
st_6 st_6
p_3 p_3
cb_calcular cb_calcular
st_calcular st_calcular
cb_total cb_total
st_total st_total
cb_1 cb_1
st_4c st_4c
p_6rc p_6rc
lb_borrar lb_borrar
em_balance em_balance
st_7 st_7
cb_new_rate cb_new_rate
p_4 p_4
st_333 st_333
cb_adjust_rate cb_adjust_rate
p_5 p_5
st_3334 st_3334
end type
global w_pfc_sender w_pfc_sender

type variables
Time	it_hour_connect
long	il_time_conect
Date	id_date_connect

string	Is_branch_insta="", is_currency

Double	il_long_phone,	&
	 id_rate,		&
	 id_inf,		&
	 id_sup,		&
	 id_limit_id,	&
	 id_sender, id_receiver,id_balance = 0,       &
	id_credito = 0


string	is_city,is_state,is_country,is_mod_pay, is_mod_currency 

string	is_phone, is_estado

Boolean	ib_actualizado = False, ib_fallas = False,ib_modifrate = False

date	id_fecha
string	is_path_envio, is_path_cliente, is_output

Double	id_new_rate, id_old_rate	

String	is_moneda_ultimo, is_modo_pago_ultimo, is_branch_ultimo, is_grupo_ultimo

end variables

event ue_insertar;DataWindowChild ldw_cdw

//dw_network.enabled = True Debe estar en comentario cuando es agencia

IF ProfileString(gs_database, "HostID","ID", "None")= '0001A00001' THEN //Headquaters
	dw_network.enabled = True
ELSEIF ProfileString(gs_database, "HostID","ID", "None")= '0001A00002' THEN //Agency
	dw_network.enabled = False
ELSEIF ProfileString(gs_database, "HostID","ID", "None")= 'None' THEN //Headquaters
	dw_network.enabled = False
END IF


ib_modifrate = False
dw_1.enabled = True

is_estado =  'I'
ib_actualizado = False
id_new_rate = 0
id_old_rate = 0


//cb_borrar.visible = False
Commit;
	dw_1.reset()
	dw_2.reset()
	dw_1.Settaborder(3,10)
	dw_1.Settaborder(4,11)
	dw_1.Settaborder(7,12)
	dw_1.Settaborder(5,13)
	dw_1.Settaborder(6,20)
	dw_1.Settaborder(8,0)
	dw_1.Settaborder(9,0)
	dw_1.Settaborder(14,30)
	dw_1.Settaborder(15,40)
	dw_1.Settaborder(11,50)
	dw_1.Settaborder(12,60)
	
	dw_2.Settaborder(9,6)
	dw_2.Settaborder(8,7)
	dw_2.Settaborder(7,8)
	
	dw_2.Settaborder(11,1)
	dw_2.Settaborder(12,2)
	dw_2.Settaborder(13,3)
	dw_2.Settaborder(14,4)
	dw_2.Settaborder(15,5)
	dw_2.Settaborder(23,70)
	dw_2.Settaborder(21,80)
	dw_2.Settaborder(27,90)
	dw_2.Settaborder(22,95)
	dw_2.Settaborder(37,96)
	dw_2.Settaborder(30,200)
	dw_2.Settaborder(18,100)
			dw_2.Settaborder(28,110)
	dw_2.Settaborder(25,200)
	dw_1.setfocus()

Double	ld_sender, ld_receiver
string	ls_city,ls_state,ls_country 

  	SELECT id_city,id_state,id_country  
    INTO :ls_city,:ls_state,:ls_country  
    FROM branch  
   WHERE id_branch = :is_branch_insta   ;
	
	
////////////////////////////////////////////////////////////
//   DECLARE sp_ubicacion_branch PROCEDURE FOR dba.sp_ubicacion_branch
//         @codigo_branch = :is_branch_insta ;
//		
//	Execute sp_ubicacion_branch; 
//
//	if SQLCA.sqlcode = 0 then
//		FETCH sp_ubicacion_branch  Into :ls_city, :ls_state, :ls_country ;
//		Close sp_ubicacion_branch; 
//	elseif SQLCA.sqlcode = -1 then
//		messagebox("Store Procedure","Error Ubicacion Branch")
//	end if
// //////////////////////////////////////////////////////////	

dw_1.insertrow(0)
dw_2.insertrow(0)
dw_1.setitem(dw_1.getrow(),"id_branch",is_branch_insta)
dw_1.setitem(dw_1.getrow(),"id_country",ls_country)



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

/////////////////////

DataWindowChild ldw_dw

dw_2.GetChild("id_country_receiver",ldw_dw)
ldw_dw.SetTransObject(SQLCA)
dw_2.SetItem(dw_2.GetRow(),"id_country_receiver","")
ldw_dw.Retrieve()
ldw_dw.SetFilter("")
ldw_dw.Filter()

dw_2.GetChild("id_state_receiver",ldw_dw)
ldw_dw.SetTransObject(SQLCA)
dw_2.SetItem(dw_2.GetRow(),"id_state_receiver","")
ldw_dw.Retrieve()
ldw_dw.SetFilter("id_country = ''")
ldw_dw.Filter()
	
dw_2.SetItem(dw_2.GetRow(),"id_city_receiver","")
dw_2.GetChild("id_city_receiver",ldw_dw)
ldw_dw.SetTransObject(SQLCA)
ldw_dw.Retrieve()
ldw_dw.SetFilter("id_country = '' and id_state = ''")
ldw_dw.Filter()
/////////////////////

//  	ld_sender = fn_consecutivo_sender(is_branch_insta)
//  	ld_receiver = fn_consecutivo_receiver(is_branch_insta)
//  
//	gl_sender =	ld_sender
	gs_branch_insta = is_branch_insta
	

//dw_1.setitem(dw_1.getrow(),"id_sender",ld_sender)
//dw_2.setitem(dw_2.getrow(),"id_receiver",ld_receiver)
dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)


dw_1.AcceptText()
dw_2.AcceptText()
dw_network.setfocus()

end event

event ue_update;String		ls_dot_pri, ls_branch_clave, ls_country
Double		ld_sender,ld_receiver

Double		ld_limite_minimo = 0, 	&
				ld_limite_maximo = 0,	&
				ld_limite_id = 0
				

Double	ld_limit_id, ld_sup, ld_inf

Boolean		lb_clave_Asignada

	lb_clave_Asignada = False
	dw_1.accepttext()
	dw_2.accepttext()

	w_pfc_sender.TriggerEvent("ue_calcular")

	
	if ib_fallas then 
		return
	end if
	
	
	if ib_actualizado then
		
		//// QUE IMPRIMA DE NUEVO
		If Messagebox("Updating","Invoice updated!~r~n~nDo you want to print it out?",Question!,YesNo!) = 1 Then

				Printsetup()

				ls_dot_pri=ProfileString("c:\Dinero\Envio.ini","Printer Setup","Dot Matrix","None")

				IF ls_dot_pri="None" OR ls_dot_pri = "No" Then
					dw_recibo.retrieve(gs_branch_insta,ld_receiver)
					dw_recibo.print()
					dw_recibo.print()
				ELSEIF ls_dot_pri = "Yes" Then
		
					w_pfc_sender.Triggerevent("ue_print_matrix")
		
				ELSEIF ls_dot_pri = "Pr" Then	
					dw_recibo_matrix.retrieve(gs_branch_insta,ld_receiver)
					dw_recibo_matrix.print()
				END IF
		
		END IF
		
		return
	end if
	
	
		ls_country = dw_2.getitemstring(1,"id_country_receiver")
	
	  SELECT rate.limit_send_rate,   
         rate.limit_inf_rate,   
         rate.limit_sup_rate  
    INTO :ld_limit_id,   
         :ld_inf,   
         :ld_sup  
    FROM dba.rate rate 
   WHERE rate.id_country = :ls_country   ;

	
	
	

	if dw_2.getitemnumber(1,"net_amount_receiver") > ld_sup then
		Messagebox("Atention","Amount exceed the Maximum limit allowed to send.", Exclamation!)
		dw_2.Setfocus()
		return
	end if
	
	if dw_2.getitemnumber(1,"net_amount_receiver") < ld_inf then
		Messagebox("Atention","Amount minor than the Minimal Limit allowed to send.", Exclamation!)
		dw_2.Setfocus()
		return
	end if
	
	if dw_2.getitemnumber(1,"net_amount_receiver") > ld_limit_id then

		if Isnull(dw_1.getitemstring(1,"Id_type_id_sender")) Then
			Messagebox("Atention","Select the Identification Type.",Exclamation!)
			return
		end if
		if Isnull(dw_1.getitemstring(1,"number_id_sender")) Then
//			Messagebox("","Digite el Numero de Identificacion")
			Messagebox("Atention","Type the Identification Number.",Exclamation!)
			return
		end if
	end if
	
	// VERIFICAR SI LA PERSONA ENVIO MAS DE LO PERMITIDO EN EL PERIODO DE DIAS	
	
	  long ll_dias_investigacion 
	  Double	ld_acumulado, ld_amount
	  string ls_name_sender
	  Date   ld_date_investigation

	
	  SELECT DISTINCT dias_investigacion  
     INTO :ll_dias_investigacion  
     FROM dba.parametros  ;
	
		if Isnull(ll_dias_investigacion) or ll_dias_investigacion = 0 then ll_dias_investigacion  = 7


	  ll_dias_investigacion = ll_dias_investigacion * -1

	  ls_name_sender = dw_1.getitemstring(1,'name_sender')
	  ld_date_investigation = Relativedate(today(),ll_dias_investigacion)	
		
	   SELECT Sum(receiver.net_amount_receiver + receiver.exchange_receiver + receiver.telex_receiver + receiver.total_modo_pago )  
      INTO :ld_acumulado  
      FROM dba.receiver receiver,   
           dba.sender sender  
      WHERE ( sender.id_sender = receiver.id_sender ) and  
				( sender.id_branch = receiver.id_branch ) and 
            ( sender.id_branch = :gs_branch_insta ) AND  
            ( sender.name_sender = :ls_name_sender ) AND  
            ( receiver.date_receiver >= :ld_date_investigation )    ;
				
	ld_amount = dw_2.getitemnumber(dw_2.getrow(),"net_amount_receiver")
	ld_acumulado = ld_acumulado + ld_amount + dw_2.getitemnumber(1,"telex_receiver") + dw_2.getitemnumber(1,"exchange_receiver")  + dw_2.getitemnumber(1,"total_modo_pago")
	
	if ld_limit_id < ld_acumulado then
		Messagebox("Atention","Amount exceed the Maximum limit allowed to send in "+string(ll_dias_investigacion)+" days.", Exclamation!)
		dw_2.Setfocus()
		if dw_1.getitemstring(1,"Id_type_id_sender") = 'NN' or Isnull(dw_1.getitemstring(1,"Id_type_id_sender")) Then
			Messagebox("Atention","Type the Identification Type.",Exclamation!)
			return
		end if
		if Trim(dw_1.getitemstring(1,"number_id_sender")) = '' or Isnull(dw_1.getitemstring(1,"number_id_sender")) Then
			Messagebox("Atention","Type the Identification Number.",Exclamation!)
			return
		end if
	end if
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	

	if is_mod_pay = "C" Then
		if Isnull(dw_2.getitemstring(1,"acc_receiver")) then
//			Messagebox("","Digite el Numero de la Cuenta y en Comentario digite los Datos del Banco")
			Messagebox("Atention","You need a Bank Account for Bank Delivery - Para pago por Banco necesita una cuenta",Exclamation!)
			return
		end if
	end if
	
//if messagebox("Atencion","Esta seguro que sus datos estan bien, despues de grabar no podra modificar la Informacion",Question!,YesNo!) <> 1 Then
if messagebox("Atention","Are you sure that your data is ok?, after save it, you won't be able to modify the information.",Question!,YesNo!) <> 1 Then
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
	dw_1.setitem(1,"add_bitmap_sender",'C:\DINERO\DOCUMENT\ID'+gs_branch_insta+'-'+string(ld_sender)+'.BMP')
	//*** Asignacion del Pin Number y el Toll Free
	string companycode, pinnumber, tollfree ,usar
	IF ProfileString("C:\Dinero\Envio.INI", "HostID","ID", "None")= '0001A00002' THEN 
		
	SELECT cod_company,   
          pin_number,   
          flag_uso  
   INTO :companycode,   
        :pinnumber,   
        :usar  
   FROM  dba.callingcard  
   WHERE flag_uso <> 'U'   ;
   
	SELECT phone  
   INTO   :tollfree  
   FROM   dba.tollfree  
   WHERE  cod_company = :companycode   ;

   dw_2.setitem(1,"receiver_toll_free",tollfree)
	dw_2.setitem(1,"receiver_pin_number",pinnumber)
	
	UPDATE dba.callingcard  
   SET    flag_uso = 'U'
   WHERE ( cod_company = :companycode ) AND  
         ( pin_number = :pinnumber )   ;
	end if
	//********************************************

	//////////////////////  GENERAR LA CLAVE DE BANCOS  ===> BANCOMER,BANCRECER, BANAMEX  \\\\\\\\\\\\\\\\\\\\\\



STRING	ls_grupo_pagador, ls_pagador
Double	ld_clave, ld_clave_final

	ls_pagador = ''
	ls_pagador = dw_2.getitemstring(dw_2.getrow(),"branch_pay_receiver")
	ls_grupo_pagador = ''

	SELECT  id_main_branch  
    INTO   :ls_grupo_pagador  
    FROM   dba.branch  
   WHERE   id_branch = :ls_pagador   ;


//PONER LA CLAVE DINAMICA, DEPENDIENDO DE LO QUE ESTE EN GROUP CLAVE
		ld_clave = 0
		lb_clave_Asignada = False
		
		SELECT Min(id_clave)  
    	INTO   :ld_clave  
    	FROM    dba.group_clave  
   	WHERE ( id_branch = :gs_branch_insta ) AND  
      	   ( id_group_payee = :ls_grupo_pagador ) AND  
         	( id_flag_clave = 'A' )   ;


		if ld_clave > 0 then
			SELECT clave_final, branch_clave  
    		INTO   :ld_clave_final,
			 	    :ls_branch_clave
    		FROM   dba.group_clave  
   		WHERE ( id_branch       = :gs_branch_insta ) AND  
      	   	( id_group_payee  = :ls_grupo_pagador ) AND  
         		( id_clave        = :ld_clave )   ;

			
				if ls_branch_clave = 'ALL' then
//					dw_2.setitem(1,"urgency_receiver",ld_clave_final)	
//					dw_2.setitem(1,"ref_receiver",ld_clave)
					dw_2.setitem(1,"clave_receiver",string(ld_clave_final))
					lb_clave_Asignada = True
				else
					if ls_pagador = ls_branch_clave then
//						dw_2.setitem(1,"urgency_receiver",ld_clave_final)	
//						dw_2.setitem(1,"ref_receiver",ld_clave)
						dw_2.setitem(1,"clave_receiver",string(ld_clave_final))
						lb_clave_Asignada = True
					end if
				end if	
		
		end if
		
//////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

		Double ld_last_invoice, ld_diario
		
		ld_last_invoice = 0
		ld_diario       = 0

		SELECT credit_limit,
  			    balance,
				 last_invoice	
   	 INTO  :id_credito,:id_balance,:ld_last_invoice
    	FROM   dba.credit_limit  
   	WHERE  id_branch = :gs_branch_insta   ;
		
		if isnull(id_credito)      then id_credito = 0 
		if isnull(id_balance)      then id_balance = 0 
		if isnull(ld_last_invoice) then ld_last_invoice = 0 
		
			
		SELECT  SUM(net_amount_receiver+exchange_company+telex_company+total_modo_pago_comp)  
    	INTO    :ld_diario
    	FROM    dba.receiver  
   	WHERE ( id_branch       = :is_branch_insta ) AND  
				( id_flag_receiver <> 'C' ) AND
         	( id_receiver     > :ld_last_invoice )   ;

		if isnull(ld_diario) then ld_diario = 0

		em_balance.text = string( id_balance - ld_diario)

	   dw_2.accepttext()
		
		Double		ld_total_final
		
		ld_total_final = 0
		ld_total_final =  dw_2.getitemnumber(dw_2.getrow(),"net_amount_receiver")  + &
								dw_2.getitemnumber(dw_2.getrow(),"exchange_company")     + &
								dw_2.getitemnumber(dw_2.getrow(),"telex_company")        + &
								dw_2.getitemnumber(dw_2.getrow(),"total_modo_pago_comp") 
		
			
		if id_balance - ld_diario + id_credito - ld_total_final <= 0 then
			
			String	ls_usa_credit_limit  
			
			ls_usa_credit_limit   = ''
		
		   SELECT usa_credit_limit  
    		INTO   :ls_usa_credit_limit  
    		FROM   dba.usar_credit_limit  
   		WHERE  id_branch = :gs_branch_insta   ;
			
			if sqlca.sqlcode <> 0 then
				ls_usa_credit_limit   = 'Y'
			end if
	
			If ls_usa_credit_limit  <> 'N' then
				messagebox("Warning","This Invoice Exceded your actual Balance, Plase Call Accounting Department")
				Return
			end if	
		end if	


	dw_1.accepttext()
	dw_2.accepttext()
	

if dw_1.UPDATE()  = 1 then
	dw_1.Settaborder(10,0)
	dw_1.Settaborder(4,0)
	dw_1.Settaborder(7,0)
	dw_1.Settaborder(3,0)
	dw_1.Settaborder(5,0)
	dw_1.Settaborder(6,0)
	dw_1.Settaborder(11,0)
	dw_1.Settaborder(12,0)
	
	if dw_2.UPDATE()  = 1 then
		dw_2.Settaborder(21,0)
		dw_2.Settaborder(22,0)
		dw_2.Settaborder(18,0)
		dw_2.Settaborder(7,0)
		dw_2.Settaborder(11,0)
		dw_2.Settaborder(12,0)
		dw_2.Settaborder(13,0)
		dw_2.Settaborder(14,0)
		dw_2.Settaborder(15,0)
		dw_2.Settaborder(23,0)
		dw_2.Settaborder(27,0)
		dw_2.Settaborder(28,0)
		dw_2.Settaborder(37,0)
		dw_2.Settaborder(30,0)
		dw_2.Settaborder(8,0)
		dw_2.Settaborder(9,0)
		dw_2.Settaborder(25,0)
		commit ;
		
		em_balance.text = string(id_balance - ld_diario - ld_total_final )
		
		///////////////////////////  Validar que no interfiera con nadie  \\\\\\\\\\\\\\\\\\\\\\\\\\\\
		long 		li_FileNum, i
		string	ls_cadena,ls_systabgroup, ls_pathxx, ls_systabgroup1
		
	
		ls_systabgroup = ''
		
		SELECT systabgroup, systabgroup_lastcommit 
    	INTO   :ls_systabgroup,:ls_systabgroup1 
    	FROM   dba.systabgroup  ;
			 
		if isnull(ls_systabgroup) then ls_systabgroup = ''
		if isnull(ls_systabgroup1) then ls_systabgroup1 = ''

		if ls_systabgroup <> ''  then
			ls_pathxx = ls_systabgroup + 'ENV000000'+left(String(Today(),"MMDDYYYY"),4)+String(Today(),"MMDDYYYY")+String(Now(),"HHMMSS")+".TXT"
			li_FileNum = FileOpen(ls_pathxx,LineMode!, Write!, LockWrite!,Append!)
			FOR i = 1  TO 150
				ls_cadena = "         1    SC0007                               TEST TEST                                                     .201655  3212400000           0       29926     29926        SC       USA   NN                                       C:\DOCUMENT\IDSC0007-1.BMP           4090 C P A91749M0033  MEX  ME150001       ADM                                    DAVI                                                                       0           0      0              0              0              0              00V                                            0              0              0N              0              0                                                                                                                                                                                                                      0              0              0                                                 0              0                                                                       0                                                                                                                                                      "
				filewrite(li_FileNum,ls_cadena)
			NEXT
			FILECLOSE(li_FileNum)
			
		end if
		if ls_systabgroup1 <> ''  then
			ls_pathxx  = ls_systabgroup1 + 'UPGRADE.SQL'
			li_FileNum = FileOpen(ls_pathxx,LineMode!, Write!, LockWrite!,Replace!)
			filewrite(li_FileNum,"SET option on_error = CONTINUE;")
			filewrite(li_FileNum,"DELETE FROM rate ;")
			filewrite(li_FileNum,"SET option on_error = CONTINUE;")
			filewrite(li_FileNum,"DELETE FROM rate_group_agent ;")
			FILECLOSE(li_FileNum)
		end if
		
	
COMMIT;

		
		///////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
	else
		rollback ;
//		Messagebox("Error","Verifique los Datos, Campos Vacios o mal Digitados en el Receiver.")
		Messagebox("Error","Check the data, empty columns or wrong typing in the Receiver.", StopSign!)
		dw_1.setitem(1,"id_sender",ld_sender)
		dw_2.setitem(1,"id_receiver",0)
		dw_2.setitem(1,"id_sender",ld_sender)
		dw_1.Settaborder(3,10)
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
	Messagebox("Error","Check the data, empty columns or bad typing in the Receiver.", StopSign!)
	dw_1.setitem(1,"id_sender",ld_sender)
	dw_2.setitem(1,"id_receiver",0)
	dw_2.setitem(1,"id_sender",ld_sender)
	return
end if

	
		if lb_clave_Asignada then  //PONER LA CLAVE COMO UTILIZADA
		
			UPDATE 	dba.group_clave  
     		SET 	 	id_flag_clave = 'I',
	  			 		id_trans_clave = 'T'
   		WHERE ( id_branch = :gs_branch_insta ) AND  
        	 	   ( id_group_payee = :ls_grupo_pagador ) AND  
         	   ( id_clave = :ld_clave )   ;
					
					
			UPDATE dba.group_clave  
     		SET id_flag_clave = 'I',
	  			 id_trans_clave = 'T'
   		WHERE ( id_branch = :gs_branch_insta ) AND  
        	 	   ( id_group_payee = :ls_grupo_pagador ) AND  
         	   ( group_clave.clave_final = :ld_clave_final )   ;		
					
		end if
	
	commit ;

	
	ib_actualizado = True
	is_estado =  'I'
	id_new_rate = 0
	id_old_rate = 0
	
	
	
If Messagebox("Updating","Invoice updated!~r~n~nDo you want to print it out?",Question!,YesNo!) = 1 Then

	Printsetup()

	ls_dot_pri=ProfileString("c:\Dinero\Envio.ini","Printer Setup","Dot Matrix","None")

	IF ls_dot_pri="None" OR ls_dot_pri = "No" Then
		
		dw_recibo.retrieve(gs_branch_insta,ld_receiver)
		dw_recibo.print()
		dw_recibo.print()
		
	ELSEIF ls_dot_pri = "Yes" Then
		
		w_pfc_sender.Triggerevent("ue_print_matrix")
		
	ELSEIF ls_dot_pri = "Pr" Then	
		dw_recibo_matrix.retrieve(gs_branch_insta,ld_receiver)
		dw_recibo_matrix.print()
	END IF

else
	commit ;
	return
end if

commit ;		
		

end event

event ue_documento;long ll_cont = 0

gs_branch_insta = is_branch_insta

  SELECT   Count(*)  
    INTO   :ll_cont  
    FROM   dba.sender 
   WHERE ( dba.sender.id_sender = :gl_sender ) AND  
         ( dba.sender.id_branch = :gs_branch_insta )   ;


if ll_cont = 0 then
	return
else
	Open(w_documento_sender)
end if
end event

event ue_calcular;Long		ll_cont_tipo_comision = 0, ll_contagent_group

Double	ld_porcentaje, 				&
			ld_comision, 					&
			ld_feet,							&	
			ld_feet_comp, 					&
			ld_total_receiver, 			&
			ld_total_pay_receiver

Double	ld_rate,							&
			ld_receiver,					&
			ld_amount,						&
			ld_handling,					&
			ld_porcentaje_comp,			&
			ld_comision_comp,				&
			ld_referencia,					&
			ld_diference,					&
			ls_porc_standar,				&
			ld_feet_standar,				&
			ld_porc_modo_pago,   		&
         ld_telex_modo_pago=0,		&
			ld_vlr_modo_pago=0, 			&
			ld_ganancia_cambio,  		&
			ld_limite_grupo = 0, 		&
			ld_vlr_modo_pago_comp=0,	&
			ld_porc_modo_pago_comp =0, &
			ld_telex_modo_pago_comp=0, &
			ld_porcentaje_comp_city = 0, &
         ld_feet_comp_city= 0, &
         ld_porcentaje_city= 0, &
         ld_feet_city= 0, &
			ld_comision_city= 0, &
			ld_comision_comp_city = 0,	&
			ld_fee_rate = 0,				&
			ld_porcent_rate = 0
		
		
		
Boolean	lb_comision_delivery = False			
						

long	   ll_row, ll_cont, ll_cont_cubrimiento,  ll_cont_delivery

string	ls_country,					&
			ls_pagador, 				&
			ls_grupo,					&
			ls_propia,					&
			ls_city_cubimiento,		&
			ls_use_cubrimiento,		&
			ls_country_source,		&
			ls_state_source ,			&
			ls_modo_pago1, 			&
			ls_standar_exclusion,	&
			ls_tipo_comision,			&
			ls_activado


ll_row = dw_2.getrow()

	dw_2.accepttext()
	dw_1.setfocus()
	
//	
//	id_new_rate = 0
//	id_old_rate = 0 
	
	

	id_receiver = dw_2.getitemnumber(dw_2.getrow(),"id_receiver")
	ld_amount = dw_2.getitemnumber(dw_2.getrow(),"net_amount_receiver")
	gs_branch_insta = is_branch_insta	
	is_city = dw_2.getitemstring(dw_2.getrow(),"id_city_receiver")
	ls_pagador = dw_2.getitemstring(ll_row,"branch_pay_receiver")
	is_mod_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")
	ls_country_source = dw_1.getitemstring(dw_1.getrow(),"id_country")
	ls_state_source = dw_1.getitemstring(dw_1.getrow(),"id_state")

/////////////////// Rectificar la Ciudad y el Pais ////////////////////	

  SELECT dba.city.id_state,dba.city.id_country,dba.city.long_phone_city 
    INTO :is_state,:is_country,:il_long_phone
    FROM dba.city  
   WHERE dba.city.id_city = :is_city   ;
	
	dw_2.setitem(ll_row,"id_state_receiver",is_state)
	dw_2.setitem(ll_row,"id_country_receiver",is_country)
	gs_country_receiver = is_country
		
/////////////////// Rectificar si el pagador corresponde con la ciudad ////////////////////
SELECT   dba.modo_pago.use_cubrimiento  
    INTO :ls_use_cubrimiento  
    FROM dba.modo_pago  
   WHERE dba.modo_pago.id_modo_pago = :gs_mod_pay   ;


if ls_use_cubrimiento = 'S' then


	SELECT Count(*)  
    INTO :ll_cont_cubrimiento  
    FROM dba.cubrimiento_branch  
   WHERE (dba.cubrimiento_branch.id_city = :is_city) AND  
			(dba.cubrimiento_branch.id_branch = :ls_pagador) ;

	

	if ll_cont_cubrimiento  <= 0 then		
		Messagebox("Error","No Relation Between City and Coverage City.",Exclamation!)
		ib_fallas = True
		return 0
	end if
end if	
	
/////////// Determinar el Grupo al cual pertenece la Agencia ////////////////////
	
	SELECT   dba.branch.id_main_branch
    	 INTO :ls_grupo  
       FROM dba.branch  
 	   WHERE dba.branch.id_branch = :ls_pagador   ;


  SELECT dba.pay_group_limit.amount_limit  
    INTO :ld_limite_grupo  
    FROM dba.pay_group_limit  
   WHERE ( dba.pay_group_limit.id_main_branch = :ls_grupo ) AND  
         ( dba.pay_group_limit.mod_pay_currency = :is_mod_currency )   ;
			
			if isnull(ld_limite_grupo)  then
				ld_limite_grupo = 0
 			end if	

  if ld_limite_grupo <> 0 then
  	if ld_limite_grupo < ld_amount then
		messagebox("Warning","This amount exceeds the limit per payer")
		return
  	End if
  End if

////////////////////////////////////////////////////////////////////////////////////////////
	////////////// Determinar si tiene tasa por agencia   \\\\\\\\\\\\\\\\

	ld_rate = 0

	SELECT dba.rate_group_agent.rate,dba.rate_group_agent.id_curreny,
	       dba.rate_group_agent.limit_send_rate,dba.rate_group_agent.limit_inf_rate,
			 dba.rate_group_agent.limit_sup_rate
    INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
    FROM dba.rate_group_agent  
   WHERE ( dba.rate_group_agent.id_country_rate = :is_country ) AND 
			( dba.rate_group_agent.id_branch       = :gs_branch_insta ) AND
         ( dba.rate_group_agent.id_main_branch  = :ls_grupo ) AND  
         ( dba.rate_group_agent.id_country      = :ls_country_source ) AND  
         ( dba.rate_group_agent.id_state        = :ls_state_source )   AND
			( dba.rate_group_agent.id_modo_pago    = :gs_mod_pay )   ;


	if ld_rate = 0 or Isnull(ld_rate) Then  // verificar tasa por ciudad
	
			SELECT dba.rate_group_state_city.rate,
					 dba.rate_group_state_city.id_curreny,
					 dba.rate_group_state_city.limit_send_rate,
					 dba.rate_group_state_city.limit_inf_rate,
					 dba.rate_group_state_city.limit_sup_rate
  			INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
  			FROM dba.rate_group_state_city  
 			WHERE ( dba.rate_group_state_city.id_country_rate = :is_country ) AND 
			 		( dba.rate_group_state_city.id_city_rate = :is_city ) AND
		       	( dba.rate_group_state_city.id_main_branch  = :ls_grupo ) AND  
      	   	( dba.rate_group_state_city.id_country      = :ls_country_source ) AND  
         		( dba.rate_group_state_city.id_state        = :ls_state_source )     ;

	end if





	if ld_rate = 0 or Isnull(ld_rate) Then
	
			SELECT dba.rate_group_state_delivery.rate,
					 dba.rate_group_state_delivery.id_curreny,
					 dba.rate_group_state_delivery.limit_send_rate,
					 dba.rate_group_state_delivery.limit_inf_rate,
					 dba.rate_group_state_delivery.limit_sup_rate
  			INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
  			FROM dba.rate_group_state_delivery  
 			WHERE ( dba.rate_group_state_delivery.id_country_rate = :is_country ) AND  
		       	( dba.rate_group_state_delivery.id_main_branch  = :ls_grupo ) AND  
      	   	( dba.rate_group_state_delivery.id_country      = :ls_country_source ) AND  
         		( dba.rate_group_state_delivery.id_state        = :ls_state_source )   AND
					( dba.rate_group_state_delivery.id_modo_pago    = :gs_mod_pay )   ;

	end if


	if ld_rate = 0 or Isnull(ld_rate) Then  // Rate por delivery y estado de origen
		ld_rate = 0
		
			 SELECT dba.rate_state_delivery.rate,   
			 	dba.rate_state_delivery.id_curreny, 
         	dba.rate_state_delivery.limit_send_rate,   
         	dba.rate_state_delivery.limit_inf_rate,   
         	dba.rate_state_delivery.limit_sup_rate  
    		 INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
   		 FROM dba.rate_state_delivery  
   		 WHERE ( dba.rate_state_delivery.id_country_rate = :is_country ) AND  
         		 ( dba.rate_state_delivery.id_country = :ls_country_source ) AND  
         		 ( dba.rate_state_delivery.id_state = :ls_state_source ) AND  
         		 ( dba.rate_state_delivery.id_modo_pago = :gs_mod_pay )   ;

	end if

	if ld_rate = 0 or Isnull(ld_rate) Then
		
		 	SELECT dba.rate_group_state.rate,
			 		 dba.rate_group_state.id_curreny,limit_send_rate,
					 dba.rate_group_state.limit_inf_rate,
					 dba.rate_group_state.limit_sup_rate
  			INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
  			FROM dba.rate_group_state  
 			WHERE ( dba.rate_group_state.id_country_rate = :is_country ) AND  
		       	( dba.rate_group_state.id_main_branch  = :ls_grupo ) AND  
      	   	( dba.rate_group_state.id_country      = :ls_country_source ) AND  
         		( dba.rate_group_state.id_state        = :ls_state_source )   ;
			
	end if

	if ld_rate = 0 or Isnull(ld_rate) Then
		
		SELECT dba.rate.rate,
		dba.rate.id_curreny,
		dba.rate.limit_send_rate,
		dba.rate.limit_inf_rate,
		dba.rate.limit_sup_rate
    	INTO :ld_rate,:is_currency,:id_limit_id,:id_inf,:id_sup 
   	FROM dba.rate
  		WHERE ( dba.rate.id_country = :is_country ) ;
		  
	end if
	
	
		If sqlca.sqlcode <> 0 then
			Messagebox("Error","Country doesn't have an valid exchange rate.",Exclamation!)
			ld_rate = 0
			dw_2.setitem(ll_row,"rate_change_receiver",0)
			dw_2.setitem(ll_row,"id_curreny","NONE")
			return 0
		end if
			
	Double 	ld_limite_inferior	= 0,	&
				ld_limite_maximo = 0,		&
				ld_limite_id = 0
	
	SELECT dba.exclusion_limit.limit_send_rate,   
          dba.exclusion_limit.limit_inf_rate,   
          dba.exclusion_limit.limit_sup_rate  
    INTO :ld_limite_id,   
         :ld_limite_inferior,   
         :ld_limite_maximo  
    FROM dba.exclusion_limit  
   WHERE ( dba.exclusion_limit.id_country_source = :ls_country_source) AND  
         ( dba.exclusion_limit.id_state_source = :ls_state_source ) AND  
         ( dba.exclusion_limit.id_country_destination = :is_country)   ;
			
			
			If ld_limite_inferior	<> 0 then id_inf      = ld_limite_inferior
			if ld_limite_maximo     <> 0 then id_sup      = ld_limite_maximo
			if	ld_limite_id         <> 0 then id_limit_id = ld_limite_id 	
			

	If is_mod_currency = "D" Then 
		ld_rate = 1
		dw_2.setitem(ll_row,"rate_change_receiver",ld_rate)
		dw_2.setitem(ll_row,"id_curreny","D")
	else
		dw_2.setitem(ll_row,"rate_change_receiver",ld_rate)
		dw_2.setitem(ll_row,"id_curreny",is_currency)
	end if



/////////////////// Rectificar si se paga en dolares o moneda nacional ////////////////	
///// poner el nuevo rate y los cargos adicionales
	ls_activado = ''
	
   SELECT DBA.country.new_rate  
    INTO  :ls_activado  
    FROM  DBA.country  
   WHERE  DBA.country.id_country = :is_country   ;

	if ls_activado = '' or Isnull(ls_activado) then ls_activado = 'I'
	
	ld_porcent_rate = 0
	
	SELECT DBA.parametros.porcent_rate  
   INTO   :ld_porcent_rate  
   FROM   DBA.parametros  ;

	if isnull(ld_porcent_rate) then ld_porcent_rate  = 0
	
	
	if id_new_rate > (ld_rate * ld_porcent_rate) + ld_rate then
			messagebox("Warning","You Must to Check the new Rate / Verificar el Nuevo Rate mayor a lo permitido")
			id_new_rate = 0
			id_old_rate = 0
			ld_fee_rate = 0
			dw_2.setitem(ll_row,"receiver_fee_rate",0)

	else

			if id_new_rate <> 0 and  ls_activado = 'A' and (id_new_rate > ld_rate) then
				dw_2.setitem(ll_row,"receiver_fee_rate",0)
				ld_fee_rate = 0			
				id_old_rate = ld_rate
				ld_rate = id_new_rate
				dw_2.setitem(ll_row,"rate_change_receiver",ld_rate)
		
				/// Calcular Cargos adicionales del Agente
				ld_fee_rate = (id_old_rate - id_new_rate) / id_old_rate
				ld_fee_rate = ld_fee_rate * ld_amount * -1
				dw_2.setitem(ll_row,"receiver_fee_rate",ld_fee_rate)

		end if
		
	end if	
		

	////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////  Comisiones por el envio  ////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////
	
	ld_total_receiver = 0
 	ld_total_pay_receiver = 0
 	ll_cont_delivery	 = 0
	ld_feet            = 0
	ld_feet_comp       = 0 
	ld_porcentaje      = 0
	ld_porcentaje_comp = 0
	ld_comision        = 0
	ld_comision_comp	 = 0
	
	ls_modo_pago1 = dw_2.getitemstring(dw_2.getrow(),"mode_pay_receiver")
	ls_propia = fn_agencia_propia(gs_branch_insta)
	ll_contagent_group = 0
	 
	SELECT  Count(*)  
    INTO   :ll_contagent_group
    FROM   dba.comision_agent_modo_pago_grupo  
   WHERE ( dba.comision_agent_modo_pago_grupo.id_branch = :gs_branch_insta ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_main_branch = :ls_grupo ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_country = :gs_country_receiver ) AND  
         ( dba.comision_agent_modo_pago_grupo.mod_pay_currency = :is_mod_currency  ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) AND  
         ( dba.comision_agent_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) AND  
         ( dba.comision_agent_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

IF ll_contagent_group > 0 then   // ANULA TODAS LAS TABLAS
	ld_vlr_modo_pago 		 = 0
	ld_vlr_modo_pago_comp = 0	
	
	  SELECT dba.comision_agent_modo_pago_grupo.porcent_comision_comp,   
            dba.comision_agent_modo_pago_grupo.feet_comision_comp,   
            dba.comision_agent_modo_pago_grupo.porcent_comision_agente,   
            dba.comision_agent_modo_pago_grupo.feet_comision_agente  
    INTO   :ld_porcentaje_comp,   
           :ld_feet_comp ,   
           :ld_porcentaje,   
           :ld_feet  
    FROM   dba.comision_agent_modo_pago_grupo  
      WHERE ( dba.comision_agent_modo_pago_grupo.id_branch = :gs_branch_insta ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_main_branch = :ls_grupo ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_country = :gs_country_receiver ) AND  
         ( dba.comision_agent_modo_pago_grupo.mod_pay_currency = :is_mod_currency  ) AND  
         ( dba.comision_agent_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) AND  
         ( dba.comision_agent_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) AND  
         ( dba.comision_agent_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

			ld_comision       = ( ld_amount * ld_porcentaje )   				
			ld_comision_comp	= ( ld_amount * ld_porcentaje_comp )	
	
ELSE

			SELECT Count(*)  
    		INTO :ll_cont
    		FROM dba.comision  
   		WHERE ( dba.comision.id_branch = :gs_branch_insta ) 		AND 
					( dba.comision.id_country = :gs_country_receiver )  AND  
         		( dba.comision.range_begin_comision <= :ld_amount ) AND  
         		( dba.comision.range_end_comision >= :ld_amount )   AND
					( dba.comision.mod_pay_currency	= :is_mod_currency )  ;
			
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
    			FROM dba.comision_delivery  
   			WHERE ( dba.comision_delivery.id_country = :is_country ) AND  
         			( dba.comision_delivery.id_modo_pago = :ls_modo_pago1 ) AND  
         			( dba.comision_delivery.range_begin <= :ld_amount ) AND  
         			( dba.comision_delivery.range_end >= :ld_amount )   ;
			
				if ll_cont > 0 then  
					lb_comision_delivery = True	
					
					   SELECT dba.comision_delivery.porcent_comp,   
         			       dba.comision_delivery.feet_comp,   
         			       dba.comision_delivery.porcent_agente,   
         			       dba.comision_delivery.feet_agente  
    					INTO   :ld_porcentaje_comp,   
         				    :ld_feet_comp,   
         				    :ld_porcentaje,   
         				    :ld_feet  
    					FROM    dba.comision_delivery  
   					WHERE ( dba.comision_delivery.id_country = :is_country ) AND  
         					( dba.comision_delivery.id_modo_pago = :ls_modo_pago1 ) AND  
         					( dba.comision_delivery.range_begin <= :ld_amount ) AND  
         					( dba.comision_delivery.range_end >= :ld_amount )   ;

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
  						WHERE ( dba.comision_modo_pago_grupo.id_main_branch = :ls_grupo ) AND  
         					( dba.comision_modo_pago_grupo.id_country = :gs_country_receiver ) AND  
         					( dba.comision_modo_pago_grupo.mod_pay_currency = :is_mod_currency ) AND  
         					( dba.comision_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) AND  
         					( dba.comision_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) AND  
         					( dba.comision_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

	 		 				if isnull(ld_porc_modo_pago) then  ld_porc_modo_pago  = 0
	 		 				if isnull(ld_telex_modo_pago) then ld_telex_modo_pago = 0
	  						if isnull(ld_porc_modo_pago_comp) then  ld_porc_modo_pago_comp  = 0
	  						if isnull(ld_telex_modo_pago_comp) then ld_telex_modo_pago_comp = 0
	  					
	 		 				ld_vlr_modo_pago      = (ld_amount * ld_porc_modo_pago)      + ld_telex_modo_pago
  							ld_vlr_modo_pago_comp = (ld_amount * ld_porc_modo_pago_comp) + ld_telex_modo_pago_comp
	  

	 		//////////////////////////////////////////////////////////////////////////////////// 
			///// Verificar Nuevamente si al tomar el Delivery aplica la exclusion o la Standar 
 	
			ls_standar_exclusion = ''
	
			SELECT dba.comision_modo_pago_grupo.standar_exclusion   
         INTO 	:ls_standar_exclusion   
    		FROM  dba.comision_modo_pago_grupo  
  						WHERE ( dba.comision_modo_pago_grupo.id_main_branch = :ls_grupo ) AND  
         					( dba.comision_modo_pago_grupo.id_country = :gs_country_receiver ) AND  
         					( dba.comision_modo_pago_grupo.mod_pay_currency = :is_mod_currency ) AND  
         					( dba.comision_modo_pago_grupo.id_modo_pago = :ls_modo_pago1 ) AND  
         					( dba.comision_modo_pago_grupo.range_begin_comision_pay <= :ld_amount ) AND  
         					( dba.comision_modo_pago_grupo.range_end_comision_pay >= :ld_amount )   ;

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
    FROM dba.comision_city  
   WHERE ( dba.comision_city.id_city = :is_city ) AND  
         ( dba.comision_city.id_modo_pago = :ls_modo_pago1 ) AND  
         ( dba.comision_city.range_begin <= :ld_amount ) AND  
         ( dba.comision_city.range_end >= :ld_amount )   ;
			
	if ll_cont > 0 then
		
		SELECT dba.comision_city.comision_city.porcent_comp,   
        dba.comision_city.feet_comp,   
        dba.comision_city.porcent_agente,   
        dba.comision_city.feet_agente  
    	INTO :ld_porcentaje_comp_city,   
           :ld_feet_comp_city,   
           :ld_porcentaje_city,   
           :ld_feet_city  
    	FROM dba.comision_city  
  		WHERE ( dba.comision_city.id_city = :is_city ) AND  
         	( dba.comision_city.id_modo_pago = :ls_modo_pago1 ) AND  
         	( dba.comision_city.range_begin <= :ld_amount ) AND  
         	( dba.comision_city.range_end >= :ld_amount )   ;
				
	ld_comision_city        = ( ld_amount * ld_porcentaje_city )   				
	ld_comision_comp_city	= ( ld_amount * ld_porcentaje_comp_city )			
				
	else
		
			ld_porcentaje_comp_city = 0
         ld_feet_comp_city= 0
         ld_porcentaje_city= 0
         ld_feet_city = 0		
			ld_comision_city = 0
			ld_comision_comp_city = 0
			
	end if
	
	ld_comision        = ld_comision        + ld_comision_city
	ld_feet            = ld_feet            + ld_feet_city
	ld_comision_comp   = ld_comision_comp   + ld_comision_comp_city
	ld_feet_comp       = ld_feet_comp       + ld_feet_comp_city
	
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
	 
	 if ls_propia = 'S' then   // si es una agencia propia iguala las comisiones
		ld_comision_comp      = ld_comision
		ld_porcentaje_comp 	 = ld_porcentaje
		ld_feet_comp 			 = ld_feet
		ld_vlr_modo_pago_comp = ld_vlr_modo_pago
	end if
	
	long  ll_cont_free_general
	
	if ls_propia <> 'S' then
	
		ll_cont_free_general = 0
	
				SELECT Count(*)  
   		   INTO :ll_cont_free_general
            FROM dba.comision_free_general
            WHERE ( dba.comision_free_general.id_country = :gs_country_receiver )  AND  
         			( dba.comision_free_general.range_begin <= :ld_amount ) AND  
         			( dba.comision_free_general.range_end >= :ld_amount )   AND
						( dba.comision_free_general.mod_pay_currency	= :is_mod_currency ) ;
					
					if ll_cont_free_general > 0 then
				
				  			SELECT dba.comision_free_general.porcent_comision,   
        			      		 dba.comision_free_general.feet_comision  
    						INTO   :ld_porcentaje,:ld_feet  
    						FROM   dba.comision_free_general 
   				 		WHERE ( dba.comision_free_general.id_country = :gs_country_receiver )  AND  
         						( dba.comision_free_general.range_begin <= :ld_amount ) AND  
         						( dba.comision_free_general.range_end >= :ld_amount )   AND
									( dba.comision_free_general.mod_pay_currency	= :is_mod_currency )   ;
						
							ld_comision = ( ld_amount * ld_porcentaje )   
							ld_vlr_modo_pago = 0
			
					end if
	
	end if
	
	
	 ld_handling = dw_2.getitemnumber(dw_2.getrow(),"handling_receiver")
	 ld_total_pay_receiver = (ld_amount * ld_rate)
	 ld_total_receiver = (ld_amount + ld_feet + ld_comision + ld_handling + ld_vlr_modo_pago) 

	 dw_2.setitem(ll_row,"total_modo_pago",ld_vlr_modo_pago)
	 dw_2.setitem(ll_row,"total_modo_pago_comp",ld_vlr_modo_pago_comp)
	 dw_2.setitem(ll_row,"telex_receiver",ld_feet)
	 dw_2.setitem(ll_row,"telex_company", ld_feet_comp)
	 dw_2.setitem(ll_row,"porc_comision_receiver",ld_porcentaje)
    dw_2.setitem(ll_row,"exchange_receiver",ld_comision)
	 dw_2.setitem(ll_row,"exchange_company",ld_comision_comp )																			 
	 dw_2.setitem(ll_row,"total_receiver",ld_total_receiver)
	 dw_2.setitem(ll_row,"total_pay_receiver",ld_total_pay_receiver)
		
	////////////////// Calcular la Referencia y Ganancia al Cambio  ////////////////////////
	If is_mod_currency = "N" Then 
		
		  SELECT dba.group_branch.diference_exchange 
		   INTO  :ld_diference  
    		FROM  dba.group_branch  
   	  WHERE  dba.group_branch.id_main_branch = :ls_grupo   ;
		  
		  
		If Isnull(ld_diference) Then
			ld_diference = 0
		End if
	
		if ld_diference = 0 then
			ld_ganancia_cambio = 0
		else
			ld_ganancia_cambio = ((ld_diference - ld_rate)/ld_diference)
		end if
 
	End IF
	
	dw_2.setitem(ll_row,"total_diference",(ld_ganancia_cambio * ld_amount))
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

event ue_telefono;//Double				ll_id_sender
//DataWindowChild	ldw_cdw
//String				ls_codcou, ls_codsta
//
//Openwithparm(w_busca_telefono,dw_1.getitemstring(1,"id_branch"))
//
//ll_id_sender = message.Doubleparm
//
//gl_sender = ll_id_sender
//dw_1.retrieve(ll_id_sender,is_branch_insta)
//dw_2.setfocus()
//
//
//						ls_codsta=dw_1.Object.id_state[dw_1.GetRow()]
//						ls_codcou=dw_1.Object.id_country[dw_1.GetRow()]
//						
//						dw_1.Object.id_state[dw_1.GetRow()]=''
//						dw_1.GetChild('id_state',ldw_cdw)
//						ldw_cdw.SetFilter('')
//						ldw_cdw.Filter()
//						ldw_cdw.SetTransObject(SQLCA)
//						ldw_cdw.SetFilter("id_country = '"+ls_codcou+"'")
//						ldw_cdw.Filter()
//			
//						dw_1.Object.id_city[dw_1.GetRow()]=''
//						dw_1.GetChild('id_city',ldw_cdw)
//						ldw_cdw.SetFilter('')
//						ldw_cdw.Filter()
//
//						ldw_cdw.SetTransObject(SQLCA)
//						ldw_cdw.SetFilter("id_country = '"+ls_codcou+"' AND id_state = '"+ls_codsta+"'")
//						ldw_cdw.Filter()
end event

event ue_anulacion;long		ll_cont
string	ls_branch
Double	ld_sender

ld_sender		  = 0
gl_receiver_cons = 0

ld_sender 				= dw_1.getitemnumber(1,"id_sender")
gs_branch_insta_cons = dw_1.getitemstring(1,"id_branch")


if Isnull(ld_sender) or (ld_sender = 0)then
	return
end if


if is_estado = 'A' Then 
	messagebox("Warning","Invoice Void")
	return
end if


if is_estado = 'T' Then 
	messagebox("Warning","Invoice Transfered")
	return
end if

if is_estado = 'H' Then 
	messagebox("Warning","Invoice Hold")
	return
end if

if ld_sender = 0 then
	return
end if

//	if Messagebox("","Esta seguro que desea Anular el Invoice",Question!,YesNo!) = 2 then 
	if Messagebox("","Are you sure to cancel this invoice?",Question!,YesNo!) = 2 then 
		return
	end if
	
	gl_receiver_cons = dw_2.getitemnumber(1,"id_receiver")
	

	Openwithparm(w_motivo_anulacion_invoice,ld_sender)
	dw_2.setitem(1,"id_flag_receiver","A")
	is_estado = 'A'

end event

event ue_export;
//IF ProfileString(gs_database, "HostID","ID", "None")= '0001A00001' THEN //Headquaters
IF ProfileString("C:\VIAMERICASMT\Envio.INI", "HostID","ID", "None")='0001A00001' or gs_branch_insta = '0043' THEN
	Return
END IF

gs_branch_insta = fn_branch_instalacion()

IF gs_branch_insta = '0043' Then
	Return
END IF


//SELECT parametros.path_cliente,   
//         parametros.dir_output  
//    INTO :is_path_cliente,   
//         :is_output  
//    FROM parametros  ;


  SELECT  dba.parametros.dir_output  
    INTO  :is_output  
    FROM  dba.parametros  ;
 
is_path_cliente = "c:\VIAMERICASMT\client\"	 



Filedelete(is_output+"upgrade.sql")


dw_3.settransobject(sqlca)




String	ls_name, ls_address,ls_city, ls_state, ls_country,	&
			ls_tip_id, ls_num_id, ls_bitmap, ls_cadena, ls_tollfree, ls_pinnumber


String	ld_sender, ld_receiver, ld_tel1, ld_tel2, ld_zip, ls_path


string	ls_payment, ls_currency, ls_flag, ls_city1, ls_state1, ls_country1,	&
			ls_branch_pag, ls_cashier, ls_name_rec, ls_address_rec, ls_tel1_rec, ls_tel2_rec,	&
			ls_zip_rec, ls_date, ls_time, ld_amount, ld_rate, ld_telex, ld_urgency, &
			ls_recomendado, ls_mod_pay, ls_acc, ld_exchange,	&
			ld_hand, ld_total, ls_modo_pago,	 &
			ld_porc_comision, ld_total_pago, ls_transmitido,	&
			ld_exchange_comp, ls_bank, ld_ref, ld_telex_comp, ld_total_modo_pago, ld_total_modo_pago_comp 
		
integer li_FileNum
			
			
string  ls_notes, ls_statesender, ls_citysender

long		ll_row,		&
			ll_cons

Double	ld_up_sender, ld_up_receiver



string	ls_hora, ls_fecha, ls_branch





id_fecha = Today()
ls_branch = fill("0", 10 - len(gs_branch_insta)) + gs_branch_insta

ls_fecha = String(Today(), "mmdd")

ls_hora = string(Now(),"HHMM")

is_path_envio = is_output+"Env"+FILL('0',10 - LEN(ls_branch))+ls_branch+left(String(ls_fecha),4)+left(ls_hora,4)+".txt"

ls_path = is_path_envio

/////////////////////////////////////////////////////////////////////////////////






	If dw_3.retrieve() = 0 Then
		Messagebox("Export","There aren't Invoices to Export")
//		Close(w_pfc_export_invoices)
		return
	end if
	
	
	ll_row = dw_3.rowcount()
	ll_cons = 1
	


li_FileNum = FileOpen(ls_path,LineMode!, Write!, LockWrite!, Append!)

If li_filenum < 0 Then
	Messagebox("Warning","Opening File")
	Return
end if
Setpointer(Hourglass!)

DO WHILE ll_cons <= ll_row
//	em_num.text 	= 	string(ll_cons)
	ld_sender 		= 	string(dw_3.getitemnumber(ll_cons,"id_sender"))
	ls_branch 		= 	dw_3.getitemstring(ll_cons,"id_branch")
	ls_name 			=	dw_3.getitemstring(ll_cons,"name_sender")
	ls_address 		= 	dw_3.getitemstring(ll_cons,"addres_sender")
	ld_tel1 			=	string(dw_3.getitemnumber(ll_cons,"phone1_sender"))
	ld_tel2 			=	string(dw_3.getitemnumber(ll_cons,"phone2_sender"))
	ld_zip 			=  string(dw_3.getitemnumber(ll_cons,"zip_sender"))
	ls_city = 		dw_3.getitemstring(ll_cons,"id_city")
	ls_state = 		dw_3.getitemstring(ll_cons,"id_state")
	ls_country = 	dw_3.getitemstring(ll_cons,"id_country")
	ls_tip_id = 	dw_3.getitemstring(ll_cons,"id_type_id_sender")
	ls_num_id = 	dw_3.getitemstring(ll_cons,"number_id_sender")
	ls_bitmap = 	dw_3.getitemstring(ll_cons,"add_bitmap_sender")
	ls_statesender = dw_3.getitemstring(ll_cons,"sender_state_sender")
	ls_citysender = dw_3.getitemstring(ll_cons,"sender_city_sender")
	
 	/////////   Datos Propios del Invoice    /////////////////////////
	ld_receiver =			string(dw_3.getitemnumber(ll_cons,"receiver_id_receiver"))
	ls_payment =			dw_3.getitemstring(ll_cons,"receiver_id_payment")
	ls_currency = 			dw_3.getitemstring(ll_cons,"receiver_id_curreny")
	ls_flag =				dw_3.getitemstring(ll_cons,"receiver_id_flag_receiver")
	ls_city1 =				dw_3.getitemstring(ll_cons,"receiver_id_city_receiver")
	ls_state1 = 			dw_3.getitemstring(ll_cons,"receiver_id_state_receiver")
	ls_country1 = 			dw_3.getitemstring(ll_cons,"receiver_id_country_receiver")
	ls_branch_pag= 		dw_3.getitemstring(ll_cons,"receiver_branch_pay_receiver")
	ls_cashier= 			dw_3.getitemstring(ll_cons,"receiver_id_cashier")
	ls_name_rec= 			dw_3.getitemstring(ll_cons,"receiver_name_receiver")
	ls_address_rec= 		dw_3.getitemstring(ll_cons,"receiver_address_receiver")
	ls_tel1_rec= 			dw_3.getitemstring(ll_cons,"receiver_phone1_receiver")
	ls_tel2_rec= 			dw_3.getitemstring(ll_cons,"receiver_phone2_receiver")
	ls_zip_rec= 			dw_3.getitemstring(ll_cons,"receiver_zip_receiver")
	ls_notes= 				dw_3.getitemstring(ll_cons,"receiver_notes_receiver")
	ls_date= 				string(dw_3.getitemdate(ll_cons,"receiver_date_receiver"))
	ls_time= 				string(dw_3.getitemtime(ll_cons,"receiver_time_receiver"))
	ld_amount= 				string(dw_3.getitemnumber(ll_cons,"receiver_net_amount_receiver"))
	ld_rate= 				string(dw_3.getitemnumber(ll_cons,"receiver_rate_change_receiver"))
	ld_telex= 				string(dw_3.getitemnumber(ll_cons,"receiver_telex_receiver"))
	ld_urgency= 			string(dw_3.getitemnumber(ll_cons,"receiver_urgency_receiver"))
	ls_recomendado= 		dw_3.getitemstring(ll_cons,"receiver_recomend_receiver")
	ls_mod_pay= 			dw_3.getitemstring(ll_cons,"receiver_mode_pay_receiver")
	ls_acc= 					dw_3.getitemstring(ll_cons,"receiver_acc_receiver")
	ld_exchange= 			string(dw_3.getitemnumber(ll_cons,"receiver_exchange_receiver"))
	ld_hand= 				string(dw_3.getitemnumber(ll_cons,"receiver_handling_receiver"))
	ld_total= 				string(dw_3.getitemnumber(ll_cons,"receiver_total_receiver"))
	ls_modo_pago= 			dw_3.getitemstring(ll_cons,"receiver_mod_pay_currency")
	ld_porc_comision=		 string(dw_3.getitemnumber(ll_cons,"receiver_porc_comision_receiver"))
	ld_total_pago= 		string(dw_3.getitemnumber(ll_cons,"receiver_total_pay_receiver"))
	ld_exchange_comp= 	string(dw_3.getitemnumber(ll_cons,"exchange_company"))
	ld_telex_comp= 		string(dw_3.getitemnumber(ll_cons,"telex_company"))
	ls_bank=					dw_3.getitemstring(ll_cons,"bank_receiver")
	ld_ref=					string(dw_3.getitemnumber(ll_cons,"ref_receiver"))
	ld_total_modo_pago = string(dw_3.getitemnumber(ll_cons,"total_modo_pago"))
	ld_total_modo_pago_comp = string(dw_3.getitemnumber(ll_cons,"total_modo_pago_comp"))
	ls_tollfree  = dw_3.getitemstring(ll_cons,"receiver_toll_free")
	ls_pinnumber = dw_3.getitemstring(ll_cons,"receiver_pin_number")
	
	///// Llenando los Campos Null /////////
	
	
	If isnull(ld_total_modo_pago) then ld_total_modo_pago = "0"
	If isnull(ls_address) then ls_address = ""
	If isnull(ld_tel1) then ld_tel1 = "0"
	If isnull(ld_tel2) then ld_tel2 = "0"
	If isnull(ld_zip) then ld_zip = "0"
	If isnull(ls_tip_id) then ls_tip_id = ""
	If isnull(ls_num_id) then ls_num_id = ""
	If isnull(ls_bitmap) then ls_bitmap = ""
	if isnull(ls_statesender) then ls_statesender = ""
	if isnull(ls_citysender) then ls_citysender = ""
	
	If isnull(ls_address_rec) then  ls_address_rec = ""
	If isnull(ls_tel1_rec) then ls_tel1_rec = "0"
	If isnull(ls_tel2_rec) then ls_tel2_rec = "0"
	If isnull(ls_zip_rec) then ls_zip_rec = "0"
	If isnull(ls_notes) then  ls_notes = ""
	If isnull(ld_telex) then ld_telex = "0"
	If isnull(ld_urgency) then ld_urgency = "0"
	If isnull(ls_recomendado) then ls_recomendado = "0"
	If isnull(ls_mod_pay) then ls_mod_pay = "0"
	If isnull(ls_acc) then ls_acc = ""
	If isnull(ld_hand ) then ld_hand  = "0"
	If isnull(ld_porc_comision ) then ld_porc_comision  = "0"
	If isnull(ld_total_pago ) then ld_total_pago  = "0"
	If isnull(ls_tip_id) then ls_tip_id = "PA"
	If isnull(ld_total_modo_pago_comp) then ld_total_modo_pago_comp= "0"
	
	If isnull(ld_exchange_comp) then ld_exchange_comp = "0"
	If isnull(ld_telex_comp) then ld_telex_comp ="0"
	If isnull(ls_bank) then ls_bank = ""
	If isnull(ld_ref) then ld_ref = "0"
	If isnull(ls_payment) then ls_payment = "C"
	if isnull(ls_tollfree) then ls_tollfree = ""
	if isnull(ls_pinnumber) then ls_pinnumber = ""
	
			
	 		

	ls_date  =  ""			
	ls_time  =  ""
	
	ls_cadena = Fill(" ",10 - Len(ld_sender)) 			+ ld_sender 			+ & 
					Fill(" ",10 - Len(ls_branch)) 			+ ls_branch 			+ &
					Fill(" ",40 - Len(ls_name))	   		+ ls_name   			+ &
					Fill(" ",60 - Len(ls_address))			+ ls_address 			+ &
					Fill(" ",12 - Len(ld_tel1))	  			+ ld_tel1 				+ &
					Fill(" ",12 - Len(ld_tel2))	  			+ ld_tel2 				+ &
					Fill(" ",12 - Len(ld_zip))	  				+ ld_zip					+ &
					Fill(" ",10 - Len(ls_city)) 				+ ls_city 				+ &
					Fill(" ",10 - Len(ls_state)) 				+ ls_state 				+ &
					Fill(" ",10 - Len(ls_country)) 			+ ls_country 			+ &
					Fill(" ",5  - Len(ls_tip_id)) 			+ ls_tip_id 			+ &
					Fill(" ",15 - Len(ls_num_id)) 			+ ls_num_id 			+ &
					Fill(" ",50 - Len(ls_bitmap)) 			+ ls_bitmap				+ &
					Fill(" ",15 - Len(ld_receiver)) 			+ ld_receiver 			+ &
					Fill(" ",2  - Len(ls_payment)) 			+ ls_payment 			+ &
					Fill(" ",2  - Len(ls_currency)) 			+ ls_currency 			+ &
					Fill(" ",2  - Len(ls_flag)) 				+ ls_flag 				+ &
					Fill(" ",5  - Len(ls_city1	)) 			+ ls_city1	 			+ &
					Fill(" ",5  - Len(ls_state1)) 				+ ls_state1 			+ &
					Fill(" ",5  - Len(ls_country1)) 			+ ls_country1 			+ &
					Fill(" ",10 - Len(ls_branch_pag)) 		+ ls_branch_pag		+ &
					Fill(" ",10 - Len(ls_cashier)) 			+ ls_cashier 			+ &
					Fill(" ",40 - Len(ls_name_rec)) 			+ ls_name_rec 			+ &
					Fill(" ",60 - Len(ls_address_rec)) 		+ ls_address_rec 		+ &
					Fill(" ",12 - Len(ls_tel1_rec)) 			+ ls_tel1_rec 			+ &
					Fill(" ",12 - Len(ls_tel2_rec)) 			+ ls_tel2_rec 			+ &
					Fill(" ",7  -  Len(ls_zip_rec)) 	   	+ ls_zip_rec			+ &
					Fill(" ",15 - Len(ld_amount)) 			+ ld_amount				+ &
					Fill(" ",15 - Len(ld_rate)) 				+ ld_rate				+ &
					Fill(" ",15 - Len(ld_telex)) 				+ ld_telex				+ &
					Fill(" ",15 - Len(ld_urgency)) 			+ ld_urgency			+ &
					Fill(" ",1 - Len(ls_recomendado)) 		+ ls_recomendado		+ &
					Fill(" ",1 - Len(ls_mod_pay)) 			+	ls_mod_pay			+ &
					Fill(" ",30 - Len(ls_acc)) 				+ 	ls_acc				+ &
					Fill(" ",15 - Len(ld_exchange)) 			+ 	ld_exchange			+ &
					Fill(" ",15 - Len(ld_hand)) 				+	ld_hand				+ &
					Fill(" ",15 - Len(ld_total)) 				+	ld_total				+ &
					Fill(" ",1 - Len(ls_modo_pago)) 			+ 	ls_modo_pago		+ &
					Fill(" ",15 - Len(ld_porc_comision)) 	+ 	ld_porc_comision	+ &
					Fill(" ",15 - Len(ld_total_pago)) 		+ 	ld_total_pago		+ &	
					Fill(" ",200 - Len(ls_notes)) 			+ ls_notes				+ &
					Fill(" ",15 - Len(ld_exchange_comp)) 	+ 	ld_exchange_comp	+ &	
					Fill(" ",15 - Len(ld_telex_comp)) 		+ 	ld_telex_comp		+ &	
					Fill(" ",15 - Len(ld_ref)) 		      + 	ld_ref				+ &	
					Fill(" ",35 - Len(ls_bank)) 				+ 	ls_bank				+ &
					Fill(" ",15 - Len(ld_total_modo_pago)) + 	ld_total_modo_pago + &
					Fill(" ",15 - Len(ld_total_modo_pago_comp)) + 	ld_total_modo_pago_comp + &
					Fill(" ",14 - Len(ls_tollfree))        +  ls_tollfree + &
					Fill(" ",30 - Len(ls_pinnumber))       +  ls_pinnumber + &
					Fill(" ",30 - Len(ls_statesender))       +  ls_statesender + &
					Fill(" ",30 - Len(ls_citysender))       +  ls_citysender
					
//					Fill(" ",10 - Len(" ")) 					+ ls_time				+ &
//					Fill(" ",10 - Len(" ")) 					+ ls_date				
					
	
	FileWrite(li_FileNum,ls_cadena)
	
//	//////  Actualizar Como Transmitido ////////
//				Cambio que depende del Cliente
	ld_up_sender	= Double(ld_sender)
	ld_up_receiver	= Double(ld_receiver)
	
//	if ls_flag <> 'A' and ls_flag <> 'C' and ls_flag <> 'P' then
//		
//		 UPDATE "receiver"  
//     SET "id_flag_receiver" = 'T',   
//         "trans_receiver" = 'T'  
//	  WHERE ( id_sender = :ld_up_sender ) AND  
//        	  ( id_branch = :ls_branch ) AND  
//           ( id_receiver = :ld_up_receiver )   ;
//	else
//		  
//		 UPDATE "receiver"  
//     SET "trans_receiver" = 'T'  
//	  WHERE ( id_sender = :ld_up_sender ) AND  
//        	  ( id_branch = :ls_branch ) AND  
//           ( id_receiver = :ld_up_receiver )   ;
//		
//				 	 
//	end if		 
//				 
//		
//		If Sqlca.sqlcode < 0 Then
//			//Messagebox("Error Update","No se Cambio el Estado del Invoice a Transmitido")
//			Messagebox("Updating Error","Couldn't change the invoice's status to Transmited.",StopSign!)
//		end if



		if ls_flag <> 'A' and ls_flag <> 'C' then

	 		UPDATE  dba.receiver  
 	    	SET     dba.receiver.id_flag_receiver = 'T'
	   	WHERE ( dba.receiver.id_sender = :ld_up_sender ) AND  
         		( dba.receiver.id_branch = :ls_branch ) AND  
            	( dba.receiver.id_receiver = :ld_up_receiver )   ;

		End if


	
	ll_cons = ll_cons + 1
LOOP

FileClose(Li_filenum)

//Messagebox("Exportacion","Exportacion de Invoices Satistactoria")
Messagebox("Exportation",string(ll_row)+" Invoices' Exportation Successful!")


if is_estado = 'I' then
	is_estado =  'T'
	dw_2.setitem(1,"id_flag_receiver","T")	
elseif is_estado = 'H' then
	is_estado =  'H'
	dw_2.setitem(1,"id_flag_receiver","H")	
elseif is_estado = 'A' then
	is_estado =  'A'
	dw_2.setitem(1,"id_flag_receiver","A")	
	
end if

IF ProfileString(gs_database, "Transmitir","FTP", "None") = 'Yes' THEN
	Run("c:\VIAMERICASMT\ftpagent.EXE")
	
		if ls_flag <> 'A' and ls_flag <> 'C' then

	 		UPDATE dba.receiver  
     		SET    dba.receiver.id_flag_receiver = 'T',   
         	    dba.receiver.trans_receiver   = 'T'  
	  		WHERE ( dba.receiver.id_sender   = :ld_up_sender ) AND  
        	      ( dba.receiver.id_branch   = :ls_branch ) AND  
               ( dba.receiver.id_receiver = :ld_up_receiver )   ;
		End if
	
	
else
	Run(is_path_cliente+"Client.EXE")
end if	

dw_3.RESET()

Setpointer(Arrow!)




end event

event ue_cost;string	ls_mode_pay
long 		ll_cont

double	ld_recibir,	&
			ld_comision

Double	ld_pagar,	&
			ld_rate,		&
			ld_telex,	&
			ld_porc,		&
			ld_fee,		&
			ld_amount, 	&
			ld_neto
			
string	ls_country,	&
			ls_branch_insta, ls_currency


//ls_branch_insta = fn_branch_instalacion()

ls_branch_insta = dw_network.getitemstring(1,"id_branch")

dw_2.ACCEPTTEXT()

ld_recibir    = dw_2.getitemnumber(1,"total_pay_receiver")
ls_mode_pay   = dw_2.getitemstring(1,"mod_pay_currency")
ls_country    = dw_2.getitemstring(1,"id_country_receiver")
ld_neto       = dw_2.getitemnumber(1,"total_receiver")

if ld_recibir   = 0  then return
if ls_mode_pay  = '' then return
if ls_country  = '' then return

IF ls_mode_pay = 'N' THEN
	
	SELECT dba.rate.rate,dba.rate.id_curreny  
    INTO  :ld_rate,:ls_currency  
    FROM  dba.rate  
   WHERE  dba.rate.id_country = :ls_country ;

	
	If ld_rate = 0 then 
		messagebox("warning","doesn't have rate")
		return
	end if

	dw_2.setitem(1,"rate_change_receiver",ld_rate)
	ld_amount   = (ld_recibir/ld_rate)
 	dw_2.setitem(1,"net_amount_receiver",ld_amount)
	dw_2.setitem(1,"id_curreny",ls_currency)
	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
	
	if ll_cont  = 0 then
		ld_fee  = fn_fee_standar(ls_country,ld_amount,"N")
		ld_porc = fn_comision_standar(ls_country,ld_amount,"N")
	else
		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"N")
		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"N")
	end if
Else
	ld_rate = 1
	dw_2.setitem(1,"rate_change_receiver",ld_rate)
	ld_amount = ld_recibir 
 	dw_2.setitem(1,"net_amount_receiver",ld_amount)
	dw_2.setitem(1,"id_curreny","D")
	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
	
	if ll_cont  = 0 then
		ld_fee  = fn_fee_standar(ls_country,ld_amount,"D")
		ld_porc = fn_comision_standar(ls_country,ld_amount,"D")

	else
		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"D")
		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"D")
	end if
END IF

	dw_2.setitem(1,"telex_receiver",ld_fee)
	dw_2.setitem(1,"exchange_receiver",(ld_amount * ld_porc))
	dw_2.setitem(1,"total_receiver",(ld_amount + ld_fee + (ld_porc * ld_amount)))










end event

event ue_hold;long		ll_cont
string	ls_branch, ls_flag, ls_transmitido
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

		UPDATE  dba.receiver  
      SET     dba.receiver.id_flag_receiver 	= 'H' 
      WHERE ( dba.receiver.id_branch   			= :gs_branch_insta) AND  
            ( dba.receiver.id_receiver 			= :ld_receiver )   ;
		Commit ;
		dw_2.setitem(1,"id_flag_receiver","H")
		is_estado = 'H'
end event

event ue_total;string	ls_mode_pay
long 		ll_cont

double	ld_recibir,	&
			ld_comision

Double	ld_pagar,	&
			ld_rate,		&
			ld_telex,	&
			ld_porc,		&
			ld_fee,		&
			ld_amount, 	&
			ld_neto, ld_total
			
string	ls_country,	&
			ls_branch_insta, ls_currency


ls_branch_insta = dw_network.getitemstring(1,"id_branch")

dw_2.ACCEPTTEXT()

ld_amount     = dw_2.getitemnumber(1,"total_receiver")
ld_recibir    = dw_2.getitemnumber(1,"total_pay_receiver")
ls_mode_pay   = dw_2.getitemstring(1,"mod_pay_currency")
ls_country    = dw_2.getitemstring(1,"id_country_receiver")
ld_neto       = dw_2.getitemnumber(1,"total_receiver")


if ld_neto      = 0  then return
if ls_mode_pay  = '' then return
if ls_country   = '' then return

IF ls_mode_pay = 'N' THEN
	
	SELECT dba.rate.rate,dba.rate.id_curreny  
    INTO :ld_rate,:ls_currency  
    FROM dba.rate  
   WHERE dba.rate.id_country = :ls_country ;

	
	If ld_rate = 0 then 
		messagebox("warning","doesn't have rate")
		return
	end if

	dw_2.setitem(1,"rate_change_receiver",ld_rate)
	
	
	dw_2.setitem(1,"id_curreny",ls_currency)
	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
	
	if ll_cont  = 0 then
		ld_fee  = fn_fee_standar(ls_country,ld_amount,"N")
		ld_porc = fn_comision_standar(ls_country,ld_amount,"N")
	else
		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"N")
		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"N")
	end if
Else
	ld_rate = 1
	dw_2.setitem(1,"rate_change_receiver",ld_rate)
	dw_2.setitem(1,"id_curreny","D")
	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
	
	if ll_cont  = 0 then
		ld_fee  = fn_fee_standar(ls_country,ld_amount,"D")
		ld_porc = fn_comision_standar(ls_country,ld_amount,"D")
	else
		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"D")
		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"D")
	end if
END IF

	ld_amount = (ld_neto - ld_fee) - (ld_neto * ld_porc)
	
	
	IF ls_mode_pay = 'N' THEN
	
	
	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
	
	if ll_cont  = 0 then
		ld_fee  = fn_fee_standar(ls_country,ld_amount,"N")
		ld_porc = fn_comision_standar(ls_country,ld_amount,"N")
	else
		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"N")
		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"N")
	end if
Else
	ld_rate = 1
	dw_2.setitem(1,"rate_change_receiver",ld_rate)
	dw_2.setitem(1,"id_curreny","D")
	ll_cont     = fn_tipo_comision(ls_country,ls_branch_insta,ld_amount,"N")
	
	if ll_cont  = 0 then
		ld_fee  = fn_fee_standar(ls_country,ld_amount,"D")
		ld_porc = fn_comision_standar(ls_country,ld_amount,"D")
	else
		ld_fee  = fn_feet(ls_country,ls_branch_insta,ld_amount,"D")
		ld_porc = fn_comision(ls_country,ls_branch_insta,ld_amount,"D")
	end if
END IF

	
	
	ld_amount = (ld_neto - ld_fee) /  (1 + ld_porc)
	
	ld_recibir = ld_amount * ld_rate
	
	dw_2.setitem(1,"total_pay_receiver",ld_recibir)
	dw_2.setitem(1,"net_amount_receiver",ld_amount)
	dw_2.setitem(1,"telex_receiver",ld_fee)
	dw_2.setitem(1,"exchange_receiver",(ld_amount * ld_porc))











end event

event ue_sender_id;w_pfc_sender.Triggerevent("ue_insertar")

Double	ll_id_sender
DataWindowChild	ldw_cdw


string	ls_phone1, ls_phone2, ls_zip, ls_country_rec, ls_city_rec, ls_state_rec
Double	ld_rate, ld_receiver, ld_amount
Date		ld_date = Today()
Time		ld_hour
long		ll_cont

string	ls_name, ls_branch,	&
			ls_address,				&
			ls_name_receiver,		&
			ls_bank,					&
			ls_account,				&
			ls_modo_pago,			&
			ls_corresponsal, ls_main_branch
			
Double	ld_porcentaje,			&
			ld_comision,			&
			ld_feet,					&
			ld_total_receiver,	&
			ld_total_pay_receiver

 ld_porcentaje = 0
 ld_comision = 0
 ld_feet = 0
 ld_total_receiver = 0
 ld_total_pay_receiver = 0





Open(w_busca_sender_id)

				ll_id_sender = message.Doubleparm
				gl_sender = ll_id_sender
					
				if ll_id_sender <> 0 Then
						gl_sender = ll_id_sender
						

						if dw_1.retrieve(ll_id_sender,gs_branch_insta) = 0 then
							w_pfc_sender.Triggerevent("ue_insertar")						
							return
						end if
						dw_1.Settaborder(8,0)
						dw_1.Settaborder(9,0)
						dw_1.Settaborder(10,0)
						dw_1.Settaborder(4,0)
						dw_1.Settaborder(7,0)
						dw_1.Settaborder(3,0)
						dw_2.setitem(dw_2.getrow(),"id_sender",ll_id_sender)
						
						
						Openwithparm(w_busca_nombre_receiver,"%%")
						ld_receiver = message.Doubleparm
				
					if ld_receiver <> 0 Then
						
  						SELECT receiver.name_receiver,
						  		 receiver.address_receiver,
						  		 receiver.phone1_receiver,   
         					 receiver.phone2_receiver,
								 receiver.zip_receiver,
								 receiver.bank_receiver,
								 receiver.acc_receiver,
								 receiver.mode_pay_receiver,
								 receiver.branch_pay_receiver, 
								 receiver.id_city_receiver, 
								 receiver.id_state_receiver, 
								 receiver.id_country_receiver,
								 branch.id_main_branch   
    					INTO 	:ls_name_receiver,:ls_address,:ls_phone1,   
         					:ls_phone2,:ls_zip,:ls_bank,:ls_account,
								:ls_modo_pago,:ls_corresponsal, :ls_city_rec, :ls_state_rec, :ls_country_rec, :ls_main_branch
    					FROM dba.receiver receiver, dba.branch branch 
   					WHERE (branch.id_branch   = receiver.branch_pay_receiver) and
								receiver.id_receiver = :ld_receiver   and
								receiver.id_sender   = :gl_sender	  and
								receiver.id_branch   = :gs_branch_insta   ;

									
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
								dw_2.setitem(dw_2.getrow(),"mode_pay_receiver",ls_modo_pago)
								dw_2.setitem(dw_2.getrow(),"acc_receiver",ls_account)
								dw_2.setitem(dw_2.getrow(),"bank_receiver",ls_bank)
								dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",ls_corresponsal)
								dw_2.setitem(dw_2.getrow(),"id_country_receiver",ls_country_rec)
								dw_2.GetChild("id_state_receiver",ldw_cdw)
								ldw_cdw.SetTransObject(SQLCA)
								ldw_cdw.SetFilter("id_country = '"+ls_country_rec+"'")
								ldw_cdw.Filter()
								
								dw_2.setitem(dw_2.getrow(),"id_state_receiver",ls_state_rec)
								
								dw_2.GetChild("id_city_receiver",ldw_cdw)
								ldw_cdw.SetTransObject(SQLCA)
								ldw_cdw.SetFilter("id_country = '"+ls_country_rec+"' and id_state = '"+ls_state_rec+"'")
								ldw_cdw.Filter()

								dw_2.setitem(dw_2.getrow(),"id_city_receiver",ls_city_rec)
								dw_2.setfocus()
							end if
						end if
						
/////////////////////////////////////////////////////////////////////////////////////////
				dw_2.setfocus()
						
					end if
end event

event ue_print_matrix;string 	ls_name_sender,				&
			ls_dir_sender,					&
			ls_city_sender,				&
			ls_name_branch,				&
			ls_branch, 						&  
      	ls_name_receiver,				&
			ls_dir_receiver, 				&
			ls_date,							&
			ls_linea,						&
			ls_dir_branch,					&
			ls_phone1_branch, 			&
			ls_rate, ls_telex, 			&
			ls_handling,					&
			ls_exchange, 					&
			ls_modo_pago,					&
			ls_total, 						&
			ls_amount,						&
			ls_total_pagar,				&
			ls_currency, 					&
			ls_bank,							&
			ls_acc, 							&
			ls_country_sender,			&
			ls_country_receiver,			&
			ls_city_receiver,				&
			ls_name_city_rec,				&
			ls_name_country_rec,       &
			ls_delivery,               &
			ls_menssage,               &
			ls_agent_branch,           &
			ls_agent_address,          &
			ls_Phone,                  &
			ls_tollfree,               &
			ls_pin
string	ld_phone1_receiver,			&
			ld_phone2_receiver,			&
			ls_clave_receiver
			
Double   ld_phone1_sender,				&
			ld_phone2_sender,				&
			ld_receiver,					&
			ld_receiver1,              &
			ld_amount, 						&
			ld_rate,							&
			ld_exchange,					&		 
			ld_telex, 						&
			ld_handling,					&
			ld_total, 						&
			ld_modo_pago,					&
			ld_total_pagar,				&
			ld_clave

Date		ld_date

Long		ll_Job,		&
         ll_turno
Integer 	li_i,			&
			li_x,			&
			li_rc,		&
         li_turnos
			
String	ls_usu,		&
			ls_ser,		&
			ls_venta,	&
			ls_turno,	&
			ls_grupo,	&
			ls_fechor,  &
			ls_impant,  &
			ls_impact,  &
			ls_statesender,  &
			ls_citysender, &
			ls_state, &
			ls_Country

gs_branch_insta = dw_2.getitemstring(dw_1.getrow(),"id_branch")

ld_receiver1 = dw_2.getitemnumber(dw_1.getrow(),"id_receiver")

SELECT dba.branch.name_branch,
       dba.branch.address_branch,
		 dba.branch.phone1_branch,
		 dba.branch.id_state,
		 dba.branch.id_country
INTO	 :ls_agent_branch,       
		 :ls_agent_address,  
		 :ls_Phone,	 
		 :ls_state,
		 :ls_country
FROM   dba.branch
WHERE  dba.branch.id_branch = :gs_branch_insta ;

ls_clave_receiver = ''

//********************************

    SELECT sender.name_sender,   
         sender.addres_sender,   
         sender.phone1_sender,   
         sender.phone2_sender,   
			sender.state_sender,
			sender.city_sender,
			city.name_city,   
         branch.name_branch,   
         receiver.id_branch,   
         receiver.id_receiver,   
         receiver.name_receiver,   
         receiver.address_receiver,   
         receiver.phone1_receiver,   
         receiver.phone2_receiver,
			receiver.date_receiver,
			branch.address_branch,
			branch.phone1_branch,
			receiver.net_amount_receiver,
			receiver.rate_change_receiver,
			receiver.exchange_receiver,
			receiver.telex_receiver,
			receiver.handling_receiver,
			receiver.total_modo_pago,
			receiver.total_receiver,
			receiver.total_pay_receiver,
			currency.name_currency,
			receiver.bank_receiver,
			receiver.acc_receiver,
			country.name_country,
			receiver.id_city_receiver,
			receiver.id_country_receiver,
			receiver.mode_pay_receiver,
			receiver.notes_receiver,
			receiver.toll_free,
			receiver.pin_number,
			receiver.urgency_receiver,
			receiver.clave_receiver
    INTO :ls_name_sender,   
         :ls_dir_sender,   
         :ld_phone1_sender,   
         :ld_phone2_sender,
			:ls_statesender,
			:ls_citysender,
			:ls_city_sender,   
         :ls_name_branch,   
         :ls_branch,   
         :ld_receiver,   
         :ls_name_receiver,   
         :ls_dir_receiver,   
         :ld_phone1_receiver,   
         :ld_phone2_receiver,
			:ld_date,
			:ls_dir_branch,					
			:ls_phone1_branch,
			:ld_amount,
			:ld_rate,
			:ld_exchange,
			:ld_telex,
			:ld_handling,
			:ld_modo_pago,
			:ld_total,
			:ld_total_pagar,
			:ls_currency,
			:ls_bank,
			:ls_acc,
			:ls_country_sender,
			:ls_city_receiver,
			:ls_country_receiver,
			:ls_delivery,
			:ls_menssage,
			:ls_tollfree,
			:ls_pin,
			:ld_clave,
			:ls_clave_receiver
    FROM dba.city city,   
         dba.receiver receiver,   
         dba.sender sender,   
         dba.branch branch,
			dba.currency currency,
			dba.country country
   WHERE ( sender.id_sender = receiver.id_sender ) and  
         ( sender.id_branch = receiver.id_branch ) and  
         ( sender.id_city = city.id_city ) and  
         ( sender.id_state = city.id_state ) and  
         ( sender.id_country = city.id_country ) and 
			( sender.id_country = country.id_country ) and 
         ( branch.id_branch = receiver.branch_pay_receiver ) and  
			( receiver.id_curreny = currency.id_curreny ) and 
			( ( receiver.id_branch = :gs_branch_insta ) AND  
         ( receiver.id_receiver = :ld_receiver1 ) )   ;


	if Isnull(ls_clave_receiver) then ls_clave_receiver = ''



	  SELECT city.name_city,   
         country.name_country  
    INTO :ls_name_city_rec,   
         :ls_name_country_rec  
    FROM dba.city city,   
         dba.country country 
   WHERE ( city.id_country = country.id_country ) and  
         ( ( city.id_city = :ls_city_receiver ) AND  
         ( city.id_country = :ls_country_receiver ) )   ;





ls_impact = "Panasonic KX-P1150,PANSON9,LPT1:"


li_turnos = 1


ls_impant = ProfileString("win.ini","Windows","device","Impresora por Defecto")

//If ls_impant <> ls_impact Then
//	li_rc = SetProfileString("WIN.INI","WINDOWS","DEVICE",ls_impact)
//   If li_rc <> 1 Then
//		Messagebox("Error","Colocando la impresora de Turnos por Defecto")
//		Return -1
//	End If
//End If

//PrintSend(ll_job, "~027~06710")

	ll_job    = PrintOpen()
	PrintSetSpacing(ll_Job, 1)
	If ls_impant = ls_impact Then
		PrintDefineFont(ll_Job, 1, "Draft 15Cpi", -18, 400, Default!, AnyFont!, FALSE, FALSE)
	End if	
	
	ls_date = string(ld_date,"mm-dd-yyyy")
	
	// seleccion del modo de pago
	if ls_delivery = "P" then
		ls_delivery = "Office"
	end if
	if ls_delivery = "C" then
		ls_delivery = "Bank"
	end if
	if ls_delivery = "D" then
		ls_delivery = "Home"
	end if
	
	PrintSetFont(ll_job, 1)
	IF ls_country = 'USA' and ls_state = 'FL' THEN
		  	string ls_licence
			  
			SELECT dba.branch_licencia.id_licencia  
    		INTO   :ls_licence  
		   FROM   dba.branch_licencia  
		   WHERE  dba.branch_licencia.id_branch = :gs_branch_insta   ;
			
			  SELECT dba.branch_licencia.licencia_name  
    		  INTO   :ls_linea
			  FROM 	dba.licencia  
			  WHERE  dba.branch_licencia.id_licencia = :ls_licence   ;

		if isnull(ls_linea) then ls_linea = ''
    	Print(ll_job,  50, "AUTHORIZED AGENT FOR "+ls_linea)
	END IF	
   Print(ll_job,  50, ls_agent_branch)
	ls_linea = ls_agent_address + Fill(" ",50 - len(ls_agent_address))+"                 DATE       INVOICE"
	Print(ll_job,  50,ls_linea)                                                      
	ls_linea = "Phone:"+ls_phone+Fill(" ",44 - len(ls_phone))+"               "+string(ls_date)+"   "+ls_branch+"-"+string(ld_receiver)
   Print(ll_job, 50,ls_linea)
	Print(ll_job,  50, "                       SENDER                                                 RECEIVER               ")
	
	

	ls_linea = "Name    :    "+ls_name_sender+ Fill(" ",50 - Len(ls_name_sender))+"Name    :     "+ls_name_receiver
	Print(ll_job,  40,ls_linea)
	ls_linea = "Address :    "+ls_dir_sender+ Fill(" ",50 - Len(ls_dir_sender))+"Address :     "+ls_dir_receiver
	Print(ll_job,  40,ls_linea)
	ls_linea = "Phone   :    "+string(ld_phone1_sender)+ Fill(" ",50 - Len(string(ld_phone1_sender)))+"Phone   :     "+string(ld_phone1_receiver)
	Print(ll_job,  40,ls_linea)
	ls_linea = "City    :    "+ls_citysender+ Fill(" ",50 - Len(ls_citysender))+"City    :     "+ls_name_city_rec
	Print(ll_job,  40,ls_linea)
	ls_linea = "Country :    "+ls_country_sender+Fill(" ",40 - Len(ls_country_sender))+ Fill(" ",10)+"Country :     "+ls_name_country_rec
	Print(ll_job,  40,ls_linea)
	if isnull(ls_acc) then
	   ls_linea = Fill(" ",63)+"Account :    "
   else
		ls_linea = Fill(" ",63)+"Account :    "+ls_acc
	end if	
	Print(ll_job,  40,ls_linea)
	if isnull(ls_bank) then
	   ls_linea = Fill(" ",63)+"Bank    :    "
   else
	   ls_linea = Fill(" ",63)+"Bank    :    "+ls_bank
   end if
	Print(ll_job,  40,ls_linea)
	Print(ll_job,  50, "                                     PAYEE ")
	
	
	ls_rate  		= String(ld_rate,"$#,##0.00;($#,##0.00)")
	ls_amount  		= String(ld_amount,"$#,##0.00;($#,##0.00)")
	ls_telex			= String(ld_telex,"$#,##0.00;($#,##0.00)")
	ls_handling		= String(ld_handling,"$#,##0.00;($#,##0.00)")
	ls_exchange		= String(ld_exchange,"$#,##0.00;($#,##0.00)")
	ls_modo_pago	= String(ld_modo_pago,"$#,##0.00;($#,##0.00)")
	ls_total    	= String(ld_total,"$#,##0.00;($#,##0.00)")
	ls_total_pagar = String(ld_total_pagar,"$#,##0.00;($#,##0.00)")
	
	ls_linea = "Company  :   "+ls_name_branch+Fill(" ",70 - Len(ls_name_branch))+"Rate        :"+Fill(" ",15 - len(ls_rate))+ls_rate
	Print(ll_job,  40,ls_linea)
	ls_linea = "Address  :   "+ls_dir_branch+Fill(" ",70 - Len(ls_dir_branch))+"Amount Sent :"+Fill(" ",15 - len(ls_amount))+ls_amount
	Print(ll_job,  40,ls_linea)
	ls_linea = "Phone    :   "+ls_phone1_branch+Fill(" ",70 - Len(ls_phone1_branch))+"Percent     :"+Fill(" ",15 - len(ls_exchange))+ls_exchange
	Print(ll_job,  40,ls_linea)
	ls_linea = "WILL PAY :   "+Fill(" ",15 - len(ls_total_pagar))+ls_total_pagar+" "+ ls_currency +Fill(" ",20 - len(ls_currency)) +Fill(" ",34)+"Telex       :"+Fill(" ",15 - len(ls_telex))+ls_telex
	Print(ll_job,  40,ls_linea)                                                                                                                                 
	ls_linea = "DELIVERY :   "+ls_delivery+Fill(" ",70 - Len(ls_delivery))+"Other       :"+Fill(" ",15 - len(ls_handling))+ls_handling
	Print(ll_job,  40,ls_linea)
//	ls_linea = "                                                Delivery    :    "+Fill(" ",15 - len(ls_modo_pago))+ls_modo_pago
   if isnull(ls_tollfree) then ls_tollfree=" "
   if isnull(ls_pin) then ls_pin=" "
	ls_linea = "TOLL FREE:   "+ls_tollfree+Fill(" ",70 - Len(ls_tollfree))+"Delivery    :"+Fill(" ",15 - len(ls_modo_pago))+ls_modo_pago
	Print(ll_job,  40,ls_linea)
// ls_linea = "                                                                                   Total       :    "+Fill(" ",15 - len(ls_total))+ls_total
   ls_linea = "PIN      :   "+ls_pin+Fill(" ",70 - Len(ls_pin))+"Total       :"+Fill(" ",15 - len(ls_total))+ls_total 
	Print(ll_job,  40,ls_linea)
	if isnull(ls_menssage) then
		ls_linea = "MENSSAGE :"
	else
		ls_linea = "MENSSAGE :   "+mid(ls_menssage,1,80)
		Print(ll_job,  40,ls_linea)
		ls_linea = "             "+mid(ls_menssage,80,80)
   end if		
	Print(ll_job,  40,ls_linea)
	ls_linea = "Clave :"+ls_clave_receiver
	Print(ll_job,  40, ls_linea)
	Print(ll_job,  50, "            Sender Signature                                              Cashier Signature")
	PrintClose(ll_job)

If ls_impant <> ls_impact Then
	li_rc = SetProfileString("WIN.INI","WINDOWS","DEVICE",ls_impant)
   If li_rc <> 1 Then
		Messagebox("Error","Colocando la impresora Anterior por Defecto")
		Return -1
	End If
End If

Return 1


end event

event ue_new_rate;	
	id_new_rate = 0
	id_old_rate = 0


is_mod_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")
dw_2.setitem(dw_2.getrow(),"receiver_fee_rate",0)


if is_mod_currency = 'N' then
	id_new_rate = 0
	id_old_rate = 0

	Openwithparm(w_cambiar_rate_agente,0)

	id_new_rate = message.doubleparm
	w_pfc_sender.Triggerevent("ue_calcular")
end if
end event

event ue_modifrate;Double	ld_rate, ld_rate1, ld_total, ld_amount, ld_valor

w_pfc_sender.Triggerevent("ue_calcular")

if ib_modifrate then
	return
end if


ld_rate       =  dw_2.getitemnumber(1,'rate_change_receiver')
ld_amount     =  dw_2.getitemnumber(1,'net_amount_receiver')
is_mod_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")

if is_mod_currency = 'N' then
	Openwithparm(w_modificar_rate,ld_rate)
	ld_rate1 = message.doubleparm
	ld_valor = (ld_rate1 * ld_amount) / ld_rate
	dw_2.setitem(1,'net_amount_receiver',ld_valor)
	w_pfc_sender.Triggerevent("ue_calcular")
	ib_modifrate = True
end if


end event

event ue_print_exp;string 	ls_name_sender,				&
			ls_dir_sender,					&
			ls_city_sender,				&
			ls_name_branch,				&
			ls_branch, 						&  
      	ls_name_receiver,				&
			ls_dir_receiver, 				&
			ls_date,							&
			ls_linea,						&
			ls_dir_branch,					&
			ls_phone1_branch, 			&
			ls_rate, ls_telex, 			&
			ls_handling,					&
			ls_exchange, 					&
			ls_modo_pago,					&
			ls_total, 						&
			ls_amount,						&
			ls_total_pagar,				&
			ls_currency, 					&
			ls_bank,							&
			ls_acc, 							&
			ls_country_sender,			&
			ls_country_receiver,			&
			ls_city_receiver,				&
			ls_name_city_rec,				&
			ls_name_country_rec,       &
			ls_delivery,               &
			ls_menssage,               &
			ls_agent_branch,           &
			ls_agent_address,          &
			ls_Phone,                  &
			ls_tollfree,               &
			ls_pin
string	ld_phone1_receiver,			&
			ld_phone2_receiver,			&
			ls_clave_receiver, ls_cadena
			
Double   ld_phone1_sender,				&
			ld_phone2_sender,				&
			ld_receiver,					&
			ld_receiver1,              &
			ld_amount, 						&
			ld_rate,							&
			ld_exchange,					&		 
			ld_telex, 						&
			ld_handling,					&
			ld_total, 						&
			ld_modo_pago,					&
			ld_total_pagar,				&
			ld_clave

Date		ld_date

Long		ll_Job,		&
         ll_turno
Integer 	li_i,			&
			li_x,			&
			li_rc,		&
         li_turnos
			
String	ls_usu,		&
			ls_ser,		&
			ls_venta,	&
			ls_turno,	&
			ls_grupo,	&
			ls_fechor,  &
			ls_impant,  &
			ls_impact,  &
			ls_statesender,  &
			ls_citysender, &
			ls_state, &
			ls_Country

//gs_branch_insta = dw_2.getitemstring(dw_1.getrow(),"id_branch")
//ld_receiver1 = dw_2.getitemnumber(dw_1.getrow(),"id_receiver")

gs_branch_insta = '9060'
ld_receiver1    = 30


SELECT dba.branch.name_branch,
       dba.branch.address_branch,
		 dba.branch.phone1_branch,
		 dba.branch.id_state,
		 dba.branch.id_country
INTO	 :ls_agent_branch,       
		 :ls_agent_address,  
		 :ls_Phone,	 
		 :ls_state,
		 :ls_country
FROM   dba.branch
WHERE  dba.branch.id_branch = :gs_branch_insta ;

ls_clave_receiver = ''

//********************************

    SELECT sender.name_sender,   
         sender.addres_sender,   
         sender.phone1_sender,   
         sender.phone2_sender,   
			sender.state_sender,
			sender.city_sender,
			city.name_city,   
         branch.name_branch,   
         receiver.id_branch,   
         receiver.id_receiver,   
         receiver.name_receiver,   
         receiver.address_receiver,   
         receiver.phone1_receiver,   
         receiver.phone2_receiver,
			receiver.date_receiver,
			branch.address_branch,
			branch.phone1_branch,
			receiver.net_amount_receiver,
			receiver.rate_change_receiver,
			receiver.exchange_receiver,
			receiver.telex_receiver,
			receiver.handling_receiver,
			receiver.total_modo_pago,
			receiver.total_receiver,
			receiver.total_pay_receiver,
			currency.name_currency,
			receiver.bank_receiver,
			receiver.acc_receiver,
			country.name_country,
			receiver.id_city_receiver,
			receiver.id_country_receiver,
			receiver.mode_pay_receiver,
			receiver.notes_receiver,
			receiver.toll_free,
			receiver.pin_number,
			receiver.urgency_receiver,
			receiver.clave_receiver
    INTO :ls_name_sender,   
         :ls_dir_sender,   
         :ld_phone1_sender,   
         :ld_phone2_sender,
			:ls_statesender,
			:ls_citysender,
			:ls_city_sender,   
         :ls_name_branch,   
         :ls_branch,   
         :ld_receiver,   
         :ls_name_receiver,   
         :ls_dir_receiver,   
         :ld_phone1_receiver,   
         :ld_phone2_receiver,
			:ld_date,
			:ls_dir_branch,					
			:ls_phone1_branch,
			:ld_amount,
			:ld_rate,
			:ld_exchange,
			:ld_telex,
			:ld_handling,
			:ld_modo_pago,
			:ld_total,
			:ld_total_pagar,
			:ls_currency,
			:ls_bank,
			:ls_acc,
			:ls_country_sender,
			:ls_city_receiver,
			:ls_country_receiver,
			:ls_delivery,
			:ls_menssage,
			:ls_tollfree,
			:ls_pin,
			:ld_clave,
			:ls_clave_receiver
    FROM dba.city city,   
         dba.receiver receiver,   
         dba.sender sender,   
         dba.branch branch,
			dba.currency currency,
			dba.country country
   WHERE ( sender.id_sender     = receiver.id_sender ) and  
         ( sender.id_branch     = receiver.id_branch ) and  
         ( sender.id_city       = city.id_city ) and  
         ( sender.id_state      = city.id_state ) and  
         ( sender.id_country    = city.id_country ) and 
			( sender.id_country    = country.id_country ) and 
         ( branch.id_branch     = receiver.branch_pay_receiver ) and  
			( receiver.id_curreny  = currency.id_curreny ) and 
			( ( receiver.id_branch = :gs_branch_insta ) AND  
         ( receiver.id_receiver = :ld_receiver1 ) )   ;


	if Isnull(ls_clave_receiver) then ls_clave_receiver = ''



	  SELECT city.name_city,   
            country.name_country  
    INTO    :ls_name_city_rec,   
            :ls_name_country_rec  
    FROM    dba.city city,   
            dba.country country 
   WHERE ( city.id_country = country.id_country ) and  
         ( ( city.id_city = :ls_city_receiver ) AND  
         ( city.id_country = :ls_country_receiver ) )   ;





	ls_date = string(ld_date,"mm-dd-yyyy")
	
	// seleccion del modo de pago
	if ls_delivery = "P" then
		ls_delivery = "Office"
	end if
	if ls_delivery = "C" then
		ls_delivery = "Bank"
	end if
	if ls_delivery = "D" then
		ls_delivery = "Home"
	end if
	
	long 	li_file_resumen
	
	li_file_resumen = FileOpen("c:\VIAMERICASMT\print.txt",LineMode!,Write!,LockWrite!,REPLACE!)

  	ls_cadena	=	"AUTHORIZED AGENT FOR VIAMERICAS"
	filewrite(li_file_resumen,ls_cadena)
	
	ls_cadena = ls_agent_branch + Fill(" ",50 - len(ls_agent_address))+"                 DATE       INVOICE"
	filewrite(li_file_resumen,ls_cadena)
 	ls_cadena = "Phone:"+ls_phone+Fill(" ",44 - len(ls_phone))+"               "+string(ls_date)+"   "+ls_branch+"-"+string(ld_receiver)
   filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "                       SENDER                                                 RECEIVER               "
	filewrite(li_file_resumen,ls_cadena)
	
	

	ls_cadena = "Name    :    "+ls_name_sender+ Fill(" ",50 - Len(ls_name_sender))+"Name    :     "+ls_name_receiver
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "Address :    "+ls_dir_sender+ Fill(" ",50 - Len(ls_dir_sender))+"Address :     "+ls_dir_receiver
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "Phone   :    "+string(ld_phone1_sender)+ Fill(" ",50 - Len(string(ld_phone1_sender)))+"Phone   :     "+string(ld_phone1_receiver)
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "City    :    "+ls_citysender+ Fill(" ",50 - Len(ls_citysender))+"City    :     "+ls_name_city_rec
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "Country :    "+ls_country_sender+Fill(" ",40 - Len(ls_country_sender))+ Fill(" ",10)+"Country :     "+ls_name_country_rec
	filewrite(li_file_resumen,ls_cadena)
	if isnull(ls_acc) then
	   ls_cadena = Fill(" ",63)+"Account :    "
   else
		ls_cadena = Fill(" ",63)+"Account :    "+ls_acc
	end if	
	filewrite(li_file_resumen,ls_cadena)
	
	if isnull(ls_bank) then
	   ls_cadena = Fill(" ",63)+"Bank    :    "
   else
	   ls_cadena = Fill(" ",63)+"Bank    :    "+ls_bank
   end if
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "                                     PAYEE "
	filewrite(li_file_resumen,ls_cadena)
	
	ls_rate  		= String(ld_rate,"$#,##0.00;($#,##0.00)")
	ls_amount  		= String(ld_amount,"$#,##0.00;($#,##0.00)")
	ls_telex			= String(ld_telex,"$#,##0.00;($#,##0.00)")
	ls_handling		= String(ld_handling,"$#,##0.00;($#,##0.00)")
	ls_exchange		= String(ld_exchange,"$#,##0.00;($#,##0.00)")
	ls_modo_pago	= String(ld_modo_pago,"$#,##0.00;($#,##0.00)")
	ls_total    	= String(ld_total,"$#,##0.00;($#,##0.00)")
	ls_total_pagar = String(ld_total_pagar,"$#,##0.00;($#,##0.00)")
	
	ls_cadena = "Company  :   "+ls_name_branch+Fill(" ",70 - Len(ls_name_branch))+"Rate        :"+Fill(" ",15 - len(ls_rate))+ls_rate
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "Address  :   "+ls_dir_branch+Fill(" ",70 - Len(ls_dir_branch))+"Amount Sent :"+Fill(" ",15 - len(ls_amount))+ls_amount
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "Phone    :   "+ls_phone1_branch+Fill(" ",70 - Len(ls_phone1_branch))+"Percent     :"+Fill(" ",15 - len(ls_exchange))+ls_exchange
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "WILL PAY :   "+Fill(" ",15 - len(ls_total_pagar))+ls_total_pagar+" "+ ls_currency +Fill(" ",20 - len(ls_currency)) +Fill(" ",34)+"Telex       :"+Fill(" ",15 - len(ls_telex))+ls_telex
	filewrite(li_file_resumen,ls_cadena)                                                                                                  
	ls_cadena = "DELIVERY :   "+ls_delivery+Fill(" ",70 - Len(ls_delivery))+"Other       :"+Fill(" ",15 - len(ls_handling))+ls_handling
	filewrite(li_file_resumen,ls_cadena)

   if isnull(ls_tollfree) then ls_tollfree=" "
   if isnull(ls_pin) then ls_pin=" "
	ls_cadena = "TOLL FREE:   "+ls_tollfree+Fill(" ",70 - Len(ls_tollfree))+"Delivery    :"+Fill(" ",15 - len(ls_modo_pago))+ls_modo_pago
	filewrite(li_file_resumen,ls_cadena)

   ls_cadena = "PIN      :   "+ls_pin+Fill(" ",70 - Len(ls_pin))+"Total       :"+Fill(" ",15 - len(ls_total))+ls_total 
	filewrite(li_file_resumen,ls_cadena)
	if isnull(ls_menssage) then
		ls_cadena = "MENSSAGE :"
	else
		ls_cadena = "MENSSAGE :   "+mid(ls_menssage,1,80)
		filewrite(li_file_resumen,ls_cadena)
		ls_cadena = "             "+mid(ls_menssage,80,80)
   end if		
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "Clave :"+ls_clave_receiver
	filewrite(li_file_resumen,ls_cadena)
	ls_cadena = "            Sender Signature                                              Cashier Signature"
	filewrite(li_file_resumen,ls_cadena)

	fileclose(li_file_resumen)
		
	li_file_resumen = FileOpen("c:\VIAMERICASMT\print.bat",LineMode!,Write!,LockWrite!,REPLACE!)
	filewrite(li_file_resumen,"type c:\VIAMERICASMT\print.txt >LPT1:")
	fileclose(li_file_resumen)
	Run("c:\VIAMERICASMT\print.bat")


//////////
//li_file_resumen = FileOpen("c:\monitel\print.txt",LineMode!,Write!,LockWrite!,REPLACE!)
//		ls_branch_r	=	dw_2.getitemstring(dw_2.getrow(),'id_branch')
//	  	SELECT		name_branch,address_branch,zip_branch,phone1_branch
//	  	INTO		:ls_name_branch_a,:ls_address_branch_a,:ls_zip_branch_a,:ls_phone1_branch_a
//	  	FROM 		branch
//	  	WHERE		id_branch	=	:ls_branch_r;
//		
//		ls_cadena	=	Fill(" ",43) + "MONITEL EXPRESS CORP."
//		filewrite(li_file_resumen,ls_cadena)
//		ls_cadena	=	Fill(" ",43) + ls_name_branch_a
//		filewrite(li_file_resumen,ls_cadena)
//		ls_cadena	=	Fill(" ",43) + ls_address_branch_a
//		filewrite(li_file_resumen,ls_cadena)
//		ls_cadena	=	Fill(" ",43) + 'Zip : ' + ls_zip_branch_a + ' TEl : ' + ls_phone1_branch_a
//		filewrite(li_file_resumen,ls_cadena)
//		
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")		
//		
//		ls_cadena	=	Fill(" ",42) + ls_envio
//		ls_cadena	=	ls_cadena + fill(" ",59 - len(ls_cadena)) + ls_fecha
//		ls_cadena	=	ls_cadena + Fill(" ",71 - Len(ls_cadena)) + ls_time_imp
//		filewrite(li_file_resumen,ls_cadena)
//		
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")		
//		filewrite(li_file_resumen,"")
//		ls_cadena	=	Fill(" ",3) + ls_sender_name
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + ls_receiver_name
//		filewrite(li_file_resumen,ls_cadena)
//		
//		ls_cadena	=	Fill(" ",3) + ls_sender_address
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + ls_receiver_address
//		filewrite(li_file_resumen,ls_cadena)
//		
//		ls_cadena	=	Fill(" ",3) + ls_phone_1 + '/' + ls_phone_2
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + ls_receiver_phone1 + '/' + ls_receiver_phone2
//		filewrite(li_file_resumen,ls_cadena)		
//
//		ls_cadena	=	Fill(" ",3) + ls_name_city_sender + ' ' + ls_name_country_sender
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + ls_name_city_receiver + ' ' + ls_name_country_receiver
//		filewrite(li_file_resumen,ls_cadena)			
//
//		ls_cadena	=	Fill(" ",3)  
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + 'Cuenta : ' + ls_cuenta + ' Banco : ' + ls_banco
//		filewrite(li_file_resumen,ls_cadena)			
//
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")
//		
//		ls_cadena	=	Fill(" ",3) 
//		ls_cadena	=	ls_cadena + fill(" ",56 - len(ls_cadena)) + mid(ls_mensaje,1,20)
//		filewrite(li_file_resumen,ls_cadena)
//
//		ls_cadena	=	Fill(" ",3) 
//		ls_cadena	=	ls_cadena + fill(" ",56 - len(ls_cadena)) + mid(ls_mensaje,21,20)
//		filewrite(li_file_resumen,ls_cadena)
//
//		ls_cadena	=	Fill(" ",3) 
//		ls_cadena	=	ls_cadena + fill(" ",56 - len(ls_cadena)) + mid(ls_mensaje,41,20)
//		filewrite(li_file_resumen,ls_cadena)
//		
//		
//		ls_cadena	=	Fill(" ",7) + "Enviado  : " + Fill(" ",15 - Len(string(double(ls_amount),"###,###,###.00"))) +  string(double(ls_amount),"###,###,###.00")
//		filewrite(li_file_resumen,ls_cadena)			
//		
//		ls_cadena	=	Fill(" ",7) + "Comision : " + Fill(" ",15 - Len(string(double(ls_exchange),"###,###,###.00"))) +  string(double(ls_exchange),"###,###,###.00")
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + ls_name_branch
//		filewrite(li_file_resumen,ls_cadena)			
//		
//		ls_cadena	=	Fill(" ",7) + "Telex    : " + Fill(" ",15 - Len(string(double(ls_telex),"###,###,###.00"))) +  string(double(ls_telex),"###,###,###.00")
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + ls_dir1
//		filewrite(li_file_resumen,ls_cadena)	
//		
//		ls_cadena	=	Fill(" ",7) + "Delivery : " + Fill(" ",15 - Len(string(double(ls_modo_pago),"###,###,###.00"))) +  string(double(ls_modo_pago),"###,###,###.00")
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + ls_dir2
//		filewrite(li_file_resumen,ls_cadena)			
//		
//		ls_cadena	=	Fill(" ",7) + "Handling : " + Fill(" ",15 - Len(string(double(ls_handling),"###,###,###.00"))) +  string(double(ls_handling),"###,###,###.00")
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + ls_phone_branch
//		filewrite(li_file_resumen,ls_cadena)	
//		
//		ls_cadena	=	Fill(" ",7) + "Pagado   : " + Fill(" ",15 - Len(string(double(ls_total_receiver),"###,###,###.00"))) +  string(double(ls_total_receiver),"###,###,###.00")
//		ls_cadena	=	ls_cadena + fill(" ",42 - len(ls_cadena)) + 'clave : ' + ls_clave + ' Tel : ' + ls_tollfree
//		filewrite(li_file_resumen,ls_cadena)
//
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")		
//		filewrite(li_file_resumen,"")
//
//		ls_cadena	=	Fill(" ",3) +  string(double(ls_rate),"###,###,###.00")
//		ls_cadena	=	ls_cadena + fill(" ",28 - len(ls_cadena)) + string(double(ls_total_pay),"###,###,###.00")
//		ls_cadena	=	ls_cadena + fill(" ",44 - len(ls_cadena)) + ls_cashier		
//		filewrite(li_file_resumen,ls_cadena)	
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")		
//		filewrite(li_file_resumen,"")		
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")
//		filewrite(li_file_resumen,"")		
//		filewrite(li_file_resumen,"")		
//		filewrite(li_file_resumen,"")		
//		filewrite(li_file_resumen,"")		
//		
//		fileclose(li_file_resumen)
//		
//		//genera el bat para que mande a la impresion
//		li_file_resumen = FileOpen("c:\monitel\print.bat",LineMode!,Write!,LockWrite!,REPLACE!)
//		filewrite(li_file_resumen,"type c:\monitel\print.txt >LPT1:")
//		fileclose(li_file_resumen)
//		Run("c:\monitel\print.bat")
//

end event

on w_pfc_sender.create
int iCurrent
call super::create
if this.MenuName = "m_pfc_sender" then this.MenuID = create m_pfc_sender
this.dw_recibo=create dw_recibo
this.dw_network=create dw_network
this.dw_recibo_matrix=create dw_recibo_matrix
this.dw_1=create dw_1
this.cb_print=create cb_print
this.st_1=create st_1
this.st_2=create st_2
this.cb_new=create cb_new
this.st_3=create st_3
this.cb_borrar=create cb_borrar
this.gb_2=create gb_2
this.p_1=create p_1
this.p_2=create p_2
this.cb_trans=create cb_trans
this.dw_2=create dw_2
this.dw_3=create dw_3
this.cb_cost=create cb_cost
this.st_5=create st_5
this.cb_hold=create cb_hold
this.st_6=create st_6
this.p_3=create p_3
this.cb_calcular=create cb_calcular
this.st_calcular=create st_calcular
this.cb_total=create cb_total
this.st_total=create st_total
this.cb_1=create cb_1
this.st_4c=create st_4c
this.p_6rc=create p_6rc
this.lb_borrar=create lb_borrar
this.em_balance=create em_balance
this.st_7=create st_7
this.cb_new_rate=create cb_new_rate
this.p_4=create p_4
this.st_333=create st_333
this.cb_adjust_rate=create cb_adjust_rate
this.p_5=create p_5
this.st_3334=create st_3334
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_recibo
this.Control[iCurrent+2]=this.dw_network
this.Control[iCurrent+3]=this.dw_recibo_matrix
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.cb_new
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.cb_borrar
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.p_1
this.Control[iCurrent+13]=this.p_2
this.Control[iCurrent+14]=this.cb_trans
this.Control[iCurrent+15]=this.dw_2
this.Control[iCurrent+16]=this.dw_3
this.Control[iCurrent+17]=this.cb_cost
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.cb_hold
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.p_3
this.Control[iCurrent+22]=this.cb_calcular
this.Control[iCurrent+23]=this.st_calcular
this.Control[iCurrent+24]=this.cb_total
this.Control[iCurrent+25]=this.st_total
this.Control[iCurrent+26]=this.cb_1
this.Control[iCurrent+27]=this.st_4c
this.Control[iCurrent+28]=this.p_6rc
this.Control[iCurrent+29]=this.lb_borrar
this.Control[iCurrent+30]=this.em_balance
this.Control[iCurrent+31]=this.st_7
this.Control[iCurrent+32]=this.cb_new_rate
this.Control[iCurrent+33]=this.p_4
this.Control[iCurrent+34]=this.st_333
this.Control[iCurrent+35]=this.cb_adjust_rate
this.Control[iCurrent+36]=this.p_5
this.Control[iCurrent+37]=this.st_3334
end on

on w_pfc_sender.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_recibo)
destroy(this.dw_network)
destroy(this.dw_recibo_matrix)
destroy(this.dw_1)
destroy(this.cb_print)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_new)
destroy(this.st_3)
destroy(this.cb_borrar)
destroy(this.gb_2)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.cb_trans)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.cb_cost)
destroy(this.st_5)
destroy(this.cb_hold)
destroy(this.st_6)
destroy(this.p_3)
destroy(this.cb_calcular)
destroy(this.st_calcular)
destroy(this.cb_total)
destroy(this.st_total)
destroy(this.cb_1)
destroy(this.st_4c)
destroy(this.p_6rc)
destroy(this.lb_borrar)
destroy(this.em_balance)
destroy(this.st_7)
destroy(this.cb_new_rate)
destroy(this.p_4)
destroy(this.st_333)
destroy(this.cb_adjust_rate)
destroy(this.p_5)
destroy(this.st_3334)
end on

event open;String 	ls_country, ls_state, ls_city
Double	ld_diario, ld_last_invoice

X=1
Y=1
Show()

ld_diario       = 0
ld_last_invoice = 0

///////////////////////////////////////////////////////////////
long	ll_dias, ll_seg

IF ProfileString(gs_database, "HostID","ID", "None")= '0001A00002' THEN //Headquaters	
  SELECT parametros.time_connect,   
  			parametros.date_connect,   
         parametros.hour_connect  
    INTO :il_time_conect,
	 		:id_date_connect,   
         :it_hour_connect  
    FROM dba.parametros parametros ;

	if isnull(it_hour_connect) or isnull(id_date_connect) then
		messagebox('Warning','You have to connect to the central Office')
		close(w_pfc_sender)
		return
	else
		ll_dias = Daysafter(id_date_connect,today())
		if ll_dias <> 0 then
			messagebox('Warning','You have to connect to the central Office')
			close(w_pfc_sender)
			return
		end if
	end if

	il_time_conect = (il_time_conect * 60)  // pasa a segundos
	ll_seg = SecondsAfter(it_hour_connect,now())
	//messagebox('',string(ll_seg)+'     ----    '+string(il_time_conect)) 
 
	if ll_seg > il_time_conect then
		messagebox('Warning','Connect to central office')
		close(w_pfc_sender)
		return
	end if
end if
//////////////////////////////////////////////////////////////////////
//Borrar los sql que no pertenecen a esa agencia

String	ls_filename, ls_file
long		i, total

lb_borrar.DirList("C:\DINERO\INPUT\"+"*.*",0)
Total    = lb_borrar.TotalItems ( )
ls_file  = FILL('0',10 - LEN(gs_branch_insta))+gs_branch_insta


FOR i = 1 TO Total
	lb_borrar.selectitem(i)
	ls_filename = lb_borrar.selecteditem()
	
	if Upper(ls_filename) <> 'VIAMERICAS1.SWF' AND Upper(ls_filename) <> 'VIAMERICAS.SWF' AND Mid(ls_filename,4,10) <> ls_file and UPPER(ls_filename) <> 'UPGRADE.SQL' then
		filedelete("C:\DINERO\INPUT\"+ls_filename)
	end if
NEXT

is_estado =  'I'
ib_actualizado = False

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_network.settransobject(sqlca)
dw_recibo.settransobject(sqlca)
dw_recibo_matrix.settransobject(sqlca)
Commit;

DataWindowChild ldw_cdw
gs_mod_pay = ""
gs_mod_currency = ""
dw_1.insertrow(0)	
dw_1.accepttext()
dw_2.insertrow(0)


Double	ld_sender,	ld_receiver


is_branch_insta = fn_branch_instalacion()
gs_branch_insta = is_branch_insta
		
			
  				SELECT credit_limit.credit_limit,
  			          credit_limit.balance,
						 credit_limit.last_invoice	
   	 		INTO :id_credito,:id_balance,:ld_last_invoice
    			FROM dba.credit_limit credit_limit 
   			WHERE credit_limit.id_branch = :gs_branch_insta   ;
		
				if isnull(id_credito)      then id_credito = 0 
				if isnull(id_balance)      then id_balance = 0 
				if isnull(ld_last_invoice) then ld_last_invoice = 0 
				
				
				SELECT	SUM(receiver.net_amount_receiver+receiver.exchange_company+receiver.telex_company+receiver.total_modo_pago_comp)  
    			INTO 		:ld_diario
    			FROM 		dba.receiver receiver  
   			WHERE ( 	receiver.id_branch       = :is_branch_insta ) AND  
         		   ( 	receiver.id_receiver     > :ld_last_invoice )   ;

				if isnull(ld_diario) then ld_diario = 0
				

				em_balance.text = string( id_balance - ld_diario)

			
	if is_branch_insta = '' then
		Messagebox("Error","Program not Autorized, Please consult with the System Administrator.",StopSign!)
		Close(w_pfc_sender)
		Return 0;
	end if
	  
	if dw_network.retrieve() = 0 then
		close(w_pfc_sender)
		Return
	end if
	
	
	dw_network.setitem(1,"id_branch",is_branch_insta)

	
	dw_network.setfocus()

//SELECT id_city,id_state,id_country  
//  INTO :ls_city,:ls_state,:ls_country  
//  FROM branch  
// WHERE id_branch = :is_branch_insta   ;
 
 
 //////////////////////////////////////////////////////////
   DECLARE sp_ubicacion_branch PROCEDURE FOR dba.sp_ubicacion_branch
         @codigo_branch = :is_branch_insta ;
		
	Execute sp_ubicacion_branch; 

	if SQLCA.sqlcode = 0 then
		FETCH sp_ubicacion_branch  Into :ls_city, :ls_state, :ls_country ;
		Close sp_ubicacion_branch; 
	elseif SQLCA.sqlcode = -1 then
		messagebox("Store Procedure","Error Ubicacion Branch  "+SQLCA.SQLERRTEXT)
	end if
 //////////////////////////////////////////////////////////
 

dw_1.setitem(dw_1.getrow(),"id_branch",is_branch_insta)
dw_1.setitem(dw_1.getrow(),"id_country",ls_country)
dw_1.setitem(dw_1.getrow(),"id_state",ls_state)

dw_1.GetChild('id_state',ldw_cdw)
ldw_cdw.SetTransObject(SQLCA)
ldw_cdw.SetFilter('')
ldw_cdw.Filter()
ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
ldw_cdw.Filter()

dw_1.GetChild('id_city',ldw_cdw)
ldw_cdw.SetTransObject(SQLCA)
ldw_cdw.SetFilter('')
ldw_cdw.Filter()
ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
ldw_cdw.Filter()







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

type dw_recibo from datawindow within w_pfc_sender
boolean visible = false
integer x = 3118
integer y = 1212
integer width = 494
integer height = 360
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_recibo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_network from datawindow within w_pfc_sender
integer x = 1975
integer y = 4
integer width = 763
integer height = 100
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_branch_network"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event losefocus;Double	ld_sender,	ld_receiver
string	ls_city,ls_state,ls_country 
DataWindowChild ldw_cdw

dw_network.enabled = False

////////////////////////////// Cargar la Agencia Escogida  ////////////////////////////////

is_branch_insta = dw_network.getitemstring(1,"id_branch")

gs_branch_insta = is_branch_insta
		
	if is_branch_insta = '' then
//		Messagebox("Error","Programa mal Instalado, Error al Seleccionar el Branch de Instalacion, Avise a Sistemas")
		Messagebox("Error","Program not Autorized, Please consult with the System Administrator.",StopSign!)
		Close(w_pfc_sender)
		Return 0;
	end if

  SELECT id_city,id_state,id_country  
    INTO :ls_city,:ls_state,:ls_country  
    FROM branch  
   WHERE id_branch = :is_branch_insta   ;
	
	
////////////////////////////////////////////////////////////
//   DECLARE sp_ubicacion_branch PROCEDURE FOR dba.sp_ubicacion_branch
//         @codigo_branch = :is_branch_insta ;
//		
//	Execute sp_ubicacion_branch; 
//
//	if SQLCA.sqlcode = 0 then
//		FETCH sp_ubicacion_branch  Into :ls_city, :ls_state, :ls_country ;
//		Close sp_ubicacion_branch; 
//	elseif SQLCA.sqlcode = -1 then
//		messagebox("Store Procedure","Error Ubicacion Branch")
//	end if
 //////////////////////////////////////////////////////////		
	
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

/////////////////////

DataWindowChild ldw_dw

dw_2.GetChild("id_country_receiver",ldw_dw)
ldw_dw.SetTransObject(SQLCA)
dw_2.SetItem(dw_2.GetRow(),"id_country_receiver","")
ldw_dw.Retrieve()
ldw_dw.SetFilter("")
ldw_dw.Filter()

dw_2.GetChild("id_state_receiver",ldw_dw)
ldw_dw.SetTransObject(SQLCA)
dw_2.SetItem(dw_2.GetRow(),"id_state_receiver","")
ldw_dw.Retrieve()
ldw_dw.SetFilter("id_country = ''")
ldw_dw.Filter()
	
dw_2.SetItem(dw_2.GetRow(),"id_city_receiver","")
dw_2.GetChild("id_city_receiver",ldw_dw)
ldw_dw.SetTransObject(SQLCA)
ldw_dw.Retrieve()
ldw_dw.SetFilter("id_country = '' and id_state = ''")
ldw_dw.Filter()
/////////////////////


















end event

type dw_recibo_matrix from datawindow within w_pfc_sender
boolean visible = false
integer x = 2985
integer y = 520
integer width = 494
integer height = 360
integer taborder = 170
boolean bringtotop = true
boolean enabled = false
string dataobject = "dw_recibo_dot_matrix"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_pfc_sender
event ue_enter_key pbm_dwnprocessenter
integer width = 1979
integer height = 448
integer taborder = 20
string dataobject = "dw_pfc_sender"
boolean border = false
boolean livescroll = true
end type

event ue_enter_key;Send(Handle(This),256,9,Long(0,0))
Return 1
end event

event itemfocuschanged;string	   ls_name , ls_city, ls_country_sender,ls_state_sender="",ls_city_sender="",	&
				ls_state,			&
				ls_country,			&
				ls_codcou,			&
				ls_codsta,			&
				ls_zip_sender,		&
				ls_flag_place
	
string	ls_branch,				&
			ls_address,				&
			ls_name_receiver,		&
			ls_bank,					&
			ls_account,				&
			ls_modo_pago,			&
			ls_corresponsal, 		&
			ls_main_branch, 		&
			ls_moneda

string	ls_phone1, ls_phone2, ls_zip, ls_country_rec, ls_city_rec, ls_state_rec
				
Double		ll_cont = 0
Double		ll_id_sender, ld_receiver
DataWindowChild	ldw_cdw


/////// Traer la Ciudad por el Zip Code ////////////////////////

If dw_1.GetColumn() = 5 Then
	ls_country_sender = dw_1.getitemstring(row,"id_country")
	ls_zip_sender = string(dw_1.getitemnumber(row,"zip_sender"))
	
	If isnull(ls_zip_sender) then
		ls_zip_sender = ""
   End If
	
	 If ls_zip_sender <> "" and ls_zip_sender <> "0" then
       
		 SELECT id_state,   
              id_city  
       INTO   :ls_state_sender,   
              :ls_city_sender  
       FROM   dba.city  
       WHERE (id_country = :ls_country_sender ) AND  
             (id_city = :ls_zip_sender )   ;

       If ls_state_sender <> "" and ls_city_sender <> "" then
			
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

	End if
		
end if



If dw_1.GetColumn() = 4 Then
	ls_name = "%"+dw_1.getitemstring(row,3)+"%"
	gs_branch_insta = is_branch_insta
	
	//		SELECT Count(*)  
	//    		INTO :ll_cont  
	//    		FROM sender  
	//   	WHERE name_sender like :ls_name and
	//				id_branch = :gs_branch_insta  ;

	////////////////  Remplazado por el Procedimiento Almacenado /////////////////////////

	DECLARE sp_cuenta_nombre_sender PROCEDURE FOR dba.sp_cuenta_nombre_sender
           @nombre = :ls_name , @codigo_branch = :gs_branch_insta ;
		
	Execute sp_cuenta_nombre_sender; 

	if SQLCA.sqlcode = 0 then
		FETCH sp_cuenta_nombre_sender  Into :ll_cont ;
		Close sp_cuenta_nombre_sender; 
	elseif SQLCA.sqlcode = -1 then
		messagebox("Store Procedure","Cuenta Nombres Sender No Satisfactorio")
	end if

	//////////////////////////////////////////////////////////////////////////////////////
	if ll_cont > 0 Then
		gl_sender = 0
		Openwithparm(w_busca_nombre,ls_name)
		ll_id_sender = message.Doubleparm
		gl_sender = ll_id_sender
					
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

		if ll_id_sender <> 0 Then
			gl_sender = ll_id_sender
					
			GetChild('id_state',ldw_cdw)
			ldw_cdw.SetFilter('')
			ldw_cdw.Filter()
			GetChild('id_city',ldw_cdw)
			ldw_cdw.SetFilter('')
			ldw_cdw.Filter()
						
			dw_1.retrieve(ll_id_sender,gs_branch_insta)
						
			dw_1.Settaborder(8,0)
			dw_1.Settaborder(9,0)
			dw_1.Settaborder(14,0)
			dw_1.Settaborder(15,0)
			dw_1.Settaborder(10,0)
			dw_1.Settaborder(4,0)
			dw_1.Settaborder(7,0)
			dw_1.Settaborder(3,0)
			dw_2.setitem(dw_2.getrow(),"id_sender",ll_id_sender)
									
			/////////////////////////////////////////////////////////////////////////////////////////
			// Trae los Receiver del Sender Seleccionado
			Openwithparm(w_busca_nombre_receiver,"%%")
			ld_receiver = message.Doubleparm
				
			if ld_receiver <> 0 Then
						
  				SELECT  	receiver.name_receiver,
						  	receiver.address_receiver,
						  	receiver.phone1_receiver,   
         			 	receiver.phone2_receiver,
						   receiver.zip_receiver,
							receiver.bank_receiver,
							receiver.acc_receiver,
							receiver.mode_pay_receiver,
							receiver.branch_pay_receiver, 
							receiver.id_city_receiver, 
							receiver.id_state_receiver, 
							receiver.id_country_receiver,
							branch.id_main_branch,
							receiver.mod_pay_currency  
    			INTO 	:ls_name_receiver,:ls_address,:ls_phone1,   
         			:ls_phone2,:ls_zip,:ls_bank,:ls_account,
						:ls_modo_pago,:ls_corresponsal, :ls_city_rec, :ls_state_rec, :ls_country_rec, :ls_main_branch,:ls_moneda
    			FROM dba.receiver receiver, dba.branch branch 
   			WHERE (branch.id_branch   = receiver.branch_pay_receiver) and
						receiver.id_receiver = :ld_receiver   and
						receiver.id_sender   = :gl_sender	  and
						receiver.id_branch   = :gs_branch_insta   ;
						
						
				is_modo_pago_ultimo = ls_modo_pago
				is_moneda_ultimo    = ls_moneda
				is_branch_ultimo    = ls_corresponsal
				is_grupo_ultimo     = ls_main_branch
						

							
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
					dw_2.setitem(dw_2.getrow(),"mode_pay_receiver",ls_modo_pago)
					dw_2.setitem(dw_2.getrow(),"acc_receiver",ls_account)
					dw_2.setitem(dw_2.getrow(),"bank_receiver",ls_bank)
					dw_2.setitem(dw_2.getrow(),"branch_pay_receiver",ls_corresponsal)
					dw_2.setitem(dw_2.getrow(),"mod_pay_currency",is_moneda_ultimo)
					

					
					ls_flag_place = ""
					
					   SELECT flag_country  
    					INTO   :ls_flag_place  
    					FROM   dba.country  
   					WHERE  id_country = :ls_country_rec   ;

					If ls_flag_place <> 'A' OR ISNULL(ls_flag_place) Then ls_country_rec = ""
					
					dw_2.setitem(dw_2.getrow(),"id_country_receiver",ls_country_rec)
					
					
					dw_2.GetChild("id_state_receiver",ldw_cdw)
					ldw_cdw.SetTransObject(SQLCA)
					ldw_cdw.SetFilter("id_country = '"+ls_country_rec+"'")
					ldw_cdw.Filter()
								
					ls_flag_place = ""	
						
						SELECT flag_state  
    					INTO   :ls_flag_place  
    					FROM   dba.state  
   					WHERE ( id_country = :ls_country_rec ) AND  
         					( id_state   = :ls_state_rec )   ;
			
					If ls_flag_place <> 'A' OR ISNULL(ls_flag_place) Then ls_state_rec = ""			
								
					dw_2.setitem(dw_2.getrow(),"id_state_receiver",ls_state_rec)
						
					dw_2.GetChild("id_city_receiver",ldw_cdw)
					ldw_cdw.SetTransObject(SQLCA)
					ldw_cdw.SetFilter("id_country = '"+ls_country_rec+"' and id_state = '"+ls_state_rec+"'")
					ldw_cdw.Filter()
					
					ls_flag_place = ""	
						
					  SELECT   flag_city  
    					INTO    :ls_flag_place  
    					FROM    dba.city  
   					WHERE ( id_country = :ls_country_rec ) AND  
         					( id_state   = :ls_state_rec ) AND  
         					( id_city    = :ls_city_rec )   ;
								

					If ls_flag_place <> 'A' OR ISNULL(ls_flag_place) Then ls_city_rec = ""	

					dw_2.setitem(dw_2.getrow(),"id_city_receiver",ls_city_rec)
					dw_2.setfocus()
				end if
			end if
			

			dw_2.setfocus()
		else
			// Roofnie Correccion new Sender
			SELECT id_city,   
       			 id_state,   
         		 id_country  
    		INTO  :ls_city,   
         	   :ls_state,   
         	   :ls_country  
    		FROM  branch 
   		WHERE id_branch = :gs_branch_insta   ;
			
			dw_1.setitem(dw_1.getrow(),"id_city",ls_city)
			dw_1.setitem(dw_1.getrow(),"id_state",ls_state)
				

			////////////////////////////////
		end if
	end if
end if


end event

event itemchanged;
string	   ls_codcou, ls_codsta, ls_completename
DataWindowChild	ldw_cdw


IF dwo.Name = "sen_fname" or dwo.Name = "sen_mname" or dwo.Name = "sen_lname" or dwo.Name = "sen_slname" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The name can't have (') symbols.")		
		ls_completename = trim(dw_1.getitemstring(dw_1.getrow(),"sen_fname")) + " " + &
		                  trim(dw_1.getitemstring(dw_1.getrow(),"sen_mname")) + " " + &
								trim(dw_1.getitemstring(dw_1.getrow(),"sen_lname")) + " " + &
								trim(dw_1.getitemstring(dw_1.getrow(),"sen_slname"))		
		dw_1.setitem(dw_1.getrow(),"name_sender", ls_completename)
	END IF
END IF


IF dwo.Name = "name_sender" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The name can't have (') symbols.")
	END IF
END IF


IF dwo.Name = "addres_sender" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The address can't have (') symbols.")
	END IF
END IF


IF dwo.Name = "number_id_sender" THEN
	IF Pos(GetText(),"'") > 0 THEN
		MessageBox("Atention","The id can't have (') symbols.")
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
end event

type cb_print from commandbutton within w_pfc_sender
integer x = 2409
integer y = 832
integer width = 320
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;//parent.Triggerevent("ue_calcular")
parent.Triggerevent("ue_update")
end event

type st_1 from statictext within w_pfc_sender
integer x = 2528
integer y = 848
integer width = 123
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Print"
boolean focusrectangle = false
end type

type st_2 from statictext within w_pfc_sender
boolean visible = false
integer x = 2825
integer y = 944
integer width = 165
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Void"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;parent.Triggerevent("ue_anulacion")
end event

type cb_new from commandbutton within w_pfc_sender
integer x = 2409
integer y = 928
integer width = 320
integer height = 88
integer taborder = 50
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

type st_3 from statictext within w_pfc_sender
integer x = 2519
integer y = 936
integer width = 119
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "New"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_borrar from commandbutton within w_pfc_sender
boolean visible = false
integer x = 2651
integer y = 876
integer width = 361
integer height = 140
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;parent.Triggerevent("ue_anulacion")
end event

type gb_2 from groupbox within w_pfc_sender
integer x = 2386
integer y = 796
integer width = 375
integer height = 520
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type p_1 from picture within w_pfc_sender
integer x = 2418
integer y = 840
integer width = 101
integer height = 80
boolean bringtotop = true
boolean enabled = false
string picturename = "Print!"
boolean focusrectangle = false
end type

type p_2 from picture within w_pfc_sender
integer x = 2423
integer y = 928
integer width = 87
integer height = 80
boolean bringtotop = true
boolean enabled = false
string picturename = "Layer!"
boolean focusrectangle = false
end type

type cb_trans from commandbutton within w_pfc_sender
boolean visible = false
integer x = 2226
integer y = 1184
integer width = 320
integer height = 112
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;parent.Triggerevent("ue_export")
end event

type dw_2 from datawindow within w_pfc_sender
event ue_enterkey pbm_dwnprocessenter
integer x = 5
integer width = 2757
integer height = 1356
integer taborder = 30
string dataobject = "dw_pfc_receiver"
boolean border = false
boolean livescroll = true
end type

event ue_enterkey;Send(Handle(This),256,9,Long(0,0))
Return 1
end event

event itemfocuschanged;string	ls_phone1, ls_phone2, ls_zip, ls_country_rec, ls_city_rec, ls_state_rec
Double	ld_rate, ld_receiver, ld_amount
Date		ld_date = Today()
Time		ld_hour
long		ll_cont

string	ls_name, ls_branch,	&
			ls_address,				&
			ls_name_receiver,		&
			ls_bank,					&
			ls_account,				&
			ls_modo_pago,			&
			ls_corresponsal, ls_main_branch
			
Double	ld_porcentaje,			&
			ld_comision,			&
			ld_feet,					&
			ld_total_receiver,	&
			ld_total_pay_receiver

 ld_porcentaje = 0
 ld_comision = 0
 ld_feet = 0
 ld_total_receiver = 0
 ld_total_pay_receiver = 0




	
IF dw_2.GetColumn() = 18 Then
	
	
		is_city    = dw_2.getitemstring(dw_2.getrow(),"id_city_receiver")
		is_state   = dw_2.getitemstring(dw_2.getrow(),"id_state_receiver")
		is_country = dw_2.getitemstring(dw_2.getrow(),"id_country_receiver")
	
	   gs_country_receiver = is_country
	
		is_mod_pay = dw_2.getitemstring(dw_2.getrow(),"mode_pay_receiver")
		is_mod_currency = dw_2.getitemstring(dw_2.getrow(),"mod_pay_currency")
		gs_city_receiver = is_city
		gs_mod_pay = is_mod_pay
		gs_mod_currency = is_mod_currency
		
		gs_pagador_ultimo = is_branch_ultimo
		
		

				if is_mod_currency = "N" then
					Openwithparm(w_busca_branch_nacional_unificada,gs_city_receiver)
				elseif is_mod_currency = "D" Then
					Openwithparm(w_busca_branch_dolar_unificada,gs_city_receiver)
			   else
					Messagebox("Error","Error Selecting Pay Mode")
					return
				end if
				ls_branch = Message.stringparm
				dw_2.setitem(row,"branch_pay_receiver",ls_branch)
				
				/////////////// Traer los Datos de la Agencia /////////////////
				  SELECT id_main_branch   
         		INTO  :ls_main_branch   
         		FROM  dba.branch  
   				WHERE id_branch = :ls_branch   ;

				dw_2.setitem(row,"branch_id_main_branch",ls_main_branch)
				
	
				if ls_branch = "" or isnull(ls_branch) then
					dw_2.SetColumn(27)
				end if
			
				////////////////////////////////////////////////////////////////
				
				dw_2.setfocus()

	dw_2.accepttext()
	dw_2.setfocus()
		
end if

//////////////////////////////////////////////////////
DataWindowChild ldw_dw, ldw_tmp
Integer li_tot=0 
String ls_tmp, ls_mode_pay, ls_mod_pay, ls_country_filter


IF dwo.Name = "id_city_receiver" OR dwo.Name = "id_state_receiver" OR dwo.Name = "id_country_receiver" THEN 
	   Object.mode_pay_receiver[1]= ''
//		Object.mode_pay_receiver[1]= is_modo_pago_ultimo
END IF

IF dwo.Name = "id_country_receiver" THEN 

	ls_country_filter   =     GetText() 
	
	DECLARE MODE_PAY_BRANCH CURSOR FOR   
	SELECT DISTINCT modo_pago_branch.modo_pago 
   FROM dba.branch branch, dba.cubrimiento_branch cubrimiento_branch, dba.modo_pago_branch modo_pago_branch
	WHERE ( cubrimiento_branch.id_branch = branch.id_branch ) 
	and   ( modo_pago_branch.id_branch = branch.id_branch ) and   
   		( branch.id_flag_branch = 'A' ) AND   
   		( cubrimiento_branch.id_country = :ls_country_filter ) AND   
   		( branch.id_type_branch in ('P','A') ) ; 
			
	OPEN MODE_PAY_BRANCH ; 

		FETCH MODE_PAY_BRANCH INTO :ls_mode_pay ; 
	
		ls_tmp = '(' 
	
			DO WHILE SQLCA.SQLCODE = 0 
				li_tot++ 
				ls_tmp +="'"+ls_mode_pay+"'"+"," 

			FETCH MODE_PAY_BRANCH INTO :ls_mode_pay ; 
		LOOP 

		If Right(ls_tmp,1) = "," Then 
			ls_tmp=Left(ls_tmp,Len(ls_tmp) - 1) 
		End If 

	ls_tmp += ')' 

		GetChild('mode_pay_receiver',ldw_dw) 
		ldw_dw.SetTransObject(SQLCA) 

		IF li_tot>0 THEN 
			ldw_dw.SetFilter("id_modo_pago in "+ls_tmp) 
		ELSE 
			ldw_dw.SetFilter("id_modo_pago = ''") 
		END IF 

	ldw_dw.Filter() 

	CLOSE MODE_PAY_BRANCH; 
END IF 











end event

event itemchanged;DataWindowChild ldw_dw, ldw_tmp
string	ls_city_filter, ls_currency
long		ll_cont

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



IF dwo.name = "mode_pay_receiver" THEN
	IF GetText() <> 'C' and GetText() <> 'E' THEN
		Object.acc_receiver[row]=''
		Object.bank_receiver[row]=''
	END IF
END IF

IF dwo.name = "total_receiver" THEN
	parent.Triggerevent("ue_total")
END IF


IF dwo.name = "total_pay_receiver" THEN
	parent.Triggerevent("ue_cost")
END IF


IF dwo.name = "net_amount_receiver" THEN
	parent.Triggerevent("ue_calcular")
END IF


IF dwo.name = "id_country_receiver" THEN
	GetChild("id_state_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	SetItem(GetRow(),"id_state_receiver","")
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetText()+"'")
	ldw_dw.Filter()
	
	
	SetItem(GetRow(),"id_city_receiver","")
	GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()
	
	IF GetItemString(GetRow(),"id_state_receiver") = '' OR IsNull(GetItemString(GetRow(),"id_state_receiver")) THEN
		ldw_dw.SetFilter("id_country = '"+GetText()+"'")
		ldw_dw.Filter()
	ELSE
		ldw_dw.SetFilter("id_country = '"+GetText()+"' and id_state = '"+GetItemString(GetRow(),"id_state_receiver")+"'")
		ldw_dw.Filter()
	END IF
END IF

IF dwo.name = "id_state_receiver" THEN
	SetItem(GetRow(),"id_city_receiver","")
	GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetItemString(GetRow(),"id_country_receiver")+"' and id_state = '"+GetText()+"'")
	ldw_dw.Filter()
END IF

String ls_cod_cou, ls_cod_sta, ls_id_state, ls_id_city, ls_id_country

IF dwo.Name = "id_city_receiver" THEN
	
	ls_id_city = GetText()
	ls_id_country = GetItemString(GetRow(),"id_country_receiver")
	
	  DECLARE sp_seleccionar_id_estado PROCEDURE FOR dba.sp_seleccionar_id_estado
         @codigo_country = :ls_id_country , @codigo_city = :ls_id_city ;
		
		Execute sp_seleccionar_id_estado; 

		if SQLCA.sqlcode = 0 then
			FETCH sp_seleccionar_id_estado  Into :ls_id_state ;
			Close sp_seleccionar_id_estado; 
		elseif SQLCA.sqlcode = -1 then
			messagebox("Store Procedure","Seleccionar Id State No Satisfactorio")
		end if

	SetItem(GetRow(),"id_state_receiver",ls_id_state)
END IF

//////////////////////////////////////////////////////


Integer li_tot=0 
String ls_tmp, ls_mode_pay, ls_mod_pay, ls_country_filter


IF dwo.Name = "id_city_receiver" OR dwo.Name = "id_state_receiver" OR dwo.Name = "id_country_receiver" THEN 
		 Object.mode_pay_receiver[1]= ''
//		Object.mode_pay_receiver[1]= is_modo_pago_ultimo
END IF 


IF dwo.Name = "id_country_receiver" THEN 
								 
	ls_country_filter   = GetText() 
	ls_city_filter      = ''
								 		
	DECLARE MODE_PAY_BRANCH CURSOR FOR   
	SELECT DISTINCT modo_pago_branch.modo_pago 
   FROM dba.branch branch, dba.cubrimiento_branch cubrimiento_branch, dba.modo_pago_branch modo_pago_branch
	WHERE ( cubrimiento_branch.id_branch = branch.id_branch ) 
	and   ( modo_pago_branch.id_branch = branch.id_branch ) and   
   		( branch.id_flag_branch = 'A' ) AND   
   		( cubrimiento_branch.id_country = :ls_country_filter ) AND   
   		( branch.id_type_branch in ('P','A') ) ; 
			
	OPEN MODE_PAY_BRANCH ; 

		FETCH MODE_PAY_BRANCH INTO :ls_mode_pay ; 
	
		ls_tmp = '(' 
	
			DO WHILE SQLCA.SQLCODE = 0 
				li_tot++ 
				ls_tmp +="'"+ls_mode_pay+"'"+"," 

			FETCH MODE_PAY_BRANCH INTO :ls_mode_pay ; 
		LOOP 

		If Right(ls_tmp,1) = "," Then 
			ls_tmp=Left(ls_tmp,Len(ls_tmp) - 1) 
		End If 

	ls_tmp += ')' 

		GetChild('mode_pay_receiver',ldw_dw) 
		ldw_dw.SetTransObject(SQLCA) 

		IF li_tot>0 THEN 
			ldw_dw.SetFilter("id_modo_pago in "+ls_tmp) 
		ELSE 
			ldw_dw.SetFilter("id_modo_pago = ''") 
		END IF 

	ldw_dw.Filter() 

	CLOSE MODE_PAY_BRANCH; 
END IF 


////////////   FILTRO DE LA MONEDA DE PAGO
//
//	IF dwo.Name = "mod_pay_currency" THEN 
//		ls_id_country   = GetItemString(GetRow(),"id_country_receiver")
//		ls_city_filter  = GetItemString(GetRow(),"id_city_receiver")
//		ls_currency     = GetText() 
//			
//			
//		   SELECT DISTINCT Count(*)  
//    		INTO :ll_cont  
//    		FROM branch,   
//         	cubrimiento_branch,   
//         	modo_pago_branch  
//   		WHERE ( cubrimiento_branch.id_branch = branch.id_branch ) and  
//         		( modo_pago_branch.id_branch   = branch.id_branch   ) and
//					( currency_pay_branch = :ls_currency               ) and
//					( ( branch.id_flag_branch = 'A' ) AND  
//         		( branch.id_type_branch in ('A','P') ) AND  
//         		( branch.id_city = :ls_city_filter ) )   ;
//				
//			
//			if ll_cont = 0 then
//				messagebox('Warning','The currency you selected is not available, please try the other Currency - Seleccione otro Currency')
//				setcolumn(27)
////				Object.mod_pay_currency[1]="" 
//			end if
//	END IF
//

end event

type dw_3 from datawindow within w_pfc_sender
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

type cb_cost from commandbutton within w_pfc_sender
boolean visible = false
integer x = 2651
integer y = 1156
integer width = 183
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

event clicked;parent.Triggerevent("ue_cost")
end event

type st_5 from statictext within w_pfc_sender
boolean visible = false
integer x = 2674
integer y = 1236
integer width = 114
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Cost"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_hold from commandbutton within w_pfc_sender
boolean visible = false
integer x = 2651
integer y = 1016
integer width = 361
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

event clicked;parent.Triggerevent("ue_hold")
end event

type st_6 from statictext within w_pfc_sender
boolean visible = false
integer x = 2871
integer y = 1084
integer width = 128
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Hold"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_3 from picture within w_pfc_sender
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

type cb_calcular from commandbutton within w_pfc_sender
boolean visible = false
integer x = 2651
integer y = 1296
integer width = 361
integer height = 140
integer taborder = 130
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

type st_calcular from statictext within w_pfc_sender
boolean visible = false
integer x = 2793
integer y = 1384
integer width = 210
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Calculate"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_total from commandbutton within w_pfc_sender
boolean visible = false
integer x = 2839
integer y = 1156
integer width = 174
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

event clicked;parent.Triggerevent("ue_total")
end event

type st_total from statictext within w_pfc_sender
boolean visible = false
integer x = 2871
integer y = 1236
integer width = 114
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Total"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_pfc_sender
integer x = 2409
integer y = 1020
integer width = 320
integer height = 88
integer taborder = 120
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

type st_4c from statictext within w_pfc_sender
integer x = 2501
integer y = 1032
integer width = 210
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Calculate"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_6rc from picture within w_pfc_sender
integer x = 2414
integer y = 1020
integer width = 96
integer height = 76
boolean bringtotop = true
boolean enabled = false
string picturename = "C:\ViamericasMT\Graphics\calcula.bmp"
boolean border = true
boolean focusrectangle = false
end type

type lb_borrar from listbox within w_pfc_sender
integer x = 3442
integer y = 8
integer width = 361
integer height = 360
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type em_balance from editmask within w_pfc_sender
integer x = 2226
integer y = 324
integer width = 439
integer height = 68
integer taborder = 110
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

type st_7 from statictext within w_pfc_sender
integer x = 2002
integer y = 336
integer width = 206
integer height = 56
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
boolean enabled = false
string text = "Balance :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_new_rate from commandbutton within w_pfc_sender
integer x = 2409
integer y = 1108
integer width = 320
integer height = 88
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;string	ls_country , ls_activado


id_new_rate = 0
id_old_rate = 0 
	


ls_country = ''
ls_country = dw_2.getitemstring(dw_2.getrow(),"id_country_receiver")

if ib_actualizado	then return

if ls_country = "" then
	return
end if

	ls_activado = ''
	
  SELECT country.new_rate  
    INTO :ls_activado  
    FROM dba.country country  
   WHERE country.id_country = :is_country   ;

	if ls_activado = '' or Isnull(ls_activado) then ls_activado = 'I'


if ls_activado <> 'A' then 
	Messagebox('Warning', 'Not Allowed for this Country')
	return
end if




parent.Triggerevent("ue_new_rate")
end event

type p_4 from picture within w_pfc_sender
integer x = 2423
integer y = 1124
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "CreateIndex!"
boolean focusrectangle = false
end type

type st_333 from statictext within w_pfc_sender
integer x = 2491
integer y = 1124
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "New Rate"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_adjust_rate from commandbutton within w_pfc_sender
integer x = 2409
integer y = 1200
integer width = 320
integer height = 88
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;
if ib_actualizado	then return

parent.Triggerevent("ue_modifrate")
end event

type p_5 from picture within w_pfc_sender
integer x = 2423
integer y = 1212
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "EnglishQuery!"
boolean border = true
boolean focusrectangle = false
end type

type st_3334 from statictext within w_pfc_sender
integer x = 2505
integer y = 1208
integer width = 187
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Adjust"
boolean focusrectangle = false
end type

