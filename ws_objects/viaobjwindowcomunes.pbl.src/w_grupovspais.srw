$PBExportHeader$w_grupovspais.srw
forward
global type w_grupovspais from Window
end type
type cb_5 from commandbutton within w_grupovspais
end type
type cb_4 from commandbutton within w_grupovspais
end type
type cb_2 from commandbutton within w_grupovspais
end type
type dw_2 from datawindow within w_grupovspais
end type
type cb_3 from commandbutton within w_grupovspais
end type
type cb_1 from commandbutton within w_grupovspais
end type
type dw_1 from datawindow within w_grupovspais
end type
type em_fecha2 from editmask within w_grupovspais
end type
type em_fecha1 from editmask within w_grupovspais
end type
type st_2 from statictext within w_grupovspais
end type
type st_1 from statictext within w_grupovspais
end type
end forward

global type w_grupovspais from Window
int X=823
int Y=360
int Width=3497
int Height=1992
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cb_5 cb_5
cb_4 cb_4
cb_2 cb_2
dw_2 dw_2
cb_3 cb_3
cb_1 cb_1
dw_1 dw_1
em_fecha2 em_fecha2
em_fecha1 em_fecha1
st_2 st_2
st_1 st_1
end type
global w_grupovspais w_grupovspais

on w_grupovspais.create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_2=create cb_2
this.dw_2=create dw_2
this.cb_3=create cb_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.em_fecha2=create em_fecha2
this.em_fecha1=create em_fecha1
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_5,&
this.cb_4,&
this.cb_2,&
this.dw_2,&
this.cb_3,&
this.cb_1,&
this.dw_1,&
this.em_fecha2,&
this.em_fecha1,&
this.st_2,&
this.st_1}
end on

on w_grupovspais.destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.em_fecha2)
destroy(this.em_fecha1)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;em_fecha1.text = string(today())
em_fecha2.text = string(today())
end event

type cb_5 from commandbutton within w_grupovspais
int X=2469
int Y=28
int Width=603
int Height=108
int TabOrder=80
string Text="View Excel File"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Run("C:\Program Files\Microsoft Office\Office\Excel.exe c:\statistical.xls", Maximized!)
end event

type cb_4 from commandbutton within w_grupovspais
int X=3099
int Y=1068
int Width=352
int Height=108
int TabOrder=40
string Text="Print"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;If Messagebox("Verificar","Esta seguro que desea Imprimir ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()

dw_2.print()


end event

type cb_2 from commandbutton within w_grupovspais
int X=3099
int Y=1252
int Width=352
int Height=108
int TabOrder=80
string Text="Macro File"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_group, ls_name, ls_ecu, ls_per, ls_usa, ls_ven, ls_rep, ls_cst, ls_pnm
string ls_col, ls_oth, ls_hon, ls_nic, ls_mex
string ls_branch, ls_cadena, ls_state, ls_file
date   ld_fecha1, ld_fecha2
long   ll_negativo, li_FileNum
double ll_positivo

ld_fecha1 = date(em_fecha1.text)
ld_fecha2 = RelativeDate(date(em_fecha2.text),1)
MESSAGEBOX("File Name Is c:\Totales.txt","OK")

ls_file = 'c:\Totales.txt'
li_FileNum = FileOpen(ls_file,LineMode!, Write!, LockWrite!, Replace!)

DECLARE GRUPO CURSOR FOR  
SELECT dba.group_branch.id_main_branch,   
       dba.group_branch.name_main_branch  
FROM dba.group_branch  ;

Open GRUPO;

FETCH GRUPO INTO :ls_group, :ls_name ;
DO WHILE SQLCA.SQLCODE = 0
	//***********************************ECUADOR
	
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'ECU' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF		

	ls_ecu = string((ll_positivo ))
	//***********************************PERU
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'PER' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
		
	ls_per = string((ll_positivo ))
	//***********************************USA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'USA' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	ls_usa = string((ll_positivo ))
	//***********************************VENEZUELA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'VEN' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_ven = string((ll_positivo ))
	//***********************************REPUBLICA DOMINICANA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'REP' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_rep = string((ll_positivo ))
	//***********************************COSTA RICA
   SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'CST' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_cst = string((ll_positivo ))
	//***********************************PANAMA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'PNM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_pnm = string((ll_positivo ))
	//***********************************COLOMBIA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'COL' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_col = string((ll_positivo ))
	//***********************************HONDURAS
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'HON' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 )  )  ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_hon = string((ll_positivo ))
	//***********************************NICARAGUA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM branch, receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_nic = string((ll_positivo ))
	//***********************************MEXICO
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'MEX' OR dba.receiver.id_country_receiver = 'MXB' OR dba.receiver.id_country_receiver = 'MXT') AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	ls_mex = string((ll_positivo ))

	//***********************************OTHERS
   SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver <> 'MEX' ) AND
			( dba.receiver.id_country_receiver <> 'MXB' ) AND
			( dba.receiver.id_country_receiver <> 'MXT' ) AND  
			( dba.receiver.id_country_receiver <> 'ECU' ) AND  
			( dba.receiver.id_country_receiver <> 'PER' ) AND  
			( dba.receiver.id_country_receiver <> 'USA' ) AND  
			( dba.receiver.id_country_receiver <> 'VEN' ) AND  
			( dba.receiver.id_country_receiver <> 'REP' ) AND  
			( dba.receiver.id_country_receiver <> 'CST' ) AND  
			( dba.receiver.id_country_receiver <> 'PNM' ) AND  
			( dba.receiver.id_country_receiver <> 'COL' ) AND  
			( dba.receiver.id_country_receiver <> 'HON' ) AND  
			( dba.receiver.id_country_receiver <> 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 )  )  ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_oth = string((ll_positivo ))
   ls_cadena = ls_group+','+ls_name+','+ls_ecu+','+ls_per+','+ls_usa+','+ls_ven+','+ls_rep+','+ls_cst+','+ls_pnm+','+ls_col+','+ls_oth+','+ls_hon+','+ls_nic+','+ls_mex

   FileWrite(li_FileNum,ls_cadena)

	FETCH GRUPO INTO :ls_group, :ls_name ;
LOOP
CLOSE GRUPO;
FileClose(li_FileNum)
MESSAGEBOX("FINISH","OK")
end event

type dw_2 from datawindow within w_grupovspais
int X=18
int Y=1020
int Width=3058
int Height=844
int TabOrder=70
string DataObject="dw_grupovscountry_totales"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type cb_3 from commandbutton within w_grupovspais
int X=3099
int Y=352
int Width=352
int Height=108
int TabOrder=30
string Text="Macro File"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_group, ls_name, ls_ecu, ls_per, ls_usa, ls_ven, ls_rep, ls_cst, ls_pnm
string ls_col, ls_oth, ls_hon, ls_nic, ls_mex
string ls_branch, ls_cadena, ls_state, ls_file
date   ld_fecha1, ld_fecha2
long   ll_positivo, ll_negativo, li_FileNum

ld_fecha1 = date(em_fecha1.text)
ld_fecha2 = Relativedate(date(em_fecha2.text),1)
MESSAGEBOX("File Name Is c:\lotus.txt","OK")

ls_file = 'c:\lotus.txt'
li_FileNum = FileOpen(ls_file,LineMode!, Write!, LockWrite!, Replace!)

DECLARE GRUPO CURSOR FOR  
SELECT dba.group_branch.id_main_branch,   
       dba.group_branch.name_main_branch  
FROM dba.group_branch  ;

Open GRUPO;

FETCH GRUPO INTO :ls_group, :ls_name ;
DO WHILE SQLCA.SQLCODE = 0
	//***********************************ECUADOR
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'ECU' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF		

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'ECU' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_ecu = string((ll_positivo - ll_negativo))
	//***********************************PERU
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'PER' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'PER' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_per = string((ll_positivo - ll_negativo))
	//***********************************USA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'USA' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'USA' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_usa = string((ll_positivo - ll_negativo))
	//***********************************VENEZUELA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'VEN' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'VEN' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_ven = string((ll_positivo - ll_negativo))
	//***********************************REPUBLICA DOMINICANA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'REP' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'REP' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_rep = string((ll_positivo - ll_negativo))
	//***********************************COSTA RICA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'CST' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'CST' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_cst = string((ll_positivo - ll_negativo))
	//***********************************PANAMA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'PNM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'PNM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_pnm = string((ll_positivo - ll_negativo))
	//***********************************COLOMBIA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'COL' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'COL' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_col = string((ll_positivo - ll_negativo))
	//***********************************HONDURAS
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'HON' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'HON' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_hon = string((ll_positivo - ll_negativo))
	//***********************************NICARAGUA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_nic = string((ll_positivo - ll_negativo))
	//***********************************MEXICO
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'MEX' OR dba.receiver.id_country_receiver = 'MXB' OR dba.receiver.id_country_receiver = 'MXT') AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'MEX' OR dba.receiver.id_country_receiver = 'MXB' OR dba.receiver.id_country_receiver = 'MXT') AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_mex = string((ll_positivo - ll_negativo))

	//***********************************OTHERS
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver <> 'MEX' ) AND
			( dba.receiver.id_country_receiver <> 'MXB' ) AND
			( dba.receiver.id_country_receiver <> 'MXT' ) AND  
			( dba.receiver.id_country_receiver <> 'ECU' ) AND  
			( dba.receiver.id_country_receiver <> 'PER' ) AND  
			( dba.receiver.id_country_receiver <> 'USA' ) AND  
			( dba.receiver.id_country_receiver <> 'VEN' ) AND  
			( dba.receiver.id_country_receiver <> 'REP' ) AND  
			( dba.receiver.id_country_receiver <> 'CST' ) AND  
			( dba.receiver.id_country_receiver <> 'PNM' ) AND  
			( dba.receiver.id_country_receiver <> 'COL' ) AND  
			( dba.receiver.id_country_receiver <> 'HON' ) AND  
			( dba.receiver.id_country_receiver <> 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver <> 'MEX' ) AND
			( dba.receiver.id_country_receiver <> 'MXB' ) AND
			( dba.receiver.id_country_receiver <> 'MXT' ) AND  
			( dba.receiver.id_country_receiver <> 'ECU' ) AND  
			( dba.receiver.id_country_receiver <> 'PER' ) AND  
			( dba.receiver.id_country_receiver <> 'USA' ) AND  
			( dba.receiver.id_country_receiver <> 'VEN' ) AND  
			( dba.receiver.id_country_receiver <> 'REP' ) AND  
			( dba.receiver.id_country_receiver <> 'CST' ) AND  
			( dba.receiver.id_country_receiver <> 'PNM' ) AND  
			( dba.receiver.id_country_receiver <> 'COL' ) AND  
			( dba.receiver.id_country_receiver <> 'HON' ) AND  
			( dba.receiver.id_country_receiver <> 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF	
	ls_oth = string((ll_positivo - ll_negativo))
   ls_cadena = ls_group+','+ls_name+','+ls_ecu+','+ls_per+','+ls_usa+','+ls_ven+','+ls_rep+','+ls_cst+','+ls_pnm+','+ls_col+','+ls_oth+','+ls_hon+','+ls_nic+','+ls_mex

   FileWrite(li_FileNum,ls_cadena)

	FETCH GRUPO INTO :ls_group, :ls_name ;
LOOP
CLOSE GRUPO;
FileClose(li_FileNum)
MESSAGEBOX("FINISH","OK")
end event

type cb_1 from commandbutton within w_grupovspais
int X=3099
int Y=176
int Width=352
int Height=108
int TabOrder=50
string Text="Print"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;If Messagebox("Verificar","Esta seguro que desea Imprimir ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()

dw_1.print()


end event

type dw_1 from datawindow within w_grupovspais
int X=18
int Y=160
int Width=3058
int Height=844
int TabOrder=60
string DataObject="dw_grupovscountry"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type em_fecha2 from editmask within w_grupovspais
int X=1093
int Y=32
int Width=320
int Height=100
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;dw_1.SetTransObject(SQLCA)
dw_1.Retrieve(date(em_fecha1.text),RelativeDate(date(em_fecha2.text),1))

dw_2.SetTransObject(SQLCA)
dw_2.Retrieve(date(em_fecha1.text),RelativeDate(date(em_fecha2.text),1))
end event

type em_fecha1 from editmask within w_grupovspais
int X=293
int Y=32
int Width=320
int Height=100
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_grupovspais
int X=850
int Y=32
int Width=247
int Height=76
boolean Enabled=false
string Text="To"
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

type st_1 from statictext within w_grupovspais
int X=32
int Y=32
int Width=247
int Height=76
boolean Enabled=false
string Text="From"
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

