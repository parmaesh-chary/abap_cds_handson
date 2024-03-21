@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inner Join view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_INNER_JOIN
  as select from /dmo/flight     as flight
    inner join   /dmo/connection as connection on  flight.carrier_id    = connection.carrier_id
                                               and flight.connection_id = connection.connection_id
    inner join   /dmo/carrier    as carrier    on flight.carrier_id = carrier.carrier_id
    inner join   /dmo/airport    as airport    on connection.airport_from_id = airport.airport_id
{
  key flight.carrier_id          as CarrierId,
  key flight.connection_id       as ConnectionId,
  key flight.flight_date         as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight.price               as Price,
      flight.currency_code       as CurrencyCode,
      flight.plane_type_id       as PlaneTypeId,
      flight.seats_max           as SeatsMax,
      flight.seats_occupied      as SeatsOccupied,
      connection.airport_from_id as AirportFrom,
      connection.airport_to_id   as AirportTo,
      carrier.name               as CarrierName,
      airport.name               as AirportName,
      airport.country            as AirportCountry,
      airport.city               as AirportCity
      //      case airport.city
      //      when '1' then 'a'
      //      when '2' then 'b'
      //      else 'c'
      //      end as tested,
      //
      //      case
      //      when airport.city = '1' then 'a'
      //      when airport.city = '1' then 'a'
      //      else 'c'
      //      end as test

}

////Generated SQL Create statement
//CREATE OR REPLACE VIEW "ZAKP_INNER_JOIN" AS SELECT
//  "FLIGHT"."CLIENT" AS "MANDT",
//  "FLIGHT"."CARRIER_ID" AS "CARRIERID",
//  "FLIGHT"."CONNECTION_ID" AS "CONNECTIONID",
//  "FLIGHT"."FLIGHT_DATE" AS "FLIGHTDATE",
//  "FLIGHT"."PRICE" AS "PRICE",
//  "FLIGHT"."CURRENCY_CODE" AS "CURRENCYCODE",
//  "FLIGHT"."PLANE_TYPE_ID" AS "PLANETYPEID",
//  "FLIGHT"."SEATS_MAX" AS "SEATSMAX",
//  "FLIGHT"."SEATS_OCCUPIED" AS "SEATSOCCUPIED",
//  "CONNECTION"."AIRPORT_FROM_ID" AS "AIRPORTFROM",
//  "CONNECTION"."AIRPORT_TO_ID" AS "AIRPORTTO",
//  "CARRIER"."NAME" AS "CARRIERNAME",
//  "AIRPORT"."NAME" AS "AIRPORTNAME",
//  "AIRPORT"."COUNTRY" AS "AIRPORTCOUNTRY",
//  "AIRPORT"."CITY" AS "AIRPORTCITY"
//FROM (
//  (
//    "/DMO/FLIGHT" "FLIGHT" INNER JOIN "/DMO/CONNECTION" "CONNECTION" ON (
//      "FLIGHT"."CARRIER_ID" = "CONNECTION"."CARRIER_ID" AND
//      "FLIGHT"."CONNECTION_ID" = "CONNECTION"."CONNECTION_ID" AND
//      "FLIGHT"."CLIENT" = "CONNECTION"."CLIENT"
//    )
//  ) INNER JOIN "/DMO/CARRIER" "CARRIER" ON (
//    "FLIGHT"."CLIENT" = "CARRIER"."CLIENT" AND
//    "FLIGHT"."CARRIER_ID" = "CARRIER"."CARRIER_ID"
//  )
//) INNER JOIN "/DMO/AIRPORT" "AIRPORT" ON (
//  "FLIGHT"."CLIENT" = "AIRPORT"."CLIENT" AND
//  "CONNECTION"."AIRPORT_FROM_ID" = "AIRPORT"."AIRPORT_ID"
//)
//WHERE "FLIGHT"."CLIENT" = SESSION_CONTEXT(
//  'CDS_CLIENT'
//) WITH READ ONLY
