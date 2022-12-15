#lang racket

(require simple-xlsx)

(require racket/date)

(let ([xlsx (new xlsx%)]
      [sheet_data (list
                   (list "month/brand" "201601" "201602" "201603" "201604" "201605")
                   (list "CAT" 100 300 200 0.6934 (seconds->date (find-seconds 0 0 0 17 9 2018)))
                   (list "Puma" 200 400 300 139999.89223 (seconds->date (find-seconds 0 0 0 18 9 2018)))
                   (list "Asics" 300 500 400 23.34 (seconds->date (find-seconds 0 0 0 19 9 2018))))]
      [sheet_data2 (list
                    (list "month/brand" "201601" "201602" "201603" "201604" "201605" "alignment")
                    (list "CAT" 100 300 200 0.6934 (seconds->date (find-seconds 0 0 0 17 9 2018)) "")
                    (list "Puma" 200 400 300 -139999.89223 (seconds->date (find-seconds 0 0 0 18 9 2018)) "")
                    (list "Asics" 300 500 400 23.34 (seconds->date (find-seconds 0 0 0 19 9 2018)) "")
                    (list "" "" "" "" "" "" "Left")
                    (list "" "" "" "" "" "" "Right")
                    (list "" "" "" "" "" "" "Center")
                    (list "" "" "" "" "" "" "Top")
                    (list "" "" "" "" "" "" "Bottom")
                    (list "" "" "" "" "" "" "Middle")
                    (list "" "" "" "" "" "" "Center/Middle")
                    )])

  (send xlsx add-data-sheet #:sheet_name "DataSheet" #:sheet_data sheet_data)
  (send xlsx set-data-sheet-col-width! #:sheet_name "DataSheet" #:col_range "A-B" #:width 50)
  (send xlsx set-data-sheet-freeze-pane! #:sheet_name "DataSheet" #:range '(1 . 1))

  (send xlsx add-data-sheet #:sheet_name "DataSheetWithStyle" #:sheet_data sheet_data)
  (send xlsx set-data-sheet-col-width! #:sheet_name "DataSheetWithStyle" #:col_range "A-B" #:width 50)
  (send xlsx set-data-sheet-row-height! #:sheet_name "DataSheetWithStyle" #:row_range "3-4" #:height 30)
  (send xlsx set-data-sheet-col-width! #:sheet_name "DataSheetWithStyle" #:col_range "F" #:width 20)
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "A2-B3" #:style '( (backgroundColor . "00C851") ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "C3-D4" #:style '( (backgroundColor . "AA66CC") ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "B3-C4" #:style '( (fontSize . 20) (fontName . "Impact")))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "B1-C3" #:style '( (fontColor . "FF8800") ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "E2-E2" #:style '( (numberPercent . #t) ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "E3-E3" #:style '( (numberPrecision . 2) (numberThousands . #t)))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "E4-E4" #:style '( (numberPrecision . 0) ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "B2-C4" #:style '( (borderStyle . dashed) (borderColor . "blue")))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "F2-F2" #:style '( (dateFormat . "yyyy-mm-dd") ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "F3-F3" #:style '( (dateFormat . "yyyy/mm/dd") ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle" #:cell_range "F4-F4" #:style '( (dateFormat . "yyyy年mm月dd日") ))

  (send xlsx add-data-sheet #:sheet_name "DataSheetWithStyle2" #:sheet_data sheet_data2)
  (send xlsx set-data-sheet-col-width! #:sheet_name "DataSheetWithStyle2" #:col_range "1-1" #:width 20)
  (send xlsx set-data-sheet-row-height! #:sheet_name "DataSheetWithStyle2" #:row_range "2-4" #:height 30)
  (send xlsx set-data-sheet-col-width! #:sheet_name "DataSheetWithStyle2" #:col_range "2-6" #:width 10)
  (send xlsx add-data-sheet-row-style! #:sheet_name "DataSheetWithStyle2" #:row_range "1-3" #:style '( (backgroundColor . "00C851") ))
  (send xlsx add-data-sheet-col-style! #:sheet_name "DataSheetWithStyle2" #:col_range "1-6" #:style '( (backgroundColor . "AA66CC") ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "B1-C3" #:style '( (backgroundColor . "FF8800") ))

  (send xlsx set-data-sheet-col-width! #:sheet_name "DataSheetWithStyle2" #:col_range "7" #:width 50)
  (send xlsx set-data-sheet-row-height! #:sheet_name "DataSheetWithStyle2" #:row_range "5-11" #:height 50)
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "G5" #:style '( (horizontalAlign . left) ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "G6" #:style '( (horizontalAlign . right) ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "G7" #:style '( (horizontalAlign . center) ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "G8" #:style '( (verticalAlign . top) ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "G9" #:style '( (verticalAlign . bottom) ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "G10" #:style '( (verticalAlign . middle) ))
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "G11"
        #:style '( (horizontalAlign . center) (verticalAlign . middle) ))

  (send xlsx set-data-sheet-col-width! #:sheet_name "DataSheetWithStyle2" #:col_range "E-F" #:width 30)
  (send xlsx add-data-sheet-cell-style! #:sheet_name "DataSheetWithStyle2" #:cell_range "G1" #:style '((formatCode . "@__&quot;means&quot;__@")))
  (send xlsx add-data-sheet-col-style! #:sheet_name "DataSheetWithStyle2" #:col_range "E-F" #:style '((formatCode . "￥#,##0.00;[Red]￥-#,##0.00")))

  (send xlsx add-chart-sheet #:sheet_name "LineChart1" #:topic "Horizontal Data" #:x_topic "Kg")
  (send xlsx set-chart-x-data! #:sheet_name "LineChart1" #:data_sheet_name "DataSheet" #:data_range "B1-D1")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "CAT")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "DataSheet" #:data_range "B3-D3" #:y_topic "Puma")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "DataSheet" #:data_range "B4-D4" #:y_topic "Brooks")

  (send xlsx add-chart-sheet #:sheet_name "LineChart2" #:topic "Vertical Data" #:x_topic "Kg")
  (send xlsx set-chart-x-data! #:sheet_name "LineChart2" #:data_sheet_name "DataSheet" #:data_range "A2-A4" )
  (send xlsx add-chart-serial! #:sheet_name "LineChart2" #:data_sheet_name "DataSheet" #:data_range "B2-B4" #:y_topic "201601")
  (send xlsx add-chart-serial! #:sheet_name "LineChart2" #:data_sheet_name "DataSheet" #:data_range "C2-C4" #:y_topic "201602")
  (send xlsx add-chart-serial! #:sheet_name "LineChart2" #:data_sheet_name "DataSheet" #:data_range "D2-D4" #:y_topic "201603")

  (send xlsx add-chart-sheet #:sheet_name "LineChart3D" #:chart_type 'line3d #:topic "LineChart3D" #:x_topic "Kg")
  (send xlsx set-chart-x-data! #:sheet_name "LineChart3D" #:data_sheet_name "DataSheet" #:data_range "A2-A4" )
  (send xlsx add-chart-serial! #:sheet_name "LineChart3D" #:data_sheet_name "DataSheet" #:data_range "B2-B4" #:y_topic "201601")
  (send xlsx add-chart-serial! #:sheet_name "LineChart3D" #:data_sheet_name "DataSheet" #:data_range "C2-C4" #:y_topic "201602")
  (send xlsx add-chart-serial! #:sheet_name "LineChart3D" #:data_sheet_name "DataSheet" #:data_range "D2-D4" #:y_topic "201603")

  (send xlsx add-chart-sheet #:sheet_name "BarChart" #:chart_type 'bar #:topic "BarChart" #:x_topic "Kg")
  (send xlsx set-chart-x-data! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "CAT")
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B3-D3" #:y_topic "Puma")
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B4-D4" #:y_topic "Brooks")

  (send xlsx add-chart-sheet #:sheet_name "BarChart3D" #:chart_type 'bar3d #:topic "BarChart3D" #:x_topic "Kg")
  (send xlsx set-chart-x-data! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "CAT")
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B3-D3" #:y_topic "Puma")
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B4-D4" #:y_topic "Brooks")

  (send xlsx add-chart-sheet #:sheet_name "PieChart" #:chart_type 'pie #:topic "PieChart" #:x_topic "Kg")
  (send xlsx set-chart-x-data! #:sheet_name "PieChart" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "PieChart" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "CAT")

  (send xlsx add-chart-sheet #:sheet_name "PieChart3D" #:chart_type 'pie3d #:topic "PieChart3D" #:x_topic "Kg")
  (send xlsx set-chart-x-data! #:sheet_name "PieChart3D" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "PieChart3D" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "CAT")

  (write-xlsx-file xlsx "test.xlsx")

  (with-input-from-xlsx-file
   "test.xlsx"
   (lambda (xlsx)
     (printf "~a\n" (get-sheet-names xlsx))
     ;("DataSheet" "LineChart1" "LineChart2" "LineChart3D" "BarChart" "BarChart3D" "PieChart" "PieChart3D"))

     (load-sheet "DataSheet" xlsx)
     (printf "~a\n" (get-sheet-dimension xlsx)) ;(4 . 6)

     (printf "~a\n" (get-cell "A2" xlsx)) ;201601

     (let ([date_val (oa_date_number->date (get-cell "F2" xlsx))])
       (printf "~a,~a,~a\n" (date-year date_val) (date-month date_val) (date-day date_val)))
     ; 2018,9,17

     (printf "~a\n" (get-sheet-rows xlsx))
     ; ((month/brand 201601 201602 201603 201604 201605) (CAT 100 300 200 0.6934 43360) (Puma 200 400 300 139999.89223 43361) (Asics 300 500 400 23.34 43362))

     ))
  )

  (with-input-from-xlsx-file
   "test.xlsx"
   (lambda (xlsx)
     (let ([write_xlsx (from-read-to-write-xlsx xlsx)])
       (send write_xlsx set-data-sheet-col-width!
             #:sheet_name "DataSheet"
             #:col_range "A-F" #:width 20)
       (write-xlsx-file write_xlsx "write_back.xlsx"))))

  (printf "~a\n" (sheet-name-rows "test.xlsx" "DataSheet"))
  ; ((month/brand 201601 201602 201603 201604 201605) (CAT 100 300 200 0.6934 43360) (Puma 200 400 300 139999.89223 43361) (Asics 300 500 400 23.34 43362))

  (printf "~a\n" (sheet-ref-rows "test.xlsx" 0))
  ; ((month/brand 201601 201602 201603 201604 201605) (CAT 100 300 200 0.6934 43360) (Puma 200 400 300 139999.89223 43361) (Asics 300 500 400 23.34 43362))

