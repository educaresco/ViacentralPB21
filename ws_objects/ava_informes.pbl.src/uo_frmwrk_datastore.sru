$PBExportHeader$uo_frmwrk_datastore.sru
forward
global type uo_frmwrk_datastore from datastore
end type
end forward

global type uo_frmwrk_datastore from datastore
string DataObject="d_frmwrk_parametro_lista"
end type
global uo_frmwrk_datastore uo_frmwrk_datastore

on uo_frmwrk_datastore.create
call datastore::create
TriggerEvent( this, "constructor" )
end on

on uo_frmwrk_datastore.destroy
call datastore::destroy
TriggerEvent( this, "destructor" )
end on

