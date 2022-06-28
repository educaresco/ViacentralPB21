$PBExportHeader$c_sqlexception.sru
forward
global type c_sqlexception from exception
end type
end forward

global type c_sqlexception from exception
end type
global c_sqlexception c_sqlexception

type variables
Private:
	String is_condicion='.'
end variables

forward prototypes
public function boolean exception ()
public function boolean exception (boolean ab_issqlcode100exception)
public subroutine of_set_condicion (string as_condicion)
end prototypes

public function boolean exception ();//*****************************************************************************************
// 
// Function - c_SQLException.Exception
// 
// Description:
//     Standard Exception call. This funcion must be called after each embedded SQL statement 
//		 that you want protect.
//                                                                                         
// Arguments:	(None)
//
// Returns:	(boolean): 
//		 if the most recient embedded SQL statement failed
//
// Date       Prog.      Desc.
//-----------------------------------------------------------------------------------------
// 10/09/2000  JM         Initial version.
//
//*****************************************************************************************

RETURN This.Exception( FALSE )
end function

public function boolean exception (boolean ab_issqlcode100exception);string	ls_message

//IF (NOT ab_isSQLCode100Exception ) THEN
//	RETURN FALSE
//END IF

CHOOSE CASE Sqlca.SQLCode
	CASE 100
		ls_message= "No se halló uno o más registros para la siguiente condición:~r~n" + is_condicion
		//En el objeto que se invoca se pueden colocar los parámetros que se enviaron al SQL
		setmessage( ls_message)
		Return False
	CASE 0
		RETURN TRUE
	CASE -1
		ls_message = "A database error has occurred.~r~n~r~n~r~n" + &
				"Database error code:  " + String (sqlca.sqldbcode) + "~r~n~r~n" + &
				"Database error message:~r~n" + sqlca.sqlerrtext
		setmessage( ls_message)
	RETURN FALSE
END CHOOSE
end function

public subroutine of_set_condicion (string as_condicion);is_condicion= as_condicion
end subroutine

on c_sqlexception.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_sqlexception.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

