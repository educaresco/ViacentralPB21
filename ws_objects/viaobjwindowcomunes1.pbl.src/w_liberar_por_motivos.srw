$PBExportHeader$w_liberar_por_motivos.srw
forward
global type w_liberar_por_motivos from window
end type
type cb_cancel from commandbutton within w_liberar_por_motivos
end type
type dw_1 from datawindow within w_liberar_por_motivos
end type
type pb_release from picturebutton within w_liberar_por_motivos
end type
end forward

global type w_liberar_por_motivos from window
integer x = 315
integer y = 752
integer width = 4754
integer height = 1124
boolean titlebar = true
string title = "Relase"
windowtype windowtype = response!
long backcolor = 80269524
cb_cancel cb_cancel
dw_1 dw_1
pb_release pb_release
end type
global w_liberar_por_motivos w_liberar_por_motivos

forward prototypes
public subroutine wf_manage_button ()
end prototypes

public subroutine wf_manage_button ();
LONG ll_row

ll_row = dw_1.Find( "ready = 'S'", 1, dw_1.RowCount())


IF ll_row > 0 THEN
	pb_release.Enabled = True
ELSE
	pb_release.Enabled = FALSE
END IF
end subroutine

on w_liberar_por_motivos.create
this.cb_cancel=create cb_cancel
this.dw_1=create dw_1
this.pb_release=create pb_release
this.Control[]={this.cb_cancel,&
this.dw_1,&
this.pb_release}
end on

on w_liberar_por_motivos.destroy
destroy(this.cb_cancel)
destroy(this.dw_1)
destroy(this.pb_release)
end on

event open;if dw_1.retrieve(gs_branch_insta_cons,gl_receiver_cons,gs_cashier) = 0 then
	close(w_liberar_por_motivos)
end if
	
end event

type cb_cancel from commandbutton within w_liberar_por_motivos
integer x = 2062
integer y = 920
integer width = 786
integer height = 88
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

event clicked;Close(w_liberar_por_motivos)
end event

type dw_1 from datawindow within w_liberar_por_motivos
integer x = 23
integer width = 4640
integer height = 868
integer taborder = 10
string dataobject = "dw_mot_relase"
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event itemfocuschanged;STRING s_type_hold
DataWindowChild	ldw_dw

IF dwo.Name = 'desc' THEN
	
	s_type_hold = this.GetItemString(row,'type')
	
	GetChild('desc',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.SetFilter("TIPO_HOLD = '"+s_type_hold+"'")
	ldw_dw.Filter()
	ldw_dw.SetSort("ORDER_ROW" )
	ldw_dw.Sort()
	
END IF

//dw_1.setitem(dw_1.getrow(),"id_cuenta_banco",'')
end event

event itemchanged;STRING s_enabled_others

DataWindowChild	ldw_dw

IF dwo.Name = 'desc' THEN
	this.SetRedraw(FALSE)
	this.AcceptText()
	
	GetChild('desc',ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	s_enabled_others = ldw_dw.GetItemString(ldw_dw.getRow(),'enable_others')
	
	IF s_enabled_others = 'N' THEN 
		this.SetItem(row,'other_description', '' ) 
		this.SetItem(row,'ready', 'S' ) 
	ELSE
		this.SetItem(row,'ready', 'N' ) 
	END IF
	
	this.SetItem(row,'enabled_other_desc',  s_enabled_others)
	This.SetRedraw(TRUE)	
ELSE
	IF Len(data) > 0 THEN
		this.SetItem(row,'ready', 'S' ) 
	END IF
END IF

wf_manage_button()


end event

event editchanged;STRING s_enabled_others

DataWindowChild	ldw_dw

IF dwo.Name = 'other_description' THEN	
	IF Len(data) > 0 THEN
		this.SetItem(row,'ready', 'S' ) 
	ELSE
		this.SetItem(row,'ready', 'N' ) 
	END IF
	
	wf_manage_button()
END IF


end event

type pb_release from picturebutton within w_liberar_por_motivos
integer x = 1216
integer y = 920
integer width = 786
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Release"
boolean originalsize = true
long backcolor = 12639424
end type

event clicked;long	ll_rows,i
string	ls_status, ls_soltar, ls_des, ls_whitelist, ls_OfacWhitelist
date		ld_date
time		lt_time
datetime ld_datetime
Double	ld_sender
DataWindowChild	ldw_dw


String 	ls_clearance_type, ls_message_clearance

ll_rows = dw_1.rowcount()

dw_1.accepttext()

FOR i=1 TO ll_rows
	
	
	
	ls_status 	= dw_1.getitemstring(i,'type')
	ls_soltar 		= dw_1.getitemstring(i,'release')
	ls_des	 	= dw_1.getitemstring(i,'desc')
	ld_sender 	= dw_1.getitemnumber(i,'id_sender')
	ls_whitelist 	= dw_1.getitemstring(i,'whitelist')
	ls_OfacWhitelist = dw_1.getitemstring(i,'ofac_whitelist')
	
	if Len(ls_des) > 0 then
		
		IF dw_1.getitemstring(i,'enabled_other_desc') = 'Y' THEN 
			ls_des = dw_1.getitemstring(i,'other_description' )
		END IF		
			
		if Len(ls_des) > 0 then
			dw_1.GetChild('desc',ldw_dw)
			ldw_dw.SetTransObject(SQLCA)
				
			
			ld_date =date( string(today(),'MM-DD-YYYY')    )
			lt_time = time( string(  now(),'hh:mm:ss'   )   )
			ld_datetime = datetime(ld_date,lt_time)
			
			
			DECLARE sp_release PROCEDURE FOR dba.spReleaseInvoice @id_branch = :gs_branch_insta_cons, 
				@id_receiver = :gl_receiver_cons, 
				@type_motivo_hold = :ls_status,
				@desc_motivo_hold = :ls_des,
				@id_cashier = :gs_cashier;
									 
			execute sp_release;		
			
			
	// 		Revizar porque sale
	//		if SQLCA.sqlcode <> 0 and SQLCA.sqlcode <> 100 then	
	//			
	//			Messagebox("Error","Ocurrio un Error liberando el Envio, por favor intente de nuevo.~n~r"+String(SQLCA.sqlcode)+ ' - ' + SQLCA.SQLErrText,StopSign!)
	//			return
	//			
	//		end if
			
			/***************************************************
				carlos.sarmiento
				Feb 21 / 2013
				Clearance list for OFAC AUTO release
			***************************************************/
			if ( ( trim(ls_status) = "65"  or  trim(ls_status) = "62"   )  and (ls_OfacWhitelist = 'Y')) then 
			
							if (trim(ls_status) = "65" ) then
								ls_clearance_type = 'R'
							elseif  trim(ls_status) = "62" then
								ls_clearance_type = 'S'
							end if
							
							DECLARE sp_clearance PROCEDURE FOR dba.spAddClearanceRecord @PS_ID_BRANCH = :gs_branch_insta_cons, 
										@PN_ID_RECEIVER = :gl_receiver_cons, 
										@PS_TYPE = :ls_clearance_type,
										@PS_ID_CASHIER = :gs_cashier;
													 
								execute sp_clearance;
								COMMIT;
			end if		
			/****************************************************/
			
	//		INSERT INTO dba.motivo_hold_history  
	//		( id_sender,   
	//		id_branch,   
	//		id_receiver,   
	//		date_motivo_hold,   
	//		time_motivo_hold,   
	//		type_motivo_hold,   
	//		desc_motivo_hold,   
	//		id_cashier,   
	//		date_release,   
	//		time_release )  
	//		VALUES ( :ld_sender,   
	//		:gs_branch_insta_cons,   
	//		:gl_receiver_cons,   
	//		:ld_datetime,   
	//		:ld_datetime,   
	//		:ls_status,   
	//		:ls_des,   
	//		:gs_cashier,   
	//		:ld_datetime,   
	//		:ld_datetime );		
	//		
	//		DELETE FROM dba.motivo_hold  
	//		WHERE dba.motivo_hold.id_branch = :gs_branch_insta_cons
	//		AND dba.motivo_hold.id_receiver = :gl_receiver_cons
	//		AND  dba.motivo_hold.type_motivo_hold = :ls_status;
					
			if ls_whitelist = 'Y' then 
			
				double ld_max_bl
				
				SELECT max(COD_BLACKLIST)
				INTO :ld_max_bl
				FROM dba.BLACKLIST;
			
				INSERT INTO dba.WHITELIST (TYPE_WHITELIST,ID_BRANCH,ID_SENDER,COD_BLACKLIST)
				VALUES ('BS',:gs_branch_insta_cons,:ld_sender, :ld_max_bl);
						
			end if
							
			commit ;	
		end if
	end if

NEXT

Close(w_liberar_por_motivos)
end event

