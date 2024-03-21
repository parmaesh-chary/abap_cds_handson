@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Case Statement Usage'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_CASE_STATEMENT
  as select from ZAKP_BASIC_FLIGHT
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      case CarrierId
      when 'SQ' then 'Singapore Airlines'
      when 'UA' then 'United Airlines'
      when 'LA' then 'Deutsche Lufthansa AG'
      else 'Unknown'
      end                                  as CarrDesc,
      cast( Price as abap.fltp(16) ) / 2.0 as DiscountedPrice,
      case
      when Price > 1 then 'OK'
      when Price < 1 then 'NOT OK'
      else 'ACTION REQUIRED'
      end                                  as DisValue


}
