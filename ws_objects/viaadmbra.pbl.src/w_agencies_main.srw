$PBExportHeader$w_agencies_main.srw
forward
global type w_agencies_main from w_sheet
end type
type gb_2 from groupbox within w_agencies_main
end type
type cb_1 from commandbutton within w_agencies_main
end type
type st_1 from statictext within w_agencies_main
end type
type lst_agencies from my_ddlb within w_agencies_main
end type
type sle_idbranch from singlelineedit within w_agencies_main
end type
type gb_1 from groupbox within w_agencies_main
end type
type tab_1 from tab within w_agencies_main
end type
type tabpage_1 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_2 dw_2
end type
type tabpage_2 from userobject within tab_1
end type
type cb_new_location from commandbutton within tabpage_2
end type
type dw_1 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_new_location cb_new_location
dw_1 dw_1
end type
type tab_1 from tab within w_agencies_main
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type rb_branch from radiobutton within w_agencies_main
end type
type rb_chain from radiobutton within w_agencies_main
end type
end forward

global type w_agencies_main from w_sheet
integer x = 214
integer y = 221
integer width = 2958
integer height = 1980
string title = "Agencies New/Search"
string menuname = "m_branch_new"
boolean resizable = false
event ue_insert ( )
event ue_save ( )
gb_2 gb_2
cb_1 cb_1
st_1 st_1
lst_agencies lst_agencies
sle_idbranch sle_idbranch
gb_1 gb_1
tab_1 tab_1
rb_branch rb_branch
rb_chain rb_chain
end type
global w_agencies_main w_agencies_main

type variables
string is_id_chain
end variables

event ue_insert();DOUBLE d_id_chain
string s_id_chain

tab_1.tabpage_1.dw_2.reset()

tab_1.tabpage_1.dw_2.insertrow(0)

tab_1.tabpage_2.enabled = false


SELECT MAX(CAST(RTRIM(RIGHT(ID_CHAIN,6))AS NUMERIC(6,0)))
INTO :d_id_chain
FROM DBA.CHAIN;


d_id_chain = d_id_chain + 1

IF d_id_chain < 10 THEN
	
	s_id_chain = 'USA00000'+ STRING(d_id_chain)
	
ELSEIF d_id_chain >= 10  and  d_id_chain < 100 THEN
	
	s_id_chain = 'USA0000'+ STRING(d_id_chain)
	
ELSEIF d_id_chain > 99 and d_id_chain < 1000 THEN
	
	s_id_chain = 'USA000' + STRING(d_id_chain)
	
ELSEIF d_id_chain > 999 and d_id_chain < 10000 THEN
	
	s_id_chain = 'USA00' + STRING(d_id_chain)
	
ELSEIF d_id_chain > 9999 and d_id_chain < 100000 THEN
	
	s_id_chain = 'USA0' + STRING(d_id_chain)
	
ELSEIF d_id_chain > 99999 THEN
	
	s_id_chain = 'USA' + STRING(d_id_chain)
	
END IF



tab_1.tabpage_1.dw_2.setitem(1, 'id_chain', s_id_chain)

end event

event ue_save();tab_1.tabpage_1.dw_2.settransobject(sqlca)
tab_1.tabpage_1.dw_2.update()
tab_1.tabpage_2.enabled = true
lst_agencies.addquery("select name_chain, id_chain from dba.chain order by name_chain;")
is_id_chain = tab_1.tabpage_1.dw_2.getitemstring(1,"id_chain")


end event

on w_agencies_main.create
int iCurrent
call super::create
if this.MenuName = "m_branch_new" then this.MenuID = create m_branch_new
this.gb_2=create gb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.lst_agencies=create lst_agencies
this.sle_idbranch=create sle_idbranch
this.gb_1=create gb_1
this.tab_1=create tab_1
this.rb_branch=create rb_branch
this.rb_chain=create rb_chain
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.lst_agencies
this.Control[iCurrent+5]=this.sle_idbranch
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.tab_1
this.Control[iCurrent+8]=this.rb_branch
this.Control[iCurrent+9]=this.rb_chain
end on

on w_agencies_main.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.gb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.lst_agencies)
destroy(this.sle_idbranch)
destroy(this.gb_1)
destroy(this.tab_1)
destroy(this.rb_branch)
destroy(this.rb_chain)
end on

event resize;call super::resize;tab_1.tabpage_2.dw_1.height = this.height - tab_1.tabpage_2.dw_1.y - 150
tab_1.tabpage_1.dw_2.width = this.width - tab_1.tabpage_1.dw_2.x - 80
end event

event open;call super::open;tab_1.tabpage_2.enabled = false
end event

type gb_2 from groupbox within w_agencies_main
integer x = 73
integer y = 76
integer width = 521
integer height = 220
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "By"
end type

type cb_1 from commandbutton within w_agencies_main
integer x = 2491
integer y = 136
integer width = 334
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Search"
end type

event clicked;string ls_chain_id, ls_id_branch

if rb_branch.checked = true then
	
	ls_id_branch = lst_agencies.getdataid()
	
	SELECT ID_CHAIN
	INTO :is_id_chain
	FROM DBA.BRANCH
	WHERE ID_BRANCH = :ls_id_branch;
	
else


is_id_chain = lst_agencies.getdataid()

end if

tab_1.tabpage_1.dw_2.settransobject(sqlca)
tab_1.tabpage_2.dw_1.settransobject(sqlca)


tab_1.tabpage_1.dw_2.retrieve(is_id_chain)
tab_1.tabpage_2.dw_1.retrieve(is_id_chain)

tab_1.tabpage_2.enabled = true

tab_1.tabpage_1.dw_2.setfocus()

Setpointer(Arrow!)

end event

type st_1 from statictext within w_agencies_main
integer x = 599
integer y = 156
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Agency:"
alignment alignment = right!
boolean focusrectangle = false
end type

type lst_agencies from my_ddlb within w_agencies_main
integer x = 1312
integer y = 136
integer width = 1083
integer height = 1504
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("select name_chain, id_chain from dba.chain order by name_chain;")
end event

event selectionchanged;call super::selectionchanged;sle_idbranch.text = lst_agencies.getdataid()
end event

type sle_idbranch from singlelineedit within w_agencies_main
integer x = 882
integer y = 136
integer width = 407
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
textcase textcase = upper!
integer limit = 9
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

type gb_1 from groupbox within w_agencies_main
integer x = 50
integer y = 16
integer width = 2857
integer height = 304
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Search"
end type

type tab_1 from tab within w_agencies_main
string tag = "Chain"
integer x = 50
integer y = 340
integer width = 2848
integer height = 1432
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2811
integer height = 1304
long backcolor = 79741120
string text = "Chain"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "CreateIndex!"
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tabpage_1.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_1.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_1
integer x = 91
integer y = 116
integer width = 2638
integer height = 988
integer taborder = 30
string title = "none"
string dataobject = "dw_agency_chain"
boolean border = false
boolean livescroll = true
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2811
integer height = 1304
long backcolor = 79741120
string text = "Location"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom042!"
long picturemaskcolor = 536870912
cb_new_location cb_new_location
dw_1 dw_1
end type

on tabpage_2.create
this.cb_new_location=create cb_new_location
this.dw_1=create dw_1
this.Control[]={this.cb_new_location,&
this.dw_1}
end on

on tabpage_2.destroy
destroy(this.cb_new_location)
destroy(this.dw_1)
end on

type cb_new_location from commandbutton within tabpage_2
integer x = 869
integer y = 8
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New Location"
end type

event clicked;string s_parm

 s_parm = tab_1.tabpage_1.dw_2.getitemstring(1,'id_chain')

openwithparm(w_location_new,s_parm)

if message.doubleparm = 1 then
	
tab_1.tabpage_2.dw_1.settransobject(sqlca)
tab_1.tabpage_2.dw_1.retrieve(is_id_chain)
	
end if
	
end event

type dw_1 from datawindow within tabpage_2
integer x = 32
integer y = 120
integer width = 2706
integer height = 1176
integer taborder = 20
string title = "none"
string dataobject = "dw_location_list"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;string s_parm






if dwo.name = "location_id_location"  then
	
	s_parm = tab_1.tabpage_1.dw_2.getitemstring(1,'id_chain')
     s_parm = s_parm + '/' +tab_1.tabpage_2.dw_1.getitemstring(dw_1.getrow(),'location_id_location')
	  opensheetwithparm(w_location_new,s_parm,w_principal, 4, Original!)
	
	
end if

if dwo.name = "branch_id_branch" then
	
	
	s_parm = tab_1.tabpage_1.dw_2.getitemstring(1,'id_chain')
	s_parm = s_parm +'/'+ tab_1.tabpage_2.dw_1.getitemstring(dw_1.getrow(),'location_id_location')
	s_parm = s_parm + '/'+tab_1.tabpage_2.dw_1.getitemstring(dw_1.getrow(),'branch_id_branch')
	 opensheetwithparm(w_emida_parameters,s_parm,w_principal, 4, Original!)
end if
end event

event collapsed;this.retrieve(is_id_chain)
end event

event buttonclicked;string s_parm, s_chain

if dwo.name = 'b_new_product' then
	
	s_parm = tab_1.tabpage_1.dw_2.getitemstring(1,'id_chain')
	s_parm = s_parm +'/'+ tab_1.tabpage_2.dw_1.getitemstring(dw_1.getrow(),'location_id_location')
	
	s_chain = tab_1.tabpage_1.dw_2.getitemstring(1,'id_chain')
	
	openwithparm(w_emida_parameters,s_parm)
	
	if message.doubleparm = 1 then
		this.retrieve(s_chain)
		
	end if
	
end if
end event

type rb_branch from radiobutton within w_agencies_main
integer x = 114
integer y = 208
integer width = 457
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Product (A0XXXX)"
end type

event clicked;if this.checked = true then
	
	lst_agencies.addquery("select name_branch, id_branch from dba.branch where id_type_branch IN ('A','R') and id_status_branch = 'O' order by name_branch;")
	
	sle_idbranch.text = ''
	
end if
end event

type rb_chain from radiobutton within w_agencies_main
integer x = 114
integer y = 132
integer width = 279
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Chain"
boolean checked = true
end type

event clicked;if this.checked = true then
	
	lst_agencies.addquery("select name_chain, id_chain from dba.chain order by name_chain;")
	
	sle_idbranch.text = ''
	
end if
end event

