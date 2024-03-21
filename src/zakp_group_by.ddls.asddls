@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Group By option'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_GROUP_BY
  as select from ZAKP_BASIC_FLIGHT
{
  key CarrierId,
  key ConnectionId,
      max(SeatsOccupied) as MaxCovered,
      min(SeatsOccupied) as MinCovered,
      count(*)           as ItemCount

}
group by
  CarrierId,
  ConnectionId
having
  CarrierId = 'SQ'
