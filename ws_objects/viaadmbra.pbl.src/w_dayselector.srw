$PBExportHeader$w_dayselector.srw
forward
global type w_dayselector from pfc_w_response
end type
type cbx_mo from checkbox within w_dayselector
end type
type gb_1 from groupbox within w_dayselector
end type
type cbx_tu from checkbox within w_dayselector
end type
type cbx_we from checkbox within w_dayselector
end type
type cbx_th from checkbox within w_dayselector
end type
type cbx_fr from checkbox within w_dayselector
end type
type cbx_sa from checkbox within w_dayselector
end type
type cb_ok from commandbutton within w_dayselector
end type
end forward

global type w_dayselector from pfc_w_response
int Width=576
int Height=636
boolean TitleBar=true
string Title="Day Selector"
long BackColor=80269524
boolean ControlMenu=false
cbx_mo cbx_mo
gb_1 gb_1
cbx_tu cbx_tu
cbx_we cbx_we
cbx_th cbx_th
cbx_fr cbx_fr
cbx_sa cbx_sa
cb_ok cb_ok
end type
global w_dayselector w_dayselector

on w_dayselector.create
int iCurrent
call super::create
this.cbx_mo=create cbx_mo
this.gb_1=create gb_1
this.cbx_tu=create cbx_tu
this.cbx_we=create cbx_we
this.cbx_th=create cbx_th
this.cbx_fr=create cbx_fr
this.cbx_sa=create cbx_sa
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_mo
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.cbx_tu
this.Control[iCurrent+4]=this.cbx_we
this.Control[iCurrent+5]=this.cbx_th
this.Control[iCurrent+6]=this.cbx_fr
this.Control[iCurrent+7]=this.cbx_sa
this.Control[iCurrent+8]=this.cb_ok
end on

on w_dayselector.destroy
call super::destroy
destroy(this.cbx_mo)
destroy(this.gb_1)
destroy(this.cbx_tu)
destroy(this.cbx_we)
destroy(this.cbx_th)
destroy(this.cbx_fr)
destroy(this.cbx_sa)
destroy(this.cb_ok)
end on

event open;call super::open;string ls_param
ls_param = Message.StringParm

this.x = 2000
this.y = 900

if pos (ls_param,'MO') > 0 then cbx_mo.checked = TRUE
if pos (ls_param,'TU') > 0 then cbx_tu.checked = TRUE
if pos (ls_param,'WE') > 0 then cbx_we.checked = TRUE
if pos (ls_param,'TH') > 0 then cbx_th.checked = TRUE
if pos (ls_param,'FR') > 0 then cbx_fr.checked = TRUE
if pos (ls_param,'SA') > 0 then cbx_sa.checked = TRUE

end event

type cbx_mo from checkbox within w_dayselector
int X=82
int Y=52
int Width=407
int Height=76
boolean BringToTop=true
string Text="Monday"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_dayselector
int X=37
int Y=4
int Width=480
int Height=412
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_tu from checkbox within w_dayselector
int X=82
int Y=116
int Width=407
int Height=76
boolean BringToTop=true
string Text="Tuesday"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_we from checkbox within w_dayselector
int X=82
int Y=180
int Width=407
int Height=76
boolean BringToTop=true
string Text="Wednesday"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_th from checkbox within w_dayselector
int X=82
int Y=244
int Width=407
int Height=76
boolean BringToTop=true
string Text="Thursday"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_fr from checkbox within w_dayselector
int X=82
int Y=308
int Width=407
int Height=76
boolean BringToTop=true
string Text="Friday"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_sa from checkbox within w_dayselector
int X=82
int Y=372
int Width=407
int Height=76
boolean Visible=false
boolean BringToTop=true
string Text="Saturday"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_ok from commandbutton within w_dayselector
int X=37
int Y=432
int Width=475
int Height=84
int TabOrder=1
boolean BringToTop=true
string Text="Ok"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_return

ls_return = ''

if cbx_mo.checked then ls_return = ls_return + 'MO '
if cbx_tu.checked then ls_return = ls_return + 'TU '
if cbx_we.checked then ls_return = ls_return + 'WE '
if cbx_th.checked then ls_return = ls_return + 'TH '
if cbx_fr.checked then ls_return = ls_return + 'FR '
if cbx_sa.checked then ls_return = ls_return + 'SA '

CloseWithReturn ( parent, trim(ls_return) )
end event

