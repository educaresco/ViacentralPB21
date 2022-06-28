$PBExportHeader$w_sql_generator_2005.srw
forward
global type w_sql_generator_2005 from w_sheet
end type
type dw_dummydw from datawindow within w_sql_generator_2005
end type
type cb_4 from commandbutton within w_sql_generator_2005
end type
type cb_selectfile from commandbutton within w_sql_generator_2005
end type
type sle_filefrom from singlelineedit within w_sql_generator_2005
end type
type rb_copyfiles from radiobutton within w_sql_generator_2005
end type
type em_country from editmask within w_sql_generator_2005
end type
type cbx_country from checkbox within w_sql_generator_2005
end type
type rb_data_pay from radiobutton within w_sql_generator_2005
end type
type rb_data_ran from radiobutton within w_sql_generator_2005
end type
type em_id_main_branch from editmask within w_sql_generator_2005
end type
type tabpub from tab within w_sql_generator_2005
end type
type nor from userobject within tabpub
end type
type rb_all from radiobutton within nor
end type
type rb_one from radiobutton within nor
end type
type gb_3 from groupbox within nor
end type
type sle_agencia from singlelineedit within nor
end type
type nor from userobject within tabpub
rb_all rb_all
rb_one rb_one
gb_3 gb_3
sle_agencia sle_agencia
end type
type adv from userobject within tabpub
end type
type sle_sql from multilineedit within adv
end type
type cbx_qbe from checkbox within adv
end type
type gb_6 from groupbox within adv
end type
type adv from userobject within tabpub
sle_sql sle_sql
cbx_qbe cbx_qbe
gb_6 gb_6
end type
type tabpub from tab within w_sql_generator_2005
nor nor
adv adv
end type
type gb_2 from groupbox within w_sql_generator_2005
end type
type st_path from statictext within w_sql_generator_2005
end type
type cb_1 from u_cb within w_sql_generator_2005
end type
type gb_4 from groupbox within w_sql_generator_2005
end type
type cb_generate from commandbutton within w_sql_generator_2005
end type
type em_date1 from u_em within w_sql_generator_2005
end type
type cb_2 from commandbutton within w_sql_generator_2005
end type
type em_date2 from u_em within w_sql_generator_2005
end type
type cb_3 from commandbutton within w_sql_generator_2005
end type
type st_1 from statictext within w_sql_generator_2005
end type
type st_2 from statictext within w_sql_generator_2005
end type
type st_5 from statictext within w_sql_generator_2005
end type
type sle_appendfile from singlelineedit within w_sql_generator_2005
end type
type cb_appendfile from commandbutton within w_sql_generator_2005
end type
type sle_status from singlelineedit within w_sql_generator_2005
end type
type st_3 from statictext within w_sql_generator_2005
end type
type st_4 from statictext within w_sql_generator_2005
end type
type st_6 from statictext within w_sql_generator_2005
end type
type lb_errores from listbox within w_sql_generator_2005
end type
end forward

global type w_sql_generator_2005 from w_sheet
integer x = 214
integer y = 221
integer width = 2350
integer height = 2000
string title = "SQL Generator"
boolean maxbox = false
boolean resizable = false
long backcolor = 80269524
dw_dummydw dw_dummydw
cb_4 cb_4
cb_selectfile cb_selectfile
sle_filefrom sle_filefrom
rb_copyfiles rb_copyfiles
em_country em_country
cbx_country cbx_country
rb_data_pay rb_data_pay
rb_data_ran rb_data_ran
em_id_main_branch em_id_main_branch
tabpub tabpub
gb_2 gb_2
st_path st_path
cb_1 cb_1
gb_4 gb_4
cb_generate cb_generate
em_date1 em_date1
cb_2 cb_2
em_date2 em_date2
cb_3 cb_3
st_1 st_1
st_2 st_2
st_5 st_5
sle_appendfile sle_appendfile
cb_appendfile cb_appendfile
sle_status sle_status
st_3 st_3
st_4 st_4
st_6 st_6
lb_errores lb_errores
end type
global w_sql_generator_2005 w_sql_generator_2005

type variables
string	is_output, is_output1
end variables

on w_sql_generator_2005.create
int iCurrent
call super::create
this.dw_dummydw=create dw_dummydw
this.cb_4=create cb_4
this.cb_selectfile=create cb_selectfile
this.sle_filefrom=create sle_filefrom
this.rb_copyfiles=create rb_copyfiles
this.em_country=create em_country
this.cbx_country=create cbx_country
this.rb_data_pay=create rb_data_pay
this.rb_data_ran=create rb_data_ran
this.em_id_main_branch=create em_id_main_branch
this.tabpub=create tabpub
this.gb_2=create gb_2
this.st_path=create st_path
this.cb_1=create cb_1
this.gb_4=create gb_4
this.cb_generate=create cb_generate
this.em_date1=create em_date1
this.cb_2=create cb_2
this.em_date2=create em_date2
this.cb_3=create cb_3
this.st_1=create st_1
this.st_2=create st_2
this.st_5=create st_5
this.sle_appendfile=create sle_appendfile
this.cb_appendfile=create cb_appendfile
this.sle_status=create sle_status
this.st_3=create st_3
this.st_4=create st_4
this.st_6=create st_6
this.lb_errores=create lb_errores
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dummydw
this.Control[iCurrent+2]=this.cb_4
this.Control[iCurrent+3]=this.cb_selectfile
this.Control[iCurrent+4]=this.sle_filefrom
this.Control[iCurrent+5]=this.rb_copyfiles
this.Control[iCurrent+6]=this.em_country
this.Control[iCurrent+7]=this.cbx_country
this.Control[iCurrent+8]=this.rb_data_pay
this.Control[iCurrent+9]=this.rb_data_ran
this.Control[iCurrent+10]=this.em_id_main_branch
this.Control[iCurrent+11]=this.tabpub
this.Control[iCurrent+12]=this.gb_2
this.Control[iCurrent+13]=this.st_path
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.gb_4
this.Control[iCurrent+16]=this.cb_generate
this.Control[iCurrent+17]=this.em_date1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.em_date2
this.Control[iCurrent+20]=this.cb_3
this.Control[iCurrent+21]=this.st_1
this.Control[iCurrent+22]=this.st_2
this.Control[iCurrent+23]=this.st_5
this.Control[iCurrent+24]=this.sle_appendfile
this.Control[iCurrent+25]=this.cb_appendfile
this.Control[iCurrent+26]=this.sle_status
this.Control[iCurrent+27]=this.st_3
this.Control[iCurrent+28]=this.st_4
this.Control[iCurrent+29]=this.st_6
this.Control[iCurrent+30]=this.lb_errores
end on

on w_sql_generator_2005.destroy
call super::destroy
destroy(this.dw_dummydw)
destroy(this.cb_4)
destroy(this.cb_selectfile)
destroy(this.sle_filefrom)
destroy(this.rb_copyfiles)
destroy(this.em_country)
destroy(this.cbx_country)
destroy(this.rb_data_pay)
destroy(this.rb_data_ran)
destroy(this.em_id_main_branch)
destroy(this.tabpub)
destroy(this.gb_2)
destroy(this.st_path)
destroy(this.cb_1)
destroy(this.gb_4)
destroy(this.cb_generate)
destroy(this.em_date1)
destroy(this.cb_2)
destroy(this.em_date2)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.sle_appendfile)
destroy(this.cb_appendfile)
destroy(this.sle_status)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.lb_errores)
end on

event open;call super::open; SELECT DISTINCT dir_output
    INTO :is_output
    FROM dba.parametros  ;

//is_output = 'C:\'

is_output = trim(is_output)
st_path.text = is_output
em_date1.text = string(today())
em_date2.text = string(today())

//tabpub.adv.sle_sql.text = "SELECT ID_BRANCH ~r~nFROM DBA.BRANCH, DBA.VERSION_PROGRAMA ~r~nWHERE ID_STATUS_BRANCH = 'O' ~r~nAND ID_TYPE_BRANCH IN ('A','R') ~r~nAND ID_BRANCH = IB_BRANCH ~r~nORDER BY ID_BRANCH"

tabpub.adv.sle_sql.text = " SELECT id_branch ~r~nFROM DBA.VW_AGENCIESPC ~r~n WHERE ID_BRANCH = ID_BRANCH ~r~nORDER BY ID_BRANCH"




end event

type dw_dummydw from datawindow within w_sql_generator_2005
integer x = 41
integer y = 984
integer width = 2272
integer height = 916
integer taborder = 90
string dataobject = "dw_dummydw"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type cb_4 from commandbutton within w_sql_generator_2005
boolean visible = false
integer x = 1143
integer y = 672
integer width = 192
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
end type

event clicked;String ls_id_branch,  ld_id_receiver, ld_id_sender, ls_rec_fname, ls_rec_mname, ls_rec_lname, ls_rec_slname;
long ll_OfacCount


 DECLARE cur_orders CURSOR FOR  
	SELECT 
	DISTINCT
	DBA.RECEIVER.ID_BRANCH,
	DBA.RECEIVER.ID_RECEIVER,
	DBA.RECEIVER.ID_SENDER,
	SEN_FNAME,
	SEN_MNAME,
	SEN_LNAME,
	SEN_SLNAME
	FROM DBA.RECEIVER, DBA.OFAC_HIT_ERR, dba.SENDER
	WHERE dba.receiver.id_branch = dba.sender.id_branch
	AND dba.receiver.id_sender = dba.sender.id_sender
	AND DBA.RECEIVER.ID_BRANCH = DBA.OFAC_HIT_ERR.ID_BRANCH
	AND DBA.RECEIVER.ID_RECEIVER = DBA.OFAC_HIT_ERR.ID_RECEIVER
	AND TYPE_HIT = 'S';
	
	
//	SELECT 
//	DISTINCT
//	DBA.RECEIVER.ID_BRANCH,
//	DBA.RECEIVER.ID_RECEIVER,
//	DBA.RECEIVER.ID_SENDER,
//	REC_FNAME,
//	REC_MNAME,
//	REC_LNAME,
//	REC_SLNAME
//	FROM DBA.RECEIVER, DBA.OFAC_HIT_ERR
//	WHERE DBA.RECEIVER.ID_BRANCH = DBA.OFAC_HIT_ERR.ID_BRANCH
//	AND DBA.RECEIVER.ID_RECEIVER = DBA.OFAC_HIT_ERR.ID_RECEIVER
//	AND TYPE_HIT = 'R';	

open cur_orders;
	
	FETCH cur_orders INTO :ls_id_branch,  :ld_id_receiver, :ld_id_sender,  :ls_rec_fname, :ls_rec_mname,  :ls_rec_lname,   :ls_rec_slname;
		
	DO WHILE SQLCA.SQLCODE = 0		
		
		ll_OfacCount = 0
		
		// New Ofac Check!
		 DECLARE spCalcOfacReceiver PROCEDURE FOR dba.spCalOfacMatchesOrder_temp_rerun  
				LS_ID_BRANCH = :ls_id_branch,   
				LD_ID_RECEIVER = :ld_id_receiver,   
				LD_ID_SENDER = :ld_id_sender,   
				PS_TYPE = 'S',   
				PS_FNAME = :ls_rec_fname,   
				PS_MNAME = :ls_rec_mname,   
				PS_LNAME = :ls_rec_lname,   
				PS_SLNAME = :ls_rec_slname;
		
		Execute spCalcOfacReceiver;
		
		if SQLCA.SQLCode <> 0 then			
			//fn_email_notification2("ebernal@viamericas.com","ERROR Executing New Ofac SP","Error on Execute spCalcOfacReceiver: "+String(SQLCA.SQLCode)+" - " + SQLCA.SQLErrText)
			
			Messagebox('spCalOfacMatchesOrder: '+ls_id_branch + '-'+String(ld_id_receiver),SQLCA.SQLErrText)
		end if
		
		
		// not sure why this, replace by the select below
		Fetch spCalcOfacReceiver INTO :ll_OfacCount;
		
//		SELECT count(*) 
//		INTO :ll_OfacCount
//		FROM dba.OFAC_HIT
//		WHERE ID_BRANCH =:ls_id_branch
//		AND ID_RECEIVER = :ld_id_receiver
//		AND TYPE_HIT = 'R';  
//		
		if ll_OfacCount > 0 then // Ofac Hit
		
		
			if SQLCA.SQLCode <> 0 then
				Messagebox('Fetch Error: '+ls_id_branch + '-'+String(ld_id_receiver),SQLCA.SQLErrText)
			end if		
			
		elseif ll_OfacCount > 0 then
				
			Messagebox('No found!!!: '+ls_id_branch + '-'+String(ld_id_receiver),SQLCA.SQLErrText)
			return

			
		end if
		
		Close spCalcOfacReceiver;
		
		FETCH cur_orders INTO :ls_id_branch,  :ld_id_receiver, :ld_id_sender,  :ls_rec_fname, :ls_rec_mname,  :ls_rec_lname,   :ls_rec_slname;
	LOOP;
	
	close cur_orders;
	
	
		
end event

type cb_selectfile from commandbutton within w_sql_generator_2005
integer x = 887
integer y = 548
integer width = 91
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "..."
end type

event clicked;string path, name
long value

value = GetFileOpenName("Select File", path, name, "SQL", &
	+ "SQL Files (*.sql),*.SQL," &
	+ "Text Files (*.txt),*.TXT")
	
if value = 1 then
	sle_filefrom.text = path
else
	sle_filefrom.text = ''
end if
end event

type sle_filefrom from singlelineedit within w_sql_generator_2005
integer x = 311
integer y = 548
integer width = 567
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type rb_copyfiles from radiobutton within w_sql_generator_2005
string tag = "Copia un archivo para todas las agencias como archivo AAA0000nnnnn.SQL. Elimina archivos AAA existentes."
integer x = 91
integer y = 556
integer width = 210
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "File :"
end type

event clicked;em_id_main_branch.enabled = not this.checked
em_date1.enabled = not this.checked
em_date2.enabled = not this.checked
cb_2.enabled = not this.checked
cb_3.enabled = not this.checked
sle_filefrom.enabled = this.checked
cb_selectfile.enabled = this.checked
end event

type em_country from editmask within w_sql_generator_2005
integer x = 571
integer y = 424
integer width = 306
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!"
end type

type cbx_country from checkbox within w_sql_generator_2005
integer x = 101
integer y = 432
integer width = 439
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter Country:"
end type

event clicked;em_country.enabled = this.checked
em_country.text = ''
end event

type rb_data_pay from radiobutton within w_sql_generator_2005
integer x = 96
integer y = 320
integer width = 453
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer:  Id Payer:"
end type

event clicked;em_id_main_branch.enabled = this.checked
em_date1.enabled = not this.checked
em_date2.enabled = not this.checked
cb_2.enabled = not this.checked
cb_3.enabled = not this.checked
sle_filefrom.enabled = not this.checked
cb_selectfile.enabled = not this.checked
end event

type rb_data_ran from radiobutton within w_sql_generator_2005
integer x = 96
integer y = 96
integer width = 261
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Range"
boolean checked = true
end type

event clicked;em_id_main_branch.enabled = not this.checked
em_date1.enabled = this.checked
em_date2.enabled = this.checked
cb_2.enabled = this.checked
cb_3.enabled = this.checked
sle_filefrom.enabled = not this.checked
cb_selectfile.enabled = not this.checked
end event

type em_id_main_branch from editmask within w_sql_generator_2005
integer x = 571
integer y = 316
integer width = 306
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!"
end type

type tabpub from tab within w_sql_generator_2005
event create ( )
event destroy ( )
integer x = 1138
integer y = 48
integer width = 1175
integer height = 616
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
nor nor
adv adv
end type

on tabpub.create
this.nor=create nor
this.adv=create adv
this.Control[]={this.nor,&
this.adv}
end on

on tabpub.destroy
destroy(this.nor)
destroy(this.adv)
end on

type nor from userobject within tabpub
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 1138
integer height = 500
long backcolor = 80269524
string text = "Publish to"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
rb_all rb_all
rb_one rb_one
gb_3 gb_3
sle_agencia sle_agencia
end type

on nor.create
this.rb_all=create rb_all
this.rb_one=create rb_one
this.gb_3=create gb_3
this.sle_agencia=create sle_agencia
this.Control[]={this.rb_all,&
this.rb_one,&
this.gb_3,&
this.sle_agencia}
end on

on nor.destroy
destroy(this.rb_all)
destroy(this.rb_one)
destroy(this.gb_3)
destroy(this.sle_agencia)
end on

type rb_all from radiobutton within nor
integer x = 201
integer y = 284
integer width = 535
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "All Open Agencies"
end type

type rb_one from radiobutton within nor
integer x = 201
integer y = 172
integer width = 407
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Single Agency: "
boolean checked = true
end type

type gb_3 from groupbox within nor
integer x = 55
integer y = 24
integer width = 1029
integer height = 428
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type sle_agencia from singlelineedit within nor
integer x = 681
integer y = 164
integer width = 297
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type adv from userobject within tabpub
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 1138
integer height = 500
long backcolor = 80269524
string text = "Publish to (Advanced)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
sle_sql sle_sql
cbx_qbe cbx_qbe
gb_6 gb_6
end type

on adv.create
this.sle_sql=create sle_sql
this.cbx_qbe=create cbx_qbe
this.gb_6=create gb_6
this.Control[]={this.sle_sql,&
this.cbx_qbe,&
this.gb_6}
end on

on adv.destroy
destroy(this.sle_sql)
destroy(this.cbx_qbe)
destroy(this.gb_6)
end on

type sle_sql from multilineedit within adv
integer x = 105
integer y = 140
integer width = 937
integer height = 272
integer taborder = 70
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type cbx_qbe from checkbox within adv
integer x = 105
integer y = 64
integer width = 859
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Publish to (Query by Example)"
end type

type gb_6 from groupbox within adv
integer x = 55
integer y = 24
integer width = 1029
integer height = 428
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_sql_generator_2005
integer x = 41
integer y = 28
integer width = 1029
integer height = 644
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Data to publish"
end type

type st_path from statictext within w_sql_generator_2005
integer x = 2720
integer y = 132
integer width = 937
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 24092159
boolean enabled = false
string text = "path"
boolean border = true
boolean focusrectangle = false
end type

type cb_1 from u_cb within w_sql_generator_2005
integer x = 1979
integer y = 736
integer width = 334
integer height = 84
integer taborder = 70
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "&Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type gb_4 from groupbox within w_sql_generator_2005
integer x = 41
integer y = 664
integer width = 1029
integer height = 224
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_generate from commandbutton within w_sql_generator_2005
integer x = 1632
integer y = 736
integer width = 334
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Generate"
boolean default = true
end type

event clicked;	datetime ld_date1, ld_date2
	string   ls_sql, ls_sqlbase, ls_sqloutput, ls_sqloutputd, ls_sqloutputi, ls_sqloutputu, ls_publishcondition, ls_sqloutputu2
	string   ls_branch, ls_sqlpublish, ls_branchpublish, ls_filename
	long     ll_cont, ll_line, ll_filenum, ll_fileerrors
	integer  li_writereturn
	string   ls_descpub, ls_branchpub, ls_payor
	String 	ls_agencyfolder


	SetPointer(HourGlass!)

	String ls_outputfolder
	SELECT ISNULL(DIR_OUTPUT,'S:\OUTPUT\')
	  INTO :ls_outputfolder
     FROM dba.PARAMETROS
	  USING SQLCArpt;	

	// ******************
	// Validate U: Drive!
	fn_map_output()
	if not fileexists('R:\Output') then
		Messagebox("Error!","Network drive not ready, please try again!",StopSign!)
		return
	end if
	// ******************


	sle_status.text = 'Creating master file'
	
	dw_dummydw.reset()

	// ==========================================================================
	// Validations
	
	if not tabpub.adv.cbx_qbe.checked and tabpub.nor.rb_one.checked then
		ls_branch = trim(tabpub.nor.sle_agencia.text)
		If Isnull(ls_branch) then
			Messagebox("Error","You must select the branch",StopSign!)
			SetFocus(tabpub.nor.sle_agencia)
			return
		end if
		
		SELECT Count(*)
		INTO :ll_cont
		FROM dba.branch
		WHERE dba.branch.id_branch = :ls_branch
		USING SQLCArpt;
		
		if ll_cont = 0 then
			messagebox("Error","Branch "+ls_branch+" was not found",StopSign!)
			SetFocus(tabpub.nor.sle_agencia)
			return
		end if
	end if
	
	// ===
	
	if rb_copyfiles.checked then

		if not fileexists(sle_filefrom.text) then
			Messagebox("Error","You must select the source file",StopSign!)
			SetFocus(sle_filefrom)
			return
		end if

	else
	
		if rb_data_pay.checked then
			ls_payor = trim(em_id_main_branch.text)
			If Isnull(ls_payor) or ls_payor = '' then
				Messagebox("Error","You must select the payer",StopSign!)
				SetFocus(em_id_main_branch)
				return
			end if
			
			SELECT Count(*)
			INTO :ll_cont
			FROM dba.group_branch
			WHERE id_main_branch = :ls_payor
			USING SQLCArpt;
			
			if ll_cont = 0 then
				messagebox("Error","Payer "+ls_payor+" was not found",StopSign!)
				SetFocus(em_id_main_branch)			
				return
			end if				
		end if
		
		if cbx_country.checked then
	
			SELECT Count(*)
			INTO :ll_cont
			FROM dba.country
			WHERE id_country = :em_country.text
			USING SQLCArpt;
			
			if ll_cont = 0 then
				messagebox("Error","Country '"+em_country.text+"' was not found",StopSign!)
				SetFocus(em_country)			
				return
			end if		
			
		end if
		
		// ==========================================================================
		
		ld_date1 = DateTime(Date(em_date1.text),Time('00:00:00'))
		ld_date2 = DateTime(Date(em_date2.text),Time('23:59:59'))		
		
		// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Data to be published!
		if rb_data_ran.checked then	
			ls_descpub = "DATA BETWEEN ["+String(ld_date1,'mm/dd/yyyy')+"-"+String(ld_date2,'mm/dd/yyyy')+"]"
			ls_publishcondition = &
			"  AND ( DBA.BRANCH.DATE_CRE_BRANCH >= '"+string(ld_date1,'yyyy-mm-dd hh:mm:ss')+"' )" + &
			"  AND ( DBA.BRANCH.DATE_CRE_BRANCH <= '"+string(ld_date2,'yyyy-mm-dd hh:mm:ss')+"' )"	
		else
			ls_descpub = "DATA FOR PAYER ["+trim(em_id_main_branch.text)+"]"
			ls_publishcondition = &
			"  AND ( DBA.BRANCH.ID_MAIN_BRANCH = '"+trim(em_id_main_branch.text)+"' )"
		end if
		
		if cbx_country.checked then
			ls_publishcondition = ls_publishcondition + &
			"  AND ( DBA.BRANCH.ID_COUNTRY = '"+trim(em_country.text)+"' )"		
		end if
	
		// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		
		dw_dummydw.reset()
		dw_dummydw.setitem(dw_dummydw.insertrow(0),"dummycol","SET option on_error = CONTINUE;")
		dw_dummydw.setitem(dw_dummydw.insertrow(0),"dummycol","//BEGIN SQLGEN "+String(Today(),"MMDDYYYYHHMM"))
		
	
		// ---------------------------------------------------------------------------
		// PAISES
		
		// SQLs Del Archivo Publicado
	
		// {Insert}
		ls_sqloutputi = "" + &
		" 'INSERT INTO country (id_country,name_country,flag_country) VALUES ('+ "+ &
		" '''' + isnull(rtrim(DBA.COUNTRY.ID_COUNTRY),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.COUNTRY.NAME_COUNTRY),'') + '''' + ',' + "+ &
		" '''' + 'A' + '''' + ');' "	 
	
		// {Update}
		ls_sqloutputu = "" + &	 
		" 'UPDATE country SET ' + "+ &
		" 'name_country = ' + '''' + isnull(rtrim(DBA.COUNTRY.NAME_COUNTRY),'') + '''' + ', ' + "+ &
		" 'flag_country = ' + '''' + 'A' + '''' + ' ' + "+ &
		" 'WHERE '+ "+ &
		" 'id_country = '+ '''' + rtrim(DBA.COUNTRY.ID_COUNTRY)+ '''' + ';' "
		
		// Query para obtener el archivo de salida
		ls_sqlbase = "" + &
		"FROM DBA.COUNTRY," + &
		"     DBA.BRANCH " + &
		"WHERE ( DBA.COUNTRY.ID_COUNTRY = DBA.BRANCH.ID_COUNTRY )" + &
		ls_publishcondition
				
		ls_sql = "SELECT DISTINCT " + ls_sqloutputi + ",'','','' "+ ls_sqlbase		
		fn_cursortodw(ls_sql,dw_dummydw)				
		ls_sql = "SELECT DISTINCT " + ls_sqloutputu + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
	
		// PAISES
		// ---------------------------------------------------------------------------
	
	
		// ---------------------------------------------------------------------------
		// ESTADOS
		
		// SQLs Del Archivo Publicado
	
		// {Insert}
		ls_sqloutputi = "" + &
		" 'INSERT INTO state (id_state,id_country,name_state,flag_state) VALUES ('+ "+ &
		" '''' + isnull(rtrim(DBA.STATE.ID_STATE),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.STATE.ID_COUNTRY),'') + '''' + ',' + "+ &	
		" '''' + isnull(rtrim(DBA.STATE.NAME_STATE),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.STATE.FLAG_STATE),'') + '''' + ');' "
	
		// {Update}
		ls_sqloutputu = "" + &	 
		" 'UPDATE state SET ' + "+ &
		" 'name_state = ' + '''' + isnull(rtrim(DBA.STATE.NAME_STATE),'') + '''' + ', ' + "+ &
		" 'flag_state = ' + '''' + isnull(rtrim(DBA.STATE.FLAG_STATE),'') + '''' + ' ' + "+ &
		" 'WHERE '+ "+ &
		" 'id_state = '+ '''' + rtrim(DBA.STATE.ID_STATE)+ '''' + ' ' +"+ &
		" 'AND id_country = '+ '''' + rtrim(DBA.STATE.ID_COUNTRY)+ '''' + ';' "
		
		// Query para obtener el archivo de salida
		ls_sqlbase = "" + &
		"FROM DBA.STATE," + &
		"     DBA.BRANCH, " + &
		"     DBA.CUBRIMIENTO_BRANCH " + &	  
		"WHERE ( DBA.STATE.ID_COUNTRY = DBA.CUBRIMIENTO_BRANCH.ID_COUNTRY )" + &
		"  AND ( DBA.STATE.ID_STATE = DBA.CUBRIMIENTO_BRANCH.ID_STATE )" + &	  
		"  AND ( DBA.BRANCH.ID_BRANCH = DBA.CUBRIMIENTO_BRANCH.ID_BRANCH )" + &	  	  
		ls_publishcondition
				
		ls_sql = "SELECT DISTINCT " + ls_sqloutputi + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
		ls_sql = "SELECT DISTINCT " + ls_sqloutputu + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)	
	
		// ESTADOS
		// ---------------------------------------------------------------------------			
	
	
		// ---------------------------------------------------------------------------
		// CIUDADES
		
		// SQLs Del Archivo Publicado
	
		// {Insert}
		ls_sqloutputi = "" + &
		" 'INSERT INTO city (id_city,id_state,id_country,name_city,flag_city) VALUES ('+ "+ &
		" '''' + isnull(rtrim(DBA.CITY.ID_CITY),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.CITY.ID_STATE),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.CITY.ID_COUNTRY),'') + '''' + ',' + "+ &	
		" '''' + isnull(rtrim(DBA.CITY.NAME_CITY),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.CITY.FLAG_CITY),'') + '''' + ');' "
	
		// {Update}
		ls_sqloutputu = "" + &	 
		" 'UPDATE city SET ' + "+ &
		" 'name_city = ' + '''' + isnull(rtrim(DBA.CITY.NAME_CITY),'') + '''' + ', ' + "+ &
		" 'flag_city = ' + '''' + isnull(rtrim(DBA.CITY.FLAG_CITY),'') + '''' + ' ' + "+ &
		" 'WHERE '+ "+ &
		" 'id_city = '+ '''' + rtrim(DBA.CITY.ID_CITY)+ '''' + ' ' +"+ &
		" 'AND id_state = '+ '''' + rtrim(DBA.CITY.ID_STATE)+ '''' + ' ' +"+ &
		" 'AND id_country = '+ '''' + rtrim(DBA.CITY.ID_COUNTRY)+ '''' + ';' "
		
		// Query para obtener el archivo de salida
		ls_sqlbase = "" + &
		"FROM DBA.CITY," + &
		"     DBA.BRANCH, " + &
		"     DBA.CUBRIMIENTO_BRANCH " + &	  	  
		"WHERE ( DBA.CITY.ID_COUNTRY = DBA.CUBRIMIENTO_BRANCH.ID_COUNTRY )" + &
		"  AND ( DBA.CITY.ID_STATE = DBA.CUBRIMIENTO_BRANCH.ID_STATE )" + &	  
		"  AND ( DBA.CITY.ID_CITY = DBA.CUBRIMIENTO_BRANCH.ID_CITY )" + &	  
		"  AND ( DBA.BRANCH.ID_BRANCH = DBA.CUBRIMIENTO_BRANCH.ID_BRANCH )" + &	 
		ls_publishcondition
				
		ls_sql = "SELECT DISTINCT " + ls_sqloutputi + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
		ls_sql = "SELECT DISTINCT " + ls_sqloutputu + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
	
		// CIUDADES
		// ---------------------------------------------------------------------------			
	
	
		// ---------------------------------------------------------------------------
		// GRUPOS
		
		// SQLs Del Archivo Publicado
	
		// {Insert}
		ls_sqloutputi = "" + &
		" 'INSERT INTO group_branch (id_main_branch,name_main_branch,gro_companyidfolio) VALUES ('+ "+ &
		" '''' + isnull(rtrim(DBA.GROUP_BRANCH.ID_MAIN_BRANCH),'') + '''' + ',' + "+ &
		" '''' + replace(isnull(rtrim(DBA.GROUP_BRANCH.NAME_MAIN_BRANCH),''),'''','') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.GROUP_BRANCH.GRO_COMPANYIDFOLIO),'') + '''' + ');' "
	

	 
		// {Update}
		ls_sqloutputu = "" + &	 
		" 'UPDATE group_branch SET ' + "+ &
		" 'name_main_branch = ' + '''' + replace(isnull(rtrim(DBA.GROUP_BRANCH.NAME_MAIN_BRANCH),''),'''','') + '''' + ', ' + "+ &
		" 'gro_companyidfolio = ' + '''' + isnull(rtrim(DBA.GROUP_BRANCH.GRO_COMPANYIDFOLIO),'') + '''' + ' ' + "+ &
		" 'WHERE '+ "+ &
		" 'id_main_branch = '+ '''' + rtrim(DBA.GROUP_BRANCH.ID_MAIN_BRANCH)+ '''' + ';' "
		
		// Query para obtener el archivo de salida
		ls_sqlbase = "" + &
		"FROM DBA.GROUP_BRANCH," + &
		"     DBA.BRANCH " + &
		"WHERE ( DBA.BRANCH.ID_MAIN_BRANCH = DBA.GROUP_BRANCH.ID_MAIN_BRANCH )" + &
		ls_publishcondition
				
		ls_sql = "SELECT DISTINCT " + ls_sqloutputi + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
		ls_sql = "SELECT DISTINCT " + ls_sqloutputu + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
	
		// GRUPOS
		// ---------------------------------------------------------------------------
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// ORIGINAL! REEMPLAZADO PORQUE LAS CADENAS SE CORTAN EN 256! 
	//
	//	// ---------------------------------------------------------------------------
	//	// AGENCIAS
	//	
	//	// SQLs Del Archivo Publicado
	//
	//	// {Insert}
	//	ls_sqloutputi = "" + &
	//	" 'INSERT INTO branch (id_branch,id_company,,address_branch,id_city,id_state,"+ &
	//	                      "id_country,id_main_branch,id_flag_branch,id_type_branch,phone1_branch,"+ &
	//								 "phone2_branch,fax_branch,zip_branch,currency_pay_branch) VALUES ('+ "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.id_branch),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.id_company),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.address_branch),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.id_city),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.id_state),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.id_country),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.id_main_branch),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.id_flag_branch),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.id_type_branch),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.phone1_branch),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.phone2_branch),'') + '''' + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.fax_branch),'') + '''' + ',' + "+ &
	//	"      + isnull(convert(varchar,DBA.BRANCH.zip_branch),'0') + ',' + "+ &
	//	" '''' + isnull(rtrim(DBA.BRANCH.currency_pay_branch),'') + '''' + ');' "
	//
	// 	// {Update}
	//	ls_sqloutputu = "" + &	 
	//	" 'UPDATE branch SET ' + "+ &
	//   " ' = ' + '''' + isnull(rtrim(DBA.BRANCH.),'') + '''' + ', ' + "+ &
	//   " 'address_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.address_branch),'') + '''' + ', ' + "+ &
	//   " 'id_city = ' + '''' + isnull(rtrim(DBA.BRANCH.id_city),'') + '''' + ', ' + "+ &
	//	" 'id_state = ' + '''' + isnull(rtrim(DBA.BRANCH.id_state),'') + '''' + ', ' + "+ &
	//	" 'id_country = ' + '''' + isnull(rtrim(DBA.BRANCH.id_country),'') + '''' + ', ' + "+ &
	//	" 'id_main_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.id_main_branch),'') + '''' + ', ' + "+ &
	//	" 'id_flag_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.id_flag_branch),'') + '''' + ', ' + "+ &
	//	" 'id_type_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.id_type_branch),'') + '''' + ', ' + "+ &
	//	" 'phone1_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.phone1_branch),'') + '''' + ', ' + "+ &
	//	" 'phone2_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.phone2_branch),'') + '''' + ', ' + "+ &
	//	" 'fax_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.fax_branch),'') + '''' + ', ' + "+ &
	//	" 'zip_branch = ' + isnull(convert(varchar,DBA.BRANCH.zip_branch),'0') + ', ' + "+ &
	//	" 'currency_pay_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.currency_pay_branch),'') + '''' + ' ' + "+ &
	//	" 'WHERE '+ "+ &
	//	" 'id_branch = '+ '''' + rtrim(DBA.BRANCH.ID_BRANCH)+ '''' + ';' "
	//	
	//	// Query para obtener el archivo de salida
	//	ls_sqlbase = "" + &
	//  	"FROM DBA.GROUP_BRANCH," + &
	//  	"     DBA.BRANCH " + &
	//  	"WHERE ( DBA.BRANCH.DATE_CRE_BRANCH >= '"+string(ld_date1,'yyyy-mm-dd hh:mm:ss')+"' )" + &
	//   "  AND ( DBA.BRANCH.DATE_CRE_BRANCH <= '"+string(ld_date2,'yyyy-mm-dd hh:mm:ss')+"' )"
	//			
	//	ls_sql = "SELECT DISTINCT " + ls_sqloutputi + ls_sqlbase
	//	fn_cursortolistbox(ls_sql,lb_sql)
	//	ls_sql = "SELECT DISTINCT " + ls_sqloutputu + ls_sqlbase
	//	fn_cursortolistbox(ls_sql,lb_sql)	
	//	// AGENCIAS
	//	// ---------------------------------------------------------------------------
	
	
		// ---------------------------------------------------------------------------
		// AGENCIAS
		
		// SQLs Del Archivo Publicado
	
		// {Insert}
		ls_sqloutputi = "" + &
		" 'INSERT INTO branch (id_branch,id_company,name_branch,address_branch,id_city,id_state,"+ &
									 "id_country,id_main_branch,id_flag_branch,id_type_branch,phone1_branch,"+ &
									 "phone2_branch,fax_branch,zip_branch,currency_pay_branch) VALUES ('+ "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.id_branch),'') + '''' + ',' , "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.id_company),'') + '''' + ',' + "+ &
		" '''' + replace(isnull(rtrim(DBA.BRANCH.name_branch),''),'''','') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.address_branch),'') + '''' + ',' , "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.id_city),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.id_state),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.id_country),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.id_main_branch),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.id_flag_branch),'') + '''' + ',' , "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.id_type_branch),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.phone1_branch),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.phone2_branch),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.fax_branch),'') + '''' + ',' + "+ &
		"      + isnull(convert(varchar,DBA.BRANCH.zip_branch),'0') + ',' + "+ &
		" '''' + isnull(rtrim(DBA.BRANCH.currency_pay_branch),'') + '''' + ');' "
	
		// {Update}
		ls_sqloutputu = "" + &	 
		" 'UPDATE branch SET ' + "+ &
		" 'name_branch = ' + '''' + replace(isnull(rtrim(DBA.BRANCH.name_branch),''),'''','') + '''' + ', ' + "+ &
		" 'address_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.address_branch),'') + '''' + ', ' + "+ &
		" 'id_city = ' + '''' + isnull(rtrim(DBA.BRANCH.id_city),'') + '''' + ', ' + "+ &
		" 'id_state = ' + '''' + isnull(rtrim(DBA.BRANCH.id_state),'') + '''' + ', ' , "+ &
		" ' id_country = ' + '''' + isnull(rtrim(DBA.BRANCH.id_country),'') + '''' + ', ' + "+ &
		" 'id_main_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.id_main_branch),'') + '''' + ', ' + "+ &
		" 'id_flag_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.id_flag_branch),'') + '''' + ', ' + "+ &
		" 'id_type_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.id_type_branch),'') + '''' + ', ' , "+ &
		" ' phone1_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.phone1_branch),'') + '''' + ', ' + "+ &
		" 'phone2_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.phone2_branch),'') + '''' + ', ' + "+ &
		" 'fax_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.fax_branch),'') + '''' + ', ' + "+ &
		" 'zip_branch = ' + isnull(convert(varchar,DBA.BRANCH.zip_branch),'0') + ', ' + "+ &
		" 'currency_pay_branch = ' + '''' + isnull(rtrim(DBA.BRANCH.currency_pay_branch),'') + '''' + ' ' , "+ &
		" ' WHERE '+ "+ &
		" 'id_branch = '+ '''' + rtrim(DBA.BRANCH.ID_BRANCH)+ '''' + ';' "
		
		// {Update2}
		ls_sqloutputu2 = "" + &	 
		" 'UPDATE branch SET ' + "+ &
		" 'business_hours = ' + '''' + isnull(rtrim(DBA.BRANCH.business_hours),'') + '''' + ' ' , "+ &
		" ' WHERE '+ "+ &
		" 'id_branch = '+ '''' + rtrim(DBA.BRANCH.ID_BRANCH)+ '''' + ';','','' "	
		
		// Query para obtener el archivo de salida
		ls_sqlbase = "" + &
		"FROM DBA.BRANCH " + &
		"WHERE 1=1 " + &
		ls_publishcondition
							 
		ls_sql = "SELECT DISTINCT " + ls_sqloutputi + ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
	
		ls_sql = "SELECT DISTINCT " + ls_sqloutputu + ls_sqlbase	
		fn_cursortodw(ls_sql,dw_dummydw)
	
		ls_sql = "SELECT DISTINCT " + ls_sqloutputu2 + ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)		
		// AGENCIAS
		// ---------------------------------------------------------------------------
	
	
		// ---------------------------------------------------------------------------
		// AGENCIAS (PAYER CAPTIONS NO SE PUEDEN IR EN BLANCO)
		
		// SQLs Del Archivo Publicado
	
		// {Update}
		ls_sqloutputu = "" + &	 
		" 'UPDATE branch SET ' + "+ &
		" 'payer_caption = ' + '''' + isnull(rtrim(DBA.BRANCH.payer_caption),'-NONE-') + '''' + ' ' , "+ &
		" ' WHERE '+ "+ &
		" 'id_branch = '+ '''' + rtrim(DBA.BRANCH.ID_BRANCH)+ '''' + ';','','' "	
		
		// Query para obtener el archivo de salida
		ls_sqlbase = "" + &
		"FROM DBA.BRANCH " + &
		"WHERE payer_caption is not null AND RTRIM(payer_caption) <> '' " + &
		ls_publishcondition
							 
		ls_sql = "SELECT DISTINCT " + ls_sqloutputu + ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)	
		// AGENCIAS
		// ---------------------------------------------------------------------------
	
	
		// ---------------------------------------------------------------------------
		// MODO PAGO
	
		// SQLs Del Archivo Publicado
		
		// {Delete}
		ls_sqloutputd = "" + &
		" 'DELETE FROM modo_pago_branch '+ " + &
		" 'WHERE '+ " + &
		" 'id_branch = '+ '''' + rtrim(DBA.BRANCH.ID_BRANCH)+ '''' + ';','','','' " + &
		"FROM DBA.BRANCH " + &
		"WHERE 1=1 " + &  
		ls_publishcondition	
	
		// {Insert}
		ls_sqloutputi = "" + &
		" 'INSERT INTO modo_pago_branch (id_branch,modo_pago) VALUES ('+ "+ &
		" '''' + isnull(rtrim(DBA.MODO_PAGO_BRANCH.ID_BRANCH),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.MODO_PAGO_BRANCH.MODO_PAGO),'') + '''' + ');' "
	
		// Query para obtener el archivo de salida
		ls_sqlbase = "" + &
		"FROM DBA.MODO_PAGO_BRANCH," + &
		"     DBA.BRANCH " + &
		"WHERE ( DBA.BRANCH.ID_BRANCH = DBA.MODO_PAGO_BRANCH.ID_BRANCH )" + &
		ls_publishcondition	
			
		// Si esta publicando por pagador tira un solo delete
		if rb_data_pay.checked then
			dw_dummydw.setitem(dw_dummydw.insertrow(0),"dummycol","DELETE FROM modo_pago_branch FROM DBA.MODO_PAGO_BRANCH WHERE ID_BRANCH IN (SELECT ID_BRANCH FROM DBA.BRANCH WHERE ID_MAIN_BRANCH = '"+em_id_main_branch.text+"');")
		else	
			ls_sql = "SELECT DISTINCT " + ls_sqloutputd
			fn_cursortodw(ls_sql,dw_dummydw)
		end if
	
		ls_sql = "SELECT DISTINCT " + ls_sqloutputi + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
	
		// MODO PAGO
		// ---------------------------------------------------------------------------
	
	
		// ---------------------------------------------------------------------------
		// CUBRIMIENTOS
		
		// SQLs Del Archivo Publicado
	
		// {Delete}
		ls_sqloutputd = "" + &
		" 'DELETE FROM cubrimiento_branch '+ " + &
		" 'WHERE '+ " + &
		" 'id_branch = '+ '''' + rtrim(DBA.BRANCH.ID_BRANCH)+ '''' + ';','','','' " + &
		"FROM DBA.BRANCH " + &
		"WHERE 1=1 " + & 
		ls_publishcondition
	
		// {Insert}
		ls_sqloutputi = "" + &
		" 'INSERT INTO cubrimiento_branch (id_branch,id_city,id_state,id_country,comentario_cubrimiento,id_zona) VALUES ('+ "+ &
		" '''' + isnull(rtrim(DBA.CUBRIMIENTO_BRANCH.ID_BRANCH),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.CUBRIMIENTO_BRANCH.ID_CITY),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.CUBRIMIENTO_BRANCH.ID_STATE),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.CUBRIMIENTO_BRANCH.ID_COUNTRY),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.CUBRIMIENTO_BRANCH.COMENTARIO_CUBRIMIENTO),'') + '''' + ',' + "+ &
		" '''' + isnull(rtrim(DBA.CUBRIMIENTO_BRANCH.ID_ZONA),'') + '''' + ');' "
	
		// Query para obtener el archivo de salida
		ls_sqlbase = "" + &
		"FROM DBA.CUBRIMIENTO_BRANCH," + &
		"     DBA.BRANCH " + &
		"WHERE ( DBA.BRANCH.ID_BRANCH = DBA.CUBRIMIENTO_BRANCH.ID_BRANCH )" + &
		ls_publishcondition
	
		// Si esta publicando por pagador tira un solo delete
		if rb_data_pay.checked then
			dw_dummydw.setitem(dw_dummydw.insertrow(0),"dummycol","DELETE FROM DBA.CUBRIMIENTO_BRANCH WHERE ID_BRANCH IN (SELECT ID_BRANCH FROM DBA.BRANCH WHERE ID_MAIN_BRANCH = '"+em_id_main_branch.text+"');")
		else	
			ls_sql = "SELECT DISTINCT " + ls_sqloutputd
			fn_cursortodw(ls_sql,dw_dummydw)
		end if
		
		ls_sql = "SELECT DISTINCT " + ls_sqloutputi + ",'','','' "+ ls_sqlbase
		fn_cursortodw(ls_sql,dw_dummydw)
	
		// CUBRIMIENTOS
		// ---------------------------------------------------------------------------
	
		sle_status.text = 'Adding aditional file'
	
		// ---------------------------------------------------------------------------
		// ARCHIVO APPEND AL FINAL
		if fileexists(sle_appendfile.text) then
			long ll_appfile, ll_fileread
			string ls_fileline
			ll_appfile = FileOpen(sle_appendfile.text,LineMode!, Read!, LockReadWrite!)
			ll_fileread = FileRead(ll_appfile, ls_fileline)
			DO WHILE ll_fileread > 0
				dw_dummydw.setitem(dw_dummydw.insertrow(0),"dummycol",ls_fileline)
				ll_fileread = FileRead(ll_appfile, ls_fileline)
			LOOP
			FileClose(ll_appfile)
		end if
		// ---------------------------------------------------------------------------
	
		dw_dummydw.setitem(dw_dummydw.insertrow(0),"dummycol","COMMIT;")
		dw_dummydw.setitem(dw_dummydw.insertrow(0),"dummycol","//END SQLGEN ")	

	end if

	sle_status.text = 'Getting branch list'

	// ---------------------------------------------------------------------------
	// Publicando el archivo para las agencias seleccionadas
	if tabpub.adv.cbx_qbe.checked then
		ls_sqlpublish = tabpub.adv.sle_sql.text
		ls_branchpub = '-ESPECIAL-'
	elseif tabpub.nor.rb_one.checked then
		ls_sqlpublish = "SELECT ID_BRANCH FROM DBA.BRANCH WHERE ID_BRANCH = '"+ls_branch+"'"
		ls_branchpub = ls_branch
	elseif tabpub.nor.rb_all.checked then
		ls_sqlpublish = "SELECT id_branch FROM DBA.VW_AGENCIESPC ORDER BY ID_BRANCH"
		ls_branchpub = '-ACTIVE-'
	end if	
	
	DECLARE cur_data DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :ls_sqlpublish USING SQLCArpt;
	OPEN DYNAMIC cur_data ;
	
	if SQLCArpt.SQLCODE <> 0 then
		Messagebox("Error SQL Dinamico",SQLCArpt.SQLErrText+"~n~n"+ls_sql,StopSign!)
		return
	end if
	
	FETCH cur_data INTO :ls_branchpublish;
	DO WHILE SQLCArpt.SQLCODE = 0		
		ls_branchpublish = trim(ls_branchpublish)
				
		ls_agencyfolder = ''
		if fileexists(ls_outputfolder+trim(ls_branchpublish)) then ls_agencyfolder = trim(ls_branchpublish) + '\'							
				
		if rb_copyfiles.checked then								
			fn_filecopy(sle_filefrom.text,ls_outputfolder+ls_agencyfolder+"AAA"+FILL('0',10 - LEN(ls_branchpublish))+ls_branchpublish+".sql")			
			dw_dummydw.setitem(dw_dummydw.insertrow(0),"dummycol","// Copied to: "+ls_agencyfolder+"AAA"+FILL('0',10 - LEN(ls_branchpublish))+ls_branchpublish+".sql")			
		else		
			
			
			// Si el folder temporal existe, crea el archivo local y al final hace un merge!
			if FileExists("D:\Temp\VCPublications") then
				ls_filename = "D:\Temp\VCPublications\"+"111_UPG"+FILL('0',10 - LEN(ls_branchpublish))+ls_branchpublish+".sql"
				ll_filenum = FileOpen(ls_filename, LineMode!, Write!, LockReadWrite!, Replace!)	
			else
				ls_filename = ls_outputfolder+ls_agencyfolder+"UPG"+FILL('0',10 - LEN(ls_branchpublish))+ls_branchpublish+".sql"					
				ll_filenum = FileOpen(ls_filename, LineMode!, Write!, LockReadWrite!, Append!)	
			end if							
			ll_fileerrors = FileOpen(ls_outputfolder+"ERRORS\UPG"+FILL('0',10 - LEN(ls_branchpublish))+ls_branchpublish+'.err', LineMode!, Write!, LockReadWrite!, Append!)
			
			String ls_rowvalue			
		
			for ll_line = 1 to dw_dummydw.RowCount()
				sle_status.text = 'Generating file '+ls_filename

				dw_dummydw.SelectRow(0,false)
				dw_dummydw.SelectRow(ll_line,true)
				dw_dummydw.scrolltoRow(ll_line)
				ls_rowvalue = dw_dummydw.getitemstring(ll_line,"dummycol")
				
				// Valida que haya un ; al final!
				if left(ls_rowvalue,2) = '//' or right(ls_rowvalue,1) = ';' then
					li_writereturn = FileWrite(ll_filenum,ls_rowvalue)
				else
					li_writereturn = FileWrite(ll_fileerrors,ls_rowvalue)
				end if			
				
				if li_writereturn = -1 then
					// Fallo la escritura
					lb_errores.additem(ls_rowvalue)
					CONTINUE // Continua el ciclo (salta lo que falta del archivo actual)
				end if			
					
			next								
			FileClose(ll_filenum)
			FileClose(ll_fileerrors)
				
				
			// Si el folder temporal existe, crea el archivo local y al final hace un merge!
			if FileExists("D:\Temp\VCPublications") then
				
				String ls_targetfile, ls_localfile
								
				ls_targetfile = ls_outputfolder+ls_agencyfolder+"UPG"+FILL('0',10 - LEN(ls_branchpublish))+ls_branchpublish+".sql"
				
				// Si el archivo ya exite en la unidad de RED
				if fileexists(ls_targetfile) then
															
					ls_localfile = "D:\Temp\VCPublications\" +"000_UPG"+FILL('0',10 - LEN(ls_branchpublish))+ls_branchpublish+".sql"										
					FileDelete(ls_localfile)
					
					// Lo mueve local
					FileMove(ls_targetfile, ls_localfile)
					// hace el merge
					fn_mergefiles(ls_localfile,ls_filename,ls_targetfile)
						
						
				else
					FileMove(ls_filename,ls_targetfile)
				end if

			end if	
														
		end if
		
		
		FETCH cur_data INTO :ls_branchpublish;
	LOOP
	CLOSE cur_data ;
	// ---------------------------------------------------------------------------

	ls_descpub = ls_descpub+"; PUBLISHED TO ["+ls_sqlpublish+"]"

	INSERT INTO DBA.AUDIT_PUBLICATIONS(DATE_AUDIT,ID_BRANCH,DESC_PUBLICATION,DB_USER_NAME,DB_HOST_NAME)
	VALUES(getdate(),:ls_branchpub,:ls_descpub,SYSTEM_USER,host_name());

	sle_status.text = 'Process Completed'

	SetPointer(Arrow!)
end event

type em_date1 from u_em within w_sql_generator_2005
integer x = 571
integer y = 92
integer width = 306
integer height = 84
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type cb_2 from commandbutton within w_sql_generator_2005
integer x = 887
integer y = 92
integer width = 91
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;em_date1.Event pfc_DDCalendar()
end event

type em_date2 from u_em within w_sql_generator_2005
integer x = 571
integer y = 188
integer width = 306
integer height = 84
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
double increment = 0
string minmax = ""
end type

event constructor;this.of_SetDropDownCalendar(TRUE)
end event

type cb_3 from commandbutton within w_sql_generator_2005
integer x = 887
integer y = 188
integer width = 91
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;em_date2.Event pfc_DDCalendar()
end event

type st_1 from statictext within w_sql_generator_2005
integer x = 416
integer y = 96
integer width = 133
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
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_sql_generator_2005
integer x = 457
integer y = 192
integer width = 91
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
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_sql_generator_2005
integer x = 87
integer y = 720
integer width = 654
integer height = 60
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
string text = "Append file at end"
boolean focusrectangle = false
end type

type sle_appendfile from singlelineedit within w_sql_generator_2005
integer x = 82
integer y = 784
integer width = 827
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_appendfile from commandbutton within w_sql_generator_2005
integer x = 919
integer y = 784
integer width = 105
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;string path, name
long value

value = GetFileOpenName("Select File", path, name, "SQL", &
	+ "SQL Files (*.sql),*.SQL," &
	+ "Text Files (*.txt),*.TXT")
	
if value = 1 then
	sle_appendfile.text = path
else
	sle_appendfile.text = ''
end if
end event

type sle_status from singlelineedit within w_sql_generator_2005
integer x = 41
integer y = 900
integer width = 2272
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_sql_generator_2005
boolean visible = false
integer x = 41
integer y = 1700
integer width = 187
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Files"
boolean focusrectangle = false
end type

type st_4 from statictext within w_sql_generator_2005
boolean visible = false
integer x = 41
integer y = 1800
integer width = 187
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Error"
boolean focusrectangle = false
end type

type st_6 from statictext within w_sql_generator_2005
boolean visible = false
integer x = 41
integer y = 1748
integer width = 187
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "with"
boolean focusrectangle = false
end type

type lb_errores from listbox within w_sql_generator_2005
boolean visible = false
integer x = 238
integer y = 1700
integer width = 2075
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

