view: currency {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;

  dimension: currency {
    type: string
    sql: ${TABLE}.CurrencykEY ;;
  }

  dimension: currency_key {
    hidden: yes
    type: string
    sql: ${TABLE}.CurrencykEY ;;
  }

}
