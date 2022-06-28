$PBExportHeader$w_agentassignation_rep.srw
forward
global type w_agentassignation_rep from w_sheet
end type
type cb_save from commandbutton within w_agentassignation_rep
end type
type st_assigned from statictext within w_agentassignation_rep
end type
type st_2 from statictext within w_agentassignation_rep
end type
type dw_assigned from datawindow within w_agentassignation_rep
end type
type cb_2 from commandbutton within w_agentassignation_rep
end type
type cb_assign from commandbutton within w_agentassignation_rep
end type
type dw_unassigned from datawindow within w_agentassignation_rep
end type
type st_1 from statictext within w_agentassignation_rep
end type
type ddlb_sr from my_ddlb within w_agentassignation_rep
end type
type gb_1 from groupbox within w_agentassignation_rep
end type
end forward

global type w_agentassignation_rep from w_sheet
integer x = 214
integer y = 221
integer width = 4448
integer height = 2220
string title = "Inside Sales Representative Assigment"
boolean resizable = false
cb_save cb_save
st_assigned st_assigned
st_2 st_2
dw_assigned dw_assigned
cb_2 cb_2
cb_assign cb_assign
dw_unassigned dw_unassigned
st_1 st_1
ddlb_sr ddlb_sr
gb_1 gb_1
end type
global w_agentassignation_rep w_agentassignation_rep

forward prototypes
public subroutine fn_special ()
end prototypes

public subroutine fn_special ();
end subroutine

on w_agentassignation_rep.create
int iCurrent
call super::create
this.cb_save=create cb_save
this.st_assigned=create st_assigned
this.st_2=create st_2
this.dw_assigned=create dw_assigned
this.cb_2=create cb_2
this.cb_assign=create cb_assign
this.dw_unassigned=create dw_unassigned
this.st_1=create st_1
this.ddlb_sr=create ddlb_sr
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_save
this.Control[iCurrent+2]=this.st_assigned
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.dw_assigned
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_assign
this.Control[iCurrent+7]=this.dw_unassigned
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.ddlb_sr
this.Control[iCurrent+10]=this.gb_1
end on

on w_agentassignation_rep.destroy
call super::destroy
destroy(this.cb_save)
destroy(this.st_assigned)
destroy(this.st_2)
destroy(this.dw_assigned)
destroy(this.cb_2)
destroy(this.cb_assign)
destroy(this.dw_unassigned)
destroy(this.st_1)
destroy(this.ddlb_sr)
destroy(this.gb_1)
end on

event closequery;//
end event

type cb_save from commandbutton within w_agentassignation_rep
integer x = 4041
integer y = 1976
integer width = 347
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;dw_assigned.update()
end event

type st_assigned from statictext within w_agentassignation_rep
integer x = 2482
integer y = 260
integer width = 1106
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Assigned"
boolean focusrectangle = false
end type

type st_2 from statictext within w_agentassignation_rep
integer x = 41
integer y = 260
integer width = 517
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Unassigned"
boolean focusrectangle = false
end type

type dw_assigned from datawindow within w_agentassignation_rep
integer x = 2478
integer y = 324
integer width = 1902
integer height = 1620
integer taborder = 20
string dataobject = "dw_insales_assigments"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;boolean result

result = not this.IsSelected(Row)

if Row > 0 then this.SelectRow(Row, result)

integer li_i

// Remove selection on the other side
for li_i = 1 to dw_unassigned.rowcount()
	dw_unassigned.SelectRow(li_i, false)
next
end event

type cb_2 from commandbutton within w_agentassignation_rep
integer x = 1979
integer y = 960
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<< Unassign"
end type

event clicked;integer 	i
String	ls_id_branch
string 	ld_id_agent, s_special

if ddlb_sr.getdataid() = '--' then
	Messagebox("Error!",'You must Select an InSide Sales Representative',StopSign!)
	return
end if

ld_id_agent = ddlb_sr.getdataid()

for i = 1 to dw_assigned.rowcount()
	if dw_assigned.IsSelected(i) then
		
		ls_id_branch = dw_assigned.Object.Data[i,1]
		s_special = dw_assigned.getitemstring(i,'BRANCH_CATEGORY' )
			  
		DECLARE  spDelInSalesAgencyAssignments PROCEDURE FOR 
			Sales.spDelInSalesAgencyAssignments @pID_INSALES_REP = :ld_id_agent,  @pID_BRANCH = :ls_id_branch  , @pBRANCH_CATEGORY = :s_special;
		
		EXECUTE spDelInSalesAgencyAssignments;
		
				If SQLCA.SQLCode <> 100 then
					Messagebox("Error!",'Error Saving Data ['+SQLCA.SQLErrText+']',StopSign!)
					return			
				end if	
		
		COMMIT;			  
		
	
				
	end if
next

dw_assigned.retrieve(ld_id_agent,'A')
dw_unassigned.retrieve('','U')
//fn_special()
end event

type cb_assign from commandbutton within w_agentassignation_rep
integer x = 1979
integer y = 856
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Assign >>"
end type

event clicked;integer 	i
String	ls_id_branch, s_special
string 	ld_id_agent

if ddlb_sr.getdataid() = '--' then
	Messagebox("Error!",'You must Select an InSide Sales Representative',StopSign!)
	return
end if

ld_id_agent = ddlb_sr.getdataid()

for i = 1 to dw_unassigned.rowcount()
	if dw_unassigned.IsSelected(i) then
		
		ls_id_branch = dw_unassigned.Object.Data[i,1 ]
		s_special = dw_unassigned.getitemstring(i,'BRANCH_CATEGORY' )
		

		DECLARE  spInsInSalesAgencyAssignments PROCEDURE FOR 
			Sales.spInsInSalesAgencyAssignments @pID_INSALES_REP = :ld_id_agent,  @pID_BRANCH = :ls_id_branch , @pBRANCH_CATEGORY = :s_special;
		
		EXECUTE spInsInSalesAgencyAssignments;
		
				If SQLCA.SQLCode <> 100 then
					Messagebox("Error!",'Error Saving Data ['+SQLCA.SQLErrText+']',StopSign!)
					return			
				end if	
		COMMIT;
	end if
next


dw_assigned.retrieve(ddlb_sr.getdataid(), 'A')
dw_unassigned.retrieve('','U')
//fn_special()

end event

type dw_unassigned from datawindow within w_agentassignation_rep
integer x = 37
integer y = 324
integer width = 1902
integer height = 1620
integer taborder = 20
string dataobject = "dw_insales_assigments"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event clicked;boolean result

result = not this.IsSelected(Row)

if Row > 0 then this.SelectRow(Row, result)

integer li_i

// Remove selection on the other side
for li_i = 1 to dw_assigned.rowcount()
	dw_assigned.SelectRow(li_i, false)
next
end event

type st_1 from statictext within w_agentassignation_rep
integer x = 878
integer y = 116
integer width = 640
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inside Sales Representative:"
boolean focusrectangle = false
end type

type ddlb_sr from my_ddlb within w_agentassignation_rep
integer x = 1545
integer y = 108
integer width = 1394
integer height = 1352
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;String query;

query ="EXEC Sales.spGetInsideRepresentatives;"

this.addqueryad(query)
end event

event selectionchanged;call super::selectionchanged;
if ddlb_sr.getdataid() = '--' then
	dw_assigned.reset()
	dw_unassigned.reset()
	st_assigned.text = 'Assigned'
else
	dw_assigned.retrieve(ddlb_sr.getdataid(), 'A')
	dw_unassigned.retrieve('', 'U')
	//fn_special()
	st_assigned.text = 'Assigned to '+ddlb_sr.getdatavalue()
end if


end event

type gb_1 from groupbox within w_agentassignation_rep
integer x = 37
integer y = 28
integer width = 4366
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

