$PBExportHeader$w_cla_status.srw
forward
global type w_cla_status from window
end type
type cb_query from commandbutton within w_cla_status
end type
type dw_1 from datawindow within w_cla_status
end type
type cb_3 from commandbutton within w_cla_status
end type
type st_1 from statictext within w_cla_status
end type
type lb_payors from dropdownlistbox within w_cla_status
end type
type gb_2 from groupbox within w_cla_status
end type
end forward

global type w_cla_status from window
integer width = 3008
integer height = 2016
boolean titlebar = true
string title = "Claves/Folios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_query cb_query
dw_1 dw_1
cb_3 cb_3
st_1 st_1
lb_payors lb_payors
gb_2 gb_2
end type
global w_cla_status w_cla_status

forward prototypes
public function long fn_gensqlclaves (string ls_id_branch, string ls_id_main_branch)
end prototypes

public function long fn_gensqlclaves (string ls_id_branch, string ls_id_main_branch);double ld_clave
string ls_FileName, ls_sql
int li_FileNum
long ll_cont
long ll_result

ll_result = 0

 SELECT Count(*)
   INTO :ll_cont
   FROM dba.CLAVES  
  WHERE ( dba.CLAVES.ID_USED = 'N' ) 
    AND ( dba.CLAVES.ID_TRANS = 'N' )   
    AND ( dba.CLAVES.ID_GROUP_PAYEE = :ls_id_main_branch)
	 AND ( dba.CLAVES.id_branch = :ls_id_branch);

IF ll_cont < 1 THEN
	return ll_result
END IF

DECLARE cur_claves CURSOR FOR  
 SELECT dba.CLAVES.ID_CLAVE  
   FROM dba.CLAVES  
  WHERE ( dba.CLAVES.ID_USED = 'N' ) 
    AND ( dba.CLAVES.ID_TRANS = 'N' )   
    AND ( dba.CLAVES.ID_GROUP_PAYEE = :ls_id_main_branch)
	 AND ( dba.CLAVES.id_branch = :ls_id_branch);

OPEN cur_claves;

ls_FileName = "C:\" + "CLA"+FILL('0',10 - LEN(trim(ls_id_branch)))+trim(ls_id_branch)+".sql"
li_FileNum = FileOpen(ls_FileName, LineMode!, Write!, LockWrite!,Append!)
FileWrite(li_FileNum,"SET option on_error = CONTINUE;")
FETCH cur_claves INTO :ld_clave;
DO WHILE SQLCA.SQLCODE = 0

	ll_result++
	
	ls_sql = "INSERT INTO CLAVES VALUES ('"+trim(ls_id_main_branch)+"',"+string(ld_clave)+",'N');"		
	FileWrite(li_FileNum,ls_sql)
	
	UPDATE dba.claves
	SET id_trans = 'Y', date_trans = getdate()
	WHERE id_group_payee = :ls_id_main_branch
	AND id_branch = :ls_id_branch
	AND id_clave = :ld_clave;
	
	FETCH cur_claves INTO :ld_clave;	
LOOP
FileWrite(li_FileNum,"COMMIT;") 
FileClose(li_FileNum) 

CLOSE cur_claves;

return ll_result
end function

on w_cla_status.create
this.cb_query=create cb_query
this.dw_1=create dw_1
this.cb_3=create cb_3
this.st_1=create st_1
this.lb_payors=create lb_payors
this.gb_2=create gb_2
this.Control[]={this.cb_query,&
this.dw_1,&
this.cb_3,&
this.st_1,&
this.lb_payors,&
this.gb_2}
end on

on w_cla_status.destroy
destroy(this.cb_query)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.lb_payors)
destroy(this.gb_2)
end on

event open;string ls_id_main_branch, ls_name_main_branch

lb_payors.reset()

//---------------------------------------------------------------------------------------------------
// Fill the listbox with the payors that uses pre-assigned claves
 DECLARE cur_payors CURSOR FOR  
  SELECT dba.GROUP_BRANCH.ID_MAIN_BRANCH,   
         dba.GROUP_BRANCH.NAME_MAIN_BRANCH  
    FROM dba.GROUP_BRANCH  
   WHERE dba.GROUP_BRANCH.GRO_COMPANYIDFOLIO = 'PRE-ASSIGN'
	ORDER BY name_main_branch;
	
OPEN cur_payors;
FETCH cur_payors into :ls_id_main_branch, :ls_name_main_branch;
DO WHILE SQLCA.SQLCODE = 0 
	lb_payors.additem(fn_completar_cadena(ls_name_main_branch,'D',' ',100)+'*'+ls_id_main_branch)
	FETCH cur_payors into :ls_id_main_branch, :ls_name_main_branch;
LOOP
CLOSE cur_payors;
//---------------------------------------------------------------------------------------------------

lb_payors.SelectItem(1)

ls_id_main_branch = fn_token(lb_payors.Text,"*",2)
dw_1.retrieve(ls_id_main_branch)
end event

type cb_query from commandbutton within w_cla_status
integer x = 1682
integer y = 76
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
boolean default = true
end type

event clicked;string ls_id_main_branch
ls_id_main_branch = fn_token(lb_payors.Text,"*",2)
dw_1.retrieve(ls_id_main_branch)
end event

type dw_1 from datawindow within w_cla_status
integer x = 46
integer y = 244
integer width = 2885
integer height = 1612
string title = "none"
string dataobject = "dw_cla_report"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_3 from commandbutton within w_cla_status
integer x = 2537
integer y = 76
integer width = 393
integer height = 92
integer taborder = 30
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

type st_1 from statictext within w_cla_status
integer x = 119
integer y = 92
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer :"
alignment alignment = right!
boolean focusrectangle = false
end type

type lb_payors from dropdownlistbox within w_cla_status
integer x = 494
integer y = 84
integer width = 1083
integer height = 504
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

type gb_2 from groupbox within w_cla_status
integer x = 46
integer y = 20
integer width = 2446
integer height = 180
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer"
end type

