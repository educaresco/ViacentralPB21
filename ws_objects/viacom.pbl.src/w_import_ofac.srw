$PBExportHeader$w_import_ofac.srw
forward
global type w_import_ofac from Window
end type
type st_6 from statictext within w_import_ofac
end type
type st_9 from statictext within w_import_ofac
end type
type cb_4 from commandbutton within w_import_ofac
end type
type st_8 from statictext within w_import_ofac
end type
type st_5 from statictext within w_import_ofac
end type
type sle_1 from singlelineedit within w_import_ofac
end type
type cb_1 from commandbutton within w_import_ofac
end type
type st_status from statictext within w_import_ofac
end type
type st_3 from statictext within w_import_ofac
end type
type st_1 from statictext within w_import_ofac
end type
type uo_progress from u_progressbar within w_import_ofac
end type
type cb_2 from commandbutton within w_import_ofac
end type
type st_4 from statictext within w_import_ofac
end type
type sle_intentos from singlelineedit within w_import_ofac
end type
type gb_1 from groupbox within w_import_ofac
end type
end forward

global type w_import_ofac from Window
int X=146
int Y=200
int Width=1746
int Height=1456
boolean TitleBar=true
string Title="Import OFAC"
long BackColor=80269524
boolean ControlMenu=true
WindowType WindowType=response!
st_6 st_6
st_9 st_9
cb_4 cb_4
st_8 st_8
st_5 st_5
sle_1 sle_1
cb_1 cb_1
st_status st_status
st_3 st_3
st_1 st_1
uo_progress uo_progress
cb_2 cb_2
st_4 st_4
sle_intentos sle_intentos
gb_1 gb_1
end type
global w_import_ofac w_import_ofac

type variables
long	il_intento = 0
Boolean	ib_actualizado=False
end variables

on w_import_ofac.create
this.st_6=create st_6
this.st_9=create st_9
this.cb_4=create cb_4
this.st_8=create st_8
this.st_5=create st_5
this.sle_1=create sle_1
this.cb_1=create cb_1
this.st_status=create st_status
this.st_3=create st_3
this.st_1=create st_1
this.uo_progress=create uo_progress
this.cb_2=create cb_2
this.st_4=create st_4
this.sle_intentos=create sle_intentos
this.gb_1=create gb_1
this.Control[]={this.st_6,&
this.st_9,&
this.cb_4,&
this.st_8,&
this.st_5,&
this.sle_1,&
this.cb_1,&
this.st_status,&
this.st_3,&
this.st_1,&
this.uo_progress,&
this.cb_2,&
this.st_4,&
this.sle_intentos,&
this.gb_1}
end on

on w_import_ofac.destroy
destroy(this.st_6)
destroy(this.st_9)
destroy(this.cb_4)
destroy(this.st_8)
destroy(this.st_5)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.st_status)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.uo_progress)
destroy(this.cb_2)
destroy(this.st_4)
destroy(this.sle_intentos)
destroy(this.gb_1)
end on

type st_6 from statictext within w_import_ofac
int X=210
int Y=460
int Width=1211
int Height=60
boolean Enabled=false
string Text="If you want to download the file manualy go to:"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_9 from statictext within w_import_ofac
int X=128
int Y=900
int Width=1262
int Height=76
boolean Enabled=false
string Text="3. Click the button to load the file in the Database"
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

type cb_4 from commandbutton within w_import_ofac
int X=155
int Y=784
int Width=1399
int Height=84
int TabOrder=20
string Text="Extract File"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
if not fileexists("C:\VIAMERICASMT\OFAC\sdall.exe") then
	Messagebox("Error","OFAC Update not found.~nPlease repeat Step 1 and save the file to C:\VIAMERICASMT\OFAC\",stopsign!)
	return
end if

long li_FileNum
// Crea el .bat que actualiza ofac
li_FileNum = FileOpen("c:\VIAMERICASMT\updateofac.bat", LineMode!, Write!, LockWrite!, Replace!)
FileWrite(li_FileNum, "c:")
FileWrite(li_FileNum, "CD C:\VIAMERICASMT\OFAC\")
FileWrite(li_FileNum, "DEL *.DEL /Q /F")
FileWrite(li_FileNum, "DEL *.TXT /Q /F")
FileWrite(li_FileNum, "DEL *.FF /Q /F")
FileWrite(li_FileNum, "sdall.exe")
FileClose(li_FileNum)
Run("c:\VIAMERICASMT\updateofac.bat",Maximized!)
end event

type st_8 from statictext within w_import_ofac
int X=128
int Y=688
int Width=1262
int Height=76
boolean Enabled=false
string Text="2. Click the button to extract the file"
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

type st_5 from statictext within w_import_ofac
int X=210
int Y=332
int Width=1211
int Height=60
boolean Enabled=false
string Text="When the link open click SAVE AS."
boolean FocusRectangle=false
long TextColor=255
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_1 from singlelineedit within w_import_ofac
int X=187
int Y=524
int Width=1463
int Height=84
boolean Border=false
boolean AutoHScroll=false
boolean DisplayOnly=true
string Text="http://www.ustreas.gov/offices/enforcement/ofac/sdn/sdall.exe"
long BackColor=80269524
int TextSize=-8
int Weight=400
string FaceName="Arial"
boolean Underline=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_import_ofac
int X=155
int Y=212
int Width=1399
int Height=84
int TabOrder=10
string Text="Download the File (Click Save As)"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//run("explorer http://www.ustreas.gov/ofac/t11sdall.exe", Maximized!)
run("explorer http://www.ustreas.gov/offices/enforcement/ofac/sdn/sdall.exe", Maximized!)


end event

type st_status from statictext within w_import_ofac
int X=37
int Y=1192
int Width=1637
int Height=76
boolean Enabled=false
boolean Border=true
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_import_ofac
int X=210
int Y=396
int Width=1211
int Height=60
boolean Enabled=false
string Text="and Save it to the folder C:\VIAMERICASMT\OFAC\"
boolean FocusRectangle=false
long TextColor=255
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_import_ofac
int X=128
int Y=132
int Width=1262
int Height=76
boolean Enabled=false
string Text="1. Click the button to download the file"
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

type uo_progress from u_progressbar within w_import_ofac
int X=37
int Y=1276
int Width=1637
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
long BackColor=80269524
end type

on uo_progress.destroy
call u_progressbar::destroy
end on

type cb_2 from commandbutton within w_import_ofac
int X=155
int Y=1008
int Width=1399
int Height=84
int TabOrder=30
string Text="Import to Database"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string	ls_name, ls_id, ls_tipo, ls_cadena, ls_vess_type, ls_call_sign, ls_title, ls_program,ls_otros,&
			ls_address, ls_city, ls_country
long	li_filenum, ll_fileread, ll_cont, ll_cont_ofaci, ll_cont_ofacf
Double	ld_id

string  ls_tonnage,ls_grt,ls_vess_flag,ls_vess_owner,ls_remarks, ls_linea

select 	count(*)
into		:ll_cont_ofaci
from 		dba.ofac_list;

////////////////////////////////////////////////////////////////////////////////////////////////////
//// CARGA LA INFORMACION DE LA PRIMERA LISTA ALT
li_FileNum = FileOpen("c:\VIAMERICASMT\ofac\alt.ff",LineMode!, Read!, LockRead!)

If li_filenum < 0 Then
	Messagebox("Error de Archivo","Error al Abrir el Archivo de Interface de OFAC")
	Return
end if

delete from dba.ofac_list where file_name='ALT';

ll_fileread = FileRead(li_FileNum, ls_cadena) 
ll_cont = 0


Setpointer(Hourglass!)

st_status.Text = 'Importando Tabla ALT OFAC...'

uo_progress.of_SetMaximum(1300)
uo_progress.of_SetPosition(0)
uo_progress.of_Reset()

uo_progress.of_Increment(1) 

DO WHILE ll_fileread > 0
	ld_id  			= 	Double(left(ls_cadena,10))
	ls_name  		= 	Upper(Trim(Mid(ls_cadena,29,200)))
	ls_tipo  		= 	Trim(Mid(ls_cadena,21,8))
	ls_program		= 	''
	ls_title			= 	Trim(Mid(ls_cadena,229,180))
	ls_call_sign	= 	''
	ls_vess_type   = 	''
	ls_otros			=	''

	INSERT INTO dba.ofac_list  
         ( ent_num,   
           sdn_name,   
           sdn_type,   
           sdn_program,   
           sdn_title,   
           sdn_call_sign,   
           sdn_vess_type,otros,file_name,ofac_address,ofac_city,ofac_country  )  
	VALUES ( :ld_id,   
           :ls_name,   
           :ls_tipo,   
           :ls_program,   
           :ls_title,   
           :ls_call_sign,   
           :ls_vess_type,:ls_otros,'ALT',null,null,null )  ;

	if sqlca.sqlcode = 0 then
		commit ;
		uo_progress.of_Increment(1) 
	end if

	
   ll_fileread = FileRead(li_FileNum, ls_cadena) 				
LOOP

////////////////////////////////////////////////////////////////////////////////////////////////////


//// CARGA LA INFORMACION DE LA PRIMERA LISTA SDN
li_FileNum = FileOpen("c:\VIAMERICASMT\ofac\sdn.ff",LineMode!, Read!, LockRead!)

If li_filenum < 0 Then
	Messagebox("Error de Archivo","Error al Abrir el Archivo de Interface de OFAC")
	Return
end if

delete from dba.ofac_list where file_name='SDN';

ll_fileread = FileRead(li_FileNum, ls_cadena) 
ll_cont = 0


Setpointer(Hourglass!)

st_status.Text = 'Importando Tabla SDN OFAC...'

uo_progress.of_SetMaximum(2030)
uo_progress.of_SetPosition(0)
uo_progress.of_Reset()

uo_progress.of_Increment(1) 

DO WHILE ll_fileread > 0
	ld_id  			= 	Double(left(ls_cadena,10))
	ls_name  		= 	Upper(Trim(Mid(ls_cadena,11,200)))
	ls_tipo  		= 	Trim(Mid(ls_cadena,211,12))
	ls_program		= 	Trim(Mid(ls_cadena,223,20))
	ls_title			= 	Trim(Mid(ls_cadena,243,180))
	ls_call_sign	= 	Trim(Mid(ls_cadena,423,8))
	ls_vess_type   = 	Trim(Mid(ls_cadena,431,25))
	ls_tonnage     =  Trim(Mid(ls_cadena,456,14))
	ls_grt         =  Trim(Mid(ls_cadena,470,8))	
   ls_vess_flag   =  Trim(Mid(ls_cadena,478,40))
	ls_vess_owner  =  Trim(Mid(ls_cadena,518,150))
	ls_remarks     =  Trim(Mid(ls_cadena,668,300))	 
	 

//	ld_id  			= 	Double(left(ls_cadena,10))
//	ls_name  		= 	Upper(Trim(Mid(ls_cadena,11,200)))
//	ls_tipo  		= 	Trim(Mid(ls_cadena,211,12))
//	ls_program		= 	Trim(Mid(ls_cadena,223,15))
//	ls_title			= 	Trim(Mid(ls_cadena,238,180))
//	ls_call_sign	= 	Trim(Mid(ls_cadena,318,8))
//	ls_vess_type   = 	Trim(Mid(ls_cadena,326,25))
//	ls_otros			=	Trim(Mid(ls_cadena,351,440))
//
	INSERT INTO dba.ofac_list  
         ( ent_num,   
           sdn_name,   
           sdn_type,   
           sdn_program,   
           sdn_title,   
           sdn_call_sign,   
           sdn_vess_type,
			  otros,
			  file_name,
			  ofac_address,
			  ofac_city,
			  ofac_country,
			  tonnage,
			  grt,
			  vess_flag,
			  vess_owner,
			  remarks,
			  vess_type)  
	VALUES ( :ld_id,   
           :ls_name,   
           :ls_tipo,   
           :ls_program,   
           :ls_title,   
           :ls_call_sign,   
           :ls_vess_type,
			  :ls_otros,
			  'SDN',
			  null,
			  null,
			  null,
			  :ls_tonnage,
			  :ls_grt,
			  :ls_vess_flag,
			  :ls_vess_owner,
			  :ls_remarks,
			  :ls_vess_type)  ;
			  
	if sqlca.sqlcode <>0 then
		messagebox('',"Codeerror : "+string(sqlca.sqldbcode)+"     Error Text :"+sqlca.sqlerrtext)
	end if
		  
			  
	update 	dba.ofac_list
	set		dba.ofac_list.sdn_program		=	:ls_program,
				dba.ofac_list.otros				=	:ls_otros
	where 	dba.ofac_list.ent_num 	= :ld_id;
	
	if sqlca.sqlcode = 0 then
		commit ;
		uo_progress.of_Increment(1) 
	end if

	
   ll_fileread = FileRead(li_FileNum, ls_cadena) 				
LOOP


////////////////////////////////////////////////////////////////////////////////////////////////////
//// CARGA LA INFORMACION DE LA PRIMERA LISTA ADD
li_FileNum = FileOpen("c:\VIAMERICASMT\ofac\add.ff",LineMode!, Read!, LockRead!)

If li_filenum < 0 Then
	Messagebox("Error de Archivo","Error al Abrir el Archivo de Interface de OFAC")
	Return
end if

ll_fileread = FileRead(li_FileNum, ls_cadena) 
ll_cont = 0


Setpointer(Hourglass!)

st_status.Text = 'Importando Tabla ADD OFAC'

uo_progress.of_SetMaximum(3970)
uo_progress.of_SetPosition(0)
uo_progress.of_Reset()

uo_progress.of_Increment(1) 

DO WHILE ll_fileread > 0
	ld_id  			= 	Double(left(ls_cadena,10))
	ls_address		=	Trim(Mid(ls_cadena,21,125))
	ls_city			=	Trim(Mid(ls_cadena,146,30))
	ls_country		=	Trim(Mid(ls_cadena,176,40))

	UPDATE 	dba.ofac_list
	SET 		dba.ofac_list.ofac_address	=	:ls_address,
				dba.ofac_list.ofac_city		=	:ls_city,
				dba.ofac_list.ofac_country	=	:ls_country
	WHERE		dba.ofac_list.ent_num	=	:ld_id;

	if sqlca.sqlcode = 0 then
		commit ;
		uo_progress.of_Increment(1) 
	end if
	
   ll_fileread = FileRead(li_FileNum, ls_cadena) 				
LOOP
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
select 	count(*)
into		:ll_cont_ofacf
from 		dba.ofac_list;

ll_cont_ofaci = ll_cont_ofacf - ll_cont_ofaci

INSERT INTO dba.control_ofac (id_cashier,fecha,hora,registros)
VALUES (:gs_cashier,getdate(),getdate(),:ll_cont_ofaci);

fileclose(li_FileNum)
//Messagebox("Finish ","OFAC Import New Record : " + string(ll_cont_ofaci))

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////
////// CARGA LA INFORMACION DETALLADA OFAC
long ll_bloque, ll_linea

ll_bloque = 1
ll_linea = 0

li_FileNum = FileOpen("c:\VIAMERICASMT\ofac\SDNLIST.TXT",LineMode!, Read!, LockRead!)

If li_filenum < 0 Then
	Messagebox("Error de Archivo","Error al Abrir el Archivo de Interface de OFAC (SDNLIST.TXT)")
	Return
end if

delete from dba.ofac_details;

ll_fileread = FileRead(li_FileNum, ls_cadena) 
ll_cont = 0

Setpointer(Hourglass!)

st_status.Text = 'Importando Catalogo OFAC...'

uo_progress.of_SetMaximum(22538)
uo_progress.of_SetPosition(0)
uo_progress.of_Reset()

uo_progress.of_Increment(1) 

DO WHILE ll_fileread >= 0
	ls_linea			=	upper(ls_cadena)

	if ll_fileread = 0 then
		ll_bloque+=1
		ll_linea=0
	end if

	INSERT INTO dba.ofac_details
         ( bloque, linea, texto  )  
	VALUES ( :ll_bloque, :ll_linea, :ls_linea);

	if sqlca.sqlcode = 0 then
		commit ;
		uo_progress.of_Increment(1) 
	else
		messagebox("",sqlca.SQLErrText)
		return
	end if

	
   ll_fileread = FileRead(li_FileNum, ls_cadena) 				
	ll_linea+=1

LOOP

//////////////////////////////////////////////////////////////////////////////////////////////////////
//select 	count(*)
//into		:ll_cont_ofacf
//from 		ofac_list;
//
//ll_cont_ofaci = ll_cont_ofacf - ll_cont_ofaci
//
//INSERT INTO control_ofac (id_cashier,fecha,hora,registros)
//VALUES (:gs_cashier,today(),now(),:ll_cont_ofaci);
//

//////////////////////////////////////////////////////////////////////////////////////////////////////
end event

type st_4 from statictext within w_import_ofac
int X=1682
int Y=376
int Width=247
int Height=76
boolean Visible=false
boolean Enabled=false
string Text="Intentos :"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_intentos from singlelineedit within w_import_ofac
int X=1943
int Y=364
int Width=73
int Height=92
boolean Visible=false
BorderStyle BorderStyle=StyleRaised!
boolean AutoHScroll=false
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_import_ofac
int X=37
int Y=32
int Width=1637
int Height=1120
string Text="Instructions"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

