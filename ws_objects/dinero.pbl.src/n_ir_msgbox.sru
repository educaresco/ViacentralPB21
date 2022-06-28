$PBExportHeader$n_ir_msgbox.sru
forward
global type n_ir_msgbox from internetresult
end type
end forward

global type n_ir_msgbox from internetresult
end type
global n_ir_msgbox n_ir_msgbox

forward prototypes
public function integer internetdata (blob data)
end prototypes

public function integer internetdata (blob data);
MessageBox("Returned HTML", String(data, EncodingANSI!))

Return 1


end function

on n_ir_msgbox.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ir_msgbox.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

