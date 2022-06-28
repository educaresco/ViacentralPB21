$PBExportHeader$w_financial_chain.srw
forward
global type w_financial_chain from window
end type
type dw_2 from datawindow within w_financial_chain
end type
type dw_1 from datawindow within w_financial_chain
end type
type cb_close from commandbutton within w_financial_chain
end type
type cb_aplicar from commandbutton within w_financial_chain
end type
type gb_1 from groupbox within w_financial_chain
end type
type gb_2 from groupbox within w_financial_chain
end type
end forward

global type w_financial_chain from window
integer x = 951
integer y = 524
integer width = 3918
integer height = 1688
boolean titlebar = true
string title = "Chain Commission "
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_2 dw_2
dw_1 dw_1
cb_close cb_close
cb_aplicar cb_aplicar
gb_1 gb_1
gb_2 gb_2
end type
global w_financial_chain w_financial_chain

type variables
string	 is_main_branch, is_id_chain
datawindowchild idwc_group
end variables

on w_financial_chain.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_close=create cb_close
this.cb_aplicar=create cb_aplicar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_2,&
this.dw_1,&
this.cb_close,&
this.cb_aplicar,&
this.gb_1,&
this.gb_2}
end on

on w_financial_chain.destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_close)
destroy(this.cb_aplicar)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;is_main_branch =  message.stringparm
dw_1.getchild('id_main_branch_payment_1', idwc_group)
idwc_group.settransobject( SQLCA)


select top 1 id_chain
into : is_id_chain
from dba.branch where id_main_branch = :is_main_branch;


if idwc_group.retrieve(is_id_chain) = 0 then idwc_group.insertrow( 0 )


dw_1.retrieve( is_main_branch )
dw_2.retrieve( is_id_chain)

if fn_check_user_role('GFO') <= 0 then

	dw_1.object.fin_monthlyclosing.protect = 1
	dw_1.object.fin_achacctypeid_com.protect = 1
	dw_1.object.flag_com_chain.protect = 1
	dw_1.object.fin_closingdaycode.protect = 1
	dw_1.object.fin_commissionmethod.protect = 1
	dw_1.object.fin_achacctypeid_com.protect = 1
	dw_1.object.fin_achaccrouting_com.protect = 1
	dw_1.object.fin_achaccnumber_com.protect = 1
	dw_1.object.id_main_branch_payment_1.protect = 1
	dw_1.object.id_main_branch_payment.protect = 1
	

	
end if		
		
end event

event close;closewithreturn(this,-9999)
end event

type dw_2 from datawindow within w_financial_chain
integer x = 59
integer y = 828
integer width = 2107
integer height = 668
integer taborder = 20
string dataobject = "dw_group_branch_financial_chain"
boolean vscrollbar = true
end type

event constructor;call super::constructor;this.settransobject( SQLCA)
end event

type dw_1 from datawindow within w_financial_chain
integer x = 69
integer y = 56
integer width = 3305
integer height = 640
integer taborder = 10
string dataobject = "dw_chain"
boolean border = false
end type

event constructor;this.settransobject( SQLCA)


end event

event retrieveend;
if rowcount() > 0 and fn_check_user_role('QFO') > 0  then
	dw_1.setitem( 1,  'flag_com_chain', '1' )
end if
end event

event itemchanged;/* GBB.FIN_MONTHLYCLOSING,	
		 GBB.FIN_CLOSINGDAYCODE,
		 GBB.FIN_ACHACCTYPEID_COM,
		GBB.FIN_ACHACCROUTING_COM ,
		GBB.FIN_ACHACCNUMBER_COM ,
		GBB.FIN_COMMISSIONMETHOD
		*/
		 
integer li_row
string ls_column

ls_column = dwo.name

if ls_column = 'FIN_MONTHLYCLOSING'  or ls_column = 'FIN_CLOSINGDAYCODE' or ls_column = 'FIN_ACHACCTYPEID_COM'  or ls_column ='FIN_ACHACCROUTING_COM' or ls_column = 'FIN_ACHACCNUMBER_COM' or ls_column = 'FIN_COMMISSIONMETHOD'  or ls_column  = 'flag_com_chain' then 
	
	for li_row = 1 to dw_2.rowcount( )
		
		dw_2.setitem( li_row, ls_column, dw_1.getitemstring(row, ls_column) )
		
	next
	
end if


if dwo.name = "fin_monthlyclosing" then
	  dw_1.setitem(dw_1.getrow(),"fin_closingdaycode",'01')
end if 	

if dwo.name = 'fin_achaccrouting' or dwo.name = 'fin_achaccrouting_com' then

	string ls_routing
	long ll_cont
	
	ls_routing = trim(GetText())
	
	if ls_routing <> '' then
	
		if len(ls_routing) <> 9 then
			Messagebox("Dato invalido","El numero de Routing (ABA) es invalido, debe ser un numero de 9 caracteres.",StopSign!)
			return 1		
		end if
	
		SELECT count(*)
		  INTO :ll_cont
		  FROM dba.BANK_ROUTINGS
		 WHERE BANK_ROUTING = :ls_routing;
		 
		if ll_cont <> 1 then
			 Messagebox("Dato invalido","El numero de Routing (ABA) es invalido, no fue encontrado en la lista de Routings de la reserva (https://www.fededirectory.frb.org/search.cfm).",StopSign!)
			return 1				 
		end if
		//0  (Default) Accept the data value
		//1  Reject the data value and do not allow focus to change
		//2  Reject the data value but allow the focus to change

	end if

end if

end event

event itemerror;return 1
end event

type cb_close from commandbutton within w_financial_chain
integer x = 3470
integer y = 156
integer width = 393
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
boolean cancel = true
end type

event clicked;closewithreturn(parent,-9999)
end event

type cb_aplicar from commandbutton within w_financial_chain
integer x = 3470
integer y = 60
integer width = 393
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Apply"
boolean cancel = true
boolean default = true
end type

event clicked;double ld_number
string ls_message
boolean lb_show = false
integer li_row




dw_1.accepttext( )

string ls_routing , ls_account
dwItemStatus l_status, l_status_acc

l_status = dw_1.GetItemStatus( dw_1.GetRow(), "fin_achaccrouting_com", Primary!)
l_status_acc = dw_1.GetItemStatus( dw_1.GetRow(), "fin_achaccnumber_com", Primary!)


if l_status = DataModified! or l_status_acc = DataModified! then 
	

	ls_routing = dw_1.getitemstring(dw_1.GetRow(), 'fin_achaccrouting_com')
	ls_account = dw_1.getitemstring(dw_1.GetRow(), 'fin_achaccnumber_com')
	
	
	if messagebox('Confirmation', 'The information of Commission Account  ~r~n( ROUTING #: ' +  ls_routing  + '  and  ACCOUNT # : '+ ls_Account +  ' )  its correct?', question!, yesno!,2) = 2 then 
		return -1
	end if
	
end if



	for li_row = 1 to dw_2.rowcount( )
		
		dw_2.setitem( li_row, 'FIN_MONTHLYCLOSING', dw_1.getitemstring(1, 'FIN_MONTHLYCLOSING') )
		dw_2.setitem( li_row,  'FIN_CLOSINGDAYCODE' , dw_1.getitemstring(1, 'FIN_CLOSINGDAYCODE') )
		dw_2.setitem( li_row,  'FIN_ACHACCTYPEID_COM' , dw_1.getitemstring(1, 'FIN_ACHACCTYPEID_COM') )
		dw_2.setitem( li_row, 'FIN_ACHACCROUTING_COM', dw_1.getitemstring(1, 'FIN_ACHACCROUTING_COM') )
		dw_2.setitem( li_row,  'FIN_ACHACCNUMBER_COM', dw_1.getitemstring(1, 'FIN_ACHACCNUMBER_COM') )
		dw_2.setitem( li_row,  'FIN_COMMISSIONMETHOD', dw_1.getitemstring(1, 'FIN_COMMISSIONMETHOD') )
		dw_2.setitem( li_row,  'flag_com_chain', dw_1.getitemstring(1, 'flag_com_chain') )
		
	next
	
dw_2.accepttext( )
dw_1.accepttext( )
dw_1.update( )
dw_2.update( )
commit;

closewithreturn(parent,1)
end event

type gb_1 from groupbox within w_financial_chain
integer x = 32
integer y = 756
integer width = 2176
integer height = 800
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Group Branch~'s"
end type

type gb_2 from groupbox within w_financial_chain
integer x = 27
integer y = 4
integer width = 3392
integer height = 748
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Chain"
end type

