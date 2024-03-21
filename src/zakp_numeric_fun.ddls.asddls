@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Numerical Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_NUMERIC_FUN
  as select from /dmo/flight
{
  //Absolute Value gets the positive number
  abs(5)           as AbsValue, //5
  abs(-5)          as AbsoluteValue, //5
  //It gives the reminder
  mod(10,3)        as Modulos, //1
  //Traditional Division - Gives Quotient
  div(20,6)        as Tradisional_Div, //3
  //Extra feature - Adding the dec places
  division(20,6,2) as Tradisional_Div_Dec //3.33
  //Get the highest Value
  //ceil(5.5) as CeiledValue,//6
  //Get the lowest value
  //floor(5.5) as FlooredValue,//5
  //Get the rounded value based on positions
  //round(3.44,1) as RoundedValue//3.4

}
