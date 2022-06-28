$PBExportHeader$w_payee_report_new_modo_pago.srw
forward
global type w_payee_report_new_modo_pago from Window
end type
type em_modo_pago from editmask within w_payee_report_new_modo_pago
end type
type st_27 from statictext within w_payee_report_new_modo_pago
end type
type sle_target_state from singlelineedit within w_payee_report_new_modo_pago
end type
type st_5 from statictext within w_payee_report_new_modo_pago
end type
type cb_7 from commandbutton within w_payee_report_new_modo_pago
end type
type cb_4 from commandbutton within w_payee_report_new_modo_pago
end type
type cb_3 from commandbutton within w_payee_report_new_modo_pago
end type
type cb_2 from commandbutton within w_payee_report_new_modo_pago
end type
type cbx_filter1 from checkbox within w_payee_report_new_modo_pago
end type
type dw_2 from datawindow within w_payee_report_new_modo_pago
end type
type dw_1 from datawindow within w_payee_report_new_modo_pago
end type
type cb_1 from commandbutton within w_payee_report_new_modo_pago
end type
type sle_target_contry from singlelineedit within w_payee_report_new_modo_pago
end type
type sle_target_group from singlelineedit within w_payee_report_new_modo_pago
end type
type st_4 from statictext within w_payee_report_new_modo_pago
end type
type st_3 from statictext within w_payee_report_new_modo_pago
end type
type em_fecha2 from editmask within w_payee_report_new_modo_pago
end type
type em_fecha1 from editmask within w_payee_report_new_modo_pago
end type
type st_2 from statictext within w_payee_report_new_modo_pago
end type
type st_1 from statictext within w_payee_report_new_modo_pago
end type
end forward

global type w_payee_report_new_modo_pago from Window
int X=5
int Y=4
int Width=3648
int Height=2404
boolean TitleBar=true
string Title="Payee Report"
long BackColor=80269524
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
em_modo_pago em_modo_pago
st_27 st_27
sle_target_state sle_target_state
st_5 st_5
cb_7 cb_7
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cbx_filter1 cbx_filter1
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
sle_target_contry sle_target_contry
sle_target_group sle_target_group
st_4 st_4
st_3 st_3
em_fecha2 em_fecha2
em_fecha1 em_fecha1
st_2 st_2
st_1 st_1
end type
global w_payee_report_new_modo_pago w_payee_report_new_modo_pago

on w_payee_report_new_modo_pago.create
this.em_modo_pago=create em_modo_pago
this.st_27=create st_27
this.sle_target_state=create sle_target_state
this.st_5=create st_5
this.cb_7=create cb_7
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cbx_filter1=create cbx_filter1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.sle_target_contry=create sle_target_contry
this.sle_target_group=create sle_target_group
this.st_4=create st_4
this.st_3=create st_3
this.em_fecha2=create em_fecha2
this.em_fecha1=create em_fecha1
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.em_modo_pago,&
this.st_27,&
this.sle_target_state,&
this.st_5,&
this.cb_7,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cbx_filter1,&
this.dw_2,&
this.dw_1,&
this.cb_1,&
this.sle_target_contry,&
this.sle_target_group,&
this.st_4,&
this.st_3,&
this.em_fecha2,&
this.em_fecha1,&
this.st_2,&
this.st_1}
end on

on w_payee_report_new_modo_pago.destroy
destroy(this.em_modo_pago)
destroy(this.st_27)
destroy(this.sle_target_state)
destroy(this.st_5)
destroy(this.cb_7)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cbx_filter1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.sle_target_contry)
destroy(this.sle_target_group)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.em_fecha2)
destroy(this.em_fecha1)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;em_fecha1.text = string(today())
em_fecha2.text = string(today())

st_3.visible = False
st_4.visible = False

sle_target_group.visible	= False
sle_target_contry.visible	= False

cb_2.visible = False
cb_3.visible = False
cb_4.visible = False

st_5.visible = False
sle_target_state.visible 	= False
end event

type em_modo_pago from editmask within w_payee_report_new_modo_pago
int X=334
int Y=172
int Width=311
int Height=88
int TabOrder=30
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="!"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_1.Retrieve(date(em_fecha1.text),RelativeDate(Date(em_fecha2.text),1))
dw_2.Retrieve(date(em_fecha1.text),RelativeDate(Date(em_fecha2.text),1))
end event

type st_27 from statictext within w_payee_report_new_modo_pago
int X=37
int Y=176
int Width=279
int Height=72
boolean Enabled=false
string Text="Mode Pay :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_target_state from singlelineedit within w_payee_report_new_modo_pago
int X=2395
int Y=100
int Width=311
int Height=72
int TabOrder=90
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=255
long BackColor=16777215
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_5 from statictext within w_payee_report_new_modo_pago
int X=2057
int Y=104
int Width=315
int Height=72
boolean Enabled=false
string Text="Target State"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_7 from commandbutton within w_payee_report_new_modo_pago
int X=3296
int Y=104
int Width=297
int Height=76
int TabOrder=80
string Text="Print"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Printsetup()
dw_2.Print()
end event

type cb_4 from commandbutton within w_payee_report_new_modo_pago
int X=2738
int Y=80
int Width=517
int Height=108
int TabOrder=110
string Text="Apply Filter"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_filtro1, ls_filtro2, ls_grupo , ls_pais, ls_state

ls_grupo = sle_target_group.text
ls_pais  = sle_target_contry.text
ls_state = sle_target_state.text


if ls_grupo<>'' and ls_pais<>'' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo+"' and receiver_id_country_receiver='"+ls_pais+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo+"' and receiver_id_country_receiver='"+ls_pais+"'"
end if
if ls_grupo='' and ls_pais<>'' then
	ls_filtro1="receiver_id_country_receiver='"+ls_pais+"'"
	ls_filtro2="receiver_id_country_receiver='"+ls_pais+"'"
end if
if ls_grupo<>'' and ls_pais='' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo+"'"
end if
if ls_grupo='' and ls_pais='' then
	ls_filtro1=""
	ls_filtro2=""
end if

if ls_grupo <>'' and ls_pais<> '' AND ls_state <> '' then
	ls_filtro1 = ls_filtro1 + " and receiver_id_state_receiver='"+ls_state+"'"
	ls_filtro2 = ls_filtro2 + " and receiver_id_state_receiver='"+ls_state+"'"
ELSEif ls_grupo ='' and ls_pais<> '' AND ls_state <> '' then	
	ls_filtro1 = ls_filtro1 + " and receiver_id_state_receiver='"+ls_state+"'"
	ls_filtro2 = ls_filtro2 + " and receiver_id_state_receiver='"+ls_state+"'"
ELSEif ls_grupo ='' and ls_pais= '' AND ls_state <> '' then	
	ls_filtro1 = ls_filtro1 + "receiver_id_state_receiver='"+ls_state+"'"
	ls_filtro2 = ls_filtro2 + "receiver_id_state_receiver='"+ls_state+"'"	
end if

dw_1.SetFilter(ls_filtro1)
dw_2.SetFilter(ls_filtro2)
dw_1.Filter( )
dw_2.Filter( )
end event

type cb_3 from commandbutton within w_payee_report_new_modo_pago
int X=1897
int Y=112
int Width=119
int Height=56
int TabOrder=130
string Text="..."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_group

Open(w_seleccionar_country)

ls_group = message.stringparm

sle_target_contry.text = ls_group

sle_target_contry.setfocus()

end event

type cb_2 from commandbutton within w_payee_report_new_modo_pago
int X=1897
int Y=36
int Width=119
int Height=56
int TabOrder=120
string Text="..."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_group

Open(w_seleccionar_grupo)

ls_group = message.stringparm

sle_target_group.text = ls_group

sle_target_group.setfocus()


end event

type cbx_filter1 from checkbox within w_payee_report_new_modo_pago
int X=928
int Y=48
int Width=238
int Height=76
int TabOrder=60
string Text="Filter"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;If cbx_filter1.checked = True Then
	st_3.visible = True
	st_4.visible = True
	sle_target_group.visible 	= True
	sle_target_contry.visible	= True
	cb_2.visible = True
	cb_3.visible = True
	cb_4.visible = True
	st_5.visible = True
	sle_target_state.visible 	= True
Else
	st_3.visible = False
	st_4.visible = False
	sle_target_group.visible 	= False
	sle_target_contry.visible	= False
	cb_2.visible = False
	cb_3.visible = False
	cb_4.visible = False
	st_5.visible = False
	sle_target_state.visible 	= False
End If
end event

type dw_2 from datawindow within w_payee_report_new_modo_pago
int X=37
int Y=1612
int Width=3552
int Height=668
int TabOrder=50
string DataObject="dw_payee_report_resumen_state_modo_pago"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type dw_1 from datawindow within w_payee_report_new_modo_pago
int X=37
int Y=268
int Width=3552
int Height=1340
int TabOrder=40
string DataObject="dw_payee_report_modo_pago"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type cb_1 from commandbutton within w_payee_report_new_modo_pago
int X=3296
int Y=24
int Width=297
int Height=76
int TabOrder=140
string Text="Print"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Printsetup()
dw_1.Print()

end event

type sle_target_contry from singlelineedit within w_payee_report_new_modo_pago
int X=1577
int Y=96
int Width=311
int Height=72
int TabOrder=100
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
long BackColor=16777215
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_target_group from singlelineedit within w_payee_report_new_modo_pago
int X=1577
int Y=24
int Width=311
int Height=72
int TabOrder=70
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
long BackColor=16777215
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_payee_report_new_modo_pago
int X=1157
int Y=96
int Width=402
int Height=72
boolean Enabled=false
string Text="Target Country "
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_payee_report_new_modo_pago
int X=1189
int Y=24
int Width=370
int Height=72
boolean Enabled=false
string Text="Target Group "
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_fecha2 from editmask within w_payee_report_new_modo_pago
int X=334
int Y=96
int Width=311
int Height=72
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_fecha1 from editmask within w_payee_report_new_modo_pago
int X=334
int Y=24
int Width=311
int Height=72
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_payee_report_new_modo_pago
int X=37
int Y=96
int Width=279
int Height=72
boolean Enabled=false
string Text="To"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_payee_report_new_modo_pago
int X=37
int Y=24
int Width=279
int Height=72
boolean Enabled=false
string Text="From"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

