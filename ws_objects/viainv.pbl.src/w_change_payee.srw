$PBExportHeader$w_change_payee.srw
forward
global type w_change_payee from Window
end type
type cb_close from commandbutton within w_change_payee
end type
type cb_select from commandbutton within w_change_payee
end type
type dw_1 from datawindow within w_change_payee
end type
end forward

global type w_change_payee from Window
int X=283
int Y=260
int Width=3154
int Height=1800
boolean TitleBar=true
string Title="Selecting  New Payee"
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
cb_close cb_close
cb_select cb_select
dw_1 dw_1
end type
global w_change_payee w_change_payee

type variables
string is_mod_currency, is_branch, is_country, is_branch_pay


Double	id_amount, id_receiver
end variables

on w_change_payee.create
this.cb_close=create cb_close
this.cb_select=create cb_select
this.dw_1=create dw_1
this.Control[]={this.cb_close,&
this.cb_select,&
this.dw_1}
end on

on w_change_payee.destroy
destroy(this.cb_close)
destroy(this.cb_select)
destroy(this.dw_1)
end on

event open;string	ls_currency, ls_mode_pay, ls_city

string ls_grupo, ls_use_cubrimiento = '' 

commit ;


str_change_payee	str_filtro


str_filtro = Message.PowerObjectParm	


is_branch       =  str_filtro.branch
id_receiver     =  str_filtro.receiver
is_branch_pay   =  str_filtro.branch_pay
is_Country 		 = 	str_filtro.country
ls_city 			 = 	str_filtro.city
ls_currency 	 = 	str_filtro.currency
ls_mode_pay 	 = 	str_filtro.mode_pay
id_amount		 =    str_filtro.amount

is_mod_currency = ls_currency


  SELECT dba.modo_pago.use_cubrimiento  
    INTO :ls_use_cubrimiento  
    FROM dba.modo_pago  
   WHERE dba.modo_pago.id_modo_pago = :ls_mode_pay   ;




if ls_use_cubrimiento = 'N'  then
	dw_1.dataobject = 'dw_change_payee_sin_cubrimiento'
	dw_1.settransobject(sqlca)
	
	if dw_1.retrieve(ls_mode_pay,ls_city,ls_currency,is_branch_pay) = 0 then
		dw_1.SetRow(1)
		dw_1.SelectRow(0,FALSE)
		dw_1.SelectRow(1,TRUE)
		MessageBox('Atention',"There isn't any payer agency where you need it.",Exclamation!)
		close(this)
	else
		dw_1.SetRow(1)
		dw_1.SelectRow(0,FALSE)
		dw_1.SelectRow(1,TRUE)
		dw_1.setfocus()
	end if

else
	dw_1.dataobject = 'dw_change_payee'
	dw_1.settransobject(sqlca)
	
	if dw_1.retrieve(ls_mode_pay,ls_city,ls_currency,is_branch_pay) = 0 then
		dw_1.SetRow(1)
		dw_1.SelectRow(0,FALSE)
		dw_1.SelectRow(1,TRUE)
		MessageBox('Atention',"There isn't any payer agency where you need it.",Exclamation!)
		close(this)
	else
		dw_1.SetRow(1)
		dw_1.SelectRow(0,FALSE)
		dw_1.SelectRow(1,TRUE)
		dw_1.setfocus()
	end if
end if
  
  
  

end event

type cb_close from commandbutton within w_change_payee
int X=1819
int Y=1532
int Width=645
int Height=108
int TabOrder=30
string Text="&Close"
boolean Cancel=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close(w_change_payee)
end event

type cb_select from commandbutton within w_change_payee
int X=617
int Y=1532
int Width=658
int Height=108
int TabOrder=20
string Text="&Change Payee"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long		ll_row
string	ls_payee
Double	ld_tasa_payee, ld_ganancia_cambio = 0, ld_rate
Datetime	ld_datetime

ld_datetime = Datetime(today(),now())

ll_row = dw_1.GetRow()

if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
end if

ls_payee = dw_1.getitemstring(ll_row,"id_branch")

if ll_row <> 0 then
	
	////////////////// Calcular la Referencia y Ganancia al Cambio  ////////////////////////
	If is_mod_currency = "N" Then 
	
		 SELECT dba.rate  
    		INTO :ld_rate  
    		FROM dba.rate  
   	  WHERE id_country = :is_country   ;

		
	    SELECT DISTINCT dba.group_branch.diference_exchange  
   	  INTO :ld_tasa_payee  
    	  FROM dba.branch branch,   
            dba.group_branch group_branch 
        WHERE ( dba.group_branch.id_main_branch = branch.id_main_branch ) and  
              ( ( dba.branch.id_branch = :is_branch_pay ) )   ;
 
		  
		If Isnull(ld_tasa_payee) Then
			ld_tasa_payee = 0
		End if
		///Calculo de la ganancia al cambio dependiendo de la tasa del pagador y del pais.
		
		if ld_tasa_payee = 0 then
			ld_ganancia_cambio = 0
		else
			ld_ganancia_cambio = ((ld_tasa_payee - ld_rate)/ld_tasa_payee)
		end if

		ld_ganancia_cambio =  (ld_ganancia_cambio * id_amount)  
		
	end if
	
		
		
		///////////////////////////////////////////////////////////
		
			  DELETE FROM dba.motivo_hold  
   		  WHERE ( dba.motivo_hold.id_branch = :is_branch ) AND  
                 ( dba.motivo_hold.id_receiver = :id_receiver ) AND  
                 ( dba.motivo_hold.type_motivo_hold = '5' )   ;
				
				COMMIT ;		
				
					  
			  DELETE FROM dba.motivo_hold  
   		  WHERE ( dba.motivo_hold.id_branch = :is_branch ) AND  
                 ( dba.motivo_hold.id_receiver = :id_receiver ) AND  
                 ( dba.motivo_hold.type_motivo_hold = '60' )   ;	
					  
			COMMIT ;		  

		
			
   		INSERT INTO dba.history_invoice  
         		 ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change )  
  			VALUES ( :is_branch,:id_receiver,'H','I',:gs_cashier,:ld_datetime,:ld_datetime)  ;

		  INSERT INTO dba.change_status_invoice  
                ( id_branch,id_receiver,id_cashier,fecha,hora,id_flag_receiver_old,id_flag_receiver_new )  
         VALUES ( :is_branch,:id_receiver,:gs_cashier,:ld_datetime,:ld_datetime,'H','I' )  ;

	
	string ls_city, ls_state, ls_country
	
	
		  SELECT dba.BRANCH.ID_CITY,   
         dba.BRANCH.ID_STATE,   
         dba.BRANCH.ID_COUNTRY  
    INTO :ls_city,   
         :ls_state,   
         :ls_country  
    FROM dba.BRANCH 
   WHERE dba.BRANCH.ID_BRANCH = :ls_payee   ;

	
	
		UPDATE dba.receiver  
     SET dba.receiver.branch_pay_receiver = :ls_payee,   
         dba.receiver.ref_receiver = 0,   
         dba.receiver.trans_receiver = 'N',
			dba.receiver.id_city_receiver = :ls_city,
			dba.receiver.id_state_receiver = :ls_state,
			dba.receiver.id_country_receiver = :ls_country,
         //dba.receiver.id_flag_receiver = 'I',   
         dba.receiver.total_diference = 0,
			dba.receiver.fx_receiver = :ld_ganancia_cambio
   WHERE ( dba.receiver.id_branch = :is_branch ) AND  
         ( dba.receiver.id_receiver = :id_receiver )   ;

	If sqlca.sqlcode < 0 then
		messagebox("Error","SQL Sentence"+sqlca.sqlerrtext)
		rollback;
		return 
	else
		commit ; 
	end if
	closewithreturn(w_change_payee,ls_payee)
end if


end event

type dw_1 from datawindow within w_change_payee
int X=5
int Width=3127
int Height=1508
int TabOrder=10
string DataObject="dw_change_payee"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, TRUE)
SetRow(currentrow)

string	ls_grupo
long		ll_row = 0

if currentrow = 0 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	ll_row = 1
end if	



end event

event clicked;string	ls_grupo
long		ll_row = 0

if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	ll_row = 1
//	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
	ll_row = row
end if

///////////////////////////////////



end event

event doubleclicked;cb_select.triggerevent(clicked!)
end event

