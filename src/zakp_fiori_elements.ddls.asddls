@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fiori Elements'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections',
    title: {
            type: #STANDARD,
            value: 'AirlineName'
            },
    description: {
                 type: #STANDARD,
                value: 'CarrierId'
            }
}
@Search.searchable: true
define root view entity ZAKP_FIORI_ELEMENTS
  as select from /dmo/connection
  association [1] to ZAKP_FIORI_CARRIER as _carrier on  $projection.CarrierId = _carrier.CarrierId
  association [*] to ZAKP_FIORI_FLIGHT  as _flight  on  $projection.CarrierId    = _flight.CarrierId
                                                    and $projection.ConnectionId = _flight.ConnectionId
{

      @UI.facet: [
      {
      id: 'Connections',
      type : #IDENTIFICATION_REFERENCE,
      label: 'ConnectionDetails',
      position : 10
       },
       {
      id: 'Flight',
      type : #LINEITEM_REFERENCE,
      label: 'FlightDetails',
      position:  20,
      targetElement: '_flight'
       }]


      @UI.lineItem: [{ position: 11 , label: 'AirlineId' }]
      @UI.identification: [{ position: 11 , label: 'AirlineId' }]
      @ObjectModel.text.element: [ 'AirlineName' ]
      @UI.textArrangement: #TEXT_FIRST
      @UI.selectionField: [{ position: 10 }]
      @Consumption.valueHelpDefinition:
      [{
      entity.element: 'CarrierId' ,
      entity.name: 'ZAKP_FIORI_VH_CARRIER'
      }]
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20 , label: 'ConnectionId' }]
      @UI.identification: [{ position: 20 , label: 'ConnectionId' }]
      @UI.selectionField: [{ position: 11 }]
      @Consumption.valueHelpDefinition:
      [{
      entity.element: 'ConnectionID' ,
      entity.name: 'ZAKP_FIORI_VH_CONNECTIONS'
      }]
  key connection_id   as ConnectionId,
      // @UI.lineItem: [{ position: 10 , label: 'AirlineName' }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      _carrier.Name   as AirlineName,
      @UI.lineItem: [{ position: 30 , label: 'AirportFrom' }]
      @UI.identification: [{ position: 30 , label: 'AirportFrom' }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40 , label: 'AirportTo' }]
      @UI.identification: [{ position: 40 , label: 'AirportTo' }]
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50 , label: 'DepartureTime' }]
      @UI.identification: [{ position: 50 , label: 'DepartureTime' }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60 , label: 'ArrivalTime' }]
      @UI.identification: [{ position: 60 , label: 'ArrivalTime' }]
      arrival_time    as ArrivalTime,
      @UI.lineItem: [{ position: 70 , label: 'Distance' }]
      @UI.identification: [{ position: 70 , label: 'Distance' }]
      distance        as Distance,
      _flight
}
