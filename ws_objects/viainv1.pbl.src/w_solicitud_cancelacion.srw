$PBExportHeader$w_solicitud_cancelacion.srw
forward
global type w_solicitud_cancelacion from wb_response
end type
type dw_1 from datawindow within w_solicitud_cancelacion
end type
type cb_update from commandbutton within w_solicitud_cancelacion
end type
type cb_close from commandbutton within w_solicitud_cancelacion
end type
type cb_1 from commandbutton within w_solicitud_cancelacion
end type
type dw_print from datawindow within w_solicitud_cancelacion
end type
end forward

global type w_solicitud_cancelacion from wb_response
int X=1047
int Y=100
int Width=2514
int Height=2280
boolean TitleBar=true
string Title="Pay"
long BackColor=80269524
dw_1 dw_1
cb_update cb_update
cb_close cb_close
cb_1 cb_1
dw_print dw_print
end type
global w_solicitud_cancelacion w_solicitud_cancelacion

type variables
Double	ld_sender

string	is_validador, is_email
end variables

on w_solicitud_cancelacion.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_update=create cb_update
this.cb_close=create cb_close
this.cb_1=create cb_1
this.dw_print=create dw_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_update
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_print
end on

on w_solicitud_cancelacion.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.cb_1)
destroy(this.dw_print)
end on

event open;call super::open;dw_1.settransobject(sqlca)

Double	ld_amount,ld_ref , ld_rand  

String   ls_branch_pay,		&   
         ls_payee,			&   
         ls_clave, ls_randomico , ls_email_group
			
			
//ld_rand 			= Rand (10000)
ls_randomico   = LEFT(trim(gs_cashier)+LEFT(STRING(TODAY(),"MMDDYYYY"),2)+RIGHT(STRING(NOW(),"HHMMSS"),4),10)
is_validador	= ls_randomico

  SELECT dba.RECEIVER.NET_AMOUNT_RECEIVER,   
         dba.RECEIVER.BRANCH_PAY_RECEIVER,   
         dba.BRANCH.ID_MAIN_BRANCH,   
         dba.RECEIVER.REF_RECEIVER,   
         dba.RECEIVER.CLAVE_RECEIVER  
    INTO :ld_amount,   
         :ls_branch_pay,   
         :ls_payee,   
         :ld_ref,   
         :ls_clave  
    FROM dba.RECEIVER,   
         dba.BRANCH  
   WHERE ( dba.BRANCH.ID_BRANCH = dba.RECEIVER.BRANCH_PAY_RECEIVER ) and  
         ( ( dba.RECEIVER.ID_BRANCH = :gs_branch_insta_cons ) AND  
         ( dba.RECEIVER.ID_RECEIVER = :gl_receiver_cons ) )   ;

  SELECT dba.GROUP_BRANCH.EMAIL_GROUP  
    INTO :ls_email_group  
    FROM dba.GROUP_BRANCH  
   WHERE dba.GROUP_BRANCH.ID_MAIN_BRANCH = :ls_payee   ;

is_email = ls_email_group

if isnull(ls_clave) then ls_clave = ''

ld_sender = message.doubleparm
dw_1.insertrow(0)

dw_1.setitem(1,"date_solicitud",Datetime(today(),now()))
dw_1.setitem(1,"id_branch",gs_branch_insta_cons)
dw_1.setitem(1,"id_receiver",gl_receiver_cons)
dw_1.setitem(1,"id_cashier",gs_cashier)
dw_1.setitem(1,"id_branch_payee",ls_branch_pay)
dw_1.setitem(1,"id_payee",ls_payee)
dw_1.setitem(1,"ref_receiver",string(ld_ref))
dw_1.setitem(1,"clave_receiver",ls_clave)
dw_1.setitem(1,"net_amount",ld_amount)
dw_1.setitem(1,"cod_validacion",ls_randomico)
dw_1.setitem(1,"email_group",ls_email_group)


dw_1.setfocus()

end event

event close;return dw_1.reset()
end event

event pfc_preclose;return dw_1.reset()
end event

type dw_1 from datawindow within w_solicitud_cancelacion
int X=9
int Width=2450
int Height=936
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_solicitud_cancelacion"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type cb_update from commandbutton within w_solicitud_cancelacion
int X=946
int Y=964
int Width=512
int Height=92
int TabOrder=20
boolean BringToTop=true
string Text="&Registrar"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;

dw_1.accepttext()

		
   if dw_1.update() = 1 then 
		commit ;
		dw_print.retrieve(gs_branch_insta_cons,gl_receiver_cons,is_validador)
		dw_print.Modify("DataWindow.Zoom=75")
	else
		Messagebox("Error Solicitud Cancelacion"," No pudo ser Procesada")
		Rollback ;
		return
	end if
	
	
	
//setting = dw_1.Object.DataWindow.Zoom
//dw_1.Object.DataWindow.Zoom = 50
//setting = dw_1.Describe("DataWindow.Zoom")
//dw_1.Modify("DataWindow.Zoom=50")
end event

type cb_close from commandbutton within w_solicitud_cancelacion
int X=1541
int Y=964
int Width=512
int Height=92
int TabOrder=40
boolean BringToTop=true
string Text="&Salir"
boolean Cancel=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close(Parent)
end event

type cb_1 from commandbutton within w_solicitud_cancelacion
int X=338
int Y=964
int Width=512
int Height=92
int TabOrder=30
boolean BringToTop=true
string Text="Send E-Mail"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_printer_anterior,ls_printer_new, ls_email, ls_tel, ls_enviar, ls_branch
ulong li_job


dw_print.Modify("DataWindow.Zoom=100")

If Messagebox("Verificar","Esta seguro que desea Enviar el Email De Nuevo",Question!,YesNo!) = 2 Then
	Return
end if


ls_email      = is_email
ls_email      = Trim(ls_email)
ls_enviar 	  = "@F212 "+ls_email+" @ @F301 VERY URGENT"


dw_print.Object.DataWindow.Print.DocumentName	 = ls_enviar

printsetup()
dw_print.retrieve(gs_branch_insta_cons,gl_receiver_cons,is_validador)
dw_print.print()

dw_print.Modify("DataWindow.Zoom=75")

end event

type dw_print from datawindow within w_solicitud_cancelacion
int X=5
int Y=1072
int Width=2450
int Height=1104
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_print_solicitud_cancelacion"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event constructor;settransobject(sqlca)
		dw_print.Modify("DataWindow.Zoom=75")
end event

