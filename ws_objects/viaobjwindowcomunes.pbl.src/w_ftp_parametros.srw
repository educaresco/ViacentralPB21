$PBExportHeader$w_ftp_parametros.srw
forward
global type w_ftp_parametros from Window
end type
type cb_1 from commandbutton within w_ftp_parametros
end type
type dw_1 from datawindow within w_ftp_parametros
end type
end forward

global type w_ftp_parametros from Window
int X=823
int Y=360
int Width=1029
int Height=936
boolean Visible=false
boolean TitleBar=true
string Title="FTP Parameters"
long BackColor=80269524
WindowType WindowType=response!
cb_1 cb_1
dw_1 dw_1
end type
global w_ftp_parametros w_ftp_parametros

on w_ftp_parametros.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_ftp_parametros.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;
X=1
Y=1
Show()

dw_1.settransobject(sqlca)

if dw_1.retrieve() = 0 then
	dw_1.insertrow(0)
	return 
end if
end event

type cb_1 from commandbutton within w_ftp_parametros
int X=9
int Y=708
int Width=987
int Height=88
int TabOrder=20
string Text="&Close"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.update()

Commit ;

Close(w_ftp_parametros)
end event

type dw_1 from datawindow within w_ftp_parametros
int Width=1024
int Height=704
int TabOrder=10
string DataObject="dw_ftp_parametros"
boolean Border=false
boolean LiveScroll=true
end type

