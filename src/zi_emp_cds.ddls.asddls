@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee CDS view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_Emp_CDS as select from zdb_employee
composition [0..*] of ZI_EMP_proj_cds as _empproj
{
    key empid as Empid,
    empfirstname as Empfirstname,
    emplastname as Emplastname,
    empdob as Empdob,
    empgender as Empgender,
    empemail as Empemail,
    emplevel as Emplevel,
    empdepartment as Empdepartment,
    empdesignation as Empdesignation,
    empjoiningdate as Empjoiningdate,
    empprojectallocated as Empprojectallocated,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    lastchangedat as Lastchangedat,
    _empproj
}
