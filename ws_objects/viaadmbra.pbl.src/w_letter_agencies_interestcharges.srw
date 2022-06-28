$PBExportHeader$w_letter_agencies_interestcharges.srw
forward
global type w_letter_agencies_interestcharges from w2_master_report_agency
end type
type cb_1 from commandbutton within w_letter_agencies_interestcharges
end type
end forward

global type w_letter_agencies_interestcharges from w2_master_report_agency
integer x = 214
integer y = 221
cb_1 cb_1
end type
global w_letter_agencies_interestcharges w_letter_agencies_interestcharges

on w_letter_agencies_interestcharges.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_letter_agencies_interestcharges.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
end on

type st_1 from w2_master_report_agency`st_1 within w_letter_agencies_interestcharges
end type

type sle_idbranch from w2_master_report_agency`sle_idbranch within w_letter_agencies_interestcharges
end type

type cb_query from w2_master_report_agency`cb_query within w_letter_agencies_interestcharges
end type

type dw_1 from w2_master_report_agency`dw_1 within w_letter_agencies_interestcharges
string dataobject = "dw_letter_agencies_interestcharges"
end type

type gb_1 from w2_master_report_agency`gb_1 within w_letter_agencies_interestcharges
end type

type lst_agencies from w2_master_report_agency`lst_agencies within w_letter_agencies_interestcharges
end type

type cb_1 from commandbutton within w_letter_agencies_interestcharges
integer x = 2711
integer y = 60
integer width = 366
integer height = 92
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Todas!"
end type

event clicked;String ls_branch, ls_fax, ls_activefax

Setpointer(Hourglass!)	

DECLARE cur_agencies CURSOR FOR
SELECT b.id_branch
  FROM DBA.BRANCH b, DBA.GROUP_BRANCH g
 WHERE b.id_main_branch = g.id_main_branch
	AND FIN_SCHEDULE is not null
	AND rtrim(FIN_SCHEDULE) <> ''
	AND FIN_COLLECTMETHOD is not null
	AND id_status_branch = 'O'
	AND id_type_branch in ('A','R')
	AND id_branch in (select id_branch from dba.receiver where date_receiver > getdate()-250);
		


OPEN cur_agencies;

FETCH cur_agencies INTO :ls_branch;

DO WHILE SQLCA.SQLCODE = 0

	ls_fax = fn_getbranchfax(ls_branch)	
	if len(ls_fax) > 5 and len(ls_fax) < 15 then
		ls_activefax = "@F201 "+ls_branch+"@@F211 "+ls_fax+"@@F307 Carta de Intereses@"		
		dw_1.retrieve(ls_branch,ls_activefax)	
		dw_1.print()				
	end if
	
	FETCH cur_agencies INTO :ls_branch;
LOOP

CLOSE cur_agencies;


Setpointer(Arrow!)

end event

