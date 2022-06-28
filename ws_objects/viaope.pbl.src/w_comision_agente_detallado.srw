$PBExportHeader$w_comision_agente_detallado.srw
forward
global type w_comision_agente_detallado from wb_report
end type
end forward

global type w_comision_agente_detallado from wb_report
int Width=2958
boolean TitleBar=true
string Title="Commision of Vendor Detail"
end type
global w_comision_agente_detallado w_comision_agente_detallado

on w_comision_agente_detallado.create
call super::create
end on

on w_comision_agente_detallado.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Initialize the Window Resize Service.
//
//////////////////////////////////////////////////////////////////////////////

//Initialize the Window Resize Functionality
of_SetResize(true)
inv_resize.of_SetMinSize(1884, 873)
inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)
end event

type dw_1 from wb_report`dw_1 within w_comision_agente_detallado
int Width=2889
int Height=1484
boolean BringToTop=true
string DataObject="dw_calculo_comision_agentes_det"
end type

