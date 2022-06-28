$PBExportHeader$w_definir_limites_group_branch.srw
forward
global type w_definir_limites_group_branch from wb_single_tb
end type
end forward

global type w_definir_limites_group_branch from wb_single_tb
integer width = 2240
integer height = 2004
string title = "Debit Limit"
end type
global w_definir_limites_group_branch w_definir_limites_group_branch

on w_definir_limites_group_branch.create
call super::create
end on

on w_definir_limites_group_branch.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;
string 	ls_depto

  SELECT dba.cashier.add_cashier  
    INTO :ls_depto  
    FROM dba.cashier  
   WHERE dba.cashier.id_cashier = :gs_cashier   ;





//IF gs_cashier = 'CH13' or gs_cashier = 'CH15' or gs_cashier = 'CH16' or gs_cashier = 'CH7' or gs_cashier = 'CH37' then

//if ls_depto = 'CONTABILIDAD' then	
//	
	dw_1.RETRIEVE()
	
//END IF



end event

type dw_1 from wb_single_tb`dw_1 within w_definir_limites_group_branch
integer width = 2199
integer height = 1820
string dataobject = "dw_definir_limites_group_branch"
end type

event dw_1::constructor;SetTransObject(SQLCA)
datawindow	ddlb_filetypes

of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)    

inv_resize.of_SetMinSize(1185, 509)

event resize(1, this.width, this.height)







end event

event dw_1::itemchanged;call super::itemchanged;dw_1.setitem(row,"ID_CASHIER_MODDEBITLIMIT",gs_cashier)
end event

