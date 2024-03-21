@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'String Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAKP_STRING_OP
  as select from /dmo/airport
{
  key name,                                                 //Frankfurt Airport
      length(name)                         as LengthOfName, //17
      instr(name,'rank')                   as PositionIde, //2
      //Offset - starts with 1
      concat(name , 'paramesh')            as ConcatenatedString, //Frankfurt Airportparamesh
      concat_with_space(name,'paramesh',5) as ConctWithString, //Frankfurt Airport     paramesh
      //left(name,numberofcharcterstobefetched)
      left(name,9)                         as Left9Char,    //Frankfurt
      right(name, 9)                       as Rigth9Char,   //t Airport
      lower(name)                          as LoweredName,  //frankfurt airport
      upper(name)                          as UpperedName,  //FRANKFURT AIRPORT
      //ltrim(arg , valuetobetrimmedfrom)
      ltrim(name,'F')                      as LeftTrimmed,  //rankfurt Airport
      rtrim(name,'t')                      as RightTrimmed, //Frankfurt Airpor
      replace( name,'Airport','paramesh')  as ReplacedValue, //Frankfurt paramesh
      //substring( string , position,lemgth)
      substring(name,1,9)                  as SubstringValue, //Frankfurt
      //lpad( string , OutputLemgthof String , PaddingValue)
      lpad(name,20,'0')                    as LpaddedValue, //000Frankfurt Airport
      rpad(name,20,'0')                    as RpaddedValue  //Frankfurt Airport000
}
where
  name = 'Frankfurt Airport'
