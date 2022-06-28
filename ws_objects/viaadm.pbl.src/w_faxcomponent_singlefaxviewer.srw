$PBExportHeader$w_faxcomponent_singlefaxviewer.srw
forward
global type w_faxcomponent_singlefaxviewer from w_faxcomponent
end type
end forward

global type w_faxcomponent_singlefaxviewer from w_faxcomponent
integer width = 3255
integer height = 2404
string title = "Fax Viewer - Single Fax Viewer"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
end type
global w_faxcomponent_singlefaxviewer w_faxcomponent_singlefaxviewer

on w_faxcomponent_singlefaxviewer.create
call super::create
end on

on w_faxcomponent_singlefaxviewer.destroy
call super::destroy
end on

event open;call super::open;TRY

	String ls_fullpath, ls_faxfile
	ls_fullpath = lb_folder.text // the inherid code puts the parameter on lb_folder					
	
	is_faxpath = mid(ls_fullpath,1,lastpos(ls_fullpath,"\"))
	ls_faxfile = mid(ls_fullpath,lastpos(ls_fullpath,"\")+1)
		
	lb_faxes.AddItem(ls_faxfile)
	lb_faxes.SelectItem(1)

	fn_loadfax( is_faxpath+lb_faxes.SelectedItem())	
	fn_ajustscreen()
	

CATCH (runtimeerror er)   

   //MessageBox("Runtime Error", er.GetMessage())
	Messagebox("Error (try block)","Este fax ya ha sido movido, la lista sera actualizada!~n~r"+er.GetMessage(),Exclamation!)
	cb_refresh.TriggerEvent(Clicked!)

FINALLY   
   	
	Return
	
END TRY 
end event

event resize;call super::resize;ole_fax1.Width = this.Width - 80
end event

type st_5 from w_faxcomponent`st_5 within w_faxcomponent_singlefaxviewer
integer x = 1806
end type

type pb_separate from w_faxcomponent`pb_separate within w_faxcomponent_singlefaxviewer
boolean visible = false
integer x = 2610
boolean enabled = false
end type

type pb_print from w_faxcomponent`pb_print within w_faxcomponent_singlefaxviewer
integer x = 3099
end type

type cb_refresh from w_faxcomponent`cb_refresh within w_faxcomponent_singlefaxviewer
boolean visible = false
integer x = 27
boolean enabled = false
end type

type pb_previous from w_faxcomponent`pb_previous within w_faxcomponent_singlefaxviewer
integer x = 2629
boolean originalsize = false
end type

type pb_next from w_faxcomponent`pb_next within w_faxcomponent_singlefaxviewer
integer x = 2907
end type

type ole_fax1 from w_faxcomponent`ole_fax1 within w_faxcomponent_singlefaxviewer
integer x = 27
integer width = 3186
integer height = 2076
end type

type lb_faxes from w_faxcomponent`lb_faxes within w_faxcomponent_singlefaxviewer
boolean visible = false
integer y = 208
integer height = 712
end type

type st_2 from w_faxcomponent`st_2 within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type cb_ok from w_faxcomponent`cb_ok within w_faxcomponent_singlefaxviewer
integer x = 2743
integer y = 2208
end type

type cb_rotateleft from w_faxcomponent`cb_rotateleft within w_faxcomponent_singlefaxviewer
integer x = 1504
end type

type cb_rotateright from w_faxcomponent`cb_rotateright within w_faxcomponent_singlefaxviewer
integer x = 1609
end type

type st_4 from w_faxcomponent`st_4 within w_faxcomponent_singlefaxviewer
integer x = 1275
end type

type st_6 from w_faxcomponent`st_6 within w_faxcomponent_singlefaxviewer
integer x = 2505
end type

type sle_pos from w_faxcomponent`sle_pos within w_faxcomponent_singlefaxviewer
integer x = 2734
end type

type cb_move from w_faxcomponent`cb_move within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type lb_folder from w_faxcomponent`lb_folder within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type st_3 from w_faxcomponent`st_3 within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type sle_selected from w_faxcomponent`sle_selected within w_faxcomponent_singlefaxviewer
integer x = 27
integer y = 20
integer width = 1166
end type

type lb_movetofolder from w_faxcomponent`lb_movetofolder within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type gb_3 from w_faxcomponent`gb_3 within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type gb_1 from w_faxcomponent`gb_1 within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type st_1 from w_faxcomponent`st_1 within w_faxcomponent_singlefaxviewer
boolean visible = false
integer x = 64
integer y = 1716
end type

type sle_newname from w_faxcomponent`sle_newname within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type st_7 from w_faxcomponent`st_7 within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type sle_email from w_faxcomponent`sle_email within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type cb_email from w_faxcomponent`cb_email within w_faxcomponent_singlefaxviewer
boolean visible = false
end type

type gb_2 from w_faxcomponent`gb_2 within w_faxcomponent_singlefaxviewer
boolean visible = false
integer x = 32
integer y = 1656
integer width = 2368
integer height = 156
end type

type htb_zoom from w_faxcomponent`htb_zoom within w_faxcomponent_singlefaxviewer
integer x = 1943
end type

