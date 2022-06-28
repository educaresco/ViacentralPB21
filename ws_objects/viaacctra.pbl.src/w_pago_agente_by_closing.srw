$PBExportHeader$w_pago_agente_by_closing.srw
forward
global type w_pago_agente_by_closing from wb_response
end type
type dw_1 from datawindow within w_pago_agente_by_closing
end type
type dw_2 from datawindow within w_pago_agente_by_closing
end type
type cb_1 from commandbutton within w_pago_agente_by_closing
end type
type cb_save from commandbutton within w_pago_agente_by_closing
end type
type em_date from editmask within w_pago_agente_by_closing
end type
type st_1 from statictext within w_pago_agente_by_closing
end type
type cb_2 from commandbutton within w_pago_agente_by_closing
end type
type cb_3 from commandbutton within w_pago_agente_by_closing
end type
type dw_3 from datawindow within w_pago_agente_by_closing
end type
type st_2 from statictext within w_pago_agente_by_closing
end type
type st_3 from statictext within w_pago_agente_by_closing
end type
type dw_choise from datawindow within w_pago_agente_by_closing
end type
type cb_4 from commandbutton within w_pago_agente_by_closing
end type
type em_group from editmask within w_pago_agente_by_closing
end type
type st_4 from statictext within w_pago_agente_by_closing
end type
type cb_procesar from commandbutton within w_pago_agente_by_closing
end type
type cb_6 from commandbutton within w_pago_agente_by_closing
end type
type em_ajuste_credit from editmask within w_pago_agente_by_closing
end type
type st_5 from statictext within w_pago_agente_by_closing
end type
type st_53 from statictext within w_pago_agente_by_closing
end type
type em_agent from editmask within w_pago_agente_by_closing
end type
type dw_cross_payee_final from datawindow within w_pago_agente_by_closing
end type
type st_6 from statictext within w_pago_agente_by_closing
end type
type em_wire from singlelineedit within w_pago_agente_by_closing
end type
type cb_new from commandbutton within w_pago_agente_by_closing
end type
type cb_7 from commandbutton within w_pago_agente_by_closing
end type
type cb_8 from commandbutton within w_pago_agente_by_closing
end type
type cb_44 from commandbutton within w_pago_agente_by_closing
end type
type cb_84 from commandbutton within w_pago_agente_by_closing
end type
type cb_444 from commandbutton within w_pago_agente_by_closing
end type
type em_ajuste_debit from editmask within w_pago_agente_by_closing
end type
type st_4433 from statictext within w_pago_agente_by_closing
end type
type em_fecha1 from editmask within w_pago_agente_by_closing
end type
type em_fecha2 from editmask within w_pago_agente_by_closing
end type
type sle_desc_ac from singlelineedit within w_pago_agente_by_closing
end type
type st_44 from statictext within w_pago_agente_by_closing
end type
end forward

global type w_pago_agente_by_closing from wb_response
int X=293
int Y=212
int Width=3982
int Height=2260
boolean Visible=false
boolean TitleBar=true
string Title="Pay Payees"
long BackColor=12639424
boolean ControlMenu=false
dw_1 dw_1
dw_2 dw_2
cb_1 cb_1
cb_save cb_save
em_date em_date
st_1 st_1
cb_2 cb_2
cb_3 cb_3
dw_3 dw_3
st_2 st_2
st_3 st_3
dw_choise dw_choise
cb_4 cb_4
em_group em_group
st_4 st_4
cb_procesar cb_procesar
cb_6 cb_6
em_ajuste_credit em_ajuste_credit
st_5 st_5
st_53 st_53
em_agent em_agent
dw_cross_payee_final dw_cross_payee_final
st_6 st_6
em_wire em_wire
cb_new cb_new
cb_7 cb_7
cb_8 cb_8
cb_44 cb_44
cb_84 cb_84
cb_444 cb_444
em_ajuste_debit em_ajuste_debit
st_4433 st_4433
em_fecha1 em_fecha1
em_fecha2 em_fecha2
sle_desc_ac sle_desc_ac
st_44 st_44
end type
global w_pago_agente_by_closing w_pago_agente_by_closing

type variables
long	il_row = 0
String	is_group =""
Boolean   ib_actualizado = False
end variables

on w_pago_agente_by_closing.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_2=create dw_2
this.cb_1=create cb_1
this.cb_save=create cb_save
this.em_date=create em_date
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.dw_3=create dw_3
this.st_2=create st_2
this.st_3=create st_3
this.dw_choise=create dw_choise
this.cb_4=create cb_4
this.em_group=create em_group
this.st_4=create st_4
this.cb_procesar=create cb_procesar
this.cb_6=create cb_6
this.em_ajuste_credit=create em_ajuste_credit
this.st_5=create st_5
this.st_53=create st_53
this.em_agent=create em_agent
this.dw_cross_payee_final=create dw_cross_payee_final
this.st_6=create st_6
this.em_wire=create em_wire
this.cb_new=create cb_new
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_44=create cb_44
this.cb_84=create cb_84
this.cb_444=create cb_444
this.em_ajuste_debit=create em_ajuste_debit
this.st_4433=create st_4433
this.em_fecha1=create em_fecha1
this.em_fecha2=create em_fecha2
this.sle_desc_ac=create sle_desc_ac
this.st_44=create st_44
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_save
this.Control[iCurrent+5]=this.em_date
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.dw_3
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.dw_choise
this.Control[iCurrent+13]=this.cb_4
this.Control[iCurrent+14]=this.em_group
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.cb_procesar
this.Control[iCurrent+17]=this.cb_6
this.Control[iCurrent+18]=this.em_ajuste_credit
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.st_53
this.Control[iCurrent+21]=this.em_agent
this.Control[iCurrent+22]=this.dw_cross_payee_final
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.em_wire
this.Control[iCurrent+25]=this.cb_new
this.Control[iCurrent+26]=this.cb_7
this.Control[iCurrent+27]=this.cb_8
this.Control[iCurrent+28]=this.cb_44
this.Control[iCurrent+29]=this.cb_84
this.Control[iCurrent+30]=this.cb_444
this.Control[iCurrent+31]=this.em_ajuste_debit
this.Control[iCurrent+32]=this.st_4433
this.Control[iCurrent+33]=this.em_fecha1
this.Control[iCurrent+34]=this.em_fecha2
this.Control[iCurrent+35]=this.sle_desc_ac
this.Control[iCurrent+36]=this.st_44
end on

on w_pago_agente_by_closing.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.cb_save)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_choise)
destroy(this.cb_4)
destroy(this.em_group)
destroy(this.st_4)
destroy(this.cb_procesar)
destroy(this.cb_6)
destroy(this.em_ajuste_credit)
destroy(this.st_5)
destroy(this.st_53)
destroy(this.em_agent)
destroy(this.dw_cross_payee_final)
destroy(this.st_6)
destroy(this.em_wire)
destroy(this.cb_new)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_44)
destroy(this.cb_84)
destroy(this.cb_444)
destroy(this.em_ajuste_debit)
destroy(this.st_4433)
destroy(this.em_fecha1)
destroy(this.em_fecha2)
destroy(this.sle_desc_ac)
destroy(this.st_44)
end on

event open;call super::open;X=1
Y=1
Show()
em_fecha1.text = string(relativedate(today(),-2))
em_fecha2.text = string(today())



dw_choise.settransobject(sqlca)
ib_actualizado = False
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_choise.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_1.setitem(1,"cons",1)
dw_2.setitem(1,"cons",1)



end event

event pfc_close;call super::pfc_close;dw_1.reset()
dw_2.reset()
dw_3.reset()


end event

event close;call super::close;dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_choise.reset()


end event

type dw_1 from datawindow within w_pago_agente_by_closing
int X=14
int Y=108
int Width=2098
int Height=200
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_selet_cuenta_pago_corresponsal"
boolean Border=false
boolean LiveScroll=true
end type

event itemchanged;DataWindowChild	ldw_dw

IF dwo.Name = 'id_banco' THEN
	GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("id_banco = '"+GetText()+"'")
	ldw_dw.Filter()
END IF

dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",'')
end event

type dw_2 from datawindow within w_pago_agente_by_closing
int Y=296
int Width=3433
int Height=348
int TabOrder=70
boolean BringToTop=true
string DataObject="dw_consignacion_group_agent_seleccionado"
boolean Border=false
boolean LiveScroll=true
end type

type cb_1 from commandbutton within w_pago_agente_by_closing
int X=2267
int Y=108
int Width=1051
int Height=80
int TabOrder=270
boolean BringToTop=true
string Text="Continue"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_cons
string	ls_banco, ls_cuenta_banco


if Messagebox('Warning','Esta Seguro que desea Continuar, todo se borrarra, asegurese de haber Salvado',question!,YesNo!)  <> 1 then
	return
end if

COMMIT ;
sle_desc_ac.text = ''
em_ajuste_credit.text = string(0)
em_ajuste_debit.text = string(0)
em_wire.text = string(0)
ls_banco 			= dw_1.getitemstring(1,'id_banco')
ls_cuenta_banco   = dw_1.getitemstring(1,'id_cuenta_banco')
dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_choise.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_choise.reset()
dw_cross_payee_final.reset()
ib_actualizado = False
dw_1.setitem(1,"cons",ld_cons)
dw_1.setitem(1,"id_banco",ls_banco)
dw_1.setitem(1,"id_cuenta_banco",ls_cuenta_banco)
dw_2.setitem(1,"cons",ld_cons)
dw_choise.settransobject(sqlca)
ib_actualizado = False
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)









end event

type cb_save from commandbutton within w_pago_agente_by_closing
int X=2267
int Y=188
int Width=1051
int Height=80
int TabOrder=110
boolean BringToTop=true
string Text="Save pay"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_cons, ld_deposito, 	&
			ld_balance = 0, 			&
			ld_disponible = 0, 		&
			ld_deposito1, 				&
			ld_referencia = 0, 		&
			ld_delivery = 0, 			&
			ld_telex = 0, 				&
			ld_ajuste = 0 ,         &
			ld_link_reference = 0,	&
			ld_cons1 = 0,				&
			ld_comision_payee = 0,	&
			ld_gran_total = 0,		&
			ld_other = 0
	
DATE			ld_hoy,ld_date1
Datetime		ld_date
LONG	ll_dias

String	ls_desc_ac

ls_desc_ac = ''
ls_desc_ac = sle_desc_ac.text
dw_2.accepttext()
ld_hoy  = Today()
ld_date = dw_2.getitemdatetime(dw_2.getrow(),"date")



commit ;
		
if  Double(em_ajuste_credit.text) <> 0 and  Double(em_ajuste_debit.text) <> 0 then
	messagebox('Error','No puede tener valor en el credito y el debito al mismo Tiempo')
	return
end if		
		
if  Double(em_ajuste_credit.text) < 0 or  Double(em_ajuste_debit.text) < 0 then
	messagebox('Error','No puede tener valor en el credito o el debito menores a cero')
	return
end if		
				
		
		
string	ls_account, ls_group, ls_banco,ls_status
Long		ll_i = 1, I = 0 , ll_cons = 0

cb_procesar.TriggerEvent(Clicked!)

ld_balance    = 0
ls_banco      = dw_1.getitemstring(dw_1.getrow(),"id_banco")
ls_account = dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")
ls_group = dw_2.getitemstring(dw_2.getrow(),"id_group")
ld_deposito   =  dw_2.getitemnumber(dw_2.getrow(),"credit")
ld_deposito1  =  dw_2.getitemnumber(dw_2.getrow(),"credit")
ld_date      =  dw_2.getitemdatetime(dw_2.getrow(),"date")

if ld_deposito <= 0 then
	Messagebox("Error","Tansfer Less than 0 ")
	return
end if


	SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		
		if isnull(ld_cons) then ld_cons = 1			


  SELECT dba.group_branch.credit_group  
    INTO :ld_disponible  
    FROM dba.group_branch  
   WHERE dba.group_branch.id_main_branch = :ls_group   ;

	if ISNULL(ld_disponible) then ld_disponible = 0
	
	ld_deposito = ld_deposito + ld_disponible

if isnull(ls_account) or ls_account = '' then
	Messagebox("Error","You have to choise the account")
	return
end if

		
		
string	ls_tipo_pago = "", ls_branch

Double	ld_vlr_total_pagar = 0,	&
			ld_receiver,		 		&
			ld_amount = 0, 			&
			ld_comision = 0, 			&
			ld_pagado = 0,				&
			ld_pendiente = 0, 		&
			ld_cambio = 0,				&
			ld_total = 0,				&
			ld_fee_rate = 0,			&
			ld_cons_master = 0
	
FOR ll_i = 1 TO il_row
	
	
	IF dw_choise.IsSelected(ll_i) THEN
		ls_status = ''
		ls_branch	  = dw_choise.getitemstring(ll_i,"id_branch")
		ld_receiver   = dw_choise.getitemnumber(ll_i,"id_receiver")
		ld_amount     = dw_choise.getitemnumber(ll_i,"net_amount_receiver")
		ld_delivery   = dw_choise.getitemnumber(ll_i,"total_modo_pago_comp")
		ld_comision   = dw_choise.getitemnumber(ll_i,"exchange_company")
		ld_telex 	  = dw_choise.getitemnumber(ll_i,"telex_company")
		ld_other      = dw_choise.getitemnumber(ll_i,"receiver_handling_receiver")
		ld_fee_rate   = dw_choise.getitemnumber(ll_i,"fee_rate")
		ls_status     = dw_choise.getitemstring(ll_i,"status")
		if ls_status = '' or isnull(ls_status) then 
			ls_status = 'U'
		end if
		
		if ls_status = 'U' then
			ld_total      = ld_amount + ld_comision + ld_delivery + ld_telex + ld_other + ld_fee_rate
			
			   INSERT INTO dba.relacion_pago_agente  
         	( cons_trans_diaria,id_main_branch,id_branch,id_receiver,vlr_total,vlr_pagado )  
  				VALUES ( :ld_cons,:ls_group,:ls_branch,:ld_receiver,:ld_total,:ld_total )  ;

				UPDATE dba.receiver  
     			SET dba.receiver.status_pago_agent = 'P'  
   			WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         		   ( dba.receiver.id_receiver = :ld_receiver )   ;
		else
			ld_total = 0
		end if
			
				ld_deposito = ld_deposito - ld_total	
	END IF
	
	NEXT
	
	 UPDATE dba.group_branch  
    SET  dba.group_branch.credit_group = :ld_deposito  
   WHERE dba.group_branch.id_main_branch = :ls_group   ;

			
ld_link_reference = 0	
			
ld_link_reference = dw_2.getitemnumber(dw_2.getrow(),"link_reference")	

if Isnull(ld_link_reference) or ld_link_reference = 0 then
	ld_link_reference = ld_cons
end if


dw_1.setitem(1,"id_cashier",gs_cashier)
dw_1.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"balance",ld_balance)
dw_2.accepttext()

IF dw_2.update()=1 THEN
	IF dw_1.update()=1 THEN
		dw_1.enabled = False
		dw_2.enabled = False
		COMMIT ;
		 ib_actualizado = True
		Messagebox("Pay to Payee","Pay is Already")
		COMMIT ;
		
		  SELECT Count(*)  
        INTO :ll_cons  
        FROM dba.transaccion_diaria_payee  
        WHERE dba.transaccion_diaria_payee.cons_trans_diaria = :ld_cons   ;

		if ll_cons <> 1 then
			Messagebox('Error','No Grabo en la base de Datos')
		else
			Messagebox('Finish','Verificacion de Grabado en el deposito de Agente O.K')
		end if
		
		
		
		
		
		//////  RELACIONAR lo pagado por el agente \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	
		ld_gran_total = 0
	
	
		FOR i = 1 TO dw_cross_payee_final.rowcount()
			ld_total = 0
			ld_comision_payee = 0
				
			IF dw_cross_payee_final.IsSelected(i) THEN
				ld_amount     		  = dw_cross_payee_final.getitemnumber(i,"net_amount_receiver")
				ld_comision_payee   = dw_cross_payee_final.getitemnumber(i,"commission_payee")
				ld_total            = ld_amount + ld_comision_payee 
				ld_gran_total       = ld_gran_total + ld_total
			END IF
		NEXT

	
		IF ld_gran_total <> 0 THEN
	
			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       	INTO :ld_cons1  
       	FROM dba.transaccion_diaria_payee  ;
			
			  	INSERT INTO dba.transaccion_diaria_payee
         		( cons_trans_diaria,   
          		 id_group_trans_diaria,   
           		date_trans_diaria,   
           		hour_trans_diaria,   
           		id_concepto_contable,   
          		 des_trans_diaria,   
          		 debit_trans_diaria,   
          		 credit_trans_diaria,   
          		 balance_trans_diaria,   
           		descripcion_suspense,   
           		link_reference )  
 		 		VALUES ( :ld_cons1,   
           				:ls_group,   
           				:ld_date,   
           				GETDATE(),   
           				'DP',   
           				'INVOICES PAGADOS POR EL AGENTE AL CLIENTE',   
           				:ld_gran_total,   
           				0,   
           				0,   
           				'',   
           				:ld_link_reference )  ;

					COMMIT ;
					
						
		  SELECT Count(*)  
        INTO :ll_cons   
        FROM dba.transaccion_diaria_payee  
        WHERE dba.cons_trans_diaria = :ld_cons1   ;

				if ll_cons <> 1 then
					Messagebox('Error','No Grabo en la base de Datos')
				else
					Messagebox('Finish','Verificacion de Grabado en el wire para Agente O.K')
				end if
		
		FOR i = 1 TO dw_cross_payee_final.rowcount()
			ld_gran_total = 0
			ld_total = 0
			ld_comision_payee = 0
	
			IF dw_cross_payee_final.IsSelected(i) THEN
		
				ls_branch	        = dw_cross_payee_final.getitemstring(i,"id_branch")
				ld_receiver         = dw_cross_payee_final.getitemnumber(i,"id_receiver")
				ld_amount     		  = dw_cross_payee_final.getitemnumber(i,"net_amount_receiver")
				ld_comision_payee   = dw_cross_payee_final.getitemnumber(i,"commission_payee")
				ld_total            = ld_amount + ld_comision_payee 
				ld_gran_total       = ld_gran_total + ld_total
		
				INSERT INTO dba.relacion_pago_confirmacion  
         	( cons_trans_diaria,id_main_branch,id_branch,id_receiver,vlr_total,vlr_pagado )  
  				VALUES ( :ld_cons1,:ls_group,:ls_branch,:ld_receiver,:ld_total,:ld_total )  ;

				commit ;

				UPDATE dba.receiver  
     			SET dba.receiver.status_pago_payee = 'P'  
   			WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
         		   ( dba.receiver.id_receiver = :ld_receiver )   ;
	
			END IF
		NEXT
		
			commit ;

	END IF


			ld_total = 0
			ld_gran_total = 0
			
		
		///////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	
	
		ld_ajuste = 0
		
		if Double(em_ajuste_debit.text) > 0 then
			
			ld_ajuste = Double(em_ajuste_debit.text)
	
			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       	INTO :ld_cons1  
       	FROM dba.transaccion_diaria_payee  ;
			
			  	INSERT INTO dba.transaccion_diaria_payee
         		( cons_trans_diaria,   
          		 id_group_trans_diaria,   
           		date_trans_diaria,   
           		hour_trans_diaria,   
           		id_concepto_contable,   
          		 des_trans_diaria,   
          		 debit_trans_diaria,   
          		 credit_trans_diaria,   
          		 balance_trans_diaria,   
           		descripcion_suspense,   
           		link_reference )  
 		 		VALUES ( :ld_cons1,   
           				:ls_group,   
           				:ld_date,   
           				GETDATE(),   
           				'AC',   
           				:ls_desc_ac,   
           				:ld_ajuste,   
           				0,   
           				0,   
           				'',   
           				:ld_link_reference )  ;

					commit ;
					
					  INSERT INTO dba.transaccion_diaria_banco_payee  
         			( dba.transaccion_diaria_banco_payee.cons_trans_diaria,   
           				dba.transaccion_diaria_banco_payee.id_banco,   
           				dba.transaccion_diaria_banco_payee.id_cuenta_banco )  
  						VALUES ( :ld_cons1,   
           						:ls_banco,   
          					 :ls_account )  ;

						if sqlca.sqlcode <> 0 then
							Messagebox('','SQL Error')
						end if
					
										commit ;
			
			
		end if
		
		if Double(em_ajuste_credit.text) > 0 then
			
			ld_ajuste = Double(em_ajuste_credit.text)
			
			ld_ajuste = abs(ld_ajuste)
			
			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       	INTO :ld_cons1  
       	FROM dba.transaccion_diaria_payee  ;
			
			  	INSERT INTO dba.transaccion_diaria_payee  
         		( cons_trans_diaria,   
          		 id_group_trans_diaria,   
           		date_trans_diaria,   
           		hour_trans_diaria,   
           		id_concepto_contable,   
          		 des_trans_diaria,   
          		 debit_trans_diaria,   
          		 credit_trans_diaria,   
          		 balance_trans_diaria,   
           		descripcion_suspense,   
           		link_reference )  
 		 		VALUES ( :ld_cons1,   
           				:ls_group,   
           				:ld_date,   
           				GETDATE(),   
           				'AC',   
           				:ls_desc_ac,   
           				0,   
           				:ld_ajuste,   
           				0,   
           				'',   
           				:ld_link_reference )  ;

					commit ;
			
			
					  INSERT INTO dba.transaccion_diaria_banco_payee  
         			( dba.transaccion_diaria_banco_payee.cons_trans_diaria,   
           				dba.transaccion_diaria_banco_payee.id_banco,   
           				dba.transaccion_diaria_banco_payee.id_cuenta_banco )  
  						VALUES ( :ld_cons1,   
           						:ls_banco,   
          					 :ls_account )  ;

						if sqlca.sqlcode <> 0 then
							Messagebox('','SQL Error')
						end if

						commit ;
			
			
		end if
		
	
	commit ;
	commit ;
	ELSE
		Rollback ;
		Return
	END IF
ELSE
	Rollback ;
	Return
END IF




	
		
		
end event

type em_date from editmask within w_pago_agente_by_closing
int X=32
int Y=1636
int Width=343
int Height=96
int TabOrder=230
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_pago_agente_by_closing
int X=37
int Y=1580
int Width=247
int Height=56
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string Text="Date Since"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_2 from commandbutton within w_pago_agente_by_closing
int X=393
int Y=1640
int Width=357
int Height=96
int TabOrder=250
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string Text="&Info. Wire"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF IsNull(dw_2.Object.id_group[dw_2.GetRow()]) OR dw_2.Object.id_group[dw_2.GetRow()]='' THEN
	MessageBox('Atention','You have to choose a group and then press Info. Savings.')
	Return
END IF

dw_3.Retrieve(Date(em_date.text),dw_2.Object.id_group[dw_2.GetRow()])
end event

type cb_3 from commandbutton within w_pago_agente_by_closing
int X=750
int Y=1640
int Width=357
int Height=96
int TabOrder=260
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string Text="&Print"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;PRINTSETUP()
dw_3.PRINT()
end event

type dw_3 from datawindow within w_pago_agente_by_closing
int X=23
int Y=680
int Width=2702
int Height=912
int TabOrder=170
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string DataObject="dw_rep_wire_transfer"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

type st_2 from statictext within w_pago_agente_by_closing
int X=978
int Y=12
int Width=183
int Height=72
boolean Enabled=false
boolean BringToTop=true
string Text="From :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12639424
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_pago_agente_by_closing
int X=1486
int Y=12
int Width=105
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="To :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12639424
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_choise from datawindow within w_pago_agente_by_closing
int X=14
int Y=608
int Width=2414
int Height=1540
int TabOrder=240
boolean BringToTop=true
string DataObject="dw_pago_agente_by_closing"
boolean Border=false
boolean VScrollBar=true
boolean LiveScroll=true
end type

event clicked;

integer CurRow
boolean result

result = this.IsSelected(Row)

IF result THEN
	this.SelectRow(Row, FALSE)
ELSE
	this.SelectRow(Row, TRUE)
END IF



end event

type cb_4 from commandbutton within w_pago_agente_by_closing
int X=1952
int Y=8
int Width=265
int Height=80
int TabOrder=60
boolean BringToTop=true
string Text="Datos"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;is_group = em_group.text


Double 	ld_from, ld_to, ld_from1, ld_to1
long		i
string	ls_texto



//il_row = dw_choise.retrieve(datetime(date(em_fecha1.text),time('01:01:01')),datetime(date(em_fecha2.text),time('01:01:01')),is_group)
il_row = dw_choise.retrieve(date(em_fecha1.text),date(em_fecha2.text),is_group)

dw_cross_payee_final.retrieve(em_agent.text)
  
//dw_2.setitem(dw_2.getrow(),"description",ls_texto)
  
  
FOR i=1 TO il_row
	dw_choise.SelectRow(i, TRUE)
NEXT

	
//	cb_5.TriggerEvent(Clicked!)
end event

type em_group from editmask within w_pago_agente_by_closing
int X=722
int Y=12
int Width=256
int Height=72
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="!!!!"
MaskDataType MaskDataType=StringMask!
boolean AutoSkip=true
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_pago_agente_by_closing
int X=521
int Y=12
int Width=192
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Group  :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12639424
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_procesar from commandbutton within w_pago_agente_by_closing
int X=2267
int Y=24
int Width=521
int Height=80
int TabOrder=80
boolean BringToTop=true
string Text="Procesar"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_total = 0,				&
			ld_amount = 0,				&
			ld_telex = 0,				&
			ld_comision = 0,			&
			ld_delivery = 0,			&
			ld_transferencia = 0,	&
			ld_other = 0,				&
			ld_fee_rate = 0, ld_from, ld_to, ld_receiver
			
string	ls_status = 'U', ls_texto			
			
Long		ll_i = 1

ld_from = 0
ld_to = 0
il_row  = dw_choise.rowcount() 

if il_row = 0 then Return

FOR ll_i = 1 TO il_row
	
	 
		
	IF dw_choise.IsSelected(ll_i) THEN
		
		ls_status = ''
		ls_status     = dw_choise.getitemstring(ll_i,"status")
		ld_amount     = dw_choise.getitemnumber(ll_i,"net_amount_receiver")
		ld_delivery   = dw_choise.getitemnumber(ll_i,"total_modo_pago_comp")
		ld_comision   = dw_choise.getitemnumber(ll_i,"exchange_company")
		ld_telex 	  = dw_choise.getitemnumber(ll_i,"telex_company")
		ld_other      = dw_choise.getitemnumber(ll_i,"receiver_handling_receiver")
		ld_fee_rate   = dw_choise.getitemnumber(ll_i,"fee_rate")
		if ls_status = '' or isnull(ls_status) then 
			ls_status = 'U'
		end if
		
		if ls_status = 'U' then
			ld_receiver = dw_choise.getitemnumber(ll_i,"id_receiver")
			if ld_from = 0 and (ld_receiver > 0) then 
				ld_from = ld_receiver
			else
				if (ld_receiver < ld_from ) and (ld_receiver > 0) then ld_from = ld_receiver
			end if
			
			if ld_to = 0 then 
				ld_to = ld_receiver
			else
				if (ld_receiver > ld_to) and (ld_receiver > 0) then ld_to = ld_receiver
			end if
			ld_total      = ld_amount + ld_comision + ld_delivery + ld_telex + ld_other + ld_fee_rate
		else
			ld_total = 0
		end if
		
		ld_transferencia = ld_transferencia + ld_total
	END IF
	
NEXT

ls_texto = "DEP From :"+STRING(ld_from)+" To :"+string(ld_to)
dw_2.setitem(dw_2.getrow(),"description",ls_texto)

dw_2.setitem(dw_2.getrow(),"id_group",is_group)
dw_2.setitem(dw_2.getrow(),"credit",ld_transferencia)



Double	ld_gran_total = 0, ld_comision_payee
long		I
	
		ld_gran_total = 0
	
	
		FOR i = 1 TO dw_cross_payee_final.rowcount()
			ld_total = 0
			ld_comision_payee = 0
				
			IF dw_cross_payee_final.IsSelected(i) THEN
				ld_amount     		  = dw_cross_payee_final.getitemnumber(i,"net_amount_receiver")
				ld_comision_payee   = dw_cross_payee_final.getitemnumber(i,"commission_payee")
				ld_total            = ld_amount + ld_comision_payee 
				ld_gran_total       = ld_gran_total + ld_total
			END IF
		NEXT

	em_wire.text = string(ld_gran_total)











end event

type cb_6 from commandbutton within w_pago_agente_by_closing
int X=2798
int Y=24
int Width=521
int Height=80
int TabOrder=90
boolean BringToTop=true
string Text="Print"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_cons

ld_cons = 0
ld_cons = dw_2.getitemnumber(dw_2.getrow(),"cons")

if Not(ib_actualizado) Then return

dw_choise.dataobject = 'dw_despliegue_invoices_pagados_agente'
dw_choise.settransobject(sqlca)
dw_choise.retrieve(ld_cons)

//Printsetup()
//dw_choise.print()
//
















end event

type em_ajuste_credit from editmask within w_pago_agente_by_closing
int X=2391
int Y=448
int Width=306
int Height=64
int TabOrder=100
boolean BringToTop=true
Alignment Alignment=Right!
string Mask="#####,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_5 from statictext within w_pago_agente_by_closing
int X=2391
int Y=376
int Width=306
int Height=64
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
string Text="Credit"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_53 from statictext within w_pago_agente_by_closing
int X=9
int Y=12
int Width=178
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Agent  :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=12639424
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_agent from editmask within w_pago_agente_by_closing
int X=187
int Y=12
int Width=334
int Height=72
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="!!!!"
MaskDataType MaskDataType=StringMask!
boolean AutoSkip=true
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;String	ls_branch, ls_grupo


ls_branch = em_agent.text


  SELECT dba.branch.id_main_branch  
    INTO :ls_grupo  
    FROM dba.branch  
   WHERE dba.branch.id_branch = :ls_branch   ;
	
	em_group.text = ls_grupo


end event

type dw_cross_payee_final from datawindow within w_pago_agente_by_closing
int X=2725
int Y=604
int Width=1230
int Height=1540
int TabOrder=180
boolean BringToTop=true
string DataObject="dw_cross_payee_final_new"
boolean Border=false
boolean VScrollBar=true
boolean LiveScroll=true
end type

event constructor;dw_cross_payee_final.settransobject(sqlca)
end event

event clicked;

integer CurRow
boolean result

result = this.IsSelected(Row)

IF result THEN
	this.SelectRow(Row, FALSE)
ELSE
	this.SelectRow(Row, TRUE)
END IF



end event

type st_6 from statictext within w_pago_agente_by_closing
int X=3031
int Y=376
int Width=288
int Height=64
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
string Text="Wire "
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_wire from singlelineedit within w_pago_agente_by_closing
int X=3026
int Y=448
int Width=288
int Height=64
int TabOrder=140
boolean BringToTop=true
boolean AutoHScroll=false
boolean DisplayOnly=true
long TextColor=33554432
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_new from commandbutton within w_pago_agente_by_closing
int X=2267
int Y=272
int Width=1051
int Height=72
int TabOrder=160
boolean BringToTop=true
string Text="New"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_choise.reset()
dw_cross_payee_final.reset()
sle_desc_ac.text = ''
em_ajuste_credit.text = string(0)
em_ajuste_debit.text = string(0)
em_wire.text = string(0)

em_agent.text = ''
em_group.text = ''



 ib_actualizado = False


dw_choise.settransobject(sqlca)

 ib_actualizado = False

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)



dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_choise.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)




end event

type cb_7 from commandbutton within w_pago_agente_by_closing
int X=3689
int Y=28
int Width=256
int Height=80
int TabOrder=150
boolean BringToTop=true
string Text="Close"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close(parent)
end event

type cb_8 from commandbutton within w_pago_agente_by_closing
int X=2446
int Y=732
int Width=270
int Height=88
int TabOrder=190
boolean BringToTop=true
string Text="Select All"
int TextSize=-7
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long	i, ll_row 
 
 
ll_row = dw_choise.rowcount() 
 
 
FOR i=1 TO ll_row 
	dw_choise.SelectRow(i, TRUE)
NEXT


end event

type cb_44 from commandbutton within w_pago_agente_by_closing
int X=2446
int Y=828
int Width=270
int Height=88
int TabOrder=200
boolean BringToTop=true
string Text="UnSelect All"
int TextSize=-7
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long	i, ll_row 
 
 
ll_row = dw_choise.rowcount() 
 
 
FOR i=1 TO ll_row 
	dw_choise.SelectRow(i, False)
NEXT


end event

type cb_84 from commandbutton within w_pago_agente_by_closing
int X=2446
int Y=1032
int Width=270
int Height=88
int TabOrder=210
boolean BringToTop=true
string Text="Select All"
int TextSize=-7
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long	i, ll_row 
 
 
ll_row = dw_cross_payee_final.rowcount() 
 
 
FOR i=1 TO ll_row 
	dw_cross_payee_final.SelectRow(i, TRUE)
NEXT


end event

type cb_444 from commandbutton within w_pago_agente_by_closing
int X=2446
int Y=1128
int Width=270
int Height=88
int TabOrder=220
boolean BringToTop=true
string Text="UnSelect All"
int TextSize=-7
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long	i, ll_row 
 
 
ll_row = dw_cross_payee_final.rowcount() 
 
 
FOR i=1 TO ll_row 
	dw_cross_payee_final.SelectRow(i, False)
NEXT


end event

type em_ajuste_debit from editmask within w_pago_agente_by_closing
int X=2706
int Y=448
int Width=315
int Height=64
int TabOrder=130
boolean BringToTop=true
Alignment Alignment=Right!
string Mask="#####,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4433 from statictext within w_pago_agente_by_closing
int X=2706
int Y=376
int Width=315
int Height=64
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
string Text="Debit"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_fecha1 from editmask within w_pago_agente_by_closing
int X=1161
int Y=12
int Width=343
int Height=72
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_fecha2 from editmask within w_pago_agente_by_closing
int X=1591
int Y=12
int Width=343
int Height=72
int TabOrder=40
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_desc_ac from singlelineedit within w_pago_agente_by_closing
int X=2391
int Y=520
int Width=923
int Height=64
int TabOrder=120
boolean BringToTop=true
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_44 from statictext within w_pago_agente_by_closing
int X=2053
int Y=520
int Width=320
int Height=64
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
string Text="Desc AC :"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

