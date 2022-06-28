$PBExportHeader$w_base_query.srw
$PBExportComments$Window to do querys.
forward
global type w_base_query from w_sheet
end type
type dw_1 from u_dw within w_base_query
end type
type pb_query from u_pb within w_base_query
end type
type pb_exit from u_pb within w_base_query
end type
type st_count from statictext within w_base_query
end type
type pb_clean from u_pb within w_base_query
end type
type pb_pick from u_pb within w_base_query
end type
type pb_sort from u_pb within w_base_query
end type
end forward

global type w_base_query from w_sheet
integer width = 1934
integer height = 684
long backcolor = 80269524
dw_1 dw_1
pb_query pb_query
pb_exit pb_exit
st_count st_count
pb_clean pb_clean
pb_pick pb_pick
pb_sort pb_sort
end type
global w_base_query w_base_query

type variables
Boolean lb_ent, ib_modified=FALSE
String	is_ori_sql, is_mod_sql
end variables

event closequery;// DO NOT DELETE 
end event

on w_base_query.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.pb_query=create pb_query
this.pb_exit=create pb_exit
this.st_count=create st_count
this.pb_clean=create pb_clean
this.pb_pick=create pb_pick
this.pb_sort=create pb_sort
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.pb_query
this.Control[iCurrent+3]=this.pb_exit
this.Control[iCurrent+4]=this.st_count
this.Control[iCurrent+5]=this.pb_clean
this.Control[iCurrent+6]=this.pb_pick
this.Control[iCurrent+7]=this.pb_sort
end on

on w_base_query.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.pb_query)
destroy(this.pb_exit)
destroy(this.st_count)
destroy(this.pb_clean)
destroy(this.pb_pick)
destroy(this.pb_sort)
end on

event open;call super::open;Hide()
X=1
Y=1
Show()
end event

event pfc_save;// DO NOT DELETE 

Return 1 
end event

type dw_1 from u_dw within w_base_query
integer x = 18
integer y = 16
integer width = 1426
integer height = 348
integer taborder = 10
boolean bringtotop = true
boolean hscrollbar = true
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;of_SetTransObject(SQLCA)
of_setsort(TRUE)
inv_sort.of_SetStyle(1)
dw_1.Object.DataWindow.QueryMode = "yes"

is_ori_sql=	Describe("DataWindow.Table.Select")
end event

event editchanged;IF pb_pick.default THEN
	pb_pick.default = FALSE
	pb_query.default =  TRUE
END IF
end event

event itemchanged;call super::itemchanged;IF pb_pick.default THEN
	pb_pick.default = FALSE
	pb_query.default =  TRUE
END IF

ib_modified=TRUE
end event

event retrieveend;call super::retrieveend;SetPointer(Arrow!)
SetRedraw(TRUE)
IF GetRow() > 0 THEN
	IF Object.DataWindow.QueryMode = "yes"  THEN
		st_count.text = 'Type the info that you want to search'	
	ELSE
		st_count.text = String(Getrow()) + ' of ' + String(RowCount) + ' found.'
	END IF

ELSE
	st_count.text = 'Total Records : '+String(RowCount)
END IF
end event

event retrievestart;call super::retrievestart;SetPointer(HourGlass!)
SetRedraw(FALSE)
end event

event rowfocuschanged;call super::rowfocuschanged;IF currentrow > 0 THEN
	IF Object.DataWindow.QueryMode = "yes"  THEN
		st_count.text = 'Type the info that you want to search'	
	ELSE
		st_count.text = String(currentrow) + ' of ' + String(RowCount()) + ' found.'
	END IF
ELSE
	st_count.text = 'Total Records : '+String(RowCount())
END IF
end event

event sqlpreview;call super::sqlpreview;Integer li_file, li_start, li_end, li_cont, li_iniline, li_endline, li_tot_tab, li_ini, li_fin
String ls_cad, ls_sql, ls_line
Boolean	lb_cad=FALSE

IF POS(sqlsyntax,'UPDATE')>0 OR POS(sqlsyntax,'update')>0 OR POS(sqlsyntax,'DELETE')>0 or POS(sqlsyntax,'delete')>0 THEN
	Return
END IF

IF NOT lb_ent THEN
	Return
END IF

IF NOT ib_modified THEN
	Return
END IF

//MessageBox('SQL',sqlsyntax)

li_start=Pos(sqlsyntax,'(((')
li_end=Pos(sqlsyntax,')))')

IF Pos(sqlsyntax,'where') >0 THEN
	ls_sql = Left(sqlsyntax,Pos(sqlsyntax,'where') - 1)
ELSEIF Pos(sqlsyntax,'WHERE') >0 THEN
	ls_sql = Left(sqlsyntax,Pos(sqlsyntax,'WHERE') - 1)
ELSE
	Return
END IF

ls_sql += 'WHERE (('

FOR li_start=Pos(sqlsyntax,'(((') TO li_end
	IF Mid(sqlsyntax,li_start+2,1) = '(' THEN
		li_iniline = li_start + 2
		lb_cad=TRUE
	END IF

	IF Mid(sqlsyntax,li_start+2,1) = ')' AND Mid(sqlsyntax,li_start+3,1) <> ')' THEN
		li_endline = li_start + 2
		ls_cad = Mid(sqlsyntax, li_iniline, li_endline - li_iniline + 1)

		IF pos(ls_cad,')))') > 0 THEN
			ls_cad=Mid(ls_cad,1,len(ls_cad) - 2)
		END IF
		
	   ls_cad = Mid(ls_cad,2,Len(ls_cad) - 1)
		ls_cad = Left(ls_cad,Len(ls_cad) - 1)
		
		ls_line = Left(ls_cad,Pos(ls_cad,"="))
		li_ini=Pos(ls_cad,"'")
		li_fin=Pos(ls_cad,"'",li_ini+1)
		
		IF li_ini>0 AND li_fin>0 THEN //It's a string, or a date or a time

//			ls_cad=Mid(ls_cad,Pos(ls_cad,"'")+1,Len(ls_cad)-1)
			ls_cad=Mid(ls_cad,li_ini+1,li_fin - li_ini)
			ls_cad=Left(ls_cad,Len(ls_cad)-1)
			ls_cad=Trim(ls_cad)
			IF IsDate(ls_cad) OR (Pos(ls_cad,":") = 3 AND Pos(ls_cad,":",4) = 6) THEN
				// Do not put '%' It's a date
				ls_cad = "'"+ls_cad+"'" 
			ELSE
				ls_cad="'%"+ls_cad+"%'"  // It's a String
				ls_line = Left(ls_line,Len(ls_line) - 1) + " like "
			END IF
		ELSE  // It's a number
			ls_cad = Mid(ls_cad,Pos(ls_cad,"=")+1,Len(ls_cad)-1)
		END IF
		
		ls_sql += '( ' + ls_line + ls_cad + ' ) and '
		
		//MessageBox("CADENA",ls_line + ls_cad)

		lb_cad = FALSE
	END IF
NEXT

String ls_tmp

ls_sql = Left(ls_sql,Len(ls_sql)-4)+"))"

IF Pos(is_ori_sql,'where') >0  THEN
	ls_sql = is_ori_sql+ ' and ' + Mid(ls_sql,Pos(ls_sql,'where') + 5,Len(ls_sql) - Pos(ls_sql,'where') + 5)
ELSEIF Pos(is_ori_sql,'WHERE') >0 THEN
	ls_sql = is_ori_sql+ ' and ' + Mid(ls_sql,Pos(ls_sql,'WHERE') + 5,Len(ls_sql) - Pos(ls_sql,'WHERE') + 5)
END IF

//li_start=Pos(sqlsyntax,'WHERE')+5
//ls_sql = sqlsyntax + ' and ' + Mid(ls_sql,Pos(sqlsyntax,'WHERE') + 5,Len(sqlsyntax) - Pos(sqlsyntax,'WHERE') + 5)
ls_tmp=''
FOR li_start=1 TO len(ls_sql)
	IF Mid(ls_sql,li_start,1) = '~~' THEN
		
	ELSE
		ls_tmp+=Mid(ls_sql,li_start,1)
	END IF
NEXT

ls_sql=ls_tmp

//MessageBox('SQL BUILT',ls_sql)

is_mod_sql=ls_sql

SetSQLPreview(ls_sql)

//MessageBox('SQL',sqlsyntax+'\'+String(Pos (sqlsyntax,'((('))+'\'+String(Pos (sqlsyntax,')))')))
//li_file=FileOpen("c:\Fastlube\deleteme.txt", LineMode!, Write!, LockWrite!, Replace!)
//FileWrite(li_file,ls_sql)
//FileClose(li_file)
end event

event pfc_prermbmenu;am_dw.m_table.m_insert.enabled=False
am_dw.m_table.m_addrow.enabled=False
am_dw.m_table.m_delete.enabled=False
end event

type pb_query from u_pb within w_base_query
integer x = 375
integer y = 452
integer height = 100
integer taborder = 20
boolean bringtotop = true
string text = "&Query"
boolean default = true
end type

event clicked;dw_1.accepttext()
IF dw_1.Object.Datawindow.QueryMode = "no" THEN
	dw_1.Object.DataWindow.QueryMode = "yes"
ELSE
	dw_1.Object.DataWindow.QueryMode = "no"

	lb_ent=TRUE
	
	IF dw_1.retrieve()>0 THEN
		pb_pick.default = TRUE
		default = FALSE
	ELSE
		default = TRUE
	END IF
	
	dw_1.SetFocus()
END IF
end event

type pb_exit from u_pb within w_base_query
integer x = 1513
integer y = 452
integer height = 100
integer taborder = 30
boolean bringtotop = true
string text = "&Exit"
boolean cancel = true
end type

event clicked;Parent.Event pfc_close()
end event

type st_count from statictext within w_base_query
integer x = 18
integer y = 376
integer width = 1179
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_clean from u_pb within w_base_query
integer x = 18
integer y = 452
integer height = 100
integer taborder = 50
boolean bringtotop = true
string text = "&Clean"
end type

event clicked;SetRedraw(FALSE)
dw_1.Reset()
dw_1.Object.DataWindow.QueryMode = "yes"
dw_1.Object.DataWindow.QueryClear = "yes"
dw_1.SetFilter('')
dw_1.Filter()
dw_1.SetFocus()
pb_query.default = TRUE
pb_pick.default = FALSE
SetRedraw(TRUE)
ib_modified=FALSE


end event

type pb_pick from u_pb within w_base_query
integer x = 731
integer y = 452
integer height = 100
integer taborder = 40
boolean bringtotop = true
string text = "&Pick It Up"
end type

event clicked;
pb_query.default = TRUE
end event

type pb_sort from u_pb within w_base_query
integer x = 1088
integer y = 452
integer height = 100
integer taborder = 40
boolean bringtotop = true
string text = "&Sort"
end type

event clicked;dw_1.Event pfc_sortdlg()
end event

