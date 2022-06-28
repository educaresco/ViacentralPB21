$PBExportHeader$w_sales_rep_commision_closing.srw
forward
global type w_sales_rep_commision_closing from pfc_w_sheet
end type
type dw_2 from datawindow within w_sales_rep_commision_closing
end type
type dw_1 from datawindow within w_sales_rep_commision_closing
end type
type cb_1 from commandbutton within w_sales_rep_commision_closing
end type
type st_4 from statictext within w_sales_rep_commision_closing
end type
type st_3 from statictext within w_sales_rep_commision_closing
end type
type em_date2 from pfc_u_em within w_sales_rep_commision_closing
end type
type em_date1 from pfc_u_em within w_sales_rep_commision_closing
end type
type gb_1 from groupbox within w_sales_rep_commision_closing
end type
end forward

global type w_sales_rep_commision_closing from pfc_w_sheet
integer x = 214
integer y = 221
integer width = 1609
integer height = 380
string title = "Commissions Monthly Closing"
boolean resizable = false
integer animationtime = 199
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
st_4 st_4
st_3 st_3
em_date2 em_date2
em_date1 em_date1
gb_1 gb_1
end type
global w_sales_rep_commision_closing w_sales_rep_commision_closing

type variables
datetime idt_first_day_of_the_month, idt_last_day_of_the_month
end variables

forward prototypes
public subroutine fn_commision_transactions ()
public subroutine fn_commission_bonus ()
public subroutine fn_commission_bonus_dormant ()
end prototypes

public subroutine fn_commision_transactions ();
string s_id_agent, s_id_branch, s_id_branch_reasing
double d_ransaction_number_total, d_ransaction_number_pos, d_ransaction_number_neg, d_trans_reg, d_trans_new, d_trans_spe, d_total_reg_boa,d_transactions_reg_dec_boa, d_trnasactions_case_nquiroga
double d_total_reg_branch, d_total_new_branch, d_total_spe_branch, d_current_row, ld_total_transactions, d_id_receiver, d_transactions_reg_boa, d_transactions_new_dec, d_trnasactions_case_nquiroga_boa
datetime date_from, date_to, date_paid

date_paid = datetime(today(), now())

date_from = idt_first_day_of_the_month
date_to = idt_last_day_of_the_month


//***********************************************************
// DELETE THE PREVIUS RECORD AND CREATE A AUDIT RECORD
//
//***********************************************************

DELETE FROM DBA.SALES_REP_TRANSACTIONS_PAID;


DECLARE SALES_REP  CURSOR FOR
SELECT ID_AGENT
FROM dba.AGENT
WHERE STATUS_AGENT = 'A';

OPEN SALES_REP;

FETCH SALES_REP INTO :s_id_agent;

DO WHILE SQLCA.SQLCODE <>100
	
	d_trans_reg = 0
	d_trans_new = 0
	d_trans_spe = 0

	SELECT TRANS_REG, TRANS_NEW, TRANS_ESP
	INTO :d_trans_reg, :d_trans_new, :d_trans_spe
	FROM DBA.COMISION_AGENTES_TRANSACTION
	WHERE ID_AGENT = :s_id_agent;
	
	d_ransaction_number_total = 0
	d_ransaction_number_pos = 0
	d_ransaction_number_neg = 0
	ld_total_transactions = 0
	d_transactions_reg_boa = 0
	d_transactions_new_dec = 0
	d_trnasactions_case_nquiroga = 0
	d_trnasactions_case_nquiroga_boa = 0
	
	//***************************************************************************************************************
	//
	//COMMISIONS FOR REGULAR AGENCIES -----------------------------------------------------------------------------------------------------------------------
	
	
	SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
INTO :d_ransaction_number_total
FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
	    	   dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
	  	   dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
	  	   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
	  	   dba.receiver.id_flag_receiver <> 'A' and
	  	   dba.BRANCH_AGENT.id_agent = :s_id_agent and 
	  	   (dba.COMISION_AGENTES_TRANSACTION.TIME_NEW < DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER) OR
	   	   DBA.RECEIVER.ID_BRANCH IN (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change))AND
	   	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO' )  ;
																										
																										
	if s_id_agent = '17' or s_id_agent = '151' or s_id_agent = '153' or s_id_agent = '123' or s_id_agent = '63' or s_id_agent = '107' or s_id_agent = '73' or s_id_agent = '114' then
		
		
		SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
		INTO :d_transactions_new_dec
		FROM dba.receiver a, dba.branch_agent b,dba.comision_agentes_transaction c, dba.branch d
		WHERE a.id_branch = b.id_branch and
		b.id_agent = c.id_agent and
		b.id_branch = d.id_branch and
		a.date_receiver between :date_from and :date_to  and
		90 >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(b.id_branch), a.DATE_RECEIVER )and
		a.id_flag_receiver <> 'A' and
		(ISNULL(b.special_branch,'NO') = 'NO') and
		date_cre_branch < '01-01-2010 00:00:00'
		and b.id_agent in( '12','151','153','123','63','107','73','114') and
		b.id_agent = :s_id_agent;
		
	end if
																										
	if s_id_agent = '94' then
		
		d_trnasactions_case_nquiroga = 0
				
		SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
		INTO :d_trnasactions_case_nquiroga
		FROM dba.receiver a, dba.branch_agent b,dba.comision_agentes_transaction c, dba.branch d
		WHERE a.id_branch = b.id_branch and
		b.id_agent = c.id_agent and
		b.id_branch = d.id_branch and
		a.date_receiver between :date_from and :date_to  and
		180 >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(b.id_branch), a.DATE_RECEIVER )and
		a.id_flag_receiver <> 'A' and
		(ISNULL(b.special_branch,'NO') = 'NO') and
		date_cre_branch < '01-01-2010 00:00:00'
		and b.id_agent in( '94') and
		b.id_agent = :s_id_agent;
		
	end if
																										


//	SELECT count(dba.BRANCH_AGENT.id_branch)
//	INTO :d_ransaction_number_pos
//	FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
//	WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//	  dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
//	  dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
//	  dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
//	  dba.receiver.id_flag_receiver <> 'A' and
//	  dba.BRANCH_AGENT.id_agent = :s_id_agent and 
//	  dba.RECEIVER.ID_RECEIVER > 0 AND
//	  (dba.COMISION_AGENTES_TRANSACTION.TIME_NEW < DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER) OR
//	   DBA.RECEIVER.ID_BRANCH IN (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change))AND
//	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO' ) ;
//		
//		SELECT count(dba.BRANCH_AGENT.id_branch)
//		INTO :d_ransaction_number_neg
//		FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION
//		WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//		dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND 
//		dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
//		dba.receiver.date_receiver BETWEEN :date_from and :date_to AND 
//		 dba.receiver.id_flag_receiver <> 'A' and
//		dba.BRANCH_AGENT.id_agent = :s_id_agent and 
//		dba.RECEIVER.ID_RECEIVER < 0 AND
//		(dba.COMISION_AGENTES_TRANSACTION.TIME_NEW < DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER)  OR
//	   DBA.RECEIVER.ID_BRANCH IN (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change))AND
//		(ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') ;
		
		

	if isnull(d_ransaction_number_total) then d_ransaction_number_total = 0
	
	if isnull(d_trnasactions_case_nquiroga) then d_trnasactions_case_nquiroga = 0
	
	if isnull(d_transactions_new_dec) then d_transactions_new_dec = 0
	 
		 d_ransaction_number_total = d_ransaction_number_total - d_trnasactions_case_nquiroga - d_transactions_new_dec
	 
	
	//d_ransaction_number_total = d_ransaction_number_pos - d_ransaction_number_neg
	
	d_total_reg_branch = d_ransaction_number_total * d_trans_reg
	

	
	ld_total_transactions = d_ransaction_number_total

	//***************************************************************************************************************
	//
	//COMMISIONS FOR NEW AGENCIES -----------------------------------------------------------------------------------------------------------------------
	
	
	d_ransaction_number_total = 0
	d_ransaction_number_pos = 0
	d_ransaction_number_neg = 0
	d_transactions_reg_boa = 0
	
	SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
INTO :d_ransaction_number_total
FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
	  	   dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
	 	   dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
	  	   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
	 	   dba.BRANCH_AGENT.id_agent = :s_id_agent and
	   	   dba.receiver.id_flag_receiver <> 'A' and
	  	   dba.COMISION_AGENTES_TRANSACTION.TIME_NEW >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER )AND
	 	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') and
	 	   dba.receiver.id_branch not in (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change) and
		   dba.receiver.id_branch not in (select dba.branch.id_branch 
												    from dba.branch,dba.group_branch, dba.DEPOSIT_CODES
										  		    where dba.branch.id_main_branch =   dba.group_branch.id_main_branch and
												    fin_depdepositcode = deposit_code and
												    isnull(fin_depdepositcode,'') <> '' and
												    id_banco = 'B OF A') ;
													 
	SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
		INTO :d_transactions_reg_boa 
		FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
		WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
	  	   dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
	 	   dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
	  	   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND 
	 	   dba.BRANCH_AGENT.id_agent = :s_id_agent and
	   	   dba.receiver.id_flag_receiver <> 'A' and
	  	   dba.COMISION_AGENTES_TRANSACTION.TIME_NEW >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER )AND
	 	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') and
	 	   dba.receiver.id_branch not in (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change)and
		   dba.receiver.id_branch in (select dba.branch.id_branch
										  from dba.branch,dba.group_branch, dba.DEPOSIT_CODES
										  where dba.branch.id_main_branch =   dba.group_branch.id_main_branch and
												fin_depdepositcode = deposit_code and
												isnull(fin_depdepositcode,'') <> '' and
												id_banco = 'B OF A');
												
												
	// ********************************************************************************************************
	//  TEMPORARY SOLUTION FOR POLICIES CHANGE 
     // ******************************************************************************************************** 												
												
	SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
	INTO :d_transactions_new_dec
	FROM dba.receiver a, dba.branch_agent b,dba.comision_agentes_transaction c, dba.branch d
	WHERE a.id_branch = b.id_branch and
	b.id_agent = c.id_agent and
	b.id_branch = d.id_branch and
	a.date_receiver between :date_from and :date_to  and
	90 >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(b.id_branch), a.DATE_RECEIVER )and
	a.id_flag_receiver <> 'A' and
	(ISNULL(b.special_branch,'NO') = 'NO') and
	date_cre_branch < '01-01-2010 00:00:00' and 
	b.id_agent in( '12','151','153','123','63','107','73','114') and
	b.id_agent = :s_id_agent and
	b.id_branch not in (select dba.branch.id_branch 
												    from dba.branch,dba.group_branch, dba.DEPOSIT_CODES
										  		    where dba.branch.id_main_branch =   dba.group_branch.id_main_branch and
												    fin_depdepositcode = deposit_code and
												    isnull(fin_depdepositcode,'') <> '' and
												    id_banco = 'B OF A');
													 
	
	SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
	INTO :d_transactions_reg_dec_boa
	FROM dba.receiver a, dba.branch_agent b,dba.comision_agentes_transaction c, dba.branch d
	WHERE a.id_branch = b.id_branch and
	b.id_agent = c.id_agent and
	b.id_branch = d.id_branch and
	a.date_receiver between :date_from and :date_to  and
	90 >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(b.id_branch), a.DATE_RECEIVER )and
	a.id_flag_receiver <> 'A' and
	(ISNULL(b.special_branch,'NO') = 'NO') and
	date_cre_branch < '01-01-2010 00:00:00' and 
	b.id_agent in( '12','151','153','123','63','107','73','114') and
	b.id_agent = :s_id_agent and
	b.id_branch  in (select dba.branch.id_branch 
												    from dba.branch,dba.group_branch, dba.DEPOSIT_CODES
										  		    where dba.branch.id_main_branch =   dba.group_branch.id_main_branch and
												    fin_depdepositcode = deposit_code and
												    isnull(fin_depdepositcode,'') <> '' and
												    id_banco = 'B OF A');
													 
	if 	s_id_agent = '94' then
		
		d_trnasactions_case_nquiroga = 0
		d_trnasactions_case_nquiroga_boa = 0
		
	SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
	INTO :d_trnasactions_case_nquiroga
	FROM dba.receiver a, dba.branch_agent b,dba.comision_agentes_transaction c, dba.branch d
	WHERE a.id_branch = b.id_branch and
	b.id_agent = c.id_agent and
	b.id_branch = d.id_branch and
	a.date_receiver between :date_from and :date_to  and
	180 >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(b.id_branch), a.DATE_RECEIVER )and
	a.id_flag_receiver <> 'A' and
	(ISNULL(b.special_branch,'NO') = 'NO') and
	date_cre_branch < '01-01-2010 00:00:00'
	and b.id_agent in( '94') and
	b.id_agent = :s_id_agent and
	b.id_branch  not in (select dba.branch.id_branch 
							 from dba.branch,dba.group_branch, dba.DEPOSIT_CODES
							 where dba.branch.id_main_branch =   dba.group_branch.id_main_branch and
							 fin_depdepositcode = deposit_code and
							 isnull(fin_depdepositcode,'') <> '' and
							 id_banco = 'B OF A');
							 
							 
	SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
	INTO :d_trnasactions_case_nquiroga_boa
	FROM dba.receiver a, dba.branch_agent b,dba.comision_agentes_transaction c, dba.branch d
	WHERE a.id_branch = b.id_branch and
	b.id_agent = c.id_agent and
	b.id_branch = d.id_branch and
	a.date_receiver between :date_from and :date_to  and
	180 >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(b.id_branch), a.DATE_RECEIVER )and
	a.id_flag_receiver <> 'A' and
	(ISNULL(b.special_branch,'NO') = 'NO') and
	date_cre_branch < '01-01-2010 00:00:00'
	and b.id_agent in( '94') and
	b.id_agent = :s_id_agent and
	b.id_branch  in (select dba.branch.id_branch 
							 from dba.branch,dba.group_branch, dba.DEPOSIT_CODES
							 where dba.branch.id_main_branch =   dba.group_branch.id_main_branch and
							 fin_depdepositcode = deposit_code and
							 isnull(fin_depdepositcode,'') <> '' and
							 id_banco = 'B OF A');
							 
	end if
													 
	
// **************************************************************************************************************	
	
//	SELECT count(dba.BRANCH_AGENT.id_branch)
//	INTO :d_ransaction_number_pos
//	FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
//	WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//	  dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
//	  dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
//	  dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
//	  dba.BRANCH_AGENT.id_agent = :s_id_agent and
//	   dba.receiver.id_flag_receiver <> 'A' and
//	  dba.RECEIVER.ID_RECEIVER > 0 AND
//	  dba.COMISION_AGENTES_TRANSACTION.TIME_NEW >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER )AND
//	  (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') and
//	  dba.receiver.id_branch not in (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change);
//	  
//	  SELECT count(dba.BRANCH_AGENT.id_branch)
//	  INTO :d_ransaction_number_neg
//	  FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION
//	  WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//	  dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
//	  dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
//	  dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
//	   dba.receiver.id_flag_receiver <> 'A' and
//	  dba.BRANCH_AGENT.id_agent = :s_id_agent and 
//	  dba.RECEIVER.ID_RECEIVER < 0 AND
//	  dba.COMISION_AGENTES_TRANSACTION.TIME_NEW >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER)AND
//	  (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO')and
//	  dba.receiver.id_branch not in (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change);
	  
	  //d_ransaction_number_total = d_ransaction_number_pos - d_ransaction_number_neg
	  
	  if isnull(d_ransaction_number_total) then d_ransaction_number_total = 0
	  
	  if isnull(d_transactions_reg_boa) then d_transactions_reg_boa = 0
	  
	  
	  
	  // ********************************************************************************************************
	//  TEMPORARY SOLUTION FOR POLICIES CHANGE 
     // ******************************************************************************************************** 	
	  
	  if isnull(d_transactions_reg_dec_boa) then d_transactions_reg_dec_boa = 0
	  
	  if isnull(d_transactions_new_dec) then d_transactions_new_dec = 0
	  
	  if isnull(d_trnasactions_case_nquiroga_boa) then d_trnasactions_case_nquiroga_boa = 0
	  
	  if isnull(d_trnasactions_case_nquiroga) then d_trnasactions_case_nquiroga = 0
	  
	if d_trnasactions_case_nquiroga_boa > 0 then
	  
	  d_transactions_reg_boa = d_transactions_reg_boa + d_transactions_reg_dec_boa + d_trnasactions_case_nquiroga_boa
	  
	else
		
		d_transactions_reg_boa = d_transactions_reg_boa + d_transactions_reg_dec_boa
		
	end if
	
	if d_trnasactions_case_nquiroga > 0 then
		  
	  d_ransaction_number_total = d_ransaction_number_total + d_transactions_new_dec + d_trnasactions_case_nquiroga
	
	else
		
	  d_ransaction_number_total = d_ransaction_number_total + d_transactions_new_dec
	  
	end if
	  
	  //*********************************************************************************************************
	  
	  d_total_reg_boa =  d_transactions_reg_boa * d_trans_reg
	  
	  d_total_new_branch = d_ransaction_number_total * d_trans_new
	  
	  d_total_new_branch = d_total_new_branch + d_total_reg_boa
	  
	  ld_total_transactions = ld_total_transactions + d_ransaction_number_total + d_transactions_reg_boa
	  
	//***************************************************************************************************************
	//
	//COMMISIONS FOR SPECIAL AGENCIES -----------------------------------------------------------------------------------------------------------------------  
	
	d_ransaction_number_total = 0
	d_ransaction_number_pos = 0
	d_ransaction_number_neg = 0
	  

   SELECT count(dba.BRANCH_AGENT.id_branch)
   INTO :d_ransaction_number_pos
   FROM dba.RECEIVER  , dba.BRANCH_AGENT 
   WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND 
   dba.receiver.id_flag_receiver <> 'A' and
   dba.BRANCH_AGENT.id_agent =:s_id_agent and
   dba.BRANCH_AGENT.special_branch = 'YES' and 
   dba.RECEIVER.ID_RECEIVER > 0 ;
		
   SELECT count(dba.BRANCH_AGENT.id_branch)
   INTO :d_ransaction_number_neg
   FROM dba.RECEIVER  , dba.BRANCH_AGENT 
   WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
   dba.receiver.id_flag_receiver <> 'A' and
   dba.BRANCH_AGENT.id_agent =:s_id_agent and
   dba.BRANCH_AGENT.special_branch = 'YES' and
   dba.RECEIVER.ID_RECEIVER <0;
	
	d_ransaction_number_total = d_ransaction_number_pos - d_ransaction_number_neg
	  
	  d_total_spe_branch = d_ransaction_number_total * d_trans_spe
	  
	  ld_total_transactions = ld_total_transactions + d_ransaction_number_total
	  
	//***************************************************************************************************************
	//
     //INSERT COMMISIONS INTO TABLE SALES_REP_TRANSACTIONS_PAID ----------------------------------------------------------------------------------
	  
	  INSERT INTO dba.SALES_REP_TRANSACTIONS_PAID
	  VALUES (:s_id_agent,
	  			:d_total_reg_branch,
				:d_total_spe_branch,  
				:d_total_new_branch,
				:date_from,
				:date_to,
				:ld_total_transactions,
				0,
				:d_transactions_reg_boa);
				
				
	//****************************************************************************************************************
	//
	// INSERT COMMISSION PAID PER AGENCY IN TABLE  DBA.AGENCY_SALES_REP_COMM----------------------------------------------------------------
	
	//****** REGULAR TRANSACTIONS ***************************************************************
	//
	//*******************************************************************************************
	
	
//DECLARE CUR_REASIGN_AGENCY CURSOR FOR
//	SELECT ID_BRANCH
//	FROM DBA.BRANCH_AGENT
//	WHERE ID_AGENT = :s_id_agent
//	AND DATE_BEGIN BETWEEN :date_from and :date_to;
//	
//	OPEN CUR_REASIGN_AGENCY;
//	
//	FETCH CUR_REASIGN_AGENCY INTO :s_id_branch_reasing;
//	
//	DO WHILE SQLCA.SQLCODE <> 100
//	DECLARE CUR_REG_TRANS_AGENCYS CURSOR FOR
//	SELECT dba.receiver.id_branch, dba.receiver.id_receiver
//	FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
//	WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//	  dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
//	  dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
//	  dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
//	  dba.receiver.id_flag_receiver <> 'A' and
//	  dba.BRANCH_AGENT.id_agent = :s_id_agent and 
//	  dba.RECEIVER.ID_RECEIVER > 0 AND
//	  dba.RECEIVER.ID_BRANCH = :s_id_branch_reasing AND
//	  dba.receiver.id_branch + cast(dba.receiver.id_receiver as varchar) not in (SELECT dba.receiver.id_branch + cast(dba.receiver.id_receiver * -1 as varchar)
//																      								   FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION
//																									   WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//																	  											dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND 
//																	  											dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
//																	  											dba.receiver.date_receiver BETWEEN :date_from and :date_to AND 
//																	  											dba.receiver.id_flag_receiver <> 'A' and
//																	  											dba.BRANCH_AGENT.id_agent =:s_id_agent and 
//																	  											dba.RECEIVER.ID_RECEIVER < 0 AND
//																	  											(dba.COMISION_AGENTES_TRANSACTION.TIME_NEW < DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER)  OR
//																      											DBA.RECEIVER.ID_BRANCH IN (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change))AND
//																	  											(ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') ) and
//	  (dba.COMISION_AGENTES_TRANSACTION.TIME_NEW < DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER) OR
//	   DBA.RECEIVER.ID_BRANCH IN (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change))AND
//	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO' ) ;
//		
//		OPEN CUR_REG_TRANS_AGENCYS;
//		
//		FETCH CUR_REG_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver ;
//		
//		IF SQLCA.SQLCODE <> 100 THEN
//		
//			DO WHILE SQLCA.SQLCODE <> 100 
//			
//				UPDATE DBA.SALES_REP_COMMISSION_PER_WIRE
//				SET ID_SALES_REP = :s_id_agent,
//					  COMMISSION_PAID = :d_trans_reg,
//					  DATE_PAID = GETDATE()
//				WHERE ID_BRANCH =  :s_id_branch
//				AND  ID_RECEIVER = :d_id_receiver;
//						
//				FETCH CUR_REG_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver;
//				
//			LOOP
//			
//		ELSE
//			
//			CLOSE CUR_REG_TRANS_AGENCYS;
//			
//			DECLARE CUR_NEW_TRANS_AGENCYS CURSOR FOR
//			SELECT dba.receiver.id_branch, dba.receiver.id_RECEIVER
//			FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
//			WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//	  	   dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
//	 	   dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
//	  	   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
//	 	   dba.BRANCH_AGENT.id_agent =:s_id_agent and
//	   	   dba.receiver.id_flag_receiver <> 'A' and
//		   dba.receiver.id_receiver > 0 AND
//             dba.RECEIVER.ID_BRANCH = :s_id_branch_reasing AND
//		   dba.receiver.id_branch + cast(dba.receiver.id_receiver as varchar) not in (SELECT dba.receiver.id_branch + cast(dba.receiver.id_receiver * -1 as varchar)
//																					  						FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
//																					  						WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//																													dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
//																													 dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
//																													 dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
//																													 dba.BRANCH_AGENT.id_agent = :s_id_agent and
//																													 dba.receiver.id_flag_receiver <> 'A' and
//																													 dba.receiver.id_receiver < 0 AND
//																													dba.COMISION_AGENTES_TRANSACTION.TIME_NEW >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER )AND
//																													(ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') and
//																													dba.receiver.id_branch not in (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change)) AND
//	  	   dba.COMISION_AGENTES_TRANSACTION.TIME_NEW >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER )AND
//	 	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') and
//	 	   dba.receiver.id_branch not in (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change)and
//	 	   dba.receiver.id_branch not in (select dba.branch.id_branch 
//												    from dba.branch,dba.group_branch, dba.DEPOSIT_CODES
//										  		    where dba.branch.id_main_branch =   dba.group_branch.id_main_branch and
//												    fin_depdepositcode = deposit_code and
//												    isnull(fin_depdepositcode,'') <> '' and
//												    id_banco = 'B OF A');
//	  		
//		   OPEN CUR_NEW_TRANS_AGENCYS;
//			
//		   FETCH CUR_NEW_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver ;
//			
//			
//			
//		  IF SQLCA.SQLCODE <> 100 THEN
//		
//			DO WHILE SQLCA.SQLCODE <> 100 
//			
//				UPDATE DBA.SALES_REP_COMMISSION_PER_WIRE
//				SET ID_SALES_REP = :s_id_agent,
//					  COMMISSION_PAID = :d_trans_reg,
//					  DATE_PAID = GETDATE()
//				WHERE ID_BRANCH =  :s_id_branch
//				AND  ID_RECEIVER = :d_id_receiver;
//						
//				FETCH CUR_NEW_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver;
//				
//			LOOP
//			
//		ELSE
//			
//			DECLARE CUR_SPE_TRANS_AGENCYS CURSOR FOR
//			SELECT dba.receiver.id_branch, dba.receiver.id_RECEIVER
//   			FROM dba.RECEIVER  , dba.BRANCH_AGENT 
//   			WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//   					   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND 
//   					   dba.receiver.id_flag_receiver <> 'A' and
//   					   dba.BRANCH_AGENT.id_agent =:s_id_agent and
//   					   dba.BRANCH_AGENT.special_branch = 'YES' and 
//  					   dba.RECEIVER.ID_RECEIVER > 0 and 
//					   dba.RECEIVER.ID_BRANCH = :s_id_branch_reasing AND
//					   dba.receiver.id_branch + cast(dba.receiver.id_receiver as varchar) not in (SELECT dba.receiver.id_branch + cast(dba.receiver.id_receiver *-1 as varchar)
//																													   FROM dba.RECEIVER  , dba.BRANCH_AGENT 
//																													   WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
//																																 dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
//																																 dba.receiver.id_flag_receiver <> 'A' and
//																																 dba.BRANCH_AGENT.id_agent =:s_id_agent and
//																																 dba.BRANCH_AGENT.special_branch = 'YES' and
//																																 dba.RECEIVER.ID_RECEIVER <0) ;
//																																 
//		   OPEN CUR_SPE_TRANS_AGENCYS;
//			
//		   FETCH CUR_SPE_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver ;
//			
//			
//			
//		  IF SQLCA.SQLCODE <> 100 THEN
//			
//			DO WHILE SQLCA.SQLCODE <> 100 
//			
//			UPDATE DBA.SALES_REP_COMMISSION_PER_WIRE
//				SET ID_SALES_REP = :s_id_agent,
//					  COMMISSION_PAID = :d_trans_spe,
//					  DATE_PAID = GETDATE()
//				WHERE ID_BRANCH =  :s_id_branch
//				AND  ID_RECEIVER = :d_id_receiver;
//				
//				 FETCH CUR_SPE_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver ;
//				 
//			LOOP
//			
//		END IF
//			CLOSE CUR_SPE_TRANS_AGENCYS;
//		END IF
//	END IF
//			
//	  FETCH CUR_REASIGN_AGENCY INTO :s_id_branch_reasing;
//	  
//LOOP
//
//CLOSE  CUR_REASIGN_AGENCY;
						
	  
	  FETCH SALES_REP INTO :s_id_agent;

LOOP

CLOSE  SALES_REP;
end subroutine

public subroutine fn_commission_bonus ();STRING sales_rep, ls_branch,  s_sec_branch, s_id_branch_sec, s_indepedent_sales_rep, s_existing_branch, s_branch_installed, s_id_branch_main, s_id_branch_add, s_id_branch_inserted, s_id_branch_paid
DATETIME  date_from, date_to, ldt_date_diff, ldt_date_cre_branch_sec
DOUBLE  ld_total_transactions, ld_bonus_a, ld_bonus_a_paid, ld_bonus_b_paid,  ld_qty_bonus_b, ld_bonus_b, ld_qty_bonus_a, ld_bonus_a_topay, ld_bonus_b_topay, d_row_preview, d_total_sec_branch
double ld_bonus_expensive,  ld_bonus_dormant, ld_bonus_expensive_max, ld_bonus_dormant_max, ld_max_dso,  ld_bonus_discount, d_total_wires
INTEGER row, li_total_rows, row_now,ld_time_new


date_from = idt_first_day_of_the_month
date_to = idt_last_day_of_the_month

//***********************************************************
// DELETE THE PREVIUS RECORD AND CREATE A AUDIT RECORD (TRIGGER DB)
//
//***********************************************************
DELETE FROM DBA.SALES_REP_BONUS_PAID;

DECLARE SALES_REP_BONUS  CURSOR FOR
SELECT ID_AGENT
FROM dba.AGENT
WHERE STATUS_AGENT = 'A';


OPEN SALES_REP_BONUS;

FETCH SALES_REP_BONUS INTO :sales_rep;




DO WHILE  SQLCA.SQLCODE <> 100
	
	
SELECT BONUS_A, BONUS_B,BONUS_EXPENSIVE, BONUS_DORMANT, QTY_BONUS_A, QTY_BONUS_B, TIME_NEW
INTO :ld_bonus_a,:ld_bonus_b, :ld_bonus_expensive, :ld_bonus_dormant,:ld_qty_bonus_a, :ld_qty_bonus_b, :ld_time_new
FROM DBA.COMISION_AGENTES_TRANSACTION
WHERE ID_AGENT = :sales_rep;	
	
dw_1.settransobject(sqlca)

dw_1.reset()
dw_1.retrieve(sales_rep,date_from, date_to)

li_total_rows = dw_1.rowcount()

if li_total_rows > 0 then
	
	

  for row = 1 to li_total_rows
	
   ls_branch =	dw_1.getitemstring(row,'id_branch')
   ld_total_transactions = dw_1.getitemnumber(row,'total_branch_gen')
	
	setnull(s_id_branch_sec)
	setnull(s_id_branch_main)
	
//	SELECT ID_BRANCH_SEC AS ID_BRANCH, DATE_CRE_BRANCH
//			INTO :s_id_branch_sec, :ldt_date_cre_branch_sec
//			  FROM DBA.BRANCH_RELATIONS A  , DBA.BRANCH B
//              	WHERE A.ID_BRANCH_MAIN = B.ID_BRANCH
//			AND A.ID_BRANCH_MAIN =:ls_branch or
//			A.ID_BRANCH_SEC = :ls_branch ;


SELECT ID_BRANCH
INTO :s_id_branch_inserted
FROM DBA.SALES_REP_BONUS_PAID
WHERE ID_BRANCH = :ls_branch;

IF SQLCA.SQLCODE = 100 THEN

SELECT ID_BRANCH_MAIN, ID_BRANCH_SEC AS ID_BRANCH
INTO :s_id_branch_main, :s_id_branch_sec
FROM DBA.BRANCH_RELATIONS A 
WHERE A.ID_BRANCH_MAIN = :ls_branch or
A.ID_BRANCH_SEC = :ls_branch;

IF SQLCA.SQLCODE <> 100 THEN
	
	
			
	IF ls_branch = s_id_branch_sec THEN
		
		s_id_branch_add = s_id_branch_main
	
	ELSE
		
		s_id_branch_add = s_id_branch_sec
		
	END IF
		
	ls_branch = s_id_branch_main	
		
	//if s_id_branch_sec = '' then setnull(s_id_branch_sec)
	
	//IF NOT ISNULL(s_id_branch_sec) THEN
		
		
		
	
	
		
	 SELECT  SUM(TABLE_TOTALS.total_branch)as total_branch_gen		
	 INTO :d_total_sec_branch
	 FROM (select  count(dba.Receiver.id_branch) as total_branch
	 		   from dba.RECEIVER ,dba.BRANCH 
	  		   where  dba.RECEIVER.id_branch = dba.BRANCH.id_branch 
			   AND dba.receiver.date_receiver between DATE_CRE_BRANCH and DATEADD(DAY, :ld_time_new, DATE_CRE_BRANCH)
			   AND dba.receiver.id_flag_receiver <> 'A'
	  		   and dba.RECEIVER.ID_RECEIVER > 0 
	  		   AND DBA.RECEIVER.ID_BRANCH = :s_id_branch_add
	  		   UNION
	  		   select (count(dba.Receiver.id_branch)* -1) as total_branch
	  		   from dba.RECEIVER ,dba.BRANCH
	  		   where  dba.RECEIVER.id_branch = dba.BRANCH.id_branch
	  		   AND  dba.receiver.date_receiver between DATE_CRE_BRANCH and DATEADD(DAY, :ld_time_new, DATE_CRE_BRANCH)
			   AND dba.receiver.id_flag_receiver <> 'A'
	  		   and dba.RECEIVER.ID_RECEIVER < 0 
	  		   AND DBA.RECEIVER.ID_BRANCH = :s_id_branch_add	 ) TABLE_TOTALS;
				  
	ld_total_transactions = ld_total_transactions +  d_total_sec_branch			  
	
     END IF
	
	dw_2.settransobject(sqlca)
	
	dw_2.reset()
	dw_2.retrieve(ls_branch, sales_rep, s_id_branch_sec)
	
		setnull(ld_bonus_a_paid)
		setnull(ld_bonus_b_paid)
		
		ld_bonus_a_paid = dw_2.getitemnumber(1, 'bonus_a' )
		ld_bonus_b_paid = dw_2.getitemnumber(1, 'bonus_b' )
		
//*****************************************************************
//
//              Calculate the Discount according to the number of days due                   
//
//*****************************************************************

ld_max_dso = 0
	
SELECT MAX(DSO)
INTO :ld_max_dso 
FROM dba.history_balance, dba.branch, dba.receiver, dba.branch_agent,  dba.comision_agentes_transaction
WHERE dba.receiver.id_branch = dba.branch.id_branch AND
	  dba.branch.id_main_branch = dba.history_balance.id_main_branch AND
	  dba.receiver.id_branch = dba.branch_agent.id_branch AND
	  dba.branch_agent.id_agent = dba.comision_agentes_transaction.id_agent  and
	  dba.branch_agent.id_agent = :sales_rep AND
	  dba.history_balance.date_balance BETWEEN date_cre_branch AND DATEADD(DAY, DBA.COMISION_AGENTES_TRANSACTION.TIME_NEW, DATE_CRE_BRANCH) AND
	  dba.history_balance.dso > 7 AND
      dba.receiver.id_branch = :ls_branch
GROUP BY dba.receiver.id_branch;

ld_bonus_discount = 0

if ld_bonus_a_paid > 0 and ld_max_dso > 7 then
	
	ld_bonus_discount = (( ld_bonus_a + ld_bonus_b) * 50)/100
else
	if ld_bonus_a_paid > 0  and ld_max_dso > 14 then
		
		ld_bonus_discount  = ld_bonus_a_paid + ld_bonus_b_paid
	end if
end if
	
	
	if isnull(ld_bonus_a_paid) then ld_bonus_a_paid = 0
	if isnull(ld_bonus_b_paid) then ld_bonus_b_paid = 0	

	if ld_total_transactions >= ld_qty_bonus_a and ld_bonus_a_paid = 0 then
		
		ld_bonus_a_topay = ld_bonus_a
	else
		
		ld_bonus_a_topay = 0
		
	end if
	
	if ld_total_transactions >=  ld_qty_bonus_b  and  ld_bonus_b_paid = 0 then
		
		ld_bonus_b_topay = ld_bonus_b
	else
		
		ld_bonus_b_topay = 0
		
	end if
	
		if ld_bonus_a_topay > 0 and ld_max_dso > 7 then
			
			ld_bonus_discount = (( ld_bonus_a + ld_bonus_b) * 50)/100
		else
			if ld_bonus_a_topay > 0  and ld_max_dso > 14 then
				
				ld_bonus_discount  = ld_bonus_a_topay + ld_bonus_b_topay
			end if
		end if
		
		if ldt_date_cre_branch_sec <> datetime(date('01-01-1900'), time('00:00:00'))  then
			
	
			IF relativedate(date(ldt_date_cre_branch_sec),ld_time_new)  < date(date_from) THEN
		
				ld_bonus_a_topay = 0
				ld_bonus_b_topay = 0
				
	
			END IF
		end if
	
	
	
//	SELECT INDEPENDENT_SALES_REP
//	INTO :s_indepedent_sales_rep
//	FROM DBA.AGENT
//	WHERE ID_AGENT = :sales_rep;
//	
//	
//	
//	SELECT MAX(bonus_expensive)
//	INTO :ld_bonus_expensive_max
//	FROM DBA.SALES_REP_BONUS_PAID
//	WHERE ID_AGENT = :sales_rep AND
//			   ID_BRANCH = :ls_branch;
//	
//	IF s_indepedent_sales_rep = 'Y' THEN
//		
//		IF ld_bonus_expensive_max > 0 THEN
//		
//		ld_bonus_expensive = 0
//		
//		END IF
//	ELSE
//		
//		ld_bonus_expensive = 0
//		
//	END IF
//	
//	
//	if isnull(ld_bonus_expensive) then ld_bonus_expensive = 0
	
	INSERT INTO DBA.SALES_REP_BONUS_PAID
	VALUES (:sales_rep, :ls_branch, :ld_bonus_a_topay, :ld_bonus_b_topay, 0, 0, :date_from, :date_to, :ld_bonus_discount );
	
END IF
//END IF
	
NEXT

end if

	//******************************************************************//
	//                                                                                                                                    //
	// ****** INDEPENDENT SALE REP BONUS PER INSTALATION***************** //
	//                                                                                                                                    //
	// Calculation of the bonus for independent sales representative per instalation        //
	//                                                                                                                                   //
	//*****************************************************************//

	SELECT INDEPENDENT_SALES_REP
	INTO :s_indepedent_sales_rep
	FROM DBA.AGENT
	WHERE ID_AGENT = :sales_rep;
	
	IF s_indepedent_sales_rep = 'Y' THEN

		DECLARE C_BRANCH_INSTALLED CURSOR FOR
			SELECT COUNT(ID_RECEIVER)AS QTY, DBA.RECEIVER.ID_BRANCH
			FROM DBA.BRANCH , DBA.BRANCH_AGENT, DBA.RECEIVER
			WHERE DBA.BRANCH.ID_BRANCH = DBA.RECEIVER.ID_BRANCH
			AND DBA.BRANCH.ID_BRANCH = DBA.BRANCH_AGENT.ID_BRANCH
			AND ID_FLAG_RECEIVER <> 'A'
			AND 30 > DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch),:date_from)
			AND ID_AGENT = :sales_rep
			AND DATE_RECEIVER BETWEEN :date_from AND :date_to
			AND ID_RECEIVER > 0
			AND DBA.RECEIVER.ID_RECEIVER NOT IN (SELECT ID_RECEIVER FROM DBA.BRANCH , DBA.BRANCH_AGENT, DBA.RECEIVER
									  WHERE DBA.BRANCH.ID_BRANCH = DBA.RECEIVER.ID_BRANCH
									AND DBA.BRANCH.ID_BRANCH = DBA.BRANCH_AGENT.ID_BRANCH
									AND ID_FLAG_RECEIVER <> 'A'
									AND 30 > DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch),:date_from)
									AND ID_AGENT = :sales_rep
									AND DATE_RECEIVER BETWEEN :date_from AND :date_to
									AND ID_RECEIVER < 0
									//AND DBA.BRANCH.ID_BRANCH NOT IN (SELECT ID_BRANCH_SEC FROM DBA.BRANCH_RELATIONS)
									AND DBA.BRANCH.ID_BRANCH NOT IN (SELECT ID_BRANCH FROM DBA.AUDIT_SALES_REP_BONUS_PAID WHERE ID_AGENT = :sales_rep and bonus_expensive > 0))
			//AND DBA.BRANCH.ID_BRANCH NOT IN (SELECT ID_BRANCH_SEC FROM DBA.BRANCH_RELATIONS)
			AND DBA.BRANCH.ID_BRANCH NOT IN (SELECT ID_BRANCH FROM DBA.AUDIT_SALES_REP_BONUS_PAID WHERE ID_AGENT = :sales_rep and bonus_expensive > 0)
			GROUP BY DBA.RECEIVER.ID_BRANCH;
//			SELECT DBA.BRANCH.ID_BRANCH
//			FROM DBA.BRANCH , DBA.BRANCH_AGENT
//			WHERE DBA.BRANCH.ID_BRANCH = DBA.BRANCH_AGENT.ID_BRANCH 
//			AND DATE_CRE_BRANCH BETWEEN :date_from AND :date_to
//			AND DBA.BRANCH.ID_BRANCH NOT IN (SELECT ID_BRANCH_SEC FROM DBA.BRANCH_RELATIONS)
//			AND ID_AGENT = :sales_rep;
			
			OPEN C_BRANCH_INSTALLED;
			
			FETCH C_BRANCH_INSTALLED INTO :d_total_wires,:s_branch_installed;
			
			DO WHILE SQLCA.SQLCODE <> 100 
		
//				SELECT MAX(bonus_expensive)
//				INTO :ld_bonus_expensive_max
//				FROM DBA.SALES_REP_BONUS_PAID
//				WHERE ID_AGENT = :sales_rep AND
//							ID_BRANCH = :s_branch_installed;
//							
//				IF ld_bonus_expensive_max > 0 THEN
//				
//					ld_bonus_expensive = 0
//				
//				END IF

		   SELECT ID_BRANCH_MAIN, ID_BRANCH_SEC AS ID_BRANCH
		   INTO :s_id_branch_main, :s_id_branch_sec
		   FROM DBA.BRANCH_RELATIONS A 
		   WHERE A.ID_BRANCH_MAIN = :s_branch_installed or
					 A.ID_BRANCH_SEC = :s_branch_installed;
					 
					 IF SQLCA.SQLCODE <> 100 AND SQLCA.SQLCODE <> -1 THEN
						s_branch_installed = s_id_branch_main
						
					 END IF
						
						SELECT ID_BRANCH
						INTO :s_id_branch_paid
						FROM DBA.AUDIT_SALES_REP_BONUS_PAID
						WHERE ID_BRANCH = :s_branch_installed AND
						BONUS_EXPENSIVE > 0;
						
						IF SQLCA.SQLCODE = 100 THEN
							
						
					
						
					 
				
		    SETNULL(s_existing_branch)
			 
			 SELECT ID_BRANCH
			 INTO :s_existing_branch
			 FROM DBA.SALES_REP_BONUS_PAID
			 WHERE ID_BRANCH = :s_branch_installed;
			 
			 	IF NOT ISNULL(s_existing_branch) AND ld_bonus_expensive > 0 AND d_total_wires> 0 THEN
					
					UPDATE DBA.SALES_REP_BONUS_PAID
					SET  BONUS_EXPENSIVE = :ld_bonus_expensive
					WHERE ID_AGENT = :sales_rep
					AND ID_BRANCH = :s_branch_installed;
					
				ELSE
					
					IF  ld_bonus_expensive > 0 AND d_total_wires> 0 THEN
					
						INSERT INTO DBA.SALES_REP_BONUS_PAID
						VALUES (:sales_rep, :s_branch_installed, 0, 0, :ld_bonus_expensive, 0, :date_from, :date_to, 0 );
					
					END IF
					
				END IF
				
				END IF
				
				FETCH C_BRANCH_INSTALLED INTO :d_total_wires,:s_branch_installed;
				
			LOOP
			CLOSE C_BRANCH_INSTALLED;
			
	END IF
			
			
			
		

FETCH SALES_REP_BONUS INTO :sales_rep;


	
	
	
LOOP

CLOSE SALES_REP_BONUS;




end subroutine

public subroutine fn_commission_bonus_dormant ();//**************************************************************//
	//
	// ***************** DORMANT BRANCH BONUS*********************//
	//
	// Calculation of bonus for dormant Branch, it going to be calculate according 
	// to a selection made by the person in charge
	//
	//*************************************************************//
	
	
	STRING ls_branch_dormant, ls_existing_branch, sales_rep
	DATETIME ldt_date_from, ldt_date_to
	DOUBLE ld_bonus_dormant_max, ld_total_transaction_dormant, ld_total_bonus_dormant, ld_bonus_dormant,  bonus_dormant_qty, ld_exist_bonus_dormant
	
	ld_total_bonus_dormant = 0
	
	DECLARE SALES_REP_BONUS  CURSOR FOR
	SELECT ID_AGENT
	FROM dba.AGENT
	WHERE STATUS_AGENT = 'A';
	
	
	OPEN  SALES_REP_BONUS;
	
	FETCH SALES_REP_BONUS INTO :sales_rep;
	
	DO WHILE SQLCA.SQLCODE <> 100
		
		SELECT BONUS_DORMANT, QTY_BONUS_DORMANT
		INTO :ld_bonus_dormant, :bonus_dormant_qty
		FROM DBA.COMISION_AGENTES_TRANSACTION
		WHERE ID_AGENT = :sales_rep;
	
	
	
	DECLARE BONUS_DORMANT CURSOR FOR
	SELECT DBA.BRANCH_DORMANT.id_branch, date_from, date_to
	FROM DBA.BRANCH_DORMANT, DBA.BRANCH_AGENT
	WHERE DBA.BRANCH_DORMANT.ID_BRANCH = DBA.BRANCH_AGENT.ID_BRANCH
	AND DBA.BRANCH_AGENT.ID_AGENT = :sales_rep
     AND DATE_TO > :idt_first_day_of_the_month ;
	
	OPEN BONUS_DORMANT;
	
	FETCH BONUS_DORMANT INTO :ls_existing_branch, :ldt_date_from, :ldt_date_to;
	
	do while sqlca.sqlcode<> 100
		
		SELECT SUM(TABLE_TOTAL.TOTAL_DORMANT)
		INTO :ld_total_transaction_dormant
		FROM (SELECT COUNT(DBA.RECEIVER.ID_RECEIVER)AS TOTAL_DORMANT
	 			  FROM DBA.RECEIVER , DBA.BRANCH, DBA.BRANCH_DORMANT
	 		   	  WHERE DBA.RECEIVER.ID_BRANCH = DBA.BRANCH.ID_BRANCH
				  AND DBA.RECEIVER.DATE_RECEIVER BETWEEN :ldt_date_from AND  :ldt_date_to
				  AND dba.receiver.id_flag_receiver <> 'A'
	  			  and DBA.RECEIVER.ID_BRANCH = :ls_existing_branch 
				  AND DBA.RECEIVER.ID_RECEIVER > 0
	  			  UNION
	 			  SELECT (COUNT(DBA.RECEIVER.ID_RECEIVER)* -1 ) AS TOTAL_DORMANT
	  			  FROM DBA.RECEIVER , DBA.BRANCH, DBA.BRANCH_DORMANT
	  			  WHERE DBA.RECEIVER.ID_BRANCH = DBA.BRANCH.ID_BRANCH
	  			  AND DBA.RECEIVER.DATE_RECEIVER BETWEEN :ldt_date_from AND  :ldt_date_to
				  AND dba.receiver.id_flag_receiver <> 'A'
	  			  and DBA.RECEIVER.ID_BRANCH = :ls_existing_branch 
				  AND DBA.RECEIVER.ID_RECEIVER > 0)TABLE_TOTAL;
					 
					 
					 

	if 	ld_total_transaction_dormant >  bonus_dormant_qty then
		
		
		
	
	
		
		SELECT MAX(bonus_dormant)
		INTO :ld_bonus_dormant_max
		FROM DBA.AUDIT_SALES_REP_BONUS_PAID
		WHERE ID_AGENT = :sales_rep AND
			   ID_BRANCH = :ls_existing_branch;
				
				IF ld_bonus_dormant_max > 0 THEN
		
					ld_bonus_dormant = 0
		
				END IF
			
				
				
	
	ld_total_bonus_dormant = ld_total_bonus_dormant + ld_bonus_dormant
END IF

	SELECT BONUS_DORMANT
	INTO :ld_exist_bonus_dormant
	FROM DBA.SALES_REP_BONUS_PAID
	WHERE ID_AGENT = :sales_rep 
	AND ID_BRANCH = :ls_existing_branch;

IF SQLCA.SQLCODE <> 100 THEN
	
	UPDATE DBA.SALES_REP_BONUS_PAID
	SET BONUS_DORMANT = :ld_total_bonus_dormant
	WHERE ID_AGENT = :sales_rep 
	AND ID_BRANCH = :ls_existing_branch;
	
ELSE
	
	INSERT INTO DBA.SALES_REP_BONUS_PAID
	VALUES (:sales_rep, :ls_existing_branch, 0, 0, 0, :ld_total_bonus_dormant, :idt_first_day_of_the_month, :idt_last_day_of_the_month, 0 );

END IF

FETCH BONUS_DORMANT INTO :ls_existing_branch, :ldt_date_from, :ldt_date_to;
	
LOOP

FETCH SALES_REP_BONUS INTO :sales_rep;

LOOP

CLOSE BONUS_DORMANT;
CLOSE SALES_REP_BONUS;


end subroutine

on w_sales_rep_commision_closing.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_4=create st_4
this.st_3=create st_3
this.em_date2=create em_date2
this.em_date1=create em_date1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.em_date2
this.Control[iCurrent+7]=this.em_date1
this.Control[iCurrent+8]=this.gb_1
end on

on w_sales_rep_commision_closing.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.em_date2)
destroy(this.em_date1)
destroy(this.gb_1)
end on

event open;call super::open;string s_id_Agent
date ld_today

ld_today = today()

select (dateadd(dd,-(day(dateadd(mm,1,:ld_today))-1),dateadd(mm,-1,:ld_today))) as firts_day,
		DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0)) as last_day,
		id_agent
into :idt_first_day_of_the_month, 
	  :idt_last_day_of_the_month, 
	  :s_id_Agent
from dba.agent
where id_agent = '35';


em_date1.text = string(date(idt_first_day_of_the_month))
em_date2.text = string(date(idt_last_day_of_the_month))

end event

type dw_2 from datawindow within w_sales_rep_commision_closing
boolean visible = false
integer x = 238
integer y = 280
integer width = 73
integer height = 392
integer taborder = 40
string title = "none"
string dataobject = "dw_bonus_paid"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_sales_rep_commision_closing
boolean visible = false
integer x = 1454
integer y = 280
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_bonus_branch"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_sales_rep_commision_closing
integer x = 1129
integer y = 104
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Process"
end type

event clicked;string s_id_agent
double d_ransaction_number_total, d_ransaction_number_pos, d_ransaction_number_neg, d_trans_reg, d_trans_new, d_trans_spe
double d_total_reg_branch, d_total_new_branch, d_total_spe_branch, d_current_row
datetime date_from, date_to


SELECT DATE_FROM
INTO :date_from
FROM DBA.SALES_REP_TRANSACTIONS_PAID;



IF date_from = idt_first_day_of_the_month THEN
	
	IF MESSAGEBOX('ALERT', 'This Proccess was already run it, are you that you want to run it again',question!,yesno!) = 1 then

	
fn_commision_transactions( )



	END IF
ELSE

fn_commision_transactions( )

fn_commission_bonus ()

fn_commission_bonus_dormant ()

END IF


	
	


end event

type st_4 from statictext within w_sales_rep_commision_closing
integer x = 599
integer y = 124
integer width = 101
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_sales_rep_commision_closing
integer x = 59
integer y = 124
integer width = 165
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date2 from pfc_u_em within w_sales_rep_commision_closing
integer x = 709
integer y = 108
integer width = 320
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type em_date1 from pfc_u_em within w_sales_rep_commision_closing
integer x = 233
integer y = 108
integer width = 320
integer height = 84
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type gb_1 from groupbox within w_sales_rep_commision_closing
integer width = 1582
integer height = 288
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

