$PBExportHeader$w_invoices_hold_call_center.srw
forward
global type w_invoices_hold_call_center from window
end type
type cb_file from commandbutton within w_invoices_hold_call_center
end type
type cb_4 from commandbutton within w_invoices_hold_call_center
end type
type cb_2 from commandbutton within w_invoices_hold_call_center
end type
type cb_liberar from commandbutton within w_invoices_hold_call_center
end type
type dw_3 from datawindow within w_invoices_hold_call_center
end type
type cb_saveas from commandbutton within w_invoices_hold_call_center
end type
type rb_suspicious from radiobutton within w_invoices_hold_call_center
end type
type rb_history from radiobutton within w_invoices_hold_call_center
end type
type cb_cancelados from commandbutton within w_invoices_hold_call_center
end type
type cb_anulados from commandbutton within w_invoices_hold_call_center
end type
type dw_2 from datawindow within w_invoices_hold_call_center
end type
type dw_1 from datawindow within w_invoices_hold_call_center
end type
type gb_1 from groupbox within w_invoices_hold_call_center
end type
end forward

global type w_invoices_hold_call_center from window
boolean visible = false
integer x = 923
integer y = 424
integer width = 4037
integer height = 1908
boolean titlebar = true
string title = "Invoices Hold - Call Center"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
cb_file cb_file
cb_4 cb_4
cb_2 cb_2
cb_liberar cb_liberar
dw_3 dw_3
cb_saveas cb_saveas
rb_suspicious rb_suspicious
rb_history rb_history
cb_cancelados cb_cancelados
cb_anulados cb_anulados
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
end type
global w_invoices_hold_call_center w_invoices_hold_call_center

on w_invoices_hold_call_center.create
this.cb_file=create cb_file
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_liberar=create cb_liberar
this.dw_3=create dw_3
this.cb_saveas=create cb_saveas
this.rb_suspicious=create rb_suspicious
this.rb_history=create rb_history
this.cb_cancelados=create cb_cancelados
this.cb_anulados=create cb_anulados
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_file,&
this.cb_4,&
this.cb_2,&
this.cb_liberar,&
this.dw_3,&
this.cb_saveas,&
this.rb_suspicious,&
this.rb_history,&
this.cb_cancelados,&
this.cb_anulados,&
this.dw_2,&
this.dw_1,&
this.gb_1}
end on

on w_invoices_hold_call_center.destroy
destroy(this.cb_file)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_liberar)
destroy(this.dw_3)
destroy(this.cb_saveas)
destroy(this.rb_suspicious)
destroy(this.rb_history)
destroy(this.cb_cancelados)
destroy(this.cb_anulados)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;X=1
Y=1
Show()
dw_2.dataobject = 'dw_invoices_hold_call_center'
dw_2.settransobject(sqlca)
dw_2.retrieve()

dw_1.dataobject = 'dw_motivo_hold_call_center'
dw_1.settransobject(sqlca)
//dw_1.retrieve()
end event

event key;IF KeyDown(KeyUpArrow!) THEN 
	MessageBox("UP","UP")
END IF

IF dw_2.GetRow() > 0 THEN
	IF KeyDown(KeyUpArrow!) then
		IF dw_2.GetRow() > 1 THEN
			dw_2.SelectRow(0, FALSE)
			dw_2.SelectRow(dw_2.GetRow() - 1, TRUE)
			dw_2.SetRow(dw_2.GetRow() - 1)
			dw_2.ScrollToRow(dw_2.GetRow() - 1)
			Return
		END IF
	ELSEIF KeyDown(KeyDownArrow!) then
		IF dw_2.GetRow() < dw_2.RowCount() THEN
			dw_2.SelectRow(0, FALSE)
			dw_2.SelectRow(dw_2.GetRow()+1, TRUE)
			dw_2.SetRow(dw_2.GetRow()+1)
			dw_2.ScrollToRow(dw_2.GetRow()+1)
			Return
		END IF
	END IF
END IF
end event

type cb_file from commandbutton within w_invoices_hold_call_center
boolean visible = false
integer x = 2098
integer y = 1588
integer width = 361
integer height = 72
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&File to Bank"
end type

event clicked;//SELECT
//	o.shopper_id "Shopper",
//	p.FirstName + ' ' + p.LastName "Customer Name", 
//	e.bankroutingnumber,
//	e.account,
//	convert(money, e.amount, 2), 
//	'27', 
//	'0020000322', 
//	o.order_id
//FROM 
//	person p, 
//	[order] o,
//	echeck e
//WHERE 
//	p.PersonId = o.shopper_id AND
//	e.orderid = o.order_id AND
//	(e.status is NULL or e.status = 0) AND
//	o.tendertype = 3 AND
//	o.status != 3
//ORDER BY p.FirstName, p.LastName
//
end event

type cb_4 from commandbutton within w_invoices_hold_call_center
boolean visible = false
integer x = 1568
integer y = 1576
integer width = 352
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Search OFAC"
end type

event clicked;string	ls_name_sender,ls_name_receiver,ls_branch, ls_address, ls_city, ls_country
double	ld_receiver
long 		ll_row,ll_cont_ofac

ll_row = dw_2.GetSelectedRow(0)
if ll_row = 0 then
	dw_2.SelectRow(0, FALSE)
	return
end if

ls_branch 	=  dw_2.getitemstring(ll_row,"receiver_id_branch")
ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")

ll_cont_ofac	=	0


  SELECT count(*)  
    INTO :ll_cont_ofac  
    FROM dba.MOTIVO_HOLD  
   WHERE ( dba.MOTIVO_HOLD.TYPE_MOTIVO_HOLD in ('62','65') ) AND  
         ( dba.MOTIVO_HOLD.ID_BRANCH = :ls_branch ) AND  
         ( dba.MOTIVO_HOLD.ID_RECEIVER = :ld_receiver )   ;




if ll_cont_ofac = 0 then
	messagebox("Result","The OFAC search could not be completed!", Exclamation!)
	return
else
	ll_cont_ofac = 0

		select	dba.sender.name_sender,
					dba.receiver.name_receiver,
					dba.sender.addres_sender, dba.country.name_country, dba.city.name_city
		into		:ls_name_sender,:ls_name_receiver,
					:ls_address,:ls_city,:ls_country
		from 		dba.sender,dba.receiver,dba.country,dba.city
		where 	dba.receiver.id_branch 		= 	:ls_branch and
					dba.receiver.id_receiver		=	:ld_receiver and
					dba.sender.id_branch			=	dba.receiver.id_branch and
					dba.sender.id_sender			=	dba.receiver.id_sender and
					dba.sender.id_country			=	dba.country.id_country and
					dba.sender.id_country			=	dba.city.id_country    and
					dba.sender.id_city				=	dba.city.id_city;		
		
		gs_name_ofac_sender		=	ls_name_sender
		gs_name_ofac_receiver	=	ls_name_receiver
		gs_ofac_address			=	ls_address
		gs_ofac_country			=	ls_country
		gs_ofac_city				=	ls_city
	
end if

//open(w_hold_ofac_causa)
end event

type cb_2 from commandbutton within w_invoices_hold_call_center
boolean visible = false
integer x = 1417
integer y = 1524
integer width = 247
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;Long		ll_rows, ll_i
string	ls_motivo,  ls_grupo

if gs_cashier = 'CH7' or gs_cashier = 'CH13' or  gs_cashier = 'CH15' Then
	ls_grupo = 'C'
elseif gs_cashier = 'CH3' Then
	ls_grupo = 'O'
elseif gs_cashier = 'CH18' or  gs_cashier = 'CH4' Then
	ls_grupo = 'S'		
elseif gs_cashier = 'ADM' Then
	ls_grupo = 'A'	
else
	Return
End if


ll_rows = dw_1.rowcount()

FOR ll_i = 1 TO ll_rows
	ls_motivo = dw_1.getitemstring(ll_i,"type_motivo_hold")
	messagebox("",ls_motivo)
	
	IF ls_grupo = 'C' and ls_motivo <> '50' Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
	IF ls_grupo = 'O' and (ls_motivo <> '20' or ls_motivo <> '60') Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
	IF ls_grupo = 'S' and ls_motivo = '20' Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
	IF ls_grupo = 'S' and ls_motivo = '50' Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
	IF ls_grupo = 'S' and ls_motivo = '60' Then
		Messagebox("Error","Authorization")
		Return
	END IF
	
NEXT





end event

type cb_liberar from commandbutton within w_invoices_hold_call_center
integer x = 3214
integer y = 1308
integer width = 777
integer height = 136
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Change Status"
end type

event clicked;long		ll_row, ll_cont
double	ld_receiver, ld_total
string	ls_branch
Date		ld_fecha
DateTime ld_fechahora
Time		lt_hora

ld_fecha = Today()
lt_hora  = Now()
ld_fechahora = Datetime(ld_fecha,lt_hora)

commit ;



Long		ll_rows, ll_i
string	ls_motivo,  ls_grupo

ll_rows = dw_1.rowcount()


ll_row = dw_2.GetSelectedRow(0)
if ll_row = 0 then
	dw_2.SelectRow(0, FALSE)
	return
else
	
end if

ls_branch =  dw_2.getitemstring(ll_row,"receiver_id_branch")
ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
ld_total				= dw_2.getitemnumber(ll_row,"receiver_total_receiver")


if ld_total > 1000 then
	if Messagebox('Verificar','Este envio exede los 1000 Dolares, desea liberarlo',Question!,YesNo!) = 2 then
		return
	end if
end if


If messagebox("Warning","Do you want to change the status of Invoice : "+ls_branch+" - "+string(ld_receiver),Question!,yesno!) = 1 then
	
	gs_branch_insta_cons = ls_branch
	gl_receiver_cons     = ld_receiver
	
	
	open(w_liberar_por_motivos)
	
	
	  SELECT Count(*)  
     INTO :ll_cont  
     FROM dba.motivo_hold  
     WHERE ( dba.motivo_hold.id_branch = :ls_branch ) AND  
          ( dba.motivo_hold.id_receiver = :ld_receiver )   ;

	
	if ll_cont = 0 then
		
		 UPDATE dba.receiver  
        SET dba.receiver.id_flag_receiver = 'I',
		  		dba.receiver.trans_receiver = 'N'
     WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
           ( dba.receiver.id_receiver = :ld_receiver )   ;
			  
		if SQLCA.SQLCODE <> 0 THEN	
			Rollback ;
			return 
		else
			
   		INSERT INTO dba.history_invoice  
         		 ( id_branch,id_receiver,id_flag_old,id_flag_new,id_cashier,date_change,time_change )  
  			VALUES ( :ls_branch,:ld_receiver,'H','I',:gs_cashier,:ld_fechahora,:ld_fechahora)  ;

		  INSERT INTO dba.change_status_invoice  
                ( id_branch,id_receiver,id_cashier,fecha,hora,id_flag_receiver_old,id_flag_receiver_new )  
         VALUES ( :ls_branch,:ld_receiver,:gs_cashier,:ld_fechahora,:ld_fechahora,'H','I' )  ;

				if SQLCA.SQLCODE <> 0 THEN	
						Rollback ;
						return 
				else
					commit ;	
				end if
		end if
		
		dw_1.dataobject = 'dw_motivo_hold_call_center'
		dw_1.settransobject(sqlca)
		dw_1.reset()
	
		dw_2.dataobject = 'dw_invoices_hold_call_center'
		dw_2.settransobject(sqlca)
		dw_2.retrieve()
		dw_2.scrolltorow(ll_row - 1)
		dw_2.SelectRow(0, FALSE)
   	dw_2.SelectRow(ll_row - 1, TRUE)
		
		
	else
		dw_1.reset()
		dw_1.retrieve(ls_branch,ld_receiver)
		
		
	end if
	
	
	 

End if









end event

type dw_3 from datawindow within w_invoices_hold_call_center
boolean visible = false
integer x = 1737
integer y = 1524
integer width = 1006
integer height = 748
integer taborder = 80
boolean enabled = false
string dataobject = "dw_printmotivo_hold"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_saveas from commandbutton within w_invoices_hold_call_center
integer x = 3214
integer y = 1464
integer width = 777
integer height = 136
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Save As..."
end type

event clicked;dw_2.saveas()
end event

type rb_suspicious from radiobutton within w_invoices_hold_call_center
boolean visible = false
integer x = 407
integer y = 1536
integer width = 370
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Suspicious"
boolean checked = true
boolean righttoleft = true
end type

event clicked;dw_1.dataobject = 'dw_motivo_hold'
dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type rb_history from radiobutton within w_invoices_hold_call_center
boolean visible = false
integer x = 59
integer y = 1532
integer width = 279
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "History"
boolean righttoleft = true
end type

event clicked;dw_1.dataobject = 'dw_motivo_hold_historico'
dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type cb_cancelados from commandbutton within w_invoices_hold_call_center
boolean visible = false
integer x = 2839
integer y = 324
integer width = 480
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cancel"
end type

event clicked;dw_2.dataobject = 'dw_invoices_cancelados'
dw_2.settransobject(sqlca)
dw_2.retrieve()
end event

type cb_anulados from commandbutton within w_invoices_hold_call_center
boolean visible = false
integer x = 2839
integer y = 168
integer width = 480
integer height = 156
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Void"
end type

event clicked;dw_2.dataobject = 'dw_invoices_anulados'
dw_2.settransobject(sqlca)
dw_2.retrieve()
end event

type dw_2 from datawindow within w_invoices_hold_call_center
integer x = 27
integer width = 3963
integer height = 1288
integer taborder = 10
string dataobject = "dw_invoices_hold_call_center"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;long	ll_row

String	ls_branch
Double	ld_receiver, ld_sender

ll_row = dw_2.GetClickedRow ( )

// Arreglo esteban, evita que se seleccione toda la lista
if row = 0 then row = ll_row

if ll_row =  1 then
	ls_branch 	= dw_2.getitemstring(1,"receiver_id_branch")
	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
	dw_1.scrolltorow(row)
	dw_2.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(1, TRUE)
	dw_1.reset()
	dw_1.retrieve(ls_branch,ld_receiver)
	return
elseif ll_row = 0 then
	dw_2.SelectRow(0, FALSE)	
	dw_1.SelectRow(0, FALSE)	
	Return
else
	ls_branch   = dw_2.getitemstring(ll_row,"receiver_id_branch")
	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	dw_1.reset()
	dw_1.retrieve(ls_branch,ld_receiver)

	//cb_6.TRIGGEREVENT(CLICKED!)
end if

//-----------------------------------------------
///// Codigo Original before arreglo esteban

//long	ll_row
//
//String	ls_branch
//Double	ld_receiver, ld_sender
//
//ll_row = dw_2.GetClickedRow ( )
//
//if dw_2.GetClickedRow ( ) = 1 then
//	ls_branch 	= dw_2.getitemstring(1,"receiver_id_branch")
//	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
//	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
//	dw_1.scrolltorow(row)
//	dw_2.SelectRow(0, FALSE)
//	This.SelectRow(1, TRUE)
//	dw_1.SelectRow(0, FALSE)
//	dw_1.SelectRow(1, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(ls_branch,ld_receiver)
//	dw_4.retrieve(ld_sender,ls_branch)
//	return
//elseif dw_2.GetClickedRow ( ) = 0 then
//	dw_2.SelectRow(0, FALSE)	
//	dw_1.SelectRow(0, FALSE)
//	Return
//else
//	ls_branch   = dw_2.getitemstring(ll_row,"receiver_id_branch")
//	ld_receiver = dw_2.getitemnumber(ll_row,"receiver_id_receiver")
//	ld_sender   = dw_2.getitemnumber(ll_row,"id_sender")
//	This.SelectRow(0, FALSE)
//   This.SelectRow(row, TRUE)
//	dw_1.reset()
//	dw_1.retrieve(ls_branch,ld_receiver)
//	dw_4.retrieve(ld_sender,ls_branch)
//	//cb_6.TRIGGEREVENT(CLICKED!)
//end if

end event

event doubleclicked;cb_liberar.triggerevent(clicked!)
end event

event rowfocuschanged;if currentrow <> 0 then
	SelectRow(0, FALSE)
	SelectRow(currentrow, TRUE)
	SetRow(currentrow)
end if
end event

type dw_1 from datawindow within w_invoices_hold_call_center
integer x = 27
integer y = 1308
integer width = 1829
integer height = 484
integer taborder = 100
string dataobject = "dw_motivo_hold_call_center"
boolean vscrollbar = true
boolean livescroll = true
end type

type gb_1 from groupbox within w_invoices_hold_call_center
boolean visible = false
integer x = 27
integer y = 1492
integer width = 777
integer height = 136
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

