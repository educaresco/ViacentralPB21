$PBExportHeader$n_tr_bts_test.sru
forward
global type n_tr_bts_test from n_tr
end type
end forward

global type n_tr_bts_test from n_tr
end type
global n_tr_bts_test n_tr_bts_test

type prototypes
subroutine sp_fu_SaleReq ( &
					String psAgentOrderStatus,  &
					String psConfirmationNumber,  &
					String psAgentOrderNumber,  &
					String psAgentBranchIDCode,  &
					String psAgentState,  &
					String psAgentCountry,  &
					DateTime pdtAgentSaleDateTime,  &
					String psPaymentType,  &
					String psAccountType,  &
					String psAccountNumber,  &
					String psBankCode,  &
					String psSubBankCode,  &
					String psOriginCountry,  &
					String psOriginCurrencyCd,  &
					String psDestinationCountry,  &
					String psCurrencyPayment,  &
					String psFaceValueUSD,  &
					String psRecipPaymentAmount,  &
					String psExchangeRate,  &
					String psSaleFee,  &
					String psSenderName,  &
					String psSenderLastName,  &
					String psSenderMothersMaidenName,  &
					String psSenderAddress,  &
					String psSenderCity,  &
					String psSenderState,  &
					String psSenderCountry,  &
					String psSenderZipCode,  &
					String psSenderTelephone,  &
					String psSenderPaymentType,  &
					String psSenderAccountType,  &
					String psSenderAccountNumber,  &
					String psSenderBankCode,  &
					String psSenderComments,  &
					String psRecipientName,  &
					String psRecipientLastName,  &
					String psRecipientMothersMaidenName,  &
					String psRecipientAddress,  &
					String psRecipientCity,  &
					String psRecipientState,  &
					String psRecipientCountry,  &
					String psRecipientZipCode,  &
					String psRecipientTelephone,  &
					String psRecipientCedularId,  &
					String psRecipientIDType,  &
					String psRecipientIDNumber,  &
					String psSenderIDType,  &
					String psSenderIDIssuerState,  &
					String psSenderIDIssuerCountry,  &
					String psSenderIDNumber,  &
					String psSenderIDExpirationDate,  &
					String psSenderBirthdate,  &
					String psSenderOccupation,  &
					String psSenderSSNumber,  &
					String psParameter1,  &
					String psParameter2,  &
					String psParameter3,  &
					String psParameter4,  &
					String psParameter5,  &
					ref String psOpCode,  &
					ref DateTime psBTSProcessDateTime,  &
					ref String psError) rpcfunc alias for 'dbo.EDB_sp_fu_SaleReq'



end prototypes

on n_tr_bts_test.create
call super::create
end on

on n_tr_bts_test.destroy
call super::destroy
end on

