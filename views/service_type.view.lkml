view: service_type {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;

  dimension: service_category {
    type: string
    sql: CASE WHEN ${TABLE}.Service_type_key = '???-Unknown' THEN 'Other' ELSE  ${TABLE}.Service_type_key END ;;
    drill_fields: [service_type]
  }

  dimension: service_type {
    type: string
    sql: CASE WHEN ${TABLE}.Service_type_key = '???-Unknown' THEN 'Other' ELSE  ${TABLE}.Service_type_key END ;;
  }

  dimension: service_type_key {
    hidden: yes
    type: string
    sql: ${TABLE}.Service_type_key ;;
  }

  measure: count {
    label: "Count of Service Types Consumed"
    type: count
    drill_fields: []
  }
}
