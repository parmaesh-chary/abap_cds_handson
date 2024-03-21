CLASS zcl_cds_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_test IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA:  lt_calculated_data TYPE STANDARD TABLE OF zakp_base_view_flight WITH DEFAULT KEY.

    MOVE-CORRESPONDING it_original_data TO lt_calculated_data.

    LOOP AT lt_calculated_data ASSIGNING FIELD-SYMBOL(<fs_data>).
      <fs_data>-text = 'Awesomeness'.
    ENDLOOP.

    MOVE-CORRESPONDING lt_calculated_data TO ct_calculated_data.
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
