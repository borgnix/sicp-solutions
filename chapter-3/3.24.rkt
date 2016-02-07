#lang racket
(require scheme/mpair)
(provide (all-defined-out))

(define (make-table same-key?)
  (let ((local-table (mcons 'table '())))
    (define (assoc key records)
      (cond [(null? records) #f]
            [(same-key? key (mcar (mcar records))) (mcar records)]
            [else (assoc key (mcdr records))]))
    (define (lookup key)
      (let ((record
             (assoc key (mcdr local-table))))
        (if record
            (mcdr record)
            #f)))
    (define (insert! key item)
      (let ((record (assoc key (mcdr local-table))))
        (if record
            (set-mcdr! record item)
            (let ((new-item (mcons (mcons key item) (mcdr local-table))))
              (set-mcdr! local-table new-item))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

(define (lookup table key)
  ((table 'lookup-proc) key))

(define (insert! table key value)
  ((table 'insert-proc!) key value))

