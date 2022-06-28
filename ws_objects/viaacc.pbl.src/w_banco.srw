$PBExportHeader$w_banco.srw
forward
global type w_banco from wb_single_tb
end type
end forward

global type w_banco from wb_single_tb
integer x = 214
integer y = 221
integer width = 4567
integer height = 2240
string title = "Bank"
end type
global w_banco w_banco

type variables
string is_orden
boolean ib_bank_cost_admin
end variables

on w_banco.create
call super::create
end on

on w_banco.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;integer li_user

SELECT Count(*)
INTO :li_user
FROM dba.SEC_USER_GROUP 
WHERE ID_GROUP = 'BCA' OR ID_GROUP = 'ADM' AND ID_USER = :gs_cashier;

ib_bank_cost_admin = false

IF li_user > 0 THEN 
	ib_bank_cost_admin = true
END IF

dw_1.object.fee_per_month.Visible = ib_bank_cost_admin
dw_1.object.t_fee_per_month.Visible = ib_bank_cost_admin

dw_1.object.cost_trx_deposit.Visible = ib_bank_cost_admin
dw_1.object.t_cost_trx_deposit.Visible = ib_bank_cost_admin

dw_1.object.cost_x_100_deposit.Visible = ib_bank_cost_admin
dw_1.object.t_cost_x_100_deposit.Visible = ib_bank_cost_admin

dw_1.object.cost_trx_atm.Visible = ib_bank_cost_admin
dw_1.object.t_cost_trx_atm.Visible = ib_bank_cost_admin

dw_1.object.cost_x_100_atm.Visible = ib_bank_cost_admin
dw_1.object.t_cost_x_100_atm.Visible = ib_bank_cost_admin

dw_1.object.cost_trx_qbd.Visible = ib_bank_cost_admin
dw_1.object.t_cost_trx_qbd.Visible = ib_bank_cost_admin

dw_1.object.cost_x_100_qbd.Visible = ib_bank_cost_admin
dw_1.object.t_cost_x_100_qbd.Visible = ib_bank_cost_admin

dw_1.object.cost_trx_vault.Visible = ib_bank_cost_admin
dw_1.object.t_cost_trx_vault.Visible = ib_bank_cost_admin

dw_1.object.cost_x_100_vault.Visible = ib_bank_cost_admin
dw_1.object.t_cost_x_100_vault.Visible = ib_bank_cost_admin

dw_1.object.cost_trx_viacheck.Visible = ib_bank_cost_admin
dw_1.object.t_cost_trx_viacheck.Visible = ib_bank_cost_admin

dw_1.object.cost_trx_ach.Visible = ib_bank_cost_admin
dw_1.object.t_cost_trx_ach.Visible = ib_bank_cost_admin

dw_1.object.cost_x_100_ach.Visible = ib_bank_cost_admin
dw_1.object.t_cost_x_100_ach.Visible = ib_bank_cost_admin

dw_1.object.cost_trx_pickup.Visible = ib_bank_cost_admin
dw_1.object.t_cost_trx_pickup.Visible = ib_bank_cost_admin

dw_1.object.cost_trx_carroarmado.Visible = ib_bank_cost_admin
dw_1.object.t_cost_trx_carroarmado.Visible = ib_bank_cost_admin

dw_1.object.cost_x_100_carroarmado.Visible = ib_bank_cost_admin
dw_1.object.t_cost_x_100_carroarmado.Visible = ib_bank_cost_admin

dw_1.object.yearmonth.Visible = ib_bank_cost_admin
dw_1.object.b_ordenar_year_monh.Visible = ib_bank_cost_admin
end event

type dw_1 from wb_single_tb`dw_1 within w_banco
integer width = 4503
integer height = 2032
string dataobject = "dw_banco"
end type

event dw_1::buttonclicked;call super::buttonclicked;if dwo.name = 'b_ordenar_year_monh' then
	if is_orden = '' or is_orden = 'DESC' then 
		is_orden = 'ASC'
	else
		is_orden = 'DESC'
	end if
	
	this.setSort('YEARMONTH ' +  is_orden)
	this.sort()

end if 
end event

