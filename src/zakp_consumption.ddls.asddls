@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_CONSUMPTION
  as select from ZAKP_COMPOSITE
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrCode'
      Price,
      CurrCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      AirportFromId,
      AirportToId
}
//Final consumption view created on composite view
