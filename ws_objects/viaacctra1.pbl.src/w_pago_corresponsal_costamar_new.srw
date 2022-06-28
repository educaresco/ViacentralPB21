$PBExportHeader$w_pago_corresponsal_costamar_new.srw
forward
global type w_pago_corresponsal_costamar_new from wb_response
end type
type dw_1 from datawindow within w_pago_corresponsal_costamar_new
end type
type dw_2 from datawindow within w_pago_corresponsal_costamar_new
end type
type cb_1 from commandbutton within w_pago_corresponsal_costamar_new
end type
type em_date from editmask within w_pago_corresponsal_costamar_new
end type
type st_1 from statictext within w_pago_corresponsal_costamar_new
end type
type cb_2 from commandbutton within w_pago_corresponsal_costamar_new
end type
type cb_3 from commandbutton within w_pago_corresponsal_costamar_new
end type
type dw_3 from datawindow within w_pago_corresponsal_costamar_new
end type
type em_from from editmask within w_pago_corresponsal_costamar_new
end type
type em_to from editmask within w_pago_corresponsal_costamar_new
end type
type st_2 from statictext within w_pago_corresponsal_costamar_new
end type
type st_3 from statictext within w_pago_corresponsal_costamar_new
end type
type dw_choise from datawindow within w_pago_corresponsal_costamar_new
end type
type cb_4 from commandbutton within w_pago_corresponsal_costamar_new
end type
type em_group from editmask within w_pago_corresponsal_costamar_new
end type
type st_4 from statictext within w_pago_corresponsal_costamar_new
end type
type cb_5 from commandbutton within w_pago_corresponsal_costamar_new
end type
type st_6 from statictext within w_pago_corresponsal_costamar_new
end type
type em_ajuste from editmask within w_pago_corresponsal_costamar_new
end type
type cb_salvar from commandbutton within w_pago_corresponsal_costamar_new
end type
type cb_continue from commandbutton within w_pago_corresponsal_costamar_new
end type
type dw_5 from datawindow within w_pago_corresponsal_costamar_new
end type
end forward

global type w_pago_corresponsal_costamar_new from wb_response
int X=293
int Y=212
int Width=3547
int Height=2216
boolean Visible=false
boolean TitleBar=true
string Title="Pay Payees"
long BackColor=80269524
dw_1 dw_1
dw_2 dw_2
cb_1 cb_1
em_date em_date
st_1 st_1
cb_2 cb_2
cb_3 cb_3
dw_3 dw_3
em_from em_from
em_to em_to
st_2 st_2
st_3 st_3
dw_choise dw_choise
cb_4 cb_4
em_group em_group
st_4 st_4
cb_5 cb_5
st_6 st_6
em_ajuste em_ajuste
cb_salvar cb_salvar
cb_continue cb_continue
dw_5 dw_5
end type
global w_pago_corresponsal_costamar_new w_pago_corresponsal_costamar_new

type variables
long	il_row = 0
String	is_group =""
end variables

on w_pago_corresponsal_costamar_new.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_2=create dw_2
this.cb_1=create cb_1
this.em_date=create em_date
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.dw_3=create dw_3
this.em_from=create em_from
this.em_to=create em_to
this.st_2=create st_2
this.st_3=create st_3
this.dw_choise=create dw_choise
this.cb_4=create cb_4
this.em_group=create em_group
this.st_4=create st_4
this.cb_5=create cb_5
this.st_6=create st_6
this.em_ajuste=create em_ajuste
this.cb_salvar=create cb_salvar
this.cb_continue=create cb_continue
this.dw_5=create dw_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.em_date
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.em_from
this.Control[iCurrent+10]=this.em_to
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.dw_choise
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.em_group
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.st_6
this.Control[iCurrent+19]=this.em_ajuste
this.Control[iCurrent+20]=this.cb_salvar
this.Control[iCurrent+21]=this.cb_continue
this.Control[iCurrent+22]=this.dw_5
end on

on w_pago_corresponsal_costamar_new.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.em_from)
destroy(this.em_to)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_choise)
destroy(this.cb_4)
destroy(this.em_group)
destroy(this.st_4)
destroy(this.cb_5)
destroy(this.st_6)
destroy(this.em_ajuste)
destroy(this.cb_salvar)
destroy(this.cb_continue)
destroy(this.dw_5)
end on

event open;call super::open;
X=1
Y=1
Show()

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_choise.settransobject(sqlca)

em_from.text = string(RelativeDate(TODAY(), -1))
em_to.text = string(today())


dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)


Double	ld_cons


		SELECT Max(cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM "transaccion_diaria_payee"  ;
		
		if isnull(ld_cons) then ld_cons = 1
		
		
		
dw_1.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"cons",ld_cons)


end event

event pfc_close;call super::pfc_close;dw_1.reset()
dw_2.reset()
dw_3.reset()


end event

event close;call super::close;dw_1.reset()
dw_2.reset()
dw_3.reset()


end event

type dw_1 from datawindow within w_pago_corresponsal_costamar_new
int X=23
int Y=120
int Width=1778
int Height=200
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_selet_cuenta_pago_corresponsal"
boolean Border=false
boolean LiveScroll=true
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

type dw_2 from datawindow within w_pago_corresponsal_costamar_new
int X=9
int Y=292
int Width=3401
int Height=348
int TabOrder=60
boolean BringToTop=true
string DataObject="dw_pago_corresponsal_seleccionado"
boolean Border=false
boolean LiveScroll=true
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

type cb_1 from commandbutton within w_pago_corresponsal_costamar_new
int X=1833
int Y=88
int Width=1289
int Height=80
int TabOrder=160
boolean BringToTop=true
string Text="New Pay"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
em_ajuste.TEXT = string(0)
dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_choise.reset()


Double	ld_cons

		SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		
		if isnull(ld_cons) then ld_cons = 1
	
dw_1.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"link_reference",0)



end event

type em_date from editmask within w_pago_corresponsal_costamar_new
int X=32
int Y=1636
int Width=343
int Height=96
int TabOrder=120
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_pago_corresponsal_costamar_new
int X=37
int Y=1580
int Width=247
int Height=56
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string Text="Date Since"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_2 from commandbutton within w_pago_corresponsal_costamar_new
int X=393
int Y=1640
int Width=357
int Height=96
int TabOrder=140
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string Text="&Info. Wire"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF IsNull(dw_2.Object.id_group[dw_2.GetRow()]) OR dw_2.Object.id_group[dw_2.GetRow()]='' THEN
	MessageBox('Atention','You have to choose a group and then press Info. Savings.')
	Return
END IF

dw_3.Retrieve(Date(em_date.text),dw_2.Object.id_group[dw_2.GetRow()])
end event

type cb_3 from commandbutton within w_pago_corresponsal_costamar_new
int X=750
int Y=1640
int Width=357
int Height=96
int TabOrder=150
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string Text="&Print"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;PRINTSETUP()
dw_3.PRINT()
end event

type dw_3 from datawindow within w_pago_corresponsal_costamar_new
int X=23
int Y=680
int Width=2702
int Height=912
int TabOrder=90
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string DataObject="dw_rep_wire_transfer"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

type em_from from editmask within w_pago_corresponsal_costamar_new
int X=677
int Y=16
int Width=311
int Height=88
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_to from editmask within w_pago_corresponsal_costamar_new
int X=1111
int Y=16
int Width=329
int Height=88
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_pago_corresponsal_costamar_new
int X=498
int Y=16
int Width=183
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="From :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_pago_corresponsal_costamar_new
int X=997
int Y=16
int Width=105
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="To :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_choise from datawindow within w_pago_corresponsal_costamar_new
int Y=632
int Width=3515
int Height=1488
int TabOrder=130
boolean BringToTop=true
string DataObject="dw_invoices_pagados_new"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_4 from commandbutton within w_pago_corresponsal_costamar_new
int X=1449
int Y=20
int Width=334
int Height=80
int TabOrder=50
boolean BringToTop=true
string Text="Datos"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long	ll_cont

is_group = em_group.text

ll_cont = 0

  SELECT Count(*)  
    INTO :ll_cont  
    FROM dba.type_pay_group  
   WHERE ( dba.type_pay_group.id_group = :is_group ) AND  
         ( dba.type_pay_group.id_type_pay = 'C' )   ;


if ll_cont = 0 then
	messagebox("Warning","This payee is by Balance")
	Return
end if

il_row = dw_choise.retrieve(Date(em_from.text),Date(em_to.text),is_group)
end event

type em_group from editmask within w_pago_corresponsal_costamar_new
int X=197
int Y=16
int Width=288
int Height=88
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="!!!!"
MaskDataType MaskDataType=StringMask!
boolean AutoSkip=true
long TextColor=33554432
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_pago_corresponsal_costamar_new
int X=9
int Y=12
int Width=183
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Payee :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_5 from commandbutton within w_pago_corresponsal_costamar_new
int X=1833
int Y=4
int Width=1289
int Height=80
int TabOrder=80
boolean BringToTop=true
string Text="Process"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_total = 0,				&
			ld_amount = 0,				&
			ld_diferencia = 0,		&
			ld_comision = 0,			&
			ld_transferencia = 0
			
string	ls_status = 'U'			
			
Long		ll_i = 1

IF il_row = 0 then Return

FOR ll_i = 1 TO il_row
	
	
	ls_status = 'U'
	ls_status = dw_choise.getitemstring(ll_i,"receiver_status_pago_payee")
	
	IF ls_status = 'U' THEN
		ld_amount     = dw_choise.getitemnumber(ll_i,"net_amount_receiver")
		ld_diferencia = dw_choise.getitemnumber(ll_i,"receiver_total_diference")
		ld_comision   = dw_choise.getitemnumber(ll_i,"receiver_commission_payee")
		ld_total      = ld_amount + ld_comision - ld_diferencia
		ld_transferencia = ld_transferencia + ld_total
	END IF
	
NEXT

dw_2.setitem(dw_2.getrow(),"id_group",is_group)
dw_2.setitem(dw_2.getrow(),"debit",ld_transferencia)
dw_2.setitem(dw_2.getrow(),"description",'WIRE TRANSFER ')











end event

type st_6 from statictext within w_pago_corresponsal_costamar_new
int X=3081
int Y=448
int Width=393
int Height=64
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text="Adjust"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_ajuste from editmask within w_pago_corresponsal_costamar_new
int X=3081
int Y=528
int Width=407
int Height=76
int TabOrder=170
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="####,###.00"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_salvar from commandbutton within w_pago_corresponsal_costamar_new
int X=1833
int Y=256
int Width=1289
int Height=80
int TabOrder=110
boolean BringToTop=true
string Text="Save pay"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_cons, ld_deposito, 	&
			ld_balance = 0, 			&
			ld_disponible = 0, 		&
			ld_deposito1, 				&
			ld_referencia = 0, ld_link_reference = 0, ld_ajuste = 0, ld_cons1 = 0
			
			
string	ls_account, ls_group, ls_banco

Long		ll_i = 1



DATE	ld_hoy,ld_date
LONG	ll_dias


dw_2.accepttext()
ld_hoy  = Today()
ld_date = dw_2.getitemdate(dw_2.getrow(),"date")


ll_dias = ABS(DaysAfter ( ld_hoy,ld_date ))

IF ll_dias > 60 Then
	MESSAGEBOX('ERROR','VERIFIQUE LA FECHA')
	RETURN
End if




ld_link_reference = 0
ld_ajuste = 0

ls_banco      = dw_1.getitemstring(dw_1.getrow(),"id_banco")
ls_account    = dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")
ls_group      = dw_2.getitemstring(dw_2.getrow(),"id_group")
ld_deposito   =  dw_2.getitemnumber(dw_2.getrow(),"debit")
ld_deposito1  =  dw_2.getitemnumber(dw_2.getrow(),"debit")

ld_date      =   dw_2.getitemdate(dw_2.getrow(),"date")



if ld_deposito <= 0 then
	Messagebox("Error","Tansfer Less than 0 ")
	return
end if

COMMIT ;

  SELECT dba.group_branch.debit_group  
    INTO :ld_disponible  
    FROM dba.group_branch  
   WHERE dba.group_branch.id_main_branch = :ls_group   ;

	if ISNULL(ld_disponible) then ld_disponible = 0
	
	ld_disponible = 0 //POR AHORA, LUEGO SE UTILIZARA
		
	ld_deposito = ld_deposito + ld_disponible

if isnull(ls_account) or ls_account = '' then
	Messagebox("Error","You have to choise the account")
	return
end if

		SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		
		if isnull(ld_cons) then ld_cons = 1
		
string	ls_tipo_pago = "", ls_status, ls_branch

Double	ld_vlr_total_pagar = 0,	&
			ld_receiver,		 		&
			ld_amount = 0, 			&
			ld_comision = 0, 			&
			ld_pagado = 0,				&
			ld_pendiente = 0, 		&
			ld_cambio = 0,				&
			ld_total = 0
	
FOR ll_i = 1 TO il_row
	
	ls_status = 'U'
	ls_status = dw_choise.getitemstring(ll_i,"receiver_status_pago_payee")
	
	IF ls_status = 'U' THEN
		
		ls_branch	   = dw_choise.getitemstring(ll_i,"id_branch")
		ld_receiver    = dw_choise.getitemnumber(ll_i,"id_receiver")
		ld_referencia  = dw_choise.getitemnumber(ll_i,"ref_receiver")
		ld_amount      = dw_choise.getitemnumber(ll_i,"net_amount_receiver")
		ld_cambio      = dw_choise.getitemnumber(ll_i,"receiver_total_diference")
		ld_comision    = dw_choise.getitemnumber(ll_i,"receiver_commission_payee")
		ld_total       = ld_amount + ld_comision - ld_cambio
				
	   		INSERT INTO dba.relacion_pago_confirmacion  
         	( cons_trans_diaria,id_main_branch,id_branch,id_receiver,vlr_total,vlr_pagado )  
  				VALUES ( :ld_cons,:ls_group,:ls_branch,:ld_receiver,:ld_total,:ld_total )  ;

				UPDATE dba.receiver  
     			SET dba.receiver.status_pago_payee = 'P'  
   			WHERE ( receiver.id_branch = :ls_branch     )   AND  
         		   ( receiver.id_receiver = :ld_receiver )   AND
						( receiver.ref_receiver = :ld_referencia )	;
					
				ld_deposito = ld_deposito - ld_total	

	END IF
	
	NEXT
	
/////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	ld_balance = fn_balance_escalable(ls_group,String(Today(),'mm-dd-yyyy'))		
	ld_balance = ld_balance + ld_deposito1
	
	if ld_deposito <> 0 then
		Messagebox("Saldo Pendiente","Tiene un Saldo a favor de :"+string(ld_deposito))
	end if

	 UPDATE dba.group_branch  
      SET dba.group_branch.debit_group = :ld_deposito  
    WHERE dba.group_branch.id_main_branch = :ls_group   ;



ld_link_reference = dw_2.getitemnumber(dw_2.getrow(),"link_reference")

if Isnull(ld_link_reference) or ld_link_reference = 0 then
	ld_link_reference = ld_cons
end if

dw_1.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"balance",ld_balance)
dw_2.setitem(1,"link_reference",ld_link_reference)
dw_2.accepttext()


IF dw_2.update()=1 THEN
	IF dw_1.update()=1 THEN
		dw_1.enabled = False
		dw_2.enabled = False
		
		COMMIT ;
		Messagebox("Pay to Payee","Pay is Done")
		
		ld_ajuste = Double(em_ajuste.text)
		
		if ld_ajuste > 0 then
	
			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       	INTO :ld_cons1  
       	FROM dba.transaccion_diaria_payee  ;
			
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
           		descripcion_suspense,   
           		link_reference )  
 		 		VALUES ( :ld_cons1,   
           				:ls_group,   
           				:ld_date,   
           				GETDATE(),   
           				'AC',   
           				' ADJUST',   
           				:ld_ajuste,   
           				0,   
           				0,   
           				'',   
           				:ld_link_reference )  ;

					commit ;
					
					  INSERT INTO dba.transaccion_diaria_banco_payee  
         			( cons_trans_diaria,   
           				id_banco,   
           				id_cuenta_banco )  
  						VALUES ( :ld_cons1,   
           						:ls_banco,   
          					 :ls_account )  ;

						if sqlca.sqlcode <> 0 then
							Messagebox('','SQL Error')
						end if
					
										commit ;
			
			
		end if
		
		if ld_ajuste < 0 then
			
			ld_ajuste = abs(ld_ajuste)
			
			SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       	INTO :ld_cons1  
       	FROM dba.transaccion_diaria_payee  ;
			
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
           		descripcion_suspense,   
           		link_reference )  
 		 		VALUES ( :ld_cons1,   
           				:ls_group,   
           				:ld_date,   
           				GETDATE(),   
           				'AC',   
           				' ADJUST',   
           				0,   
           				:ld_ajuste,   
           				0,   
           				'',   
           				:ld_link_reference )  ;

					commit ;
			
			
					  INSERT INTO dba.transaccion_diaria_banco_payee  
         			( cons_trans_diaria,   
           				id_banco,   
           				id_cuenta_banco )  
  						VALUES ( :ld_cons1,   
           						:ls_banco,   
          					 :ls_account )  ;

						if sqlca.sqlcode <> 0 then
							Messagebox('','SQL Error')
						end if

						commit ;
			
			
		end if
		
		
				////////  meter en el master el deposito real
				Double	ld_deposito_master,		&
							ld_credit_master, 		&
							ld_debit_master, 			&
							ld_total_master, 			&
							ld_cons_master
							
				Date		ld_date_master 
				Time		lt_time_master
				Datetime ld_date_time_master
				String	ls_banco_master, 		&
							ls_group_master,		&
							ls_account_master,	&
							ls_description,		&
							ls_concepto_master

					ld_cons_master 		= dw_2.getitemnumber(dw_2.getrow(),"cons")
					ls_banco_master      = dw_1.getitemstring(dw_1.getrow(),"id_banco")
					ls_account_master 	= dw_1.getitemstring(dw_1.getrow(),"id_cuenta_banco")
					ls_group_master 		= dw_2.getitemstring(dw_2.getrow(),"id_group")
					ld_credit_master     = 0
					ld_debit_master      = dw_2.getitemnumber(dw_2.getrow(),"debit")
					ld_date_master      	= dw_2.getitemdate(dw_2.getrow(),"date")
					lt_time_master     	= dw_2.getitemtime(dw_2.getrow(),"hour")
					ls_description			= dw_2.getitemstring(dw_2.getrow(),"description")
					ls_concepto_master   = dw_2.getitemstring(dw_2.getrow(),"concepto")
					ld_total_master      = ld_debit_master
					ld_date_time_master  = datetime(ld_date_master,lt_time_master)
					
					if ld_ajuste	> 0 then
						ld_total_master = ld_total_master   - ld_ajuste
					else
						ld_total_master = ld_total_master   + ld_ajuste
					end if
					
					INSERT INTO dba.transaccion_diaria_payee_master  
         			( cons_trans_diaria,   
           				id_group_trans_diaria,   
           				date_trans_diaria,   
           				hour_trans_diaria,   
           				id_concepto_contable,   
           				des_trans_diaria,   
           				debit_trans_diaria,   
           				credit_trans_diaria,   
           				ajuste_trans_diaria, 
							total_trans_diaria,
           				descripcion_suspense,   
           				link_reference )  
  					VALUES ( :ld_cons_master ,   
           					:ls_group_master,   
           					:ld_date_time_master,   
           					:ld_date_time_master,   
           					:ls_concepto_master,   
           					:ls_description,   
           					:ld_debit_master,   
           					0, 
								:ld_ajuste,  
           					:ld_total_master,   
           					'',   
           					:ld_link_reference )  ;
								  
								 commit ; 
		
	ELSE
		Rollback ;
		Return
	END IF
ELSE
	Rollback ;
	Return
END IF




	
		
		
end event

type cb_continue from commandbutton within w_pago_corresponsal_costamar_new
int X=1833
int Y=172
int Width=1289
int Height=80
int TabOrder=70
boolean BringToTop=true
string Text="Continue"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Double	ld_link_reference

ld_link_reference = dw_2.getitemnumber(dw_2.getrow(),"link_reference")

em_ajuste.TEXT = string(0)
dw_1.reset()
dw_2.reset()
dw_1.enabled = True
dw_2.enabled = True
dw_1.insertrow(0)
dw_2.insertrow(0)
dw_choise.reset()


Double	ld_cons

		SELECT Max(dba.transaccion_diaria_payee.cons_trans_diaria) + 1  
       INTO :ld_cons  
       FROM dba.transaccion_diaria_payee  ;
		
		if isnull(ld_cons) then ld_cons = 1
	
dw_1.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"cons",ld_cons)
dw_2.setitem(1,"link_reference",ld_link_reference)
dw_2.accepttext()



end event

type dw_5 from datawindow within w_pago_corresponsal_costamar_new
int X=3543
int Y=1568
int Width=686
int Height=500
int TabOrder=100
boolean Visible=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

