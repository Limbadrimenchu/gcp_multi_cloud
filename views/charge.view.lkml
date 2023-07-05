view: charge {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table` ;;
  drill_fields: [charge_id]

  dimension: charge_id {
    hidden: yes
    type: string
    sql: ${TABLE}.ChargeKey ;;
  }

  dimension: charge_description {
    type: string
    sql: ${TABLE}.ChargeKey ;;
  }

  dimension: charge_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ChargeKey ;;
  }

}
