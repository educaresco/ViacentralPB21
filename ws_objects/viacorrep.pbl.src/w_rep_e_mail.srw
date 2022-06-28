$PBExportHeader$w_rep_e_mail.srw
forward
global type w_rep_e_mail from wb_report_fechas
end type
type st_3 from statictext within w_rep_e_mail
end type
type sle_1 from singlelineedit within w_rep_e_mail
end type
type cb_send_email from commandbutton within w_rep_e_mail
end type
type cb_1 from commandbutton within w_rep_e_mail
end type
type cb_all from commandbutton within w_rep_e_mail
end type
type dw_2 from datawindow within w_rep_e_mail
end type
type cb_2 from commandbutton within w_rep_e_mail
end type
type dw_3 from datawindow within w_rep_e_mail
end type
end forward

global type w_rep_e_mail from wb_report_fechas
int Height=2312
st_3 st_3
sle_1 sle_1
cb_send_email cb_send_email
cb_1 cb_1
cb_all cb_all
dw_2 dw_2
cb_2 cb_2
dw_3 dw_3
end type
global w_rep_e_mail w_rep_e_mail

on w_rep_e_mail.create
int iCurrent
call super::create
this.st_3=create st_3
this.sle_1=create sle_1
this.cb_send_email=create cb_send_email
this.cb_1=create cb_1
this.cb_all=create cb_all
this.dw_2=create dw_2
this.cb_2=create cb_2
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.cb_send_email
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_all
this.Control[iCurrent+6]=this.dw_2
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.dw_3
end on

on w_rep_e_mail.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.cb_send_email)
destroy(this.cb_1)
destroy(this.cb_all)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.dw_3)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_e_mail
int Y=116
int Width=3173
int Height=736
int TabOrder=80
boolean BringToTop=true
string DataObject="dw_email_ventas1"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_e_mail
int X=626
boolean Visible=false
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_e_mail
int X=261
int Y=28
boolean Visible=false
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_e_mail
int X=1175
boolean Visible=false
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_e_mail
int X=1541
int TabOrder=60
boolean Visible=false
boolean BringToTop=true
end type

event em_fecha2::modified;return
end event

type st_3 from statictext within w_rep_e_mail
int X=9
int Y=20
int Width=357
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Cod Vendor :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_1 from singlelineedit within w_rep_e_mail
int X=370
int Y=16
int Width=302
int Height=92
int TabOrder=70
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Date		ld_fecha1, ld_fecha2, ld_inicio_mes

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)
ld_inicio_mes = date(left(string(ld_fecha1),2)+'01-2004')
//dw_1.retrieve(sle_1.text)
//dw_2.retrieve(ld_inicio_mes,ld_fecha2)

dw_1.retrieve()
//dw_2.retrieve(date('2004-06-01'),date('2004-06-02'))
Setpointer(Arrow!)
end event

type cb_send_email from commandbutton within w_rep_e_mail
int X=1536
int Y=12
int Width=302
int Height=84
int TabOrder=30
boolean BringToTop=true
string Text="Send FAX"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//string ls_printer_anterior,ls_printer_new, ls_email, ls_fax, ls_tel, ls_enviar, ls_branch
//STRING	ls_dot_pri
//double  ld_factura
//ulong li_job
//
//If Messagebox("Verificar","Esta seguro que desea Enviar el Fax",Question!,YesNo!) = 2 Then
//	Return
//end if
//
//ls_branch = dw_1.getitemstring(dw_1.getrow(),"id_branch")
//
//
////ls_fax 		= fn_fax_agente(ls_branch)
//ls_fax      = Trim(ls_fax)
//ls_enviar 	= "@F201 . @ @F211 "+ls_fax+" @ @F301 VERY URGENT"
//
//dw_recibo.dataobject = 'dw_recibo'
//dw_recibo.settransobject(sqlca)
//dw_recibo.Object.DataWindow.Print.DocumentName	 = ls_enviar
//
//printsetup()
//dw_recibo.retrieve(dw_1.getitemstring(dw_1.getrow(),"id_branch"),dw_2.getitemnumber(dw_2.getrow(),"id_receiver"))
//dw_recibo.print()
//
end event

type cb_1 from commandbutton within w_rep_e_mail
int X=1120
int Y=12
int Width=407
int Height=84
int TabOrder=50
boolean BringToTop=true
string Text="Send One E-Mail"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//String	ls_email1
//
//
//IF Messagebox("Message ","Desea Enviar la guia por mail ",Question!,yesno!) = 1 Then
//		printsetup()
//		
//		
//		ls_email1 = "me@viamericas.com"
//		ls_email1 = "@F212 "+ls_email1+"@"
//
//		dw_1.Object.DataWindow.Print.DocumentName	 = ls_email1
//		dw_1.print()
//		
//		
//		ls_email1 = "me@viamericas.com"
//		ls_email1 = "@F212 "+ls_email1+"@"
//
//		dw_1.Object.DataWindow.Print.DocumentName	 = ls_email1
//		dw_1.print()
//
//END IF 	
end event

type cb_all from commandbutton within w_rep_e_mail
int X=704
int Y=16
int Width=407
int Height=84
int TabOrder=20
boolean BringToTop=true
string Text="ALL E-Mail"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;String	ls_email1, ls_agent, ls_email

ls_email1	= ''
ls_agent		= ''
ls_email		= ''
	printsetup()

  DECLARE AGENTES CURSOR FOR  
  SELECT dba.AGENT.ID_AGENT,   
         dba.AGENT.EMAIL_AGENT  
    FROM dba.AGENT  
   WHERE ( dba.AGENT.EMAIL_AGENT <> '' ) AND
			( dba.AGENT.STATUS_AGENT = 'A' ) AND
         ( dba.AGENT.EMAIL_AGENT is not NULL )   ;


OPEN AGENTES ;
FETCH AGENTES INTO :ls_agent, :ls_email ;

DO WHILE sqlca.sqlcode = 0 
	ls_agent = Trim(ls_agent)
	ls_email = Trim(ls_email)	
	dw_1.retrieve(ls_agent)
	dw_2.retrieve(Date('2004-07-01'),Date('2004-07-30'),ls_agent)
	dw_3.retrieve(DateTIME(RELATIVEDATE(TODAY(),-1),TIME('00:00:00')),DateTIME(RELATIVEDATE(TODAY(),-1),TIME('23:59:59')),ls_agent)

	dw_1.Object.DataWindow.Print.DocumentName	 = "@F212 "+"sales@viamericas.com"+"@"
	dw_1.print()
	dw_2.Object.DataWindow.Print.DocumentName	 = "@F212 "+"sales@viamericas.com"+"@"
	dw_2.print()
	dw_3.Object.DataWindow.Print.DocumentName	 = "@F212 "+"sales@viamericas.com"+"@"
	dw_3.print()
	
	dw_1.Object.DataWindow.Print.DocumentName	 = "@F212 "+"ctelias@viamericas.com"+"@"
	dw_1.print()
	dw_2.Object.DataWindow.Print.DocumentName	 = "@F212 "+"ctelias@viamericas.com"+"@"
	dw_2.print()
	dw_3.Object.DataWindow.Print.DocumentName	 = "@F212 "+"ctelias@hmoney.com"+"@"
	dw_3.print()
	
	if len(ls_email) > 10 then
		dw_1.Object.DataWindow.Print.DocumentName	 = "@F212 "+ls_email+"@"
		dw_1.print()
		dw_2.Object.DataWindow.Print.DocumentName	 = "@F212 "+ls_email+"@"
		dw_2.print()
		dw_3.Object.DataWindow.Print.DocumentName	 = "@F212 "+ls_email+"@"
		dw_3.print()
	end if
	
	ls_email  	= ''
	ls_agent		= ''
	ls_email		= ''
	FETCH AGENTES INTO :ls_agent, :ls_email ;
LOOP

CLOSE AGENTES ;



end event

type dw_2 from datawindow within w_rep_e_mail
int Y=860
int Width=3168
int Height=740
int TabOrder=90
boolean BringToTop=true
string DataObject="dw_email_ventas4"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event constructor;settransobject(sqlca)
end event

type cb_2 from commandbutton within w_rep_e_mail
int X=1847
int Y=12
int Width=270
int Height=84
int TabOrder=40
boolean BringToTop=true
string Text="Print"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//dw_2.Modify("DataWindow.Print.filename = @F212 cferreira@costamarmoney.com@")
//dw_2.Modify("DataWindow.Print.DocumentName = @F212 cferreira@costamarmoney.com@")
	
printsetup()
dw_2.print()
end event

type dw_3 from datawindow within w_rep_e_mail
int X=5
int Y=1600
int Width=3159
int Height=524
int TabOrder=100
boolean BringToTop=true
string DataObject="dw_email_ventas3"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event constructor;SETTRANSOBJECT(SQLCA)
end event

