$PBExportHeader$wb_report_fechas.srw
forward
global type wb_report_fechas from w_sheet
end type
type dw_1 from u_dw within wb_report_fechas
end type
type em_fecha1 from u_em within wb_report_fechas
end type
type st_1 from statictext within wb_report_fechas
end type
type st_2 from statictext within wb_report_fechas
end type
type em_fecha2 from u_em within wb_report_fechas
end type
end forward

global type wb_report_fechas from w_sheet
boolean visible = false
integer width = 3218
integer height = 1912
string menuname = "mb_report"
dw_1 dw_1
em_fecha1 em_fecha1
st_1 st_1
st_2 st_2
em_fecha2 em_fecha2
end type
global wb_report_fechas wb_report_fechas

on wb_report_fechas.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.dw_1=create dw_1
this.em_fecha1=create em_fecha1
this.st_1=create st_1
this.st_2=create st_2
this.em_fecha2=create em_fecha2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.em_fecha1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.em_fecha2
end on

on wb_report_fechas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.em_fecha1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_fecha2)
end on

event pfc_saveas;dw_1.saveas()
end event

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Initialize the Window Resize Service.
//
//////////////////////////////////////////////////////////////////////////////

//Initialize the Window Resize Functionality
of_SetResize(true)
inv_resize.of_SetMinSize(1884, 873)
inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)
end event

event open;call super::open;X=1
Y=1
Show()

em_fecha1.text = String(Today())
em_fecha2.text = String(Today())
end event

event pfc_print;
If Messagebox("Question","Do you want to print Now ",Question!,YesNo!) = 2 Then
	Return 0
end if

Printsetup()




dw_1.print()



return 0
end event

event resize;call super::resize;dw_1.height = this.height - dw_1.y - 150
dw_1.width = this.width - dw_1.x - 80
end event

type dw_1 from u_dw within wb_report_fechas
integer y = 156
integer width = 3145
integer height = 1540
integer taborder = 30
boolean bringtotop = true
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;
// 04/23/2018: connects to readonly DB
SetTransObject(SQLCArpt)

//SetTransObject(SQLCA)
of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)

end event

type em_fecha1 from u_em within wb_report_fechas
integer x = 951
integer y = 32
integer width = 384
integer height = 80
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 0
string minmax = "01/01/1990~~01/01/2010"
end type

type st_1 from statictext within wb_report_fechas
integer x = 585
integer y = 40
integer width = 366
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Date Begin :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within wb_report_fechas
integer x = 1499
integer y = 40
integer width = 366
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Date End :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fecha2 from u_em within wb_report_fechas
integer x = 1865
integer y = 32
integer width = 384
integer height = 80
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 0
string minmax = "01/01/1990~~01/01/2010"
end type

event modified;Date		ld_fecha1, ld_fecha2

Setpointer(Hourglass!)

ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)

dw_1.Retrieve(date(em_fecha1.text),date(em_fecha2.text))

dw_1.setfocus()
Setpointer(Arrow!)
end event

