$PBExportHeader$w_sel_fecha_reconciliacion.srw
forward
global type w_sel_fecha_reconciliacion from wb_response
end type
type st_1 from statictext within w_sel_fecha_reconciliacion
end type
type cb_1 from commandbutton within w_sel_fecha_reconciliacion
end type
type em_date from pfc_u_em within w_sel_fecha_reconciliacion
end type
type pb_date1 from picturebutton within w_sel_fecha_reconciliacion
end type
type gb_1 from groupbox within w_sel_fecha_reconciliacion
end type
end forward

global type w_sel_fecha_reconciliacion from wb_response
integer x = 1499
integer y = 1500
integer width = 1230
integer height = 468
string title = "Nueva fecha para reconciliar"
st_1 st_1
cb_1 cb_1
em_date em_date
pb_date1 pb_date1
gb_1 gb_1
end type
global w_sel_fecha_reconciliacion w_sel_fecha_reconciliacion

on w_sel_fecha_reconciliacion.create
int iCurrent
call super::create
this.st_1=create st_1
this.cb_1=create cb_1
this.em_date=create em_date
this.pb_date1=create pb_date1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.em_date
this.Control[iCurrent+4]=this.pb_date1
this.Control[iCurrent+5]=this.gb_1
end on

on w_sel_fecha_reconciliacion.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.em_date)
destroy(this.pb_date1)
destroy(this.gb_1)
end on

event open;call super::open;String 		ls_fecha
DateTime		ldt_fecha_reconcilicacion, ldt_fecha

ls_fecha= Message.StringParm
ldt_fecha = DateTime(Date(ls_fecha))

SELECT	dba.sfGetNextBusinessDay(:ldt_fecha)
INTO		:ldt_fecha_reconcilicacion
FROM		dba.DUAL;

//em_date.Text= String(RelativeDate (Date(ls_fecha),1),"mm/dd/yyyy")
em_date.Text= String(ldt_fecha_reconcilicacion,"mm/dd/yyyy")




end event

type st_1 from statictext within w_sel_fecha_reconciliacion
integer x = 352
integer y = 108
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "mm/dd/aaaa"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_sel_fecha_reconciliacion
integer x = 457
integer y = 260
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Aceptar"
end type

event clicked;//Message.Stringparm= em_date.Text

CloseWithReturn(parent, em_date.Text)
end event

type em_date from pfc_u_em within w_sel_fecha_reconciliacion
integer x = 709
integer y = 96
integer width = 320
integer height = 84
integer taborder = 0
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean enabled = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event constructor;call super::constructor;this.of_SetDropDownCalendar(TRUE)
this.iuo_calendar.of_SetSundayBold(TRUE)
this.iuo_calendar.of_SetSundayColor(RGB(0, 0, 128))
this.iuo_calendar.of_SetSaturdayBold(FALSE)
this.iuo_calendar.of_SetSaturdayColor(RGB(0, 0, 128))

end event

type pb_date1 from picturebutton within w_sel_fecha_reconciliacion
boolean visible = false
integer x = 1070
integer y = 92
integer width = 101
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\ViamericasMT\imagenes\calendar.gif"
alignment htextalign = right!
end type

event clicked;em_date.Event pfc_DDCalendar( )
Parent.Width=1257
Parent.Height=1000

//Midnight, gettin' uptight. Where are you?
//You said you'd meet me, now it's quarter to two
//I know I'm hangin' but I'm still wantin' you.
//Hey, Jack, It's a fact they're talkin' in town.

//I turn my back and you're messin' around.
//I'm not really jealous, don't like lookin' like a clown.

//I think of you ev'ry night and day.
//You took my heart, then you took my pride away.

//I hate myself for loving you .
//Can't break free from the the things that you do.

//I wanna walk but I run back to you, that's why
//I hate myself for loving you .

//Daylight, spent the night without you.
//But I've been dreamin' 'bout the lovin' you do.
//I won't be as angry 'bout the hell you put me through.
//Hey, man, bet you can treat me right.
//You just don't know what you was missin' last night.
//I wanna see your face and say forget it just from spite.
//I hate myself for loving you .
//Can't break free from the the things that you do.
//I wanna walk but I run back to you, that's why
//I hate myself for loving you.
//I hate myself for loving you.
//Can't break free from the things that you do.
//I wanna walk but I run back to you, that's why
//I hate myself for loving you .
//I think of you ev'ry night and day.
//You took my heart, then you took my pride away.
//I hate myself for loving you .
//Can't break free from the the things that you do.
//I wanna walk but I run back to you, that's why
//I hate myself for loving you .
//I hate myself for loving you .
//I hate myself for loving you . 
end event

type gb_1 from groupbox within w_sel_fecha_reconciliacion
integer x = 23
integer y = 12
integer width = 1179
integer height = 228
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nueva fecha de reconciliación"
end type

