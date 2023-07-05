view: service {
  sql_table_name: `@{ops-01-380317}.@{billing_data}.unified_billing_table`
    ;;
  drill_fields: [service_id]

  dimension: service_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: CASE WHEN LENGTH(${TABLE}.Service_key) = 0 THEN 'SNS Project' ELSE ${TABLE}.Service_key END ;;
  }

  dimension: resource_project {
    view_label: "Resource & Projects"
    label: "Resource/Project"
    type: string
    sql: CASE WHEN COALESCE(${project.project_name},${Service_key}) = '<missing>'
              THEN 'SNS Project'
              ELSE COALESCE(${project.project_name},${Service_key}) END ;;
  }

  dimension: service_key {
    hidden: yes
    type: string
    sql: ${TABLE}.Service_key ;;
  }

  measure: count {
    label: "Count of Services Consumed"
    type: count
    drill_fields: [service_id]
  }
}
