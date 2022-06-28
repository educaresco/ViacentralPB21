$PBExportHeader$w_agency_address_verification.srw
forward
global type w_agency_address_verification from w2_master_report_dates
end type
type st_1 from statictext within w_agency_address_verification
end type
end forward

global type w_agency_address_verification from w2_master_report_dates
integer width = 4635
integer height = 1984
st_1 st_1
end type
global w_agency_address_verification w_agency_address_verification

on w_agency_address_verification.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on w_agency_address_verification.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
end on

type st_4 from w2_master_report_dates`st_4 within w_agency_address_verification
boolean visible = false
end type

type st_3 from w2_master_report_dates`st_3 within w_agency_address_verification
boolean visible = false
end type

type cb_query from w2_master_report_dates`cb_query within w_agency_address_verification
integer x = 1093
end type

event cb_query::clicked;
Setpointer(Hourglass!)

dw_1.retrieve()
dw_1.setfocus()


// Determina la direccion sugerida por yahoo!

integer li_i
string ls_suggestion, ls_branch


for li_i = 1 to dw_1.rowcount()

	ls_branch = dw_1.getitemstring(li_i,"id_branch")

	SetNull(ls_suggestion)

	SELECT suggestion
	INTO :ls_suggestion
	FROM dba.branch_address_suggestion
	WHERE id_branch = :ls_branch;

	if not isnull(ls_suggestion) then

		ls_suggestion= upper(ls_suggestion)
		//messagebox("",fn_xmlgettagproperty())
		
		// Si reconocio la direccion a nivel de calle
		if fn_xmlgettagproperty(ls_suggestion,"RESULT",1,"PRECISION") = 'ADDRESS' then
				
			dw_1.setitem(li_i,"sa",fn_xmlgettag(ls_suggestion,"ADDRESS",1))
			dw_1.setitem(li_i,"sc",fn_xmlgettag(ls_suggestion,"CITY",1))
			dw_1.setitem(li_i,"ss",fn_xmlgettag(ls_suggestion,"STATE",1))
			dw_1.setitem(li_i,"sz",fn_xmlgettag(ls_suggestion,"ZIP",1))

			if trim(fn_xmlgettagproperty(ls_suggestion,"RESULT",1,"WARNING")) = '' then
				dw_1.setitem(li_i,"st","EXACT")
			else
				dw_1.setitem(li_i,"st","SIMILAR")
			end if



		end if

	end if
	  
next 
	  
Setpointer(Arrow!)	  
end event

type pb_date1 from w2_master_report_dates`pb_date1 within w_agency_address_verification
boolean visible = false
end type

type em_date1 from w2_master_report_dates`em_date1 within w_agency_address_verification
boolean visible = false
end type

type pb_date2 from w2_master_report_dates`pb_date2 within w_agency_address_verification
boolean visible = false
end type

type em_date2 from w2_master_report_dates`em_date2 within w_agency_address_verification
boolean visible = false
end type

type dw_1 from w2_master_report_dates`dw_1 within w_agency_address_verification
integer width = 4553
integer height = 1572
string dataobject = "dw_agency_address_verification"
end type

event dw_1::buttonclicked;call super::buttonclicked;



if dwo.name = 'b_use' then
	
	String ls_latitud, ls_longitud, ls_street, ls_suggestion, ls_zip, ls_zip4, ls_branch

	ls_branch = dw_1.getitemstring(row,"id_branch")

	SetNull(ls_suggestion)

	SELECT suggestion
	INTO :ls_suggestion
	FROM dba.branch_address_suggestion
	WHERE id_branch = :ls_branch;

	if not isnull(ls_suggestion) then

		ls_suggestion= upper(ls_suggestion)

			ls_latitud = fn_xmlgettag(ls_suggestion,"LATITUDE",1)
			ls_longitud = fn_xmlgettag(ls_suggestion,"LONGITUDE",1)
			ls_street = fn_xmlgettag(ls_suggestion,"ADDRESS",1)
			ls_zip = fn_xmlgettag(ls_suggestion,"ZIP",1)
			
			ls_zip4 = ''
			
			if len(ls_zip) = 10 then
				ls_zip4 = mid(ls_zip,7,4)
				ls_zip = mid(ls_zip,1,5)
			end if											
			
			ls_street = fn_replace(ls_street,",","")
			
			UPDATE DBA.BRANCH
			      SET ADDRESS_BRANCH = :ls_street,
				        ZIP_BRANCH = :ls_zip				
			  WHERE id_branch = :ls_branch;
			
			if len(ls_zip4) = 4 then
				UPDATE DBA.BRANCH
					SET ZIP4CODE_BRANCH = :ls_zip4	
				  WHERE id_branch = :ls_branch;			
			end if
			
			
			// update the GEO information
			UPDATE DBA.BRANCH
				 SET LATITUD = :ls_latitud,
					   LONGITUD	 = :ls_longitud,
					   GEO_GOOGLE = 1
			  WHERE id_branch = :ls_branch;				
			
			//messagebox("",ls_street+"~n"+ls_latitud+"~n"+ls_longitud+"~n"+ls_zip+"~n"+ls_zip4+"~n")			
			
		messagebox("Process Complete","Agency " + ls_branch+ " was updated sucessfull" )

	end if
		
	
end if
	
	
	
end event

type gb_1 from w2_master_report_dates`gb_1 within w_agency_address_verification
integer width = 1509
string text = ""
end type

type st_1 from statictext within w_agency_address_verification
integer x = 82
integer y = 76
integer width = 992
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Ver lista de Agencias sin direccion verificada"
boolean focusrectangle = false
end type

