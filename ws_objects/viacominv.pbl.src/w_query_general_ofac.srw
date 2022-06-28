$PBExportHeader$w_query_general_ofac.srw
forward
global type w_query_general_ofac from w_base_query
end type
type pb_print from u_pb within w_query_general_ofac
end type
end forward

global type w_query_general_ofac from w_base_query
int Width=2501
int Height=1308
boolean TitleBar=true
string Title="Search OFAC"
pb_print pb_print
end type
global w_query_general_ofac w_query_general_ofac

on w_query_general_ofac.create
int iCurrent
call super::create
this.pb_print=create pb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_print
end on

on w_query_general_ofac.destroy
call super::destroy
destroy(this.pb_print)
end on

type dw_1 from w_base_query`dw_1 within w_query_general_ofac
int Y=24
int Width=2437
int Height=976
boolean BringToTop=true
string DataObject="dw_query_ofac"
boolean HScrollBar=false
boolean VScrollBar=false
end type

type pb_query from w_base_query`pb_query within w_query_general_ofac
int X=384
int Y=1084
boolean BringToTop=true
end type

type pb_exit from w_base_query`pb_exit within w_query_general_ofac
int X=1714
int Y=1076
boolean BringToTop=true
end type

type st_count from w_base_query`st_count within w_query_general_ofac
int X=27
int Y=1000
boolean BringToTop=true
end type

type pb_clean from w_base_query`pb_clean within w_query_general_ofac
int X=27
int Y=1084
int TabOrder=60
boolean BringToTop=true
end type

type pb_pick from w_base_query`pb_pick within w_query_general_ofac
int X=736
boolean Visible=false
boolean BringToTop=true
end type

type pb_sort from w_base_query`pb_sort within w_query_general_ofac
int X=741
int Y=1084
int TabOrder=50
boolean BringToTop=true
end type

type pb_print from u_pb within w_query_general_ofac
int X=1097
int Y=1084
int Height=100
int TabOrder=30
boolean BringToTop=true
string Text="&Print"
end type

event clicked;printsetup()
dw_1.print()
end event

