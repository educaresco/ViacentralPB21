$PBExportHeader$w_rep_perdidos_closing_contable_payee.srw
forward
global type w_rep_perdidos_closing_contable_payee from wb_report_fechas
end type
type cb_1 from commandbutton within w_rep_perdidos_closing_contable_payee
end type
type sle_grupo from singlelineedit within w_rep_perdidos_closing_contable_payee
end type
type st_grupo from statictext within w_rep_perdidos_closing_contable_payee
end type
type cb_2 from commandbutton within w_rep_perdidos_closing_contable_payee
end type
type st_3 from statictext within w_rep_perdidos_closing_contable_payee
end type
end forward

global type w_rep_perdidos_closing_contable_payee from wb_report_fechas
int Width=3547
int Height=2456
boolean TitleBar=true
string Title="Giros Dobles Closing Payee"
long BackColor=80269524
cb_1 cb_1
sle_grupo sle_grupo
st_grupo st_grupo
cb_2 cb_2
st_3 st_3
end type
global w_rep_perdidos_closing_contable_payee w_rep_perdidos_closing_contable_payee

on w_rep_perdidos_closing_contable_payee.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_grupo=create sle_grupo
this.st_grupo=create st_grupo
this.cb_2=create cb_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_grupo
this.Control[iCurrent+3]=this.st_grupo
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.st_3
end on

on w_rep_perdidos_closing_contable_payee.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.sle_grupo)
destroy(this.st_grupo)
destroy(this.cb_2)
destroy(this.st_3)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_perdidos_closing_contable_payee
int Y=140
int Width=3502
int Height=2136
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_rep_perdidos_closing_contable_payee"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_perdidos_closing_contable_payee
int X=882
int Y=12
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_perdidos_closing_contable_payee
int X=517
int Y=12
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_perdidos_closing_contable_payee
int X=1285
int Y=20
int Width=293
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_perdidos_closing_contable_payee
int X=1577
int Y=20
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type cb_1 from commandbutton within w_rep_perdidos_closing_contable_payee
int X=2610
int Y=20
int Width=293
int Height=92
int TabOrder=40
boolean BringToTop=true
string Text="Consultar"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_group


Open(w_seleccionar_grupo_pagador)

ls_group = message.stringparm

sle_grupo.text = ls_group

sle_grupo.setfocus()
end event

type sle_grupo from singlelineedit within w_rep_perdidos_closing_contable_payee
int X=2341
int Y=20
int Width=247
int Height=88
int TabOrder=30
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = Date(em_fecha2.text)

dw_1.retrieve(ld_Fecha1,ld_Fecha2,sle_grupo.text)

dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

type st_grupo from statictext within w_rep_perdidos_closing_contable_payee
int X=1957
int Y=20
int Width=370
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Group Payee:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_2 from commandbutton within w_rep_perdidos_closing_contable_payee
int X=3067
int Y=20
int Width=325
int Height=92
int TabOrder=10
boolean BringToTop=true
string Text="Procesar"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string		ls_grupo, ls_branch, ls_flag
Double		ld_receiver, ld_amount, ld_comm
DateTime		ld_date, ld_payment_date
Long			ll_cont, ll_row,ld_ref

ls_grupo = sle_grupo.text

  DECLARE LOST CURSOR FOR 
  SELECT dba.RECEIVER.ID_BRANCH,   
         dba.RECEIVER.ID_RECEIVER,   
         dba.RECEIVER.DATE_RECEIVER,   
         dba.RECEIVER.NET_AMOUNT_RECEIVER,   
         dba.RECEIVER.COMMISSION_PAYEE,
			dba.RECEIVER.id_flag_receiver,
			dba.RECEIVER.REF_RECEIVER,
			dba.RECEIVER.PAYMENT_DATE 
    FROM dba.RECEIVER,   
         dba.BRANCH  
   WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and 
			( dba.RECEIVER.REF_RECEIVER  > 0 ) AND
         ( ( dba.BRANCH.ID_MAIN_BRANCH = :ls_grupo ) ) order by  dba.BRANCH.ID_BRANCH ASC  ;
				
	OPEN LOST ;
	FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref, :ld_payment_date ;
	DO WHILE SQLCA.SQLCODE = 0
			st_3.text = trim(ls_branch)+'-'+string(ld_receiver)
			ll_cont = 0
		
		   SELECT count(*)  
    		INTO :ll_cont  
    		FROM dba.RELACION_INVOICES_PAYEE  
   		WHERE ( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE in ('CPC','TP','CP') ) AND  
         		( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch ) AND  
         		( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver )   ;

			if ll_cont > 1 and ls_flag <> 'A' then
				ll_row = dw_1.insertrow(0)
				dw_1.setitem(ll_row,"id_branch",ls_branch )
				dw_1.setitem(ll_row,"id_receiver",ld_receiver)
				dw_1.setitem(ll_row,"id_flag_receiver",ls_flag)
				dw_1.setitem(ll_row,"net_amount_receiver",ld_amount)
				dw_1.setitem(ll_row,"receiver_commission_payee",ld_comm)
				dw_1.setitem(ll_row,"date_receiver",ld_date)
				dw_1.setitem(ll_row,"ref_receiver",ld_ref)
				dw_1.setitem(ll_row,"payment_date",ld_payment_date)
				
				
			end if

		FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref , :ld_payment_date ;
	LOOP
	CLOSE LOST ;
		
			

end event

type st_3 from statictext within w_rep_perdidos_closing_contable_payee
int X=14
int Y=20
int Width=338
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
boolean FocusRectangle=false
long BackColor=65535
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

