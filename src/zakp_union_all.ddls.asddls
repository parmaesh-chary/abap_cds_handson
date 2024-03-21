@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'union and all'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_UNION_ALL
  as select from /dmo/flight
{
  key carrier_id,
      connection_id
}
union select from /dmo/connection
{
  key carrier_id,
      connection_id
}

//define view entity ZAKP_UNION_ALL
//  as select from /dmo/flight
//{
//  key carrier_id,
//      connection_id
//}
//union all select from /dmo/connection
//{
//  key carrier_id,
//      connection_id
//}

//UNION - Removes Duplicate from result set
//UNION ALL - Allows all duplicates
