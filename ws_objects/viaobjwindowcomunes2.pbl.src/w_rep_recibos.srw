$PBExportHeader$w_rep_recibos.srw
forward
global type w_rep_recibos from wb_report
end type
type sle_1 from singlelineedit within w_rep_recibos
end type
type st_1 from statictext within w_rep_recibos
end type
type st_2 from statictext within w_rep_recibos
end type
type em_receiver from editmask within w_rep_recibos
end type
end forward

global type w_rep_recibos from wb_report
int Width=3615
int Height=1986
boolean TitleBar=true
string Title="Recibos"
sle_1 sle_1
st_1 st_1
st_2 st_2
em_receiver em_receiver
end type
global w_rep_recibos w_rep_recibos

on w_rep_recibos.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_1=create st_1
this.st_2=create st_2
this.em_receiver=create em_receiver
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_receiver
end on

on w_rep_recibos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_receiver)
end on

event open;call super::open;sle_1.text = gs_branch_insta
end event

event pfc_print;
If Messagebox("Verificar","Esta seguro que desea Imprimir ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()




dw_1.print()



return 0
end event

type dw_1 from wb_report`dw_1 within w_rep_recibos
int Y=140
int Width=3563
int Height=1669
int TabOrder=30
boolean BringToTop=true
string DataObject="dw_recibo"
end type

event dw_1::constructor;SetTransObject(SQLCA)
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type sle_1 from singlelineedit within w_rep_recibos
int X=1488
int Y=21
int Width=251
int Height=101
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_rep_recibos
int X=1225
int Y=45
int Width=251
int Height=73
boolean Enabled=false
boolean BringToTop=true
string Text="Agencia :"
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

type st_2 from statictext within w_rep_recibos
int X=1815
int Y=35
int Width=116
int Height=73
boolean Enabled=false
boolean BringToTop=true
string Text="Ref :"
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

type em_receiver from editmask within w_rep_recibos
int X=1939
int Y=17
int Width=403
int Height=101
int TabOrder=20
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="##########"
boolean Spin=true
double Increment=1
string MinMax="1~~99999"
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;dw_1.retrieve(sle_1.text,Double(em_receiver.text))
end event

event losefocus;dw_1.retrieve(sle_1.text,Double(em_receiver.text))
end event

