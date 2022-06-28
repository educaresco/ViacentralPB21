$PBExportHeader$uo_segmentation.sru
forward
global type uo_segmentation from userobject
end type
type em_text from editmask within uo_segmentation
end type
type rr_fondo from roundrectangle within uo_segmentation
end type
end forward

global type uo_segmentation from userobject
integer width = 416
integer height = 100
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
em_text em_text
rr_fondo rr_fondo
end type
global uo_segmentation uo_segmentation

forward prototypes
public subroutine uof_query (string ps_branch)
public subroutine uof_clear ()
end prototypes

public subroutine uof_query (string ps_branch);STRING s_segmentation_id, s_segmentation, s_segmentation_color


SELECT Isnull(S.ID_SEGMENTATION ,'N') ID_SEGMENTATION,
		   S.SEGMENTATION_NAME,
	  	   S.SEGMENTATION_COLOR
	INTO  :s_segmentation_id,
			:s_segmentation, 
			:s_segmentation_color
FROM dba.BRANCH B
	 LEFT JOIN dba.AGENCY_SEGMENTATION S ON B.IS_VIP = S.ID_SEGMENTATION
WHERE B.ID_BRANCH =:ps_branch;

IF isNull(s_segmentation_id) OR Len(s_segmentation_id) = 0 THEN
	s_segmentation_id = 'N'
END IF

IF s_segmentation_id <> 'N'  THEN
	rr_fondo.FillColor =long(s_segmentation_color)
	em_text.BackColor = long(s_segmentation_color)
	em_text.Text = s_segmentation
	this.visible = True
ELSE
	this.visible = False
END IF
end subroutine

public subroutine uof_clear ();this.visible = false
end subroutine

on uo_segmentation.create
this.em_text=create em_text
this.rr_fondo=create rr_fondo
this.Control[]={this.em_text,&
this.rr_fondo}
end on

on uo_segmentation.destroy
destroy(this.em_text)
destroy(this.rr_fondo)
end on

event constructor;this.visible = false
end event

type em_text from editmask within uo_segmentation
integer x = 18
integer y = 16
integer width = 393
integer height = 72
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Lucida Fax"
long textcolor = 33554432
long backcolor = 134217857
string text = "VIP - ELITE"
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = stringmask!
end type

type rr_fondo from roundrectangle within uo_segmentation
integer linethickness = 4
long fillcolor = 255
integer width = 425
integer height = 100
integer cornerheight = 40
integer cornerwidth = 46
end type

