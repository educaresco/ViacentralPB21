$PBExportHeader$w_rep_faxrates.srw
forward
global type w_rep_faxrates from wb_report_agencia
end type
type cb_send from commandbutton within w_rep_faxrates
end type
type cb_sendall from commandbutton within w_rep_faxrates
end type
type cbx_new from checkbox within w_rep_faxrates
end type
type dw_procesar from datawindow within w_rep_faxrates
end type
end forward

global type w_rep_faxrates from wb_report_agencia
integer x = 214
integer y = 221
integer width = 3931
integer height = 2420
event ue_ejecutar_automatico ( )
cb_send cb_send
cb_sendall cb_sendall
cbx_new cbx_new
dw_procesar dw_procesar
end type
global w_rep_faxrates w_rep_faxrates

type variables
STRU_PARAMETROS istru_parametros
end variables

forward prototypes
public subroutine fn_generar_fax (string ps_branch, string ps_autofaxpath)
end prototypes

event ue_ejecutar_automatico();LONG l_fila


Setpointer(Hourglass!)


	
String	ls_branch
String ls_AutoFaxPath
String ls_message

ls_AutoFaxPath = fn_busparameter("FAXOPENTEXTPATH")

if cbx_new.checked then
	dw_1.DataObject = 'dw_rep_3countries_faxrates_one'
else
	dw_1.DataObject = 'dw_rep_faxrates_one'
end if

//4/8/2019 : se conecta a DB01 para evitar problemas de los rates que no aparecen cuando la sincronizacion de la BD se retrasa.
dw_1.settransobject(SQLCA)

ls_message = "ALL RATES PUBLISHED | Started: " +String(Today(), "m/d/yyyy hh:mm:ss")

INSERT INTO dba.Log (Date, Thread, Level, Logger, Message, Data, Exception)
VALUES (GETDATE(), 0, 'Notification', 'ViaCentral-RedPhone-DatesReport', :ls_message, SYSTEM_USER, '');


FOR l_fila = 1 TO UpperBound(istru_parametros.String)
	
	Yield()
	ls_branch = istru_parametros.String[l_fila]
	
	dw_procesar.SetItem(l_fila,'snprocesado', 'S' )
	
	dw_procesar.SelectRow(0, false)
	dw_procesar.SelectRow(l_fila, true)
	
	dw_procesar.SetRow ( l_fila )
	dw_procesar.scrolltorow(l_fila)
	
	
	fn_generar_fax(ls_branch, ls_AutoFaxPath)

NEXT	


ls_message = ls_message + "| Completed: " + String(Today(), "m/d/yyyy hh:mm:ss")

INSERT INTO dba.Log (Date, Thread, Level, Logger, Message, Data, Exception)
VALUES (GETDATE(), 0, 'Notification', 'ViaCentral-RedPhone-DatesReport', :ls_message, SYSTEM_USER, '');



Setpointer(Arrow!)

messageBox('Atención','El proceso ha finalizado' )
end event

public subroutine fn_generar_fax (string ps_branch, string ps_autofaxpath);string ls_fax, ls_activefax, ls_emailfilename


ls_fax = fn_getbranchfax(ps_branch)	

if len(ls_fax) > 8  then				
		
							
	ls_activefax = ''
	dw_1.retrieve(ps_branch,ls_activefax)	
	
	// Saves the DW as PDF on the output fax/email folder
	dw_1.Object.DataWindow.Export.PDF.Method = Distill! 
	dw_1.Object.DataWindow.Printer = "Sybase DataWindow PS"
	dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="1"
	ls_emailfilename =ps_AutoFaxPath+"RATES_REPORT_"+trim(ps_branch)+'_'+string(today(),'yyyymmdd_hhmmss')+'.PDF'			
	dw_1.SaveAs(ls_emailfilename, PDF!, TRUE)					

	 // Writes the control file on the outpout fax/email folder
	fn_controlfile2(ls_emailfilename,"RATES REPORT: "+trim(ps_branch),"",ls_fax)											
					
end if
end subroutine

on w_rep_faxrates.create
int iCurrent
call super::create
this.cb_send=create cb_send
this.cb_sendall=create cb_sendall
this.cbx_new=create cbx_new
this.dw_procesar=create dw_procesar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_send
this.Control[iCurrent+2]=this.cb_sendall
this.Control[iCurrent+3]=this.cbx_new
this.Control[iCurrent+4]=this.dw_procesar
end on

on w_rep_faxrates.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_send)
destroy(this.cb_sendall)
destroy(this.cbx_new)
destroy(this.dw_procesar)
end on

event open;call super::open;integer li_user, l_fila
string ls_branch


SELECT Count(*)
INTO :li_user
FROM dba.SEC_USER_GROUP 
WHERE ID_GROUP = 'BRS' AND ID_USER = :gs_cashier;

IF li_user = 0 THEN 
	cb_sendall.Visible = false
END IF

istru_parametros = Message.PowerObjectParm

IF UpperBound(istru_parametros.String) = 1 THEN
	sle_branch.text = istru_parametros.String[1] 
	sle_branch.triggerevent('modified')
	cb_query.TriggerEvent('clicked')
ELSE
	IF UpperBound(istru_parametros.String) > 1 THEN
		
		dw_procesar.Visible = true
		
		cb_query.enabled = false
		cb_send.enabled = false
		cb_sendall.enabled = false
		
		FOR l_fila = 1 TO UpperBound(istru_parametros.String)
		
			dw_procesar.InsertRow(0)
			dw_procesar.SetItem(l_fila, 'agencia', istru_parametros.String[l_fila])
			
		NEXT
		
		This.PostEvent("ue_ejecutar_automatico")  
		
	END IF
	
end if
end event

type sle_name from wb_report_agencia`sle_name within w_rep_faxrates
integer y = 36
integer width = 1056
integer taborder = 0
end type

type sle_branch from wb_report_agencia`sle_branch within w_rep_faxrates
integer y = 36
integer taborder = 10
end type

type dw_1 from wb_report_agencia`dw_1 within w_rep_faxrates
integer y = 228
integer width = 3858
integer height = 1972
string title = "Rates Report"
string dataobject = "dw_rep_faxrates_one"
end type

type st_1 from wb_report_agencia`st_1 within w_rep_faxrates
integer y = 48
end type

type cb_query from wb_report_agencia`cb_query within w_rep_faxrates
integer x = 1637
integer y = 36
integer taborder = 20
end type

event cb_query::clicked;String	ls_branch
long		ll_cont

Setpointer(Hourglass!)

ls_branch = trim(sle_branch.text)

select count(*)
  into :ll_cont
  from dba.branch with (nolock)
 where id_branch = :ls_branch
   and id_type_branch in ('A','R')
	and id_status_branch = 'O';

if ll_cont < 1 then
	Setpointer(Arrow!)
	messagebox("Error","The Branch "+ls_branch+" was not found or is closed.",StopSign!)
	return
end if

if cbx_new.checked then
	dw_1.DataObject = 'dw_rep_3countries_faxrates_one'
else
	dw_1.DataObject = 'dw_rep_faxrates_one'
end if

//4/8/2019 : se conecta a DB01 para evitar problemas de los rates que no aparecen cuando la sincronizacion de la BD se retrasa.
//dw_1.settransobject(SQLCARPT)
dw_1.settransobject(SQLCA)


dw_1.retrieve(ls_branch)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type cb_send from commandbutton within w_rep_faxrates
integer x = 2085
integer y = 36
integer width = 1033
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Send Fax to selected Branch"
end type

event clicked;String		ls_branch
long		ll_cont
String		ls_message

Setpointer(Hourglass!)

ls_branch = trim(sle_branch.text)

select count(*)
into :ll_cont
from dba.branch
where id_branch = :ls_branch
and id_type_branch in ('A','R')
and id_status_branch = 'O';

if ll_cont < 1 then
	Setpointer(Arrow!)
	messagebox("Error","The Agency "+ls_branch+" was not found or is closed.",StopSign!)
	return
end if

If Messagebox("Confirmation","Do you want to send the FAX with the Rates Report to the Agency "+ls_branch+"?",Question!,YesNo!) = 1 Then

	
	// When faxing thru OpenText
//	if fn_busparameter("FAXMODE")="OT" then
		
		String ls_AutoFaxPath
		
		ls_AutoFaxPath = fn_busparameter("FAXOPENTEXTPATH")
		
		if cbx_new.checked then
			dw_1.DataObject = 'dw_rep_3countries_faxrates_one'
		else
			dw_1.DataObject = 'dw_rep_faxrates_one'
		end if

		//4/8/2019 : se conecta a DB01 para evitar problemas de los rates que no aparecen cuando la sincronizacion de la BD se retrasa.
		//dw_1.settransobject(SQLCARPT)
		dw_1.settransobject(SQLCA)
		
		string ls_fax, ls_activefax, ls_emailfilename
		ls_fax = fn_getbranchfax(ls_branch)	
		
		if len(ls_fax) > 8  then
						
			//ls_activefax = "@F201 "+ls_branch+"@@F211 "+ls_fax+"@@F307 Tasas Diarias@@F301 99@"			
			//dw_1.print()				
									
			ls_activefax = ''
			dw_1.retrieve(ls_branch,ls_activefax)	
			
			// Saves the DW as PDF on the output fax/email folder
			dw_1.Object.DataWindow.Export.PDF.Method = Distill! 
			dw_1.Object.DataWindow.Printer = "Sybase DataWindow PS"
			dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="1"
			ls_emailfilename = ls_AutoFaxPath+"RATES_REPORT_"+trim(ls_branch)+'_'+string(today(),'yyyymmdd_hhmmss')+'.PDF'			
			dw_1.SaveAs(ls_emailfilename, PDF!, TRUE)					
		
			 // Writes the control file on the outpout fax/email folder
			fn_controlfile2(ls_emailfilename,"RATES REPORT: "+trim(ls_branch),"",ls_fax)		
			
			ls_message = "RATE PUBLISHED to " + trim(ls_branch) + " ("+ls_fax+")"+" | At: " + String(Today(), "m/d/yyyy hh:mm")
			INSERT INTO dba.Log (Date, Thread, Level, Logger, Message, Data, Exception)
			VALUES (GETDATE(), 0, 'Notification', 'ViaCentral-RedPhone-DatesReport', :ls_message, SYSTEM_USER, '');
			
			
		else
			
			messagebox("Error","The Agency "+ls_branch+" does not have a valid FAX number.",StopSign!)
			return
			
							
		end if
		
		

		
	
//	else // When faxing thru ActiveFax (default)
//	
//		dw_1.DataObject = 'dw_rep_faxrates_one'
//		dw_1.settransobject(SQLCA)
//		
//		dw_1.retrieve(ls_branch)	
//		dw_1.print()		
//
//	
//	end if


	Setpointer(Arrow!)


end if


end event

type cb_sendall from commandbutton within w_rep_faxrates
integer x = 2085
integer y = 124
integer width = 1033
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Send Fax to ALL Red Phone Branches"
end type

event clicked;If Messagebox("Confirmation","Do you want to send a FAX with the rates to ALL the RED PHONE agencies? This report takes a few minutes please don't close ViaCentral once you start it",Question!,YesNo!) <> 1 Then
	return
end if

Setpointer(Hourglass!)


// When faxing thru OpenText
//if fn_busparameter("FAXMODE")="OT" then
	
	String	ls_branch
	String ls_AutoFaxPath
	String ls_message
	
	ls_AutoFaxPath = fn_busparameter("FAXOPENTEXTPATH")
	
	if cbx_new.checked then
		dw_1.DataObject = 'dw_rep_3countries_faxrates_one'
	else
		dw_1.DataObject = 'dw_rep_faxrates_one'
	end if
	
	//4/8/2019 : se conecta a DB01 para evitar problemas de los rates que no aparecen cuando la sincronizacion de la BD se retrasa.
	//dw_1.settransobject(SQLCARPT)
	dw_1.settransobject(SQLCA)
	
	ls_message = "ALL RATES PUBLISHED | Started: " +String(Today(), "m/d/yyyy hh:mm:ss")
	
	INSERT INTO dba.Log (Date, Thread, Level, Logger, Message, Data, Exception)
	VALUES (GETDATE(), 0, 'Notification', 'ViaCentral-RedPhone-DatesReport', :ls_message, SYSTEM_USER, '');
	
	
	DECLARE cur_branches CURSOR FOR  
	SELECT dba.BRANCH.id_branch
	FROM dba.BRANCH WITH (NOLOCK),   
	dba.TIPO_TRANSMISION_AGENCIA WITH (NOLOCK),
	dba.GROUP_BRANCH WITH (NOLOCK) 
	WHERE dba.BRANCH.ID_BRANCH = dba.TIPO_TRANSMISION_AGENCIA.ID_BRANCH
	AND dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
	AND ISNULL(dba.TIPO_TRANSMISION_AGENCIA.SEND_RATE_FAX,'N') = 'Y'
	AND dba.BRANCH.FAX_BRANCH is not null  
	AND dba.BRANCH.ID_STATUS_BRANCH = 'O'
	AND dba.BRANCH.ID_TYPE_BRANCH in ('A','R')
	ORDER BY DEBITO_GROUP DESC USING SQLCARPT;
	
	OPEN cur_branches;
	
	FETCH cur_branches INTO :ls_branch;
	
	DO WHILE SQLCARPT.SQLCODE = 0 
		
		fn_generar_fax(ls_branch, ls_AutoFaxPath)
	/*
		string ls_fax, ls_activefax, ls_emailfilename
		ls_fax = fn_getbranchfax(ls_branch)	
		
		if len(ls_fax) > 8  then
						
			//ls_activefax = "@F201 "+ls_branch+"@@F211 "+ls_fax+"@@F307 Tasas Diarias@@F301 99@"			
			//dw_1.print()				
									
			ls_activefax = ''
			dw_1.retrieve(ls_branch,ls_activefax)	
			
			// Saves the DW as PDF on the output fax/email folder
			dw_1.Object.DataWindow.Export.PDF.Method = Distill! 
			dw_1.Object.DataWindow.Printer = "Sybase DataWindow PS"
			dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="1"
			ls_emailfilename = ls_AutoFaxPath+"RATES_REPORT_"+trim(ls_branch)+'_'+string(today(),'yyyymmdd_hhmmss')+'.PDF'			
			dw_1.SaveAs(ls_emailfilename, PDF!, TRUE)					
		
		    // Writes the control file on the outpout fax/email folder
			fn_controlfile2(ls_emailfilename,"RATES REPORT: "+trim(ls_branch),"",ls_fax)											
							
		end if
		*/
		FETCH cur_branches INTO :ls_branch;
		
	LOOP
	
	CLOSE cur_branches;
	
	ls_message = ls_message + "| Completed: " + String(Today(), "m/d/yyyy hh:mm:ss")

	INSERT INTO dba.Log (Date, Thread, Level, Logger, Message, Data, Exception)
	VALUES (GETDATE(), 0, 'Notification', 'ViaCentral-RedPhone-DatesReport', :ls_message, SYSTEM_USER, '');


//else // When faxing thru ActiveFax (default)
//
//	dw_1.DataObject = 'dw_rep_faxrates_all'
//	dw_1.settransobject(SQLCA)
//	
//	dw_1.retrieve('-ALL-')	
//	dw_1.print()		
//
//end if


Setpointer(Arrow!)
end event

type cbx_new from checkbox within w_rep_faxrates
boolean visible = false
integer x = 1271
integer y = 128
integer width = 361
integer height = 64
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
string text = "New Layout"
boolean checked = true
end type

type dw_procesar from datawindow within w_rep_faxrates
boolean visible = false
integer x = 247
integer y = 4
integer width = 1381
integer height = 216
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_proceso_enviar_fax"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

