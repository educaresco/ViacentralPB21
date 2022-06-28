$PBExportHeader$w_busca_telefono.srw
forward
global type w_busca_telefono from wb_response
end type
type st_1 from statictext within w_busca_telefono
end type
type em_1 from editmask within w_busca_telefono
end type
type dw_1 from datawindow within w_busca_telefono
end type
end forward

global type w_busca_telefono from wb_response
int X=713
int Y=600
int Width=1947
int Height=1212
st_1 st_1
em_1 em_1
dw_1 dw_1
end type
global w_busca_telefono w_busca_telefono

type variables
string	ls_branch
end variables

on w_busca_telefono.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_busca_telefono.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.dw_1)
end on

event open;call super::open;dw_1.settransobject(sqlca)

ls_branch = message.stringparm
end event

type st_1 from statictext within w_busca_telefono
int X=361
int Y=52
int Width=576
int Height=56
boolean Enabled=false
boolean BringToTop=true
string Text="Type the phone number :"
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

type em_1 from editmask within w_busca_telefono
int X=974
int Y=32
int Width=402
int Height=100
int TabOrder=10
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="##########"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;dw_1.retrieve(ls_branch,Double(em_1.text))
end event

type dw_1 from datawindow within w_busca_telefono
int Y=160
int Width=1929
int Height=928
int TabOrder=20
boolean BringToTop=true
string DataObject="dw_busca_telefono"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event clicked;if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
end if

end event

event doubleclicked;long		ll_row
double	ld_sender
Double	ll_id_sender

ll_row = dw_1.GetSelectedRow(0)
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ll_id_sender = dw_1.getitemnumber(ll_row,"id_sender")
	closewithreturn(w_busca_telefono,ll_id_sender)
	
end if
end event

