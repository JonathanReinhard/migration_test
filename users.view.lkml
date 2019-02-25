view: users {
  sql_table_name: demo_db.users ;;


  dimension: user_id {
    primary_key: yes
    type: number
    tags: ["email","id", "full_name"]
    sql: ${TABLE}.id ;;
  }
  ###

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    tags: ["email"]
    sql: ${TABLE}.email ;;
  }

  measure: testing_m {
    tags: ["email", "user_id"]
    type: number
    sql: 1 ;;
  }

  dimension: first_name {
    type: string
    sql: CONCAT('His Majesty ',${TABLE}.first_name) ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: CONCAT(${TABLE}.last_name,' TheTHIRD') ;;
  }

  dimension: full_name{
    type: string
    sql: CONCAT(${first_name},' NOT THE REAL NAME ',${last_name}) ;;
  }

  dimension: other_name {
    type: string
    sql: Replace(${full_name},"NOT"," ") ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    tags: ["email","id", "full_name"]
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      user_id,
      first_name,
      last_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
