$PBExportHeader$w_rep_get_group_agent_info.srw
forward
global type w_rep_get_group_agent_info from w2_master_report_dates_agency
end type
type st_2 from statictext within w_rep_get_group_agent_info
end type
type st_5 from statictext within w_rep_get_group_agent_info
end type
type lst_payer from my_ddlb within w_rep_get_group_agent_info
end type
type sle_idpayer from singlelineedit within w_rep_get_group_agent_info
end type
type sle_idcountry from singlelineedit within w_rep_get_group_agent_info
end type
type lst_country from my_ddlb within w_rep_get_group_agent_info
end type
type st_6 from statictext within w_rep_get_group_agent_info
end type
type cb_filter from commandbutton within w_rep_get_group_agent_info
end type
type gb_2 from groupbox within w_rep_get_group_agent_info
end type
end forward

global type w_rep_get_group_agent_info from w2_master_report_dates_agency
integer width = 3973
integer height = 2028
st_2 st_2
st_5 st_5
lst_payer lst_payer
sle_idpayer sle_idpayer
sle_idcountry sle_idcountry
lst_country lst_country
st_6 st_6
cb_filter cb_filter
gb_2 gb_2
end type
global w_rep_get_group_agent_info w_rep_get_group_agent_info

type variables
//////
end variables

forward prototypes
public subroutine fn_filterdatawindow ()
end prototypes

public subroutine fn_filterdatawindow ();String		ls_branch_id, s_payer, s_country

Setpointer(Hourglass!)

IF (lst_agencies.getdataid() =  '--') AND (lst_payer.getdataid() = '--') AND  (lst_country.getdataid() = '--') THEN
	messageBox('Advertencia', 'Debe seleccionar por lo menos un parametro para ejecutar la consulta')
	return
END IF


ls_branch_id = lst_agencies.getdataid()
s_payer = lst_payer.getdataid()
s_country = lst_country.getdataid()


IF ls_branch_id = '--' THEN
	SetNull(ls_branch_id )
END IF

IF s_payer = '--' THEN
	SetNull(s_payer )
END IF

IF s_country = '--' THEN
	SetNull(s_country )
END IF

dw_1.Retrieve(ls_branch_id,s_payer,s_country )  
	
	
	
Setpointer(Arrow!)
end subroutine

on w_rep_get_group_agent_info.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_5=create st_5
this.lst_payer=create lst_payer
this.sle_idpayer=create sle_idpayer
this.sle_idcountry=create sle_idcountry
this.lst_country=create lst_country
this.st_6=create st_6
this.cb_filter=create cb_filter
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.lst_payer
this.Control[iCurrent+4]=this.sle_idpayer
this.Control[iCurrent+5]=this.sle_idcountry
this.Control[iCurrent+6]=this.lst_country
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.cb_filter
this.Control[iCurrent+9]=this.gb_2
end on

on w_rep_get_group_agent_info.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.lst_payer)
destroy(this.sle_idpayer)
destroy(this.sle_idcountry)
destroy(this.lst_country)
destroy(this.st_6)
destroy(this.cb_filter)
destroy(this.gb_2)
end on

type st_4 from w2_master_report_dates_agency`st_4 within w_rep_get_group_agent_info
integer x = 2510
integer y = 832
end type

type st_3 from w2_master_report_dates_agency`st_3 within w_rep_get_group_agent_info
integer x = 1906
integer y = 832
end type

type cb_query from w2_master_report_dates_agency`cb_query within w_rep_get_group_agent_info
boolean visible = false
integer x = 4859
integer y = 812
integer taborder = 60
end type

type pb_date1 from w2_master_report_dates_agency`pb_date1 within w_rep_get_group_agent_info
integer x = 2405
integer y = 812
end type

type em_date1 from w2_master_report_dates_agency`em_date1 within w_rep_get_group_agent_info
boolean visible = false
integer x = 2085
integer y = 816
end type

type pb_date2 from w2_master_report_dates_agency`pb_date2 within w_rep_get_group_agent_info
integer x = 2935
integer y = 812
end type

type em_date2 from w2_master_report_dates_agency`em_date2 within w_rep_get_group_agent_info
integer x = 2610
integer y = 812
end type

type dw_1 from w2_master_report_dates_agency`dw_1 within w_rep_get_group_agent_info
integer x = 14
integer y = 276
integer width = 3675
string dataobject = "d_inf_get_group_agent_info"
end type

type gb_1 from w2_master_report_dates_agency`gb_1 within w_rep_get_group_agent_info
boolean visible = false
integer x = 1883
integer y = 624
integer width = 3392
integer height = 332
boolean enabled = false
end type

type lst_agencies from w2_master_report_dates_agency`lst_agencies within w_rep_get_group_agent_info
integer x = 302
integer y = 120
integer width = 997
integer taborder = 50
end type

event lst_agencies::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch in ('R','A') and id_status_branch = 'O' UNION select '-ALL-', '--' order by 1;")
end event

event lst_agencies::modified;sle_idbranch.text = this.getdataid()
sle_idbranch.TextColor	= RGB(0,0,0)
dw_1.reset()
end event

type st_1 from w2_master_report_dates_agency`st_1 within w_rep_get_group_agent_info
boolean visible = false
integer x = 3342
integer y = 832
boolean enabled = false
end type

type sle_idbranch from w2_master_report_dates_agency`sle_idbranch within w_rep_get_group_agent_info
integer x = 32
integer y = 120
integer taborder = 40
end type

event sle_idbranch::modified;call super::modified;dw_1.reset()
end event

type st_2 from statictext within w_rep_get_group_agent_info
integer x = 37
integer y = 60
integer width = 201
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agencia"
boolean focusrectangle = false
end type

type st_5 from statictext within w_rep_get_group_agent_info
integer x = 1321
integer y = 40
integer width = 238
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagador"
boolean focusrectangle = false
end type

type lst_payer from my_ddlb within w_rep_get_group_agent_info
integer x = 1531
integer y = 116
integer width = 814
integer height = 1448
integer taborder = 60
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_main_branch,id_main_branch  from dba.group_branch where group_type in ('A','P') and flag_grupo = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event modified;call super::modified;sle_idpayer.text = lst_payer.getdataid()
dw_1.reset()
end event

event selectionchanged;call super::selectionchanged;//fn_filterdatawindow()


//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false


//dw_1.Retrieve()
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR cbx_filternew.checked then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if	
//	
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country_rate <> 'null'"
//	end if		
////	if cbx_increases.checked then
////		ls_filter = ls_filter + " AND temp_rate_mod > 0 AND id_country_rate = 'MEX' "
////		// >>>>>>>>>>>>>>>>>>>>
////		// Added 05/13/2008
////		em_dif.enabled = true
////		cb_apply.enabled = true
////		cbx_clr.enabled = true
////		em_dif.text = '0.00'		
////		// >>>>>>>>>>>>>>>>>>>>
////	end if
//	
//end if
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

type sle_idpayer from singlelineedit within w_rep_get_group_agent_info
integer x = 1321
integer y = 116
integer width = 201
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

event modified;lst_country.setselectedid(sle_idcountry.text )
lst_agencies.setselectedid(sle_idbranch.text )
lst_payer.setselectedid(sle_idpayer.text )


//fn_filterdatawindow();
dw_1.reset()

// Chequea que este en la lista
IF sle_idpayer.text <> lst_payer.getdataid() THEN
	this.TextColor	= RGB(255,0,0)	
ELSE	
	this.TextColor	= RGB(0,0,0)
	
	//IF Len(this.text) > 0 THEN
	
//END IF


END IF

//fn_filterdatawindow()

//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false
//dw_1.Retrieve()
//
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') THEN
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if
//	
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country <> 'null' "
//	end if
//
//end if
//
//String query
//
//query = dw_1.Describe("DataWindow.Table.SQLSelect")
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

type sle_idcountry from singlelineedit within w_rep_get_group_agent_info
integer x = 2368
integer y = 112
integer width = 165
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;lst_country.setselectedid(sle_idcountry.text )
lst_agencies.setselectedid(sle_idbranch.text )
lst_payer.setselectedid(sle_idpayer.text )

dw_1.reset()
// Chequea que este en la lista
IF sle_idcountry.text <> lst_country.getdataid() THEN
	this.TextColor	= RGB(255,0,0)	
ELSE	
	this.TextColor	= RGB(0,0,0)
	//IF Len(this.text) > 0 THEN
//	fn_filterdatawindow();
	//END IF
END IF


//fn_filterdatawindow()

//
//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false
//dw_1.Retrieve()
//
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR (lst_country.getdataid() <> '--')then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if
//	
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country_rate = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country_rate <> 'null'"
//	end if
//
//end if
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

type lst_country from my_ddlb within w_rep_get_group_agent_info
integer x = 2537
integer y = 112
integer width = 727
integer height = 1448
integer taborder = 90
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("SELECT NAME_COUNTRY,ID_COUNTRY FROM dba.COUNTRY WHERE FLAG_COUNTRY = 'A' UNION select '-ALL-', '--' order by 1;")
end event

event modified;call super::modified;sle_idcountry.text = lst_country.getdataid()
dw_1.reset()
end event

event selectionchanged;call super::selectionchanged;
//fn_filterdatawindow()

//String ls_filter
//ls_filter = ''
//em_dif.enabled = false
//cb_apply.enabled = false
//cbx_clr.enabled = false
//dw_1.Retrieve()
//if (lst_branch.getdataid() <> '--') OR (lst_payer.getdataid() <> '--') OR (lst_country.getdataid() <> '--')  then
//	if lst_branch.getdataid() <> '--' then
//		ls_filter = "id_branch = '"+lst_branch.getdataid()+"'"
//	else
//		ls_filter = "id_branch <> 'null'"
//	end if		
//	if lst_payer.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_main_branch = '"+lst_payer.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_main_branch <> 'null'"
//	end if	
//
//	if lst_country.getdataid() <> '--' then
//		ls_filter = ls_filter + " AND id_country_rate = '"+lst_country.getdataid()+"'"
//		em_dif.enabled = true
//		cb_apply.enabled = true
//		cbx_clr.enabled = true
//		em_dif.text = '0.00'			
//	else
//		ls_filter = ls_filter + " AND id_country_rate <> 'null'"
//	end if	
//	
//end if
//
//dw_1.SetFilter(ls_filter)
//dw_1.SetRedraw(false)
//dw_1.Filter()
//dw_1.SetRedraw(true)
end event

type st_6 from statictext within w_rep_get_group_agent_info
integer x = 2368
integer y = 48
integer width = 219
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "País"
boolean focusrectangle = false
end type

type cb_filter from commandbutton within w_rep_get_group_agent_info
integer x = 3273
integer y = 120
integer width = 343
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Filtrar"
end type

event clicked;fn_filterdatawindow();


end event

type gb_2 from groupbox within w_rep_get_group_agent_info
integer x = 9
integer width = 3643
integer height = 260
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro"
end type

