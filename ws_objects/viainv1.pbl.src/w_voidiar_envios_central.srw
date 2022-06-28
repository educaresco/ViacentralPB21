$PBExportHeader$w_voidiar_envios_central.srw
forward
global type w_voidiar_envios_central from wb_response
end type
type dw_voidear_envios from datawindow within w_voidiar_envios_central
end type
type rb_1 from radiobutton within w_voidiar_envios_central
end type
type gb_1 from groupbox within w_voidiar_envios_central
end type
type rb_2 from radiobutton within w_voidiar_envios_central
end type
type rb_3 from radiobutton within w_voidiar_envios_central
end type
end forward

global type w_voidiar_envios_central from wb_response
integer width = 3003
integer height = 1816
string title = "Void an Order"
long backcolor = 82042848
dw_voidear_envios dw_voidear_envios
rb_1 rb_1
gb_1 gb_1
rb_2 rb_2
rb_3 rb_3
end type
global w_voidiar_envios_central w_voidiar_envios_central

on w_voidiar_envios_central.create
int iCurrent
call super::create
this.dw_voidear_envios=create dw_voidear_envios
this.rb_1=create rb_1
this.gb_1=create gb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_voidear_envios
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
end on

on w_voidiar_envios_central.destroy
call super::destroy
destroy(this.dw_voidear_envios)
destroy(this.rb_1)
destroy(this.gb_1)
destroy(this.rb_2)
destroy(this.rb_3)
end on

event open;call super::open;Datetime	ld_fecha1, ld_fecha2

ld_fecha1 = Datetime(today(),time('00:00:00')) 
ld_fecha2 = Datetime(today(),time('23:59:59')) 


if dw_voidear_envios.retrieve(ld_fecha1,ld_fecha2) = 0 then
	messagebox('Warning','No Voidable Orders Available')

end if
end event

type dw_voidear_envios from datawindow within w_voidiar_envios_central
integer x = 9
integer y = 24
integer width = 2971
integer height = 1544
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_voidear_envios_central"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SETTRANSobject(sqlca)
end event

event buttonclicked;String	ls_filename, ls_branch,	ls_grupo, ls_flag
Double	ld_receiver
long		ll_filenum, ll_cont = 0

Datetime	ld_fecha1,ld_fecha2, ld_fecha_envio, ld_hoy

ld_fecha1 = Datetime(today(),time('00:00:00')) 
ld_fecha2 = Datetime(today(),time('23:59:59')) 

ls_branch   = trim(dw_voidear_envios.getitemstring(row,"id_branch"))
ld_receiver = dw_voidear_envios.getitemnumber(row,"id_receiver")

SELECT count(*)  
  INTO :ll_cont  
  FROM dba.RELACION_INVOICES_PAYEE  
 WHERE ( dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE = :ls_branch) 
   AND ( dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = :ld_receiver );

if ll_cont  > 0 then
	Messagebox('Error','You have to Cancel , This Invoice is in Closing')
	return
end if

SELECT getdate()
  INTO :ld_hoy 
  FROM dba.dual;

SELECT dba.RECEIVER.DATE_RECEIVER  
  INTO :ld_fecha_envio  
  FROM dba.RECEIVER  
 WHERE ( dba.RECEIVER.ID_BRANCH = :ls_branch ) 
   AND ( dba.RECEIVER.ID_RECEIVER = :ld_receiver )   ;

if Date(ld_fecha_envio) <> Date(ld_hoy) then
	Messagebox('Error','This invoice cannot be voided because was already included in a closing, please try the cancel option',StopSign!)
	return
end if

if Messagebox("Confirmation","Do you want to Void the Invoice "+ls_branch+'-'+string(ld_receiver)+"?",Question!,YesNo!) = 2 then 
	return
end if

ls_flag = ''

SELECT dba.receiver.id_flag_receiver  
  INTO :ls_flag  
  FROM dba.receiver  
 WHERE (dba.receiver.id_branch = :ls_branch) 
   AND (dba.receiver.id_receiver = :ld_receiver) ;

if ls_flag <> 'I' and ls_flag <> 'H' then
	dw_voidear_envios.retrieve(ld_fecha1,ld_fecha2)
	Messagebox('Error','This invoice cannot be voided, the status changed.',StopSign!)
	Return
end if
	
INSERT INTO dba.history_invoice ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change)
	  VALUES (:ls_branch,:ld_receiver,:ls_flag,'A',:gs_cashier,getdate(),getdate());

UPDATE dba.receiver  
   SET dba.receiver.id_flag_receiver = 'A',   
		 dba.receiver.net_amount_receiver = 0,   
		 dba.receiver.rate_change_receiver = 0,   
		 dba.receiver.telex_receiver = 0,   
		 dba.receiver.exchange_receiver = 0,   
		 dba.receiver.handling_receiver = 0,   
		 dba.receiver.total_receiver = 0,   
		 dba.receiver.porc_comision_receiver = 0,   
		 dba.receiver.total_pay_receiver = 0,   
		 dba.receiver.exchange_company = 0,   
		 dba.receiver.telex_company = 0,   
		 dba.receiver.total_diference = 0, 
		 dba.receiver.fx_receiver = 0, 
		 dba.receiver.total_modo_pago = 0,
		 dba.receiver.total_modo_pago_comp = 0,
		 dba.receiver.fee_rate = 0
 WHERE (dba.receiver.id_branch = :ls_branch) 
   AND (dba.receiver.id_receiver = :ld_receiver);

if sqlca.sqlcode < 0 then
	Messagebox("Warning","Error of Fetch SQL ")
	return
else
	
	commit ; 

	// **************************************************
	// Genera el archivo SQL para la empresa
	string	ls_output, ls_sqlsyntax, ls_date, ls_time
	
	SELECT DISTINCT dba.parametros.dir_output  
	  INTO :ls_output
	  FROM dba.parametros;
	 
	ls_output = trim(ls_output) 
	
	ls_date = String(Today(), "mmdd")
	ls_time = String(Now(),"HHMM")
	
	ls_filename = ls_output+'ANL'+Fill('0',10 - Len(ls_branch))+ls_branch+".sql"
	ll_filenum  = FileOpen(ls_filename, LineMode!, Write!, LockWrite!, Append!)
	
	ls_sqlsyntax= "UPDATE receiver SET id_flag_receiver = 'A', net_amount_receiver = 0, "+ &
						"rate_change_receiver = 0, telex_receiver = 0, exchange_receiver = 0, "+ &
						"handling_receiver = 0, total_receiver = 0, porc_comision_receiver = 0, total_pay_receiver = 0, "+&
						"exchange_company = 0,  telex_company = 0, total_diference = 0, fee_rate = 0"
							
	ls_sqlsyntax +=	" WHERE id_branch = '"+ ls_branch + "' AND " + &
							"id_receiver = "+ String(ld_receiver) + " ;"
	
	FileWrite (ll_filenum,ls_sqlsyntax)
	FileClose (ll_filenum)
	// **************************************************
	close(parent)
	
end if
				
				
				
		
	

end event

type rb_1 from radiobutton within w_voidiar_envios_central
integer x = 55
integer y = 1620
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hold"
boolean lefttext = true
end type

event clicked;// 

string DWfilter2

DWfilter2 = "id_flag_receiver = 'H'"
dw_voidear_envios.SetFilter(DWfilter2)
dw_voidear_envios.Filter( )
end event

type gb_1 from groupbox within w_voidiar_envios_central
integer x = 23
integer y = 1572
integer width = 928
integer height = 140
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_2 from radiobutton within w_voidiar_envios_central
integer x = 361
integer y = 1620
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Done"
boolean lefttext = true
end type

event clicked;// id_flag_receiver = 'H'// 

string DWfilter2

DWfilter2 = "id_flag_receiver = 'I'"
dw_voidear_envios.SetFilter(DWfilter2)
dw_voidear_envios.Filter( )
end event

type rb_3 from radiobutton within w_voidiar_envios_central
integer x = 667
integer y = 1620
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "All"
boolean lefttext = true
end type

event clicked;// id_flag_receiver = 'H'// 

string DWfilter2

DWfilter2 = "id_flag_receiver <> 'x'"
dw_voidear_envios.SetFilter(DWfilter2)
dw_voidear_envios.Filter( )
end event

