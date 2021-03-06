connection: "thelook"

# #include: "//project_import_test/*.view.lkml"
# include: "//project_import_test/*"
# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"
#include: "*.dashboard.lkml"

datagroup: sso_curriculum_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "2 hour"
}

#explore: stations {}
persist_with: sso_curriculum_test_default_datagroup

# explore: test {
#   extends: [stations]
#   }

explore: sql_runner_query {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.user_id}id} ;;
    relationship: many_to_one
  }
}

# access_grant: can_view {
#   user_attribute: sara_test_chat
#   allowed_values:["Test"]
#   }

explore: orders {
  #required_access_grants: [can_view]
  join: users {
    # required_access_grants: [can_view]
    type: left_outer
    sql_on: ${orders.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.user_id}id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: users_nn {}
