$PBExportHeader$w_rep_branch_agent.srw
forward
global type w_rep_branch_agent from wb_report
end type
end forward

global type w_rep_branch_agent from wb_report
end type
global w_rep_branch_agent w_rep_branch_agent

on w_rep_branch_agent.create
call super::create
end on

on w_rep_branch_agent.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from wb_report`dw_1 within w_rep_branch_agent
string DataObject="dw_rep_branch_agent"
end type

