$PBExportHeader$w_valakosfunding.srw
forward
global type w_valakosfunding from pfc_w_response
end type
type st_1 from statictext within w_valakosfunding
end type
type pb_1 from hprogressbar within w_valakosfunding
end type
end forward

global type w_valakosfunding from pfc_w_response
integer width = 1504
integer height = 260
string title = "Verificando Fondos"
st_1 st_1
pb_1 pb_1
end type
global w_valakosfunding w_valakosfunding

type variables
String is_id_branch
Double id_id_receiver
end variables

event open;call super::open;

is_id_branch = fn_token(Message.StringParm,'*',1)
id_id_receiver = double(fn_token(Message.StringParm,'*',2))

if not isnull(is_id_branch) and len(trim(is_id_branch)) > 3 and &
	not isnull(id_id_receiver) and id_id_receiver > 0 then
		
	pb_1.position = 0
	Timer (1.2)	
	
else

	close(this)
end if

	

end event

event timer;call super::timer;// w_valakosfunding
String ls_res_success, ls_res_reason, ls_response
String ls_details, ls_id_flag
Decimal ld_available_funds


if pb_1.position < 100 then
	
	pb_1.position += 10

	Setnull(ls_res_success)

	SELECT TOP 1 RES_SUCCESS, RES_REASON_DESCRIPTION, RESPONSE_TEXT, RES_AVAILABLE_FUNDS
	INTO :ls_res_success, :ls_res_reason, :ls_response, :ld_available_funds
	FROM dba.AKOS_RECEIVER_RESPONSES
	WHERE ID_BRANCH = :is_id_branch
	AND ID_RECEIVER = :id_id_receiver
	ORDER BY ID_REQUEST DESC;


	If isnull(ls_res_success) then
		// continua hasta que pasen los 10 segundos!
		
	elseif ls_res_success = 'T' then
		
		Timer(0)
		Messagebox("Confirmación","Los fondos fueron verificados satisfactoriamente con el operados celular.~n~rEl cliente recibirá un mensaje de texto con la información de la transacción.",Information!)		
		close(this)
		
	elseif ls_res_success = 'F' then
		
		Timer(0)
	
		if trim(ls_res_reason) = 'INSUFFICIENT FUNDS.' then
						
			if isnull(ld_available_funds) then ld_available_funds = 0
								
			ls_details = 'FONDOS INSUFICIENTES (FONDOS DISPONIBLES: $' + String(ld_available_funds,"###,##0.00") +')'
		
		elseif trim(ls_res_reason) = 'FUNDING SOURCE ERROR.' then
			
			ls_details = 	'ERROR EN LA VALIDACION DE FONDOS'
			
		elseif LEFT(ls_res_reason,23) = 'REMIT FUNDS NOT ALLOWED' then
			
			ls_details = 	'LOS FONDOS DISPONIBLES NO SON VALIDOS PARA REMESAS'			
		
		end if
	
		Messagebox("Confirmación","La transacción no puede ser completada.~n~rMensaje del Operador Celular: "+ ls_details,Exclamation!)
				
		SELECT id_flag_receiver
		INTO :ls_id_flag
		FROM dba.RECEIVER
		WHERE ID_BRANCH = :is_id_branch
		AND ID_RECEIVER = :id_id_receiver;
		
		if ls_id_flag = 'A' or ls_id_flag = 'C' then
		
			if ld_available_funds <> 0 then
				Messagebox("Notificación","Es posible hacer una transaccion por menos de $"+String(ld_available_funds,"###,##0.00")+"~n~ro es necesario que el cliente deposite más fondos antes de repetir la transacción.")
			else
				Messagebox("Notificación","Es necesario que el cliente deposite más fondos antes de repetir la transacción.")				
			end if
		
		end if
				
		close(this)
		
	else
		
		Timer(0)
		Messagebox("Alerta","Verificación de fondos en proceso, debe revisar el status de la orden en unos minutos.~n~rEl cliente recibirá un mensaje de texto una vez la orden haya sido confirmada.",Exclamation!)
		close(this)
		
	end if

else
	
	Timer(0)
	Messagebox("Alerta","Verificación de fondos en proceso, debe revisar el status de la orden en unos minutos.~n~rEl cliente recibirá un mensaje de texto una vez la orden haya sido confirmada.",Exclamation!)
	close(this)
	
end if
end event

on w_valakosfunding.create
int iCurrent
call super::create
this.st_1=create st_1
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.pb_1
end on

on w_valakosfunding.destroy
call super::destroy
destroy(this.st_1)
destroy(this.pb_1)
end on

type st_1 from statictext within w_valakosfunding
integer x = 27
integer y = 28
integer width = 1426
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Verificando fondos con el operador celular... Por favor Espere..."
boolean focusrectangle = false
end type

type pb_1 from hprogressbar within w_valakosfunding
integer x = 23
integer y = 96
integer width = 1454
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 20
end type

