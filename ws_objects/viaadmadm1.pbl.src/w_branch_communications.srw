$PBExportHeader$w_branch_communications.srw
forward
global type w_branch_communications from pfc_w_sheet
end type
type pb_2 from picturebutton within w_branch_communications
end type
type pb_1 from picturebutton within w_branch_communications
end type
type cb_4 from commandbutton within w_branch_communications
end type
type dw_1 from datawindow within w_branch_communications
end type
type cb_1 from commandbutton within w_branch_communications
end type
type mle_english from multilineedit within w_branch_communications
end type
type st_2 from statictext within w_branch_communications
end type
type st_1 from statictext within w_branch_communications
end type
type mle_spanish from multilineedit within w_branch_communications
end type
type gb_1 from groupbox within w_branch_communications
end type
type gb_2 from groupbox within w_branch_communications
end type
end forward

global type w_branch_communications from pfc_w_sheet
integer x = 214
integer y = 221
integer width = 2642
integer height = 2052
pb_2 pb_2
pb_1 pb_1
cb_4 cb_4
dw_1 dw_1
cb_1 cb_1
mle_english mle_english
st_2 st_2
st_1 st_1
mle_spanish mle_spanish
gb_1 gb_1
gb_2 gb_2
end type
global w_branch_communications w_branch_communications

on w_branch_communications.create
int iCurrent
call super::create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_4=create cb_4
this.dw_1=create dw_1
this.cb_1=create cb_1
this.mle_english=create mle_english
this.st_2=create st_2
this.st_1=create st_1
this.mle_spanish=create mle_spanish
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_2
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.mle_english
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.mle_spanish
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.gb_2
end on

on w_branch_communications.destroy
call super::destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_4)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.mle_english)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_spanish)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;String ls_MSGTEXT, ls_MSGTEXT_EN
Long ll_FONTR,ll_FONTG,ll_FONTB,ll_BCKR,ll_BCKG,ll_BCKB

SELECT TOP 1
           MSGTEXT
           ,MSGTEXT_EN
           ,FONTR
           ,FONTG
           ,FONTB
           ,BCKR
           ,BCKG
           ,BCKB
INTO    :ls_MSGTEXT
           ,:ls_MSGTEXT_EN
           ,:ll_FONTR
           ,:ll_FONTG
           ,:ll_FONTB
           ,:ll_BCKR
           ,:ll_BCKG
           ,:ll_BCKB
FROM dba.VIACASH_MESSAGE
ORDER BY ID DESC;

mle_spanish.TextColor = RGB(ll_FONTR,ll_FONTG,ll_FONTB)
mle_english.TextColor = RGB(ll_FONTR,ll_FONTG,ll_FONTB)

mle_spanish.BackColor = RGB(ll_BCKR,ll_BCKG,ll_BCKB)
mle_english.BackColor = RGB(ll_BCKR,ll_BCKG,ll_BCKB)

mle_spanish.text = ls_MSGTEXT
mle_english.text = ls_MSGTEXT_EN

//

dw_1.retrieve()
end event

type pb_2 from picturebutton within w_branch_communications
integer x = 1979
integer y = 352
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "InkPicture!"
alignment htextalign = left!
end type

event clicked;long  red, green, blue, selected
long custom[ ]
integer li_color

// Colores personalizados:
//custom[1]=rgb(1, 200, 1)
//custom[2]=8344736

selected = RGB(1,2,3) // White

li_color = ChooseColor( selected, custom [ ] )

mle_spanish.BackColor = selected
mle_english.BackColor = selected

////conversion a RGB:
//red = mod(selected,256)
//green = mod(selected,65536)/256
//blue = selected/65536
end event

type pb_1 from picturebutton within w_branch_communications
integer x = 1979
integer y = 256
integer width = 101
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "InkEdit!"
alignment htextalign = left!
end type

event clicked;long  red, green, blue, selected
long custom[ ]
integer li_color

// Colores personalizados:
//custom[1]=rgb(1, 200, 1)
//custom[2]=8344736

selected = RGB(1,2,3) // White

li_color = ChooseColor( selected, custom [ ] )

mle_spanish.TextColor = selected
mle_english.TextColor = selected

////conversion a RGB:
//red = mod(selected,256)
//green = mod(selected,65536)/256
//blue = selected/65536
end event

type cb_4 from commandbutton within w_branch_communications
integer x = 1879
integer y = 1720
integer width = 613
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;dw_1.update()
end event

type dw_1 from datawindow within w_branch_communications
integer x = 91
integer y = 932
integer width = 2427
integer height = 768
integer taborder = 60
string title = "none"
string dataobject = "dw_branch_communications"
boolean border = false
boolean livescroll = true
end type

event constructor;SettransObject(SQLCA)
end event

type cb_1 from commandbutton within w_branch_communications
integer x = 1326
integer y = 592
integer width = 613
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;String ls_MSGTEXT, ls_MSGTEXT_EN
Long ll_FONTR,ll_FONTG,ll_FONTB,ll_BCKR,ll_BCKG,ll_BCKB

ls_MSGTEXT = mle_spanish.text
ls_MSGTEXT_EN = mle_english.text

////conversion a RGB:
ll_FONTR = mod(mle_spanish.TextColor,256)
ll_FONTG = mod(mle_spanish.TextColor,65536)/256
ll_FONTB = mle_spanish.TextColor/65536

////conversion a RGB:
ll_BCKR = mod(mle_spanish.BackColor,256)
ll_BCKG = mod(mle_spanish.BackColor,65536)/256
ll_BCKB = mle_spanish.BackColor/65536

INSERT INTO dba.VIACASH_MESSAGE
           (DATE_PUBLISHED
           ,MSGTEXT
           ,MSGTEXT_EN
           ,FONTR
           ,FONTG
           ,FONTB
           ,BCKR
           ,BCKG
           ,BCKB
           ,DB_USER_NAME)
     VALUES(
		        getdate(),
            :ls_MSGTEXT,
            :ls_MSGTEXT_EN,
            :ll_FONTR,
            :ll_FONTG,
            :ll_FONTB,
            :ll_BCKR,
            :ll_BCKG,
            :ll_BCKB,
            SYSTEM_USER);
				
If SQLCA.SqlCode <> 0 then
	Messagebox("Error","Error grabando la información "+SQLCA.SqlErrtext,StopSign!)
else
	Messagebox("Confirmación","Datos Actualizados")
end if
end event

type mle_english from multilineedit within w_branch_communications
integer x = 1239
integer y = 256
integer width = 699
integer height = 284
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = center!
textcase textcase = upper!
integer limit = 200
end type

type st_2 from statictext within w_branch_communications
integer x = 1248
integer y = 192
integer width = 649
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mensaje ViaCash En Ingles"
boolean focusrectangle = false
end type

type st_1 from statictext within w_branch_communications
integer x = 480
integer y = 192
integer width = 649
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mensaje ViaCash En Español"
boolean focusrectangle = false
end type

type mle_spanish from multilineedit within w_branch_communications
integer x = 471
integer y = 256
integer width = 699
integer height = 284
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = center!
textcase textcase = upper!
integer limit = 200
end type

type gb_1 from groupbox within w_branch_communications
integer x = 64
integer y = 844
integer width = 2491
integer height = 1020
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Leyenda Cheques Comisiones"
end type

type gb_2 from groupbox within w_branch_communications
integer x = 64
integer y = 68
integer width = 2491
integer height = 696
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mensaje ViaCash"
end type

