$PBExportHeader$w_parametros_rep_tasas.srw
$PBExportComments$bank_transactions
forward
global type w_parametros_rep_tasas from wb_single_tb
end type
end forward

global type w_parametros_rep_tasas from wb_single_tb
integer x = 0
integer y = 0
integer width = 3515
integer height = 1212
string title = "Parámetros Reporte Tasas"
end type
global w_parametros_rep_tasas w_parametros_rep_tasas

on w_parametros_rep_tasas.create
call super::create
end on

on w_parametros_rep_tasas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;

dw_1.setrowfocusindicator( off!)


IF dw_1.Retrieve()=0 THEN
	dw_1.InsertRow(0)
end if
end event

type dw_1 from wb_single_tb`dw_1 within w_parametros_rep_tasas
integer x = 14
integer y = 8
integer width = 3433
integer height = 1004
string dataobject = "dff_rates_parms"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::pfc_preupdate;////DRT==>2008-Jun-9
//
//Long 		ll_fila
//String	ls_id_banco
//
//ls_id_banco= ddlb_bancos.getdataid( )
//ll_fila= This.GetNextModified( 0, Primary!)
//
//do while ll_fila >0
//	IF IsNull(GetItemString(ll_fila, "id_banco")) THEN
//		SetItem(ll_fila, "id_banco", ls_id_banco )
//	END IF
//	ll_fila= This.GetNextModified(ll_fila, Primary!)
//loop
//
Return Success
end event

event dw_1::pfc_insertrow;//Ancestro sobrescrito
return success
end event

event dw_1::clicked;call super::clicked;string s_country, s_pagador, s_parameter

if dwo.name = 'b_country' then
	
	 open(w_seleccionar_multiple_country)
	 
	 s_country = Message.StringParm
	 
	 dw_1.setitem(row,'paises_principales',s_country)
	
end if

if dwo.name = 'b_country_2' then
	
	open(w_seleccionar_multiple_country)
	 
	 s_country = Message.StringParm
	 
	 dw_1.setitem(row,'paises_secundarios',s_country)
	 
end if

if dwo.name = 'b_main_branches' then
	
	s_parameter = '('+ dw_1.getitemstring(row,'paises_principales')+')'
	

	
	openwithparm(w_select_payer_group,s_parameter )
	
	s_pagador = Message.StringParm
	
	dw_1.setitem(row,'id_main_branches',s_pagador)
	
end if
end event

