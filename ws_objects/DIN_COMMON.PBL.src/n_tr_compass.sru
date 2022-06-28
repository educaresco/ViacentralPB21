$PBExportHeader$n_tr_compass.sru
forward
global type n_tr_compass from n_tr
end type
end forward

global type n_tr_compass from n_tr
end type
global n_tr_compass n_tr_compass

type prototypes
subroutine prtxreview ( &
String TX_AGENTCODE,  &
String TX_NUMBER,  &
Datetime TX_DATE,  &
Double TX_AMOUNT_AMOUNT,  &		 
Double TX_CASH_AMOUNT,  &
String TX_DELIVERY_TYPE,  &
String TX_STATUS_CODE,  &
String TX_CURRENCY_CODE,  &
String TX_PRODUCT_CODE,  &
String TX_CORRESPONDENT_CODE,  &
String TX_ADDITIONAL1,  &
String TX_ADDITIONAL2,  &
String TX_ADDITIONAL3,  &
String SEN_NAME,  &
String SEN_ID1_TYPE_CODE,  &
String SEN_ID1_NUMBER,  &
String SEN_ID1_ISSUEBY,  &
String SEN_ID2_TYPE_CODE,  &
String SEN_ID2_NUMBER,  &
String SEN_ID2_ISSUEBY,  &
String SEN_PHONE1,  &
String SEN_PHONE2,  &
String SEN_ADDRESS,  &
String SEN_CITY,  &
String SEN_STATE_CODE,  &
String SEN_COUNTRY_CODE,  &
String SEN_ZIPCODE,  &
Datetime SEN_DOB,  &
String SEN_OCCUPATION,  &
String SEN_NUMBER,  & 
String REC_NAME,  &
String REC_ID1_TYPE_CODE,  &
String REC_ID1_NUMBER,  &
String REC_ID1_ISSUEBY,  &
String REC_ID2_TYPE_CODE,  &
String REC_ID2_NUMBER,  &
String REC_ID2_ISSUEBY,  &
String REC_PHONE1,  &
String REC_PHONE2,  &
String REC_ADDRESS,  &
String REC_CITY,  &
String REC_STATE_CODE,  &
String REC_COUNTRY_CODE,  &
String REC_ZIPCODE,  &
Datetime REC_DOB,  &
String REC_NUMBER,  &
ref String DET_IND,  &
ref String DET_RULE,  &
ref String DET_MESSAGE,  &
ref String MATCH_IND,  &
ref String MATCH_NUMBER,  &
ref String MATCH_ALIAS_NUMBER,  & 
ref String MATCH_MESSAGE,  &
ref String ERR_CODE,  &
ref String ERR_MESSAGE) rpcfunc alias for 'pkGrlInvoice.prTxReview'


subroutine prchangestatus ( &
String TX_AGENTCODE,  &
String TX_NUMBER,  &
String TX_STATUS_CODE,  &
ref String ERR_CODE,  &
ref String ERR_MESSAGE) rpcfunc alias for 'pkGrlInvoice.prChangeStatus'
end prototypes

on n_tr_compass.create
call super::create
end on

on n_tr_compass.destroy
call super::destroy
end on

