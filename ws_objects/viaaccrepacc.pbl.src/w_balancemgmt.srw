$PBExportHeader$w_balancemgmt.srw
forward
global type w_balancemgmt from wb_report
end type
type cb_dso from commandbutton within w_balancemgmt
end type
type cb_query from commandbutton within w_balancemgmt
end type
type lb_collectionmethod from dropdownlistbox within w_balancemgmt
end type
type st_1 from statictext within w_balancemgmt
end type
type cbx_summary from checkbox within w_balancemgmt
end type
type cbx_collection from checkbox within w_balancemgmt
end type
type cbx_disputed from checkbox within w_balancemgmt
end type
end forward

global type w_balancemgmt from wb_report
integer width = 3803
integer height = 1956
string title = "Agency Balance Management"
long backcolor = 80269524
cb_dso cb_dso
cb_query cb_query
lb_collectionmethod lb_collectionmethod
st_1 st_1
cbx_summary cbx_summary
cbx_collection cbx_collection
cbx_disputed cbx_disputed
end type
global w_balancemgmt w_balancemgmt

on w_balancemgmt.create
int iCurrent
call super::create
this.cb_dso=create cb_dso
this.cb_query=create cb_query
this.lb_collectionmethod=create lb_collectionmethod
this.st_1=create st_1
this.cbx_summary=create cbx_summary
this.cbx_collection=create cbx_collection
this.cbx_disputed=create cbx_disputed
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_dso
this.Control[iCurrent+2]=this.cb_query
this.Control[iCurrent+3]=this.lb_collectionmethod
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cbx_summary
this.Control[iCurrent+6]=this.cbx_collection
this.Control[iCurrent+7]=this.cbx_disputed
end on

on w_balancemgmt.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_dso)
destroy(this.cb_query)
destroy(this.lb_collectionmethod)
destroy(this.st_1)
destroy(this.cbx_summary)
destroy(this.cbx_collection)
destroy(this.cbx_disputed)
end on

event open;call super::open;//cb_dso.visible = false

lb_collectionmethod.text = '-ALL-'

//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Recalculating the type for each group
//
//update dba.group_branch set group_type = null;
//
//update dba.group_branch set group_type = 'R' 
//where id_main_branch in (select distinct id_main_branch from dba.branch where id_type_branch = 'R');
//
//update dba.group_branch set group_type = 'P' 
//where id_main_branch in (select distinct id_main_branch from dba.branch where id_type_branch = 'P');
//
//update dba.group_branch set group_type = 'A' 
//where id_main_branch in (select distinct id_main_branch from dba.branch where id_type_branch = 'A');
//
//update dba.group_branch set group_type = 'A' 
//where id_main_branch in (select distinct id_main_branch from dba.branch where id_type_branch = 'R')
//and   id_main_branch in (select distinct id_main_branch from dba.branch where id_type_branch = 'P');
//
//commit;
//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

fn_updategrouptypes()

cb_query.triggerevent(Clicked!)
end event

type dw_1 from wb_report`dw_1 within w_balancemgmt
integer y = 132
integer width = 3721
integer height = 1644
string dataobject = "dw_balancemngm_summary"
end type

event dw_1::constructor;SetTransObject(SQLCA)
//this.retrieve()
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)
end event

type cb_dso from commandbutton within w_balancemgmt
integer x = 5
integer y = 32
integer width = 910
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recalculate Previous day DSO"
end type

event clicked;// ----------------------------------------------
// This Script runs every night on MTClosing and
// can be runned manually in w_balancemgmt
// ----------------------------------------------

string   ls_group
double   ld_balance, ld_remamount, ld_remadjamount, ld_dailydebits, ld_amttobereconciled
date     ld_movingdate, ld_dsodate
decimal  ld_dso, ld_ajusteddso
datetime ld_datefrom, ld_dateto
boolean  lb_ajusteddsodone

Setpointer(HourGlass!)

ld_dsodate = today()

DELETE FROM dba.HISTORY_BALANCE WHERE date_balance = :ld_dsodate;
commit;

 DECLARE cur_groups CURSOR FOR  
  SELECT ID_MAIN_BRANCH, 
         balance_group,
			fin_amttobereconciled
    FROM dba.GROUP_BRANCH  
   WHERE dba.GROUP_BRANCH.group_type in ('A','R')
	ORDER BY ID_MAIN_BRANCH;

open cur_groups;

fetch cur_groups into :ls_group, :ld_balance, :ld_amttobereconciled;

do while SQLCA.SQLCode = 0 
	
	this.text = "Calculating Group "+ls_group
	
	if isnull(ld_balance) then ld_balance = 0
	if isnull(ld_amttobereconciled) then ld_amttobereconciled = 0	
	
	ld_movingdate = relativedate(ld_dsodate,-1)
	ld_remamount = ld_balance
	ld_remadjamount = ld_balance - ld_amttobereconciled
	ld_dso = 0
	ld_ajusteddso = 0
	lb_ajusteddsodone = FALSE
	
	do while ld_remamount > 0

		if upper(DayName(ld_movingdate)) <> 'SUNDAY' then

			// Las transacciones del Domingo son sumadas el dia Lunes!
			if upper(DayName(ld_movingdate)) = 'MONDAY' then
				ld_datefrom = datetime(relativedate(ld_movingdate, -1),time('00:00:00'))
			else
				ld_datefrom = datetime(ld_movingdate,time('00:00:00'))
			end if			
			
			ld_dateto = datetime(ld_movingdate,time('23:59:59'))		
			
			// Get the daily debits (transactions - cancelations)	
			SELECT sum(debit_trans_diaria) - sum(credit_trans_diaria)  
			INTO :ld_dailydebits  
			FROM dba.TRANSACCION_DIARIA_PAYEE  
			WHERE ( dba.TRANSACCION_DIARIA_PAYEE.ID_GROUP_TRANS_DIARIA = :ls_group ) AND  
				   ( dba.TRANSACCION_DIARIA_PAYEE.ID_CONCEPTO_CONTABLE in ('AVO','TD') ) AND  
				   ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA >= :ld_datefrom ) AND
				   ( dba.TRANSACCION_DIARIA_PAYEE.DATE_TRANS_DIARIA <= :ld_dateto );
		
			if isnull(ld_dailydebits) then ld_dailydebits = 0
		
			ld_remamount = ld_remamount - ld_dailydebits
			ld_remadjamount = ld_remadjamount - ld_dailydebits
			
			// DSO
			if ld_remamount > 0 then
				ld_dso++
			else			
				if ld_dailydebits > 0 then				
					ld_dso = ld_dso + ((ld_remamount + ld_dailydebits) / ld_dailydebits ) // Percentage for the last day
				end if
			end if						

			// Adjusted DSO
			if ld_remadjamount > 0 then
				ld_ajusteddso++
			else
				if ld_dailydebits > 0 and not lb_ajusteddsodone then
					ld_ajusteddso = ld_ajusteddso + ((ld_remadjamount + ld_dailydebits) / ld_dailydebits ) // Percentage for the last day
					lb_ajusteddsodone = TRUE
				end if
			end if
			
			// Maximun DSO = 30 days
			if ld_dso > 29 then
				ld_remamount = -1
			end if

		end if

		ld_movingdate = relativedate(ld_movingdate,-1)

	loop

	ld_dso = round(ld_dso,2)
	ld_ajusteddso = round(ld_ajusteddso,2)

	// Actualiza el DSO para el grupo
	UPDATE dba.GROUP_BRANCH
	SET fin_dso = :ld_dso,
	    fin_ajusteddso = :ld_ajusteddso
	WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :ls_group;

	fetch cur_groups into :ls_group, :ld_balance, :ld_amttobereconciled;
loop

close cur_groups;

commit;

ld_datefrom = datetime(ld_dsodate,time('00:00:00'))
ld_dateto = datetime(ld_dsodate,time('23:59:59'))	

// Delete previous history for the same day
DELETE FROM dba.HISTORY_BALANCE WHERE date_balance >= :ld_datefrom AND date_balance <= :ld_dateto;
commit;

// Insert the history for this day
INSERT INTO dba.HISTORY_BALANCE
SELECT id_main_branch, :ld_dsodate, ISNULL(DEBITO_GROUP,0), ISNULL(CREDITO_GROUP,0), ISNULL(BALANCE_GROUP,0), 
       ISNULL(fin_dso,0), ISNULL(fin_amttobereconciled,0), ISNULL(fin_ajusteddso,0)
FROM dba.GROUP_BRANCH WHERE GROUP_TYPE IN ('A','R') AND FLAG_GRUPO <> 'C';
commit;

////////////////

this.text = "Recalculate Previous Day DSO"

cb_query.triggerevent(Clicked!)

Setpointer(Arrow!)
end event

type cb_query from commandbutton within w_balancemgmt
string tag = "Query"
integer x = 3419
integer y = 32
integer width = 297
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Query"
boolean default = true
end type

event clicked;String ls_collmet, ls_incoll, ls_disputed

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Connection
n_tr SQLCA_RPT
SQLCA_RPT = Create n_tr
SQLCA_RPT.DBMS = "SNC SQL Native Client(OLE DB)"
SQLCA_RPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
SQLCA_RPT.ServerName = gs_servername_rpt
if SQLCA_RPT.of_connect() <> 0 then
	Messagebox("Error","Error trying connection to Reporting Database"+char(13)+char(10)+SQLCA_RPT.SQLErrText,StopSign!)
	return
end if
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


if cbx_summary.checked then
	dw_1.DataObject = 'dw_balancemngm_summary'
else
	dw_1.DataObject = 'dw_balancemngm'
end if

//dw_1.SetTransObject(SQLCA)
dw_1.SetTransObject(SQLCA_RPT)


if cbx_collection.checked then
	ls_incoll = 'CO'
else
	ls_incoll = 'ANY'
end if

if cbx_disputed.checked then
	ls_disputed = 'Y'
else
	ls_disputed = 'N'	
end if

if lb_collectionmethod.text = 'DEPOSIT' THEN
	ls_collmet = 'DE'
elseif lb_collectionmethod.text = 'ACH' THEN
	ls_collmet = 'AC'
elseif lb_collectionmethod.text = 'ARMORED CAR' THEN
	ls_collmet = 'CA'
elseif lb_collectionmethod.text = 'IN COLLECTION' THEN
	ls_collmet = 'CO'
elseif lb_collectionmethod.text = 'ELECTRONIC CHECK' THEN
	ls_collmet = 'EA'	
else
	ls_collmet = 'ALL'
end if
	
//dw_balance.retrieve(ls_collmet)
dw_1.retrieve(ls_collmet,ls_incoll,ls_disputed)


// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
end event

type lb_collectionmethod from dropdownlistbox within w_balancemgmt
integer x = 1381
integer y = 32
integer width = 558
integer height = 380
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"-ALL-","ACH","DEPOSIT","ELECTRONIC CHECK","ARMORED CAR","IN COLLECTION"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_balancemgmt
integer x = 937
integer y = 40
integer width = 439
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Collection Method :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_summary from checkbox within w_balancemgmt
integer x = 1961
integer y = 40
integer width = 334
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Summary"
end type

type cbx_collection from checkbox within w_balancemgmt
integer x = 2299
integer y = 40
integer width = 485
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "In Collection Only"
end type

type cbx_disputed from checkbox within w_balancemgmt
integer x = 2816
integer y = 40
integer width = 503
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "With Disputed Amt."
end type

