@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_EMP_PROJ_CDS as projection on ZI_EMP_proj_cds
{
    key Empid,
   key Projectid,
    Projectname,
    Projectdesc,
    Startdate,
    Enddate,
    Manager,
    /* Associations */
    _emp : redirected to parent ZC_EMP_CDS 
}
