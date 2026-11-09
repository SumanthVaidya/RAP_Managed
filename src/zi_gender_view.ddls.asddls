@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gender Interface view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_gender_view as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'Z_GENDER_DOMAIN' )
{
    key domain_name,
    key value_position,
    key language,
    value_low,
    text
}
