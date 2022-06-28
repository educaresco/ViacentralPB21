$PBExportHeader$w_documento_sender_consulta.srw
forward
global type w_documento_sender_consulta from wb_response
end type
type dw_1 from datawindow within w_documento_sender_consulta
end type
end forward

global type w_documento_sender_consulta from wb_response
int X=582
int Y=300
int Width=2470
int Height=1983
boolean TitleBar=true
string Title="Consulting Sender's Identification"
dw_1 dw_1
end type
global w_documento_sender_consulta w_documento_sender_consulta

on w_documento_sender_consulta.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_documento_sender_consulta.destroy
call super::destroy
destroy(this.dw_1)
end on

event open;call super::open;dw_1.settransobject(sqlca)

Double	ld_sender

ld_sender = message.doubleparm

dw_1.retrieve(ld_sender,gs_branch_insta_cons)
end event

type dw_1 from datawindow within w_documento_sender_consulta
int Width=2414
int Height=1889
int TabOrder=10
boolean BringToTop=true
string DataObject="dw_documento_sender_argumentos"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

