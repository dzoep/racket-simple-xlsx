#lang racket

(require fast-xml
         racket/date
         rackunit/text-ui
         rackunit
         "../../../../../xlsx/xlsx.rkt"
         "../../../../../sheet/sheet.rkt"
         "../../../../../lib/lib.rkt"
         "../../../../../xl/worksheets/worksheet.rkt"
         racket/runtime-path)

(define-runtime-path date_cell_file "date_cell.xml")

(define test-cell
  (test-suite
   "test-cell"

   (test-case
    "test-to-cell"

    (with-xlsx
     (lambda ()
       (add-data-sheet "Sheet1" (list
                                 (list (seconds->date (find-seconds 0 0 0 17 9 2018 #f)))
                                  ))

       (with-sheet
        (lambda ()
          (call-with-input-file date_cell_file
            (lambda (expected)
              (call-with-input-string
               (lists-to-xml_content (to-cell 1 1))
               (lambda (actual)
                 (check-lines? expected actual)))))
          )))))

   (test-case
    "test-from-cell"

    (with-xlsx
     (lambda ()
       (add-data-sheet "Sheet1" '(("" "" "" "" "")))

       (with-sheet
        (lambda ()
          (check-equal? (hash-ref (DATA-SHEET-cell->value_hash (*CURRENT_SHEET*)) "A1") "")
          (from-cell
           (xml-port-to-hash
            (open-input-string (format "<worksheet><sheetData><row r=\"1\">~a</row></sheetData></worksheet>"
                                                 (file->string date_cell_file)
                                                 ))
            '(
              "worksheet.sheetData.row.c.r"
              "worksheet.sheetData.row.c.v"
              ))
           1 1)
          (check-equal? (hash-ref (DATA-SHEET-cell->value_hash (*CURRENT_SHEET*)) "A1") 43360)

          (let ([xlsx_date (oa_date_number->date 43360 #f)])
            (check-equal? (date-year xlsx_date) 2018)
            (check-equal? (date-month xlsx_date) 9)
            (check-equal? (date-day xlsx_date) 18))
          )))))

   ))

(run-tests test-cell)
