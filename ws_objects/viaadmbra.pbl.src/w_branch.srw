$PBExportHeader$w_branch.srw
forward
global type w_branch from wb_single_tb
end type
end forward

global type w_branch from wb_single_tb
int Width=3497
int Height=1492
boolean TitleBar=true
string Title="Agencies"
end type
global w_branch w_branch

on w_branch.create
call super::create
end on

on w_branch.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
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

type dw_1 from wb_single_tb`dw_1 within w_branch
int Y=32
int Width=3438
int Height=1252
boolean BringToTop=true
string DataObject="dw_branch"
end type

event dw_1::itemchanged;call super::itemchanged;//String 				ls_cod_cou, ls_cod_sta, ls_id_state, ls_id_city, ls_id_country
//DataWindowChild	ldw_dw
//
//IF dwo.name = "id_country" THEN
//	GetChild("id_state",ldw_dw)
//	ldw_dw.SetTransObject(SQLCA)
//	SetItem(GetRow(),"id_state","")
//	ldw_dw.Retrieve()
//	ldw_dw.SetFilter("id_country = '"+GetText()+"'")
//	ldw_dw.Filter()
//
//
//	SetItem(GetRow(),"id_city","")
//	GetChild("id_city_receiver",ldw_dw)
//	ldw_dw.SetTransObject(SQLCA)
//	ldw_dw.Retrieve()
//
//	IF GetItemString(GetRow(),"id_state") = '' OR IsNull(GetItemString(GetRow(),"id_state")) THEN
//		ldw_dw.SetFilter("id_country = '"+GetText()+"'")
//		ldw_dw.Filter()
//	ELSE
//		ldw_dw.SetFilter("id_country = '"+GetText()+"' and id_state = '"+GetItemString(GetRow(),"id_state")+"'")
//		ldw_dw.Filter()
//	END IF
//END IF
//
//IF dwo.name = "id_state" THEN
//	SetItem(GetRow(),"id_city","")
//	GetChild("id_city",ldw_dw)
//	ldw_dw.SetTransObject(SQLCA)
//	ldw_dw.Retrieve()
//	ldw_dw.SetFilter("id_country = '"+GetItemString(GetRow(),"id_country")+"' and id_state = '"+GetText()+"'")
//	ldw_dw.Filter()
//END IF
//
//IF dwo.Name = "id_city" THEN
//
//	ls_id_city = GetText()
//	ls_id_country = GetItemString(GetRow(),"id_country")
//
//  SELECT "city"."id_state"
//    INTO :ls_id_state
//    FROM "city"
//   WHERE "city"."id_city" = :ls_id_city  AND
//	      "id_country" = :ls_id_country ;
//
//	SetItem(GetRow(),"id_state",ls_id_state)
//END IF
//
end event

