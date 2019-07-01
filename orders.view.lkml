view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    convert_tz: no
  }

  dimension: test_img {
    type: number
    sql: 1;;
    html: <img src="https://www.sothebys.com/content/dam/stb/lots/HK0/HK0912/052HK0912_B4WSD.jpg" width="80%" height="80%"> ;;
  }

 measure: yesno_date{
   type: yesno
  sql: max(${created_raw}) ;;
 }

# measure: second_max {
#   type: max
#   sql: max(${created_raw}) ;;
#   filters: {
#     field: yesno_date
#     value: "yes"
#   }
# }

#   dimension: in_the_last_60_days {
#     type: yesno
#     sql: ${created_date}> ADDDATE(DATE(NOW()), -60)  ;;
#   }
#
#   dimension: in_the_last_60_daysly {
#     type: yesno
#     sql: ADDDATE(DATE(NOW()), INTERVAL -1 YEAR) > ${created_date} AND ${created_date} > ADDDATE(ADDDATE(DATE(NOW()), INTERVAL -1 YEAR),-60)  ;;
#   }

  dimension: in_the_last_60_days {
    type: yesno
    sql:  ${created_date}> ADDDATE(DATE(NOW()), -60) OR (ADDDATE(DATE(NOW()), INTERVAL -1 YEAR) > ${created_date} AND ${created_date} > ADDDATE(ADDDATE(DATE(NOW()), INTERVAL -1 YEAR),-60))  ;;
  }



  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }
}
