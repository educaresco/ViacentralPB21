$PBExportHeader$w_choise_pop.srw
forward
global type w_choise_pop from window
end type
type cb_3 from commandbutton within w_choise_pop
end type
type em_to from editmask within w_choise_pop
end type
type st_3 from statictext within w_choise_pop
end type
type em_from from editmask within w_choise_pop
end type
type st_2 from statictext within w_choise_pop
end type
type cb_2 from commandbutton within w_choise_pop
end type
type cb_select from commandbutton within w_choise_pop
end type
type cb_1 from commandbutton within w_choise_pop
end type
type dw_1 from u_dw within w_choise_pop
end type
end forward

global type w_choise_pop from window
integer x = 763
integer y = 524
integer width = 2578
integer height = 1808
boolean titlebar = true
string title = "Select Invoices "
windowtype windowtype = response!
long backcolor = 79741120
cb_3 cb_3
em_to em_to
st_3 st_3
em_from em_from
st_2 st_2
cb_2 cb_2
cb_select cb_select
cb_1 cb_1
dw_1 dw_1
end type
global w_choise_pop w_choise_pop

type variables
string	is_name
end variables

on w_choise_pop.create
this.cb_3=create cb_3
this.em_to=create em_to
this.st_3=create st_3
this.em_from=create em_from
this.st_2=create st_2
this.cb_2=create cb_2
this.cb_select=create cb_select
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.em_to,&
this.st_3,&
this.em_from,&
this.st_2,&
this.cb_2,&
this.cb_select,&
this.cb_1,&
this.dw_1}
end on

on w_choise_pop.destroy
destroy(this.cb_3)
destroy(this.em_to)
destroy(this.st_3)
destroy(this.em_from)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cb_select)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event key;IF KeyDown(KeyUpArrow!) THEN 
	MessageBox("UP","UP")
END IF

IF dw_1.GetRow() > 0 THEN
	IF KeyDown(KeyUpArrow!) then
		IF dw_1.GetRow() > 1 THEN
			dw_1.SelectRow(0, FALSE)
			dw_1.SelectRow(dw_1.GetRow() - 1, TRUE)
			dw_1.SetRow(dw_1.GetRow() - 1)
			dw_1.ScrollToRow(dw_1.GetRow() - 1)
			Return
		END IF
	ELSEIF KeyDown(KeyDownArrow!) then
		IF dw_1.GetRow() < dw_1.RowCount() THEN
			dw_1.SelectRow(0, FALSE)
			dw_1.SelectRow(dw_1.GetRow()+1, TRUE)
			dw_1.SetRow(dw_1.GetRow()+1)
			dw_1.ScrollToRow(dw_1.GetRow()+1)
			Return
		END IF
	END IF
END IF
end event

type cb_3 from commandbutton within w_choise_pop
boolean visible = false
integer x = 960
integer y = 24
integer width = 224
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Query"
boolean default = true
end type

event clicked;dw_1.settransobject(sqlca)

////
string ls_is_group,em_agent
em_agent = Message.StringParm
select id_main_branch
into   :ls_is_group
from   dba.branch
where  id_branch  = :em_agent;

////


Double 	ld_from, ld_to, ld_receiver
datetime	ld_busqueda, ld_fecha_menor
date		ld_fecha1, ld_fecha2, ld_hoy
long		i,il_row
string	ls_GRUPO, ls_branch, ls_status

ls_GRUPO 	= ls_is_group
ls_branch 	= em_agent
ld_hoy 		= today()
ld_from 		= Double(em_from.text)
ld_TO   		= Double(em_to.text)

SELECT dba.RECEIVER.DATE_RECEIVER  
INTO 	 :ld_fecha_menor  
FROM 	 dba.RECEIVER  
WHERE  (dba.RECEIVER.ID_BRANCH 	= :ls_branch ) 
AND    (dba.RECEIVER.ID_RECEIVER = :ld_from );

ld_hoy = date(ld_fecha_menor)

SELECT	dba.RELACION_INVOICES_PAYEE.DATE_RELACION_DIARIA  
INTO 		:ld_busqueda  
FROM 		dba.RELACION_INVOICES_PAYEE,   
			dba.RECEIVER  
WHERE (  dba.RECEIVER.ID_BRANCH 										= dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE ) 
and  	(  dba.RELACION_INVOICES_PAYEE.ID_RECEIVER 				= dba.RECEIVER.ID_RECEIVER ) 
and  	( (dba.RECEIVER.ID_RECEIVER 									= :ld_from ) 
AND  	(  dba.RECEIVER.ID_BRANCH 										= :ls_branch ) 
AND  	(  dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE 	= 'TD' ) )   ;

ld_fecha1 = date(ld_busqueda)

SELECT 	dba.RELACION_INVOICES_PAYEE.DATE_RELACION_DIARIA  
INTO 	 	:ld_busqueda  
FROM 	 	dba.RELACION_INVOICES_PAYEE,   
		 	dba.RECEIVER  
WHERE ( 	dba.RECEIVER.ID_BRANCH = dba.RELACION_INVOICES_PAYEE.ID_BRANCH_INVOICE ) 
and   ( 	dba.RELACION_INVOICES_PAYEE.ID_RECEIVER = dba.RECEIVER.ID_RECEIVER ) 
and   ( (dba.RECEIVER.ID_RECEIVER 	= :ld_to ) 
AND   ( 	dba.RECEIVER.ID_BRANCH 		= :ls_branch ) 
AND   ( 	dba.RELACION_INVOICES_PAYEE.ID_CONCEPTO_CONTABLE = 'TD' ) );

ld_fecha2 = date(ld_busqueda)

dw_1.reset()
il_row = dw_1.retrieve(ld_fecha1,ld_fecha2,ls_GRUPO,ld_from,ld_to,ld_hoy)

dw_1.SetSort ("id_receiver   A")
dw_1.Sort()
dw_1.SetFilter ("id_receiver   <> id_receiver[-1]")
dw_1.Filter()



end event

type em_to from editmask within w_choise_pop
integer x = 626
integer y = 24
integer width = 325
integer height = 64
integer taborder = 60
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
string mask = "##########"
end type

event losefocus;setpointer(hourglass!)
cb_3.triggerevent(clicked!)
setpointer(arrow!)
end event

type st_3 from statictext within w_choise_pop
integer x = 521
integer y = 24
integer width = 105
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "To :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_from from editmask within w_choise_pop
integer x = 206
integer y = 24
integer width = 325
integer height = 64
integer taborder = 50
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
string mask = "##########"
end type

type st_2 from statictext within w_choise_pop
integer x = 23
integer y = 24
integer width = 183
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "From :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_choise_pop
integer x = 1723
integer y = 24
integer width = 407
integer height = 68
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Unselect All"
boolean default = true
end type

event clicked;	dw_1.SelectRow(0, FALSE)

end event

type cb_select from commandbutton within w_choise_pop
integer x = 1303
integer y = 24
integer width = 407
integer height = 68
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select All"
boolean default = true
end type

event clicked;	dw_1.SelectRow(0, TRUE)

end event

type cb_1 from commandbutton within w_choise_pop
integer x = 2144
integer y = 24
integer width = 375
integer height = 68
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Return"
boolean cancel = true
end type

event clicked;int    	il_row,ll_i
ld_Areceiver = ld_dummy
il_row  = dw_1.rowcount() 
if il_row > 0 then 
FOR ll_i = 1 TO il_row
	IF dw_1.IsSelected(ll_i) THEN
		ld_Areceiver[UpperBound(ld_Areceiver) + 1] = dw_1.getitemnumber(ll_i,"id_receiver")
	END IF 	
NEXT
end if 
close(parent)
end event

type dw_1 from u_dw within w_choise_pop
integer y = 152
integer width = 2551
integer height = 1560
integer taborder = 10
string dataobject = "dw_pago_agente_by_closing_ref"
end type

event clicked;call super::clicked;integer CurRow
boolean result

result = this.IsSelected(Row)

IF Row > 0 then
	
	IF result THEN
		this.SelectRow(Row, FALSE)
	ELSE
		this.SelectRow(Row, TRUE)
	END IF

	
end if

end event

