$PBExportHeader$w_agentregcommissions.srw
forward
global type w_agentregcommissions from wb_single_tb
end type
type sle_1 from singlelineedit within w_agentregcommissions
end type
type mle_reg_trans from multilineedit within w_agentregcommissions
end type
end forward

global type w_agentregcommissions from wb_single_tb
boolean visible = true
integer x = 214
integer y = 221
integer width = 5216
integer height = 2072
string title = "Sales Representatives~' Comission"
sle_1 sle_1
mle_reg_trans mle_reg_trans
end type
global w_agentregcommissions w_agentregcommissions

on w_agentregcommissions.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.mle_reg_trans=create mle_reg_trans
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.mle_reg_trans
end on

on w_agentregcommissions.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_1)
destroy(this.mle_reg_trans)
end on

event open;call super::open;this.title = 'Agents Commissions'
end event

event pfc_save;call super::pfc_save;dw_1.accepttext()
return 0
end event

type dw_1 from wb_single_tb`dw_1 within w_agentregcommissions
integer x = 23
integer y = 12
integer width = 5111
integer height = 1780
string dataobject = "dw_regular_commissions_1"
end type

event dw_1::constructor;call super::constructor;
//of_SetTransObject(sqlca)

// Start the Drop-down Calendar and associate with the 
// "order date" column of the DataWindow.
of_SetDropDownCalendar(true)
iuo_calendar.of_Register('date_ini_comision', iuo_calendar.DDLB_WITHARROW)
iuo_calendar.of_Register('date_fin_comision', iuo_calendar.DDLB_WITHARROW)

// Start the Drop-down Calculator and associate with the "quantity" column
// of the DataWindow.
of_SetDropDownCalculator(true)
iuo_calculator.of_Register('trans_reg', iuo_calculator.DDLB_WITHARROW)
iuo_calculator.of_Register('trans_new', iuo_calculator.DDLB_WITHARROW)
iuo_calculator.of_Register('trans_esp', iuo_calculator.DDLB_WITHARROW)
iuo_calculator.of_Register('bonus_a', iuo_calculator.DDLB_WITHARROW)
iuo_calculator.of_Register('bonus_b', iuo_calculator.DDLB_WITHARROW)
iuo_calculator.of_Register('bonus_dormant', iuo_calculator.DDLB_WITHARROW)
iuo_calculator.of_Register('bonus_expensive', iuo_calculator.DDLB_WITHARROW)
//  Call the of_Retrieve function to retrieve the data.
of_Retrieve()
end event

event dw_1::clicked;call super::clicked;string ls_Object

ls_Object = String(dwo.name)

if ls_Object = 'b_sales_rep' and sle_1.visible = false then
	
	sle_1.visible = true
else
	sle_1.visible = false
end if

	if ls_Object = 'valor_comision_agente_t'  and mle_reg_trans.visible = false then
		mle_reg_trans.visible = true
	else
		mle_reg_trans.visible = false
	end if

	
end event

type sle_1 from singlelineedit within w_agentregcommissions
boolean visible = false
integer x = 736
integer y = 48
integer width = 658
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 8388608
long backcolor = 15793151
string text = "Sales Representative Name"
boolean displayonly = true
borderstyle borderstyle = styleraised!
end type

type mle_reg_trans from multilineedit within w_agentregcommissions
boolean visible = false
integer x = 1266
integer y = 60
integer width = 631
integer height = 220
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 8388608
long backcolor = 15793151
string text = "Amount to be paid to the Sales representative for Regular Agencys"
boolean displayonly = true
borderstyle borderstyle = styleraised!
end type

