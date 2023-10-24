@AbapCatalog.sqlViewName: 'ZKUBEKTAS_V001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Örnek CDS'
define view ZKUBEKTAS_5521_CDS_001
    as select from mara
        left outer join makt on makt.matnr = mara.matnr
{
    mara.matnr,
    makt.maktx    
}
