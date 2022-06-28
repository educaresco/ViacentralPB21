$PBExportHeader$n_cst_fax_branches.sru
forward
global type n_cst_fax_branches from nonvisualobject
end type
end forward

global type n_cst_fax_branches from nonvisualobject
end type
global n_cst_fax_branches n_cst_fax_branches

type variables
Private:
	String is_activefax, is_texto_parametros, is_titulo_reporte
	
n_cst_valores_globales	in_cst_valores_globales
end variables

forward prototypes
public subroutine of_datos_encabezado_reporte (datawindow adw_reporte, datawindow adw_header, string as_activefax)
public function integer of_send_fax_selected_branch (string as_id_branch, datawindow adw_datawindow, datawindow adw_header)
public function integer of_send_fax_all_red_phone_branches (datawindow adw_dw, datawindow adw_header)
public subroutine of_set_titulo_reporte (string as_titulo_reporte)
end prototypes

public subroutine of_datos_encabezado_reporte (datawindow adw_reporte, datawindow adw_header, string as_activefax);//DRT==>2008-Oct-17

//Asigna al encabezado del reporte la información a visualizar

DataWindowChild ldwch_encabezado

IF adw_reporte.GetChild ("dw_encabezado", ldwch_encabezado ) =1 THEN
	adw_reporte.Object.DataWindow.Header.Height= Long(adw_header.object.DataWindow.Detail.Height)
	
	in_cst_valores_globales.of_variables_reportes( )

	ldwch_encabezado.setitem( 1, "logo", in_cst_valores_globales.is_LOGO  )
	ldwch_encabezado.setitem( 1, "direccion", in_cst_valores_globales.is_REPORT_ADDRESS_LINE )
	ldwch_encabezado.setitem( 1, "datos1", in_cst_valores_globales.is_REPORT_DATA_LINE1)
//	ldwch_encabezado.setitem( 1, "titulo", is_titulo)
	ldwch_encabezado.setitem( 1, "parametros", is_texto_parametros)
	ldwch_encabezado.setitem( 1, "datos2", as_activefax)
//	ldwch_encabezado.setitem( 1, "datos3", in_cst_valores_globales.is_DATOS3_REPORTE)
//	ldwch_encabezado.setitem( 1, "datos4", in_cst_valores_globales.is_DATOS4_REPORTE)
//	ldwch_encabezado.setitem( 1, "datos5", in_cst_valores_globales.is_DATOS5_REPORTE)
END IF


end subroutine

public function integer of_send_fax_selected_branch (string as_id_branch, datawindow adw_datawindow, datawindow adw_header);long		ll_cont
String 	ls_AutoFaxPath = 'S:\AutoFax\', 	ls_fax, ls_activefax

Setpointer(Hourglass!)


IF adw_datawindow.RowCount()=0 THEN
	MessageBox("Error","Please, retrieve the report before sending the fax.",stopSign!)
	Return -1
END IF

select count(*)
  into :ll_cont
  from dba.branch
 where id_branch = :as_id_branch
   and id_type_branch in ('A','R')
	and id_status_branch = 'O';

if ll_cont < 1 then
	Setpointer(Arrow!)
	messagebox("Error","The Branch "+as_id_branch+" was not found or is closed.",StopSign!)
	return -1
end if

If Messagebox("Confirmation","Do you want to send a FAX to the agency "+as_id_branch+" ?",Question!,YesNo!) = 1 Then

	ls_fax = fn_getbranchfax(as_id_branch)	
	if len(ls_fax) > 5 and len(ls_fax) < 15 then
		
		ls_activefax = "@F201 "+as_id_branch+"@@F211 "+ls_fax+"@@F307 Tasas Diarias "+as_id_branch+"@"		
		
		//Asigna al encabezado la información del fax
		This.of_datos_encabezado_reporte( adw_datawindow, adw_header, ls_activefax )
		
		//adw_datawindow.retrieve(as_id_branch,ls_activefax)

		adw_datawindow.print()
		//////dw_1.SaveAs(ls_AutoFaxPath+"REP_FaxRates_"+as_id_branch+string(today(),'yyyymmdd_hhmmss')+"_html.txt", HTMLTable!, FALSE)
		
		messagebox("Confirmation","The report was sent to the fax "+ls_fax+".",Information!)	
	else
		messagebox("Error","Please check the fax number ("+ls_fax+") for the agency "+as_id_branch+".",StopSign!)
	end if
	
end if

//adw_datawindow.retrieve(as_id_branch,'')

Setpointer(Arrow!)
Return 1
end function

public function integer of_send_fax_all_red_phone_branches (datawindow adw_dw, datawindow adw_header);String	ls_branch, ls_fax, ls_activefax

If Messagebox("Confirmation","Do you want to send a FAX with the rates to ALL the RED PHONE agencies?",Question!,YesNo!) <> 1 Then
	return -1
end if


Setpointer(Hourglass!)

 DECLARE cur_branches CURSOR FOR  
  SELECT dba.BRANCH.id_branch
    FROM dba.BRANCH,   
         dba.TIPO_TRANSMISION_AGENCIA,
         dba.GROUP_BRANCH  
   WHERE dba.BRANCH.ID_BRANCH 											= dba.TIPO_TRANSMISION_AGENCIA.ID_BRANCH AND 
			dba.GROUP_BRANCH.ID_MAIN_BRANCH 								= dba.BRANCH.ID_MAIN_BRANCH AND 
			dba.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION			= 'R' AND 
			ISNULL(dba.TIPO_TRANSMISION_AGENCIA.SEND_RATE_FAX,'N')= 'Y' AND 
			dba.BRANCH.FAX_BRANCH 											is not null  AND 
			dba.BRANCH.ID_STATUS_BRANCH 									= 'O' AND 
			dba.BRANCH.ID_TYPE_BRANCH 										in ('A','R') 
	ORDER BY DEBITO_GROUP DESC;

OPEN cur_branches;

FETCH cur_branches INTO :ls_branch;
//long lll
DO WHILE SQLCA.SQLCODE = 0 
	Setpointer(Hourglass!)
	ls_fax = fn_getbranchfax(ls_branch)	
	if len(ls_fax) > 5 and len(ls_fax) < 15 then
		ls_activefax = "@F201 "+ls_branch+"@@F211 "+ls_fax+"@@F307 Tasas Diarias@"		
		
		adw_dw.retrieve(ls_branch,ls_activefax)	
		
		//Asigna al encabezado la información del fax
		is_texto_parametros= "Agencia: "+ls_branch
		This.of_datos_encabezado_reporte( adw_dw, adw_header, ls_activefax )
//		lll++
//		If lll=20 THEN EXIT
		adw_dw.print()
	end if
	
	FETCH cur_branches INTO :ls_branch;
LOOP

CLOSE cur_branches;

Return 1
end function

public subroutine of_set_titulo_reporte (string as_titulo_reporte);is_titulo_reporte= as_titulo_reporte
end subroutine

on n_cst_fax_branches.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_fax_branches.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

