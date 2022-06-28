$PBExportHeader$w_busca_branch_nacional_unificada.srw
forward
global type w_busca_branch_nacional_unificada from window
end type
type lst_filterpayer from my_ddlb within w_busca_branch_nacional_unificada
end type
type st_1 from statictext within w_busca_branch_nacional_unificada
end type
type cb_salir from commandbutton within w_busca_branch_nacional_unificada
end type
type cb_select from commandbutton within w_busca_branch_nacional_unificada
end type
type dw_2 from datawindow within w_busca_branch_nacional_unificada
end type
end forward

global type w_busca_branch_nacional_unificada from window
integer x = 256
integer y = 500
integer width = 3369
integer height = 1852
boolean titlebar = true
string title = "Payers in National Currency"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
event ue_postopen ( )
lst_filterpayer lst_filterpayer
st_1 st_1
cb_salir cb_salir
cb_select cb_select
dw_2 dw_2
end type
global w_busca_branch_nacional_unificada w_busca_branch_nacional_unificada

type variables
string	is_name
end variables

event ue_postopen();string ls_grupo, ls_use_cubrimiento = '' , ls_agente
long	ll_cont, i

//DON (03/12/2015) Added w_please_wait screen, moved code from Open event,
Open(w_please_wait)

SELECT dba.modo_pago.use_cubrimiento  
 INTO :ls_use_cubrimiento  
 FROM dba.modo_pago  
WHERE dba.modo_pago.id_modo_pago = :gs_mod_pay;

if trim(ls_use_cubrimiento) = 'N'  then
	dw_2.dataobject = 'dw_pagadora_nacional_unificada_sin_cubri'
	dw_2.settransobject(sqlca)
	if dw_2.retrieve(gs_mod_pay,gs_country_receiver,gs_branch_insta) = 0 then
		dw_2.SetRow(1)
		dw_2.SelectRow(0,FALSE)
		dw_2.SelectRow(1,TRUE)
		dw_2.Setfocus()
		
		//////////   Verificar si es por el modo de pago que no hay agencias
		
		//DON (03/10/2015) - Made performance changes.  **************
//		SELECT DISTINCT Count(*)  
//		INTO :ll_cont  
//		FROM dba.branch,   
//			dba.cubrimiento_branch,   
//			dba.modo_pago_branch  
//		WHERE ( dba.cubrimiento_branch.id_branch = dba.branch.id_branch ) and  
//				( dba.modo_pago_branch.id_branch   = dba.branch.id_branch   ) and
//				( currency_pay_branch in ('N','A')               ) and
//				( ( dba.branch.id_flag_branch = 'A' ) AND  
//				( dba.branch.id_type_branch in ('A','P') ) AND  
//				( dba.branch.id_city = :gs_city_receiver ) );		

		SELECT DISTINCT Count(*)  
			INTO :ll_cont  
		FROM dba.branch WITH (NOLOCK)
		INNER JOIN dba.cubrimiento_branch	WITH (NOLOCK)
		ON 	dba.cubrimiento_branch.id_branch = dba.branch.id_branch  
		JOIN dba.modo_pago_branch	WITH (NOLOCK)
		ON		dba.modo_pago_branch.id_branch   = dba.branch.id_branch 
		WHERE ( currency_pay_branch in ('D','A')               ) and
				( ( dba.branch.id_flag_branch = 'A' ) AND  
				( dba.branch.id_type_branch in ('A','P') ) AND  
				( dba.branch.id_city = :gs_city_receiver ) )   ;
		//****  END OF PERFORMANCE CHANGES  *************************************************
		
		if ll_cont = 0 then
			messagebox('Warning','The currency you selected is not available, please try the other Currency - Seleccione otro Currency')
			Close(This)
			return
		end if
	
		MessageBox('Atention',"There isn't any payer agency where you need it.",Exclamation!)
		Close(This)
		return
	else
		//DON (03/10/2015) - Made performance changes.  **************
//		lst_filterpayer.addqueryall("SELECT distinct isnull(dba.branch.payer_caption,name_main_branch), isnull(dba.branch.payer_caption,name_main_branch)"  & 
//											+ "         FROM dba.branch, dba.branch as agent, dba.modo_pago_branch, dba.group_branch  " &
//											+ "   		WHERE dba.modo_pago_branch.id_branch = dba.branch.id_branch"  &
//											+ "		     AND dba.group_branch.id_main_branch = dba.branch.id_main_branch"  &
//											+ "		     AND dba.branch.id_flag_branch = 'A'" &
//											+ "			  AND agent.id_branch = '"+gs_branch_insta+"'" &
//											+ "		     AND dba.modo_pago_branch.modo_pago = '"+gs_mod_pay+"'" &
//											+ "		     AND dba.branch.id_country = '"+gs_country_receiver+"'" &
//											+ "		     AND dba.branch.currency_pay_branch IN ('A','N') " &
//											+ "			  AND dba.branch.id_type_branch IN ('P','A') " &
//											+ "		ORDER BY isnull(dba.branch.payer_caption,name_main_branch) ASC")
		
		lst_filterpayer.addqueryall("SELECT distinct isnull(dba.branch.payer_caption,name_main_branch), isnull(dba.branch.payer_caption,name_main_branch)" &
											+"		FROM dba.branch WITH (NOLOCK)" &
											+"		INNER JOIN	dba.modo_pago_branch  WITH (NOLOCK)" &
											+"		ON		dba.modo_pago_branch.id_branch = dba.branch.id_branch" &
											+"		JOIN	dba.group_branch  WITH (NOLOCK)" &
											+"		ON		dba.group_branch.id_main_branch = dba.branch.id_main_branch" &
											+"		JOIN	dba.branch as agent" &
											+"		ON		agent.id_branch = '" +gs_branch_insta+"'" &
											+"		WHERE   dba.branch.id_flag_branch = 'A'" &
											+"		AND dba.modo_pago_branch.modo_pago = '"+gs_mod_pay+"'" &
											+"		AND dba.branch.id_country =	'"+gs_country_receiver+"'" &
											+"		AND dba.branch.currency_pay_branch IN ('A','N')" &
											+"		AND dba.branch.id_type_branch IN ('P','A') " &
											+"		ORDER BY isnull(dba.branch.payer_caption,name_main_branch) ASC")
		//****  END OF PERFORMANCE CHANGES  *************************************************
		
		dw_2.SetRow(1)
		dw_2.SelectRow(0,FALSE)
		dw_2.SelectRow(1,TRUE)
		dw_2.setfocus()
	end if

else
	dw_2.dataobject = 'dw_pagadora_nacional_unificada'
	dw_2.settransobject(sqlca)
	
	if dw_2.retrieve(gs_mod_pay,gs_city_receiver,gs_branch_insta) = 0 then
		dw_2.SetRow(1)
		dw_2.SelectRow(0,FALSE)
		dw_2.SelectRow(1,TRUE)
		
		//////////   Verificar si es por el modo de pago que no hay agencias
	
		//DON (03/10/2015) - Made performance changes.  **************
//		SELECT DISTINCT Count(*)  
//		INTO :ll_cont  
//		FROM dba.branch,   
//			  dba.cubrimiento_branch,   
//			  dba.modo_pago_branch  
//		WHERE ( dba.cubrimiento_branch.id_branch = dba.branch.id_branch ) and  
//				( dba.modo_pago_branch.id_branch   = dba.branch.id_branch   ) and
//				( currency_pay_branch in ('N','A')               ) and
//				( ( dba.branch.id_flag_branch = 'A' ) AND  
//				( dba.branch.id_type_branch in ('A','P') ) AND  
//				( dba.branch.id_city = :gs_city_receiver ) )   ;

		SELECT DISTINCT Count(*)  
			INTO :ll_cont  
		FROM dba.branch WITH (NOLOCK)
		INNER JOIN dba.cubrimiento_branch	WITH (NOLOCK)
		ON 	dba.cubrimiento_branch.id_branch = dba.branch.id_branch  
		JOIN dba.modo_pago_branch	WITH (NOLOCK)
		ON		dba.modo_pago_branch.id_branch   = dba.branch.id_branch 
		WHERE ( currency_pay_branch in ('D','A')               ) and
				( ( dba.branch.id_flag_branch = 'A' ) AND  
				( dba.branch.id_type_branch in ('A','P') ) AND  
				( dba.branch.id_city = :gs_city_receiver ) )   ;
		//******  END OF PERFORMANCE CHANGES  *********************
		
		if ll_cont = 0 then
			messagebox('Warning','The currency you selected is not available, please try the other Currency - Seleccione otro Currency')
			Close(w_please_wait)
			Close(This)
			return
		else
			messagebox('Warning','The Delivery you selected is not available, please try the another Delivery - Seleccione otro Delivery')
			Close(w_please_wait)
			Close(This)
			return
		end if
		
		//st_1.text = "No existe en nuestra base de datos una agencia pagadora que cumpla con el Invoice..."
		MessageBox('Atention',"There isn't any payer agency where you need it.",Exclamation!)
		Close(w_please_wait)
		Close(This)
		return
	else
		dw_2.SetRow(1)
		dw_2.SelectRow(0,FALSE)
		dw_2.SelectRow(1,TRUE)
		dw_2.Setfocus()
			
	end if
end if
 
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Muestra seleccionado el que esta en la pantalla pfc_sender
if gs_pagador_ultimo <> '' then
	FOR i = 1 TO dw_2.rowcount()
		ls_agente = dw_2.getitemstring(i,"id_branch")
		if gs_pagador_ultimo = ls_agente then			
			dw_2.scrolltorow(i)	
			dw_2.SetRow(i)			
			dw_2.SelectRow(0,FALSE)
			dw_2.SelectRow(i,TRUE)			
			dw_2.setfocus()
			CONTINUE
		end if	
	NEXT
end if		
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Close(w_please_wait)

end event

event open;
//DON (03/12/2015) - Moved code to ue_postopen event.  ***********************
This.PostEvent("ue_postopen")
//***************************************************************

//string ls_grupo, ls_use_cubrimiento = '' , ls_agente
//long	ll_cont, i
//
//SELECT dba.modo_pago.use_cubrimiento  
// INTO :ls_use_cubrimiento  
// FROM dba.modo_pago  
//WHERE dba.modo_pago.id_modo_pago = :gs_mod_pay;
//
//if trim(ls_use_cubrimiento) = 'N'  then
//	dw_2.dataobject = 'dw_pagadora_nacional_unificada_sin_cubri'
//	dw_2.settransobject(sqlca)
//	if dw_2.retrieve(gs_mod_pay,gs_country_receiver,gs_branch_insta) = 0 then
//		dw_2.SetRow(1)
//		dw_2.SelectRow(0,FALSE)
//		dw_2.SelectRow(1,TRUE)
//		dw_2.Setfocus()
//		
//		//////////   Verificar si es por el modo de pago que no hay agencias
//		
//		//DON (03/10/2015) - Made performance changes.  **************
////		SELECT DISTINCT Count(*)  
////		INTO :ll_cont  
////		FROM dba.branch,   
////			dba.cubrimiento_branch,   
////			dba.modo_pago_branch  
////		WHERE ( dba.cubrimiento_branch.id_branch = dba.branch.id_branch ) and  
////				( dba.modo_pago_branch.id_branch   = dba.branch.id_branch   ) and
////				( currency_pay_branch in ('N','A')               ) and
////				( ( dba.branch.id_flag_branch = 'A' ) AND  
////				( dba.branch.id_type_branch in ('A','P') ) AND  
////				( dba.branch.id_city = :gs_city_receiver ) );		
//
//		SELECT DISTINCT Count(*)  
//			INTO :ll_cont  
//		FROM dba.branch WITH (NOLOCK)
//		LEFT JOIN dba.cubrimiento_branch
//		ON 	dba.cubrimiento_branch.id_branch = dba.branch.id_branch  
//		JOIN dba.modo_pago_branch
//		ON		dba.modo_pago_branch.id_branch   = dba.branch.id_branch 
//		WHERE ( currency_pay_branch in ('D','A')               ) and
//				( ( dba.branch.id_flag_branch = 'A' ) AND  
//				( dba.branch.id_type_branch in ('A','P') ) AND  
//				( dba.branch.id_city = :gs_city_receiver ) )   ;
//		//*****************************************************
//		
//		if ll_cont = 0 then
//			messagebox('Warning','The currency you selected is not available, please try the other Currency - Seleccione otro Currency')
//			Close(This)
//			return
//		end if
//	
//		MessageBox('Atention',"There isn't any payer agency where you need it.",Exclamation!)
//		Close(This)
//		return
//	else
//		
//		lst_filterpayer.addqueryall("SELECT distinct isnull(dba.branch.payer_caption,name_main_branch), isnull(dba.branch.payer_caption,name_main_branch)"  & 
//											+ "         FROM dba.branch, dba.branch as agent, dba.modo_pago_branch, dba.group_branch  " &
//											+ "   		WHERE dba.modo_pago_branch.id_branch = dba.branch.id_branch"  &
//											+ "		     AND dba.group_branch.id_main_branch = dba.branch.id_main_branch"  &
//											+ "		     AND dba.branch.id_flag_branch = 'A'" &
//											+ "			  AND agent.id_branch = '"+gs_branch_insta+"'" &
//											+ "		     AND dba.modo_pago_branch.modo_pago = '"+gs_mod_pay+"'" &
//											+ "		     AND dba.branch.id_country = '"+gs_country_receiver+"'" &
//											+ "		     AND dba.branch.currency_pay_branch IN ('A','N') " &
//											+ "			  AND dba.branch.id_type_branch IN ('P','A') " &
//											+ "		ORDER BY isnull(dba.branch.payer_caption,name_main_branch) ASC")
//		
//		dw_2.SetRow(1)
//		dw_2.SelectRow(0,FALSE)
//		dw_2.SelectRow(1,TRUE)
//		dw_2.setfocus()
//	end if
//
//else
//	dw_2.dataobject = 'dw_pagadora_nacional_unificada'
//	dw_2.settransobject(sqlca)
//	
//	if dw_2.retrieve(gs_mod_pay,gs_city_receiver,gs_branch_insta) = 0 then
//		dw_2.SetRow(1)
//		dw_2.SelectRow(0,FALSE)
//		dw_2.SelectRow(1,TRUE)
//		
//		//////////   Verificar si es por el modo de pago que no hay agencias
//	
//		//DON (03/10/2015) - Made performance changes.  **************
////		SELECT DISTINCT Count(*)  
////		INTO :ll_cont  
////		FROM dba.branch,   
////			  dba.cubrimiento_branch,   
////			  dba.modo_pago_branch  
////		WHERE ( dba.cubrimiento_branch.id_branch = dba.branch.id_branch ) and  
////				( dba.modo_pago_branch.id_branch   = dba.branch.id_branch   ) and
////				( currency_pay_branch in ('N','A')               ) and
////				( ( dba.branch.id_flag_branch = 'A' ) AND  
////				( dba.branch.id_type_branch in ('A','P') ) AND  
////				( dba.branch.id_city = :gs_city_receiver ) )   ;
//
//		SELECT DISTINCT Count(*)  
//			INTO :ll_cont  
//		FROM dba.branch WITH (NOLOCK)
//		LEFT JOIN dba.cubrimiento_branch
//		ON 	dba.cubrimiento_branch.id_branch = dba.branch.id_branch  
//		JOIN dba.modo_pago_branch
//		ON		dba.modo_pago_branch.id_branch   = dba.branch.id_branch 
//		WHERE ( currency_pay_branch in ('D','A')               ) and
//				( ( dba.branch.id_flag_branch = 'A' ) AND  
//				( dba.branch.id_type_branch in ('A','P') ) AND  
//				( dba.branch.id_city = :gs_city_receiver ) )   ;
//		//*****************************************************
//		
//		if ll_cont = 0 then
//			messagebox('Warning','The currency you selected is not available, please try the other Currency - Seleccione otro Currency')
//			Close(This)
//			return
//		else
//			messagebox('Warning','The Delivery you selected is not available, please try the another Delivery - Seleccione otro Delivery')
//			Close(This)
//			return
//		end if
//		
//		//st_1.text = "No existe en nuestra base de datos una agencia pagadora que cumpla con el Invoice..."
//		MessageBox('Atention',"There isn't any payer agency where you need it.",Exclamation!)
//		Close(This)
//		return
//	else
//		dw_2.SetRow(1)
//		dw_2.SelectRow(0,FALSE)
//		dw_2.SelectRow(1,TRUE)
//		dw_2.Setfocus()
//			
//	end if
//end if
// 
//// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Muestra seleccionado el que esta en la pantalla pfc_sender
//if gs_pagador_ultimo <> '' then
//	FOR i = 1 TO dw_2.rowcount()
//		ls_agente = dw_2.getitemstring(i,"id_branch")
//		if gs_pagador_ultimo = ls_agente then			
//			dw_2.scrolltorow(i)	
//			dw_2.SetRow(i)			
//			dw_2.SelectRow(0,FALSE)
//			dw_2.SelectRow(i,TRUE)			
//			dw_2.setfocus()
//			CONTINUE
//		end if	
//	NEXT
//end if		
//// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
end event

on w_busca_branch_nacional_unificada.create
this.lst_filterpayer=create lst_filterpayer
this.st_1=create st_1
this.cb_salir=create cb_salir
this.cb_select=create cb_select
this.dw_2=create dw_2
this.Control[]={this.lst_filterpayer,&
this.st_1,&
this.cb_salir,&
this.cb_select,&
this.dw_2}
end on

on w_busca_branch_nacional_unificada.destroy
destroy(this.lst_filterpayer)
destroy(this.st_1)
destroy(this.cb_salir)
destroy(this.cb_select)
destroy(this.dw_2)
end on

event key;//
//IF KeyDown(KeyEnter!) then
//	cb_select.triggerevent(clicked!)
//End If
//
end event

type lst_filterpayer from my_ddlb within w_busca_branch_nacional_unificada
integer x = 325
integer y = 8
integer width = 1381
integer height = 1068
integer taborder = 10
boolean enabled = false
end type

event selectionchanged;call super::selectionchanged;
// Aun hay qu revisar el sort despues de filtrar y volver a ALL

dw_2.setfilter('')
dw_2.filter()
dw_2.sort()


if this.getdatavalue() <> '[ALL]' then
	dw_2.setfilter("payername = '"+this.getdatavalue()+"'")
	dw_2.filter()
end if


end event

type st_1 from statictext within w_busca_branch_nacional_unificada
integer x = 14
integer y = 24
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Filter Payer:"
boolean focusrectangle = false
end type

type cb_salir from commandbutton within w_busca_branch_nacional_unificada
integer x = 1669
integer y = 1648
integer width = 389
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
boolean cancel = true
end type

event clicked;
	closewithreturn(w_busca_branch_nacional_unificada,'')
end event

type cb_select from commandbutton within w_busca_branch_nacional_unificada
integer x = 1243
integer y = 1648
integer width = 389
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Select"
boolean default = true
end type

event clicked;long		ll_row
double	ld_sender
string	ls_branch

ll_row = dw_2.GetRow()

if ll_row = 0 then
	dw_2.SelectRow(0, FALSE)
	return

end if


ls_branch = dw_2.getitemstring(ll_row,"id_branch")

if ll_row <> 0 then
	closewithreturn(w_busca_branch_nacional_unificada,ls_branch)
	
end if
end event

type dw_2 from datawindow within w_busca_branch_nacional_unificada
integer x = 5
integer y = 112
integer width = 3328
integer height = 1512
integer taborder = 10
string dataobject = "dw_pagadora_nacional_unificada_sin_cubri"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_grupo
long		ll_row = 0

if dw_2.GetClickedRow ( ) = 1 then
	dw_2.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	ll_row = 1
//	return
elseif dw_2.GetClickedRow ( ) = 0 then
	dw_2.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
	ll_row = row
end if

///////////////////////////////////



end event

event rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, TRUE)
SetRow(currentrow)

string	ls_grupo
long		ll_row = 0

if currentrow = 0 then
	dw_2.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	ll_row = 1
end if	



end event

event doubleclicked;cb_select.triggerevent(clicked!)
end event

