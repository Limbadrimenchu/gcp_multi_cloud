view: unified_cloud_billing {
  sql_table_name:  `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;

  dimension: billing_account_key {
    hidden: yes
    type: string
    sql: ${TABLE}.BillingAccountKey ;;
  }

  dimension_group: billing_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BillingEndDate ;;
  }

  dimension_group: billing_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BillingStartDate ;;
  }

  dimension: charge_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ChargeKey ;;
  }

  dimension: charge_type_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ChargeTypeKey ;;
  }

  dimension: cloud_provider_key {
    hidden: yes
    type: string
    sql: ${TABLE}.cloudProviderKey ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.Net_Cost ;;
    value_format_name: usd
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_GCP_cost {
    group_label: "GCP"
    label: "Total GCP Cost"
    type: sum
    sql: ${cost} ;;
    filters: [cloud_provider.cloud_provider: "GCP"]
    value_format_name: usd
  }

  measure: percent_of_spend_gcp {
    group_label: "GCP"
    label: "GCP Percent of Spend"
    sql: 1.0*${total_GCP_cost}/NULLIF(${total_cost},0) ;;
    value_format_name: percent_1
  }

  measure: total_AWS_cost {
    group_label: "colo"
    label: "Total colo Cost"
    type: sum
    sql: ${cost} ;;
    filters: [cloud_provider.cloud_provider: "Colo"]
    value_format_name: usd
  }

  measure: percent_of_spend_aws {
    group_label: "colo"
    label: "colo Percent of Spend"
    sql: 1.0*${total_AWS_cost}/NULLIF(${total_cost},0) ;;
    value_format_name: percent_1
  }

  measure: total_azure_cost {
    group_label: "Azure"
    label: "Total Azure Cost"
    type: sum
    sql: ${cost} ;;
    filters: [cloud_provider.cloud_provider: "Azure"]
    value_format_name: usd
  }

  measure: percent_of_spend_azure {
    group_label: "Azure"
    label: "Azure Percent of Spend"
    sql: 1.0*${total_azure_cost}/NULLIF(${total_cost},0) ;;
    value_format_name: percent_1
  }

  dimension: currency_key {
    hidden: yes
    type: string
    sql: ${TABLE}.CurrencykEY ;;
  }

  dimension: product_name_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ProductNameKey ;;
  }

  dimension: project_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ProjectKey ;;
  }

  dimension: resource_location_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ResourceLocationKey ;;
  }

  dimension: row_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.row_key ;;
  }

  dimension: service_key {
    hidden: yes
    type: string
    sql: ${TABLE}.Service_key ;;
  }

  dimension: service_type_key {
    hidden: yes
    type: string
    sql: ${TABLE}.Service_type_key ;;
  }

  dimension_group: usage_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_end_date ;;
  }

  dimension: usage_quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.usage_quantity ;;
  }

  measure: total_usage_quantity {
    type: sum
    sql: ${usage_quantity} ;;
    value_format_name: decimal_2
  }

  dimension_group: usage_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_start_date ;;
    drill_fields: [service_type.service_type]
  }

  dimension: usage_unit_of_measure_key {
    hidden: yes
    type: string
    sql: ${TABLE}.Usage_UoM ;;
  }

}
