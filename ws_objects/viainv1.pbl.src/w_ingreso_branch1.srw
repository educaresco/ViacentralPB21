$PBExportHeader$w_ingreso_branch1.srw
forward
global type w_ingreso_branch1 from w_sheet
end type
type em_1 from editmask within w_ingreso_branch1
end type
type st_1 from statictext within w_ingreso_branch1
end type
type cb_3 from commandbutton within w_ingreso_branch1
end type
type cb_insert_branch from commandbutton within w_ingreso_branch1
end type
type cb_delete_branch from commandbutton within w_ingreso_branch1
end type
type cb_update_branch from commandbutton within w_ingreso_branch1
end type
type cb_dadd from commandbutton within w_ingreso_branch1
end type
type cb_ddelete from commandbutton within w_ingreso_branch1
end type
type cb_dupdate from commandbutton within w_ingreso_branch1
end type
type cb_close from commandbutton within w_ingreso_branch1
end type
type dw_1 from u_dw within w_ingreso_branch1
end type
type tab_1 from tab within w_ingreso_branch1
end type
type tabpage_1 from userobject within tab_1
end type
type dw_2 from u_dw within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_2 dw_2
cb_1 cb_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_3 from u_dw within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_3 from userobject within tab_1
end type
type dw_4 from u_dw within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_4 dw_4
end type
type tabpage_4 from userobject within tab_1
end type
type dw_5 from u_dw within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_5 from userobject within tab_1
end type
type ddlb_agencystatus from dropdownlistbox within tabpage_5
end type
type st_6 from statictext within tabpage_5
end type
type st_11 from statictext within tabpage_5
end type
type st_2 from statictext within tabpage_5
end type
type st_3 from statictext within tabpage_5
end type
type st_4 from statictext within tabpage_5
end type
type st_creditavailable from statictext within tabpage_5
end type
type st_7 from statictext within tabpage_5
end type
type em_creditlimit from editmask within tabpage_5
end type
type st_8 from statictext within tabpage_5
end type
type st_agencyaverage from statictext within tabpage_5
end type
type st_9 from statictext within tabpage_5
end type
type st_numinv from statictext within tabpage_5
end type
type st_10 from statictext within tabpage_5
end type
type st_invoiceaverage from statictext within tabpage_5
end type
type tabpage_5 from userobject within tab_1
ddlb_agencystatus ddlb_agencystatus
st_6 st_6
st_11 st_11
st_2 st_2
st_3 st_3
st_4 st_4
st_creditavailable st_creditavailable
st_7 st_7
em_creditlimit em_creditlimit
st_8 st_8
st_agencyaverage st_agencyaverage
st_9 st_9
st_numinv st_numinv
st_10 st_10
st_invoiceaverage st_invoiceaverage
end type
type tabpage_6 from userobject within tab_1
end type
type dw_6 from u_dw within tabpage_6
end type
type tabpage_6 from userobject within tab_1
dw_6 dw_6
end type
type tab_1 from tab within w_ingreso_branch1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type
end forward

global type w_ingreso_branch1 from w_sheet
boolean visible = false
integer x = 91
integer y = 208
integer width = 3269
integer height = 2008
string title = "Search Branch"
long backcolor = 80269528
em_1 em_1
st_1 st_1
cb_3 cb_3
cb_insert_branch cb_insert_branch
cb_delete_branch cb_delete_branch
cb_update_branch cb_update_branch
cb_dadd cb_dadd
cb_ddelete cb_ddelete
cb_dupdate cb_dupdate
cb_close cb_close
dw_1 dw_1
tab_1 tab_1
end type
global w_ingreso_branch1 w_ingreso_branch1

type variables
Boolean ib_creditchanged = FALSE
end variables

on w_ingreso_branch1.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_insert_branch=create cb_insert_branch
this.cb_delete_branch=create cb_delete_branch
this.cb_update_branch=create cb_update_branch
this.cb_dadd=create cb_dadd
this.cb_ddelete=create cb_ddelete
this.cb_dupdate=create cb_dupdate
this.cb_close=create cb_close
this.dw_1=create dw_1
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_insert_branch
this.Control[iCurrent+5]=this.cb_delete_branch
this.Control[iCurrent+6]=this.cb_update_branch
this.Control[iCurrent+7]=this.cb_dadd
this.Control[iCurrent+8]=this.cb_ddelete
this.Control[iCurrent+9]=this.cb_dupdate
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.dw_1
this.Control[iCurrent+12]=this.tab_1
end on

on w_ingreso_branch1.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_insert_branch)
destroy(this.cb_delete_branch)
destroy(this.cb_update_branch)
destroy(this.cb_dadd)
destroy(this.cb_ddelete)
destroy(this.cb_dupdate)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.tab_1)
end on

event open;call super::open;X=1
Y=1
Show()

commit ;

dw_1.settransobject(sqlca)
dw_1.insertrow(0)
end event

type em_1 from editmask within w_ingreso_branch1
integer x = 425
integer width = 357
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event losefocus;string	ls_city,ls_state,ls_country

DataWindowChild ldw_cdw

if em_1.text = "" then return


if dw_1.retrieve(em_1.text) <> 0 then
	
/////////////////////////////

ls_country = dw_1.getitemstring(1,"id_country")
ls_state   = dw_1.getitemstring(1,"id_state")
ls_city   = dw_1.getitemstring(1,"id_city")

dw_1.GetChild('id_state',ldw_cdw)
ldw_cdw.SetTransObject(SQLCA)
ldw_cdw.SetFilter('')
ldw_cdw.Filter()
ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
ldw_cdw.Filter()
dw_1.setitem(1,"id_country",ls_country)
dw_1.setitem(1,"id_state",ls_state)

dw_1.GetChild('id_city',ldw_cdw)
ldw_cdw.SetTransObject(SQLCA)
ldw_cdw.SetFilter('')
ldw_cdw.Filter()
ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
ldw_cdw.Filter()
dw_1.setitem(1,"id_city",ls_city)
	
	
	/////////////////////////
	tab_1.Selectedtab = 1
	tab_1.tabpage_1.dw_2.retrieve(em_1.text)
else
	dw_1.reset()
	tab_1.tabpage_1.dw_2.reset()
	tab_1.tabpage_2.dw_3.reset()
	tab_1.tabpage_3.dw_4.reset()
	tab_1.tabpage_4.dw_5.reset()
	tab_1.tabpage_6.dw_6.reset()
end if
end event

event modified;string	ls_city,ls_state,ls_country

DataWindowChild ldw_cdw

if em_1.text = "" then return


if dw_1.retrieve(em_1.text) <> 0 then
	ls_country = dw_1.getitemstring(1,"id_country")
	ls_state   = dw_1.getitemstring(1,"id_state")
	ls_city   = dw_1.getitemstring(1,"id_city")
	
	dw_1.GetChild('id_state',ldw_cdw)
	ldw_cdw.SetTransObject(SQLCA)
	ldw_cdw.SetFilter('')
	ldw_cdw.Filter()
	ldw_cdw.SetFilter("id_country = '"+ls_country +"'")
	ldw_cdw.Filter()
	dw_1.setitem(1,"id_country",ls_country)
	dw_1.setitem(1,"id_state",ls_state)
	
	dw_1.GetChild('id_city',ldw_cdw)
	ldw_cdw.SetTransObject(SQLCA)
	ldw_cdw.SetFilter('')
	ldw_cdw.Filter()
	ldw_cdw.SetFilter("id_country = '"+ls_country +"' and id_state = '"+ ls_state +"'")
	ldw_cdw.Filter()
	dw_1.setitem(1,"id_city",ls_city)
		
	tab_1.Selectedtab = 1	
	tab_1.tabpage_1.dw_2.retrieve(em_1.text)	
ELSE
	dw_1.reset()
	tab_1.tabpage_1.dw_2.reset()
	tab_1.tabpage_2.dw_3.reset()
	tab_1.tabpage_3.dw_4.reset()
	tab_1.tabpage_4.dw_5.reset()
	tab_1.tabpage_6.dw_6.reset()
end if
end event

event getfocus;SelectText(1,Len(Text))
end event

type st_1 from statictext within w_ingreso_branch1
integer x = 73
integer y = 12
integer width = 343
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean enabled = false
string text = "Agency Code :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_ingreso_branch1
integer x = 791
integer width = 101
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;string 	ls_branch
Open(w_seleccionar_branch)
ls_branch = message.stringparm
em_1.text = ls_branch
em_1.setfocus()
end event

type cb_insert_branch from commandbutton within w_ingreso_branch1
integer x = 2199
integer y = 28
integer width = 302
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add Branch"
end type

event clicked;dw_1.reset()
tab_1.tabpage_1.dw_2.reset()
//	tab_1.tabpage_1.dw_3.reset()
dw_1.insertrow(1)

em_1.text = ""
end event

type cb_delete_branch from commandbutton within w_ingreso_branch1
integer x = 2816
integer y = 24
integer width = 329
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete Branch"
end type

event clicked;Long	ll_row
String	ls_branch

ll_row = dw_1.GetRow()

IF ll_row>0 THEN
	ls_branch=dw_1.Object.id_branch [ll_row]
	
	IF MessageBox("DELETE?","Are you sure that you want to delete this record.",Question!,YesNo!,2) = 2 THEN
		Return
	END IF
	
	DELETE FROM "branch"
   	   WHERE "branch"."id_branch" = :ls_branch   ;
	
	IF SQLCA.SQLCODE<>0 THEN
		MessageBOx("Error Deleting Branch","The error is : " + SQLCA.SQLERRTEXT)
		ROLLBACK ;
		Return
	END IF
	
	dw_1.reset()

	COMMIT ;
END IF
end event

type cb_update_branch from commandbutton within w_ingreso_branch1
integer x = 2505
integer y = 28
integer width = 306
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save Branch"
end type

event clicked;String	ls_branch, ls_statusold, ls_statusnew

if dw_1.rowcount() = 0 then
	return
end if

SELECT id_flag_branch
  INTO :ls_statusold
  FROM branch 
 WHERE id_branch = :ls_branch ;

ls_branch = dw_1.Object.id_branch[dw_1.GetRow()]

IF Len(ls_branch) <> 6 THEN
	MessageBox("Atention","The branch code must be 6 characters long.~r~nChange it and try it again.",Exclamation!)
	Return
END IF

IF dw_1.Object.id_type_branch[dw_1.GetRow()]='R' THEN
	dw_1.Object.currency_pay_branch[dw_1.GetRow()]='A'
END IF

dw_1.accepttext()

IF dw_1.update() = 1 THEN
   COMMIT ;
//	SELECT id_flag_branch
//	  INTO :ls_statusnew
//     FROM branch 
//    WHERE id_branch = :ls_branch ;
//
//  INSERT INTO branch_history  
//         ( brh_date,   
//           brh_time,   
//           id_user,   
//           id_branch,
//           brh_statusold,
//			  brh_statusnew)  
//  VALUES ( TODAY(*),   
//           NOW(*),   
//           :gs_cashier,   
//           :ls_branch,
//			  :ls_statusold,
//           :ls_statusnew)  ;
//
//	IF SQLCA.SQLCODE <> 0 THEN
//		MessageBox("Error","Updating branch history. ~r~n The error is : "+SQLCA.SQLERRTEXT,StopSign!)
//		ROLLBACK ;
//		Return
//	END IF
	
	COMMIT ;
ELSE
	Messagebox("Warning","There is something missing or wrong in the data.  ~r~nThe data has not been saved.")
	ROLLBACK ;
END IF
end event

type cb_dadd from commandbutton within w_ingreso_branch1
integer x = 46
integer y = 1772
integer width = 352
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add Details"
end type

event clicked;IF tab_1.selectedtab = 1 THEN
	tab_1.tabpage_1.dw_2.Event pfc_Addrow()
	tab_1.tabpage_1.dw_2.SetFocus()
ELSEIF tab_1.selectedtab = 2 THEN
	tab_1.tabpage_2.dw_3.Event pfc_Addrow()
	tab_1.tabpage_2.dw_3.SetFocus()
ELSEIF tab_1.selectedtab = 3 THEN
	tab_1.tabpage_3.dw_4.Event pfc_Addrow()
	tab_1.tabpage_3.dw_4.SetFocus()
ELSEIF tab_1.selectedtab = 4 THEN
	IF tab_1.tabpage_4.dw_5.RowCount() = 0 THEN
		tab_1.tabpage_4.dw_5.Event pfc_Addrow()
		tab_1.tabpage_4.dw_5.SetFocus()
	END IF
ELSEIF tab_1.selectedtab = 6 THEN
	IF tab_1.tabpage_6.dw_6.RowCount() = 0 THEN
		tab_1.tabpage_6.dw_6.Event pfc_Addrow()
		tab_1.tabpage_6.dw_6.SetFocus()
	END IF
END IF
end event

type cb_ddelete from commandbutton within w_ingreso_branch1
integer x = 1056
integer y = 1772
integer width = 352
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete Details"
end type

event clicked;IF tab_1.selectedtab = 1 THEN
	tab_1.tabpage_1.dw_2.Event pfc_deleterow()
	tab_1.tabpage_1.dw_2.SetFocus()
ELSEIF tab_1.selectedtab = 2 THEN
	tab_1.tabpage_2.dw_3.Event pfc_deleterow()
	tab_1.tabpage_2.dw_3.SetFocus()
ELSEIF tab_1.selectedtab = 3 THEN
	tab_1.tabpage_3.dw_4.Event pfc_deleterow()
	tab_1.tabpage_3.dw_4.SetFocus()
ELSEIF tab_1.selectedtab = 4 THEN
	tab_1.tabpage_4.dw_5.Event pfc_deleterow()
	tab_1.tabpage_4.dw_5.SetFocus()
END IF
end event

type cb_dupdate from commandbutton within w_ingreso_branch1
integer x = 407
integer y = 1772
integer width = 352
integer height = 92
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save Details"
end type

event clicked;Double	ld_creditlimit, ld_creditold
String	ls_group, ls_branch

tab_1.tabpage_1.dw_2.of_Update(TRUE,TRUE)
tab_1.tabpage_2.dw_3.of_Update(TRUE,TRUE)
tab_1.tabpage_3.dw_4.of_Update(TRUE,TRUE)
tab_1.tabpage_4.dw_5.of_Update(TRUE,TRUE)
tab_1.tabpage_6.dw_6.of_Update(TRUE,TRUE)

ls_branch = em_1.text

//IF ib_creditchanged THEN
//	SELECT id_main_branch
//	  INTO :ls_group
//	  FROM dba.branch
//	 WHERE id_branch = :ls_branch;
//	
//	SELECT debt_limit
//	  INTO :ld_creditold
//	  FROM dba.group_branch
//	 WHERE id_main_branch  = :ls_group;	
//		
//	ld_creditlimit = Double(tab_1.tabpage_5.em_creditlimit.text)
//	
//	UPDATE dba.group_branch
//		SET debt_limit = :ld_creditlimit,
//			ID_CASHIER_MODDEBITLIMIT = :gs_cashier
//	 WHERE id_main_branch = :ls_group ;
//		
//	IF SQLCA.SQLCODE <> 0 THEN
//		MessageBox("Error","Increasing credit limit. ~r~n The error is : "+SQLCA.SQLERRTEXT,StopSign!)
//		ROLLBACK ;
//		Return
//	END IF
////	
////	  INSERT INTO branch_history  
////         ( brh_date,   
////           brh_time,   
////           id_user,   
////           id_main_branch,   
////           brh_creditold,   
////           brh_creditnew )  
////  VALUES ( TODAY(*),   
////           NOW(*),   
////           :gs_cashier,   
////           :ls_group,   
////           :ld_creditold,   
////           :ld_creditlimit )  ;
////
////	IF SQLCA.SQLCODE <> 0 THEN
////		MessageBox("Error","Updating branch history. ~r~n The error is : "+SQLCA.SQLERRTEXT,StopSign!)
////		ROLLBACK ;
////		Return
////	END IF
//END IF

COMMIT ;
end event

type cb_close from commandbutton within w_ingreso_branch1
integer x = 2834
integer y = 1772
integer width = 352
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type dw_1 from u_dw within w_ingreso_branch1
integer width = 3209
integer height = 884
integer taborder = 20
string dataobject = "dw_ingreso_branch1"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;String 				ls_cod_cou, ls_cod_sta, ls_id_state, ls_id_city, ls_id_country
DataWindowChild	ldw_dw
String	ls_ziccode, ls_city, ls_state, ls_country
Long		ll_counter

// :::::::::::::::::::::::::::::::::::::::::::::::::::::::
// Si la marcan CERRADA, automaticamente se pone INACTIVA!
If dwo.name = "id_status_branch" Then
	If (data = 'C') Then
		dw_1.setItem(dw_1.GetRow(),"id_flag_branch","I")
	End If
	If (data = 'O') and dw_1.GetItemString(dw_1.GetRow(),"id_status_branch") = 'C' Then
		dw_1.setItem(dw_1.GetRow(),"id_flag_branch","A")
	End If		
End If
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::

IF dwo.name = "id_country" THEN
	IF Len(data) <= 5 THEN
		SELECT COUNT(*)
		  INTO :ll_counter
		  FROM dba.country
		 WHERE id_country = :data ;
		
		IF ll_counter <= 0 THEN
			Return 1
		END IF
	END IF
	
	GetChild("id_state",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	SetItem(GetRow(),"id_state","")
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetText()+"'")
	ldw_dw.Filter()


	SetItem(GetRow(),"id_city","")
	GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()

	IF GetItemString(GetRow(),"id_state") = '' OR IsNull(GetItemString(GetRow(),"id_state")) THEN
		ldw_dw.SetFilter("id_country = '"+GetText()+"'")
		ldw_dw.Filter()
	ELSE
		ldw_dw.SetFilter("id_country = '"+GetText()+"' and id_state = '"+GetItemString(GetRow(),"id_state")+"'")
		ldw_dw.Filter()
	END IF
END IF

IF dwo.name = "id_state" THEN
	SetItem(GetRow(),"id_city","")
	GetChild("id_city",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetItemString(GetRow(),"id_country")+"' and id_state = '"+GetText()+"'")
	ldw_dw.Filter()
END IF

IF dwo.Name = "id_city" THEN

	ls_id_city = GetText()
	ls_id_country = GetItemString(GetRow(),"id_country")

  SELECT id_state
    INTO :ls_id_state
    FROM dba.city
   WHERE id_city = :ls_id_city  AND
	      id_country = :ls_id_country ;

//	SetItem(GetRow(),"id_country",ls_id_country)
//	SetItem(GetRow(),"id_state",ls_id_state)
//	SetItem(GetRow(),"id_state",ls_id_state)
END IF

//IF dwo.Name = "zip_branch" THEN
//	
//	ls_ziccode = Data
//	
//  SELECT city.id_state, city.id_country, city.id_city
//    INTO :ls_state, :ls_country, :ls_city
//    FROM dba.city, dba.zipcode  
//   WHERE ( id_city = id_city ) and  
//         ( ( zic_code = :ls_ziccode ) )   ;
//
//  dw_1.Object.id_country[row] = ls_country
//  dw_1.Object.id_state[row] = ls_state
//  dw_1.Object.id_city[row] = ls_city
//END IF
end event

event retrieveend;call super::retrieveend;ib_creditchanged = FALSE
end event

event constructor;of_setdropdownsearch(TRUE)
inv_dropdownsearch.of_addcolumn("id_country")
end event

event itemfocuschanged;call super::itemfocuschanged;inv_dropdownsearch.Event pfc_itemfocuschanged(row,dwo)
end event

event editchanged;inv_dropdownsearch.Event pfc_editchanged(row,dwo,data)
end event

event itemerror;call super::itemerror;IF dwo.Name = "id_country" THEN
	MessageBox("The country "+data,"The "+data+" doesn't exist.")
	Return 1
END IF
end event

type tab_1 from tab within w_ingreso_branch1
event create ( )
event destroy ( )
integer x = 37
integer y = 720
integer width = 3154
integer height = 1028
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean raggedright = true
boolean powertips = true
alignment alignment = right!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
end on

event selectionchanged;String	ls_branch,ls_agename, ls_group, ls_agestatus
Double	ld_creditlimit, ld_debt, ld_agencyaverage, ld_numinv, ld_totalinvoices
Date		ld_inidate, ld_findate

IF newindex = 6 THEN
	ib_creditchanged = TRUE
ELSE
	ib_creditchanged = FALSE
END IF

SetPointer(Hourglass!)
IF newindex = 2 THEN
	tab_1.tabpage_2.dw_3.Retrieve(em_1.Text)
	tab_1.tabpage_2.dw_3.SetFocus()
ELSEIF newindex = 3 THEN
	tab_1.tabpage_3.dw_4.Retrieve(em_1.Text)
	tab_1.tabpage_3.dw_4.SetFocus()
ELSEIF newindex = 4 THEN
	tab_1.tabpage_4.dw_5.Retrieve(em_1.Text)
	tab_1.tabpage_4.dw_5.SetFocus()
ELSEIF newindex = 6 THEN
	tab_1.tabpage_6.dw_6.Retrieve(em_1.Text)
	tab_1.tabpage_6.dw_6.SetFocus()
ELSEIF newindex = 5 THEN
	ls_branch = em_1.Text

	SELECT name_branch, id_flag_branch, id_main_branch
	  INTO :ls_agename, :ls_agestatus, :ls_group
	  FROM branch
	 WHERE id_branch = :ls_branch ;
	
	SELECT group_branch.debt_limit  
	  INTO :ld_creditlimit  
	  FROM group_branch  
	 WHERE group_branch.id_main_branch = :ls_group   ;
	
	tab_1.tabpage_5.em_creditlimit.text = String(ld_creditlimit,"$##,###.00")
	
	SELECT fn_getagencycredit(:ls_branch)
	  INTO :ld_debt
	  FROM dummy ;

	tab_1.tabpage_5.st_creditavailable.text = String(ld_debt,"$##,###.00")
	
	ld_inidate = RelativeDate(Today(),- 30)
	ld_findate = Today()
	
	SELECT SUM(net_amount_receiver)
	  INTO :ld_totalinvoices
	  FROM receiver
	 WHERE id_branch = :ls_branch AND
	 		 date_receiver >= :ld_inidate AND
	  		 date_receiver <= :ld_findate ;
	
	ld_agencyaverage = ld_totalinvoices / 30
	
	SELECT COUNT(*)
	  INTO :ld_numinv
	  FROM receiver
	 WHERE id_branch = :ls_branch AND
	 		 date_receiver >= :ld_inidate AND
	  		 date_receiver <= :ld_findate AND
			 id_flag_receiver NOT IN ('A','C') ;
	
	tab_1.tabpage_5.st_numinv.text = String(ld_numinv,"##,###")
	tab_1.tabpage_5.st_agencyaverage.text = String(ld_agencyaverage,"##,###.00")
	IF ld_numinv > 0 THEN
		tab_1.tabpage_5.st_invoiceaverage.text = String(ld_totalinvoices/ld_numinv,"##,###.00")	
	ELSE
		tab_1.tabpage_5.st_invoiceaverage.text = String(0,"##,###.00")	
	END IF
END IF
SetPointer(Arrow!)
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3118
integer height = 900
long backcolor = 80269528
string text = "Payer Coverage"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
string picturename = "SelectObject!"
long picturemaskcolor = 553648127
string powertiptext = "Coverage"
dw_2 dw_2
cb_1 cb_1
end type

on tabpage_1.create
this.dw_2=create dw_2
this.cb_1=create cb_1
this.Control[]={this.dw_2,&
this.cb_1}
end on

on tabpage_1.destroy
destroy(this.dw_2)
destroy(this.cb_1)
end on

type dw_2 from u_dw within tabpage_1
integer x = 14
integer y = 28
integer width = 2752
integer height = 692
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_ingreso_cubrimiento_branch1"
end type

event constructor;SetTransObject(SQLCA)

end event

event pfc_addrow;Long	ll_row

ll_row = Super :: Event pfc_addrow()

Object.id_branch[ll_row] = dw_1.Object.id_branch[dw_1.GetRow()]

Return ll_row
end event

event itemfocuschanged;call super::itemfocuschanged;String 				ls_cod_cou, ls_cod_sta, ls_id_state, ls_id_city, ls_id_country
DataWindowChild	ldw_dw

IF dwo.name = "id_country" THEN
	GetChild("id_state",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	SetItem(GetRow(),"id_state","")
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetText()+"'")
	ldw_dw.Filter()


	SetItem(GetRow(),"id_city","")
	GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()

	IF GetItemString(GetRow(),"id_state") = '' OR IsNull(GetItemString(GetRow(),"id_state")) THEN
		ldw_dw.SetFilter("id_country = '"+GetText()+"'")
		ldw_dw.Filter()
	ELSE
		ldw_dw.SetFilter("id_country = '"+GetText()+"' and id_state = '"+GetItemString(GetRow(),"id_state")+"'")
		ldw_dw.Filter()
	END IF
END IF

IF dwo.name = "id_state" THEN
	SetItem(GetRow(),"id_city","")
	GetChild("id_city",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetItemString(GetRow(),"id_country")+"' and id_state = '"+GetText()+"'")
	ldw_dw.Filter()
END IF

IF dwo.Name = "id_city" THEN

	ls_id_city = GetText()
	ls_id_country = GetItemString(GetRow(),"id_country")

  SELECT dba.city.id_state
    INTO :ls_id_state
    FROM dba.city
   WHERE dba.city.id_city = :ls_id_city  AND
	      dba.id_country = :ls_id_country ;


END IF

end event

event itemchanged;call super::itemchanged;String 				ls_cod_cou, ls_cod_sta, ls_id_state, ls_id_city, ls_id_country
DataWindowChild	ldw_dw

IF dwo.name = "id_country" THEN
	GetChild("id_state",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	SetItem(GetRow(),"id_state","")
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetText()+"'")
	ldw_dw.Filter()


	SetItem(GetRow(),"id_city","")
	GetChild("id_city_receiver",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()

	IF GetItemString(GetRow(),"id_state") = '' OR IsNull(GetItemString(GetRow(),"id_state")) THEN
		ldw_dw.SetFilter("id_country = '"+GetText()+"'")
		ldw_dw.Filter()
	ELSE
		ldw_dw.SetFilter("id_country = '"+GetText()+"' and id_state = '"+GetItemString(GetRow(),"id_state")+"'")
		ldw_dw.Filter()
	END IF
END IF

IF dwo.name = "id_state" THEN
	SetItem(GetRow(),"id_city","")
	GetChild("id_city",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_country = '"+GetItemString(GetRow(),"id_country")+"' and id_state = '"+GetText()+"'")
	ldw_dw.Filter()
END IF

IF dwo.Name = "id_city" THEN

	ls_id_city = GetText()
	ls_id_country = GetItemString(GetRow(),"id_country")

  SELECT dba.city.id_state
    INTO :ls_id_state
    FROM dba.city
   WHERE dba.city.id_city = :ls_id_city  AND
	      dba.id_country = :ls_id_country ;


END IF

end event

type cb_1 from commandbutton within tabpage_1
integer x = 2821
integer y = 28
integer width = 288
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Wizard..."
end type

event clicked;//Long			ll_counter, ll_i, ll_row
//st_city 		lst_city
//String		ls_idcity, ls_idcountry, ls_idstate, ls_branch
//Boolean		lb_exists
//
//ls_branch = dw_1.Object.id_branch[dw_1.GetRow()]
//
//IF IsNull(ls_branch) OR Trim(ls_branch) = '' THEN
//	MessageBox("Atention","You have to select a branch before trying to use the coverage wizard.")
//	Return
//END IF
//
//OPEN(w_choose_city)
//
////IF Message.StringParm = '-1' THEN
////	Return
////END IF
//
//SetPointer(HourGlass!)
//
//lst_city = Message.PowerObjectParm
//IF Message.StringParm = '-1' THEN
//	Return
//END IF
//
//FOR ll_counter=1 TO UpperBound(lst_city.id_city[])
//	ls_idcity = lst_city.id_city[ll_counter]
//	
//	lb_exists = FALSE
//	FOR ll_i=1 TO tab_1.tabpage_1.dw_2.RowCount()
//		IF ls_idcity = tab_1.tabpage_1.dw_2.Object.id_city[ll_i] THEN
//			lb_exists = TRUE
//			EXIT
//		END IF
//	NEXT
//	
//	IF NOT lb_exists THEN
//		SELECT id_state, id_country
//		  INTO :ls_idstate, :ls_idcountry
//		  FROM dba.city
//		 WHERE id_city = :ls_idcity ;
//		
//		ll_row = tab_1.tabpage_1.dw_2.InsertRow(0)
//		
//		tab_1.tabpage_1.dw_2.Object.id_country[ll_row] = ls_idcountry
//		tab_1.tabpage_1.dw_2.Object.id_state[ll_row] = ls_idstate
//		tab_1.tabpage_1.dw_2.Object.id_city[ll_row] = ls_idcity
//		tab_1.tabpage_1.dw_2.Object.id_zona[ll_row] = 'A' 
//		ls_branch = dw_1.Object.id_branch[dw_1.GetRow()]
//		tab_1.tabpage_1.dw_2.Object.id_branch[ll_row] = ls_branch 
//	END IF
//NEXT
//
//SetPointer(Arrow!)
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3118
integer height = 900
long backcolor = 80269528
string text = "Payer Payment Place"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
string picturename = "Custom083!"
long picturemaskcolor = 553648127
string powertiptext = "Payment Mode"
dw_3 dw_3
end type

on tabpage_2.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_2.destroy
destroy(this.dw_3)
end on

type dw_3 from u_dw within tabpage_2
integer x = 14
integer y = 24
integer width = 3063
integer height = 692
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_ingreso_modo_pago_branch1"
end type

event constructor;SetTransObject(SQLCA)
end event

event pfc_addrow;Long	ll_row

ll_row = Super :: Event pfc_addrow()

Object.id_branch[ll_row] = dw_1.Object.id_branch[dw_1.GetRow()]

Return ll_row
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3118
integer height = 900
long backcolor = 80269528
string text = "Agency Fees"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
string picturename = "Custom048!"
long picturemaskcolor = 553648127
string powertiptext = "Fees"
dw_4 dw_4
end type

on tabpage_3.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_3.destroy
destroy(this.dw_4)
end on

type dw_4 from u_dw within tabpage_3
integer x = 9
integer y = 24
integer width = 3081
integer height = 692
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_comision_agency_central"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event pfc_addrow;Long	ll_row

ll_row = Super :: Event pfc_addrow()

Object.id_branch[ll_row] = dw_1.Object.id_branch[dw_1.GetRow()]

Return ll_row
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3118
integer height = 900
long backcolor = 80269528
string text = "Salesperson"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
string picturename = "Custom076!"
long picturemaskcolor = 553648127
dw_5 dw_5
end type

on tabpage_4.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_4.destroy
destroy(this.dw_5)
end on

type dw_5 from u_dw within tabpage_4
integer x = 9
integer y = 20
integer width = 3077
integer height = 700
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_vendor_agency"
end type

event constructor;SetTransObject(SQLCA)
end event

event pfc_addrow;Long	ll_row

ll_row = Super :: Event pfc_addrow()

Object.id_branch[ll_row] = dw_1.Object.id_branch[dw_1.GetRow()]


Return ll_row
end event

type tabpage_5 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3118
integer height = 900
long backcolor = 80269528
string text = "Agency Credit Analysis"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
string picturename = "Custom090!"
long picturemaskcolor = 553648127
string powertiptext = "Credit Analysis"
ddlb_agencystatus ddlb_agencystatus
st_6 st_6
st_11 st_11
st_2 st_2
st_3 st_3
st_4 st_4
st_creditavailable st_creditavailable
st_7 st_7
em_creditlimit em_creditlimit
st_8 st_8
st_agencyaverage st_agencyaverage
st_9 st_9
st_numinv st_numinv
st_10 st_10
st_invoiceaverage st_invoiceaverage
end type

on tabpage_5.create
this.ddlb_agencystatus=create ddlb_agencystatus
this.st_6=create st_6
this.st_11=create st_11
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_creditavailable=create st_creditavailable
this.st_7=create st_7
this.em_creditlimit=create em_creditlimit
this.st_8=create st_8
this.st_agencyaverage=create st_agencyaverage
this.st_9=create st_9
this.st_numinv=create st_numinv
this.st_10=create st_10
this.st_invoiceaverage=create st_invoiceaverage
this.Control[]={this.ddlb_agencystatus,&
this.st_6,&
this.st_11,&
this.st_2,&
this.st_3,&
this.st_4,&
this.st_creditavailable,&
this.st_7,&
this.em_creditlimit,&
this.st_8,&
this.st_agencyaverage,&
this.st_9,&
this.st_numinv,&
this.st_10,&
this.st_invoiceaverage}
end on

on tabpage_5.destroy
destroy(this.ddlb_agencystatus)
destroy(this.st_6)
destroy(this.st_11)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_creditavailable)
destroy(this.st_7)
destroy(this.em_creditlimit)
destroy(this.st_8)
destroy(this.st_agencyaverage)
destroy(this.st_9)
destroy(this.st_numinv)
destroy(this.st_10)
destroy(this.st_invoiceaverage)
end on

type ddlb_agencystatus from dropdownlistbox within tabpage_5
integer x = 503
integer y = 1520
integer width = 471
integer height = 180
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
boolean vscrollbar = true
string item[] = {"Active","Inactive","Hold"}
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within tabpage_5
integer x = 69
integer y = 1572
integer width = 430
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Agency Status :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within tabpage_5
integer x = 146
integer y = 1724
integer width = 352
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Credit Limit :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_5
integer x = 41
integer y = 1620
integer width = 457
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Credit Available :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_5
integer x = 251
integer y = 100
integer width = 247
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
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_5
integer x = 1157
integer y = 244
integer width = 379
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Credit Available :"
boolean focusrectangle = false
end type

type st_creditavailable from statictext within tabpage_5
integer x = 1536
integer y = 232
integer width = 421
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_5
integer x = 1253
integer y = 336
integer width = 274
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Credit Limit :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_creditlimit from editmask within tabpage_5
integer x = 1536
integer y = 320
integer width = 421
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
end type

event modified;ib_creditchanged = TRUE
end event

type st_8 from statictext within tabpage_5
integer x = 946
integer y = 424
integer width = 581
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Average (Last 30 Days) :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_agencyaverage from statictext within tabpage_5
integer x = 1536
integer y = 416
integer width = 421
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_5
integer x = 855
integer y = 600
integer width = 672
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Num. Invoices(Last 30 Days) :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_numinv from statictext within tabpage_5
integer x = 1536
integer y = 592
integer width = 421
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269528
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_10 from statictext within tabpage_5
integer x = 800
integer y = 516
integer width = 727
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Invoice Average(Last 30 Days) :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_invoiceaverage from statictext within tabpage_5
integer x = 1536
integer y = 504
integer width = 421
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type tabpage_6 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3118
integer height = 900
long backcolor = 80269528
string text = "Agency Owner Info"
long tabtextcolor = 33554432
long tabbackcolor = 80269528
string picturename = "Picture!"
long picturemaskcolor = 553648127
dw_6 dw_6
end type

on tabpage_6.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_6.destroy
destroy(this.dw_6)
end on

type dw_6 from u_dw within tabpage_6
integer x = 14
integer y = 24
integer width = 3077
integer height = 864
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_branch_extended_info"
end type

event constructor;SetTransObject(SQLCA)
end event

event pfc_deleterow;// DO NOT DELETE THIS LINE
Return 0
end event

event pfc_addrow;Long	ll_row

ll_row = Super :: Event pfc_addrow()

Object.id_branch[ll_row] = dw_1.Object.id_branch[dw_1.GetRow()]

Return ll_row
end event

