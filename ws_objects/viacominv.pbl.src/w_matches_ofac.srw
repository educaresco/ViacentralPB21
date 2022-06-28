$PBExportHeader$w_matches_ofac.srw
forward
global type w_matches_ofac from Window
end type
type cb_close from commandbutton within w_matches_ofac
end type
type cb_print from commandbutton within w_matches_ofac
end type
type dw_2 from datawindow within w_matches_ofac
end type
type dw_1 from datawindow within w_matches_ofac
end type
type cb_1 from commandbutton within w_matches_ofac
end type
type st_1 from statictext within w_matches_ofac
end type
type em_cadena from editmask within w_matches_ofac
end type
type gb_1 from groupbox within w_matches_ofac
end type
end forward

global type w_matches_ofac from Window
int X=1056
int Y=484
int Width=2272
int Height=1920
boolean TitleBar=true
string Title="Coincidencias OFAC"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
WindowType WindowType=popup!
cb_close cb_close
cb_print cb_print
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
st_1 st_1
em_cadena em_cadena
gb_1 gb_1
end type
global w_matches_ofac w_matches_ofac

on w_matches_ofac.create
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_1=create st_1
this.em_cadena=create em_cadena
this.gb_1=create gb_1
this.Control[]={this.cb_close,&
this.cb_print,&
this.dw_2,&
this.dw_1,&
this.cb_1,&
this.st_1,&
this.em_cadena,&
this.gb_1}
end on

on w_matches_ofac.destroy
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.em_cadena)
destroy(this.gb_1)
end on

event open;em_cadena.text = Message.StringParm
end event

type cb_close from commandbutton within w_matches_ofac
int X=1070
int Y=1712
int Width=343
int Height=76
int TabOrder=40
string Text="Cerrar"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(w_matches_ofac)
end event

type cb_print from commandbutton within w_matches_ofac
int X=718
int Y=1712
int Width=343
int Height=76
int TabOrder=30
boolean Enabled=false
string Text="Imprimir"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
// FALTA LA dw_ofac_matches_impresion!!!
// Ask Alvaro/Felipe for the Datawindow!!!

////dw_2.print()
end event

type dw_2 from datawindow within w_matches_ofac
int X=2295
int Y=304
int Width=544
int Height=176
boolean Visible=false
string DataObject="dw_ofac_matches_impresion"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_1 from datawindow within w_matches_ofac
int X=41
int Y=288
int Width=2171
int Height=1408
string DataObject="dw_ofac_matches"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event constructor;SetTransObject(SQLCA)
end event

type cb_1 from commandbutton within w_matches_ofac
int X=1819
int Y=124
int Width=343
int Height=76
int TabOrder=20
string Text="Consultar"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long ll_ini, ll_fin
string ls_cadena
string ls_palabra
string la_palabras[10]
int i, li_cont

ls_cadena = trim(em_cadena.text)

if len(ls_cadena) < 1 then
	messagebox("Error","Debe especificar algun nombre a buscar")
	return	
end if

setpointer(HourGlass!)

// -----------------------------------------------------------------------
// Llenando el vector con todas las palabras del nombre
i = 0
ll_ini = 1
ll_fin = Pos(ls_cadena, " ")
ls_palabra = ls_cadena

// Mientras haya espacios va llenando cada palabra en la tabla ofac_match
DO WHILE (ll_fin > 0)
	i+=1
	ls_palabra = Left(ls_cadena, ll_fin - 1)
	ls_cadena = Mid(ls_cadena, ll_fin + 1)	
	la_palabras[i] = ls_palabra
	ll_fin = Pos(ls_cadena, " ")
LOOP

// Mete la ultima palabra
i+=1
la_palabras[i] = ls_cadena
li_cont = i
// -----------------------------------------------------------------------

// -----------------------------------------------------------------------
// Insertando las palabras con el bloque en el que se encuentran (Ofac_Match)
delete from dba.ofac_match;
for i = 1 to li_cont	
	ls_palabra = la_palabras[i]	
	insert into dba.ofac_match select distinct :ls_palabra, dba.ofac_details.bloque from dba.ofac_details where dba.ofac_details.texto like '%'+:ls_palabra+'%';	
	if sqlca.SQLCode <> 0 then
		messagebox("Error","Error inserting temporary data~n[Error:"+SQLCA.SQLErrText+"]~nPlease contact system manager.")
		return
	end if

next

commit;
// -----------------------------------------------------------------------


// -----------------------------------------------------------------------
// Borrando los bloques que tienen menos de 2 ocurrencias
// (Cuando puso mas de un nombre)

long ll_bloque, ll_ocurrencias

DECLARE Ocurrencias CURSOR FOR  
	select dba.ofac_match.bloque, count(*) from dba.ofac_match 
	group by dba.ofac_match.bloque order by 2 asc; 			

OPEN Ocurrencias;

FETCH Ocurrencias INTO :ll_bloque, :ll_ocurrencias;

DO WHILE SQLCA.SQLCODE = 0 and ll_ocurrencias < 2 and li_cont > 1
	delete from dba.ofac_match where dba.ofac_match.bloque = :ll_bloque;
	FETCH Ocurrencias INTO :ll_bloque, :ll_ocurrencias;
LOOP
commit;
// -----------------------------------------------------------------------

long ll_rows 
select count(*)
  into :ll_rows
  from dba.ofac_match;

IF ll_rows < 1 THEN MessageBox("Informacion", "No se encontraron Coincidencias en OFAC.")

dw_1.retrieve()
ls_cadena = trim(em_cadena.text)
dw_2.retrieve(ls_cadena)
end event

type st_1 from statictext within w_matches_ofac
int X=110
int Y=124
int Width=210
int Height=76
boolean Enabled=false
string Text="Buscar:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_cadena from editmask within w_matches_ofac
int X=325
int Y=124
int Width=1472
int Height=76
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_matches_ofac
int X=41
int Y=36
int Width=2171
int Height=208
string Text="Coincidencias OFAC"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

