$PBExportHeader$w_load_bank_statements.srw
forward
global type w_load_bank_statements from window
end type
type st_3 from statictext within w_load_bank_statements
end type
type ddlb_bancos from my_ddlb within w_load_bank_statements
end type
type st_2 from statictext within w_load_bank_statements
end type
type dw_bank_statement from datawindow within w_load_bank_statements
end type
type st_1 from statictext within w_load_bank_statements
end type
type ddlb_cuentas from my_ddlb within w_load_bank_statements
end type
type dw_archivo_plano from datawindow within w_load_bank_statements
end type
type pb_import from picturebutton within w_load_bank_statements
end type
type gb_1 from groupbox within w_load_bank_statements
end type
type gb_2 from groupbox within w_load_bank_statements
end type
end forward

global type w_load_bank_statements from window
integer width = 4658
integer height = 2536
boolean titlebar = true
string title = "Carga de archivo plano del banco"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
ddlb_bancos ddlb_bancos
st_2 st_2
dw_bank_statement dw_bank_statement
st_1 st_1
ddlb_cuentas ddlb_cuentas
dw_archivo_plano dw_archivo_plano
pb_import pb_import
gb_1 gb_1
gb_2 gb_2
end type
global w_load_bank_statements w_load_bank_statements

on w_load_bank_statements.create
this.st_3=create st_3
this.ddlb_bancos=create ddlb_bancos
this.st_2=create st_2
this.dw_bank_statement=create dw_bank_statement
this.st_1=create st_1
this.ddlb_cuentas=create ddlb_cuentas
this.dw_archivo_plano=create dw_archivo_plano
this.pb_import=create pb_import
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.ddlb_bancos,&
this.st_2,&
this.dw_bank_statement,&
this.st_1,&
this.ddlb_cuentas,&
this.dw_archivo_plano,&
this.pb_import,&
this.gb_1,&
this.gb_2}
end on

on w_load_bank_statements.destroy
destroy(this.st_3)
destroy(this.ddlb_bancos)
destroy(this.st_2)
destroy(this.dw_bank_statement)
destroy(this.st_1)
destroy(this.ddlb_cuentas)
destroy(this.dw_archivo_plano)
destroy(this.pb_import)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;X=1
Y=1
end event

type st_3 from statictext within w_load_bank_statements
integer x = 87
integer y = 72
integer width = 165
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
string text = "Bank:"
boolean focusrectangle = false
end type

type ddlb_bancos from my_ddlb within w_load_bank_statements
integer x = 265
integer y = 64
integer width = 1463
integer height = 1024
integer taborder = 10
boolean bringtotop = true
end type

event constructor;call super::constructor;this.addquery(  "SELECT name_BANCO, "+&
   "      id_BANCO "+&
   " FROM dba.banco   "+&
	" ORDER BY 1;")
end event

event selectionchanged;call super::selectionchanged;String ls_id_banco

ls_id_banco = ddlb_bancos.getdataid()

ddlb_cuentas.addquery(  "SELECT RTRIM(name_cuenta_BANCO) + ' - '+ID_CUENTA_BANCO, "+&
   "      id_cuenta_BANCO "+&
   " FROM dba.cuenta_banco   "+&
	" where id_banco= '"+ls_id_banco +"'"+&
	" ORDER BY 1;")


end event

type st_2 from statictext within w_load_bank_statements
integer x = 87
integer y = 72
integer width = 165
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
string text = "Banco:"
boolean focusrectangle = false
end type

type dw_bank_statement from datawindow within w_load_bank_statements
integer x = 14
integer y = 200
integer width = 4590
integer height = 2212
string title = "none"
string dataobject = "dgd_plano_banco_definitivo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_load_bank_statements
integer x = 1829
integer y = 76
integer width = 215
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
string text = "Cuenta:"
boolean focusrectangle = false
end type

type ddlb_cuentas from my_ddlb within w_load_bank_statements
integer x = 2039
integer y = 64
integer width = 1463
integer height = 1024
integer taborder = 20
boolean bringtotop = true
end type

type dw_archivo_plano from datawindow within w_load_bank_statements
boolean visible = false
integer x = 4018
integer width = 603
integer height = 212
string title = "none"
string dataobject = "dex_plano_banco"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_import from picturebutton within w_load_bank_statements
integer x = 3547
integer y = 48
integer width = 137
integer height = 120
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "C:\ViamericasMT\Imagenes\btnImportar.gif"
alignment htextalign = left!
end type

event clicked;String 	ls_filename, ls_message, ls_id_banco, ls_id_cuenta_banco
Long		ll_import
STRING ls_fecha_transaccion
DATE ldt_date_transaction

// se declaran los objetos específicos de cada banco para el cargue de la información
n_cst_carga_plano_banco_bbt 	ln_cst_carga_plano_banco_bbt
n_cst_carga_plano_banco_chevy ln_cst_carga_plano_banco_chevy
n_cst_carga_plano_banco_bancorp_south ln_cst_carga_plano_banco_bancorp_south
n_cst_carga_plano_banco_bofa ln_cst_carga_plano_banco_bank_of_america

dw_archivo_plano.Reset()

//Valida que se haya seleccionado el banco primero
ls_id_banco			= ddlb_bancos.getDataId()
ls_id_cuenta_banco= ddlb_cuentas.getDataId()
If IsNull(ls_id_banco) OR ls_id_banco='' THEN 
	MessageBox("Error","Por favor, seleccione un banco antes de importar.", StopSign!)
	Return
END IF 

If IsNull(ls_id_cuenta_banco) OR ls_id_cuenta_banco='' THEN 
	MessageBox("Error","Por favor, seleccione una cuenta antes de importar.", StopSign!)
	Return
END IF 

// se asigna el datawindows de acuerdo al banco
CHOOSE CASE ls_id_banco
	CASE 'BB&T'
		dw_archivo_plano.DataObject='dex_plano_banco'
	CASE 'CHEVY'
		dw_archivo_plano.DataObject='dex_plano_banco_chevy'
	CASE 'BANCORP'
		dw_archivo_plano.DataObject='dex_plano_banco_bancorp_south'
	CASE 'B OF A'
		dw_archivo_plano.DataObject='dex_plano_banco_bofa'
	CASE ELSE
		dw_archivo_plano.DataObject='dex_plano_banco'
END CHOOSE

// se importa la información en formato CSV
ll_import= dw_archivo_plano.ImportFile( CSV!, ls_filename )

// se valida el resultado del Import
Choose CASE ll_import
	CASE -1  
		ls_message= "No rows or startrow value supplied is greater than the number of rows in the file"
	CASE -2
		ls_message= "Empty file"
	CASE -3  
		ls_message= "Invalid argument"
	CASE -4
		ls_message= "Invalid input"
	CASE -5
		ls_message= "Could not open the file"
	CASE -6  
		ls_message= "Could not close the file"
	CASE -7
		ls_message= "Error reading the text"
	CASE -8
		ls_message= "Unsupported file name suffix (must be *.txt, *.csv, *.dbf or *.xml)"
	CASE -10
		ls_message= "Unsupported dBase file format (not version 2 or 3)"
	CASE -11
		ls_message= "XML Parsing Error; XML parser libraries not found or XML not well formed"
	CASE -12
		ls_message= "XML Template does not exist or does not match the DataWindow"
	CASE -13
		ls_message= "Unsupported DataWindow style for import"
	CASE -14
		ls_message= "Error resolving DataWindow nesting"
	CASE 0
		RETURN
END CHOOSE


IF ll_import<0 then
	MessageBox("Error", ls_message, StopSign!)
	Return
end if 

CHOOSE CASE ls_id_banco
	CASE 'BB&T'
		ln_cst_carga_plano_banco_bbt= CREATE n_cst_carga_plano_banco_bbt

		IF ln_cst_carga_plano_banco_bbt.of_cargar_plano_base_datos(dw_archivo_plano, ls_id_banco, ls_id_cuenta_banco)= 1 THEN
			// se consulta la fecha de la segunda fila, ya que la primera es utilizada para encabezados del
			// archivo csv
			ls_fecha_transaccion = dw_archivo_plano.GetItemString(2, "DATE_TRANSACTION" )
			ldt_date_transaction = ln_cst_carga_plano_banco_bbt.of_set_date_transaction (ls_fecha_transaccion)
			
			dw_bank_statement.SetTransObject(SQLCA)
			dw_bank_statement.Retrieve(ls_id_banco, ls_id_cuenta_banco, ldt_date_transaction)
			
			MessageBox("Information", "Los datos han sido importados.",Exclamation!)
		ELSE
			dw_archivo_plano.Reset()
		END IF
		
		Destroy ln_cst_carga_plano_banco_bbt;
		
	CASE 'CHEVY'
		ln_cst_carga_plano_banco_chevy= CREATE n_cst_carga_plano_banco_chevy

		IF ln_cst_carga_plano_banco_chevy.of_cargar_plano_base_datos(dw_archivo_plano, ls_id_banco, ls_id_cuenta_banco)= 1 THEN
			// se consulta la fecha de la primera fila
			ls_fecha_transaccion = dw_archivo_plano.GetItemString(1, "DATE_TRANSACTION" )
			ldt_date_transaction = ln_cst_carga_plano_banco_chevy.of_set_date_transaction (ls_fecha_transaccion)
			
			dw_bank_statement.SetTransObject(SQLCA)
			dw_bank_statement.Retrieve(ls_id_banco, ls_id_cuenta_banco, ldt_date_transaction)
			
			MessageBox("Information", "Los datos han sido importados.",Exclamation!)
		ELSE
			dw_archivo_plano.Reset()
		END IF
		
		Destroy ln_cst_carga_plano_banco_chevy;
	
	CASE "BANCORP"
		ln_cst_carga_plano_banco_bancorp_south= CREATE n_cst_carga_plano_banco_bancorp_south

		IF ln_cst_carga_plano_banco_bancorp_south.of_cargar_plano_base_datos(dw_archivo_plano, ls_id_banco, ls_id_cuenta_banco)= 1 THEN
			// se consulta la última fila importada ya que las primeras hacen referencia al contenido del archivo
			ls_fecha_transaccion = dw_archivo_plano.GetItemString(dw_archivo_plano.RowCount(), "DATE_TRANSACTION" )
			ldt_date_transaction = ln_cst_carga_plano_banco_bancorp_south.of_set_date_transaction (ls_fecha_transaccion)
			
			dw_bank_statement.SetTransObject(SQLCA)
			dw_bank_statement.Retrieve(ls_id_banco, ls_id_cuenta_banco, ldt_date_transaction)
			
			MessageBox("Information", "Los datos han sido importados.",Exclamation!)
		ELSE
			dw_archivo_plano.Reset()
		END IF
		
		Destroy ln_cst_carga_plano_banco_bancorp_south;
		
	CASE 'B OF A'
		ln_cst_carga_plano_banco_bank_of_america= CREATE n_cst_carga_plano_banco_bofa

		IF ln_cst_carga_plano_banco_bank_of_america.of_cargar_plano_base_datos(dw_archivo_plano, ls_id_banco, ls_id_cuenta_banco)= 1 THEN
			// se consulta la fecha de la segunda fila, ya que la primera es utilizada para encabezados del
			// archivo csv
			ls_fecha_transaccion = dw_archivo_plano.GetItemString(2, "DATE_TRANSACTION" )
			
			ldt_date_transaction = ln_cst_carga_plano_banco_bank_of_america.of_set_date_transaction (ls_fecha_transaccion)
			
			dw_bank_statement.SetTransObject(SQLCA)
			dw_bank_statement.Retrieve(ls_id_banco, ls_id_cuenta_banco, ldt_date_transaction)
			
			MessageBox("Information", "Los datos han sido importados.",Exclamation!)
		ELSE
			dw_archivo_plano.Reset()
		END IF
		
		Destroy ln_cst_carga_plano_banco_bancorp_south;
	CASE ELSE

END CHOOSE
end event

type gb_1 from groupbox within w_load_bank_statements
integer x = 1792
integer y = 12
integer width = 1733
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_load_bank_statements
integer x = 23
integer y = 12
integer width = 1769
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

