$PBExportHeader$w_rep_transmision_fax_corresponsal.srw
forward
global type w_rep_transmision_fax_corresponsal from wb_report_fechas
end type
end forward

global type w_rep_transmision_fax_corresponsal from wb_report_fechas
end type
global w_rep_transmision_fax_corresponsal w_rep_transmision_fax_corresponsal

on w_rep_transmision_fax_corresponsal.create
call super::create
end on

on w_rep_transmision_fax_corresponsal.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report_fechas`dw_1 within w_rep_transmision_fax_corresponsal
int Height=1536
boolean BringToTop=true
string DataObject="dw_rep_envio_transmitir"
end type

type em_fecha1 from wb_report_fechas`em_fecha1 within w_rep_transmision_fax_corresponsal
int X=1097
boolean BringToTop=true
end type

type st_1 from wb_report_fechas`st_1 within w_rep_transmision_fax_corresponsal
int X=731
boolean BringToTop=true
end type

type st_2 from wb_report_fechas`st_2 within w_rep_transmision_fax_corresponsal
int X=1646
boolean BringToTop=true
end type

type em_fecha2 from wb_report_fechas`em_fecha2 within w_rep_transmision_fax_corresponsal
int X=2011
int Y=24
boolean BringToTop=true
end type

event em_fecha2::modified;return 0
end event

event em_fecha2::losefocus;Date		ld_fecha1, ld_fecha2
time		lt_hora

string	ls_grupo, ls_branch
long		ll_rows, ll_i, ll_ref, ll_fila
Double	ld_referencia, ld_receiver

ld_fecha1 = Date(em_fecha1.text)

ld_fecha2 = RelativeDate(Date(em_fecha2.text),1)


ll_rows = dw_1.retrieve(ld_Fecha1,ld_Fecha2)
dw_1.setfocus()




///////////////////////////////////////////////////////////

if ll_rows > 0 then
	if messagebox("Reference,","Do you Want to Generate the Reference or Transfer",Question!,yesno!) = 1 then
		///////////////////////////// Generar la Referencia //////////////////////		
		setpointer(hourglass!)
		
		
	ll_i = 1	

	DO WHILE ll_i <= ll_rows
	
		ls_grupo = dw_1.getitemstring(ll_i,"main_branch")
	
		ll_ref		= dw_1.getitemnumber(ll_i,"referencia")
		
		if ll_ref = 0 Then
	
			SELECT MAX(dba.receiver.ref_receiver)  
    		INTO :ld_referencia  
    		FROM  dba.branch,   
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
		end if
			
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

