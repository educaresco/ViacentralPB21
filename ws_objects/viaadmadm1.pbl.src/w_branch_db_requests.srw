$PBExportHeader$w_branch_db_requests.srw
forward
global type w_branch_db_requests from pfc_w_sheet
end type
type cb_2 from commandbutton within w_branch_db_requests
end type
type st_1 from statictext within w_branch_db_requests
end type
type lst_agencies from my_ddlb within w_branch_db_requests
end type
type sle_idbranch from singlelineedit within w_branch_db_requests
end type
type cb_4 from commandbutton within w_branch_db_requests
end type
type dw_1 from datawindow within w_branch_db_requests
end type
type cb_1 from commandbutton within w_branch_db_requests
end type
type gb_1 from groupbox within w_branch_db_requests
end type
type gb_3 from groupbox within w_branch_db_requests
end type
end forward

global type w_branch_db_requests from pfc_w_sheet
integer width = 2976
integer height = 1676
cb_2 cb_2
st_1 st_1
lst_agencies lst_agencies
sle_idbranch sle_idbranch
cb_4 cb_4
dw_1 dw_1
cb_1 cb_1
gb_1 gb_1
gb_3 gb_3
end type
global w_branch_db_requests w_branch_db_requests

on w_branch_db_requests.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.st_1=create st_1
this.lst_agencies=create lst_agencies
this.sle_idbranch=create sle_idbranch
this.cb_4=create cb_4
this.dw_1=create dw_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.lst_agencies
this.Control[iCurrent+4]=this.sle_idbranch
this.Control[iCurrent+5]=this.cb_4
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.gb_3
end on

on w_branch_db_requests.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.lst_agencies)
destroy(this.sle_idbranch)
destroy(this.cb_4)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_3)
end on

event open;call super::open;dw_1.retrieve()
end event

type cb_2 from commandbutton within w_branch_db_requests
integer x = 2391
integer y = 240
integer width = 238
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Restart"
end type

event clicked;
If messagebox("Confirmation","Do you want to RESTART the database in process?",Question!,yesno!) = 1 then

	update dba.branch_db_request set is_processed = 0 where is_processed = 2;
	dw_1.retrieve()
	
end if
end event

type st_1 from statictext within w_branch_db_requests
integer x = 123
integer y = 76
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Agency:"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_agencies from my_ddlb within w_branch_db_requests
integer x = 754
integer y = 60
integer width = 1435
integer height = 1504
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O' order by name_branch;")
end event

event selectionchanged;call super::selectionchanged;sle_idbranch.text = lst_agencies.getdataid()
end event

type sle_idbranch from singlelineedit within w_branch_db_requests
integer x = 407
integer y = 60
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;lst_agencies.setselectedid( sle_idbranch.text )

// Chequea que este en la lista
IF sle_idbranch.text <> lst_agencies.getdataid() THEN
	this.TextColor	= RGB(255,0,0)
ELSE	
	this.TextColor	= RGB(0,0,0)
END IF


end event

type cb_4 from commandbutton within w_branch_db_requests
integer x = 2633
integer y = 240
integer width = 238
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Refresh"
end type

event clicked;dw_1.retrieve()
end event

type dw_1 from datawindow within w_branch_db_requests
integer x = 50
integer y = 360
integer width = 2747
integer height = 1112
integer taborder = 60
string title = "none"
string dataobject = "dw_branch_db_requests"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;SettransObject(SQLCA)
end event

type cb_1 from commandbutton within w_branch_db_requests
integer x = 2267
integer y = 60
integer width = 471
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Request DB"
end type

event clicked;String		ls_branch_id

Setpointer(Hourglass!)

if lst_agencies.text = '[PLEASE SELECT]' then
	Messagebox("Error","Please select an Agent",StopSign!)
	return
end if

ls_branch_id = lst_agencies.getdataid()

If messagebox("Confirmation","Do you want to create a ViaCash Database for Agency "+trim(ls_branch_id)+"?",Question!,yesno!) = 1 then
	
	INSERT INTO DBA.BRANCH_DB_REQUEST (ID_BRANCH, DATE_REQUEST, REQUEST_USER) VALUES (:ls_branch_id,GETDATE(), SYSTEM_USER);
	dw_1.retrieve()

end if

Setpointer(Arrow!)




end event

type gb_1 from groupbox within w_branch_db_requests
integer x = 18
integer y = 196
integer width = 2875
integer height = 1340
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Latest Requests"
end type

type gb_3 from groupbox within w_branch_db_requests
integer x = 18
integer width = 2875
integer height = 184
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Agency"
end type

