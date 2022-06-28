$PBExportHeader$w_aplication_form.srw
forward
global type w_aplication_form from wb_response
end type
type dw_aplication from datawindow within w_aplication_form
end type
type cb_1 from commandbutton within w_aplication_form
end type
type cb_save from commandbutton within w_aplication_form
end type
end forward

global type w_aplication_form from wb_response
int Width=2853
int Height=1404
dw_aplication dw_aplication
cb_1 cb_1
cb_save cb_save
end type
global w_aplication_form w_aplication_form

on w_aplication_form.create
int iCurrent
call super::create
this.dw_aplication=create dw_aplication
this.cb_1=create cb_1
this.cb_save=create cb_save
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_aplication
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_save
end on

on w_aplication_form.destroy
call super::destroy
destroy(this.dw_aplication)
destroy(this.cb_1)
destroy(this.cb_save)
end on

event open;call super::open;commit ;

string	ls_branch

ls_branch = message.stringparm

if dw_aplication.retrieve(ls_branch) = 0 then
	dw_aplication.insertrow(0)
	dw_aplication.setitem(1,"id_branch",ls_branch)
end if

end event

type dw_aplication from datawindow within w_aplication_form
int X=27
int Y=12
int Width=2807
int Height=1160
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_aplication"
boolean Border=false
boolean LiveScroll=true
end type

event constructor;dw_aplication.settransobject(sqlca)
end event

type cb_1 from commandbutton within w_aplication_form
int X=782
int Y=1192
int Width=617
int Height=76
int TabOrder=20
boolean BringToTop=true
string Text="&Close"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(w_aplication_form)
end event

type cb_save from commandbutton within w_aplication_form
int X=1435
int Y=1192
int Width=617
int Height=76
int TabOrder=30
boolean BringToTop=true
string Text="&Save"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_aplication.update()


commit ;
end event

