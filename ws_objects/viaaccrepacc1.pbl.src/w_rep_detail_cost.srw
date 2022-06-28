$PBExportHeader$w_rep_detail_cost.srw
forward
global type w_rep_detail_cost from wb_report_fechas
end type
type cb_consult from commandbutton within w_rep_detail_cost
end type
type ddlb_maingroup from dropdownlistbox within w_rep_detail_cost
end type
type cbx_1 from checkbox within w_rep_detail_cost
end type
type gb_1 from groupbox within w_rep_detail_cost
end type
type rb_from from radiobutton within w_rep_detail_cost
end type
type rb_to from radiobutton within w_rep_detail_cost
end type
type cbx_branch from checkbox within w_rep_detail_cost
end type
type ddlb_branch from dropdownlistbox within w_rep_detail_cost
end type
type rb_fromd from radiobutton within w_rep_detail_cost
end type
type ddlb_company from dropdownlistbox within w_rep_detail_cost
end type
type cbx_company from checkbox within w_rep_detail_cost
end type
end forward

global type w_rep_detail_cost from wb_report_fechas
int Width=3598
int Height=2264
boolean TitleBar=true
string Title="Savings Control Detailed"
cb_consult cb_consult
ddlb_maingroup ddlb_maingroup
cbx_1 cbx_1
gb_1 gb_1
rb_from rb_from
rb_to rb_to
cbx_branch cbx_branch
ddlb_branch ddlb_branch
rb_fromd rb_fromd
ddlb_company ddlb_company
cbx_company cbx_company
end type
global w_rep_detail_cost w_rep_detail_cost

type variables
Datastore ids_maingroup, ids_branch, ids_company

end variables

on w_rep_detail_cost.create
int iCurrent
call super::create
this.cb_consult=create cb_consult
this.ddlb_maingroup=create ddlb_maingroup
this.cbx_1=create cbx_1
this.gb_1=create gb_1
this.rb_from=create rb_from
this.rb_to=create rb_to
this.cbx_branch=create cbx_branch
this.ddlb_branch=create ddlb_branch
this.rb_fromd=create rb_fromd
this.ddlb_company=create ddlb_company
this.cbx_company=create cbx_company
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_consult
this.Control[iCurrent+2]=this.ddlb_maingroup
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.rb_from
this.Control[iCurrent+6]=this.rb_to
this.Control[iCurrent+7]=this.cbx_branch
this.Control[iCurrent+8]=this.ddlb_branch
this.Control[iCurrent+9]=this.rb_fromd
this.Control[iCurrent+10]=this.ddlb_company
this.Control[iCurrent+11]=this.cbx_company
end on

on w_rep_detail_cost.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_consult)
destroy(this.ddlb_maingroup)
destroy(this.cbx_1)
destroy(this.gb_1)
destroy(this.rb_from)
destroy(this.rb_to)
destroy(this.cbx_branch)
destroy(this.ddlb_branch)
destroy(this.rb_fromd)
destroy(this.ddlb_company)
destroy(this.cbx_company)
end on

event open;call super::open;Integer	 	li_cont

ids_maingroup = CREATE datastore

ids_maingroup.dataobject = 'ds_mainbranch'
ids_maingroup.SetTransObject(SQLCA)
ids_maingroup.Retrieve()

FOR li_cont=1 TO ids_maingroup.RowCount()
	ddlb_maingroup.AddItem(ids_maingroup.Object.name_main_branch[li_cont])
NEXT

dw_1.dataobject='dw_rep_detail_cost_from_group'
dw_1.SetTransObject(SQLCA)

ids_branch = CREATE Datastore
ids_branch.dataobject='ds_branch_group'

ids_branch.SetTransObject(SQLCA)

ids_company = CREATE Datastore
ids_company.dataobject='ds_company'
ids_company.SetTransObject(SQLCA)

ids_company.Retrieve()

FOR li_cont=1 TO ids_company.RowCount()
	ddlb_company.AddItem(ids_company.Object.name_company[li_cont])
NEXT


end event

type dw_1 from wb_report_fechas`dw_1 within w_rep_detail_cost
int X=23
int Y=192
int Width=3511
int Height=1876
int TabOrder=0
boolean BringToTop=true
string DataObject="dw_rep_detail_cost_from_group"
end type

event dw_1::pfc_filterdlg;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_filterdlg
//
//	Arguments:  none
//
//	Returns:  	integer
//					 1 success
//					 0 = user cancelled from filter dialog
//					-1 = error
//
//	Description:  Invokes the Find dialog window.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Int li_return
If IsValid (inv_filter) Then
	li_return = inv_filter.Event pfc_filterdlg()
	IF li_return = 1 THEN
		SetRedraw(FALSE)
		GroupCalc()
		SetRedraw(TRUE)
	END IF
	RETURN li_return
end if

Return FAILURE
end event

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_detail_cost
int X=2130
int Y=36
int Width=361
int Height=88
int TabOrder=70
boolean BringToTop=true
boolean Spin=false
string MinMax=""
end type

type st_1 from wb_report_fechas`st_1 within w_rep_detail_cost
int X=1943
int Y=48
int Width=183
int Height=48
boolean BringToTop=true
string Text="Initial :"
int Weight=400
string FaceName="Arial"
end type

type st_2 from wb_report_fechas`st_2 within w_rep_detail_cost
int X=2606
int Y=52
int Width=160
int Height=52
boolean BringToTop=true
string Text="Final :"
int Weight=400
string FaceName="Arial"
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_detail_cost
int X=2775
int Y=36
int Width=357
int Height=88
int TabOrder=80
boolean BringToTop=true
boolean Spin=false
string MinMax=""
end type

event em_fecha2::modified;// DO NOT DELETE THIS LINE
end event

type cb_consult from commandbutton within w_rep_detail_cost
int X=3145
int Y=40
int Width=384
int Height=80
int TabOrder=90
boolean BringToTop=true
string Text="Consult"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//Datetime		ld_fecha1, ld_fecha2
Date		ld_fecha1, ld_fecha2


Int		li_index, li_index1
String	ls_id_maingroup, ls_id_branch, ls_company


ld_fecha1 = Date(em_fecha1.text)
ld_fecha2 = Date(em_fecha2.text)
ld_fecha2 = Relativedate(ld_fecha2,1)


IF NOT IsDate(em_fecha1.text) OR IsNull(em_fecha1.text) THEN
	MessageBox("Warning","You must enter a valid date",stopsign!)
END IF

IF NOT IsDate(em_fecha2.text) OR IsNull(em_fecha2.text) THEN
	MessageBox("Warning","You must enter a valid date",stopsign!)
END IF



IF cbx_1.checked THEN
	IF IsNull(ddlb_maingroup.text) OR Trim(ddlb_maingroup.text) = '' THEN
		MessageBox("Warning","You must choose a main group",stopsign!)
	END IF
END IF

IF cbx_company.checked THEN
	IF IsNull(ddlb_company.text) OR Trim(ddlb_company.text) = '' THEN
		MessageBox("Warning","You must choose a company.",stopsign!)
	END IF
END IF

//IF cbx_company.checked THEN
//	li_index1 = ddlb_company.FindItem(ddlb_company.text,0)
//	ls_company= ids_company.Object.id_company[li_index1]
//ELSE
//	ls_company= '%'
//END IF

ls_company= '%'

IF cbx_1.checked THEN
	IF cbx_branch.checked THEN
		IF ddlb_branch.text <> 'ALL' THEN
			li_index1 = ddlb_branch.FindItem(ddlb_branch.text,0)
			ls_id_branch = ids_branch.Object.id_branch[li_index1]
		ELSE
			ls_id_branch = '%'
		END IF
	ELSE
		ls_id_branch = '%'
	END IF
	
	li_index = ddlb_maingroup.FindItem(ddlb_maingroup.text,0)
	ls_id_maingroup = ids_maingroup.Object.id_main_branch[li_index]
	
	dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_id_maingroup,ls_id_branch)
ELSE
	dw_1.retrieve(ld_Fecha1,ld_Fecha2,'%','%')
END IF

dw_1.setfocus()
end event

type ddlb_maingroup from dropdownlistbox within w_rep_detail_cost
int X=334
int Width=919
int Height=1344
int TabOrder=40
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long TextColor=33554432
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event selectionchanged;Integer	li_cont, li_index, li_tot
String	ls_id_maingroup

li_index = ddlb_maingroup.FindItem(text,0)

IF li_index <= 0 THEN
	Return
END IF

ls_id_maingroup = ids_maingroup.Object.id_main_branch[li_index]

li_tot=ids_branch.Retrieve(ls_id_maingroup)

ddlb_branch.Reset()

FOR li_cont=1 TO li_tot
	ddlb_branch.AddItem(ids_branch.Object.name_branch[li_cont])
NEXT

ddlb_branch.AddItem('ALL')
//dw_1.retrieve(ld_Fecha1,ld_Fecha2,ls_id_maingroup)
end event

type cbx_1 from checkbox within w_rep_detail_cost
int X=27
int Y=4
int Width=256
int Height=76
int TabOrder=30
boolean BringToTop=true
string Text="Group"
BorderStyle BorderStyle=StyleLowered!
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Integer	li_cont, li_index1
String	ls_company

IF cbx_1.checked = TRUE THEN
	ids_maingroup.Retrieve()
	ids_maingroup.SetFilter('')
	ids_maingroup.Filter()
	
	IF cbx_company.checked THEN
		li_index1 = ddlb_company.FindItem(ddlb_company.text,0)
		ls_company= ids_company.Object.id_company[li_index1]
		
		ids_maingroup.SetFilter("id_company = '"+ls_company+"'")	
		ids_maingroup.Filter()
		ddlb_maingroup.Reset()

		FOR li_cont=1 TO ids_maingroup.RowCount()
			ddlb_maingroup.AddItem(ids_maingroup.Object.name_main_branch[li_cont])
		NEXT
	ELSE
		ddlb_maingroup.Reset()
		FOR li_cont=1 TO ids_maingroup.RowCount()
			ddlb_maingroup.AddItem(ids_maingroup.Object.name_main_branch[li_cont])
		NEXT
	END IF
	
	ddlb_maingroup.enabled = TRUE
	ddlb_maingroup.SetFocus()
ELSE
	ddlb_maingroup.enabled = FALSE
END IF	
end event

type gb_1 from groupbox within w_rep_detail_cost
int X=1303
int Width=640
int Height=124
BorderStyle BorderStyle=StyleLowered!
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_from from radiobutton within w_rep_detail_cost
int X=1362
int Y=36
int Width=247
int Height=76
boolean BringToTop=true
string Text="From ..."
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.dataobject='dw_rep_detail_cost_from_group'
dw_1.SetTransObject(SQLCA)
end event

type rb_to from radiobutton within w_rep_detail_cost
int X=1673
int Y=36
int Width=210
int Height=76
boolean BringToTop=true
string Text="To ..."
BorderStyle BorderStyle=StyleLowered!
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.dataobject='dw_rep_detail_cost_to_group'
dw_1.SetTransObject(SQLCA)
end event

type cbx_branch from checkbox within w_rep_detail_cost
int X=27
int Y=92
int Width=261
int Height=76
int TabOrder=50
boolean BringToTop=true
string Text="Branch"
BorderStyle BorderStyle=StyleLowered!
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF cbx_branch.checked = TRUE THEN
	ddlb_branch.enabled = TRUE
	ddlb_branch.SetFocus()
ELSE
	ddlb_branch.enabled = FALSE
END IF	
end event

type ddlb_branch from dropdownlistbox within w_rep_detail_cost
int X=334
int Y=92
int Width=919
int Height=1348
int TabOrder=60
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long TextColor=33554432
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_fromd from radiobutton within w_rep_detail_cost
int X=567
int Y=252
int Width=448
int Height=76
boolean Visible=false
boolean BringToTop=true
string Text=" From Detailed ..."
BorderStyle BorderStyle=StyleLowered!
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.dataobject='dw_rep_detail_cost_from_to_group'
dw_1.SetTransObject(SQLCA)
end event

type ddlb_company from dropdownlistbox within w_rep_detail_cost
int X=334
int Y=20
int Width=919
int Height=1444
int TabOrder=20
boolean Visible=false
boolean Enabled=false
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long TextColor=33554432
int TextSize=-7
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event selectionchanged;cbx_1.checked = FALSE
cbx_1.Event Clicked()
end event

type cbx_company from checkbox within w_rep_detail_cost
int X=27
int Y=28
int Width=297
int Height=76
int TabOrder=10
boolean Visible=false
boolean BringToTop=true
string Text="Company "
BorderStyle BorderStyle=StyleLowered!
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF Checked = TRUE THEN
	ddlb_company.enabled = TRUE
	ddlb_company.SetFocus()
ELSE
	ddlb_company.enabled = FALSE
END IF	
end event

