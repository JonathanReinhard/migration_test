view: test {
 derived_table: {
   sql:
  SELECT 1.51 as aNum1,  1.49 as aNum2
  ;;
}
  measure: aNum1 {
    # type: number
    #value_format_name: decimal_0
  }
  measure: aNum2 {}
 }
