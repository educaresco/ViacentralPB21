$PBExportHeader$w_pop_selection.srw
forward
global type w_pop_selection from pfc_w_response
end type
type cb_clearsearch from commandbutton within w_pop_selection
end type
type cb_search from commandbutton within w_pop_selection
end type
type sle_search from singlelineedit within w_pop_selection
end type
type pb_collapse from picturebutton within w_pop_selection
end type
type pb_expand from picturebutton within w_pop_selection
end type
type cb_2 from commandbutton within w_pop_selection
end type
type st_selected from statictext within w_pop_selection
end type
type cb_close from commandbutton within w_pop_selection
end type
type cb_select from commandbutton within w_pop_selection
end type
type dw_payer from datawindow within w_pop_selection
end type
end forward

global type w_pop_selection from pfc_w_response
integer width = 4823
integer height = 2280
boolean center = true
windowanimationstyle openanimation = centeranimation!
windowanimationstyle closeanimation = centeranimation!
event ue_postopen ( )
cb_clearsearch cb_clearsearch
cb_search cb_search
sle_search sle_search
pb_collapse pb_collapse
pb_expand pb_expand
cb_2 cb_2
st_selected st_selected
cb_close cb_close
cb_select cb_select
dw_payer dw_payer
end type
global w_pop_selection w_pop_selection

type variables
string is_current_selection
boolean lb_initial_load = true
double id_curRate
end variables

forward prototypes
public subroutine fn_display_selected ()
public subroutine fn_goto_selection ()
end prototypes

event ue_postopen();
long i
String lsParam , ls_amount, ls_curRate
double ld_amount
String  ls_id_state 



lsParam = Message.StringParm
//String lsParam = amount +"*"+ rate 

ls_curRate = fn_token( lsParam , '*',2)
ls_amount = fn_token( lsParam , '*',1)

if (isnumber(ls_curRate)) then id_curRate=Double ( ls_curRate )
if (isnumber(ls_amount)) then ld_amount=Double ( ls_amount )
if ( ld_amount = 0 ) then ld_amount = 1

select id_state
   into :ls_id_state
from dba.branch (nolock)
 where  id_branch = :gs_branch_insta;


if dw_payer.retrieve(gs_branch_insta,gs_mod_pay,gs_city_receiver,gs_mod_currency,gs_country_receiver, ld_amount, id_curRate,ls_id_state ) = 0 then
		
	//st_1.text = "No existe en nuestra base de datos una agencia pagadora que cumpla con el Invoice..."
	if fn_getlang() = 'EN' then 
		MessageBox('Attention',"There isn't any payer agency where you need it, check the payment mode and currency.",Exclamation!)
	else
		MessageBox('Atención',"No existe un punto de pago en el lugar selecionado, por favor revise la moneda y el modo de pago.",Exclamation!)
	end if
	
	Close(This)
	return

end if
  
is_current_selection = gs_pagador_ultimo

fn_goto_selection()

lb_initial_load = false

// avoid auto selection of the first item - caused by rowfocuschange
if gs_pagador_ultimo = "" then	
//	dw_payer.SelectRow(0, FALSE)

	if fn_getlang() = 'EN' then 
		st_selected.text = "Selected: None"
	else
		st_selected.text = "Seleccionado: Ninguno"
	end if			

end if
end event

public subroutine fn_display_selected ();


is_current_selection = dw_payer.getitemstring(dw_payer.getrow(),"branch_id_branch")

if fn_getlang() = 'EN' then 
	st_selected.text = "Selected: "
else
	st_selected.text = "Seleccionado: "
end if			

st_selected.text = st_selected.text  + dw_payer.getitemstring(dw_payer.getrow(),"branch_name_branch") +" (" + dw_payer.getitemstring(dw_payer.getrow(),"payer_title") 


if dw_payer.getitemstring(dw_payer.getrow(),"payer_title")  <> dw_payer.getitemstring(dw_payer.getrow(),"group_branch_name_main_branch") then
	st_selected.text = st_selected.text  + " - " + dw_payer.getitemstring(dw_payer.getrow(),"group_branch_name_main_branch")
end if

st_selected.text = st_selected.text  + ")"

	
	


end subroutine

public subroutine fn_goto_selection ();integer li_ret, i
  
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Muestra seleccionado el que esta en la pantalla pfc_sender
if is_current_selection <> '' then
	FOR i = 1 TO dw_payer.rowcount()
		if is_current_selection = dw_payer.getitemstring(i,"branch_id_branch") then			
								
			dw_payer.SelectRow(0,FALSE)
			dw_payer.SelectRow(i,TRUE)			
		
			li_ret = dw_payer.Expand(i,1)

			dw_payer.scrolltorow(i)	
			dw_payer.SetRow(i)			
			
			fn_display_selected()
			
			dw_payer.setfocus()
			
			CONTINUE
		end if	
	NEXT
end if		
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
end subroutine

on w_pop_selection.create
int iCurrent
call super::create
this.cb_clearsearch=create cb_clearsearch
this.cb_search=create cb_search
this.sle_search=create sle_search
this.pb_collapse=create pb_collapse
this.pb_expand=create pb_expand
this.cb_2=create cb_2
this.st_selected=create st_selected
this.cb_close=create cb_close
this.cb_select=create cb_select
this.dw_payer=create dw_payer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_clearsearch
this.Control[iCurrent+2]=this.cb_search
this.Control[iCurrent+3]=this.sle_search
this.Control[iCurrent+4]=this.pb_collapse
this.Control[iCurrent+5]=this.pb_expand
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.st_selected
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.cb_select
this.Control[iCurrent+10]=this.dw_payer
end on

on w_pop_selection.destroy
call super::destroy
destroy(this.cb_clearsearch)
destroy(this.cb_search)
destroy(this.sle_search)
destroy(this.pb_collapse)
destroy(this.pb_expand)
destroy(this.cb_2)
destroy(this.st_selected)
destroy(this.cb_close)
destroy(this.cb_select)
destroy(this.dw_payer)
end on

event open;call super::open;
This.PostEvent("ue_postopen")
end event

type cb_clearsearch from commandbutton within w_pop_selection
integer x = 4434
integer width = 347
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Limpiar"
end type

event clicked;
dw_payer.SetRedraw(false)
dw_payer.SetFilter('')
dw_payer.Filter()
dw_payer.SetRedraw(true)
dw_payer.CollapseAll()

end event

event constructor;if fn_getlang() = 'EN' then this.text = 'Clear'
end event

type cb_search from commandbutton within w_pop_selection
integer x = 3909
integer width = 489
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Buscar"
end type

event clicked;string ls_lsearch
int li_return

if (sle_Search.Text <> "" ) then
	
		ls_lsearch = "(branch_name_branch like '%" +  Trim(sle_Search.Text) + &
						"%') OR (branch_address_branch like '%" +  Trim(sle_Search.Text) +  "%')"
//						"%')  OR (branch_location_notes like '%" +  Trim(sle_Search.Text) + "%') " //+ &
//						" and cubrimiento_branch_id_city = '" +  gs_city_receiver + "'" 
		dw_payer.SetFilter( ls_lsearch )
		dw_payer.SetRedraw(false)
		li_return = dw_payer.Filter()
		dw_payer.SetRedraw(true)
		if (li_return <> -1 ) then
			dw_payer.ExpandAll()
		end if;
end if


end event

event constructor;if fn_getlang() = 'EN' then this.text = 'Search'
end event

type sle_search from singlelineedit within w_pop_selection
integer x = 709
integer width = 3182
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type pb_collapse from picturebutton within w_pop_selection
integer x = 105
integer width = 110
integer height = 96
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "AlignLeft!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_payer.CollapseAll()
end event

type pb_expand from picturebutton within w_pop_selection
integer width = 110
integer height = 96
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "AlignRight!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_payer.ExpandAll( )
end event

type cb_2 from commandbutton within w_pop_selection
integer x = 210
integer width = 489
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ver Selección"
end type

event constructor;if fn_getlang() = 'EN' then this.text = '&Show Selection'
end event

event clicked;fn_goto_selection()
end event

type st_selected from statictext within w_pop_selection
integer x = 37
integer y = 2108
integer width = 2258
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected: None"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_pop_selection
integer x = 4219
integer y = 2080
integer width = 567
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean cancel = true
end type

event clicked;closewithreturn(parent,'')
end event

event constructor;if fn_getlang() = 'EN' then this.text = '&Close'
end event

type cb_select from commandbutton within w_pop_selection
integer x = 3643
integer y = 2080
integer width = 567
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Seleccionar"
boolean default = true
end type

event clicked;//long		ll_row
//string		ls_branch
//
//ll_row = dw_payer.GetRow()
//
//if ll_row = 0 then
//	dw_payer.SelectRow(0, FALSE)
//	return
//end if
//
//ls_branch = dw_payer.getitemstring(ll_row,"branch_id_branch")
//
//if ll_row <> 0 then
//	closewithreturn(parent,ls_branch)	
//end if


if is_current_selection <> '' then
	closewithreturn(parent,is_current_selection)	
else
	if fn_getlang() = 'EN' then 
		MessageBox('Attention',"There isn't any payer agency selected.",Exclamation!)
	else
		MessageBox('Atención',"No hay un lugar selecionado.",Exclamation!)
	end if	
end if

end event

event constructor;if fn_getlang() = 'EN' then this.text = '&Select'
end event

type dw_payer from datawindow within w_pop_selection
event ue_postopen ( )
integer y = 100
integer width = 4791
integer height = 1980
integer taborder = 30
string dataobject = "dw_pop_selection"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;
if not lb_initial_load then 

	// avoid selection of the parent nodes
	if dw_payer.getitemstring(currentrow,"branch_id_branch") = "" then return
	
	SelectRow(0, FALSE)
	SelectRow(currentrow, TRUE)
	SetRow(currentrow)
	
	if currentrow = 0 then
		this.SelectRow(0, FALSE)
		This.SelectRow(1, TRUE)
		SetRow(1)
	end if	
	
	fn_display_selected()
	
end if
end event

event doubleclicked;
// avoid selection of the parent nodes
if dw_payer.getitemstring(row,"branch_id_branch") = "" then return

cb_select.triggerevent(clicked!)
end event

event clicked;// avoid selection of the parent nodes
if dw_payer.getitemstring(row,"branch_id_branch") <> "" then 
	fn_display_selected()
end if
if dwo.name = 'p_select' then 
	cb_select.post triggerevent(clicked!)
end if

end event

