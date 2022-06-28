$PBExportHeader$w_bank_routing.srw
forward
global type w_bank_routing from wb_single_tb
end type
type cb_1 from commandbutton within w_bank_routing
end type
type gb_1 from groupbox within w_bank_routing
end type
type rb_full from radiobutton within w_bank_routing
end type
type rb_incremental from radiobutton within w_bank_routing
end type
type sle_filename from singlelineedit within w_bank_routing
end type
type cb_import from commandbutton within w_bank_routing
end type
type cb_2 from commandbutton within w_bank_routing
end type
type st_1 from statictext within w_bank_routing
end type
end forward

global type w_bank_routing from wb_single_tb
integer width = 3694
integer height = 1796
string title = "Bank Routing"
cb_1 cb_1
gb_1 gb_1
rb_full rb_full
rb_incremental rb_incremental
sle_filename sle_filename
cb_import cb_import
cb_2 cb_2
st_1 st_1
end type
global w_bank_routing w_bank_routing

on w_bank_routing.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.gb_1=create gb_1
this.rb_full=create rb_full
this.rb_incremental=create rb_incremental
this.sle_filename=create sle_filename
this.cb_import=create cb_import
this.cb_2=create cb_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.rb_full
this.Control[iCurrent+4]=this.rb_incremental
this.Control[iCurrent+5]=this.sle_filename
this.Control[iCurrent+6]=this.cb_import
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.st_1
end on

on w_bank_routing.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.rb_full)
destroy(this.rb_incremental)
destroy(this.sle_filename)
destroy(this.cb_import)
destroy(this.cb_2)
destroy(this.st_1)
end on

type dw_1 from wb_single_tb`dw_1 within w_bank_routing
integer y = 168
integer width = 3589
integer height = 1436
integer taborder = 40
string dataobject = "dw_bank_routings"
end type

type cb_1 from commandbutton within w_bank_routing
integer x = 338
integer y = 36
integer width = 581
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Download File"
end type

event clicked;run("explorer https://www.fededirectory.frb.org/download.cfm", Maximized!)
end event

type gb_1 from groupbox within w_bank_routing
integer x = 965
integer width = 654
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Import Type"
end type

type rb_full from radiobutton within w_bank_routing
string tag = "Deletes all the actual data and insert data in the file."
integer x = 1006
integer y = 56
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Full"
boolean checked = true
end type

type rb_incremental from radiobutton within w_bank_routing
string tag = "Update actual data/Insert new data."
integer x = 1221
integer y = 56
integer width = 375
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Incremental"
end type

type sle_filename from singlelineedit within w_bank_routing
integer x = 1787
integer y = 48
integer width = 567
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_import from commandbutton within w_bank_routing
integer x = 2688
integer y = 36
integer width = 485
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Import"
end type

event clicked;long ll_fileread, li_FileNum
string ls_filename, ls_cadena
string ls_BANK_ROUTING, ls_BANK_NAME, ls_BANK_ADDRESS, ls_BANK_CITY, ls_BANK_STATE, ls_BANK_ZIP, ls_BANK_PHONE

ls_filename = sle_filename.text

if not fileexists(ls_filename) then
	Messagebox("Error","File ["+ls_filename+"] not found.~nPlease select the file name and location",stopsign!)
	return
end if

Setpointer(Hourglass!)

if rb_full.checked then
	DELETE FROM DBA.BANK_ROUTINGS;
	COMMIT;
	dw_1.retrieve()
end if

li_FileNum = FileOpen(ls_filename,LineMode!, Read!, LockRead!)
ll_fileread  = FileRead(li_FileNum, ls_cadena)

DO WHILE ll_fileread > 0

	ls_BANK_ROUTING = Trim(left(ls_cadena,9))
	ls_BANK_NAME    = Trim(Mid(ls_cadena,36,36))
	ls_BANK_ADDRESS = Trim(Mid(ls_cadena,72,36))	
	ls_BANK_CITY    = Trim(Mid(ls_cadena,108,20))
	ls_BANK_STATE   = Trim(Mid(ls_cadena,128,2))
	ls_BANK_ZIP     = Trim(Mid(ls_cadena,130,5))
	ls_BANK_PHONE   = Trim(Mid(ls_cadena,139,10))	
	
	  INSERT INTO dba.BANK_ROUTINGS  
         ( BANK_ROUTING,   
           BANK_NAME,   
           BANK_ADDRESS,   
           BANK_CITY,   
           BANK_STATE,   
           BANK_ZIP,   
           BANK_PHONE )  
	  VALUES ( :ls_BANK_ROUTING,   
				  :ls_BANK_NAME,   
				  :ls_BANK_ADDRESS,   
				  :ls_BANK_CITY,   
				  :ls_BANK_STATE,   
				  :ls_BANK_ZIP,   
				  :ls_BANK_PHONE );

	if SQLCA.SQLCode <> 0 then
		if not rb_incremental.checked then		
			messagebox("Error",SQLCA.SQLErrText)
		end if
	end if	

	if rb_incremental.checked then
	
	  UPDATE dba.BANK_ROUTINGS  
		  SET BANK_NAME = :ls_BANK_NAME,   
				BANK_ADDRESS = :ls_BANK_ADDRESS,   
				BANK_CITY = :ls_BANK_CITY,   
				BANK_STATE = :ls_BANK_STATE,   
				BANK_ZIP = :ls_BANK_ZIP,   
				BANK_PHONE = :ls_BANK_PHONE  
				WHERE BANK_ROUTING = :ls_BANK_ROUTING;
		if SQLCA.SQLCode <> 0 then
			messagebox("Error",SQLCA.SQLErrText)
		end if	
	
	end if

	ll_fileread  = FileRead(li_FileNum, ls_cadena)	
LOOP

FileClose(li_FileNum)

dw_1.retrieve()
end event

type cb_2 from commandbutton within w_bank_routing
integer x = 2359
integer y = 48
integer width = 210
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consult"
end type

event clicked;string docname, named

integer value
value = GetFileOpenName("Select File", &
+ docname, named, "TXT", &
	+ "Text Files (*.TXT),*.TXT," &
	+ "All Files (*.*),*.*")

IF value = 1 THEN sle_filename.text = docname

end event

type st_1 from statictext within w_bank_routing
integer x = 1641
integer y = 48
integer width = 137
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "File :"
alignment alignment = right!
boolean focusrectangle = false
end type

