$PBExportHeader$w_cambiar_limitecredito.srw
forward
global type w_cambiar_limitecredito from window
end type
type cb_cancelar from commandbutton within w_cambiar_limitecredito
end type
type cb_actualizar from commandbutton within w_cambiar_limitecredito
end type
type dw_limitecredito from datawindow within w_cambiar_limitecredito
end type
end forward

global type w_cambiar_limitecredito from window
integer width = 2377
integer height = 748
boolean titlebar = true
string title = "Modificar limite de crédito"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancelar cb_cancelar
cb_actualizar cb_actualizar
dw_limitecredito dw_limitecredito
end type
global w_cambiar_limitecredito w_cambiar_limitecredito

on w_cambiar_limitecredito.create
this.cb_cancelar=create cb_cancelar
this.cb_actualizar=create cb_actualizar
this.dw_limitecredito=create dw_limitecredito
this.Control[]={this.cb_cancelar,&
this.cb_actualizar,&
this.dw_limitecredito}
end on

on w_cambiar_limitecredito.destroy
destroy(this.cb_cancelar)
destroy(this.cb_actualizar)
destroy(this.dw_limitecredito)
end on

event open;dw_limitecredito.settransobject(SQLCA)
dw_limitecredito.retrieve()
end event

type cb_cancelar from commandbutton within w_cambiar_limitecredito
integer x = 1120
integer y = 496
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancelar"
boolean cancel = true
end type

event clicked;CLOSE(w_cambiar_limitecredito)

end event

type cb_actualizar from commandbutton within w_cambiar_limitecredito
integer x = 741
integer y = 496
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Actualizar"
end type

event clicked;//Permite actualizar la tabla dba.GROUP_BRANCH
long 		ll_filas,ll_fila
String	ls_branch,ls_modificaSemana,ls_modificaFinSemana
double 	ld_valorSemana, ld_valorFinsemana

ll_filas = dw_limitecredito.rowcount()

FOR ll_fila = 1 TO ll_filas
	ls_branch 				= TRIM(dw_limitecredito.object.id_branck[ll_fila])
	ls_modificaSemana		= dw_limitecredito.object.modificarsemana[ll_fila]
	ls_modificaFinSemana	= dw_limitecredito.object.modificarfinsemana[ll_fila]
	ld_valorSemana			= dw_limitecredito.object.maxproduccionsemana[ll_fila]
	ld_valorFinsemana		= dw_limitecredito.object.maxproduccionfinsemana[ll_fila]
	
	/*Se modifica el valor del crédito semanal, por el sugerido*/
	IF ls_modificaSemana ='S' THEN
		IF NOT ISNULL(ld_valorSemana)THEN
			UPDATE dba.GROUP_BRANCH SET DEBT_LIMIT =:ld_valorSemana
			FROM dba.GROUP_BRANCH,dba.BRANCH
			WHERE dba.BRANCH.ID_MAIN_BRANCH = dba.GROUP_BRANCH.ID_MAIN_BRANCH AND
			dba.BRANCH.ID_BRANCH = :ls_branch
			USING SQLCA;
		END IF
		
	END IF
	
	/*Se modifica el valor del crédito del fin de semana, por el sugerido*/
	/*IF ls_modificaSemana ='S' THEN
		IF NOT ISNULL(ld_valorSemana)THEN
			UPDATE dba.GROUP_BRANCH SET DEBT_LIMIT =:ld_valorSemana
			FROM dba.GROUP_BRANCH,dba.BRANCH
			WHERE dba.BRANCH.ID_MAIN_BRANCH = dba.GROUP_BRANCH.ID_MAIN_BRANCH AND
			dba.BRANCH.ID_BRANCH = :ls_branch
			USING SQLCA;
		END IF
	END IF
	*/

NEXT

IF (SQLCA.sqldbcode = 1)THEN
		MessageBox("Información","El registro se actualizo con exito")
END IF
	
IF (SQLCA.sqldbcode = -1)THEN
		MessageBox("Información","Ocurrio un error actualizando la información"+SQLCA.SQLErrText)
END IF


end event

type dw_limitecredito from datawindow within w_cambiar_limitecredito
integer x = 82
integer y = 72
integer width = 2185
integer height = 376
integer taborder = 10
string title = "none"
string dataobject = "dw_limitecredito"
boolean vscrollbar = true
boolean border = false
end type

