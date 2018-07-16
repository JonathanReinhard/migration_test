- dashboard: testy
  title: testy
  layout: newspaper
  elements:
  - title: test_embed
    name: test_embed
    model: sso_curriculum_test
    explore: orders
    type: table
    fields:
    - orders.count
    - users.first_name
    sorts:
    - orders.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      filter1: users.first_name
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: filter1
    title: filter1
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: sso_curriculum_test
    explore: users
    listens_to_filters: []
    field: users.first_name
