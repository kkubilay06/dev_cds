@AbapCatalog.sqlViewName: 'ZKUBEKTAS_V002'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Örnek CDS'
define view ZKUBEKTAS_5521_CDS_002
    as select from vbrp
    inner join vbrk on vbrk.vbeln = vbrp.vbeln
    inner join mara on mara.matnr = vbrp.matnr
    left outer join vbak on vbak.vbeln = vbrp.aubel
    left outer join kna1 on kna1.kunnr = vbak.kunnr
    left outer join makt on makt.matnr = vbrp.matnr and makt.spras = $session.system_language
{
    key vbrp.vbeln,
    key vbrp.posnr,
    vbrp.aubel,
    vbrp.aupos,
    vbak.kunnr,
    
    @EndUserText.label: 'Kunnr Ad'
    concat_with_space(kna1.name1, kna1.name2, 1) as kunnrAd,

    @EndUserText.label: 'Price (EUR)'
    currency_conversion(amount => vbrp.netwr,
                        source_currency => vbrk.waerk,
                        target_currency => cast('EUR' as abap.cuky),
                        exchange_rate_date => vbrk.fkdat ) as conversion_netwr,
    
    @EndUserText.label: 'Left Kunnr'
    left(vbak.kunnr, 3) as left_kunnr,
    
    @EndUserText.label: 'Length'
    length(mara.matnr) as matnr_length,
    
    @EndUserText.label: 'Faturalama Türü'
    case vbrk.fkart
        when 'FAS' then 'Peşinat talebi iptali'
        when 'FAZ' then 'Peşinat Talebi'
        else 'Fatura'
    end as faturalama_turu,
    
    vbrk.fkdat,
    vbrk.inco2_l

}
