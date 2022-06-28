$PBExportHeader$w_rep_hold.srw
forward
global type w_rep_hold from wb_report_fechas
end type
type em_1 from editmask within w_rep_hold
end type
type st_3 from statictext within w_rep_hold
end type
type cb_1 from commandbutton within w_rep_hold
end type
end forward

global type w_rep_hold from wb_report_fechas
integer x = 214
integer y = 221
integer width = 3849
em_1 em_1
st_3 st_3
cb_1 cb_1
end type
global w_rep_hold w_rep_hold

type variables
string	is_output
end variables

on w_rep_hold.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_3=create st_3
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.cb_1
end on

on w_rep_hold.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.cb_1)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_hold
integer x = 27
integer width = 3735
integer taborder = 50
string dataobject = "dw_rep_hold"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_hold
integer x = 1495
end type

type st_1 from wb_report_fechas`st_1 within w_rep_hold
integer x = 1129
integer y = 44
end type

type st_2 from wb_report_fechas`st_2 within w_rep_hold
integer x = 2235
integer y = 44
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_hold
integer x = 2601
end type

event em_fecha2::modified;Date		ld_fecha1, ld_fecha2
string	ls_payee


Setpointer(Hourglass!)

dw_1.settransobject(SQLCARPT)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)

dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()


Setpointer(Arrow!)
end event

type em_1 from editmask within w_rep_hold
boolean visible = false
integer x = 2048
integer y = 36
integer width = 247
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!"
end type

event losefocus;Date		ld_fecha1, ld_fecha2
string	ls_payee


Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)
ls_payee = em_1.text

dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_payee)
dw_1.setfocus()


Setpointer(Arrow!)
end event

type st_3 from statictext within w_rep_hold
boolean visible = false
integer x = 1595
integer y = 44
integer width = 443
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Cod Ecuagiros :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_rep_hold
boolean visible = false
integer x = 2267
integer y = 28
integer width = 480
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Generate File"
end type

event clicked;	string	ls_tmp, ls_filename,ls_decimales, ls_filename_c
	long		ll_file, ll_row, ll_i,li_posicion,li_cadenas,ll_file_c
	double   ld_valor
	
	
	String	ls_transferencia,						&
				ls_referencia,							&
				ls_autorizaccion,						&
				ls_moneda,								&
				ls_costo_d,								&
				ls_monto_p,								&
				ls_comision,							&
				ls_courier,	 							&
				ls_agencia_banco,						&
				ls_name_sender,    					&
				ls_country_sender,					&
				ls_state_sender, 						&
				ls_phone_sender,						&
				ls_name_receiver,						&
				ls_phone_receiver,					&
				ls_cedula_receiver,					&
				ls_country_receiver,					&
				ls_state_receiver,					&
				ls_city_receiver,						&
				ls_city_sender,						&
				ls_city_receiver_ecuagiros,		&
				ls_address_receiver,					&
				ls_notes,								&
				ls_tipo_cuenta,						&
				ls_num_cuenta,							&
				ls_comentario,							&
				ls_cadena,								&
				ls_monto_r,								&
				ls_apellido_sender,					&
				ls_apellido_receiver,				&
				ls_agencia_ecuagiros,				&
				ls_state_sender_ecuagiros,			&
				ls_state_receiver_ecuagiros,		&
				ls_ciudad_ecuagiros,					&
				ls_fecha,								&
				ls_num_registros,						&
				ls_valor,								&
				ls_codigo_courier,					&
				ls_name_city_receiver

  SELECT parametros.dir_output  
    INTO :is_output  
    FROM parametros  ;

	
     ls_filename  = is_output + "pagcour.028"
	
	  ll_row = dw_1.rowcount()
		
	  if ll_row = 0 then return
		
	  ll_file = FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Replace!)
		
	  if ll_file < 0 Then
		  return
	  end if
	
	// Valores de la Cabecera
	  ls_fecha=string(today(),"YYYYMMDD")
	  ls_codigo_courier="028"
	  ls_num_registros = string(ll_row)
	  ld_valor = 0
	
	FOR ll_i= 1 TO ll_row
	
		ls_monto_r					=			string(dw_1.getitemnumber(ll_i,"monto_p"))
		//DECIMALES MONTO RECIBIDO
	
		if pos(ls_monto_r,".")=0 then
			ls_monto_r=ls_monto_r + "00"
		else
			li_posicion=pos(ls_monto_r,".")
			ls_decimales=	mid(ls_monto_r,pos(ls_monto_r,".")+1)
			ls_monto_r=mid(ls_monto_r,1,li_posicion - 1)
			if len(ls_decimales)<>2 then
				if len(ls_decimales) < 2 then
					ls_decimales=ls_decimales + "0"
				else
					ls_decimales = mid(ls_decimales,1,2)
				end if
			end if
			ls_monto_r = ls_monto_r + ls_decimales
		end if
	
	  ld_valor = ld_valor + double(ls_monto_r)
	next
	
	ls_valor = string(ld_valor)
	ls_cadena =  fn_fill(mid(ls_fecha,1,8),"D"," ",8) 						+ 		&
					 fn_fill(mid(ls_num_registros,1,6),"I","0",6) 			+ 		&		
					 fn_fill(mid(ls_valor,1,15),"I","0",15)					+ 		&		
					 fn_fill(mid(ls_codigo_courier,1,3),"D"," ",3)				
					 ls_valor = string(ld_valor)
	Filewrite(ll_file,ls_cadena)
	
	FOR ll_i= 1 TO ll_row
				ls_transferencia			=			dw_1.getitemstring(ll_i,"transferencia")
				ls_referencia				=			string(dw_1.getitemnumber(ll_i,"referencia"))
				ls_autorizaccion			=			"000000000000"
				ls_moneda					=			"01"
				ls_monto_r					=			string(dw_1.getitemnumber(ll_i,"monto_p"))
				ls_costo_d					=			"000000"   
				ls_monto_p					=			string(dw_1.getitemnumber(ll_i,"neto"))			
				ls_comision					=			string(dec(ls_monto_p) * 1.3 / 100)
				ls_courier	 				=			"2801"
				ls_agencia_banco			=			dw_1.getitemstring(ll_i,"receiver_branch_pay_receiver") 		
				ls_name_city_receiver	=			dw_1.getitemstring(ll_i,"city")    
				ls_name_sender    		= 			dw_1.getitemstring(ll_i,"name_sender") 
				ls_country_sender			=			"003"
				ls_state_sender 			=			dw_1.getitemstring(ll_i,"sender_id_state")		
				ls_phone_sender			= 			string(dw_1.getitemnumber(ll_i,"sender_phone1_sender"))
				ls_city_sender				=			"267"
				if isnull(ls_phone_sender) then
					ls_phone_sender=""
				end if
				ls_name_receiver			=			dw_1.getitemstring(ll_i,"name_receiver")	
				ls_phone_receiver			=			string(dw_1.getitemstring(ll_i,"phone1"))	
				if isnull(ls_phone_receiver) then
					ls_phone_receiver=""
				end if
				ls_cedula_receiver		=			"0000000000"
				ls_country_receiver		=			"001"
				ls_state_receiver			=			dw_1.getitemstring(ll_i,"receiver_id_state_receiver")	
				ls_city_receiver			=			dw_1.getitemstring(ll_i,"receiver_id_city_receiver")	
				ls_address_receiver		=			dw_1.getitemstring(ll_i,"address")	
				if isnull(ls_address_receiver) then
					ls_address_receiver=""
				end if
				ls_notes						=			dw_1.getitemstring(ll_i,"notes")	
				if isnull(ls_notes) then
					ls_notes=""
				end if
				ls_num_cuenta				=			dw_1.getitemstring(ll_i,"acc")	
				if isnull(ls_num_cuenta) then
					ls_num_cuenta=""
				end if
				ls_comentario				=			dw_1.getitemstring(ll_i,"name_receiver")	
				if ls_num_cuenta="" then
					ls_tipo_cuenta = "   "
				else
					ls_tipo_cuenta				=			"AHO"
				end if
				if isnull(ls_comentario) then
					ls_comentario=""
				end if
				
		
	//Trae agencia banco Bolivariano
	
		  select ecuagiros
		  into :ls_agencia_ecuagiros
		  from ecuagiros
		  where tipo='AG' and
				  giroex = :ls_agencia_banco;
		 if trim(ls_agencia_ecuagiros) = "" then
			 messagebox("Agencia. No existe relacion en la tabla ECUAGIROS",ls_agencia_banco)
		end if
	
		 ls_state_sender_ecuagiros = ls_state_sender
		
	//Trae el Estado receiver del Banco Bolivariano
	
		  select ecuagiros
		  into :ls_state_receiver_ecuagiros
		  from ecuagiros
		  where tipo='ES' and
				  giroex = :ls_state_receiver;
		 if trim(ls_state_receiver_ecuagiros) = "" then
			 messagebox("Estado Receiver. No existe relacion en la tabla ECUAGIROS",ls_state_receiver)
		end if
	
	//Trae la Ciudad receiver del Banco Bolivariano
	
		  select ecuagiros
		  into :ls_city_receiver_ecuagiros
		  from ecuagiros
		  where tipo='CI' and
				  giroex = :ls_city_receiver;
		 if trim(ls_city_receiver_ecuagiros) = "" then
			 messagebox("City Receiver. No existe relacion en la tabla ECUAGIROS",ls_city_receiver)
		end if
		
	//DECIMALES MONTO RECIBIDO
	
		if pos(ls_monto_r,".")=0 then
			ls_monto_r=ls_monto_r + "00"
		else
			li_posicion=pos(ls_monto_r,".")
			ls_decimales=	mid(ls_monto_r,pos(ls_monto_r,".")+1)
			ls_monto_r=mid(ls_monto_r,1,li_posicion - 1)
			if len(ls_decimales)<>2 then
				if len(ls_decimales) < 2 then
					ls_decimales=ls_decimales + "0"
				else
					ls_decimales = mid(ls_decimales,1,2)
				end if
			end if
			ls_monto_r = ls_monto_r + ls_decimales
		end if
	
	//DECIMALES MONTO PAGADO
		if pos(ls_monto_p,".")=0 then
			ls_monto_p = ls_monto_p + "00"
		else
			li_posicion=pos(ls_monto_p,".")
			ls_decimales=	mid(ls_monto_p,pos(ls_monto_p,".")+1)
			ls_monto_p=mid(ls_monto_p,1,li_posicion - 1)
			if len(ls_decimales)<>2 then
				if len(ls_decimales) < 2 then
					ls_decimales = ls_decimales + "0"
				else
					ls_decimales = mid(ls_decimales,1,2)
				end if
			end if
			ls_monto_p = ls_monto_p + ls_decimales
		end if
		
		//DECIMALES COMISION
		if pos(ls_comision,".")=0 then
			ls_comision = ls_comision + "00"
		else
			li_posicion=pos(ls_comision,".")
			ls_decimales=	mid(ls_comision,pos(ls_comision,".")+1)
			ls_comision=mid(ls_comision,1,li_posicion - 1)
			if len(ls_decimales)<>2 then
				if len(ls_decimales) < 2 then
					ls_decimales = ls_decimales + "0"
				else
					ls_decimales = mid(ls_decimales,1,2)
				end if
			end if
			ls_comision = ls_comision + ls_decimales
		end if
		
		// Correcion nombres del sender y receiver
		ls_name_sender=fn_corregir_nombre(ls_name_sender)
		ls_name_receiver=fn_corregir_nombre(ls_name_receiver)
		
		// Separar nombre de apellido del sernder
		li_cadenas = fn_number_string(ls_name_sender)
		ls_apellido_sender = ""
		if li_cadenas=4 then
			li_posicion				=	pos(ls_name_sender," ")
			li_posicion				=	pos(ls_name_sender," ",li_posicion +1)
			ls_apellido_sender	=	mid(ls_name_sender,li_posicion + 1)
			ls_name_sender			=	mid(ls_name_sender,1,li_posicion - 1)
		else
			if li_cadenas = 3 or li_cadenas = 2 then
				li_posicion				=	pos(ls_name_sender," ")
				ls_apellido_sender	=	mid(ls_name_sender,li_posicion + 1)
				ls_name_sender			=	mid(ls_name_sender,1,li_posicion - 1)
			end if
		end if
		
		// separar nombre y apellidos del receiver
		li_cadenas = fn_number_string(ls_name_receiver)
		ls_apellido_receiver = ""
		if li_cadenas=4 then
			li_posicion					=	pos(ls_name_receiver," ")
			li_posicion					=	pos(ls_name_receiver," ",li_posicion +1)
			ls_apellido_receiver		=	mid(ls_name_receiver,li_posicion + 1)
			ls_name_receiver			=	mid(ls_name_receiver,1,li_posicion - 1)
		else
			if li_cadenas = 3 or li_cadenas = 2 then
				li_posicion				=	pos(ls_name_receiver," ")
				ls_apellido_receiver	=	mid(ls_name_receiver,li_posicion + 1)
				ls_name_receiver		=	mid(ls_name_receiver,1,li_posicion - 1)
			end if
		end if
		
		ls_cadena = fn_fill(mid(ls_referencia,1,12),"D"," ",12) 						+ 		&
						fn_fill(mid(ls_transferencia,1,12),"D"," ",12) 					+ 		&		
						fn_fill(mid(ls_autorizaccion,1,12),"D"," ",12)						+ 		&		
						fn_fill(mid(ls_moneda,1,2),"I","0",2) 	 							+ 		&		
						fn_fill(mid(ls_monto_r,1,10),"I","0",10)	 							+ 		&	
						fn_fill(mid(ls_costo_d,1,6),"I","0",6)	 							+ 		&		
						fn_fill(mid(ls_monto_p,1,10),"I","0",10) 	  						+ 		&	
						fn_fill(mid(ls_comision,1,10),"I","0",10) 	 						+ 		&	
						fn_fill(mid(ls_courier,1,4),"I","0",4) 	  							+ 		&	
						fn_fill(mid(ls_agencia_ecuagiros,1,3),"I","0",3) 			  		+ 		&	
						fn_fill(mid(ls_name_city_receiver,1,20),"D"," ",20)				+ 		&	
						fn_fill(mid(ls_name_sender,1,20),"D"," ",20)						+ 		&	
						fn_fill(mid(ls_apellido_sender,1,45),"D"," ",45)					+		&
						fn_fill(mid(ls_country_sender,1,3),"I","0",3)						+		&
						fn_fill(mid(ls_city_sender,1,3),"I","0",3)							+		&  
						fn_fill(mid(ls_phone_sender,1,30),"D"," ",30)						+		&
						fn_fill(mid(ls_name_receiver,1,20),"D"," ",20)						+		&
						fn_fill(mid(ls_apellido_receiver,1,45),"D"," ",45)				+		&
						fn_fill(mid(ls_phone_receiver,1,30),"D"," ",30)					+		&
						fn_fill(mid(ls_cedula_receiver,1,10),"I","0",10)					+		&
						fn_fill(mid(ls_country_receiver,1,3),"I","0",3)					+		&
						fn_fill(mid(ls_state_receiver_ecuagiros,1,3),"I","0",3)			+		&
						fn_fill(mid(ls_city_receiver_ecuagiros,1,3),"I","0",3)			+		&
						fn_fill(mid(ls_address_receiver,1,30),"D"," ",30)					+		&
						fn_fill(mid(ls_notes,1,60),"D"," ",60)								+		&
						fn_fill(mid(ls_tipo_cuenta,1,3),"D"," ",3)							+		&
						fn_fill(mid(ls_num_cuenta,1,10),"I","0",10)							+		&
						fn_fill(mid(ls_comentario,1,60),"D"," ",60)	
	
		Filewrite(ll_file,ls_cadena)
		
	NEXT
	
	Fileclose(ll_file)
	Fileclose(ll_file_c)
	Messagebox("Finish","Invoices to Ecuagiros : "+string(ll_row) )
end event

