view: product_name {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;

  dimension: product_name {
    type: string
    sql: ${TABLE}.ProductNameKey ;;
  }

  dimension: product_name_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ProductNameKey ;;
  }

  measure: count {
    label: "Number of Products Consumed"
    type: count
    drill_fields: [product_name]
  }
}
