@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_UNIT_CURR_Conversion
  as select from /dmo/flight
{
  key carrier_id                     as CarrierId,
  key connection_id                  as ConnectionId,
  key flight_date                    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                          as Price,
      currency_code                  as CurrencyCode,
      plane_type_id                  as PlaneTypeId,
      seats_max                      as SeatsMax,
      seats_occupied                 as SeatsOccupied,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount => price ,
                               source_currency => currency_code ,
                               target_currency => cast( 'INR' as abap.cuky(5) ) ,
                               exchange_rate_date => cast('20240314' as abap.dats)
                                   ) as Net_INR

}
