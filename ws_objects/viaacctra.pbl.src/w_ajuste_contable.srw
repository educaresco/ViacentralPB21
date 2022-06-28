$PBExportHeader$w_ajuste_contable.srw
$PBExportComments$Ajuste Contable para afectar las cuentas del balance por Grupo.
forward
global type w_ajuste_contable from wb_response
end type
type dw_2 from datawindow within w_ajuste_contable
end type
type cb_1 from commandbutton within w_ajuste_contable
end type
type cb_save from commandbutton within w_ajuste_contable
end type
type dw_1 from datawindow within w_ajuste_contable
end type
type cbx_1 from checkbox within w_ajuste_contable
end type
type cb_3 from commandbutton within w_ajuste_contable
end type
type st_branch from statictext within w_ajuste_contable
end type
type em_agent from editmask within w_ajuste_contable
end type
type st_group from statictext within w_ajuste_contable
end type
type em_group from editmask within w_ajuste_contable
end type
type cb_5 from commandbutton within w_ajuste_contable
end type
type sle_selectedfax from singlelineedit within w_ajuste_contable
end type
type cb_faxviewer from commandbutton within w_ajuste_contable
end type
type sle_completefaxpath from singlelineedit within w_ajuste_contable
end type
end forward

global type w_ajuste_contable from wb_response
integer width = 3511
integer height = 936
string title = "Balance Ajustment"
long backcolor = 80269524
dw_2 dw_2
cb_1 cb_1
cb_save cb_save
dw_1 dw_1
cbx_1 cbx_1
cb_3 cb_3
st_branch st_branch
em_agent em_agent
st_group st_group
em_group em_group
cb_5 cb_5
sle_selectedfax sle_selectedfax
cb_faxviewer cb_faxviewer
sle_completefaxpath sle_completefaxpath
end type
global w_ajuste_contable w_ajuste_contable

type variables
Boolean ib_salvado = False
end variables

on w_ajuste_contable.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.cb_1=create cb_1
this.cb_save=create cb_save
this.dw_1=create dw_1
this.cbx_1=create cbx_1
this.cb_3=create cb_3
this.st_branch=create st_branch
this.em_agent=create em_agent
this.st_group=create st_group
this.em_group=create em_group
this.cb_5=create cb_5
this.sle_selectedfax=create sle_selectedfax
this.cb_faxviewer=create cb_faxviewer
this.sle_completefaxpath=create sle_completefaxpath
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_save
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.st_branch
this.Control[iCurrent+8]=this.em_agent
this.Control[iCurrent+9]=this.st_group
this.Control[iCurrent+10]=this.em_group
this.Control[iCurrent+11]=this.cb_5
this.Control[iCurrent+12]=this.sle_selectedfax
this.Control[iCurrent+13]=this.cb_faxviewer
this.Control[iCurrent+14]=this.sle_completefaxpath
end on

on w_ajuste_contable.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.cb_save)
destroy(this.dw_1)
destroy(this.cbx_1)
destroy(this.cb_3)
destroy(this.st_branch)
destroy(this.em_agent)
destroy(this.st_group)
destroy(this.em_group)
destroy(this.cb_5)
destroy(this.sle_selectedfax)
destroy(this.cb_faxviewer)
destroy(this.sle_completefaxpath)
end on

event open;call super::open;Hide()
X=1
Y=1
Show()

commit ;

ib_salvado = False

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)


dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_1.setfocus()		




end event

event close;call super::close;dw_1.RESET()
dw_2.RESET()
end event

type dw_2 from datawindow within w_ajuste_contable
integer x = 18
integer y = 352
integer width = 3438
integer height = 460
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_ajuste_contable"
boolean border = false
boolean livescroll = true
end type

event itemchanged;datetime ld_dateblocker
date ld_current

if dwo.name = "date" then

	select date_blocker
	into :ld_dateblocker
	from dba.acc_parameters;
	if SQLCA.SQLCode <> 0 then
		Messagebox("Error","Error checking Account Parameters, Block Date will not be checked!~n[Error: "+SQLCA.SQLErrText+"]",Stopsign!)
		return 0
	end if
	
	if not isnull(ld_dateblocker) then
		
		ld_current = date(left(data,10))		
		if ld_current <= date(ld_dateblocker) then
		
		messagebox("Error","The date you are using was already block, contact Financial department.~nThe value you entered for Transaction Date was not accepted.",StopSign!)
		return 2
		//0  (Default) Accept the data value
		//1  Reject the data value and don't allow focus to change
		//2  Reject the data value but allow the focus to change
		end if
	
	end if
end if
end event

type cb_1 from commandbutton within w_ajuste_contable
integer x = 2510
integer y = 44
integer width = 430
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New"
end type

event clicked;ib_salvado = False
dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_1.setfocus()		
sle_selectedfax.text = "[No Fax Selected]"




end event

type cb_save from commandbutton within w_ajuste_contable
integer x = 2958
integer y = 44
integer width = 430
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;Double	ld_cons, ld_deposito, 		&
			ld_nivel_endeudamiento, 	&
			ld_total_deuda_grupo, 		&
			ld_receiver, 					&
			ld_amount, 						&
			ld_balance = 0, 				&
			ld_debit  = 0, 				&
			ld_credit = 0
		
String	ls_branch, ls_group, ls_account

COMMIT ;

dw_1.accepttext()
dw_2.accepttext()

If ib_salvado Then
	return
End if

ls_account = dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")
ls_group = dw_2.getitemstring(dw_2.getrow(),"id_group")

ld_credit  =  dw_2.getitemnumber(dw_2.getrow(),"credit")
ld_debit  =  dw_2.getitemnumber(dw_2.getrow(),"debit")

if ld_credit <> 0 and ld_debit <> 0 then
	Messagebox("Error","Duplicated Transaction",StopSign!)
	return
end if

	if ld_credit <> 0 then
		ld_deposito = ld_credit
	else
		ld_deposito = ld_debit
	
	end if
		
		 SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		
		if isnull(ld_cons) then ld_cons = 1		
		

dw_2.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"id_cashier",gs_cashier)

dw_2.setitem(1,"total_amount",ld_deposito)

dw_2.accepttext()


if cbx_1.checked then
	dw_1.setitem(1,"cons",ld_cons)
	dw_1.accepttext()
	IF dw_2.update()=1 THEN
		COMMIT ;
		IF dw_1.update()=1 THEN
			dw_1.enabled = False
			dw_2.enabled = False
			COMMIT ;
			ib_salvado = True
			Messagebox("Deposit Group","Deposit was done.")
			// ---------------------------------------------------->			
			// Moviendo el Fax a la carpeta de procesados
			if sle_selectedfax.text <> "[No Fax Selected]" then
				String ls_faxpath, ls_faxname, ls_newfaxname, ls_bankid
				
				SELECT dba.CUENTA_BANCO.ID_BANCO  
    			INTO :ls_bankid  
    			FROM dba.CUENTA_BANCO  
   			WHERE dba.CUENTA_BANCO.ID_CUENTA_BANCO = :ls_account   ;

				if isnull(ls_bankid) then ls_bankid = "xxxxx"
				if isnull(ls_account) then ls_account = "xxxxx"				
				
				ls_faxpath = "u:\accounting\"
				ls_faxname = sle_selectedfax.text
				if FileExists(ls_faxpath+ls_faxname) then			
					ls_newfaxname = "0_" + trim(em_agent.text) + "_" + trim(ls_bankid) + "_" + trim(ls_account) + "_" + string(round(ld_deposito,0)) + "_"+string(ld_cons)+".tif"
					fn_filemove(ls_faxpath+ls_faxname,ls_faxpath+"processed\"+ls_newfaxname)	
					sle_selectedfax.text = ls_newfaxname
					sle_completefaxpath.text = "u:\accounting\processed\"+sle_selectedfax.text
				end if
			end if	
			// ---------------------------------------------------->		
			Return
		ELSE
			ROLLBACK ;
			Return
		END IF
	ELSE
		ROLLBACK ;
		Return
	END IF
End if

if NOT(cbx_1.checked) then
	IF dw_2.update() = 1 THEN
		dw_2.enabled = False
		COMMIT ;
		ib_salvado = True
		Messagebox("Deposit Group","Deposit was done.")
		//-------------------------------------------->
		// Moviendo el Fax a la carpeta de procesados
		if sle_selectedfax.text <> "[No Fax Selected]" then
			ls_faxpath = "u:\accounting\"
			ls_faxname = sle_selectedfax.text
			if FileExists(ls_faxpath+ls_faxname) then
				fn_filemove(ls_faxpath+ls_faxname,ls_faxpath+"processed\"+ls_faxname)										
			end if
		end if
		//-------------------------------------------->
		Return
	ELSE
		ROLLBACK ;
		Return
	END IF
End if

Setpointer(Arrow!)
		
end event

type dw_1 from datawindow within w_ajuste_contable
integer x = 32
integer y = 144
integer width = 2235
integer height = 192
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_selet_cuenta_pago_corresponsal"
boolean border = false
boolean livescroll = true
end type

event itemchanged;DataWindowChild	ldw_dw

IF dwo.Name = 'id_banco' THEN
	GetChild('id_cuenta_banco',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("id_banco = '"+GetText()+"'")
	ldw_dw.Filter()
END IF

dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",'')
end event

type cbx_1 from checkbox within w_ajuste_contable
integer x = 2510
integer y = 152
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Cross with Bank"
boolean checked = true
end type

event clicked;IF cbx_1.checked then
	dw_1.visible = True
	return
end if

IF NOT(cbx_1.checked) then
	dw_1.visible = False
	return
end if
end event

type cb_3 from commandbutton within w_ajuste_contable
integer x = 50
integer y = 44
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Look Up"
end type

event clicked;String ls_depositcode, ls_idbranch, ls_idgroup, ls_idbanco, ls_idcuenta  

Openwithparm(w_deposit_lookup,"")
ls_depositcode = message.stringparm				

if ls_depositcode <> 'none' then

	SELECT dba.BRANCH.ID_BRANCH,   
			dba.BRANCH.ID_MAIN_BRANCH,   
			dba.DEPOSIT_CODES.ID_BANCO,   
			dba.DEPOSIT_CODES.ID_CUENTA_BANCO  
	 INTO :ls_idbranch,   
			:ls_idgroup,   
			:ls_idbanco,   
			:ls_idcuenta  
	 FROM dba.BRANCH,   
			dba.DEPOSIT_CODES  
	WHERE ( dba.DEPOSIT_CODES.ID_BRANCH = dba.BRANCH.ID_BRANCH ) and  
			( ( dba.DEPOSIT_CODES.DEPOSIT_CODE = :ls_depositcode ) )   ;
	
	
	dw_1.setitem(dw_1.getrow(),"id_banco",ls_idbanco)
	dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",ls_idcuenta)
	dw_1.setitem(dw_1.getrow(),"deposit_code",ls_depositcode)
	em_agent.text = ls_idbranch
	em_group.text = ls_idgroup
	
	dw_2.setitem(1,"id_group",ls_idgroup)
	
	//dw_3.Retrieve(relativedate(today(),-30),ls_idgroup)
	
end if

end event

type st_branch from statictext within w_ajuste_contable
integer x = 320
integer y = 44
integer width = 169
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Agent :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_agent from editmask within w_ajuste_contable
integer x = 494
integer y = 44
integer width = 297
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event losefocus;String	ls_branch, ls_grupo


ls_branch = em_agent.text


  SELECT dba.branch.id_main_branch  
    INTO :ls_grupo  
    FROM dba.branch  
   WHERE dba.branch.id_branch = :ls_branch   ;
	
	em_group.text = ls_grupo
	
	dw_2.setitem(1,"id_group",ls_grupo)
	
	//dw_3.Retrieve(relativedate(today(),-30),ls_grupo)
	
	
	if isnull(ls_grupo) or len(trim(ls_grupo)) < 1 then 
		st_branch.TextColor = RGB(255,0,0)
	else
		st_branch.TextColor = RGB(0,0,0)
	end if		

end event

type st_group from statictext within w_ajuste_contable
integer x = 795
integer y = 44
integer width = 192
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Group :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_group from editmask within w_ajuste_contable
integer x = 983
integer y = 44
integer width = 297
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;string	ls_grupo


ls_grupo = em_group.text

dw_2.setitem(1,"id_group",ls_grupo)
end event

type cb_5 from commandbutton within w_ajuste_contable
integer x = 1317
integer y = 44
integer width = 311
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select Fax"
end type

event clicked;//+++++++++++++++++++++++++++++++++++++++++++
// Abre el Fax Viewer y trae los parametros

String ls_return
//Openwithparm(w_faxviewer,em_agent.text)
Openwithparm(w_faxviewer,"")
ls_return = message.stringparm	

if ls_return = "-none-" then
	sle_selectedfax.text = "[No Fax Selected]"
	cb_faxviewer.enabled = false
else
	sle_selectedfax.text = fn_token(ls_return,"*",1)
	sle_completefaxpath.text = "u:\accounting\"+sle_selectedfax.text
	cb_faxviewer.enabled = true
end if

String ls_branch
Double ld_amount

ls_branch = trim(fn_token(ls_return,"*",2))
ld_amount = double(trim(fn_token(ls_return,"*",3)))

em_agent.text = ls_branch
em_agent.triggerevent(LoseFocus!)
	
dw_2.setitem(dw_2.getrow(),"credit",ld_amount)
//+++++++++++++++++++++++++++++++++++++++++++

	


end event

type sle_selectedfax from singlelineedit within w_ajuste_contable
integer x = 1637
integer y = 44
integer width = 699
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "[No Fax Selected]"
boolean autohscroll = false
boolean displayonly = true
end type

type cb_faxviewer from commandbutton within w_ajuste_contable
integer x = 2345
integer y = 44
integer width = 119
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "..."
end type

event clicked;if sle_selectedfax.text <> "[No Fax Selected]" then
	OpenWithParm(w_faxviewer_view,sle_completefaxpath.text)
end if
end event

type sle_completefaxpath from singlelineedit within w_ajuste_contable
boolean visible = false
integer x = 3136
integer y = 188
integer width = 507
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

