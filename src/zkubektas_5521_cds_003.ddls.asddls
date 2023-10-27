@AbapCatalog.sqlViewName: 'ZKUBEKTAS_V003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Örnek CDS'
define view ZKUBEKTAS_5521_CDS_003
    as select from ZKUBEKTAS_5521_CDS_002 as table
{
    key table.vbeln,
    
    @EndUserText.label: 'Toplam Net Değer'
    cast(sum(table.conversion_netwr) as abap.curr( 12, 2 )) as toplam_net_deger,
    
    @EndUserText.label: 'Müşteri Ad-Soyad'
    table.kunnrAd,
    
    @EndUserText.label: 'Toplam Fatura Adedi'
    cast(count(*) as abap.int4) as toplam_fatura_adedi,
    
    @EndUserText.label: 'Ortalama Miktar'
    division(cast(sum(table.conversion_netwr) as abap.curr( 12, 2 )), cast(count(*) as abap.int4), 2) as ortalama_miktar,
    
    @EndUserText.label: 'Faturalama Yılı'
    left(table.fkdat,4) as faturalama_yili,
    
    @EndUserText.label: 'Faturalama Ayı'
    substring(table.fkdat,5,2) as faturalama_ayi,
    
    @EndUserText.label: 'Faturalama Günü'
    substring(table.fkdat,7,2) as faturalama_gunu,
    
    @EndUserText.label: 'Incoterm Yeri'
    substring(table.inco2_l,1,3) as incoterm_yeri
    
} group by table.vbeln, table.kunnrAd, table.fkdat, table.inco2_l
