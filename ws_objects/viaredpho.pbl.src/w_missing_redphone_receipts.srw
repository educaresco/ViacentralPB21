$PBExportHeader$w_missing_redphone_receipts.srw
forward
global type w_missing_redphone_receipts from wb_report_agencia
end type
type cb_send from commandbutton within w_missing_redphone_receipts
end type
type cb_sendall from commandbutton within w_missing_redphone_receipts
end type
end forward

global type w_missing_redphone_receipts from wb_report_agencia
integer x = 214
integer y = 221
integer width = 3232
integer height = 1936
cb_send cb_send
cb_sendall cb_sendall
end type
global w_missing_redphone_receipts w_missing_redphone_receipts

on w_missing_redphone_receipts.create
int iCurrent
call super::create
this.cb_send=create cb_send
this.cb_sendall=create cb_sendall
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_send
this.Control[iCurrent+2]=this.cb_sendall
end on

on w_missing_redphone_receipts.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_send)
destroy(this.cb_sendall)
end on

type sle_name from wb_report_agencia`sle_name within w_missing_redphone_receipts
integer y = 36
integer width = 1056
integer taborder = 0
end type

type sle_branch from wb_report_agencia`sle_branch within w_missing_redphone_receipts
integer y = 36
integer taborder = 10
end type

type dw_1 from wb_report_agencia`dw_1 within w_missing_redphone_receipts
integer y = 228
integer height = 1484
string title = "RedPhoneReceipts"
string dataobject = "dw_missing_redphone_receipts"
end type

type st_1 from wb_report_agencia`st_1 within w_missing_redphone_receipts
integer y = 48
end type

type cb_query from wb_report_agencia`cb_query within w_missing_redphone_receipts
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
  from dba.branch
 where id_branch = :ls_branch
   and id_type_branch in ('A','R')
	and id_status_branch = 'O';

if ll_cont < 1 then
	Setpointer(Arrow!)
	messagebox("Error","The Branch "+ls_branch+" was not found or is closed.",StopSign!)
	return
end if


dw_1.DataObject = 'dw_rep_faxrates_one'
dw_1.settransobject(SQLCA)

dw_1.retrieve(ls_branch,'')
dw_1.setfocus()

Setpointer(Arrow!)
end event

type cb_send from commandbutton within w_missing_redphone_receipts
integer x = 2258
integer y = 28
integer width = 887
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Send Fax to selected Branch"
end type

event clicked;String		ls_branch
long		ll_cont

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
	messagebox("Error","The Branch "+ls_branch+" was not found or is closed.",StopSign!)
	return
end if

If Messagebox("Confirmacion","Desea enviar el fax a la agencia "+ls_branch+" ?",Question!,YesNo!) = 1 Then

	Setpointer(Hourglass!)
	
	dw_1.DataObject = 'dw_rep_faxrates_one'
	dw_1.settransobject(SQLCA)
	
	dw_1.retrieve(ls_branch)	
	dw_1.print()		

	Setpointer(Arrow!)

end if


//
//String	ls_branch
//long		ll_cont
//String 	ls_AutoFaxPath = 'S:\AutoFax\'
//
//Setpointer(Hourglass!)
//
//ls_branch = trim(sle_branch.text)
//
//select count(*)
//  into :ll_cont
//  from dba.branch
// where id_branch = :ls_branch
//   and id_type_branch in ('A','R')
//	and id_status_branch = 'O';
//
//if ll_cont < 1 then
//	Setpointer(Arrow!)
//	messagebox("Error","The Branch "+ls_branch+" was not found or is closed.",StopSign!)
//	return
//end if
//
//If Messagebox("Confirmation","Do you want to send a FAX to the agency "+ls_branch+" ?",Question!,YesNo!) = 1 Then
//
//	string ls_fax, ls_activefax
//	ls_fax = fn_getbranchfax(ls_branch)	
//	if len(ls_fax) > 5 and len(ls_fax) < 15 then
//		ls_activefax = "@F201 "+ls_branch+"@@F211 "+ls_fax+"@@F307 Tasas Diarias "+ls_branch+"@"		
//		dw_1.retrieve(ls_branch,ls_activefax)
//		//dw_1.print()
//		dw_1.SaveAs(ls_AutoFaxPath+"REP_FaxRates_"+ls_branch+string(today(),'yyyymmdd_hhmmss')+"_html.txt", HTMLTable!, FALSE)
//		
//		messagebox("Confirmation","The report was sent to the fax "+ls_fax+".",Information!)	
//	else
//		messagebox("Error","Please check the fax number ("+ls_fax+") for the agency "+ls_branch+".",StopSign!)
//	end if
//	
//end if
//
//dw_1.retrieve(ls_branch,'')
//
//Setpointer(Arrow!)
end event

type cb_sendall from commandbutton within w_missing_redphone_receipts
integer x = 2258
integer y = 124
integer width = 887
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Send Fax to ALL Red Phone Branches"
end type

event clicked;

If Messagebox("Confirmacion","Este reporte se demora unos minutos, Esta seguro que desea enviarlo a todas las agencias?"+char(10)+char(13)+"Do you want to send a FAX with the rates to ALL the RED PHONE agencies?",Question!,YesNo!) <> 1 Then
	return
end if

Setpointer(Hourglass!)


//// When faxing thru OpenText
//if fn_busparameter("FAXMODE")="OT" then
//	
//	String	ls_branch
//	String ls_AutoFaxPath
//	
//	ls_AutoFaxPath = fn_busparameter("FAXOPENTEXTPATH")
//	
//	dw_1.DataObject = 'dw_rep_faxrates_one'
//	dw_1.settransobject(SQLCA)
//		
//	DECLARE cur_branches CURSOR FOR  
//	SELECT dba.BRANCH.id_branch
//	FROM dba.BRANCH WITH (NOLOCK),   
//	dba.TIPO_TRANSMISION_AGENCIA WITH (NOLOCK),
//	dba.GROUP_BRANCH WITH (NOLOCK) 
//	WHERE dba.BRANCH.ID_BRANCH = dba.TIPO_TRANSMISION_AGENCIA.ID_BRANCH
//	AND dba.GROUP_BRANCH.ID_MAIN_BRANCH = dba.BRANCH.ID_MAIN_BRANCH
//	AND dba.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION = 'R'
//	AND ISNULL(dba.TIPO_TRANSMISION_AGENCIA.SEND_RATE_FAX,'N') = 'Y'
//	AND dba.BRANCH.FAX_BRANCH is not null  
//	AND dba.BRANCH.ID_STATUS_BRANCH = 'O'
//	AND dba.BRANCH.ID_TYPE_BRANCH in ('A','R')
//	ORDER BY DEBITO_GROUP DESC;
//	
//	OPEN cur_branches;
//	
//	FETCH cur_branches INTO :ls_branch;
//	
//	DO WHILE SQLCA.SQLCODE = 0 
//	
//		string ls_fax, ls_activefax, ls_emailfilename
//		ls_fax = fn_getbranchfax(ls_branch)	
//		
//		if len(ls_fax) > 8  then
//						
//			//ls_activefax = "@F201 "+ls_branch+"@@F211 "+ls_fax+"@@F307 Tasas Diarias@@F301 99@"			
//			//dw_1.print()				
//									
//			ls_activefax = ''
//			dw_1.retrieve(ls_branch,ls_activefax)	
//			
//			// Saves the DW as PDF on the output fax/email folder
//			dw_1.Object.DataWindow.Export.PDF.Method = Distill! 
//			dw_1.Object.DataWindow.Printer = "Sybase DataWindow PS"
//			dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="1"
//			ls_emailfilename = ls_AutoFaxPath+"RATES_REPORT_"+trim(ls_branch)+'_'+string(today(),'yyyymmdd_hhmmss')+'.PDF'			
//			dw_1.SaveAs(ls_emailfilename, PDF!, TRUE)					
//		
//		    // Writes the control file on the outpout fax/email folder
//			fn_controlfile2(ls_emailfilename,"RATES REPORT: "+trim(ls_branch),"",ls_fax)											
//							
//		end if
//		
//		FETCH cur_branches INTO :ls_branch;
//		
//	LOOP
//	
//	CLOSE cur_branches;
//	
//
//else // When faxing thru ActiveFax (default)

	dw_1.DataObject = 'dw_missing_redphone_receipts'
	dw_1.settransobject(SQLCA)
	
	dw_1.retrieve('-ALL-')	
	dw_1.print()		

//end if


Setpointer(Arrow!)
end event

