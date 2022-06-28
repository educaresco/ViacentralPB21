$PBExportHeader$n_cst_valores_globales.sru
forward
global type n_cst_valores_globales from nonvisualobject
end type
end forward

global type n_cst_valores_globales from nonvisualobject autoinstantiate
end type

type variables
Private:
	string 	is_stringvalue
	Decimal	idec_numericvalue
	
Public:
	string is_REPORT_DATA_LINE1, is_REPORT_DATA_LINE2, is_REPORT_DATA_LINE3, is_REPORT_DATA_LINE4, is_REPORT_DATA_LINE5,&
				is_REPORT_ADDRESS_LINE, is_LOGO, is_REPORT_PHONE_FAX
end variables

forward prototypes
public function boolean of_get_parameters (string as_idparameter)
public function string of_get_stringvalue ()
public function decimal of_get_numericvalue ()
public function boolean of_variables_reportes ()
end prototypes

public function boolean of_get_parameters (string as_idparameter);TRY
	SELECT 	stringvalue,
				numericvalue
	INTO		:is_stringvalue,
				:idec_numericvalue			
	FROM		DBA.PARAMETERS
	WHERE		IDPARAMETER = :as_idparameter;


THROW CREATE c_sqlexception
CATCH (c_sqlexception sql)
	sql.of_set_condicion("Parámetro: "+ as_idparameter)
	IF NOT sql.exception() THEN
		MessageBox("Error BD", sql.getmessage(), StopSign! )
		RollBack;
		Return FALSE
	END IF
CATCH (Exception ex)
	ex.classname()
	MessageBox(ex.classname(), ex.getMessage(),StopSign!)
	RETURN FALSE
END TRY

Return TRUE
end function

public function string of_get_stringvalue ();return is_stringvalue
end function

public function decimal of_get_numericvalue ();return idec_numericvalue
end function

public function boolean of_variables_reportes ();IF of_get_parameters("REPORT_DATA_LINE1") THEN 
	is_REPORT_DATA_LINE1= THIS.of_get_stringvalue()
ELSE
	RETURN FALSE
END IF

IF of_get_parameters("REPORT_DATA_LINE2") THEN 
	is_REPORT_DATA_LINE2= THIS.of_get_stringvalue()
ELSE
	RETURN FALSE
END IF

IF of_get_parameters("REPORT_DATA_LINE3") THEN 
	is_REPORT_DATA_LINE3= THIS.of_get_stringvalue()
ELSE
	RETURN FALSE
END IF

IF of_get_parameters("REPORT_DATA_LINE4") THEN 
	is_REPORT_DATA_LINE4= THIS.of_get_stringvalue()
ELSE
	RETURN FALSE
END IF

IF of_get_parameters("REPORT_ADDRESS_LINE") THEN 
	is_REPORT_ADDRESS_LINE= THIS.of_get_stringvalue()
ELSE
	RETURN FALSE
END IF

IF of_get_parameters("REPORT_DATA_LINE5") THEN 
	is_REPORT_DATA_LINE5= THIS.of_get_stringvalue()
ELSE
	RETURN FALSE
END IF

IF of_get_parameters("LOGO") THEN 
	is_logo= THIS.of_get_stringvalue()
ELSE
	RETURN FALSE
END IF



RETURN TRUE
end function

on n_cst_valores_globales.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_valores_globales.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//of_get_parameters()
end event

