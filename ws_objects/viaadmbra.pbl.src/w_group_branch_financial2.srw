$PBExportHeader$w_group_branch_financial2.srw
forward
global type w_group_branch_financial2 from wb_single_tb
end type
type cb_fixdescriptions from commandbutton within w_group_branch_financial2
end type
type cb_ea from commandbutton within w_group_branch_financial2
end type
type dw_branch from datawindow within w_group_branch_financial2
end type
type gb_2 from groupbox within w_group_branch_financial2
end type
type gb_1 from groupbox within w_group_branch_financial2
end type
end forward

global type w_group_branch_financial2 from wb_single_tb
integer x = 214
integer y = 221
integer width = 2944
integer height = 1840
string title = "Group Branch - Financial Profile"
boolean maxbox = false
boolean resizable = false
cb_fixdescriptions cb_fixdescriptions
cb_ea cb_ea
dw_branch dw_branch
gb_2 gb_2
gb_1 gb_1
end type
global w_group_branch_financial2 w_group_branch_financial2

type variables
string is_id_main_branch, is_id_branch
datawindowchild idwc_cod_code_dep, idwc_des_code_dep
end variables

forward prototypes
public subroutine fn_filter ()
public subroutine fn_branch_change ()
end prototypes

public subroutine fn_filter ();String ls_filter, ls_main_branch

if is_id_branch <> '--' then

	SELECT RTRIM(ID_MAIN_BRANCH)
	INTO:ls_main_branch
	FROM DBA.BRANCH
	WHERE ID_BRANCH = :is_id_branch;
	
	is_id_main_branch = ls_main_branch
else
	is_id_main_branch = ''
end if		

dw_1.of_retrieve()

end subroutine

public subroutine fn_branch_change ();
fn_filter()
end subroutine

on w_group_branch_financial2.create
int iCurrent
call super::create
this.cb_fixdescriptions=create cb_fixdescriptions
this.cb_ea=create cb_ea
this.dw_branch=create dw_branch
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fixdescriptions
this.Control[iCurrent+2]=this.cb_ea
this.Control[iCurrent+3]=this.dw_branch
this.Control[iCurrent+4]=this.gb_2
this.Control[iCurrent+5]=this.gb_1
end on

on w_group_branch_financial2.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_fixdescriptions)
destroy(this.cb_ea)
destroy(this.dw_branch)
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

is_id_branch = message.stringparm

if not IsNull(is_id_branch) then
	dw_branch.setitem( 1, 'id_branch',is_id_branch )
	fn_branch_change()
end if


end event

event close;call super::close;if IsValid(w_acc_credit) then
	w_acc_credit.fn_get_group_branch_data()
end if
end event

type dw_1 from wb_single_tb`dw_1 within w_group_branch_financial2
integer x = 18
integer y = 256
integer width = 2857
integer height = 1292
string dataobject = "dw_group_branch_financial"
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

if dwo.name = "flag_com_chain" and row > 0 then
	 integer li_result
	 	
			Openwithparm(w_financial_chain,is_id_main_branch)
			li_result = message.doubleparm 
			this.retrieve(is_id_main_branch )
			

end if
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

type cb_fixdescriptions from commandbutton within w_group_branch_financial2
integer x = 1495
integer y = 1584
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

type cb_ea from commandbutton within w_group_branch_financial2
integer x = 622
integer y = 1576
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

type dw_branch from datawindow within w_group_branch_financial2
integer x = 23
integer y = 44
integer width = 2126
integer height = 108
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ext_branch"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if dwo.name  = 'id_branch' then 
	is_id_branch = data
end if 

if dwo.name  = 'id_branch_1' then 
	is_id_branch = data
end if 
end event

event constructor;this.settransobject( SQLCA)
this.retrieve( )
this.insertrow(0)
end event

type gb_2 from groupbox within w_group_branch_financial2
integer x = 5
integer width = 2208
integer height = 160
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

type gb_1 from groupbox within w_group_branch_financial2
integer x = 9
integer y = 188
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

