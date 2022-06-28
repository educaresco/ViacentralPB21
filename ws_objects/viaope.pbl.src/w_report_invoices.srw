$PBExportHeader$w_report_invoices.srw
forward
global type w_report_invoices from wb_report_fechas
end type
type em_hora from u_em within w_report_invoices
end type
type st_3 from statictext within w_report_invoices
end type
type sle_grupo from singlelineedit within w_report_invoices
end type
type st_4 from statictext within w_report_invoices
end type
type cb_1 from commandbutton within w_report_invoices
end type
type sle_country from singlelineedit within w_report_invoices
end type
type sle_state from singlelineedit within w_report_invoices
end type
type sle_city from singlelineedit within w_report_invoices
end type
type sle_cadena from singlelineedit within w_report_invoices
end type
end forward

global type w_report_invoices from wb_report_fechas
WindowState WindowState=maximized!
em_hora em_hora
st_3 st_3
sle_grupo sle_grupo
st_4 st_4
cb_1 cb_1
sle_country sle_country
sle_state sle_state
sle_city sle_city
sle_cadena sle_cadena
end type
global w_report_invoices w_report_invoices

on w_report_invoices.create
int iCurrent
call super::create
this.em_hora=create em_hora
this.st_3=create st_3
this.sle_grupo=create sle_grupo
this.st_4=create st_4
this.cb_1=create cb_1
this.sle_country=create sle_country
this.sle_state=create sle_state
this.sle_city=create sle_city
this.sle_cadena=create sle_cadena
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_hora
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.sle_grupo
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.sle_country
this.Control[iCurrent+7]=this.sle_state
this.Control[iCurrent+8]=this.sle_city
this.Control[iCurrent+9]=this.sle_cadena
end on

on w_report_invoices.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_hora)
destroy(this.st_3)
destroy(this.sle_grupo)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.sle_country)
destroy(this.sle_state)
destroy(this.sle_city)
destroy(this.sle_cadena)
end on

event open;call super::open;em_hora.text = String(Now())
end event

type dw_1 from wb_report_fechas`dw_1 within w_report_invoices
int X=9
int Y=348
int Height=1388
int TabOrder=60
boolean BringToTop=true
string DataObject="dw_comprobacion_invoice"
end type

event dw_1::getfocus;call super::getfocus;//dw_1.retrieve(date(em_fecha1),date(em_fecha2),sle_country.text,sle_state.text,sle_city.text)
//
end event

type em_fecha1 from wb_report_fechas`em_fecha1 within w_report_invoices
int X=434
int Y=16
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_report_invoices
int X=69
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_report_invoices
int X=832
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_report_invoices
int X=1202
int Y=16
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type em_hora from u_em within w_report_invoices
int X=1792
int Y=32
int Width=366
int Height=100
int TabOrder=30
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="hh:mm:ss"
MaskDataType MaskDataType=TimeMask!
boolean AutoSkip=true
boolean Spin=true
string MinMax=""
FontCharSet FontCharSet=Ansi!
end type

type st_3 from statictext within w_report_invoices
int X=1614
int Y=32
int Width=178
int Height=64
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
string Text="Hora :"
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

type sle_grupo from singlelineedit within w_report_invoices
int X=1605
int Y=32
int Width=119
int Height=92
int TabOrder=40
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=12632256
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_report_invoices
int X=1797
int Y=32
int Width=297
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Select City"
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

type cb_1 from commandbutton within w_report_invoices
int X=2126
int Y=24
int Width=178
int Height=84
int TabOrder=50
boolean BringToTop=true
string Text="..."
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_city

Open(w_seleccionar_city)

ls_city = message.stringparm
sle_grupo.text = ls_city


//******* REPARTIENDO VALORES DELOS CODIGOS DE CIUDAD ESTADO Y PAIS PARA EL FILTRO
string ll_cadena, ll_city, ll_state, ll_country, ll_ubicacion

integer ll_longitud, m_pos, campo

ll_cadena = w_report_invoices.sle_grupo.text

ll_longitud = len(ll_cadena)
m_pos = 1
campo = 1

DO WHILE m_pos <= ll_longitud
	if mid(ll_cadena, m_pos, 1) <> "-" then
		if campo = 1 then
		   ll_city += mid(ll_cadena, m_pos, 1)
		   m_pos = m_pos + 1
		end if	
		if campo = 2 then
			ll_State += mid(ll_cadena, m_pos, 1)
			m_pos = m_pos + 1
		end if	
		if campo = 3 then
			ll_country += mid(ll_cadena, m_pos, 1)
			m_pos = m_pos + 1
		end if	
		if campo = 4 then
			ll_ubicacion = mid(ll_cadena, m_pos,(ll_longitud - m_pos + 1))
			m_pos = ll_longitud + 1
		end if	
	else	
		campo = campo + 1
		m_pos = m_pos + 1
   end if
LOOP
w_report_invoices.sle_city.text = ll_city
w_report_invoices.sle_state.text = ll_state
w_report_invoices.sle_country.text = ll_country
w_report_invoices.sle_cadena.text = ll_ubicacion

dw_1.retrieve(date(em_fecha1.text),RelativeDate(date(em_fecha2.text),1),sle_country.text,sle_state.text,sle_city.text)

dw_1.setfocus()



end event

type sle_country from singlelineedit within w_report_invoices
int X=1751
int Y=32
int Width=283
int Height=92
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_state from singlelineedit within w_report_invoices
int X=2075
int Y=32
int Width=261
int Height=92
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_city from singlelineedit within w_report_invoices
int X=2363
int Y=32
int Width=283
int Height=92
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=255
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_cadena from singlelineedit within w_report_invoices
int X=37
int Y=168
int Width=3113
int Height=152
boolean BringToTop=true
boolean Border=false
boolean AutoHScroll=false
long TextColor=8388608
long BackColor=12632256
int TextSize=-18
int Weight=700
string FaceName="MS Sans Serif"
boolean Italic=true
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

