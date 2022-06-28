$PBExportHeader$w_liberar_por_motivos_audit.srw
forward
global type w_liberar_por_motivos_audit from window
end type
type cb_cancel from commandbutton within w_liberar_por_motivos_audit
end type
type cb_1 from commandbutton within w_liberar_por_motivos_audit
end type
type dw_1 from datawindow within w_liberar_por_motivos_audit
end type
end forward

global type w_liberar_por_motivos_audit from window
integer x = 315
integer y = 752
integer width = 3675
integer height = 824
boolean titlebar = true
string title = "Relase Audit Record"
windowtype windowtype = response!
long backcolor = 80269524
cb_cancel cb_cancel
cb_1 cb_1
dw_1 dw_1
end type
global w_liberar_por_motivos_audit w_liberar_por_motivos_audit

on w_liberar_por_motivos_audit.create
this.cb_cancel=create cb_cancel
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_cancel,&
this.cb_1,&
this.dw_1}
end on

on w_liberar_por_motivos_audit.destroy
destroy(this.cb_cancel)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;if dw_1.retrieve(gs_branch_insta_cons,gl_receiver_cons,gs_cashier) = 0 then
	close(w_liberar_por_motivos_audit)
end if
	
end event

type cb_cancel from commandbutton within w_liberar_por_motivos_audit
integer x = 1723
integer y = 628
integer width = 786
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(w_liberar_por_motivos_audit)
end event

type cb_1 from commandbutton within w_liberar_por_motivos_audit
integer x = 878
integer y = 628
integer width = 786
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Release"
boolean default = true
end type

event clicked;long	ll_rows,i
string	ls_status, ls_soltar, ls_des, ls_whitelist
date		ld_date
time		lt_time
datetime ld_datetime
Double	ld_sender

String 	ls_clearance_type, ls_message_clearance

ll_rows = dw_1.rowcount()

FOR i=1 TO ll_rows
	
	dw_1.accepttext()
	
	ls_status 	= dw_1.getitemstring(i,'type')
	ls_soltar 		= dw_1.getitemstring(i,'release')
	ls_des	 	= dw_1.getitemstring(i,'desc')
	ld_sender 	= dw_1.getitemnumber(i,'id_sender')
	ls_whitelist 	= dw_1.getitemstring(i,'whitelist')
	
	if ls_soltar = '1' then
		
		ld_date =date( string(today(),'MM-DD-YYYY')    )
		lt_time = time( string(  now(),'hh:mm:ss'   )   )
		ld_datetime = datetime(ld_date,lt_time)
		
		
		
		DECLARE sp_releaseAudit PROCEDURE FOR dba.spReleaseInvoiceAudit @id_branch = :gs_branch_insta_cons, 
			@id_receiver = :gl_receiver_cons, 
			@type_motivo_hold = :ls_status,
			@desc_motivo_hold = :ls_des,
			@id_cashier = :gs_cashier;
								 
		execute sp_releaseAudit;		
		
		commit ;	
		
	end if

NEXT

Close(w_liberar_por_motivos_audit)
end event

type dw_1 from datawindow within w_liberar_por_motivos_audit
integer x = 23
integer width = 3625
integer height = 604
integer taborder = 10
string dataobject = "dw_mot_relase_audit"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

