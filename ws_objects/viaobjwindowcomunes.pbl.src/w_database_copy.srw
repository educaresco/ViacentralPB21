$PBExportHeader$w_database_copy.srw
forward
global type w_database_copy from w2_master_report_agency
end type
type cb_copy from commandbutton within w_database_copy
end type
type st_2 from st_1 within w_database_copy
end type
type lst_agencies_target from my_ddlb within w_database_copy
end type
type sle_idbranch_target from singlelineedit within w_database_copy
end type
end forward

global type w_database_copy from w2_master_report_agency
integer x = 214
integer y = 221
integer width = 2075
integer height = 884
boolean resizable = false
cb_copy cb_copy
st_2 st_2
lst_agencies_target lst_agencies_target
sle_idbranch_target sle_idbranch_target
end type
global w_database_copy w_database_copy

type variables
String is_branch_id, is_group
end variables

forward prototypes
public subroutine fn_cleanscreen ()
public subroutine fn_updatebranch (character p_updatedbranch)
end prototypes

public subroutine fn_cleanscreen ();//
//is_branch_id = 'NONE'
//is_group = 'NONE'
//
//dw_creditaudit.reset()
//dw_statusaudit.reset()
//
//st_balance.text = ""
//st_creditavailable.text = ""
//st_oustanding.text = ""
//em_creditlimit.text = ""
//sle_comment.text = ""
//mle_statuscomments.text = ""
//st_status.text = ""
//
//p_picture.visible = false
//
//cb_updatestatus.enabled = false
//cb_updatecredit.enabled = false
//cb_updatecomments.enabled = false
//
//
end subroutine

public subroutine fn_updatebranch (character p_updatedbranch);
end subroutine

on w_database_copy.create
int iCurrent
call super::create
this.cb_copy=create cb_copy
this.st_2=create st_2
this.lst_agencies_target=create lst_agencies_target
this.sle_idbranch_target=create sle_idbranch_target
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_copy
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.lst_agencies_target
this.Control[iCurrent+4]=this.sle_idbranch_target
end on

on w_database_copy.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_copy)
destroy(this.st_2)
destroy(this.lst_agencies_target)
destroy(this.sle_idbranch_target)
end on

type st_1 from w2_master_report_agency`st_1 within w_database_copy
integer x = 55
integer y = 156
integer width = 411
end type

type sle_idbranch from w2_master_report_agency`sle_idbranch within w_database_copy
integer x = 489
integer y = 140
end type

event sle_idbranch::modified;call super::modified;lst_agencies.setselectedid( sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_agencies.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF



end event

type cb_query from w2_master_report_agency`cb_query within w_database_copy
boolean visible = false
integer x = 1801
integer y = 152
integer weight = 700
boolean enabled = false
boolean default = false
end type

type dw_1 from w2_master_report_agency`dw_1 within w_database_copy
boolean visible = false
end type

type gb_1 from w2_master_report_agency`gb_1 within w_database_copy
integer x = 32
integer y = 24
integer width = 1952
integer height = 660
string text = ""
end type

type lst_agencies from w2_master_report_agency`lst_agencies within w_database_copy
integer x = 846
integer y = 136
integer taborder = 0
end type

event lst_agencies::constructor;this.addqueryad("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R')  and id_status_branch = 'O'  order by name_branch;")
end event

event lst_agencies::selectionchanged;sle_idbranch.text = lst_agencies.getdataid()
sle_idbranch.TextColor	= RGB(0,0,0)

if sle_idbranch.text = '--' then sle_idbranch.text = ''	


end event

type cb_copy from commandbutton within w_database_copy
integer x = 1321
integer y = 492
integer width = 535
integer height = 92
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Database"
end type

event clicked;
Long	ll_cont, ll_cont1
String ls_id_branch, ls_id_branch_target, ls_confirmation_msg
	
ls_id_branch = sle_idbranch.text
ls_id_branch_target = sle_idbranch_target.text

SetPointer(HourGlass!)

SELECT count(*)
  INTO :ll_cont
  FROM dba.branch
 WHERE id_type_branch in ('A','R')
	AND id_branch = :ls_id_branch;

if ll_cont = 0 then
	Messagebox("Error","La agencia de origen no existe.",StopSign!)
	return
end if

SELECT count(*)
  INTO :ll_cont
  FROM dba.branch
 WHERE id_type_branch in ('A','R')
	AND id_branch = :ls_id_branch_target;

if ll_cont = 0 then
	Messagebox("Error","La agencia destino no existe.",StopSign!)
	return
end if

if Messagebox("Confirmacion","Esta seguro que desea copiar la base de datos de la agencia "+ls_id_branch+" a la agencia "+ls_id_branch_target+"?", Information!,YesNo!) > 1 then 
	return
end if
	
SELECT count(*) 
  INTO :ll_cont1
  FROM dba.SENDER
 WHERE ID_BRANCH = :ls_id_branch_target;		

// Si existe senders en el target
if ll_cont1 > 0 then		
	Messagebox("Error","La agencia destino no esta vacia, no es posible hacer la copia.",StopSign!)
	return			
end if


DECLARE spCopyDatabase PROCEDURE FOR dba.spCopyDatabase @id_branchsource = :ls_id_branch, @id_branchtarget = :ls_id_branch_target;	
EXECUTE spCopyDatabase;

If SQLCA.SQLCode <> -1 then Messagebox ("Error "+String(SQLCA.SQLCode),"Error ejecutando comando en la base de datos ~n~r"+SQLCA.SQLErrText)


Messagebox ("Proceso Terminado","Proceso Terminado")

SetPointer(Arrow!)


end event

type st_2 from st_1 within w_database_copy
integer y = 256
boolean bringtotop = true
string text = "Agencia Destino:"
end type

type lst_agencies_target from my_ddlb within w_database_copy
integer x = 846
integer y = 236
integer width = 1010
integer height = 1504
integer taborder = 0
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event selectionchanged;call super::selectionchanged;sle_idbranch_target.text = lst_agencies_target.getdataid()
sle_idbranch_target.TextColor	= RGB(0,0,0)

if sle_idbranch_target.text = '--' then sle_idbranch_target.text = ''


end event

event constructor;call super::constructor;this.addqueryad("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O'  order by name_branch;")
end event

type sle_idbranch_target from singlelineedit within w_database_copy
integer x = 489
integer y = 240
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
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_agencies_target.setselectedid( sle_idbranch_target.text )

// Chequea que este en la lista
IF sle_idbranch_target.text <> lst_agencies_target.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF


end event

