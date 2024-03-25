@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic flight tbales'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@UI.chart: [{
chartType: #DONUT,
qualifier: 'OccupiedPer',
measures :['OccupiedPerc'],
measureAttributes: [{
measure: 'OccupiedPerc' ,
role : #AXIS_1,
asDataPoint: true}]
}]
define view entity ZAKP_FIORI_FLIGHT
  as select from /dmo/flight
{
      @UI.facet: [
      { id : 'FlightDetails',
      label: 'FlightDetails',
      position: 10,
      type: #IDENTIFICATION_REFERENCE,
      purpose: #STANDARD }
      ]
      @UI.lineItem: [{ position: 11 , label: 'CarrierId' }]
      @UI.identification: [{ position: 11 , label: 'CarrierId' }]
  key carrier_id                                   as CarrierId,
      @UI.lineItem: [{ position: 12 , label: 'ConnectionId' }]
      @UI.identification: [{ position: 12 , label: 'ConnectionId' }]
  key connection_id                                as ConnectionId,
      @UI.lineItem: [{ position: 13 , label: 'Flightdate' }]
      @UI.identification: [{ position: 13 , label: 'Flightdate' }]
  key flight_date                                  as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @UI.lineItem: [{ position: 14, label: 'Fare' }]
      @UI.identification: [{ position: 14, label: 'Fare' }]
      price                                        as Price,
      currency_code                                as CurrencyCode,
      @UI.lineItem: [{ position: 15 , label: 'PlaneType' }]
      @UI.identification: [{ position: 15 , label: 'PlaneType' }]
      plane_type_id                                as PlaneTypeId,
      @UI.lineItem: [{ position: 15 , label: 'PlaneType' }]
      @UI.identification: [{ position: 15 , label: 'PlaneType' }]
      seats_max                                    as SeatsMax,
      case
      when seats_max >= 300 then 3  //Green
      when seats_max >= 200 then 2  //Orange
      else 1                        //Red
      end                                          as Criticality,
      @UI.lineItem: [{ position: 17 , label: 'SeatsOccupied' ,type : #AS_DATAPOINT }]
      @UI.identification: [{ position: 17 , label: 'SeatsOccupied'}]
      @UI.dataPoint:{ visualization: #PROGRESS, targetValueElement: 'SeatsMax' , criticality: 'Criticality'}
      seats_occupied                               as SeatsOccupied,
      @UI.lineItem: [{ position: 18 , label: 'Occupied%' ,type : #AS_CHART ,valueQualifier: 'OccupiedPer' }]
      @UI.dataPoint:{
          criticalityCalculation: {
          deviationRangeLowValue: 50.00,
          toleranceRangeLowValue: 75.00,
          improvementDirection: #MAXIMIZE
          }
      }
      @UI.identification: [{ position: 18 , label: 'Occupied%'}]
      division(seats_occupied, seats_max , 2 )*100 as OccupiedPerc
}
