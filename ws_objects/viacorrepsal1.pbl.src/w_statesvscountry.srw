$PBExportHeader$w_statesvscountry.srw
forward
global type w_statesvscountry from w_grupovspais
end type
type cb_6 from commandbutton within w_statesvscountry
end type
type cb_7 from commandbutton within w_statesvscountry
end type
end forward

global type w_statesvscountry from w_grupovspais
cb_6 cb_6
cb_7 cb_7
end type
global w_statesvscountry w_statesvscountry

on w_statesvscountry.create
int iCurrent
call super::create
this.cb_6=create cb_6
this.cb_7=create cb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_6
this.Control[iCurrent+2]=this.cb_7
end on

on w_statesvscountry.destroy
call super::destroy
destroy(this.cb_6)
destroy(this.cb_7)
end on

type cb_5 from w_grupovspais`cb_5 within w_statesvscountry
int TabOrder=90
boolean Visible=false
end type

type cb_2 from w_grupovspais`cb_2 within w_statesvscountry
int TabOrder=100
boolean Visible=false
boolean Enabled=false
end type

type dw_2 from w_grupovspais`dw_2 within w_statesvscountry
int TabOrder=80
string DataObject="dw_statesvscountrytotals"
end type

type cb_3 from w_grupovspais`cb_3 within w_statesvscountry
boolean Visible=false
boolean Enabled=false
end type

type cb_1 from w_grupovspais`cb_1 within w_statesvscountry
int TabOrder=60
end type

type dw_1 from w_grupovspais`dw_1 within w_statesvscountry
int TabOrder=70
string DataObject="dw_statesvscountry"
end type

type cb_6 from commandbutton within w_statesvscountry
int X=3099
int Y=304
int Width=352
int Height=108
int TabOrder=50
boolean BringToTop=true
string Text="Macro."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_group, ls_name, ls_ecu, ls_per, ls_usa, ls_els, ls_rep, ls_cst, ls_jam
string ls_col, ls_oth, ls_hon, ls_nic, ls_mex
string ls_branch, ls_cadena, ls_state, ls_file
date   ld_fecha1, ld_fecha2
long   ll_positivo, ll_negativo, li_FileNum, ll_neutro

ld_fecha1 = date(em_fecha1.text)
ld_fecha2 = RelativeDate(date(em_fecha2.text),1)

SETPOINTER(HOURGLASS!)

MESSAGEBOX("File Name Is c:\dinero\files\STCOTRAN.txt","OK")
ls_file = 'c:\dinero\files\STCOTRAN.txt'
li_FileNum = FileOpen(ls_file,LineMode!, Write!, LockWrite!, Replace!)
ls_cadena = 'TRANSACTION STATES VS COUNTRY'
FileWrite(li_FileNum,ls_cadena)
//ls_cadena = 'State'+','+'payee Name'+','+'Ecuador'+','+'Peru'+','+'USA'+','+'Venezuela'+','+'R.D.'+','+'C.Rica'+','+'Panama'+','+'Colombia'+','+'Other'+','+'Honduras'+','+'Nicaragua'+','+'Mexico'+','+'Total'
ls_cadena = 'State'+','+'State/Country'+','+'Colombia'+','+'C.Rica'+','+'Ecuador'+','+'El Salvador'+','+'Honduras'+','+'Jamaica'+','+'Mexico'+','+'Nicaragua'+','+'Peru'+','+'R.D.'+','+'USA'+','+'Other'+','+'Total'
FileWrite(li_FileNum,ls_cadena)
ls_cadena = 'Se agrupan en Other los states diferentes a: 06 13 18 24 CT FL GA MA MN NJ NY VA' 
FileWrite(li_FileNum,ls_cadena)
ls_cadena = 'Coneticut Florida Georgia Massachusett Minnesota NJ NY Virginia TotalUSA Aruba Peru Colombia Jamaica Other'
FileWrite(li_FileNum,ls_cadena)

DECLARE GRUPO CURSOR FOR  
SELECT DISTINCT dba.branch.id_state, dba.state.name_state  
FROM dba.branch, dba.receiver, dba.state  
WHERE ( dba.branch.id_state = dba.state.id_state ) and  
      ( dba.branch.id_branch = dba.receiver.id_branch ) and  
      ( dba.branch.id_country = dba.state.id_country )   ;
		
Open GRUPO;
FETCH GRUPO INTO :ls_group, :ls_name ;

DO WHILE SQLCA.SQLCODE = 0
	
	///////////////  ECUADOR NUEVO  //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
	
		//***********************************PERU
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'USA' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_usa = string((ll_positivo + ll_neutro - ll_negativo))
	
	//***********************************EL SALVADOR
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
	
	//***********************************REPUBLICA DOMINICANA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'REP' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_rep = string((ll_positivo + ll_neutro - ll_negativo))
	
	//***********************************COSTA RICA
	SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'CST' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_cst = string((ll_positivo + ll_neutro - ll_negativo))
	
	//***********************************JAMAICA
		SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
	//***********************************COLOMBIA
		SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( (dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'COL' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_col = string((ll_positivo + ll_neutro - ll_negativo))
	//***********************************HONDURAS
		SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'HON' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_hon = string((ll_positivo + ll_neutro - ll_negativo))
	//***********************************NICARAGUA
		SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
   ls_nic = string((ll_positivo + ll_neutro - ll_negativo))
	//***********************************MEXICO
		SELECT count(dba.receiver.id_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
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
         ( ( dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
         ( dba.receiver.id_flag_receiver <> 'C' ) AND  
			( dba.receiver.id_flag_receiver <> 'A' ) AND 
         ( dba.receiver.id_country_receiver = 'MEX' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
   IF SQLCA.SQLCode = 100 or Isnull(ll_neutro) THEN
	   ll_neutro = 0
   END IF		
	

	SELECT count(dba.receiver.id_receiver)
   INTO :ll_negativo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( ( dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_receiver < 0 ) AND  
			( dba.receiver.id_flag_receiver = 'C' ) AND
			( dba.receiver.id_flag_receiver <> 'A' ) AND
         ( dba.receiver.id_country_receiver = 'MEX' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
			
	IF SQLCA.SQLCode = 100 THEN
	   ll_negativo = 0
   END IF			
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
	
//   ls_cadena = ls_group+','+ls_name+','+ls_ecu+','+ls_per+','+ls_usa+','+ls_ven+','+ls_rep+','+ls_cst+','+ls_pnm+','+ls_col+','+ls_oth+','+ls_hon+','+ls_nic+','+ls_mex
   ls_cadena = ls_group+','+ls_name+','+ls_col+','+ls_cst+','+ls_ecu+','+ls_els+','+ls_hon+','+ls_jam+','+ls_mex+','+ls_nic+','+ls_per+','+ls_rep+','+ls_usa+','+ls_oth
   FileWrite(li_FileNum,ls_cadena)

	FETCH GRUPO INTO :ls_group, :ls_name ;
LOOP
CLOSE GRUPO;
FileClose(li_FileNum)

SETPOINTER(ARROW!)

MESSAGEBOX("FINISH","OK")
end event

type cb_7 from commandbutton within w_statesvscountry
int X=3099
int Y=1196
int Width=352
int Height=108
int TabOrder=100
boolean BringToTop=true
string Text="Macro."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_group, ls_name, ls_ecu, ls_per, ls_usa, ls_els, ls_rep, ls_cst, ls_jam, ls_col, ls_hon, ls_nic, ls_mex, ls_oth
string ls_branch, ls_cadena, ls_state, ls_file
date   ld_fecha1, ld_fecha2
long   ll_negativo, li_FileNum
double ll_positivo
ld_fecha1 = date(em_fecha1.text)
ld_fecha2 = RelativeDate(date(em_fecha2.text),1)
MESSAGEBOX("File Name Is c:\dinero\files\STCOTOTA.txt","OK")
ls_file = 'c:\dinero\files\STCOTOTA.txt'
li_FileNum = FileOpen(ls_file,LineMode!, Write!, LockWrite!, Replace!)
ls_cadena = 'TOTALS STATES VS COUNTRY'
FileWrite(li_FileNum,ls_cadena)
//ls_cadena = 'State'+','+'payee Name'+','+'Ecuador'+','+'Peru'+','+'USA'+','+'Venezuela'+','+'R.D.'+','+'C.Rica'+','+'Panama'+','+'Colombia'+','+'Other'+','+'Honduras'+','+'Nicaragua'+','+'Mexico'+','+'Total'
ls_cadena = 'State'+','+'State/Country'+','+'Colombia'+','+'C.Rica'+','+'Ecuador'+','+'El Salvador'+','+'Honduras'+','+'Jamaica'+','+'Mexico'+','+'Nicaragua'+','+'Peru'+','+'R.D.'+','+'USA'+','+'Other'+','+'Total'
FileWrite(li_FileNum,ls_cadena)
ls_cadena = 'Se agrupan en Other los states diferentes a: 06 13 18 24 CT FL GA MA MN NJ NY VA' 
FileWrite(li_FileNum,ls_cadena)
ls_cadena = 'Coneticut Florida Georgia Massachusett Minnesota NJ NY Virginia TotalUSA Aruba Peru Colombia Jamaica Other'
FileWrite(li_FileNum,ls_cadena)
DECLARE GRUPO CURSOR FOR  
SELECT DISTINCT dba.branch.id_state, dba.state.name_state  
FROM dba.branch, dba.receiver, dba.state  
WHERE ( dba.branch.id_state = dba.state.id_state ) and  
      ( dba.branch.id_branch = dba.receiver.id_branch ) and  
      ( dba.branch.id_country = dba.state.id_country )   ;
Open GRUPO;
FETCH GRUPO INTO :ls_group, :ls_name ;
DO WHILE SQLCA.SQLCODE = 0
	//***********************************ECUADOR
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_state = :ls_group ) AND  
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
         ( (dba.branch.id_state = :ls_group ) AND  
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
         ( (dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'USA' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	ls_usa = string((ll_positivo ))
	//***********************************EL SALVADOR
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'ELS' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_els = string((ll_positivo ))
	//***********************************REPUBLICA DOMINICANA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_state = :ls_group ) AND  
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
         ( (dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'CST' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_cst = string((ll_positivo ))
	//***********************************JAMAICA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'JAM' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_jam = string((ll_positivo ))
	//***********************************COLOMBIA
	SELECT sum(dba.receiver.net_amount_receiver)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_state = :ls_group ) AND  
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
         ( (dba.branch.id_state = :ls_group ) AND  
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
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_state = :ls_group ) AND  
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
         ( (dba.branch.id_state = :ls_group ) AND  
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
         ( (dba.branch.id_state = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver <> 'MEX' ) AND
			( dba.receiver.id_country_receiver <> 'MXB' ) AND
			( dba.receiver.id_country_receiver <> 'MXT' ) AND  
			( dba.receiver.id_country_receiver <> 'ECU' ) AND  
			( dba.receiver.id_country_receiver <> 'PER' ) AND  
			( dba.receiver.id_country_receiver <> 'USA' ) AND  
			( dba.receiver.id_country_receiver <> 'ELS' ) AND  
			( dba.receiver.id_country_receiver <> 'REP' ) AND  
			( dba.receiver.id_country_receiver <> 'CST' ) AND  
			( dba.receiver.id_country_receiver <> 'JAM' ) AND  
			( dba.receiver.id_country_receiver <> 'COL' ) AND  
			( dba.receiver.id_country_receiver <> 'HON' ) AND  
			( dba.receiver.id_country_receiver <> 'NIC' ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 )  )  ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_oth = string((ll_positivo ))
//   ls_cadena = ls_group+','+ls_name+','+ls_ecu+','+ls_per+','+ls_usa+','+ls_ven+','+ls_rep+','+ls_cst+','+ls_pnm+','+ls_col+','+ls_oth+','+ls_hon+','+ls_nic+','+ls_mex
   ls_cadena = ls_group+','+ls_name+','+ls_col+','+ls_cst+','+ls_ecu+','+ls_els+','+ls_hon+','+ls_jam+','+ls_mex+','+ls_nic+','+ls_per+','+ls_rep+','+ls_usa+','+ls_oth
   FileWrite(li_FileNum,ls_cadena)

	FETCH GRUPO INTO :ls_group, :ls_name ;
LOOP
CLOSE GRUPO;
FileClose(li_FileNum)
MESSAGEBOX("FINISH","OK")
end event

