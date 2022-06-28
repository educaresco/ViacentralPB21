$PBExportHeader$w_kyc2.srw
forward
global type w_kyc2 from pfc_w_response
end type
type cb_send_sender_folder from commandbutton within w_kyc2
end type
type cb_print from commandbutton within w_kyc2
end type
type dw_kyc_data from datawindow within w_kyc2
end type
type lb_1 from listbox within w_kyc2
end type
type ole_kyc from olecustomcontrol within w_kyc2
end type
end forward

global type w_kyc2 from pfc_w_response
integer width = 3886
integer height = 2668
string title = "KYC Form"
boolean center = true
cb_send_sender_folder cb_send_sender_folder
cb_print cb_print
dw_kyc_data dw_kyc_data
lb_1 lb_1
ole_kyc ole_kyc
end type
global w_kyc2 w_kyc2

type variables
String is_kycfilepath, is_kycfile, is_id_branch, is_faxparms = "", is_temp_path
Double id_id_receiver

end variables

forward prototypes
public subroutine fn_fillform ()
end prototypes

public subroutine fn_fillform ();
ole_kyc.object.TextFontSize = 12

// TextFontStyle
//0 - regular
//1 - bold 
//2 - italic
//3 - bolditalic
//4 - underline
ole_kyc.object.TextFontStyle = 1



if not fileexists(is_kycfilepath) then
// message displayed on open!
//	if fn_getlang() = 'EN' then
//		Messagebox("Error Missing " +is_kycfile,"Missing KYC TIFF file, please conduct a trasmission and try again. If you see the error again please contact customer support.",StopSign!)
//	else
//		Messagebox("Error Archivo" + is_kycfile,"No se ha encontrado el archivo TIFF del KYC, por favor haga una transmisión e intente de nuevo. Si el problema persiste por favor contacte a soporte técnico.",StopSign!)
//	end if
	return
end if


String ls_name_cashier

SELECT rtrim(add_cashier)
into :ls_name_cashier
FROM dba.cashier
WHERE id_cashier = :gs_cashier;

ls_name_cashier = ls_name_cashier + " (VIAMERICAS)"
//+ " (" + trim(gs_cashier) +")"

String ls_fieldname, ls_dw, ls_dwcolumn, ls_value
Double ld_x, ld_y

DECLARE cur_formfields CURSOR FOR  
SELECT FIELDNAME, DW, DW_COLUMN, X_POS, Y_POS
FROM dba.FORM_MAPPING  
WHERE FORMNAME = :is_kycfile;

open cur_formfields;

FETCH cur_formfields INTO :ls_fieldname, :ls_dw, :ls_dwcolumn, :ld_x, :ld_y;

DO WHILE SQLCA.SQLCODE = 0
	
	ls_value = ""
	ole_kyc.object.TextColor = RGB(0,0,80)
	
	if ls_dw = "dw_kyc_data" then
		
		ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),ls_dwcolumn)
	
//	elseif ls_dw = "w_pfc_sender.dw_2" then
//		
//		ls_value = w_pfc_sender.dw_2.getitemstring(w_pfc_sender.dw_2.getrow(),ls_dwcolumn)
//		
	elseif ls_dw = "variable" then
		
		if ls_dwcolumn = "cashier_name" then
			ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),'branch_name_cashier' )
			
			if isnull(ls_value) or ls_value = '' then
				ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),'branch_cashier' )
			end if

		end if
	
		if ls_dwcolumn = "agent_signature" then
			ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),'branch_name_cashier' )
			
			if isnull(ls_value) or ls_value = '' then
				ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),'branch_cashier' )
			end if
			
		end if
	
		if ls_dwcolumn = "sender_signature" then
			ls_value = dw_kyc_data.getitemstring(dw_kyc_data.getrow(),'name_sender' )
		end if
	
	elseif ls_dw = "static" then
		
		ole_kyc.object.TextColor = RGB(100,0,0)
		
		if ls_fieldname = 'legend1' then
			ls_value = '- KYC COMPLETED USING VIACASH -'
		else
			ls_value = ls_dwcolumn;
		end if
	
	end if
	
	if ls_value <> "" then
		ole_kyc.object.DrawText(ld_x,ld_y,ls_value,true)
	end if
	
				
	FETCH cur_formfields INTO :ls_fieldname, :ls_dw, :ls_dwcolumn, :ld_x, :ld_y;
LOOP;

close cur_formfields;



end subroutine

on w_kyc2.create
int iCurrent
call super::create
this.cb_send_sender_folder=create cb_send_sender_folder
this.cb_print=create cb_print
this.dw_kyc_data=create dw_kyc_data
this.lb_1=create lb_1
this.ole_kyc=create ole_kyc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_send_sender_folder
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.dw_kyc_data
this.Control[iCurrent+4]=this.lb_1
this.Control[iCurrent+5]=this.ole_kyc
end on

on w_kyc2.destroy
call super::destroy
destroy(this.cb_send_sender_folder)
destroy(this.cb_print)
destroy(this.dw_kyc_data)
destroy(this.lb_1)
destroy(this.ole_kyc)
end on

event open;call super::open;

is_id_branch = fn_token(Message.StringParm,'*',1)
id_id_receiver = double(fn_token(Message.StringParm,'*',2))
is_faxparms = fn_getbranchfaxcommand(is_id_branch,"KYC - "+is_id_branch+"-"+String(id_id_receiver))

dw_kyc_data.retrieve(is_id_branch,id_id_receiver)

SELECT stringvalue
INTO :is_kycfile
FROM dba.PARAMETERS
WHERE idparameter = 'KYC_VERSION'; 

is_kycfilepath = "C:\ViamericasMT\Forms\"+is_kycfile+"exp.tif"

if not fileexists(is_kycfilepath) then
	if fn_getlang() = 'EN' then
		Messagebox("Error Missing " +is_kycfile,"Missing KYC TIFF file, please conduct a trasmission and try again. If you see the error again please contact customer support.",StopSign!)
	else
		Messagebox("Error Archivo" + is_kycfile,"No se ha encontrado el archivo TIFF del KYC, por favor haga una transmisión e intente de nuevo. Si el problema persiste por favor contacte a soporte técnico.",StopSign!)
	end if
	close(this)
	return
	
end if

if fn_getlang() = 'EN' then
	this.title = "KYC Form ("+is_kycfile+")"
else
	this.title = "Forma KYC ("+is_kycfile+")"
end if

String ls_imageviewerlicense

ls_imageviewerlicense = fn_busparameter("IVP_LICENSE")

//ole_kyc.object.LicenseKey = ls_imageviewerlicense

//ole_kyc.object.LicenseKey ="10580" 

//ole_kyc.object.LicenseKey ="14735" 

ole_kyc.object.LoadMultiPage(is_kycfilepath,1)

fn_fillform()

is_temp_path = "U:\Temp\KYC_" + is_id_branch + "_" + string(id_id_receiver)+"_"+string(today(),"mmddyyyyhhmmss")

ole_kyc.object.Save(is_temp_path, "pdf")
ole_kyc.object.LoadMultiPage(is_temp_path + ".pdf",1)

end event

type cb_send_sender_folder from commandbutton within w_kyc2
integer x = 3191
integer y = 16
integer width = 654
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Save Sender Folder"
end type

event clicked;Double ld_sender
Long ll_cont
String ls_selected, ls_branch, ls_invoice, ls_global_sender, ls_path, ls_rejection, ls_ext
String ls_faxpath, ls_newfaxfolder, ls_newfaxname, ls_processed

ls_branch = is_id_branch
ls_invoice = string(id_id_receiver)

ls_faxpath = is_temp_path + ".pdf"

SELECT convert(varchar,id_sender_global), dba.sender.id_sender
INTO :ls_global_sender, :ld_sender
FROM dba.receiver, dba.sender
WHERE dba.receiver.ID_BRANCH = dba.sender.ID_BRANCH
AND dba.receiver.id_sender = dba.sender.id_sender
AND dba.receiver.id_branch = :ls_branch
AND dba.receiver.id_receiver = :ls_invoice;
	
if isnull(ls_global_sender) or ls_global_sender = '0' or ls_global_sender = '' then		
	Messagebox("Error","Error obteniendo ViaSender, por favor intente de nuevo o contacte a tecnologia",Stopsign!)
	return		
end if
		
ls_global_sender = trim(ls_global_sender)

ls_path = "U:\Compliance\Processed\Senders\" + ls_global_sender	

if not fileexists(ls_path) then CreateDirectory ( ls_path )			

ls_newfaxfolder = ls_path+"\"

ls_ext = ".pdf"

ls_newfaxname = mid(ls_faxpath,len('U:\Temp\')+1,len(ls_faxpath))
		
if FileExists(ls_faxpath) then					
	insert into DBA.AUDIT_FAX_CATALOG(DATE_AUDIT,ID_BRANCH,ID_RECEIVER,FAXTIME,FAX_OLDNAME,FAX_NEWNAME,FAX_CATEGORY,DB_USER_NAME,DB_HOST_NAME)
	values(getdate(),:ls_branch,:ls_invoice,getdate(),:ls_faxpath,:ls_newfaxfolder+:ls_newfaxname,'CO',UPPER(SYSTEM_USER),UPPER(HOST_NAME()));			

	ls_newfaxname = ls_newfaxfolder+ls_newfaxname
	
	IF fn_filecopy(ls_faxpath, ls_newfaxname) = 0 THEN
		if fn_getlang() = 'EN' then
			Messagebox("Information","File was saved succesfully at sender's folder.")
		else
			Messagebox("Información","Se ha guardado el archivo en la carpeta del sender.")
		end if
	ELSE
		if fn_getlang() = 'EN' then
			Messagebox("Error","An error has ocurred, please try again or contact IT support.",StopSign!)
		else
			Messagebox("Error","Ha ocurrido un error inesperado, intente de nuevo o comuniquese con el area de tecnología.",StopSign!)
		end if
	END IF
end if
end event

type cb_print from commandbutton within w_kyc2
integer x = 2153
integer y = 16
integer width = 1010
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Enviar Email"
end type

event clicked;
ole_kyc.object.PrintSetDocumentName="KYC"
ole_kyc.object.PrintSetQuality=0
ole_kyc.object.PrintImage2Printer("ActiveFax")
//ole_kyc.object.PrintImage2Printer("PDF995")

close(parent)

end event

event constructor;if fn_getlang() = 'EN' then this.text = "&Send Email"
end event

type dw_kyc_data from datawindow within w_kyc2
boolean visible = false
integer x = 306
integer y = 396
integer width = 2834
integer height = 1696
integer taborder = 30
string dataobject = "dw_kyc_data"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type lb_1 from listbox within w_kyc2
boolean visible = false
integer x = 242
integer y = 600
integer width = 1381
integer height = 840
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
boolean sorted = false
end type

type ole_kyc from olecustomcontrol within w_kyc2
event click ( )
event dblclick ( )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event keydown ( integer keycode,  integer shift )
event keyup ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event selectionrectdrawn ( long ileft,  long itop,  long iwidth,  long iheight )
event ocrrecognized ( boolean bsuccess )
integer x = 5
integer y = 128
integer width = 3845
integer height = 2444
integer taborder = 20
boolean border = false
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_kyc2.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
06w_kyc2.bin 
2E00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000009a09135001d6bdb300000003000001800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000002c0000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000000d400000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004e589da784fc5ad4c479eb9b69e6710b1000000009a09135001d6bdb39a09135001d6bdb3000000000000000000000000fffffffe000000020000000300000004fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
29ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0065004400650076006f006c00650070002000720069006c006500630073006e003a0065003600350033003700000000000000000000000000000000000000000000fffe00020206e589da784fc5ad4c479eb9b69e6710b100000001fb8f0821101b01640008ed8413c72e2b00000030000000a40000000500000100000000300000010100000038000001020000004000000103000000480000000000000050000000030001000000000003000056eb0000000300003f2600000003000000000000000500000000000000010001030000000c0074735f00706b636f73706f72000101000000090078655f00746e65740102007800090000655f00006e65747800007974090000015f00000073726576006e6f69000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000056eb00003f2600000000000001010000000000000000000000006564040000646f6d0000000000000000000001006000600050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000050000003e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16w_kyc2.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
