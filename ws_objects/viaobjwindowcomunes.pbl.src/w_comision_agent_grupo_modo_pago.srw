$PBExportHeader$w_comision_agent_grupo_modo_pago.srw
forward
global type w_comision_agent_grupo_modo_pago from wb_single_tb
end type
type cb_query from commandbutton within w_comision_agent_grupo_modo_pago
end type
type sle_idbranch from singlelineedit within w_comision_agent_grupo_modo_pago
end type
type lst_branch from my_ddlb within w_comision_agent_grupo_modo_pago
end type
type sle_idpayer from singlelineedit within w_comision_agent_grupo_modo_pago
end type
type lst_payer from my_ddlb within w_comision_agent_grupo_modo_pago
end type
type sle_idcountry from singlelineedit within w_comision_agent_grupo_modo_pago
end type
type lst_country from my_ddlb within w_comision_agent_grupo_modo_pago
end type
type st_3 from statictext within w_comision_agent_grupo_modo_pago
end type
type st_4 from statictext within w_comision_agent_grupo_modo_pago
end type
type st_5 from statictext within w_comision_agent_grupo_modo_pago
end type
type gb_2 from groupbox within w_comision_agent_grupo_modo_pago
end type
end forward

global type w_comision_agent_grupo_modo_pago from wb_single_tb
integer x = 214
integer y = 221
integer width = 4672
integer height = 2000
string title = "Agency and Payer Exception Commission (Agency/Country/Pay Mode/Payer)"
cb_query cb_query
sle_idbranch sle_idbranch
lst_branch lst_branch
sle_idpayer sle_idpayer
lst_payer lst_payer
sle_idcountry sle_idcountry
lst_country lst_country
st_3 st_3
st_4 st_4
st_5 st_5
gb_2 gb_2
end type
global w_comision_agent_grupo_modo_pago w_comision_agent_grupo_modo_pago

on w_comision_agent_grupo_modo_pago.create
int iCurrent
call super::create
this.cb_query=create cb_query
this.sle_idbranch=create sle_idbranch
this.lst_branch=create lst_branch
this.sle_idpayer=create sle_idpayer
this.lst_payer=create lst_payer
this.sle_idcountry=create sle_idcountry
this.lst_country=create lst_country
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_query
this.Control[iCurrent+2]=this.sle_idbranch
this.Control[iCurrent+3]=this.lst_branch
this.Control[iCurrent+4]=this.sle_idpayer
this.Control[iCurrent+5]=this.lst_payer
this.Control[iCurrent+6]=this.sle_idcountry
this.Control[iCurrent+7]=this.lst_country
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.gb_2
end on

on w_comision_agent_grupo_modo_pago.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_query)
destroy(this.sle_idbranch)
destroy(this.lst_branch)
destroy(this.sle_idpayer)
destroy(this.lst_payer)
destroy(this.sle_idcountry)
destroy(this.lst_country)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.gb_2)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision_agent_grupo_modo_pago
integer y = 344
integer width = 4603
integer height = 1448
integer taborder = 40
string dataobject = "dw_comision_agent_grupo_modo_pago"
end type

event dw_1::itemchanged;call super::itemchanged;///**********************************************************************
// PARA LA DATAWINDOWS    dw_1
// DESCRIPCION: Se realzia la validacion para que ingrese solo codigos de
// agencia existentes
// AUTOR: jcmontoya
//**********************************************************************/
//long l_fila
//String s_campo,ls_nombreAgencia,ls_valorAgencia,ls_valorPagador,ls_nombrePagador
//
//l_fila 				= dw_1.GetRow()
//s_campo		= UPPER(dw_1.GetText())
//
//	
//	dw_1.AcceptText()
//	CHOOSE CASE dwo.name
//		CASE "id_branch_1"
//				ls_valorAgencia = dw_1.object.id_branch_1[l_fila]
//				
//				SELECT NAME_BRANCH
//				INTO :ls_nombreAgencia
//				FROM DBA.BRANCH  
//				WHERE ID_BRANCH=:ls_valorAgencia
//				USING SQLCA;
//				
//				IF IsNull(ls_nombreAgencia) OR LEN(TRIM(ls_nombreAgencia))=0 OR ls_nombreAgencia ="" THEN
//					dw_1.object.id_branch[l_fila] = "";
//					MessageBox("Advertencia","No existe el código de agencia: "+ls_valorAgencia)
//
//					RETURN 1 
//				END IF
//				
//				
//		CASE "id_main_branch_1"
//			ls_valorPagador = dw_1.object.id_main_branch_1[l_fila]
//			
//			SELECT NAME_MAIN_BRANCH
//			INTO :ls_nombrePagador
//			FROM DBA.GROUP_BRANCH  
//			WHERE ID_MAIN_BRANCH=:ls_valorPagador
//			USING SQLCA;
//			
//			IF IsNull(ls_nombrePagador) OR LEN(TRIM(ls_nombrePagador))=0 OR ls_nombrePagador ="" THEN
//				dw_1.object.id_main_branch[l_fila] = "";
//				MessageBox("Advertencia","No existe el código del pagador: "+ls_valorPagador)
//				RETURN 1
//			END IF
//
//	END CHOOSE	


/**********************************************************************
 PARA LA DATAWINDOWS    dw_1
 DESCRIPCION: Se realzia la validacion para que ingrese solo codigos de
 agencia existentes
**********************************************************************/

String  	ls_branch
Long	 	ll_count
double 	ll_comision, ll_comision_company, ll_range

	
	//dw_1.AcceptText()
	
	CHOOSE CASE dwo.name
		CASE "id_branch_1"
				
				ls_branch = data
				
				SELECT count(*)
				INTO :ll_count
				FROM DBA.BRANCH  
				WHERE ID_BRANCH=:ls_branch;
				
				if ll_count <1 then
					MessageBox("Error","No existe el código de agencia: "+ls_branch,StopSign!)
					return 1
				end if
		
		CASE "id_main_branch_1"
				
				ls_branch = data
				
				SELECT count(*)
				INTO :ll_count
				FROM DBA.GROUP_BRANCH  
				WHERE ID_MAIN_BRANCH=:ls_branch;
				
				if ll_count <1 then
					MessageBox("Error","No existe el código de pagador: "+ls_branch,StopSign!)
					return 1
				end if
				
		CASE "porcent_comision_agente"
				ll_comision = double(data)
				ll_comision_company = double(dw_1.object.porcent_comision_comp[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","Porcentaje de Comision del Cliente no puede ser menor que el Porcentaje de Viamericas.",StopSign!)
					return 1
				end if
				
				if ll_comision > 0.2 then
					MessageBox("Error","Porcentaje de Comision no puede ser mayor a 20%.",StopSign!)
					return 1
				end if
				
		CASE "porcent_comision_comp"
				ll_comision_company = double(data)
				ll_comision = double(dw_1.object.porcent_comision_agente[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","Porcentaje de Comision de Viamericas no puede ser Mayor al Porcentaje del Cliente.",StopSign!)
					return 1
				end if

		CASE "feet_comision_agente"
				ll_comision = double(data)
				ll_comision_company =  double(dw_1.object.feet_comision_comp[row])
				ll_range = double(dw_1.object.range_end_comision_pay[row])
					
				if ll_comision < ll_comision_company then
					MessageBox("Error","La Comision del Cliente no puede ser menor que la Comision de Viamericas.",StopSign!)
					return 1
				end if
				
				if ll_comision >= ll_range then
					MessageBox("Error","La Comision del cliente no puede ser mayor al rango.",StopSign!)
					return 1
				end if
				
		CASE "feet_comision_comp"
				ll_comision_company = double(data)
				ll_comision = double(dw_1.object.feet_comision_agente[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","La Comision de Viamericas no puede ser Mayor a la Comision del Cliente.",StopSign!)
					return 1
				end if
						
						
						
	END CHOOSE	

end event

event dw_1::itemerror;call super::itemerror;/* Esta instruccion no permite que el error del sistema sea mostrado */


RETURN 1



end event

event dw_1::constructor;SetTransObject(SQLCA)
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Event:
//////	constructor
//////
//////	Description:
//////	Start the resize service and register the controls.
////// Tab page three will be created on demand.  If the user resizes
////// the window before the tab page is created then the resize event
////// must be triggered.
//////
//////////////////////////////////////////////////////////////////////////////////
//////	
//////	Revision History
//////
//////	Version
//////	6.0   Initial version
//////
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//////	Any distribution of the PowerBuilder Foundation Classes (PFC)
//////	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////
//////////////////////////////////////////////////////////////////////////////////
////
////// Start the Resize Service.
//
datawindow	ddlb_filetypes

////DON (04/02/2015) - To suppress Retrieve.  ***********************
//IF gb_prevent_rate_retrieve	THEN
//	gb_prevent_rate_retrieve	=	FALSE
//ELSE
//	this.retrieve()
//END IF
////******************************************************

of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)
//
////Set the MinSize of the main object.
inv_resize.of_SetMinSize(1185, 509)
//
////Set the behavior of each object.
//inv_resize.of_Register(ddlb_filetypes, inv_resize.SCALERIGHTBOTTOM)
//inv_resize.of_Register(sle_text, inv_resize.SCALERIGHT)
//
//ddlb_filetypes.SelectItem(2)
//
////Trigger the resize event to be sure that the tab is sized appropriately.
event resize(1, this.width, this.height)
//






end event

type cb_query from commandbutton within w_comision_agent_grupo_modo_pago
integer x = 2007
integer y = 44
integer width = 402
integer height = 264
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;if (lst_branch.getdataid() = '--') AND (lst_payer.getdataid() = '--') then
	if messagebox("Confirmar","Esta consulta sin filtrar agencia o pagador trae muchos registros, estas seguro que desea continuar?",Question!,YesNo!) <> 1 Then
		return
	end if	
end if

dw_1.Retrieve(lst_payer.getdataid(),lst_branch.getdataid(),lst_country.getdataid())


end event

type sle_idbranch from singlelineedit within w_comision_agent_grupo_modo_pago
integer x = 270
integer y = 44
integer width = 265
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
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_country.setselectedid(sle_idcountry.text )
lst_branch.setselectedid(sle_idbranch.text )
lst_payer.setselectedid(sle_idpayer.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_branch.getdataid() THEN
	this.TextColor	= RGB(255,0,0)	
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF

//fn_filterdatawindow()

end event

type lst_branch from my_ddlb within w_comision_agent_grupo_modo_pago
integer x = 539
integer y = 44
integer width = 1458
integer height = 1448
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch in ('R','A') and id_status_branch = 'O' UNION select '-ALL-', '--' order by 1;")
end event

event modified;call super::modified;sle_idbranch.text = lst_branch.getdataid()
end event

event selectionchanged;call super::selectionchanged;//fn_filterdatawindow()

end event

type sle_idpayer from singlelineedit within w_comision_agent_grupo_modo_pago
integer x = 270
integer y = 132
integer width = 265
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
textcase textcase = upper!
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

event modified;lst_country.setselectedid(sle_idcountry.text )
lst_branch.setselectedid(sle_idbranch.text )
lst_payer.setselectedid(sle_idpayer.text )

// Chequea que este en la lista
IF sle_idpayer.text <> lst_payer.getdataid() THEN
	this.TextColor	= RGB(255,0,0)	
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF

//fn_filterdatawindow()

end event

type lst_payer from my_ddlb within w_comision_agent_grupo_modo_pago
integer x = 539
integer y = 132
integer width = 1458
integer height = 1448
integer taborder = 60
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_main_branch,id_main_branch  from dba.group_branch where group_type in ('A','P') and flag_grupo = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event modified;call super::modified;sle_idpayer.text = lst_payer.getdataid()
end event

event selectionchanged;call super::selectionchanged;//fn_filterdatawindow()


end event

type sle_idcountry from singlelineedit within w_comision_agent_grupo_modo_pago
integer x = 270
integer y = 220
integer width = 265
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;lst_country.setselectedid(sle_idcountry.text )
lst_branch.setselectedid(sle_idbranch.text )
lst_payer.setselectedid(sle_idpayer.text )

// Chequea que este en la lista
IF sle_idcountry.text <> lst_country.getdataid() THEN
	this.TextColor	= RGB(255,0,0)	
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF


//fn_filterdatawindow()

end event

type lst_country from my_ddlb within w_comision_agent_grupo_modo_pago
integer x = 539
integer y = 220
integer width = 1458
integer height = 1448
integer taborder = 90
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("SELECT NAME_COUNTRY,ID_COUNTRY FROM dba.COUNTRY WHERE FLAG_COUNTRY = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event modified;call super::modified;sle_idcountry.text = lst_country.getdataid()

end event

event selectionchanged;call super::selectionchanged;
//fn_filterdatawindow()

end event

type st_3 from statictext within w_comision_agent_grupo_modo_pago
integer x = 37
integer y = 240
integer width = 219
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pais:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_comision_agent_grupo_modo_pago
integer x = 37
integer y = 148
integer width = 210
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagador:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_comision_agent_grupo_modo_pago
integer x = 37
integer y = 60
integer width = 201
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agencia:"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_comision_agent_grupo_modo_pago
integer x = 9
integer width = 2446
integer height = 336
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro"
end type

