@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH for COnnecctiojs'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZAKP_FIORI_VH_CONNECTIONS
  as select from /dmo/connection
{
  key connection_id as ConnectionID,
      carrier_id    as CarrierID

}
