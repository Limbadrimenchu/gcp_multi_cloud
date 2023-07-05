view: project {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;
  drill_fields: [project_id]

  dimension: project_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ProjectKey ;;
  }

  dimension: project_key {
    hidden: yes
    type: string
    sql: ${TABLE}.ProjectKey ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.Project ;;
  }

  measure: count {
    label: "Count of Projects"
    type: count
    drill_fields: [project_id, project_name]
  }
}
