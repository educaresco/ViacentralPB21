$PBExportHeader$w_ingreso_manager.srw
forward
global type w_ingreso_manager from Window
end type
type cb_update from commandbutton within w_ingreso_manager
end type
type cb_close from commandbutton within w_ingreso_manager
end type
type dw_1 from datawindow within w_ingreso_manager
end type
end forward

global type w_ingreso_manager from Window
int X=727
int Y=652
int Width=1563
int Height=488
boolean TitleBar=true
string Title="Manager"
long BackColor=80269524
boolean MinBox=true
boolean Resizable=true
cb_update cb_update
cb_close cb_close
dw_1 dw_1
end type
global w_ingreso_manager w_ingreso_manager

on w_ingreso_manager.create
this.cb_update=create cb_update
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cb_update,&
this.cb_close,&
this.dw_1}
end on

on w_ingreso_manager.destroy
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.dw_1)
end on

event open;string		ls_branch
long			ll_row

dw_1.settransobject(sqlca)

If dw_1.retrieve(gs_branch_insta_cons) = 0 then
	ll_row = dw_1.insertrow(0)
	dw_1.setitem(ll_row,"id_branch",gs_branch_insta_cons)
else
	
end if

	dw_1.setfocus()
end event

type cb_update from commandbutton within w_ingreso_manager
int X=718
int Y=264
int Width=439
int Height=80
int TabOrder=20
string Text="&Save"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.update()
end event

type cb_close from commandbutton within w_ingreso_manager
int X=270
int Y=264
int Width=439
int Height=80
int TabOrder=20
string Text="&Close"
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string	ls_manager


ls_manager = dw_1.getitemstring(dw_1.getrow(),"name_manager")


dw_1.update()



//closewithreturn(w_ingreso_manager,ls_manager)

Close(w_ingreso_manager)
end event

type dw_1 from datawindow within w_ingreso_manager
int X=14
int Y=28
int Width=1495
int Height=220
int TabOrder=10
string DataObject="dw_ingreso_manager"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

