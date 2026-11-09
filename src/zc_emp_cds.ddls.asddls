@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_EMP_CDS as projection on ZI_Emp_CDS
{
    key Empid,
    Empfirstname,
    Emplastname,
    Empdob,
    Empgender,
    Empemail,
    Emplevel,
    Empdepartment,
    Empdesignation,
    Empjoiningdate,
    Empprojectallocated,
    Lastchangedat,
    /* Associations */
    _empproj : redirected to composition child ZC_EMP_PROJ_CDS,
    _gender.value_low as gender
}
