$PBExportHeader$n_my_string.sru
forward
global type n_my_string from n_cst_string
end type
end forward

global type n_my_string from n_cst_string
end type

forward prototypes
public function boolean of_isprintable (string as_source)
end prototypes

public function boolean of_isprintable (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsPrintable
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Printable characters.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string is composed entirely of 
//						Printable characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if NonPrintable character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	// 'space'=32, '~'=126
	if li_ascii<32 or li_ascii>126 then
//		messagebox("",string(li_ascii))
		/* Not a printable character */

		// Special chars added
		if pos(gs_specialallowedchars,lc_char[ll_count]) = 0 then		
			Return False
		end if
		
	end if
loop
	
// Entire string is of printable characters.
return True

end function

on n_my_string.create
call super::create
end on

on n_my_string.destroy
call super::destroy
end on

