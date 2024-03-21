@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Compisite view on basic views'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_COMPOSITE
  as select from ZAKP_BASIC_FLIGHT     as flight
    inner join   ZAKP_BASIC_CONNECTION as connection on  flight.CarrierId    = connection.CarrierId
                                                     and flight.ConnectionId = connection.ConnectionId
{

  key flight.CarrierId,
  key flight.ConnectionId,
  key flight.FlightDate,
      @Semantics.amount.currencyCode: 'CurrCode'
      flight.Price,
      flight.CurrencyCode as CurrCode,
      flight.PlaneTypeId,
      flight.SeatsMax,
      flight.SeatsOccupied,
      connection.AirportFromId,
      connection.AirportToId,
      connection.DepartureTime,
      connection.ArrivalTime,
      connection.Distance,
      connection.DistanceUnit
}

//Created a composite view on two basic views
