$PBExportHeader$w_selectbranch2.srw
forward
global type w_selectbranch2 from window
end type
type st_invalid_agency from statictext within w_selectbranch2
end type
type st_branch_info from statictext within w_selectbranch2
end type
type cb_1 from commandbutton within w_selectbranch2
end type
type tab_add from tab within w_selectbranch2
end type
type tp_add from userobject within tab_add
end type
type cb_3 from commandbutton within tp_add
end type
type cb_2 from commandbutton within tp_add
end type
type st_2 from statictext within tp_add
end type
type st_1 from statictext within tp_add
end type
type em_addphone from editmask within tp_add
end type
type em_addbranch from editmask within tp_add
end type
type tp_add from userobject within tab_add
cb_3 cb_3
cb_2 cb_2
st_2 st_2
st_1 st_1
em_addphone em_addphone
em_addbranch em_addbranch
end type
type tab_add from tab within w_selectbranch2
tp_add tp_add
end type
type st_3 from statictext within w_selectbranch2
end type
type em_phone from editmask within w_selectbranch2
end type
type lb_list_branch from listbox within w_selectbranch2
end type
type cb_cancel from commandbutton within w_selectbranch2
end type
type cb_select from commandbutton within w_selectbranch2
end type
end forward

global type w_selectbranch2 from window
integer width = 2528
integer height = 792
boolean titlebar = true
string title = "Select Branch"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_invalid_agency st_invalid_agency
st_branch_info st_branch_info
cb_1 cb_1
tab_add tab_add
st_3 st_3
em_phone em_phone
lb_list_branch lb_list_branch
cb_cancel cb_cancel
cb_select cb_select
end type
global w_selectbranch2 w_selectbranch2

type variables
string ls_loaded, ls_selected
end variables

forward prototypes
public subroutine fn_updatebranches ()
end prototypes

public subroutine fn_updatebranches ();string 	ls_id_branch, ls_name_branch, ls_agency_system, s_segment_name
string 	ls_search_string, ls_phone, ls_phone2, ls_fax, ls_flag
long 		ll_cont
integer   li_viaAgricola

ll_cont = 0

lb_list_branch.reset()
ls_selected = 'NONE'
ls_loaded = 'NONE'
st_branch_info.text = ''
st_invalid_agency.Text = ''
st_invalid_agency.Visible = false

ls_search_string = upper(fn_replace(trim(em_phone.text),' ',''))

// Only takes 5 or 6 digits
if len(ls_search_string) <> 5 and len(ls_search_string) <> 6 then return
		
// An Agency Code
if len(ls_search_string) = 6  then 
	
	DECLARE cur_branch1 CURSOR FOR  
	//DON (03/25/2015) - MOVE CODE TO UE_POSTOPEN EVENT.  ***************************************
	SELECT DBA.BRANCH.ID_BRANCH,   
	DBA.BRANCH.NAME_BRANCH,
	DBA.BRANCH.PHONE1_BRANCH,
	DBA.BRANCH.PHONE2_BRANCH,
	DBA.BRANCH.FAX_BRANCH,
	DBA.BRANCH.ID_FLAG_BRANCH,
	S.SEGMENTATION_NAME
	FROM DBA.BRANCH WITH (NOLOCK)
	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  	 
	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
	LEFT JOIN dba.AGENCY_SEGMENTATION S ON  DBA.BRANCH.IS_VIP = S.ID_SEGMENTATION
	WHERE ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
		AND DBA.BRANCH.ID_BRANCH = :ls_search_string
		USING SQLCARPT;
	
	OPEN cur_branch1;
	
	FETCH cur_branch1 INTO :ls_id_branch, :ls_name_branch, :ls_phone, :ls_phone2, :ls_fax, :ls_flag, :s_segment_name;
	DO WHILE SQLCARPT.SQLCode = 0
		IF ls_flag = 'A' THEN	
			ll_cont++
		
			ls_id_branch = trim(ls_id_branch)
			ls_name_branch = trim(ls_name_branch)
			ls_phone = trim(ls_phone)
			ls_phone2 = trim(ls_phone2)
			ls_fax = trim(ls_fax)
			
			IF IsNull(s_segment_name) THEN
				s_segment_name = ''
			ELSE
				s_segment_name = ' - ' + trim(s_segment_name)
			END IF
				
			
			ls_phone = '('+mid(ls_phone,1,3)+') '+mid(ls_phone,4,3)+' '+mid(ls_phone,7,4)	
			lb_list_branch.additem(fn_completar_cadena(trim(ls_phone)+' :  '+ls_name_branch+ ' - ' + ls_id_branch + s_segment_name,'D',' ',130)+'*'+ls_id_branch)
			
			IF len(ls_phone2) > 0 THEN 
				ls_phone2 = '('+mid(ls_phone2,1,3)+') '+mid(ls_phone2,4,3)+' '+mid(ls_phone2,7,4)	
				lb_list_branch.additem(fn_completar_cadena(trim(ls_phone2)+' :  '+ls_name_branch+ ' - ' + ls_id_branch + s_segment_name,'D',' ',130)+'*'+ls_id_branch )
			END IF
			
			IF len(ls_fax) > 0 THEN 
				ls_fax = '('+mid(ls_fax,1,3)+') '+mid(ls_fax,4,3)+' '+mid(ls_fax,7,4)
				lb_list_branch.additem(fn_completar_cadena(trim(ls_fax)+' :  '+ls_name_branch+ ' - ' + ls_id_branch + s_segment_name,'D',' ',130)+'*'+ls_id_branch )
			END IF
		ELSE
			st_invalid_agency.Visible = true
			st_invalid_agency.Text = ls_name_branch + ': Inactive AGENCY!, please contact Accounting department.'
			
			CLOSE cur_branch1;
			EXIT
		END IF
	
		FETCH cur_branch1 INTO :ls_id_branch, :ls_name_branch, :ls_phone, :ls_phone2, :ls_fax, :ls_flag, :s_segment_name;
		
	LOOP
	
	CLOSE cur_branch1;
	
	IF len(ls_id_branch) = 0 THEN
		SELECT name_branch, dba.sfGetBranchSystem(id_branch)
		INTO :ls_name_branch, :ls_agency_system
		FROM dba.branch
		WHERE id_branch = :ls_search_string;
		
		IF len(ls_agency_system) > 0 THEN
			st_invalid_agency.Visible = true
			st_invalid_agency.Text = ls_name_branch + ': Invalid AGENCY!, please use ' + ls_agency_system +'.'
		END IF
		
	END IF
		
else // phone last 5
	
	DECLARE cur_branch CURSOR FOR  
	//DON (03/25/2015) - MOVE CODE TO UE_POSTOPEN EVENT.  ***************************************
	SELECT DBA.BRANCH.ID_BRANCH,   
	DBA.BRANCH.NAME_BRANCH,
	DBA.BRANCH.PHONE1_BRANCH
	FROM DBA.BRANCH WITH (NOLOCK)
	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D','P') )
			AND ( RIGHT(RTRIM(DBA.BRANCH.PHONE1_BRANCH),5) = :ls_search_string )
			AND ( LEN(RTRIM(DBA.BRANCH.PHONE1_BRANCH)) = 10 )
	UNION
	SELECT DBA.BRANCH.ID_BRANCH,   
	DBA.BRANCH.NAME_BRANCH,
	DBA.BRANCH.PHONE2_BRANCH
	FROM DBA.BRANCH WITH (NOLOCK)
	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D','P') )
			AND ( RIGHT(RTRIM(DBA.BRANCH.PHONE2_BRANCH),5) = :ls_search_string )
			AND ( LEN(RTRIM(DBA.BRANCH.PHONE2_BRANCH)) = 10 )
	UNION
	SELECT DBA.BRANCH.ID_BRANCH,   
	DBA.BRANCH.NAME_BRANCH,
	DBA.BRANCH.FAX_BRANCH
	FROM DBA.BRANCH	WITH (NOLOCK)  
	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D','P') )
			AND ( RIGHT(RTRIM(DBA.BRANCH.FAX_BRANCH),5) = :ls_search_string )
			AND ( LEN(RTRIM(DBA.BRANCH.FAX_BRANCH)) = 10 )	
	UNION
	SELECT DBA.BRANCH.ID_BRANCH,   
	rtrim(DBA.BRANCH.NAME_BRANCH) + ' [NO VERIFICADO]' ,
	DBA.BRANCH_RP_PHONES.PHONE
	FROM DBA.BRANCH WITH (NOLOCK)
	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA
	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
	JOIN	DBA.BRANCH_RP_PHONES
	ON	( DBA.BRANCH.ID_BRANCH = DBA.BRANCH_RP_PHONES.ID_BRANCH )
	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D','P') )
			AND ( RIGHT(RTRIM(DBA.BRANCH_RP_PHONES.PHONE),5) = :ls_search_string )
	USING SQLCARPT;
	//*******************************************************************

	
	OPEN cur_branch;
	
	FETCH cur_branch INTO :ls_id_branch, :ls_name_branch, :ls_phone;
	DO WHILE SQLCARPT.SQLCode = 0
	
		ll_cont++
	
		ls_id_branch = trim(ls_id_branch)
		ls_name_branch = trim(ls_name_branch)
		ls_phone = trim(ls_phone)
		
		ls_phone = '('+mid(ls_phone,1,3)+') '+mid(ls_phone,4,3)+' '+mid(ls_phone,7,4)	
	
		lb_list_branch.additem(fn_completar_cadena(trim(ls_phone)+' :  '+ls_name_branch+ ' - ' + ls_id_branch,'D',' ',130)+'*'+ls_id_branch)
	
		FETCH cur_branch INTO :ls_id_branch, :ls_name_branch, :ls_phone;
		
	LOOP
	
	CLOSE cur_branch;
end if

if ll_cont = 1 then 
	lb_list_branch.selectitem(1)
	ls_selected = trim(fn_token(lb_list_branch.selecteditem(),"*",2))
	
	SELECT Count(*)
	INTO  :li_viaAgricola 
	FROM dba.branch 
	WHERE id_branch = :ls_id_branch  AND name_branch LIKE '%FP)';
	
	IF li_viaAgricola = 1 THEN
		st_branch_info.text = 'VIAAGRICOLA'
	END IF
end if

end subroutine

on w_selectbranch2.create
this.st_invalid_agency=create st_invalid_agency
this.st_branch_info=create st_branch_info
this.cb_1=create cb_1
this.tab_add=create tab_add
this.st_3=create st_3
this.em_phone=create em_phone
this.lb_list_branch=create lb_list_branch
this.cb_cancel=create cb_cancel
this.cb_select=create cb_select
this.Control[]={this.st_invalid_agency,&
this.st_branch_info,&
this.cb_1,&
this.tab_add,&
this.st_3,&
this.em_phone,&
this.lb_list_branch,&
this.cb_cancel,&
this.cb_select}
end on

on w_selectbranch2.destroy
destroy(this.st_invalid_agency)
destroy(this.st_branch_info)
destroy(this.cb_1)
destroy(this.tab_add)
destroy(this.st_3)
destroy(this.em_phone)
destroy(this.lb_list_branch)
destroy(this.cb_cancel)
destroy(this.cb_select)
end on

event open;//String ls_id_branch, ls_name_branch
//Long ll_cont
//
//lb_list_branch.reset()
//
//DECLARE cur_branch CURSOR FOR  
//SELECT DBA.BRANCH.ID_BRANCH,   
//		 DBA.BRANCH.NAME_BRANCH  
//  FROM DBA.BRANCH,   
//		 DBA.TIPO_TRANSMISION_AGENCIA  
// WHERE ( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH ) 
//   AND ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
//   AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
//   AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D') );
//		
//OPEN cur_branch;
//
//FETCH cur_branch INTO :ls_id_branch, :ls_name_branch;
//DO WHILE SQLCA.SQLCode = 0
//
//	ls_id_branch = trim(ls_id_branch)
//	ls_name_branch = trim(ls_name_branch)
//
//	lb_list_branch.additem(fn_completar_cadena(ls_name_branch,'D',' ',130)+'*'+ls_id_branch)
//
//	FETCH cur_branch INTO :ls_id_branch, :ls_name_branch;
//LOOP
//
//CLOSE cur_branch;
//
//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Selects the previous agency
//
//ls_loaded = Message.StringParm
//
//SELECT count(*)
//  INTO :ll_cont
//  FROM DBA.BRANCH,
//		 DBA.TIPO_TRANSMISION_AGENCIA
// WHERE ( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
//   AND ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' )
//   AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
//   AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D') );		
//
//if ll_cont > 0 then
//
//	ls_selected = ls_loaded
//	sle_id_branch.text = ls_selected
//
//	SELECT rtrim(DBA.BRANCH.NAME_BRANCH)
//	  INTO :sle_name_branch.text
//	  FROM DBA.BRANCH
//	 WHERE ( DBA.BRANCH.ID_BRANCH = :ls_selected );
//
//	// Move the list box
//	long ll_found_row
//	ll_found_row = lb_list_branch.FindItem(sle_name_branch.text, 1)
//
//	if ll_found_row > -1 then
//		lb_list_branch.SelectItem(ll_found_row)
//	end if	
//
//else
//	
//	sle_id_branch.text = 'A00000'
//	sle_name_branch.text = ''
//	ls_selected = 'NONE'
//	ls_loaded = 'NONE'
//	
//end if
//// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

tab_add.visible = false

ls_selected = 'NONE'
ls_loaded = 'NONE'
end event

type st_invalid_agency from statictext within w_selectbranch2
boolean visible = false
integer x = 46
integer y = 232
integer width = 2427
integer height = 272
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217857
long backcolor = 65535
boolean focusrectangle = false
end type

type st_branch_info from statictext within w_selectbranch2
integer x = 46
integer y = 560
integer width = 1321
integer height = 124
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_selectbranch2
boolean visible = false
integer x = 1874
integer y = 28
integer width = 480
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Add Number"
end type

event clicked;tab_add.visible = not tab_add.visible
end event

type tab_add from tab within w_selectbranch2
boolean visible = false
integer x = 1248
integer y = 116
integer width = 1106
integer height = 452
boolean enabled = false
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 8421504
boolean focusonbuttondown = true
boolean showtext = false
boolean showpicture = false
integer selectedtab = 1
tp_add tp_add
end type

on tab_add.create
this.tp_add=create tp_add
this.Control[]={this.tp_add}
end on

on tab_add.destroy
destroy(this.tp_add)
end on

type tp_add from userobject within tab_add
integer x = 18
integer y = 48
integer width = 1070
integer height = 388
long backcolor = 8421504
long tabtextcolor = 33554432
long tabbackcolor = 8421504
long picturemaskcolor = 536870912
cb_3 cb_3
cb_2 cb_2
st_2 st_2
st_1 st_1
em_addphone em_addphone
em_addbranch em_addbranch
end type

on tp_add.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_2=create st_2
this.st_1=create st_1
this.em_addphone=create em_addphone
this.em_addbranch=create em_addbranch
this.Control[]={this.cb_3,&
this.cb_2,&
this.st_2,&
this.st_1,&
this.em_addphone,&
this.em_addbranch}
end on

on tp_add.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_addphone)
destroy(this.em_addbranch)
end on

type cb_3 from commandbutton within tp_add
integer x = 585
integer y = 264
integer width = 457
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;tab_add.visible = false
end event

type cb_2 from commandbutton within tp_add
integer x = 87
integer y = 264
integer width = 457
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;String ls_id_branch, ls_phone
Long ll_cont

ls_id_branch = tab_add.tp_add.em_addbranch.text
tab_add.tp_add.em_addphone.getdata(ls_phone)

SELECT COUNT(*)
  INTO :ll_cont
  FROM DBA.BRANCH WITH (NOLOCK)
  INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA
  ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH ) 
 WHERE	( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
   			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
   			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D') )
			AND ( DBA.BRANCH.ID_BRANCH = :ls_id_branch );

if ll_cont = 1 then

	if len(ls_phone) = 10 then
		
		INSERT INTO DBA.BRANCH_RP_PHONES (ID_BRANCH,PHONE,DATE_ADDED,DB_USER_NAME)
		VALUES (:ls_id_branch,:ls_phone,getdate(),upper(SYSTEM_USER));
	
		tab_add.tp_add.em_addbranch.text = ''
		tab_add.tp_add.em_addphone.text = ''
	
		tab_add.visible = false
		
		em_phone.triggerevent("ue_keyup")
		
	else
		
		Messagebox("Error","El numero telefonico ("+ls_phone+") debe ser de 10 digitos",StopSign!)	
		
	end if
	
else
	
	Messagebox("Error","Esta agencia no esta activa o no es de telefono rojo",StopSign!)	
	
end if
end event

type st_2 from statictext within tp_add
integer x = 206
integer y = 152
integer width = 347
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 8421504
string text = "Phone Number:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within tp_add
integer x = 279
integer y = 52
integer width = 274
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 8421504
string text = "Agency Id:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_addphone from editmask within tp_add
integer x = 585
integer y = 132
integer width = 457
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "(###) ###-####"
end type

type em_addbranch from editmask within tp_add
integer x = 585
integer y = 32
integer width = 302
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!####"
end type

type st_3 from statictext within w_selectbranch2
integer x = 37
integer y = 40
integer width = 1303
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Phone Number, Last 5 Digits or Id Branch:"
boolean focusrectangle = false
end type

type em_phone from editmask within w_selectbranch2
event ue_keyup pbm_keyup
integer x = 1381
integer y = 24
integer width = 352
integer height = 112
integer taborder = 10
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "a#####"
end type

event ue_keyup;fn_updatebranches()

//string 	ls_id_branch, ls_name_branch
//string 	ls_search_string, ls_phone
//long 		ll_cont
//
//ll_cont = 0
//
//lb_list_branch.reset()
//ls_selected = 'NONE'
//ls_loaded = 'NONE'
//
//ls_search_string = upper(fn_replace(trim(this.text),' ',''))
//
//// Only takes 5 or 6 digits
//if len(ls_search_string) <> 5 and len(ls_search_string) <> 6 then return
//		
//// An Agency Code
//if len(ls_search_string) = 6  then 
//	
//	DECLARE cur_branch1 CURSOR FOR  
//	//DON (03/25/2015) - MOVE CODE TO UE_POSTOPEN EVENT.  ***************************************
//	SELECT DBA.BRANCH.ID_BRANCH,   
//	DBA.BRANCH.NAME_BRANCH,
//	DBA.BRANCH.PHONE1_BRANCH
//	FROM DBA.BRANCH WITH (NOLOCK)
//	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
//	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
//	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
//		AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
//		AND DBA.BRANCH.ID_BRANCH = :ls_search_string
//		USING SQLCARPT;
//	
//	OPEN cur_branch1;
//	
//	FETCH cur_branch1 INTO :ls_id_branch, :ls_name_branch, :ls_phone;
//	DO WHILE SQLCARPT.SQLCode = 0
//	
//		ll_cont++
//	
//		ls_id_branch = trim(ls_id_branch)
//		ls_name_branch = trim(ls_name_branch)
//		ls_phone = trim(ls_phone)
//		
//		ls_phone = '('+mid(ls_phone,1,3)+') '+mid(ls_phone,4,3)+' '+mid(ls_phone,7,4)	
//	
//		lb_list_branch.additem(fn_completar_cadena(trim(ls_phone)+' :  '+ls_name_branch+ ' - ' + ls_id_branch,'D',' ',130)+'*'+ls_id_branch)
//	
//		FETCH cur_branch1 INTO :ls_id_branch, :ls_name_branch, :ls_phone;
//		
//	LOOP
//	
//	CLOSE cur_branch1;
//		
//else // phone last 5
//	
//	DECLARE cur_branch CURSOR FOR  
//	//DON (03/25/2015) - MOVE CODE TO UE_POSTOPEN EVENT.  ***************************************
//	SELECT DBA.BRANCH.ID_BRANCH,   
//	DBA.BRANCH.NAME_BRANCH,
//	DBA.BRANCH.PHONE1_BRANCH
//	FROM DBA.BRANCH WITH (NOLOCK)
//	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
//	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
//	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
//			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
//			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D','P') )
//			AND ( RIGHT(RTRIM(DBA.BRANCH.PHONE1_BRANCH),5) = :ls_search_string )
//			AND ( LEN(RTRIM(DBA.BRANCH.PHONE1_BRANCH)) = 10 )
//	UNION
//	SELECT DBA.BRANCH.ID_BRANCH,   
//	DBA.BRANCH.NAME_BRANCH,
//	DBA.BRANCH.PHONE2_BRANCH
//	FROM DBA.BRANCH WITH (NOLOCK)
//	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
//	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
//	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
//			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
//			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D','P') )
//			AND ( RIGHT(RTRIM(DBA.BRANCH.PHONE2_BRANCH),5) = :ls_search_string )
//			AND ( LEN(RTRIM(DBA.BRANCH.PHONE2_BRANCH)) = 10 )
//	UNION
//	SELECT DBA.BRANCH.ID_BRANCH,   
//	DBA.BRANCH.NAME_BRANCH,
//	DBA.BRANCH.FAX_BRANCH
//	FROM DBA.BRANCH	WITH (NOLOCK)  
//	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA  
//	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
//	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
//			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
//			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D','P') )
//			AND ( RIGHT(RTRIM(DBA.BRANCH.FAX_BRANCH),5) = :ls_search_string )
//			AND ( LEN(RTRIM(DBA.BRANCH.FAX_BRANCH)) = 10 )	
//	UNION
//	SELECT DBA.BRANCH.ID_BRANCH,   
//	rtrim(DBA.BRANCH.NAME_BRANCH) + ' [NO VERIFICADO]' ,
//	DBA.BRANCH_RP_PHONES.PHONE
//	FROM DBA.BRANCH WITH (NOLOCK)
//	INNER JOIN	DBA.TIPO_TRANSMISION_AGENCIA
//	ON	( DBA.BRANCH.ID_BRANCH = DBA.TIPO_TRANSMISION_AGENCIA.ID_BRANCH )
//	JOIN	DBA.BRANCH_RP_PHONES
//	ON	( DBA.BRANCH.ID_BRANCH = DBA.BRANCH_RP_PHONES.ID_BRANCH )
//	WHERE  ( DBA.BRANCH.ID_FLAG_BRANCH = 'A' ) 
//			AND ( DBA.BRANCH.ID_TYPE_BRANCH <> 'P' ) 
//			//AND ( DBA.TIPO_TRANSMISION_AGENCIA.TIPO_TRANSMISION IN ('R','D','P') )
//			AND ( RIGHT(RTRIM(DBA.BRANCH_RP_PHONES.PHONE),5) = :ls_search_string )
//	USING SQLCARPT;
//	//*******************************************************************
//
//	
//	OPEN cur_branch;
//	
//	FETCH cur_branch INTO :ls_id_branch, :ls_name_branch, :ls_phone;
//	DO WHILE SQLCARPT.SQLCode = 0
//	
//		ll_cont++
//	
//		ls_id_branch = trim(ls_id_branch)
//		ls_name_branch = trim(ls_name_branch)
//		ls_phone = trim(ls_phone)
//		
//		ls_phone = '('+mid(ls_phone,1,3)+') '+mid(ls_phone,4,3)+' '+mid(ls_phone,7,4)	
//	
//		lb_list_branch.additem(fn_completar_cadena(trim(ls_phone)+' :  '+ls_name_branch+ ' - ' + ls_id_branch,'D',' ',130)+'*'+ls_id_branch)
//	
//		FETCH cur_branch INTO :ls_id_branch, :ls_name_branch, :ls_phone;
//		
//	LOOP
//	
//	CLOSE cur_branch;
//end if
//
//
//
//if ll_cont = 1 then 
//	lb_list_branch.selectitem(1)
//	ls_selected = trim(fn_token(lb_list_branch.selecteditem(),"*",2))
//end if
//
end event

event losefocus;fn_updatebranches()
end event

type lb_list_branch from listbox within w_selectbranch2
integer x = 41
integer y = 228
integer width = 2432
integer height = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;cb_select.triggerevent(Clicked!)
end event

event selectionchanged;ls_selected = trim(fn_token(lb_list_branch.selecteditem(),"*",2))
end event

type cb_cancel from commandbutton within w_selectbranch2
integer x = 2016
integer y = 560
integer width = 457
integer height = 88
integer taborder = 30
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

type cb_select from commandbutton within w_selectbranch2
integer x = 1536
integer y = 560
integer width = 457
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Select"
boolean default = true
end type

event clicked;if ls_selected <> 'NONE' then 
	CloseWithReturn(Parent, ls_selected)
else
	MessageBox("Agencia No Seleccionada","No ha seleccionado ninguna agencia, debe seleccionar una agencia de la lista o Cancelar.",Exclamation!)
end if
end event

