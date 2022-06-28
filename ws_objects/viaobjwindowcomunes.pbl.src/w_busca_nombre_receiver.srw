$PBExportHeader$w_busca_nombre_receiver.srw
forward
global type w_busca_nombre_receiver from window
end type
type rb_all from radiobutton within w_busca_nombre_receiver
end type
type rb_last_6mos from radiobutton within w_busca_nombre_receiver
end type
type sle_1 from singlelineedit within w_busca_nombre_receiver
end type
type st_1 from statictext within w_busca_nombre_receiver
end type
type cb_retrieve from commandbutton within w_busca_nombre_receiver
end type
type cb_print from commandbutton within w_busca_nombre_receiver
end type
type dw_2 from datawindow within w_busca_nombre_receiver
end type
type rb_1 from radiobutton within w_busca_nombre_receiver
end type
type cb_select from commandbutton within w_busca_nombre_receiver
end type
type cb_1 from commandbutton within w_busca_nombre_receiver
end type
type dw_1 from u_dw within w_busca_nombre_receiver
end type
type gb_view from groupbox within w_busca_nombre_receiver
end type
end forward

global type w_busca_nombre_receiver from window
integer x = 197
integer y = 436
integer width = 3712
integer height = 1380
boolean titlebar = true
string title = "Select Receiver~'s Name"
windowtype windowtype = response!
long backcolor = 80269524
boolean center = true
event ue_postopen ( )
rb_all rb_all
rb_last_6mos rb_last_6mos
sle_1 sle_1
st_1 st_1
cb_retrieve cb_retrieve
cb_print cb_print
dw_2 dw_2
rb_1 rb_1
cb_select cb_select
cb_1 cb_1
dw_1 dw_1
gb_view gb_view
end type
global w_busca_nombre_receiver w_busca_nombre_receiver

type variables
string	is_name, is_view_all

datetime id_datestart, id_dateend

end variables

forward prototypes
public function boolean wf_is_rowcount_in_range ()
end prototypes

event ue_postopen();

IF NOT wf_is_rowcount_in_range()	THEN
	RETURN
ELSE
	cb_retrieve.EVENT clicked()
END IF

end event

public function boolean wf_is_rowcount_in_range ();LONG		ll_row_count
STRING	ls_name


 
ls_name	=	"%" + is_name + "%"

IF rb_all.checked	 THEN
	SELECT DISTINCT COUNT(*)	INTO	:ll_row_count
	FROM DBA.RECEIVER	WITH (NOLOCK)
	INNER JOIN	DBA.SENDER WITH (NOLOCK)
	ON		DBA.SENDER.ID_BRANCH = DBA.RECEIVER.ID_BRANCH
			AND DBA.SENDER.ID_SENDER = DBA.RECEIVER.ID_SENDER
	WHERE	DBA.SENDER.ID_SENDER_GLOBAL = :gl_sender;
				//AND DBA.receiver.name_receiver LIKE :ls_name;
ELSE
 	SELECT DISTINCT COUNT(*)	INTO	:ll_row_count
	FROM DBA.RECEIVER	WITH (NOLOCK)
	INNER JOIN	DBA.SENDER WITH (NOLOCK)
	ON		DBA.SENDER.ID_BRANCH = DBA.RECEIVER.ID_BRANCH
			AND DBA.SENDER.ID_SENDER = DBA.RECEIVER.ID_SENDER
	WHERE	DBA.SENDER.ID_SENDER_GLOBAL = :gl_sender
				//AND DBA.receiver.name_receiver LIKE :ls_name
				AND DBA.RECEIVER.DATE_RECEIVER >= DATEADD( MONTH, -6, GETDATE() );
END IF


IF NOT IsNumber( sle_1.text )	THEN
	sle_1.text = "0"
END IF
	
			
IF ll_row_count >	Long(sle_1.text)	THEN
	MessageBox("Warning", "Rows to be retrieved = (" + string(ll_row_count) + ") exceeds maximum rows = (" + string(sle_1.text) + ").  Retrieved cancelled!", Exclamation!, Ok! )
	RETURN	FALSE
END IF

RETURN	TRUE
end function

event open;
is_name = Message.StringParm	

This.PostEvent("ue_postopen")


end event

on w_busca_nombre_receiver.create
this.rb_all=create rb_all
this.rb_last_6mos=create rb_last_6mos
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_retrieve=create cb_retrieve
this.cb_print=create cb_print
this.dw_2=create dw_2
this.rb_1=create rb_1
this.cb_select=create cb_select
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_view=create gb_view
this.Control[]={this.rb_all,&
this.rb_last_6mos,&
this.sle_1,&
this.st_1,&
this.cb_retrieve,&
this.cb_print,&
this.dw_2,&
this.rb_1,&
this.cb_select,&
this.cb_1,&
this.dw_1,&
this.gb_view}
end on

on w_busca_nombre_receiver.destroy
destroy(this.rb_all)
destroy(this.rb_last_6mos)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_retrieve)
destroy(this.cb_print)
destroy(this.dw_2)
destroy(this.rb_1)
destroy(this.cb_select)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_view)
end on

type rb_all from radiobutton within w_busca_nombre_receiver
integer x = 3227
integer y = 180
integer width = 379
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "All"
end type

event clicked;dw_1.Reset()
	
IF rb_all.checked		THEN
	is_view_all	=	"A"
END IF

end event

type rb_last_6mos from radiobutton within w_busca_nombre_receiver
integer x = 3227
integer y = 88
integer width = 379
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last 6 months"
boolean checked = true
end type

event clicked;dw_1.Reset()
	
IF rb_last_6mos.checked		THEN
	is_view_all	=	""
END IF

end event

type sle_1 from singlelineedit within w_busca_nombre_receiver
integer x = 3223
integer y = 804
integer width = 270
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "50"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_busca_nombre_receiver
integer x = 3150
integer y = 676
integer width = 663
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Max. Rows to Retrieve - Warning:"
boolean focusrectangle = false
end type

type cb_retrieve from commandbutton within w_busca_nombre_receiver
integer x = 3218
integer y = 296
integer width = 411
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retrieve"
end type

event clicked;dw_1.EVENT ue_retrieve()
end event

type cb_print from commandbutton within w_busca_nombre_receiver
boolean visible = false
integer x = 942
integer y = 1180
integer width = 411
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Print"
end type

event clicked;dw_2.settransobject(sqlca)

if dw_2.retrieve("%"+is_name+"%",gl_sender,gs_branch_insta) = 0 then
	return
else
	printsetup()
	dw_2.print()
end if


end event

type dw_2 from datawindow within w_busca_nombre_receiver
boolean visible = false
integer x = 315
integer y = 1168
integer width = 494
integer height = 360
integer taborder = 30
boolean enabled = false
string dataobject = "dw_print_busca_nombre_receiver"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_busca_nombre_receiver
boolean visible = false
integer x = 64
integer y = 1216
integer width = 151
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "All"
end type

event clicked;IF dw_1.retrieve("%%",gl_sender,gs_branch_insta)>0 THEN
	dw_1.SetRow(1)
	dw_1.SelectRow(0,FALSE)
	dw_1.SelectRow(1,TRUE)
	dw_1.SetFocus()
	Return
END IF
end event

type cb_select from commandbutton within w_busca_nombre_receiver
integer x = 3218
integer y = 416
integer width = 411
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;long		ll_row
double	ld_receiver
string	ls_branch

ll_row = dw_1.GetRow()
if ll_row = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	
end if

if ll_row <> 0 then
	ls_branch = dw_1.getitemstring(ll_row,"receiver_id_branch")
	ld_receiver = dw_1.getitemnumber(ll_row,"id_receiver")
	closewithreturn(w_busca_nombre_receiver,ls_branch+'*'+string(ld_receiver))
end if
end event

type cb_1 from commandbutton within w_busca_nombre_receiver
integer x = 3218
integer y = 536
integer width = 411
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(parent)
end event

type dw_1 from u_dw within w_busca_nombre_receiver
event ue_retrieve ( )
integer width = 3127
integer height = 1260
integer taborder = 10
string dataobject = "dw_busca_nombre_receiver_new"
boolean hscrollbar = true
end type

event ue_retrieve();LONG		ll_row_count
STRING	ls_name
 
ls_name	=	"%" + is_name + "%"

IF NOT wf_is_rowcount_in_range()	THEN
	RETURN
END IF

//SELECT DISTINCT COUNT(*)	INTO	:ll_row_count
//FROM DBA.RECEIVER	WITH (NOLOCK)
//INNER JOIN	DBA.SENDER WITH (NOLOCK)
//ON		DBA.SENDER.ID_BRANCH = DBA.RECEIVER.ID_BRANCH
//		AND DBA.SENDER.ID_SENDER = DBA.RECEIVER.ID_SENDER
//WHERE	DBA.SENDER.ID_SENDER_GLOBAL = :gl_sender
//			AND DBA.receiver.name_receiver LIKE :ls_name;
// 
//IF ll_row_count >	Long(sle_1.text)	THEN
//	MessageBox("Warning", "Rows to be retrieved = (" + string(ll_row_count) + ") exceeds maximum rows = (" + string(sle_1.text) + ").  Retrieved cancelled!", Exclamation!, Ok! )
//	RETURN
//END IF
	

// ++++++++
// Stats Start
String ls_details
id_datestart = DateTime(Today(),Now())
ls_details = 'SEN: '+String(gl_sender)+'|'+ls_name
// ++++++++


			
if dw_1.retrieve(gl_sender, ls_name, is_view_all) = 0 then
	closewithreturn(w_busca_nombre_receiver,0)
end if



// ++++++++
// Stats End
id_dateend = DateTime(Today(),Now())

// Starts Collect
DECLARE spAddStatisticsDetails PROCEDURE FOR dba.spAddStatisticsDetails
 @ID_APPLICATION = 1
,@ID_STAT_TYPE = 2
,@START_STAT = :id_datestart
,@END_STAT = :id_dateend
,@ID_BRANCH = null
,@ID_SENDER = null
,@ID_RECEIVER = null
,@DETAILS = :ls_details; 

EXECUTE spAddStatisticsDetails;
// ++++++++

end event

event itemchanged;call super::itemchanged;//of_SetTransObject(sqlca) 
//
//of_SetSort(true) 
//
//inv_sort.of_SetStyle(inv_sort.DRAGDROP)
//inv_sort.of_SetColumnNameSource(inv_sort.HEADER)
//inv_sort.of_SetVisibleOnly(true)
//
//inv_sort.of_SetUseDisplay(true)
//of_SetUpdateable(false)
//
//Retrieve(is_name)
end event

event clicked;call super::clicked;if dw_1.GetClickedRow ( ) = 1 then
	dw_1.SelectRow(0, FALSE)
	This.SelectRow(1, TRUE)
	SetRow(1)
	return
elseif dw_1.GetClickedRow ( ) = 0 then
	dw_1.SelectRow(0, FALSE)
	return
else
	This.SelectRow(0, FALSE)
   This.SelectRow(row, TRUE)
	SetRow(row)
end if

end event

event doubleclicked;cb_select.triggerevent(clicked!)
end event

event rowfocuschanged;call super::rowfocuschanged;SelectRow(0, FALSE)
SelectRow(currentrow, TRUE)
SetRow(currentrow)
end event

event constructor;call super::constructor;dw_1.settransobject(sqlca)
end event

type gb_view from groupbox within w_busca_nombre_receiver
integer x = 3200
integer y = 20
integer width = 457
integer height = 256
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "View"
end type

