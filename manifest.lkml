project_name: "gcp_multi_cloud"

constant: bq-connection {
  export: override_required
  value: "your_bq_connection"
}

constant: ops-01-380317 {
  export: override_required
  value: "your_bq_project"
}

constant: billing_data {
  export: override_required
  value: "your_bq_dataset"
}
