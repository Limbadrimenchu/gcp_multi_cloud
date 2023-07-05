view: charge_type {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table` ;;

  dimension: charge_type {
    type: string
    sql: ${TABLE}.ChargeTypeKey ;;
  }

  dimension: charge_type_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ChargeTypeKey ;;
  }
}
