view: billing_account {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table` ;;
  drill_fields: [billing_account_id]

  dimension: billing_account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.BillingAccountKey ;;
  }

  dimension: billing_account_key {
    hidden: yes
    type: string
    sql: ${TABLE}.BillingAccountKey ;;
  }

  measure: count {
    label: "Count of Billing Accounts"
    type: count
    drill_fields: [BillingAccountKey]
  }
}
