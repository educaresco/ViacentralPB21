$PBExportHeader$w_cla_administration.srw
forward
global type w_cla_administration from window
end type
type st_8 from statictext within w_cla_administration
end type
type rb_all from radiobutton within w_cla_administration
end type
type rb_single from radiobutton within w_cla_administration
end type
type st_7 from statictext within w_cla_administration
end type
type cb_3 from commandbutton within w_cla_administration
end type
type cb_retransmit from commandbutton within w_cla_administration
end type
type cb_assign from commandbutton within w_cla_administration
end type
type sle_total from singlelineedit within w_cla_administration
end type
type st_6 from statictext within w_cla_administration
end type
type sle_available from singlelineedit within w_cla_administration
end type
type em_id_branch from editmask within w_cla_administration
end type
type sle_name_branch from singlelineedit within w_cla_administration
end type
type em_quantity from editmask within w_cla_administration
end type
type st_2 from statictext within w_cla_administration
end type
type st_5 from statictext within w_cla_administration
end type
type st_4 from statictext within w_cla_administration
end type
type st_3 from statictext within w_cla_administration
end type
type st_1 from statictext within w_cla_administration
end type
type lb_payors from dropdownlistbox within w_cla_administration
end type
type gb_2 from groupbox within w_cla_administration
end type
type gb_5 from groupbox within w_cla_administration
end type
type gb_6 from groupbox within w_cla_administration
end type
type cb_assignall from commandbutton within w_cla_administration
end type
type em_quantityall from editmask within w_cla_administration
end type
type gb_4 from groupbox within w_cla_administration
end type
type lb_report from listbox within w_cla_administration
end type
type gb_1 from groupbox within w_cla_administration
end type
type gb_all from groupbox within w_cla_administration
end type
end forward

global type w_cla_administration from window
integer width = 1705
integer height = 1600
boolean titlebar = true
string title = "Claves/Folios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_8 st_8
rb_all rb_all
rb_single rb_single
st_7 st_7
cb_3 cb_3
cb_retransmit cb_retransmit
cb_assign cb_assign
sle_total sle_total
st_6 st_6
sle_available sle_available
em_id_branch em_id_branch
sle_name_branch sle_name_branch
em_quantity em_quantity
st_2 st_2
st_5 st_5
st_4 st_4
st_3 st_3
st_1 st_1
lb_payors lb_payors
gb_2 gb_2
gb_5 gb_5
gb_6 gb_6
cb_assignall cb_assignall
em_quantityall em_quantityall
gb_4 gb_4
lb_report lb_report
gb_1 gb_1
gb_all gb_all
end type
global w_cla_administration w_cla_administration

forward prototypes
public subroutine fn_refreshscreen ()
protected function long fn_gensqlclaves (string ls_id_branch, string ls_id_main_branch)
end prototypes

public subroutine fn_refreshscreen ();gb_all.visible = rb_all.checked
st_7.visible = rb_all.checked
cb_assignall.visible = rb_all.checked
em_quantityall.visible = rb_all.checked
lb_report.visible = rb_all.checked
st_8.visible = rb_all.checked

gb_1.visible = rb_single.checked
gb_5.visible = rb_single.checked
gb_4.visible = rb_single.checked
st_2.visible = rb_single.checked
st_3.visible = rb_single.checked
st_4.visible = rb_single.checked
st_5.visible = rb_single.checked
st_6.visible = rb_single.checked
em_id_branch.visible = rb_single.checked
sle_name_branch.visible = rb_single.checked
sle_available.visible = rb_single.checked
em_quantity.visible = rb_single.checked
sle_total.visible = rb_single.checked
cb_assign.visible = rb_single.checked
cb_retransmit.visible = rb_single.checked
end subroutine

protected function long fn_gensqlclaves (string ls_id_branch, string ls_id_main_branch);double ld_clave
string ls_FileName, ls_sql, ls_group
int li_FileNum
long ll_cont
long ll_result
boolean lb_writefile
String ls_agencyfolder

ll_result = 0

String ls_outputfolder
SELECT ISNULL(DIR_OUTPUT,'R:\OUTPUT\')
  INTO :ls_outputfolder
  FROM dba.PARAMETROS;	

 SELECT Count(*)
   INTO :ll_cont
   FROM dba.CLAVES  
  WHERE ( dba.CLAVES.ID_USED = 'N' )     
	 AND ( dba.CLAVES.id_branch = :ls_id_branch);

//    AND ( dba.CLAVES.ID_GROUP_PAYEE = :ls_id_main_branch)
//    AND ( dba.CLAVES.ID_TRANS = 'N' )   

IF ll_cont < 1 THEN
	return ll_result
END IF

SELECT COUNT(*) 
INTO :ll_cont
FROM DBA.TIPO_TRANSMISION_AGENCIA
WHERE ID_BRANCH = :ls_id_branch;

lb_writefile = true

IF ll_cont = 1 THEN
	lb_writefile = false
END IF

DECLARE cur_claves CURSOR FOR  
SELECT dba.CLAVES.ID_CLAVE, ID_GROUP_PAYEE  
FROM dba.CLAVES  
WHERE ( dba.CLAVES.ID_USED = 'N' )     
AND ( dba.CLAVES.id_branch = :ls_id_branch);

// AND ( dba.CLAVES.ID_TRANS = 'N' )   
// AND ( dba.CLAVES.ID_GROUP_PAYEE = :ls_id_main_branch)
// Se removio esto y se puso el DELETE para limpiar claves reasignadas.


OPEN cur_claves;

ls_agencyfolder = ''
if fileexists(ls_outputfolder+trim(ls_id_branch)) then ls_agencyfolder = trim(ls_id_branch) + '\'

if lb_writefile then ls_FileName = ls_outputfolder + ls_agencyfolder + "CLA"+FILL('0',10 - LEN(trim(ls_id_branch)))+trim(ls_id_branch)+".sql"
//if lb_writefile then li_FileNum = FileOpen(ls_FileName, LineMode!, Write!, LockWrite!,Append!)
if lb_writefile then li_FileNum = FileOpen(ls_FileName, LineMode!, Write!, LockWrite!,Replace!)


if lb_writefile then FileWrite(li_FileNum,"SET option on_error = CONTINUE;")

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Temporal mientras se actualizan las agencias
//if lb_writefile then FileWrite(li_FileNum,"ALTER TABLE claves DROP PRIMARY KEY;")
//if lb_writefile then FileWrite(li_FileNum,"ALTER TABLE claves ADD CONSTRAINT PK_CLAVES PRIMARY KEY (id_group_payee, id_clave);")


///////////////////////////////////
// Temporal para eliminar claves reasignadas!

if lb_writefile then FileWrite(li_FileNum,"DELETE from dba.claves where id_used = 'N';")
if lb_writefile then FileWrite(li_FileNum,"COMMIT;")

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

FETCH cur_claves INTO :ld_clave, :ls_group;
DO WHILE SQLCA.SQLCODE = 0

	ls_group = trim(ls_group)
	ll_result++
	
	ls_sql = "INSERT INTO CLAVES (id_group_payee, id_clave, id_used) VALUES ('"+trim(ls_group)+"',"+string(ld_clave)+",'N');"		
	if lb_writefile then FileWrite(li_FileNum,ls_sql)
	
	UPDATE dba.claves
	SET id_trans = 'Y', date_trans = getdate()
	WHERE id_group_payee = :ls_id_main_branch
	AND id_branch = :ls_id_branch
	AND id_clave = :ld_clave;
	
	FETCH cur_claves INTO :ld_clave, :ls_group;	
LOOP
if lb_writefile then FileWrite(li_FileNum,"COMMIT;") 
if lb_writefile then FileClose(li_FileNum) 

CLOSE cur_claves;

FileClose(li_FileNum)

return ll_result
end function

on w_cla_administration.create
this.st_8=create st_8
this.rb_all=create rb_all
this.rb_single=create rb_single
this.st_7=create st_7
this.cb_3=create cb_3
this.cb_retransmit=create cb_retransmit
this.cb_assign=create cb_assign
this.sle_total=create sle_total
this.st_6=create st_6
this.sle_available=create sle_available
this.em_id_branch=create em_id_branch
this.sle_name_branch=create sle_name_branch
this.em_quantity=create em_quantity
this.st_2=create st_2
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_1=create st_1
this.lb_payors=create lb_payors
this.gb_2=create gb_2
this.gb_5=create gb_5
this.gb_6=create gb_6
this.cb_assignall=create cb_assignall
this.em_quantityall=create em_quantityall
this.gb_4=create gb_4
this.lb_report=create lb_report
this.gb_1=create gb_1
this.gb_all=create gb_all
this.Control[]={this.st_8,&
this.rb_all,&
this.rb_single,&
this.st_7,&
this.cb_3,&
this.cb_retransmit,&
this.cb_assign,&
this.sle_total,&
this.st_6,&
this.sle_available,&
this.em_id_branch,&
this.sle_name_branch,&
this.em_quantity,&
this.st_2,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_1,&
this.lb_payors,&
this.gb_2,&
this.gb_5,&
this.gb_6,&
this.cb_assignall,&
this.em_quantityall,&
this.gb_4,&
this.lb_report,&
this.gb_1,&
this.gb_all}
end on

on w_cla_administration.destroy
destroy(this.st_8)
destroy(this.rb_all)
destroy(this.rb_single)
destroy(this.st_7)
destroy(this.cb_3)
destroy(this.cb_retransmit)
destroy(this.cb_assign)
destroy(this.sle_total)
destroy(this.st_6)
destroy(this.sle_available)
destroy(this.em_id_branch)
destroy(this.sle_name_branch)
destroy(this.em_quantity)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.lb_payors)
destroy(this.gb_2)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.cb_assignall)
destroy(this.em_quantityall)
destroy(this.gb_4)
destroy(this.lb_report)
destroy(this.gb_1)
destroy(this.gb_all)
end on

event open;string ls_id_main_branch, ls_name_main_branch

sle_available.text = ""
em_quantity.text = '0'
sle_total.text = '0'
cb_assign.enabled = false
cb_retransmit.enabled = false
em_quantity.enabled = false

this.fn_refreshscreen()

lb_payors.reset()

//---------------------------------------------------------------------------------------------------
// Fill the listbox with the payors that uses pre-assigned claves
 DECLARE cur_payors CURSOR FOR  
  SELECT dba.GROUP_BRANCH.ID_MAIN_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH  
    FROM dba.GROUP_BRANCH  
   WHERE (dba.GROUP_BRANCH.GRO_COMPANYIDFOLIO = 'PRE-ASSIGN' OR ID_MAIN_BRANCH = 'T049')	
	  AND FLAG_GRUPO = 'A'
//Don (12-12-2013) -- Added Payer 'T000' to the dropdown.  *******************************
UNION
  SELECT dba.GROUP_BRANCH.ID_MAIN_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH  
    FROM dba.GROUP_BRANCH  
	WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = 'T000'
//*************************************************************************
	ORDER BY name_main_branch;
	
OPEN cur_payors;
FETCH cur_payors into :ls_id_main_branch, :ls_name_main_branch;
DO WHILE SQLCA.SQLCODE = 0 
	lb_payors.additem(fn_completar_cadena(ls_name_main_branch,'D',' ',100)+'*'+ls_id_main_branch)
	FETCH cur_payors into :ls_id_main_branch, :ls_name_main_branch;
LOOP
CLOSE cur_payors;
//---------------------------------------------------------------------------------------------------

lb_payors.SelectItem(1)
SetFocus(em_id_branch)

//Don (12-12-2013) - *********************************************************
IF gb_admin 	THEN
	rb_all.enabled	=	TRUE
ELSE
	rb_all.enabled	=	FALSE
END IF
//***********************************************************************

end event

type st_8 from statictext within w_cla_administration
integer x = 110
integer y = 652
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Report :"
boolean focusrectangle = false
end type

type rb_all from radiobutton within w_cla_administration
integer x = 841
integer y = 300
integer width = 521
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "All Open Branches"
end type

event clicked;parent.fn_refreshscreen()
end event

type rb_single from radiobutton within w_cla_administration
integer x = 343
integer y = 300
integer width = 480
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Single Branch"
boolean checked = true
end type

event clicked;parent.fn_refreshscreen()
end event

type st_7 from statictext within w_cla_administration
integer x = 59
integer y = 548
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fill to :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_cla_administration
integer x = 1230
integer y = 1380
integer width = 393
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_retransmit from commandbutton within w_cla_administration
integer x = 983
integer y = 1004
integer width = 526
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Re-Transmit Claves"
end type

event clicked;SetPointer(HourGlass!)

// ******************
// Validate U: Drive!
fn_map_output()
if not fileexists('R:\Output') then
	Messagebox("Error!","La unidad necesaria no esta mapeada, favor intente nuevamente o contacte a Tecnologia si el problema se repite!",StopSign!)
	return
end if
// ******************

string ls_id_main_branch
long ll_exported, ll_cont

ls_id_main_branch = fn_token(lb_payors.Text,"*",2)

if isnull(ls_id_main_branch) or len(trim(ls_id_main_branch)) < 1 then
	sle_available.text = ""
	em_quantity.text = '0'
	sle_total.text = '0'
	cb_assign.enabled = false
	cb_retransmit.enabled = false
	em_quantity.enabled = false
	messagebox("Payer not found","Please select a payer from the list",StopSign!)
	SetFocus(lb_payors)
	return		
end if

// :::::::::::::::::::::::::::::::
// Valida el tipo de agencia
SELECT COUNT(*) 
  INTO :ll_cont
  FROM DBA.TIPO_TRANSMISION_AGENCIA
 WHERE ID_BRANCH = :em_id_branch.text;

IF ll_cont = 1 THEN
	Messagebox('Process Canceled','The agency '+sle_name_branch.text+' is a Red Phone or Central Based Agency')
	return
end if
// :::::::::::::::::::::::::::::::

UPDATE dba.claves
   SET id_trans = 'N'
 WHERE id_group_payee = :ls_id_main_branch
   AND id_branch = :em_id_branch.text
   AND id_used = 'N';

commit;

ll_exported = parent.fn_gensqlclaves(em_id_branch.text,ls_id_main_branch)

SetPointer(Arrow!)

Messagebox('Process Complete','A total of '+string(ll_exported)+' have been transmited to '+sle_name_branch.text)
	

end event

type cb_assign from commandbutton within w_cla_administration
integer x = 169
integer y = 1192
integer width = 649
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Assign and Transmit Claves"
end type

event clicked;SetPointer(HourGlass!)

string ls_id_main_branch, ls_clave_pre
long ll_quantity, ll_exported, ll_cont, ll_result, i
double ld_nextclave

// ******************
// Validate U: Drive!
fn_map_output()
if not fileexists('R:\Output') then
	Messagebox("Error!","La unidad necesaria no esta mapeada, favor intente nuevamente o contacte a Tecnologia si el problema se repite!",StopSign!)
	return
end if
// ******************

// ========================================================================================
// Validations

SELECT COUNT(*) 
  INTO :ll_cont
  FROM DBA.TIPO_TRANSMISION_AGENCIA
 WHERE ID_BRANCH = :em_id_branch.text;

IF ll_cont = 1 THEN
	Messagebox('Process Canceled','The agency '+sle_name_branch.text+' is a Red Phone or Central Based Agency')
	return
end if

ls_id_main_branch = fn_token(lb_payors.Text,"*",2)

if isnull(ls_id_main_branch) or len(trim(ls_id_main_branch)) < 1 then
	sle_available.text = ""
	em_quantity.text = '0'
	sle_total.text = '0'
	cb_assign.enabled = false
	cb_retransmit.enabled = false
	em_quantity.enabled = false
	messagebox("Payer not found","Please select a payer from the list",StopSign!)
	SetFocus(lb_payors)
	return		
end if

ll_quantity = double(em_quantity.text)

if isnull(ll_quantity) or (ll_quantity < 1) or (ll_quantity > 300 and em_id_branch.text <> 'A00001') then
	MessageBox("Invalid Quantity","Quantity must be between 0 and 300",StopSign!)
	SetFocus(em_quantity)
	return
end if


if ll_quantity > 0 then


	if ls_id_main_branch = 'T141' then // Banamex
		
		ls_clave_pre =  '6' + right(em_id_branch.text,4)
		
		if isnumber(ls_clave_pre) and len(ls_clave_pre) = 5 then
			
			SELECT MAX(ID_CLAVE)
			INTO :ld_nextclave
			FROM DBA.CLAVES 
			WHERE ID_GROUP_PAYEE = 'T141'
			AND ID_BRANCH = :em_id_branch.text
			and ID_CLAVE > 6000000000 
			and ID_CLAVE < 7000000000;
			 
			if isnull(ld_nextclave) or ld_nextclave = 0 then ld_nextclave = double(string(ls_clave_pre) + string('00000'))
			 
			DO WHILE i <= ll_quantity
			
				ld_nextclave = ld_nextclave + 1
								
				INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
				VALUES ( :ls_id_main_branch, :ld_nextclave, 'N', :em_id_branch.text, getdate(), upper(SYSTEM_USER), 'N', null)  ;	
				
				if sqlca.sqlcode <> 0 then
					messagebox( "Error Asignacion de Claves", "Error insert clave Banamex - "+ls_id_main_branch + "~n~r" + SQLCA.sqlerrtext,StopSign!)
				end if	
						
				IF SQLCA.SQLCODE = 0 THEN
					i = i + 1
				END IF
			
			LOOP

		end if
	
		
	else // Busca las claves en las tablas de disponibilidad:

	
	
		DECLARE spGenBranchClaves PROCEDURE FOR dba.spGenBranchClaves @p_id_branch = :em_id_branch.text, @p_id_payer = :ls_id_main_branch,  @p_quantity = :ll_quantity;
			
		EXECUTE spGenBranchClaves;
		
		if sqlca.sqlcode <> 0 then			
			messagebox( "Error Asignacion de Claves", "Error execute SP - "+ls_id_main_branch + "~n~r" + SQLCA.sqlerrtext,StopSign!)
			//fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "Error execute SP - "+ls_id_main_branch)
		end if
		
		FETCH spGenBranchClaves INTO :ll_result;
		if sqlca.sqlcode <> 0 then			
			messagebox( "Error Asignacion de Claves", "Error fetch SP - "+ls_id_main_branch + "~n~r" + SQLCA.sqlerrtext,StopSign!)
			//fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "Error fetch SP - "+ls_id_main_branch)
		end if
		
		if ll_result < 0 then
			messagebox( "Error Asignacion de Claves", "No hay suficientes claves disponibles para "+ls_id_main_branch + "~n~rSP returned -1",StopSign!)
			//fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - "+ls_id_main_branch)
		end if
		
		CLOSE spGenBranchClaves;
		
	end if 	//  end pagador
	
	
	// Publica las claves
	if left( em_id_branch.text ,4) <> 'A000' then		
		ll_exported = parent.fn_gensqlclaves(em_id_branch.text,ls_id_main_branch)
	end if	
	
end if  // end quantity > 0
	




// <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
// Updated the clave count:	
select count(*)
into :sle_available.text
from dba.claves
where id_branch = :em_id_branch.text
and id_used = 'N'
and id_group_payee = :ls_id_main_branch;

em_quantity.text = '0'

sle_total.text = string(double(sle_available.text)+double(em_quantity.text))
// <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>




SetPointer(Arrow!)


//
//
//// ========================================================================================
//
//double ld_last_nnn, ld_next_nnn
//string ls_next_nnn, ls_semilla	
//long i
//
//
//// BTS - Bancomer
//if ls_id_main_branch = 'T057' or ls_id_main_branch = 'T082' or ls_id_main_branch = 'T083'  or ls_id_main_branch = 'T123'  or ls_id_main_branch = 'T124' or ls_id_main_branch = 'T131' or ls_id_main_branch = 'T134' then
//
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	// {BEGIN CLAVES BTS}	
//
//	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	// Las claves de BTS son de la forma:
//	//
//	// 1258 nnnnnn D
//	//
//	// nnnnnn Va desde 000000 hasta 999999
//	//
//	// Para quitar semilla y checksum::
//	// (convert(int,(id_clave - 12580000000)) / 10) 	
//	
//	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
//	
//
//	//ls_semilla = '1258'	
//	ls_semilla = '1387'
//	
//	i = 1
//	
//	DECLARE CUR_NUMBERS CURSOR FOR  
//	SELECT TOP :ll_top number
//	FROM dba.numbers
//	WHERE number NOT IN (SELECT (convert(int,(id_clave - 13870000000)) / 10) 
//									FROM DBA.CLAVES 
//									WHERE id_group_payee in ('T057','T082','T083','T123','T124','T131','T134'));
////	ORDER BY NUMBER;
//	
//	OPEN CUR_NUMBERS;
//	
//	FETCH CUR_NUMBERS INTO :ld_next_nnn;
//	
//	IF SQLCA.SQLCODE <> 0 THEN
//		MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//		return		
//	END IF	
//	
//	DO WHILE i <= ll_quantity AND SQLCA.SQLCODE = 0
//		
//		ls_next_nnn = string(ld_next_nnn)
//		ls_next_nnn = fn_completar_cadena(ls_next_nnn,'I','0',6)
//		ls_next_nnn = ls_semilla + mid(ls_next_nnn,1,6)		
//		ld_next_nnn = double(ls_next_nnn)
//				
//		INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
//  		VALUES ( :ls_id_main_branch, dba.sfGetBTSCheckDigit(:ld_next_nnn), 'N', :em_id_branch.text, getdate(), SYSTEM_USER, 'N', null)  ;		
//		
//		i = i + 1
//		FETCH CUR_NUMBERS INTO :ld_next_nnn;
//
//		IF SQLCA.SQLCODE <> 0 THEN
//			MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//			return		
//		END IF
//		
//	LOOP
//	
//	CLOSE CUR_NUMBERS;
//	
//	COMMIT;
//
//	if em_id_branch.text <> 'A00001' then
//		ll_exported = parent.fn_gensqlclaves(em_id_branch.text,ls_id_main_branch)
//	end if
//
//	//--------------------------------------------------------------------------
//	// Refresh Labels
//	
//	select count(*)
//	  into :sle_available.text
//	  from dba.claves
//	 where id_branch = :em_id_branch.text
//	   and id_used = 'N'
//      and id_group_payee = :ls_id_main_branch;
//	
//	em_quantity.text = '0'
//	
//	sle_total.text = string(double(sle_available.text)+double(em_quantity.text))	
//	//--------------------------------------------------------------------------
//
//	Messagebox('Process Complete','A total of '+string(ll_exported)+' have been assigned and transmited to '+sle_name_branch.text)
//	
//	// {END CLAVES BTS}
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	
//	
//elseif ls_id_main_branch = 'T049' then
//	
//	
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	// {BEGIN CLAVES ELCAMINO}	
//
//	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	// Las claves de ELCAMINO son de la forma:
//	//
//	// 401501 0000001  (13 Digitos)
//	//	
//	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
//	
//
//	i = 1
//	
//	DECLARE CUR_NUMBERS2 CURSOR FOR  
//	SELECT TOP :ll_top number
//	FROM dba.numbers
//	WHERE number NOT IN (SELECT convert(int,(right(id_clave,7)))
//									FROM DBA.CLAVES 
//									WHERE id_group_payee = 'T049');
//	//ORDER BY NUMBER;
//	
//	OPEN CUR_NUMBERS2;
//	
//	FETCH CUR_NUMBERS2 INTO :ld_next_nnn;
//	
//	IF SQLCA.SQLCODE <> 0 THEN
//		MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//		return		
//	END IF	
//	
//	DO WHILE i <= ll_quantity AND SQLCA.SQLCODE = 0
//		
//		ls_next_nnn = string(ld_next_nnn)
//		//ls_next_nnn = '401501' + fn_completar_cadena(ls_next_nnn,'I','0',7)		
//		ls_next_nnn = '4072' + fn_completar_cadena(ls_next_nnn,'I','0',7)
//		
//		ld_next_nnn = double(ls_next_nnn)
//				
//		INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
//  		VALUES ( :ls_id_main_branch, :ld_next_nnn, 'N', :em_id_branch.text, getdate(), SYSTEM_USER, 'N', null)  ;		
//		
//		i = i + 1
//		FETCH CUR_NUMBERS2 INTO :ld_next_nnn;
//
//		IF SQLCA.SQLCODE <> 0 THEN
//			MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//			return		
//		END IF
//		
//	LOOP
//	
//	CLOSE CUR_NUMBERS2;
//	
//	COMMIT;
//
//	if em_id_branch.text <> 'A00001' then
//		ll_exported = parent.fn_gensqlclaves(em_id_branch.text,ls_id_main_branch)
//	end if
//
//	//--------------------------------------------------------------------------
//	// Refresh Labels
//	
//	select count(*)
//	  into :sle_available.text
//	  from dba.claves
//	 where id_branch = :em_id_branch.text
//	   and id_used = 'N'
//      and id_group_payee = :ls_id_main_branch;
//	
//	em_quantity.text = '0'
//	
//	sle_total.text = string(double(sle_available.text)+double(em_quantity.text))	
//	//--------------------------------------------------------------------------
//
//	Messagebox('Process Complete','A total of '+string(ll_exported)+' have been assigned and transmited to '+sle_name_branch.text)
//	
//	// {END CLAVES ELCAMINO}
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		
//				
//		
//	elseif ls_id_main_branch = 'T160' then
//
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		// {BEGIN CLAVES UNITELLER - BANORTE}	
//		
//		// 67092200000 hasta 67093299999 Para los pagadores de MEX (Banorte / CPM)
//		// Inicialmente se va a usar el prefijo 			67092 y los numeros entre 200000 y 999999
//		// Cuando se acaben se puede usar el prefijo 	67093 y los numeros entre 000000 y 299999
//					
//		i = 1
//		
//		DECLARE CUR_NUMBERS3 CURSOR FOR  
//		SELECT TOP :ll_top number
//		FROM dba.numbers
//		WHERE number NOT IN (SELECT convert(int,(right(id_clave,6)))
//										FROM DBA.CLAVES 
//										WHERE id_group_payee in ('T160','T137'))
//		AND number > 200000 
//		AND number < 999999;
////		ORDER BY NUMBER;
//		
//		OPEN CUR_NUMBERS3;
//		
//		if sqlca.sqlcode <> 0 then
////			fn_log("AUTO FILL CLAVES: open CUR_NUMBERS3: "+ SQLCA.sqlerrtext)
//		end if		
//		
//		FETCH CUR_NUMBERS3 INTO :ld_next_nnn;
//		
//		IF SQLCA.SQLCODE <> 0 THEN
//
//			if ( double(right(string(Now(),"hh:mm"),2)) <> 01 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 16 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 31 )  then
//				//do nothing - no alert
//			else
//				fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - UT (BANORTE).")		
//			end if			
//			fn_email_notification2( "technology@viamericas.com", "ALERTA - Viatransmitir: No hay Claves UT (BANORTE))", "La signacion automatica de claves no cuenta con mas claves para los pagadores UT (BANORTE)! "+String(today(),"mm/dd/yyyy")+".")
//						
//			return		
//		END IF	
//		
//		DO WHILE i <= ll_quantity AND SQLCA.SQLCODE = 0
//			
//			ls_next_nnn = string(ld_next_nnn)
//			ls_next_nnn = '67092' + fn_completar_cadena(ls_next_nnn,'I','0',6)
//			ld_next_nnn = double(ls_next_nnn)
//					
//			INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
//			VALUES ( :ls_id_main_branch, :ld_next_nnn, 'N', :em_id_branch.text, getdate(), SYSTEM_USER, 'N', null)  ;		
//
//		if sqlca.sqlcode <> 0 then
////			fn_log("AUTO FILL CLAVES: insert CLAVES3: "+ SQLCA.sqlerrtext)
//		end if				
//			
//			i = i + 1
//			FETCH CUR_NUMBERS3 INTO :ld_next_nnn;
//	
//			IF SQLCA.SQLCODE <> 0 THEN
//				//MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//				if ( double(right(string(Now(),"hh:mm"),2)) <> 01 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 16 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 31 )  then
//					//do nothing - no alert
//				else
//					fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - UT (BANORTE).")		
//				end if			
//				fn_email_notification2( "technology@viamericas.com", "ALERTA - Viatransmitir: No hay Claves UT (BANORTE)", "La signacion automatica de claves no cuenta con mas claves para los pagadores UT (BANORTE)! "+String(today(),"mm/dd/yyyy")+".")
//				
//				return		
//			END IF
//			
//		LOOP
//		
//		CLOSE CUR_NUMBERS3;		
//		
//		//Messagebox('Process Complete','A total of '+string(ll_exported)+' have been assigned and transmited to '+sle_name_branch.text)
//		
//		// {END CLAVES UNITELLER - BANORTE}	
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
//	
//	
//	elseif ls_id_main_branch = 'T137' then
//
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		// {BEGIN CLAVES UNITELLER - CPM}	
//		
//		// 67092200000 hasta 67093299999 Para los pagadores de MEX (Banorte / CPM)
//		// Inicialmente se va a usar el prefijo 			67092 y los numeros entre 200000 y 999999
//		// Cuando se acaben se puede usar el prefijo 	67093 y los numeros entre 000000 y 299999
//					
//		i = 1
//		
//		DECLARE CUR_NUMBERS4 CURSOR FOR  
//		SELECT TOP :ll_top number
//		FROM dba.numbers
//		WHERE number NOT IN (SELECT convert(int,(right(id_clave,6)))
//										FROM DBA.CLAVES 
//										WHERE id_group_payee in ('T160','T137'))
//		AND number > 200000 
//		AND number < 999999;
//		//ORDER BY NUMBER;
//		
//		OPEN CUR_NUMBERS4;
//		
//		if sqlca.sqlcode <> 0 then
////			fn_log("AUTO FILL CLAVES: open CUR_NUMBERS4: "+ SQLCA.sqlerrtext)
//		end if		
//		
//		FETCH CUR_NUMBERS4 INTO :ld_next_nnn;
//		
//		IF SQLCA.SQLCODE <> 0 THEN
//
//			if ( double(right(string(Now(),"hh:mm"),2)) <> 01 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 16 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 31 )  then
//				//do nothing - no alert
//			else
//				fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - UT (CPM).")		
//			end if			
//			fn_email_notification2( "technology@viamericas.com", "ALERTA - Viatransmitir: No hay Claves UT (CPM))", "La signacion automatica de claves no cuenta con mas claves para los pagadores UT (BANORTE)! "+String(today(),"mm/dd/yyyy")+".")
//						
//			return		
//		END IF	
//		
//		DO WHILE i <= ll_quantity AND SQLCA.SQLCODE = 0
//			
//			ls_next_nnn = string(ld_next_nnn)
//			ls_next_nnn = '67092' + fn_completar_cadena(ls_next_nnn,'I','0',6)
//			ld_next_nnn = double(ls_next_nnn)
//					
//			INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
//			VALUES ( :ls_id_main_branch, :ld_next_nnn, 'N', :em_id_branch.text, getdate(), SYSTEM_USER, 'N', null)  ;		
//
//		if sqlca.sqlcode <> 0 then
////			fn_log("AUTO FILL CLAVES: insert CLAVES3: "+ SQLCA.sqlerrtext)
//		end if				
//			
//			i = i + 1
//			FETCH CUR_NUMBERS4 INTO :ld_next_nnn;
//	
//			IF SQLCA.SQLCODE <> 0 THEN
//				//MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//				if ( double(right(string(Now(),"hh:mm"),2)) <> 01 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 16 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 31 )  then
//					//do nothing - no alert
//				else
//					fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - UT (CPM).")		
//				end if			
//				fn_email_notification2( "technology@viamericas.com", "ALERTA - Viatransmitir: No hay Claves UT (CPM)", "La signacion automatica de claves no cuenta con mas claves para los pagadores UT (BANORTE)! "+String(today(),"mm/dd/yyyy")+".")
//				
//				return		
//			END IF
//			
//		LOOP
//		
//		CLOSE CUR_NUMBERS4;		
//		
//		//Messagebox('Process Complete','A total of '+string(ll_exported)+' have been assigned and transmited to '+sle_name_branch.text)
//		
//		// {END CLAVES UNITELLER - CPM}	
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		
//
//	else		
//		
//
//	MessageBox("Under Construction","Asignacion de claves para este pagador aun no ha sido desarrollada",StopSign!)
//	return		
//	
//end if




end event

type sle_total from singlelineedit within w_cla_administration
integer x = 494
integer y = 1060
integer width = 315
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_cla_administration
integer x = 119
integer y = 1072
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Ava. :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_available from singlelineedit within w_cla_administration
integer x = 494
integer y = 688
integer width = 315
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type em_id_branch from editmask within w_cla_administration
integer x = 494
integer y = 488
integer width = 315
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;long ll_cont
string ls_id_main_branch

// =======================================================================
// Validations

ls_id_main_branch = fn_token(lb_payors.Text,"*",2)

if isnull(ls_id_main_branch) or len(trim(ls_id_main_branch)) < 1 then
	sle_available.text = ""
	em_quantity.text = '0'
	sle_total.text = '0'
	cb_assign.enabled = false
	cb_retransmit.enabled = false
	em_quantity.enabled = false
	messagebox("Payer not found","Please select a payer from the list",StopSign!)
	SetFocus(lb_payors)
	return		
end if

// =======================================================================


select count(*)
into :ll_cont
from dba.branch
where id_branch = :this.text
and id_type_branch in ('A','R')
and (id_status_branch = 'O' or id_branch = 'A00001');

if ll_cont > 0 then

	select rtrim(name_branch)
	into :sle_name_branch.text
	from dba.branch
	where id_branch = :this.text;
	
	select count(*)
	into :sle_available.text
	from dba.claves
	where id_branch = :this.text
	and id_used = 'N'
   and id_group_payee = :ls_id_main_branch;
	
	em_quantity.text = '0'
	
	sle_total.text = string(double(sle_available.text)+double(em_quantity.text))
	
	cb_assign.enabled = true
	cb_retransmit.enabled = true
	em_quantity.enabled = true
		
else
	sle_available.text = ""
	em_quantity.text = '0'
	sle_total.text = '0'
	cb_assign.enabled = false
	cb_retransmit.enabled = false
	em_quantity.enabled = false
	messagebox("Branch not found","The Branch "+trim(this.text)+" was not found or is closed",StopSign!)
	SetFocus(this)
	return
end if
end event

type sle_name_branch from singlelineedit within w_cla_administration
integer x = 494
integer y = 584
integer width = 1083
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type em_quantity from editmask within w_cla_administration
integer x = 494
integer y = 964
integer width = 315
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;
//Don (12-12-2013) - 
IF NOT gb_admin		THEN
	IF LONG(em_quantity.text) > 50	THEN
		MessageBox("Warning","Quantity entered cannot be greater than 50. for non-Admin User!",Stopsign!,Ok!)
		
		RETURN	-1
	END IF
END IF
//**********************************************************************
end event

type st_2 from statictext within w_cla_administration
integer x = 119
integer y = 500
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Id Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_cla_administration
integer x = 119
integer y = 976
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Quantity :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_cla_administration
integer x = 119
integer y = 700
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Available :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_cla_administration
integer x = 119
integer y = 596
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Name Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cla_administration
integer x = 119
integer y = 92
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lb_payors from dropdownlistbox within w_cla_administration
integer x = 494
integer y = 84
integer width = 1042
integer height = 704
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
if rb_single.checked then

	Long	ll_cont
	String ls_branch, ls_id_main_branch
	
	// =======================================================================
	// Validations
	
	ls_id_main_branch = fn_token(lb_payors.Text,"*",2)
	
	if isnull(ls_id_main_branch) or len(trim(ls_id_main_branch)) < 1 then
		sle_available.text = ""
		em_quantity.text = '0'
		sle_total.text = '0'
		cb_assign.enabled = false
		cb_retransmit.enabled = false
		em_quantity.enabled = false
		messagebox("Payer not found","Please select a payer from the list",StopSign!)
		SetFocus(lb_payors)
		return		
	end if
	
	// =======================================================================	
	
	ls_branch = em_id_branch.text
	
	select count(*)
	into :ll_cont
	from dba.branch
	where id_branch = :ls_branch
	and id_type_branch in ('A','R')
	and (id_status_branch = 'O' or id_branch = 'A00001');
	
	if ll_cont > 0 then
	
		select rtrim(name_branch)
		into :sle_name_branch.text
		from dba.branch
		where id_branch = :ls_branch;
		
		select count(*)
		into :sle_available.text
		from dba.claves
		where id_branch = :ls_branch
		and id_used = 'N'
		and id_group_payee = :ls_id_main_branch;
		
		em_quantity.text = '0'
		
		sle_total.text = string(double(sle_available.text)+double(em_quantity.text))
		
		cb_assign.enabled = true
		cb_retransmit.enabled = true
		em_quantity.enabled = true
		
	end if
	
end if
end event

type gb_2 from groupbox within w_cla_administration
integer x = 37
integer y = 24
integer width = 1586
integer height = 180
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer"
end type

type gb_5 from groupbox within w_cla_administration
integer x = 105
integer y = 836
integer width = 795
integer height = 488
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Assign/Transmit New Claves"
end type

type gb_6 from groupbox within w_cla_administration
integer x = 37
integer y = 216
integer width = 1586
integer height = 180
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generate Claves To"
end type

type cb_assignall from commandbutton within w_cla_administration
integer x = 713
integer y = 532
integer width = 827
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Assign and Transmit to All"
end type

event clicked;SetPointer(HourGlass!)

// ******************
// Validate U: Drive!
fn_map_output()
if not fileexists('R:\Output') then
	Messagebox("Error!","La unidad necesaria no esta mapeada, favor intente nuevamente o contacte a Tecnologia si el problema se repite!",StopSign!)
	return
end if
// ******************


lb_report.reset()

string 	ls_id_main_branch, ls_curbranch, ls_clave_pre
long 		ll_quantityall, ll_exported, ll_quantity, ll_result, i
double 	ld_available, ld_nextclave

// ========================================================================================
// Validations

ls_id_main_branch = fn_token(lb_payors.Text,"*",2)

if isnull(ls_id_main_branch) or len(trim(ls_id_main_branch)) < 1 then
	messagebox("Payer not found","Please select a payer from the list",StopSign!)
	SetFocus(lb_payors)
	return		
end if

ll_quantityall = double(em_quantityall.text)

if isnull(ll_quantityall) or (ll_quantityall < 1) or (ll_quantityall > 200) then
	MessageBox("Invalid Quantity","Quantity must be greater than zero and less than 200",StopSign!)
	SetFocus(em_quantityall)
	return
end if



// Selecciona Agencias activas con el numero de claves disponibles para el pagador escogido
DECLARE cur_branches CURSOR FOR  
SELECT dba.BRANCH.ID_BRANCH, count(id_clave)  
FROM dba.BRANCH LEFT OUTER JOIN dba.CLAVES ON ( dba.BRANCH.ID_BRANCH = dba.CLAVES.ID_BRANCH )
WHERE dba.BRANCH.ID_BRANCH NOT IN (SELECT id_branch FROM DBA.TIPO_TRANSMISION_AGENCIA)
AND ( dba.CLAVES.ID_USED = 'N' )
AND ( dba.BRANCH.ID_TYPE_BRANCH in ('A','R') )
AND ( dba.BRANCH.ID_STATUS_BRANCH = 'O' )
AND ( ID_GROUP_PAYEE = :ls_id_main_branch )
AND dba.BRANCH.id_branch NOT IN (SELECT id_branch FROM dba.VW_DUMMIES)
GROUP BY dba.BRANCH.ID_BRANCH;

OPEN cur_branches;

FETCH cur_branches INTO :ls_curbranch, :ld_available;

DO WHILE SQLCA.SQLCODE = 0
			
	ll_quantity = ll_quantityall - ld_available
	
	if ll_quantity < 1 then ll_quantity = 0

	if ll_quantity > 0 then
	
	
		if ls_id_main_branch = 'T141' then // Banamex
			
			ls_clave_pre =  '6' + right(ls_curbranch,4)
			
			if isnumber(ls_clave_pre) and len(ls_clave_pre) = 5 then
							
				SELECT MAX(ID_CLAVE)
				INTO :ld_nextclave
				FROM DBA.CLAVES 
				WHERE ID_GROUP_PAYEE = 'T141'
				AND ID_BRANCH = :ls_curbranch
				and ID_CLAVE > 6000000000 
				and ID_CLAVE < 7000000000;
				 
				if isnull(ld_nextclave) or ld_nextclave = 0 then ld_nextclave = double(string(ls_clave_pre) + string('00000'))
				
				i = 1
				
				DO WHILE i <= ll_quantity
				
					ld_nextclave = ld_nextclave + 1
									
					INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
					VALUES ( :ls_id_main_branch, :ld_nextclave, 'N', :ls_curbranch, getdate(), upper(SYSTEM_USER), 'N', null)  ;	
					
					if sqlca.sqlcode <> 0 then
						messagebox( "Error Asignacion de Claves", "Error insert clave Banamex - "+ls_id_main_branch + "~n~r" + SQLCA.sqlerrtext,StopSign!)
					end if	
							
					IF SQLCA.SQLCODE = 0 THEN
						i = i + 1
					END IF
				
				LOOP
	
			end if
		
			
		else // Busca las claves en las tablas de disponibilidad:
		
			
		
		
			DECLARE spGenBranchClaves PROCEDURE FOR dba.spGenBranchClaves @p_id_branch = :ls_curbranch,  @p_id_payer = :ls_id_main_branch,  @p_quantity = :ll_quantity;
				
			EXECUTE spGenBranchClaves;
			
			if sqlca.sqlcode <> 0 then			
				lb_report.additem("Error Asignacion de Claves: Error execute SP - "+ls_id_main_branch + "~n~r" + SQLCA.sqlerrtext)
				return
			end if
			
			FETCH spGenBranchClaves INTO :ll_result;
			if sqlca.sqlcode <> 0 then			
				lb_report.additem( "Error Asignacion de Claves: Error fetch SP - "+ls_id_main_branch + "~n~r" + SQLCA.sqlerrtext)
				return
			end if
			
			if ll_result < 0 then
				lb_report.additem("Error Asignacion de Claves: No hay suficientes claves disponibles para "+ls_id_main_branch + "~n~rSP returned -1")
				return
			end if
			
			CLOSE spGenBranchClaves;

		end if // End payer


		lb_report.additem(fn_completar_cadena(string(ll_quantity),'I',' ',5)+ " Claves were assigned to " + ls_curbranch+ " to complete "+string(ll_quantityall))
		
		if left(ls_curbranch,4) <> 'A000' then
			ll_exported = parent.fn_gensqlclaves(ls_curbranch,ls_id_main_branch)	
		end if

		
	end if // End Quantity > 0


	FETCH cur_branches INTO :ls_curbranch, :ld_available;


LOOP	

CLOSE cur_branches;	






















// ========================================================================================
//
//string ls_curbranch
//double ld_available
//
//
//// BTS - Bancomer, Telegrafos, Bco Continental
//if ls_id_main_branch = 'T057' or ls_id_main_branch = 'T082' or ls_id_main_branch = 'T083' or ls_id_main_branch = 'T123'  or ls_id_main_branch = 'T124' or ls_id_main_branch = 'T131' or ls_id_main_branch = 'T134' then
//
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	// {BEGIN CLAVES BTS}	
//
//	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	// Las claves de BTS son de la forma:
//	//
//	// 1258 nnnnnn D
//	//
//	// nnnnnn Va desde 000000 hasta 999999
//	//
//	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
//	
//	double ld_last_nnn, ld_next_nnn
//	string ls_next_nnn, ls_semilla	
//	long i
//	
//	//ls_semilla = '1258'	
//	ls_semilla = '1387'	
//	
//
//	DECLARE CUR_NUMBERS CURSOR FOR  
//	SELECT TOP :ll_top number
//	FROM dba.numbers
//	WHERE number NOT IN (SELECT (convert(int,(id_clave - 13870000000)) / 10) 
//								 	FROM DBA.CLAVES 
//									WHERE id_group_payee in ('T057','T082','T083','T123','T124','T131','T134'));									 
////      ORDER BY NUMBER;
//	
//	OPEN CUR_NUMBERS;
//	
//	ll_total = 0
//
//	// Selecciona Agencias activas con el numero de claves disponibles
//	DECLARE cur_branches CURSOR FOR  
//	SELECT dba.BRANCH.ID_BRANCH, count(id_clave)  
//	FROM dba.BRANCH, dba.CLAVES  
//	WHERE ( dba.BRANCH.ID_BRANCH *= dba.CLAVES.ID_BRANCH )
//	AND dba.BRANCH.ID_BRANCH NOT IN (SELECT id_branch FROM DBA.TIPO_TRANSMISION_AGENCIA)
//	AND ( dba.CLAVES.ID_USED = 'N' )
//	AND ( dba.BRANCH.ID_TYPE_BRANCH in ('A','R') )
//	AND ( dba.BRANCH.ID_STATUS_BRANCH = 'O' )
//	AND ( ID_GROUP_PAYEE = :ls_id_main_branch )
//	AND dba.BRANCH.id_branch NOT IN (SELECT id_branch FROM dba.VW_DUMMIES)
//	GROUP BY dba.BRANCH.ID_BRANCH;
//
//	OPEN cur_branches;
//	
//	FETCH cur_branches INTO :ls_curbranch, :ld_available;
//	
//	DO WHILE SQLCA.SQLCODE = 0
//				
//
//		ll_quantity = ll_quantityall - ld_available
//		
//		if ll_quantity < 1 then ll_quantity = 0
//		
//		ll_total = ll_total + ll_quantity
//		
//		for i = 1 to ll_quantity
//
//			// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//			// Determina la siguiente clave disponible			
//			FETCH CUR_NUMBERS INTO :ld_next_nnn;
//			
//			IF SQLCA.SQLCODE <> 0 THEN
//				MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//				CLOSE cur_branches;
//				CLOSE CUR_NUMBERS;				
//				return		
//			END IF	
//				
//			ls_next_nnn = string(ld_next_nnn)
//			ls_next_nnn = fn_completar_cadena(ls_next_nnn,'I','0',6)
//			ls_next_nnn = ls_semilla + mid(ls_next_nnn,1,6)		
//			ld_next_nnn = double(ls_next_nnn)			
//			// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//									
//			INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
//			VALUES ( :ls_id_main_branch, dba.sfGetBTSCheckDigit(:ld_next_nnn), 'N', :ls_curbranch, getdate(), SYSTEM_USER, 'N', null);
//			
//		next
//	
//		IF ll_quantity > 0 THEN lb_report.additem(fn_completar_cadena(string(ll_quantity),'I',' ',5)+ " Claves were assigned to " + ls_curbranch+ " to complete "+string(ll_quantityall))
//
//		ll_exported = parent.fn_gensqlclaves(ls_curbranch,ls_id_main_branch)	
//	
//		FETCH cur_branches INTO :ls_curbranch, :ld_available;
//	
//	LOOP	
//	
//	CLOSE cur_branches;	
//	CLOSE CUR_NUMBERS;
//			
//	COMMIT;
//	
//	Messagebox('Process Complete','A total of '+string(ll_total)+' have been assigned fill all the branches with '+string(ll_quantityall)+' claves')	
//
//	// {END CLAVES BTS}
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//
//elseif ls_id_main_branch = 'T049' then
//	
//	
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	// {BEGIN CLAVES ELCAMINO}	
//
//	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	// Las claves de ELCAMINO son de la forma:
//	//
//	// 401501 0000001  (13 Digitos)
//	//	
//	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
//	
//	i = 1
//	
//	DECLARE CUR_NUMBERS2 CURSOR FOR  
//	SELECT TOP :ll_top number
//	FROM dba.numbers
//	WHERE number NOT IN (SELECT convert(int,(right(id_clave,7)))
//									FROM DBA.CLAVES 
//									WHERE id_group_payee = 'T049');
////	ORDER BY NUMBER;
//	
//	OPEN CUR_NUMBERS2;
//		
//	ll_total = 0
//
//	// Selecciona Agencias activas con el numero de claves disponibles
//	DECLARE cur_branches2 CURSOR FOR  
//	SELECT dba.BRANCH.ID_BRANCH,   
//	count(id_clave)  
//	FROM dba.BRANCH,   
//	dba.CLAVES  
//	WHERE ( dba.BRANCH.ID_BRANCH *= dba.CLAVES.ID_BRANCH )
//	AND dba.BRANCH.ID_BRANCH NOT IN	(SELECT id_branch FROM DBA.TIPO_TRANSMISION_AGENCIA)
//	AND ( dba.CLAVES.ID_USED = 'N' )
//	AND ( dba.BRANCH.ID_TYPE_BRANCH in ('A','R') )
//	AND ( dba.BRANCH.ID_STATUS_BRANCH = 'O' )
//	AND ( ID_GROUP_PAYEE = :ls_id_main_branch ) 
//	AND dba.BRANCH.id_branch NOT IN (SELECT id_branch FROM dba.VW_DUMMIES)
//	GROUP BY dba.BRANCH.ID_BRANCH;
//
//	OPEN cur_branches2;
//	
//	FETCH cur_branches2 INTO :ls_curbranch, :ld_available;
//	
//	DO WHILE SQLCA.SQLCODE = 0
//				
//		ll_quantity = ll_quantityall - ld_available
//		
//		if ll_quantity < 1 then ll_quantity = 0
//		
//		ll_total = ll_total + ll_quantity
//		
//		FOR i = 1 to ll_quantity
//		
//		
//			FETCH CUR_NUMBERS2 INTO :ld_next_nnn;
//	
//			IF SQLCA.SQLCODE <> 0 THEN
//				MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//				CLOSE cur_branches2;
//				CLOSE CUR_NUMBERS2;				
//				return		
//			END IF		
//		
//			ls_next_nnn = string(ld_next_nnn)
//			//ls_next_nnn = '401501' + fn_completar_cadena(ls_next_nnn,'I','0',7)
//			ls_next_nnn = '4072' + fn_completar_cadena(ls_next_nnn,'I','0',7)
//			ld_next_nnn = double(ls_next_nnn)
//					
//			INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
//			VALUES ( :ls_id_main_branch, :ld_next_nnn, 'N', :ls_curbranch, getdate(), SYSTEM_USER, 'N', null);			
//			
//		NEXT
//		
//		IF ll_quantity > 0 THEN lb_report.additem(fn_completar_cadena(string(ll_quantity),'I',' ',5)+ " Claves were assigned to " + ls_curbranch+ " to complete "+string(ll_quantityall))
//
//		ll_exported = parent.fn_gensqlclaves(ls_curbranch,ls_id_main_branch)	
//		
//		FETCH cur_branches2 INTO :ls_curbranch, :ld_available;
//
//	LOOP	
//
//	CLOSE cur_branches2;	
//	CLOSE CUR_NUMBERS2;
//
//	COMMIT;	
//
//	Messagebox('Process Complete','A total of '+string(ll_total)+' have been assigned fill all the branches with '+string(ll_quantityall)+' claves')
//
//	// {END CLAVES ELCAMINO}
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
//	
//	
//	
//	
//	
//	elseif ls_id_main_branch = 'T160' then
//
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		// {BEGIN CLAVES UNITELLER - BANORTE}	
//		
//		// 67092200000 hasta 67093299999 Para los pagadores de MEX (Banorte / CPM)
//		// Inicialmente se va a usar el prefijo 			67092 y los numeros entre 200000 y 999999
//		// Cuando se acaben se puede usar el prefijo 	67093 y los numeros entre 000000 y 299999
//					
//		i = 1
//		
//		DECLARE CUR_NUMBERS3 CURSOR FOR  
//		SELECT TOP :ll_top number
//		FROM dba.numbers
//		WHERE number NOT IN (SELECT convert(int,(right(id_clave,6)))
//										FROM DBA.CLAVES 
//										WHERE id_group_payee in ('T160','T137'))
//		AND number > 200000 
//		AND NUMBER < 999999;
////		ORDER BY NUMBER;
//		
//		OPEN CUR_NUMBERS3;
//		
//		if sqlca.sqlcode <> 0 then
//			//fn_log("AUTO FILL CLAVES: open CUR_NUMBERS3: "+ SQLCA.sqlerrtext)
//		end if		
//		
//		FETCH CUR_NUMBERS3 INTO :ld_next_nnn;
//		
//		IF SQLCA.SQLCODE <> 0 THEN
//
//			if ( double(right(string(Now(),"hh:mm"),2)) <> 01 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 16 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 31 )  then
//				//do nothing - no alert
//			else
//				fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - UT (BANORTE).")		
//			end if			
//			fn_email_notification2( "technology@viamericas.com", "ALERTA - Viatransmitir: No hay Claves UT (BANORTE))", "La signacion automatica de claves no cuenta con mas claves para los pagadores UT (BANORTE)! "+String(today(),"mm/dd/yyyy")+".")
//						
//			return		
//		END IF	
//		
//		DO WHILE i <= ll_quantity AND SQLCA.SQLCODE = 0
//			
//			ls_next_nnn = string(ld_next_nnn)
//			ls_next_nnn = '67092' + fn_completar_cadena(ls_next_nnn,'I','0',6)
//			ld_next_nnn = double(ls_next_nnn)
//					
//			INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
//			VALUES ( :ls_id_main_branch, :ld_next_nnn, 'N', :ls_curbranch, getdate(), SYSTEM_USER, 'N', null)  ;		
//
//		if sqlca.sqlcode <> 0 then
//			//fn_log("AUTO FILL CLAVES: insert CLAVES3: "+ SQLCA.sqlerrtext)
//		end if				
//			
//			i = i + 1
//			FETCH CUR_NUMBERS3 INTO :ld_next_nnn;
//	
//			IF SQLCA.SQLCODE <> 0 THEN
//				//MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//				if ( double(right(string(Now(),"hh:mm"),2)) <> 01 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 16 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 31 )  then
//					//do nothing - no alert
//				else
//					fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - UT (BANORTE).")		
//				end if			
//				fn_email_notification2( "technology@viamericas.com", "ALERTA - Viatransmitir: No hay Claves UT (BANORTE)", "La signacion automatica de claves no cuenta con mas claves para los pagadores UT (BANORTE)! "+String(today(),"mm/dd/yyyy")+".")
//				
//				return		
//			END IF
//			
//		LOOP
//		
//		CLOSE CUR_NUMBERS3;		
//		
//		//Messagebox('Process Complete','A total of '+string(ll_exported)+' have been assigned and transmited to '+sle_name_branch.text)
//		
//		// {END CLAVES UNITELLER - BANORTE}	
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
//	
//	
//	elseif ls_id_main_branch = 'T137' then
//
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		// {BEGIN CLAVES UNITELLER - CPM}	
//		
//		// 67092200000 hasta 67093299999 Para los pagadores de MEX (Banorte / CPM)
//		// Inicialmente se va a usar el prefijo 			67092 y los numeros entre 200000 y 999999
//		// Cuando se acaben se puede usar el prefijo 	67093 y los numeros entre 000000 y 299999
//					
//		i = 1
//		
//		DECLARE CUR_NUMBERS4 CURSOR FOR  
//		SELECT TOP :ll_top number
//		FROM dba.numbers
//		WHERE number NOT IN (SELECT convert(int,(right(id_clave,6)))
//										FROM DBA.CLAVES 
//										WHERE id_group_payee in ('T160','T137'))
//		AND number > 200000 
//		AND NUMBER < 999999;
////		ORDER BY NUMBER;
//		
//		OPEN CUR_NUMBERS4;
//		
//		if sqlca.sqlcode <> 0 then
//			//fn_log("AUTO FILL CLAVES: open CUR_NUMBERS4: "+ SQLCA.sqlerrtext)
//		end if		
//		
//		FETCH CUR_NUMBERS4 INTO :ld_next_nnn;
//		
//		IF SQLCA.SQLCODE <> 0 THEN
//
//			if ( double(right(string(Now(),"hh:mm"),2)) <> 01 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 16 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 31 )  then
//				//do nothing - no alert
//			else
//				fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - UT (CPM).")		
//			end if			
//			fn_email_notification2( "technology@viamericas.com", "ALERTA - Viatransmitir: No hay Claves UT (CPM))", "La signacion automatica de claves no cuenta con mas claves para los pagadores UT (BANORTE)! "+String(today(),"mm/dd/yyyy")+".")
//						
//			return		
//		END IF	
//		
//		DO WHILE i <= ll_quantity AND SQLCA.SQLCODE = 0
//			
//			ls_next_nnn = string(ld_next_nnn)
//			ls_next_nnn = '67092' + fn_completar_cadena(ls_next_nnn,'I','0',6)
//			ld_next_nnn = double(ls_next_nnn)
//					
//			INSERT INTO dba.CLAVES ( ID_GROUP_PAYEE, ID_CLAVE, ID_USED, ID_BRANCH, DATE_ASSIGN, DB_USER_NAME_ASSIGN, ID_TRANS, DATE_TRANS )  
//			VALUES ( :ls_id_main_branch, :ld_next_nnn, 'N', :ls_curbranch, getdate(), SYSTEM_USER, 'N', null)  ;		
//
//		if sqlca.sqlcode <> 0 then
//			//fn_log("AUTO FILL CLAVES: insert CLAVES3: "+ SQLCA.sqlerrtext)
//		end if				
//			
//			i = i + 1
//			FETCH CUR_NUMBERS4 INTO :ld_next_nnn;
//	
//			IF SQLCA.SQLCODE <> 0 THEN
//				//MessageBox("ERROR","NO HAY MAS CLAVES DISPONIBLES INFORME A TECHNOLOGY!",StopSign!)
//				if ( double(right(string(Now(),"hh:mm"),2)) <> 01 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 16 ) and ( double(right(string(Now(),"hh:mm"),2)) <> 31 )  then
//					//do nothing - no alert
//				else
//					fn_email_notification2( "ebernalmobile@viamericas.com", "Claves", "No hay claves para asignar - UT (CPM).")		
//				end if			
//				fn_email_notification2( "technology@viamericas.com", "ALERTA - Viatransmitir: No hay Claves UT (CPM)", "La signacion automatica de claves no cuenta con mas claves para los pagadores UT (BANORTE)! "+String(today(),"mm/dd/yyyy")+".")
//				
//				return		
//			END IF
//			
//		LOOP
//		
//		CLOSE CUR_NUMBERS4;		
//		
//		//Messagebox('Process Complete','A total of '+string(ll_exported)+' have been assigned and transmited to '+sle_name_branch.text)
//		
//		// {END CLAVES UNITELLER - CPM}	
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		
//
//
//
//	else
//		
//		
//
//	MessageBox("Under Construction","Asignacion de claves para este pagador aun no ha sido desarrollada",StopSign!)
//	return		
//	
//end if

SetPointer(Arrow!)

end event

type em_quantityall from editmask within w_cla_administration
integer x = 283
integer y = 536
integer width = 315
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

type gb_4 from groupbox within w_cla_administration
integer x = 942
integer y = 836
integer width = 626
integer height = 372
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Re-transmit Claves"
end type

type lb_report from listbox within w_cla_administration
integer x = 110
integer y = 708
integer width = 1449
integer height = 604
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_cla_administration
integer x = 37
integer y = 420
integer width = 1586
integer height = 948
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Single Branch"
end type

type gb_all from groupbox within w_cla_administration
integer x = 37
integer y = 420
integer width = 1586
integer height = 944
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "All Open Branches"
end type

