$PBExportHeader$w_oklahoma_report_quarter.srw
forward
global type w_oklahoma_report_quarter from w_sheet
end type
type st_9 from statictext within w_oklahoma_report_quarter
end type
type st_taxover500 from statictext within w_oklahoma_report_quarter
end type
type st_15 from statictext within w_oklahoma_report_quarter
end type
type st_14 from statictext within w_oklahoma_report_quarter
end type
type st_13 from statictext within w_oklahoma_report_quarter
end type
type st_total_amount from statictext within w_oklahoma_report_quarter
end type
type st_11 from statictext within w_oklahoma_report_quarter
end type
type st_cancelled_amount from statictext within w_oklahoma_report_quarter
end type
type st_amount from statictext within w_oklahoma_report_quarter
end type
type st_totaltax_under500 from statictext within w_oklahoma_report_quarter
end type
type st_orders_under_500 from statictext within w_oklahoma_report_quarter
end type
type st_8 from statictext within w_oklahoma_report_quarter
end type
type st_7 from statictext within w_oklahoma_report_quarter
end type
type st_6 from statictext within w_oklahoma_report_quarter
end type
type st_5 from statictext within w_oklahoma_report_quarter
end type
type st_4 from statictext within w_oklahoma_report_quarter
end type
type sle_taxline_2 from singlelineedit within w_oklahoma_report_quarter
end type
type st_3 from statictext within w_oklahoma_report_quarter
end type
type sle_taxline_1 from singlelineedit within w_oklahoma_report_quarter
end type
type cb_generate_file from commandbutton within w_oklahoma_report_quarter
end type
type st_2 from statictext within w_oklahoma_report_quarter
end type
type st_1 from statictext within w_oklahoma_report_quarter
end type
type cb_query from commandbutton within w_oklahoma_report_quarter
end type
type dw_1 from u_dw within w_oklahoma_report_quarter
end type
type ddlb_quarter from dropdownlistbox within w_oklahoma_report_quarter
end type
type em_year from editmask within w_oklahoma_report_quarter
end type
type gb_2 from groupbox within w_oklahoma_report_quarter
end type
type gb_1 from groupbox within w_oklahoma_report_quarter
end type
type st_line from statictext within w_oklahoma_report_quarter
end type
type st_total_orders from statictext within w_oklahoma_report_quarter
end type
type st_cancelations from statictext within w_oklahoma_report_quarter
end type
end forward

global type w_oklahoma_report_quarter from w_sheet
boolean visible = false
integer width = 2656
integer height = 2428
string menuname = "mb_report"
st_9 st_9
st_taxover500 st_taxover500
st_15 st_15
st_14 st_14
st_13 st_13
st_total_amount st_total_amount
st_11 st_11
st_cancelled_amount st_cancelled_amount
st_amount st_amount
st_totaltax_under500 st_totaltax_under500
st_orders_under_500 st_orders_under_500
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
sle_taxline_2 sle_taxline_2
st_3 st_3
sle_taxline_1 sle_taxline_1
cb_generate_file cb_generate_file
st_2 st_2
st_1 st_1
cb_query cb_query
dw_1 dw_1
ddlb_quarter ddlb_quarter
em_year em_year
gb_2 gb_2
gb_1 gb_1
st_line st_line
st_total_orders st_total_orders
st_cancelations st_cancelations
end type
global w_oklahoma_report_quarter w_oklahoma_report_quarter

type variables
STRING is_filepath
datetime idt_date_to
end variables

forward prototypes
public subroutine wf_generatefile ()
end prototypes

public subroutine wf_generatefile ();Long ll_rows, ll_i, ll_csvfile
String ls_line,  ls_filename, ls_invoice, ls_header, ls_date_transaction, s_date_to, s_date_transmission, ls_net_amount_receiver, ls_amount, ls_detail, ls_trailer
string ls_quarter_period_end, ls_taxamount_under_500, ls_taxamount_over_500, ls_amounttax, ls_total_amount, ls_amounttotal
Double ld_total, ld_ver_deposit, ld_id_receiver, ld_amount, ld_reqverification, ld_position, ld_total_negative, ld_total_transactions, ld_pos
double ld_taxamount_under_500, ld_total_wires_under_500, ld_taxamount_over_500, ld_total_amount, ld_pos_over_500, ld_pos_500, ld_total_positive_amount
double ld_total_positive_under_500, ld_total_positive_over_500, ld_total_under_500, ld_totalnegative_under_500, ld_totalnegative_over_500, ld_amount_negative

ls_filename = mid(is_filepath,lastpos(is_filepath,"\")+1)



//Messagebox("",ls_filename)


if fileexists(is_filepath) then
	Messagebox("Existing File!","The selected File Name already Exists!",StopSign!)		
	return
end if

//datetime ld_nextbusinessday

SetPointer(Hourglass!)

//SELECT dba.sfGetNextBusinessDay(getdate())
//INTO :ld_nextbusinessday
//FROM dba.dual;
 
ld_taxamount_under_500 = 0 
ld_total_wires_under_500 = 0
ld_total_negative = 0
ld_taxamount_over_500 = 0
ld_total_amount = 0
ld_total_positive_under_500 = 0
ld_total_positive_over_500 = 0
ld_total_under_500 = 0
ld_totalnegative_under_500 = 0
ld_totalnegative_over_500 = 0
ld_total_positive_amount = 0
ld_amount_negative = 0

ll_csvfile = FileOpen(is_filepath, LineMode!, Write!, LockWrite!, Replace!)

ll_rows = dw_1.rowcount() 

s_date_transmission = string(dw_1.getitemdatetime(1,'date_transaction'), "YYYYMMDD")
s_date_to = string(idt_date_to, "YYYYMM")
	
ls_header = 'HDR,'+s_date_transmission+',VIAMERICAS,'+ s_date_to 

Filewrite(ll_csvfile,ls_header)	

For ll_i = 1 to ll_rows
	
	
	
	ls_invoice = dw_1.getitemstring(ll_i,'Invoice')
	ls_date_transaction = string(dw_1.getitemdatetime(ll_i,'Date_receiver'), "YYYYMMDD")
	ls_net_amount_receiver = string(dw_1.getitemnumber(ll_i,'net_amount_receiver'))
	ld_amount = dw_1.getitemnumber(ll_i,'net_amount_receiver')
	
	if ld_amount < 0 then
		ld_total_negative = ld_total_negative + 1
	end if
	
	if ld_amount <= 500  and ld_amount > 0 then
		
		ld_total_wires_under_500 = ld_total_wires_under_500 + 1
		ld_taxamount_under_500 = ld_taxamount_under_500 + 5
		ld_total_positive_under_500 =  ld_total_positive_under_500 + 1
		ld_total_under_500 = ld_total_under_500 + 1
		
	end if
	
	if ld_amount > 500 then
		
		ld_taxamount_over_500 = ld_taxamount_over_500 + ( ld_amount * 0.01 )
		ld_total_amount = ld_total_amount + ld_amount
		ld_total_positive_over_500 = ld_total_positive_over_500 + 1
		ld_total_positive_amount = ld_total_positive_amount + ld_amount
		
	end if
	
	
	
	if ld_amount < 0 and ld_amount >= -500 then
		ld_total_wires_under_500 = ld_total_wires_under_500 - 1
		ld_taxamount_under_500 = ld_taxamount_under_500 - 5
		ld_totalnegative_under_500 = ld_totalnegative_under_500 + 1
		
	end if
	
	if ld_amount < -500 then
		
		ld_taxamount_over_500 = ld_taxamount_over_500 + (ld_amount * 0.01)
		ld_total_amount = ld_total_amount + ld_amount
		ld_totalnegative_over_500 = ld_totalnegative_over_500 + 1
		ld_amount_negative = ld_amount_negative + ld_amount
		
	end if
		
	
	ld_position = pos(ls_net_amount_receiver,'.' )
	
	if ld_position = 0 then
		ls_amount = ls_net_amount_receiver+'00'
		
	else
	
		ls_amount = left(ls_net_amount_receiver, ld_position -1)
		ls_amount = ls_amount + right(ls_net_amount_receiver, 2)
	
	end if	
	
	ls_detail = ls_invoice+','+ls_date_transaction+','+ls_amount
	
	Filewrite(ll_csvfile,ls_detail)			
	
next

if ld_total_negative > 0 then
	 ld_total_transactions = ll_rows - ( ld_total_negative * 2 )
else
	ld_total_transactions = ll_rows
	
end if





	
	

//Federal Employers Identification number = 522225680

//ld_taxamount_over_500
//ld_total_amount

ls_taxamount_over_500 = string(ld_taxamount_over_500,"#######.00")

ld_pos_over_500 = pos(ls_taxamount_over_500,'.' )
	
	if ld_pos_over_500 = 0 then
		ls_amounttax = ls_taxamount_over_500+'00'
		
	else
	
		ls_amounttax = left(ls_taxamount_over_500, ld_pos_over_500 -1)
		ls_amounttax = ls_amounttax + right(ls_taxamount_over_500, 2)
	
	end if	
	
	
ls_total_amount = string(ld_total_amount,"#######.00")

ld_pos_500 = pos(ls_total_amount,'.' )

	if ld_pos_500 = 0 then
		ls_amounttotal = ls_total_amount+'00'
		
	else
	
		ls_amounttotal = left(ls_total_amount, ld_pos_500 -1)
		ls_amounttotal = ls_amounttotal + right(ls_total_amount, 2)
	
	end if	

ls_taxamount_under_500 = string(ld_taxamount_under_500)+'00'

ls_quarter_period_end = string(idt_date_to , "YYMMDD")

//sle_taxline_1.text = '705TXP*F522225680*20040*'+ ls_quarter_period_end+ '*T*' + ls_taxamount_under_500+ '*F*' +string(ld_total_wires_under_500)+ '\'
//
//sle_taxline_2.text = '705TXP*F522225680*20050*'+ls_quarter_period_end + '*T*'+ ls_amounttax + '*F*' + ls_amounttotal + '\'

sle_taxline_1.text = 'TXP*F522225680*20040*'+ ls_quarter_period_end+ '*T*' + ls_taxamount_under_500+ '\'

sle_taxline_2.text = 'TXP*F522225680*20050*'+ls_quarter_period_end + '*T*'+ ls_amounttax + '\'


st_orders_under_500.text = string(ld_total_under_500)
st_cancelations.text ='-' + string(ld_totalnegative_under_500) 
st_total_orders.text = string(ld_total_wires_under_500)
st_totaltax_under500.text = '(Tax is $5 each = $'+ string(ld_taxamount_under_500,"###,###.00") + ')'
st_6.text = 'Orders ($'+string(ld_total_under_500 * 5)+ ')'
st_7.text = 'Cancellations ($'+string(ld_totalnegative_under_500 * 5 )+')'
st_amount.text = '$'+ string(ld_total_positive_amount,"#,###,###.00")
st_cancelled_amount.text = '$'+ string(ld_amount_negative,"#,###,###.00")
st_total_amount.text = '$'+string(ld_total_amount,"#,###,###.00")
st_13.text = 'Amount ('+string(ld_total_positive_over_500) +' Orders)'
st_14.text = 'Cancelled Amount (' +string(ld_totalnegative_over_500)+' Orders)'
st_taxover500.text = '(Tax is 1% = $' +string((ld_total_amount*0.01),"###,###.00") + ')'

ls_trailer = 'TLR,'+string(ld_total_transactions)

if Filewrite(ll_csvfile,ls_trailer)	> 0 then
	
	messagebox('Alert','File Created',exclamation!)
	
	end if

FileClose(ll_csvfile)



end subroutine

on w_oklahoma_report_quarter.create
int iCurrent
call super::create
if this.MenuName = "mb_report" then this.MenuID = create mb_report
this.st_9=create st_9
this.st_taxover500=create st_taxover500
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_total_amount=create st_total_amount
this.st_11=create st_11
this.st_cancelled_amount=create st_cancelled_amount
this.st_amount=create st_amount
this.st_totaltax_under500=create st_totaltax_under500
this.st_orders_under_500=create st_orders_under_500
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.sle_taxline_2=create sle_taxline_2
this.st_3=create st_3
this.sle_taxline_1=create sle_taxline_1
this.cb_generate_file=create cb_generate_file
this.st_2=create st_2
this.st_1=create st_1
this.cb_query=create cb_query
this.dw_1=create dw_1
this.ddlb_quarter=create ddlb_quarter
this.em_year=create em_year
this.gb_2=create gb_2
this.gb_1=create gb_1
this.st_line=create st_line
this.st_total_orders=create st_total_orders
this.st_cancelations=create st_cancelations
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_9
this.Control[iCurrent+2]=this.st_taxover500
this.Control[iCurrent+3]=this.st_15
this.Control[iCurrent+4]=this.st_14
this.Control[iCurrent+5]=this.st_13
this.Control[iCurrent+6]=this.st_total_amount
this.Control[iCurrent+7]=this.st_11
this.Control[iCurrent+8]=this.st_cancelled_amount
this.Control[iCurrent+9]=this.st_amount
this.Control[iCurrent+10]=this.st_totaltax_under500
this.Control[iCurrent+11]=this.st_orders_under_500
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.st_6
this.Control[iCurrent+15]=this.st_5
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.sle_taxline_2
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.sle_taxline_1
this.Control[iCurrent+20]=this.cb_generate_file
this.Control[iCurrent+21]=this.st_2
this.Control[iCurrent+22]=this.st_1
this.Control[iCurrent+23]=this.cb_query
this.Control[iCurrent+24]=this.dw_1
this.Control[iCurrent+25]=this.ddlb_quarter
this.Control[iCurrent+26]=this.em_year
this.Control[iCurrent+27]=this.gb_2
this.Control[iCurrent+28]=this.gb_1
this.Control[iCurrent+29]=this.st_line
this.Control[iCurrent+30]=this.st_total_orders
this.Control[iCurrent+31]=this.st_cancelations
end on

on w_oklahoma_report_quarter.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_9)
destroy(this.st_taxover500)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_total_amount)
destroy(this.st_11)
destroy(this.st_cancelled_amount)
destroy(this.st_amount)
destroy(this.st_totaltax_under500)
destroy(this.st_orders_under_500)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_taxline_2)
destroy(this.st_3)
destroy(this.sle_taxline_1)
destroy(this.cb_generate_file)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_query)
destroy(this.dw_1)
destroy(this.ddlb_quarter)
destroy(this.em_year)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.st_line)
destroy(this.st_total_orders)
destroy(this.st_cancelations)
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
this.of_SetResize(true)
this.inv_resize.of_SetMinSize(1884, 873)
this.inv_resize.of_SetOrigSize(1200, 1000)
this.inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)
end event

event open;call super::open;X=1
Y=1
Show()


string s_parm

//s_parm = Message.StringParm
//dw_1.dataobject = fn_token(s_parm,'/',1)
//this.title = fn_token(s_parm,'/',2)

em_year.text = string(year(today()))


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

type st_9 from statictext within w_oklahoma_report_quarter
integer x = 1271
integer y = 488
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Orders Above $500:"
boolean focusrectangle = false
end type

type st_taxover500 from statictext within w_oklahoma_report_quarter
integer x = 1271
integer y = 844
integer width = 955
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_15 from statictext within w_oklahoma_report_quarter
integer x = 1746
integer y = 720
integer width = 818
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Total Amount"
boolean focusrectangle = false
end type

type st_14 from statictext within w_oklahoma_report_quarter
integer x = 1746
integer y = 640
integer width = 818
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Cancelled Amount"
boolean focusrectangle = false
end type

type st_13 from statictext within w_oklahoma_report_quarter
integer x = 1746
integer y = 568
integer width = 818
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Amount"
boolean focusrectangle = false
end type

type st_total_amount from statictext within w_oklahoma_report_quarter
integer x = 1280
integer y = 720
integer width = 402
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within w_oklahoma_report_quarter
integer x = 1280
integer y = 664
integer width = 421
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "______________"
boolean focusrectangle = false
end type

type st_cancelled_amount from statictext within w_oklahoma_report_quarter
integer x = 1280
integer y = 640
integer width = 402
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_amount from statictext within w_oklahoma_report_quarter
integer x = 1280
integer y = 568
integer width = 402
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_totaltax_under500 from statictext within w_oklahoma_report_quarter
integer x = 91
integer y = 844
integer width = 955
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_orders_under_500 from statictext within w_oklahoma_report_quarter
integer x = 91
integer y = 568
integer width = 402
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_oklahoma_report_quarter
integer x = 553
integer y = 720
integer width = 343
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Total Orders"
boolean focusrectangle = false
end type

type st_7 from statictext within w_oklahoma_report_quarter
integer x = 558
integer y = 640
integer width = 690
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Cancelations"
boolean focusrectangle = false
end type

type st_6 from statictext within w_oklahoma_report_quarter
integer x = 558
integer y = 568
integer width = 690
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Orders"
boolean focusrectangle = false
end type

type st_5 from statictext within w_oklahoma_report_quarter
integer x = 69
integer y = 488
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Orders Below $500:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_oklahoma_report_quarter
integer x = 174
integer y = 372
integer width = 599
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Transactions  over $500:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_taxline_2 from singlelineedit within w_oklahoma_report_quarter
integer x = 782
integer y = 372
integer width = 1536
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_oklahoma_report_quarter
integer x = 174
integer y = 264
integer width = 599
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Transactions $500 or Less:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_taxline_1 from singlelineedit within w_oklahoma_report_quarter
integer x = 782
integer y = 256
integer width = 1536
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_generate_file from commandbutton within w_oklahoma_report_quarter
integer x = 2098
integer y = 60
integer width = 402
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Generate file"
end type

event clicked;string ls_path, ls_file, ls_quarter_end, ls_filename
int li_rc
double ld_pos

is_filepath = ""

// ls_path = "" // aqui se puede poner el path default para abrir el dialogo

ls_quarter_end = string(idt_date_to, "YYYYMM")


li_rc = getfolder("Select folder",ls_path)
//li_rc = GetFilesaveName ( "Select File",  ls_path,ls_file,"CSV",  "Comma Separated Files (*.csv),*.csv" , "", 32770)


ls_file = '\VIAMERICAS_WireFee_'+ ls_quarter_end+'.CSV'


IF li_rc = 1 Then
   is_filepath = ls_path
End If



//is_filepath = is_filepath + ls_file



if is_filepath = "" then	
	Messagebox("No File Selected","Operation Canceled",StopSign!)
else
	
	is_filepath = is_filepath + ls_file
	if Messagebox("Confirmation","Do you want to generate the file "+is_filepath+" with the selected customers?",Question!,YesNo!) <> 1 then
		Messagebox("Operation Canceled","Operation Canceled by the user",Exclamation!)
		return
	end if
	
	wf_generatefile()
	
end if
end event

type st_2 from statictext within w_oklahoma_report_quarter
integer x = 87
integer y = 76
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Year:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_oklahoma_report_quarter
integer x = 672
integer y = 76
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Quarter:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_query from commandbutton within w_oklahoma_report_quarter
integer x = 1568
integer y = 60
integer width = 366
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
boolean default = true
end type

event clicked;
datetime dt_date_from


// <><><><><><><><><><><><><><><><>
// Clean Fields!
sle_taxline_1.text = ''
sle_taxline_2.text = ''
st_orders_under_500.text = ''
st_cancelations.text = ''
st_total_orders.text = ''
st_totaltax_under500.text = ''
st_6.text = 'Orders'
st_7.text = 'Cancelations'
st_amount.text = ''
st_cancelled_amount.text = ''
st_total_amount.text = ''
st_13.text = 'Amount'
st_14.text = 'Cancelled Amount'
st_taxover500.text = ''
// <><><><><><><><><><><><><><><><>


IF ddlb_quarter.text = '1' THEN
	
	dt_date_from = datetime('01-01-'+em_year.text+ ' 00:00:00')
	idt_date_to = datetime('03-31-'+em_year.text+ ' 23:59:59')
	
ELSEIF  ddlb_quarter.text = '2' THEN
	
	dt_date_from = datetime('04-01-'+em_year.text+ ' 00:00:00')
	idt_date_to = datetime('06-30-'+em_year.text+ ' 23:59:59')
	
ELSEIF  ddlb_quarter.text = '3' THEN
	
	dt_date_from = datetime('07-01-'+em_year.text+ ' 00:00:00')
	idt_date_to = datetime('09-30-'+em_year.text+ ' 23:59:59')
	
ELSEIF  ddlb_quarter.text = '4' THEN
	
	dt_date_from = datetime('10-01-'+em_year.text+ ' 00:00:00')
	idt_date_to = datetime('12-31-'+em_year.text+ ' 23:59:59')
	
END IF

dw_1.settransobject(sqlca)

dw_1.retrieve(dt_date_from, idt_date_to)


if dw_1.rowcount() > 0 then
	
	cb_generate_file.enabled = true
	
end if
end event

type dw_1 from u_dw within w_oklahoma_report_quarter
integer x = 23
integer y = 956
integer width = 2560
integer height = 1228
integer taborder = 0
boolean bringtotop = true
string dataobject = "dw_oklahoma_report"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event constructor;SetTransObject(SQLCA)
this.of_setfilter(true)
this.of_setsort(true)
this.of_setprintpreview(true)
this.of_SetFind(true)

end event

type ddlb_quarter from dropdownlistbox within w_oklahoma_report_quarter
integer x = 951
integer y = 68
integer width = 411
integer height = 324
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"1","2","3","4"}
borderstyle borderstyle = stylelowered!
end type

event constructor;ddlb_quarter.text = '1'
end event

type em_year from editmask within w_oklahoma_report_quarter
integer x = 352
integer y = 68
integer width = 247
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
string displaydata = "~t/"
double increment = 1
string minmax = "1999~~2020"
end type

type gb_2 from groupbox within w_oklahoma_report_quarter
integer x = 18
integer width = 2565
integer height = 184
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Range"
end type

type gb_1 from groupbox within w_oklahoma_report_quarter
integer x = 14
integer y = 184
integer width = 2574
integer height = 748
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "ACH Lines"
end type

type st_line from statictext within w_oklahoma_report_quarter
integer x = 91
integer y = 664
integer width = 421
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "______________"
boolean focusrectangle = false
end type

type st_total_orders from statictext within w_oklahoma_report_quarter
integer x = 91
integer y = 720
integer width = 402
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_cancelations from statictext within w_oklahoma_report_quarter
integer x = 91
integer y = 640
integer width = 402
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

