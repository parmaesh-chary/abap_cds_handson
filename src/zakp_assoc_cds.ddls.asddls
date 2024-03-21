@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Associationa'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_ASSOC_CDS
  as select from /dmo/flight as flight
  association [0..1] to /dmo/connection as _connection on  flight.carrier_id    = _connection.carrier_id
                                                       and flight.connection_id = _connection.connection_id
  association [0..1] to /dmo/carrier    as _carrier    on  flight.carrier_id = _carrier.carrier_id
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied,
      _connection,
      _carrier
}
//Generated SQL Create Statement
//CREATE OR REPLACE VIEW "ZAKP_ASSOC_CDS" AS SELECT
//  "FLIGHT"."CLIENT" AS "MANDT",
//  "FLIGHT"."CARRIER_ID" AS "CARRIERID",
//  "FLIGHT"."CONNECTION_ID" AS "CONNECTIONID",
//  "FLIGHT"."FLIGHT_DATE" AS "FLIGHTDATE",
//  "FLIGHT"."PRICE" AS "PRICE",
//  "FLIGHT"."CURRENCY_CODE" AS "CURRENCYCODE",
//  "FLIGHT"."PLANE_TYPE_ID" AS "PLANETYPEID",
//  "FLIGHT"."SEATS_MAX" AS "SEATSMAX",
//  "FLIGHT"."SEATS_OCCUPIED" AS "SEATSOCCUPIED"
//FROM "/DMO/FLIGHT" "FLIGHT"
//WHERE "FLIGHT"."CLIENT" = SESSION_CONTEXT(
//  'CDS_CLIENT'
//) WITH READ ONLY
