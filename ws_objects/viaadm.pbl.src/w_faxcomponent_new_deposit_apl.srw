$PBExportHeader$w_faxcomponent_new_deposit_apl.srw
forward
global type w_faxcomponent_new_deposit_apl from w_faxcomponent
end type
type st_8 from statictext within w_faxcomponent_new_deposit_apl
end type
type sle_idbranch from singlelineedit within w_faxcomponent_new_deposit_apl
end type
type st_10 from statictext within w_faxcomponent_new_deposit_apl
end type
type sle_description from singlelineedit within w_faxcomponent_new_deposit_apl
end type
type st_11 from statictext within w_faxcomponent_new_deposit_apl
end type
type em_deposit from editmask within w_faxcomponent_new_deposit_apl
end type
type st_12 from statictext within w_faxcomponent_new_deposit_apl
end type
type pb_2 from picturebutton within w_faxcomponent_new_deposit_apl
end type
type pb_1 from picturebutton within w_faxcomponent_new_deposit_apl
end type
type dw_revision_info from datawindow within w_faxcomponent_new_deposit_apl
end type
type dw_deposits from datawindow within w_faxcomponent_new_deposit_apl
end type
type em_name_branch from editmask within w_faxcomponent_new_deposit_apl
end type
type uo_1 from uo_segmentation within w_faxcomponent_new_deposit_apl
end type
type dw_bank_information from datawindow within w_faxcomponent_new_deposit_apl
end type
type dw_2 from datawindow within w_faxcomponent_new_deposit_apl
end type
type p_alert from picture within w_faxcomponent_new_deposit_apl
end type
type lst_deposit_mode from my_ddlb within w_faxcomponent_new_deposit_apl
end type
type gb_5 from groupbox within w_faxcomponent_new_deposit_apl
end type
type rr_1 from roundrectangle within w_faxcomponent_new_deposit_apl
end type
type rr_2 from roundrectangle within w_faxcomponent_new_deposit_apl
end type
type dw_archivos from datawindow within w_faxcomponent_new_deposit_apl
end type
type st_9 from statictext within w_faxcomponent_new_deposit_apl
end type
type st_filename from statictext within w_faxcomponent_new_deposit_apl
end type
type pb_previos_option from picturebutton within w_faxcomponent_new_deposit_apl
end type
end forward

global type w_faxcomponent_new_deposit_apl from w_faxcomponent
integer width = 5019
integer height = 2316
string title = "Pay Agencies"
event ue_postopen ( )
st_8 st_8
sle_idbranch sle_idbranch
st_10 st_10
sle_description sle_description
st_11 st_11
em_deposit em_deposit
st_12 st_12
pb_2 pb_2
pb_1 pb_1
dw_revision_info dw_revision_info
dw_deposits dw_deposits
em_name_branch em_name_branch
uo_1 uo_1
dw_bank_information dw_bank_information
dw_2 dw_2
p_alert p_alert
lst_deposit_mode lst_deposit_mode
gb_5 gb_5
rr_1 rr_1
rr_2 rr_2
dw_archivos dw_archivos
st_9 st_9
st_filename st_filename
pb_previos_option pb_previos_option
end type
global w_faxcomponent_new_deposit_apl w_faxcomponent_new_deposit_apl

type variables
LONG il_fila_archivo = 0
end variables

forward prototypes
public subroutine f_cargar_archivos_dw ()
public subroutine fn_selectitem (long pl_row_selected)
public function string f_buscar_idbranch_phone (string ps_phone)
public subroutine f_rectivar_agencia (string ps_idbranch)
public subroutine f_limpiar_pantalla ()
public subroutine f_cargar_segmentacion (string ps_idbranch, long pl_fila)
public subroutine f_retrieve_agency_info (string ps_idbranch, string ps_opcion)
public function boolean f_validar_fecha_transaccion (string ps_mensaje)
public subroutine f_llenar_descripcion ()
public function DateTime f_modify_file (string as_filename)
public function string fn_get_file_ext (string as_file_name)
public subroutine fn_ajustarscreen (string s_file_name)
end prototypes

event ue_postopen();

f_cargar_archivos_dw()




dw_2.reset()
dw_2.enabled = True
dw_2.insertrow(0)
end event

public subroutine f_cargar_archivos_dw ();integer li_items, li_row, li_i
Long l_segmentation_color
string  ls_filename, ls_faxbranch, s_name_branch, s_phone, s_deposit_mode

DECIMAL ldc_valor


dw_archivos.SetRedraw(FALSE)

lb_faxes.DirList(is_faxpath + "*.*", 0)
sle_selected.text = "[No Fax Selected]"


dw_archivos.Reset()
dw_archivos.InsertRow(0)
dw_archivos.object.filename[1] = '[ - NO IMAGE - ]'
dw_archivos.object.ordersegment[1] = 0



li_items = lb_faxes.TotalItems()
For li_i = 1 To li_items
	li_row = dw_archivos.InsertRow(0)
	
	ls_filename =  lb_faxes.Text( li_i ) 
	dw_archivos.object.filename[li_row] = ls_filename
	ls_faxbranch = ''
	ldc_valor = 0
	
	
	IF   Upper(left(ls_filename,7)) = 'DEPOSIT' THEN
		
		IF Upper(Mid(ls_filename,9,1)) = 'A' THEN
			
			ls_faxbranch = Upper(Mid(ls_filename,9,6))						
			
			ldc_valor = dec(Mid(ls_filename,Pos( ls_filename,'_AMT=') + 5, Pos( ls_filename,'_',Pos( ls_filename,'_AMT=') +1  )-5 - Pos( ls_filename,'_AMT='))) /100
			
			IF ldc_valor = 0 THEN
				ldc_valor = dec(Mid(ls_filename,Pos( ls_filename,'_AMO=') + 5, Pos( ls_filename,'_',Pos( ls_filename,'_AMO=') +1  )-5 - Pos( ls_filename,'_AMO='))) /100
			END IF
			
			IF ldc_valor = 0 THEN
				ldc_valor = dec( Mid(ls_filename,Pos( ls_filename,ls_faxbranch ) + 7, Pos( ls_filename,'_',16 ) - 16 )     ) /100
			END IF
			
			s_deposit_mode =  Mid(ls_filename,Pos( ls_filename,'_TYPE=' ) + 6, Pos( ls_filename,'_',Pos( ls_filename,'TYPE=' )     )-6 - Pos( ls_filename,'_TYPE=' ))
			
			//DEPOSIT_A00100_VIAMOBI_AMT=5252_AMO=OCR_TYPE=TP_de8e5353-8916-48e1-abbd-5b9d52f3b503 - Copy			
			//C:\FILES\DEPOSIT_A13206_2260775_1_20210329074000_IMAGE.JPG			
			//ct18006943398-20210512122153885-183-5_18636825322_1_18006943398
	
			
		END IF
		
	ELSE
		
		IF Upper(left(ls_filename,2)) = 'CT' THEN
			
			s_phone = Mid(ls_filename,Pos( ls_filename,'_' )+2 ,10)
			ls_faxbranch = f_buscar_idbranch_phone(s_phone)
			
		END IF
		
	END IF
	
	
	IF len(ls_faxbranch) > 0 THEN 				
		f_cargar_segmentacion(ls_faxbranch,li_row)	
	ELSE
		dw_archivos.object.ordersegment[li_row] = 99
	END IF	
	
	dw_archivos.object.deposit_value[li_row] = ldc_valor
	dw_archivos.object.deposit_mode[li_row] = s_deposit_mode
		

Next
dw_archivos.sort()
dw_archivos.SetRedraw(TRUE)
dw_archivos.SelectRow(0, false)
dw_archivos.SelectRow(1, true)
il_fila_archivo = 1
end subroutine

public subroutine fn_selectitem (long pl_row_selected);String ls_idbranchFax, ls_faxname, ls_faxnumber, s_status, s_sourse, s_deposit_mode, s_modificacion
DATETIME dt_date_transaction

DECIMAL dc_deposit_value, dc_deposit_review
LONG l_id_log_review

TRY
	
	ls_faxname =  dw_archivos.GetItemString(pl_row_selected,'filename' )
		
	sle_selected.text = ls_faxname
	
	f_limpiar_pantalla()
	
	st_filename.text = ls_faxname
	
	dw_archivos.SelectRow(0, false)
	dw_archivos.SelectRow(pl_row_selected, true)
	il_fila_archivo = pl_row_selected
	
	
	IF ls_faxname = '[ - NO IMAGE - ]' THEN
				
		RETURN		
		
	END IF
	
 	lb_faxes.SelectItem ( ls_faxname, 1 )
	
	dw_revision_info.Visible = true
	
	if not fileexists(is_faxpath+ ls_faxname ) then
		MessageBox("Error","The file was already moved",StopSign!)
		cb_refresh.triggerEvent(Clicked!)
		return
	end if	

	
	
	
	ole_fax1.SetRedraw(false)
	fn_loadfax(is_faxpath+ls_faxname)	
	//fn_ajustscreen()
	fn_ajustarscreen(is_faxpath+ls_faxname)
	ole_fax1.SetRedraw(true)	

	// <><><><><><><><><><><><><><><><><><><><><><><><><><><><>
	// 05/24/2013 -> filter the orders base on the fax caller id
	

	
	ls_idbranchFax = ""
	ls_receiver = ""
	
	
	ls_idbranchFax =  dw_archivos.GetItemString(pl_row_selected,'idBranch' )
	dc_deposit_value =  dw_archivos.GetItemDecimal(pl_row_selected,'deposit_value' )
	
	s_deposit_mode =  dw_archivos.GetItemString(pl_row_selected,'deposit_mode' )
	
	lst_deposit_mode.setselectedid(s_deposit_mode )
	
	sle_idBranch.Text = ls_idbranchFax
	sle_id_branch.text = ls_idbranchFax
	em_deposit.text = String(dc_deposit_value)
	
	
	
	
	STRING ls_faxname_consulta
	LONG l_time_process
	
	ls_faxname_consulta = '%' + mid(ls_faxname,1,pos(ls_faxname,'.',(len(ls_faxname)-4) )-1) + '%'
	

	SetNull(dt_date_transaction)

	SELECT ICS.REVIEW_STATUS,
				ICR.SOURCE,
				ICR.DATE_TRANSACTION,
				DATEDIFF ( minute , ICR.DATE_TRANSACTION , GETDATE() )  TIMEPROC,
				ICR.ID_LOG,
				ICR.DEPOSIT_AMOUNT
		INTO :s_status,
			  :s_sourse,
			  :dt_date_transaction,
			  :l_time_process,
			  :l_id_log_review,
			  :dc_deposit_review
	FROM Credit.INSTANT_CREDIT_MANUAL_REVIEW ICR,
		 Credit.INSTANT_CREDIT_REVIEW_STATUS ICS 
	WHERE ICR.ID_REVIEW_STATUS = ICS.ID_REVIEW_STATUS
	  AND ICR.DATE_TRANSACTION > GETDATE()-140
	  AND ICR.ID_BRANCH = :ls_idbranchFax
	  /* AND ICR.DOCUMENT_PATH LIKE :ls_faxname_consulta */
	  AND :ls_faxname_consulta LIKE ICR.DOCUMENT_PATH + '%';

	  
	dw_revision_info.reset()
	dw_revision_info.InsertRow(0)
	
	
	IF l_id_log_review = 0 THEN
		dt_date_transaction = f_modify_file('U:\Accounting\'+ls_faxname)
		
		SELECT TOP 1 DATEDIFF ( minute , :dt_date_transaction , GETDATE() )  TIMEPROC	
			INTO  :l_time_process
		FROM dba.PARAMETROS;
		
		s_sourse = mid (ls_faxname_consulta,17, pos(ls_faxname_consulta,'_',17) -17   )
		
		IF s_sourse <> 'VIAMOBI' AND s_sourse <> 'EMAIL'  AND s_sourse <> 'SMS'  AND s_sourse <> 'FAX' AND s_sourse <> 'VIATAB' AND s_sourse <> 'MYVIA' THEN
			s_sourse = 'OTHER'
		END IF
				
		s_status = 'OTHER SYSTEM'


	END IF
				
	
	dw_revision_info.SetItem(1,'date_received',dt_date_transaction)	
	dw_revision_info.SetItem(1,'source',  s_sourse )
	dw_revision_info.SetItem(1,'reason',  s_status )
	dw_revision_info.SetItem(1,'timeprocess',  String(l_time_process))
	
	dw_archivos.SetItem(pl_row_selected,'id_log_review',  l_id_log_review )
	
	IF (dc_deposit_review > 0 and dc_deposit_review <> dc_deposit_value and dc_deposit_value > 0) THEN
		p_alert.Visible = True
		em_deposit.TextColor = RGB(255,0,0)		
		
	ELSE
		em_deposit.TextColor = RGB(0,0,0)
		p_alert.Visible = false
	END IF
	
		
	f_retrieve_agency_info(ls_idbranchFax,'SELECTION' )
	

	
	f_llenar_descripcion()

	
CATCH (runtimeerror er)   

   MessageBox("Runtime Error",'File name may contain special characters ' +  er.GetMessage())

	
END TRY 
end subroutine

public function string f_buscar_idbranch_phone (string ps_phone);STRING s_branch, ls_faxnumber, ls_faxbranch


ls_faxnumber = ps_phone

if len(ls_faxnumber)>9 then

	select b.id_branch
	into :ls_faxbranch 
	from dba.BRANCH b, dba.TIPO_TRANSMISION_AGENCIA x
	where x.ID_BRANCH = b.ID_BRANCH 
	and id_status_branch = 'O'
	and (b.FAX_BRANCH = :ls_faxnumber  or :ls_faxnumber = b.PHONE2_BRANCH or :ls_faxnumber = b.PHONE1_BRANCH )
	order by id_flag_branch;
	
	Return ls_faxbranch

end if

		
//
//select b.id_branch
//into :ls_faxbranch 
//from dba.faxprotocol f, dba.BRANCH b, dba.TIPO_TRANSMISION_AGENCIA x
//where x.ID_BRANCH = b.ID_BRANCH 
//and right(f.faxnumber,10) = b.FAX_BRANCH 
//and FaxId = :ls_faxnumber
//and id_status_branch = 'O'
//order by id_flag_branch;
//
//IF not isnull(ls_faxbranch) THEN
//	RETURN ls_faxbranch
//
//END IF


// busca si llego desde phone2
//select b.id_branch
//into :ls_faxbranch 
//from dba.faxprotocol f, dba.BRANCH b, dba.TIPO_TRANSMISION_AGENCIA x
//where x.ID_BRANCH = b.ID_BRANCH 
//and right(f.faxnumber,10) = b.PHONE2_BRANCH 
//and FaxId = :ls_faxname
//and id_status_branch = 'O'
//order by id_flag_branch;
	
//if not isnull(ls_faxbranch) then
//	RETURN ls_faxbranch
//END IF
//
// busca si llego desde phone1
//select b.id_branch
//into :ls_faxbranch 
//from dba.faxprotocol f, dba.BRANCH b, dba.TIPO_TRANSMISION_AGENCIA x
//where x.ID_BRANCH = b.ID_BRANCH 
//and right(f.faxnumber,10) = b.PHONE1_BRANCH 
//and FaxId = :ls_faxname
//and id_status_branch = 'O'
//order by id_flag_branch;
			
RETURN ls_faxbranch
	


end function

public subroutine f_rectivar_agencia (string ps_idbranch);
STRING s_error


UPDATE dba.SENDCREDITTOBRANCH 
	SET ID_FLAG_BRANCH = 'A'
 WHERE id_branch = :ps_idBranch;	
 

IF SQLCA.SQLCODE <> 0 THEN
	s_error = SQLCA.SQLERRTEXT
	ROLLBACK;
	MessageBox("Error","Error updating status SENDCREDITTOBRANCH.~r~n Error: "+s_error,StopSign!)
	Return
END IF


UPDATE dba.branch 
	SET id_flag_branch = 'A',
		 last_status_comment = 'Reactivación desde depósito'
 WHERE id_branch = :ps_idBranch;	

IF SQLCA.SQLCODE <> 0 THEN
	s_error = SQLCA.SQLERRTEXT
	ROLLBACK;
	MessageBox("Error","Error updating status.~r~n Error: "+s_error,StopSign!)
	Return
END IF

COMMIT;


f_publish_branch(ps_idBranch)

Messagebox("Process Completed","Status has been changed and sent to the agency!")
end subroutine

public subroutine f_limpiar_pantalla ();
//f_cargar_archivos_dw()
dw_revision_info.Reset()
dw_revision_info.InsertRow(0)
dw_2.Reset()
dw_2.InsertRow(0)
sle_idBranch.Text = ''
sle_id_branch.text = ''
em_deposit.text = '0'
dw_revision_info.Visible = false
uo_1.uof_clear()

lst_deposit_mode.setselectedid('' )
st_filename.text = ''

em_name_branch.Text=''
dw_bank_information.Reset()
dw_bank_information.InsertRow(0)
dw_bank_information.Object.reconciliationdate.Color = 0

sle_description.Text = 'DIRECT'

f_validar_fecha_transaccion('N')

dw_deposits.Reset()
em_deposit.TextColor = RGB(0,0,0)
p_alert.Visible = false

//dw_bank_information.settaborder(5,1) //Reconciliation Date
//dw_bank_information.settaborder(2,10) //El Banco
//dw_bank_information.settaborder(3,20) //La cuenta
//dw_bank_information.settaborder(2,1) 

ole_fax1.object.FileName = ""
st_res.text = ''

end subroutine

public subroutine f_cargar_segmentacion (string ps_idbranch, long pl_fila);STRING s_segmentation_id, s_name_branch,s_status_branch
LONG l_segmentation_color, l_segment_order


setNull(l_segmentation_color)

SELECT Isnull(S.ID_SEGMENTATION ,'N') ID_SEGMENTATION,
			S.SEGMENTATION_COLOR,
			B.NAME_BRANCH,
			IsNull(S.SEGMENTATION_ORDER,99),
			id_flag_branch
	INTO  :s_segmentation_id,
		  :l_segmentation_color,
		  :s_name_branch,
		  :l_segment_order,
		  :s_status_branch
FROM dba.BRANCH B
	 LEFT JOIN dba.AGENCY_SEGMENTATION S ON B.IS_VIP = S.ID_SEGMENTATION
WHERE B.ID_BRANCH =:ps_idbranch;	


IF l_segment_order = 0 THEN
	l_segment_order = 99
END IF
	
dw_archivos.object.segment[pl_fila] = s_segmentation_id
dw_archivos.object.idbranch[pl_fila] = ps_idbranch
dw_archivos.object.namebranch[pl_fila] =s_name_branch
dw_archivos.object.colorsegment[pl_fila] =l_segmentation_color
dw_archivos.object.branchstatus[pl_fila] = s_status_branch
dw_archivos.object.ordersegment[pl_fila] = l_segment_order
end subroutine

public subroutine f_retrieve_agency_info (string ps_idbranch, string ps_opcion);

String	ls_branch, ls_grupo, ls_depositcode, ls_idbanco, ls_idcuenta, s_name_branch

DATETIME dt_date_transaction
DECIMAL dc_deposit_value

IF len(ps_idbranch) < 6 THEN
	f_limpiar_pantalla()
	RETURN
END IF
	


//IF ps_opcion = 'AGENCY' AND dw_archivos.GetItemString(il_fila_archivo,'filename' ) <> '[ - NO IMAGE - ]' THEN
//	fn_selectitem(1)	
//	sle_idbranch.text = ps_idbranch
//END IF


SELECT dba.branch.id_main_branch, NAME_BRANCH  
 INTO :ls_grupo , :s_name_branch
 FROM dba.branch  
WHERE dba.branch.id_branch = :ps_idbranch   ;


dw_2.setitem(1,"id_group",ls_grupo)
em_name_branch.text = s_name_branch	

		
dw_deposits.Retrieve(relativedate(today(),-30),ls_grupo)




//IF dw_archivos.GetItemString(il_fila_archivo,'filename' ) <> '[ - NO IMAGE - ]' THEN
	
	IF dw_deposits.RowCount() > 0 THEN
		dw_deposits.SetRedraw(FALSE)
		dt_date_transaction =  dw_bank_information.GetItemDateTime(1,'reconciliationdate' )
		dc_deposit_value =  Dec(em_deposit.text)//dw_archivos.GetItemDecimal(il_fila_archivo,'deposit_value' )	
		
		
		
		dw_deposits.SetItem(1,'fearchivo',dt_date_transaction)
		
		dw_deposits.SetItem(1,'deposit_archivo',dc_deposit_value)
		dw_deposits.AcceptText()
		
		dw_deposits.SetRedraw(TRUE)
		
	END IF
//END IF

uo_1.uof_query(ps_idbranch)



if isnull(ls_grupo) or len(trim(ls_grupo)) < 1 then 
	sle_idbranch.TextColor = RGB(255,0,0)
else
	sle_idbranch.TextColor = RGB(0,0,0)
end if	


/***********csarmiento: same behavio as the lookup button *********************/
/**requested by Joel Silva , Wednesday, May 28, 2014 12:09 PM
I would like to request a change in Viacentral that would help reduce mistakes being made by the accounting staff when deposits are made. 
The printscreen is where deposits are made by accounting.  The Bank is a dropdown which currently the agent can select any bank
and leaves room for error.  I would like to have this automatically populate from the information that is currently housed in the Group Branch-Financial Profile

**/


select fin_depdepositcode
	into :ls_depositcode
 from dba.group_branch  (nolock)
 where id_main_branch = :ls_grupo ;

if ls_depositcode <> 'none' and ls_depositcode <> '' then	
	
	
//	dw_bank_information.settaborder(2,0) //El Banco
//	dw_bank_information.settaborder(3,0) //La cuenta
//	dw_bank_information.settaborder(4,0) //The deposit code
//	dw_bank_information.settaborder(5,10) //Reconciliation Date

	// --------------------------------------------
	// Remueve filtro Cuentas
	DataWindowChild	ldw_dw
	dw_bank_information.GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("")
	ldw_dw.Filter()
	// --------------------------------------------	
	
	//---------------------------------------------
	//Remueve filttro Deposit Codes
	DataWindowChild	ldw_dw1
	dw_bank_information.GetChild('deposit_code',ldw_dw)
	ldw_dw1.SetTransObject(SQLCA)
	ldw_dw1.SetFilter("")
	ldw_dw1.Filter()
	// --------------------------------------------	
	
	
	SELECT 	dba.DEPOSIT_CODES.ID_BANCO,   
			dba.DEPOSIT_CODES.ID_CUENTA_BANCO  
	 INTO :ls_idbanco,   
			:ls_idcuenta  
	 FROM dba.BRANCH  (nolock),   
			dba.DEPOSIT_CODES   (nolock)
	WHERE ( dba.DEPOSIT_CODES.ID_BRANCH = dba.BRANCH.ID_BRANCH ) and  
			( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) )   ;
	
	
	dw_bank_information.setitem(dw_bank_information.getrow(),"id_banco",ls_idbanco)
	dw_bank_information.setitem(dw_bank_information.getrow(),"id_cuenta_banco",ls_idcuenta)
	dw_bank_information.setitem(dw_bank_information.getrow(),"deposit_code",ls_depositcode)
	
	
end if


	
end subroutine

public function boolean f_validar_fecha_transaccion (string ps_mensaje);DATETIME  ld_recdate_laboral
DATE ld_recdate_recon
STRING s_business_day

ld_recdate_recon  =Date(dw_bank_information.getitemdatetime(1,"reconciliationdate"))

SELECT dba.sfGetIsBusinessDay(:ld_recdate_recon)
INTO :s_business_day
FROM DBA.DUAL;


IF s_business_day = 'N' THEN
	
	
	dw_bank_information.Object.reconciliationdate.Color = 255
	
	
	
	SELECT dba.sfGetNextBusinessDay(:ld_recdate_recon)
		INTO :ld_recdate_laboral
	FROM DBA.DUAL;
	
	IF ps_mensaje = 'S' THEN
		IF messageBox('Información','La fecha selecionada: '+ String(ld_recdate_recon) + ' no es un dia laboral, Desea cambiarla a:  ' + String(Date(ld_recdate_laboral)) , Question! , YesNo! ) = 1 THEN
			ld_recdate_recon = Date(ld_recdate_laboral)
			dw_bank_information.setitem(1,"reconciliationdate", ld_recdate_recon)
			dw_bank_information.Object.reconciliationdate.Color = 0
		ELSE
			RETURN False
		END IF
	END IF
END IF

dw_deposits.SetRedraw(FALSE)	
dw_deposits.SetItem(1,'fearchivo',ld_recdate_recon)
dw_deposits.AcceptText()
dw_deposits.SetRedraw(TRUE)

RETURN True
end function

public subroutine f_llenar_descripcion ();
DATETIME ld_recdate

STRING s_deposit_mode, ls_des, s_source

ld_recdate  =dw_bank_information.getitemdatetime(1,"reconciliationdate")

s_deposit_mode =  lst_deposit_mode.getdataid()


s_source = dw_revision_info.GetItemString(1,'source')

IF IsNull(s_source) THEN
	s_source = ''
END IF

ls_des = s_source+ ' DIRECT '+s_deposit_mode+'  '+string(ld_recdate,"MM-DD-YYYY")
sle_description.text = ls_des
end subroutine

public function DateTime f_modify_file (string as_filename);String ls_path, ls_file, ls_test
DateTime ldt_ret

OLEObject obj_shell, obj_folder, obj_item
 
obj_shell = CREATE OLEObject
obj_shell.ConnectToNewObject( 'shell.application' )
 
ls_path = Left( as_filename, LastPos( as_filename, "\" ) )
ls_file = Mid( as_filename, LastPos( as_filename, "\" ) + 1 )
 
IF FileExists( as_filename ) THEN
    obj_folder = obj_shell.NameSpace( ls_path )
    
    IF IsValid( obj_folder ) THEN
        obj_item = obj_folder.ParseName( ls_file )
        
        IF IsValid( obj_item ) THEN
            ls_test = obj_folder.GetDetailsOf( obj_item, 3 )
        END IF
    END IF
END IF
 
DESTROY obj_shell
DESTROY obj_folder
DESTROY obj_item


ldt_ret = DateTime(ls_test)
 
RETURN ldt_ret
end function

public function string fn_get_file_ext (string as_file_name);String ls_file_ext, ls_sec_string
integer li_ext_pos, li_file_len
    
li_ext_pos = POS(as_file_name, '.')

li_file_len = len(as_file_name)

ls_file_ext = Mid(as_file_name, li_ext_pos, li_file_len)

ls_sec_string = mid(ls_file_ext,2,len(ls_file_ext))

li_ext_pos = POS(ls_sec_string, '.')

IF li_ext_pos > 0 THEN 
	ls_file_ext =  fn_get_file_ext(ls_sec_string)
END IF

return ls_file_ext

end function

public subroutine fn_ajustarscreen (string s_file_name);string ls_ext
// after loading a fax, this ajust the screen

///ole_fax1.SetRedraw(false)
///ole_fax1.visible = false

//sle_selected.text = 
sle_newname.text = sle_selected.text 

ls_ext = fn_get_file_ext(s_file_name)

IF upper(ls_ext) = ".TIF" OR upper(ls_ext) = ".TIFF" OR upper(ls_ext) = ".PDF"  THEN
	sle_pos.text = String(ll_curpage)+"/"+string(ole_fax1.object.GetTotalPage() )
ELSE
	sle_pos.text = "1/1"
END IF
	
// >>>>>>>>>>>>>>>>>>>>>>>>>>>
// Color Number of pages		
if ole_fax1.object.GetTotalPage() > 1 then 
	sle_pos.TextColor	= RGB(0,120,0)	
	pb_separate.enabled = true
	pb_previous.enabled = true
	pb_next.enabled = true
else
	sle_pos.TextColor	= RGB(0,0,0)	
	pb_separate.enabled = false
	pb_previous.enabled = false
	pb_next.enabled = false
end if

//	// >>>>>>>>>>>>>>>>>>>>>>>>>>>

htb_zoom.position = 50

// ole_fax1.object.View OPTIONS:
// 1  - 25% image size of original image
// 2  - 33% image size of original image
// 3  - 50% image size of original image
// 4  - 75% image size of original image
// 5  - 100% image size of original image
// 6  - 150% image size of original image
// 7  - 200% image size of original image
// 8  - User define view mode , After select this mode, use ViewSize property to define view size.
// 9  - Fit the image to current display area keep the aspect ratio
//10 - Fit the image to width of current display area.
//11 - Fit the image to height of current display area.
//12 - Center the Image, In this mode, you can't zoom in, zoom out or rotate the image.

ole_fax1.object.View=10
//ole_fax1.object.ViewSize=50 

///ole_fax1.SetRedraw(true)
///ole_fax1.visible = true



end subroutine

on w_faxcomponent_new_deposit_apl.create
int iCurrent
call super::create
this.st_8=create st_8
this.sle_idbranch=create sle_idbranch
this.st_10=create st_10
this.sle_description=create sle_description
this.st_11=create st_11
this.em_deposit=create em_deposit
this.st_12=create st_12
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_revision_info=create dw_revision_info
this.dw_deposits=create dw_deposits
this.em_name_branch=create em_name_branch
this.uo_1=create uo_1
this.dw_bank_information=create dw_bank_information
this.dw_2=create dw_2
this.p_alert=create p_alert
this.lst_deposit_mode=create lst_deposit_mode
this.gb_5=create gb_5
this.rr_1=create rr_1
this.rr_2=create rr_2
this.dw_archivos=create dw_archivos
this.st_9=create st_9
this.st_filename=create st_filename
this.pb_previos_option=create pb_previos_option
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_8
this.Control[iCurrent+2]=this.sle_idbranch
this.Control[iCurrent+3]=this.st_10
this.Control[iCurrent+4]=this.sle_description
this.Control[iCurrent+5]=this.st_11
this.Control[iCurrent+6]=this.em_deposit
this.Control[iCurrent+7]=this.st_12
this.Control[iCurrent+8]=this.pb_2
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.dw_revision_info
this.Control[iCurrent+11]=this.dw_deposits
this.Control[iCurrent+12]=this.em_name_branch
this.Control[iCurrent+13]=this.uo_1
this.Control[iCurrent+14]=this.dw_bank_information
this.Control[iCurrent+15]=this.dw_2
this.Control[iCurrent+16]=this.p_alert
this.Control[iCurrent+17]=this.lst_deposit_mode
this.Control[iCurrent+18]=this.gb_5
this.Control[iCurrent+19]=this.rr_1
this.Control[iCurrent+20]=this.rr_2
this.Control[iCurrent+21]=this.dw_archivos
this.Control[iCurrent+22]=this.st_9
this.Control[iCurrent+23]=this.st_filename
this.Control[iCurrent+24]=this.pb_previos_option
end on

on w_faxcomponent_new_deposit_apl.destroy
call super::destroy
destroy(this.st_8)
destroy(this.sle_idbranch)
destroy(this.st_10)
destroy(this.sle_description)
destroy(this.st_11)
destroy(this.em_deposit)
destroy(this.st_12)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_revision_info)
destroy(this.dw_deposits)
destroy(this.em_name_branch)
destroy(this.uo_1)
destroy(this.dw_bank_information)
destroy(this.dw_2)
destroy(this.p_alert)
destroy(this.lst_deposit_mode)
destroy(this.gb_5)
destroy(this.rr_1)
destroy(this.rr_2)
destroy(this.dw_archivos)
destroy(this.st_9)
destroy(this.st_filename)
destroy(this.pb_previos_option)
end on

event resize;//
end event

event open;call super::open;STRING s_active_previus_deposit = 'N'

dw_revision_info.InsertRow(0)

dw_deposits.setTransObject(SQLCA)
dw_bank_information.setTransObject(SQLCA)
dw_bank_information.InsertRow(0)
f_validar_fecha_transaccion('N')



dw_2.settransobject(sqlca)

SELECT stringvalue
INTO :s_active_previus_deposit
FROM dba.PARAMETERS
WHERE  idparameter = 'PREVIUS_DEPOSIT_VIEW';

IF s_active_previus_deposit = 'S' THEN
	pb_previos_option.visible = True
END IF



this.PostEvent("ue_postopen")
end event

event closequery;//
end event

type cb_rotate180 from w_faxcomponent`cb_rotate180 within w_faxcomponent_new_deposit_apl
integer x = 1435
integer y = 264
end type

type pb_duplicate_page from w_faxcomponent`pb_duplicate_page within w_faxcomponent_new_deposit_apl
integer x = 3218
integer y = 260
end type

type st_res from w_faxcomponent`st_res within w_faxcomponent_new_deposit_apl
integer x = 2866
integer y = 296
end type

type sle_id_branch from w_faxcomponent`sle_id_branch within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5211
integer y = 264
end type

type st_5 from w_faxcomponent`st_5 within w_faxcomponent_new_deposit_apl
integer x = 1719
integer y = 284
long backcolor = 134217750
end type

type pb_separate from w_faxcomponent`pb_separate within w_faxcomponent_new_deposit_apl
integer x = 3337
integer y = 264
end type

type pb_print from w_faxcomponent`pb_print within w_faxcomponent_new_deposit_apl
integer x = 3461
integer y = 264
end type

type cb_refresh from w_faxcomponent`cb_refresh within w_faxcomponent_new_deposit_apl
integer x = 910
integer y = 16
end type

event cb_refresh::clicked;call super::clicked;f_cargar_archivos_dw()
end event

type pb_previous from w_faxcomponent`pb_previous within w_faxcomponent_new_deposit_apl
integer x = 2441
integer y = 264
end type

type pb_next from w_faxcomponent`pb_next within w_faxcomponent_new_deposit_apl
integer x = 2720
integer y = 264
end type

type ole_fax1 from w_faxcomponent`ole_fax1 within w_faxcomponent_new_deposit_apl
integer x = 1070
integer y = 356
integer width = 2610
integer height = 1180
end type

type lb_faxes from w_faxcomponent`lb_faxes within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 23
integer y = 920
integer height = 600
end type

type st_2 from w_faxcomponent`st_2 within w_faxcomponent_new_deposit_apl
integer y = 40
integer weight = 700
long backcolor = 134217750
end type

type cb_ok from w_faxcomponent`cb_ok within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5499
integer y = 1196
boolean enabled = false
boolean default = false
end type

type cb_rotateleft from w_faxcomponent`cb_rotateleft within w_faxcomponent_new_deposit_apl
integer x = 1326
integer y = 264
end type

type cb_rotateright from w_faxcomponent`cb_rotateright within w_faxcomponent_new_deposit_apl
integer x = 1545
integer y = 264
end type

type st_4 from w_faxcomponent`st_4 within w_faxcomponent_new_deposit_apl
integer x = 1102
integer y = 284
long backcolor = 134217750
end type

type st_6 from w_faxcomponent`st_6 within w_faxcomponent_new_deposit_apl
integer x = 2318
integer y = 284
long backcolor = 134217750
end type

type sle_pos from w_faxcomponent`sle_pos within w_faxcomponent_new_deposit_apl
integer x = 2546
integer y = 268
end type

type cb_move from w_faxcomponent`cb_move within w_faxcomponent_new_deposit_apl
integer x = 814
integer y = 1644
end type

event cb_move::clicked;string ls_ext

// Moviendo el Fax a la carpeta deseada
if sle_selected.text <> "[No Fax Selected]" AND  sle_selected.text <>  '[ - NO IMAGE - ]' then

	if	lb_folder.text = lb_movetofolder.text then
		Messagebox("","You must specify a diffrent Folder to Move the fax",StopSign!)
		return
	end if	

	String ls_faxpath, ls_faxname, ls_newfaxfolder, ls_newfaxname

	ls_faxpath = is_faxpath
	ls_newfaxfolder = "u:\"+lb_movetofolder.text+"\"
	ls_faxname = sle_selected.text
	ls_newfaxname = sle_newname.text

	if isnull(ls_newfaxname) or len(trim(ls_newfaxname)) < 1 then 
		ls_newfaxname = ls_faxname
		sle_newname.text = ls_newfaxname
	end if

	if messagebox("Confirm","Are you sure that your want to move the fax " + sle_selected.text + " to "+ls_newfaxfolder+"?",Question!,YesNo!) <> 1 Then
		return
	end if
	
	ole_fax1.object.FileName = ""
	
	if FileExists(ls_faxpath+ls_faxname) then
		ls_ext = fn_get_file_ext(ls_faxname)
		//if FileExists(ls_newfaxfolder+ls_newfaxname) then
			//ls_newfaxname = fn_replace(ls_newfaxname,".tif","") + "_" + string(today(),'mmddyyhhmmss')+".tif"			
		//end if
		//ls_newfaxname = string(today(),'mmddyyhhmmss')+'_'+gs_login+'_'+ls_newfaxname
		ls_newfaxname = fn_replace(upper(ls_newfaxname),ls_ext,"") + "_"+gs_login+'_'+ string(today(),'mmddyyhhmmss')+ls_ext
		fn_filemove(ls_faxpath+ls_faxname,ls_newfaxfolder+ls_newfaxname)										
	end if
end if

lb_faxes.DirList(is_faxpath + is_idbranch + "*.*", 0)

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Cleaning Screen
sle_pos.TextColor	= RGB(0,0,0)
sle_pos.text = "1/1"
//sle_zoom.text = '50'
sle_selected.text = "[No Fax Selected]"
sle_newname.text = ""
ole_fax1.object.FileName = ""
f_limpiar_pantalla()
f_cargar_archivos_dw()
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
end event

type lb_folder from w_faxcomponent`lb_folder within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5198
integer y = 444
end type

type st_3 from w_faxcomponent`st_3 within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5216
integer y = 384
end type

type sle_selected from w_faxcomponent`sle_selected within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5376
integer y = 940
end type

type lb_movetofolder from w_faxcomponent`lb_movetofolder within w_faxcomponent_new_deposit_apl
integer x = 23
integer y = 1644
end type

type gb_3 from w_faxcomponent`gb_3 within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5115
integer y = 664
end type

type gb_1 from w_faxcomponent`gb_1 within w_faxcomponent_new_deposit_apl
integer x = 0
integer y = 1576
end type

type st_1 from w_faxcomponent`st_1 within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5170
integer y = 948
end type

type sle_newname from w_faxcomponent`sle_newname within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5376
integer y = 1024
end type

type st_7 from w_faxcomponent`st_7 within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5170
integer y = 1032
end type

type sle_email from w_faxcomponent`sle_email within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5138
integer y = 740
end type

type cb_email from w_faxcomponent`cb_email within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5929
integer y = 740
end type

type gb_2 from w_faxcomponent`gb_2 within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 5138
integer y = 888
end type

type htb_zoom from w_faxcomponent`htb_zoom within w_faxcomponent_new_deposit_apl
integer x = 1856
integer y = 272
end type

type st_8 from statictext within w_faxcomponent_new_deposit_apl
integer x = 1129
integer y = 36
integer width = 178
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agent:"
boolean focusrectangle = false
end type

type sle_idbranch from singlelineedit within w_faxcomponent_new_deposit_apl
integer x = 1335
integer y = 24
integer width = 256
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event modified;f_retrieve_agency_info(this.text,'AGENCY')
end event

type st_10 from statictext within w_faxcomponent_new_deposit_apl
integer x = 1088
integer y = 1580
integer width = 343
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Description:"
boolean focusrectangle = false
end type

type sle_description from singlelineedit within w_faxcomponent_new_deposit_apl
integer x = 1481
integer y = 1564
integer width = 1911
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "DIRECT MAIL"
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_faxcomponent_new_deposit_apl
integer x = 1083
integer y = 1676
integer width = 279
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
string text = "Amount:"
boolean focusrectangle = false
end type

type em_deposit from editmask within w_faxcomponent_new_deposit_apl
integer x = 1481
integer y = 1664
integer width = 343
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

event modified;DECIMAL dc_deposit_value

IF dw_deposits.RowCount() > 0 THEN
	dw_deposits.SetRedraw(FALSE)
	dc_deposit_value = dec(this.text)
	
	dw_deposits.SetItem(1,'deposit_archivo',dc_deposit_value)
	
	dw_deposits.AcceptText()
	dw_deposits.SetRedraw(TRUE)
	
END IF
end event

type st_12 from statictext within w_faxcomponent_new_deposit_apl
integer x = 1083
integer y = 1776
integer width = 384
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
string text = "Deposit mode:"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_faxcomponent_new_deposit_apl
integer x = 1422
integer y = 1976
integer width = 489
integer height = 144
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reject"
boolean originalsize = true
vtextalign vtextalign = vcenter!
long backcolor = 25198847
end type

event clicked;
DOUBLE ld_deposito
String s_filename, s_source, ls_branch, ls_faxpath, ls_deposit_mode, ls_sourse
Long		 l_id_manual_review


Datetime  ld_recdate_received
		


n_exception n_exeption_local
n_exeption_local = CREATE n_exception


TRY

	ld_deposito =  Double(em_deposit.text)
	
	s_filename    = dw_archivos.getitemstring(il_fila_archivo,"filename")	
	l_id_manual_review = dw_archivos.GetItemNumber(il_fila_archivo,'id_log_review' )
	s_source = dw_revision_info.getitemstring(1,'source' )   
	ls_branch = sle_idbranch.text
	ls_deposit_mode =lst_deposit_mode.getdataid()
	ls_sourse =  mid(dw_revision_info.GetItemString(1,'source' ),1,10)
	ld_recdate_received  =dw_revision_info.getitemdatetime(1,"received")

	
	if l_id_manual_review > 0 THEN
		
		UPDATE Credit.INSTANT_CREDIT_MANUAL_REVIEW
		SET   REVIEWED =1
			, APPLIED = 0
		WHERE ID_LOG = :l_id_manual_review;
		
	ELSE
		
		IF s_filename <>  '[ - NO IMAGE - ]'  THEN
			INSERT INTO Credit.INSTANT_CREDIT_MANUAL_REVIEW
				(
					ID_BRANCH
					, DATE_TRANSACTION
					, ID_REVIEW_STATUS
					, DOCUMENT_PATH
					, SOURCE
					, DEPOSIT_AMOUNT
					, OCR_AMOUNT
					, REVIEWED
					, APPLIED
					, DEPOSIT_MODE
					)
				VALUES
					(
					:ls_branch
					,:ld_recdate_received
					, 'OTHS'
					,:s_filename
					, :ls_sourse
					,:ld_deposito
					, 0
					, 1
					, 0
					, :ls_deposit_mode)	;
		END IF
		
	END IF
	
	COMMIT ;

		
	// ---------------------------------------------------->			
	// Moviendo el Fax a la carpeta de procesados				
	ole_fax1.object.FileName = ""
	
	IF s_filename <> '[ - NO IMAGE - ]' THEN 		
				
		ls_faxpath = "u:\accounting\"
		if FileExists(ls_faxpath+s_filename) then			
			fn_filemove(ls_faxpath+s_filename,ls_faxpath+"reject\"+s_filename)	
		end if
	end if	
	// ---------------------------------------------------->
	
	Messagebox("Information","Deposit reject")	
		
	
CATCH (n_exception ex_error)
	
	messagebox("Error",ex_error.GetMessage(),StopSign!)
	
	IF ex_error.get_tipo_mensaje() <>  'LIMPIAR' THEN
		Return
	END IF
	

END TRY


f_limpiar_pantalla()
f_cargar_archivos_dw()



end event

type pb_1 from picturebutton within w_faxcomponent_new_deposit_apl
integer x = 2478
integer y = 1972
integer width = 489
integer height = 144
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Apply Deposit"
boolean originalsize = true
vtextalign vtextalign = vcenter!
long backcolor = 12639424
end type

event clicked;Double	ld_cons, ld_deposito, ld_nivel_endeudamiento, ld_total_deuda_grupo, ld_receiver, ld_amount, ld_deposit_count, ld_balance = 0, ld_max_value_deposit
			
String	ls_branch,ls_group, ls_account, ls_banco, ls_deposit_code, s_dep_banco, s_description, ls_faxpath, ls_newfaxname, ls_bankid, s_filename, s_source, s_branchstatus, ls_desc_anterior, ls_deposit_mode, ls_sourse, ls_extencion

long		ll_cons = 0, l_id_manual_review

Datetime	 ld_recdate_received
LONG	ll_dias

string ls_banco_validar,ls_cuenta_validar, s_business_day

datetime		ld_date_inicio, ld_date_final		


n_exception n_exeption_local
n_exeption_local = CREATE n_exception


TRY
	
	dw_bank_information.accepttext()
	
	
	ls_banco      = dw_bank_information.getitemstring(1,"id_banco")
	ls_account 	= dw_bank_information.getitemstring(1,"id_cuenta_banco")
	ls_branch 	= sle_idbranch.text
	ls_deposit_mode =lst_deposit_mode.getdataid()
	ls_sourse =  mid(dw_revision_info.GetItemString(1,'source' ),1,10)
	ld_recdate_received  =dw_revision_info.getitemdatetime(1,"received")

	
	IF len(ls_branch) < 6 THEN
		n_exeption_local.SetMessage('The agency code is not valid' )
		THROW n_exeption_local
	END IF
	
	
	IF IsNull(ls_deposit_mode) or Len(ls_deposit_mode) = 0 THEN
		n_exeption_local.SetMessage('Please enter the deposit mode' )
		THROW n_exeption_local
	END IF
	
	SELECT DEP_BANCO
	INTO :s_dep_banco
	FROM DBA.BANCO
	WHERE ID_BANCO = :ls_banco;
	
	IF s_dep_banco = 'N' THEN
//		messagebox('Error','El banco se encuentra bloqueado para depositos' )
//		return
		
		n_exeption_local.SetMessage('The bank is blocked for deposits' )
		THROW n_exeption_local
		
	END IF
	
	
	if (len(ls_banco)=0 or isnull(ls_banco) or len(ls_account) < 6 or isnull(ls_account) )  then
//		messagebox('Error','Verify Bank and Account Information')
//		return
		
		n_exeption_local.SetMessage('Verify Bank and Account Information')
		THROW n_exeption_local
	end if 	
	

	
	dw_2.setitem(dw_2.getrow(),"id_cashier",gs_cashier)


	
	//""""""""""""""""""""""Verificar si la fecha no esta bloqueada"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""	
				
	SELECT dba.ACC_PARAMETERS.DATE_BLOCKER,   
			dba.ACC_PARAMETERS.DATE_BLOCKER_POST  
	 INTO :ld_date_inicio,   
			:ld_date_final  
	 FROM dba.ACC_PARAMETERS  ;
	
	if ( ld_date_inicio > dw_bank_information.getitemdatetime(1,"reconciliationdate") ) or ( ld_date_final < dw_bank_information.getitemdatetime(1,"reconciliationdate") ) then
		//messagebox("Error","The date you are using was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
		n_exeption_local.SetMessage("The date you are using was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.")
		THROW n_exeption_local
		//Return
	END IF
	

	
	IF Not(f_validar_fecha_transaccion('S')) THEN		
		RETURN
	END IF
	
	
	dw_bank_information.AcceptText()
	
	
	//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
		
	

	
	ls_banco      = dw_bank_information.getitemstring(1,"id_banco")
	ls_account 	= dw_bank_information.getitemstring(1,"id_cuenta_banco")
	ls_deposit_code = dw_bank_information.getitemstring(1,"deposit_code")
	ls_group 	= dw_2.getitemstring(1,"id_group")
	ld_deposito =  Double(em_deposit.text)
	
	s_filename    = dw_archivos.getitemstring(il_fila_archivo,"filename")	
	s_branchstatus = dw_archivos.getitemstring(il_fila_archivo,"branchstatus")	 
	l_id_manual_review = dw_archivos.GetItemNumber(il_fila_archivo,'id_log_review' )
	s_source = dw_revision_info.getitemstring(1,'source' )   
	
	
	ls_desc_anterior =  left(sle_description.text,50)	
		
	dw_2.setitem(1,"description",ls_desc_anterior)
	
	if ld_deposito = 0 then
		//Messagebox("Error","Amount 0 ")
		n_exeption_local.SetMessage("Please enter a value for the deposit.")
		THROW n_exeption_local
		//return
	end if
	
	
	
	
	// --------------------------------------------
	// Evita que graben transacciones sin banco.
	
	
	IF IsNull(ls_banco) or Len(ls_banco) = 0 THEN
		n_exeption_local.SetMessage("Please check the bank.")
		THROW n_exeption_local		
	END IF
	
	IF IsNull(ls_account) or Len(ls_account) = 0 THEN
		n_exeption_local.SetMessage("Please verify account.")
		THROW n_exeption_local		
	END IF
	
	long ll_cont1
	
	SELECT count(*) 
	  INTO :ll_cont1
	  FROM dba.CUENTA_BANCO
	 WHERE id_banco = :ls_banco
		AND id_cuenta_banco = :ls_account;
	 
	If ll_cont1 <> 1 then	
//		Messagebox("Error","Favor Verifique la Cuenta. ["+trim(ls_banco)+"-"+trim(ls_account)+"]",StopSign!)
//		return
		n_exeption_local.SetMessage("Please verify account. ["+trim(ls_banco)+"-"+trim(ls_account)+"]")
		THROW n_exeption_local
	end if
	// --------------------------------------------
	
	if isnull(ls_account) or ls_account = '' then
//		Messagebox("Error","You have to select the account")
//		return
		n_exeption_local.SetMessage("You have to select the account")
		THROW n_exeption_local
	end if
	
	
	
	//------------------------------------------------------
	// This is to validate the deposit code
	//
	//------------------------------------------------------
	
	if not(isnull(ls_banco) or ls_banco = '') then
		if not (isnull(ls_account) or ls_account = '') then
			if isnull(ls_deposit_code) or ls_deposit_code = '' then
				
				SELECT COUNT( DEPOSIT_CODE)
				INTO :ld_deposit_count
				FROM dba.DEPOSIT_CODES
				WHERE ID_BANCO = :ls_banco 
				AND ID_CUENTA_BANCO = :ls_account
				AND ID_BRANCH = :ls_branch;
				
				if ld_deposit_count = 1 then
					
					SELECT  DEPOSIT_CODE
					INTO :ls_deposit_code
					FROM dba.DEPOSIT_CODES
					WHERE ID_BANCO = :ls_banco 
					AND ID_CUENTA_BANCO = :ls_account
					AND ID_BRANCH = :ls_branch;
					
					dw_bank_information.setitem(1,"deposit_code",ls_deposit_code)
					
				else
					if ld_deposit_count > 1 then
						messagebox('ALERT', 'You Must Select a Deposit Code', stopsign!)
						dw_bank_information.setfocus()
						dw_bank_information.setcolumn('deposit_code')
						return
					end if
				end if
			end if
		end if
	end if
	//----------------------------------------------------------------
	
	
	IF Isnull(ld_balance) Then ld_balance = 0
	
	ld_balance = round(ld_balance,2) - round(ld_deposito,2)
	
	SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
	INTO :ld_cons  
	FROM dba.transaccion_diaria_payee  ;
			
	if isnull(ld_cons) then ld_cons = 1		
			
	dw_bank_information.setitem(1,"cons",ld_cons)
	dw_2.setitem(1,"cons",ld_cons)
	dw_2.setitem(1,"balance",ld_balance)
	dw_2.setitem(1,"credit",ld_deposito)
	
	
	
	dw_2.accepttext()
	
	IF dw_2.update()<>1 THEN
		ROLLBACK ;
		Messagebox('Error','Transaction was not saved',StopSign!)
		Return;
	END IF
	
	IF dw_bank_information.update() <> 1 THEN
		ROLLBACK ;
		Messagebox('Error','Transaction was not saved',StopSign!)
		Return;
	END IF
	
	if l_id_manual_review > 0 THEN
		
		UPDATE Credit.INSTANT_CREDIT_MANUAL_REVIEW
		SET   REVIEWED = 1
			, APPLIED = 1
			, CONS_TRANS_DIARIA = :ld_cons
			, ID_BRANCH = :ls_branch
			,DEPOSIT_MODE = :ls_deposit_mode
		WHERE ID_LOG = :l_id_manual_review;
		
	ELSE
		
		IF s_filename <>  '[ - NO IMAGE - ]'  THEN
			INSERT INTO Credit.INSTANT_CREDIT_MANUAL_REVIEW
				(
					  ID_BRANCH
					, DATE_TRANSACTION
					, ID_REVIEW_STATUS
					, DOCUMENT_PATH
					, SOURCE
					, DEPOSIT_AMOUNT
					, OCR_AMOUNT
					, REVIEWED
					, APPLIED
					, CONS_TRANS_DIARIA
					, DEPOSIT_MODE
					)
				VALUES
					(
					:ls_branch
					,:ld_recdate_received
					, 'OTHS'
					,:s_filename
					,:ls_sourse
					, :ld_deposito
					, 0
					, 1
					, 1
					, :ld_cons
					, :ls_deposit_mode)	;
		END IF
		
	END IF

	
	
	COMMIT ;
	Messagebox("Deposit Group","Verificando el Deposito .....")
	
	SELECT Count(*)  
	INTO :ll_cons  
	FROM dba.transaccion_diaria_payee  
	WHERE dba.transaccion_diaria_payee.cons_trans_diaria = :ld_cons   ;

	if ll_cons <> 1 then
		
		//Messagebox('Error','Transaction was not saved',StopSign!)
		
		n_exeption_local.SetMessage('Transaction was not saved')
		
		n_exeption_local.set_tipo_mensaje('LIMPIAR')
		
		THROW n_exeption_local
		
		
	else
		Messagebox('Process Complete','Transaction was saved successful')
		
		DECIMAL  ld_pastdue
	
		IF s_branchstatus = 'I' THEN
		
			SELECT dba.sfCalCurrentPastDue(id_main_branch)
			  INTO  :ld_pastdue
			  FROM DBA.group_branch
			 WHERE id_main_branch = :ls_group;
			 
			
			IF messageBox('Information','The agency is inactive with a past due:  '+String(ld_pastdue,"$#,##0.00") + '~r~nYou want to reactivate?', Question! , YesNo! ) = 1  THEN			
				f_rectivar_agencia(ls_branch)
			END IF
	
		END IF
		
		
		// ---------------------------------------------------->			
		// Moviendo el Fax a la carpeta de procesados			
		
		ole_fax1.SetRedraw(false)
		fn_loadfax('')	
		fn_ajustscreen()
		ole_fax1.SetRedraw(true)	
		
		IF s_filename <> '[ - NO IMAGE - ]' THEN 
			
			
			SELECT dba.CUENTA_BANCO.ID_BANCO  
			INTO :ls_bankid  
			FROM dba.CUENTA_BANCO  
			WHERE dba.CUENTA_BANCO.ID_CUENTA_BANCO = :ls_account   ;

			if isnull(ls_bankid) then ls_bankid = "xxxxx"
			if isnull(ls_account) then ls_account = "xxxxx"				
			
			ls_extencion = fn_get_file_ext(s_filename)
		 
			
			ls_faxpath = "u:\accounting\"
			if FileExists(ls_faxpath+s_filename) then			
				ls_newfaxname = "0_" + trim(sle_idbranch.text) + "_" + trim(ls_bankid) + "_" + trim(ls_account) + "_" + string(round(ld_deposito,0)) + "_"+string(ld_cons)+ls_extencion
				fn_filemove(ls_faxpath+s_filename,ls_faxpath+"processed\"+ls_newfaxname)	
			end if
		end if	
		// ---------------------------------------------------->
	end if
		
	
CATCH (n_exception ex_error)
	
	messagebox("Error",ex_error.GetMessage(),StopSign!)
	
	IF ex_error.get_tipo_mensaje() <>  'LIMPIAR' THEN
		Return
	END IF
	

END TRY


f_limpiar_pantalla()
f_cargar_archivos_dw()



end event

type dw_revision_info from datawindow within w_faxcomponent_new_deposit_apl
integer x = 3735
integer y = 1584
integer width = 1001
integer height = 424
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_credit_manual_review"
boolean livescroll = true
end type

type dw_deposits from datawindow within w_faxcomponent_new_deposit_apl
integer x = 3739
integer y = 248
integer width = 1001
integer height = 1296
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rep_depositos_agencia_new"
boolean hscrollbar = true
boolean livescroll = true
end type

type em_name_branch from editmask within w_faxcomponent_new_deposit_apl
integer x = 1129
integer y = 120
integer width = 1371
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type uo_1 from uo_segmentation within w_faxcomponent_new_deposit_apl
integer x = 1655
integer y = 8
integer width = 430
integer taborder = 80
boolean bringtotop = true
end type

on uo_1.destroy
call uo_segmentation::destroy
end on

type dw_bank_information from datawindow within w_faxcomponent_new_deposit_apl
event ue_validar_fecha ( )
integer x = 2537
integer y = 52
integer width = 2167
integer height = 172
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_selet_cuenta_pago_corresp_nue"
boolean border = false
boolean livescroll = true
end type

event ue_validar_fecha();f_validar_fecha_transaccion('S')
f_llenar_descripcion()
end event

event itemchanged;string s_filter
DataWindowChild	ldw_dw

//if not(ib_lookup) then

	IF dwo.Name = 'id_banco' THEN
		dw_bank_information.setitem(dw_bank_information.getrow(),"id_cuenta_banco",'')
		dw_bank_information.setitem(dw_bank_information.getrow(),"deposit_code",'')
		GetChild('id_cuenta_banco',ldw_dw)
		ldw_dw.SetTransObject(SQLCA)
		ldw_dw.SetFilter("id_banco = '"+GetText()+"'")
		ldw_dw.Filter()
	END IF	
	
	
//end if	

DataWindowChild	ldw_dw1

//if not(ib_lookup) then

	IF dwo.Name = 'id_cuenta_banco' THEN
		dw_bank_information.setitem(dw_bank_information.getrow(),"deposit_code",'')
		GetChild('deposit_code',ldw_dw1)
		ldw_dw1.SetTransObject(SQLCA)
		s_filter ="id_banco = '"+this.getitemstring(this.getrow(),"id_banco" ) +" ' " + "and " + "id_cuenta_banco = '"+GetText()+"'" +"and "+ "id_branch = '"+sle_idbranch.text +" ' " 
		ldw_dw1.SetFilter(s_filter)
		ldw_dw1.Filter()
	END IF	
	
	
//end if	


IF dwo.Name = 'reconciliationdate' THEN
	this.PostEvent("ue_validar_fecha")
	
END IF	


end event

event itemfocuschanged;//DataWindowChild	ldw_dw
//
//IF dwo.Name = 'id_banco' THEN
//	GetChild('id_cuenta_banco',ldw_dw)
//	ldw_dw.SetTransObject(SQLCA)
//	ldw_dw.SetFilter("id_banco = '"+GetText()+"'")
//	ldw_dw.Filter()
//END IF
//
//dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",'')
end event

type dw_2 from datawindow within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 393
integer y = 2260
integer width = 3090
integer height = 172
integer taborder = 50
boolean bringtotop = true
string dataobject = "dw_consignacion_group_agent_new"
boolean border = false
boolean livescroll = true
end type

event itemchanged;DatawindowChild 	ldw_dw

IF dwo.Name = 'id_banco' THEN
	GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter('id_banco = '+GetText())
	ldw_dw.Filter()
END IF

end event

type p_alert from picture within w_faxcomponent_new_deposit_apl
boolean visible = false
integer x = 1856
integer y = 1656
integer width = 133
integer height = 92
boolean bringtotop = true
string picturename = "C:\ViamericasMT\Graphics\Alert.jpg"
boolean focusrectangle = false
string powertiptext = "El valor del archivo es diferente al valor registrado en la tabla"
end type

type lst_deposit_mode from my_ddlb within w_faxcomponent_new_deposit_apl
integer x = 1481
integer y = 1764
integer width = 923
integer height = 348
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
end type

event constructor;call super::constructor;this.addquery("select DEPOSIT_MODE_NAME, ID_DEPOSIT from dba.DEPOSIT_MODE UNION select '','' ;")
end event

event modified;call super::modified;f_llenar_descripcion()
end event

type gb_5 from groupbox within w_faxcomponent_new_deposit_apl
integer x = 2523
integer y = 8
integer width = 2222
integer height = 208
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bank Information"
end type

type rr_1 from roundrectangle within w_faxcomponent_new_deposit_apl
integer linethickness = 4
long fillcolor = 134217750
integer x = 1056
integer y = 252
integer width = 2642
integer height = 1296
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_faxcomponent_new_deposit_apl
integer linethickness = 4
long fillcolor = 134217750
integer x = 5
integer y = 8
integer width = 1038
integer height = 1544
integer cornerheight = 40
integer cornerwidth = 46
end type

type dw_archivos from datawindow within w_faxcomponent_new_deposit_apl
integer x = 18
integer y = 140
integer width = 1010
integer height = 1388
integer taborder = 50
string title = "none"
string dataobject = "d_archivos_depositos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;STRING s_idbranch
IF row = 0 THEN
	RETURN
END IF



//dw_bank_information.settaborder(5,1) //Reconciliation Date
//dw_bank_information.settaborder(2,10) //El Banco
//dw_bank_information.settaborder(3,20) //La cuenta
//dw_bank_information.settaborder(2,1) 

fn_selectItem(row)



end event

type st_9 from statictext within w_faxcomponent_new_deposit_apl
integer x = 32
integer y = 1872
integer width = 352
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
string text = "Selected File:"
boolean focusrectangle = false
end type

type st_filename from statictext within w_faxcomponent_new_deposit_apl
integer x = 411
integer y = 1872
integer width = 3291
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
boolean focusrectangle = false
end type

type pb_previos_option from picturebutton within w_faxcomponent_new_deposit_apl
string tag = "Go to previous version"
boolean visible = false
integer x = 4782
integer y = 52
integer width = 110
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Undo!"
string powertiptext = "Go to previous version"
end type

event clicked;OpenSheet(w_consignacion_group_agent,w_principal, 2, Original!)
Close(parent)
end event

