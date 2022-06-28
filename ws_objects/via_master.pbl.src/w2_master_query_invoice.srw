$PBExportHeader$w2_master_query_invoice.srw
forward
global type w2_master_query_invoice from w_master
end type
type dw_invoice_info from datawindow within w2_master_query_invoice
end type
type em_clave from editmask within w2_master_query_invoice
end type
type st_1 from statictext within w2_master_query_invoice
end type
type em_invoice from editmask within w2_master_query_invoice
end type
type st_6 from statictext within w2_master_query_invoice
end type
type em_agency from editmask within w2_master_query_invoice
end type
type cb_query from commandbutton within w2_master_query_invoice
end type
type gb_1 from groupbox within w2_master_query_invoice
end type
end forward

global type w2_master_query_invoice from w_master
integer width = 2766
integer height = 1752
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
dw_invoice_info dw_invoice_info
em_clave em_clave
st_1 st_1
em_invoice em_invoice
st_6 st_6
em_agency em_agency
cb_query cb_query
gb_1 gb_1
end type
global w2_master_query_invoice w2_master_query_invoice

type variables

end variables

on w2_master_query_invoice.create
int iCurrent
call super::create
this.dw_invoice_info=create dw_invoice_info
this.em_clave=create em_clave
this.st_1=create st_1
this.em_invoice=create em_invoice
this.st_6=create st_6
this.em_agency=create em_agency
this.cb_query=create cb_query
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_invoice_info
this.Control[iCurrent+2]=this.em_clave
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_invoice
this.Control[iCurrent+5]=this.st_6
this.Control[iCurrent+6]=this.em_agency
this.Control[iCurrent+7]=this.cb_query
this.Control[iCurrent+8]=this.gb_1
end on

on w2_master_query_invoice.destroy
call super::destroy
destroy(this.dw_invoice_info)
destroy(this.em_clave)
destroy(this.st_1)
destroy(this.em_invoice)
destroy(this.st_6)
destroy(this.em_agency)
destroy(this.cb_query)
destroy(this.gb_1)
end on

type dw_invoice_info from datawindow within w2_master_query_invoice
integer x = 41
integer y = 348
integer width = 2647
integer height = 1236
integer taborder = 50
string dataobject = "dw_invoice_info"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

type em_clave from editmask within w2_master_query_invoice
integer x = 329
integer y = 156
integer width = 622
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type st_1 from statictext within w2_master_query_invoice
integer x = 50
integer y = 168
integer width = 329
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folio :"
boolean focusrectangle = false
end type

type em_invoice from editmask within w2_master_query_invoice
integer x = 645
integer y = 48
integer width = 306
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "#######"
end type

type st_6 from statictext within w2_master_query_invoice
integer x = 50
integer y = 60
integer width = 229
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Invoice :"
boolean focusrectangle = false
end type

type em_agency from editmask within w2_master_query_invoice
integer x = 329
integer y = 48
integer width = 306
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!####"
end type

type cb_query from commandbutton within w2_master_query_invoice
integer x = 987
integer y = 48
integer width = 402
integer height = 200
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
end type

event clicked;String 	ls_id_branch, ls_clave, ls_mode
Double 	ld_id_receiver

ls_id_branch = em_agency.text
ld_id_receiver = double(em_invoice.text)
ls_clave = em_clave.text

if trim(ls_clave) <> '' and not isnull(ls_clave) then

	ls_mode = 'C'
	ls_id_branch = 'B-1'
	ld_id_receiver = -2	

	if ls_id_branch <> '' and ld_id_receiver <> 0 then
		Messagebox("Atencion","Se buscara el envio por CLAVE",Information!)
		em_agency.text = ''
		em_invoice.text = ''
	end if

else
	
	ls_mode = 'I'
	ls_clave = '1'

end if

dw_invoice_info.retrieve(ls_mode,ls_id_branch,ld_id_receiver,ls_clave)






end event

type gb_1 from groupbox within w2_master_query_invoice
integer x = 32
integer y = 300
integer width = 2674
integer height = 1308
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Invoice Information"
end type

