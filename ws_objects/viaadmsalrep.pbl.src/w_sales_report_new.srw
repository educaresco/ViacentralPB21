$PBExportHeader$w_sales_report_new.srw
forward
global type w_sales_report_new from Window
end type
type cb_7 from commandbutton within w_sales_report_new
end type
type dw_2 from datawindow within w_sales_report_new
end type
type dw_1 from datawindow within w_sales_report_new
end type
type cb_6 from commandbutton within w_sales_report_new
end type
type cb_5 from commandbutton within w_sales_report_new
end type
type cb_4 from commandbutton within w_sales_report_new
end type
type cb_3 from commandbutton within w_sales_report_new
end type
type cb_2 from commandbutton within w_sales_report_new
end type
type cb_1 from commandbutton within w_sales_report_new
end type
type sle_source_country from singlelineedit within w_sales_report_new
end type
type sle_source_state from singlelineedit within w_sales_report_new
end type
type sle_target_country from singlelineedit within w_sales_report_new
end type
type sle_source_group from singlelineedit within w_sales_report_new
end type
type st_6 from statictext within w_sales_report_new
end type
type st_5 from statictext within w_sales_report_new
end type
type st_4 from statictext within w_sales_report_new
end type
type st_3 from statictext within w_sales_report_new
end type
type cbx_1 from checkbox within w_sales_report_new
end type
type em_fecha2 from editmask within w_sales_report_new
end type
type em_fecha1 from editmask within w_sales_report_new
end type
type st_2 from statictext within w_sales_report_new
end type
type st_1 from statictext within w_sales_report_new
end type
end forward

global type w_sales_report_new from Window
int X=5
int Y=4
int Width=3685
int Height=2396
boolean Visible=false
boolean TitleBar=true
string Title="Sales Report Summary"
long BackColor=80269524
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cb_7 cb_7
dw_2 dw_2
dw_1 dw_1
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_source_country sle_source_country
sle_source_state sle_source_state
sle_target_country sle_target_country
sle_source_group sle_source_group
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
cbx_1 cbx_1
em_fecha2 em_fecha2
em_fecha1 em_fecha1
st_2 st_2
st_1 st_1
end type
global w_sales_report_new w_sales_report_new

on w_sales_report_new.create
this.cb_7=create cb_7
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_source_country=create sle_source_country
this.sle_source_state=create sle_source_state
this.sle_target_country=create sle_target_country
this.sle_source_group=create sle_source_group
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.cbx_1=create cbx_1
this.em_fecha2=create em_fecha2
this.em_fecha1=create em_fecha1
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_7,&
this.dw_2,&
this.dw_1,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_source_country,&
this.sle_source_state,&
this.sle_target_country,&
this.sle_source_group,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.cbx_1,&
this.em_fecha2,&
this.em_fecha1,&
this.st_2,&
this.st_1}
end on

on w_sales_report_new.destroy
destroy(this.cb_7)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_source_country)
destroy(this.sle_source_state)
destroy(this.sle_target_country)
destroy(this.sle_source_group)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cbx_1)
destroy(this.em_fecha2)
destroy(this.em_fecha1)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;
X=1
Y=1
Show()


em_fecha1.text = string(today())
em_fecha2.text = string(today())

st_3.visible = False
st_4.visible = False
st_5.visible = False
st_6.visible = False

sle_source_group.visible 	= False
sle_target_country.visible = False
sle_source_state.visible 	= False
sle_source_country.visible = False

cb_1.visible = False
cb_2.visible = False
cb_3.visible = False
cb_4.visible = False
cb_5.visible = False
end event

type cb_7 from commandbutton within w_sales_report_new
int X=3305
int Y=100
int Width=247
int Height=80
int TabOrder=10
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

type dw_2 from datawindow within w_sales_report_new
int X=37
int Y=1324
int Width=3598
int Height=960
int TabOrder=160
string DataObject="dw_sales_report_resumen_pais"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type dw_1 from datawindow within w_sales_report_new
int X=37
int Y=192
int Width=3575
int Height=1116
int TabOrder=150
string DataObject="dw_sales_report"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type cb_6 from commandbutton within w_sales_report_new
int X=3305
int Y=20
int Width=247
int Height=80
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

type cb_5 from commandbutton within w_sales_report_new
int X=2706
int Y=64
int Width=498
int Height=84
int TabOrder=130
string Text="Apply Filter"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_filtro1, ls_filtro2, ls_grupo_o , ls_pais_o, ls_pais_d, ls_stado_o

ls_grupo_o 	= sle_source_group.text
ls_pais_o  	= sle_source_country.text
ls_pais_d	= sle_target_country.text
ls_stado_o	= sle_source_state.text

if ls_grupo_o<>'' and ls_pais_o<>'' and ls_pais_d<>'' and ls_stado_o<>'' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo_o+"' and receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_country='"+ls_pais_o+"' and branch_id_state='"+ls_stado_o+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo_o+"' and receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_country='"+ls_pais_o+"' and branch_id_state='"+ls_stado_o+"'"
end if

if ls_grupo_o<>'' and ls_pais_o<>'' and ls_pais_d<>'' and ls_stado_o='' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo_o+"' and receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_country='"+ls_pais_o+"' and branch_id_state='"
	ls_filtro2="branch_id_main_branch='"+ls_grupo_o+"' and receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_country='"+ls_pais_o+"' and branch_id_state='"
end if
if ls_grupo_o<>'' and ls_pais_o<>'' and ls_pais_d='' and ls_stado_o<>'' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo_o+"' and branch_id_country='"+ls_pais_o+"' and branch_id_state='"+ls_stado_o+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo_o+"' and branch_id_country='"+ls_pais_o+"' and branch_id_state='"+ls_stado_o+"'"
end if
if ls_grupo_o<>'' and ls_pais_o='' and ls_pais_d<>'' and ls_stado_o<>'' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo_o+"' and receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_state='"+ls_stado_o+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo_o+"' and receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_state='"+ls_stado_o+"'"
end if
if ls_grupo_o='' and ls_pais_o<>'' and ls_pais_d<>'' and ls_stado_o<>'' then
	ls_filtro1="receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_country='"+ls_pais_o+"' and branch_id_state='"+ls_stado_o+"'"
	ls_filtro2="receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_country='"+ls_pais_o+"' and branch_id_state='"+ls_stado_o+"'"
end if

if ls_grupo_o='' and ls_pais_o='' and ls_pais_d<>'' and ls_stado_o<>'' then
	ls_filtro1="receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_state='"+ls_stado_o+"'"
	ls_filtro2="receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_state='"+ls_stado_o+"'"
end if
if ls_grupo_o<>'' and ls_pais_o<>'' and ls_pais_d='' and ls_stado_o='' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo_o+"' and branch_id_country='"+ls_pais_o+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo_o+"' and branch_id_country='"+ls_pais_o+"'"
end if
if ls_grupo_o='' and ls_pais_o<>'' and ls_pais_d='' and ls_stado_o<>'' then
	ls_filtro1="branch_id_country='"+ls_pais_o+"' and branch_id_state='"+ls_stado_o+"'"
	ls_filtro2="branch_id_country='"+ls_pais_o+"' and branch_id_state='"+ls_stado_o+"'"
end if
if ls_grupo_o='' and ls_pais_o<>'' and ls_pais_d<>'' and ls_stado_o='' then
	ls_filtro1="receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_country='"+ls_pais_o+"'"
	ls_filtro2="receiver_id_country_receiver='"+ls_pais_d+"' and branch_id_country='"+ls_pais_o+"'"
end if
if ls_grupo_o<>'' and ls_pais_o='' and ls_pais_d='' and ls_stado_o<>'' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo_o+"' and branch_id_state='"+ls_stado_o+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo_o+"' and branch_id_state='"+ls_stado_o+"'"
end if
if ls_grupo_o<>'' and ls_pais_o='' and ls_pais_d<>'' and ls_stado_o='' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo_o+"' and receiver_id_country_receiver='"+ls_pais_d+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo_o+"' and receiver_id_country_receiver='"+ls_pais_d+"'"
end if

if ls_grupo_o='' and ls_pais_o='' and ls_pais_d='' and ls_stado_o<>'' then
	ls_filtro1="branch_id_state='"+ls_stado_o+"'"
	ls_filtro2="branch_id_state='"+ls_stado_o+"'"
end if
if ls_grupo_o<>'' and ls_pais_o='' and ls_pais_d='' and ls_stado_o='' then
	ls_filtro1="branch_id_main_branch='"+ls_grupo_o+"'"
	ls_filtro2="branch_id_main_branch='"+ls_grupo_o+"'"
end if
if ls_grupo_o='' and ls_pais_o<>'' and ls_pais_d='' and ls_stado_o='' then
	ls_filtro1="branch_id_country='"+ls_pais_o+"'"
	ls_filtro2="branch_id_country='"+ls_pais_o+"'"
end if
if ls_grupo_o='' and ls_pais_o='' and ls_pais_d<>'' and ls_stado_o='' then
	ls_filtro1="receiver_id_country_receiver='"+ls_pais_d+"'"
	ls_filtro2="receiver_id_country_receiver='"+ls_pais_d+"'"
end if

dw_1.SetFilter(ls_filtro1)
dw_2.SetFilter(ls_filtro2)
dw_1.Retrieve(date(em_fecha1.text),RelativeDate(date(em_fecha2.text),1))
dw_2.Retrieve(date(em_fecha1.text),RelativeDate(date(em_fecha2.text),1))
end event

type cb_4 from commandbutton within w_sales_report_new
int X=2560
int Y=52
int Width=114
int Height=48
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

Open(w_seleccionar_country)

ls_group = message.stringparm

sle_source_country.text = ls_group

sle_source_country.setfocus()

end event

type cb_3 from commandbutton within w_sales_report_new
int X=2560
int Y=136
int Width=114
int Height=48
int TabOrder=110
string Text="..."
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_group

Open(w_seleccionar_state)

ls_group = message.stringparm

sle_source_state.text = ls_group

sle_source_state.setfocus()

end event

type cb_2 from commandbutton within w_sales_report_new
int X=1659
int Y=136
int Width=114
int Height=48
int TabOrder=100
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

sle_target_country.text = ls_group

sle_target_country.setfocus()

end event

type cb_1 from commandbutton within w_sales_report_new
int X=1659
int Y=52
int Width=114
int Height=48
int TabOrder=90
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

sle_source_group.text = ls_group

sle_source_group.setfocus()


end event

type sle_source_country from singlelineedit within w_sales_report_new
int X=2267
int Y=24
int Width=283
int Height=76
int TabOrder=80
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_source_state from singlelineedit within w_sales_report_new
int X=2267
int Y=108
int Width=283
int Height=76
int TabOrder=70
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_target_country from singlelineedit within w_sales_report_new
int X=1358
int Y=108
int Width=283
int Height=76
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_source_group from singlelineedit within w_sales_report_new
int X=1358
int Y=24
int Width=283
int Height=76
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_6 from statictext within w_sales_report_new
int X=1861
int Y=24
int Width=402
int Height=76
boolean Enabled=false
string Text="Source Country"
boolean FocusRectangle=false
long TextColor=16711680
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_5 from statictext within w_sales_report_new
int X=1861
int Y=108
int Width=402
int Height=76
boolean Enabled=false
string Text="Source State"
boolean FocusRectangle=false
long TextColor=16711680
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_sales_report_new
int X=955
int Y=108
int Width=443
int Height=76
boolean Enabled=false
string Text="Target Country"
boolean FocusRectangle=false
long TextColor=16711680
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_sales_report_new
int X=955
int Y=24
int Width=443
int Height=76
boolean Enabled=false
string Text="Source Group"
boolean FocusRectangle=false
long TextColor=16711680
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_1 from checkbox within w_sales_report_new
int X=581
int Y=56
int Width=297
int Height=76
int TabOrder=40
string Text="Filter.."
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if cbx_1.checked = True Then
	st_3.visible = True
	st_4.visible = True
	st_5.visible = True
	st_6.visible = True
	sle_source_group.visible 	= True
	sle_target_country.visible = True
	sle_source_state.visible 	= True
	sle_source_country.visible = True
	cb_1.visible = True
	cb_2.visible = True
	cb_3.visible = True
	cb_4.visible = True
	cb_5.visible = True
Else
	st_3.visible = False
	st_4.visible = False
	st_5.visible = False
	st_6.visible = False
	sle_source_group.visible 	= False
	sle_target_country.visible = False
	sle_source_state.visible 	= False
	sle_source_country.visible = False
	cb_1.visible = False
	cb_2.visible = False
	cb_3.visible = False
	cb_4.visible = False
	cb_5.visible = False
End If
end event

type em_fecha2 from editmask within w_sales_report_new
int X=219
int Y=108
int Width=311
int Height=76
int TabOrder=30
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

event losefocus;dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_1.Retrieve(date(em_fecha1.text),RelativeDate(Date(em_fecha2.text),1))
dw_2.Retrieve(date(em_fecha1.text),RelativeDate(Date(em_fecha2.text),1))

end event

type em_fecha1 from editmask within w_sales_report_new
int X=219
int Y=24
int Width=311
int Height=76
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

type st_2 from statictext within w_sales_report_new
int X=32
int Y=108
int Width=283
int Height=76
boolean Enabled=false
string Text="To"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_sales_report_new
int X=32
int Y=24
int Width=283
int Height=76
boolean Enabled=false
string Text="From"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

