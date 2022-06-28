$PBExportHeader$w_comision.srw
forward
global type w_comision from wb_single_tb
end type
type st_1 from statictext within w_comision
end type
type lst_branch from my_ddlb within w_comision
end type
type sle_branch from singlelineedit within w_comision
end type
type gb_1 from groupbox within w_comision
end type
end forward

global type w_comision from wb_single_tb
integer x = 214
integer y = 221
integer width = 4023
integer height = 1916
string title = "Agency Exception Commission (Agency/Country)"
st_1 st_1
lst_branch lst_branch
sle_branch sle_branch
gb_1 gb_1
end type
global w_comision w_comision

forward prototypes
public subroutine fn_filter ()
end prototypes

public subroutine fn_filter ();String ls_filter
dw_1.Retrieve()
if lst_branch.getdataid() <> '--' then
	ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
else
	ls_filter = ''
end if		
dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end subroutine

on w_comision.create
int iCurrent
call super::create
this.st_1=create st_1
this.lst_branch=create lst_branch
this.sle_branch=create sle_branch
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.lst_branch
this.Control[iCurrent+3]=this.sle_branch
this.Control[iCurrent+4]=this.gb_1
end on

on w_comision.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.lst_branch)
destroy(this.sle_branch)
destroy(this.gb_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_comision
integer x = 9
integer y = 168
integer width = 3959
integer height = 1556
string title = "Agency Exception Commission (Agency/Country)"
string dataobject = "dw_comision"
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

event dw_1::itemerror;call super::itemerror;//NO DEJA DISPARAR EL ERROR DEL SISTEMA SINO, EL ERROR CONTROLADO
RETURN 1
end event

type st_1 from statictext within w_comision
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
string text = "Branch :"
boolean focusrectangle = false
end type

type lst_branch from my_ddlb within w_comision
integer x = 617
integer y = 44
integer width = 1317
integer height = 1448
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch in ('R','A') and id_status_branch = 'O' UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;
sle_branch.text = lst_branch.getdataid()

fn_filter()
end event

type sle_branch from singlelineedit within w_comision
integer x = 261
integer y = 44
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
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_branch.setselectedid( sle_branch.text )

// Chequea que este en la lista
IF sle_branch.text <> lst_branch.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
	return
ELSE	
	this.TextColor	= RGB(0,0,0)	
END IF

fn_filter()
end event

type gb_1 from groupbox within w_comision
integer width = 1979
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

