$PBExportHeader$w_busca_control_interno.srw
forward
global type w_busca_control_interno from Window
end type
type st_1 from statictext within w_busca_control_interno
end type
type em_1 from editmask within w_busca_control_interno
end type
type cb_1 from commandbutton within w_busca_control_interno
end type
type dw_1 from u_dw within w_busca_control_interno
end type
end forward

global type w_busca_control_interno from Window
int X=494
int Y=552
int Width=2779
int Height=1364
boolean TitleBar=true
string Title="Internal Control"
long BackColor=80269524
boolean ControlMenu=true
WindowType WindowType=response!
st_1 st_1
em_1 em_1
cb_1 cb_1
dw_1 dw_1
end type
global w_busca_control_interno w_busca_control_interno

type variables
string	is_name
end variables

event open;em_1.text = String(Today())


dw_1.settransobject(sqlca)

IF dw_1.retrieve(Today()) >0 THEN
	dw_1.Scrolltorow(1)
	dw_1.SetRow(1)
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(1, TRUE)
	dw_1.SetFocus()
	return
END IF
end event

on w_busca_control_interno.create
this.st_1=create st_1
this.em_1=create em_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.em_1,&
this.cb_1,&
this.dw_1}
end on

on w_busca_control_interno.destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event key;IF KeyDown(KeyUpArrow!) THEN 
	MessageBox("UP","UP")
END IF

IF dw_1.GetRow() > 0 THEN
	IF KeyDown(KeyUpArrow!) then
		IF dw_1.GetRow() > 1 THEN
			dw_1.SelectRow(0, FALSE)
			dw_1.SelectRow(dw_1.GetRow() - 1, TRUE)
			dw_1.SetRow(dw_1.GetRow() - 1)
			dw_1.ScrollToRow(dw_1.GetRow() - 1)
			Return
		END IF
	ELSEIF KeyDown(KeyDownArrow!) then
		IF dw_1.GetRow() < dw_1.RowCount() THEN
			dw_1.SelectRow(0, FALSE)
			dw_1.SelectRow(dw_1.GetRow()+1, TRUE)
			dw_1.SetRow(dw_1.GetRow()+1)
			dw_1.ScrollToRow(dw_1.GetRow()+1)
			Return
		END IF
	END IF
END IF
end event

type st_1 from statictext within w_busca_control_interno
int X=901
int Y=16
int Width=247
int Height=76
boolean Enabled=false
string Text="Date :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_1 from editmask within w_busca_control_interno
int X=1157
int Y=8
int Width=347
int Height=92
int TabOrder=10
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="mm/dd/yyyy"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;dw_1.retrieve(Date(em_1.text))
end event

type cb_1 from commandbutton within w_busca_control_interno
int X=809
int Y=1164
int Width=247
int Height=108
int TabOrder=20
boolean Visible=false
string Text="none"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//cb_select.triggerevent(clicked!)

long		ll_row
Double	ll_internal_control

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ll_internal_control = dw_1.getitemnumber(ll_row,"internal_control")
	closewithreturn(w_busca_control_interno,ll_internal_control)
end if
end event

type dw_1 from u_dw within w_busca_control_interno
int X=0
int Y=108
int Width=2761
int Height=1160
int TabOrder=10
string DataObject="dw_internal_control"
end type

event itemchanged;call super::itemchanged;//of_SetTransObject(sqlca) 
//
//of_SetSort(true) 
//
//inv_sort.of_SetStyle(inv_sort.DRAGDROP)
//inv_sort.of_SetColumnNameSource(inv_sort.HEADER)
//inv_sort.of_SetVisibleOnly(true)
//
//inv_sort.of_SetUseDisplay(true)
//of_SetUpdateable(false)
//
//Retrieve(is_name)
end event

event clicked;call super::clicked;if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
end if

end event

event doubleclicked;//cb_select.triggerevent(clicked!)

long		ll_row
Double	ll_internal_control

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ll_internal_control = dw_1.getitemnumber(ll_row,"internal_control")
	closewithreturn(w_busca_control_interno,ll_internal_control)
end if
end event

event rowfocuschanged;call super::rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, TRUE)
SetRow(currentrow)
end event

