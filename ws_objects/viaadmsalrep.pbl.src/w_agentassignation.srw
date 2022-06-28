$PBExportHeader$w_agentassignation.srw
forward
global type w_agentassignation from w_sheet
end type
type cb_save from commandbutton within w_agentassignation
end type
type st_assigned from statictext within w_agentassignation
end type
type st_2 from statictext within w_agentassignation
end type
type dw_assigned from datawindow within w_agentassignation
end type
type cb_2 from commandbutton within w_agentassignation
end type
type cb_assign from commandbutton within w_agentassignation
end type
type dw_unassigned from datawindow within w_agentassignation
end type
type st_1 from statictext within w_agentassignation
end type
type ddlb_sr from my_ddlb within w_agentassignation
end type
type gb_1 from groupbox within w_agentassignation
end type
end forward

global type w_agentassignation from w_sheet
integer width = 4448
integer height = 2116
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
global w_agentassignation w_agentassignation

forward prototypes
public subroutine fn_special ()
end prototypes

public subroutine fn_special ();string s_branch, s_special_agent
double i, d_rownum

d_rownum = dw_unassigned.retrieve()

if d_rownum > 0 then
	for i = 1 to d_rownum
		
	s_branch = 	dw_unassigned.getitemstring(i, 'id_branch')
		
		DECLARE CUR_SPECIAL_AGENT CURSOR FOR
	     SELECT DBA.AUDIT_BRANCH_AGENT.ID_BRANCH
		FROM DBA.AUDIT_BRANCH_AGENT
		WHERE DBA.AUDIT_BRANCH_AGENT.ID_BRANCH = :s_branch  ;
			
		OPEN CUR_SPECIAL_AGENT;

		FETCH CUR_SPECIAL_AGENT INTO :s_special_agent;
		
		if sqlca.sqlcode = 0 then 
			dw_unassigned.setitem(i,'special' , 'ESPECIAL' )
		end if
	close CUR_SPECIAL_AGENT;	
	next
	
	
end if
end subroutine

on w_agentassignation.create
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

on w_agentassignation.destroy
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

type cb_save from commandbutton within w_agentassignation
integer x = 3671
integer y = 248
integer width = 229
integer height = 76
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

type st_assigned from statictext within w_agentassignation
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

type st_2 from statictext within w_agentassignation
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

type dw_assigned from datawindow within w_agentassignation
integer x = 2478
integer y = 324
integer width = 1902
integer height = 1620
integer taborder = 20
string dataobject = "dw_agentassignation_assigned"
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

type cb_2 from commandbutton within w_agentassignation
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
Double 	ld_id_agent

if ddlb_sr.getdataid() = '--' then
	Messagebox("Error!",'You must Select a Sales Representative',StopSign!)
	return
end if

ld_id_agent = double(ddlb_sr.getdataid())

for i = 1 to dw_assigned.rowcount()
	if dw_assigned.IsSelected(i) then
		
		ls_id_branch = dw_assigned.Object.Data[i,1]

		  DELETE FROM dba.BRANCH_AGENT  
         WHERE ID_AGENT = :ld_id_agent
           AND ID_BRANCH = :ls_id_branch;
		
		If SQLCA.SQLCode <> 0 then
			Messagebox("Error!",'Error Saving Data ['+SQLCA.SQLErrText+']',StopSign!)
			return			
		end if		
				
	end if
next

dw_assigned.retrieve(ld_id_agent)
dw_unassigned.retrieve()
fn_special()
end event

type cb_assign from commandbutton within w_agentassignation
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
Double 	ld_id_agent

if ddlb_sr.getdataid() = '--' then
	Messagebox("Error!",'You must Select a Sales Representative',StopSign!)
	return
end if

ld_id_agent = double(ddlb_sr.getdataid())

for i = 1 to dw_unassigned.rowcount()
	if dw_unassigned.IsSelected(i) then
		
		ls_id_branch = dw_unassigned.Object.Data[i,1 ]
		s_special = dw_unassigned.getitemstring(i,'special' )
		
		IF s_special = 'ESPECIAL' THEN
			s_special = 'YES'
		ELSE
			s_special = 'NO'
		END IF

		  INSERT INTO dba.BRANCH_AGENT  
               (ID_AGENT,   
               ID_BRANCH,   
               DATE_BEGIN,
			SPECIAL_BRANCH)  
        VALUES (:ld_id_agent,   
               :ls_id_branch,   
               getdate(),
			:s_special);
		
		If SQLCA.SQLCode <> 0 then
			Messagebox("Error!",'Error Saving Data ['+SQLCA.SQLErrText+']',StopSign!)
			return			
		end if		
				
	end if
next

dw_assigned.retrieve(ld_id_agent)
dw_unassigned.retrieve()
fn_special()

end event

type dw_unassigned from datawindow within w_agentassignation
integer x = 37
integer y = 324
integer width = 1902
integer height = 1620
integer taborder = 20
string dataobject = "dw_agentassignation_unassigned"
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

type st_1 from statictext within w_agentassignation
integer x = 1006
integer y = 120
integer width = 517
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sales Representative:"
boolean focusrectangle = false
end type

type ddlb_sr from my_ddlb within w_agentassignation
integer x = 1545
integer y = 108
integer width = 1394
integer height = 1352
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addqueryad("SELECT NAME_AGENT, ID_AGENT FROM dba.AGENT WHERE STATUS_AGENT = 'A' UNION SELECT NAME_AGENT + ' (INACTIVE)', ID_AGENT FROM dba.AGENT WHERE STATUS_AGENT = 'I' AND ID_AGENT IN (SELECT ID_AGENT FROM DBA.BRANCH_AGENT) ORDER BY NAME_AGENT;")
end event

event selectionchanged;call super::selectionchanged;
if ddlb_sr.getdataid() = '--' then
	dw_assigned.reset()
	dw_unassigned.reset()
	st_assigned.text = 'Assigned'
else
	dw_assigned.retrieve(double(ddlb_sr.getdataid()))
	dw_unassigned.retrieve()
	fn_special()
	st_assigned.text = 'Assigned to '+ddlb_sr.getdatavalue()
end if
end event

type gb_1 from groupbox within w_agentassignation
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

