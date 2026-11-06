CLASS lhc_ZI_Emp_CDS DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR ZI_Emp_CDS RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR ZI_Emp_CDS RESULT result.
    METHODS setAdmitted FOR MODIFY
      keys FOR ACTION ZI_Emp_CDS~setAdmitted.
    METHODS get_instance_features FOR INSTANCE FEATURES
      keys REQUEST requested_features FOR ZI_Emp_CDS RESULT result.
    METHODS empdob FOR VALIDATE ON SAVE
      keys FOR zi_emp_cds~empdob.

ENDCLASS.

CLASS lhc_ZI_Emp_CDS IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD setAdmitted.


  modIFY eNTITIES OF ZI_Emp_CDS in locaL MODE
  enTITY ZI_Emp_CDS
  updATE
  fiELDS ( Empprojectallocated )
  with VALUE #( for key in keys ( %tky = key-%tky Empprojectallocated = abap_true )  )
  failed failed
  Reported reported.

  ENDMETHOD.

  METHOD get_instance_features.

  read enTITIES OF ZI_Emp_CDS in locaL MODE
  enTITY ZI_Emp_CDS
  all FIELDS WITH corRESPONDING #( keys )
  resuLT dATA(lv_empdetails).


  result = VALUE #( FOR ls_empdetails IN lv_empdetails
                  ( %tky = ls_empdetails-%tky
                   %action-setAdmitted = COND #( WHEN ls_empdetails-Empprojectallocated = ABAP_TRUE
                                                 THEN IF_ABAP_BEHV=>FC-o-disabled
                                                 ELSE IF_ABAP_BEHV=>FC-o-enabled ) ) ).

  ENDMETHOD.

  METHOD Empdob.

  read entITIES OF ZI_Emp_CDS in locaL MODE
  enTITY ZI_Emp_CDS
  fieLDS ( Empdob ) wITH corRESPONDING #( keys )
  reSULT dATA(lv_empdob).


  loop AT lv_empdob assIGNING fIELD-SYMBOL(<ls_empdob>).
  if <ls_empdob>-Empdob > cl_abap_context_info=>get_system_date(  ) or <ls_empdob>-Empdob is inITIAL.
    appeND vALUE #( %tky = <ls_empdob>-%tky
                   %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                  text = 'Invalid DOB' )  ) to reported-zi_emp_cds.

  endIF.
   endloop.

  ENDMETHOD.

ENDCLASS.
