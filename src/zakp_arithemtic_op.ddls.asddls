@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Arithemtic op'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_ARITHEMTIC_OP
  as select from zakp_connection
{
  key uuid,
      2 + 2                            as Addition, //4
      2 * 2                            as Mul, //4
      2 - 2                            as sub, //0
      2 / 2                            as Div, //1
      ( 2 * 2 ) + 4                    as ComplexCal, //8
      cast( 6.0 as abap.fltp(16))*0.30 as CastedValue //1.799999999999999,

}
