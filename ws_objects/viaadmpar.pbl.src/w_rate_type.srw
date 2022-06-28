$PBExportHeader$w_rate_type.srw
forward
global type w_rate_type from wb_single_tb
end type
type cbx_base from checkbox within w_rate_type
end type
type lst_country from my_ddlb within w_rate_type
end type
type st_3 from statictext within w_rate_type
end type
type cb_1 from commandbutton within w_rate_type
end type
type cbx_manual from checkbox within w_rate_type
end type
type cb_fixrates from commandbutton within w_rate_type
end type
type p_1 from picture within w_rate_type
end type
type gb_1 from groupbox within w_rate_type
end type
end forward

global type w_rate_type from wb_single_tb
integer width = 4073
integer height = 1688
cbx_base cbx_base
lst_country lst_country
st_3 st_3
cb_1 cb_1
cbx_manual cbx_manual
cb_fixrates cb_fixrates
p_1 p_1
gb_1 gb_1
end type
global w_rate_type w_rate_type

forward prototypes
public function decimal fn_calc_from_base_rate (integer base_id_rate_type, decimal increment)
end prototypes

public function decimal fn_calc_from_base_rate (integer base_id_rate_type, decimal increment);decimal ld_rate_calc

select rate+:increment
into :ld_rate_calc
from dba.rate_type
where id_rate_type = :base_id_rate_type;

return ld_rate_calc
end function

on w_rate_type.create
int iCurrent
call super::create
this.cbx_base=create cbx_base
this.lst_country=create lst_country
this.st_3=create st_3
this.cb_1=create cb_1
this.cbx_manual=create cbx_manual
this.cb_fixrates=create cb_fixrates
this.p_1=create p_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_base
this.Control[iCurrent+2]=this.lst_country
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cbx_manual
this.Control[iCurrent+6]=this.cb_fixrates
this.Control[iCurrent+7]=this.p_1
this.Control[iCurrent+8]=this.gb_1
end on

on w_rate_type.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_base)
destroy(this.lst_country)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.cbx_manual)
destroy(this.cb_fixrates)
destroy(this.p_1)
destroy(this.gb_1)
end on

event open;call super::open;


// check if the user has the role RED PHONE TRANSMISION DOWNGRADE
if fn_check_user_role('RBA') <= 0 then
	cbx_manual.checked = true
	cbx_manual.enabled = false
	cbx_base.enabled = false
	cb_fixrates.enabled = false
	dw_1.object.rate_calc.protect = 1
	
else
	cbx_manual.checked = false
end if		
		
end event

type dw_1 from wb_single_tb`dw_1 within w_rate_type
integer y = 192
integer width = 4009
integer height = 1300
integer taborder = 40
string dataobject = "dw_rate_type"
end type

event dw_1::itemchanged;call super::itemchanged;
Double ld_rate, ld_rate_allowance, ld_calculated_rate, ld_id_rate_type, ld_rate_allowance_up, ld_rate_allowance_down, ld_rate_null
Long ll_cont



if dwo.name = 'rate' then

	ld_rate = dw_1.getitemnumber(row,"rate")	
	if (ld_rate >0) then
			SELECT min(RATE_ALLOWANCE)
			INTO :ld_rate_allowance
			FROM dba.ACC_PARAMETERS;
			
			// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
			if abs( ( (double(data)) / ld_rate) -1 ) > ld_rate_allowance then
				Messagebox("Valor Errado","El nuevo valor ("+data+") es muy alto/bajo con respecto a la tasa ("+string(ld_rate)+"). Revise la incremento. (±"+String(ld_rate_allowance * 100)+"%)",StopSign!)
				//SetFocus(em_rate)
				return 2
			end if		
	end if


elseif dwo.name = 'rate_calc' then
	
	if data = 'B' then
	
		ll_cont = 0
		ld_id_rate_type = dw_1.getitemnumber(row,"id_rate_type")
	
		select :ll_cont + count(*)
		into :ll_cont
		from dba.RATE_GROUP_AGENT with (nolock)
		where ID_RATE_TYPE = :ld_id_rate_type;
		
		select :ll_cont + count(*)
		into :ll_cont
		from dba.RATE_GROUP_STATE with (nolock)
		where ID_RATE_TYPE = :ld_id_rate_type;
		
		select :ll_cont + count(*)
		into :ll_cont
		from dba.RATE_GROUP_STATE_DELIVERY with (nolock)
		where ID_RATE_TYPE = :ld_id_rate_type;
	
		if ll_cont > 1 then
			Messagebox("Tasa Asignada","Esta tasa ya esta siendo usada por "+ String(ll_cont) +" registros, por lo tanto no puede ser clasificada como una tasa base.",StopSign!)
			return 2
		end if
		
	elseif data = 'C' then
		dw_1.setitem(row,"calculated_spread",0)	
	elseif data = 'M' then
		SetNull(ld_rate_null)
		dw_1.setitem(row,"calculated_spread",0)
		dw_1.setitem(row,"calculated_from_id_rate_type",ld_rate_null)	
	end if
	
	
	

elseif dwo.name = 'calculated_from_id_rate_type' then

	ld_id_rate_type = dw_1.getitemnumber(row,"id_rate_type")
	
	if Double(data) = ld_id_rate_type then
		Messagebox("Tasa Errada","No se puede usar la misma tasa como tasa base.",StopSign!)
		return 2
	else
		ld_calculated_rate = fn_calc_from_base_rate (Integer(data),dw_1.getitemdecimal(row,"calculated_spread"))
		dw_1.setitem(row,"rate", ld_calculated_rate)
	end if
	
elseif dwo.name = 'calculated_spread' then
	
	ld_rate = dw_1.getitemnumber(row,"rate")	
	
	SELECT min(numericvalue)
	INTO :ld_rate_allowance_up
	FROM dba.PARAMETERS
	WHERE idparameter = 'RATE_SPR_ALLOW_UP';
	
	SELECT min(numericvalue)
	INTO :ld_rate_allowance_down
	FROM dba.PARAMETERS
	WHERE idparameter = 'RATE_SPR_ALLOW_DOWN';
	
			
	// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
	if (double(data) > 0) and abs( ( (double(data)) / ld_rate)  ) > ld_rate_allowance_up then
		Messagebox("Valor Errado","El nuevo spread ("+data+") es muy alto con respecto a la tasa ("+string(ld_rate)+"). Revise la spread. (±"+String(ld_rate_allowance_up * 100)+"%)",StopSign!)
		//SetFocus(em_rate)
		return 2
	end if		

	// Si el porcentaje de variacion (avg las 30 days) es mayor o menor del porcentaje en la tabla de parametros!
	if (double(data) < 0 ) and abs( ( (double(data)) / ld_rate) ) > ld_rate_allowance_down then
		Messagebox("Valor Errado","El nuevo spread ("+data+") es muy bajo con respecto a la tasa ("+string(ld_rate)+"). Revise la spread. (±"+String(ld_rate_allowance_down * 100)+"%)",StopSign!)
		//SetFocus(em_rate)
		return 2
	end if		
	
	
	ld_calculated_rate = fn_calc_from_base_rate (dw_1.getitemnumber(row,"calculated_from_id_rate_type"), Double(data))
	dw_1.setitem(row,"rate",ld_calculated_rate)

end if

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;
if dw_1.getItemString(currentrow, "id_currency") <> '' then
	DataWindowChild ldw_dw
	
	dw_1.GetChild("calculated_from_id_rate_type",ldw_dw)
	ldw_dw.SetTransObject(SQLCA)
	ldw_dw.Retrieve()
	ldw_dw.SetFilter("id_currency = '"+dw_1.getItemString(currentrow, "id_currency")+"'")
	ldw_dw.Filter()
	
end if

end event

event dw_1::constructor;SetTransObject(SQLCA)
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Event:
//////	constructor
//////
//////	Description:
//////	Start the resize service and register the controls.
////// Tab page three will be created on demand.  If the user resizes
////// the window before the tab page is created then the resize event
////// must be triggered.
//////
//////////////////////////////////////////////////////////////////////////////////
//////	
//////	Revision History
//////
//////	Version
//////	6.0   Initial version
//////
//////////////////////////////////////////////////////////////////////////////////
//////
//////	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//////	Any distribution of the PowerBuilder Foundation Classes (PFC)
//////	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////
//////////////////////////////////////////////////////////////////////////////////
////
////// Start the Resize Service.
//
datawindow	ddlb_filetypes

//DON (04/02/2015) - To suppress Retrieve.  ***********************
IF gb_prevent_rate_retrieve	THEN
	gb_prevent_rate_retrieve	=	FALSE
//ELSE
//	this.retrieve("","")
END IF
//******************************************************

of_setfilter(true)
of_setsort(true)
of_SetResize(true)
of_setprintpreview(true)
of_SetFind(true)
inv_resize.of_SetOrigSize(1532, 537)
//
////Set the MinSize of the main object.
inv_resize.of_SetMinSize(1185, 509)
//
////Set the behavior of each object.
//inv_resize.of_Register(ddlb_filetypes, inv_resize.SCALERIGHTBOTTOM)
//inv_resize.of_Register(sle_text, inv_resize.SCALERIGHT)
//
//ddlb_filetypes.SelectItem(2)
//
////Trigger the resize event to be sure that the tab is sized appropriately.
event resize(1, this.width, this.height)
//






end event

type cbx_base from checkbox within w_rate_type
integer x = 1211
integer y = 72
integer width = 485
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cost Rates Only"
end type

event clicked;if cbx_manual.checked then
	cbx_manual.checked = false
end if
end event

type lst_country from my_ddlb within w_rate_type
integer x = 306
integer y = 72
integer width = 864
integer height = 1448
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

event constructor;call super::constructor;this.addquery("SELECT NAME_COUNTRY,ID_COUNTRY FROM dba.COUNTRY WHERE FLAG_COUNTRY = 'A' UNION select '[SELECT ONE]', '--' order by 1;")
end event

type st_3 from statictext within w_rate_type
integer x = 87
integer y = 80
integer width = 219
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Country:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_rate_type
integer x = 2286
integer y = 60
integer width = 343
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Refresh"
end type

event clicked;String ls_filteronly

if cbx_base.checked then
	ls_filteronly = 'B'
elseif cbx_manual.checked then
	ls_filteronly = 'M'
else
	ls_filteronly = ''
end if

dw_1.retrieve(ls_filteronly, lst_country.getdataid())
end event

type cbx_manual from checkbox within w_rate_type
integer x = 1719
integer y = 72
integer width = 485
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Manual Rates Only"
boolean checked = true
end type

event clicked;if cbx_base.checked then
	cbx_base.checked = false
end if
end event

type cb_fixrates from commandbutton within w_rate_type
integer x = 3250
integer y = 24
integer width = 754
integer height = 148
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fix Calculated Rates"
end type

event clicked;//double ld_max, ld_min, ld_dif
long ll_cont, i

SetPointer(HourGlass!)
dw_1.SetRedraw (false)

// (solo lo hace para las que no tienen un tipo de tasa RATE_TYPE)
	
if dw_1.rowcount() < 1 then
	return
end if

ll_cont = 0

FOR i = 1 TO dw_1.rowcount()
	if dw_1.Object.data[i,6] = 'C' then
		if dw_1.Object.data[i,5] <> dw_1.Object.data[i,9] then
			dw_1.Object.data[i,5] = dw_1.Object.data[i,9]
			ll_cont++		
		end if
	end if
	
NEXT

Messagebox("Confirmación", string(ll_cont)+" Tasas corregidas, Debe grabar para aplicar los cambios.");

dw_1.SetRedraw (true)
SetPointer(arrow!)
end event

type p_1 from picture within w_rate_type
integer x = 3301
integer y = 68
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "NestedReturn!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type gb_1 from groupbox within w_rate_type
integer x = 14
integer y = 16
integer width = 2693
integer height = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

