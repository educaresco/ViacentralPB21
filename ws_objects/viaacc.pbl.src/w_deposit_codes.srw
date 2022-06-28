$PBExportHeader$w_deposit_codes.srw
forward
global type w_deposit_codes from wb_single_tb
end type
end forward

global type w_deposit_codes from wb_single_tb
int Width=2784
int Height=1716
boolean TitleBar=true
string Title="Deposit Codes"
end type
global w_deposit_codes w_deposit_codes

on w_deposit_codes.create
call super::create
end on

on w_deposit_codes.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_single_tb`dw_1 within w_deposit_codes
int Width=2725
int Height=1516
boolean BringToTop=true
string DataObject="dw_deposit_codes"
end type

event dw_1::dberror;call super::dberror;integer li_return

li_return = 1

CHOOSE CASE sqldbcode

CASE -193 // "Primary key for table ’%1’ is not unique"
		MessageBox("Database Error", "The record is already in the database.",StopSign!)	
CASE -194 // "No primary key value for foreign key ’%1’ in table ’%2’
		MessageBox("Database Error", "One of the referenced fields does not exists.",StopSign!)
CASE 233 // "Column ’%1’ in table ’%2’ cannot be NULL"
		MessageBox("Database Error", "A mandatory field has been omited.",StopSign!)
CASE -196 // "Index ’%1’ for table ’%2’ would not be unique"
		MessageBox("Database Error", "One of the fields could not be duplicated.",StopSign!)
CASE -198 // "Primary key for row in table ’%1’ is referenced in another table"
		MessageBox("Database Error", "One of the record you are deleting is referenced by another record.",StopSign!)
CASE -207 //"Wrong number of values for INSERT"
		MessageBox("Database Error", "Wrong number of values when inserting record -Notify the developer-.",StopSign!)
CASE 546 //"Invalid foreing key (multiple columns)"
		MessageBox("Database Error", "One or more of the referenced fields does not match.",StopSign!)
CASE ELSE
		MessageBox("Database Error", "Unknown Error Number: "+string(sqldbcode),StopSign!)
		//// Display the defalt error message!
		//li_return = 0
END CHOOSE

RETURN li_return
end event

