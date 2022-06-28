$PBExportHeader$w_cuenta_suspenso.srw
forward
global type w_cuenta_suspenso from Window
end type
type cb_3 from commandbutton within w_cuenta_suspenso
end type
type sle_desc_susp from singlelineedit within w_cuenta_suspenso
end type
type st_5 from statictext within w_cuenta_suspenso
end type
type st_4 from statictext within w_cuenta_suspenso
end type
type sle_desc from singlelineedit within w_cuenta_suspenso
end type
type sle_name_bank from singlelineedit within w_cuenta_suspenso
end type
type sle_account from singlelineedit within w_cuenta_suspenso
end type
type st_1 from statictext within w_cuenta_suspenso
end type
type sle_trans from singlelineedit within w_cuenta_suspenso
end type
type cb_bank from commandbutton within w_cuenta_suspenso
end type
type sle_bank from singlelineedit within w_cuenta_suspenso
end type
type st_3 from statictext within w_cuenta_suspenso
end type
type sle_credit from singlelineedit within w_cuenta_suspenso
end type
type cb_2 from commandbutton within w_cuenta_suspenso
end type
type cb_1 from commandbutton within w_cuenta_suspenso
end type
type sle_id_main_branch from singlelineedit within w_cuenta_suspenso
end type
type st_2 from statictext within w_cuenta_suspenso
end type
type dw_1 from datawindow within w_cuenta_suspenso
end type
end forward

global type w_cuenta_suspenso from Window
int X=5
int Y=12
int Width=3465
int Height=1572
boolean TitleBar=true
string Title="Suspense Account"
long BackColor=79741120
boolean ControlMenu=true
cb_3 cb_3
sle_desc_susp sle_desc_susp
st_5 st_5
st_4 st_4
sle_desc sle_desc
sle_name_bank sle_name_bank
sle_account sle_account
st_1 st_1
sle_trans sle_trans
cb_bank cb_bank
sle_bank sle_bank
st_3 st_3
sle_credit sle_credit
cb_2 cb_2
cb_1 cb_1
sle_id_main_branch sle_id_main_branch
st_2 st_2
dw_1 dw_1
end type
global w_cuenta_suspenso w_cuenta_suspenso

on w_cuenta_suspenso.create
this.cb_3=create cb_3
this.sle_desc_susp=create sle_desc_susp
this.st_5=create st_5
this.st_4=create st_4
this.sle_desc=create sle_desc
this.sle_name_bank=create sle_name_bank
this.sle_account=create sle_account
this.st_1=create st_1
this.sle_trans=create sle_trans
this.cb_bank=create cb_bank
this.sle_bank=create sle_bank
this.st_3=create st_3
this.sle_credit=create sle_credit
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_id_main_branch=create sle_id_main_branch
this.st_2=create st_2
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.sle_desc_susp,&
this.st_5,&
this.st_4,&
this.sle_desc,&
this.sle_name_bank,&
this.sle_account,&
this.st_1,&
this.sle_trans,&
this.cb_bank,&
this.sle_bank,&
this.st_3,&
this.sle_credit,&
this.cb_2,&
this.cb_1,&
this.sle_id_main_branch,&
this.st_2,&
this.dw_1}
end on

on w_cuenta_suspenso.destroy
destroy(this.cb_3)
destroy(this.sle_desc_susp)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_desc)
destroy(this.sle_name_bank)
destroy(this.sle_account)
destroy(this.st_1)
destroy(this.sle_trans)
destroy(this.cb_bank)
destroy(this.sle_bank)
destroy(this.st_3)
destroy(this.sle_credit)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_id_main_branch)
destroy(this.st_2)
destroy(this.dw_1)
end on

event open;dw_1.SetTransObject(SQLCA)
dw_1.retrieve()
end event

type cb_3 from commandbutton within w_cuenta_suspenso
int X=2318
int Y=12
int Width=256
int Height=188
int TabOrder=40
string Text="Print"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Printsetup()
dw_1.Print()
end event

type sle_desc_susp from singlelineedit within w_cuenta_suspenso
int X=3456
int Y=404
int Width=320
int Height=92
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_5 from statictext within w_cuenta_suspenso
int X=2866
int Y=116
int Width=247
int Height=76
boolean Enabled=false
string Text="Value"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_cuenta_suspenso
int X=2670
int Y=32
int Width=443
int Height=76
boolean Enabled=false
string Text="Transaction Nbr."
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_desc from singlelineedit within w_cuenta_suspenso
int X=1614
int Y=1488
int Width=247
int Height=92
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
long BackColor=80269524
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_name_bank from singlelineedit within w_cuenta_suspenso
int X=37
int Y=120
int Width=919
int Height=72
boolean Enabled=false
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
long BackColor=80269524
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_account from singlelineedit within w_cuenta_suspenso
int X=983
int Y=120
int Width=247
int Height=72
boolean Enabled=false
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
long BackColor=80269524
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_cuenta_suspenso
int X=983
int Y=40
int Width=247
int Height=76
boolean Enabled=false
string Text="Account"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_trans from singlelineedit within w_cuenta_suspenso
int X=3163
int Y=32
int Width=247
int Height=72
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
long BackColor=80269524
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_bank from commandbutton within w_cuenta_suspenso
int X=1243
int Y=144
int Width=146
int Height=48
int TabOrder=10
boolean Enabled=false
string Text="..."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_banco
double   lx, ly, lz

Open(w_seleccionar_cuenta_banco)

ls_banco = message.stringparm


FOR lx = 1 TO len(ls_banco)
	if mid(ls_banco,lx ,1)<>',' then
		sle_bank.text = mid(ls_banco,1, lx)
	else	
		exit
	end if	
NEXT
lz = lx + 1
FOR ly = (lx + 1) TO len(ls_banco)
	if mid(ls_banco,ly ,1)<>',' then
		sle_account.text = mid(ls_banco, lz, (ly - lx))
	else	
		exit
	end if	
NEXT
sle_name_bank.text = mid(ls_banco,(ly + 1),90)

sle_id_main_branch.setfocus()


end event

type sle_bank from singlelineedit within w_cuenta_suspenso
int X=1339
int Y=1488
int Width=247
int Height=72
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
long BackColor=80269524
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_cuenta_suspenso
int X=37
int Y=40
int Width=919
int Height=76
boolean Enabled=false
string Text="Bank"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_credit from singlelineedit within w_cuenta_suspenso
int X=3163
int Y=116
int Width=247
int Height=72
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
long BackColor=80269524
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_2 from commandbutton within w_cuenta_suspenso
int X=2025
int Y=12
int Width=256
int Height=188
int TabOrder=30
string Text="POST"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double ld_cons, ld_debito, ld_credito, ld_valor, ld_tran, ld_balance, ld_grupo
String ls_grupo, ls_banco, ls_cuenta, ls_name_group, ls_desc, ls_grupo1
string ls_desc_susp, ls_verifica
Date   ld_date

ls_verifica = 'YES'
ls_grupo = sle_id_main_branch.text
 
ld_grupo = 0 
SELECT count(dba.group_branch.id_main_branch)  INTO :ld_grupo  FROM dba.group_branch  WHERE dba.group_branch.id_main_branch = :ls_grupo   ;

if (isnull(ls_grupo) or ls_grupo='') or ld_grupo < 1 then
	ls_verifica = 'NO'
else	
	ls_verifica = 'YES'
end if

if ls_verifica <> 'YES' then
	return
end if

dw_1.accepttext()
ls_desc_susp = dw_1.getitemstring(dw_1.getrow(),"descripcion_suspense")
if dw_1.Update() = 1 then 
	commit;
end if

SELECT dba.group_branch.name_main_branch  
INTO :ls_name_group  
FROM dba.group_branch  
WHERE dba.group_branch.id_main_branch = :ls_grupo   ;

//ls_banco = sle_bank.text 
//ls_cuenta = sle_account.text
ld_valor = double(sle_credit.text)
ld_tran = double(sle_trans.text)
ls_desc = 'Post '+sle_desc.text
//ls_desc_susp = sle_desc_susp.text

//if ls_grupo='' or ls_banco='' or ls_cuenta='' then
//	MessageBox("Atention","Please Select Bank, Account and Group First",Exclamation!)
//	return
//end if	
//*****    Transaccion Consecutiva
SELECT max(dba.transaccion_diaria_payee.cons_trans_diaria)
INTO :ld_cons  
FROM dba.transaccion_diaria_payee  ;
ld_cons = ld_cons + 1

//***** Insertando el Debito en el Grupo Suspense
update dba.transaccion_diaria_payee set dba.transaccion_diaria_payee.des_trans_diaria = :ls_desc where dba.transaccion_diaria_payee.cons_trans_diaria = :ld_tran and dba.transaccion_diaria_payee.id_group_trans_diaria = '9999';
If Sqlca.sqlcode < 0 Then
	rollback ;	
else
   Commit;
End if

ld_date = today()

INSERT INTO dba.transaccion_diaria_payee  
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria,
			  descripcion_suspense)  
VALUES ( :ld_cons,'9999',:ld_date,GETDATE(),'SA','Post To '+:ls_name_group,:ld_valor,0,0,:ls_desc_susp)  ;

If Sqlca.sqlcode < 0 Then
	rollback ;	
else
   Commit;
End if

ls_grupo1 = '9999'
ld_balance = fn_balance_escalable(ls_grupo1,String(Today(),'mm-dd-yyyy'))
update dba.transaccion_diaria_payee set dba.transaccion_diaria_payee.balance_trans_diaria = :ld_balance where dba.transaccion_diaria_payee.cons_trans_diaria = :ld_cons and dba.transaccion_diaria_payee.id_group_trans_diaria = :ls_grupo1 ;
If Sqlca.sqlcode < 0 Then
	rollback ;	
else
   Commit;
End if

//INSERT INTO transaccion_diaria_banco_payee  
//         ( cons_trans_diaria,   
//           id_banco,   
//           id_cuenta_banco )  
//VALUES ( :ld_cons, '9999', '0000' )  ;

////***************** Posteo ******************************
//*****    Transaccion Consecutiva
SELECT max(dba.transaccion_diaria_payee.cons_trans_diaria)
INTO :ld_cons  
FROM dba.transaccion_diaria_payee  ;
ld_cons = ld_cons + 1

//***** Insertando el Credito en Cuenta Post
INSERT INTO dba.transaccion_diaria_payee  
         ( cons_trans_diaria,   
           id_group_trans_diaria,   
           date_trans_diaria,   
           hour_trans_diaria,   
           id_concepto_contable,   
           des_trans_diaria,   
           debit_trans_diaria,   
           credit_trans_diaria,   
           balance_trans_diaria,
			  descripcion_suspense)  
VALUES ( :ld_cons,:ls_grupo,:ld_date,GETDATE(),'SA','Post FROM SUSPENCE',0,:ld_valor,0,:ls_desc_susp)  ;
If Sqlca.sqlcode < 0 Then
	rollback ;	
else
   Commit;
End if

ld_balance = fn_balance_escalable(ls_grupo,String(Today(),'mm-dd-yyyy'))
ld_balance = round(ld_balance,2)

update dba.transaccion_diaria_payee set dba.transaccion_diaria_payee.balance_trans_diaria = :ld_balance where dba.transaccion_diaria_payee.cons_trans_diaria = :ld_cons and dba.transaccion_diaria_payee.id_group_trans_diaria = :ls_grupo ;
If Sqlca.sqlcode < 0 Then
	rollback ;	
else
   Commit;
End if

//INSERT INTO transaccion_diaria_banco_payee  
//         ( cons_trans_diaria,   
//           id_banco,   
//           id_cuenta_banco )  
//VALUES ( :ld_cons, :sle_bank.text, :sle_account.text )  ;

dw_1.retrieve()
end event

type cb_1 from commandbutton within w_cuenta_suspenso
int X=1829
int Y=156
int Width=146
int Height=48
int TabOrder=20
string Text="..."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_group

Open(w_seleccionar_grupo)

ls_group = message.stringparm

sle_id_main_branch.text = ls_group

sle_id_main_branch.setfocus()


end event

type sle_id_main_branch from singlelineedit within w_cuenta_suspenso
int X=1536
int Y=132
int Width=283
int Height=72
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_cuenta_suspenso
int X=1536
int Y=24
int Width=283
int Height=76
boolean Enabled=false
string Text="Post To"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_1 from datawindow within w_cuenta_suspenso
int X=41
int Y=220
int Width=3378
int Height=1224
int TabOrder=50
string DataObject="dw_cuenta_suspenso"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

event clicked;//string credito, trans, descr
//
//trans = string(dw_1.getitemnumber(dw_1.getrow(),"cons_trans_diaria"))
//credito = string(dw_1.getitemnumber(dw_1.getrow(),"credit_trans_diaria"))
//descr  = dw_1.getitemstring(dw_1.getrow(),"des_trans_diaria")
//sle_trans.text = trans
//sle_credit.text = credito
//sle_desc.text = descr
//******
if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
end if

end event

event doubleclicked;string credito, trans, descr, desc_susp
//
//trans = string(dw_1.getitemnumber(dw_1.getrow(),"cons_trans_diaria"))
//credito = string(dw_1.getitemnumber(dw_1.getrow(),"credit_trans_diaria"))
//descr  = dw_1.getitemstring(dw_1.getrow(),"des_trans_diaria")
//sle_trans.text = trans
//sle_credit.text = credito
//sle_desc.text = descr
//******
long		ll_row
double	ld_receiver
string	ls_branch

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	trans = string(dw_1.getitemnumber(dw_1.getrow(),"cons_trans_diaria"))
	credito = string(dw_1.getitemnumber(dw_1.getrow(),"credit_trans_diaria"))
	descr  = dw_1.getitemstring(dw_1.getrow(),"des_trans_diaria")
	desc_susp = dw_1.getitemstring(dw_1.getrow(),"descripcion_suspense")
	sle_trans.text = trans
	sle_credit.text = credito
	sle_desc.text = descr
	sle_desc_susp.text = desc_susp
end if
end event

event rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, TRUE)
SetRow(currentrow)
end event

