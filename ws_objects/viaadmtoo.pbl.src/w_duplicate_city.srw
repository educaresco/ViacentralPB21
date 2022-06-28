$PBExportHeader$w_duplicate_city.srw
forward
global type w_duplicate_city from pfc_w_sheet
end type
type cb_close from commandbutton within w_duplicate_city
end type
type cb_deduplicate from commandbutton within w_duplicate_city
end type
type st_5 from statictext within w_duplicate_city
end type
type st_4 from statictext within w_duplicate_city
end type
type st_city2 from statictext within w_duplicate_city
end type
type st_city1 from statictext within w_duplicate_city
end type
type sle_city2 from singlelineedit within w_duplicate_city
end type
type sle_city1 from singlelineedit within w_duplicate_city
end type
type gb_1 from groupbox within w_duplicate_city
end type
end forward

global type w_duplicate_city from pfc_w_sheet
integer width = 2295
integer height = 812
boolean resizable = false
cb_close cb_close
cb_deduplicate cb_deduplicate
st_5 st_5
st_4 st_4
st_city2 st_city2
st_city1 st_city1
sle_city2 sle_city2
sle_city1 sle_city1
gb_1 gb_1
end type
global w_duplicate_city w_duplicate_city

on w_duplicate_city.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_deduplicate=create cb_deduplicate
this.st_5=create st_5
this.st_4=create st_4
this.st_city2=create st_city2
this.st_city1=create st_city1
this.sle_city2=create sle_city2
this.sle_city1=create sle_city1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_deduplicate
this.Control[iCurrent+3]=this.st_5
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_city2
this.Control[iCurrent+6]=this.st_city1
this.Control[iCurrent+7]=this.sle_city2
this.Control[iCurrent+8]=this.sle_city1
this.Control[iCurrent+9]=this.gb_1
end on

on w_duplicate_city.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_deduplicate)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_city2)
destroy(this.st_city1)
destroy(this.sle_city2)
destroy(this.sle_city1)
destroy(this.gb_1)
end on

type cb_close from commandbutton within w_duplicate_city
integer x = 1874
integer y = 588
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_deduplicate from commandbutton within w_duplicate_city
integer x = 448
integer y = 400
integer width = 503
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Deduplicate"
end type

event clicked;
String ls_buena, ls_mala, ls_state_buena
Integer li_FileNum

ls_buena = sle_city1.text
ls_mala = sle_city2.text

select c2.id_state
  into :ls_state_buena
  from dba.city c2
 where c2.id_city = :ls_buena;

ls_state_buena = trim(ls_state_buena)

if left(st_city1.text,5) <> left(st_city2.text,5) or trim(st_city1.text) = "" then
	MessageBox("Ojo","Revise las ciudades")
	return
end if

SetPointer(HourGlass!)

update dba.branch set id_city = :ls_buena, id_state = :ls_state_buena where id_city = :ls_mala;
IF SQLCA.SQLCode <> 0 then
	Messagebox("Error 1",SQLCA.SQLErrText)	
END IF
update dba.cubrimiento_branch set id_city = :ls_buena, id_state = :ls_state_buena where id_city = :ls_mala;
IF SQLCA.SQLCode <> 0 then
	Messagebox("Error 2",SQLCA.SQLErrText)	
END IF
update dba.city set flag_city = 'I' where id_city = :ls_mala;
IF SQLCA.SQLCode <> 0 then
	Messagebox("Error 3",SQLCA.SQLErrText)	
END IF
update dba.city set flag_city = 'A' where id_city = :ls_buena;
IF SQLCA.SQLCode <> 0 then
	Messagebox("Error 4",SQLCA.SQLErrText)	
END IF
update dba.receiver set id_city_receiver = :ls_buena, id_state_receiver = :ls_state_buena where id_city_receiver = :ls_mala;
IF SQLCA.SQLCode <> 0 then
	Messagebox("Error 5",SQLCA.SQLErrText)	
END IF

insert into dba.EQ_CITY
select c1.id_city, c1.id_state, c1.id_country, c1.name_city,
       c2.id_city, c2.id_state, c2.id_country, c2.name_city, 'Y'
  from dba.city c1, dba.city c2
 where c1.id_city = :ls_mala
   and c2.id_city = :ls_buena;

IF SQLCA.SQLCode <> 0 then
	Messagebox("Error 6",SQLCA.SQLErrText)	
END IF

commit;

DELETE FROM DBA.cubrimiento_branch WHERE ID_CITY = :ls_mala;
DELETE FROM DBA.CITY WHERE ID_CITY = :ls_mala;

IF SQLCA.SQLCode <> 0 then
	Messagebox("Error 7 - "+ls_mala,SQLCA.SQLErrText)	
END IF

li_FileNum = FileOpen("C:\PublishFixDuplicateCities.SQL", LineMode!, Write!, LockWrite!, Append!)

FileWrite(li_FileNum, "// Remplaza "+ls_mala+" por "+ls_buena)
FileWrite(li_FileNum, "UPDATE DBA.BRANCH SET ID_CITY = '"+ls_buena+"', ID_STATE = '"+ls_state_buena+"' WHERE ID_CITY = '"+ls_mala+"';")
FileWrite(li_FileNum, "UPDATE DBA.CUBRIMIENTO_BRANCH SET ID_CITY = '"+ls_buena+"', id_state = '"+ls_state_buena+"' WHERE ID_CITY = '"+ls_mala+"';")
FileWrite(li_FileNum, "UPDATE DBA.CITY SET FLAG_CITY = 'I' WHERE ID_CITY = '"+ls_mala+"';")
FileWrite(li_FileNum, "UPDATE DBA.CITY SET FLAG_CITY = 'A' WHERE ID_CITY = '"+ls_buena+"';")
FileWrite(li_FileNum, "UPDATE DBA.RECEIVER SET ID_CITY_RECEIVER = '"+ls_buena+"', ID_STATE_RECEIVER = '"+ls_state_buena+"' WHERE ID_CITY_RECEIVER = '"+ls_mala+"';")
FileWrite(li_FileNum, "DELETE FROM DBA.cubrimiento_branch WHERE ID_CITY = '"+ls_mala+"';")
FileWrite(li_FileNum, "DELETE FROM DBA.CITY WHERE ID_CITY = '"+ls_mala+"';")
FileWrite(li_FileNum, "COMMIT;")

FileClose(li_FileNum)

SetPointer(Arrow!)
end event

type st_5 from statictext within w_duplicate_city
integer x = 87
integer y = 248
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ciudad Mala :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_duplicate_city
integer x = 87
integer y = 140
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ciudad Buena :"
boolean focusrectangle = false
end type

type st_city2 from statictext within w_duplicate_city
integer x = 773
integer y = 244
integer width = 1381
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_city1 from statictext within w_duplicate_city
integer x = 773
integer y = 136
integer width = 1381
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type sle_city2 from singlelineedit within w_duplicate_city
integer x = 443
integer y = 232
integer width = 325
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;String ls_id_city, ls_name_city
Long ll_cont

ls_id_city = sle_city2.text

SELECT NAME_CITY
  INTO :ls_name_city
 FROM DBA.CITY
 WHERE ID_CITY = :ls_id_city;
 
SELECT count(*)
  INTO :ll_cont
  FROM dba.BRANCH
 WHERE id_city = :ls_id_city; 
 
st_city2.TEXT = ls_name_city+ ' ('+string(ll_cont)+' Branches)';

end event

type sle_city1 from singlelineedit within w_duplicate_city
integer x = 443
integer y = 124
integer width = 325
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;String ls_id_city, ls_name_city
Long ll_cont

ls_id_city = sle_city1.text

SELECT NAME_CITY
  INTO :ls_name_city
 FROM DBA.CITY
 WHERE ID_CITY = :ls_id_city;
 
SELECT count(*)
  INTO :ll_cont
  FROM dba.BRANCH
 WHERE id_city = :ls_id_city; 
 
st_city1.TEXT = ls_name_city+ ' ('+string(ll_cont)+' Branches)';

end event

type gb_1 from groupbox within w_duplicate_city
integer x = 41
integer y = 44
integer width = 2176
integer height = 324
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

