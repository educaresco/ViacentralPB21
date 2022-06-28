$PBExportHeader$my_ddlb.sru
forward
global type my_ddlb from pfc_u_ddlb
end type
end forward

global type my_ddlb from pfc_u_ddlb
boolean sorted = false
end type
global my_ddlb my_ddlb

forward prototypes
public subroutine addquery (string ls_query)
public function string getdatavalue ()
public function string getdataid ()
public subroutine setselectedid (string ls_id)
public subroutine addqueryad (string ls_query)
public subroutine addqueryall (string ls_query)
end prototypes

public subroutine addquery (string ls_query);string ls_data, ls_id

this.reset()

DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA;
PREPARE SQLSA FROM :ls_Query;
OPEN DYNAMIC my_cursor;
FETCH my_cursor INTO :ls_data, :ls_id;
DO WHILE SQLCA.SQLCODE = 0	
	this.additem(fn_completar_cadena(ls_data,'D',' ',100)+'*'+ls_id)
	FETCH my_cursor INTO :ls_data, :ls_id;
LOOP
CLOSE my_cursor;

this.SelectItem(1)
end subroutine

public function string getdatavalue ();return trim(fn_token(this.text,'*',1))
end function

public function string getdataid ();return trim(fn_token(this.text,'*',2))
end function

public subroutine setselectedid (string ls_id);Boolean lb_found
Integer n, li_pos

lb_found = false
li_pos = 1

//FOR n = 1 to this.TotalItems()
//	this.selectitem(n)
//	if trim(fn_token(this.text,'*',2)) = ls_id then
//		li_pos = n
//		lb_found = true
//	end if
//NEXT

FOR n = 1 to this.TotalItems()
	if trim(fn_token(this.text(n),'*',2)) = ls_id then
		li_pos = n
		lb_found = true
	end if
NEXT

this.selectitem(li_pos)
end subroutine

public subroutine addqueryad (string ls_query);string ls_data, ls_id

this.reset()

this.additem(fn_completar_cadena('[SELECT ONE]','D',' ',100)+'*--')

DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA;
PREPARE SQLSA FROM :ls_Query;
OPEN DYNAMIC my_cursor;
FETCH my_cursor INTO :ls_data, :ls_id;
DO WHILE SQLCA.SQLCODE = 0	
	this.additem(fn_completar_cadena(ls_data,'D',' ',100)+'*'+ls_id)
	FETCH my_cursor INTO :ls_data, :ls_id;
LOOP
CLOSE my_cursor;

this.SelectItem(1)
end subroutine

public subroutine addqueryall (string ls_query);string ls_data, ls_id

this.reset()

this.additem(fn_completar_cadena('[ALL]','D',' ',100)+'*-ALL-')

DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA;
PREPARE SQLSA FROM :ls_Query;
OPEN DYNAMIC my_cursor;
FETCH my_cursor INTO :ls_data, :ls_id;
DO WHILE SQLCA.SQLCODE = 0	
	this.additem(fn_completar_cadena(ls_data,'D',' ',100)+'*'+ls_id)
	FETCH my_cursor INTO :ls_data, :ls_id;
LOOP
CLOSE my_cursor;

this.SelectItem(1)
end subroutine

on my_ddlb.create
end on

on my_ddlb.destroy
end on

