$PBExportHeader$w_partialclosingcomm.srw
forward
global type w_partialclosingcomm from pfc_w_sheet
end type
type dw_2 from datawindow within w_partialclosingcomm
end type
type cb_1 from commandbutton within w_partialclosingcomm
end type
type pb_date2 from picturebutton within w_partialclosingcomm
end type
type em_date2 from pfc_u_em within w_partialclosingcomm
end type
type st_4 from statictext within w_partialclosingcomm
end type
type st_3 from statictext within w_partialclosingcomm
end type
type pb_date1 from picturebutton within w_partialclosingcomm
end type
type em_date1 from pfc_u_em within w_partialclosingcomm
end type
type dw_1 from u_dw within w_partialclosingcomm
end type
type gb_1 from groupbox within w_partialclosingcomm
end type
end forward

global type w_partialclosingcomm from pfc_w_sheet
integer x = 214
integer y = 221
integer width = 1563
integer height = 1204
string title = "Partial Closing"
boolean resizable = false
dw_2 dw_2
cb_1 cb_1
pb_date2 pb_date2
em_date2 em_date2
st_4 st_4
st_3 st_3
pb_date1 pb_date1
em_date1 em_date1
dw_1 dw_1
gb_1 gb_1
end type
global w_partialclosingcomm w_partialclosingcomm

forward prototypes
public subroutine fn_commission_transactions ()
public subroutine fn_commission_bonus ()
end prototypes

public subroutine fn_commission_transactions ();string s_id_agent, s_id_branch, s_id_branch_reasing
double d_ransaction_number_total, d_trans_reg, d_trans_spe, d_trans_new, d_total_reg_branch, ld_total_transactions, d_total_new_branch, d_total_spe_branch, d_id_receiver,d_transactions_reg_boa
double d_total_boa
integer i
datetime date_from, date_to, date_paid

date_paid = DATETIME(TODAY(), NOW())

date_from  = datetime(date(em_date1.text) , time('00:00:00'))

date_to = datetime(date(em_date2.text) , time('23:59:59'))

for i = 1 to dw_1.rowcount()
	
	if dw_1.getitemstring(i,'selection') = 'Y' then

s_id_agent = dw_1.getitemstring(i,'id_agent')

d_transactions_reg_boa = 0
d_ransaction_number_total = 0
ld_total_transactions = 0

///////// ******* AMOUNT TO PAY PER TRANSACTION *******//////////////////
SELECT TRANS_REG, TRANS_ESP, TRANS_NEW
INTO :d_trans_reg, :d_trans_spe, :d_trans_new
FROM DBA.COMISION_AGENTES_TRANSACTION
WHERE ID_AGENT = :s_id_agent;

d_ransaction_number_total = 0

///////// ********* REGULAR TRANSACTIONS **********///////////////////
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
	   	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO' ) ;
				
				

												
	if isnull(d_ransaction_number_total) then d_ransaction_number_total = 0
	
	
	 
								
			
	d_total_reg_branch = d_ransaction_number_total * d_trans_reg
	
	ld_total_transactions = d_ransaction_number_total
		
		
		
/////////********** NEW TRANSACTIONS ***********//////////////////		
		
	
d_ransaction_number_total = 0	
	
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
												    id_banco = 'B OF A');
													 
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
													 
	 if isnull(d_ransaction_number_total) then d_ransaction_number_total = 0	  
	 
	 if isnull(d_transactions_reg_boa) then d_transactions_reg_boa = 0
	 
	 d_total_boa = d_transactions_reg_boa * d_trans_reg
	  
	  d_total_new_branch = d_ransaction_number_total * d_trans_new
	  
	  d_total_new_branch = d_total_new_branch + d_total_boa
	  
	  ld_total_transactions = ld_total_transactions + d_ransaction_number_total + d_transactions_reg_boa
	  

/////////********* SPECIAL TRANSACTINS ************//////////////////


 d_ransaction_number_total = 0

   SELECT convert(numeric(7,0),sum(id_receiver / abs(id_receiver)))
   INTO :d_ransaction_number_total
   FROM dba.RECEIVER  , dba.BRANCH_AGENT 
   WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
   			 dba.receiver.date_receiver BETWEEN :date_from and :date_to AND 
   			 dba.receiver.id_flag_receiver <> 'A' and
   			 dba.BRANCH_AGENT.id_agent =:s_id_agent and
   			 dba.BRANCH_AGENT.special_branch = 'YES'  ;
				 
				 
	if isnull( d_ransaction_number_total)	then d_ransaction_number_total = 0
		
	  d_total_spe_branch = d_ransaction_number_total * d_trans_spe
	  
	  ld_total_transactions = ld_total_transactions + d_ransaction_number_total
	  
	  
	  update dba.sales_rep_transactions_paid
	  set total_reg_trans = :d_total_reg_branch,
	  	   total_spe_trans = :d_total_spe_branch,
		   total_new_trans  = :d_total_new_branch,
		   date_from = :date_from,
		   date_to = :date_to,
		   transactions = :ld_total_transactions,
		   rep_send = 0,
		   transactions_boa = :d_transactions_reg_boa
	  where id_agent = :s_id_agent;
	  
	  //****************************************************************************************************************
	//
	// INSERT COMMISSION PAID PER AGENCY IN TABLE  DBA.AGENCY_SALES_REP_COMM----------------------------------------------------------------
	
	//****** REGULAR TRANSACTIONS ***************************************************************
	//
	//*******************************************************************************************
	STRING S
	S = ''
	
	DECLARE CUR_REASIGN_AGENCY CURSOR FOR
	SELECT ID_BRANCH
	FROM DBA.BRANCH_AGENT
	WHERE ID_AGENT = :s_id_agent
	AND DATE_BEGIN BETWEEN :date_from and :date_to;
	
	OPEN CUR_REASIGN_AGENCY;
	
	FETCH CUR_REASIGN_AGENCY INTO :s_id_branch_reasing;
	
	DO WHILE SQLCA.SQLCODE <> 100
	DECLARE CUR_REG_TRANS_AGENCYS CURSOR FOR
	SELECT dba.receiver.id_branch, dba.receiver.id_receiver
	FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
	WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
	  dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
	  dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
	  dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
	  dba.receiver.id_flag_receiver <> 'A' and
	  dba.BRANCH_AGENT.id_agent = :s_id_agent and 
	  dba.RECEIVER.ID_RECEIVER > 0 AND
	  dba.RECEIVER.ID_BRANCH = :s_id_branch_reasing AND
	  dba.receiver.id_branch + cast(dba.receiver.id_receiver as varchar) not in (SELECT dba.receiver.id_branch + cast(dba.receiver.id_receiver * -1 as varchar)
																      								   FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION
																									   WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
																	  											dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND 
																	  											dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
																	  											dba.receiver.date_receiver BETWEEN :date_from and :date_to AND 
																	  											dba.receiver.id_flag_receiver <> 'A' and
																	  											dba.BRANCH_AGENT.id_agent =:s_id_agent and 
																	  											dba.RECEIVER.ID_RECEIVER < 0 AND
																	  											(dba.COMISION_AGENTES_TRANSACTION.TIME_NEW < DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER)  OR
																      											DBA.RECEIVER.ID_BRANCH IN (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change))AND
																	  											(ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') ) and
	  (dba.COMISION_AGENTES_TRANSACTION.TIME_NEW < DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER) OR
	   DBA.RECEIVER.ID_BRANCH IN (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change))AND
	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO' ) ;
		
		OPEN CUR_REG_TRANS_AGENCYS;
		
		FETCH CUR_REG_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver ;
		
		IF SQLCA.SQLCODE <> 100 THEN
		
			DO WHILE SQLCA.SQLCODE <> 100 
			
				UPDATE DBA.SALES_REP_COMMISSION_PER_WIRE
				SET ID_SALES_REP = :s_id_agent,
					  COMMISSION_PAID = :d_trans_reg,
					  DATE_PAID = GETDATE()
				WHERE ID_BRANCH =  :s_id_branch
				AND  ID_RECEIVER = :d_id_receiver;
						
				FETCH CUR_REG_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver;
				
			LOOP
			
		ELSE
			
			CLOSE CUR_REG_TRANS_AGENCYS;
			
			DECLARE CUR_NEW_TRANS_AGENCYS CURSOR FOR
			SELECT dba.receiver.id_branch, dba.receiver.id_RECEIVER
			FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
			WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
	  	   dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
	 	   dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
	  	   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
	 	   dba.BRANCH_AGENT.id_agent =:s_id_agent and
	   	   dba.receiver.id_flag_receiver <> 'A' and
		   dba.receiver.id_receiver > 0 AND
		   dba.RECEIVER.ID_BRANCH = :s_id_branch_reasing AND
		   dba.receiver.id_branch + cast(dba.receiver.id_receiver as varchar) not in (SELECT dba.receiver.id_branch + cast(dba.receiver.id_receiver * -1 as varchar)
																					  						FROM dba.RECEIVER  , dba.BRANCH_AGENT , dba.BRANCH, dba.COMISION_AGENTES_TRANSACTION 
																					  						WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
																													dba.RECEIVER.id_branch = dba.BRANCH.id_branch AND
																													 dba.BRANCH_AGENT.id_agent = dba.COMISION_AGENTES_TRANSACTION.ID_AGENT AND
																													 dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
																													 dba.BRANCH_AGENT.id_agent = :s_id_agent and
																													 dba.receiver.id_flag_receiver <> 'A' and
																													 dba.receiver.id_receiver < 0 AND
																													dba.COMISION_AGENTES_TRANSACTION.TIME_NEW >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER )AND
																													(ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') and
																													dba.receiver.id_branch not in (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change)) AND
	  	   dba.COMISION_AGENTES_TRANSACTION.TIME_NEW >= DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch), DBA.RECEIVER.DATE_RECEIVER )AND
	 	   (ISNULL(dba.BRANCH_AGENT.special_branch,'NO') = 'NO') and
	 	   dba.receiver.id_branch not in (select id_branch_old from dba.branch_owner_change union select id_branch_sec from dba.branch_owner_change)and
	 	   dba.receiver.id_branch not in (select dba.branch.id_branch 
												    from dba.branch,dba.group_branch, dba.DEPOSIT_CODES
										  		    where dba.branch.id_main_branch =   dba.group_branch.id_main_branch and
												    fin_depdepositcode = deposit_code and
												    isnull(fin_depdepositcode,'') <> '' and
												    id_banco = 'B OF A');
	  		
		   OPEN CUR_NEW_TRANS_AGENCYS;
			
		   FETCH CUR_NEW_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver ;
			
			
			
		  IF SQLCA.SQLCODE <> 100 THEN
		
			DO WHILE SQLCA.SQLCODE <> 100 
			
				UPDATE DBA.SALES_REP_COMMISSION_PER_WIRE
				SET ID_SALES_REP = :s_id_agent,
					  COMMISSION_PAID = :d_trans_reg,
					  DATE_PAID = GETDATE()
				WHERE ID_BRANCH =  :s_id_branch
				AND  ID_RECEIVER = :d_id_receiver;
						
				FETCH CUR_NEW_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver;
				
			LOOP
			
		ELSE
			
			DECLARE CUR_SPE_TRANS_AGENCYS CURSOR FOR
			SELECT dba.receiver.id_branch, dba.receiver.id_RECEIVER
   			FROM dba.RECEIVER  , dba.BRANCH_AGENT 
   			WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
   					   dba.receiver.date_receiver BETWEEN :date_from and :date_to AND 
   					   dba.receiver.id_flag_receiver <> 'A' and
   					   dba.BRANCH_AGENT.id_agent =:s_id_agent and
   					   dba.BRANCH_AGENT.special_branch = 'YES' and 
  					   dba.RECEIVER.ID_RECEIVER > 0 and 
					   dba.RECEIVER.ID_BRANCH = :s_id_branch_reasing AND
					   dba.receiver.id_branch + cast(dba.receiver.id_receiver as varchar) not in (SELECT dba.receiver.id_branch + cast(dba.receiver.id_receiver *-1 as varchar)
																													   FROM dba.RECEIVER  , dba.BRANCH_AGENT 
																													   WHERE dba.RECEIVER.id_branch = dba.BRANCH_AGENT.id_branch and
																																 dba.receiver.date_receiver BETWEEN :date_from and :date_to AND
																																 dba.receiver.id_flag_receiver <> 'A' and
																																 dba.BRANCH_AGENT.id_agent =:s_id_agent and
																																 dba.BRANCH_AGENT.special_branch = 'YES' and
																																 dba.RECEIVER.ID_RECEIVER <0) ;
																																 
		   OPEN CUR_SPE_TRANS_AGENCYS;
			
		   FETCH CUR_SPE_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver ;
			
			
			
		  IF SQLCA.SQLCODE <> 100 THEN
			
			DO WHILE SQLCA.SQLCODE <> 100 
			
			UPDATE DBA.SALES_REP_COMMISSION_PER_WIRE
				SET ID_SALES_REP = :s_id_agent,
					  COMMISSION_PAID = :d_trans_spe,
					  DATE_PAID = GETDATE()
				WHERE ID_BRANCH =  :s_id_branch
				AND  ID_RECEIVER = :d_id_receiver;
				
				 FETCH CUR_SPE_TRANS_AGENCYS INTO :s_id_branch, :d_id_receiver ;
				 
			LOOP
			
		END IF
			CLOSE CUR_SPE_TRANS_AGENCYS;
		END IF
	END IF
			
	  FETCH CUR_REASIGN_AGENCY INTO :s_id_branch_reasing;
	  
LOOP

CLOSE  CUR_REASIGN_AGENCY;
end if

next
end subroutine

public subroutine fn_commission_bonus ();string sales_rep, ls_branch, s_id_branch_sec, s_existing_branch, s_indepedent_sales_rep, s_branch_installed, s_id_branch_add, s_id_branch_main, s_id_branch_inserted, s_id_branch_paid
double ld_bonus_a, ld_bonus_b, ld_bonus_expensive, ld_bonus_dormant, ld_qty_bonus_a, ld_qty_bonus_b, ld_time_new, ld_total_transactions, d_total_sec_branch
double ld_bonus_a_paid, ld_bonus_b_paid,d_total_wires, ld_max_dso, ld_bonus_a_topay, ld_bonus_b_topay, ld_bonus_discount
integer row, li_total_rows, i
datetime date_from, date_to, ldt_date_cre_branch_sec


date_from  = datetime(date(em_date1.text) , time('00:00:00'))

date_to = datetime(date(em_date2.text) , time('23:59:59'))

for i = 1 to dw_1.rowcount()
	
	if dw_1.getitemstring(i,'selection') = 'Y' then

sales_rep = dw_1.getitemstring(i,'id_agent')

DELETE DBA.SALES_REP_BONUS_PAID
WHERE ID_AGENT = :sales_rep;

SELECT BONUS_A, BONUS_B,BONUS_EXPENSIVE, BONUS_DORMANT, QTY_BONUS_A, QTY_BONUS_B, TIME_NEW
INTO :ld_bonus_a,:ld_bonus_b, :ld_bonus_expensive, :ld_bonus_dormant,:ld_qty_bonus_a, :ld_qty_bonus_b, :ld_time_new
FROM DBA.COMISION_AGENTES_TRANSACTION
WHERE ID_AGENT = :sales_rep;	
	
dw_2.settransobject(sqlca)

dw_2.reset()
dw_2.retrieve(sales_rep,date_from, date_to)

li_total_rows = dw_2.rowcount()

if li_total_rows > 0 then
	
	

  for row = 1 to li_total_rows
	
   ls_branch =	dw_2.getitemstring(row,'id_branch')
   ld_total_transactions = dw_2.getitemnumber(row,'total_branch_gen')
	
	setnull(s_id_branch_sec)
	
	
	
//	SELECT ID_BRANCH_SEC AS ID_BRANCH, DATE_CRE_BRANCH
//			INTO :s_id_branch_sec, :ldt_date_cre_branch_sec
//			  FROM DBA.BRANCH_RELATIONS A  , DBA.BRANCH B
//              	WHERE A.ID_BRANCH_MAIN = B.ID_BRANCH
//			AND A.ID_BRANCH_MAIN =:ls_branch;
			
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
	
		
//	if s_id_branch_sec = '' then setnull(s_id_branch_sec)
//	
//	IF NOT ISNULL(s_id_branch_sec) THEN
		
		
		
	
	
		
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
	  
	  setnull(ld_bonus_a_paid)
	  setnull(ld_bonus_b_paid)
	
	SELECT max(BONUS_A) as bonus_a , max(BONUS_B) as bonus_b
	INTO :ld_bonus_a_paid, :ld_bonus_b_paid
	FROM dba.AUDIT_SALES_REP_BONUS_PAID
	WHERE  id_agent = :sales_rep AND
	(id_branch = :ls_branch OR
	id_branch = :s_id_branch_sec)
	 	  	  ;
	
	
		
		
//		ld_bonus_a_paid = dw_2.getitemnumber(1, 'bonus_a' )
//		ld_bonus_b_paid = dw_2.getitemnumber(1, 'bonus_b' )
		
		
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
	
	INSERT INTO DBA.SALES_REP_BONUS_PAID
	VALUES (:sales_rep, :ls_branch, :ld_bonus_a_topay, :ld_bonus_b_topay, 0, 0, :date_from, :date_to, :ld_bonus_discount );
	

END IF
	
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
									AND 30 > DATEDIFF(DAY,DBA.sfGetBranchDateCreatedminor(dba.BRANCH_AGENT.id_branch),:date_to)
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
			
		
	
END IF

NEXT
			
		
end subroutine

on w_partialclosingcomm.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.cb_1=create cb_1
this.pb_date2=create pb_date2
this.em_date2=create em_date2
this.st_4=create st_4
this.st_3=create st_3
this.pb_date1=create pb_date1
this.em_date1=create em_date1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.pb_date2
this.Control[iCurrent+4]=this.em_date2
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.pb_date1
this.Control[iCurrent+8]=this.em_date1
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.gb_1
end on

on w_partialclosingcomm.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.pb_date2)
destroy(this.em_date2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.pb_date1)
destroy(this.em_date1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;

dw_1.settransobject(sqlca)

dw_1.retrieve()



em_date1.text = string(month(today()))+ '/01/' + string(year(today()) )

em_date2.text = string(date(today()))
end event

event closequery;//test
end event

type dw_2 from datawindow within w_partialclosingcomm
integer x = 1719
integer y = 40
integer width = 73
integer height = 52
integer taborder = 20
string title = "none"
string dataobject = "dw_bonus_branch"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_partialclosingcomm
integer x = 622
integer y = 980
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

event clicked;

fn_commission_transactions()

fn_commission_bonus()
end event

type pb_date2 from picturebutton within w_partialclosingcomm
integer x = 1294
integer y = 780
integer width = 101
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date2.Event pfc_DDCalendar( )
end event

type em_date2 from pfc_u_em within w_partialclosingcomm
integer x = 965
integer y = 784
integer width = 320
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type st_4 from statictext within w_partialclosingcomm
integer x = 832
integer y = 800
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

type st_3 from statictext within w_partialclosingcomm
integer x = 128
integer y = 792
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

type pb_date1 from picturebutton within w_partialclosingcomm
integer x = 640
integer y = 780
integer width = 101
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date1.Event pfc_DDCalendar( )
end event

type em_date1 from pfc_u_em within w_partialclosingcomm
integer x = 311
integer y = 784
integer width = 320
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type dw_1 from u_dw within w_partialclosingcomm
integer x = 32
integer y = 20
integer width = 1481
integer height = 660
integer taborder = 10
string dataobject = "dw_sal_rep_partial_clo_selection"
end type

type gb_1 from groupbox within w_partialclosingcomm
integer x = 32
integer y = 716
integer width = 1490
integer height = 212
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Date"
end type

