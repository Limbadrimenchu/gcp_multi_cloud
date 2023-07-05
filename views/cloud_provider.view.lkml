view: cloud_provider {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;

  dimension: cloud_provider {
    type: string
    sql: ${TABLE}.cloudProviderKey ;;
  }

  dimension: cloud_provider_key {
    hidden: yes
    type: string
    sql: ${TABLE}.cloudProviderKey ;;
  }

  measure: count {
    label: "Count of Cloud Proviers"
    type: count
    drill_fields: []
  }
}
