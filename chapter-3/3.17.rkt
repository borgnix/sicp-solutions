#lang racket
(define (count-pairs x)
  (define (in-list? pointer list)
    (if (null? list)
        #f
        (if (eq? (car list) pointer)
            #t
            (in-list? pointer (cdr list)))))
  (let ((counted '()))
    (if (or (not (pair? x)) (in-list? x counted))
        0
        (begin (set! counted (cons x counted))
               (+ (count-pairs (car x))
                  (count-pairs (cdr x))
                  1)))))
