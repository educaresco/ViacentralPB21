$PBExportHeader$w_commission_copy.srw
forward
global type w_commission_copy from w2_master_report_agency
end type
type cb_copy from commandbutton within w_commission_copy
end type
type st_2 from st_1 within w_commission_copy
end type
type lst_agencies_target from my_ddlb within w_commission_copy
end type
type sle_idbranch_target from singlelineedit within w_commission_copy
end type
type st_3 from st_1 within w_commission_copy
end type
type sle_idcountry from singlelineedit within w_commission_copy
end type
type lst_countries from my_ddlb within w_commission_copy
end type
type cbx_cleantarget from checkbox within w_commission_copy
end type
type sle_pagador from singlelineedit within w_commission_copy
end type
type st_pagador from st_1 within w_commission_copy
end type
type lst_pagador from my_ddlb within w_commission_copy
end type
type st_pagadordestino from st_1 within w_commission_copy
end type
type sle_pagadordestino from singlelineedit within w_commission_copy
end type
type lst_pagadordestino from my_ddlb within w_commission_copy
end type
type st_branch_desc from statictext within w_commission_copy
end type
type st_branch_target_desc from statictext within w_commission_copy
end type
end forward

global type w_commission_copy from w2_master_report_agency
integer width = 2898
integer height = 1188
boolean resizable = false
cb_copy cb_copy
st_2 st_2
lst_agencies_target lst_agencies_target
sle_idbranch_target sle_idbranch_target
st_3 st_3
sle_idcountry sle_idcountry
lst_countries lst_countries
cbx_cleantarget cbx_cleantarget
sle_pagador sle_pagador
st_pagador st_pagador
lst_pagador lst_pagador
st_pagadordestino st_pagadordestino
sle_pagadordestino sle_pagadordestino
lst_pagadordestino lst_pagadordestino
st_branch_desc st_branch_desc
st_branch_target_desc st_branch_target_desc
end type
global w_commission_copy w_commission_copy

type variables
String is_branch_id, is_group
end variables

forward prototypes
public subroutine fn_updatebranch (character p_updatedbranch)
public function boolean fn_valinput ()
public subroutine fn_updatelabels ()
end prototypes

public subroutine fn_updatebranch (character p_updatedbranch);
// S updates Source Branch Info
// T Updates Target Branch Info
// A Updates Both
// P Payer Source
// D Payer Target


return




	
	
	
//Long ll_cont
//String ls_id_branch, ls_id_country,ls_main_branch,ls_main_branch_target
//
//if p_updatedbranch = 'S' or p_updatedbranch = 'A' then
//	
//	st_branch_desc.text = ''
//	ls_id_country 				= sle_idcountry.text
//	ls_id_branch 				= sle_idbranch.text
//	
//	if ls_id_branch <> '' then
//	
//		SELECT count(*) 
//		  INTO :ll_cont
//		  FROM dba.COMISION
//		 WHERE ID_BRANCH = :ls_id_branch
//			AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
//				
//		st_branch_desc.text = string(ll_cont)+ ' Com. Country / '
//		
//		SELECT count(*) 
//		  INTO :ll_cont
//		  FROM dba.COMISION_AGENT_MODO_PAGO_GRUPO
//		 WHERE ID_BRANCH = :ls_id_branch
//			AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
//			
//		st_branch_desc.text = st_branch_desc.text + string(ll_cont)+ ' Com. Payer'
//	
//	end if
//
//end if
//
//if p_updatedbranch = 'T' or p_updatedbranch = 'A' then
//	
//	st_branch_target_desc.text = ''
//	ls_id_country = sle_idcountry.text
//	ls_id_branch = sle_idbranch_target.text
//	
//	if ls_id_branch <> '' then
//		
//		SELECT count(*) 
//		  INTO :ll_cont
//		  FROM dba.COMISION
//		 WHERE ID_BRANCH = :ls_id_branch
//			AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
//				
//		st_branch_target_desc.text = string(ll_cont)+ ' Com. Country / '
//		
//		SELECT count(*) 
//		  INTO :ll_cont
//		  FROM dba.COMISION_AGENT_MODO_PAGO_GRUPO
//		 WHERE ID_BRANCH = :ls_id_branch
//			AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
//			
//		st_branch_target_desc.text = st_branch_target_desc.text + string(ll_cont)+ ' Com. Payer'
//
//	end if
//	
//end if
//
//
//
//if  p_updatedbranch = 'A' then
//	
//	ls_id_country = sle_idcountry.text
//	
//	if ls_id_country = '-ALL-' then
//		sle_pagador.text = '-ALL-'
//		sle_pagador.enabled = false
//		lst_pagador.enabled = false
//		sle_pagadordestino.text = '-ALL-'
//		sle_pagadordestino.enabled = false
//		lst_pagadordestino.enabled = false
//		
//	else
//		sle_pagador.text = ''
//		sle_pagador.enabled = true
//		lst_pagador.enabled = true
//		sle_pagadordestino.text = ''
//		sle_pagadordestino.enabled = true
//		lst_pagadordestino.enabled = true		
//	end if
//	
//end if
//
//
//
//IF p_updatedbranch = 'P' THEN
//	
//	st_pagador_desc.text = ''
//	ls_id_country 	 = sle_idcountry.text
//	ls_id_branch 	 = sle_idbranch.text	
//	ls_main_branch = sle_pagador.text
//
//	
//	SELECT count(*) 
//	INTO :ll_cont
//	FROM dba.COMISION_AGENT_MODO_PAGO_GRUPO
//	WHERE ID_BRANCH = :ls_id_branch
//	AND (ID_MAIN_BRANCH = :ls_main_branch OR :ls_main_branch = '-ALL-')
//	AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
//
//	st_pagador_desc.text = st_pagador_desc.text + string(ll_cont)+ ' Com. Payer'
//	
//	if ls_main_branch = '-ALL-' then
//		sle_pagadordestino.text = '-ALL-'
//		sle_pagadordestino.enabled = false
//		lst_pagadordestino.enabled = false
//		
//	else
//		sle_pagadordestino.text = ''
//		sle_pagadordestino.enabled = true
//		lst_pagadordestino.enabled = true
//	end if
//	
//	
//	
//END IF
//
//
//IF  p_updatedbranch='D' THEN
//
//	st_pagador_target_desc.text = ''
//	ls_id_country 	= sle_idcountry.text
//	ls_id_branch 	 = sle_idbranch_target.text
//	ls_main_branch_target	= sle_pagadordestino.text
//	
//	SELECT count(*) 
//	INTO :ll_cont
//	FROM dba.COMISION_AGENT_MODO_PAGO_GRUPO
//	WHERE ID_BRANCH = :ls_id_branch
//	AND (ID_MAIN_BRANCH = :ls_main_branch OR :ls_main_branch = '-ALL-')
//	AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
//
//	st_pagador_target_desc.text = st_pagador_target_desc.text + string(ll_cont)+ ' Com. Payer'
//	
//END IF
//
//	
//	
end subroutine

public function boolean fn_valinput ();
// validates the input

String ls_id_branch, ls_id_branch_target, ls_id_main_branch, ls_id_main_branch_target, ls_id_country
Long ll_cont

ls_id_country 					= sle_idcountry.text
ls_id_branch 					= sle_idbranch.text
ls_id_branch_target 			= sle_idbranch_target.text
ls_id_main_branch 			= sle_pagador.text
ls_id_main_branch_target	= sle_pagadordestino.text

SetPointer(HourGlass!)
	
SELECT count(*)
INTO :ll_cont
FROM dba.branch
WHERE id_type_branch in ('A','R')
AND id_branch = :ls_id_branch;

if ll_cont = 0 then
	Messagebox("Error","La agencia de origen no existe.",StopSign!)
	return false
end if

SELECT count(*)
   INTO :ll_cont
  FROM dba.branch
WHERE id_type_branch in ('A','R')
     AND id_status_branch = 'O'
	AND id_branch = :ls_id_branch_target;

if ll_cont = 0 then
	Messagebox("Error","La agencia destino no existe o esta cerrada.",StopSign!)
	return false
end if


// Si no escoje pais, no debe escojer pagador!
if ls_id_country = '-ALL-' and ls_id_main_branch <> '-ALL-' then
	Messagebox("Error","Si se van a copiar las comisiones de todos los paises no puede especificar un pagador.",StopSign!)
	return false
end if


if ls_id_main_branch = '-ALL-' then
	if ls_id_main_branch_target <> '-ALL-' then
		Messagebox("Error","Si se van a copiar todos los pagadores del origen no deben especificar un pagador destino.",StopSign!)
		return false
	end if
else
	
	SELECT count(*)
        INTO :ll_cont
 	  FROM dba.group_branch 
	WHERE group_type in ('A','P') 
	     AND flag_grupo = 'A'
	     AND id_main_branch = :ls_id_main_branch;
	
	if ll_cont = 0 then
		Messagebox("Error","El pagador de origen no existe o esta cerrado.",StopSign!)
		return false
	end if


	SELECT count(*)
        INTO :ll_cont
 	  FROM dba.group_branch 
	WHERE group_type in ('A','P') 
	     AND flag_grupo = 'A'
	     AND id_main_branch = :ls_id_main_branch_target;
	
	if ll_cont = 0 then
		Messagebox("Error","El pagador de destino no existe o esta cerrado.",StopSign!)
		return false
	end if

	
end if

SetPointer(Arrow!)

return true


end function

public subroutine fn_updatelabels ();// Updates the labes with the number of existing commissions

Long ll_cont
String ls_id_branch, ls_id_branch_target,  ls_id_country,ls_main_branch,ls_main_branch_target

st_branch_desc.text = ''
st_branch_target_desc.text = ''

ls_id_country 				= sle_idcountry.text
ls_id_branch 				= trim( sle_idbranch.text)
ls_id_branch_target		= trim(sle_idbranch_target.text)
ls_main_branch			= sle_pagador.text
ls_main_branch_target	= sle_pagadordestino.text


if ls_id_branch <> '' then
	
	SELECT count(*) 
	INTO :ll_cont
	FROM dba.COMISION
	WHERE ID_BRANCH = :ls_id_branch
	AND (:ls_main_branch = '-ALL-')
	AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
			
	st_branch_desc.text = string(ll_cont)+ ' Com. Country / '
	
	SELECT count(*) 
	INTO :ll_cont
	FROM dba.COMISION_AGENT_MODO_PAGO_GRUPO
	WHERE ID_BRANCH = :ls_id_branch
	AND (ID_MAIN_BRANCH = :ls_main_branch OR :ls_main_branch = '-ALL-')
	AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
		
	st_branch_desc.text = st_branch_desc.text + string(ll_cont)+ ' Com. Payer'

end if
	
if ls_id_branch_target <> '' then
	
	SELECT count(*) 
	INTO :ll_cont
	FROM dba.COMISION
	WHERE ID_BRANCH = :ls_id_branch_target
	AND (:ls_main_branch_target = '-ALL-')
	AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
			
	st_branch_target_desc.text = string(ll_cont)+ ' Com. Country / '
	
	SELECT count(*) 
	INTO :ll_cont
	FROM dba.COMISION_AGENT_MODO_PAGO_GRUPO
	WHERE ID_BRANCH = :ls_id_branch_target
	AND (ID_MAIN_BRANCH = :ls_main_branch_target OR :ls_main_branch_target = '-ALL-')
	AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
		
	st_branch_target_desc.text = st_branch_target_desc.text + string(ll_cont)+ ' Com. Payer'

end if

end subroutine

on w_commission_copy.create
int iCurrent
call super::create
this.cb_copy=create cb_copy
this.st_2=create st_2
this.lst_agencies_target=create lst_agencies_target
this.sle_idbranch_target=create sle_idbranch_target
this.st_3=create st_3
this.sle_idcountry=create sle_idcountry
this.lst_countries=create lst_countries
this.cbx_cleantarget=create cbx_cleantarget
this.sle_pagador=create sle_pagador
this.st_pagador=create st_pagador
this.lst_pagador=create lst_pagador
this.st_pagadordestino=create st_pagadordestino
this.sle_pagadordestino=create sle_pagadordestino
this.lst_pagadordestino=create lst_pagadordestino
this.st_branch_desc=create st_branch_desc
this.st_branch_target_desc=create st_branch_target_desc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_copy
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.lst_agencies_target
this.Control[iCurrent+4]=this.sle_idbranch_target
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.sle_idcountry
this.Control[iCurrent+7]=this.lst_countries
this.Control[iCurrent+8]=this.cbx_cleantarget
this.Control[iCurrent+9]=this.sle_pagador
this.Control[iCurrent+10]=this.st_pagador
this.Control[iCurrent+11]=this.lst_pagador
this.Control[iCurrent+12]=this.st_pagadordestino
this.Control[iCurrent+13]=this.sle_pagadordestino
this.Control[iCurrent+14]=this.lst_pagadordestino
this.Control[iCurrent+15]=this.st_branch_desc
this.Control[iCurrent+16]=this.st_branch_target_desc
end on

on w_commission_copy.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_copy)
destroy(this.st_2)
destroy(this.lst_agencies_target)
destroy(this.sle_idbranch_target)
destroy(this.st_3)
destroy(this.sle_idcountry)
destroy(this.lst_countries)
destroy(this.cbx_cleantarget)
destroy(this.sle_pagador)
destroy(this.st_pagador)
destroy(this.lst_pagador)
destroy(this.st_pagadordestino)
destroy(this.sle_pagadordestino)
destroy(this.lst_pagadordestino)
destroy(this.st_branch_desc)
destroy(this.st_branch_target_desc)
end on

event open;call super::open;sle_idcountry.text = lst_countries.getdataid()

end event

type st_1 from w2_master_report_agency`st_1 within w_commission_copy
integer x = 119
integer y = 276
integer width = 411
string text = "Agencia Origen:"
end type

type sle_idbranch from w2_master_report_agency`sle_idbranch within w_commission_copy
integer x = 553
integer y = 260
integer taborder = 20
end type

event sle_idbranch::modified;call super::modified;lst_agencies.setselectedid( sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_agencies.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF


fn_updatelabels()


end event

type cb_query from w2_master_report_agency`cb_query within w_commission_copy
boolean visible = false
integer x = 1801
integer y = 152
integer taborder = 60
integer weight = 700
boolean enabled = false
boolean default = false
end type

type dw_1 from w2_master_report_agency`dw_1 within w_commission_copy
boolean visible = false
end type

type gb_1 from w2_master_report_agency`gb_1 within w_commission_copy
integer x = 32
integer y = 24
integer width = 2798
integer height = 952
string text = ""
end type

type lst_agencies from w2_master_report_agency`lst_agencies within w_commission_copy
integer x = 910
integer y = 260
integer taborder = 0
end type

event lst_agencies::constructor;this.addqueryad("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R')  and id_status_branch = 'O'  order by name_branch;")
end event

event lst_agencies::selectionchanged;sle_idbranch.text = lst_agencies.getdataid()

if sle_idbranch.text = '--' then sle_idbranch.text = ''	

fn_updatelabels()
end event

type cb_copy from commandbutton within w_commission_copy
integer x = 1230
integer y = 836
integer width = 686
integer height = 92
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Commissions"
end type

event clicked;
Long	ll_cont, ll_cont1, ll_cont2,ll_contpagador,ll_contpagdestino
String ls_id_country, ls_id_branch, ls_id_branch_target, ls_confirmation_msg,ls_id_main_branch,&
ls_id_main_branch_target
	
// Valida las entradas!
if not fn_valinput() then
	return
end if

ls_id_country 					= sle_idcountry.text
ls_id_branch 					= sle_idbranch.text
ls_id_branch_target 			= sle_idbranch_target.text
ls_id_main_branch 			= sle_pagador.text
ls_id_main_branch_target	= sle_pagadordestino.text

if Messagebox("Confirmacion","Esta seguro que desea copiar las comisiones de la agencia "+ls_id_branch+" a la agencia "+ls_id_branch_target+"?", Information!,YesNo!) > 1 then 
	return
end if


// Cuenta las comisiones que ya tiene
SELECT count(*) 
  INTO :ll_cont1
  FROM dba.COMISION
 WHERE ID_BRANCH = :ls_id_branch_target
     AND :ls_id_main_branch = '-ALL-'
	AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');		


SELECT count(*) 
  INTO :ll_cont2
  FROM dba.COMISION_AGENT_MODO_PAGO_GRUPO
 WHERE ID_BRANCH = :ls_id_branch_target
 	AND (ID_MAIN_BRANCH = :ls_id_main_branch_target OR :ls_id_main_branch_target = '-ALL-')
	AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
	
	
// Si existe comisiones en el target
if ll_cont1 > 0 or ll_cont2 > 0  then
	
	// Si marco la opcion de eliminar
	if cbx_cleantarget.checked then 
				
		ls_confirmation_msg = 'Esta seguro que desea eliminar las comisiones actuales de la agencia destino en el PAIS '+ls_id_country+' y PAGADOR '+ls_id_main_branch_target+' ?'

		if Messagebox("Confirmacion",ls_confirmation_msg, Exclamation!,YesNo!) > 1 then 
			return
		end if

		// Elimina las comisiones destino	
		DELETE
		  FROM dba.COMISION
		 WHERE ID_BRANCH = :ls_id_branch_target
			AND :ls_id_main_branch = '-ALL-'
			AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');
		
		If SQLCA.SQLCode <> 0 then Messagebox ("Error "+String(SQLCA.SQLCode),"Error ejecutando comando en la base de datos +~n~r"+SQLCA.SQLErrText)
		
		DELETE
		  FROM dba.COMISION_AGENT_MODO_PAGO_GRUPO
		 WHERE ID_BRANCH = :ls_id_branch_target
		     AND (ID_MAIN_BRANCH = :ls_id_main_branch_target OR :ls_id_main_branch_target = '-ALL-')
			AND (ID_COUNTRY = :ls_id_country OR :ls_id_country = '-ALL-');	

		If SQLCA.SQLCode <> 0 then Messagebox ("Error "+String(SQLCA.SQLCode),"Error ejecutando comando en la base de datos +~n~r"+SQLCA.SQLErrText)
		
	else
		
		Messagebox("Error","La agencia destino tiene comisiones en pais seleccionado, debe escoger la opcion 'Eliminar' para poder copiar las comisiones.",StopSign!)
		return
		
	end if
	
end if



if ls_id_country = '-ALL-'  then

	if ls_id_main_branch = '-ALL-' then
	
		// se copian todas las comisiones de la agencia (todos los paises y todos los pagadores)!
		DECLARE spCopyCommission PROCEDURE FOR dba.spCopyCommission 
		@id_branchsource = :ls_id_branch, 
		@id_branchtarget = :ls_id_branch_target	
		USING SQLCA;	
		
		EXECUTE spCopyCommission;
		
		If SQLCA.SQLCode <> 100 then Messagebox ("Error "+String(SQLCA.SQLCode),"Error ejecutando comando en la base de datos ~n~r"+SQLCA.SQLErrText)
	
	else
		
		// All countries - specific payer not developed, fn_valinput does not allow to get here!
		
	end if
	
else

	if ls_id_main_branch = '-ALL-' then

		// Se copian todos los pagadores de un pais
		DECLARE spCopyCommissionCountry PROCEDURE FOR dba.spCopyCommissionCountry 
		@id_branchsource = :ls_id_branch, 
		@id_branchtarget = :ls_id_branch_target, 
		@id_country = :ls_id_country		
		USING SQLCA;	
		
		EXECUTE spCopyCommissionCountry;
	
		If SQLCA.SQLCode <> 100 then Messagebox ("Error "+String(SQLCA.SQLCode),"Error ejecutando comando en la base de datos ~n~r"+SQLCA.SQLErrText)

	else


		// Se copian un solo pagador!
		DECLARE spCopyCommissionCountryPayer PROCEDURE FOR dba.spCopyCommissionCountryPayer 
		@id_branchsource = :ls_id_branch, 
		@id_branchtarget = :ls_id_branch_target, 
		@id_country = :ls_id_country,
		@id_payersource =:ls_id_main_branch,
		@id_payertarget=:ls_id_main_branch_target		
		USING SQLCA;	
		
		EXECUTE spCopyCommissionCountryPayer;
	
		If SQLCA.SQLCode <> 100 then Messagebox ("Error "+String(SQLCA.SQLCode),"Error ejecutando comando en la base de datos ~n~r"+SQLCA.SQLErrText)
		
				
	end if
	
	
end if

fn_updatelabels()

Messagebox ("Proceso Terminado","Proceso Terminado")

SetPointer(Arrow!)


end event

type st_2 from st_1 within w_commission_copy
integer y = 500
boolean bringtotop = true
string text = "Agencia Destino:"
end type

type lst_agencies_target from my_ddlb within w_commission_copy
integer x = 910
integer y = 484
integer width = 1010
integer height = 1504
integer taborder = 0
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;sle_idbranch_target.text = lst_agencies_target.getdataid()

if sle_idbranch_target.text = '--' then sle_idbranch_target.text = ''

fn_updatelabels()
end event

event constructor;call super::constructor;this.addqueryad("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R')  and id_status_branch = 'O' order by name_branch;")

end event

type sle_idbranch_target from singlelineedit within w_commission_copy
integer x = 549
integer y = 484
integer width = 343
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_agencies_target.setselectedid( sle_idbranch_target.text )

// Chequea que este en la lista
IF sle_idbranch_target.text <> lst_agencies_target.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF

fn_updatelabels()
end event

type st_3 from st_1 within w_commission_copy
integer y = 140
boolean bringtotop = true
string text = "Pais:"
end type

type sle_idcountry from singlelineedit within w_commission_copy
integer x = 553
integer y = 124
integer width = 343
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

event modified;lst_countries.setselectedid( sle_idcountry.text )

// Chequea que este en la lista
IF sle_idcountry.text <> lst_countries.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF

sle_pagador.text = '-ALL-'
lst_pagador.setselectedid(sle_pagador.text)
sle_pagadordestino.text = '-ALL-'
lst_pagadordestino.setselectedid(sle_pagadordestino.text)

if sle_idcountry.text = '-ALL-' then
	sle_pagador.enabled = false
	lst_pagador.enabled = false
	sle_pagadordestino.enabled = false
	lst_pagadordestino.enabled = false	
else
	sle_pagador.enabled = true
	lst_pagador.enabled = true
	sle_pagadordestino.enabled = true
	lst_pagadordestino.enabled = true		
end if

fn_updatelabels()

end event

type lst_countries from my_ddlb within w_commission_copy
integer x = 910
integer y = 124
integer width = 1010
integer height = 1504
integer taborder = 0
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addqueryall("SELECT iso_name, id_country FROM dba.country WHERE flag_country= 'A' order by name_country;")
end event

event selectionchanged;call super::selectionchanged;sle_idcountry.text = lst_countries.getdataid()

sle_pagador.text = '-ALL-'
lst_pagador.setselectedid(sle_pagador.text)
sle_pagadordestino.text = '-ALL-'
lst_pagadordestino.setselectedid(sle_pagadordestino.text)

if sle_idcountry.text = '-ALL-' then
	sle_pagador.enabled = false
	lst_pagador.enabled = false
	sle_pagadordestino.enabled = false
	lst_pagadordestino.enabled = false	
else
	sle_pagador.enabled = true
	lst_pagador.enabled = true
	sle_pagadordestino.enabled = true
	lst_pagadordestino.enabled = true		
end if


fn_updatelabels()

end event

type cbx_cleantarget from checkbox within w_commission_copy
integer x = 553
integer y = 712
integer width = 1353
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Eliminar Comisiones Existentes en la Agencia Destino"
end type

type sle_pagador from singlelineedit within w_commission_copy
integer x = 553
integer y = 352
integer width = 343
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "-ALL-"
textcase textcase = upper!
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

event modified;lst_pagador.setselectedid(sle_pagador.text)

// Chequea que este en la lista
IF sle_pagador.text <> lst_pagador.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF

sle_pagadordestino.text = '-ALL-'
lst_pagadordestino.setselectedid(sle_pagadordestino.text)

if sle_pagador.text  = '-ALL-' then
	sle_pagadordestino.enabled = false
	lst_pagadordestino.enabled = false	
else
	sle_pagadordestino.enabled = true
	lst_pagadordestino.enabled = true		
end if

fn_updatelabels()

end event

type st_pagador from st_1 within w_commission_copy
integer y = 368
boolean bringtotop = true
string text = "Pagador Origen:"
end type

type lst_pagador from my_ddlb within w_commission_copy
integer x = 910
integer y = 352
integer width = 1010
integer height = 1504
integer taborder = 0
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
end type

event constructor;call super::constructor;this.addqueryall("select name_main_branch, id_main_branch from dba.group_branch where group_type in ('A','P') and flag_grupo = 'A' order by 1;")
end event

event selectionchanged;call super::selectionchanged;sle_pagador.text = lst_pagador.getdataid()

if sle_pagador.text = '--' then sle_pagador.text = ''

sle_pagadordestino.text = '-ALL-'
lst_pagadordestino.setselectedid(sle_pagadordestino.text)

if sle_pagador.text  = '-ALL-' then
	sle_pagadordestino.enabled = false
	lst_pagadordestino.enabled = false	
else
	sle_pagadordestino.enabled = true
	lst_pagadordestino.enabled = true		
end if

fn_updatelabels()
end event

type st_pagadordestino from st_1 within w_commission_copy
integer y = 592
boolean bringtotop = true
string text = "Pagador Destino:"
end type

type sle_pagadordestino from singlelineedit within w_commission_copy
integer x = 553
integer y = 576
integer width = 343
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "-ALL-"
textcase textcase = upper!
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

event modified;lst_pagadordestino.setselectedid(sle_pagadordestino.text )

// Chequea que este en la lista
IF sle_pagadordestino.text <> lst_pagadordestino.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF

fn_updatelabels()
end event

type lst_pagadordestino from my_ddlb within w_commission_copy
integer x = 910
integer y = 576
integer width = 1010
integer height = 1504
integer taborder = 0
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
end type

event constructor;call super::constructor;this.addqueryall("select name_main_branch, id_main_branch from dba.group_branch where group_type in ('A','P') and flag_grupo = 'A' order by 1;")
end event

event selectionchanged;call super::selectionchanged;sle_pagadordestino.text = lst_pagadordestino.getdataid()

if sle_pagadordestino.text = '--' then sle_pagadordestino.text = ''

fn_updatelabels()
end event

type st_branch_desc from statictext within w_commission_copy
integer x = 1929
integer y = 260
integer width = 795
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_branch_target_desc from statictext within w_commission_copy
integer x = 1929
integer y = 484
integer width = 795
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean focusrectangle = false
end type

