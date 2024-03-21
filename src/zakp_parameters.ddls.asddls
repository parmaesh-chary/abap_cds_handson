@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view with parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_PARAMETERS
  with parameters
    p_flight_date : /dmo/flight_date,
    @Environment.systemField: #SYSTEM_LANGUAGE
    p_lang        : abap.char(10),
    @Environment.systemField: #USER
    p_user        : abap.char(10),
    @Environment.systemField:#CLIENT
    p_client      : abap.char(10),
    @Environment.systemField:#SYSTEM_DATE
    p_cdate       : abap.char(10),
    @Environment.systemField:#SYSTEM_TIME
    p_ctime       : abap.char(10),
    @Environment.systemField:#USER_DATE
    p_udate       : abap.char(10),
    @Environment.systemField:#USER_TIMEZONE
    p_utime       : abap.char(10)
  as select from /dmo/flight
{
  key carrier_id           as CarrierId,
  key connection_id        as ConnectionId,
  key flight_date          as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                as Price,
      currency_code        as CurrencyCode,
      plane_type_id        as PlaneTypeId,
      seats_max            as SeatsMax,
      seats_occupied       as SeatsOccupied,
      $parameters.p_lang   as SystemLanguage,
      $parameters.p_client as SystemClient,
      $parameters.p_user   as UserName,
      $parameters.p_udate  as UserDate,
      $parameters.p_utime  as UserTime,
      $parameters.p_cdate  as CurrentDate,
      $parameters.p_ctime  as CurrentTime
}
where
  flight_date <= $parameters.p_flight_date



// All parameters are mandatory except system Fields
//Parameters can be passed in where clause and  body
// All Annotation are optional
