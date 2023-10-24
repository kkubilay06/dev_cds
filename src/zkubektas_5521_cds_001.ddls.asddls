@AbapCatalog.sqlViewName: 'ZKUBEKTAS_V001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Örnek CDS'
define view ZKUBEKTAS_5521_CDS_001
    as select from ekko
        left outer join ekpo on ekko.ebeln = ekpo.ebeln
        left outer join mara on ekpo.matnr = mara.matnr
        left outer join makt on mara.matnr = makt.matnr and makt.spras = $session.system_language
        left outer join lfa1 on ekko.lifnr = lfa1.lifnr
{
    ekpo.ebeln,
    ekpo.ebelp,
    ekpo.matnr,
    makt.maktx,
    ekpo.werks,
    ekpo.lgort,
    ekpo.meins,
    lfa1.lifnr,
    lfa1.adrnr,
    concat_with_space(lfa1.stras, lfa1.mcod3, 1) as satici_adresi   
}
