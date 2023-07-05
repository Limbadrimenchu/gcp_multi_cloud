view: resource_location {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;

  dimension: resource_location {
    type: string
    sql: ${TABLE}.ResourceLocationKey ;;
  }

  dimension: resource_location_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ResourceLocationKey ;;
  }

  dimension: resource_region {
    type: string
    sql: ${TABLE}.ResourceLocationKey ;;
  }
}
