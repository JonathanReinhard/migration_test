- dashboard: gna_test_embed
  title: Gna_test_embed
  layout: newspaper
  elements:
  - title: test_embed
    name: test_embed
    model: sso_curriculum_test
    explore: orders
    type: table
    fields: [orders.count, orders.status]
    filters: {}
    sorts: [orders.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Status: orders.status
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Status
    title: Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: sso_curriculum_test
    explore: orders
    listens_to_filters: []
    field: orders.status
