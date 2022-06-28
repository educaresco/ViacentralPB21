$PBExportHeader$w_groupvscountry_transactions.srw
forward
global type w_groupvscountry_transactions from Window
end type
type cb_3 from commandbutton within w_groupvscountry_transactions
end type
type cb_2 from commandbutton within w_groupvscountry_transactions
end type
type cb_1 from commandbutton within w_groupvscountry_transactions
end type
type dw_1 from datawindow within w_groupvscountry_transactions
end type
type em_fecha2 from editmask within w_groupvscountry_transactions
end type
type em_fecha1 from editmask within w_groupvscountry_transactions
end type
type st_2 from statictext within w_groupvscountry_transactions
end type
type st_1 from statictext within w_groupvscountry_transactions
end type
end forward

global type w_groupvscountry_transactions from Window
int X=823
int Y=360
int Width=3465
int Height=2120
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
em_fecha2 em_fecha2
em_fecha1 em_fecha1
st_2 st_2
st_1 st_1
end type
global w_groupvscountry_transactions w_groupvscountry_transactions

on w_groupvscountry_transactions.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.em_fecha2=create em_fecha2
this.em_fecha1=create em_fecha1
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.em_fecha2,&
this.em_fecha1,&
this.st_2,&
this.st_1}
end on

on w_groupvscountry_transactions.destroy
destroy(this.cb_3)
destroy(this.cb_2)
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

type cb_3 from commandbutton within w_groupvscountry_transactions
int X=3136
int Y=12
int Width=247
int Height=80
int TabOrder=30
string Text="Exit"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(w_groupvscountry_transactions)
end event

type cb_2 from commandbutton within w_groupvscountry_transactions
int X=2862
int Y=12
int Width=247
int Height=80
int TabOrder=30
string Text="Macro."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_group, ls_name, ls_ecu, ls_per, ls_usa, ls_ven, ls_rep, ls_cst, ls_pnm, ls_els, ls_jam
string ls_col, ls_oth, ls_hon, ls_nic, ls_mex
string ls_branch, ls_cadena, ls_state, ls_file, ls_tipo
date   ld_fecha1, ld_fecha2, ld_inicio, ld_fin
long   ll_positivo, ll_negativo, li_FileNum, ll_neutro, ll_num_envios

SETPOINTER(hourglass!)

ld_inicio = date('2001-01-01')
ld_fin    = date('2001-12-31')
ld_fecha1 = date(em_fecha1.text)
ld_fecha2 = RelativeDate(date(em_fecha2.text),1)
MESSAGEBOX("File Name Is c:\dinero\files\GCTRAN.txt","OK")

ls_file = 'c:\DINERO\FILES\GCTRAN.txt'
li_FileNum = FileOpen(ls_file,LineMode!, Write!, LockWrite!, Replace!)
ls_cadena = 'TRANSACTIONS GROUP VS COUNTRY'
FileWrite(li_FileNum,ls_cadena)
//ls_cadena = 'Name'+','+'Name/Group'+','+'Ecuador'+','+'Peru'+','+'USA'+','+'Venezuela'+','+'R.D.'+','+'C.Rica'+','+'Panama'+','+'Colombia'+','+'Other'+','+'Honduras'+','+'Nicaragua'+','+'Mexico'+','+'Total'
ls_cadena = 'Name'+','+'Name/Group'+','+'Colombia'+','+'C.Rica'+','+'Ecuador'+','+'El Salvador'+','+'Honduras'+','+'Jamaica'+','+'Mexico'+','+'Nicaragua'+','+'Peru'+','+'R.D.'+','+'USA'+','+'Other'+','+'Total'
FileWrite(li_FileNum,ls_cadena)



 DECLARE GRUPO CURSOR FOR  
SELECT DISTINCT dba.branch.id_main_branch,   
         dba.group_branch.name_main_branch,   
         dba.group_branch.type_group  
    FROM dba.branch,   
         dba.group_branch  
   WHERE ( dba.group_branch.id_main_branch = dba.branch.id_main_branch )  
ORDER BY dba.group_branch.type_group DESC,   
         dba.branch.id_main_branch ASC  ; 

//    and	( branch.id_type_branch <> 'P' )      


Open GRUPO;



FETCH GRUPO INTO :ls_group, :ls_name , :ls_tipo;

DO WHILE SQLCA.SQLCODE = 0
		if ls_group='0000' or ls_group='0002' or ls_group='0183' or ls_group='0185' then
		FETCH GRUPO INTO :ls_group, :ls_name, :ls_tipo ;
		CONTINUE
   end if		

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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'ECU' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'ECU' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_ecu = string((ll_positivo + ll_neutro - ll_negativo))
	
	//***********************************Salvador
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'ELS' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF		
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'ELS' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'ELS' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_els = string((ll_positivo + ll_neutro - ll_negativo))
	
	//***********************************Jamaica
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'JAM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF		
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'JAM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'JAM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_jam = string((ll_positivo + ll_neutro - ll_negativo))
	
	
	
	
	
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'PER' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'PER' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
	ls_per = string((ll_positivo + ll_neutro - ll_negativo))
	
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'USA' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'USA' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF
	ls_usa = string((ll_positivo  + ll_neutro - ll_negativo))
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'VEN' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'VEN' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END If
	ls_ven = string((ll_positivo + ll_neutro - ll_negativo))
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'REP' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'REP' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END If
	ls_rep = string((ll_positivo + ll_neutro - ll_negativo))
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'CST' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'CST' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END If
	ls_cst = string((ll_positivo + ll_neutro - ll_negativo))
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'PNM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'PNM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END If
	ls_pnm = string((ll_positivo + ll_neutro - ll_negativo))
	
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'COL' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'COL' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END If
	ls_col = string((ll_positivo + ll_neutro - ll_negativo))
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'HON' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'HON' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END If
	ls_hon = string((ll_positivo + ll_neutro - ll_negativo))
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
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END If
	ls_nic = string((ll_positivo + ll_neutro - ll_negativo))
	//***********************************MEXICO
			SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'MEX' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF		
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'MEX' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ));
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'MEX' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END If
	ls_mex = string((ll_positivo + ll_neutro - ll_negativo))

	//***********************************OTHERS
//	 not in ('MEX','USA','COL','CRA','PER','JAM','ECU','ELS','CST','REP','HON','NIC') and 
	
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver > 0 ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver not in ('MEX','USA','COL','CRA','PER','JAM','ECU','ELS','CST','REP','HON','NIC')) and 
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF SQLCA.SQLCode = 100 THEN
	   ll_positivo = 0
   END IF		
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_neutro
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver not in ('MEX','USA','COL','CRA','PER','JAM','ECU','ELS','CST','REP','HON','NIC')) and 
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver not in ('MEX','USA','COL','CRA','PER','JAM','ECU','ELS','CST','REP','HON','NIC')) and 
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
	
	ls_oth = string((ll_positivo + ll_neutro - ll_negativo))
	
	 ll_num_envios = 0
	
	 SELECT Count(*)  
    INTO :ll_num_envios  
    FROM dba.branch,   
         dba.receiver  
    WHERE   ( dba.receiver.id_branch = dba.branch.id_branch ) and 
	 			( dba.receiver.date_receiver >= :ld_inicio ) and
	 			( dba.receiver.date_receiver <= :ld_fin ) and 
            ( ( dba.branch.id_main_branch = :ls_group ) )   ;

	if ll_num_envios > 0 then
		ls_cadena = ls_group+','+ls_name+','+ls_col+','+ls_cst+','+ls_ecu+','+ls_els+','+ls_hon+','+ls_jam+','+ls_mex+','+ls_nic+','+ls_per+','+ls_rep+','+ls_usa+','+ls_oth
   	FileWrite(li_FileNum,ls_cadena)
	end if



	FETCH GRUPO INTO :ls_group, :ls_name, :ls_tipo ;
LOOP
CLOSE GRUPO;
FileClose(li_FileNum)

SETPOINTER(Arrow!)

MESSAGEBOX("FINISH","OK")
end event

type cb_1 from commandbutton within w_groupvscountry_transactions
int X=2592
int Y=12
int Width=247
int Height=80
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

dw_1.print()


end event

type dw_1 from datawindow within w_groupvscountry_transactions
int X=27
int Y=112
int Width=3378
int Height=1880
int TabOrder=50
string DataObject="dw_grupovscountry_transactions"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

type em_fecha2 from editmask within w_groupvscountry_transactions
int X=809
int Width=311
int Height=80
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

event modified;dw_1.SetTransObject(SQLCA)
dw_1.Retrieve(date(em_fecha1.text),date(em_fecha2.text))
end event

type em_fecha1 from editmask within w_groupvscountry_transactions
int X=288
int Width=315
int Height=84
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

type st_2 from statictext within w_groupvscountry_transactions
int X=613
int Y=8
int Width=151
int Height=76
boolean Enabled=false
string Text="To :"
Alignment Alignment=Right!
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

type st_1 from statictext within w_groupvscountry_transactions
int X=27
int Y=4
int Width=247
int Height=76
boolean Enabled=false
string Text="From :"
Alignment Alignment=Right!
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

