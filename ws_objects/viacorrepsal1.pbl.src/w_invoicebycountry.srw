$PBExportHeader$w_invoicebycountry.srw
forward
global type w_invoicebycountry from Window
end type
type cb_4 from commandbutton within w_invoicebycountry
end type
type cb_3 from commandbutton within w_invoicebycountry
end type
type cb_2 from commandbutton within w_invoicebycountry
end type
type dw_2 from datawindow within w_invoicebycountry
end type
type dw_1 from datawindow within w_invoicebycountry
end type
type sle_year from singlelineedit within w_invoicebycountry
end type
type st_2 from statictext within w_invoicebycountry
end type
type st_1 from statictext within w_invoicebycountry
end type
type cb_1 from commandbutton within w_invoicebycountry
end type
end forward

global type w_invoicebycountry from Window
int X=823
int Y=360
int Width=3424
int Height=1852
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
dw_2 dw_2
dw_1 dw_1
sle_year sle_year
st_2 st_2
st_1 st_1
cb_1 cb_1
end type
global w_invoicebycountry w_invoicebycountry

event open;sle_year.text = string(year(today()))
end event

on w_invoicebycountry.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_2=create dw_2
this.dw_1=create dw_1
this.sle_year=create sle_year
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.dw_2,&
this.dw_1,&
this.sle_year,&
this.st_2,&
this.st_1,&
this.cb_1}
end on

on w_invoicebycountry.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.sle_year)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
end on

type cb_4 from commandbutton within w_invoicebycountry
int X=3131
int Y=1064
int Width=247
int Height=108
int TabOrder=50
string Text="Macro"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;STRING ls_idcountry, ls_myidcountry, ls_cadena, ls_countryname, ls_file
DATE   ld_fecha
DOUBLE ld_netamountreceiver, ld_jan, ld_feb, ld_mar, ld_apr, ld_may, ld_jun, ld_jul, ld_fin
DOUBLE ld_aug, ld_sep, ld_oct, ld_nov, ld_dec, ld_total
long   li_FileNum

ld_fin = 0
MESSAGEBOX("File Name Is c:\YEARTOTA.txt","OK")
ls_file = 'c:\YEARTOTA.txt'
li_FileNum = FileOpen(ls_file,LineMode!, Write!, LockWrite!, Replace!)

ls_cadena = 'YEAR SUMMARY TOTALS'+','+sle_year.text
FileWrite(li_FileNum,ls_cadena)
ls_cadena = 'Country/Month'+','+'Jan'+','+'Feb'+','+'Mar'+','+'Apr'+','+'May'+','+'Jun'+','+'Jul'+','+'Aug'+','+'Sep'+','+'Oct'+','+'Nov'+','+'Dec'+','+'Total'
FileWrite(li_FileNum,ls_cadena)

DECLARE GIROS CURSOR FOR  
SELECT dba.country.name_country,   
       dba.receiver.date_receiver,   
       dba.receiver.net_amount_receiver,   
       dba.receiver.id_country_receiver  
FROM dba.country,   
     dba.receiver  
WHERE ( dba.country.id_country = dba.receiver.id_country_receiver ) and  
      ( ( dba.receiver.id_flag_receiver <> 'A' ) AND  
      ( datepart(yy,dba.receiver.date_receiver) = :sle_year.text ) )   
ORDER BY dba.receiver.id_country_receiver ASC  ;

OPEN GIROS;
FETCH GIROS INTO :ls_countryname, :ld_fecha, :ld_netamountreceiver, :ls_idcountry ;

DO WHILE SQLCA.SQLCODE = 0
   ls_myidcountry = ls_idcountry
	ld_jan=0
	ld_feb=0
	ld_mar=0
	ld_apr=0
	ld_may=0
	ld_jun=0
	ld_jul=0
   ld_aug=0
	ld_sep=0
	ld_oct=0
	ld_nov=0
	ld_dec=0
	ld_total=0
   DO WHILE ls_idcountry = ls_myidcountry
		CHOOSE CASE month(ld_fecha)
				 CASE 1
				 	 ld_jan = ld_jan + ld_netamountreceiver
				 CASE 2
					 ld_feb = ld_feb + ld_netamountreceiver
				 CASE 3
					 ld_mar = ld_mar + ld_netamountreceiver
             CASE 4
					 ld_apr = ld_apr + ld_netamountreceiver
				 CASE 5
					 ld_may = ld_may + ld_netamountreceiver
			    CASE 6
					 ld_jun = ld_jun + ld_netamountreceiver
				 CASE 7
				    ld_jul = ld_jul + ld_netamountreceiver
				 CASE 8
					 ld_aug = ld_aug + ld_netamountreceiver
			    CASE 9
				    ld_sep = ld_sep + ld_netamountreceiver
				 CASE 10
					 ld_oct = ld_oct + ld_netamountreceiver
				 CASE 11
					 ld_nov = ld_nov + ld_netamountreceiver
				 CASE 12
					 ld_dec = ld_dec + ld_netamountreceiver
      END CHOOSE
      FETCH GIROS INTO :ls_countryname, :ld_fecha, :ld_netamountreceiver, :ls_idcountry ;
		IF SQLCA.SQLCODE <> 0 THEN
			ld_fin = 1
			EXIT
		END IF
	LOOP
	ld_total = ld_jan+ld_feb+ld_mar+ld_apr+ld_may+ld_jun+ld_jul+ld_aug+ld_sep+ld_oct+ld_nov+ld_dec
	ls_cadena = ls_countryname+','+string(ld_jan)+','+string(ld_feb)+','+string(ld_mar)+','+string(ld_apr)+','+string(ld_may)+','+string(ld_jun)+','+string(ld_jul)+','+string(ld_aug)+','+string(ld_sep)+','+string(ld_oct)+','+string(ld_nov)+','+string(ld_dec)+','+string(ld_total)
   FileWrite(li_FileNum,ls_cadena)
	IF ld_fin = 1 THEN
		EXIT
	END IF
LOOP
CLOSE GIROS;
ls_cadena = 'TOTAL'
FileWrite(li_FileNum,ls_cadena)
FileClose(li_FileNum)
MESSAGEBOX("FINISH","OK")

end event

type cb_3 from commandbutton within w_invoicebycountry
int X=3131
int Y=284
int Width=247
int Height=108
int TabOrder=60
string Text="Macro"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;STRING ls_idcountry, ls_myidcountry, ls_cadena, ls_countryname, ls_file, ls_mycountryname
DATE   ld_fecha
DOUBLE ld_idreceiver, ld_jan, ld_feb, ld_mar, ld_apr, ld_may, ld_jun, ld_jul, ld_fin
DOUBLE ld_aug, ld_sep, ld_oct, ld_nov, ld_dec, ld_total
long   li_FileNum

ld_fin = 0
MESSAGEBOX("File Name Is c:\YEARTRAN.txt","OK")
ls_file = 'c:\YEARTRAN.txt'
li_FileNum = FileOpen(ls_file,LineMode!, Write!, LockWrite!, Replace!)

ls_cadena = 'YEAR SUMMARY TRANSACTIONS'+','+sle_year.text
FileWrite(li_FileNum,ls_cadena)
ls_cadena = 'Country/Month'+','+'Jan'+','+'Feb'+','+'Mar'+','+'Apr'+','+'May'+','+'Jun'+','+'Jul'+','+'Aug'+','+'Sep'+','+'Oct'+','+'Nov'+','+'Dec'+','+'Total'
FileWrite(li_FileNum,ls_cadena)

DECLARE GIROS CURSOR FOR  
SELECT dba.country.name_country,   
       dba.receiver.date_receiver,   
       dba.receiver.id_receiver,   
       dba.receiver.id_country_receiver  
FROM dba.country,   
     dba.receiver  
WHERE ( dba.country.id_country = dba.receiver.id_country_receiver ) and  
      ( ( dba.receiver.id_flag_receiver <> 'A' ) AND  
      ( datepart(yy,dba.receiver.date_receiver) = :sle_year.text ) )   
ORDER BY dba.receiver.id_country_receiver ASC  ;

OPEN GIROS;
FETCH GIROS INTO :ls_countryname, :ld_fecha, :ld_idreceiver, :ls_idcountry ;

DO WHILE SQLCA.SQLCODE = 0
   ls_myidcountry = ls_idcountry
	ls_mycountryname = ls_countryname
	ld_jan=0
	ld_feb=0
	ld_mar=0
	ld_apr=0
	ld_may=0
	ld_jun=0
	ld_jul=0
   ld_aug=0
	ld_sep=0
	ld_oct=0
	ld_nov=0
	ld_dec=0
	ld_total=0
   DO WHILE ls_idcountry = ls_myidcountry
		CHOOSE CASE month(ld_fecha)
				 CASE 1
				 if ld_idreceiver>0 then 
					 ld_jan = ld_jan + 1
				 else
					 ld_jan = ld_jan - 1
				 end if	
			    CASE 2
				 if ld_idreceiver>0 then 
					 ld_feb = ld_feb + 1
				 else
					 ld_feb = ld_feb - 1
			    end if	
				 CASE 3
				 if ld_idreceiver>0 then 
					 ld_mar = ld_mar + 1
				 else
					 ld_mar = ld_mar - 1
				 end if	
             CASE 4
				 if ld_idreceiver>0 then 
					 ld_apr = ld_apr + 1
				 else
					 ld_apr = ld_apr - 1
				 end if	
				 CASE 5
				 if ld_idreceiver>0 then 
					 ld_may = ld_may + 1
				 else
					 ld_may = ld_may - 1
				 end if	
			    CASE 6
				 if ld_idreceiver>0 then 
					 ld_jun = ld_jun + 1
				 else
					 ld_jun = ld_jun - 1
				 end if	
				 CASE 7
				 if ld_idreceiver>0 then 
				    ld_jul = ld_jul + 1
				 else
					 ld_jul = ld_jul - 1
				 end if	
				 CASE 8
				 if ld_idreceiver>0 then 
					 ld_aug = ld_aug + 1
				 else
					 ld_aug = ld_aug - 1
				 end if	
			    CASE 9
				 if ld_idreceiver>0 then 
				    ld_sep = ld_sep + 1
				 else
				    ld_sep = ld_sep - 1
				 end if	
				 CASE 10
				 if ld_idreceiver>0 then 
					 ld_oct = ld_oct + 1
				 else
					 ld_oct = ld_oct - 1
				 end if	
				 CASE 11
				 if ld_idreceiver>0 then 
					 ld_nov = ld_nov + 1
				 else
					 ld_nov = ld_nov - 1
				 end if	
				 CASE 12
				 if ld_idreceiver>0 then 
					 ld_dec = ld_dec + 1
				 else
					 ld_dec = ld_dec - 1
				 end if	
      END CHOOSE
      FETCH GIROS INTO :ls_countryname, :ld_fecha, :ld_idreceiver, :ls_idcountry ;
		IF SQLCA.SQLCODE <> 0 THEN
			ld_fin = 1
			EXIT
		END IF
	LOOP
	ld_total = ld_jan+ld_feb+ld_mar+ld_apr+ld_may+ld_jun+ld_jul+ld_aug+ld_sep+ld_oct+ld_nov+ld_dec
	ls_cadena = ls_mycountryname+','+string(ld_jan)+','+string(ld_feb)+','+string(ld_mar)+','+string(ld_apr)+','+string(ld_may)+','+string(ld_jun)+','+string(ld_jul)+','+string(ld_aug)+','+string(ld_sep)+','+string(ld_oct)+','+string(ld_nov)+','+string(ld_dec)+','+string(ld_total)
   FileWrite(li_FileNum,ls_cadena)
	IF ld_fin = 1 THEN
		EXIT
	END IF
LOOP
CLOSE GIROS;
ls_cadena = 'TOTAL'
FileWrite(li_FileNum,ls_cadena)
FileClose(li_FileNum)
MESSAGEBOX("FINISH","OK")
end event

type cb_2 from commandbutton within w_invoicebycountry
int X=3131
int Y=936
int Width=247
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

type dw_2 from datawindow within w_invoicebycountry
int X=46
int Y=932
int Width=3072
int Height=800
int TabOrder=30
string DataObject="dw_totalinvoicebycountry"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type dw_1 from datawindow within w_invoicebycountry
int X=41
int Y=148
int Width=3072
int Height=752
int TabOrder=20
string DataObject="dw_invoicebycountry"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type sle_year from singlelineedit within w_invoicebycountry
int X=2098
int Y=24
int Width=361
int Height=92
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_1.Retrieve(double(sle_year.text))
dw_2.Retrieve(double(sle_year.text))
end event

type st_2 from statictext within w_invoicebycountry
int X=1810
int Y=24
int Width=247
int Height=76
boolean Enabled=false
string Text="Year"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-12
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_invoicebycountry
int X=37
int Y=24
int Width=1554
int Height=116
boolean Enabled=false
string Text="YEAR SUMMARY"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-20
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_invoicebycountry
int X=3131
int Y=156
int Width=247
int Height=108
int TabOrder=70
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

