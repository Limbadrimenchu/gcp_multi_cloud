view: usage_unit_of_measure {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;

  dimension: usage_unit_of_measure {
    type: string
    sql: ${TABLE}.Usage_UoM ;;
  }

  dimension: usage_unit_of_measure_key {
    hidden: yes
    type: string
    sql: ${TABLE}.Usage_UoM ;;
  }

}
