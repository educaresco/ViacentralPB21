$PBExportHeader$w_groupvscountry_payeecom.srw
forward
global type w_groupvscountry_payeecom from Window
end type
type cb_3 from commandbutton within w_groupvscountry_payeecom
end type
type cb_2 from commandbutton within w_groupvscountry_payeecom
end type
type cb_1 from commandbutton within w_groupvscountry_payeecom
end type
type dw_1 from datawindow within w_groupvscountry_payeecom
end type
type em_fecha2 from editmask within w_groupvscountry_payeecom
end type
type em_fecha1 from editmask within w_groupvscountry_payeecom
end type
type st_2 from statictext within w_groupvscountry_payeecom
end type
type st_1 from statictext within w_groupvscountry_payeecom
end type
end forward

global type w_groupvscountry_payeecom from Window
int X=823
int Y=360
int Width=3493
int Height=2032
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
global w_groupvscountry_payeecom w_groupvscountry_payeecom

on w_groupvscountry_payeecom.create
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

on w_groupvscountry_payeecom.destroy
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

type cb_3 from commandbutton within w_groupvscountry_payeecom
int X=3136
int Y=16
int Width=247
int Height=68
int TabOrder=30
string Text="Exit"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(w_groupvscountry_payeecom)
end event

type cb_2 from commandbutton within w_groupvscountry_payeecom
int X=2866
int Y=16
int Width=247
int Height=68
int TabOrder=30
string Text="Macro"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_group, ls_name, ls_ecu, ls_per, ls_usa, ls_ven, ls_rep, ls_cst, ls_pnm, ls_tipo
string ls_col, ls_oth, ls_hon, ls_nic, ls_mex
string ls_branch, ls_cadena, ls_state, ls_file
date   ld_fecha1, ld_fecha2
long   ll_negativo, li_FileNum
double ll_positivo

ld_fecha1 = date(em_fecha1.text)
ld_fecha2 = RelativeDate(date(em_fecha2.text),1)
MESSAGEBOX("File Name Is c:\GCPC.txt","OK")

ls_file = 'c:\GCPC.txt'
li_FileNum = FileOpen(ls_file,LineMode!, Write!, LockWrite!, Replace!)
ls_cadena = 'PAYEE COMMISSION GROUP VS COUNTRY'
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
   WHERE ( dba.group_branch.id_main_branch = dba.branch.id_main_branch ) and  
         ( ( dba.branch.id_type_branch <> 'P' ) AND (dba.branch.id_flag_branch = 'A'))   
ORDER BY dba.group_branch.type_group DESC,   
         dba.branch.id_main_branch ASC  ; 
Open GRUPO;


FETCH GRUPO INTO :ls_group, :ls_name, :ls_tipo ;
DO WHILE SQLCA.SQLCODE = 0
		if ls_group='0000' or ls_group='0002' or ls_group='0183' or ls_group='0185' then
		FETCH GRUPO INTO :ls_group, :ls_name, :ls_tipo ;
		CONTINUE
   end if		

	//***********************************ECUADOR
	
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver in ('ECU','PIC','ECC') ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF		

	ls_ecu = string((ll_positivo ))
	//***********************************PERU
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver in ('PER','PDB','PED') ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
		
	ls_per = string((ll_positivo ))
	//***********************************USA
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver in ('USA','US2')) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	ls_usa = string((ll_positivo ))
	//***********************************EL SALVADOR
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver in ('ELS','ELD','ESF','ELR') ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_ven = string((ll_positivo ))
	//***********************************REPUBLICA DOMINICANA
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver = 'RD') AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ) )   ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_rep = string((ll_positivo ))
	//***********************************COSTA RICA
   SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver in ('CSR','CRP') ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_cst = string((ll_positivo ))
	//***********************************BRASIL
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver IN ('BRA','BRD')) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_pnm = string((ll_positivo ))
	//***********************************COLOMBIA
	SELECT sum(dba.receiver.commission_payee)
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
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver IN ('HON','HOD') ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 )  )  ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_hon = string((ll_positivo ))
	//***********************************NICARAGUA
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver IN ('NI','NID') ) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_nic = string((ll_positivo ))
	//***********************************MEXICO
	SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver IN ('MEX','MBN','BAN','SEFI','MXD')) AND  
         ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 ))    ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	ls_mex = string((ll_positivo ))

	//***********************************OTHERS
   SELECT sum(dba.receiver.commission_payee)
   INTO :ll_positivo
   FROM dba.branch, dba.receiver  
   WHERE ( dba.branch.id_branch = dba.receiver.id_branch ) and  
         ( (dba.branch.id_main_branch = :ls_group ) AND  
         ( dba.receiver.id_flag_receiver <> 'A' ) AND  
         ( dba.receiver.id_country_receiver NOT IN ('ECU','PIC','ECC','PER','PDB','PED','USA','US2','ELS','ELD','ESF','ELR','RD','CSR','CRP','BRA','BRD','COL','HON','HOD','NI','NID','MEX','MBN','BAN','SEFI','MXD')) AND
	      ( dba.receiver.date_receiver >= :ld_fecha1 ) AND  
         ( dba.receiver.date_receiver <= :ld_fecha2 )  )  ;
   IF isnull(ll_positivo) then
	   ll_positivo = 0
   END IF	
	
	ls_oth = string((ll_positivo ))
//   ls_cadena = ls_group+','+ls_name+','+ls_ecu+','+ls_per+','+ls_usa+','+ls_ven+','+ls_rep+','+ls_cst+','+ls_pnm+','+ls_col+','+ls_oth+','+ls_hon+','+ls_nic+','+ls_mex
ls_cadena = ls_group+','+ls_name+','+ls_col+','+ls_cst+','+ls_ecu+','+ls_ven+','+ls_hon+','+ls_pnm+','+ls_mex+','+ls_nic+','+ls_per+','+ls_rep+','+ls_usa+','+ls_oth
   FileWrite(li_FileNum,ls_cadena)

	FETCH GRUPO INTO :ls_group, :ls_name, :ls_tipo ;
LOOP
CLOSE GRUPO;
FileClose(li_FileNum)
MESSAGEBOX("FINISH","OK")
end event

type cb_1 from commandbutton within w_groupvscountry_payeecom
int X=2592
int Y=16
int Width=247
int Height=68
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

type dw_1 from datawindow within w_groupvscountry_payeecom
int X=27
int Y=96
int Width=3406
int Height=1812
int TabOrder=50
string DataObject="dw_grupovscountry_pc"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type em_fecha2 from editmask within w_groupvscountry_payeecom
int X=635
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
dw_1.Retrieve(datetime(date(em_fecha1.text),time("00:00:00")),datetime(date(em_fecha2.text),time("23:59:59")))
end event

type em_fecha1 from editmask within w_groupvscountry_payeecom
int X=201
int Width=315
int Height=80
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

type st_2 from statictext within w_groupvscountry_payeecom
int X=526
int Width=105
int Height=80
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

type st_1 from statictext within w_groupvscountry_payeecom
int X=50
int Width=247
int Height=80
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

