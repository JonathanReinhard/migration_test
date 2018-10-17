view: sql_runner_query {
  derived_table: {
    sql: SELECT
        CONCAT("-",products.category)  AS `products.category`,
        products.item_name  AS `products.item_name`
      FROM demo_db.products  AS products

      GROUP BY 1,2
      ORDER BY products.category
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: products_category {
    type: string
    sql: CONCAT("_",${TABLE}.`products.category`) ;;
  }

  dimension: products_item_name {
    type: string
    sql: ${TABLE}.`products.item_name` ;;
  }

  set: detail {
    fields: [products_category, products_item_name]
  }
}
