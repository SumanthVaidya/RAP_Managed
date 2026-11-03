@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Project details'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_EMP_proj_cds as select from zbd_employeeproj
association to parent ZI_Emp_CDS as _emp on $projection.Empid = _emp.Empid
{
    key empid as Empid,
    key projectid as Projectid,
    projectname as Projectname,
    projectdesc as Projectdesc,
    startdate as Startdate,
    enddate as Enddate,
    manager as Manager,
    _emp
}
