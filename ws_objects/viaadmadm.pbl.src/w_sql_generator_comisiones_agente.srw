$PBExportHeader$w_sql_generator_comisiones_agente.srw
forward
global type w_sql_generator_comisiones_agente from w_sheet
end type
type cb_close from commandbutton within w_sql_generator_comisiones_agente
end type
type st_name from statictext within w_sql_generator_comisiones_agente
end type
type st_2 from statictext within w_sql_generator_comisiones_agente
end type
type st_path from statictext within w_sql_generator_comisiones_agente
end type
type cbx_commision from checkbox within w_sql_generator_comisiones_agente
end type
type cbx_standar from checkbox within w_sql_generator_comisiones_agente
end type
type cb_one from u_cb within w_sql_generator_comisiones_agente
end type
type rb_ins from radiobutton within w_sql_generator_comisiones_agente
end type
type rb_upd from radiobutton within w_sql_generator_comisiones_agente
end type
type gb_1 from groupbox within w_sql_generator_comisiones_agente
end type
type dw_comision from datawindow within w_sql_generator_comisiones_agente
end type
type dw_standar from datawindow within w_sql_generator_comisiones_agente
end type
type cbx_com_modo_pago from checkbox within w_sql_generator_comisiones_agente
end type
type dw_com_modo_pago from datawindow within w_sql_generator_comisiones_agente
end type
type em_branch from editmask within w_sql_generator_comisiones_agente
end type
type rb_all from radiobutton within w_sql_generator_comisiones_agente
end type
type rb_one from radiobutton within w_sql_generator_comisiones_agente
end type
type cb_all from u_cb within w_sql_generator_comisiones_agente
end type
type dw_1 from datawindow within w_sql_generator_comisiones_agente
end type
type cbx_agent_com_modo_pago from checkbox within w_sql_generator_comisiones_agente
end type
type dw_comision_delivery from datawindow within w_sql_generator_comisiones_agente
end type
type dw_comision_city from datawindow within w_sql_generator_comisiones_agente
end type
type gb_3 from groupbox within w_sql_generator_comisiones_agente
end type
end forward

global type w_sql_generator_comisiones_agente from w_sheet
integer width = 1838
integer height = 864
string title = "SQL Generator Commision to Agent"
boolean maxbox = false
boolean resizable = false
long backcolor = 80269524
boolean clientedge = true
cb_close cb_close
st_name st_name
st_2 st_2
st_path st_path
cbx_commision cbx_commision
cbx_standar cbx_standar
cb_one cb_one
rb_ins rb_ins
rb_upd rb_upd
gb_1 gb_1
dw_comision dw_comision
dw_standar dw_standar
cbx_com_modo_pago cbx_com_modo_pago
dw_com_modo_pago dw_com_modo_pago
em_branch em_branch
rb_all rb_all
rb_one rb_one
cb_all cb_all
dw_1 dw_1
cbx_agent_com_modo_pago cbx_agent_com_modo_pago
dw_comision_delivery dw_comision_delivery
dw_comision_city dw_comision_city
gb_3 gb_3
end type
global w_sql_generator_comisiones_agente w_sql_generator_comisiones_agente

type variables
String	is_output1, is_output
end variables

on w_sql_generator_comisiones_agente.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.st_name=create st_name
this.st_2=create st_2
this.st_path=create st_path
this.cbx_commision=create cbx_commision
this.cbx_standar=create cbx_standar
this.cb_one=create cb_one
this.rb_ins=create rb_ins
this.rb_upd=create rb_upd
this.gb_1=create gb_1
this.dw_comision=create dw_comision
this.dw_standar=create dw_standar
this.cbx_com_modo_pago=create cbx_com_modo_pago
this.dw_com_modo_pago=create dw_com_modo_pago
this.em_branch=create em_branch
this.rb_all=create rb_all
this.rb_one=create rb_one
this.cb_all=create cb_all
this.dw_1=create dw_1
this.cbx_agent_com_modo_pago=create cbx_agent_com_modo_pago
this.dw_comision_delivery=create dw_comision_delivery
this.dw_comision_city=create dw_comision_city
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.st_name
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_path
this.Control[iCurrent+5]=this.cbx_commision
this.Control[iCurrent+6]=this.cbx_standar
this.Control[iCurrent+7]=this.cb_one
this.Control[iCurrent+8]=this.rb_ins
this.Control[iCurrent+9]=this.rb_upd
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.dw_comision
this.Control[iCurrent+12]=this.dw_standar
this.Control[iCurrent+13]=this.cbx_com_modo_pago
this.Control[iCurrent+14]=this.dw_com_modo_pago
this.Control[iCurrent+15]=this.em_branch
this.Control[iCurrent+16]=this.rb_all
this.Control[iCurrent+17]=this.rb_one
this.Control[iCurrent+18]=this.cb_all
this.Control[iCurrent+19]=this.dw_1
this.Control[iCurrent+20]=this.cbx_agent_com_modo_pago
this.Control[iCurrent+21]=this.dw_comision_delivery
this.Control[iCurrent+22]=this.dw_comision_city
this.Control[iCurrent+23]=this.gb_3
end on

on w_sql_generator_comisiones_agente.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.st_name)
destroy(this.st_2)
destroy(this.st_path)
destroy(this.cbx_commision)
destroy(this.cbx_standar)
destroy(this.cb_one)
destroy(this.rb_ins)
destroy(this.rb_upd)
destroy(this.gb_1)
destroy(this.dw_comision)
destroy(this.dw_standar)
destroy(this.cbx_com_modo_pago)
destroy(this.dw_com_modo_pago)
destroy(this.em_branch)
destroy(this.rb_all)
destroy(this.rb_one)
destroy(this.cb_all)
destroy(this.dw_1)
destroy(this.cbx_agent_com_modo_pago)
destroy(this.dw_comision_delivery)
destroy(this.dw_comision_city)
destroy(this.gb_3)
end on

event open;call super::open;SELECT DISTINCT dir_output  
    INTO :is_output
    FROM dba.parametros  ;


CB_ALL.VISIBLE = FALSE;

st_path.text = is_output 


end event

type cb_close from commandbutton within w_sql_generator_comisiones_agente
integer x = 709
integer y = 540
integer width = 462
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type st_name from statictext within w_sql_generator_comisiones_agente
integer x = 827
integer y = 184
integer width = 864
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_2 from statictext within w_sql_generator_comisiones_agente
integer x = 174
integer y = 392
integer width = 343
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Output Folder :"
boolean focusrectangle = false
end type

type st_path from statictext within w_sql_generator_comisiones_agente
integer x = 558
integer y = 392
integer width = 1134
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
boolean focusrectangle = false
end type

event clicked;close(parent)
end event

type cbx_commision from checkbox within w_sql_generator_comisiones_agente
boolean visible = false
integer x = 146
integer y = 112
integer width = 699
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "&Commission Exception"
boolean checked = true
end type

event clicked;dw_comision.retrieve()
end event

type cbx_standar from checkbox within w_sql_generator_comisiones_agente
boolean visible = false
integer x = 146
integer y = 180
integer width = 699
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Commission &Standard"
boolean checked = true
end type

event clicked;dw_standar.retrieve()
end event

type cb_one from u_cb within w_sql_generator_comisiones_agente
integer x = 1198
integer y = 540
integer width = 462
integer height = 84
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "&Generate"
end type

event clicked;Long		ll_ins, ll_cont
String	ls_sqlsyntax, ls_branch = ""
Integer	li_filenum, li_Filelog
String 	ls_agencyfolder

SELECT DISTINCT dba.parametros.dir_output  
  INTO :is_output
  FROM dba.parametros  ;
	 
is_output = TRIM(is_output)

st_path.text = is_output

IF is_output = '' OR IsNull(is_output) THEN
	MessageBox('Error','Output Location is not specified.',StopSign!)
	Return
END IF

ls_branch = em_branch.text

If Isnull(ls_branch) then
	Messagebox("Error","You Must Enter the Branch ID",StopSign!)
	SetFocus(em_branch)
	return
end if

SELECT Count(*)  
INTO :ll_cont
FROM dba.branch WITH (NOLOCK)
WHERE dba.branch.id_branch = :ls_branch;
  
If ll_cont  = 0 then
	Messagebox('Error','Branch not Found',StopSign!)
	Return
end if


// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Connection
n_tr SQLCA_RPT
SQLCA_RPT = Create n_tr
SQLCA_RPT.DBMS = "SNC SQL Native Client(OLE DB)"
SQLCA_RPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
SQLCA_RPT.ServerName = gs_servername_rpt
if SQLCA_RPT.of_connect() <> 0 then
	Messagebox("Error","Error trying connection to Reporting Database"+char(13)+char(10)+SQLCA_RPT.SQLErrText,StopSign!)
	return
end if
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

//dw_comision.SetTransObject(SQLCA_RPT)
//dw_1.SetTransObject(SQLCA_RPT)
//dw_standar.SetTransObject(SQLCA_RPT)
//dw_com_modo_pago.SetTransObject(SQLCA_RPT)
//dw_comision_city.SetTransObject(SQLCA_RPT)
//dw_comision_delivery.SetTransObject(SQLCA_RPT)

// 4/10/2019: To avoid delays on rate changes
dw_comision.SetTransObject(SQLCA)
dw_1.SetTransObject(SQLCA)
dw_standar.SetTransObject(SQLCA)
dw_com_modo_pago.SetTransObject(SQLCA)
dw_comision_city.SetTransObject(SQLCA)
dw_comision_delivery.SetTransObject(SQLCA)

dw_comision.retrieve(ls_branch)
dw_1.retrieve(ls_branch)
dw_standar.retrieve()
dw_com_modo_pago.retrieve()
dw_comision_city.retrieve()
dw_comision_delivery.retrieve()


ls_agencyfolder = ''
if fileexists(is_output+trim(ls_branch)) then ls_agencyfolder = trim(ls_branch) + '\'

is_output1 = is_output  + ls_agencyfolder + "CSS"+FILL('0',10 - LEN(ls_branch))+ls_branch+".sql"
li_FileNum = FileOpen(is_output1, LineMode!, Write!, LockWrite!, Replace!)


SetPointer(HourGlass!)
FileWrite (li_FileNum,"SET option on_error = CONTINUE;")

// ****************** COMMISSION AGENT MODO PAGO ***********************
FileWrite (li_filenum, 'DELETE FROM comision_agent_modo_pago_grupo ; ')

FOR ll_ins=1 TO dw_1.RowCount()
	
	ls_sqlsyntax="INSERT INTO comision_agent_modo_pago_grupo VALUES ("
	
	IF NOT IsNull(dw_1.GetItemString(ll_ins,"id_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"id_branch") )+ "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","		

	IF NOT IsNull(dw_1.GetItemString(ll_ins,"id_main_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"id_main_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_1.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_1.GetItemString(ll_ins,"mod_pay_currency")) THEN
		ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"mod_pay_currency")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_1.GetItemString(ll_ins,"id_modo_pago")) THEN
		ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"id_modo_pago")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"range_begin_comision_pay")) THEN
		ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"range_begin_comision_pay"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"range_end_comision_pay")) THEN
		ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"range_end_comision_pay"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"porcent_comision_comp")) THEN
		ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"porcent_comision_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"feet_comision_comp")) THEN
		ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"feet_comision_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF

	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"porcent_comision_agente")) THEN
		ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"porcent_comision_agente"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"feet_comision_agente")) THEN
		ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"feet_comision_agente"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF 

	ls_sqlsyntax += ");"			
	
	FileWrite (li_FileNum,ls_sqlsyntax)
NEXT



// ****************** COMMISSION DELIVERY  ***********************
FileWrite (li_filenum, 'DELETE FROM comision_delivery ; ')

FOR ll_ins=1 TO dw_comision_delivery.RowCount()
	
	ls_sqlsyntax="INSERT INTO comision_delivery (ID_MAIN_BRANCH,MOD_PAY_CURRENCY,ID_COUNTRY,ID_MODO_PAGO,RANGE_BEGIN,RANGE_END,PORCENT_COMP,FEET_COMP,PORCENT_AGENTE,FEET_AGENTE) VALUES ("

	IF NOT IsNull(dw_comision_delivery.GetItemString(ll_ins,"ID_MAIN_BRANCH")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision_delivery.GetItemString(ll_ins,"ID_MAIN_BRANCH")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF

	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_delivery.GetItemString(ll_ins,"MOD_PAY_CURRENCY")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision_delivery.GetItemString(ll_ins,"MOD_PAY_CURRENCY")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_comision_delivery.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision_delivery.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_delivery.GetItemString(ll_ins,"id_modo_pago")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision_delivery.GetItemString(ll_ins,"id_modo_pago")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"range_begin")) THEN
		ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"range_begin"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"range_end")) THEN
		ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"range_end"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"porcent_comp")) THEN
		ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"porcent_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"feet_comp")) THEN
		ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"feet_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"porcent_agente")) THEN
		ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"porcent_agente"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"feet_agente")) THEN
		ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"feet_agente"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
			  
	ls_sqlsyntax += ");"			
	FileWrite (li_FileNum,ls_sqlsyntax)
NEXT

// ****************** COMMISSION CITY  ***********************
FileWrite (li_filenum, 'DELETE FROM comision_city ; ')

FOR ll_ins=1 TO dw_comision_city.RowCount()
	
	ls_sqlsyntax="INSERT INTO comision_city VALUES ("
	
	IF NOT IsNull(dw_comision_city.GetItemString(ll_ins,"id_city")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision_city.GetItemString(ll_ins,"id_city") )+ "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_city.GetItemString(ll_ins,"id_modo_pago")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision_city.GetItemString(ll_ins,"id_modo_pago") )+ "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"range_begin")) THEN
		ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"range_begin"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"range_end")) THEN
		ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"range_end"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"porcent_comp")) THEN
		ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"porcent_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"feet_comp")) THEN
		ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"feet_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"porcent_agente")) THEN
		ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"porcent_agente"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"feet_agente")) THEN
		ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"feet_agente"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			  
	ls_sqlsyntax += ");"			
	FileWrite (li_FileNum,ls_sqlsyntax)
NEXT


// ****************** COMMISSION ***********************
FileWrite (li_filenum, 'DELETE FROM comision ; ')

FOR ll_ins=1 TO dw_comision.RowCount()
	
	ls_sqlsyntax="INSERT INTO comision VALUES ("
	
	IF NOT IsNull(dw_comision.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
					
	IF NOT IsNull(dw_comision.GetItemString(ll_ins,"id_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision.GetItemString(ll_ins,"id_branch") )+ "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
			
	IF NOT IsNull(dw_comision.GetItemString(ll_ins,"mod_pay_currency")) THEN
		ls_sqlsyntax += "'" + trim(dw_comision.GetItemString(ll_ins,"mod_pay_currency") )+ "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"range_begin_comision")) THEN
		ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"range_begin_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"range_end_comision")) THEN
		ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"range_end_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"feet_comision")) THEN
		ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"feet_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"porcent_costumer_comision")) THEN
		ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"porcent_costumer_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"porcent_company_comision")) THEN
		ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"porcent_company_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"feet_comision_comp")) THEN
		ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"feet_comision_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_comision.GetItemdatetime(ll_ins,"date_upgrade")) THEN
		ls_sqlsyntax += "'" + String(date(dw_comision.GetItemDatetime(ll_ins,"date_upgrade")),"yyyy-mm-dd") + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF  
	  
	ls_sqlsyntax += ");"			
	
	FileWrite (li_FileNum,ls_sqlsyntax)
NEXT
// ****************** COMMISSION MODO PAGO ***********************

FileWrite (li_filenum, 'SET option on_error = CONTINUE;')

// -------------------------------->
// Compatibilidad con la nueva version para agencias con la version msa
FileWrite (li_filenum, 'ALTER TABLE COMISION_MODO_PAGO_GRUPO ADD (STANDAR_EXCLUSION CHAR(1));')
// Fin Compatibilidad
// -------------------------------->	

FileWrite (li_filenum, 'DELETE FROM comision_modo_pago_grupo ; ')

FOR ll_ins=1 TO dw_com_modo_pago.RowCount()
	
	ls_sqlsyntax="INSERT INTO comision_modo_pago_grupo VALUES ("
	
	IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"id_main_branch")) THEN
		ls_sqlsyntax += "'" + trim(dw_com_modo_pago.GetItemString(ll_ins,"id_main_branch")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_com_modo_pago.GetItemString(ll_ins,"id_country")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"mod_pay_currency")) THEN
		ls_sqlsyntax += "'" + trim(dw_com_modo_pago.GetItemString(ll_ins,"mod_pay_currency") )+ "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"id_modo_pago")) THEN
		ls_sqlsyntax += "'" + trim(dw_com_modo_pago.GetItemString(ll_ins,"id_modo_pago")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"range_begin_comision_pay")) THEN
		ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"range_begin_comision_pay"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"range_end_comision_pay")) THEN
		ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"range_end_comision_pay"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_comp")) THEN
		ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_comp")) THEN
		ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_payee")) THEN
		ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_payee"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_payee")) THEN
		ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_payee"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_agente")) THEN
		ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_agente"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_agente")) THEN
		ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_agente"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF 
	  
	ls_sqlsyntax += ","
		
	IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"standar_exclusion")) THEN
		ls_sqlsyntax += "'" + dw_com_modo_pago.GetItemString(ll_ins,"standar_exclusion") + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF  

	ls_sqlsyntax += ");"			
	
	FileWrite (li_FileNum,ls_sqlsyntax)
NEXT


// ****************** STANDAR ***********************

FileWrite (li_filenum, 'DELETE FROM standar ; ')

FOR ll_ins=1 TO dw_standar.RowCount()
	//	ls_sqlsyntax="INSERT INTO standar VALUES ("
	ls_sqlsyntax="INSERT INTO standar (id_country,mod_pay_currency,range_begin_comision,range_end_comision,feet_comision,porcent_costumer_comision,porcent_company_comision,feet_comision_comp,date_upgrade) VALUES ("		

	IF NOT IsNull(dw_standar.GetItemString(ll_ins,"id_country")) THEN
		ls_sqlsyntax += "'" + trim(dw_standar.GetItemString(ll_ins,"id_country") )+ "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_standar.GetItemString(ll_ins,"mod_pay_currency")) THEN
		ls_sqlsyntax += "'" + trim(dw_standar.GetItemString(ll_ins,"mod_pay_currency")) + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"range_begin_comision")) THEN
		ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"range_begin_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"range_end_comision")) THEN
		ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"range_end_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","
	
	IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"feet_comision")) THEN
		ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"feet_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"porcent_costumer_comision")) THEN
		ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"porcent_costumer_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"porcent_company_comision")) THEN
		ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"porcent_company_comision"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"feet_comision_comp")) THEN
		ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"feet_comision_comp"))
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
	  
	ls_sqlsyntax += ","

	IF NOT IsNull(dw_standar.GetItemdatetime(ll_ins,"date_upgrade")) THEN
		ls_sqlsyntax += "'" + String(date(dw_standar.GetItemDatetime(ll_ins,"date_upgrade")),"yyyy-mm-dd") + "'"
	ELSE
		ls_sqlsyntax += "NULL"
	END IF
			
	ls_sqlsyntax += ");"			
	
	FileWrite (li_FileNum,ls_sqlsyntax)
NEXT

FileWrite (li_FileNum,"COMMIT;")

FileClose(li_FileNum)

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


MessageBox('Process Finished','Commissions have been published to '+trim(ls_branch)+'.',Information!)

//MessageBox('Process','Finished.',Information!)


end event

type rb_ins from radiobutton within w_sql_generator_comisiones_agente
boolean visible = false
integer x = 677
integer y = 108
integer width = 215
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Insert"
boolean checked = true
boolean lefttext = true
end type

type rb_upd from radiobutton within w_sql_generator_comisiones_agente
boolean visible = false
integer x = 677
integer y = 164
integer width = 215
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Update"
boolean lefttext = true
end type

type gb_1 from groupbox within w_sql_generator_comisiones_agente
boolean visible = false
integer x = 649
integer y = 52
integer width = 306
integer height = 200
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "File"
end type

type dw_comision from datawindow within w_sql_generator_comisiones_agente
integer x = 32
integer y = 1312
integer width = 2025
integer height = 188
boolean bringtotop = true
string dataobject = "dw_export_comision_filter_agent"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_standar from datawindow within w_sql_generator_comisiones_agente
integer x = 32
integer y = 1508
integer width = 2025
integer height = 188
boolean bringtotop = true
string dataobject = "dw_export_standar"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type cbx_com_modo_pago from checkbox within w_sql_generator_comisiones_agente
boolean visible = false
integer x = 146
integer y = 248
integer width = 699
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Commission Delivery"
boolean checked = true
end type

event clicked;dw_com_modo_pago.retrieve()
end event

type dw_com_modo_pago from datawindow within w_sql_generator_comisiones_agente
integer x = 32
integer y = 1704
integer width = 2025
integer height = 188
boolean bringtotop = true
string dataobject = "dw_export_com_modo_pago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type em_branch from editmask within w_sql_generator_comisiones_agente
integer x = 530
integer y = 176
integer width = 274
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;string ls_branch, ls_name

ls_branch = em_branch.text

SELECT name_branch
INTO :ls_name  
FROM dba.branch  
WHERE dba.branch.id_branch = :ls_branch;

if isnull(ls_name) then ls_name = ''

st_name.text = ls_name
end event

type rb_all from radiobutton within w_sql_generator_comisiones_agente
integer x = 174
integer y = 284
integer width = 626
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
string text = "To All Agents"
end type

event clicked;em_branch.enabled = False
cb_one.visible = False
cb_all.visible = True
end event

type rb_one from radiobutton within w_sql_generator_comisiones_agente
integer x = 174
integer y = 168
integer width = 320
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
string text = "To Agent : "
boolean checked = true
end type

event clicked;em_branch.enabled = True
cb_one.visible = True
cb_all.visible = False
end event

type cb_all from u_cb within w_sql_generator_comisiones_agente
integer x = 1198
integer y = 540
integer width = 462
integer height = 84
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Generate to &All"
end type

event clicked;Long		ll_ins, ll_cont
String	ls_sqlsyntax, ls_branch = ""
Integer	li_filenum, li_Filelog
String 	ls_agencyfolder

SELECT DISTINCT dir_output  
    INTO :is_output
    FROM dba.parametros  ;
	 
is_output = TRIM(is_output)

st_path.text = is_output

// ******************
// Validate U: Drive!
fn_map_output()
if not fileexists('R:\Output') then
	Messagebox("Error!","Network drive not ready, please try again!",StopSign!)
	return
end if
// ******************

// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Connection
n_tr SQLCA_RPT
SQLCA_RPT = Create n_tr
SQLCA_RPT.DBMS = "SNC SQL Native Client(OLE DB)"
SQLCA_RPT.DBParm = "Database='"+gs_db_rpt+"'" + ",TrustedConnection=1,TrimSpaces=1,Secure=1"
SQLCA_RPT.ServerName = gs_servername_rpt
if SQLCA_RPT.of_connect() <> 0 then
	Messagebox("Error","Error trying connection to Reporting Database"+char(13)+char(10)+SQLCA_RPT.SQLErrText,StopSign!)
	return
end if
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

//dw_standar.SetTransObject(SQLCA_RPT)
//dw_com_modo_pago.SetTransObject(SQLCA_RPT)
// 4/10/2019: To avoid delays on rate changes
dw_standar.SetTransObject(SQLCA)
dw_com_modo_pago.SetTransObject(SQLCA)



dw_standar.retrieve()
dw_com_modo_pago.retrieve()

DECLARE branch CURSOR FOR  
SELECT id_branch  
FROM DBA.VW_AGENCIESPC USING SQLCA_RPT;

OPEN branch ;

FETCH branch INTO :ls_branch ;

DO WHILE SQLCA_RPT.SQLCODE = 0

	ls_agencyfolder = ''
	if fileexists(is_output+trim(ls_branch)) then ls_agencyfolder = trim(ls_branch) + '\'

	ls_branch = TRIM(ls_branch)
	is_output1 = ''
	is_output1 = is_output + ls_agencyfolder + "CSS"+FILL('0',10 - LEN(ls_branch))+ls_branch+".sql"

//	// --------------------------------------------------------------------------
//	// Chequea si la agencia no tiene la nueva version
//	// Si se le generan los nuevos archivos se dana la agencia con sistema viejo
//	Long ll_hasoldversion
//	
//	SELECT count(*)  
//	INTO :ll_hasoldversion  
//	FROM dba.VERSION_PROGRAMA  
//	WHERE dba.VERSION_PROGRAMA.IB_BRANCH = :ls_branch   ;
//	
//	If ll_hasoldversion > 0 then

		li_FileNum = FileOpen(is_output1, LineMode!, Write!, LockWrite!,Replace!)
		
		if li_filenum < 0 Then
			Messagebox("Error","You Have To Verificate the Table Parameters")
			Return
		end if
				
//		dw_comision.SetTransObject(SQLCA_RPT)
//		dw_comision_city.SetTransObject(SQLCA_RPT)
//		dw_comision_delivery.SetTransObject(SQLCA_RPT)
//		dw_1.SetTransObject(SQLCA_RPT)

		// 4/10/2019: To avoid delays on rate changes
		dw_comision.SetTransObject(SQLCA)
		dw_comision_city.SetTransObject(SQLCA)
		dw_comision_delivery.SetTransObject(SQLCA)
		dw_1.SetTransObject(SQLCA)


		dw_comision.retrieve(ls_branch)
		dw_comision_city.retrieve()
		dw_comision_delivery.retrieve()
		dw_1.retrieve(ls_branch)
		
		SetPointer(HourGlass!)
		
		FileWrite (li_FileNum,"SET option on_error = CONTINUE;")
		
		// ****************** COMMISSION AGENT MODO PAGO ***********************
			FileWrite (li_filenum, 'DELETE FROM comision_agent_modo_pago_grupo ; ')
		
			FOR ll_ins=1 TO dw_1.RowCount()
				
					ls_sqlsyntax="INSERT INTO comision_agent_modo_pago_grupo VALUES ("
				
				IF NOT IsNull(dw_1.GetItemString(ll_ins,"id_branch")) THEN
					ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"id_branch")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			
				IF NOT IsNull(dw_1.GetItemString(ll_ins,"id_main_branch")) THEN
					ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"id_main_branch")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			
				IF NOT IsNull(dw_1.GetItemString(ll_ins,"id_country")) THEN
					ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"id_country") )+ "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			 
				IF NOT IsNull(dw_1.GetItemString(ll_ins,"mod_pay_currency")) THEN
					ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"mod_pay_currency")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			 
				IF NOT IsNull(dw_1.GetItemString(ll_ins,"id_modo_pago")) THEN
					ls_sqlsyntax += "'" + trim(dw_1.GetItemString(ll_ins,"id_modo_pago")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"range_begin_comision_pay")) THEN
					ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"range_begin_comision_pay"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"range_end_comision_pay")) THEN
					ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"range_end_comision_pay"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"porcent_comision_comp")) THEN
					ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"porcent_comision_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"feet_comision_comp")) THEN
					ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"feet_comision_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
		
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"porcent_comision_agente")) THEN
					ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"porcent_comision_agente"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
				  
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_1.GetItemNumber(ll_ins,"feet_comision_agente")) THEN
					ls_sqlsyntax += String(dw_1.GetItemNumber(ll_ins,"feet_comision_agente"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF 
			
				ls_sqlsyntax += ");"			
				
				FileWrite (li_FileNum,ls_sqlsyntax)
			NEXT
		
		
		// ****************** COMMISSION DELIVERY  ***********************
			FileWrite (li_filenum, 'DELETE FROM comision_delivery ; ')
			
			FOR ll_ins=1 TO dw_comision_delivery.RowCount()
				
				ls_sqlsyntax="INSERT INTO comision_delivery (ID_MAIN_BRANCH,MOD_PAY_CURRENCY,ID_COUNTRY,ID_MODO_PAGO,RANGE_BEGIN,RANGE_END,PORCENT_COMP,FEET_COMP,PORCENT_AGENTE,FEET_AGENTE) VALUES ("
		
				
				IF NOT IsNull(dw_comision_delivery.GetItemString(ll_ins,"ID_MAIN_BRANCH")) THEN
					ls_sqlsyntax += "'" + trim(dw_comision_delivery.GetItemString(ll_ins,"ID_MAIN_BRANCH")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
				
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision_delivery.GetItemString(ll_ins,"MOD_PAY_CURRENCY")) THEN
					ls_sqlsyntax += "'" + trim(dw_comision_delivery.GetItemString(ll_ins,"MOD_PAY_CURRENCY")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF				
				
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_comision_delivery.GetItemString(ll_ins,"id_country")) THEN
					ls_sqlsyntax += "'" +trim( dw_comision_delivery.GetItemString(ll_ins,"id_country") )+ "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision_delivery.GetItemString(ll_ins,"id_modo_pago")) THEN
					ls_sqlsyntax += "'" + trim(dw_comision_delivery.GetItemString(ll_ins,"id_modo_pago")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","			
				
				IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"range_begin")) THEN
					ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"range_begin"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","		
				
				IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"range_end")) THEN
					ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"range_end"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			
				IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"porcent_comp")) THEN
					ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"porcent_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"feet_comp")) THEN
					ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"feet_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
										
				IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"porcent_agente")) THEN
					ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"porcent_agente"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision_delivery.GetItemNumber(ll_ins,"feet_agente")) THEN
					ls_sqlsyntax += String(dw_comision_delivery.GetItemNumber(ll_ins,"feet_agente"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						  
				ls_sqlsyntax += ");"			
				FileWrite (li_FileNum,ls_sqlsyntax)
			NEXT
		

		// ****************** COMMISSION CITY  ***********************
			FileWrite (li_filenum, 'DELETE FROM comision_city ; ')
			
			FOR ll_ins=1 TO dw_comision_city.RowCount()
				
				ls_sqlsyntax="INSERT INTO comision_city VALUES ("
				
				IF NOT IsNull(dw_comision_city.GetItemString(ll_ins,"id_city")) THEN
					ls_sqlsyntax += "'" + trim(dw_comision_city.GetItemString(ll_ins,"id_city")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision_city.GetItemString(ll_ins,"id_modo_pago")) THEN
					ls_sqlsyntax += "'" +trim( dw_comision_city.GetItemString(ll_ins,"id_modo_pago")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			
				IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"range_begin")) THEN
					ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"range_begin"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"range_end")) THEN
					ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"range_end"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			
				IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"porcent_comp")) THEN
					ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"porcent_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"feet_comp")) THEN
					ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"feet_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"porcent_agente")) THEN
					ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"porcent_agente"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision_city.GetItemNumber(ll_ins,"feet_agente")) THEN
					ls_sqlsyntax += String(dw_comision_city.GetItemNumber(ll_ins,"feet_agente"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
				    
				ls_sqlsyntax += ");"			
				FileWrite (li_FileNum,ls_sqlsyntax)
			NEXT
		
		// ****************** COMMISSION ***********************
			FileWrite (li_filenum, 'DELETE FROM comision ; ')
			
			FOR ll_ins=1 TO dw_comision.RowCount()
				
				ls_sqlsyntax="INSERT INTO comision VALUES ("
				
				IF NOT IsNull(dw_comision.GetItemString(ll_ins,"id_country")) THEN
					ls_sqlsyntax += "'" + trim(dw_comision.GetItemString(ll_ins,"id_country")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
								
				IF NOT IsNull(dw_comision.GetItemString(ll_ins,"id_branch")) THEN
					ls_sqlsyntax += "'" + trim(dw_comision.GetItemString(ll_ins,"id_branch")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision.GetItemString(ll_ins,"mod_pay_currency")) THEN
					ls_sqlsyntax += "'" + trim(dw_comision.GetItemString(ll_ins,"mod_pay_currency") )+ "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"range_begin_comision")) THEN
					ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"range_begin_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"range_end_comision")) THEN
					ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"range_end_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			
				IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"feet_comision")) THEN
					ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"feet_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"porcent_costumer_comision")) THEN
					ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"porcent_costumer_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"porcent_company_comision")) THEN
					ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"porcent_company_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision.GetItemNumber(ll_ins,"feet_comision_comp")) THEN
					ls_sqlsyntax += String(dw_comision.GetItemNumber(ll_ins,"feet_comision_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
				  
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_comision.GetItemdatetime(ll_ins,"date_upgrade")) THEN
					ls_sqlsyntax += "'" + String(date(dw_comision.GetItemDatetime(ll_ins,"date_upgrade")),"yyyy-mm-dd") + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF  
				  
				ls_sqlsyntax += ");"			
				
				FileWrite (li_FileNum,ls_sqlsyntax)
			NEXT
		// ****************** COMMISSION MODO PAGO ***********************
		
			FileWrite (li_filenum, 'SET option on_error = CONTINUE;')
			
			// -------------------------------->
			// Compatibilidad con la nueva version para agencias con la version msa
			FileWrite (li_filenum, 'ALTER TABLE COMISION_MODO_PAGO_GRUPO ADD (STANDAR_EXCLUSION CHAR(1));')
			// Fin Compatibilidad
			// -------------------------------->	
			
			FileWrite (li_filenum, 'DELETE FROM comision_modo_pago_grupo ; ')
		
			FOR ll_ins=1 TO dw_com_modo_pago.RowCount()
				
				ls_sqlsyntax="INSERT INTO comision_modo_pago_grupo VALUES ("
							
				IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"id_main_branch")) THEN
					ls_sqlsyntax += "'" +trim(dw_com_modo_pago.GetItemString(ll_ins,"id_main_branch") )+ "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
			
				IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"id_country")) THEN
					ls_sqlsyntax += "'" + trim(dw_com_modo_pago.GetItemString(ll_ins,"id_country") )+ "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
					 
				IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"mod_pay_currency")) THEN
					ls_sqlsyntax += "'" + trim(dw_com_modo_pago.GetItemString(ll_ins,"mod_pay_currency")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","				
			 
				IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"id_modo_pago")) THEN
					ls_sqlsyntax += "'" + trim(dw_com_modo_pago.GetItemString(ll_ins,"id_modo_pago")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
						
				IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"range_begin_comision_pay")) THEN
					ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"range_begin_comision_pay"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"range_end_comision_pay")) THEN
					ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"range_end_comision_pay"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_comp")) THEN
					ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_comp")) THEN
					ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_payee")) THEN
					ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_payee"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_payee")) THEN
					ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_payee"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
				  
			   ls_sqlsyntax += ","
								
				IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_agente")) THEN
					ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"porcent_comision_agente"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
				  
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_agente")) THEN
					ls_sqlsyntax += String(dw_com_modo_pago.GetItemNumber(ll_ins,"feet_comision_agente"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF 
				  
				ls_sqlsyntax += ","
					
				IF NOT IsNull(dw_com_modo_pago.GetItemString(ll_ins,"standar_exclusion")) THEN
					ls_sqlsyntax += "'" + trim(dw_com_modo_pago.GetItemString(ll_ins,"standar_exclusion")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF  
		
					ls_sqlsyntax += ");"			
				
				FileWrite (li_FileNum,ls_sqlsyntax)
			NEXT
									
		// ****************** STANDAR ***********************
		
			FileWrite (li_filenum, 'DELETE FROM standar ; ')
			
			FOR ll_ins=1 TO dw_standar.RowCount()
				//	ls_sqlsyntax="INSERT INTO standar VALUES ("
				ls_sqlsyntax="INSERT INTO standar (id_country,mod_pay_currency,range_begin_comision,range_end_comision,feet_comision,porcent_costumer_comision,porcent_company_comision,feet_comision_comp,date_upgrade) VALUES ("			  
				
		
				IF NOT IsNull(dw_standar.GetItemString(ll_ins,"id_country")) THEN
					ls_sqlsyntax += "'" + trim(dw_standar.GetItemString(ll_ins,"id_country")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_standar.GetItemString(ll_ins,"mod_pay_currency")) THEN
					ls_sqlsyntax += "'" + trim(dw_standar.GetItemString(ll_ins,"mod_pay_currency")) + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"range_begin_comision")) THEN
					ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"range_begin_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
										
				IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"range_end_comision")) THEN
					ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"range_end_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
				
				IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"feet_comision")) THEN
					ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"feet_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"porcent_costumer_comision")) THEN
					ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"porcent_costumer_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
		
				IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"porcent_company_comision")) THEN
					ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"porcent_company_comision"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
				ls_sqlsyntax += ","
						  
				IF NOT IsNull(dw_standar.GetItemNumber(ll_ins,"feet_comision_comp")) THEN
					ls_sqlsyntax += String(dw_standar.GetItemNumber(ll_ins,"feet_comision_comp"))
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
				  				  
				ls_sqlsyntax += ","
					  
				IF NOT IsNull(dw_standar.GetItemdatetime(ll_ins,"date_upgrade")) THEN
					ls_sqlsyntax += "'" + String(date(dw_standar.GetItemDatetime(ll_ins,"date_upgrade")),"yyyy-mm-dd") + "'"
				ELSE
					ls_sqlsyntax += "NULL"
				END IF
						
					ls_sqlsyntax += ");"			
				
		
				FileWrite (li_FileNum,ls_sqlsyntax)
			NEXT
	
		FileWrite(li_FileNum,'COMMIT;')
		FileClose(li_FileNum)

FETCH branch INTO :ls_branch ;

LOOP

CLOSE branch ;


// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// RPT Server Disconnection
SQLCA_RPT.of_disconnect()
destroy SQLCA_RPT
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MessageBox('Process Finished','Commissions have been published to all open branches.',Information!)

//MessageBox('Process','Finished.',Information!)
end event

type dw_1 from datawindow within w_sql_generator_comisiones_agente
integer x = 32
integer y = 920
integer width = 2025
integer height = 188
boolean bringtotop = true
string dataobject = "dw_sql_com_agent_modo_pago_grupo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type cbx_agent_com_modo_pago from checkbox within w_sql_generator_comisiones_agente
boolean visible = false
integer x = 146
integer y = 316
integer width = 699
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Commission Agent Delivery"
boolean checked = true
end type

event clicked;dw_com_modo_pago.retrieve()
end event

type dw_comision_delivery from datawindow within w_sql_generator_comisiones_agente
integer x = 32
integer y = 1116
integer width = 2025
integer height = 188
boolean bringtotop = true
string dataobject = "dw_sql_comision_delivery"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_comision_city from datawindow within w_sql_generator_comisiones_agente
integer x = 32
integer y = 1900
integer width = 2025
integer height = 188
boolean bringtotop = true
string dataobject = "dw_sql_comision_city"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type gb_3 from groupbox within w_sql_generator_comisiones_agente
integer x = 41
integer y = 24
integer width = 1714
integer height = 680
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Generate Commissions"
end type

