$PBExportHeader$w_comision_delivery.srw
forward
global type w_comision_delivery from wb_single_tb
end type
type lst_payer from my_ddlb within w_comision_delivery
end type
type st_2 from statictext within w_comision_delivery
end type
type gb_1 from groupbox within w_comision_delivery
end type
end forward

global type w_comision_delivery from wb_single_tb
integer width = 4087
integer height = 2040
string title = "Payer Exception Commission (Country/Pay Mode/Payer)"
lst_payer lst_payer
st_2 st_2
gb_1 gb_1
end type
global w_comision_delivery w_comision_delivery

on w_comision_delivery.create
int iCurrent
call super::create
this.lst_payer=create lst_payer
this.st_2=create st_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lst_payer
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.gb_1
end on

on w_comision_delivery.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lst_payer)
destroy(this.st_2)
destroy(this.gb_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision_delivery
integer x = 9
integer y = 168
integer width = 4023
integer height = 1680
string title = "Payer Exception Commission (Country/Payer/Pay Mode)"
string dataobject = "dw_comision_delivery"
end type

event dw_1::itemchanged;call super::itemchanged;/**********************************************************************
 PARA LA DATAWINDOWS    dw_1
 DESCRIPCION: Se realzia la validacion para que ingrese solo codigos de
 agencia existentes
**********************************************************************/
String  	ls_branch
Long	 	ll_count
double 	ll_comision, ll_comision_company, ll_range

	
	//dw_1.AcceptText()
	
	CHOOSE CASE dwo.name
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
				
		CASE "porcent_agente"
				ll_comision = double(data)
				ll_comision_company = double(dw_1.object.porcent_comp[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","Porcentaje de Comision del Cliente no puede ser menor que el Porcentaje de Viamericas.",StopSign!)
					return 1
				end if
				
				if ll_comision > 0.2 then
					MessageBox("Error","Porcentaje de Comision no puede ser mayor a 20%.",StopSign!)
					return 1
				end if
				
		CASE "porcent_comp"
				ll_comision_company = double(data)
				ll_comision = double(dw_1.object.porcent_agente[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","Porcentaje de Comision de Viamericas no puede ser Mayor al Porcentaje del Cliente.",StopSign!)
					return 1
				end if

		CASE "feet_agente"
				ll_comision = double(data)
				ll_comision_company =  double(dw_1.object.feet_comp[row])
				ll_range = double(dw_1.object.range_end[row])
					
				if ll_comision < ll_comision_company then
					MessageBox("Error","La Comision del Cliente no puede ser menor que la Comision de Viamericas.",StopSign!)
					return 1
				end if
				
				if ll_comision >= ll_range then
					MessageBox("Error","La Comision del cliente no puede ser mayor al rango.",StopSign!)
					return 1
				end if
				
		CASE "feet_comp"
				ll_comision_company = double(data)
				ll_comision = double(dw_1.object.feet_agente[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","La Comision de Viamericas no puede ser Mayor a la Comision del Cliente.",StopSign!)
					return 1
				end if
						
						
						
	END CHOOSE	




///**********************************************************************
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
//
end event

event dw_1::itemerror;call super::itemerror;//No deja disparar el error del sistema sino el error controlado
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

//DON (04/02/2015) - To suppress Retrieve.  ***********************
IF gb_prevent_rate_retrieve	THEN
	gb_prevent_rate_retrieve	=	FALSE
ELSE
	this.retrieve()
END IF
//******************************************************

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

type lst_payer from my_ddlb within w_comision_delivery
integer x = 265
integer y = 44
integer width = 978
integer height = 1448
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_main_branch, id_main_branch from dba.group_branch where group_type in ('A','P') and flag_grupo = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;String ls_filter

dw_1.Retrieve()
if lst_payer.getdataid() <> '--' then
	ls_filter = "id_main_branch = '"+lst_payer.getdataid()+"'"
else
	ls_filter = ''
end if
dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end event

type st_2 from statictext within w_comision_delivery
integer x = 69
integer y = 60
integer width = 197
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
string text = "Payer :"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_comision_delivery
integer width = 1312
integer height = 148
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

