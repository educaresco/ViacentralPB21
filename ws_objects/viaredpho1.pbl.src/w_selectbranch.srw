$PBExportHeader$w_selectbranch.srw
forward
global type w_selectbranch from window
end type
type st_2 from statictext within w_selectbranch
end type
type st_1 from statictext within w_selectbranch
end type
type sle_name_branch from singlelineedit within w_selectbranch
end type
type lb_list_branch from listbox within w_selectbranch
end type
type cb_cancel from commandbutton within w_selectbranch
end type
type cb_select from commandbutton within w_selectbranch
end type
type sle_id_branch from singlelineedit within w_selectbranch
end type
end forward

global type w_selectbranch from window
integer width = 1819
integer height = 1424
boolean titlebar = true
string title = "Select Branch"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_postopen ( )
st_2 st_2
st_1 st_1
sle_name_branch sle_name_branch
lb_list_branch lb_list_branch
cb_cancel cb_cancel
cb_select cb_select
sle_id_branch sle_id_branch
end type
global w_selectbranch w_selectbranch

type variables
string ls_loaded, ls_selected
end variables

event ue_postopen();String ls_id_branch, ls_name_branch
Long ll_cont

lb_list_branch.reset()

DECLARE cur_branch CURSOR FOR  
//DON (03/25/2015) - PERFORMANCE TUNING.  **************************
SELECT DBA.BRANCH.ID_BRANCH,   
		 DBA.BRANCH.NAME_BRANCH  
  FROM DBA.BRANCH 	WITH (NOLOCK)
  INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
  ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH ) 
 WHERE 	( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
   			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
   			AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D') );
//************************************************************
		
OPEN cur_branch;

FETCH cur_branch INTO :ls_id_branch, :ls_name_branch;
DO WHILE SQLCA.SQLCode = 0

	ls_id_branch = trim(ls_id_branch)
	ls_name_branch = trim(ls_name_branch)

	lb_list_branch.additem(fn_completar_cadena(ls_name_branch,'D',' ',130)+'*'+ls_id_branch)

	FETCH cur_branch INTO :ls_id_branch, :ls_name_branch;
LOOP

CLOSE cur_branch;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Selects the previous agency

ls_loaded = Message.StringParm


//DON (03/25/2015) - PERFORMANCE TUNING.  **************************
SELECT count(*)
  INTO :ll_cont
  FROM DBA.BRANCH	WITH (NOLOCK)
  INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
  ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH ) 
 WHERE 	( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
   			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
   			AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D') );	
//************************************************************
		
if ll_cont > 0 then
	
	ls_selected = ls_loaded
	sle_id_branch.text = ls_selected
	
	//DON (03/25/2015) - PERFORMANCE TUNING.  ************************
	SELECT rtrim(DBA.BRANCH.NAME_BRANCH)
	INTO :sle_name_branch.text
	FROM DBA.BRANCH	WITH (NOLOCK)
	WHERE ( DBA.BRANCH.ID_BRANCH = :ls_selected );
	//*********************************************************
	
	// Move the list box
	long ll_found_row
	ll_found_row = lb_list_branch.FindItem(sle_name_branch.text, 1)

	if ll_found_row > -1 then
		lb_list_branch.SelectItem(ll_found_row)
	end if	

else
	
	sle_id_branch.text = 'A00000'
	sle_name_branch.text = ''
	ls_selected = 'NONE'
	ls_loaded = 'NONE'
	
end if
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end event

on w_selectbranch.create
this.st_2=create st_2
this.st_1=create st_1
this.sle_name_branch=create sle_name_branch
this.lb_list_branch=create lb_list_branch
this.cb_cancel=create cb_cancel
this.cb_select=create cb_select
this.sle_id_branch=create sle_id_branch
this.Control[]={this.st_2,&
this.st_1,&
this.sle_name_branch,&
this.lb_list_branch,&
this.cb_cancel,&
this.cb_select,&
this.sle_id_branch}
end on

on w_selectbranch.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_name_branch)
destroy(this.lb_list_branch)
destroy(this.cb_cancel)
destroy(this.cb_select)
destroy(this.sle_id_branch)
end on

event open;//DON (03/25/2015) - MOVE CODE TO UE_POSTOPEN EVENT.  ***************************************
This.PostEvent("ue_postopen")
//***********************************************************************************
end event

type st_2 from statictext within w_selectbranch
integer x = 361
integer y = 36
integer width = 398
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Name Branch"
boolean focusrectangle = false
end type

type st_1 from statictext within w_selectbranch
integer x = 41
integer y = 36
integer width = 302
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Id Branch"
boolean focusrectangle = false
end type

type sle_name_branch from singlelineedit within w_selectbranch
event ue_select ( )
event ue_keyup pbm_keyup
integer x = 361
integer y = 108
integer width = 1381
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event ue_select();this.SelectText(1, Len(this.Text))
end event

event ue_keyup;string ls_search_string
long ll_found_row

ls_search_string = this.text

ll_found_row = lb_list_branch.FindItem(ls_search_string, 1)

if ll_found_row > -1 then
	lb_list_branch.SelectItem(ll_found_row)
	sle_id_branch.text = trim(fn_token(lb_list_branch.selecteditem(),"*",2))
	ls_selected = sle_id_branch.text
end if

This.SetFocus()

end event

event getfocus;This. EVENT POST ue_select( )

end event

type lb_list_branch from listbox within w_selectbranch
integer x = 41
integer y = 208
integer width = 1701
integer height = 972
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_id_branch.text = trim(fn_token(this.selecteditem(),"*",2))
sle_name_branch.text = trim(fn_token(this.selecteditem(),"*",1))

ls_selected = sle_id_branch.text
end event

event doubleclicked;cb_select.triggerevent(Clicked!)
end event

type cb_cancel from commandbutton within w_selectbranch
integer x = 1285
integer y = 1204
integer width = 457
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(parent,ls_loaded)
end event

type cb_select from commandbutton within w_selectbranch
integer x = 805
integer y = 1204
integer width = 457
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Select"
boolean default = true
end type

event clicked;CloseWithReturn(Parent, ls_selected)
end event

type sle_id_branch from singlelineedit within w_selectbranch
event ue_select ( )
event ue_keyup pbm_keyup
integer x = 41
integer y = 108
integer width = 311
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "A00999"
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event ue_select();if len(this.Text)>4 then
	this.SelectText(3, Len(this.Text)-2)
end if
end event

event ue_keyup;string ls_search_string
string ls_name_found

ls_search_string = trim(this.text)

SELECT min(DBA.BRANCH.NAME_BRANCH)
  INTO :ls_name_found
  FROM DBA.BRANCH WITH (NOLOCK)
  INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
  ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH ) 
 WHERE 	( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
			AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D') ) 
			AND ( DBA.BRANCH.ID_BRANCH = :ls_search_string);

if not isnull(ls_name_found) and (trim(ls_name_found) <> '' ) and (sle_name_branch.text <> ls_name_found) then
	sle_name_branch.text = ls_name_found
	sle_name_branch.triggerEvent('ue_keyup')
	ls_selected = sle_id_branch.text
end if

end event

event getfocus;This. EVENT POST ue_select( )
end event

