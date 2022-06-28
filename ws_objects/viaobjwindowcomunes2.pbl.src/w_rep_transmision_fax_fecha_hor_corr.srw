$PBExportHeader$w_rep_transmision_fax_fecha_hor_corr.srw
forward
global type w_rep_transmision_fax_fecha_hor_corr from wb_report_fechas
end type
type em_hora from u_em within w_rep_transmision_fax_fecha_hor_corr
end type
type st_3 from statictext within w_rep_transmision_fax_fecha_hor_corr
end type
type sle_grupo from singlelineedit within w_rep_transmision_fax_fecha_hor_corr
end type
type st_4 from statictext within w_rep_transmision_fax_fecha_hor_corr
end type
type cb_1 from commandbutton within w_rep_transmision_fax_fecha_hor_corr
end type
end forward

global type w_rep_transmision_fax_fecha_hor_corr from wb_report_fechas
em_hora em_hora
st_3 st_3
sle_grupo sle_grupo
st_4 st_4
cb_1 cb_1
end type
global w_rep_transmision_fax_fecha_hor_corr w_rep_transmision_fax_fecha_hor_corr

on w_rep_transmision_fax_fecha_hor_corr.create
int iCurrent
call super::create
this.em_hora=create em_hora
this.st_3=create st_3
this.sle_grupo=create sle_grupo
this.st_4=create st_4
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_hora
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.sle_grupo
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.cb_1
end on

on w_rep_transmision_fax_fecha_hor_corr.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_hora)
destroy(this.st_3)
destroy(this.sle_grupo)
destroy(this.st_4)
destroy(this.cb_1)
end on

event open;call super::open;commit;

em_hora.text = String(Now())
end event

type dw_1 from wb_report_fechas`dw_1 within w_rep_transmision_fax_fecha_hor_corr
int Y=148
int Width=3159
int Height=1592
int TabOrder=50
boolean BringToTop=true
string DataObject="dw_rep_envio_transmitir_fecha_hor_corr"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_transmision_fax_fecha_hor_corr
int X=507
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_transmision_fax_fecha_hor_corr
int X=142
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_transmision_fax_fecha_hor_corr
int X=905
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_transmision_fax_fecha_hor_corr
int X=1271
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

type em_hora from u_em within w_rep_transmision_fax_fecha_hor_corr
int X=1865
int Y=32
int Width=366
int Height=100
int TabOrder=30
boolean BringToTop=true
Alignment Alignment=Center!
string Mask="hh:mm:ss"
MaskDataType MaskDataType=TimeMask!
boolean AutoSkip=true
boolean Spin=true
string MinMax=""
FontCharSet FontCharSet=Ansi!
end type

type st_3 from statictext within w_rep_transmision_fax_fecha_hor_corr
int X=1682
int Y=32
int Width=178
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Hora :"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_grupo from singlelineedit within w_rep_transmision_fax_fecha_hor_corr
int X=2496
int Y=32
int Width=261
int Height=92
int TabOrder=40
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
TextCase TextCase=Upper!
long TextColor=33554432
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event losefocus;Date		ld_fecha1, ld_fecha2
time		lt_hora
string	ls_grupo, ls_branch
long		ll_rows, ll_i, ll_ref
Double	ld_referencia, ld_receiver

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)


lt_hora	= time(em_hora.text)

ls_grupo = sle_grupo.text

ll_rows = dw_1.retrieve(ld_Fecha1,ld_Fecha2,lt_hora,ls_grupo)

if ll_rows > 0 then
	if messagebox("Reference,","Do you Want to Generate the Reference or Transfer",Question!,yesno!) = 1 then
		///////////////////////////// Generar la Referencia //////////////////////		
		setpointer(hourglass!)
	
		SELECT MAX(dba.receiver.ref_receiver)  
    	INTO :ld_referencia  
    	FROM dba.branch,   
      	   dba.group_branch,   
        		dba.receiver  
   	WHERE ( dba.group_branch.id_main_branch = dba.branch.id_main_branch ) and  
         	( dba.receiver.branch_pay_receiver = dba.branch.id_branch ) and  
         	( ( dba.group_branch.id_main_branch = :ls_grupo ) )   ;
	
			If Isnull(ld_referencia) Then
				ld_referencia = 1
			else
				ld_referencia = ld_referencia + 1
			End if
			
			ll_i = 1
			
			DO WHILE ll_i <= ll_rows
				
				ls_branch 	= dw_1.getitemstring(ll_i,"receiver_id_branch")
				ld_receiver = dw_1.getitemnumber(ll_i,"receiver_id_receiver")
				ll_ref		= dw_1.getitemnumber(ll_i,"referencia")
				
				UPDATE dba.receiver  
     	  		SET   	dba.receiver.trans_receiver = 'T'  
   	  		WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
            	   ( dba.receiver.id_receiver = :ld_receiver )   ;
				
				if ll_ref = 0 then
					
					  UPDATE dba.receiver  
     	  				SET dba.receiver.ref_receiver = :ld_referencia,
			 				 dba.receiver.id_flag_receiver = 'T',   
         				 dba.receiver.trans_receiver = 'T'  
   	  				WHERE ( dba.receiver.id_branch = :ls_branch ) AND  
              				( dba.receiver.id_receiver = :ld_receiver )   ;
						
					dw_1.setitem(ll_i,"referencia", ld_referencia)
					ld_referencia = ld_referencia + 1
				end if
				ll_i = ll_i + 1
			LOOP

	else
		return
	end if
end if
	setpointer(Arrow!)	
commit	;
dw_1.setfocus()
end event

type st_4 from statictext within w_rep_transmision_fax_fecha_hor_corr
int X=2304
int Y=32
int Width=197
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Grupo :"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_rep_transmision_fax_fecha_hor_corr
int X=2761
int Y=32
int Width=151
int Height=88
int TabOrder=60
boolean BringToTop=true
string Text="..."
boolean Default=true
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string 	ls_group


Open(w_seleccionar_grupo)

ls_group = message.stringparm

sle_grupo.text = ls_group

sle_grupo.setfocus()
end event

