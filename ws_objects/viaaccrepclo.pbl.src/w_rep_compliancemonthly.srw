$PBExportHeader$w_rep_compliancemonthly.srw
forward
global type w_rep_compliancemonthly from w2_master_report_dates
end type
type tab_selector from tab within w_rep_compliancemonthly
end type
type tp_ga from userobject within tab_selector
end type
type tp_ga from userobject within tab_selector
end type
type tp_gb from userobject within tab_selector
end type
type tp_gb from userobject within tab_selector
end type
type tp_gc from userobject within tab_selector
end type
type tp_gc from userobject within tab_selector
end type
type tp_l1 from userobject within tab_selector
end type
type tp_l1 from userobject within tab_selector
end type
type tp_l12 from userobject within tab_selector
end type
type tp_l12 from userobject within tab_selector
end type
type tp_l2 from userobject within tab_selector
end type
type tp_l2 from userobject within tab_selector
end type
type tp_l22 from userobject within tab_selector
end type
type tp_l22 from userobject within tab_selector
end type
type tp_l31 from userobject within tab_selector
end type
type tp_l31 from userobject within tab_selector
end type
type tp_l311 from userobject within tab_selector
end type
type tp_l311 from userobject within tab_selector
end type
type tp_l32 from userobject within tab_selector
end type
type tp_l32 from userobject within tab_selector
end type
type tp_l33 from userobject within tab_selector
end type
type tp_l33 from userobject within tab_selector
end type
type tab_selector from tab within w_rep_compliancemonthly
tp_ga tp_ga
tp_gb tp_gb
tp_gc tp_gc
tp_l1 tp_l1
tp_l12 tp_l12
tp_l2 tp_l2
tp_l22 tp_l22
tp_l31 tp_l31
tp_l311 tp_l311
tp_l32 tp_l32
tp_l33 tp_l33
end type
type dw_ga from u_dw within w_rep_compliancemonthly
end type
type dw_gc from u_dw within w_rep_compliancemonthly
end type
type dw_gb from u_dw within w_rep_compliancemonthly
end type
type dw_l12 from u_dw within w_rep_compliancemonthly
end type
type dw_l22 from u_dw within w_rep_compliancemonthly
end type
type dw_l2 from u_dw within w_rep_compliancemonthly
end type
type dw_l1 from u_dw within w_rep_compliancemonthly
end type
type dw_l31 from u_dw within w_rep_compliancemonthly
end type
type dw_l311 from u_dw within w_rep_compliancemonthly
end type
type dw_l32 from u_dw within w_rep_compliancemonthly
end type
type dw_l33 from u_dw within w_rep_compliancemonthly
end type
type cb_export from commandbutton within w_rep_compliancemonthly
end type
type p_export from picture within w_rep_compliancemonthly
end type
end forward

global type w_rep_compliancemonthly from w2_master_report_dates
integer height = 1928
string title = "Compliance"
tab_selector tab_selector
dw_ga dw_ga
dw_gc dw_gc
dw_gb dw_gb
dw_l12 dw_l12
dw_l22 dw_l22
dw_l2 dw_l2
dw_l1 dw_l1
dw_l31 dw_l31
dw_l311 dw_l311
dw_l32 dw_l32
dw_l33 dw_l33
cb_export cb_export
p_export p_export
end type
global w_rep_compliancemonthly w_rep_compliancemonthly

on w_rep_compliancemonthly.create
int iCurrent
call super::create
this.tab_selector=create tab_selector
this.dw_ga=create dw_ga
this.dw_gc=create dw_gc
this.dw_gb=create dw_gb
this.dw_l12=create dw_l12
this.dw_l22=create dw_l22
this.dw_l2=create dw_l2
this.dw_l1=create dw_l1
this.dw_l31=create dw_l31
this.dw_l311=create dw_l311
this.dw_l32=create dw_l32
this.dw_l33=create dw_l33
this.cb_export=create cb_export
this.p_export=create p_export
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_selector
this.Control[iCurrent+2]=this.dw_ga
this.Control[iCurrent+3]=this.dw_gc
this.Control[iCurrent+4]=this.dw_gb
this.Control[iCurrent+5]=this.dw_l12
this.Control[iCurrent+6]=this.dw_l22
this.Control[iCurrent+7]=this.dw_l2
this.Control[iCurrent+8]=this.dw_l1
this.Control[iCurrent+9]=this.dw_l31
this.Control[iCurrent+10]=this.dw_l311
this.Control[iCurrent+11]=this.dw_l32
this.Control[iCurrent+12]=this.dw_l33
this.Control[iCurrent+13]=this.cb_export
this.Control[iCurrent+14]=this.p_export
end on

on w_rep_compliancemonthly.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_selector)
destroy(this.dw_ga)
destroy(this.dw_gc)
destroy(this.dw_gb)
destroy(this.dw_l12)
destroy(this.dw_l22)
destroy(this.dw_l2)
destroy(this.dw_l1)
destroy(this.dw_l31)
destroy(this.dw_l311)
destroy(this.dw_l32)
destroy(this.dw_l33)
destroy(this.cb_export)
destroy(this.p_export)
end on

type st_4 from w2_master_report_dates`st_4 within w_rep_compliancemonthly
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_compliancemonthly
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_compliancemonthly
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2, ld_Fecha1_Bimonthly


Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))

ld_Fecha1_Bimonthly = datetime(relativedate(date(ld_fecha1),-1),time(00:00:00))

// Busca el mes anterior
DO WHILE month(date(ld_fecha1)) = month(date(ld_Fecha1_Bimonthly))
	ld_Fecha1_Bimonthly = datetime(relativedate(date(ld_fecha1),-1),time(00:00:00))
LOOP

// Determina el inicio del mes anterior

ld_Fecha1_Bimonthly = datetime(date(string(year(date(ld_Fecha1_Bimonthly)))+'-'+string(month(date(ld_Fecha1_Bimonthly)))+'-01'),time("00:00:00"))

dw_ga.retrieve(ld_Fecha1,ld_Fecha2)
dw_gb.retrieve(ld_Fecha1,ld_Fecha2)
dw_gc.retrieve(ld_Fecha1_Bimonthly,ld_Fecha2)
dw_l1.retrieve(ld_Fecha1,ld_Fecha2)
dw_l12.retrieve(ld_Fecha1,ld_Fecha2)
dw_l2.retrieve(ld_Fecha1,ld_Fecha2)
dw_l22.retrieve(ld_Fecha1,ld_Fecha2)
dw_l31.retrieve(ld_Fecha1,ld_Fecha2)
dw_l311.retrieve(ld_Fecha1,ld_Fecha2)
dw_l32.retrieve(ld_Fecha1,ld_Fecha2)
dw_l33.retrieve(ld_Fecha1,ld_Fecha2)

p_export.enabled = true
cb_export.enabled = true

Setpointer(Arrow!)


end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_compliancemonthly
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_compliancemonthly
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_compliancemonthly
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_compliancemonthly
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_compliancemonthly
integer y = 324
integer height = 1376
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_compliancemonthly
integer width = 2400
integer height = 188
end type

type tab_selector from tab within w_rep_compliancemonthly
integer x = 18
integer y = 212
integer width = 3113
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_ga tp_ga
tp_gb tp_gb
tp_gc tp_gc
tp_l1 tp_l1
tp_l12 tp_l12
tp_l2 tp_l2
tp_l22 tp_l22
tp_l31 tp_l31
tp_l311 tp_l311
tp_l32 tp_l32
tp_l33 tp_l33
end type

on tab_selector.create
this.tp_ga=create tp_ga
this.tp_gb=create tp_gb
this.tp_gc=create tp_gc
this.tp_l1=create tp_l1
this.tp_l12=create tp_l12
this.tp_l2=create tp_l2
this.tp_l22=create tp_l22
this.tp_l31=create tp_l31
this.tp_l311=create tp_l311
this.tp_l32=create tp_l32
this.tp_l33=create tp_l33
this.Control[]={this.tp_ga,&
this.tp_gb,&
this.tp_gc,&
this.tp_l1,&
this.tp_l12,&
this.tp_l2,&
this.tp_l22,&
this.tp_l31,&
this.tp_l311,&
this.tp_l32,&
this.tp_l33}
end on

on tab_selector.destroy
destroy(this.tp_ga)
destroy(this.tp_gb)
destroy(this.tp_gc)
destroy(this.tp_l1)
destroy(this.tp_l12)
destroy(this.tp_l2)
destroy(this.tp_l22)
destroy(this.tp_l31)
destroy(this.tp_l311)
destroy(this.tp_l32)
destroy(this.tp_l33)
end on

event selectionchanged;
dw_1.visible = false
dw_ga.visible = false
dw_gb.visible = false
dw_gc.visible = false
dw_l1.visible = false
dw_l12.visible = false
dw_l2.visible = false
dw_l22.visible = false
dw_l31.visible = false
dw_l311.visible = false
dw_l32.visible = false
dw_l33.visible = false

if newindex = 1 then
	dw_ga.visible = true
elseif newindex = 2 then
	dw_gb.visible = true
elseif newindex = 3 then
	dw_gc.visible = true			
elseif newindex = 4 then
	dw_l1.visible = true	
elseif newindex = 5 then
	dw_l12.visible = true			
elseif newindex = 6 then
	dw_l2.visible = true			
elseif newindex = 7 then
	dw_l22.visible = true		
elseif newindex = 8 then
	dw_l31.visible = true		
elseif newindex = 9 then
	dw_l311.visible = true		
elseif newindex = 10 then
	dw_l32.visible = true		
elseif newindex = 11 then
	dw_l33.visible = true		
else
	dw_1.visible = true
end if
end event

type tp_ga from userobject within tab_selector
string tag = "Group A"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Group A"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_gb from userobject within tab_selector
string tag = "Group B"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Group B"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_gc from userobject within tab_selector
string tag = "Group C"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Group C"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_l1 from userobject within tab_selector
string tag = "Level 1"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Level 1"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_l12 from userobject within tab_selector
string tag = "Level 1-2"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Level 1-2"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_l2 from userobject within tab_selector
string tag = "Level 2"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Level 2"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_l22 from userobject within tab_selector
string tag = "Level 2-2"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Level 2-2"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_l31 from userobject within tab_selector
string tag = "Level 3-1"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Level 3-1"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_l311 from userobject within tab_selector
string tag = "Level 3-1-1"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Level 3-1-1"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_l32 from userobject within tab_selector
string tag = "Level 2-3"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Level 3-2"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type tp_l33 from userobject within tab_selector
string tag = "Level 3-3"
integer x = 18
integer y = 104
integer width = 3077
integer height = -4
long backcolor = 79741120
string text = "Level 3-3"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type dw_ga from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_ga"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_gc from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_gc"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_gb from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 50
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_gb"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_l12 from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_l12"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_l22 from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 100
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_l22"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_l2 from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_l2"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_l1 from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_l1"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_l31 from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_l31"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_l311 from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_l311"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_l32 from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 324
integer width = 3118
integer height = 1376
integer taborder = 130
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_l32"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type dw_l33 from u_dw within w_rep_compliancemonthly
integer x = 18
integer y = 304
integer width = 3118
integer height = 1396
integer taborder = 140
boolean bringtotop = true
string dataobject = "dw_compliancemonthly_l33"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

type cb_export from commandbutton within w_rep_compliancemonthly
integer x = 1765
integer y = 60
integer width = 576
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "    Save To Excel"
end type

event clicked;
String ls_Path

ls_Path = fn_browseforfolder(parent, "Select a folder")

SetPointer(HourGlass!)

dw_ga.SaveAs(ls_Path+"\GroupA_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_gb.SaveAs(ls_Path+"\GroupB_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_gc.SaveAs(ls_Path+"\GroupC_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_l1.SaveAs(ls_Path+"\Level1_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_l12.SaveAs(ls_Path+"\Level12_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_l2.SaveAs(ls_Path+"\Level2_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_l22.SaveAs(ls_Path+"\Level22_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_l31.SaveAs(ls_Path+"\Level31_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_l311.SaveAs(ls_Path+"\Level311_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_l32.SaveAs(ls_Path+"\Level32_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)
dw_l33.SaveAs(ls_Path+"\Level33_"+string(date(em_date1.text),"yyyymm")+".xls", Excel!, TRUE)

Messagebox("Process Completed","Files Saved Successfully on "+ls_Path)

SetPointer(Arrow!)
end event

type p_export from picture within w_rep_compliancemonthly
integer x = 1810
integer y = 76
integer width = 73
integer height = 64
boolean bringtotop = true
boolean enabled = false
boolean originalsize = true
string picturename = "Save!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

event clicked;if cb_export.enabled then cb_export.triggerevent(Clicked!)
end event

