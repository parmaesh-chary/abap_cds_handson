@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight view base'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_BASE_VIEW_FLIGHT
  as select from /dmo/flight
{
  key carrier_id                   as CarrierId,
  key connection_id                as ConnectionId,
  key flight_date                  as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                        as Price,
      currency_code                as CurrencyCode,
      plane_type_id                as PlaneTypeId,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CDS_TEST'
      cast('' as abap.char( 30 ) ) as text

}
//Calculated values based on code exits
