$PBExportHeader$w_calling_card.srw
forward
global type w_calling_card from window
end type
type cb_5 from commandbutton within w_calling_card
end type
type st_8 from statictext within w_calling_card
end type
type sle_resendbranch from singlelineedit within w_calling_card
end type
type cb_resend from commandbutton within w_calling_card
end type
type cbx_allpayer from checkbox within w_calling_card
end type
type dw_payersel from datawindow within w_calling_card
end type
type cb_rempayer from commandbutton within w_calling_card
end type
type cb_addpayer from commandbutton within w_calling_card
end type
type dw_payerunsel from datawindow within w_calling_card
end type
type st_15 from statictext within w_calling_card
end type
type st_14 from statictext within w_calling_card
end type
type cbx_allcountry from checkbox within w_calling_card
end type
type st_11 from statictext within w_calling_card
end type
type cb_remcountry from commandbutton within w_calling_card
end type
type cb_addcountry from commandbutton within w_calling_card
end type
type dw_countryunsel from datawindow within w_calling_card
end type
type st_7 from statictext within w_calling_card
end type
type st_10 from statictext within w_calling_card
end type
type st_1 from statictext within w_calling_card
end type
type st_2 from statictext within w_calling_card
end type
type sle_1 from singlelineedit within w_calling_card
end type
type cb_8 from commandbutton within w_calling_card
end type
type sle_6 from singlelineedit within w_calling_card
end type
type st_9 from statictext within w_calling_card
end type
type sle_branchcode from singlelineedit within w_calling_card
end type
type cb_6 from commandbutton within w_calling_card
end type
type cb_2 from commandbutton within w_calling_card
end type
type sle_5 from singlelineedit within w_calling_card
end type
type st_6 from statictext within w_calling_card
end type
type st_4 from statictext within w_calling_card
end type
type sle_4 from singlelineedit within w_calling_card
end type
type sle_2 from singlelineedit within w_calling_card
end type
type st_3 from statictext within w_calling_card
end type
type sle_8 from singlelineedit within w_calling_card
end type
type cb_3 from commandbutton within w_calling_card
end type
type sle_3 from singlelineedit within w_calling_card
end type
type st_5 from statictext within w_calling_card
end type
type cb_4 from commandbutton within w_calling_card
end type
type cb_1 from commandbutton within w_calling_card
end type
type dw_2 from datawindow within w_calling_card
end type
type dw_1 from datawindow within w_calling_card
end type
type gb_3 from groupbox within w_calling_card
end type
type gb_2 from groupbox within w_calling_card
end type
type gb_1 from groupbox within w_calling_card
end type
type dw_countrysel from datawindow within w_calling_card
end type
type gb_4 from groupbox within w_calling_card
end type
end forward

global type w_calling_card from window
integer x = 823
integer y = 360
integer width = 2432
integer height = 2132
boolean titlebar = true
string title = "Calling Cards"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_5 cb_5
st_8 st_8
sle_resendbranch sle_resendbranch
cb_resend cb_resend
cbx_allpayer cbx_allpayer
dw_payersel dw_payersel
cb_rempayer cb_rempayer
cb_addpayer cb_addpayer
dw_payerunsel dw_payerunsel
st_15 st_15
st_14 st_14
cbx_allcountry cbx_allcountry
st_11 st_11
cb_remcountry cb_remcountry
cb_addcountry cb_addcountry
dw_countryunsel dw_countryunsel
st_7 st_7
st_10 st_10
st_1 st_1
st_2 st_2
sle_1 sle_1
cb_8 cb_8
sle_6 sle_6
st_9 st_9
sle_branchcode sle_branchcode
cb_6 cb_6
cb_2 cb_2
sle_5 sle_5
st_6 st_6
st_4 st_4
sle_4 sle_4
sle_2 sle_2
st_3 st_3
sle_8 sle_8
cb_3 cb_3
sle_3 sle_3
st_5 st_5
cb_4 cb_4
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
dw_countrysel dw_countrysel
gb_4 gb_4
end type
global w_calling_card w_calling_card

forward prototypes
public subroutine fn_refreshcountries ()
public subroutine fn_refreshpayers ()
public subroutine fn_refreshtollfree ()
end prototypes

public subroutine fn_refreshcountries ();string ls_codigo
string ls_to_countries
ls_codigo = sle_5.text

dw_countryunsel.retrieve(ls_codigo)
dw_countrysel.retrieve(ls_codigo)

SELECT TO_COUNTRIES
INTO :ls_to_countries
FROM dba.TOLLFREE
WHERE dba.TOLLFREE.COD_COMPANY = :ls_codigo;

if trim(ls_to_countries) = '*ANY COUNTRY*' then
	cbx_allcountry.checked = TRUE
	dw_countrysel.SelectRow(0, FALSE)
	dw_countryunsel.SelectRow(0, FALSE)
	dw_countrysel.enabled = false
	dw_countryunsel.enabled = false
	cb_addcountry.enabled = false
	cb_remcountry.enabled = false
end if

end subroutine

public subroutine fn_refreshpayers ();string ls_codigo
string ls_to_payers
ls_codigo = sle_5.text

dw_payerunsel.retrieve(ls_codigo)
dw_payersel.retrieve(ls_codigo)

SELECT TO_PAYERS
INTO :ls_to_payers
FROM dba.TOLLFREE
WHERE dba.TOLLFREE.COD_COMPANY = :ls_codigo;

if trim(ls_to_payers) = '*ANY PAYER*' then
	cbx_allpayer.checked = TRUE
	dw_payersel.SelectRow(0, FALSE)
	dw_payerunsel.SelectRow(0, FALSE)
	dw_payersel.enabled = false
	dw_payerunsel.enabled = false
	cb_addpayer.enabled = false
	cb_rempayer.enabled = false
end if
end subroutine

public subroutine fn_refreshtollfree ();long ll_row
ll_row = dw_1.getrow()
dw_1.retrieve()
dw_1.scrolltorow(ll_row)
end subroutine

on w_calling_card.create
this.cb_5=create cb_5
this.st_8=create st_8
this.sle_resendbranch=create sle_resendbranch
this.cb_resend=create cb_resend
this.cbx_allpayer=create cbx_allpayer
this.dw_payersel=create dw_payersel
this.cb_rempayer=create cb_rempayer
this.cb_addpayer=create cb_addpayer
this.dw_payerunsel=create dw_payerunsel
this.st_15=create st_15
this.st_14=create st_14
this.cbx_allcountry=create cbx_allcountry
this.st_11=create st_11
this.cb_remcountry=create cb_remcountry
this.cb_addcountry=create cb_addcountry
this.dw_countryunsel=create dw_countryunsel
this.st_7=create st_7
this.st_10=create st_10
this.st_1=create st_1
this.st_2=create st_2
this.sle_1=create sle_1
this.cb_8=create cb_8
this.sle_6=create sle_6
this.st_9=create st_9
this.sle_branchcode=create sle_branchcode
this.cb_6=create cb_6
this.cb_2=create cb_2
this.sle_5=create sle_5
this.st_6=create st_6
this.st_4=create st_4
this.sle_4=create sle_4
this.sle_2=create sle_2
this.st_3=create st_3
this.sle_8=create sle_8
this.cb_3=create cb_3
this.sle_3=create sle_3
this.st_5=create st_5
this.cb_4=create cb_4
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_countrysel=create dw_countrysel
this.gb_4=create gb_4
this.Control[]={this.cb_5,&
this.st_8,&
this.sle_resendbranch,&
this.cb_resend,&
this.cbx_allpayer,&
this.dw_payersel,&
this.cb_rempayer,&
this.cb_addpayer,&
this.dw_payerunsel,&
this.st_15,&
this.st_14,&
this.cbx_allcountry,&
this.st_11,&
this.cb_remcountry,&
this.cb_addcountry,&
this.dw_countryunsel,&
this.st_7,&
this.st_10,&
this.st_1,&
this.st_2,&
this.sle_1,&
this.cb_8,&
this.sle_6,&
this.st_9,&
this.sle_branchcode,&
this.cb_6,&
this.cb_2,&
this.sle_5,&
this.st_6,&
this.st_4,&
this.sle_4,&
this.sle_2,&
this.st_3,&
this.sle_8,&
this.cb_3,&
this.sle_3,&
this.st_5,&
this.cb_4,&
this.cb_1,&
this.dw_2,&
this.dw_1,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.dw_countrysel,&
this.gb_4}
end on

on w_calling_card.destroy
destroy(this.cb_5)
destroy(this.st_8)
destroy(this.sle_resendbranch)
destroy(this.cb_resend)
destroy(this.cbx_allpayer)
destroy(this.dw_payersel)
destroy(this.cb_rempayer)
destroy(this.cb_addpayer)
destroy(this.dw_payerunsel)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.cbx_allcountry)
destroy(this.st_11)
destroy(this.cb_remcountry)
destroy(this.cb_addcountry)
destroy(this.dw_countryunsel)
destroy(this.st_7)
destroy(this.st_10)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.cb_8)
destroy(this.sle_6)
destroy(this.st_9)
destroy(this.sle_branchcode)
destroy(this.cb_6)
destroy(this.cb_2)
destroy(this.sle_5)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.sle_4)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.sle_8)
destroy(this.cb_3)
destroy(this.sle_3)
destroy(this.st_5)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_countrysel)
destroy(this.gb_4)
end on

event open;dw_1.SETTRANSOBJECT(SQLCA)

dw_2.SETTRANSOBJECT(SQLCA)


dw_1.retrieve()
//dw_2.retrieve()
end event

type cb_5 from commandbutton within w_calling_card
integer x = 27
integer y = 1916
integer width = 1253
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Re-Send Pines to All"
end type

event clicked;SetPointer(HourGlass!)
 
string ls_cod_company, ls_pin_number, ls_id_branch, ls_flag_trans, ls_flag_uso, ls_id_country, ls_prepare_pin
double rownbr , i, ld_cantidad, ld_numerodepines
datetime   ld_fecha  
string ls_fecha, ls_hora, ls_output, cadena, MI_BRANCH, ls_tmp, ls_filename, ls_id_flag_branch, ls_id_type_branch
integer li_file
string	ls_propia, ls_compania
date		ld_fecha1
long	ll_cont
string ls_to_countries, ls_to_payers, ls_codigo
 
 ll_cont = 0
 
 DECLARE branches CURSOR FOR  
 SELECT DISTINCT ID_BRANCH FROM dba.callingcard where flag_uso = 'N' ORDER BY ID_BRANCH;
 
 open branches;
 
 fetch branches into :ls_id_branch;
 
 DO WHILE SQLCA.SQLCODE = 0 
 
	 this.text = ls_id_branch
 				
			// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			// Valida que la agencia este activa y pueda recibir pines
			SELECT dba.branch.id_country,   
					 dba.branch.id_flag_branch,   
					 dba.branch.id_type_branch,   
					 dba.branch.prepare_pin  
			 INTO :ls_id_country,
					:ls_id_flag_branch,   
					:ls_id_type_branch,   
					:ls_prepare_pin
			 FROM dba.branch  
			WHERE dba.branch.id_branch = :ls_id_branch;
				
			IF SQLCA.SQLCODE <> 0 THEN
				
				//continue
				//MESSAGEBOX('Error',SQLCA.SQLERRTEXT,StopSign!)
				return
			END IF
			
			string ls_version
			date ld_version
			
			select version 
			into :ls_version
			from dba.version_programa
			where ib_branch = :ls_id_branch;
			
			if not isnull(ls_version) and isdate(trim(ls_version)) then
				ld_version = date(trim(ls_version))
				if ld_version < date('02/11/2005') then
					
					//continue
					//messagebox("Error","Esta Agencia tiene una version que no soporta PINES TELEFONICOS.~nPor favor actualicela a una version igual o mayor a 02/11/2005.",StopSign!)
					//return		
				end if	
			else
				messagebox("Error","Esta Agencia No Parece tener ViaCash.",StopSign!)
				return
			end if
			
			ls_id_country 		= TRIM(ls_id_country)
			ls_id_flag_branch = TRIM(ls_id_flag_branch)
			ls_id_type_branch = TRIM(ls_id_type_branch)
			ls_prepare_pin 	= TRIM(ls_prepare_pin)
				
			IF ls_id_country <> 'USA' OR ls_id_flag_branch <> 'A' OR ls_id_type_branch = 'P' OR ls_prepare_pin = 'N'  THEN
				//MESSAGEBOX("Error","Esta Agencia no esta configurada para asignacion de pines.~nRevise la pantalla de Agencias",StopSign!)		
				//return
				//continue
			END IF
			// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			
			
			// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			// Genera el archivo para la agencia
			SELECT dba.parametros.dir_output  
			INTO   :ls_output  
			FROM   dba.parametros  ;
			
			IF SQLCA.SQLCODE <> 0 THEN
				//MESSAGEBOX('Error Parameters',SQLCA.SQLERRTEXT,StopSign!)
				//continue
			END IF						

			// ?????????????????????????????????????????????????
			// Para Eliminar los pines que tengan sin usar
			ls_tmp=FILL('0',10 - LEN(TRIM(ls_id_branch)))+TRIM(ls_id_branch)+".sql"
			ls_filename = trim(ls_output)+"PIN"+LS_TMP
			li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Append!)
			FileWrite(li_file, "SET option on_error = CONTINUE;");
			
			/////////FileWrite(li_file, "DELETE FROM callingcard WHERE flag_uso <> 'U' AND pin_number not in (select pin_number from receiver);");			
			
			FileClose(li_file)
			// ?????????????????????????????????????????????????
			
			DECLARE PINES CURSOR FOR  
			SELECT  dba.callingcard.cod_company,   
					  dba.callingcard.pin_number,   
					  dba.callingcard.id_branch,   
					  dba.callingcard.flag_trans,   
					  dba.callingcard.flag_uso,   
					  dba.callingcard.fecha,
					  dba.callingcard.to_countries,
					  dba.callingcard.to_payers		  
			FROM    dba.callingcard  
			WHERE ( dba.callingcard.flag_trans = 'T' ) AND  
					( dba.callingcard.flag_uso <> 'U' ) and
					( dba.callingcard.id_branch = :ls_id_branch )
			ORDER BY dba.callingcard.id_branch ASC  ;
			
			IF SQLCA.SQLCODE <> 0 THEN
				//MESSAGEBOX('',SQLCA.SQLERRTEXT,StopSign!)
				//continue
			END IF
			
			Open PINES;
			
			ls_fecha = String(Today(), "yyyy-mm-dd")
			ls_hora  = string(Now(),"HHMM")							
			
			string ls_precompany
			
			ls_precompany = ''
			FETCH PINES into :ls_cod_company, :ls_pin_number, :ls_id_branch, :ls_flag_trans , :ls_flag_uso, :ld_fecha, :ls_to_countries, :ls_to_payers ;
			DO WHILE SQLCA.SQLCODE = 0 
				
				this.text = ls_id_branch + " " + ls_pin_number
				
				ld_fecha1 = date(ld_fecha)
				
				ls_cod_company  	= TRIM(ls_cod_company)
				ls_pin_number  	= TRIM(ls_pin_number)
				ls_id_branch  		= TRIM(ls_id_branch)
				ls_flag_trans  	= TRIM(ls_flag_trans)
				ls_flag_uso  		= TRIM(ls_flag_uso)
				ls_fecha  			= TRIM(ls_fecha)
				ls_to_countries   = TRIM(ls_to_countries)
				ls_to_payers		= TRIM(ls_to_payers)
				
				
				//st_1.text = string(ll_cont)
				ls_flag_trans = 'N'
				ls_flag_uso = 'N'
				cadena  =  'INSERT INTO dba.callingcard (cod_company, pin_number, id_branch, flag_trans, flag_uso, fecha, to_countries, to_payers)'
				cadena += 'VALUES ('+"'"+ls_cod_company+"','"+ls_pin_number+"','"+ls_id_branch+"','"+ls_flag_trans+"','"+ls_flag_uso+"','"+ls_fecha+"','"+ls_to_countries+"','"+ls_to_payers+"');"
				ls_tmp=FILL('0',10 - LEN(TRIM(ls_id_branch)))+TRIM(ls_id_branch)+".sql"
				ls_filename = trim(ls_output)+"PIN"+LS_TMP
				li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Append!)
				
				if ls_precompany <> ls_cod_company then		
					ls_precompany = ls_cod_company
					string ls_phone, ls_namecompany
					select name_company, phone
					into :ls_namecompany, :ls_phone
					from dba.tollfree
					where dba.tollfree.cod_company = :ls_cod_company;					
					FileWrite(li_file, "INSERT INTO tollfree (cod_company,name_company,phone,to_countries,to_payers) VALUES ('"+trim(ls_cod_company)+"','"+trim(ls_namecompany)+"','"+trim(ls_phone)+"','"+trim(ls_to_countries)+"','"+trim(ls_to_payers)+"');");
				end if	
				
				FileWrite(li_file, cadena)
				FileClose(li_file)
			
				ll_cont = ll_cont + 1
				FETCH PINES into :ls_cod_company, :ls_pin_number, :ls_id_branch, :ls_flag_trans , :ls_flag_uso, :ld_fecha, :ls_to_countries, :ls_to_payers ;
			
			LOOP	
			// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>						
			
			//Messagebox("Process Completed","Un total de "+string(ld_numerodepines)+" pines fueron retransmitidos to "+sle_resendbranch.text+".",Information!)
			
			ls_tmp=FILL('0',10 - LEN(TRIM(ls_id_branch)))+TRIM(ls_id_branch)+".sql"
			ls_filename = trim(ls_output)+"PIN"+LS_TMP
			li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Append!)
			FileWrite(li_file, "COMMIT;");
			FileClose(li_file)
		
			
			CLOSE PINES;

 fetch branches into :ls_id_branch;
loop

close branches;

this.text = "Re-Send Pines to All"

Messagebox("Process Completed","Process Completed, "+string(ll_cont)+" Pins were re-send.",Information!)

SetPointer(Arrow!)

end event

type st_8 from statictext within w_calling_card
integer x = 119
integer y = 1776
integer width = 247
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_resendbranch from singlelineedit within w_calling_card
integer x = 379
integer y = 1772
integer width = 270
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cb_resend from commandbutton within w_calling_card
integer x = 736
integer y = 1768
integer width = 448
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Re-Send Pines"
end type

event clicked;SetPointer(HourGlass!)
 
string ls_cod_company, ls_pin_number, ls_id_branch, ls_flag_trans, ls_flag_uso, ls_id_country, ls_prepare_pin
double rownbr , i, ld_cantidad, ld_numerodepines
datetime   ld_fecha  
string ls_fecha, ls_hora, ls_output, cadena, MI_BRANCH, ls_tmp, ls_filename, ls_id_flag_branch, ls_id_type_branch
integer li_file
string	ls_propia, ls_compania
date		ld_fecha1
long	ll_cont
string ls_to_countries, ls_to_payers, ls_codigo
 
If sle_resendbranch.text = '' or Isnull(sle_resendbranch.text) then 
	Messagebox("Error","Branch Inexistente")
	return
end if


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Valida que la agencia este activa y pueda recibir pines
SELECT dba.branch.id_country,   
		 dba.branch.id_flag_branch,   
		 dba.branch.id_type_branch,   
		 dba.branch.prepare_pin  
 INTO :ls_id_country,
		:ls_id_flag_branch,   
		:ls_id_type_branch,   
		:ls_prepare_pin
 FROM dba.branch  
WHERE dba.branch.id_branch = :sle_resendbranch.text;
	
IF SQLCA.SQLCODE <> 0 THEN
	MESSAGEBOX('Error',SQLCA.SQLERRTEXT,StopSign!)
	return
END IF

string ls_version
date ld_version

select version 
into :ls_version
from dba.version_programa
where ib_branch = :sle_resendbranch.text;

if not isnull(ls_version) and isdate(trim(ls_version)) then
	ld_version = date(trim(ls_version))
	if ld_version < date('02/11/2005') then
		messagebox("Error","Esta Agencia tiene una version que no soporta PINES TELEFONICOS.~nPor favor actualicela a una version igual o mayor a 02/11/2005.",StopSign!)
		return		
	end if	
else
	messagebox("Error","Esta Agencia No Parece tener ViaCash.",StopSign!)
	return
end if

ls_id_country 		= TRIM(ls_id_country)
ls_id_flag_branch = TRIM(ls_id_flag_branch)
ls_id_type_branch = TRIM(ls_id_type_branch)
ls_prepare_pin 	= TRIM(ls_prepare_pin)
	
IF ls_id_country <> 'USA' OR ls_id_flag_branch <> 'A' OR ls_id_type_branch = 'P' OR ls_prepare_pin = 'N'  THEN
	MESSAGEBOX("Error","Esta Agencia no esta configurada para asignacion de pines.~nRevise la pantalla de Agencias",StopSign!)		
	return
END IF
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Genera el archivo para la agencia
SELECT dba.parametros.dir_output  
INTO   :ls_output  
FROM   dba.parametros  ;

IF SQLCA.SQLCODE <> 0 THEN
	MESSAGEBOX('Error Parameters',SQLCA.SQLERRTEXT,StopSign!)
END IF

ls_id_branch = trim(sle_resendbranch.text)

DECLARE PINES CURSOR FOR  
SELECT  dba.callingcard.cod_company,   
        dba.callingcard.pin_number,   
        dba.callingcard.id_branch,   
        dba.callingcard.flag_trans,   
        dba.callingcard.flag_uso,   
        dba.callingcard.fecha,
		  dba.callingcard.to_countries,
		  dba.callingcard.to_payers		  
FROM    dba.callingcard  
WHERE ( dba.callingcard.flag_trans = 'T' ) AND  
      ( dba.callingcard.flag_uso <> 'U' ) and
		( dba.callingcard.id_branch = :ls_id_branch )
ORDER BY dba.callingcard.id_branch ASC  ;

IF SQLCA.SQLCODE <> 0 THEN
	MESSAGEBOX('',SQLCA.SQLERRTEXT,StopSign!)
END IF

Open PINES;

ls_fecha = String(Today(), "yyyy-mm-dd")
ls_hora  = string(Now(),"HHMM")	

ll_cont = 1

string ls_precompany

ls_precompany = ''
FETCH PINES into :ls_cod_company, :ls_pin_number, :ls_id_branch, :ls_flag_trans , :ls_flag_uso, :ld_fecha, :ls_to_countries, :ls_to_payers ;
DO WHILE SQLCA.SQLCODE = 0 
	ld_fecha1 = date(ld_fecha)
	
	ls_cod_company  	= TRIM(ls_cod_company)
	ls_pin_number  	= TRIM(ls_pin_number)
	ls_id_branch  		= TRIM(ls_id_branch)
	ls_flag_trans  	= TRIM(ls_flag_trans)
	ls_flag_uso  		= TRIM(ls_flag_uso)
	ls_fecha  			= TRIM(ls_fecha)
	ls_to_countries   = TRIM(ls_to_countries)
	ls_to_payers		= TRIM(ls_to_payers)
	
	
	st_1.text = string(ll_cont)
	ls_flag_trans = 'N'
	ls_flag_uso = 'N'
	cadena  =  'INSERT INTO dba.callingcard (cod_company, pin_number, id_branch, flag_trans, flag_uso, fecha, to_countries, to_payers)'
   cadena += 'VALUES ('+"'"+ls_cod_company+"','"+ls_pin_number+"','"+ls_id_branch+"','"+ls_flag_trans+"','"+ls_flag_uso+"','"+ls_fecha+"','"+ls_to_countries+"','"+ls_to_payers+"');"
	ls_tmp=FILL('0',10 - LEN(TRIM(ls_id_branch)))+TRIM(ls_id_branch)+".sql"
	ls_filename = trim(ls_output)+"PIN"+LS_TMP
   li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Append!)
	
	if ls_precompany <> ls_cod_company then		
		ls_precompany = ls_cod_company
		string ls_phone, ls_namecompany
		select name_company, phone
		into :ls_namecompany, :ls_phone
		from dba.tollfree
		where dba.tollfree.cod_company = :ls_cod_company;
		FileWrite(li_file, "SET option on_error = CONTINUE;");
		FileWrite(li_file, "INSERT INTO tollfree (cod_company,name_company,phone,to_countries,to_payers) VALUES ('"+trim(ls_cod_company)+"','"+trim(ls_namecompany)+"','"+trim(ls_phone)+"','"+trim(ls_to_countries)+"','"+trim(ls_to_payers)+"');");
	end if	
	
	FileWrite(li_file, cadena)
	FileClose(li_file)

	ll_cont = ll_cont + 1
	FETCH PINES into :ls_cod_company, :ls_pin_number, :ls_id_branch, :ls_flag_trans , :ls_flag_uso, :ld_fecha, :ls_to_countries, :ls_to_payers ;

LOOP	
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

ld_numerodepines = ll_cont -1

Messagebox("Process Completed","Un total de "+string(ld_numerodepines)+" pines fueron retransmitidos to "+sle_resendbranch.text+".",Information!)

ls_tmp=FILL('0',10 - LEN(TRIM(ls_id_branch)))+TRIM(ls_id_branch)+".sql"
ls_filename = trim(ls_output)+"PIN"+LS_TMP
li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Append!)
FileWrite(li_file, "COMMIT;");
FileClose(li_file)

CLOSE PINES;

SetPointer(Arrow!)

end event

type cbx_allpayer from checkbox within w_calling_card
integer x = 1001
integer y = 964
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "All"
boolean lefttext = true
boolean righttoleft = true
end type

event clicked;
String ls_cod_company

// Tiene el codigo del tollfree company
ls_cod_company = sle_5.text

if this.checked = true then
	
  	UPDATE dba.TOLLFREE  
   SET TO_PAYERS = '*ANY PAYER*'
   WHERE dba.TOLLFREE.COD_COMPANY = :ls_cod_company;
	COMMIT;
	
	dw_payersel.SelectRow(0, FALSE)
	dw_payerunsel.SelectRow(0, FALSE)
	dw_payersel.enabled = false
	dw_payerunsel.enabled = false
	cb_addpayer.enabled = false
	cb_rempayer.enabled = false
else

  	UPDATE dba.TOLLFREE  
   SET TO_PAYERS = ''
   WHERE dba.TOLLFREE.COD_COMPANY = :ls_cod_company;
	COMMIT;
	
	cb_addpayer.enabled = true
	cb_rempayer.enabled = true
	dw_payersel.enabled = true
	dw_payerunsel.enabled = true
end if

fn_refreshpayers()
fn_refreshtollfree()
end event

type dw_payersel from datawindow within w_calling_card
integer x = 704
integer y = 1020
integer width = 549
integer height = 360
boolean bringtotop = true
string dataobject = "dw_tollfree_payerselected"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;Long ll_row

ll_row = this.GetClickedRow()

this.SelectRow(0, FALSE)
dw_payerunsel.SelectRow(0, FALSE)

if ll_row > 0 then
	this.SelectRow(ll_row, TRUE)
	this.setRow(ll_row)
	this.ScrollToRow(ll_row)
end if
end event

event constructor;SetTransObject(SQLCA)
end event

type cb_rempayer from commandbutton within w_calling_card
integer x = 613
integer y = 1204
integer width = 87
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<"
end type

event clicked;String ls_cod_company
String ls_id_payer

if NOT dw_payersel.IsSelected(dw_payersel.GetRow()) then
	MessageBox("Error","You must select a row first",StopSign!)
	return
end if

ls_cod_company = sle_5.text
ls_id_payer = "*"+trim(dw_payersel.getitemstring(dw_payersel.GetRow(),"group_branch_id_main_branch"))+"*"

UPDATE dba.TOLLFREE
SET TO_PAYERS = str_replace(isnull(TO_PAYERS,''),:ls_id_payer,'')
WHERE dba.TOLLFREE.COD_COMPANY = :ls_cod_company;
COMMIT;

fn_refreshtollfree()

fn_refreshpayers()
end event

type cb_addpayer from commandbutton within w_calling_card
integer x = 613
integer y = 1020
integer width = 87
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">"
end type

event clicked;String ls_cod_company
String ls_id_payer

if NOT dw_payerunsel.IsSelected(dw_payerunsel.GetRow()) then
	MessageBox("Error","You must select a row first",StopSign!)
	return
end if

ls_cod_company = sle_5.text
ls_id_payer = "*"+trim(dw_payerunsel.getitemstring(dw_payerunsel.GetRow(),"group_branch_id_main_branch"))+"*"

UPDATE dba.TOLLFREE
SET TO_PAYERS = isnull(TO_PAYERS,'')+:ls_id_payer
WHERE dba.TOLLFREE.COD_COMPANY = :ls_cod_company;

fn_refreshtollfree()

COMMIT;

fn_refreshpayers()
end event

type dw_payerunsel from datawindow within w_calling_card
integer x = 55
integer y = 1020
integer width = 549
integer height = 360
string dataobject = "dw_tollfree_payerunselected"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;Long ll_row

ll_row = this.GetClickedRow()

this.SelectRow(0, FALSE)
dw_payersel.SelectRow(0, FALSE)

if ll_row > 0 then
	this.SelectRow(ll_row, TRUE)
	this.setRow(ll_row)
	this.ScrollToRow(ll_row)
end if
end event

event constructor;SetTransObject(SQLCA)
end event

type st_15 from statictext within w_calling_card
integer x = 704
integer y = 964
integer width = 425
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Selected"
boolean focusrectangle = false
end type

type st_14 from statictext within w_calling_card
integer x = 55
integer y = 964
integer width = 425
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "No Selected"
boolean focusrectangle = false
end type

type cbx_allcountry from checkbox within w_calling_card
integer x = 1001
integer y = 460
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "All"
boolean lefttext = true
boolean righttoleft = true
end type

event clicked;
String ls_cod_company

// Tiene el codigo del tollfree company
ls_cod_company = sle_5.text

if this.checked = true then
	
  	UPDATE dba.TOLLFREE  
   SET TO_COUNTRIES = '*ANY COUNTRY*'
   WHERE dba.TOLLFREE.COD_COMPANY = :ls_cod_company;
	COMMIT;
	
	dw_countrysel.SelectRow(0, FALSE)
	dw_countryunsel.SelectRow(0, FALSE)
	dw_countrysel.enabled = false
	dw_countryunsel.enabled = false
	cb_addcountry.enabled = false
	cb_remcountry.enabled = false
else

  	UPDATE dba.TOLLFREE  
   SET TO_COUNTRIES = ''
   WHERE dba.TOLLFREE.COD_COMPANY = :ls_cod_company;
	COMMIT;
	
	cb_addcountry.enabled = true
	cb_remcountry.enabled = true
	dw_countrysel.enabled = true
	dw_countryunsel.enabled = true
end if

fn_refreshcountries()
fn_refreshtollfree()
end event

type st_11 from statictext within w_calling_card
integer x = 704
integer y = 460
integer width = 425
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Selected"
boolean focusrectangle = false
end type

type cb_remcountry from commandbutton within w_calling_card
integer x = 613
integer y = 700
integer width = 87
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<"
end type

event clicked;String ls_cod_company
String ls_id_country

if NOT dw_countrysel.IsSelected(dw_countrysel.GetRow()) then
	MessageBox("Error","You must select a row first",StopSign!)
	return
end if

ls_cod_company = sle_5.text
ls_id_country = "*"+trim(dw_countrysel.getitemstring(dw_countrysel.GetRow(),"country_id_country"))+"*"

UPDATE dba.TOLLFREE
SET TO_COUNTRIES = str_replace(isnull(TO_COUNTRIES,''),:ls_id_country,'')
WHERE dba.TOLLFREE.COD_COMPANY = :ls_cod_company;
COMMIT;

fn_refreshtollfree()

fn_refreshcountries()
end event

type cb_addcountry from commandbutton within w_calling_card
integer x = 613
integer y = 516
integer width = 87
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">"
end type

event clicked;String ls_cod_company
String ls_id_country

if NOT dw_countryunsel.IsSelected(dw_countryunsel.GetRow()) then
	MessageBox("Error","You must select a row first",StopSign!)
	return
end if

ls_cod_company = sle_5.text
ls_id_country = "*"+trim(dw_countryunsel.getitemstring(dw_countryunsel.GetRow(),"country_id_country"))+"*"

UPDATE dba.TOLLFREE
SET TO_COUNTRIES = isnull(TO_COUNTRIES,'')+:ls_id_country
WHERE dba.TOLLFREE.COD_COMPANY = :ls_cod_company;

fn_refreshtollfree()

COMMIT;

fn_refreshcountries()
end event

type dw_countryunsel from datawindow within w_calling_card
integer x = 55
integer y = 516
integer width = 549
integer height = 360
string dataobject = "dw_tollfree_countryunselected"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;Long ll_row

ll_row = this.GetClickedRow()

this.SelectRow(0, FALSE)
dw_countrysel.SelectRow(0, FALSE)

if ll_row > 0 then
	this.SelectRow(ll_row, TRUE)
	this.setRow(ll_row)
	this.ScrollToRow(ll_row)
end if
end event

type st_7 from statictext within w_calling_card
integer x = 55
integer y = 460
integer width = 425
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "No Selected"
boolean focusrectangle = false
end type

type st_10 from statictext within w_calling_card
integer x = 736
integer y = 1496
integer width = 197
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Count :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_calling_card
integer x = 965
integer y = 1496
integer width = 219
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 8421504
boolean enabled = false
string text = "0"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_2 from statictext within w_calling_card
integer x = 114
integer y = 1500
integer width = 251
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Quantity :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_calling_card
integer x = 379
integer y = 1496
integer width = 270
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_8 from commandbutton within w_calling_card
integer x = 2939
integer y = 1800
integer width = 421
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Control Pin"
end type

event clicked;Open(w_control_pines)
end event

type sle_6 from singlelineedit within w_calling_card
integer x = 2107
integer y = 448
integer width = 169
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "0"
boolean autohscroll = false
end type

type st_9 from statictext within w_calling_card
integer x = 119
integer y = 1584
integer width = 247
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Branch :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_branchcode from singlelineedit within w_calling_card
integer x = 379
integer y = 1580
integer width = 270
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_calling_card
integer x = 736
integer y = 1572
integer width = 448
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Asing To Branch"
end type

event clicked;SetPointer(HourGlass!)
 
string ls_cod_company, ls_pin_number, ls_id_branch, ls_flag_trans, ls_flag_uso, ls_id_country, ls_prepare_pin
double rownbr , i, ld_cantidad, ld_numerodepines
datetime   ld_fecha  
string ls_fecha, ls_hora, ls_output, cadena, MI_BRANCH, ls_tmp, ls_filename, ls_id_flag_branch, ls_id_type_branch
integer li_file
string	ls_propia, ls_compania
date		ld_fecha1
long	ll_cont
string ls_to_countries, ls_to_payers, ls_codigo
 
If sle_branchcode.text = '' or Isnull(sle_branchcode.text) then 
	Messagebox("Error","Branch Inexistente")
	return
end if

if not isnumber(sle_1.text) then
	messagebox("Error","Debe especificar un numero en Cantidad",StopSign!)
	return
end if

ld_cantidad = double(sle_1.text);
 
if ld_cantidad > 100 then
	messagebox("Error","Debe asignar menos de 100 pines",StopSign!)
	return
end if

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Valida que la agencia este activa y pueda recibir pines
SELECT dba.branch.id_country,   
		 dba.branch.id_flag_branch,   
		 dba.branch.id_type_branch,   
		 dba.branch.prepare_pin  
 INTO :ls_id_country,
		:ls_id_flag_branch,   
		:ls_id_type_branch,   
		:ls_prepare_pin
 FROM dba.branch  
WHERE dba.branch.id_branch = :sle_branchcode.text;
	
IF SQLCA.SQLCODE <> 0 THEN
	MESSAGEBOX('Error',SQLCA.SQLERRTEXT,StopSign!)
	return
END IF

string ls_version
date ld_version

select version 
into :ls_version
from dba.version_programa
where ib_branch = :sle_branchcode.text;

if not isnull(ls_version) and isdate(trim(ls_version)) then
	ld_version = date(trim(ls_version))
	if ld_version < date('02/11/2005') then
		messagebox("Error","Esta Agencia tiene una version que no soporta PINES TELEFONICOS.~nPor favor actualicela a una version igual o mayor a 02/11/2005.",StopSign!)
		return		
	end if	
else
	messagebox("Error","Esta Agencia No Parece tener ViaCash.",StopSign!)
	return
end if

ls_id_country 		= TRIM(ls_id_country)
ls_id_flag_branch = TRIM(ls_id_flag_branch)
ls_id_type_branch = TRIM(ls_id_type_branch)
ls_prepare_pin 	= TRIM(ls_prepare_pin)
	
IF ls_id_country <> 'USA' OR ls_id_flag_branch <> 'A' OR ls_id_type_branch = 'P' OR ls_prepare_pin = 'N'  THEN
	MESSAGEBOX("Error","Esta Agencia no esta configurada para asignacion de pines.~nRevise la pantalla de Agencias",StopSign!)		
	return
END IF
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Valida el lote de pines, que tenga pines y que tenga pais/pagador
i = 1
rownbr = dw_2.rowcount()

if rownbr = 0 then
	Messagebox("Error","No hay pines en este Lote de pines",StopSign!)
	return
end if

ls_propia 		= fn_agencia_propia(sle_branchcode.text)
ls_compania 	= dw_2.getitemstring(1,"cod_company")
ls_id_branch 	= sle_branchcode.text
ls_id_branch 	= trim(ls_id_branch)
ls_propia 		= TRIM(ls_propia)
ls_compania		= TRIM(ls_compania)
	
ls_codigo = sle_5.text

SELECT TO_PAYERS, TO_COUNTRIES
INTO :ls_to_payers, :ls_to_countries
FROM dba.TOLLFREE
WHERE dba.TOLLFREE.COD_COMPANY = :ls_codigo;	

ls_to_payers = trim(ls_to_payers)
ls_to_countries = trim(ls_to_countries)	

if isnull(ls_to_payers) or isnull(ls_to_countries) or ls_to_payers = '' or ls_to_countries = '' then
	Messagebox("Error","Este lote de pines no tiene Pagador/Pais configurado",StopSign!)
	return		
end if		
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Asigna los pines
ld_numerodepines = 1
   
DO WHILE i<= rownbr        
	dw_2.SetRow ( i )
   dw_2.SetItem(i, "id_branch", ls_id_branch)
	dw_2.SetItem(i, "to_countries", ls_to_countries)
	dw_2.SetItem(i, "to_payers", ls_to_payers)
	dw_2.SetItem(i, "flag_trans", 'N')
	dw_2.Update()
				
	commit ;
	i = i + 1
	
	IF ld_numerodepines >= ld_cantidad THEN
		EXIT
	END IF	
	
   ld_numerodepines = ld_numerodepines + 1
LOOP
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Genera el archivo para la agencia
SELECT dba.parametros.dir_output  
INTO   :ls_output  
FROM   dba.parametros  ;

IF SQLCA.SQLCODE <> 0 THEN
	MESSAGEBOX('Error Parameters',SQLCA.SQLERRTEXT,StopSign!)
END IF

DECLARE PINES CURSOR FOR  
SELECT  dba.callingcard.cod_company,   
        dba.callingcard.pin_number,   
        dba.callingcard.id_branch,   
        dba.callingcard.flag_trans,   
        dba.callingcard.flag_uso,   
        dba.callingcard.fecha  
FROM    dba.callingcard  
WHERE ( dba.callingcard.flag_trans <> 'T' ) AND
      ( dba.callingcard.flag_uso <> 'U' ) and
		( dba.callingcard.id_branch = :ls_id_branch )
ORDER BY dba.callingcard.id_branch ASC  ;

//  


IF SQLCA.SQLCODE <> 0 THEN
	MESSAGEBOX('',SQLCA.SQLERRTEXT,StopSign!)
END IF

Open PINES;

ls_fecha = String(Today(), "yyyy-mm-dd")
ls_hora  = string(Now(),"HHMM")	

ll_cont = 1

string ls_precompany

ls_precompany = ''
FETCH PINES into :ls_cod_company, :ls_pin_number, :ls_id_branch, :ls_flag_trans , :ls_flag_uso, :ld_fecha ;
DO WHILE SQLCA.SQLCODE = 0 
	ld_fecha1 = date(ld_fecha)

	UPDATE dba.callingcard  
   SET    dba.callingcard.flag_trans = 'T',   
          dba.callingcard.flag_uso = 'N',   
          dba.callingcard.fecha = GETDATE()  
   WHERE ( dba.callingcard.cod_company = :ls_cod_company ) AND  
         ( dba.callingcard.pin_number = :ls_pin_number ) AND  
         ( dba.callingcard.id_branch = :ls_id_branch );
			
	IF SQLCA.SQLCODE <> 0 THEN
		MESSAGEBOX('',SQLCA.SQLERRTEXT)
	END IF
		
	ls_cod_company  	= TRIM(ls_cod_company)
	ls_pin_number  	= TRIM(ls_pin_number)
	ls_id_branch  		= TRIM(ls_id_branch)
	ls_flag_trans  	= TRIM(ls_flag_trans)
	ls_flag_uso  		= TRIM(ls_flag_uso)
	ls_fecha  			= TRIM(ls_fecha)
	
	st_1.text = string(ll_cont)
	ls_flag_trans = 'N'
	ls_flag_uso = 'N'
	cadena  =  'INSERT INTO dba.callingcard (cod_company, pin_number, id_branch, flag_trans, flag_uso, fecha, to_countries, to_payers)'
   cadena += 'VALUES ('+"'"+ls_cod_company+"','"+ls_pin_number+"','"+ls_id_branch+"','"+ls_flag_trans+"','"+ls_flag_uso+"','"+ls_fecha+"','"+ls_to_countries+"','"+ls_to_payers+"');"
	ls_tmp=FILL('0',10 - LEN(TRIM(ls_id_branch)))+TRIM(ls_id_branch)+".sql"
	ls_filename = trim(ls_output)+"PIN"+LS_TMP
   li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Append!)
	
	if ls_precompany <> ls_cod_company then		
		ls_precompany = ls_cod_company
		string ls_phone, ls_namecompany
		select name_company, phone
		into :ls_namecompany, :ls_phone
		from dba.tollfree
		where dba.tollfree.cod_company = :ls_cod_company;
		FileWrite(li_file, "SET option on_error = CONTINUE;");
		FileWrite(li_file, "INSERT INTO tollfree (cod_company,name_company,phone,to_countries,to_payers) VALUES ('"+trim(ls_cod_company)+"','"+trim(ls_namecompany)+"','"+trim(ls_phone)+"','"+trim(ls_to_countries)+"','"+trim(ls_to_payers)+"');");
	end if	
	
	FileWrite(li_file, cadena)
	FileClose(li_file)

	ll_cont = ll_cont + 1
	FETCH PINES into :ls_cod_company, :ls_pin_number, :ls_id_branch, :ls_flag_trans , :ls_flag_uso, :ld_fecha ;

LOOP	
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Messagebox("Process Completed","Un total de "+string(ld_numerodepines)+" pines seran asignados a la agencia en su proxima transmision.",Information!)
FileWrite(li_file, "COMMIT;");

FileClose(li_file)

CLOSE PINES;

dw_2.update()
dw_2.retrieve(ls_codigo)
sle_6.text = string(dw_2.rowcount())

SetPointer(Arrow!)

end event

type cb_2 from commandbutton within w_calling_card
boolean visible = false
integer x = 2373
integer y = 760
integer width = 709
integer height = 184
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asign Pin To USA Branch~'s"
end type

event clicked; string ls_cod_company, ls_pin_number, ls_id_branch, ls_flag_trans, ls_flag_uso, ls_id_country, ls_prepare_pin
 double rownbr , i, ld_cantidad, ld_numerodepines
 date   ld_fecha  
 string ls_fecha, ls_hora, ls_output, cadena, MI_BRANCH, ls_tmp, ls_filename
 integer li_file
 
 ld_cantidad = double(sle_1.text);
 
 	If sle_branchcode.text <> '' or Not(Isnull(sle_branchcode.text)) then 
		Messagebox("Error","Verifique la Opcion")
	end if
 
 
 DECLARE BRANCH CURSOR FOR  
  SELECT "branch"."id_branch",   
         "branch"."id_country",   
         "branch"."prepare_pin"  
    FROM "branch"  
   WHERE ( "branch"."id_country" = 'USA' ) AND  
         ( "branch"."id_flag_branch" = 'A' ) AND
			( "branch"."id_type_branch" <> 'P' ) and
			( "branch"."prepare_pin" = 'Y') and
			( "branch"."id_branch" <> '0043') and
			( "branch"."id_branch" <> '0000');

Open BRANCH;

fetch BRANCH into :ls_id_branch, :ls_id_country, :ls_prepare_pin ;

i = 1
rownbr = dw_2.rowcount()

DO WHILE SQLCA.SQLCODE = 0       //**** MIENTRAN NOT EOF() BRANCH 
   
	ld_numerodepines = 1
   
	DO WHILE i<= rownbr           //**** MIENTRAS QUE EL PUNTERO NO LLEGUE AL FINAL DE LA DW
      
		dw_2.SetRow ( i )
	   dw_2.SetItem(i, "id_branch", ls_id_branch)
	   dw_2.Update()
	   i = i + 1
	
	   IF ld_numerodepines >= ld_cantidad THEN
	      EXIT
	   END IF	
	
      ld_numerodepines = ld_numerodepines + 1
	LOOP
	
	IF i >= rownbr THEN
		EXIT
	END IF	

   fetch BRANCH into :ls_id_branch, :ls_id_country, :ls_prepare_pin ;

LOOP	

Close BRANCH;

////*********** PREPARA ARCHIVOS PIN PARA LAS AGENCIAS DESPUES DE LA IMPORTACION Y ASIGNACION
SELECT "dba"."parametros"."dir_output"  
INTO   :ls_output  
FROM   "dba"."parametros"  ;

DECLARE PINES CURSOR FOR  
SELECT  "callingcard"."cod_company",   
        "callingcard"."pin_number",   
        "callingcard"."id_branch",   
        "callingcard"."flag_trans",   
        "callingcard"."flag_uso",   
        "callingcard"."fecha"  
FROM    "callingcard"  
WHERE ( "callingcard"."flag_trans" <> 'T' ) AND  
      ( "callingcard"."flag_uso" <> 'U' ) and
		( "callingcard"."id_branch" <> '0043' )
ORDER BY "callingcard"."id_branch" ASC  ;

Open PINES;
FETCH PINES into :ls_cod_company, :ls_pin_number, :ls_id_branch, :ls_flag_trans , :ls_flag_uso, :ld_fecha ;

ls_fecha = String(Today(), "yyyy-mm-dd")
ls_hora  = string(Now(),"HHMM")	

ls_tmp=FILL('0',10 - LEN(ls_id_branch))+ls_id_branch+left(String(ls_fecha),4)+left(ls_hora,4)+".sql"
ls_filename = trim(ls_output)+"PIN"+LS_TMP
li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Replace!)
MI_BRANCH = ls_id_branch

DO WHILE SQLCA.SQLCODE = 0  

	UPDATE "callingcard"  
   SET    "flag_trans" = 'T',   
          "flag_uso" = 'U',   
          "fecha" = today()  
   WHERE ( "callingcard"."cod_company" = :ls_cod_company ) AND  
         ( "callingcard"."pin_number" = :ls_pin_number ) AND  
         ( "callingcard"."id_branch" = :ls_id_branch )   ;
	
	ls_flag_trans = 'T'
	ls_flag_uso = 'A'
	cadena  =  'INSERT INTO dba.callingcard (cod_company, pin_number, id_branch, flag_trans, flag_uso, fecha)'
   cadena += 'VALUES ('+"'"+ls_cod_company+"','"+ls_pin_number+"','"+ls_id_branch+"','"+ls_flag_trans+"','"+ls_flag_uso+"','"+ls_fecha+"');"
   FileWrite(li_file, cadena)
	
	FETCH PINES into :ls_cod_company, :ls_pin_number, :ls_id_branch, :ls_flag_trans , :ls_flag_uso, :ld_fecha ;
	IF ls_id_branch <> MI_BRANCH THEN
		MI_BRANCH = ls_id_branch
      FileClose(li_file)
		ls_tmp=FILL('0',10 - LEN(ls_id_branch))+ls_id_branch+left(String(ls_fecha),4)+left(ls_hora,4)+".sql"
      ls_filename = trim(ls_output)+"PIN"+LS_TMP
      li_file=FileOpen(ls_filename,LineMode!,Write!,LockWrite!,Replace!)
   END IF
LOOP	

FileClose(li_file)	

CLOSE PINES;	

end event

type sle_5 from singlelineedit within w_calling_card
boolean visible = false
integer x = 475
integer y = 412
integer width = 183
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean border = false
boolean autohscroll = false
end type

type st_6 from statictext within w_calling_card
boolean visible = false
integer x = 1202
integer y = 1620
integer width = 421
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Total Assingned"
boolean focusrectangle = false
end type

type st_4 from statictext within w_calling_card
boolean visible = false
integer x = 1339
integer y = 1456
integer width = 265
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Total free"
boolean focusrectangle = false
end type

type sle_4 from singlelineedit within w_calling_card
boolean visible = false
integer x = 1650
integer y = 1604
integer width = 247
integer height = 92
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;double total_1, total_2, grndtotal


total_1 = dw_2.RowCount()

dw_2.setfilter("isnull(id_branch)")

total_2 = dw_2.RowCount()

grndtotal = total_1 - total_2

dw_2.setfilter("")



end event

type sle_2 from singlelineedit within w_calling_card
boolean visible = false
integer x = 1646
integer y = 1432
integer width = 247
integer height = 92
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;double total

dw_2.setfilter("isnull(id_branch)")

total = dw_2.RowCount()
dw_2.setfilter("")
end event

type st_3 from statictext within w_calling_card
boolean visible = false
integer x = 73
integer y = 1588
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Total"
boolean focusrectangle = false
end type

type sle_8 from singlelineedit within w_calling_card
boolean visible = false
integer x = 347
integer y = 1568
integer width = 270
integer height = 92
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_calling_card
boolean visible = false
integer x = 663
integer y = 1460
integer width = 160
integer height = 68
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;string 	ls_branch


Open(w_seleccionar_branch)

ls_branch = message.stringparm

sle_3.text = ls_branch

sle_3.setfocus()
end event

type sle_3 from singlelineedit within w_calling_card
boolean visible = false
integer x = 384
integer y = 1440
integer width = 270
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_calling_card
boolean visible = false
integer x = 91
integer y = 1448
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Branch"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_calling_card
boolean visible = false
integer x = 677
integer y = 1584
integer width = 402
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Post Pin Number"
end type

event clicked;double total, i

// ***
total = dw_2.RowCount()
if double(sle_1.text) > total then
	sle_4.text = string(total)
end if

i = 1
Do While i <= double(sle_1.text)
	dw_2.SetRow ( i )
	dw_2.SetItem(i, "id_branch", sle_3.text)
	i = i + 1
Loop	
dw_2.Update()

sle_8.text = string(total)

// ***

end event

type cb_1 from commandbutton within w_calling_card
integer x = 1312
integer y = 1916
integer width = 1061
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add Pin File to Selected Company"
end type

event clicked;// **** definicion de variables
string docname, named
integer value
double rownbr, i

// ***** procedimiento de importacion de un archivo x a la tabla calling_card
value = GetFileOpenName("Select File", docname, named, "DOC", &
	+ "Text Files (*.TXT),*.TXT," &
	+ "DBF Files (*.dbf),*.dbf")

IF value = 1 THEN 
	dw_2.ImportFile(docname)
end if

// ****** asignacion de codigo de compania y fecha a los pin numbers
rownbr = dw_2.rowcount()
i = 1
do while i<= rownbr
	dw_2.SetRow ( i )
	dw_2.SetItem(i, "cod_company", sle_5.text)
	dw_2.SetItem(i, "fecha", datetime(today(),now()))
	i = i + 1
loop
dw_2.Update()
sle_6.text = string(dw_2.rowcount())

Messagebox("Process Completed","This batch has "+string(rownbr)+" pins")
end event

type dw_2 from datawindow within w_calling_card
integer x = 1312
integer y = 432
integer width = 1061
integer height = 1452
string dataobject = "dw_calling_card"
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_1 from datawindow within w_calling_card
integer x = 5
integer width = 2373
integer height = 396
integer taborder = 10
string dataobject = "dw_toll_free"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;string codigo

codigo = TRIM(dw_1.getitemstring(dw_1.getrow(),"cod_company"))
sle_5.text = codigo
dw_2.retrieve(codigo)
sle_6.text = string(dw_2.rowcount())

fn_refreshcountries()
fn_refreshpayers()
end event

event clicked;Long ll_row

ll_row = this.GetClickedRow()

this.SelectRow(0, FALSE)

if ll_row > 0 then
	//this.SelectRow(ll_row, TRUE)
	this.ScrollToRow(ll_row)
end if

end event

type gb_3 from groupbox within w_calling_card
integer x = 18
integer y = 912
integer width = 1271
integer height = 492
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payers"
end type

type gb_2 from groupbox within w_calling_card
integer x = 18
integer y = 408
integer width = 1271
integer height = 492
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Countries"
end type

type gb_1 from groupbox within w_calling_card
integer x = 18
integer y = 1416
integer width = 1271
integer height = 272
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asign to Branch"
end type

type dw_countrysel from datawindow within w_calling_card
integer x = 704
integer y = 516
integer width = 549
integer height = 360
boolean bringtotop = true
string dataobject = "dw_tollfree_countryselected"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;Long ll_row

ll_row = this.GetClickedRow()

this.SelectRow(0, FALSE)
dw_countryunsel.SelectRow(0, FALSE)

if ll_row > 0 then
	this.SelectRow(ll_row, TRUE)
	this.setRow(ll_row)
	this.ScrollToRow(ll_row)
end if
end event

type gb_4 from groupbox within w_calling_card
integer x = 18
integer y = 1692
integer width = 1271
integer height = 196
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Re-Send Pines to Branch"
end type

