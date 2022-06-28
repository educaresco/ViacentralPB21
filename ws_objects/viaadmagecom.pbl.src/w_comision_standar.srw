$PBExportHeader$w_comision_standar.srw
forward
global type w_comision_standar from wb_single_tb
end type
end forward

global type w_comision_standar from wb_single_tb
integer width = 3904
integer height = 2216
string title = "Standar Commission (Country)"
end type
global w_comision_standar w_comision_standar

on w_comision_standar.create
call super::create
end on

on w_comision_standar.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision_standar
integer width = 3840
integer height = 2004
string title = "Standar Commission (Country)"
string dataobject = "dw_comision_standar"
end type

event dw_1::itemchanged;call super::itemchanged;/**********************************************************************
 PARA LA DATAWINDOWS    dw_1
 DESCRIPCION: Se realzia la validacion para que ingrese solo codigos de
 agencia existentes
**********************************************************************/

Long	 	ll_count
double 	ll_comision, ll_comision_company, ll_range

	
	//dw_1.AcceptText()
	
	CHOOSE CASE dwo.name
	
		CASE "porcent_costumer_comision"
				ll_comision = double(data)
				ll_comision_company = double(dw_1.object.porcent_company_comision[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","Porcentaje de Comision del Cliente no puede ser menor que el Porcentaje de Viamericas.",StopSign!)
					return 1
				end if
				
				if ll_comision > 0.2 then
					MessageBox("Error","Porcentaje de Comision no puede ser mayor a 20%.",StopSign!)
					return 1
				end if
				
		CASE "porcent_company_comision"
				ll_comision_company = double(data)
				ll_comision = double(dw_1.object.porcent_costumer_comision[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","Porcentaje de Comision de Viamericas no puede ser Mayor al Porcentaje del Cliente.",StopSign!)
					return 1
				end if

		CASE "feet_comision"
				ll_comision = double(data)
				ll_comision_company =  double(dw_1.object.feet_comision_comp[row])
				ll_range = double(dw_1.object.range_end_comision[row])
					
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
				ll_comision = double(dw_1.object.feet_comision[row])
				
				if ll_comision < ll_comision_company then
					MessageBox("Error","La Comision de Viamericas no puede ser Mayor a la Comision del Cliente.",StopSign!)
					return 1
				end if
						
						
						
	END CHOOSE	
end event

