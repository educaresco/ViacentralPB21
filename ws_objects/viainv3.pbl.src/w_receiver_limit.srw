$PBExportHeader$w_receiver_limit.srw
forward
global type w_receiver_limit from wb_single_tb
end type
type st_2 from statictext within w_receiver_limit
end type
type sle_payer_id from singlelineedit within w_receiver_limit
end type
type sle_payer_name from singlelineedit within w_receiver_limit
end type
type gb_1 from groupbox within w_receiver_limit
end type
end forward

global type w_receiver_limit from wb_single_tb
integer x = 214
integer y = 221
integer width = 4087
integer height = 2040
string title = "Receiver Limit"
st_2 st_2
sle_payer_id sle_payer_id
sle_payer_name sle_payer_name
gb_1 gb_1
end type
global w_receiver_limit w_receiver_limit

forward prototypes
public function string fn_validar_payer (string as_payer_id)
end prototypes

public function string fn_validar_payer (string as_payer_id);string ls_name_group

SELECT NAME_MAIN_BRANCH
INTO :ls_name_group
FROM DBA.GROUP_BRANCH  
WHERE ID_MAIN_BRANCH=:as_payer_id;

if len(ls_name_group) = 0 then
	MessageBox("Error","No existe el código de pagador: "+as_payer_id,StopSign!)
end if		

return ls_name_group
end function

on w_receiver_limit.create
int iCurrent
call super::create
this.st_2=create st_2
this.sle_payer_id=create sle_payer_id
this.sle_payer_name=create sle_payer_name
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.sle_payer_id
this.Control[iCurrent+3]=this.sle_payer_name
this.Control[iCurrent+4]=this.gb_1
end on

on w_receiver_limit.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_2)
destroy(this.sle_payer_id)
destroy(this.sle_payer_name)
destroy(this.gb_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_receiver_limit
integer x = 9
integer y = 168
integer width = 4023
integer height = 1680
string title = "Receiver Limit"
string dataobject = "dw_receiver_limit"
end type

event dw_1::itemchanged;call super::itemchanged;/**********************************************************************
 PARA LA DATAWINDOWS    dw_1
 DESCRIPCION: Se realzia la validacion para que ingrese solo codigos de
 agencia existentes
**********************************************************************/
String  	ls_branch
Long	 	ll_count
double 	ll_comision, ll_comision_company, ll_range

	
	//dw_1.AcceptText()
	
	CHOOSE CASE dwo.name
		CASE "limit_payer"
				if len(fn_validar_payer(data)) = 0 then
					return 1
				end if							
	
	END CHOOSE	




end event

event dw_1::itemerror;call super::itemerror;//No deja disparar el error del sistema sino el error controlado
RETURN 1
end event

type st_2 from statictext within w_receiver_limit
integer x = 69
integer y = 60
integer width = 197
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer :"
boolean focusrectangle = false
end type

type sle_payer_id from singlelineedit within w_receiver_limit
integer x = 247
integer y = 48
integer width = 297
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;String ls_filter, ls_data, ls_name_group

dw_1.Retrieve()

ls_data = this.text

if len(ls_data) > 0 then
	ls_name_group = fn_validar_payer(ls_data)
	if  len(ls_name_group) = 0 then
		ls_filter = ''
		sle_payer_name.text = ""
		return
	end if							
	
	ls_filter = "limit_payer = '" + ls_data + "'"
	sle_payer_name.text = ls_name_group
else
	ls_filter = ''
	sle_payer_name.text = ""
end if

dw_1.SetFilter(ls_filter)
dw_1.SetRedraw(false)
dw_1.Filter()
dw_1.SetRedraw(true)
end event

type sle_payer_name from singlelineedit within w_receiver_limit
integer x = 558
integer y = 48
integer width = 1202
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_receiver_limit
integer width = 1824
integer height = 156
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

