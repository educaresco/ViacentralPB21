$PBExportHeader$w_rate_group_agent.srw
forward
global type w_rate_group_agent from wb_single_tb
end type
type cbx_filternew from checkbox within w_rate_group_agent
end type
type st_1 from statictext within w_rate_group_agent
end type
type lst_branch from my_ddlb within w_rate_group_agent
end type
type st_2 from statictext within w_rate_group_agent
end type
type lst_payer from my_ddlb within w_rate_group_agent
end type
type em_dif from editmask within w_rate_group_agent
end type
type st_label from statictext within w_rate_group_agent
end type
type cb_apply from commandbutton within w_rate_group_agent
end type
type cbx_increases from checkbox within w_rate_group_agent
end type
type sle_idbranch from singlelineedit within w_rate_group_agent
end type
type sle_idpayer from singlelineedit within w_rate_group_agent
end type
type sle_idcountry from singlelineedit within w_rate_group_agent
end type
type lst_country from my_ddlb within w_rate_group_agent
end type
type st_3 from statictext within w_rate_group_agent
end type
type st_4 from statictext within w_rate_group_agent
end type
type em_inc from editmask within w_rate_group_agent
end type
type cb_applyinc from commandbutton within w_rate_group_agent
end type
type st_5 from statictext within w_rate_group_agent
end type
type cb_copy from commandbutton within w_rate_group_agent
end type
type cb_delte_copy from commandbutton within w_rate_group_agent
end type
type sl_orign_agency from singlelineedit within w_rate_group_agent
end type
type cb_filter from commandbutton within w_rate_group_agent
end type
type pb_fax_rates from picturebutton within w_rate_group_agent
end type
type pb_generate_rates from picturebutton within w_rate_group_agent
end type
type cbx_selectall from checkbox within w_rate_group_agent
end type
type st_6 from statictext within w_rate_group_agent
end type
type st_7 from statictext within w_rate_group_agent
end type
type cbx_borrar_destino from checkbox within w_rate_group_agent
end type
type sle_branch_origen from singlelineedit within w_rate_group_agent
end type
type sle_destino from singlelineedit within w_rate_group_agent
end type
type st_8 from statictext within w_rate_group_agent
end type
type pb_1 from picturebutton within w_rate_group_agent
end type
type cb_1 from commandbutton within w_rate_group_agent
end type
type st_9 from statictext within w_rate_group_agent
end type
type em_fevencimiento from editmask within w_rate_group_agent
end type
type pb_send_rate_report1 from commandbutton within w_rate_group_agent
end type
type pb_publish_rates1 from commandbutton within w_rate_group_agent
end type
type pb_send_rate_report from picturebutton within w_rate_group_agent
end type
type pb_publish_rates from picturebutton within w_rate_group_agent
end type
type cb_4 from commandbutton within w_rate_group_agent
end type
type gb_1 from groupbox within w_rate_group_agent
end type
type gb_2 from groupbox within w_rate_group_agent
end type
type dw_resultado from datawindow within w_rate_group_agent
end type
type st_10 from statictext within w_rate_group_agent
end type
type dw_type_currency from datawindow within w_rate_group_agent
end type
type cbx_traer_inactivos from checkbox within w_rate_group_agent
end type
end forward

global type w_rate_group_agent from wb_single_tb
integer width = 5655
integer height = 2400
string title = "Rate Group Agent"
cbx_filternew cbx_filternew
st_1 st_1
lst_branch lst_branch
st_2 st_2
lst_payer lst_payer
em_dif em_dif
st_label st_label
cb_apply cb_apply
cbx_increases cbx_increases
sle_idbranch sle_idbranch
sle_idpayer sle_idpayer
sle_idcountry sle_idcountry
lst_country lst_country
st_3 st_3
st_4 st_4
em_inc em_inc
cb_applyinc cb_applyinc
st_5 st_5
cb_copy cb_copy
cb_delte_copy cb_delte_copy
sl_orign_agency sl_orign_agency
cb_filter cb_filter
pb_fax_rates pb_fax_rates
pb_generate_rates pb_generate_rates
cbx_selectall cbx_selectall
st_6 st_6
st_7 st_7
cbx_borrar_destino cbx_borrar_destino
sle_branch_origen sle_branch_origen
sle_destino sle_destino
st_8 st_8
pb_1 pb_1
cb_1 cb_1
st_9 st_9
em_fevencimiento em_fevencimiento
pb_send_rate_report1 pb_send_rate_report1
pb_publish_rates1 pb_publish_rates1
pb_send_rate_report pb_send_rate_report
pb_publish_rates pb_publish_rates
cb_4 cb_4
gb_1 gb_1
gb_2 gb_2
dw_resultado dw_resultado
st_10 st_10
dw_type_currency dw_type_currency
cbx_traer_inactivos cbx_traer_inactivos
end type
global w_rate_group_agent w_rate_group_agent

type variables
STRING is_order = 'as' , is_column_ant

LONG il_fila_selec
end variables

forward prototypes
public subroutine fn_filterdatawindow ()
public function integer spcopyrates (integer pdelete)
public function integer fn_copy_rates (stru_parametros pstru_parametros, integer pi_delete)
public function stru_parametros wf_verificar_location (stru_parametros pstru_parametros)
end prototypes

public subroutine fn_filterdatawindow ();STRING s_traer_inactivos, s_null


SetNull(s_null)

//ls_filter = ''
em_dif.enabled = false
cb_apply.enabled = false
em_inc.enabled = false
em_fevencimiento.enabled = false
cb_applyinc.enabled = false
sle_branch_origen.Text = ''
sle_destino.Text = ''
cbx_selectAll.Checked = false
em_fevencimiento.text = s_null
em_inc.text = s_null

//dw_1.Retrieve()

pb_send_rate_report1.enabled = true
pb_send_rate_report.enabled = true
pb_publish_rates1.enabled = true
pb_publish_rates.enabled = true


if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR cbx_filternew.checked then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
	
	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
		em_dif.enabled = true
		cb_apply.enabled = true
		em_inc.enabled = true
		em_fevencimiento.enabled = true
		
		cb_applyinc.enabled = true
		em_dif.text = '0.00'	
		em_inc.text = '0.00'
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
	end if
	
	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country_rate = '"+lst_country.getdataid()+"'"
		em_dif.enabled = true
		cb_apply.enabled = true
		em_inc.enabled = true
		em_fevencimiento.enabled = true
		cb_applyinc.enabled = true
		em_dif.text = '0.00'			
		em_inc.text = '0.00'	
//	else
//		ls_filter = ls_filter + " AND id_country_rate <> 'null'"
	end if	
	
end if

//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
IF cbx_traer_inactivos.Checked THEN
	s_traer_inactivos = 'S'
ELSE
	s_traer_inactivos = 'N'	
END IF
sle_branch_origen.Text = sle_idbranch.text


// 10/4/2018: it is more efficient to retrieve only the required data and not the whole table to be filtered on the screen!!!!
dw_1.Retrieve(lst_branch.getdataid(),lst_payer.getdataid(),lst_country.getdataid(),s_traer_inactivos)  



end subroutine

public function integer spcopyrates (integer pdelete);string ls_branch , ls_branch_origen,  ls_pagador, ls_country
int li_count , li_delete

int li_count_copy = 0
int li_count_delete = 0



ls_branch = trim(sle_idbranch.text)
ls_pagador = trim(sle_idpayer.text)
ls_country = trim(sle_idcountry.text)
ls_branch_origen = trim(sl_orign_agency.text)
li_delete = pdelete
//validar branch destino
li_count = 0	

/************VERFICIACION ********/


			
		SELECT COUNT(8)
			INTO :li_count_copy
		 FROM	DBA.RATE_GROUP_AGENT (NOLOCK)
					WHERE ID_BRANCH = :ls_branch_origen;

		SELECT COUNT(8)
			INTO :li_count_delete
		 FROM	DBA.RATE_GROUP_AGENT (NOLOCK)
					WHERE ID_BRANCH = :ls_branch
					  AND (ID_MAIN_BRANCH = :ls_pagador OR :ls_pagador  = '--' OR :ls_pagador  = '') 
					  AND (ID_COUNTRY_RATE = :ls_country OR :ls_country = '--' OR :ls_country = '');
					  
					  
if (li_delete = 0 ) then

		if Messagebox("Confirmación","Esta a punto de copiar  " + string(li_count_copy) +  " registros  de tasas desde la agencia "+ls_branch_origen+" hacia la agencia "+ls_branch+".  Desea continuar?" ,Exclamation!, OKCancel!, 2) <> 1 then
			dw_1.SetRedraw (true)
			return  -1
		end if
else
	
		if Messagebox("Confirmación","Esta a punto de borrar  " + string(li_count_delete) +  " tasas de la agencia  "+ls_branch+" Y copiar  " + string(li_count_copy) +  " tasas de la agencia "+ls_branch_origen+" hacia la agencia "+ls_branch+" .  Desea continuar?" ,Exclamation!, OKCancel!, 2) <> 1 then
			dw_1.SetRedraw (true)
			return  -1
		end if
		
end if
		

/************VERFICIACION ********/


SetPointer(HourGlass!)
dw_1.SetRedraw (false)


select count(id_branch )
  into :li_count
 from dba.branch (nolock)
where id_branch =:ls_branch
and id_type_branch in ('A','R');

if (li_count = 0)then
	Messagebox("Error","No se encontro la agencia destino para iniciar la copia!",StopSign!)
	dw_1.SetRedraw (true)
	return  -1
end if


//validar branch orgen
li_count = 0	
if (ls_branch_origen <> "") then
		select count(id_branch )
		  into :li_count
		 from dba.branch (nolock)
		where id_branch =:ls_branch_origen
		and id_type_branch in ('A','R');
		
		if (li_count = 0)then
			Messagebox("Error","No se encontro la agencia origen para iniciar la copia!",StopSign!)
			dw_1.SetRedraw (true)
			return -1
		end if
end if

//validar pagador
li_count = 0	
if (ls_pagador <> "" and ls_pagador <> "--") then
		select count(id_main_branch )
		  into :li_count
		 from dba.group_branch (nolock)
		where id_main_branch =:ls_pagador;
		
		if (li_count = 0)then
			Messagebox("Error","No se encontro el pagador para iniciar la copia!",StopSign!)
			dw_1.SetRedraw (true)
			return  -1
		end if	
else 		
	ls_pagador = 'ALL';		
end if
	
//validar country
li_count = 0	
if (ls_country <> "" and ls_country <> "--" ) then
		select count(id_country )
		  into :li_count
		 from dba.country (nolock)
		where id_country =:ls_country;
		
		if (li_count = 0)then
			Messagebox("Error","No se encontro el para iniciar la copia!",StopSign!)
			dw_1.SetRedraw (true)
			return  -1
		end if	
else 		
	ls_country =  'ALL';
end if	

//call sp to start copy

DECLARE spCopyRatesFromAgency PROCEDURE FOR 
	Sales.spCopyRatesFromAgency @FROM_BRANCH = :ls_branch_origen,  @TO_BRANCH = :ls_branch , @ID_MAIN_BRANCH = :ls_pagador, @ID_COUNTRY = :ls_country,   @pDELETE = :li_delete;	

EXECUTE spCopyRatesFromAgency;

If (SQLCA.SQLCode <>100) then 
	Messagebox ("Error "+String(SQLCA.SQLCode),"Error ejecutando proceso: ~n~r"+SQLCA.SQLErrText)
	return   -1
end if

COMMIT;



//************

// 10/9/2018 - Refreshes the screen.
fn_filterdatawindow();



dw_1.SetRedraw (true)
SetPointer(Arrow!)



Messagebox ("Proceso Terminado","Proceso Terminado")
return 0
end function

public function integer fn_copy_rates (stru_parametros pstru_parametros, integer pi_delete);string ls_branch , ls_branch_origen,  ls_pagador, ls_country
int li_count , li_delete, l_fila, l_fila_insert

int li_count_copy = 0
int li_count_delete = 0

n_exception n_exeption_local
n_exeption_local = CREATE n_exception

ls_pagador = trim(sle_idpayer.text)
ls_country = trim(sle_idcountry.text)
ls_branch_origen = trim(sle_idbranch.text)
li_delete = pi_delete
//validar branch destino
li_count = 0	

/************VERFICIACION ********/


li_count_copy = dw_1.RowCount()			
//SELECT COUNT(8)
//INTO :li_count_copy
//	FROM	DBA.RATE_GROUP_AGENT (NOLOCK)
//WHERE ID_BRANCH = :ls_branch_origen;

	/*	SELECT COUNT(8)
			INTO :li_count_delete
		 FROM	DBA.RATE_GROUP_AGENT (NOLOCK)
					WHERE ID_BRANCH = :ls_branch
					  AND (ID_MAIN_BRANCH = :ls_pagador OR :ls_pagador  = '--' OR :ls_pagador  = '') 
					  AND (ID_COUNTRY_RATE = :ls_country OR :ls_country = '--' OR :ls_country = '');*/
					 
//validar branch orgen
li_count = 0	

if (ls_branch_origen <> "") then
	
	select count(id_branch )
	  into :li_count
	 from dba.branch (nolock)
	where id_branch =:ls_branch_origen
	and id_type_branch in ('A','R');
	
	if (li_count = 0)then
		Messagebox("Error","No se encontro la agencia origen para iniciar la copia!",StopSign!)
		dw_1.SetRedraw (true)
		return -1
	end if
	
ELSE
	
	Messagebox("Error","No se encontro la agencia origen para iniciar la copia!",StopSign!)
	dw_1.SetRedraw (true)
	return -1
	
end if
					  
					  
if (li_delete = 0 ) then

	if Messagebox("Confirmación","Esta a punto de copiar " + string(li_count_copy) +  " registros  de tasas desde la agencia "+ls_branch_origen+" hacia las agencias "+  sle_destino.text+ ".  Desea continuar?  ~r~n~r~nRECUERDE: Para copiar los cambios realizados primero debe guardar" ,Exclamation!, OKCancel!, 2) <> 1 then
		dw_1.SetRedraw (true)
		return  -1
	end if
	
else

	if Messagebox("Confirmación","Esta a punto de borrar las tasas de las agencias seleccionadas y copiar  " + string(li_count_copy) +  " tasas de la agencia "+ls_branch_origen+" hacia las agencias "+  sle_destino.text+ ".  Desea continuar? ~r~n~r~nRECUERDE: Para copiar los cambios realizados primero debe guardar" ,Exclamation!, OKCancel!, 2) <> 1 then
		dw_1.SetRedraw (true)
		return  -1
	end if
		
end if
		
	
/************VERFICIACION ********/


SetPointer(HourGlass!)
dw_1.SetRedraw (false)

FOR l_fila = 1 TO UpperBound(pstru_parametros.String)
	TRY 	
	
		ls_branch =   pstru_parametros.String[l_fila]		
		
		select count(id_branch )
		  into :li_count
		 from dba.branch (nolock)
		where id_branch =:ls_branch
		and id_type_branch in ('A','R');
		
		if (li_count = 0)then
			n_exeption_local.SetMessage('No se encontro la agencia destino para iniciar la copia!')
			throw n_exeption_local
		
		end if
		
		
		
		
		//validar pagador
		li_count = 0	
		if (ls_pagador <> "" and ls_pagador <> "--" and  ls_pagador <>  'ALL') then
				select count(id_main_branch )
				  into :li_count
				 from dba.group_branch (nolock)
				where id_main_branch =:ls_pagador;
				
				if (li_count = 0)then
					n_exeption_local.SetMessage('No se encontro el pagador para iniciar la copia!')
					throw n_exeption_local
		
				end if	
		else 		
			ls_pagador = 'ALL';		
		end if
			
		//validar country
		li_count = 0	
		if (ls_country <> "" and ls_country <> "--" AND ls_country <>  'ALL' ) then
				select count(id_country )
				  into :li_count
				 from dba.country (nolock)
				where id_country =:ls_country;
				
				if (li_count = 0)then
					n_exeption_local.SetMessage('No se encontro el país para iniciar la copia!')
					throw n_exeption_local

				end if	
		else 		
			ls_country =  'ALL';
		end if	
		
		//call sp to start copy
		
		DECLARE spCopyRatesFromAgency PROCEDURE FOR 
			Sales.spCopyRatesFromAgency @FROM_BRANCH = :ls_branch_origen,  @TO_BRANCH = :ls_branch , @ID_MAIN_BRANCH = :ls_pagador, @ID_COUNTRY = :ls_country,   @pDELETE = :li_delete;	
		
		EXECUTE spCopyRatesFromAgency;
		
		If (SQLCA.SQLCode <>100) then 
			n_exeption_local.SetMessage(mid("Código de error "+String(SQLCA.SQLCode)+ " Error:"+SQLCA.SQLErrText,1,100))
			throw n_exeption_local

		end if
		
		COMMIT;
	CATCH(throwable error)
		ROLLBACK;
	   	 l_fila_insert = dw_resultado.InsertRow(0)
		 dw_resultado.SetItem(l_fila_insert,'agencia',ls_branch)
		 dw_resultado.SetItem(l_fila_insert,'resultado',error.getMessage())
	FINALLY
		CLOSE spCopyRatesFromAgency;

	END TRY
NEXT

if l_fila_insert > 0 THEN
	dw_resultado.Visible = True
END IF

//************

// 10/9/2018 - Refreshes the screen.
//fn_filterdatawindow();



dw_1.SetRedraw (true)
SetPointer(Arrow!)



Messagebox ("Proceso Terminado","Proceso Terminado")
return 0
end function

public function stru_parametros wf_verificar_location (stru_parametros pstru_parametros);
LONG  l_reg_procesar, l_fila
STRING s_branch, s_branch_recuperado

BOOLEAN b_reemplaza

STRU_PARAMETROS stru_retorno

l_reg_procesar = UpperBound(pstru_parametros.String)

FOR l_fila = 1 TO l_reg_procesar
	
	s_branch = pstru_parametros.String[l_fila] 
	
	IF mid(s_branch,1,1) = 'A' and IsNumber(mid(s_branch,2,1)) THEN
		
		stru_retorno.String[ UpperBound(stru_retorno.String) + 1] =  s_branch		
		
	ELSE
		
		DECLARE curBranch CURSOR FOR
		SELECT A.ID_BRANCH
		FROM dba.BRANCH A
		WHERE A.ID_BRANCH LIKE 'A%'
		      AND id_type_branch in ('R','A') 
			 AND id_status_branch = 'O'
		      AND A.ID_LOCATION = :s_branch;
		
		OPEN curBranch;
		
		
		FETCH curBranch INTO  :s_branch_recuperado;
		
		DO WHILE  SQLCA.SQLCODE = 0					

			stru_retorno.String[ UpperBound(stru_retorno.String) + 1] =  s_branch_recuperado
			
			FETCH curBranch INTO  :s_branch_recuperado;
		LOOP
		
		CLOSE curBranch;

		
	END IF
		
	
NEXT

RETURN stru_retorno 
end function

on w_rate_group_agent.create
int iCurrent
call super::create
this.cbx_filternew=create cbx_filternew
this.st_1=create st_1
this.lst_branch=create lst_branch
this.st_2=create st_2
this.lst_payer=create lst_payer
this.em_dif=create em_dif
this.st_label=create st_label
this.cb_apply=create cb_apply
this.cbx_increases=create cbx_increases
this.sle_idbranch=create sle_idbranch
this.sle_idpayer=create sle_idpayer
this.sle_idcountry=create sle_idcountry
this.lst_country=create lst_country
this.st_3=create st_3
this.st_4=create st_4
this.em_inc=create em_inc
this.cb_applyinc=create cb_applyinc
this.st_5=create st_5
this.cb_copy=create cb_copy
this.cb_delte_copy=create cb_delte_copy
this.sl_orign_agency=create sl_orign_agency
this.cb_filter=create cb_filter
this.pb_fax_rates=create pb_fax_rates
this.pb_generate_rates=create pb_generate_rates
this.cbx_selectall=create cbx_selectall
this.st_6=create st_6
this.st_7=create st_7
this.cbx_borrar_destino=create cbx_borrar_destino
this.sle_branch_origen=create sle_branch_origen
this.sle_destino=create sle_destino
this.st_8=create st_8
this.pb_1=create pb_1
this.cb_1=create cb_1
this.st_9=create st_9
this.em_fevencimiento=create em_fevencimiento
this.pb_send_rate_report1=create pb_send_rate_report1
this.pb_publish_rates1=create pb_publish_rates1
this.pb_send_rate_report=create pb_send_rate_report
this.pb_publish_rates=create pb_publish_rates
this.cb_4=create cb_4
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_resultado=create dw_resultado
this.st_10=create st_10
this.dw_type_currency=create dw_type_currency
this.cbx_traer_inactivos=create cbx_traer_inactivos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_filternew
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.lst_branch
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.lst_payer
this.Control[iCurrent+6]=this.em_dif
this.Control[iCurrent+7]=this.st_label
this.Control[iCurrent+8]=this.cb_apply
this.Control[iCurrent+9]=this.cbx_increases
this.Control[iCurrent+10]=this.sle_idbranch
this.Control[iCurrent+11]=this.sle_idpayer
this.Control[iCurrent+12]=this.sle_idcountry
this.Control[iCurrent+13]=this.lst_country
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.em_inc
this.Control[iCurrent+17]=this.cb_applyinc
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.cb_copy
this.Control[iCurrent+20]=this.cb_delte_copy
this.Control[iCurrent+21]=this.sl_orign_agency
this.Control[iCurrent+22]=this.cb_filter
this.Control[iCurrent+23]=this.pb_fax_rates
this.Control[iCurrent+24]=this.pb_generate_rates
this.Control[iCurrent+25]=this.cbx_selectall
this.Control[iCurrent+26]=this.st_6
this.Control[iCurrent+27]=this.st_7
this.Control[iCurrent+28]=this.cbx_borrar_destino
this.Control[iCurrent+29]=this.sle_branch_origen
this.Control[iCurrent+30]=this.sle_destino
this.Control[iCurrent+31]=this.st_8
this.Control[iCurrent+32]=this.pb_1
this.Control[iCurrent+33]=this.cb_1
this.Control[iCurrent+34]=this.st_9
this.Control[iCurrent+35]=this.em_fevencimiento
this.Control[iCurrent+36]=this.pb_send_rate_report1
this.Control[iCurrent+37]=this.pb_publish_rates1
this.Control[iCurrent+38]=this.pb_send_rate_report
this.Control[iCurrent+39]=this.pb_publish_rates
this.Control[iCurrent+40]=this.cb_4
this.Control[iCurrent+41]=this.gb_1
this.Control[iCurrent+42]=this.gb_2
this.Control[iCurrent+43]=this.dw_resultado
this.Control[iCurrent+44]=this.st_10
this.Control[iCurrent+45]=this.dw_type_currency
this.Control[iCurrent+46]=this.cbx_traer_inactivos
end on

on w_rate_group_agent.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_filternew)
destroy(this.st_1)
destroy(this.lst_branch)
destroy(this.st_2)
destroy(this.lst_payer)
destroy(this.em_dif)
destroy(this.st_label)
destroy(this.cb_apply)
destroy(this.cbx_increases)
destroy(this.sle_idbranch)
destroy(this.sle_idpayer)
destroy(this.sle_idcountry)
destroy(this.lst_country)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_inc)
destroy(this.cb_applyinc)
destroy(this.st_5)
destroy(this.cb_copy)
destroy(this.cb_delte_copy)
destroy(this.sl_orign_agency)
destroy(this.cb_filter)
destroy(this.pb_fax_rates)
destroy(this.pb_generate_rates)
destroy(this.cbx_selectall)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.cbx_borrar_destino)
destroy(this.sle_branch_origen)
destroy(this.sle_destino)
destroy(this.st_8)
destroy(this.pb_1)
destroy(this.cb_1)
destroy(this.st_9)
destroy(this.em_fevencimiento)
destroy(this.pb_send_rate_report1)
destroy(this.pb_publish_rates1)
destroy(this.pb_send_rate_report)
destroy(this.pb_publish_rates)
destroy(this.cb_4)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_resultado)
destroy(this.st_10)
destroy(this.dw_type_currency)
destroy(this.cbx_traer_inactivos)
end on

event open;call super::open;em_dif.enabled = false
cb_apply.enabled = false
//cbx_clr.enabled = false
em_inc.enabled = false
cb_applyinc.enabled = false
em_fevencimiento.enabled = false

dw_type_currency.SetTransObject(SQLCA)
end event

type dw_1 from wb_single_tb`dw_1 within w_rate_group_agent
event ue_habilidar_btn ( )
integer x = 9
integer y = 716
integer width = 5499
integer height = 1484
integer taborder = 20
string dataobject = "dw_rate_group_agent"
end type

event dw_1::ue_habilidar_btn();//
//LONG ll_foundll_found
//	
//ll_foundll_found = dw_1.getItemNumber(1,"nro_reg_select")
//
//IF ll_foundll_found > 1 THEN
//	cb_1.Enabled = True
//	
//ELSE
//	cb_1.Enabled = False
//	
//END IF
//
//
end event

event dw_1::constructor;call super::constructor;
//of_SetTransObject(sqlca)

// Start the Drop-down Calendar and associate with the 
// "order date" column of the DataWindow.
of_SetDropDownCalendar(true)
iuo_calendar.of_Register('date_begin_rate', iuo_calendar.DDLB_WITHARROW)

// Start the Drop-down Calculator and associate with the "quantity" column
// of the DataWindow.
of_SetDropDownCalculator(true)
iuo_calculator.of_Register('rate', iuo_calculator.DDLB_WITHARROW)

//  Call the of_Retrieve function to retrieve the data.
of_Retrieve()
end event

event dw_1::itemchanged;call super::itemchanged;double ld_rate, ld_increase, ld_rate_allowance
string ls_country, ls_currency, s_state, s_branch 
long	ll_cont
integer li_id_rate_type

dw_1.setitem(row,"date_upgrade",today())


//DWItemStatus  dw_status
//
//dw_status =  dw_1.GetItemStatus ( row,'id_branch' ) 

IF len(dw_1.getitemstring(row,"id_branch")) = 0 OR IsNull(dw_1.getitemstring(row,"id_branch")) THEN
	
	s_branch = sle_idbranch.text
	
	dw_1.Setitem(row,"id_branch",s_branch)
	
	SELECT ID_STATE
	INTO :s_state
	FROM dba.BRANCH
 	WHERE ID_BRANCH =:s_branch;
	
	dw_1.Setitem(row,"id_state",s_state) 
	
	
END IF


//if dwo.name = 'isselected' then
//	
//	This.PostEvent("ue_habilidar_btn")  
//		
//	
//END IF
///// Modifican el INCREASE
if dwo.name = 'temp_rate_mod' then

	ld_rate = dw_1.getitemnumber(row,"rate")	
	
//	if (double(data)/ld_rate)*100 > 1.5 then
//		Messagebox("Error","El Incrmento debe ser maximo hasta el 1.5% de la tasa.",StopSign!)
//		return 2		
//	end if	
//
		
	
	SELECT min(RATE_ALLOWANCE)
	  INTO :ld_rate_allowance
	  FROM dba.ACC_PARAMETERS;
	
	// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
	if abs((double(data)) / ld_rate) > ld_rate_allowance then
		Messagebox("Valor Errado","El incremento es muy alto/bajo con respecto a la tasa. Revise la incremento. (±"+String(ld_rate_allowance * 100)+"%)",StopSign!)
		//SetFocus(em_rate)
		return 2
	end if		
		
		
		
	li_id_rate_type = getitemnumber(row,"id_rate_type")
	ld_increase = double(data)	

	// Actualiza el RATE de acuerdo al RATE_TYPE y al INCREMENTO
	SELECT rate
	  INTO :ld_rate
	  FROM dba.RATE_TYPE
	 WHERE id_rate_type = :li_id_rate_type;
			
	if isnull(ld_increase) then ld_increase = 0	

	dw_1.setitem(row,"rate",ld_rate+ld_increase)	
	
end if



///// Modifican el RATE_TYPE
if dwo.name = 'id_rate_type' then
	
	li_id_rate_type = integer(data)
	
	if isnull(data) then
		dw_1.setitem(row,"temp_rate_mod",0)
	else		
		
		ls_country = dw_1.getitemstring(row,"id_country_rate")
		ls_currency = dw_1.getitemstring(row,"id_curreny")
		
		SELECT count(*)
		  INTO :ll_cont
		  FROM dba.RATE_TYPE
		 WHERE id_rate_type = :li_id_rate_type
			AND id_country = :ls_country
			AND id_currency = :ls_currency;
			
		if ll_cont = 0 then
			Messagebox("Error","La tasa seleccionada no es una tasa de este pais/moneda.",StopSign!)
			return 2		
		end if
		
		ld_increase = dw_1.getitemnumber(row,"temp_rate_mod")
		
		// Actualiza el RATE de acuerdo al RATE_TYPE y al INCREMENTO	
		SELECT rate
		  INTO :ld_rate
		  FROM dba.RATE_TYPE
		 WHERE id_rate_type = :li_id_rate_type;
				
		if isnull(ld_increase) then ld_increase = 0
		
		dw_1.setitem(row,"rate",ld_rate+ld_increase)						
		
	end if

end if


///// Modifican el AGENTE
if dwo.name = 'id_branch' then
	
	String ls_id_state, ls_id_branch
	
	ls_id_branch = data
	
	SELECT id_state
	  INTO :ls_id_state
	  FROM dba.branch
	 WHERE id_branch = :ls_id_branch;
		
	dw_1.setitem(row,"id_state",ls_id_state)	
		
	
end if


if dwo.name = 'id_country_rate' then
	
	dw_1.setitem(row,"limit_inf_rate",1)	
	dw_1.setitem(row,"limit_sup_rate",8000)
	
	if data = 'RD' or data = 'COL' then
		dw_1.setitem(row,"limit_send_rate",999.99)		
	else
		dw_1.setitem(row,"limit_send_rate",2999.99)		
	end if	
	
end if


///**********************************************************************
// PARA LA DATAWINDOWS    dw_1
// DESCRIPCION: Se realzia la validacion para que ingrese solo codigos de
// agencia existentes
// AUTOR: jcmontoya
//**********************************************************************/

long l_fila
String s_campo,ls_nombreAgencia,ls_valorAgencia,ls_valorPagador,ls_nombrePagador

l_fila 				= dw_1.GetRow()
s_campo		= UPPER(dw_1.GetText())

	
	dw_1.AcceptText()
	CHOOSE CASE dwo.name
		CASE "id_branch_1"
				ls_valorAgencia = dw_1.object.id_branch_1[l_fila]
				
				SELECT NAME_BRANCH
				INTO :ls_nombreAgencia
				FROM DBA.BRANCH  
				WHERE ID_BRANCH=:ls_valorAgencia
				USING SQLCA;
				
				IF IsNull(ls_nombreAgencia) OR LEN(TRIM(ls_nombreAgencia))=0 OR ls_nombreAgencia ="" THEN
					dw_1.object.id_branch[l_fila] = "";
					MessageBox("Advertencia","No existe el código de agencia: "+ls_valorAgencia)

					RETURN 1 
				END IF
				
				
		CASE "id_main_branch_1"
			ls_valorPagador = dw_1.object.id_main_branch_1[l_fila]
			
			SELECT NAME_MAIN_BRANCH
			INTO :ls_nombrePagador
			FROM DBA.GROUP_BRANCH  
			WHERE ID_MAIN_BRANCH=:ls_valorPagador
			USING SQLCA;
			
			IF IsNull(ls_nombrePagador) OR LEN(TRIM(ls_nombrePagador))=0 OR ls_nombrePagador ="" THEN
				dw_1.object.id_main_branch[l_fila] = "";
				MessageBox("Advertencia","No existe el código del pagador: "+ls_valorPagador)
				RETURN 1
			END IF

	END CHOOSE	

end event

event dw_1::itemerror;call super::itemerror;//Se sobreescribe el retorno a 1 para que no muestre error de DW, sino un error controlado
RETURN 1
end event

event dw_1::clicked;call super::clicked;STRING s_column, s_sort
		
s_column = dwo.name
		
dw_type_currency.Visible = false
		
IF mid(s_column,1,2) =  't_' THEN
	s_column = mid(s_column,3)
				
	IF s_column = is_column_ant THEN
		if is_order = 'as' THEN
			is_order = 'ds' 
		ELSE
			is_order = 'as'	
		END IF
	END IF

	s_sort = s_column+ " "+ is_order  
		
	dw_1.SetSort(s_sort)
	
	dw_1.Sort( )

	is_column_ant = s_column

	RETURN
END IF

	
IF s_column = 'id_rate_type' THEN
	
	STRING s_country, s_currency
	LONG l_fila_encontrada, l_type_rate
		
	s_country =  dw_1.GetItemString(row,'id_country_rate')
	s_currency =  dw_1.GetItemString(row,'id_curreny' )
	l_type_rate =  dw_1.GetItemNumber(row,'id_rate_type' )
		
	dw_type_currency.Retrieve(s_country,s_currency )
			
	dw_type_currency.Visible = True
		
	l_fila_encontrada = dw_type_currency.Find('id_rate_type = '+  String( l_type_rate), 1,   dw_type_currency.RowCount() )
		
	IF l_fila_encontrada > 0 THEN
				
		dw_type_currency.SelectRow(l_fila_encontrada, true)
		dw_type_currency.scrolltorow( l_fila_encontrada)
		
	END IF
		


	il_fila_selec = row
END IF
end event

type cbx_filternew from checkbox within w_rate_group_agent
boolean visible = false
integer x = 4992
integer y = 596
integer width = 786
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display Only MTSA Agencies"
boolean checked = true
end type

event clicked;if cbx_filternew.checked then
	dw_1.DataObject = 'dw_rate_group_agent_onlymtsa'
else
	dw_1.DataObject = 'dw_rate_group_agent'
end if
dw_1.SetTransObject(SQLCA)
dw_1.retrieve()
end event

type st_1 from statictext within w_rate_group_agent
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

type lst_branch from my_ddlb within w_rate_group_agent
integer x = 539
integer y = 44
integer width = 1458
integer height = 1448
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch in ('R','A') and id_status_branch = 'O' UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;fn_filterdatawindow()

//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false
//dw_1.Retrieve()
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR cbx_filternew.checked then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if
//	
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country_rate = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country_rate <> 'null'"
//	end if	
//	
//end if
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

event modified;call super::modified;sle_idbranch.text = lst_branch.getdataid()
sle_idbranch.TextColor	= RGB(0,0,0)
end event

type st_2 from statictext within w_rate_group_agent
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

type lst_payer from my_ddlb within w_rate_group_agent
integer x = 539
integer y = 132
integer width = 1458
integer height = 1448
integer taborder = 50
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_main_branch,id_main_branch  from dba.group_branch where group_type in ('A','P') and flag_grupo = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;fn_filterdatawindow()


//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false


//dw_1.Retrieve()
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR cbx_filternew.checked then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if	
//	
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country_rate <> 'null'"
//	end if		
////	if cbx_increases.checked then
////		ls_filter = ls_filter + " AND temp_rate_mod > 0 AND id_country_rate = 'MEX' "
////		// >>>>>>>>>>>>>>>>>>>>
////		// Added 05/13/2008
////		em_dif.enabled = true
////		cb_apply.enabled = true
////		cbx_clr.enabled = true
////		em_dif.text = '0.00'		
////		// >>>>>>>>>>>>>>>>>>>>
////	end if
//	
//end if
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

event modified;call super::modified;sle_idpayer.text = lst_payer.getdataid()
end event

type em_dif from editmask within w_rate_group_agent
integer x = 3273
integer y = 88
integer width = 283
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "0.00"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "000.00"
double increment = 0.1
string minmax = "-20.00~~20.00"
end type

type st_label from statictext within w_rate_group_agent
integer x = 2240
integer y = 96
integer width = 1019
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
string text = "Subir/Bajar Todas las tasas UNASSIGNED en:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_apply from commandbutton within w_rate_group_agent
integer x = 4425
integer y = 88
integer width = 503
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Aplicar"
end type

event clicked;double ld_max, ld_min, ld_dif
long ll_cont, i

SetPointer(HourGlass!)
dw_1.SetRedraw (false)

// (solo lo hace para las que no tienen un tipo de tasa RATE_TYPE)
	
ld_dif = double (em_dif.text)

if dw_1.rowcount() < 1 or ld_dif = 0 then
	return
end if

ll_cont = 0
ld_max = dw_1.Object.data[1,8]
ld_min = dw_1.Object.data[1,8]

FOR i = 1 TO dw_1.rowcount()

	if isnull(dw_1.Object.data[i,13]) then
		if dw_1.Object.data[i,8] > ld_max and isnull(dw_1.Object.data[i,13]) then
			ld_max = dw_1.Object.data[i,8]
		end if
		if dw_1.Object.data[i,8] < ld_min and isnull(dw_1.Object.data[i,13]) then
			ld_min = dw_1.Object.data[i,8]
		end if
		ll_cont++		
	end if
	
NEXT

if ((ld_dif / ld_min) > 0.05) or ((ld_dif / ld_max) > 0.05) then
	Messagebox("Error","El Incremento/Decremento es muy grande para esta tasa!",StopSign!)
	dw_1.SetRedraw (true)
	return
end if

if Messagebox("Confirmación", string(ll_cont)+" Tasas van a ser modificadas entre "+string(ld_min + ld_dif)+" y "+string(ld_max + ld_dif)+", esta seguro?" ,Exclamation!, OKCancel!, 2) = 1 then
	ll_cont = 0
	FOR i = 1 TO dw_1.rowcount()		
		
		// no se actualizan las que tienen tipo de tasa (RATE_TYPE)
		if isnull(dw_1.Object.data[i,13]) then
			dw_1.Object.data[i,8] = dw_1.Object.data[i,8] + ld_dif
			ll_cont++
		end if			
		
	NEXT
	Messagebox("Confirmación", string(ll_cont)+" Tasas modificadas, Debe grabar para aplicar los cambios.");
end if

dw_1.SetRedraw (true)
SetPointer(arrow!)
end event

type cbx_increases from checkbox within w_rate_group_agent
boolean visible = false
integer x = 4992
integer y = 604
integer width = 658
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter only MEX Increases"
end type

event clicked;//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false
//dw_1.Retrieve()
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR cbx_filternew.checked then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'	
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if	
//	if cbx_increases.checked then
//		ls_filter = ls_filter + " AND temp_rate_mod > 0 AND id_country_rate = 'MEX' "
//		
//		// >>>>>>>>>>>>>>>>>>>>
//		// Added 05/13/2008
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'		
//		// >>>>>>>>>>>>>>>>>>>>
//
//	end if
//	
//end if
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

type sle_idbranch from singlelineedit within w_rate_group_agent
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
long backcolor = 31318783
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_country.setselectedid(sle_idcountry.text )
lst_branch.setselectedid(sle_idbranch.text )
lst_payer.setselectedid(sle_idpayer.text )


//STRING s_id_branch, s_name_branch, s_branch_param
//
//s_branch_param = sle_idbranch.text
//
//select name_branch, 
//		id_branch 
//into :s_name_branch,
//	  :s_id_branch
//from dba.branch
//where id_type_branch in ('R','A') 
//and id_status_branch = 'O' 
//and ID_BRANCH =  :s_branch_param;
//


// Chequea que este en la lista
fn_filterdatawindow();
IF sle_idbranch.text <> lst_branch.getdataid() THEN
	this.TextColor	= RGB(255,0,0)	
ELSE	
	this.TextColor	= RGB(0,0,0)
	//IF Len(this.text) > 0 THEN
	
//END IF
END IF

end event

type sle_idpayer from singlelineedit within w_rate_group_agent
integer x = 270
integer y = 132
integer width = 265
integer height = 84
integer taborder = 40
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


fn_filterdatawindow();

// Chequea que este en la lista
IF sle_idpayer.text <> lst_payer.getdataid() THEN
	this.TextColor	= RGB(255,0,0)	
ELSE	
	this.TextColor	= RGB(0,0,0)
	
	//IF Len(this.text) > 0 THEN
	
//END IF


END IF

//fn_filterdatawindow()

//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false
//dw_1.Retrieve()
//
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') THEN
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if
//	
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country <> 'null' "
//	end if
//
//end if
//
//String query
//
//query = dw_1.Describe("DataWindow.Table.SQLSelect")
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

type sle_idcountry from singlelineedit within w_rate_group_agent
integer x = 270
integer y = 220
integer width = 265
integer height = 84
integer taborder = 70
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
	//IF Len(this.text) > 0 THEN
	fn_filterdatawindow();
	//END IF
END IF


fn_filterdatawindow()

//
//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false
//dw_1.Retrieve()
//
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR (lst_country.getdataid() <> '--')then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if
//	
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country_rate = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country_rate <> 'null'"
//	end if
//
//end if
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

type lst_country from my_ddlb within w_rate_group_agent
integer x = 539
integer y = 220
integer width = 1458
integer height = 1448
integer taborder = 50
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("SELECT NAME_COUNTRY,ID_COUNTRY FROM dba.COUNTRY WHERE FLAG_COUNTRY = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event modified;call super::modified;sle_idcountry.text = lst_country.getdataid()

end event

event selectionchanged;call super::selectionchanged;
fn_filterdatawindow()

//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false
//dw_1.Retrieve()
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR (lst_country.getdataid() <> '--')  then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if	
//
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country_rate = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country_rate <> 'null'"
//	end if	
//	
//end if
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

type st_3 from statictext within w_rate_group_agent
integer x = 37
integer y = 236
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

type st_4 from statictext within w_rate_group_agent
integer x = 2258
integer y = 180
integer width = 1001
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
string text = "Ajustar todos los incrementos:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_inc from editmask within w_rate_group_agent
integer x = 3273
integer y = 168
integer width = 283
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "0.00"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "000.00"
double increment = 0.1
string minmax = "-20.00~~20.00"
end type

type cb_applyinc from commandbutton within w_rate_group_agent
integer x = 4425
integer y = 168
integer width = 503
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Aplicar"
end type

event clicked;double ld_max, ld_min, ld_inc
long ll_cont, i, ll_foundll_found

DECIMAL ld_rate_allowance

DATE d_fevencimiento, d_feactual, d_null
STRING s_null


SetNull(s_null)

SetNull(d_null)

TRY
SetPointer(HourGlass!)


ld_inc = double (em_inc.text)		

if dw_1.rowcount() < 1 then
	return
end if

	d_feactual = Date(dw_1.GetItemDateTime(1,'current_date' ))
	d_fevencimiento = Date(em_fevencimiento.text)
	
	IF d_fevencimiento = Date('01/01/1900') THEN
		d_fevencimiento = d_null
	ELSE
	
		IF d_fevencimiento < d_feactual THEN
			messageBox('Advertencia','La fecha de vencimiento no debe ser menor a la fecha actual')
			return
		END IF
	END IF
	
	
	ll_foundll_found = dw_1.Find(" isselected = 1", 1, dw_1.RowCount())
	
	IF ll_foundll_found = 0 THEN
		Messagebox("Advertencia","Debe seleccionar los registros a modificar!",StopSign!)
		return
	END IF
	
	
	
ll_cont = 0
	ld_max = dw_1.Object.rate[1]
	ld_min = dw_1.Object.rate[1]

FOR i = 1 TO dw_1.rowcount()
		
		IF dw_1.Object.isselected[i ] THEN
			if not isnull(dw_1.Object.id_rate_type[i ]) and isnull(dw_1.Object.temp_rate_valid_thru[i ]) then
	
				if dw_1.Object.rate[i ] > ld_max and isnull(dw_1.Object.id_rate_type[i ]) then
					ld_max = dw_1.Object.rate[i ]
		end if
				if dw_1.Object.rate[i ] < ld_min and isnull(dw_1.Object.id_rate_type[ i ]) then
					ld_min = dw_1.Object.rate[i ]
		end if
		ll_cont++
		
	end if
		END IF
		
NEXT

	
	SELECT min(RATE_ALLOWANCE)
	  INTO :ld_rate_allowance
	  FROM dba.ACC_PARAMETERS;
	
	//if ((ld_inc / ld_min) > 0.05) or ((ld_inc / ld_max) > 0.05) then
	if ((ld_inc / ld_min) > ld_rate_allowance) or ((ld_inc / ld_max) > ld_rate_allowance) then	
		
	Messagebox("Error","El Incremento/Decremento es muy grande para esta tasa!",StopSign!)

	return
end if


if Messagebox("Confirmación", "Esta seguro que desea modificar a " + em_inc.text + " todos los incrementos ("+ String(ll_cont)+" registros) que no tienen Fecha de Vencimiento?" ,Exclamation!, OKCancel!, 2) = 1 then
	ll_cont = 0
	FOR i = 1 TO dw_1.rowcount()		
			IF dw_1.Object.isselected[i ] THEN
		
		// Se actualizan las que tienen tipo de tasa (RATE_TYPE) y no tienen fecha de vencimiento
				if not isnull(dw_1.Object.id_rate_type[ i ]) and isnull(dw_1.Object.temp_rate_valid_thru[ i ]) then
							
					if isnull(dw_1.Object.temp_rate_mod[ i ]) then dw_1.Object.temp_rate_mod[ i ] = 0
							
			// Quita el incremento actual
					dw_1.Object.rate[ i ] = dw_1.Object.rate[ i ] - dw_1.Object.temp_rate_mod[ i ]
			
			// Actualiza el nuevo incremento
					dw_1.Object.temp_rate_mod[ i ] = ld_inc
			
			// Calcula la tasa con el nuevo incremento
					dw_1.Object.rate[ i ] = dw_1.Object.rate[ i ] + ld_inc
					dw_1.Object.temp_rate_valid_thru[ i ] = d_fevencimiento
					

			ll_cont++
			
//			if len(string(dw_1.rowcount())) > 2 and mid(string(dw_1.rowcount()),2,2) = '00' then
//				Messagebox("",dw_1.rowcount())
//			end if
			
		end if
			END IF
				
	NEXT
	Messagebox("Confirmación", string(ll_cont)+" Incrementos modificados, Debe grabar para aplicar los cambios.");
end if
	
	
	em_fevencimiento.text = s_null
	em_inc.text = s_null

FINALLY
	

SetPointer(Arrow!)
END TRY
end event

type st_5 from statictext within w_rate_group_agent
integer x = 2318
integer y = 260
integer width = 942
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
string text = "Copiar Todas las tasas de la agencia:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_copy from commandbutton within w_rate_group_agent
integer x = 4110
integer y = 252
integer width = 283
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copiar"
end type

event clicked;
spCopyRates(0);


end event

type cb_delte_copy from commandbutton within w_rate_group_agent
integer x = 4411
integer y = 252
integer width = 521
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Borrar Todo y Copiar"
end type

event clicked;spCopyRates(1);
end event

type sl_orign_agency from singlelineedit within w_rate_group_agent
integer x = 3273
integer y = 252
integer width = 283
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type cb_filter from commandbutton within w_rate_group_agent
integer x = 1655
integer y = 308
integer width = 343
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Filtrar"
end type

event clicked;fn_filterdatawindow();
end event

type pb_fax_rates from picturebutton within w_rate_group_agent
integer x = 2016
integer y = 40
integer width = 110
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Print!"
alignment htextalign = left!
string powertiptext = "Fax Rates"
end type

event clicked;string ls_branch
STRU_PARAMETROS stru_parametros


EVENT closequery()

ls_branch = sle_idbranch.text

if ls_branch <> '' then
	stru_parametros.String[1] = ls_branch
	OpenSheetWithParm(w_rep_faxrates,stru_parametros,w_principal, 2, Original!)
	
end if


//string ls_branch
//
//window lw_null
//
//EVENT closequery()
//
//ls_branch = sle_idbranch.text
//
//if ls_branch <> '' then
//	if iw_rep_faxrates = lw_null then
//		OpenWithParm(iw_rep_faxrates, ls_branch)
//	else
//		iw_rep_faxrates.SetFocus()
//		iw_rep_faxrates.sle_branch.text = ls_branch
//		iw_rep_faxrates.sle_branch.triggerevent('modified')
//		iw_rep_faxrates.cb_query.TriggerEvent('clicked')
//	end if
//end if
//
//





end event

type pb_generate_rates from picturebutton within w_rate_group_agent
integer x = 2016
integer y = 140
integer width = 110
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "FormatDollar!"
alignment htextalign = left!
string powertiptext = "Publicar Rates"
end type

event clicked;string ls_branch
STRU_PARAMETROS stru_parametros


EVENT closequery()

ls_branch = sle_idbranch.text

if ls_branch <> '' then
	stru_parametros.String[1] = ls_branch
	OpenSheetWithParm(w_sql_generator_rate,stru_parametros,w_principal, 2, Original!)
	
end if



//
//
//
//string ls_branch
//
//window lw_null
//
//EVENT closequery()
//
//ls_branch = sle_idbranch.text
//
//if ls_branch <> '' then
//	if iw_sql_generator_rate = lw_null then
//		OpenWithParm(iw_sql_generator_rate, ls_branch)
//	end if
//	
//	iw_sql_generator_rate.SetFocus()
//	iw_sql_generator_rate.em_branch.text = ls_branch
//	iw_sql_generator_rate.em_branch.EVENT modified()
//	iw_sql_generator_rate.cb_one.TriggerEvent('clicked')
//end if


end event

type cbx_selectall from checkbox within w_rate_group_agent
integer x = 146
integer y = 640
integer width = 343
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select"
end type

event clicked;INTEGER l_isSelect, l_fila


IF cbx_selectAll.checked THEN
	l_isSelect = 1	
ELSE
	l_isSelect = 0	
END IF


FOR l_fila = 1 TO dw_1.RowCount()
	dw_1.SetItem(l_fila,'isselected', l_isSelect)	
NEXT
end event

type st_6 from statictext within w_rate_group_agent
integer x = 32
integer y = 492
integer width = 402
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
string text = "Replicar:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_rate_group_agent
integer x = 288
integer y = 420
integer width = 402
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Origen:"
boolean focusrectangle = false
end type

type cbx_borrar_destino from checkbox within w_rate_group_agent
integer x = 608
integer y = 508
integer width = 453
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Borrar destino"
end type

event clicked;INTEGER l_isSelect, l_fila


IF cbx_selectAll.checked THEN
	l_isSelect = 1	
ELSE
	l_isSelect = 0	
END IF


FOR l_fila = 1 TO dw_1.RowCount()
	dw_1.SetItem(l_fila,'isselected', l_isSelect)	
NEXT
end event

type sle_branch_origen from singlelineedit within w_rate_group_agent
integer x = 274
integer y = 480
integer width = 265
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 31318783
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_destino from singlelineedit within w_rate_group_agent
event ue_teclas pbm_dwnitemchange
event preuba pbm_dwnitemchange
integer x = 1193
integer y = 488
integer width = 3552
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 30665950
textcase textcase = upper!
integer limit = 400
borderstyle borderstyle = stylelowered!
end type

event ue_teclas;//
//STRING s_datos
//STRU_PARAMETROS stru_parametros
//
//LONG l_prueba
//
//KEYCODE l_prueba2
//
//l_prueba = keyflags
//l_prueba2 = key
//
messageBox("Advertencia dw",data)
///*
//IF key = ',' THEN
//	
//	
//	s_datos = sle_destino.text	
//	stru_parametros = f_string_comma_to_structure(s_datos)
//	
//	IF UpperBound(stru_parametros.String) > 50 THEN
//		
//		messageBox("Advertencia","No se pueden ingresar mas de 50 agencias")
//		return 2
//	END IF
//	
//	
//END IF
//
//*/
//return 1
end event

event preuba;//
//STRING s_datos
//STRU_PARAMETROS stru_parametros
//
//LONG l_prueba
//
//KEYCODE l_prueba2
//
//l_prueba = keyflags
//l_prueba2 = key
//
messageBox("Advertencia dw",data)
///*
//IF key = ',' THEN
//	
//	
//	s_datos = sle_destino.text	
//	stru_parametros = f_string_comma_to_structure(s_datos)
//	
//	IF UpperBound(stru_parametros.String) > 50 THEN
//		
//		messageBox("Advertencia","No se pueden ingresar mas de 50 agencias")
//		return 2
//	END IF
//	
//	
//END IF
//
//*/
//return 1
end event

event modified;
STRING s_datos
STRU_PARAMETROS stru_parametros
LONG l_fila


pb_send_rate_report1.enabled = true
pb_send_rate_report.enabled = true
pb_publish_rates1.enabled = true
pb_publish_rates.enabled = true



s_datos = sle_destino.text

stru_parametros = f_string_comma_to_structure(s_datos)
sle_destino.text = ''

FOR l_fila = 1 TO UpperBound(stru_parametros.String) 
	
	IF Pos(sle_destino.text ,stru_parametros.String[l_fila] ) = 0 THEN
			
		IF l_fila = 1 THEN
			sle_destino.text = stru_parametros.String[l_fila]
		ELSE
			sle_destino.text =sle_destino.text+ ',' + stru_parametros.String[l_fila]
		END IF
			
	END IF
	
NEXT
	

end event

type st_8 from statictext within w_rate_group_agent
integer x = 1198
integer y = 420
integer width = 402
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Destino:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_rate_group_agent
integer x = 4750
integer y = 480
integer width = 187
integer height = 100
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\ViamericasMT\Imagenes\btn-siguiente.gif"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Copiar tasas de origen a destino"
end type

event clicked;STRING s_datos, s_branch, s_branch_recuperado
STRU_PARAMETROS stru_parametros
INTEGER i_delete, l_fila, l_reg_procesar

BOOLEAN b_reemplaza = true

s_datos = sle_destino.text

if Len(s_datos) = 0 THEN
	messagebox('Advertencia','No se han ingresado datos en el campo destino')
	return
END IF

dw_resultado.Reset()

stru_parametros = f_string_comma_to_structure(s_datos)


stru_parametros = wf_verificar_location(stru_parametros)

IF cbx_borrar_destino.checked THEN
	i_delete = 1
ELSE
	i_delete = 0
END IF

fn_copy_rates(stru_parametros,i_delete)


end event

type cb_1 from commandbutton within w_rate_group_agent
integer x = 599
integer y = 612
integer width = 699
integer height = 92
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ajustar nuevo Type Rate"
end type

event clicked;STRU_PARAMETROS stru_parametros
LONG l_fila, l_dato_ing



DATASTORE ds_datos_param, ds_datos_retorno


ds_datos_param = CREATE DATASTORE
ds_datos_retorno = CREATE DATASTORE

ds_datos_param.dataObject = 'dw_ajustar_tasa'

ds_datos_param.SettransObject(SQLCA)



FOR l_fila = 1 TO dw_1.RowCount()
	
	IF dw_1.GetItemNumber(l_fila,'isselected' ) = 1 THEN
		
		l_dato_ing = ds_datos_param.InsertRow(0)
		
		
		ds_datos_param.SetItem(l_dato_ing,'id_main_branch',dw_1.GetItemString(l_fila,'id_main_branch' ) )
		ds_datos_param.SetItem(l_dato_ing,'id_rate_type' , dw_1.GetItemNumber(l_fila,'id_rate_type' ))		
		
		ds_datos_param.SetItem(l_dato_ing,'id_modo_pago' , dw_1.GetItemString(l_fila,'id_modo_pago' ))
		ds_datos_param.SetItem(l_dato_ing,'id_country_rate', dw_1.GetItemString(l_fila,'id_country_rate' ))
		ds_datos_param.SetItem(l_dato_ing,'id_curreny', dw_1.GetItemString(l_fila,'id_curreny' ))
		
		
		dw_1.SetItem(l_fila,'fila',l_fila )
		ds_datos_param.SetItem(l_dato_ing,'fila', l_fila)		
		
		
	END IF
	
NEXT

IF ds_datos_param.RowCount() = 0 THEN
	MessageBox('Advertencia','No se han seleccionado pagadores a modificar')
	return
END IF

OpenWithParm(w_ajustar_tasa,ds_datos_param)


ds_datos_retorno = Message.PowerObjectParm


if Not(IsValid(ds_datos_retorno)) THEN
	Return
END IF



LONG  l_reg_cambiar, l_reg_encontrado, li_id_rate_type_new,  li_id_rate_type_current

DECIMAL ld_increase, ld_rate


FOR l_fila = 1 TO  ds_datos_retorno.RowCount()

	l_reg_cambiar = ds_datos_retorno.GetItemNumber(l_fila,'fila')
	
	l_reg_encontrado = dw_1.Find('fila = '+ String(l_reg_cambiar),1, dw_1.RowCount())	
	
	li_id_rate_type_current = dw_1.GetItemNumber(l_fila,'id_rate_type')
	 
	li_id_rate_type_new =ds_datos_retorno.GetItemNumber(l_fila,'future_rate_type')
	
	if Not(isnull(li_id_rate_type_new) or li_id_rate_type_current =  li_id_rate_type_new) then
//		dw_1.setitem(l_reg_encontrado,"temp_rate_mod",0)
//	else			

		ld_increase = dw_1.getitemnumber(l_reg_encontrado,"temp_rate_mod")
		
		if isnull(ld_increase) then ld_increase = 0		

		 ld_rate =ds_datos_retorno.GetItemNumber(l_fila,'future_rate')			
		
		dw_1.setitem(l_reg_encontrado,"rate",ld_rate+ld_increase)	
		dw_1.setitem(l_reg_encontrado,"id_rate_type", li_id_rate_type_new )	
	END IF
NEXT


end event

type st_9 from statictext within w_rate_group_agent
integer x = 3593
integer y = 188
integer width = 352
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
string text = "Vencimiento en "
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fevencimiento from editmask within w_rate_group_agent
integer x = 3973
integer y = 168
integer width = 425
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
boolean dropdowncalendar = true
end type

type pb_send_rate_report1 from commandbutton within w_rate_group_agent
integer x = 1787
integer y = 608
integer width = 672
integer height = 96
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Enviar Reporte de tasas"
end type

event clicked;pb_send_rate_report.TriggerEvent('clicked')
end event

type pb_publish_rates1 from commandbutton within w_rate_group_agent
integer x = 2798
integer y = 608
integer width = 850
integer height = 96
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Publicar en agencias afectadas"
end type

event clicked;pb_publish_rates.TriggerEvent('clicked')
end event

type pb_send_rate_report from picturebutton within w_rate_group_agent
integer x = 2437
integer y = 608
integer width = 110
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "Print!"
alignment htextalign = left!
string powertiptext = "Fax Rates"
end type

event clicked;STRING s_datos, s_rates_back, s_branch
STRU_PARAMETROS stru_parametros
INTEGER i_delete

BOOLEAN b_run = False
LONG l_fila, l_reg

s_datos = sle_destino.text

if Len(s_datos) = 0 THEN
	messagebox('Advertencia','No se han ingresado datos en el campo destino')
	return
END IF

stru_parametros = f_string_comma_to_structure(s_datos)

stru_parametros = wf_verificar_location(stru_parametros)

//EVENT closequery()

s_rates_back = ProfileString('ViaCentral.ini','PARAMETERS','EjecutarBackFAX','')

IF s_rates_back = 'S' THEN
	
	FOR l_fila = 1 TO UpperBound(stru_parametros.String)
		
		
		s_branch = stru_parametros.String[l_fila]
		
		
		SELECT COUNT(1)
		  INTO :l_reg
		FROM  DBA.SEND_INFO_BRANCH A
		WHERE A.ID_BRANCH = :s_branch
		  AND A.PROCESS = 'FAX'
		  AND (A.DATE_PROCESS IS NULL 
			OR A.DATE_PROCESS > GETDATE() - 0.001);
		
		IF l_reg = 0 THEN
			
			b_run = True
			
		INSERT INTO DBA.SEND_INFO_BRANCH
			(ID_BRANCH	,
			PROCESS	,
			USER_APL	,
			DATE_ENTRY	,
			DATE_PROCESS)
		VALUES (:s_branch,
					'FAX',
					:gs_cashier,
					GETDATE(),
					NULL);
		END IF					
	NEXT
	
	IF b_run THEN
		RUN('C:\ViamericasMT\ViaBackGroundProcess.exe ' + gs_cashier + ',FAX',Normal!)
	END IF
	
	MessageBox('Información','El proceso de envío de reporte de tasas se ejecutará en un instante')
	
//	this.enabled = false
//	pb_send_rate_report1.enabled = false
	
ELSE

	OpenSheetWithParm(w_rep_faxrates,stru_parametros,w_principal, 2, Original!)
END IF



end event

type pb_publish_rates from picturebutton within w_rate_group_agent
integer x = 3630
integer y = 608
integer width = 110
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "FormatDollar!"
alignment htextalign = left!
string powertiptext = "Publicar Rates"
end type

event clicked;STRING s_datos, s_rates_back, s_branch
STRU_PARAMETROS stru_parametros
INTEGER i_delete
long l_fila, l_reg

BOOLEAN b_run
s_datos = sle_destino.text

if Len(s_datos) = 0 THEN
	messagebox('Advertencia','No se han ingresado datos en el campo destino')
	return
END IF

stru_parametros = f_string_comma_to_structure(s_datos)

//stru_parametros.String[UpperBound(stru_parametros.String) + 1 ] =  sle_idbranch.text

stru_parametros = wf_verificar_location(stru_parametros)

//EVENT closequery()


s_rates_back = ProfileString('ViaCentral.ini','PARAMETERS','EjecutarBackRATE','')

IF s_rates_back = 'S' THEN
	
	FOR l_fila = 1 TO UpperBound(stru_parametros.String)
		
		
		s_branch = stru_parametros.String[l_fila]
		
		
		SELECT COUNT(1)
		  INTO :l_reg
		FROM  DBA.SEND_INFO_BRANCH A
		WHERE A.ID_BRANCH = :s_branch
		  AND A.PROCESS = 'RATE'
		  AND (A.DATE_PROCESS IS NULL 
			OR A.DATE_PROCESS > GETDATE() - 0.001);
		
		IF l_reg = 0 THEN
			
			b_run = True
		
		
		INSERT INTO DBA.SEND_INFO_BRANCH
			(ID_BRANCH	,
			PROCESS	,
			USER_APL	,
			DATE_ENTRY	,
			DATE_PROCESS)
		VALUES (:s_branch,
					'RATE',
					:gs_cashier,
					GETDATE(),
					NULL);
					
		
		END IF
	NEXT
	
	IF b_run THEN
		RUN('C:\ViamericasMT\ViaBackGroundProcess.exe ' + gs_cashier + ',RATE',Normal!)
	END IF
	MessageBox('Información','El proceso de publicación de tasas se ejecutará en un instante' )
	
//	this.enabled = false
//	pb_publish_rates1.enabled = false
	
ELSE

	OpenSheetWithParm(w_sql_generator_rate,stru_parametros,w_principal, 2, Original!)
END IF













//
//string ls_branch
//
//window lw_null
//
//EVENT closequery()
//
//ls_branch = sle_idbranch.text
//
//if ls_branch <> '' then
//	if iw_sql_generator_rate = lw_null then
//		OpenWithParm(iw_sql_generator_rate, ls_branch)
//	end if
//	
//	iw_sql_generator_rate.SetFocus()
//	iw_sql_generator_rate.em_branch.text = ls_branch
//	iw_sql_generator_rate.em_branch.EVENT modified()
//	iw_sql_generator_rate.cb_one.TriggerEvent('clicked')
//end if


end event

type cb_4 from commandbutton within w_rate_group_agent
integer x = 4114
integer y = 388
integer width = 823
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Listar Agencias del Chain"
end type

event clicked;	
STRING is_id_chain,ls_branch, ls_agencies
BOOLEAN lb_IsFirst = True

ls_branch = sle_idbranch.text


IF Len(ls_branch) = 0 THEN
	MessageBox('Advertencia','No se han seleccionadoninguna agencia' )
	return
END IF

DECLARE cur_agencies_by_chain CURSOR FOR
SELECT B.ID_BRANCH
FROM DBA.BRANCH B
WHERE B.ID_BRANCH LIKE 'A%'
     AND B.ID_STATUS_BRANCH = 'O'
     AND EXISTS (	SELECT 1
				FROM DBA.BRANCH BI
				WHERE BI.ID_BRANCH = :ls_branch
				  AND BI.ID_CHAIN = B.ID_CHAIN);

OPEN cur_agencies_by_chain;

FETCH cur_agencies_by_chain INTO :ls_agencies;

ls_agencies = Trim(ls_agencies)

DO WHILE SQLCA.SQLCODE = 0 
	
	IF  ls_agencies <> ls_branch AND Pos(sle_destino.text, ls_agencies) = 0 THEN
	
		IF lb_IsFirst THEN
			
			IF Len(trim(sle_destino.text)) = 0 THEN
				sle_destino.text = Trim(ls_agencies)
			ELSE
				
			
				IF mid(sle_destino.text,len(sle_destino.text)) = ',' THEN
					sle_destino.text = trim(sle_destino.text) + Trim(ls_agencies)
				ELSE
					sle_destino.text = trim(sle_destino.text) + ','+Trim(ls_agencies)
				END IF
		
			END IF
			lb_IsFirst = false
			
		ELSE	

			sle_destino.text = trim(sle_destino.text) + ','+Trim(ls_agencies)

		END IF
	END IF
	FETCH cur_agencies_by_chain INTO :ls_agencies;	
LOOP

CLOSE cur_agencies_by_chain;
end event

type gb_1 from groupbox within w_rate_group_agent
integer x = 9
integer width = 2139
integer height = 392
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

type gb_2 from groupbox within w_rate_group_agent
integer x = 2167
integer width = 3305
integer height = 388
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operaciones en Lote"
end type

type dw_resultado from datawindow within w_rate_group_agent
boolean visible = false
integer x = 1536
integer y = 848
integer width = 2400
integer height = 1188
integer taborder = 130
boolean bringtotop = true
boolean titlebar = true
string title = "Resultado proceso"
string dataobject = "d_resultado_proceso"
boolean controlmenu = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_rate_group_agent
integer x = 3977
integer y = 100
integer width = 402
integer height = 52
boolean bringtotop = true
integer transparency = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "MM/DD/YYYY"
boolean focusrectangle = false
end type

type dw_type_currency from datawindow within w_rate_group_agent
boolean visible = false
integer x = 2208
integer y = 752
integer width = 1088
integer height = 1188
integer taborder = 140
boolean bringtotop = true
boolean titlebar = true
string title = "Seleccionar Type Rate"
string dataobject = "dddw_rate_type_parameters"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event doubleclicked;
DECIMAL ld_increase, ld_rate
LONG ll_type_rate

IF row = 0 THEN
	RETURN
END IF

ld_increase = dw_1.getitemnumber(il_fila_selec,"temp_rate_mod")


ld_rate = this.getitemDecimal(row,"rate")

ll_type_rate = this.getitemDecimal(row,"id_rate_type")
		
	// Actualiza el RATE de acuerdo al RATE_TYPE y al INCREMENTO	
//	SELECT rate
//	  INTO :ld_rate
//	  FROM dba.RATE_TYPE
//	 WHERE id_rate_type = :li_id_rate_type;
			
if isnull(ld_increase) then ld_increase = 0

dw_1.setitem(il_fila_selec,"rate",ld_rate+ld_increase)	

dw_1.setitem(il_fila_selec,"id_rate_type",ll_type_rate)	

this.visible = false
end event

event clicked;

If row = 0 THEN
	
	RETURN
	
END IF

This.SelectRow(0, false)
This.SelectRow(row, true)
end event

event losefocus;dw_type_currency.visible = false
end event

type cbx_traer_inactivos from checkbox within w_rate_group_agent
integer x = 265
integer y = 316
integer width = 750
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29751797
string text = "Incluir pagadores inactivos"
boolean checked = true
end type

event clicked;fn_filterdatawindow();
end event

