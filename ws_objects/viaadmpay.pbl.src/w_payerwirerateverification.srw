$PBExportHeader$w_payerwirerateverification.srw
forward
global type w_payerwirerateverification from w2_master_report_payer
end type
type st_3 from statictext within w_payerwirerateverification
end type
type em_date1 from pfc_u_em within w_payerwirerateverification
end type
type pb_date1 from picturebutton within w_payerwirerateverification
end type
type em_date2 from pfc_u_em within w_payerwirerateverification
end type
type pb_date2 from picturebutton within w_payerwirerateverification
end type
type st_4 from statictext within w_payerwirerateverification
end type
end forward

global type w_payerwirerateverification from w2_master_report_payer
integer width = 4037
integer height = 1924
string menuname = "m_save_option"
event ue_update ( )
st_3 st_3
em_date1 em_date1
pb_date1 pb_date1
em_date2 em_date2
pb_date2 pb_date2
st_4 st_4
end type
global w_payerwirerateverification w_payerwirerateverification

type variables
string is_check, is_new_description
end variables

event ue_update();datetime ld_fecha1, ld_fecha2
string ls_branch_id, ls_description, ls_new_description, ls_new_rate, ls_new_desc_secpart
int l_updatestatus
double ld_pos,ld_rowtotal,row, ld_cons_trans_diaria
boolean lb_cont

dw_1.setColumn("transaccion_diaria_banco_payee_isvalidatedwithbanks")

//if is_check ='Y' then
//	return
//end if 


ld_rowtotal = dw_1.rowcount()


for row = 1 to ld_rowtotal
	
	if dw_1.getitemstatus(row,'transaccion_diaria_banco_payee_exchange_rate',Primary!) = datamodified! then

		ld_cons_trans_diaria = dw_1.getitemnumber(row,"transaccion_diaria_banco_payee_cons_trans_diaria")
		
		ls_description = dw_1.getitemstring(row, 'transaccion_diaria_payee_des_trans_diaria')
 
		ld_pos = pos(ls_description,'@')

		ls_new_description = mid(ls_description,1,ld_pos)
		
		ld_pos = ld_pos+ 1
		
	do while lb_cont = false
		
		ls_new_desc_secpart = mid( ls_description,ld_pos ,1 )
		
		if isnumber(ls_new_desc_secpart) or ls_new_desc_secpart = ' ' or ls_new_desc_secpart = '.' then
			ld_pos = ld_pos + 1
		else
			lb_cont = true
			ls_new_desc_secpart = mid( ls_description,ld_pos)
		end if
		
	loop

		ls_new_rate = string(dw_1.getitemnumber(row,'transaccion_diaria_banco_payee_exchange_rate'), "#####.0000")

		ls_new_description = ls_new_description + ' '+ls_new_rate + ' ' + ls_new_desc_secpart

		UPDATE DBA.TRANSACCION_DIARIA_PAYEE
		SET DES_TRANS_DIARIA = :ls_new_description
		WHERE CONS_TRANS_DIARIA = :ld_cons_trans_diaria;
end if
	
next

 dw_1.update()






cb_query.triggerevent(clicked!)


//ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
//ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
//ls_branch_id = lst_payers.getdataid()
//
//
//if ls_branch_id <> '' then
//
//	dw_1.dataobject = 'dw_payerwirerateverification'
//	dw_1.settransobject(sqlca)
//	dw_1.retrieve(ls_branch_id, ld_fecha1, ld_fecha2)
//	dw_1.setfocus()
//else
//	
//	dw_1.dataobject = 'dw_payerwirerateverificationall'
//	dw_1.settransobject(sqlca)
//	dw_1.retrieve( ld_fecha1, ld_fecha2)
//	dw_1.setfocus()
//	
//end if
//
//setpointer(arrow!)



		
end event

on w_payerwirerateverification.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_save_option" then this.MenuID = create m_save_option
this.st_3=create st_3
this.em_date1=create em_date1
this.pb_date1=create pb_date1
this.em_date2=create em_date2
this.pb_date2=create pb_date2
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.em_date1
this.Control[iCurrent+3]=this.pb_date1
this.Control[iCurrent+4]=this.em_date2
this.Control[iCurrent+5]=this.pb_date2
this.Control[iCurrent+6]=this.st_4
end on

on w_payerwirerateverification.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_3)
destroy(this.em_date1)
destroy(this.pb_date1)
destroy(this.em_date2)
destroy(this.pb_date2)
destroy(this.st_4)
end on

event open;call super::open;em_date1.text = string(today())
em_date2.text = string(today())

lst_payers.insertitem('ALL',1 )
lst_payers.text = 'ALL'
end event

type st_1 from w2_master_report_payer`st_1 within w_payerwirerateverification
integer x = 1586
end type

type sle_payer from w2_master_report_payer`sle_payer within w_payerwirerateverification
integer x = 1870
end type

event sle_payer::modified;call super::modified;lst_payers.setselectedid( sle_payer.text )

// Chequea que este en la lista
IF sle_payer.text <> lst_payers.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF
end event

type cb_query from w2_master_report_payer`cb_query within w_payerwirerateverification
integer x = 3415
integer taborder = 70
end type

event cb_query::clicked;Datetime		ld_fecha1, ld_fecha2
String		ls_branch_id
double rows, i

Setpointer(Hourglass!)

ld_fecha1 = Datetime(Date(em_date1.text),time('00:00:00'))
ld_fecha2 = Datetime(Date(em_date2.text),time('23:59:59'))
ls_branch_id = lst_payers.getdataid()

if ls_branch_id = '' then ls_branch_id = '-ALL-'

dw_1.dataobject = 'dw_payerwirerateverification'
dw_1.settransobject(sqlca)
dw_1.retrieve(ls_branch_id, ld_fecha1, ld_fecha2)
dw_1.setfocus()

setpointer(arrow!)


end event

type dw_1 from w2_master_report_payer`dw_1 within w_payerwirerateverification
integer width = 3945
integer height = 1508
string dataobject = "dw_payerwirerateverification"
boolean ib_rmbmenu = false
end type

event dw_1::itemchanged;call super::itemchanged;double ld_rate_allowance, ld_new_rate, ld_old_rate, test, ld_pos
string ls_description, ls_new_description, ls_new_rate, ls_new_desc_secpart
boolean lb_cont

if dwo.name = 'transaccion_diaria_banco_payee_exchange_rate' then
	
	SELECT min(RATE_ALLOWANCE) 
	INTO :ld_rate_allowance 
	FROM dba.ACC_PARAMETERS	;
	
	ld_new_rate=double( data)
	ld_old_rate = this.getitemnumber( row, 'transaccion_diaria_banco_payee_exchange_rate', Primary!, true)


	if abs((ld_old_rate - ld_new_rate) / ld_old_rate) > ld_rate_allowance then 
	
		messagebox('ALERT', 'The Rate difference is to high in reference with the last rate, please Check the Rate. (±'+String(ld_rate_allowance * 100)+"%)",StopSign!)

		return 2
//		is_check = 'Y'
//		this.setfocus()
//		this.setColumn("transaccion_diaria_banco_payee_exchange_rate")
	
		
	else	


ls_description = this.getitemstring(row, 'transaccion_diaria_payee_des_trans_diaria')

ld_pos = pos(ls_description,'@')

ls_new_description = mid(ls_description,1,ld_pos)

ls_new_rate = string(ld_new_rate,"#####.0000")

ld_pos = ld_pos + 1

do while lb_cont = false
		
		ls_new_desc_secpart = mid( ls_description,ld_pos ,1 )
		
		if isnumber(ls_new_desc_secpart) or ls_new_desc_secpart = ' ' or ls_new_desc_secpart = '.' then
			ld_pos = ld_pos + 1
		else
			lb_cont = true
			ls_new_desc_secpart = mid( ls_description,ld_pos)
		end if
		
	loop

		//ls_new_rate = string(dw_1.getitemnumber(row,'transaccion_diaria_banco_payee_exchange_rate'), "#####.0000")

		ls_new_description = ls_new_description + ' '+ls_new_rate + ' ' + ls_new_desc_secpart



dw_1.setitem(row,'transaccion_diaria_payee_des_trans_diaria',ls_new_description)
		return 0
//		is_check = 'N'
	end if

 end if
end event

event dw_1::buttonclicked;call super::buttonclicked;IF dwo.name = "b_delete" THEN
		
	IF Messagebox("Confirmación","Esta seguro que desea eliminar el wire con valor $"+string(dw_1.getitemnumber(row,"transaccion_diaria_payee_debit_trans_diaria"),"###,###,###.00")+"?",StopSign!,YesNo!) = 2 then
		return
	end if
	
	
	double ld_cons			
	ld_cons = dw_1.getitemnumber(row,"transaccion_diaria_banco_payee_cons_trans_diaria")
	
	dw_1.deleterow(row)
	if dw_1.update() > 0 then	
		DELETE FROM dba.transaccion_diaria_payee
		where cons_trans_diaria = :ld_cons;		
	end if
	
	
END IF
end event

event dw_1::rbuttondown;//
end event

type gb_1 from w2_master_report_payer`gb_1 within w_payerwirerateverification
integer width = 3945
end type

type lst_payers from w2_master_report_payer`lst_payers within w_payerwirerateverification
integer x = 2245
end type

event lst_payers::constructor;call super::constructor;this.addquery("select b.name_main_branch, b.id_main_branch from dba.Branch a, dba.GROUP_BRANCH b where a.id_main_branch = b.id_main_branch and a.id_type_branch in('P','A') and b.flag_grupo = 'A' group by b.name_main_branch, b.id_main_branch order by b.name_main_branch;")
end event

event lst_payers::modified;call super::modified;sle_payer.text = lst_payers.getdataid()
end event

type st_3 from statictext within w_payerwirerateverification
integer x = 165
integer y = 80
integer width = 165
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_date1 from pfc_u_em within w_payerwirerateverification
integer x = 334
integer y = 64
integer width = 320
integer height = 84
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type pb_date1 from picturebutton within w_payerwirerateverification
integer x = 658
integer y = 60
integer width = 101
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date1.Event pfc_DDCalendar( )
end event

type em_date2 from pfc_u_em within w_payerwirerateverification
integer x = 923
integer y = 64
integer width = 320
integer height = 84
integer taborder = 50
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type pb_date2 from picturebutton within w_payerwirerateverification
integer x = 1248
integer y = 60
integer width = 101
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "DataWindow!"
alignment htextalign = right!
end type

event clicked;em_date2.Event pfc_DDCalendar( )
end event

type st_4 from statictext within w_payerwirerateverification
integer x = 814
integer y = 80
integer width = 101
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

