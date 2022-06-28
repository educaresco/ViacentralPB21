$PBExportHeader$w_acc_credit.srw
forward
global type w_acc_credit from w2_master_report_agency
end type
type dw_statusaudit from datawindow within w_acc_credit
end type
type st_2 from statictext within w_acc_credit
end type
type st_3 from statictext within w_acc_credit
end type
type st_11 from statictext within w_acc_credit
end type
type st_creditavailable from statictext within w_acc_credit
end type
type em_creditlimit from editmask within w_acc_credit
end type
type cb_updatecredit from commandbutton within w_acc_credit
end type
type st_balance from statictext within w_acc_credit
end type
type st_6 from statictext within w_acc_credit
end type
type st_oustanding from statictext within w_acc_credit
end type
type dw_creditaudit from datawindow within w_acc_credit
end type
type st_5 from statictext within w_acc_credit
end type
type st_7 from statictext within w_acc_credit
end type
type st_8 from statictext within w_acc_credit
end type
type st_9 from statictext within w_acc_credit
end type
type lst_status from dropdownpicturelistbox within w_acc_credit
end type
type cb_updatestatus from commandbutton within w_acc_credit
end type
type st_10 from statictext within w_acc_credit
end type
type st_status from statictext within w_acc_credit
end type
type p_picture from picture within w_acc_credit
end type
type mle_statuscomments from multilineedit within w_acc_credit
end type
type cb_updatecomments from commandbutton within w_acc_credit
end type
type st_12 from st_1 within w_acc_credit
end type
type st_15 from st_1 within w_acc_credit
end type
type st_address from statictext within w_acc_credit
end type
type st_salesrep from statictext within w_acc_credit
end type
type st_18 from st_1 within w_acc_credit
end type
type st_20 from st_1 within w_acc_credit
end type
type st_phone1 from editmask within w_acc_credit
end type
type st_phone2 from editmask within w_acc_credit
end type
type st_fax from editmask within w_acc_credit
end type
type st_system1 from st_1 within w_acc_credit
end type
type st_system from statictext within w_acc_credit
end type
type em_creditlimit_wknd from editmask within w_acc_credit
end type
type st_13 from statictext within w_acc_credit
end type
type st_14 from st_1 within w_acc_credit
end type
type st_owner from statictext within w_acc_credit
end type
type st_16 from st_1 within w_acc_credit
end type
type st_pastdue from statictext within w_acc_credit
end type
type st_17 from st_1 within w_acc_credit
end type
type st_inactivations from statictext within w_acc_credit
end type
type st_21 from st_1 within w_acc_credit
end type
type st_lastinactivation from statictext within w_acc_credit
end type
type st_intransit from statictext within w_acc_credit
end type
type st_22 from statictext within w_acc_credit
end type
type st_credit from statictext within w_acc_credit
end type
type st_credit_wknd from statictext within w_acc_credit
end type
type dw_grades from datawindow within w_acc_credit
end type
type cb_1 from commandbutton within w_acc_credit
end type
type st_19 from st_1 within w_acc_credit
end type
type st_23 from st_1 within w_acc_credit
end type
type st_method from statictext within w_acc_credit
end type
type st_schedule from statictext within w_acc_credit
end type
type st_owner_phone1 from editmask within w_acc_credit
end type
type st_owner_phone2 from editmask within w_acc_credit
end type
type st_owner_cell from editmask within w_acc_credit
end type
type st_24 from st_1 within w_acc_credit
end type
type st_25 from st_1 within w_acc_credit
end type
type st_90 from statictext within w_acc_credit
end type
type st_others from statictext within w_acc_credit
end type
type st_26 from statictext within w_acc_credit
end type
type em_mo_daily_limit from editmask within w_acc_credit
end type
type cb_group_branch_financial from commandbutton within w_acc_credit
end type
type st_100 from st_1 within w_acc_credit
end type
type st_closing_day from statictext within w_acc_credit
end type
type st_27 from st_1 within w_acc_credit
end type
type st_insales_rep from statictext within w_acc_credit
end type
type st_29 from st_1 within w_acc_credit
end type
type st_regional_manager from statictext within w_acc_credit
end type
type cb_trans from commandbutton within w_acc_credit
end type
type cb_acc_statement from commandbutton within w_acc_credit
end type
type st_28 from st_1 within w_acc_credit
end type
type cb_2 from commandbutton within w_acc_credit
end type
type cb_3 from commandbutton within w_acc_credit
end type
type st_collector from statictext within w_acc_credit
end type
type st_30 from st_1 within w_acc_credit
end type
type sle_branch_id from singlelineedit within w_acc_credit
end type
type st_branch_name from statictext within w_acc_credit
end type
type ddlb_phases from dropdownlistbox within w_acc_credit
end type
type cb_update_phase from commandbutton within w_acc_credit
end type
type st_31 from statictext within w_acc_credit
end type
type st_4 from statictext within w_acc_credit
end type
type em_mo_season_limit from editmask within w_acc_credit
end type
type st_mo_daily_limit from statictext within w_acc_credit
end type
type st_mo_season_limit from statictext within w_acc_credit
end type
type gb_5 from groupbox within w_acc_credit
end type
type sle_comment from singlelineedit within w_acc_credit
end type
type st_32 from statictext within w_acc_credit
end type
type st_34 from statictext within w_acc_credit
end type
type st_35 from statictext within w_acc_credit
end type
type gb_2 from groupbox within w_acc_credit
end type
type gb_6 from groupbox within w_acc_credit
end type
type st_33 from statictext within w_acc_credit
end type
type st_36 from statictext within w_acc_credit
end type
type st_37 from statictext within w_acc_credit
end type
type st_outstanding_mo from statictext within w_acc_credit
end type
type st_mo_available from statictext within w_acc_credit
end type
type st_38 from statictext within w_acc_credit
end type
type uo_segment from uo_segmentation within w_acc_credit
end type
type gb_3 from groupbox within w_acc_credit
end type
type gb_4 from groupbox within w_acc_credit
end type
end forward

global type w_acc_credit from w2_master_report_agency
integer x = 214
integer y = 221
integer width = 5239
integer height = 2608
string title = "Agency Analysis"
boolean resizable = false
dw_statusaudit dw_statusaudit
st_2 st_2
st_3 st_3
st_11 st_11
st_creditavailable st_creditavailable
em_creditlimit em_creditlimit
cb_updatecredit cb_updatecredit
st_balance st_balance
st_6 st_6
st_oustanding st_oustanding
dw_creditaudit dw_creditaudit
st_5 st_5
st_7 st_7
st_8 st_8
st_9 st_9
lst_status lst_status
cb_updatestatus cb_updatestatus
st_10 st_10
st_status st_status
p_picture p_picture
mle_statuscomments mle_statuscomments
cb_updatecomments cb_updatecomments
st_12 st_12
st_15 st_15
st_address st_address
st_salesrep st_salesrep
st_18 st_18
st_20 st_20
st_phone1 st_phone1
st_phone2 st_phone2
st_fax st_fax
st_system1 st_system1
st_system st_system
em_creditlimit_wknd em_creditlimit_wknd
st_13 st_13
st_14 st_14
st_owner st_owner
st_16 st_16
st_pastdue st_pastdue
st_17 st_17
st_inactivations st_inactivations
st_21 st_21
st_lastinactivation st_lastinactivation
st_intransit st_intransit
st_22 st_22
st_credit st_credit
st_credit_wknd st_credit_wknd
dw_grades dw_grades
cb_1 cb_1
st_19 st_19
st_23 st_23
st_method st_method
st_schedule st_schedule
st_owner_phone1 st_owner_phone1
st_owner_phone2 st_owner_phone2
st_owner_cell st_owner_cell
st_24 st_24
st_25 st_25
st_90 st_90
st_others st_others
st_26 st_26
em_mo_daily_limit em_mo_daily_limit
cb_group_branch_financial cb_group_branch_financial
st_100 st_100
st_closing_day st_closing_day
st_27 st_27
st_insales_rep st_insales_rep
st_29 st_29
st_regional_manager st_regional_manager
cb_trans cb_trans
cb_acc_statement cb_acc_statement
st_28 st_28
cb_2 cb_2
cb_3 cb_3
st_collector st_collector
st_30 st_30
sle_branch_id sle_branch_id
st_branch_name st_branch_name
ddlb_phases ddlb_phases
cb_update_phase cb_update_phase
st_31 st_31
st_4 st_4
em_mo_season_limit em_mo_season_limit
st_mo_daily_limit st_mo_daily_limit
st_mo_season_limit st_mo_season_limit
gb_5 gb_5
sle_comment sle_comment
st_32 st_32
st_34 st_34
st_35 st_35
gb_2 gb_2
gb_6 gb_6
st_33 st_33
st_36 st_36
st_37 st_37
st_outstanding_mo st_outstanding_mo
st_mo_available st_mo_available
st_38 st_38
uo_segment uo_segment
gb_3 gb_3
gb_4 gb_4
end type
global w_acc_credit w_acc_credit

type variables
String is_branch_id, is_group
integer ii_id_phase
integer ii_MO_SEASON_START_DAY, ii_MO_SEASON_FINAL_DAY
end variables

forward prototypes
public subroutine fn_publishtobranch ()
public subroutine fn_cleanscreen ()
public subroutine fn_get_group_branch_data ()
public subroutine fn_open_goup_branch_financial ()
public subroutine fn_get_group_phase ()
public subroutine fn_get_phase (integer ai_phase)
public subroutine fn_set_phase ()
public subroutine fn_calcular_mo_available ()
end prototypes

public subroutine fn_publishtobranch ();
String 	ls_output, ls_outputfolder, ls_newflag, ls_agencyfolder
Integer 	li_FileNum, li_AllowMoneyTransfersEntry
Double 	ld_credit, ld_last_invoice, ld_balance, ld_credit_wknd, ld_intransit, ld_balance_general, ld_outstanding, ld_branchoutstanding
long ll_conttipo

SELECT ISNULL(DIR_OUTPUT,'R:\OUTPUT\')
  INTO :ls_outputfolder
  FROM dba.PARAMETROS; 
	  
// ******************
// Validate U: Drive!
fn_map_output()
if not fileexists('R:\Output') then
	Messagebox("Error!","La unidad necesaria no esta mapeada, favor intente nuevamente o contacte a Tecnologia si el problema se repite!",StopSign!)
	return
end if
// ******************

/*
SELECT DISTINCT dba.BRANCH.ID_FLAG_BRANCH,  dba.GROUP_BRANCH.DEBT_LIMIT, dba.GROUP_BRANCH.DEBT_LIMIT_WKND, dba.sfGetSafeonTransit(dba.GROUP_BRANCH.ID_MAIN_BRANCH)
INTO :ls_newflag, :ld_credit, :ld_credit_wknd, :ld_intransit
FROM dba.BRANCH, dba.GROUP_BRANCH 
WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
AND dba.branch.id_branch = :is_branch_id
AND dba.branch.id_type_branch in ('A','R');


SELECT Sum(dba.transaccion_diaria_payee.credit_trans_diaria) - Sum(dba.transaccion_diaria_payee.debit_trans_diaria)  
  INTO :ld_balance  
  FROM dba.transaccion_diaria_payee,  dba.branch  
 WHERE dba.transaccion_diaria_payee.id_group_trans_diaria = dba.branch.id_main_branch
	AND dba.branch.id_branch = :is_branch_id
	AND dba.transaccion_diaria_payee.id_concepto_contable <> 'CPC';*/
		

 
SELECT DEBT_LIMIT
		, DEBT_LIMIT_WKND
		, ID_FLAG_BRANCH
		, AMOUNTINSAFE
		, BALANCE
		, LASTINVOICE
		, AVAILABLECREDIT
		, OUTSTANDING
		, branchoutstanding
		,CONTTIPO
INTO :ld_credit, :ld_credit_wknd, :ls_newflag, :ld_intransit, :ld_balance, :ld_last_invoice, :ld_balance_general, :ld_outstanding, :ld_branchoutstanding, :ll_conttipo
	FROM DBA.SENDCREDITTOBRANCH with (nolock )
	where  ID_BRANCH =  :is_branch_id;
	

if isnull(ld_balance) then ld_balance = 0		
if isnull(ld_credit) then ld_credit = 0	


// ViaSafe Money (substrated from the balance - the balance is negative)
if ld_intransit > 0 then
	ld_balance = ld_balance + ld_intransit
end if		

/*SELECT MAX(id_receiver)  
  INTO :ld_last_invoice  
  FROM dba.relacion_invoices_payee  
 WHERE id_branch_invoice = :is_branch_id;*/

if isnull(ld_last_invoice) then ld_last_invoice = 0

ls_agencyfolder = ''
if fileexists(ls_outputfolder+trim(is_branch_id)) then ls_agencyfolder = trim(is_branch_id) + '\'


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Credito de fin de semana es de sabado medianoche a martes 1pm
if upper(mid(DayName(today()),1,2)) = 'SA' or upper(mid(DayName(today()),1,2)) = 'SU' or upper(mid(DayName(today()),1,2)) = 'MO' then
	ld_credit = ld_credit_wknd
end if

if upper(mid(DayName(today()),1,2)) = 'TU' and Now() < time('13:00:00') then
	ld_credit = ld_credit_wknd
end if
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
		
	
ls_output = ls_outputfolder + ls_agencyfolder + "UPG"+FILL('0',10 - LEN(trim(is_branch_id)))+trim(is_branch_id)+".sql"
li_FileNum = FileOpen(ls_output, LineMode!, Write!, LockWrite!,Append!)

FileWrite(li_filenum,"SET option on_error = CONTINUE;")	
/*FileWrite(li_filenum,'DELETE FROM credit_limit ;')
FileWrite(li_filenum,"INSERT INTO credit_limit (credit_limit,balance,id_branch,last_invoice) VALUES ("+STRING(ld_credit)+","+STRING(ld_balance)+",'"+  trim(is_branch_id)  +"',"+string(ld_last_invoice)+");")
FileWrite(li_filenum,"UPDATE branch SET id_flag_branch = '"+trim(ls_newflag)+"' WHERE id_branch = '" +trim(is_branch_id)+ "';")*/


SELECT Count(*) 
INTO: li_AllowMoneyTransfersEntry
FROM Base.VIAONE_BRANCH_SETTINGS
WHERE ID_BRANCH = :is_branch_id 
	AND SETTING_KEY= 'AllowMoneyTransfersEntry' 
	AND SETTING_VALUE = 1;

		
		// Inactiva las que estan en TELEFONO ROJO o DIGITACION CENTRAL
if ll_conttipo > 0 or trim(ls_newflag) = 'I' or li_AllowMoneyTransfersEntry > 0 then
		FileWrite(li_filenum,"UPDATE branch SET id_flag_branch = 'I' WHERE id_branch = '" +is_branch_id+ "';")
		FileWrite(li_filenum,"DELETE FROM credit_limit;")
		FileWrite(li_filenum,"INSERT INTO credit_limit(credit_limit,balance,id_branch,last_invoice) VALUES (0,0,'"+  trim(is_branch_id)  +"',500000);")
		FileWrite(li_filenum,"UPDATE credit_limit SET credit_limit = 0 ,balance = 0 ,last_invoice = 500000 ;")
		FileWrite(li_filenum,"UPDATE credit_limit SET balance_general = 0, last_update_bg = getdate() , outstanding = 0, branchoutstanding = 0 ;")
ELSE			

	FileWrite(li_filenum,"DELETE FROM credit_limit;")		
	FileWrite(li_filenum,"INSERT INTO credit_limit(credit_limit,balance,id_branch,last_invoice) VALUES ("+STRING(ld_credit)+","+STRING(ld_balance)+",'"+  trim(is_branch_id)  +"',"+string(ld_last_invoice)+");")			
	FileWrite(li_filenum,"UPDATE credit_limit SET credit_limit = "+STRING(ld_credit)+",balance = "+STRING(ld_balance)+",last_invoice = "+string(ld_last_invoice)+";")		
	FileWrite(li_filenum,"UPDATE credit_limit SET balance_general = "+string(ld_balance_general)+", last_update_bg = getdate() , outstanding = "+string(ld_outstanding)+" , branchoutstanding = " + string(ld_branchoutstanding) + " ;")	
	
	FileWrite(li_filenum,"UPDATE branch SET id_flag_branch = '"+trim(ls_newflag)+"' WHERE id_branch = '" +trim(is_branch_id)+ "';")
	
END IF

FileWrite(li_filenum,"COMMIT;")	
FileClose(li_FileNum)
end subroutine

public subroutine fn_cleanscreen ();
is_branch_id = 'NONE'
is_group = 'NONE'

dw_creditaudit.reset()
dw_statusaudit.reset()
dw_grades.reset()

st_balance.text = ""
st_creditavailable.text = ""
st_oustanding.text = ""
em_creditlimit.text = ""
em_creditlimit_wknd.text = ""
sle_comment.text = ""
mle_statuscomments.text = ""
st_status.text = ""
em_mo_daily_limit.text = ""
em_mo_season_limit.text = ""
st_outstanding_mo.text = ""
st_mo_available.text = ""

st_phone1.text = ""
st_phone2.text = ""
st_fax.text = ""
st_address.text = ""
st_salesrep.text = ""
st_system.text = ""
st_owner.text = ""
st_owner_phone1.text = ""
st_owner_phone2.text = ""
st_owner_cell.text = ""
st_inactivations.text = ""
st_lastinactivation.text = ""
st_pastdue.text = ""

st_schedule.text =  ""
st_method.text = ""

p_picture.visible = false

cb_updatestatus.enabled = false
cb_updatecredit.enabled = false
cb_updatecomments.enabled = false
st_credit_wknd.visible = false
st_credit.visible = true

ii_id_phase = 0
ddlb_phases.SelectItem(0)


end subroutine

public subroutine fn_get_group_branch_data ();string ls_depschedule, ls_depmethod, ls_closing_day, ls_monthly_closing

SELECT fin_schedule, isnull(FIN_COLLECTMETHOD,'')+isnull('/'+FIN_COLLECTMETHOD_2,''),fin_monthlyclosing, FIN_CLOSINGDAYCODE
  INTO :ls_depschedule, :ls_depmethod, :ls_monthly_closing, :ls_closing_day
  FROM DBA.group_branch  
 WHERE DBA.group_branch.id_main_branch = :is_group;
 
 st_method.text = ls_depmethod
 st_schedule.text =  ls_depschedule
 
IF ls_monthly_closing = "Y" THEN
 	st_closing_day.text = ls_closing_day
END IF
end subroutine

public subroutine fn_open_goup_branch_financial ();if is_branch_id = "NONE" then
	return
end if

OpenSheetWithParm(w_group_branch_financial, is_branch_id, w_principal, 2, Original!)

end subroutine

public subroutine fn_get_group_phase ();
end subroutine

public subroutine fn_get_phase (integer ai_phase);string ls_phase_name

IF ai_phase = 0 THEN RETURN

SELECT NAME_PHASE 
INTO :ls_phase_name
FROM DBA.GROUP_BRANCH_PHASE
WHERE ID_PHASE = :ai_phase;

IF len(ls_phase_name) > 0 THEN
	ddlb_phases.SelectItem (ai_phase)
	ii_id_phase = ai_phase
END IF
end subroutine

public subroutine fn_set_phase ();integer li_phase

IF isnull(is_group) OR is_group = "NONE" THEN RETURN

IF ii_id_phase > 0 THEN
	UPDATE DBA.GROUP_BRANCH SET ID_PHASE = :ii_id_phase
	WHERE ID_MAIN_BRANCH = :is_group;
	
	MESSAGEBOX("Alert", "Phase has been updated.")
END IF


end subroutine

public subroutine fn_calcular_mo_available ();double ld_mo_limit, ld_mo_available, ld_outstanding, ld_available_credit

IF st_mo_daily_limit.Visible = true THEN
	ld_mo_limit = double(em_mo_daily_limit.text)
ELSE
	ld_mo_limit = double(em_mo_season_limit.text)
END IF

ld_available_credit = double(Mid(st_creditavailable.text,2))
ld_outstanding = double(Mid(st_outstanding_mo.text,2)) 

ld_mo_available = ld_mo_limit - ld_outstanding

IF ld_mo_available > ld_available_credit THEN ld_mo_available = ld_available_credit

st_mo_available.text = string(ld_mo_available,"$#,##0.00;[RED]($#,##0.00)")
end subroutine

on w_acc_credit.create
int iCurrent
call super::create
this.dw_statusaudit=create dw_statusaudit
this.st_2=create st_2
this.st_3=create st_3
this.st_11=create st_11
this.st_creditavailable=create st_creditavailable
this.em_creditlimit=create em_creditlimit
this.cb_updatecredit=create cb_updatecredit
this.st_balance=create st_balance
this.st_6=create st_6
this.st_oustanding=create st_oustanding
this.dw_creditaudit=create dw_creditaudit
this.st_5=create st_5
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.lst_status=create lst_status
this.cb_updatestatus=create cb_updatestatus
this.st_10=create st_10
this.st_status=create st_status
this.p_picture=create p_picture
this.mle_statuscomments=create mle_statuscomments
this.cb_updatecomments=create cb_updatecomments
this.st_12=create st_12
this.st_15=create st_15
this.st_address=create st_address
this.st_salesrep=create st_salesrep
this.st_18=create st_18
this.st_20=create st_20
this.st_phone1=create st_phone1
this.st_phone2=create st_phone2
this.st_fax=create st_fax
this.st_system1=create st_system1
this.st_system=create st_system
this.em_creditlimit_wknd=create em_creditlimit_wknd
this.st_13=create st_13
this.st_14=create st_14
this.st_owner=create st_owner
this.st_16=create st_16
this.st_pastdue=create st_pastdue
this.st_17=create st_17
this.st_inactivations=create st_inactivations
this.st_21=create st_21
this.st_lastinactivation=create st_lastinactivation
this.st_intransit=create st_intransit
this.st_22=create st_22
this.st_credit=create st_credit
this.st_credit_wknd=create st_credit_wknd
this.dw_grades=create dw_grades
this.cb_1=create cb_1
this.st_19=create st_19
this.st_23=create st_23
this.st_method=create st_method
this.st_schedule=create st_schedule
this.st_owner_phone1=create st_owner_phone1
this.st_owner_phone2=create st_owner_phone2
this.st_owner_cell=create st_owner_cell
this.st_24=create st_24
this.st_25=create st_25
this.st_90=create st_90
this.st_others=create st_others
this.st_26=create st_26
this.em_mo_daily_limit=create em_mo_daily_limit
this.cb_group_branch_financial=create cb_group_branch_financial
this.st_100=create st_100
this.st_closing_day=create st_closing_day
this.st_27=create st_27
this.st_insales_rep=create st_insales_rep
this.st_29=create st_29
this.st_regional_manager=create st_regional_manager
this.cb_trans=create cb_trans
this.cb_acc_statement=create cb_acc_statement
this.st_28=create st_28
this.cb_2=create cb_2
this.cb_3=create cb_3
this.st_collector=create st_collector
this.st_30=create st_30
this.sle_branch_id=create sle_branch_id
this.st_branch_name=create st_branch_name
this.ddlb_phases=create ddlb_phases
this.cb_update_phase=create cb_update_phase
this.st_31=create st_31
this.st_4=create st_4
this.em_mo_season_limit=create em_mo_season_limit
this.st_mo_daily_limit=create st_mo_daily_limit
this.st_mo_season_limit=create st_mo_season_limit
this.gb_5=create gb_5
this.sle_comment=create sle_comment
this.st_32=create st_32
this.st_34=create st_34
this.st_35=create st_35
this.gb_2=create gb_2
this.gb_6=create gb_6
this.st_33=create st_33
this.st_36=create st_36
this.st_37=create st_37
this.st_outstanding_mo=create st_outstanding_mo
this.st_mo_available=create st_mo_available
this.st_38=create st_38
this.uo_segment=create uo_segment
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_statusaudit
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_11
this.Control[iCurrent+5]=this.st_creditavailable
this.Control[iCurrent+6]=this.em_creditlimit
this.Control[iCurrent+7]=this.cb_updatecredit
this.Control[iCurrent+8]=this.st_balance
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.st_oustanding
this.Control[iCurrent+11]=this.dw_creditaudit
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.st_8
this.Control[iCurrent+15]=this.st_9
this.Control[iCurrent+16]=this.lst_status
this.Control[iCurrent+17]=this.cb_updatestatus
this.Control[iCurrent+18]=this.st_10
this.Control[iCurrent+19]=this.st_status
this.Control[iCurrent+20]=this.p_picture
this.Control[iCurrent+21]=this.mle_statuscomments
this.Control[iCurrent+22]=this.cb_updatecomments
this.Control[iCurrent+23]=this.st_12
this.Control[iCurrent+24]=this.st_15
this.Control[iCurrent+25]=this.st_address
this.Control[iCurrent+26]=this.st_salesrep
this.Control[iCurrent+27]=this.st_18
this.Control[iCurrent+28]=this.st_20
this.Control[iCurrent+29]=this.st_phone1
this.Control[iCurrent+30]=this.st_phone2
this.Control[iCurrent+31]=this.st_fax
this.Control[iCurrent+32]=this.st_system1
this.Control[iCurrent+33]=this.st_system
this.Control[iCurrent+34]=this.em_creditlimit_wknd
this.Control[iCurrent+35]=this.st_13
this.Control[iCurrent+36]=this.st_14
this.Control[iCurrent+37]=this.st_owner
this.Control[iCurrent+38]=this.st_16
this.Control[iCurrent+39]=this.st_pastdue
this.Control[iCurrent+40]=this.st_17
this.Control[iCurrent+41]=this.st_inactivations
this.Control[iCurrent+42]=this.st_21
this.Control[iCurrent+43]=this.st_lastinactivation
this.Control[iCurrent+44]=this.st_intransit
this.Control[iCurrent+45]=this.st_22
this.Control[iCurrent+46]=this.st_credit
this.Control[iCurrent+47]=this.st_credit_wknd
this.Control[iCurrent+48]=this.dw_grades
this.Control[iCurrent+49]=this.cb_1
this.Control[iCurrent+50]=this.st_19
this.Control[iCurrent+51]=this.st_23
this.Control[iCurrent+52]=this.st_method
this.Control[iCurrent+53]=this.st_schedule
this.Control[iCurrent+54]=this.st_owner_phone1
this.Control[iCurrent+55]=this.st_owner_phone2
this.Control[iCurrent+56]=this.st_owner_cell
this.Control[iCurrent+57]=this.st_24
this.Control[iCurrent+58]=this.st_25
this.Control[iCurrent+59]=this.st_90
this.Control[iCurrent+60]=this.st_others
this.Control[iCurrent+61]=this.st_26
this.Control[iCurrent+62]=this.em_mo_daily_limit
this.Control[iCurrent+63]=this.cb_group_branch_financial
this.Control[iCurrent+64]=this.st_100
this.Control[iCurrent+65]=this.st_closing_day
this.Control[iCurrent+66]=this.st_27
this.Control[iCurrent+67]=this.st_insales_rep
this.Control[iCurrent+68]=this.st_29
this.Control[iCurrent+69]=this.st_regional_manager
this.Control[iCurrent+70]=this.cb_trans
this.Control[iCurrent+71]=this.cb_acc_statement
this.Control[iCurrent+72]=this.st_28
this.Control[iCurrent+73]=this.cb_2
this.Control[iCurrent+74]=this.cb_3
this.Control[iCurrent+75]=this.st_collector
this.Control[iCurrent+76]=this.st_30
this.Control[iCurrent+77]=this.sle_branch_id
this.Control[iCurrent+78]=this.st_branch_name
this.Control[iCurrent+79]=this.ddlb_phases
this.Control[iCurrent+80]=this.cb_update_phase
this.Control[iCurrent+81]=this.st_31
this.Control[iCurrent+82]=this.st_4
this.Control[iCurrent+83]=this.em_mo_season_limit
this.Control[iCurrent+84]=this.st_mo_daily_limit
this.Control[iCurrent+85]=this.st_mo_season_limit
this.Control[iCurrent+86]=this.gb_5
this.Control[iCurrent+87]=this.sle_comment
this.Control[iCurrent+88]=this.st_32
this.Control[iCurrent+89]=this.st_34
this.Control[iCurrent+90]=this.st_35
this.Control[iCurrent+91]=this.gb_2
this.Control[iCurrent+92]=this.gb_6
this.Control[iCurrent+93]=this.st_33
this.Control[iCurrent+94]=this.st_36
this.Control[iCurrent+95]=this.st_37
this.Control[iCurrent+96]=this.st_outstanding_mo
this.Control[iCurrent+97]=this.st_mo_available
this.Control[iCurrent+98]=this.st_38
this.Control[iCurrent+99]=this.uo_segment
this.Control[iCurrent+100]=this.gb_3
this.Control[iCurrent+101]=this.gb_4
end on

on w_acc_credit.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_statusaudit)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_11)
destroy(this.st_creditavailable)
destroy(this.em_creditlimit)
destroy(this.cb_updatecredit)
destroy(this.st_balance)
destroy(this.st_6)
destroy(this.st_oustanding)
destroy(this.dw_creditaudit)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.lst_status)
destroy(this.cb_updatestatus)
destroy(this.st_10)
destroy(this.st_status)
destroy(this.p_picture)
destroy(this.mle_statuscomments)
destroy(this.cb_updatecomments)
destroy(this.st_12)
destroy(this.st_15)
destroy(this.st_address)
destroy(this.st_salesrep)
destroy(this.st_18)
destroy(this.st_20)
destroy(this.st_phone1)
destroy(this.st_phone2)
destroy(this.st_fax)
destroy(this.st_system1)
destroy(this.st_system)
destroy(this.em_creditlimit_wknd)
destroy(this.st_13)
destroy(this.st_14)
destroy(this.st_owner)
destroy(this.st_16)
destroy(this.st_pastdue)
destroy(this.st_17)
destroy(this.st_inactivations)
destroy(this.st_21)
destroy(this.st_lastinactivation)
destroy(this.st_intransit)
destroy(this.st_22)
destroy(this.st_credit)
destroy(this.st_credit_wknd)
destroy(this.dw_grades)
destroy(this.cb_1)
destroy(this.st_19)
destroy(this.st_23)
destroy(this.st_method)
destroy(this.st_schedule)
destroy(this.st_owner_phone1)
destroy(this.st_owner_phone2)
destroy(this.st_owner_cell)
destroy(this.st_24)
destroy(this.st_25)
destroy(this.st_90)
destroy(this.st_others)
destroy(this.st_26)
destroy(this.em_mo_daily_limit)
destroy(this.cb_group_branch_financial)
destroy(this.st_100)
destroy(this.st_closing_day)
destroy(this.st_27)
destroy(this.st_insales_rep)
destroy(this.st_29)
destroy(this.st_regional_manager)
destroy(this.cb_trans)
destroy(this.cb_acc_statement)
destroy(this.st_28)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.st_collector)
destroy(this.st_30)
destroy(this.sle_branch_id)
destroy(this.st_branch_name)
destroy(this.ddlb_phases)
destroy(this.cb_update_phase)
destroy(this.st_31)
destroy(this.st_4)
destroy(this.em_mo_season_limit)
destroy(this.st_mo_daily_limit)
destroy(this.st_mo_season_limit)
destroy(this.gb_5)
destroy(this.sle_comment)
destroy(this.st_32)
destroy(this.st_34)
destroy(this.st_35)
destroy(this.gb_2)
destroy(this.gb_6)
destroy(this.st_33)
destroy(this.st_36)
destroy(this.st_37)
destroy(this.st_outstanding_mo)
destroy(this.st_mo_available)
destroy(this.st_38)
destroy(this.uo_segment)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;call super::open;


if not fn_check_user_menu_item('Credit Analysis') > 0 then 
	
	Messagebox("Permission Error","You are not authorize to access this option",StopSign!)
	Close(This)
	Return
	
end if

SELECT stringvalue
INTO : ii_MO_SEASON_START_DAY
FROM DBA.PARAMETERS
WHERE IDPARAMETER = "MO_SEASON_START_DAY";

SELECT stringvalue
INTO : ii_MO_SEASON_FINAL_DAY
FROM DBA.PARAMETERS
WHERE IDPARAMETER = "MO_SEASON_FINAL_DAY";
 

fn_cleanscreen()


String ls_id_branch

ls_id_branch = Message.StringParm

if not isnull(ls_id_branch) and len(trim(ls_id_branch)) > 3 then
	
	sle_branch_id.text = ls_id_branch
	sle_branch_id.triggerevent(modified!)

	cb_query.triggerevent(Clicked!)

end if

st_mo_daily_limit.Visible = true
st_mo_season_limit.Visible = false



end event

type st_1 from w2_master_report_agency`st_1 within w_acc_credit
integer x = 137
end type

type sle_idbranch from w2_master_report_agency`sle_idbranch within w_acc_credit
boolean visible = false
integer x = 421
integer y = 68
boolean enabled = false
end type

event sle_idbranch::modified;call super::modified;fn_cleanscreen()
end event

type cb_query from w2_master_report_agency`cb_query within w_acc_credit
integer x = 1815
integer y = 64
integer weight = 700
boolean default = false
end type

event cb_query::clicked;
String	ls_flag_branch, ls_status_branch, ls_last_status_comment, ls_fin_status, ls_fin_statuscomments, ls_closingday, ls_monthly_closing, ls_location, ls_regional_manager, ls_insales_rep
Double 	ld_creditlimit, ld_balance, ld_last_invoice, ld_oustanding, ld_creditlimit_wknd, ld_in_transit, ld_credit_to_use, ld_others, ld_creditavailable, ld_is_money_orders, ld_money_order_daily_limit, ld_money_order_season_limit, ld_outstanding_mo
String 	ls_phone1_branch, ls_phone2_branch, ls_fax_branch, ls_address_branch, ls_salesrep, ls_system, ls_depschedule, ls_depmethod, ls_collector
Integer 	li_phase, li_day 

Setpointer(Hourglass!)

fn_cleanscreen()

IF IsNull(st_branch_name.text) OR len (st_branch_name.text) = 0 THEN RETURN

is_branch_id = sle_branch_id.text

SELECT id_main_branch, id_flag_branch, id_status_branch, last_status_comment,
phone1_branch, phone2_branch, fax_branch, rtrim(address_branch)+' '+rtrim(name_city)+', '+rtrim(dba.city.id_state)+' '+rtrim(zip_branch),
dba.sfGetSalesRepresentative(id_branch), dba.sfGetBranchSystem(id_branch), IS_MONEY_ORDERS, ID_LOCATION
INTO :is_group, :ls_flag_branch,: ls_status_branch, :ls_last_status_comment,
:ls_phone1_branch, :ls_phone2_branch, :ls_fax_branch, :ls_address_branch, 
:ls_salesrep, :ls_system, :ld_is_money_orders, :ls_location
FROM dba.branch, dba.city
WHERE dba.branch.id_city = dba.city.id_city
AND id_branch = :is_branch_id ;

String ls_branch_owner, ls_owner_phone1, ls_owner_phone2, ls_owner_cell

SELECT dba.sfgetfullName(OWNER_FNAME,OWNER_MNAME,OWNER_LNAME,OWNER_SLNAME),
PHONE_1, 
PHONE_2, 
CELLULAR_NUMBER
INTO :ls_branch_owner,
:ls_owner_phone1, 
:ls_owner_phone2, 
:ls_owner_cell
FROM dba.BRANCH_OWNER_INFORMATION 
WHERE id_branch = :is_branch_id;

uo_segment.uof_query(is_branch_id)

if ls_status_branch = 'C' then
	lst_status.SelectItem("CLOSED",0)
else	
	if ls_flag_branch = 'A' then
		lst_status.SelectItem("OPEN (ACTIVE)",0)
	else
		lst_status.SelectItem("OPEN (INACTIVE)",0)
	end if
end if

Long ll_count
DateTime ld_lastinactivation
Decimal ld_pastdue

SELECT MAX(DATE_AUDIT), count(*)
INTO :ld_lastinactivation, :ll_count
FROM DBA.AUDIT_BRANCH_STATUS
WHERE id_branch = :is_branch_id
AND DATE_AUDIT > GETDATE() - 90
AND NEW_FLAG = 'I';

dw_statusaudit.retrieve(is_branch_id)
dw_creditaudit.retrieve(is_group)
dw_grades.retrieve(is_group)
sle_comment.text = ls_last_status_comment

st_phone1.text = ls_phone1_branch
st_phone2.text = ls_phone2_branch
st_fax.text = ls_fax_branch
st_address.text = ls_address_branch
st_salesrep.text = ls_salesrep
st_system.text = ls_system
st_owner.text = ls_branch_owner
st_owner_phone1.text = ls_owner_phone1
st_owner_phone2.text = ls_owner_phone2
st_owner_cell.text = ls_owner_cell


st_inactivations.text = String(ll_count)
st_lastinactivation.text = String(ld_lastinactivation,"mm/dd/yyyy")

SELECT AGM.NAME_AGENT AS MANAGER, RTRIM(CA.ADD_CASHIER)+' ('+BIR.BRANCH_CATEGORY+')'
INTO :ls_regional_manager, :ls_insales_rep
FROM dba.BRANCH_AGENT BA
	INNER JOIN dba.AGENT AG  ON AG.ID_AGENT = BA.ID_AGENT
	INNER JOIN dba.AGENT AGM ON AG.ID_MANAGER = AGM.ID_AGENT
	LEFT JOIN dba.BRANCH_INSALES_REP BIR ON BA.ID_BRANCH = BIR.ID_BRANCH
	LEFT JOIN dba.CASHIER CA ON BIR.ID_INSALES_REP = CA.ID_CASHIER
WHERE BA.ID_BRANCH = :is_branch_id ;

st_insales_rep.text = ls_insales_rep
st_regional_manager.text = ls_regional_manager

SELECT debt_limit, fin_status, FIN_STATUSCOMMENTS, debt_limit_wknd, dba.sfCalCurrentPastDue(id_main_branch), fin_schedule, isnull(FIN_COLLECTMETHOD,'')+isnull('/'+FIN_COLLECTMETHOD_2,''), MO_DAILY_LIMIT, fin_monthlyclosing, FIN_CLOSINGDAYCODE, id_phase, MO_SEASON_LIMIT
  INTO :ld_creditlimit, :ls_fin_status, :ls_fin_statuscomments, :ld_creditlimit_wknd, :ld_pastdue, :ls_depschedule, :ls_depmethod, :ld_money_order_daily_limit, :ls_monthly_closing, :ls_closingday, :li_phase, :ld_money_order_season_limit
  FROM DBA.group_branch
 WHERE id_main_branch = :is_group;
 
 
 IF ld_is_money_orders = 0 THEN
	em_mo_daily_limit.Enabled = false
	em_mo_season_limit.Enabled = false
	ld_money_order_daily_limit = 0
	ld_money_order_season_limit = 0 
ELSE
	em_mo_daily_limit.Enabled = True
	em_mo_season_limit.Enabled = True
END IF

fn_get_phase(li_phase)


 SELECT  A.DEBT_LIMIT,
			A.BALANCE,
			A.AMOUNTINSAFE,
			A.OUTSTANDING ,
			A.AMOUNTSALESPRODUCTS + A.AMOUNTSALESBILLPAY,
			DEBT_LIMIT_WKND,
			AVAILABLECREDIT
INTO  :ld_creditlimit, :ld_balance, :ld_in_transit, :ld_oustanding, :ld_others, :ld_creditlimit_wknd, :ld_creditavailable
FROM DBA.SENDCREDITTOBRANCH A
WHERE A.ID_BRANCH =  :is_branch_id;



// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Credito de fin de semana es de sabado medianoche a martes 1pm
ld_credit_to_use = ld_creditlimit
st_credit_wknd.visible = false
st_credit.visible = true

em_creditlimit.TextSize = -9
em_creditlimit_wknd.TextSize = -8

em_creditlimit.Weight = 700
em_creditlimit_wknd.Weight = 400


if upper(mid(DayName(today()),1,2)) = 'SA' or upper(mid(DayName(today()),1,2)) = 'SU' or upper(mid(DayName(today()),1,2)) = 'MO' then
	ld_credit_to_use = ld_creditlimit_wknd
	st_credit_wknd.visible = true
	st_credit.visible = false
	
	
	em_creditlimit.TextSize = -8
	em_creditlimit_wknd.TextSize = -9
	
	em_creditlimit.Weight = 400
	em_creditlimit_wknd.Weight = 700
	
end if

if upper(mid(DayName(today()),1,2)) = 'TU' and Now() < time('13:00:00') then
	ld_credit_to_use = ld_creditlimit_wknd
	st_credit_wknd.visible = true
	st_credit.visible = false	
end if
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	





if isnull(ls_fin_statuscomments) then ls_fin_statuscomments = ''

//SELECT Sum(dba.transaccion_diaria_payee.credit_trans_diaria) - Sum(dba.transaccion_diaria_payee.debit_trans_diaria)  
//INTO :ld_balance  
//FROM dba.transaccion_diaria_payee  
//WHERE dba.transaccion_diaria_payee.id_concepto_contable <> 'CPC'
//AND dba.transaccion_diaria_payee.id_concepto_contable <> 'PB'
//AND dba.transaccion_diaria_payee.id_group_trans_diaria = :is_group;



//SELECT dba.sfGetSafeonTransit(:is_group)
//INTO :ld_in_transit
//FROM DBA.DUAL;
//SELECT MAX(dba.relacion_invoices_payee.id_receiver)  
//  INTO :ld_last_invoice  
//  FROM dba.relacion_invoices_payee  
// WHERE dba.relacion_invoices_payee.id_branch_invoice = :is_branch_id;
//
//if isnull(ld_last_invoice) then ld_last_invoice = 0
//
//
//SELECT SUM(dba.receiver.net_amount_receiver + dba.receiver.telex_company + dba.receiver.total_modo_pago_comp + dba.receiver.exchange_company)  
//  INTO :ld_oustanding  
//  FROM dba.receiver  
// WHERE dba.receiver.id_branch = :is_branch_id 
//	AND dba.receiver.id_receiver > :ld_last_invoice;


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Selects oustanding orders
//
// [ AND DATE_RECEIVER > GETDATE()-2 ] --> IMPROVES PERFORMANCE, ALL THE ORDERS SHOULD BE INCLUDED
// 													 IN A CLOSING AN, ASSUMES THAT CLOSING ARE DAILY


// 05/05/2010 :  id_flag_receiver <> 'C' para que mache lo de la agencia!
/*
SELECT SUM(R.net_amount_receiver + R.telex_company + R.total_modo_pago_comp + R.exchange_company+R.total_modo_pago_comp+state_tax) 
  INTO :ld_oustanding 
  FROM dba.RECEIVER R, DBA.BRANCH B
 WHERE R.ID_BRANCH = B.ID_BRANCH
 	AND B.ID_MAIN_BRANCH = :is_group
   AND ID_FLAG_RECEIVER <> 'A'
 /*  AND id_flag_receiver <> 'C'*/
   AND DATE_RECEIVER > GETDATE()-2
   AND NET_AMOUNT_RECEIVER <> 0
   AND NOT EXISTS (SELECT 'X' FROM dba.relacion_invoices_payee P
                    WHERE R.ID_BRANCH = P.ID_BRANCH_INVOICE
                      AND R.ID_RECEIVER = P .ID_RECEIVER);*/

							 
// Selects oustanding orders
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if isnull(ld_oustanding) then ld_oustanding = 0

String ls_fin_status_name, ls_fin_status_icon

SELECT FIN_STATUS_NAME, FIN_STATUS_VC_ICON
INTO :ls_fin_status_name, :ls_fin_status_icon
FROM dba.GROUP_BRANCH_FINANTIAL_STATUS
WHERE FIN_STATUS_ID = :ls_fin_status;

if isnull(ls_fin_status_name) or ls_fin_status_name = '' then
	ls_fin_status_name = "UNKNOWN"
	ls_fin_status_icon = 'Help!'
end if

st_status.text = ls_fin_status_name
p_picture.picturename = ls_fin_status_icon

//if ls_fin_status = 'NO' then
//	st_status.text = "NORMAL"
//	p_picture.picturename = 'ScriptNo!'
//elseif ls_fin_status = 'AC' then
//	st_status.text = "ALTA VIGILANCIA (CARTERA)"
//	p_picture.picturename = 'Custom065!'
//elseif ls_fin_status = 'CO' then
//	st_status.text = "COLLECTION"
//	p_picture.picturename = 'Custom096!'
//elseif ls_fin_status = 'AG' then
//	st_status.text = "ALTA VIGILANCIA (GERENCIA)"
//	p_picture.picturename = 'Custom090!'
//else
//	st_status.text = "UNKNOWN"
//	p_picture.picturename = 'Help!'
//end if

p_picture.visible = true


em_creditlimit.text = string(ld_creditlimit)
em_creditlimit_wknd.text =  string(ld_creditlimit_wknd)
em_mo_daily_limit.text = string(ld_money_order_daily_limit,"$#,##0.00;[RED]($#,##0.00)")
em_mo_season_limit.text = string(ld_money_order_season_limit,"$#,##0.00;[RED]($#,##0.00)")

st_balance.text = string(ld_balance,"$#,##0.00;[RED]($#,##0.00)")
st_oustanding.text = string(ld_oustanding,"$#,##0.00;[RED]($#,##0.00)")
st_others.text = string(ld_others,"$#,##0.00;[RED]($#,##0.00)")
st_intransit.text = string(ld_in_transit,"$#,##0.00;[RED]($#,##0.00)")
st_schedule.text =  ls_depschedule
st_method.text = ls_depmethod

IF ls_monthly_closing = "Y" THEN
 	st_closing_day.text = ls_closingday
END IF


// Se cambia para que use el credit limict activo
//st_creditavailable.text = string( (ld_creditlimit + ld_balance - ld_oustanding + ld_in_transit),"$#,##0.00;[RED]($#,##0.00)")
st_creditavailable.text = string(ld_creditavailable,"$#,##0.00;[RED]($#,##0.00)")

mle_statuscomments.text = ls_fin_statuscomments

st_pastdue.text =  string(ld_pastdue,"$#,##0.00;[RED]($#,##0.00)")

cb_updatestatus.enabled = true
cb_updatecredit.enabled = true
cb_updatecomments.enabled = true

SELECT CA.NAME_CASHIER
INTO  :ls_collector
FROM DBA.BRANCH_AGENT BA INNER JOIN DBA.AGENT AG ON AG.ID_AGENT = BA.ID_AGENT
	INNER JOIN DBA.CASHIER CA ON CA.ID_CASHIER = AG.COLLECTOR_ID
WHERE BA.ID_BRANCH = :is_branch_id;

st_collector.text = ls_collector

li_day = Day(today())

em_mo_daily_limit.TextSize = -9
em_mo_season_limit.TextSize = -8

em_mo_daily_limit.Weight = 700
em_mo_season_limit.Weight = 400

st_mo_daily_limit.Visible = true
st_mo_season_limit.Visible = false
IF li_day >= ii_MO_SEASON_START_DAY OR li_day <= ii_MO_SEASON_FINAL_DAY THEN
	st_mo_daily_limit.Visible = false
	st_mo_season_limit.Visible = true
	
	em_mo_daily_limit.TextSize = -8
	em_mo_season_limit.TextSize = -9
	
	em_mo_daily_limit.Weight = 400
	em_mo_season_limit.Weight = 700
END IF

SELECT sum(AMOUNT)+sum(VIAMERICAS_FEE)
INTO  :ld_outstanding_mo
FROM dba.VCW_MONEYORDERS_SALES AS VMOS with(nolock)
WHERE ID_BRANCH= :is_branch_id
		AND CONVERT(DATE, TRANSACTION_DATE) = CONVERT(DATE, GETDATE());
		
IF isnull(ld_outstanding_mo) THEN ld_outstanding_mo = 0

st_outstanding_mo.text =  string(ld_outstanding_mo,"$#,##0.00;[RED]($#,##0.00)")

fn_calcular_mo_available()

Setpointer(Arrow!)
end event

type dw_1 from w2_master_report_agency`dw_1 within w_acc_credit
boolean visible = false
integer height = 1608
end type

type gb_1 from w2_master_report_agency`gb_1 within w_acc_credit
integer y = 4
integer width = 2194
integer height = 180
end type

type lst_agencies from w2_master_report_agency`lst_agencies within w_acc_credit
boolean visible = false
integer x = 768
integer y = 68
integer width = 1312
boolean enabled = false
end type

event lst_agencies::selectionchanged;call super::selectionchanged;fn_cleanscreen()
end event

event lst_agencies::constructor;//
end event

type dw_statusaudit from datawindow within w_acc_credit
integer x = 2327
integer y = 1728
integer width = 2834
integer height = 592
boolean bringtotop = true
string title = "none"
string dataobject = "dw_acc_credit_statusaudit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type st_2 from statictext within w_acc_credit
integer x = 2336
integer y = 1668
integer width = 718
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Status History"
boolean focusrectangle = false
end type

type st_3 from statictext within w_acc_credit
integer x = 50
integer y = 1500
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Available :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within w_acc_credit
integer x = 50
integer y = 1020
integer width = 393
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Credit Limit :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_creditavailable from statictext within w_acc_credit
integer x = 453
integer y = 1496
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type em_creditlimit from editmask within w_acc_credit
integer x = 453
integer y = 1016
integer width = 453
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
alignment alignment = right!
string mask = "#,###,###,##0.00"
end type

type cb_updatecredit from commandbutton within w_acc_credit
integer x = 1061
integer y = 1404
integer width = 814
integer height = 128
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update Credit"
end type

event clicked;Double ld_newcredit, ld_newcredit_weekends, ld_top, ld_top_wknd, ld_money_order_daily_limit, ld_money_order_season_limit
STRING s_error

if is_branch_id = 'NONE' then	
	Messagebox("Error","You must Query first!",StopSign!)
	return	
end if

ld_newcredit = Double(em_creditlimit.text)
ld_newcredit_weekends = Double(em_creditlimit_wknd.text)

if (ld_newcredit = 0 and ld_newcredit_weekends > 100) or (ld_newcredit > 100 and ld_newcredit_weekends = 0) then
	Messagebox("Atención","Uno de los dos creditos esta en 0.00, favor asegurese de poner ambos creditos.",Exclamation!)
	return
end if


IF DEC(em_mo_daily_limit.Text) > DEC(em_creditlimit.Text) THEN
	MessageBox('Alert','The money order daily limit amount cannot exceed the global credit limit' )
	Return
END IF

IF DEC(em_mo_season_limit.Text) > DEC(em_creditlimit.Text) THEN
	MessageBox('Alert','The money order season limit amount cannot exceed the global credit limit' )
	Return
END IF

IF DEC(em_mo_daily_limit.Text) <> DEC(em_mo_season_limit.Text)  THEN
	IF DEC(em_mo_daily_limit.Text) = 0 THEN
		MessageBox('Alert','The MO Daily Limit is zero (0). Please review the information and try it again' )
		Return
	ELSEIF DEC(em_mo_season_limit.Text) = 0 THEN
		MessageBox('Alert','The MO Season Limit is zero (0). Please review the information and try it again' )
		Return
	END IF
END IF 

IF DEC(em_mo_daily_limit.Text) > DEC(em_mo_season_limit.Text) THEN
	If Messagebox("Confirmation","The MO Season limit is lower than the MO Daily limit. Are you sure to continue?",Question!,YesNo! ) = 2 then	Return
END IF




/// ...................................................
// adicion 02/25/2009, valida los topes!

SELECT isnull(top_credit,0), isnull(top_credit_wknd,0)
	INTO :ld_top, :ld_top_wknd
	FROM dba.group_branch
 WHERE id_main_branch = :is_group;


if ld_top > 0 and ld_newcredit > ld_top then
	Messagebox("Atención","El credito ("+string(ld_newcredit,"$###,###,###.00")+") es mayor al limite permitido para esta agencia ("+string(ld_top,"$###,###,###.00")+").",Exclamation!)
	Return
end if

if ld_top_wknd > 0 and ld_newcredit_weekends > ld_top_wknd then
	Messagebox("Atención","El credito ("+string(ld_newcredit_weekends,"$###,###,###.00")+") es mayor al limite permitido para esta agencia ("+string(ld_top_wknd,"$###,###,###.00")+").",Exclamation!)
	Return
end if

/// ...................................................


ld_money_order_daily_limit= double(em_mo_daily_limit.text)
ld_money_order_season_limit= double(em_mo_season_limit.text)
	

If Messagebox("Confirmation","Are you sure you want to change the credit for "+trim(is_branch_id)+" to "+string(ld_newcredit,"$###,###,###.00")+"/"+string(ld_newcredit_weekends,"$###,###,###.00")+"?",Question!,YesNo! ) = 1 then

	UPDATE dba.group_branch
	SET debt_limit = :ld_newcredit,
	debt_limit_wknd = :ld_newcredit_weekends,
	ID_CASHIER_MODDEBITLIMIT = :gs_cashier,
	MO_DAILY_LIMIT = :ld_money_order_daily_limit,
	MO_SEASON_LIMIT = :ld_money_order_season_limit
	WHERE id_main_branch = :is_group;	

	IF SQLCA.SQLCODE <> 0 THEN
		s_error = SQLCA.SQLERRTEXT
		ROLLBACK;
		MessageBox("Error","Error updating credit.~r~n Error: "+s_error,StopSign!)
		Return
	END IF
	
	
	
	
	DECLARE spSendCreditToViaCash PROCEDURE FOR dba.spSendCreditToViaCasByAgency  @ID_MAIN_BRANCH = :is_group;

	EXECUTE spSendCreditToViaCash;
	IF SQLCA.sqlcode < 0  then
		s_error = "Error Executing spSendCreditToViaCash (Timer Should Recoonect) - "+SQLCA.SQLErrText 
		fn_email_notification2( "ebernal@viamericas.com", "Credit",s_error )
		
		ROLLBACK;
		MessageBox("Error","Error updating credit.~r~n Error: "+s_error,StopSign!)
		Return
		
	END IF
	
	COMMIT;
	dw_creditaudit.retrieve(is_group)
	fn_PublishToBranch()
	
	Messagebox("Process Completed","Credit has been changed and sent to the agency!")
	
end if

fn_calcular_mo_available()




end event

type st_balance from statictext within w_acc_credit
integer x = 453
integer y = 1176
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type st_6 from statictext within w_acc_credit
integer x = 41
integer y = 1420
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Outstanding :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_oustanding from statictext within w_acc_credit
integer x = 453
integer y = 1416
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type dw_creditaudit from datawindow within w_acc_credit
integer x = 2327
integer y = 984
integer width = 2830
integer height = 592
boolean bringtotop = true
string title = "none"
string dataobject = "dw_acc_credit_creditaudit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type st_5 from statictext within w_acc_credit
integer x = 2336
integer y = 920
integer width = 718
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Credit History"
boolean focusrectangle = false
end type

type st_7 from statictext within w_acc_credit
integer x = 55
integer y = 800
integer width = 677
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
string text = "Agency Credit"
boolean focusrectangle = false
end type

type st_8 from statictext within w_acc_credit
integer x = 50
integer y = 1604
integer width = 677
integer height = 104
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 32768
long backcolor = 67108864
string text = "Agency Status"
boolean focusrectangle = false
end type

type st_9 from statictext within w_acc_credit
integer x = 78
integer y = 1748
integer width = 421
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 32768
long backcolor = 67108864
boolean enabled = false
string text = "Current Status :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_status from dropdownpicturelistbox within w_acc_credit
integer x = 78
integer y = 1808
integer width = 795
integer height = 324
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean sorted = false
string item[] = {"OPEN (ACTIVE)","OPEN (INACTIVE)","CLOSED"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3}
string picturename[] = {"Start!","Warning!","StopSign!"}
long picturemaskcolor = 536870912
end type

type cb_updatestatus from commandbutton within w_acc_credit
integer x = 78
integer y = 2028
integer width = 795
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update Status"
end type

event clicked;
String ls_newflag, ls_newstatus, ls_laststatus, ls_reason, s_error

if is_branch_id = 'NONE' then	
	Messagebox("Error","You must Query first!",StopSign!)
	return	
end if


ls_laststatus = trim(sle_comment.text)

if lst_status.text = 'CLOSED' then	
	ls_newflag = 'I'
	ls_newstatus = 'C'	
else		
	ls_newstatus = 'O'
	if lst_status.text = 'OPEN (ACTIVE)' then
		ls_newflag = 'A'
	elseif lst_status.text = 'OPEN (INACTIVE)' then
		ls_newflag = 'I'
		
		// <><><><><><><><><><><><><><>
		// Obtains the inactivation Reason!
		ls_reason = ''
		Open(w_inactivation_reason)
		ls_reason = Message.StringParm
		//Messagebox("Error!",ls_reason,StopSign!)
		// <><><><><><><><><><><><><><>
		
	else
		Messagebox("Error!","Please select a status!",StopSign!)
		return
	end if
end if

If Messagebox("Confirmation","Are you sure you want to change the status for "+trim(is_branch_id)+" to "+lst_status.text+"?",Question!,YesNo! ) = 1 then

	if ls_newflag <> 'I' then SetNull(ls_reason)
	if not isnumber(ls_reason) then SetNull(ls_reason)
	
	UPDATE dba.SENDCREDITTOBRANCH 
		SET ID_FLAG_BRANCH = :ls_newflag
	 WHERE id_branch = :is_branch_id;	
	 
	
	IF SQLCA.SQLCODE <> 0 THEN
		s_error = SQLCA.SQLERRTEXT
		ROLLBACK;
		MessageBox("Error","Error updating status SENDCREDITTOBRANCH.~r~n Error: "+s_error,StopSign!)
		Return
	END IF
	

	UPDATE dba.branch 
		SET id_flag_branch = :ls_newflag,
			 id_status_branch = :ls_newstatus,
			 last_status_comment = :ls_laststatus,
			 LAST_INACTIVATION_TYPE = :ls_reason
	 WHERE id_branch = :is_branch_id;	
	
	IF SQLCA.SQLCODE <> 0 THEN
		s_error = SQLCA.SQLERRTEXT
		ROLLBACK;
		MessageBox("Error","Error updating status.~r~n Error: "+s_error,StopSign!)
		Return
	END IF
	
	COMMIT;
	
	dw_statusaudit.retrieve(is_branch_id)
	fn_PublishToBranch()
	
	Messagebox("Process Completed","Status has been changed and sent to the agency!")
	
end if

end event

type st_10 from statictext within w_acc_credit
integer x = 2254
integer y = 248
integer width = 677
integer height = 96
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "Agency Grade"
boolean focusrectangle = false
end type

type st_status from statictext within w_acc_credit
integer x = 2331
integer y = 356
integer width = 2830
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Test"
boolean border = true
boolean focusrectangle = false
end type

type p_picture from picture within w_acc_credit
integer x = 2235
integer y = 372
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "Custom096!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type mle_statuscomments from multilineedit within w_acc_credit
integer x = 3141
integer y = 440
integer width = 2025
integer height = 324
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
textcase textcase = upper!
integer limit = 250
end type

type cb_updatecomments from commandbutton within w_acc_credit
integer x = 4224
integer y = 764
integer width = 677
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update Comments"
end type

event clicked;String ls_fin_statuscomments

if is_branch_id = 'NONE' then	
	Messagebox("Error","You must Query first!",StopSign!)
	return	
end if

ls_fin_statuscomments = mle_statuscomments.text

If Messagebox("Confirmation","Are you sure you want to update financial comments for "+trim(is_branch_id)+"?",Question!,YesNo! ) = 1 then

	UPDATE dba.group_branch
		SET FIN_STATUSCOMMENTS = :ls_fin_statuscomments,
			 ID_CASHIER_MODDEBITLIMIT = :gs_cashier
	 WHERE id_main_branch = :is_group;
	

	IF SQLCA.SQLCODE <> 0 THEN
		MessageBox("Error","Error updating comments.~r~n Error: "+SQLCA.SQLERRTEXT,StopSign!)
		Return
	END IF

	dw_creditaudit.retrieve(is_group)
	fn_PublishToBranch()
	
	Messagebox("Process Completed","Comments has been updated!")
	
end if
end event

type st_12 from st_1 within w_acc_credit
integer x = 82
integer y = 288
integer width = 366
boolean bringtotop = true
string text = "Agency Phones:"
end type

type st_15 from st_1 within w_acc_credit
integer x = 169
integer y = 456
boolean bringtotop = true
string text = "Address:"
end type

type st_address from statictext within w_acc_credit
integer x = 462
integer y = 444
integer width = 1609
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_salesrep from statictext within w_acc_credit
integer x = 462
integer y = 528
integer width = 905
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_18 from st_1 within w_acc_credit
integer x = 1440
integer y = 288
integer width = 146
boolean bringtotop = true
string text = "Fax:"
end type

type st_20 from st_1 within w_acc_credit
integer x = 169
integer y = 540
boolean bringtotop = true
string text = "Sales Rep:"
end type

type st_phone1 from editmask within w_acc_credit
integer x = 462
integer y = 276
integer width = 471
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

type st_phone2 from editmask within w_acc_credit
integer x = 951
integer y = 276
integer width = 471
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

type st_fax from editmask within w_acc_credit
integer x = 1600
integer y = 276
integer width = 471
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

type st_system1 from st_1 within w_acc_credit
integer x = 1385
integer y = 532
integer width = 201
boolean bringtotop = true
string text = "System:"
end type

type st_system from statictext within w_acc_credit
integer x = 1600
integer y = 528
integer width = 471
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type em_creditlimit_wknd from editmask within w_acc_credit
integer x = 453
integer y = 1096
integer width = 453
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
alignment alignment = right!
string mask = "#,###,###,##0.00"
end type

type st_13 from statictext within w_acc_credit
integer x = 41
integer y = 1108
integer width = 402
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Cr. Weekends:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_14 from st_1 within w_acc_credit
integer x = 169
integer y = 204
boolean bringtotop = true
string text = "Owner:"
end type

type st_owner from statictext within w_acc_credit
integer x = 462
integer y = 192
integer width = 960
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type st_16 from st_1 within w_acc_credit
integer x = 1207
integer y = 2188
integer width = 242
integer height = 76
boolean bringtotop = true
string text = "Past Due:"
boolean border = true
end type

event doubleclicked;call super::doubleclicked;OpenSheet(w_acc_rep_pastdue, w_principal, 1, Original!)
end event

type st_pastdue from statictext within w_acc_credit
integer x = 1467
integer y = 2188
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type st_17 from st_1 within w_acc_credit
integer x = 1061
integer y = 2024
integer width = 393
integer height = 68
boolean bringtotop = true
string text = "Inact. last 3 mo.:"
end type

type st_inactivations from statictext within w_acc_credit
integer x = 1467
integer y = 2016
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type st_21 from st_1 within w_acc_credit
integer x = 1143
integer y = 2116
integer width = 315
integer height = 60
boolean bringtotop = true
string text = "Last Inact.:"
end type

type st_lastinactivation from statictext within w_acc_credit
integer x = 1467
integer y = 2104
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type st_intransit from statictext within w_acc_credit
integer x = 453
integer y = 1256
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type st_22 from statictext within w_acc_credit
integer x = 50
integer y = 1260
integer width = 398
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "In Safe(ViaSafe):"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_credit from statictext within w_acc_credit
integer x = 905
integer y = 1016
integer width = 78
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Webdings"
long textcolor = 16711680
long backcolor = 67108864
string text = "3"
boolean focusrectangle = false
end type

type st_credit_wknd from statictext within w_acc_credit
boolean visible = false
integer x = 905
integer y = 1096
integer width = 78
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Webdings"
long textcolor = 16711680
long backcolor = 67108864
string text = "3"
boolean focusrectangle = false
end type

type dw_grades from datawindow within w_acc_credit
integer x = 2331
integer y = 440
integer width = 814
integer height = 324
integer taborder = 50
boolean bringtotop = true
string dataobject = "dw_acc_grades"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_1 from commandbutton within w_acc_credit
integer x = 2725
integer y = 764
integer width = 421
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update Grades"
end type

event clicked;
If Messagebox("Confirmation","Are you sure you want to update grades for "+trim(is_branch_id)+"?",Question!,YesNo! ) = 1 then

	dw_grades.update()
	Messagebox("Process Completed","Grades has been updated!")
	
end if
end event

type st_19 from st_1 within w_acc_credit
integer x = 1074
integer y = 1772
integer width = 384
boolean bringtotop = true
string text = "Deposit Method:"
end type

event doubleclicked;call super::doubleclicked;fn_open_goup_branch_financial()
end event

type st_23 from st_1 within w_acc_credit
integer x = 1216
integer y = 1852
integer width = 229
boolean bringtotop = true
string text = "Schedule:"
end type

event doubleclicked;call super::doubleclicked;fn_open_goup_branch_financial()
end event

type st_method from statictext within w_acc_credit
integer x = 1467
integer y = 1760
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type st_schedule from statictext within w_acc_credit
integer x = 1467
integer y = 1844
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type st_owner_phone1 from editmask within w_acc_credit
integer x = 462
integer y = 360
integer width = 471
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

type st_owner_phone2 from editmask within w_acc_credit
integer x = 951
integer y = 360
integer width = 471
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

type st_owner_cell from editmask within w_acc_credit
integer x = 1600
integer y = 360
integer width = 471
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

type st_24 from st_1 within w_acc_credit
integer x = 78
integer y = 372
integer width = 366
boolean bringtotop = true
string text = "Owner Phones:"
end type

type st_25 from st_1 within w_acc_credit
integer x = 1440
integer y = 372
integer width = 146
boolean bringtotop = true
string text = "Cell:"
end type

type st_90 from statictext within w_acc_credit
integer x = 55
integer y = 1344
integer width = 398
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Others:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_others from statictext within w_acc_credit
integer x = 453
integer y = 1336
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type st_26 from statictext within w_acc_credit
integer x = 1015
integer y = 1016
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "MO Daily Limit:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_mo_daily_limit from editmask within w_acc_credit
string tag = "MO Season Limit"
integer x = 1417
integer y = 1016
integer width = 453
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
alignment alignment = right!
string mask = "#,###,###,##0.00"
end type

event getfocus;w_acc_credit.SetMicroHelp(this.Tag)
end event

type cb_group_branch_financial from commandbutton within w_acc_credit
integer x = 1303
integer y = 2300
integer width = 402
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Edit"
end type

event clicked;fn_open_goup_branch_financial()
end event

type st_100 from st_1 within w_acc_credit
integer x = 1161
integer y = 1940
integer width = 283
boolean bringtotop = true
string text = "Closing Day:"
end type

event doubleclicked;call super::doubleclicked;fn_open_goup_branch_financial()
end event

type st_closing_day from statictext within w_acc_credit
integer x = 1467
integer y = 1932
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type st_27 from st_1 within w_acc_credit
integer x = 64
integer y = 624
integer width = 389
boolean bringtotop = true
string text = "Inside Sales Rep:"
end type

type st_insales_rep from statictext within w_acc_credit
integer x = 462
integer y = 612
integer width = 873
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_29 from st_1 within w_acc_credit
integer x = 119
integer y = 704
integer width = 338
boolean bringtotop = true
string text = "Reg. Manager:"
end type

type st_regional_manager from statictext within w_acc_credit
integer x = 462
integer y = 696
integer width = 1019
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type cb_trans from commandbutton within w_acc_credit
integer x = 4512
integer y = 56
integer width = 535
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Deposit"
end type

event clicked;string ls_fax_deposit

Openwithparm(w_faxcomponent_deposits,"Accounting")

//se envia la agencia y el valor del deposito recibido de la ventana de depositos
ls_fax_deposit = message.stringparm
IF len(ls_fax_deposit) > 0 AND ls_fax_deposit <> "-none-" THEN
	OpenSheetwithparm(w_pago_agente_by_closing_ref, ls_fax_deposit, w_principal, 0, Original!)
END IF

end event

type cb_acc_statement from commandbutton within w_acc_credit
integer x = 3081
integer y = 56
integer width = 535
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Account Statement"
end type

event clicked;if is_branch_id = "NONE" then
	return
end if

//OpenWithParm(w_group_branch_transactions, is_branch_id)
//
//OpenSheet(w_closingfax,w_principal, 4, Original!)

OpenSheetWithParm(w_closingfax, is_branch_id, w_principal, 2, Original!)
end event

type st_28 from st_1 within w_acc_credit
integer x = 215
integer y = 1176
integer width = 229
integer height = 72
boolean bringtotop = true
string text = "Balance:"
boolean border = true
end type

event doubleclicked;call super::doubleclicked;string ls_group

if is_branch_id = "NONE" then
	return
end if

SELECT RTRIM(ID_MAIN_BRANCH)
	INTO:ls_group
	FROM DBA.BRANCH
	WHERE ID_BRANCH = :is_branch_id;

Openwithparm(w_despliegue_transacciones,ls_group)

end event

type cb_2 from commandbutton within w_acc_credit
integer x = 3813
integer y = 56
integer width = 535
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Commisions History"
end type

event clicked;string ls_group

if is_branch_id = "NONE" then
	return
end if

SELECT RTRIM(ID_MAIN_BRANCH)
	INTO:ls_group
	FROM DBA.BRANCH
	WHERE ID_BRANCH = :is_branch_id;

Openwithparm(w_despliegue_transacciones_comm,ls_group)
end event

type cb_3 from commandbutton within w_acc_credit
integer x = 2395
integer y = 56
integer width = 530
integer height = 100
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Transactions"
end type

event clicked;if is_branch_id = "NONE" then
	return
end if

OpenWithParm(w_group_branch_transactions, is_branch_id)
end event

type st_collector from statictext within w_acc_credit
integer x = 1550
integer y = 612
integer width = 521
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_30 from st_1 within w_acc_credit
integer x = 1339
integer y = 616
integer width = 210
boolean bringtotop = true
string text = "A/R Rep:"
end type

type sle_branch_id from singlelineedit within w_acc_credit
integer x = 421
integer y = 68
integer width = 343
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_name, id_branch

fn_cleanscreen()

st_branch_name.text = ""

id_branch = sle_branch_id.text

IF IsNull(id_branch) OR len (id_branch) = 0 THEN RETURN
	
SELECT  name_branch
INTO :ls_name
FROM dba.branch 
WHERE id_branch = :id_branch  AND id_type_branch IN ('A','R');

IF NOT IsNull(ls_name) AND len (ls_name) > 0 THEN
	st_branch_name.text = ls_name
ELSE
	MessageBox("Alert", "Branch Id: " + id_branch + " is not a valid Id.")
	sle_branch_id.text = ""
END IF

uo_segment.uof_clear()
end event

type st_branch_name from statictext within w_acc_credit
integer x = 777
integer y = 68
integer width = 1024
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type ddlb_phases from dropdownlistbox within w_acc_credit
integer x = 78
integer y = 2204
integer width = 795
integer height = 324
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"1 - Normal/Current","2 - Inactive","3 - SSG no PPA","4 - PPA (Current)","5 - Declared Default on PPA","6 - Collection","7 - Post Write Off Collection Efforts","8 - Closed Agent with no write off"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_id_phase = index
end event

type cb_update_phase from commandbutton within w_acc_credit
integer x = 78
integer y = 2308
integer width = 795
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update"
end type

event clicked;fn_set_phase()
end event

type st_31 from statictext within w_acc_credit
integer x = 87
integer y = 2144
integer width = 174
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 32768
long backcolor = 67108864
string text = "Phase:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_acc_credit
integer x = 1015
integer y = 1096
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "MO Season Limit:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_mo_season_limit from editmask within w_acc_credit
string tag = "MO Season Limit"
integer x = 1417
integer y = 1096
integer width = 453
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
alignment alignment = right!
string mask = "#,###,###,##0.00"
end type

event getfocus;//MessageBox("Information", )

//getfocus()

w_acc_credit.SetMicroHelp("Temporada definida del día " + string(ii_MO_SEASON_START_DAY) + " al día " + string(ii_MO_SEASON_FINAL_DAY) + " del mes siguiente / Season applies from day " + string(ii_MO_SEASON_START_DAY) + " to day " + string(ii_MO_SEASON_FINAL_DAY) + " of the next month.")
end event

event losefocus;w_acc_credit.SetMicroHelp("")
end event

type st_mo_daily_limit from statictext within w_acc_credit
integer x = 1870
integer y = 1020
integer width = 78
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Webdings"
long textcolor = 16711680
long backcolor = 67108864
string text = "3"
boolean focusrectangle = false
end type

type st_mo_season_limit from statictext within w_acc_credit
integer x = 1870
integer y = 1096
integer width = 78
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Webdings"
long textcolor = 16711680
long backcolor = 67108864
string text = "3"
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_acc_credit
integer x = 18
integer y = 152
integer width = 2194
integer height = 644
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type sle_comment from singlelineedit within w_acc_credit
integer x = 78
integer y = 1924
integer width = 795
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
textcase textcase = upper!
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

type st_32 from statictext within w_acc_credit
integer x = 55
integer y = 796
integer width = 677
integer height = 96
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
string text = "Agency Credit"
boolean focusrectangle = false
end type

type st_34 from statictext within w_acc_credit
integer x = 210
integer y = 920
integer width = 553
integer height = 84
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 8388608
long backcolor = 67108864
string text = "General"
boolean focusrectangle = false
end type

type st_35 from statictext within w_acc_credit
integer x = 978
integer y = 920
integer width = 663
integer height = 84
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 8388608
long backcolor = 67108864
string text = "Money Orders"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_acc_credit
integer x = 23
integer y = 1684
integer width = 905
integer height = 732
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type gb_6 from groupbox within w_acc_credit
integer x = 987
integer y = 1684
integer width = 978
integer height = 732
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type st_33 from statictext within w_acc_credit
integer x = 55
integer y = 812
integer width = 677
integer height = 64
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
string text = "Agency Credit"
boolean focusrectangle = false
end type

type st_36 from statictext within w_acc_credit
integer x = 1015
integer y = 1176
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Outstanding:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_37 from statictext within w_acc_credit
integer x = 1015
integer y = 1252
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Available:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_outstanding_mo from statictext within w_acc_credit
integer x = 1417
integer y = 1176
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type st_mo_available from statictext within w_acc_credit
integer x = 1417
integer y = 1256
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type st_38 from statictext within w_acc_credit
integer x = 1010
integer y = 1604
integer width = 677
integer height = 104
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Financial Details"
boolean focusrectangle = false
end type

type uo_segment from uo_segmentation within w_acc_credit
integer x = 2944
integer y = 248
integer width = 430
integer taborder = 40
boolean bringtotop = true
end type

on uo_segment.destroy
call uo_segmentation::destroy
end on

type gb_3 from groupbox within w_acc_credit
integer x = 32
integer y = 888
integer width = 1938
integer height = 716
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

type gb_4 from groupbox within w_acc_credit
integer x = 2290
integer y = 4
integer width = 2862
integer height = 180
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
end type

