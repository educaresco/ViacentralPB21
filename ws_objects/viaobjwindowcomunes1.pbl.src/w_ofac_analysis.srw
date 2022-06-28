$PBExportHeader$w_ofac_analysis.srw
forward
global type w_ofac_analysis from pfc_w_master
end type
type tabpag from tab within w_ofac_analysis
end type
type psen from userobject within tabpag
end type
type dw_sen from datawindow within psen
end type
type sle_sen from singlelineedit within psen
end type
type psen from userobject within tabpag
dw_sen dw_sen
sle_sen sle_sen
end type
type prec from userobject within tabpag
end type
type dw_rec from datawindow within prec
end type
type sle_rec from singlelineedit within prec
end type
type prec from userobject within tabpag
dw_rec dw_rec
sle_rec sle_rec
end type
type psenp from userobject within tabpag
end type
type dw_senp from datawindow within psenp
end type
type psenp from userobject within tabpag
dw_senp dw_senp
end type
type precp from userobject within tabpag
end type
type dw_recp from datawindow within precp
end type
type precp from userobject within tabpag
dw_recp dw_recp
end type
type tabpag from tab within w_ofac_analysis
psen psen
prec prec
psenp psenp
precp precp
end type
type dw_invoice from datawindow within w_ofac_analysis
end type
end forward

global type w_ofac_analysis from pfc_w_master
integer width = 3762
integer height = 1460
string title = "Ofac Analysis"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 80269524
tabpag tabpag
dw_invoice dw_invoice
end type
global w_ofac_analysis w_ofac_analysis

on w_ofac_analysis.create
int iCurrent
call super::create
this.tabpag=create tabpag
this.dw_invoice=create dw_invoice
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpag
this.Control[iCurrent+2]=this.dw_invoice
end on

on w_ofac_analysis.destroy
call super::destroy
destroy(this.tabpag)
destroy(this.dw_invoice)
end on

event open;call super::open;string ls_parameters
double ld_receiver, ld_sender
string ls_branch

ls_parameters = message.stringparm

ld_receiver = double(fn_token(ls_parameters,"*",1))
ls_branch 	= fn_token(ls_parameters,"*",2)
ld_sender   = double(fn_token(ls_parameters,"*",3))

dw_invoice.retrieve(ld_receiver,ls_branch,ld_sender)

///////////////////////////////////////////////////////////////////////////////////

//////// Hace la busqueda de los tabs 1 y 2 :

//st_1.text = gs_name_ofac_sender
//st_2.text = gs_name_ofac_receiver

//tabpag.psen.dw_sen.SetRowFocusIndicator(Hand!)
//tabpag.psen.dw_sen.inv_filter.of_SetStyle(tabpag.psen.dw_sen.inv_filter.EXTENDED)
//of_SetResize(true)

//tabpag.prec.dw_rec.SetRowFocusIndicator(Hand!)
//tabpag.prec.dw_rec.inv_filter.of_SetStyle(tabpag.prec.dw_rec.inv_filter.EXTENDED)
//of_SetResize(true)

//inv_resize.of_register(tabpag.psen.dw_sen, this.inv_resize.FIXEDRIGHTBOTTOM)
//inv_resize.of_register(tabpag.prec.dw_rec, this.inv_resize.FIXEDRIGHTBOTTOM)
//tabpag.psen.dw_sen.retrieve(gs_name_ofac_sender,gs_name_ofac_receiver,gs_ofac_address,gs_ofac_country,gs_ofac_city)
tabpag.psen.sle_sen.text = string(tabpag.psen.dw_sen.getrow()) + ' of ' + string(tabpag.psen.dw_sen.rowcount())
tabpag.prec.sle_rec.text = string(tabpag.prec.dw_rec.getrow()) + ' of ' + string(tabpag.prec.dw_rec.rowcount())

string		ls_cadena_buscar,ls_name_invoice[]
string  		ls_busca_nombre 
string      ls_name_ofac_cursor
integer		li_pos,li_maxvector
boolean		lb_ofac
double		ld_rank


ld_rank 				= 0
ls_cadena_buscar	= gs_name_ofac_sender
li_pos 				= pos(ls_cadena_buscar,' ',1)

li_maxvector = 1
// descompone el nombre y lo mete en un vector
DO WHILE (len(trim(ls_cadena_buscar))>0)

	li_pos = pos(trim(ls_cadena_buscar),' ',1)

	if li_pos=0 then
		ls_name_invoice[li_maxvector]	=	ls_cadena_buscar
		ls_cadena_buscar = ''
	else
		ls_name_invoice[li_maxvector]	=	trim(mid(ls_cadena_buscar,1,li_pos))
		ls_cadena_buscar = trim(mid(ls_cadena_buscar,li_pos))
		li_maxvector ++
	end if	
	
LOOP

// coge el ultimo registro del vector y arma el cursor con los que enceuntra en la tabla ofac 
ls_busca_nombre = '%' + ls_name_invoice[li_maxvector]+ '%'

DECLARE lista_ofac_sender CURSOR FOR  
	SELECT sdn_name,ent_num
	FROM   dba.ofac_list  
	WHERE sdn_name like :ls_busca_nombre;

open lista_ofac_sender;

fetch lista_ofac_sender into :ls_name_ofac_cursor,:ld_rank;

lb_ofac = false
// busca en todos los registros del vector si es un ofac
do while sqlca.sqlcode=0 and not lb_ofac
	
	li_pos =1
	// busca el nombre que esta en el vector en el registro actual del cursor de ofac
	lb_ofac = true
	do while (li_pos < li_maxvector and lb_ofac)
		if pos(ls_name_ofac_cursor,ls_name_invoice[li_pos])=0 then
			lb_ofac = false
			fetch lista_ofac_sender into :ls_name_ofac_cursor,:ld_rank;			
		else
			li_pos++
		end if
	loop

loop
close lista_ofac_sender;

if lb_ofac then
	tabpag.psen.dw_sen.retrieve(ld_rank)	
	tabpag.psen.sle_sen.text = string(tabpag.psen.dw_sen.getrow()) + ' of ' + string(tabpag.psen.dw_sen.rowcount())	
	//return
end if


////////////////////////////////////////////////////////////////////////////////////////////RECEIVER

	ls_cadena_buscar	=	gs_name_ofac_receiver
		li_pos = pos(ls_cadena_buscar,' ',1)

		li_maxvector = 1
		// descompone el nombre y lo mete en un vector
		DO WHILE (len(trim(ls_cadena_buscar))>0)

			li_pos = pos(trim(ls_cadena_buscar),' ',1)

			if li_pos=0 then
				ls_name_invoice[li_maxvector]	=	ls_cadena_buscar
				ls_cadena_buscar = ''
			else
				ls_name_invoice[li_maxvector]	=	trim(mid(ls_cadena_buscar,1,li_pos))
				ls_cadena_buscar = trim(mid(ls_cadena_buscar,li_pos))
				li_maxvector ++
			end if	
	
		LOOP
		
string ls_name_invoice_vector,ls_match_name,ls_match_country,ls_ofac_country
long   ll_ent_num,ll_match_ent
		
		// coge el ultimo registro del vector y arma el cursor con los que enceuntra en la tabla ofac 
	ls_name_invoice_vector = '%' + ls_name_invoice[li_maxvector] + '%'
		DECLARE lista_ofac_rec CURSOR FOR  
			SELECT sdn_name, ent_num, ofac_country
			FROM   dba.ofac_list  
			WHERE  sdn_name like :ls_name_invoice_vector;

		open lista_ofac_rec;

		fetch lista_ofac_rec into :ls_name_ofac_cursor, :ll_ent_num, :ls_ofac_country;

		lb_ofac = false
		// busca en todos los registros del vector si es un ofac
		do while sqlca.sqlcode=0 and not lb_ofac
	
		li_pos =1
		// busca el nombre que esta en el vector en el registro actual del cursor de ofac
		lb_ofac = true
		do while (li_pos < li_maxvector and lb_ofac)
			ls_match_name = ls_name_ofac_cursor
			if pos(ls_name_ofac_cursor,ls_name_invoice[li_pos])=0 then
				lb_ofac = false
			else
				li_pos++
				///////////////////////////////////
				ls_match_country = ls_ofac_country
				ll_match_ent = ll_ent_num
				///////////////////////////////////
			end if
		loop
		
	fetch lista_ofac_rec into :ls_name_ofac_cursor, :ll_ent_num, :ls_ofac_country;
	loop
	close lista_ofac_rec;

if lb_ofac then
	tabpag.prec.dw_rec.settransobject(sqlca)
	tabpag.prec.dw_rec.retrieve(ll_ent_num)				
	tabpag.prec.sle_rec.text = string(tabpag.prec.dw_rec.getrow()) + ' of ' + string(tabpag.prec.dw_rec.rowcount())
	return
end if
end event

type tabpag from tab within w_ofac_analysis
integer x = 1486
integer y = 56
integer width = 2199
integer height = 1276
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean raggedright = true
integer selectedtab = 1
psen psen
prec prec
psenp psenp
precp precp
end type

on tabpag.create
this.psen=create psen
this.prec=create prec
this.psenp=create psenp
this.precp=create precp
this.Control[]={this.psen,&
this.prec,&
this.psenp,&
this.precp}
end on

on tabpag.destroy
destroy(this.psen)
destroy(this.prec)
destroy(this.psenp)
destroy(this.precp)
end on

event selectionchanged;



if newindex = 1 then
	
	
	
	
	
	
end if

if newindex = 2 then





end if

// ------------------------------------------------------------>
// ------------------------------------------------------------>
// ------------------------------------------------------------>
// Si selecciona los tabs 3 o 4 llena la tabla temporal y hace el retrieve de la DW
if newindex = 3 or newindex = 4 then

	long ll_ini, ll_fin
	string ls_cadena
	string ls_palabra
	string la_palabras[10]
	int i, li_cont

	if newindex = 3  then
		ls_cadena = trim(dw_invoice.getitemstring(dw_invoice.getrow(),"SENDER_NAME_SENDER"))
	else
		ls_cadena = trim(dw_invoice.getitemstring(dw_invoice.getrow(),"RECEIVER_NAME_RECEIVER"))
	end if
	
	if len(ls_cadena) < 1 then
//		messagebox("Error","Debe especificar algun nombre a buscar")
		return	
	end if
	
	setpointer(HourGlass!)
	
	// -----------------------------------------------------------------------
	// Llenando el vector con todas las palabras del nombre
	i = 0
	ll_ini = 1
	ll_fin = Pos(ls_cadena, " ")
	ls_palabra = ls_cadena
	
	// Mientras haya espacios va llenando cada palabra en la tabla ofac_match
	DO WHILE (ll_fin > 0)
		i+=1
		ls_palabra = Left(ls_cadena, ll_fin - 1)
		ls_cadena = Mid(ls_cadena, ll_fin + 1)	
		la_palabras[i] = ls_palabra
		ll_fin = Pos(ls_cadena, " ")
	LOOP
	
	// Mete la ultima palabra
	i+=1
	la_palabras[i] = ls_cadena
	li_cont = i
	// -----------------------------------------------------------------------
	
	// -----------------------------------------------------------------------
	// Insertando las palabras con el bloque en el que se encuentran (Ofac_Match)
	delete from dba.ofac_match;
	for i = 1 to li_cont	
		ls_palabra = la_palabras[i]	
		insert into dba.ofac_match select distinct :ls_palabra, dba.ofac_details.bloque from dba.ofac_details where dba.ofac_details.texto like '%'+:ls_palabra+'%';	
		if sqlca.SQLCode <> 0 then
			messagebox("Error","Error inserting temporary data~n[Error:"+SQLCA.SQLErrText+"]~nPlease contact system manager.")
			return
		end if
	
	next
	
	commit;
	// -----------------------------------------------------------------------
	
	
	// -----------------------------------------------------------------------
	// Borrando los bloques que tienen menos de 2 ocurrencias
	// (Cuando puso mas de un nombre)
	
	long ll_bloque, ll_ocurrencias
	
	DECLARE Ocurrencias CURSOR FOR  
		select dba.ofac_match.bloque, count(*) from dba.ofac_match 
		group by dba.ofac_match.bloque order by 2 asc; 			
	
	OPEN Ocurrencias;
	
	FETCH Ocurrencias INTO :ll_bloque, :ll_ocurrencias;
	
	DO WHILE SQLCA.SQLCODE = 0 and ll_ocurrencias < 2 and li_cont > 1
		delete from dba.ofac_match where dba.ofac_match.bloque = :ll_bloque;
		FETCH Ocurrencias INTO :ll_bloque, :ll_ocurrencias;
	LOOP
	commit;
	// -----------------------------------------------------------------------
	
	long ll_rows 
	select count(*)
	  into :ll_rows
	  from dba.ofac_match;
	
	//IF ll_rows < 1 THEN MessageBox("Informacion", "No se encontraron Coincidencias en OFAC.")

	if newindex = 3 then
		tabpag.psenp.dw_senp.retrieve()
	else
		tabpag.precp.dw_recp.retrieve()
	end if
	
end if	
// ------------------------------------------------------------>
// ------------------------------------------------------------>
// ------------------------------------------------------------>
end event

type psen from userobject within tabpag
integer x = 18
integer y = 100
integer width = 2162
integer height = 1160
long backcolor = 80269524
string text = "Sender"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 553648127
dw_sen dw_sen
sle_sen sle_sen
end type

on psen.create
this.dw_sen=create dw_sen
this.sle_sen=create sle_sen
this.Control[]={this.dw_sen,&
this.sle_sen}
end on

on psen.destroy
destroy(this.dw_sen)
destroy(this.sle_sen)
end on

type dw_sen from datawindow within psen
integer width = 2149
integer height = 1152
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_hold_ofac_causa"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event buttonclicked;tabpag.psen.sle_sen.text = string(tabpag.psen.dw_sen.getrow()) + ' of ' + string(tabpag.psen.dw_sen.rowcount())
end event

type sle_sen from singlelineedit within psen
integer x = 709
integer y = 1012
integer width = 571
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean autohscroll = false
end type

type prec from userobject within tabpag
integer x = 18
integer y = 100
integer width = 2162
integer height = 1160
long backcolor = 80269524
string text = "Receiver"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_rec dw_rec
sle_rec sle_rec
end type

on prec.create
this.dw_rec=create dw_rec
this.sle_rec=create sle_rec
this.Control[]={this.dw_rec,&
this.sle_rec}
end on

on prec.destroy
destroy(this.dw_rec)
destroy(this.sle_rec)
end on

type dw_rec from datawindow within prec
integer width = 2149
integer height = 1152
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_hold_ofac_causa_rec"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event buttonclicked;tabpag.prec.sle_rec.text = string(tabpag.prec.dw_rec.getrow()) + ' of ' + string(tabpag.prec.dw_rec.rowcount())

end event

type sle_rec from singlelineedit within prec
integer x = 709
integer y = 1012
integer width = 571
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean autohscroll = false
end type

type psenp from userobject within tabpag
integer x = 18
integer y = 100
integer width = 2162
integer height = 1160
long backcolor = 80269524
string text = "Sender (From Text File)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_senp dw_senp
end type

on psenp.create
this.dw_senp=create dw_senp
this.Control[]={this.dw_senp}
end on

on psenp.destroy
destroy(this.dw_senp)
end on

type dw_senp from datawindow within psenp
integer x = 41
integer y = 20
integer width = 2085
integer height = 1112
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_ofac_matches_new"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type precp from userobject within tabpag
integer x = 18
integer y = 100
integer width = 2162
integer height = 1160
long backcolor = 80269524
string text = "Receiver (From Text File)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_recp dw_recp
end type

on precp.create
this.dw_recp=create dw_recp
this.Control[]={this.dw_recp}
end on

on precp.destroy
destroy(this.dw_recp)
end on

type dw_recp from datawindow within precp
integer x = 41
integer y = 20
integer width = 2085
integer height = 1112
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_ofac_matches_new"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_invoice from datawindow within w_ofac_analysis
integer x = 37
integer y = 56
integer width = 1422
integer height = 1264
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_ofac_analysis"
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

