$PBExportHeader$w_giros_fuera_closing_pagador.srw
forward
global type w_giros_fuera_closing_pagador from wb_report_fechas
end type
type cb_1 from commandbutton within w_giros_fuera_closing_pagador
end type
type sle_grupo from singlelineedit within w_giros_fuera_closing_pagador
end type
type st_grupo from statictext within w_giros_fuera_closing_pagador
end type
type cb_2 from commandbutton within w_giros_fuera_closing_pagador
end type
type st_3 from statictext within w_giros_fuera_closing_pagador
end type
type cb_all from commandbutton within w_giros_fuera_closing_pagador
end type
end forward

global type w_giros_fuera_closing_pagador from wb_report_fechas
int Width=3963
int Height=2456
boolean TitleBar=true
string Title="Giros fuera del closing Pagador"
long BackColor=80269524
cb_1 cb_1
sle_grupo sle_grupo
st_grupo st_grupo
cb_2 cb_2
st_3 st_3
cb_all cb_all
end type
global w_giros_fuera_closing_pagador w_giros_fuera_closing_pagador

on w_giros_fuera_closing_pagador.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_grupo=create sle_grupo
this.st_grupo=create st_grupo
this.cb_2=create cb_2
this.st_3=create st_3
this.cb_all=create cb_all
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_grupo
this.Control[iCurrent+3]=this.st_grupo
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.cb_all
end on

on w_giros_fuera_closing_pagador.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.sle_grupo)
destroy(this.st_grupo)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.cb_all)
end on

type dw_1 from wb_report_fechas`dw_1 within w_giros_fuera_closing_pagador
int Y=120
int Width=3909
int Height=2136
int TabOrder=60
boolean BringToTop=true
string DataObject="w_giros_fuera_closing_pagador"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_giros_fuera_closing_pagador
int X=882
int Y=12
boolean Visible=false
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_giros_fuera_closing_pagador
int X=517
int Y=12
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_giros_fuera_closing_pagador
int X=1285
int Y=20
int Width=293
boolean Visible=false
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_giros_fuera_closing_pagador
int X=1577
int Y=20
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type cb_1 from commandbutton within w_giros_fuera_closing_pagador
int X=1861
int Y=12
int Width=293
int Height=92
int TabOrder=50
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


Open(w_seleccionar_grupo_Pagador)

ls_group = message.stringparm

sle_grupo.text = ls_group

sle_grupo.setfocus()
end event

type sle_grupo from singlelineedit within w_giros_fuera_closing_pagador
int X=1605
int Y=12
int Width=247
int Height=88
int TabOrder=40
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

//dw_1.retrieve(ld_Fecha1,ld_Fecha2,'%'+sle_grupo.text+'%')

dw_1.setfocus()


Setpointer(Hourglass!)


Setpointer(Arrow!)
end event

type st_grupo from statictext within w_giros_fuera_closing_pagador
int X=1385
int Y=16
int Width=210
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Group :"
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

type cb_2 from commandbutton within w_giros_fuera_closing_pagador
int X=2167
int Y=12
int Width=247
int Height=92
int TabOrder=20
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
DateTime		ld_date, ld_payment_date, LD_DATE_TRANS_PAYEE, ld_hoy
Long			ll_cont, ll_row,ld_ref

ls_grupo = sle_grupo.text
ld_hoy   = datetime(today(),time('00:00:00'))

dw_1.reset()

  DECLARE LOST CURSOR FOR 
  SELECT dba.RECEIVER.ID_BRANCH,   
         dba.RECEIVER.ID_RECEIVER,   
         dba.RECEIVER.DATE_RECEIVER,   
         dba.RECEIVER.NET_AMOUNT_RECEIVER,   
         dba.RECEIVER.COMMISSION_PAYEE,
			dba.RECEIVER.id_flag_receiver,
			dba.RECEIVER.REF_RECEIVER,
			dba.RECEIVER.PAYMENT_DATE,
			dba.RECEIVER.DATE_TRANS_PAYEE
    FROM dba.RECEIVER,   
         dba.BRANCH  
   WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and 
			( dba.RECEIVER.DATE_RECEIVER  >= '2004-01-01 00:00:00' ) AND
			( dba.RECEIVER.DATE_RECEIVER  < :ld_hoy ) AND
			( dba.RECEIVER.REF_RECEIVER  > 0 ) AND
         ( ( dba.BRANCH.ID_MAIN_BRANCH = :ls_grupo ) ) order by  dba.BRANCH.ID_BRANCH ASC  ;
				
	OPEN LOST ;
	FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref, :ld_payment_date, :LD_DATE_TRANS_PAYEE ;
	DO WHILE SQLCA.SQLCODE = 0
			st_3.text = trim(ls_branch)+'-'+string(ld_receiver)
			ll_cont = 0
		
		   SELECT count(*)  
    		INTO :ll_cont  
    		FROM dba.RELACION_INVOICES_PAYEE  
   		WHERE ( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE in ('TP','CP') ) AND  
         		( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch ) AND  
         		( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver )   ;

			if ll_cont = 0 then
				ll_row = dw_1.insertrow(0)
				dw_1.setitem(ll_row,"id_branch",ls_branch )
				dw_1.setitem(ll_row,"id_receiver",ld_receiver)
				dw_1.setitem(ll_row,"id_flag_receiver",ls_flag)
				dw_1.setitem(ll_row,"net_amount_receiver",ld_amount)
				dw_1.setitem(ll_row,"receiver_commission_payee",ld_comm)
				dw_1.setitem(ll_row,"date_receiver",ld_date)
				dw_1.setitem(ll_row,"ref_receiver",ld_ref)
				dw_1.setitem(ll_row,"payment_date",ld_payment_date)
				dw_1.setitem(ll_row,"date_trans_payee",LD_DATE_TRANS_PAYEE)
				
				
				
			end if

		FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref , :ld_payment_date, :LD_DATE_TRANS_PAYEE ;
	LOOP
	CLOSE LOST ;
		
			

end event

type st_3 from statictext within w_giros_fuera_closing_pagador
int Y=4
int Width=466
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

type cb_all from commandbutton within w_giros_fuera_closing_pagador
int X=2423
int Y=12
int Width=247
int Height=92
int TabOrder=50
boolean BringToTop=true
string Text="All"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string		ls_grupo, ls_branch, ls_flag
Double		ld_receiver, ld_amount, ld_comm
DateTime		ld_date, ld_payment_date, LD_DATE_TRANS_PAYEE, ld_hoy
Long			ll_cont, ll_row,ld_ref

ls_grupo = sle_grupo.text
ld_hoy   = datetime(today(),time('00:00:00'))

dw_1.reset()

  DECLARE LOST CURSOR FOR 
  SELECT dba.RECEIVER.ID_BRANCH,   
         dba.RECEIVER.ID_RECEIVER,   
         dba.RECEIVER.DATE_RECEIVER,   
         dba.RECEIVER.NET_AMOUNT_RECEIVER,   
         dba.RECEIVER.COMMISSION_PAYEE,
			dba.RECEIVER.id_flag_receiver,
			dba.RECEIVER.REF_RECEIVER,
			dba.RECEIVER.PAYMENT_DATE,
			dba.RECEIVER.DATE_TRANS_PAYEE
    FROM dba.RECEIVER,   
         dba.BRANCH  
   WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and 
			( dba.RECEIVER.DATE_RECEIVER  >= '2004-01-01 00:00:00' ) AND
			( dba.RECEIVER.DATE_RECEIVER  < :ld_hoy ) AND
			( dba.RECEIVER.id_flag_receiver <> 'A' ) AND 
			( dba.RECEIVER.id_flag_receiver <> 'H' ) AND 
			( dba.RECEIVER.NET_AMOUNT_RECEIVER  <> 0 ) AND
			( dba.RECEIVER.REF_RECEIVER  > 0 )  order by  dba.BRANCH.ID_BRANCH ASC  ;
				
	OPEN LOST ;
	FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref, :ld_payment_date, :LD_DATE_TRANS_PAYEE ;
	DO WHILE SQLCA.SQLCODE = 0
			st_3.text = trim(ls_branch)+'-'+string(ld_receiver)
			ll_cont = 0
		
		   SELECT count(*)  
    		INTO :ll_cont  
    		FROM dba.RELACION_INVOICES_PAYEE  
   		WHERE ( dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE in ('TP','CP') ) AND  
         		( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch ) AND  
         		( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver )   ;

			if ll_cont = 0 then
				ll_row = dw_1.insertrow(0)
				dw_1.setitem(ll_row,"id_branch",ls_branch )
				dw_1.setitem(ll_row,"id_receiver",ld_receiver)
				dw_1.setitem(ll_row,"id_flag_receiver",ls_flag)
				dw_1.setitem(ll_row,"net_amount_receiver",ld_amount)
				dw_1.setitem(ll_row,"receiver_commission_payee",ld_comm)
				dw_1.setitem(ll_row,"date_receiver",ld_date)
				dw_1.setitem(ll_row,"ref_receiver",ld_ref)
				dw_1.setitem(ll_row,"payment_date",ld_payment_date)
				dw_1.setitem(ll_row,"date_trans_payee",LD_DATE_TRANS_PAYEE)
				
				
				
			end if

		FETCH LOST INTO :ls_branch, :ld_receiver, :ld_date, :ld_amount,:ld_comm,:ls_flag,:ld_ref , :ld_payment_date, :LD_DATE_TRANS_PAYEE ;
	LOOP
	CLOSE LOST ;
		
			

end event

