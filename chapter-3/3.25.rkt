#lang racket
(require scheme/mpair)
(provide (all-defined-out))

(define (make-table same-key?)
  (let ((local-table (mcons 'table '())))
    (define (assoc key records)
      (cond [(null? records) #f]
            [(same-key? key (mcar (mcar records))) (mcar records)]
            [else (assoc key (mcdr records))]))
    
    
    (define (lookup table lst)
      (if (null? lst)
          (error "EMPTY KEY LIST")
          (let ((key (car lst))
                (remaining-key (cdr lst)))
            (let ((record (assoc key (mcdr table))))
              (if record
                  (if (null? remaining-key)
                      (if (not (mpair? (mcdr record)))
                          (mcdr record)
                          #f)
                      (lookup record (cdr lst)))
                  #f)))))
    
    (define (insert! table lst value)
      (if  (null? lst)
           (error "EMPTY KEY list")
           (let ((key (car lst))
                 (remaining-key (cdr lst)))
             (let ((record (assoc key (mcdr table))))
               (if record
                   (if (null? remaining-key)
                       (set-mcdr! record value)
                       (insert! record (cdr lst) value))
                   (if (null? remaining-key)
                       (set-mcdr! table (mcons (mcons key value) (mcdr table)))
                       (let ((new-table (mcons key '())))
                         (set-mcdr! table (mcons new-table (mcdr table)))
                         (insert! new-table (cdr lst) value)))))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) (lambda (key) (lookup local-table key)))
            ((eq? m 'insert-proc!) (lambda (key value) (insert! local-table key value)))
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

(define (lookup table key)
  ((table 'lookup-proc) key))

(define (insert! table key value)
  ((table 'insert-proc!) key value))

(define tb (make-table eq?))
(insert! tb '(a b) 1)
(insert! tb '(b) 2)
(lookup tb '(a b))
(lookup tb '(b))