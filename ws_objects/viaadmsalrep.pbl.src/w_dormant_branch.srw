$PBExportHeader$w_dormant_branch.srw
forward
global type w_dormant_branch from pfc_w_sheet
end type
type ddlb_days from dropdownlistbox within w_dormant_branch
end type
type st_2 from statictext within w_dormant_branch
end type
type cb_3 from commandbutton within w_dormant_branch
end type
type cb_1 from commandbutton within w_dormant_branch
end type
type cb_2 from commandbutton within w_dormant_branch
end type
type dw_1 from datawindow within w_dormant_branch
end type
type gb_1 from groupbox within w_dormant_branch
end type
end forward

global type w_dormant_branch from pfc_w_sheet
integer x = 214
integer y = 221
integer width = 4745
integer height = 2000
string title = "Expired Orders"
string menuname = "m_branch_dormant"
boolean resizable = false
event ue_update ( )
event ue_retrieve ( )
ddlb_days ddlb_days
st_2 st_2
cb_3 cb_3
cb_1 cb_1
cb_2 cb_2
dw_1 dw_1
gb_1 gb_1
end type
global w_dormant_branch w_dormant_branch

event ue_update();DOUBLE rownum, row, ld_dormant_time
DATETIME ldt_date_to
STRING ls_idbranch, ls_idbranch_existing

if dw_1.rowcount() > 0 then
	
	rownum = dw_1.rowcount()
	
	for row = 1 to rownum
		
		if dw_1.getitemstring(row, 'dormant') = 'Y'  then
			
			ls_idbranch = dw_1.getitemstring(row,'receiver_id_branch')
			
			SELECT ID_BRANCH
			INTO :ls_idbranch_existing
			FROM DBA.BRANCH_DORMANT
			WHERE ID_BRANCH = :ls_idbranch;
			
			SELECT B.TIME_DORMANT
			INTO :ld_dormant_time
			FROM DBA.BRANCH_AGENT A, DBA.COMISION_AGENTES_TRANSACTION B
			WHERE A.ID_AGENT = B.ID_AGENT
		     AND A.ID_BRANCH = :ls_idbranch;
			  
			 ldt_date_to = DATETIME(relativedate(today(), ld_dormant_time), TIME('23:59:59'))
			 
			 IF ls_idbranch_existing = '' THEN SETNULL(ls_idbranch_existing)

			
			IF NOT ISNULL(ls_idbranch_existing)  THEN
				
				UPDATE DBA.BRANCH_DORMANT
				SET DATE_FROM = GETDATE(),
					  DATE_TO = :ldt_date_to
				WHERE ID_BRANCH = :ls_idbranch;
			ELSE
				
				INSERT INTO DBA.BRANCH_DORMANT
				VALUES (:ls_idbranch,
							GETDATE(),
							:ldt_date_to);
				
			END IF
			
		end if
		

		
	next
	
		end if

end event

event ue_retrieve();string ls_branch_id, s_filter
double ld_days


dw_1.settransobject(sqlca)



ld_days = double(ddlb_days.text)

dw_1.retrieve(ld_days)
dw_1.setfilter( s_filter )
dw_1.filter()
dw_1.SetRedraw(true )


if dw_1.rowcount() <= 0 then
	
	messagebox('ALERT', 'NO RECORDS FOUND', STOPSIGN!)
	
END IF

end event

on w_dormant_branch.create
int iCurrent
call super::create
if this.MenuName = "m_branch_dormant" then this.MenuID = create m_branch_dormant
this.ddlb_days=create ddlb_days
this.st_2=create st_2
this.cb_3=create cb_3
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_days
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.gb_1
end on

on w_dormant_branch.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.ddlb_days)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;ddlb_days.text = '30'
end event

type ddlb_days from dropdownlistbox within w_dormant_branch
integer x = 325
integer y = 96
integer width = 233
integer height = 324
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
string item[] = {"30","45","60","90"}
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_dormant_branch
integer x = 146
integer y = 104
integer width = 146
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Days:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_dormant_branch
integer x = 690
integer y = 92
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;event ue_retrieve()
end event

type cb_1 from commandbutton within w_dormant_branch
integer x = 4347
integer y = 112
integer width = 274
integer height = 76
integer taborder = 10
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string text = "Deselect All"
end type

event clicked;//***** Procces to Select ALL records *********//
//*                                                                        //
//*                                                                       //
//************************************//
double d_rownum, d_num

d_rownum = dw_1.rowcount()

if d_rownum > 0 then
	
	for d_num = 1 to d_rownum
		
		dw_1.setitem(d_num,'dormant','N' )
		
	next
else
	messagebox('Alert','No Records found',stopsign!)
end if
end event

type cb_2 from commandbutton within w_dormant_branch
integer x = 4073
integer y = 112
integer width = 274
integer height = 76
integer taborder = 20
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
string text = "Select All"
end type

event clicked;//***** Procces to Select ALL records *********//
//*                                                                        //
//*                                                                       //
//************************************//
double d_rownum, d_num

d_rownum = dw_1.rowcount()

if d_rownum > 0 then
	
	for d_num = 1 to d_rownum
		
		dw_1.setitem(d_num,'dormant','Y')
		
	next
else
	messagebox('Alert','No Records found',stopsign!)
end if
end event

type dw_1 from datawindow within w_dormant_branch
integer x = 27
integer y = 232
integer width = 4667
integer height = 1576
integer taborder = 10
string title = "none"
string dataobject = "dw_dormant_selection"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;string s
s =''
end event

type gb_1 from groupbox within w_dormant_branch
integer x = 32
integer y = 8
integer width = 4658
integer height = 220
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payer"
end type

