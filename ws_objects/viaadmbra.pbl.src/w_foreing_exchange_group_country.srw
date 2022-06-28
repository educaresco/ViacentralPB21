$PBExportHeader$w_foreing_exchange_group_country.srw
forward
global type w_foreing_exchange_group_country from wb_single_tb
end type
end forward

global type w_foreing_exchange_group_country from wb_single_tb
int Height=1564
end type
global w_foreing_exchange_group_country w_foreing_exchange_group_country

on w_foreing_exchange_group_country.create
call super::create
end on

on w_foreing_exchange_group_country.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_foreing_exchange_group_country
int Width=2432
boolean BringToTop=true
string DataObject="dddw_foreing_exchange_group_country"
end type

