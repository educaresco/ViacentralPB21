$PBExportHeader$w_group_branch_financial_v2.srw
forward
global type w_group_branch_financial_v2 from wb_single_tb
end type
type cb_fixdescriptions from commandbutton within w_group_branch_financial_v2
end type
type cb_ea from commandbutton within w_group_branch_financial_v2
end type
type sle_branch from singlelineedit within w_group_branch_financial_v2
end type
type lst_branch from my_ddlb within w_group_branch_financial_v2
end type
type st_1 from statictext within w_group_branch_financial_v2
end type
type gb_2 from groupbox within w_group_branch_financial_v2
end type
type gb_1 from groupbox within w_group_branch_financial_v2
end type
end forward

global type w_group_branch_financial_v2 from wb_single_tb
integer x = 214
integer y = 221
integer width = 2949
integer height = 1840
string title = "Group Branch - Financial Profile"
boolean maxbox = false
boolean resizable = false
cb_fixdescriptions cb_fixdescriptions
cb_ea cb_ea
sle_branch sle_branch
lst_branch lst_branch
st_1 st_1
gb_2 gb_2
gb_1 gb_1
end type
global w_group_branch_financial_v2 w_group_branch_financial_v2

type variables
string is_id_main_branch
datawindowchild idwc_cod_code_dep, idwc_des_code_dep
end variables

forward prototypes
public subroutine fn_filter ()
public subroutine fn_branch_change ()
end prototypes

public subroutine fn_filter ();String ls_filter, ls_main_branch, ls_branch

if lst_branch.getdataid() <> '--' then

	ls_branch = lst_branch.getdataid()

	SELECT RTRIM(ID_MAIN_BRANCH)
	INTO:ls_main_branch
	FROM DBA.BRANCH
	WHERE ID_BRANCH = :ls_branch;
	
	is_id_main_branch = ls_main_branch
	ls_filter = "id_main_branch = '"+ls_main_branch+"'"
else
	ls_filter = ''
end if		

dw_1.of_retrieve()

end subroutine

public subroutine fn_branch_change ();lst_branch.setselectedid( sle_branch.text )

// Chequea que este en la lista
IF trim(sle_branch.text )<> trim(lst_branch.getdataid() ) THEN
	sle_branch.TextColor	= RGB(255,0,0)
	return
ELSE	
	sle_branch.TextColor	= RGB(0,0,0)	
END IF

fn_filter()
end subroutine

on w_group_branch_financial_v2.create
int iCurrent
call super::create
this.cb_fixdescriptions=create cb_fixdescriptions
this.cb_ea=create cb_ea
this.sle_branch=create sle_branch
this.lst_branch=create lst_branch
this.st_1=create st_1
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fixdescriptions
this.Control[iCurrent+2]=this.cb_ea
this.Control[iCurrent+3]=this.sle_branch
this.Control[iCurrent+4]=this.lst_branch
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.gb_2
this.Control[iCurrent+7]=this.gb_1
end on

on w_group_branch_financial_v2.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_fixdescriptions)
destroy(this.cb_ea)
destroy(this.sle_branch)
destroy(this.lst_branch)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;string ls_branch

X=1
Y=1
Show()
of_SetResize(true)

//dw_1.SetRowFocusIndicator(Hand!)
//dw_1.inv_filter.of_SetStyle(dw_1.inv_filter.EXTENDED)


//inv_resize.of_register(dw_1, this.inv_resize.FIXEDRIGHTBOTTOM)
//inv_resize.of_register(gb_1, gb_1.inv_resize.scalerightbottom )
//inv_resize.of_register(dw_1, dw_1.inv_resize.scalerightbottom )


cb_fixdescriptions.visible = false
cb_ea.visible = false

ls_branch = message.stringparm

if not IsNull(ls_branch) then
	sle_branch.text = ls_branch
	fn_branch_change()
end if


end event

event close;call super::close;if IsValid(w_acc_credit) then
	w_acc_credit.fn_get_group_branch_data()
end if
end event

type dw_1 from wb_single_tb`dw_1 within w_group_branch_financial_v2
integer x = 18
integer y = 224
integer width = 2857
integer height = 1276
string dataobject = "dw_group_branch_financial_v2"
borderstyle borderstyle = styleshadowbox!
end type

event dw_1::buttonclicked;
if dwo.name = "cb_schedule" then
	
	string ls_schedule
	
	dw_1.accepttext()	
	ls_schedule = dw_1.getitemstring(dw_1.getrow(),"fin_schedule")	
	OpenWithParm(w_dayselector,ls_schedule)	
	ls_schedule = Message.StringParm
	dw_1.setitem(dw_1.getrow(),"fin_schedule",ls_schedule)	
	dw_1.accepttext()

end if
	


end event

event dw_1::clicked;//long ll_row
//ll_row = dw_1.getclickedrow()
//dw_1.selectRow(0,FALSE)
//if ll_row > 0 then dw_1.scrolltorow(ll_row)
end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//string ls_group
//DataWindowChild ldw_dw
//
//ls_group = dw_1.getitemstring(dw_1.getrow(),"id_main_branch")
//
//GetChild("fin_depdepositcode",ldw_dw)
//ldw_dw.SetTransObject(SQLCA)
//ldw_dw.Retrieve()
//ldw_dw.SetFilter("branch_id_main_branch = '"+ls_group+"'")
//ldw_dw.Filter()
//
//
end event

event dw_1::itemchanged;call super::itemchanged;if dwo.name = "fin_depdepositcode" then
	
	string ls_depositcode, ls_bankdesc
	
//	ls_depositcode = dw_1.getitemstring(row,"fin_depdepositcode")
	ls_depositcode = GetText()
	
	if not isnull(ls_depositcode) and len(ls_depositcode) > 0 then
		
		SELECT rtrim(dba.BANCO.NAME_BANCO) + ' (' + rtrim(dba.DEPOSIT_CODES.ID_CUENTA_BANCO) + ')'
		INTO :ls_bankdesc
		FROM dba.BANCO,   
		dba.DEPOSIT_CODES  
		WHERE ( dba.BANCO.ID_BANCO = dba.DEPOSIT_CODES.ID_BANCO ) and  
		( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) ) ; 	

	else
		setnull(ls_bankdesc)
	end if
	
	dw_1.setItem(row,"fin_depdescription",ls_bankdesc)	
	dw_1.accepttext()
	
	

end if


if dwo.name = "fin_monthlyclosing" then
	  dw_1.setitem(dw_1.getrow(),"fin_closingdaycode",'01')
end if 	

if dwo.name = 'fin_achaccrouting' or dwo.name = 'fin_achaccrouting_com' then

	string ls_routing
	long ll_cont
	
	ls_routing = trim(GetText())
	
	if ls_routing <> '' then
	
		if len(ls_routing) <> 9 then
			Messagebox("Dato invalido","El numero de Routing (ABA) es invalido, debe ser un numero de 9 caracteres.",StopSign!)
			return 1		
		end if
	
		SELECT count(*)
		  INTO :ll_cont
		  FROM dba.BANK_ROUTINGS
		 WHERE BANK_ROUTING = :ls_routing;
		 
		if ll_cont <> 1 then
			 Messagebox("Dato invalido","El numero de Routing (ABA) es invalido, no fue encontrado en la lista de Routings de la reserva (https://www.fededirectory.frb.org/search.cfm).",StopSign!)
			return 1				 
		end if
		//0  (Default) Accept the data value
		//1  Reject the data value and do not allow focus to change
		//2  Reject the data value but allow the focus to change

	end if

end if


if dwo.name = "flag_com_chain" then
	 integer li_result
	 	if data > '1' then
			Openwithparm(w_financial_chain,is_id_main_branch)
			li_result = message.doubleparm 
			if li_result = -9999 then
				 return
			else
				this.retrieve(is_id_main_branch )
			end if 
		end if
end if
end event

event dw_1::pfc_retrievedddw;call super::pfc_retrievedddw;if as_column = 'fin_depdepositcode' then
	if idwc_des_code_dep.retrieve(is_id_main_branch) = 0 then idwc_des_code_dep.insertrow(0)
end if

if as_column = 'fin_depdepositcode_1' then
	if idwc_cod_code_dep.retrieve(is_id_main_branch) = 0 then idwc_cod_code_dep.insertrow(0)
end if

return 1
end event

event dw_1::constructor;SetTransObject(SQLCA)

dw_1.getchild( 'fin_depdepositcode' , idwc_cod_code_dep)
dw_1.getchild( 'fin_depdepositcode_1' ,  idwc_des_code_dep)


idwc_cod_code_dep.settransobject(SQLCA)
if idwc_cod_code_dep.retrieve(is_id_main_branch) = 0 then idwc_cod_code_dep.insertrow(0)


idwc_des_code_dep.settransobject(SQLCA)
if idwc_des_code_dep.retrieve(is_id_main_branch) = 0 then idwc_des_code_dep.insertrow(0)




//////////////////////////////////////////////////////////////////////////////////
//////
//////	Event:
//////	constructor
//////
//////	Description:
//////	Start the resize service and register the controls.
////// Tab page three will be created on demand.  If the user resizes
////// the window before the tab page is created then the resize event
////// must be triggered.
//////
//////////////////////////////////////////////////////////////////////////////////
//////	
//////	Revision History
//////
//////	Version
//////	6.0   Initial version
//////
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//////	Any distribution of the PowerBuilder Foundation Classes (PFC)
//////	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////
//////////////////////////////////////////////////////////////////////////////////
////
////// Start the Resize Service.
//
datawindow	ddlb_filetypes

//DON (04/02/2015) - To suppress Retrieve.  ***********************
IF gb_prevent_rate_retrieve	THEN
	gb_prevent_rate_retrieve	=	FALSE
ELSE
	this.retrieve(is_id_main_branch)
END IF
//******************************************************

//of_setfilter(true)
//of_setsort(true)
//of_SetResize(true)
//of_setprintpreview(true)
//of_SetFind(true)
//inv_resize.of_SetOrigSize(this.width, this.height)
//
////Set the MinSize of the main object.
//inv_resize.of_SetMinSize(1185, 509)
//
////Set the behavior of each object.
//inv_resize.of_Register(ddlb_filetypes, inv_resize.SCALERIGHTBOTTOM)
//inv_resize.of_Register(sle_text, inv_resize.SCALERIGHT)
//
//ddlb_filetypes.SelectItem(2)
//
////Trigger the resize event to be sure that the tab is sized appropriately.
//event resize(1, this.width, this.height)
//






end event

event dw_1::pfc_retrieve;call super::pfc_retrieve;
	if idwc_des_code_dep.retrieve(is_id_main_branch) = 0 then idwc_des_code_dep.insertrow(0)



	if idwc_cod_code_dep.retrieve(is_id_main_branch) = 0 then idwc_cod_code_dep.insertrow(0)



this.retrieve(is_id_main_branch)

return 1
end event

event dw_1::pfc_updateprep;call super::pfc_updateprep;
string ls_routing , ls_account
dwItemStatus l_status, l_status_acc

l_status = dw_1.GetItemStatus( dw_1.GetRow(), "fin_achaccrouting_com", Primary!)
l_status_acc = dw_1.GetItemStatus( dw_1.GetRow(), "fin_achaccnumber_com", Primary!)


if l_status = DataModified! or l_status_acc = DataModified! then 
	

	ls_routing = this.getitemstring(dw_1.GetRow(), 'fin_achaccrouting_com')
	ls_account = this.getitemstring(dw_1.GetRow(), 'fin_achaccnumber_com')
	
	
	if messagebox('Confirmation', 'The information of Commission Account  ~r~n( ROUTING #: ' +  ls_routing  + '  and  ACCOUNT # : '+ ls_Account +  ' )  its correct?', question!, yesno!,2) = 2 then 
		return -1
	end if
	
end if

/*
los casos pueden ser

NotModified! / no se modifico
DataModified! / modificado
New! /nuevo
NewModified! /nuevo modificado
*/
end event

type cb_fixdescriptions from commandbutton within w_group_branch_financial_v2
integer x = 1495
integer y = 1552
integer width = 901
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fix Descriptions"
end type

event clicked;setpointer(HourGlass!)

string ls_group
string ls_depositcode, ls_bankdesc

	
	
 DECLARE cur_grups CURSOR FOR  
  SELECT dba.BRANCH.ID_MAIN_BRANCH,   
         max(deposit_code)  
    FROM dba.DEPOSIT_CODES,   
         dba.BRANCH  
   WHERE ( dba.BRANCH.ID_BRANCH = dba.DEPOSIT_CODES.ID_BRANCH )   
GROUP BY dba.BRANCH.ID_MAIN_BRANCH  ;

open cur_grups;

fetch cur_grups into :ls_group, :ls_depositcode;

do while SQLCA.SQLCode = 0
	

//	ls_depositcode = GetText()
	
	if not isnull(ls_depositcode) and len(ls_depositcode) > 0 then
		
		SELECT rtrim(dba.BANCO.NAME_BANCO) + ' (' + rtrim(dba.DEPOSIT_CODES.ID_CUENTA_BANCO) + ')'
		INTO :ls_bankdesc
		FROM dba.BANCO,   
		dba.DEPOSIT_CODES  
		WHERE ( dba.BANCO.ID_BANCO = dba.DEPOSIT_CODES.ID_BANCO ) and  
		( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) ) ; 	

	else
		setnull(ls_depositcode)		
		setnull(ls_bankdesc)
	end if
	
  UPDATE dba.GROUP_BRANCH  
     SET fin_depdepositcode = :ls_depositcode,   
         fin_depdescription = :ls_bankdesc  
	WHERE ID_MAIN_BRANCH = :ls_group;

	
	//dw_1.setItem(row,"fin_depdescription",ls_bankdesc)	
	//dw_1.accepttext()
	
fetch cur_grups into :ls_group, :ls_depositcode;
loop

close cur_grups;

commit;

setpointer(Arrow!)
end event

type cb_ea from commandbutton within w_group_branch_financial_v2
integer x = 622
integer y = 1544
integer width = 818
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Electronic Deposit (EA) Preparation"
end type

event clicked;// ----------------------------------------------
// This Script runs every night on MTClosing and
// can be runned manually in w_balancemgmt
// ----------------------------------------------

string   ls_group, ls_id_branch, ls_namebranch, ls_tomorrow, ls_achacctypeid, ls_achaccrouting, ls_achaccnumber, ls_bank_name
string   ls_email, ls_filename, ls_emailtext, ls_emailtext1, ls_fax_branch, ls_notifyemail, ls_notifyfax, ls_activefax
double   ld_balance, ld_amttobereconciled, ld_batchid, ld_amount
long 		ll_cont, ll_filenum
date		ld_tomorrow
datetime ldt_today

Setpointer(HourGlass!)

if upper(mid(DayName(today()),1,2)) = 'SA' or upper(mid(DayName(today()),1,2)) = 'SU' then
	// No ACH on Saturday or Sundays!
	return
end if

ls_tomorrow = upper(mid(DayName(relativedate(today(),1)),1,2))
ld_tomorrow = RelativeDate(Today(),1)

// ACH if from MO to FR
if ls_tomorrow = 'SA' then 
	ls_tomorrow = 'MO'
	ld_tomorrow = RelativeDate(Today(),3)
end if

ldt_today = datetime(today(),time('00:00:00'))

DELETE 
  FROM dba.ACH_ELECTRONIC_DEPOSIT
 WHERE ED_DATE = :ldt_today
   AND CONFIRMED_AMT is null;

// ?????????????????????????????????
// Selecciona grupos de tipo Agencia
// con modo de coleccion EA 
// (ELECTRONIC DEPOSIT)
// con schedule para manana
// que no esten en COLLECTION
// ?????????????????????????????????

 DECLARE cur_groups CURSOR FOR  
  SELECT dba.GROUP_BRANCH.ID_MAIN_BRANCH,
		   dba.VW_GROUP_AGENTS.ID_BRANCH,
         dba.GROUP_BRANCH.BALANCE_GROUP,
			dba.GROUP_BRANCH.fin_amttobereconciled,
			dba.GROUP_BRANCH.fin_achacctypeid,   
         dba.GROUP_BRANCH.fin_achaccrouting,   
         dba.GROUP_BRANCH.fin_achaccnumber
    FROM dba.GROUP_BRANCH, dba.VW_GROUP_AGENTS
   WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.VW_GROUP_AGENTS.ID_MAIN_BRANCH
	  AND dba.GROUP_BRANCH.group_type in ('A','R')
	  AND dba.GROUP_BRANCH.fin_collectmethod = 'EA'
	  AND charindex(:ls_tomorrow,dba.GROUP_BRANCH.fin_schedule) > 0
	  AND dba.GROUP_BRANCH.fin_status <> 'CO'
	ORDER BY dba.GROUP_BRANCH.ID_MAIN_BRANCH;

open cur_groups;

fetch cur_groups into :ls_group, :ls_id_branch, :ld_balance, :ld_amttobereconciled, :ls_achacctypeid, :ls_achaccrouting, :ls_achaccnumber;

do while SQLCA.SQLCode = 0 
	
	this.text = "Generating Group "+ls_group

	if isnull(ld_amttobereconciled) then ld_amttobereconciled = 0

	ld_amount = ld_balance - ld_amttobereconciled

	// Cuando la suma pendiente por reconciliar es mayor que el balance, no hay ACH!
	if ld_amttobereconciled > ld_balance then ld_amount = 0

	// Si es cero tampoco hay ACH!
	if round(abs(ld_amount),2) > 0.02 then
		
	  SELECT UPPER(MIN(dba.BANK_ROUTINGS.BANK_NAME))
		 INTO :ls_bank_name  
		 FROM dba.BANK_ROUTINGS  
		WHERE dba.BANK_ROUTINGS.BANK_ROUTING = :ls_achaccrouting;				
		
		INSERT INTO dba.ACH_ELECTRONIC_DEPOSIT(ID_BRANCH,BALANCE,ED_DATE,CONFIRMED_AMT,CONFIRMED_BY,CONFIRMED_TIME,TRANSMITTED_TIME,RECEIVED_TIME,ACC_BANKNAME,ACC_TYPE,ACC_NUMBER,ACC_ROUTING)
		VALUES (:ls_id_branch,:ld_amount,:ldt_today,NULL,NULL,NULL,NULL,NULL,:ls_bank_name,:ls_achacctypeid,:ls_achaccnumber,:ls_achaccrouting);

		SELECT dba.GROUP_BRANCH.NAME_MAIN_BRANCH,   
				 dba.GROUP_BRANCH.EMAIL_GROUP,
				 dba.GROUP_BRANCH.EMAIL_NOTIFICATIONS,   
			 	 dba.GROUP_BRANCH.FAX_NOTIFICATIONS
		INTO :ls_namebranch,   
			  :ls_email,
			  :ls_notifyemail, 
			  :ls_notifyfax
		FROM dba.GROUP_BRANCH  
		WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :ls_group;
		
		ls_fax_branch = fn_getbranchfax(ls_id_branch)

		if isnull(ls_fax_branch) then ls_fax_branch = ''		
				
		ls_email = trim(ls_email)		

		if isnull(ls_email) or len(trim(ls_email)) < 1 then ls_email = "None"
	
		ls_emailtext = ""
		ls_emailtext = ls_emailtext + "" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "NOTIFICACION DE DEPOSITO ELECTRONICO" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "Att: "+trim(ls_namebranch)+" ("+trim(ls_id_branch)+")" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "" + char(13) + char(10)			
		ls_emailtext = ls_emailtext + "Estimado Agente Viamericas:" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "Viamericas requiere su autorizacion para un deposito electronico a ser" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "procesado el dia "+String(ld_tomorrow,"MM/DD/YYYY")+ "." + char(13) + char(10)		
		ls_emailtext = ls_emailtext + "Este deposito electronico debe ser aprobado a traves del ViaCash antes"+char(13) + char(10)
		ls_emailtext = ls_emailtext + "de las 4:00 pm (hora del Este) del dia de hoy."+char(13) + char(10)
		ls_emailtext = ls_emailtext + "La cuenta configurada para sus depositos es la cuenta terminada en "+mid(ls_achaccnumber, len(ls_achaccnumber)-3)+ "."+char(13) + char(10)
		ls_emailtext = ls_emailtext + "Su balance pendiente al cierre contable del dia "+String(RelativeDate(Today(),-1),"MM/DD/YYYY")+" es " +String(ld_amount,"$#,##0.00;$(#,##0.00)") + char(13) + char(10)
		ls_emailtext = ls_emailtext + "" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "La cantidad autorizada debera estar disponible en su cuenta para evitar" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "sobregiros." + char(13) + char(10)			
		ls_emailtext = ls_emailtext + "" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "*** Para Preguntas o informacion adicional contacte el departamento" + char(13) + char(10)
		ls_emailtext = ls_emailtext + "de Contabilidad 1.800.401.7626 Opcion 2 ***" + char(13) + char(10)			

		// ?????????????????????????????????????????????????????????
		// Desactivar esto cuando se desee mandar a las agencias!!!!
		// ls_email = "ebernal@viamericas.com"
		// ?????????????????????????????????????????????????????????			

		//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		// Envio de FAX		
		if not isnull(ls_notifyfax) and not isnull(ls_fax_branch) and len(trim(ls_fax_branch)) > 6 then
			if upper(ls_notifyfax) <> 'N' then
				
				ls_activefax = "@F201 "+trim(ls_id_branch)+"@@F211 "+ls_fax_branch+" @@F307 NOTIFICACION DEPOSITO ELECTRONICO VIAMERICAS. AGENCIA "+trim(ls_id_branch)+" ("+string(today(),"MM-DD-YYYY")+")@"

				ls_filename = "S:\AutoFax\DENotification_"+trim(ls_group)+"_"+string(today(),"YYDDMM")+"_FAX.txt"

				ll_filenum = FileOpen(ls_filename, LineMode!, Write!, LockWrite!, Replace!)
				FileWrite(ll_filenum,ls_activefax)		

				ls_emailtext1 = ''
				ls_emailtext1 = ls_emailtext1 + "" + char(13) + char(10)					
				ls_emailtext1 = ls_emailtext1 + "*** Fax Generado Automaticamente por Viamericas ***" + char(13) + char(10)
				ls_emailtext1 = ls_emailtext1 + "" + char(13) + char(10)
				ls_emailtext1 = ls_emailtext1 + "" + char(13) + char(10)			
				ls_emailtext1 = ls_emailtext1 + "Notificacion enviada al Fax: [" + ls_fax_branch + "] "
				ls_emailtext1 = ls_emailtext1 + "por favor comuniquese con nosotros" + char(13) + char(10)
				ls_emailtext1 = ls_emailtext1 + "si desea hacer un cambio de Fax o adicionar uno." + char(13) + char(10)
				
				FileWrite(ll_filenum,ls_emailtext)
				FileWrite(ll_filenum,ls_emailtext1)
				FileClose(ll_filenum)

			end if
		end if
		//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		
		//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		// Envio de EMAIL		
		if not isnull(ls_notifyemail) and not isnull(ls_email) and (ls_email <> "None") then
			if upper(ls_notifyemail) = 'Y' then
				
				ls_email = fn_reeplace(ls_email,"@","\@") // Para que funcione con multiples direcciones	
				ls_activefax = "@F201 "+trim(ls_id_branch)+"@@F212 "+trim(ls_email)+" @@F307 NOTIFICACION DEPOSITO ELECTRONICO VIAMERICAS. AGENCIA "+trim(ls_id_branch)+" ("+string(today(),"MM-DD-YYYY")+")@"

				ls_filename = "S:\AutoFax\DENotification_"+trim(ls_group)+"_"+string(today(),"YYDDMM")+"_EML.txt"
				
				ll_filenum = FileOpen(ls_filename, LineMode!, Write!, LockWrite!, Replace!)
				FileWrite(ll_filenum,ls_activefax)	
				
				ls_emailtext1 = ''
				ls_emailtext1 = ls_emailtext1 + "" + char(13) + char(10)					
				ls_emailtext1 = ls_emailtext1 + "*** EMail Generado Automaticamente por Viamericas, Favor no responder ***" + char(13) + char(10)
				ls_emailtext1 = ls_emailtext1 + "" + char(13) + char(10)
				ls_emailtext1 = ls_emailtext1 + "" + char(13) + char(10)			
				ls_emailtext1 = ls_emailtext1 + "Notificacion enviada al EMail: [" + fn_reeplace(ls_email,"\@","@") + "] "
				ls_emailtext1 = ls_emailtext1 + "por favor comuniquese con nosotros" + char(13) + char(10)
				ls_emailtext1 = ls_emailtext1 + "si desea hacer un cambio de EMail o adicionar uno." + char(13) + char(10)
								
				FileWrite(ll_filenum,ls_emailtext)
				FileWrite(ll_filenum,ls_emailtext1)
				FileClose(ll_filenum)

			end if
		end if		
		//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		

	end if

	fetch cur_groups into :ls_group, :ls_id_branch, :ld_balance, :ld_amttobereconciled, :ls_achacctypeid, :ls_achaccrouting, :ls_achaccnumber;
loop

close cur_groups;

commit;

//cb_query.triggerevent(Clicked!)

this.text = "Generate Today E-ACH"

commit;

Setpointer(Arrow!)
end event

type sle_branch from singlelineedit within w_group_branch_financial_v2
integer x = 261
integer y = 44
integer width = 343
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
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;fn_branch_change()
end event

type lst_branch from my_ddlb within w_group_branch_financial_v2
integer x = 617
integer y = 44
integer width = 1513
integer height = 1448
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch in ('R','A') and id_status_branch = 'O' UNION select '-ALL-', '--' order by 1;")
end event

event selectionchanged;call super::selectionchanged;
sle_branch.text = lst_branch.getdataid()

fn_filter()
end event

type st_1 from statictext within w_group_branch_financial_v2
integer x = 55
integer y = 60
integer width = 197
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
string text = "Branch :"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_group_branch_financial_v2
integer x = 5
integer width = 2171
integer height = 148
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

type gb_1 from groupbox within w_group_branch_financial_v2
integer x = 9
integer y = 156
integer width = 2889
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group Branch Detail "
end type

