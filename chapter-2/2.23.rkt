#lang racket
(define (for-each proc items)
  (if (null? items)
      #t
      (let ()
        (proc (car items))
        (for-each proc (cdr items)))))


(for-each (lambda (x)
            (display x)
            (newline))
          (list 57 321 88))