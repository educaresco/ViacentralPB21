$PBExportHeader$w_rep_ordersbysender.srw
forward
global type w_rep_ordersbysender from w2_master_report_dates
end type
type sle_nombre from singlelineedit within w_rep_ordersbysender
end type
type ddlb_type from dropdownlistbox within w_rep_ordersbysender
end type
end forward

global type w_rep_ordersbysender from w2_master_report_dates
integer x = 214
integer y = 221
integer width = 3214
integer height = 1928
sle_nombre sle_nombre
ddlb_type ddlb_type
end type
global w_rep_ordersbysender w_rep_ordersbysender

on w_rep_ordersbysender.create
int iCurrent
call super::create
this.sle_nombre=create sle_nombre
this.ddlb_type=create ddlb_type
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_nombre
this.Control[iCurrent+2]=this.ddlb_type
end on

on w_rep_ordersbysender.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_nombre)
destroy(this.ddlb_type)
end on

event open;call super::open;ddlb_type.text = 'Sender:'
end event

type st_4 from w2_master_report_dates`st_4 within w_rep_ordersbysender
integer x = 663
end type

type st_3 from w2_master_report_dates`st_3 within w_rep_ordersbysender
end type

type cb_query from w2_master_report_dates`cb_query within w_rep_ordersbysender
integer x = 2715
integer weight = 700
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String			ls_nombre, ls_type


Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_nombre = trim(sle_nombre.text)

if ls_nombre = '' or len(ls_nombre) < 5 then
	Messagebox ("Error","Please enter a name (at least 5 chars)",StopSign!)
	setfocus(sle_nombre)
	return	
end if

if ddlb_type.text = 'Sender:' then
	ls_type = 'S'
elseif ddlb_type.text = 'Beneficiary:' then
	ls_type = 'R'
else
	ls_type = 'B'
end if


dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_nombre,ls_type)
dw_1.setfocus()

Setpointer(Arrow!)
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_rep_ordersbysender
end type

type em_date1 from w2_master_report_dates`em_date1 within w_rep_ordersbysender
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_rep_ordersbysender
integer x = 1097
end type

type em_date2 from w2_master_report_dates`em_date2 within w_rep_ordersbysender
integer x = 773
end type

type dw_1 from w2_master_report_dates`dw_1 within w_rep_ordersbysender
string dataobject = "dw_rep_ordersbysender"
end type

type gb_1 from w2_master_report_dates`gb_1 within w_rep_ordersbysender
integer width = 3109
end type

type sle_nombre from singlelineedit within w_rep_ordersbysender
integer x = 1838
integer y = 64
integer width = 855
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
textcase textcase = upper!
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type ddlb_type from dropdownlistbox within w_rep_ordersbysender
integer x = 1225
integer y = 68
integer width = 599
integer height = 332
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
string item[] = {"Sender:","Beneficiary:","Sender or Beneficiary:"}
borderstyle borderstyle = stylelowered!
end type

